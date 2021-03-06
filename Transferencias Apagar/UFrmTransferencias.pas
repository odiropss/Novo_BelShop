unit UFrmTransferencias;
//OdirSemSIDICOM - 07/05/2019
{
 Prioridades:
   Repete at� Enviar
 0       SIM        = Produtos de Campanhas, Folhetos, etc. (Calculados no Autom�tico, Solicitados pelo Setor de Compras, Solicitados Direto da Loja)
 1       SIM        = Produtos Solicitados pelo Setor de Compras
 2       SIM        = Produtos Solicitados Direto da Loja
 3       N�O        = Produtos Calculados no Autom�tico
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, IBQuery, Grids, DBGrids, StdCtrls, ExtCtrls;

type

  TFrmTransferencias = class(TForm)
    procedure FormCreate(Sender: TObject);

    // ODIR ====================================================================
    //OdirSemSIDICOM - 07/05/2019
    //Function  BuscaProdutosCD: Boolean;
    Function  InsereProdutosCD: Boolean;

    Function  TransferenciasLojas: Boolean;

    Function  BuscaProdutosLojas: Boolean;
    Procedure MontaCurvas(sCodLoja: String);
    Procedure BuscaProdutosCurvas(sCodLoja: String);

    Function  BuscaProdutosDemanda(sCodLoja, sCodProduto, sSaldo: String): Boolean;

    Function  AnalisaAtualizaTransferencias: Boolean;

    Function  ProcessaTransferenciasCompras: Boolean; // Busca Transferencias de Dias Anteiroes e Novas do Setor de Compras


    Function  AtualizaPrioridades: Boolean;

    Procedure SalvaErros;
    Procedure SalvaProcessamento(s:String);

    Function  BuscaSaldoLinx(sCodLojaSid, sCodProdSid: String):String;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTransferencias: TFrmTransferencias;

  bgConexaoLocal: Boolean; // Se Conex�o com o Servidor da Matriz � Local - Verifica a Existencia do Arquivo "ConexaoExterna.ini"

  // Cria Ponteiro de transac�o
  TD: TTransactionDesc;

  IBQ_TR_Filial,
  IBQ_MPMS: TIBQuery;

  igCodLojaLinx,
  igDiasUteis, igDiaSemana: Integer;

  dgDtaHoje, dgDtaInicio, dgDtaFim: TDate;

  sgSaldoLinx,
  sgCodProduto,
  sgFornNAO, sgCodLoja,
  sgNrDocto, sgCurvas: String;

  sgPastaStatus: String;

  mgMemo: TMemo;

  tgArqErros: TStringList; // Arquivo de Erros
  bgArqErros: Boolean;     // Se Salva Arquivo de Erros
  sgArqErros: String;      // Nome do Arquivo de Erros

  tgArqProc : TStringList; // Arquivo de Acompanhamento de Processamento
  sgArqProc : String;      // Acompanhamento de Processamento

  // Percentuais de Corte de Reposi��o
  igPer_CorteA, igPer_CorteB, igPer_CorteC, igPer_CorteD, igPer_CorteE: Integer;

  Flags : Cardinal; // Verifica Internet Ativo - Encerra Necessario

  bgTrabDomingo: Boolean;
  //  hHrInicio, hHrFim: String;

implementation

uses DK_Procs1, UDMConexoes, uj_001, uj_002, UDMTransferencias, DB, DateUtils,
     Math, RTLConsts;

{$R *.dfm}
//==============================================================================
// ODIR - INICIO ===============================================================
//==============================================================================

// Busca Saldo do Estoque no Linx >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmTransferencias.BuscaSaldoLinx(sCodLojaSid, sCodProdSid: String):String;
Var
  MySql: String;
Begin
  Result:='';

  MySql:=' SELECT CAST(TRUNC(COALESCE(ld.quantidade,0)) as Numeric(12,4)) QUANTIDADE'+
         ' FROM LINXPRODUTOS lp'+
         '      LEFT JOIN LINXPRODUTOSDETALHES ld  ON ld.cod_produto=lp.cod_produto'+
         '                                        AND ld.cod_loja='+QuotedStr(sCodLojaSid)+
         ' WHERE LPAD(lp.cod_auxiliar, 6, ''0'')='+QuotedStr(sCodProdSid);
  DMTransferencias.CDS_BuscaRapida.Close;
  DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
  DMTransferencias.CDS_BuscaRapida.Open;

  If Trim(DMTransferencias.CDS_BuscaRapida.FieldByName('Quantidade').AsString)<>'' Then
   Result:=f_Troca(',','.',DMTransferencias.CDS_BuscaRapida.FieldByName('Quantidade').AsString);

  DMTransferencias.CDS_BuscaRapida.Close;

End; // Busca Saldo do Estoque no Linx >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// So Roda Transferencias Solicitadas pelas Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmTransferencias.TransferenciasLojas: Boolean;
Var
  MySql: String;

  sMensagem,
  sNumSeq, sSeqExcluir: String;
  i: Integer;

// OdirApagar - 02/05/2019
//  sSaldoCD,
//  sEnd_Zona, sEnd_Corredor, sEnd_Prateleira, sEnd_Gaveta: String;
//
//  bAchouCD: Boolean;
Begin
  Result:=False;

  // Busca Lojas para Processar ================================================
  MySql:=' SELECT DISTINCT CAST(LPAD(TRIM(so.cod_loja_sidi),2,''00'') AS VARCHAR(2)) Cod_SIDICOM'+
         ' FROM SOL_TRANSFERENCIA_CD so'+
         ' WHERE so.doc_gerado=0'+
         ' ORDER BY 1';
  DMTransferencias.CDS_Busca.Close;
  DMTransferencias.SDS_Busca.CommandText:=MySql;
  DMTransferencias.CDS_Busca.Open;
  If DMTransferencias.CDS_Busca.Eof Then
  Begin
    Result:=True;
    DMTransferencias.CDS_Busca.Close;

    bgArqErros:=True;
    tgArqErros.Add('Sem Transfer�ncias de Lojas no Dia '+DateToStr(DataHoraServidorFI(DMTransferencias.SDS_DtaHoraServidor)));
    Exit;
  End;

  DMTransferencias.CDS_Busca.DisableControls;
  While Not DMTransferencias.CDS_Busca.Eof do
  Begin
    sgCodLoja:=DMTransferencias.CDS_Busca.FieldByName('Cod_SIDICOM').AsString;

    // Busca Numero do Docto ===============================================
    MySql:=' SELECT COALESCE(MAX(el.num_docto)+1 ,1) Nr_Docto'+
           ' FROM ES_ESTOQUES_LOJAS el';
    DMTransferencias.CDS_BuscaRapida.Close;
    DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
    DMTransferencias.CDS_BuscaRapida.Open;
    sgNrDocto:=DMTransferencias.CDS_BuscaRapida.FieldByName('Nr_Docto').AsString;
    DMTransferencias.CDS_BuscaRapida.Close;

    // Verifica se Transa��o esta Ativa ========================================
    If DMTransferencias.SQLC.InTransaction Then
     DMTransferencias.SQLC.Rollback(TD);

    // Monta Transacao =========================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMTransferencias.SQLC.StartTransaction(TD);
    Try // Try da Transa��o
      DateSeparator:='.';
      DecimalSeparator:='.';

      // Grava Produtos Que N�o Entra no Processo de Transferencia =============
      For i:=1 to 10 do // 10 Posibilidades
      Begin
        If i=1  Then sMensagem:='Produto N�o Processado: Setor=17-IMOBILIZADOS';
        If i=2  Then sMensagem:='Produto N�o Processado: Setor=20-MOVEIS SAL�O';
        If i=3  Then sMensagem:='Produto N�o Processado: Setor=25-USO E CONSUMO';
        If i=4  Then sMensagem:='Produto N�o Processado: Linha=33-BRINDES';
        If i=5  Then sMensagem:='Produto N�o Processado: Colecao=197-DESCONTINUADO';
        If i=6  Then sMensagem:='Produto N�o Processado: Colecao=294-BRINDE';
        If i=7  Then sMensagem:='Produto N�o Processado: Colecao=587-KIDS';
        If i=8  Then sMensagem:='Produto N�o Processado: Fornecedor=6-BELSHOP ANDRADAS';
        If i=9  Then sMensagem:='Produto N�o Processado: Fornecedor=1014-TECBIZ';
        If i=10 Then sMensagem:='Produto N�o Processado: Fornecedor=260-ILUMITE';

        // N�O ANALISE 197-DESCONTINUADO ========================================
        If i<>5  Then
        Begin
          MySql:=' UPDATE SOL_TRANSFERENCIA_CD so'+
                 ' SET so.doc_gerado = 999999999,'+
                 '     so.dta_processamento=CURRENT_DATE,'+
                 '     so.obs_texto = CAST(LPAD(EXTRACT(DAY FROM CURRENT_DATE),2,''0'') AS VARCHAR(2))||''/''||'+
                 '                    CAST(LPAD(EXTRACT(MONTH FROM CURRENT_DATE),2,''0'') AS VARCHAR(2))||''/''||'+
                 '                    CAST(EXTRACT(YEAR FROM CURRENT_DATE) AS VARCHAR(4))||'' - ''||'+QuotedStr(sMensagem)+

                 ' WHERE so.doc_gerado=0'+
                 ' AND   so.dta_solicitacao<CURRENT_DATE'+
                 ' AND   so.cod_loja_sidi='+QuotedStr(sgCodLoja)+
                 ' AND   EXISTS (SELECT 1'+
                 '               FROM LINXPRODUTOS pr'+
                 '               WHERE pr.cod_produto=so.cod_prod_linx';

                 // 17-IMOBILIZADOS
                 If i=1  Then
                  MySql:=
                   MySql+'       AND pr.id_setor=17';

                 // 20-MOVEIS SAL�O
                 If i=2  Then
                  MySql:=
                   MySql+'       AND pr.id_setor=20';

                 // 25-USO E CONSUMO
                 If i=3  Then
                  MySql:=
                   MySql+'       AND pr.id_setor=25';

                 // 17-33-BRINDES
                 If i=4  Then
                  MySql:=
                   MySql+'       AND pr.id_linha=33';

                 // 197-DESCONTINUADO
                 If i=5  Then
                  MySql:=
                   MySql+'       AND pr.id_colecao=197';

                 // 294-BRINDE
                 If i=6  Then
                  MySql:=
                   MySql+'       AND pr.id_colecao=294';

                 // 587-KIDS
                 If i=7  Then
                  MySql:=
                   MySql+'       AND pr.id_colecao=587';

                 // Fornecedor=6-BELSHOP ANDRADAS';
                 If i=8  Then
                  MySql:=
                   MySql+'       AND pr.cod_fornecedor=6';

                 // Fornecedor=1014-TECBIZ
                 If i=9  Then
                  MySql:=
                   MySql+'       AND pr.cod_fornecedor=1014';

                 // Fornecedor=260-ILUMITE';
                 If i=10  Then
                  MySql:=
                   MySql+'       AND pr.cod_fornecedor=260';

          MySql:=
           MySql+')';
          DMTransferencias.SQLC.Execute(MySql,nil,nil);
        End; // If i<>5  Then
      End; // For i:=1 to 8 do

      // Grava Produtos SEM Saldo no CD - SOL_TRANSFERENCIA_CD =================
      MySql:=' UPDATE SOL_TRANSFERENCIA_CD so'+
             ' SET so.doc_gerado = 999999999,'+
             '     so.dta_processamento=CURRENT_DATE,'+
             '     so.obs_texto = CAST(LPAD(EXTRACT(DAY FROM CURRENT_DATE),2,''0'') AS VARCHAR(2))||''/''||'+
             '                    CAST(LPAD(EXTRACT(MONTH FROM CURRENT_DATE),2,''0'') AS VARCHAR(2))||''/''||'+
             '                    CAST(EXTRACT(YEAR FROM CURRENT_DATE) AS VARCHAR(4))||'' - ''||'+
             '                    ''Produto Sem Saldo no Centro de Distribui��o'''+

             ' WHERE so.doc_gerado=0'+
             ' AND   so.dta_solicitacao<CURRENT_DATE'+
             ' AND   so.cod_loja_sidi='+QuotedStr(sgCodLoja)+
             ' AND   ((NOT EXISTS (SELECT 1'+
             '                     FROM ES_ESTOQUES_CD cd'+
             '                     WHERE cd.dta_movto=CURRENT_DATE'+
             '                     AND   cd.cod_produto=so.cod_prod_sidi))'+
             '         OR'+
             '         (EXISTS (SELECT 1'+
             '                  FROM ES_ESTOQUES_CD cd'+
             '                  WHERE cd.dta_movto=CURRENT_DATE'+
             '                  AND   cd.qtd_saldo<1'+
             '                  AND   cd.cod_produto=so.cod_prod_sidi)))';
      DMTransferencias.SQLC.Execute(MySql,nil,nil);

      // Retorna Generator para 0 ==============================================
      MySql:=' ALTER SEQUENCE GEN_ODIR RESTART WITH 0';
      DMTransferencias.SQLC.Execute(MySql,nil,nil);

      // Importa SOL_TRANSFERENCIA_CD para ES_ESTOQUES_LOJA ====================
      MySql:=' INSERT INTO ES_ESTOQUES_LOJAS'+
             ' SELECT GEN_ID(gen_odir,1) NUM_SEQ,'+
             ' CURRENT_DATE DTA_MOVTO, '+
             sgNrDocto+' NUM_DOCTO,'+
             ' CAST(LPAD(TRIM(so.cod_loja_sidi),2,''00'') AS VARCHAR(2)) COD_LOJA,'+
             ' so.cod_prod_sidi COD_PRODUTO,'+
             ' COALESCE(ff.est_minimo,0) EST_MINIMO,'+
             ' COALESCE(ff.est_maximo,0) EST_MAXIMO,'+
             ' so.qtd_estoque QTD_ESTOQUE,'+
             ' 0.00 QTD_VENDAS,'+
             ' COALESCE(ff.ind_curva,''C'') IND_CURVA,'+
             ' 0 DIAS_ESTOCAGEM,'+
             ' 0 QTD_DIAS,'+
             ' 0.00 QTD_VENDA_DIA,'+
             ' 0.00 QTD_DEMANDA,'+
             ' so.qtd_transf QTD_REPOSICAO,'+
             ' so.qtd_transf QTD_TRANSF,'+
             ' so.qtd_transf QTD_A_TRANSF,'+
             ' ''000000'' NUM_PEDIDO,'+
             ' ''CAL'' IND_TRANSF,'+
             ' 0 USU_ALTERA,'+
             ' CURRENT_DATE DTA_ALTERA,'+
             ' 0 NUM_TR_GERADA,'+
             ' 0.00 QTD_TRANSF_OC,'+
             ' ''Sol. Transf. N� ''||so.num_solicitacao||'' Qtd: ''||so.qtd_transf OBS_DOCTO,'+
             ' 2 IND_PRIORIDADE,'+
             ' ''NAO'' IND_LEITORA,'+
             ' 0 QTD_CHECKOUT,'+
             ' 0 REL_SEPARACAO'+

             ' FROM SOL_TRANSFERENCIA_CD so'+
//OdirSemSIDICOM - 07/05/2019
//             '     LEFT JOIN ES_FINAN_CURVA_ABC ff  ON CAST(LPAD(TRIM(so.cod_loja_sidi),2,''0'') AS VARCHAR(2))=ff.cod_loja'+
//             '                                     AND so.cod_prod_sidi=ff.cod_produto'+
             '     LEFT JOIN ES_FINAN_CURVA_ABC ff  ON CAST(LPAD(TRIM(so.cod_loja_sidi),2,''0'') AS VARCHAR(2))=ff.cod_loja'+
             '                                     AND so.cod_prod_linx=ff.cod_prod_linx'+

             ' WHERE so.doc_gerado=0'+
             ' AND   so.dta_solicitacao<CURRENT_DATE'+
             ' AND   so.cod_loja_sidi='+QuotedStr(sgCodLoja)+
             ' ORDER BY so.cod_prod_sidi';
      DMTransferencias.SQLC.Execute(MySql,nil,nil);

      // Retorna Generator para 0 ==============================================
      MySql:=' ALTER SEQUENCE GEN_ODIR RESTART WITH 0';
      DMTransferencias.SQLC.Execute(MySql,nil,nil);

      // Acerta Produto Duplo ==================================================
      MySql:=' SELECT lo.NUM_SEQ, lo.COD_PRODUTO, lo.QTD_ESTOQUE,'+
             ' lo.QTD_TRANSF, lo.QTD_A_TRANSF, lo.OBS_DOCTO'+

             ' FROM ES_ESTOQUES_LOJAS lo'+
             ' WHERE lo.dta_movto=CURRENT_DATE'+
             ' AND   lo.cod_loja='+QuotedStr(sgCodLoja)+
             ' AND   lo.num_docto='+sgNrDocto+
             ' ORDER BY lo.cod_produto';
      DMTransferencias.CDS_Busca1.Close;
      DMTransferencias.SDS_Busca1.CommandText:=MySql;
      DMTransferencias.CDS_Busca1.Open;

      sgCodProduto:='';
      sSeqExcluir:='';
      DMTransferencias.CDS_Busca1.DisableControls;
      While Not DMTransferencias.CDS_Busca1.Eof do
      Begin
        // Acerta Produto Repetido =============================================
        If sgCodProduto=DMTransferencias.CDS_Busca1.FieldByName('Cod_Produto').AsString Then
         Begin
           If Trim(sSeqExcluir)='' Then
            sSeqExcluir:=DMTransferencias.CDS_Busca1.FieldByName('Num_Seq').AsString
           Else
            sSeqExcluir:=
             sSeqExcluir+', '+DMTransferencias.CDS_Busca1.FieldByName('Num_Seq').AsString;

           MySql:=' UPDATE ES_ESTOQUES_LOJAS lo'+
                  ' SET lo.QTD_ESTOQUE=lo.QTD_ESTOQUE + '+
                  DMTransferencias.CDS_Busca1.FieldByName('Qtd_Estoque').AsString+
                  ', lo.QTD_TRANSF=lo.QTD_TRANSF + '+
                  DMTransferencias.CDS_Busca1.FieldByName('Qtd_Transf').AsString+
                  ', lo.QTD_A_TRANSF=lo.QTD_A_TRANSF + '+
                  DMTransferencias.CDS_Busca1.FieldByName('Qtd_A_Transf').AsString+
                  ', lo.OBS_DOCTO=lo.OBS_DOCTO||'' - ''||'+
                  QuotedStr(DMTransferencias.CDS_Busca1.FieldByName('OBS_DOCTO').AsString)+

                  ' WHERE lo.dta_movto=CURRENT_DATE'+
                  ' AND   lo.cod_loja='+QuotedStr(sgCodLoja)+
                  ' AND   lo.num_docto='+sgNrDocto+
                  ' AND   lo.num_seq='+sNumSeq+
                  ' AND   lo.cod_produto='+QuotedStr(DMTransferencias.CDS_Busca1.FieldByName('Cod_Produto').AsString);
           DMTransferencias.SQLC.Execute(MySql,nil,nil);
         End
        Else
         Begin
           sNumSeq:=DMTransferencias.CDS_Busca1.FieldByName('Num_Seq').AsString;
         End; // If sgCodProduto=DMTransferencias.CDS_Busca1.FieldByName('Cod_Produto').AsString Then

        sgCodProduto:=DMTransferencias.CDS_Busca1.FieldByName('Cod_Produto').AsString;

// OdirApagar - 26/09/2018 - Inicio
//        // Se CD Contem estoque do Produtos ES_ESTOQUES_CD =====================
//        MySql:=' SELECT cd.cod_produto'+
//               ' FROM ES_ESTOQUES_CD cd'+
//               ' WHERE cd.dta_movto=CURRENT_DATE'+
//               ' AND cd.qtd_saldo>0'+
//               ' AND cd.cod_produto='+QuotedStr(sgCodProduto);
//        DMTransferencias.CDS_BuscaRapida.Close;
//        DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
//        DMTransferencias.CDS_BuscaRapida.Open;
//        bAchouCD:=Trim(DMTransferencias.CDS_BuscaRapida.FieldByName('Cod_Produto').AsString)<>'';
//        DMTransferencias.CDS_BuscaRapida.Close;
//
//        If Not bAchouCD Then
//        Begin
//          // Coloca Como Produto Sem Estoque no CD =============================
//          // Busca Endere�amento e saldo no SIDICOM ============================
//          MySql:=' SELECT'+
//                 ' e.saldoatual,'+
//                 ' e.zonaendereco end_zona,'+
//                 ' e.corredor end_corredor,'+
//                 ' e.prateleira end_prateleira,'+
//                 ' e.gaveta end_gaveta'+
//                 ' FROM ESTOQUE e'+
//                 ' WHERE e.codproduto='+QuotedStr(sgCodProduto)+
//                 ' AND   e.codfilial=''99''';
//          IBQ_MPMS.Close;
//          IBQ_MPMS.SQL.Clear;
//          IBQ_MPMS.SQL.Add(MySql);
//          IBQ_MPMS.Open;
//
//          sEnd_Zona      :='0';
//          sEnd_Corredor  :='000';
//          sEnd_Prateleira:='000';
//          sEnd_Gaveta    :='0000';
//          sSaldoCD       :='0.00';
//          If Trim(IBQ_MPMS.FieldByName('end_zona').AsString)<>'' Then
//          Begin
//            sEnd_Zona      :=Trim(IBQ_MPMS.FieldByName('end_zona').AsString);
//            sEnd_Corredor  :=Trim(IBQ_MPMS.FieldByName('end_corredor').AsString);
//            sEnd_Prateleira:=Trim(IBQ_MPMS.FieldByName('end_prateleira').AsString);
//            sEnd_Gaveta    :=Trim(IBQ_MPMS.FieldByName('end_gaveta').AsString);
//            sSaldoCD       :=f_Troca(',','.',IBQ_MPMS.FieldByName('saldoatual').AsString);
//          End; // If Trim(IBQ_MPMS.FieldByName('end_zona').AsString)<>'' Then
//          IBQ_MPMS.Close;
//
//          // Busca Saldo no Linx ===============================================
//          sgSaldoLinx:=Trim(BuscaSaldoLinx('99',sgCodProduto));
//          If sgSaldoLinx<>'' Then
//           sSaldoCD:=sgSaldoLinx;
//
//          // Insere ES_ESTOQUES_CD =============================================
//          MySql:=' INSERT INTO ES_ESTOQUES_CD ('+
//                 ' DTA_MOVTO, COD_PRODUTO, QTD_ESTOQUE, QTD_SAIDAS, QTD_SALDO,'+
//                 ' END_ZONA, END_CORREDOR, END_PRATELEIRA, END_GAVETA)'+
//                 ' VALUES ('+
//                 ' CURRENT_DATE, '+ // DTA_MOVTO
//                 QuotedStr(sgCodProduto)+', '+ // COD_PRODUTO
//                 sSaldoCD+', '+ // QTD_ESTOQUE
//                 '0.00, '+ // QTD_SAIDAS
//                 '0.00, '+ // QTD_SALDO
//                 QuotedStr(sEnd_Zona)+', '+ // END_ZONA
//                 QuotedStr(sEnd_Corredor)+', '+ // END_CORREDOR
//                 QuotedStr(sEnd_Prateleira)+', '+ // END_PRATELEIRA
//                 QuotedStr(sEnd_Gaveta)+')'; // END_GAVETA
//          DMTransferencias.SQLC.Execute(MySql,nil,nil);
//        End; // If Not bAchouCD Then
// OdirApagar - 26/09/2018 - Fim

        DMTransferencias.CDS_Busca1.Next;
      End; // While Not DMTransferencias.CDS_Busca1.Eof do
      DMTransferencias.CDS_Busca1.EnableControls;
      DMTransferencias.CDS_Busca1.Close;

      // Exclui Produtos Duplos ================================================
      If Trim(sSeqExcluir)<>'' Then
      Begin
        MySql:=' DELETE FROM ES_ESTOQUES_LOJAS lo'+
               ' WHERE lo.dta_movto=CURRENT_DATE'+
               ' AND   lo.cod_loja='+QuotedStr(sgCodLoja)+
               ' AND   lo.num_docto='+sgNrDocto+
               ' AND   lo.num_seq in ('+sSeqExcluir+')';
        DMTransferencias.SQLC.Execute(MySql,nil,nil);

        sSeqExcluir:='';
      End; // If Trim(sSeqExcluir)<>'' Then

      // Retorna Generator para 0 ==============================================
      MySql:=' ALTER SEQUENCE GEN_ODIR RESTART WITH 0';
      DMTransferencias.SQLC.Execute(MySql,nil,nil);

      // Acerta Num_Seq ========================================================
      MySql:=' UPDATE ES_ESTOQUES_LOJAS lo'+
             ' SET lo.num_seq=GEN_ID(GEN_ODIR,1)'+
             ' WHERE lo.dta_movto=CURRENT_DATE'+
             ' AND   lo.cod_loja='+QuotedStr(sgCodLoja)+
             ' AND   lo.num_docto='+sgNrDocto;
      DMTransferencias.SQLC.Execute(MySql,nil,nil);

      // Atualiza o Numero do Docto Gerado - SOL_TRANSFERENCIA_CD ==============
      MySql:=' UPDATE SOL_TRANSFERENCIA_CD so'+
             ' SET so.doc_gerado='+sgNrDocto+
             ', so.dta_processamento=CURRENT_DATE'+
             ' WHERE so.doc_gerado=0'+
             ' AND   so.dta_solicitacao<CURRENT_DATE'+
             ' AND   so.cod_loja_sidi='+QuotedStr(sgCodLoja);
      DMTransferencias.SQLC.Execute(MySql,nil,nil);

      // Atualiza Transacao ======================================================
      DMTransferencias.SQLC.Commit(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      bgArqErros:=True;
      tgArqErros.Add('Sol.Transf. Loja Bel_'+sgCodLoja+' Processada com SUCESSO em '+DateTimeToStr(DataHoraServidorFI(DMTransferencias.SDS_DtaHoraServidor)));
      Result:=True;
    Except // Except da Transa��o
      on e : Exception do
      Begin
        DMTransferencias.SQLC.Rollback(TD);
        Result:=False;

        DateSeparator:='/';
        DecimalSeparator:=',';

        bgArqErros:=True;
        tgArqErros.Add('ERRO - Sol. Trabsfer�ncia Loja SIDICOM: '+sgCodLoja+' - '+e.message);
      End; // on e : Exception do
    End; // Try da Transa��o

    DMTransferencias.CDS_Busca.Next
  End; // While Not DMTransferencias.CDS_Busca.Eof do
  DMTransferencias.CDS_Busca.EnableControls;
  DMTransferencias.CDS_Busca.Close;

End; // So Roda Transferencias Solicitadas pelas Lojas >>>>>>>>>>>>>>>>>>>>>>>>>

// Atualiza Prioridade de Reposi��o >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmTransferencias.AtualizaPrioridades;
Var
  MySql: String;
Begin
  Result:=True;

  // Verifica se Transa��o esta Ativa
  If DMTransferencias.SQLC.InTransaction Then
   DMTransferencias.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMTransferencias.SQLC.StartTransaction(TD);
  Try // Try da Transa��o
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Atualiza Prioridade 3 Para 0 - ES_REP_PRIORIDADES =======================
    MySql:=' UPDATE ES_ESTOQUES_LOJAS el'+
           ' SET   el.ind_prioridade=0'+
           ' WHERE el.dta_movto=CURRENT_DATE'+
           ' AND   el.ind_transf=''SIM'''+
           ' AND   el.ind_prioridade=3'+
           ' AND   EXISTS (SELECT 1'+
           '               FROM ES_REP_PRIORIDADES pr, ES_REP_PRIORIDADES_PROD pp'+
           '               WHERE pr.cod_prioridade=pp.cod_prioridade'+
           '               AND   pr.ind_ativo=''SIM'''+
           '               AND   CURRENT_DATE BETWEEN pr.dta_inicial AND pr.dta_final'+
           '               AND   pp.codproduto=el.cod_produto)';
    DMTransferencias.SQLC.Execute(MySql,nil,nil);

    // Atualiza Prioridade 3 Para 1 - OC_COMPRAS ===============================
    MySql:=' UPDATE ES_ESTOQUES_LOJAS el'+
           ' SET   el.ind_prioridade=1'+
           ' WHERE el.dta_movto=CURRENT_DATE'+
           ' AND   el.ind_transf=''SIM'''+
           ' AND   el.ind_prioridade=3'+
           ' AND   el.qtd_transf_oc<>0';
    DMTransferencias.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMTransferencias.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
  Except // Except da Transa��o
    on e : Exception do
    Begin
      DMTransferencias.SQLC.Rollback(TD);
      Result:=False;

      DateSeparator:='/';
      DecimalSeparator:=',';

      bgArqErros:=True;
      tgArqErros.Add('AtualizaPrioridades - '+e.message);
    End; // on e : Exception do
  End; // Try da Transa��o

End; // Atualiza Prioridade de Reposi��o >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Transferencias de Dias Anteiroes e Novas do Setor de Compras >>>>>>>>>>
Function TFrmTransferencias.ProcessaTransferenciasCompras: Boolean;
Var
  MySql: String;

  sQtdMenos, sQtdTrans,
  sDocTR,
  sSaldoCD,
  sEnd_Zona, sEnd_Corredor, sEnd_Prateleira, sEnd_Gaveta: String;

  mMemo: TMemo;
  ii, i: Integer;

  bProcessou: Boolean;
Begin
  Result:=False;

  // Verifia se Existe Transferencia a Processar ===============================
  MySql:=' SELECT oc.cod_empresa'+
         ' FROM OC_COMPRAR oc'+
         ' WHERE oc.num_oc_gerada>20160300'+
         ' AND   oc.ind_transf_cd=''N'''+
         ' AND   CAST(oc.dta_oc_gerada AS DATE) < CURRENT_DATE'+

         ' UNION'+

         ' SELECT l.cod_loja cod_empresa'+
         ' FROM ES_ESTOQUES_LOJAS l'+
         ' WHERE ('+ // �ltimo DIA do Calculo Autom�tico (Somente Prioridade igual a Zero)
         '        (l.num_tr_gerada=0 AND l.ind_prioridade=0 AND l.dta_movto >  ''27.09.2017'')'+
         '         OR'+ // Primeiro Dia Que Busca Loja N�o Atendida
         '        (l.num_tr_gerada=0 AND l.ind_prioridade=2 AND l.dta_movto > ''05.11.2017'')'+
         '         OR'+ // �ltimo DIA do Calculo Autom�tico (Solicita��es do Compras)
         '        (l.num_tr_gerada<>0 AND l.dta_movto >  ''27.09.2017'')'+
         '        )'+
         ' AND   l.qtd_a_transf > 0'+
         ' AND   l.ind_transf = ''SIM'''+
         ' AND   l.num_pedido = ''000000'''+
         ' AND   l.dta_movto < CURRENT_DATE'+
         ' ORDER BY 1';
  DMTransferencias.CDS_Busca.Close;
  DMTransferencias.SDS_Busca.CommandText:=MySql;
  DMTransferencias.CDS_Busca.Open;

  If Trim(DMTransferencias.CDS_Busca.FieldByName('Cod_Empresa').AsString)='' Then
  Begin
    Result:=True;
    DMTransferencias.CDS_Busca.Close;
    Exit;
  End; // If Trim(DMTransferencias.CDS_Busca.FieldByName('Cod_Empresa').AsString)='' Then

  // Verifica se Transa��o esta Ativa
  If DMTransferencias.SQLC.InTransaction Then
   DMTransferencias.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMTransferencias.SQLC.StartTransaction(TD);
  Try
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Cria Componente Memo ====================================================
    mMemo:=TMemo.Create(Self);
    mMemo.Visible:=False;
    mMemo.Parent:=FrmTransferencias;
    mMemo.Width:=500;
    mMemo.Lines.Clear;

    While Not DMTransferencias.CDS_Busca.Eof do
    Begin
      mMemo.Lines.Add(Trim(DMTransferencias.CDS_Busca.FieldByName('Cod_Empresa').AsString));

      DMTransferencias.CDS_Busca.Next;
    End;
    DMTransferencias.CDS_Busca.Close;

    For i:=0 to mMemo.Lines.Count-1 do
    Begin
      // Verifica se Existe ES_ESTOQUES_LOJAS do Loja ==========================
      MySql:=' SELECT FIRST 1 lo.num_docto'+
             ' FROM ES_ESTOQUES_LOJAS lo'+
             ' WHERE lo.cod_loja='+QuotedStr(mMemo.Lines[i])+
             ' AND   lo.dta_movto = CURRENT_DATE';
      DMTransferencias.CDS_Busca.Close;
      DMTransferencias.SDS_Busca.CommandText:=MySql;
      DMTransferencias.CDS_Busca.Open;
      sDocTR:=Trim(DMTransferencias.CDS_Busca.FieldByName('Num_Docto').AsString);
      DMTransferencias.CDS_Busca.Close;

      If sDocTR='' Then
      Begin
        // Busca Numero do Docto ===============================================
        MySql:=' SELECT COALESCE(MAX(el.num_docto)+1 ,1) Nr_Docto'+
               ' FROM ES_ESTOQUES_LOJAS el';
        DMTransferencias.CDS_BuscaRapida.Close;
        DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
        DMTransferencias.CDS_BuscaRapida.Open;
        sDocTR:=DMTransferencias.CDS_BuscaRapida.FieldByName('Nr_Docto').AsString;
        DMTransferencias.CDS_BuscaRapida.Close;
      End; // If sDocTR='' Then

      // Atualiza Numerador para Num_Seq da Sele��o ============================
      MySql:=' SELECT COALESCE(MAX(lo.num_seq)+1 ,1) Num_Seq'+
             ' FROM ES_ESTOQUES_LOJAS lo'+
             ' WHERE lo.cod_loja='+QuotedStr(mMemo.Lines[i])+
             ' AND   lo.dta_movto = CURRENT_DATE';
      DMTransferencias.CDS_Busca.Close;
      DMTransferencias.SDS_Busca.CommandText:=MySql;
      DMTransferencias.CDS_Busca.Open;

      MySql:=' ALTER SEQUENCE GEN_ODIR RESTART WITH '+DMTransferencias.CDS_Busca.FieldByName('Num_Seq').AsString;
      DMTransferencias.SQLC.Execute(MySql,nil,nil);
      DMTransferencias.CDS_Busca.Close;

      // Busca Produtos de Transferencia =======================================
      MySql:=' SELECT'+
             ' o.NUM_SEQ, '+
             ' GEN_ID(GEN_ODIR,1) NEW_NUM_SEQ, '+
             ' CURRENT_DATE DTA_MOVTO,'+
             ' COALESCE(o.num_documento,0) Doc_Origem, '+
             sDocTR+' NUM_DOCTO,'+
             ' 0 Doc_Loja,'+ // Docto Original de Solicita��o da Loja
             ' o.obs_oc,'+
             ' o.cod_empresa COD_LOJA,'+
             ' o.cod_item COD_PRODUTO,'+
             ' o.qtd_saldo QTD_ESTOQUE,'+
             ' (o.qtd_dem_mes1+o.qtd_dem_mes2+o.qtd_dem_mes3+o.qtd_dem_mes4+'+
             '  o.qtd_dem_mes5+o.qtd_dem_mes6+o.qtd_dem_mes7+o.qtd_dem_mes8) QTD_VENDAS,'+
             ' o.cla_curva_abc IND_CURVA,'+
             ' o.dias_estocagem DIAS_ESTOCAGEM,'+
             ' o.qtd_dias_ano QTD_DIAS,'+
             ' o.qtd_demanda_dia QTD_VENDA_DIA,'+
             ' o.qtd_demanda_dia QTD_DEMANDA,'+
             ' o.qtd_sugerida QTD_REPOSICAO,'+
             ' o.num_oc_gerada NUM_TR_GERADA,'+
             ' o.qtd_transf QTD_TRANSF_OC,'+
             ' 0 QTD_TRANSF,'+
             ' o.qtd_acomprar QTD_A_TRANSF,'+
             ' ''000000'' NUM_PEDIDO,'+
             ' ''SIM'' IND_TRANSF,'+
             ' 1 IND_PRIORIDADE,'+
             ' 0 USU_ALTERA,'+
             ' current_timestamp DTA_ALTERA,'+
             ' ''SIM'' Compras'+

             ' FROM OC_COMPRAR o'+
             ' WHERE o.num_oc_gerada>20160300'+
             ' AND   o.ind_transf_cd=''N'''+
             ' AND   Cast(o.dta_oc_gerada As Date) < CURRENT_DATE'+
             ' AND   o.cod_empresa='+QuotedStr(mMemo.Lines[i]);

      MySql:=
       MySql+' UNION'+

             ' SELECT'+
             ' l.NUM_SEQ, '+
             ' GEN_ID(GEN_ODIR,1) NEW_NUM_SEQ, '+
             ' CURRENT_DATE DTA_MOVTO,'+
             ' l.num_docto Doc_Origem, '+
             sDocTR+' NUM_DOCTO,'+

             ' CASE'+
             '    WHEN (POSITION(''N�'',l.OBS_DOCTO)<>0) AND (POSITION(''Qtd:'',l.OBS_DOCTO)<>0) THEN'+
             '      TRIM(SUBSTRING(l.OBS_DOCTO FROM (POSITION(''N�'',l.OBS_DOCTO)+2) FOR'+
             '                    ((POSITION(''Qtd:'',l.OBS_DOCTO))-(POSITION(''N�'',l.OBS_DOCTO)+2))))'+
             '    ELSE'+
             '      0'+
             ' END Doc_Loja,'+

             ' l.OBS_DOCTO,'+
             ' l.COD_LOJA,'+
             ' l.COD_PRODUTO,'+
             ' l.QTD_ESTOQUE,'+
             ' l.QTD_VENDAS,'+
             ' l.IND_CURVA,'+
             ' l.DIAS_ESTOCAGEM,'+
             ' l.QTD_DIAS,'+
             ' l.QTD_VENDA_DIA,'+
             ' l.QTD_DEMANDA,'+
             ' l.QTD_REPOSICAO,'+
             ' l.NUM_TR_GERADA,'+
             ' l.QTD_TRANSF_OC,'+
             ' l.QTD_TRANSF,'+
             ' l.QTD_A_TRANSF,'+
             ' l.NUM_PEDIDO,'+
             ' l.IND_TRANSF,'+
             ' l.IND_PRIORIDADE,'+
             ' 0 USU_ALTERA,'+
             ' current_timestamp DTA_ALTERA,'+
             ' ''NAO'' Compras'+

             ' FROM ES_ESTOQUES_LOJAS l'+

             ' WHERE ('+ // �ltimo DIA do Calculo Autom�tico (Somente Prioridade igual a Zero)
             '        (l.num_tr_gerada=0 AND l.ind_prioridade=0 AND l.dta_movto >  ''27.09.2017'')'+
             '         OR'+ // Primeiro Dia Que Busca Loja N�o Atendida
             '        (l.num_tr_gerada=0 AND l.ind_prioridade=2 AND l.dta_movto >= ''06.11.2017'')'+
             '         OR'+ // �ltimo DIA do Calculo Autom�tico (Solicita��es do Compras)
             '        (l.num_tr_gerada<>0 AND l.dta_movto >  ''27.09.2017'')'+
             '        )'+
             ' AND   l.qtd_a_transf>0'+
             ' AND   l.ind_transf=''SIM'''+
             ' AND   l.num_pedido=''000000'''+
             ' AND   l.dta_movto < CURRENT_DATE'+
             ' AND   l.cod_loja='+QuotedStr(mMemo.Lines[i])+
             ' ORDER BY 23 Desc, 8'; // Ordena pro: IND_PRIORIDADE, COD_PRODUTO
      DMTransferencias.CDS_Busca.Close;
      DMTransferencias.SDS_Busca.CommandText:=MySql;
      DMTransferencias.CDS_Busca.Open;

      // Retorna Generator para 0 ==============================================
      MySql:=' ALTER SEQUENCE GEN_ODIR RESTART WITH 0';
      DMTransferencias.SQLC.Execute(MySql,nil,nil);

      // Atualiza ES_ESTOQUE_LOJAS =============================================
      DMTransferencias.CDS_Busca.DisableControls;
      While Not DMTransferencias.CDS_Busca.Eof do
      Begin
        sgCodProduto:=Trim(DMTransferencias.CDS_Busca.FieldByName('Cod_Produto').AsString);

        //======================================================================
        // Atualiza OC_COMPRAR =================================================
        //======================================================================
        If DMTransferencias.CDS_Busca.FieldByName('Compras').AsString='SIM' Then
        Begin
          MySql:=' UPDATE OC_COMPRAR O'+
                 ' SET o.ind_transf_cd='+QuotedStr('S')+
                 ',    o.doc_transf_cd='+QuotedStr(sDocTR)+
                 ' WHERE o.num_seq='+QuotedStr(DMTransferencias.CDS_Busca.FieldByName('Num_Seq').AsString)+
                 ' AND   o.num_documento='+QuotedStr(DMTransferencias.CDS_Busca.FieldByName('Doc_Origem').AsString)+
                 ' AND   o.cod_empresa='+QuotedStr(DMTransferencias.CDS_Busca.FieldByName('Cod_loja').AsString)+
                 ' AND   o.cod_item='+QuotedStr(sgCodProduto);
          DMTransferencias.SQLC.Execute(MySql,nil,nil);
        End; // If DMTransferencias.CDS_Busca.FieldByName('Doc_Origem').AsInteger<>0 Then
        // Atualiza OC_COMPRAR =================================================
        //======================================================================

        //======================================================================
        // Atualiza ES_ESTOQUES_LOJAS ==========================================
        //======================================================================
        If DMTransferencias.CDS_Busca.FieldByName('Compras').AsString='NAO' Then
        Begin
          // Atualiza ES_ESTOQUES_LOJAS ANTERIOR ===============================
          MySql:=' UPDATE ES_ESTOQUES_LOJAS l';

                 If DMTransferencias.CDS_Busca.FieldByName('QTD_TRANSF_OC').AsCurrency<>0.00 Then
                  MySql:=
                   MySql+' SET l.num_pedido=''999999'''
                 Else
                  MySql:=
                   MySql+' SET l.num_pedido=''999998''';

          MySql:=
           MySql+' WHERE l.num_seq='+QuotedStr(DMTransferencias.CDS_Busca.FieldByName('Num_Seq').AsString)+
                 ' AND   l.num_docto='+QuotedStr(DMTransferencias.CDS_Busca.FieldByName('Doc_Origem').AsString)+
                 ' AND   l.cod_loja='+QuotedStr(DMTransferencias.CDS_Busca.FieldByName('Cod_loja').AsString);

                 If DMTransferencias.CDS_Busca.FieldByName('QTD_TRANSF_OC').AsCurrency<>0.00 Then
                  MySql:=
                   MySql+' AND   l.num_tr_gerada='+QuotedStr(DMTransferencias.CDS_Busca.FieldByName('NUM_TR_GERADA').AsString);

          MySql:=
           MySql+' AND   l.ind_transf=''SIM'''+
                 ' AND   l.cod_produto='+QuotedStr(sgCodProduto);
          DMTransferencias.SQLC.Execute(MySql,nil,nil);

          // Acerta Numero do Docto em SOL_TRANSFERENCIA_CD ====================
          If DMTransferencias.CDS_Busca.FieldByName('Doc_Loja').AsInteger<>0 Then
          Begin
            MySql:=' UPDATE SOL_TRANSFERENCIA_CD so'+
                   ' SET so.doc_gerado='+DMTransferencias.CDS_Busca.FieldByName('NUM_DOCTO').AsString+
                   ' WHERE so.num_solicitacao='+DMTransferencias.CDS_Busca.FieldByName('DOC_LOJA').AsString+
                   ' AND so.cod_loja_sidi='+QuotedStr(DMTransferencias.CDS_Busca.FieldByName('COD_LOJA').AsString)+
                   ' AND so.cod_prod_sidi='+QuotedStr(DMTransferencias.CDS_Busca.FieldByName('COD_PRODUTO').AsString);
            DMTransferencias.SQLC.Execute(MySql,nil,nil);
          End; // If DMTransferencias.CDS_Busca.FieldByName('Doc_Loja').AsInteger<>0 Then
        End; // If DMTransferencias.CDS_Busca.FieldByName('Doc_Origem').AsInteger<>0 Then
        // Atualiza ES_ESTOQUES_LOJAS ==========================================
        //======================================================================

        //======================================================================
        // Atualiza ES_ESTOQUES_LOJAS ATUAL ====================================
        //======================================================================
        MySql:=' SELECT FIRST 1 lo.num_docto, lo.qtd_a_transf, lo.ind_prioridade'+
               ' FROM ES_ESTOQUES_LOJAS lo'+
               ' WHERE lo.Num_Docto='+QuotedStr(sDocTR)+
               ' AND   lo.Cod_Loja='+QuotedStr(mMemo.Lines[i])+
               ' AND   lo.Cod_Produto='+QuotedStr(sgCodProduto)+
               ' AND   lo.Ind_Transf='+QuotedStr('SIM');
        DMTransferencias.CDS_Busca1.Close;
        DMTransferencias.SDS_Busca1.CommandText:=MySql;
        DMTransferencias.CDS_Busca1.Open;

        bProcessou:=False;
        sQtdMenos:=Trim(DMTransferencias.CDS_Busca1.FieldByName('Qtd_A_Transf').AsString);
        If Trim(sQtdMenos)='' Then
         sQtdMenos:='0';

        // SE PRODUTO N�O EXISTIR INSERE =======================================
        If Trim(DMTransferencias.CDS_Busca1.FieldByName('Num_Docto').AsString)='' Then
         Begin
           sQtdTrans:=Trim(DMTransferencias.CDS_Busca.FieldByName('QTD_A_TRANSF').AsString);
           sQtdTrans:=f_Troca(',','.',sQtdTrans);

           If Trim(sQtdTrans)='' Then
            sQtdTrans:='0';

           MySql:=' INSERT INTO ES_ESTOQUES_LOJAS ('+
                  ' NUM_SEQ, DTA_MOVTO, NUM_DOCTO, COD_LOJA, COD_PRODUTO,'+
                  ' QTD_ESTOQUE, QTD_VENDAS, IND_CURVA, DIAS_ESTOCAGEM,'+
                  ' QTD_DIAS, QTD_VENDA_DIA, QTD_DEMANDA, QTD_REPOSICAO,'+
                  ' NUM_TR_GERADA, QTD_TRANSF_OC, QTD_TRANSF, QTD_A_TRANSF,'+
                  ' NUM_PEDIDO, IND_TRANSF, USU_ALTERA, DTA_ALTERA, OBS_DOCTO, IND_PRIORIDADE)'+

                  ' VALUES ('+
                  QuotedStr(DMTransferencias.CDS_Busca.FieldByName('New_Num_Seq').AsString)+', '+ // NUM_SEQ
                  ' CURRENT_DATE, '+ // DTA_MOVTO
                  QuotedStr(sDocTR)+', '+ // NUM_DOCTO
                  QuotedStr(mMemo.Lines[i])+', '+ // COD_LOJA
                  QuotedStr(sgCodProduto)+', '+ // COD_PRODUTO
                  QuotedStr(Trim(DMTransferencias.CDS_Busca.FieldByName('QTD_ESTOQUE').AsString))+', '+ // QTD_ESTOQUE
                  QuotedStr(Trim(DMTransferencias.CDS_Busca.FieldByName('QTD_VENDAS').AsString))+', '+ // QTD_VENDAS
                  QuotedStr(Trim(DMTransferencias.CDS_Busca.FieldByName('IND_CURVA').AsString))+', '+ // IND_CURVA
                  QuotedStr(Trim(DMTransferencias.CDS_Busca.FieldByName('DIAS_ESTOCAGEM').AsString))+', '+ // DIAS_ESTOCAGEM
                  QuotedStr(Trim(DMTransferencias.CDS_Busca.FieldByName('QTD_DIAS').AsString))+', '+ // QTD_DIAS
                  QuotedStr(Trim(DMTransferencias.CDS_Busca.FieldByName('QTD_VENDA_DIA').AsString))+', '+ // QTD_VENDA_DIA
                  QuotedStr(Trim(DMTransferencias.CDS_Busca.FieldByName('QTD_DEMANDA').AsString))+', '+ // QTD_DEMANDA
                  QuotedStr(Trim(DMTransferencias.CDS_Busca.FieldByName('QTD_REPOSICAO').AsString))+', '+ // QTD_REPOSICAO
                  QuotedStr(Trim(DMTransferencias.CDS_Busca.FieldByName('NUM_TR_GERADA').AsString))+', '+ // NUM_TR_GERADA
                  QuotedStr(Trim(DMTransferencias.CDS_Busca.FieldByName('QTD_TRANSF_OC').AsString))+', '+ // QTD_TRANSF_OC
                  QuotedStr(Trim(DMTransferencias.CDS_Busca.FieldByName('QTD_TRANSF').AsString))+', '+ // QTD_TRANSF
                  sQtdTrans+', '+ // QTD_A_TRANSF
                  QuotedStr(Trim(DMTransferencias.CDS_Busca.FieldByName('NUM_PEDIDO').AsString))+', '+ // NUM_PEDIDO
                  QuotedStr(Trim(DMTransferencias.CDS_Busca.FieldByName('IND_TRANSF').AsString))+', '+ // IND_TRANSF
                  QuotedStr(Trim(DMTransferencias.CDS_Busca.FieldByName('USU_ALTERA').AsString))+', '+ // USU_ALTERA
                  QuotedStr(Trim(DMTransferencias.CDS_Busca.FieldByName('DTA_ALTERA').AsString))+', '+ // DTA_ALTERA
                  QuotedStr(Trim(DMTransferencias.CDS_Busca.FieldByName('OBS_OC').AsString))+', '+ // OBS_DOCTO
                  QuotedStr(Trim(DMTransferencias.CDS_Busca.FieldByName('IND_PRIORIDADE').AsString))+')'; // IND_PRIORIDADE

           bProcessou:=True;
         End
        Else
         Begin
           //===================================================================
           // Controle de Prioridades
           //===================================================================
           // Prioridade 0 <ZERO> CAMAPNHAS  - Substitui Qualquer Outra
           // Prioridade 1 <UM>   COMPRAS    - Substitui Somente a Prioridade 3 <TRES>
           // Prioridade 2 <DOIS> LOJAS      - Substitui as Prioridade 2 e 3 <DOIS e TRES>
           // Prioridade 3 <TRES> AUTOMATICO - N�o Substitui. Prioridade Mais BAIXA
           // Controle de Prioridades
           //===================================================================

           // CDS_Busca1 = Prioridade Existente
           // CDS_Busca  = Nova Prioridade
           bProcessou:=False;

           // Duas Prioridades Iguais
           If DMTransferencias.CDS_Busca1.FieldByName('Ind_Prioridade').AsInteger=DMTransferencias.CDS_Busca.FieldByName('Ind_Prioridade').AsInteger Then
            Begin
              sQtdTrans:=DMTransferencias.CDS_Busca1.FieldByName('Qtd_A_Transf').AsString;
              If DMTransferencias.CDS_Busca.FieldByName('Qtd_A_Transf').AsCurrency>DMTransferencias.CDS_Busca1.FieldByName('Qtd_A_Transf').AsCurrency Then
               sQtdTrans:=DMTransferencias.CDS_Busca.FieldByName('Qtd_A_Transf').AsString;

              bProcessou:=True;
            End
           ELSE // Prioridade 0 - Substitui Todas
            If DMTransferencias.CDS_Busca.FieldByName('Ind_Prioridade').AsInteger=0 Then
            Begin
              sQtdTrans:=DMTransferencias.CDS_Busca.FieldByName('Qtd_A_Transf').AsString;
              bProcessou:=True;
            End
           ELSE // Prioridade 1 - Substitui Prioridade 3
            If (DMTransferencias.CDS_Busca.FieldByName('Ind_Prioridade').AsInteger=1) and
               (DMTransferencias.CDS_Busca1.FieldByName('Ind_Prioridade').AsInteger=3) Then
            Begin
              sQtdTrans:=DMTransferencias.CDS_Busca.FieldByName('Qtd_A_Transf').AsString;
              bProcessou:=True;
            End
           ELSE // Prioridade 2 - Substitui Prioridades 1 e 3
            If (DMTransferencias.CDS_Busca.FieldByName('Ind_Prioridade').AsInteger=2) and
               ((DMTransferencias.CDS_Busca1.FieldByName('Ind_Prioridade').AsInteger=1) Or
                (DMTransferencias.CDS_Busca1.FieldByName('Ind_Prioridade').AsInteger=3)) Then
            Begin
              sQtdTrans:=DMTransferencias.CDS_Busca.FieldByName('Qtd_A_Transf').AsString;
              bProcessou:=True;
            End;

           sQtdTrans:=f_Troca(',','.',sQtdTrans);

           If Trim(sQtdTrans)='' Then
            sQtdTrans:='0';

           MySql:=' UPDATE  ES_ESTOQUES_LOJAS lo'+
                  ' SET lo.qtd_transf_oc='+DMTransferencias.CDS_Busca.FieldByName('QTD_TRANSF_OC').AsString+
                  ',    lo.qtd_transf='+DMTransferencias.CDS_Busca.FieldByName('QTD_TRANSF').AsString+
                  ',    lo.qtd_a_transf='+sQtdTrans+
                  ',    lo.num_tr_gerada='+QuotedStr(Trim(DMTransferencias.CDS_Busca.FieldByName('NUM_TR_GERADA').AsString))+
                  ',    lo.ind_prioridade='+DMTransferencias.CDS_Busca.FieldByName('IND_PRIORIDADE').AsString+
                  ',    lo.obs_docto=lo.obs_docto||'' - '''+QuotedStr(Copy(DMTransferencias.CDS_Busca.FieldByName('OBS_OC').AsString,1,1000))+
                  ' WHERE lo.Num_Docto='+QuotedStr(sDocTR)+
                  ' AND   lo.Cod_Loja='+QuotedStr(mMemo.Lines[i])+
                  ' AND   lo.Ind_Transf='+QuotedStr('SIM')+
                  ' AND   lo.Cod_Produto='+QuotedStr(sgCodProduto);

           bProcessou:=True;
         End; // If Trim(DMTransferencias.CDS_Busca1.FieldByName('Num_Docto').AsString)='' Then
        DMTransferencias.CDS_Busca1.Close;

        //======================================================================
        // S� Atualiza Es_Estoques_CD se Atualizou Es_Estoque_Loja ==============
        //======================================================================
        If bProcessou Then
        Begin
          // Executa Insert ou Update ==========================================
          DMTransferencias.SQLC.Execute(MySql,nil,nil);

          //====================================================================
          // Verifica se Existe ES_ESTOQUES_CD =================================
          //====================================================================
          MySql:=' SELECT cd.cod_produto'+
                 ' FROM ES_ESTOQUES_CD cd'+
                 ' WHERE cd.dta_movto = CURRENT_DATE'+
                 ' AND   cd.cod_produto='+QuotedStr(sgCodProduto);
          DMTransferencias.CDS_BuscaRapida.Close;
          DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
          DMTransferencias.CDS_BuscaRapida.Open;

          If Trim(DMTransferencias.CDS_BuscaRapida.FieldByName('Cod_Produto').AsString)='' Then
           Begin
             DMTransferencias.CDS_BuscaRapida.Close;

             // Busca Endereco s Saldo no SIDICOM ==============================
            //OdirSemSIDICOM - 07/05/2019
            //             MySql:=' SELECT'+
            //                    ' e.saldoatual,'+
            //                    ' e.zonaendereco end_zona,'+
            //                    ' e.corredor end_corredor,'+
            //                    ' e.prateleira end_prateleira,'+
            //                    ' e.gaveta end_gaveta'+
            //                    ' FROM ESTOQUE e'+
            //                    ' WHERE e.codproduto='+QuotedStr(sgCodProduto)+
            //                    ' AND   e.codfilial=''99''';
            //             IBQ_MPMS.Close;
            //             IBQ_MPMS.SQL.Clear;
            //             IBQ_MPMS.SQL.Add(MySql);
            //             IBQ_MPMS.Open;
            //
            //             sEnd_Zona      :='0';
            //             sEnd_Corredor  :='000';
            //             sEnd_Prateleira:='000';
            //             sEnd_Gaveta    :='0000';
            //
            //             sSaldoCD       :='0';
            //             If Trim(IBQ_MPMS.FieldByName('saldoatual').AsString)<>'' Then
            //              sSaldoCD:=IntToStr(ParteInteiro(IBQ_MPMS.FieldByName('saldoatual').AsString));
            //
            //             If Trim(IBQ_MPMS.FieldByName('end_zona').AsString)<>'' Then
            //             Begin
            //               sEnd_Zona      :=Trim(IBQ_MPMS.FieldByName('end_zona').AsString);
            //               sEnd_Corredor  :=Trim(IBQ_MPMS.FieldByName('end_corredor').AsString);
            //               sEnd_Prateleira:=Trim(IBQ_MPMS.FieldByName('end_prateleira').AsString);
            //               sEnd_Gaveta    :=Trim(IBQ_MPMS.FieldByName('end_gaveta').AsString);
            //             End; // If Trim(IBQ_MPMS.FieldByName('end_zona').AsString)<>'' Then
            //             IBQ_MPMS.Close;
            //
            //             // Busca Saldo no Linx ===============================================
            //             sgSaldoLinx:=Trim(BuscaSaldoLinx('99',sgCodProduto));
            //             If sgSaldoLinx<>'' Then
            //              sSaldoCD:=sgSaldoLinx;

             MySql:=' SELECT'+
                    ' COALESCE(s.quantidade,0) SALDOATUAL,'+
                    ' COALESCE(e.zonaendereco,99) END_ZONA,'+
                    ' COALESCE(e.corredor,''999'') END_CORREDOR,'+
                    ' COALESCE(e.prateleira,''999'') END_PRATELEIRA,'+
                    ' COALESCE(e.gaveta,''9999'') END_GAVETA'+

                    ' FROM PROD_ENDERECO e'+
                    '      LEFT JOIN LINXPRODUTOSDETALHES s  ON s.cod_produto=e.cod_produto'+
                    '                                       AND s.empresa=e.cod_linx'+
                    ' WHERE e.cod_loja='+QuotedStr('99')+
                    ' AND   e.cod_item='+QuotedStr(sgCodProduto);
             DMTransferencias.SQLQuery2.Close;
             DMTransferencias.SQLQuery2.SQL.Clear;
             DMTransferencias.SQLQuery2.SQL.Add(MySql);
             DMTransferencias.SQLQuery2.Open;

             sEnd_Zona      :='99';
             sEnd_Corredor  :='999';
             sEnd_Prateleira:='999';
             sEnd_Gaveta    :='9999';

             sSaldoCD       :='0';
             If Trim(DMTransferencias.SQLQuery2.FieldByName('saldoatual').AsString)<>'' Then
              sSaldoCD:=IntToStr(ParteInteiro(DMTransferencias.SQLQuery2.FieldByName('saldoatual').AsString));

             If Trim(DMTransferencias.SQLQuery2.FieldByName('end_zona').AsString)<>'' Then
             Begin
               sEnd_Zona      :=Trim(DMTransferencias.SQLQuery2.FieldByName('end_zona').AsString);
               sEnd_Corredor  :=Trim(DMTransferencias.SQLQuery2.FieldByName('end_corredor').AsString);
               sEnd_Prateleira:=Trim(DMTransferencias.SQLQuery2.FieldByName('end_prateleira').AsString);
               sEnd_Gaveta    :=Trim(DMTransferencias.SQLQuery2.FieldByName('end_gaveta').AsString);
             End; // If Trim(DMTransferencias.SQLQuery2.FieldByName('end_zona').AsString)<>'' Then
             DMTransferencias.SQLQuery2.Close;

              // Insere ES_ESTOQUES_CD ==========================================
             MySql:=' INSERT INTO ES_ESTOQUES_CD ('+
                    ' DTA_MOVTO, COD_PRODUTO, QTD_ESTOQUE, QTD_SAIDAS, QTD_SALDO,'+
                    ' END_ZONA, END_CORREDOR, END_PRATELEIRA, END_GAVETA)'+
                    ' VALUES ('+
                    ' CURRENT_DATE, '+ // DTA_MOVTO
                    QuotedStr(sgCodProduto)+', '+ // COD_PRODUTO
                    sSaldoCD+', '+ // QTD_ESTOQUE
                    QuotedStr(Trim(DMTransferencias.CDS_Busca.FieldByName('Qtd_A_Transf').AsString))+', '+ // QTD_SAIDAS
                    IntToStr(StrToInt(sSaldoCD)-DMTransferencias.CDS_Busca.FieldByName('Qtd_A_Transf').AsInteger)+', '+ // QTD_SALDO
                    QuotedStr(sEnd_Zona)+', '+ // END_ZONA
                    QuotedStr(sEnd_Corredor)+', '+ // END_CORREDOR
                    QuotedStr(sEnd_Prateleira)+', '+ // END_PRATELEIRA
                    QuotedStr(sEnd_Gaveta)+')'; // END_GAVETA
           End
          Else// If Trim(DMTransferencias.CDS_BuscaRapida.FieldByName('Cod_Produto').AsString)='' Then
           Begin
             sQtdMenos:=f_Troca(',','.',sQtdMenos);

             MySql:=' UPDATE ES_ESTOQUES_CD cd'+
                    ' SET cd.Qtd_Saidas=(cd.Qtd_Saidas-'+sQtdMenos+')+'+sQtdTrans+
                    ',    cd.Qtd_Saldo=(cd.Qtd_Saldo+'+sQtdMenos+')-'+sQtdTrans+
                    ' WHERE cd.dta_movto = CURRENT_DATE'+
                    ' AND   cd.cod_produto='+QuotedStr(sgCodProduto);
           End; // If Trim(DMTransferencias.CDS_BuscaRapida.FieldByName('Cod_Produto').AsString)='' Then
          DMTransferencias.SQLC.Execute(MySql,nil,nil);
          DMTransferencias.CDS_BuscaRapida.Close;
        End; // If bProcessou Then
        // S� Atualiza Es_Estoques_CD se Atualizou Es_Estoque_Loja ==============
        //======================================================================

        DMTransferencias.CDS_Busca.Next;
      End; // While Not DMTransferencias.CDS_Busca.Eof do
      DMTransferencias.CDS_Busca.EnableControls;
      DMTransferencias.CDS_Busca.Close;

      // Acerta Num_Seq ========================================================
      //OdirSemSIDICOM - 07/05/2019
      //      MySql:=' SELECT lo.num_seq, lo.cod_produto, TRIM(pr.apresentacao) nome_produto,'+
      //             ' COALESCE(cd.end_zona,''0'')||''.''||COALESCE(cd.end_corredor,''000'')||''.''||'+
      //             ' COALESCE(cd.end_prateleira,''000'')||''.''||COALESCE(cd.end_gaveta,''0000'') Enderecamento'+
      //             ' FROM ES_ESTOQUES_LOJAS lo'+
      //             '      LEFT JOIN PRODUTO        pr  ON pr.codproduto=lo.cod_produto'+
      //             '      LEFT JOIN ES_ESTOQUES_CD cd  ON cd.dta_movto=lo.dta_movto'+
      //             '                                  AND cd.cod_produto=lo.cod_produto'+
      //
      //             ' WHERE lo.dta_movto = CURRENT_DATE'+
      //             ' AND   lo.num_docto='+QuotedStr(sDocTR)+
      //             ' AND   lo.cod_loja='+QuotedStr(mMemo.Lines[i])+
      //             ' ORDER BY 4,3';
      MySql:=' SELECT lo.num_seq, lo.cod_produto, TRIM(pr.nome) nome_produto,'+
             ' COALESCE(cd.end_zona,99)||''.''||COALESCE(cd.end_corredor,''999'')||''.''||'+
             ' COALESCE(cd.end_prateleira,''999'')||''.''||COALESCE(cd.end_gaveta,''9999'') Enderecamento'+
             ' FROM ES_ESTOQUES_LOJAS lo'+
             '      LEFT JOIN LINXPRODUTOS   pr  ON pr.cod_auxiliar=lo.cod_produto'+
             '      LEFT JOIN ES_ESTOQUES_CD cd  ON cd.dta_movto=lo.dta_movto'+
             '                                  AND cd.cod_produto=lo.cod_produto'+

             ' WHERE lo.dta_movto = CURRENT_DATE'+
             ' AND   lo.num_docto='+QuotedStr(sDocTR)+
             ' AND   lo.cod_loja='+QuotedStr(mMemo.Lines[i])+
             ' ORDER BY 4,3';
      DMTransferencias.CDS_Busca.Close;
      DMTransferencias.SDS_Busca.CommandText:=MySql;
      DMTransferencias.CDS_Busca.Open;

      ii:=0;
      While Not DMTransferencias.CDS_Busca.Eof do
      Begin
        Inc(ii);

        MySql:=' UPDATE ES_ESTOQUES_LOJAS lo'+
               ' SET lo.num_seq='+IntToStr(ii)+
               ' WHERE lo.dta_movto = CURRENT_DATE'+
               ' AND   lo.num_docto='+QuotedStr(sDocTR)+
               ' AND   lo.cod_loja='+QuotedStr(mMemo.Lines[i])+
               ' AND   lo.num_seq='+DMTransferencias.CDS_Busca.FieldByName('Num_Seq').AsString+
               ' AND   lo.cod_produto='+QuotedStr(DMTransferencias.CDS_Busca.FieldByName('cod_produto').AsString);
        DMTransferencias.SQLC.Execute(MySql,nil,nil);

        DMTransferencias.CDS_Busca.Next;
      End; // While Not DMTransferencias.CDS_Busca.Eof do
      DMTransferencias.CDS_Busca.Close;

    End; // For i:=0 to mMemo.Lines.Count-1 do

    // Acerta Para Prioridade 1 as Solicita��es Vindas do Compras ==============
    MySql:=' UPDATE ES_ESTOQUES_LOJAS el'+
           ' SET   el.ind_prioridade=1'+
           ' WHERE el.dta_movto=CURRENT_DATE'+
           ' AND   el.ind_transf=''SIM'''+
           ' AND   el.ind_prioridade=3'+
           ' AND   el.qtd_transf_oc<>0';
    DMTransferencias.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMTransferencias.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
    Result:=True;
  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMTransferencias.SQLC.Rollback(TD);
      Result:=False;

      DateSeparator:='/';
      DecimalSeparator:=',';

      bgArqErros:=True;
      tgArqErros.Add('ProcessaTransferenciasCompras: '+mMemo.Lines[i]+' - '+e.message);
    End; // on e : Exception do
  End; // Try

  FreeAndNil(mMemo);
End; // Busca Transferencias Anteiroes Setor de Compras >>>>>>>>>>>>>>>>>>>>>>>>

// Salva Arquivo de Acompanhamento de Processamento >>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmTransferencias.SalvaProcessamento(s:String);
Begin
  tgArqProc.Add(s);
  tgArqProc.SaveToFile(sgArqProc);
End; // Salva Arquivo de Acompanhamento de Processamento >>>>>>>>>>>>>>>>>>>>>>>

// Salva Arquivo de Erros, se Houver >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmTransferencias.SalvaErros;
Begin
  Try
    If bgArqErros Then
     tgArqErros.SaveToFile(sgArqErros);
  Finally
    { Libera a instancia da lista da mem�ria }
    FreeAndNil(tgArqErros);
  End;
End; // Salva Arquivo de Erros, se Houver >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Analisa e Atualiza Transferencias do Dia >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmTransferencias.AnalisaAtualizaTransferencias: Boolean;
Var
  MySql: String;
  sCodLoja,
  sObs, sCodProd: String;

  //OdirSemSIDICOM - 07/05/2019
  // , sCodGrupo, sCodSubGrupo: String;

  i, iQtdReposicao: Integer;
  bMultiplo, bRepoe: Boolean;
  iMultiplo, iQtdMultiplo: Integer;
  iQtdEst, iQtdMax: Integer;
  cReposicao: Currency;
Begin
  Result:=False;

  // Busca Produtos com Necessidades de Reposi��o ==============================
  MySql:=' SELECT *'+
         ' FROM ES_ESTOQUES_LOJAS lo'+
         ' WHERE lo.dta_movto=CURRENT_DATE'+
         ' AND   lo.ind_transf=''CAL'''+
         ' ORDER BY lo.cod_produto';
  DMTransferencias.CDS_EstoqueLoja.Close;
  DMTransferencias.SDS_EstoqueLoja.CommandText:=MySql;
  DMTransferencias.CDS_EstoqueLoja.Open;

  If DMTransferencias.CDS_EstoqueLoja.IsEmpty Then
  Begin
    Result:=True;
    Exit;
  End;

  // Verifica se Transa��o esta Ativa
  If DMTransferencias.SQLC.InTransaction Then
   DMTransferencias.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMTransferencias.SQLC.StartTransaction(TD);
  Try
    sCodLoja:='';
    igCodLojaLinx:=0;
    DMTransferencias.CDS_EstoqueLoja.First;
    While not DMTransferencias.CDS_EstoqueLoja.Eof do
    Begin
      sObs:='';

      If sCodLoja<>DMTransferencias.CDS_EstoqueLojaCOD_LOJA.AsString Then
      Begin
        sCodLoja:=DMTransferencias.CDS_EstoqueLojaCOD_LOJA.AsString;

        // Busca C�digo da Loja Linx ===========================================
        MySql:=' SELECT COALESCE(e.cod_linx,0) cod_linx'+
               ' FROM EMP_CONEXOES e'+
               ' WHERE e.cod_filial='+QuotedStr(sCodLoja);
        DMTransferencias.CDS_BuscaRapida.Close;
        DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
        DMTransferencias.CDS_BuscaRapida.Open;
        igCodLojaLinx:=DMTransferencias.CDS_BuscaRapida.FieldByName('cod_linx').AsInteger;
        DMTransferencias.CDS_BuscaRapida.Close;
      End; // If sCodLoja<>DMTransferencias.CDS_EstoqueLojaCOD_LOJA.AsString Then

      // Busca Produto com Saldo do CD ------------------------------
      MySql:=' SELECT *'+
             ' FROM ES_ESTOQUES_CD cd'+
             ' WHERE cd.dta_movto=CURRENT_DATE'+
             ' AND   cd.cod_produto='+QuotedStr(DMTransferencias.CDS_EstoqueLojaCOD_PRODUTO.AsString)+
             ' AND   cd.qtd_saldo>0';
      DMTransferencias.CDS_EstoqueCD.Close;
      DMTransferencias.SDS_EstoqueCD.CommandText:=MySql;
      DMTransferencias.CDS_EstoqueCD.Open;

      //========================================================================
      // Produto Sem Saldo no CD ===============================================
      //========================================================================
      If DMTransferencias.CDS_EstoqueCD.IsEmpty Then
      Begin
         DateSeparator:='.';
         DecimalSeparator:='.';

         // Guarda Produto sem Saldo no CD --------------------------
         MySql:=' INSERT INTO ES_ESTOQUES_SEM (COD_LOJA, DTA_MOVTO, COD_PRODUTO, QTD_ESTOQUE, IND_CURVA)'+
                ' VALUES ('+
                QuotedStr(DMTransferencias.CDS_EstoqueLojaCOD_LOJA.AsString)+', '+
                QuotedStr(DMTransferencias.CDS_EstoqueLojaDTA_MOVTO.AsString)+', '+
                QuotedStr(DMTransferencias.CDS_EstoqueLojaCOD_PRODUTO.AsString)+', '+
                QuotedStr(DMTransferencias.CDS_EstoqueLojaQTD_REPOSICAO.AsString)+', '+
                QuotedStr(DMTransferencias.CDS_EstoqueLojaIND_CURVA.AsString)+')';
         DMTransferencias.SQLC.Execute(MySql,nil,nil);

         DateSeparator:='/';
         DecimalSeparator:=',';

         DMTransferencias.CDS_EstoqueLoja.Edit;
         DMTransferencias.CDS_EstoqueLojaIND_TRANSF.AsString:='NAO';
         DMTransferencias.CDS_EstoqueLojaOBS_DOCTO.AsString:='- Sem Saldo no CD';
         DMTransferencias.CDS_EstoqueLoja.Post;
      End; // If DMTransferencias.CDS_EstoqueCD.IsEmpty Then
      // Produto Sem Saldo no CD ===============================================
      //========================================================================

      //========================================================================
      // Produto Com Saldo no CD ===============================================
      //========================================================================
      If Not DMTransferencias.CDS_EstoqueCD.IsEmpty Then
      Begin
        iQtdReposicao:=DMTransferencias.CDS_EstoqueLojaQTD_REPOSICAO.AsInteger;
        iQtdEst:=DMTransferencias.CDS_EstoqueLojaQTD_ESTOQUE.AsInteger;
        iQtdMax:=DMTransferencias.CDS_EstoqueLojaEST_MAXIMO.AsInteger;

        // Analisa Estouqe Maximo =============================================
        bRepoe:=True;
        If (iQtdMax>0) Then
        Begin
          If iQtdMax<=iQtdEst Then
           Begin
             iQtdReposicao:=0;
             sObs:=' - Sem Reposi��o Saldo de Estoque Maior que Estoque M�ximo.';
             bRepoe:=False;
           End
          Else If (iQtdMax-iQtdEst)<iQtdReposicao Then
           Begin
             sObs:=' - Corte Pela Reposi��o Maior que Diferen�a Entre Estoque M�ximo e Saldo';
             iQtdReposicao:=(iQtdMax-iQtdEst);
           End;
        End; // If (iQtdMax>0) Then


        //======================================================================
        // CALCULA MULTIPLOS E PERCENTUAIS DE CORTES ===========================
        //======================================================================
        bMultiplo   :=False;
        iMultiplo   :=0;
        iQtdMultiplo:=0;
        If bRepoe Then
        Begin
          sCodProd:=DMTransferencias.CDS_EstoqueLojaCOD_PRODUTO.AsString;

// NAO RODA - TROCAR PARA LINX - 07/05/2019
//OdirSemSIDICOM - 07/05/2019
//          //====================================================================
//          // Busca Produto Caixa Embarque ======================================
//          //====================================================================
//          MySql:=' SELECT Trim(pr.codgrupo) CodGrupo, Trim(pr.codsubgrupo) CodSubGrupo'+
//                 ' FROM PRODUTO pr'+
//                 ' WHERE pr.codproduto='+QuotedStr(sCodProd);
//          DMTransferencias.CDS_BuscaRapida.Close;
//          DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
//          DMTransferencias.CDS_BuscaRapida.Open;
//          sCodGrupo   :=DMTransferencias.CDS_BuscaRapida.FieldByName('CodGrupo').AsString;
//          sCodSubGrupo:=DMTransferencias.CDS_BuscaRapida.FieldByName('CodSubGrupo').AsString;
//          DMTransferencias.CDS_BuscaRapida.Close;
//
//          MySql:=' SELECT cp.Cod_Produto, cp.Cod_Grupo, cp.Cod_Subgrupo,'+
//                 '        cp.Qtd_Caixa, cp.Per_Corte'+
//                 ' FROM PROD_CAIXA_CD cp'+
//                 ' WHERE ((cp.cod_produto='+QuotedStr(sCodProd)+')'+
//                 '        OR'+
//                 '        ((cp.cod_grupo='+QuotedStr(sCodGrupo)+') and (cp.cod_subgrupo is null))'+
//                 '        OR'+
//                 '        ((cp.cod_grupo='+QuotedStr(sCodGrupo)+') and (cp.cod_subgrupo='+QuotedStr(sCodSubGrupo)+')))'+
//                 ' ORDER BY 1 desc, 4 desc';
//          DMTransferencias.CDS_BuscaRapida.Close;
//          DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
//          DMTransferencias.CDS_BuscaRapida.Open;
//
//          iMultiplo   :=0;
//          iQtdMultiplo:=0;
//          bMultiplo   :=False;
//          If (Trim(DMTransferencias.CDS_BuscaRapida.FieldByName('Cod_Produto').AsString)<>'') Or // QtD Caixa/Corte
//             (Trim(DMTransferencias.CDS_BuscaRapida.FieldByName('Cod_Grupo').AsString)<>'') Then // Multiplos
//          Begin
//            If DMTransferencias.CDS_BuscaRapida.FieldByName('Per_Corte').AsInteger=0 Then
//             bMultiplo:=True;
//
//            // Calcula Multiplo ================================================
//            If bMultiplo Then
//            Begin
//              iMultiplo:=DMTransferencias.CDS_BuscaRapida.FieldByName('Qtd_Caixa').AsInteger;
//              iQtdMultiplo:=iMultiplo;
//
//              While bMultiplo do
//              Begin
//                If iQtdReposicao<iQtdMultiplo Then
//                Begin
//                  iQtdReposicao:=iQtdMultiplo;
//                  Break;
//                End;
//
//                If iQtdReposicao=iQtdMultiplo Then
//                 Break
//                Else
//                 iQtdMultiplo:=iQtdMultiplo+iMultiplo;
//              End; // While bMultiplo do
//
//              sObs:=Trim(sObs)+' - Utilizado Conforme Multiplo Qtd/Caixa: '+
//                    DMTransferencias.CDS_BuscaRapida.FieldByName('Qtd_Caixa').AsString+
//                    ' Corte: '+DMTransferencias.CDS_BuscaRapida.FieldByName('Per_Corte').AsString+'%';
//            End; // If bMultiplo Then
//
//            // Calcula Por Percentual de Corte =================================
//            If Not bMultiplo Then
//            Begin
//              cReposicao:=RoundTo(iQtdReposicao / DMTransferencias.CDS_BuscaRapida.FieldByName('Qtd_Caixa').AsInteger,-2);
//              iQtdReposicao:=ParteInteiro(CurrToStr(cReposicao));
//              cReposicao:=(cReposicao-iQtdReposicao)*100;
//
//              If cReposicao>=DMTransferencias.CDS_BuscaRapida.FieldByName('Per_Corte').AsCurrency Then
//               iQtdReposicao:=iQtdReposicao+1;
//
//              // Acerta Quantidade Final de Reposi��o ==========================
//              iQtdReposicao:=iQtdReposicao * DMTransferencias.CDS_BuscaRapida.FieldByName('Qtd_Caixa').AsInteger;
//
//              bRepoe:=(iQtdReposicao>0);
//
//              sObs:=Trim(sObs)+' - Utilizado Conforme Corte Qtd/Caixa: '+
//                    DMTransferencias.CDS_BuscaRapida.FieldByName('Qtd_Caixa').AsString+
//                    ' Corte: '+DMTransferencias.CDS_BuscaRapida.FieldByName('Per_Corte').AsString+'%';
//            End; // If Not bMultiplo Then
//          End; // If Trim(DMTransferencias.CDS_BuscaRapida.FieldByName('Cod_Produto').AsString)<>'' Then
//          DMTransferencias.CDS_BuscaRapida.Close;

          iMultiplo   :=0;
          iQtdMultiplo:=0;
          bMultiplo   :=False;

// OdirApagar - 01/08/2017
//          //====================================================================
//          // N�o Rep�e Quantidade de Reposi��o < 3 para curvas para C, D, E ====
//          // Definido Pela Logistica: Eduardo, Pedro, Carlos.
//          //====================================================================
//          If ((Trim(DMTransferencias.CDS_EstoqueLojaIND_CURVA.AsString)='C') Or
//              (Trim(DMTransferencias.CDS_EstoqueLojaIND_CURVA.AsString)='D') Or
//              (Trim(DMTransferencias.CDS_EstoqueLojaIND_CURVA.AsString)='E')) AND
//             (iQtdReposicao<3) Then
//          Begin
//             sObs:=Trim(sObs)+' - N�o Rep�e Quantidade Menor que 3 para Curva: '+
//                              Trim(DMTransferencias.CDS_EstoqueLojaIND_CURVA.AsString)+'.';
//             bRepoe:=False;
//          End; // If (Trim(DMTransferencias.CDS_EstoqueLojaIND_CURVA.AsString)='C') Or ...
//          // N�o Rep�e Quantidade de Reposi��o < 3 para curvas para C, D, E ====
//          // Definido Pela Logistica: Eduardo, Pedro, Carlos.
//          //====================================================================

          //====================================================================
          // Aplica Percentual de Corte da Curva ===============================
          //====================================================================
          If bRepoe Then
          Begin
            If iQtdReposicao>=DMTransferencias.CDS_EstoqueCDQTD_SALDO.AsInteger Then
            Begin
              // Apresentar para o Compras
              If iQtdReposicao>DMTransferencias.CDS_EstoqueCDQTD_SALDO.AsInteger Then
              Begin
                DateSeparator:='.';
                DecimalSeparator:='.';

                MySql:=' INSERT INTO ES_ESTOQUES_SEM (COD_LOJA, DTA_MOVTO, COD_PRODUTO, QTD_ESTOQUE, IND_CURVA)'+
                       ' VALUES ('+
                       QuotedStr(DMTransferencias.CDS_EstoqueLojaCOD_LOJA.AsString)+', '+
                       QuotedStr(DMTransferencias.CDS_EstoqueLojaDTA_MOVTO.AsString)+', '+
                       QuotedStr(DMTransferencias.CDS_EstoqueLojaCOD_PRODUTO.AsString)+', '+
                       QuotedStr(IntToStr(iQtdReposicao-DMTransferencias.CDS_EstoqueCDQTD_SALDO.AsInteger))+', '+
                       QuotedStr(DMTransferencias.CDS_EstoqueLojaIND_CURVA.AsString)+')';
                DMTransferencias.SQLC.Execute(MySql,nil,nil);

                DateSeparator:='/';
                DecimalSeparator:=',';
              End; // If iQtdReposicao>DMTransferencias.CDS_EstoqueCDQTD_SALDO.AsInteger Then

              iQtdReposicao:=DMTransferencias.CDS_EstoqueCDQTD_SALDO.AsInteger;
              sObs:=Trim(sObs)+' - Reposi��o Pelo Saldo Restante no CD.';
            End; // If iQtdReposicao>=DMTransferencias.CDS_EstoqueCDQTD_SALDO.AsInteger Then

            // Verifica Percentual de Corte da Curva ===========================
            If (DMTransferencias.CDS_EstoqueLojaQTD_ESTOQUE.AsInteger>0) And (iQtdReposicao>0) Then
            Begin
              If (Trim(DMTransferencias.CDS_EstoqueLojaIND_CURVA.AsString)='A') And (igPer_CorteA>0)  Then
              Begin
                bRepoe:=((iQtdReposicao*100)/DMTransferencias.CDS_EstoqueLojaQTD_ESTOQUE.AsCurrency)>=(100-igPer_CorteA);
                sObs:=Trim(sObs)+' - Curva "A": Corte '+IntToStr(igPer_CorteA)+'%';
              End;

              If (Trim(DMTransferencias.CDS_EstoqueLojaIND_CURVA.AsString)='B') And (igPer_CorteB>0)  Then
              Begin
                bRepoe:=((iQtdReposicao*100)/DMTransferencias.CDS_EstoqueLojaQTD_ESTOQUE.AsCurrency)>=(100-igPer_CorteB);
                sObs:=Trim(sObs)+' - Curva "B": Corte '+IntToStr(igPer_CorteB)+'%';
              End;

              If (Trim(DMTransferencias.CDS_EstoqueLojaIND_CURVA.AsString)='C') And (igPer_CorteC>0)  Then
              Begin
                bRepoe:=((iQtdReposicao*100)/DMTransferencias.CDS_EstoqueLojaQTD_ESTOQUE.AsCurrency)>=(100-igPer_CorteC);
                sObs:=Trim(sObs)+' - Curva "C": Corte '+IntToStr(igPer_CorteC)+'%';
              End;

              If (Trim(DMTransferencias.CDS_EstoqueLojaIND_CURVA.AsString)='D') And (igPer_CorteD>0)  Then
              Begin
                bRepoe:=((iQtdReposicao*100)/DMTransferencias.CDS_EstoqueLojaQTD_ESTOQUE.AsCurrency)>=(100-igPer_CorteD);
                sObs:=Trim(sObs)+' - Curva "D": Corte '+IntToStr(igPer_CorteD)+'%';
              End;

              If (Trim(DMTransferencias.CDS_EstoqueLojaIND_CURVA.AsString)='E') And (igPer_CorteE>0)  Then
              Begin
                bRepoe:=((iQtdReposicao*100)/DMTransferencias.CDS_EstoqueLojaQTD_ESTOQUE.AsCurrency)>=(100-igPer_CorteE);
                sObs:=Trim(sObs)+' - Curva "E": Corte '+IntToStr(igPer_CorteE)+'%';
              End;
            End; // If (DMTransferencias.CDS_EstoqueLojaQTD_ESTOQUE.AsInteger>0) And (iQtdReposicao>0) Then
          End; // If bRepoe Then
          // Aplica Percentual de Corte da Curva ===============================
          //====================================================================
        End; // If bRepoe Then
        // CALCULA MULTIPLOS E PERCENTUAIS DE CORTES ===========================
        //======================================================================

        // Acerta Observa��o se N�o Usada ======================================
        If Trim(sObs)='' Then
        Begin
          // Reposi��o pela Quantidade de Dias de Estocagem
          If (DMTransferencias.CDS_EstoqueLojaEST_MINIMO.AsInteger <> iQtdReposicao) And
             (DMTransferencias.CDS_EstoqueLojaQTD_DEMANDA.AsInteger = iQtdReposicao) Then
           sObs:='- Reposi��o pela Quantidade de Dias de Estocagem'

          // Reposi��o pela Quantidade de Dias de Estocagem - Estoque
          Else If (DMTransferencias.CDS_EstoqueLojaEST_MINIMO.AsInteger = iQtdReposicao) And
                  ((DMTransferencias.CDS_EstoqueLojaQTD_ESTOQUE.AsInteger + iQtdReposicao) = DMTransferencias.CDS_EstoqueLojaQTD_DEMANDA.AsInteger)Then
           sObs:='- Reposi��o pela Quantidade de Dias de Estocagem Memos Quantidade de Estoque'

          // Reposi��o pela Quantidade de Estoque M�nimo
          Else If (DMTransferencias.CDS_EstoqueLojaEST_MINIMO.AsInteger  = iQtdReposicao) And
                  (DMTransferencias.CDS_EstoqueLojaQTD_DEMANDA.AsInteger <> iQtdReposicao) Then
           sObs:='- Reposi��o pela Quantidade de Estoque M�nimo'

          // Reposi��o pela Quantidade de Dias de Estocagem + Quantidade de Estoque (Negativa)
          Else If (DMTransferencias.CDS_EstoqueLojaEST_MINIMO.AsInteger  <> iQtdReposicao) And
                  (DMTransferencias.CDS_EstoqueLojaQTD_DEMANDA.AsInteger <> iQtdReposicao) And
                  (DMTransferencias.CDS_EstoqueLojaQTD_ESTOQUE.AsCurrency < 0.00) Then
           sObs:='- Reposi��o pela Quantidade de Dias de Estocagem + Quantidade de Estoque (Negativa)'
          Else If ((DMTransferencias.CDS_EstoqueLojaEST_MINIMO.AsInteger - DMTransferencias.CDS_EstoqueLojaQTD_ESTOQUE.AsCurrency) = iQtdReposicao) and
                  (DMTransferencias.CDS_EstoqueLojaQTD_ESTOQUE.AsCurrency = 0.00) Then
           sObs:='- Reposi��o pela Quantidade Necess�ria para Completar o Estoque M�nimo';
        End; // If Trim(sObs)='' Then

        // Grava Altera��es de Reposi��o =======================================
        DMTransferencias.CDS_EstoqueLoja.Edit;

        // Se Rep�e para Loja ==================================================
        If bRepoe Then
        Begin
          DMTransferencias.CDS_EstoqueLojaIND_TRANSF.AsString:='SIM';
          DMTransferencias.CDS_EstoqueLojaQTD_TRANSF.AsInteger:=iQtdReposicao;
          DMTransferencias.CDS_EstoqueLojaQTD_A_TRANSF.AsInteger:=iQtdReposicao;

          // OBS_DOCTO
          If Trim(DMTransferencias.CDS_EstoqueLojaOBS_DOCTO.AsString)='' Then
           DMTransferencias.CDS_EstoqueLojaOBS_DOCTO.AsString:=Trim(sObs)
          Else
           DMTransferencias.CDS_EstoqueLojaOBS_DOCTO.AsString:=Copy(DMTransferencias.CDS_EstoqueLojaOBS_DOCTO.AsString+' '+Trim(sObs),1,2000);

          // Acerta Saldo no CD ================================================
          DMTransferencias.CDS_EstoqueCD.Edit;
          DMTransferencias.CDS_EstoqueCDQTD_SAIDAS.AsInteger:=
              DMTransferencias.CDS_EstoqueCDQTD_SAIDAS.AsInteger+iQtdReposicao;
          DMTransferencias.CDS_EstoqueCDQTD_SALDO.AsInteger:=
               DMTransferencias.CDS_EstoqueCDQTD_SALDO.AsInteger-iQtdReposicao;
          DMTransferencias.CDS_EstoqueCD.Post;
          DMTransferencias.CDS_EstoqueCD.ApplyUpdates(0);
        End; // If bRepoe Then

        If Not bRepoe Then
        Begin
          DMTransferencias.CDS_EstoqueLojaIND_TRANSF.AsString:='NAO';
          DMTransferencias.CDS_EstoqueLojaQTD_TRANSF.AsInteger:=iQtdReposicao;
          DMTransferencias.CDS_EstoqueLojaQTD_A_TRANSF.AsInteger:=0;

          // OBS_DOCTO
          If Trim(DMTransferencias.CDS_EstoqueLojaOBS_DOCTO.AsString)='' Then
           DMTransferencias.CDS_EstoqueLojaOBS_DOCTO.AsString:=Trim(sObs)
          Else
           DMTransferencias.CDS_EstoqueLojaOBS_DOCTO.AsString:=Copy(DMTransferencias.CDS_EstoqueLojaOBS_DOCTO.AsString+' '+Trim(sObs),1,2000);
        End; // If Not bRepoe Then
        DMTransferencias.CDS_EstoqueLoja.Post;
      End; // If Not DMTransferencias.CDS_EstoqueCD.IsEmpty Then
      // Produto Com Saldo no CD ===============================================
      //========================================================================
      DMTransferencias.CDS_EstoqueCD.Close;
      sObs:='';

      DMTransferencias.CDS_EstoqueLoja.Next;
    End; // While not DMTransferencias.CDS_EstoqueLoja.Eof do

    // Atualiza Transacao ======================================================
    DMTransferencias.CDS_EstoqueLoja.ApplyUpdates(0);

    // Reorganiza NUN_SEQ ======================================================
    MySql:=' UPDATE ES_ESTOQUES_LOJAS lo'+
           ' SET lo.num_seq=0'+
           ' WHERE lo.dta_movto=CURRENT_DATE'+
           ' AND   lo.ind_transf=''NAO''';
    DMTransferencias.SQLC.Execute(MySql,nil,nil);

    // Acerta Num_Seq ==========================================================
    MySql:=' SELECT DISTINCT l.cod_loja, l.num_docto'+
           ' FROM ES_ESTOQUES_LOJAS l'+
           ' WHERE l.dta_movto = CURRENT_DATE'+
           ' AND   l.ind_transf='+QuotedStr('SIM');
    DMTransferencias.CDS_BuscaRapida.Close;
    DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
    DMTransferencias.CDS_BuscaRapida.Open;

    While Not DMTransferencias.CDS_BuscaRapida.Eof do
    Begin
//OdirSemSIDICOM - 07/05/2019
//      MySql:=' SELECT lo.num_seq, lo.cod_produto, TRIM(pr.apresentacao) nome_produto,'+
//             ' COALESCE(cd.end_zona,00)||''.''||COALESCE(cd.end_corredor,''000'')||''.''||'+
//             ' COALESCE(cd.end_prateleira,''000'')||''.''||COALESCE(cd.end_gaveta,''0000'') Enderecamento'+
//             ' FROM ES_ESTOQUES_LOJAS lo'+
//             '      LEFT JOIN PRODUTO        pr  ON pr.codproduto=lo.cod_produto'+
//             '      LEFT JOIN ES_ESTOQUES_CD cd  ON cd.dta_movto=lo.dta_movto'+
//             '                                  AND cd.cod_produto=lo.cod_produto'+
//             ' WHERE lo.dta_movto=CURRENT_DATE'+
//             ' AND   lo.ind_transf='+QuotedStr('SIM')+
//             ' AND   lo.num_docto='+QuotedStr(DMTransferencias.CDS_BuscaRapida.FieldByName('Num_Docto').AsString)+
//             ' AND   lo.cod_loja='+QuotedStr(DMTransferencias.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString)+
//             ' ORDER BY 4,3';
      MySql:=' SELECT lo.num_seq, lo.cod_produto, TRIM(pr.nome) nome_produto,'+
             ' COALESCE(cd.end_zona,99)||''.''||COALESCE(cd.end_corredor,''999'')||''.''||'+
             ' COALESCE(cd.end_prateleira,''999'')||''.''||COALESCE(cd.end_gaveta,''9999'') Enderecamento'+
             ' FROM ES_ESTOQUES_LOJAS lo'+
             '      LEFT JOIN LINXPRODUTOS   pr  ON pr.cod_auxiliar=lo.cod_produto'+
             '      LEFT JOIN ES_ESTOQUES_CD cd  ON cd.dta_movto=lo.dta_movto'+
             '                                  AND cd.cod_produto=lo.cod_produto'+
             ' WHERE lo.dta_movto=CURRENT_DATE'+
             ' AND   lo.ind_transf='+QuotedStr('SIM')+
             ' AND   lo.num_docto='+QuotedStr(DMTransferencias.CDS_BuscaRapida.FieldByName('Num_Docto').AsString)+
             ' AND   lo.cod_loja='+QuotedStr(DMTransferencias.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString)+
             ' ORDER BY 4,3';
      DMTransferencias.CDS_Busca.Close;
      DMTransferencias.SDS_Busca.CommandText:=MySql;
      DMTransferencias.CDS_Busca.Open;

      i:=0;
      While Not DMTransferencias.CDS_Busca.Eof do
      Begin
        Inc(i);

        MySql:=' UPDATE ES_ESTOQUES_LOJAS lo'+
               ' SET lo.num_seq='+IntToStr(i)+
               ' WHERE lo.dta_movto=CURRENT_DATE'+
               ' AND   lo.num_docto='+QuotedStr(DMTransferencias.CDS_BuscaRapida.FieldByName('Num_Docto').AsString)+
               ' AND   lo.cod_loja='+QuotedStr(DMTransferencias.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString)+
               ' AND   lo.num_seq='+DMTransferencias.CDS_Busca.FieldByName('Num_Seq').AsString+
               ' AND   lo.cod_produto='+QuotedStr(DMTransferencias.CDS_Busca.FieldByName('cod_produto').AsString);
        DMTransferencias.SQLC.Execute(MySql,nil,nil);

        DMTransferencias.CDS_Busca.Next;
      End; // While Not DMTransferencias.CDS_Busca.Eof do
      DMTransferencias.CDS_Busca.Close;

      DMTransferencias.CDS_BuscaRapida.Next;
    End; // While Not DMTransferencias.CDS_BuscaRapida.Eof do
    DMTransferencias.CDS_BuscaRapida.Close;

    // Encerra Transa��o =======================================================
    DMTransferencias.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    Result:=True;
  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMTransferencias.CDS_EstoqueLoja.CancelUpdates;
      DMTransferencias.SQLC.Rollback(TD);

      Result:=False;

      DateSeparator:='/';
      DecimalSeparator:=',';

      bgArqErros:=True;
      tgArqErros.Add('AnalisaAtualizaTransferencias: '+sCodLoja+' - '+e.message);
    End; // on e : Exception do
  End; // Try
  DMTransferencias.CDS_EstoqueLoja.Close;

End; // Analisa e Atualiza Transferencias do Dia >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Produto e Demanda >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmTransferencias.BuscaProdutosDemanda(sCodLoja, sCodProduto, sSaldo: String): Boolean;
Var
  MySql: String;
  sCurva, sDiasEstocagem, sEstMinimo, sEstMaximo: String;
Begin
  Result:=True;

  sCurva        :=DMTransferencias.CDS_CurvasLojaIND_CURVA.AsString;
  sDiasEstocagem:=DMTransferencias.CDS_CurvasLojaDIAS_ESTOCAGEM.AsString;

  sEstMinimo:='0';
  If Trim(DMTransferencias.CDS_CurvasLojaEST_MINIMO.AsString)<>'' Then
   sEstMinimo:=DMTransferencias.CDS_CurvasLojaEST_MINIMO.AsString;

  sEstMaximo:='0';
  If Trim(DMTransferencias.CDS_CurvasLojaEST_MAXIMO.AsString)<>'' Then
   sEstMaximo:=DMTransferencias.CDS_CurvasLojaEST_MAXIMO.AsString;

// OdirApagar - 19/10/2018 - Quantidades Inteiras
//  sEstMinimo:=f_Troca(',','.',ZerosCentavos(sEstMinimo,2));
//  sEstMaximo:=f_Troca(',','.',ZerosCentavos(sEstMaximo,2));
//  sSaldo    :=f_Troca(',','.',ZerosCentavos(sSaldo,2));
  sEstMinimo:=IntToStr(ParteInteiro(sEstMinimo));
  sEstMaximo:=IntToStr(ParteInteiro(sEstMaximo));;
  sSaldo    :=IntToStr(ParteInteiro(sSaldo));;

  MySql:=' SELECT'+
         ' CAST(GEN_ID(GEN_ODIR,1) AS INTEGER) Num_Seq,'+
         ' CURRENT_DATE DTA_MOVTO, '+
         sgNrDocto+' NUM_DOCTO, '+
         QuotedStr(sCodLoja)+' COD_LOJA,'+
         ' dm.codproduto COD_PRODUTO, '+
         sEstMinimo+' EST_MINIMO, '+
         sEstMaximo+' EST_MAXIMO, '+
         sSaldo+' QTD_ESTOQUE,'+
         ' SUM(COALESCE(dm.quant_ref,0.00)) QTD_VENDAS, '+
         QuotedStr(sCurva)+' IND_CURVA, '+
         sDiasEstocagem+' DIAS_ESTOCAGEM, '+
         IntToStr(igDiasUteis)+' QTD_DIAS,'+
         ' ((SUM(COALESCE(dm.quant_ref,0.00)))/'+IntToStr(igDiasUteis)+') QTD_VENDA_DIA,'+

         ' CAST(((((SUM(COALESCE(dm.quant_ref,0.00)))/'+IntToStr(igDiasUteis)+')) * '+sDiasEstocagem+') AS INTEGER) QTD_DEMANDA,'+ // Quantidade em Dias de Estocagem

         ' CAST(CASE'+ // Quando Demanda Menor Que Estoque Minimo Vale Estoque Minimo
         '        WHEN (CAST(((((SUM(COALESCE(dm.quant_ref,0.00)))/'+IntToStr(igDiasUteis)+')) * '+sDiasEstocagem+') AS INTEGER))>='+sEstMinimo+' Then'+
         '          ((((((SUM(COALESCE(dm.quant_ref,0.00)))/'+IntToStr(igDiasUteis)+')) * '+sDiasEstocagem+') - '+sSaldo+'))'+
         '        ELSE '+
                    sEstMinimo+' - '+sSaldo+
         ' END AS INTEGER) QTD_REPOSICAO,'+ // Quantidade de Reposi��o

         ' 0.00 QTD_TRANSF,'+
         ' 0.00 QTD_A_TRANSF,'+
         ' ''000000'' NUM_PEDIDO,'+
         ' ''CAL'' IND_TRANSF,'+
         ' 0 USU_ALTERA,'+
         ' CURRENT_TIMESTAMP DTA_ALTERA,'+
         ' 0 NUM_TR_GERADA,'+
         ' 0.00 QTD_TRANSF_OC,'+
         ' '' '' OBS_DOCTO,'+
         ' ''0010000'' CODGRUPOSUB'+

         ' FROM  MOVTOS_EMPRESAS dm'+
         ' WHERE dm.ind_tipo=''DM'''+
         ' AND   dm.dta_ref>='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(PrimUltDia(dgDtaInicio,'P')))))+
         ' AND   dm.dta_ref<='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(dgDtaFim))))+
         ' AND   dm.codfilial='+QuotedStr(sCodLoja)+
         ' AND   dm.codproduto='+QuotedStr(sCodProduto)+

         ' GROUP BY 5,25'+

         ' HAVING CAST((CASE'+ // Quando Demanda Menor Que Estoque Minimo Vale Estoque Minimo
         '               WHEN (CAST(((((SUM(COALESCE(dm.quant_ref,0.00)))/'+IntToStr(igDiasUteis)+')) * '+sDiasEstocagem+') AS INTEGER))>='+sEstMinimo+' Then'+
         '                 ((((((SUM(COALESCE(dm.quant_ref,0.00)))/'+IntToStr(igDiasUteis)+')) * '+sDiasEstocagem+') - '+sSaldo+'))'+
         '               ELSE '+
                           sEstMinimo+' - '+sSaldo+
         '            END) AS INTEGER)>0';
  Try
    DMTransferencias.CDS_ProdutoDemanda.Close;
    DMTransferencias.SDS_ProdutoDemanda.CommandText:=MySql;
    DMTransferencias.CDS_ProdutoDemanda.Open;

    If DMTransferencias.CDS_ProdutoDemanda.Eof Then
    Begin
      Result:=False;
      DMTransferencias.CDS_ProdutoDemanda.Close;
    End;
  Except
    SalvaProcessamento('ERRO: '+MySql);
  End
end; // Busca Produto e Demanda >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Produtos das Curvas da Loja >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmTransferencias.BuscaProdutosCurvas(sCodLoja: String);
Var
  MySql, sDta: String;
  bCurvaC:Boolean;
Begin
  // Verifica se tem Curva C ===================================================
  bCurvaC:=False;
  If Pos('C', sgCurvas)<>0 Then
   bCurvaC:=True;

  sDta:=f_Troca('/','.',f_Troca('-','.',DateToStr(dgDtaInicio)));

//OdirSemSIDICOM - 07/05/2019
//  // Monta Select ==============================================================
//  MySql:=' SELECT p.codproduto cod_produto,'+
//
//         ' CASE';
//
//         If bCurvaC Then
//          MySql:=
//           MySql+'    WHEN ((p.datainclusao>='+QuotedStr(sDta)+') AND (c.ind_curva in (''D'',''E''))) OR'+
//                 // Manuela
//                 '         ((p.principalfor='+QuotedStr('000356')+') AND (c.ind_curva in (''D'',''E'')) AND (p.apresentacao like ''%YELLOW%'')) OR'+
//                 '         ((p.principalfor='+QuotedStr('001188')+') AND (c.ind_curva in (''D'',''E'')) AND (p.apresentacao like ''NG %'')) OR'+
//                 '         ((p.principalfor='+QuotedStr('000677')+') AND (c.ind_curva in (''D'',''E''))) THEN'
//         Else
//          MySql:=
//           MySql+'    WHEN (p.datainclusao>='+QuotedStr(sDta)+') AND (c.ind_curva in (''D'',''E'')) THEN';
//
//  MySql:=
//   MySql+'     ''C'''+
//         '    ELSE'+
//         '     c.ind_curva'+
//         ' END ind_curva,'+
//
//         ' CAST(COALESCE(c.est_minimo,0) AS INTEGER) est_minimo,'+
//         ' CAST(COALESCE(c.est_maximo,0) AS INTEGER) est_maximo,'+
//
//         ' CAST(COALESCE(t.vlr_aux,0) AS INTEGER) Dias_Estocagem,'+
//         ' CAST(COALESCE(e.saldoatual,0.00) AS INTEGER) saldoatual,'+
//
//         ' p.datainclusao, p.dataalteracao'+
//
//         ' FROM PRODUTO p'+
//         '        LEFT JOIN ES_FINAN_CURVA_ABC c  ON c.cod_produto=p.codproduto'+
//         '        LEFT JOIN ESTOQUE e             ON e.codfilial=c.cod_loja'+
//         '                                       AND e.codproduto=p.codproduto'+
//         '        LEFT JOIN TAB_AUXILIAR t  ON CASE';
//
//         If bCurvaC Then
//          MySql:=
//           MySql+'                               WHEN ((p.datainclusao>'+QuotedStr(sDta)+') AND (c.ind_curva in (''D'',''E''))) OR'+
//                 // Manuela
//                 '                                    ((p.principalfor='+QuotedStr('000356')+') AND (c.ind_curva in (''D'',''E'')) AND (p.apresentacao like ''%YELLOW%'')) OR'+
//                 '                                    ((p.principalfor='+QuotedStr('001188')+') AND (c.ind_curva in (''D'',''E'')) AND (p.apresentacao like ''NG %'')) OR'+
//                 '                                    ((p.principalfor='+QuotedStr('000677')+') AND (c.ind_curva in (''D'',''E''))) THEN 3'
//         Else
//          MySql:=
//           MySql+'                               WHEN (p.datainclusao>'+QuotedStr(sDta)+') AND (c.ind_curva in (''D'',''E'')) THEN 3';
//
//  MySql:=
//   MySql+'                                       WHEN c.ind_curva=''A'' THEN 1'+
//         '                                       WHEN c.ind_curva=''B'' THEN 2'+
//         '                                       WHEN c.ind_curva=''C'' THEN 3'+
//         '                                       WHEN c.ind_curva=''D'' THEN 4'+
//         '                                       WHEN c.ind_curva=''E'' THEN 5'+
//         '                                     END=t.cod_aux'+
//         '                                 AND t.tip_aux=2'+ // 2 => Curva ABC
//
//         ' WHERE CAST(COALESCE(c.est_minimo,0) AS INTEGER)>0'+
//         ' AND   e.saldoatual>=0'+
//         ' AND   c.cod_loja='+QuotedStr(sCodLoja);
//
//         If bCurvaC Then
//          MySql:=
//           MySql+' AND   ((c.ind_curva in ('+sgCurvas+')) OR (p.datainclusao>='+QuotedStr(sDta)+')'+ // ' AND c.ind_curva=''E'')'+
//                 '         OR'+ // Manuela
//                 '        ((p.principalfor='+QuotedStr('000356')+') AND (c.ind_curva in (''D'',''E'')) AND (p.apresentacao like ''%YELLOW%''))'+
//                 '         OR'+
//                 '        ((p.principalfor='+QuotedStr('000677')+') AND (c.ind_curva in (''D'',''E'')))'+
//                 '         OR'+
//                 '        ((p.principalfor='+QuotedStr('001188')+') AND (c.ind_curva in (''D'',''E'')) AND (p.apresentacao like ''NG %'')))'
//         Else
//          MySql:=
//           MySql+' AND     ((c.ind_curva in ('+sgCurvas+')) OR (p.datainclusao>='+QuotedStr(sDta)+'))'+ // ' AND c.ind_curva=''E''))'+
//                 // Manuela
//                 ' AND NOT (((p.principalfor='+QuotedStr('000356')+') AND (c.ind_curva in (''D'',''E'')) AND (p.apresentacao like ''%YELLOW%''))'+
//                 '           OR'+
//                 '          ((p.principalfor='+QuotedStr('000677')+') AND (c.ind_curva in (''D'',''E'')))'+
//                 '           OR'+
//                 '          ((p.principalfor='+QuotedStr('001188')+') AND (c.ind_curva in (''D'',''E'')) AND (p.apresentacao like ''NG %'')))';
//  MySql:=
//   MySql+' AND EXISTS (SELECT 1'+
//         '             FROM LINXPRODUTOS pl'+
//         '             WHERE pl.cod_auxiliar=p.codproduto'+
//         '             AND   pl.desativado=''N'''+
//         '             AND   pl.id_linha<>33'+     // Brindes
//         '             AND   pl.id_colecao<>294'+
//         '             AND   pl.id_colecao<>197)'+ // Brindes
//
//         ' ORDER BY p.codproduto';

  // Monta Select ==============================================================
  MySql:=' SELECT'+
         ' c.cod_produto cod_produto,'+
         ' p.cod_produto cod_prod_linx,'+

         ' CASE';

         If bCurvaC Then
          MySql:=
           MySql+'    WHEN ((CAST(p.dt_inclusao AS DATE)>='+QuotedStr(sDta)+') AND (c.ind_curva in (''D'',''E''))) OR'+
                 // Manuela
                 '         ((p.cod_fornecedor=594) AND (c.ind_curva in (''D'',''E'')) AND (UPPER(p.nome) like ''%YELLOW%'')) OR'+
                 '         ((p.cod_fornecedor=479) AND (c.ind_curva in (''D'',''E'')) AND (UPPER(p.nome) like ''NG %'')) OR'+
                 '         ((p.cod_fornecedor=844) AND (c.ind_curva in (''D'',''E''))) THEN'
         Else
          MySql:=
           MySql+'    WHEN (CAST(p.dt_inclusao AS DATE)>='+QuotedStr(sDta)+') AND (c.ind_curva in (''D'',''E'')) THEN';

  MySql:=
   MySql+'     ''C'''+
         '    ELSE'+
         '     c.ind_curva'+
         ' END ind_curva,'+

         ' CAST(COALESCE(c.est_minimo,0) AS INTEGER) est_minimo,'+
         ' CAST(COALESCE(c.est_maximo,0) AS INTEGER) est_maximo,'+

         ' CAST(COALESCE(t.vlr_aux,0) AS INTEGER) Dias_Estocagem,'+
         ' CAST(COALESCE(e.quantidade,0.00) AS INTEGER) saldoatual,'+

         ' CAST(p.dt_inclusao AS DATE) datainclusao,'+
         ' CAST(p.dt_update AS DATE) dataalteracao'+

         ' FROM ES_FINAN_CURVA_ABC c'+
         '        LEFT JOIN LINXPRODUTOS p          ON p.cod_produto=c.cod_prod_linx'+
         '        LEFT JOIN LINXPRODUTOSDETALHES e  ON e.cod_loja=c.cod_loja'+
         '                                         AND e.cod_produto=c.cod_prod_linx'+
         '        LEFT JOIN TAB_AUXILIAR t  ON CASE';

         If bCurvaC Then
          MySql:=
           MySql+'                               WHEN ((CAST(p.dt_inclusao AS DATE)>'+QuotedStr(sDta)+') AND (c.ind_curva in (''D'',''E''))) OR'+
                 // Manuela
                 '                                    ((p.cod_fornecedor=594) AND (c.ind_curva in (''D'',''E'')) AND (UPPER(p.nome) like ''%YELLOW%'')) OR'+
                 '                                    ((p.cod_fornecedor=479) AND (c.ind_curva in (''D'',''E'')) AND (UPPER(p.nome) like ''NG %'')) OR'+
                 '                                    ((p.cod_fornecedor=844) AND (c.ind_curva in (''D'',''E''))) THEN 3'
         Else
          MySql:=
           MySql+'                               WHEN (CAST(p.dt_inclusao AS DATE)>'+QuotedStr(sDta)+') AND (c.ind_curva in (''D'',''E'')) THEN 3';

  MySql:=
   MySql+'                                       WHEN c.ind_curva=''A'' THEN 1'+
         '                                       WHEN c.ind_curva=''B'' THEN 2'+
         '                                       WHEN c.ind_curva=''C'' THEN 3'+
         '                                       WHEN c.ind_curva=''D'' THEN 4'+
         '                                       WHEN c.ind_curva=''E'' THEN 5'+
         '                                     END=t.cod_aux'+
         '                                 AND t.tip_aux=2'+ // 2 => Curva ABC

         ' WHERE CAST(COALESCE(c.est_minimo,0) AS INTEGER)>0'+
         ' AND   e.quantidade>=0'+ // N�o Roda Produtos Negativos
         ' AND   c.cod_loja='+QuotedStr(sCodLoja);

         If bCurvaC Then
          MySql:=
           MySql+' AND   ((c.ind_curva in ('+sgCurvas+')) OR (CAST(p.dt_inclusao AS DATE)>='+QuotedStr(sDta)+')'+ // ' AND c.ind_curva=''E'')'+
                 '         OR'+ // Manuela
                 '        ((p.cod_fornecedor=594) AND (c.ind_curva in (''D'',''E'')) AND (UPPER(p.nome) like ''%YELLOW%''))'+
                 '         OR'+
                 '        ((p.cod_fornecedor=844) AND (c.ind_curva in (''D'',''E'')))'+
                 '         OR'+
                 '        ((p.cod_fornecedor=479) AND (c.ind_curva in (''D'',''E'')) AND (UPPER(p.nome) like ''NG %'')))'
         Else
          MySql:=
           MySql+' AND     ((c.ind_curva in ('+sgCurvas+')) OR (CAST(p.dt_inclusao AS DATE)>='+QuotedStr(sDta)+'))'+ // ' AND c.ind_curva=''E''))'+
                 // Manuela
                 ' AND NOT (((p.cod_fornecedor=594) AND (c.ind_curva in (''D'',''E'')) AND (UPPER(p.nome) like ''%YELLOW%''))'+
                 '           OR'+
                 '          ((p.cod_fornecedor=844) AND (c.ind_curva in (''D'',''E'')))'+
                 '           OR'+
                 '          ((p.cod_fornecedor=479) AND (c.ind_curva in (''D'',''E'')) AND (UPPER(p.nome) like ''NG %'')))';
  MySql:=
   MySql+' AND   p.id_setor NOT IN (17, 20, 25)'+ // 17-IMOBILIZADOS 20-MOVEIS SAL�O 25-USO E CONSUMO
         ' AND   p.id_linha NOT IN (33)'+ //  33-Brindes
         // ' AND   p.id_colecao NOT IN (197)'+ // 197-DESCONTINUADOS
         ' AND   p.id_colecao NOT IN (294, 587)'+ // 294-BRINDE 587-KIDS
         ' AND   p.cod_fornecedor NOT IN ('+sgFornNAO+')'+
         ' AND   p.desativado=''N'''+

         ' ORDER BY 1';
  DMTransferencias.CDS_CurvasLoja.Close;
  DMTransferencias.SDS_CurvasLoja.CommandText:=MySql;
  DMTransferencias.CDS_CurvasLoja.Open;
End; // Busca Produtos das Curvas da Loja >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Monta Curvas da Loja >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmTransferencias.MontaCurvas(sCodLoja: String);
Var
  MySql: String;
Begin
  sgCurvas:='';

  MySql:=' SELECT'+
         ' SUBSTRING(t.des_aux FROM 1  FOR 3) Ind_Curva_A,'+
         ' SUBSTRING(t.des_aux FROM 5  FOR 3) Ind_Curva_B,'+
         ' SUBSTRING(t.des_aux FROM 9  FOR 3) Ind_Curva_C,'+
         ' SUBSTRING(t.des_aux FROM 13 FOR 3) Ind_Curva_D,'+
         ' SUBSTRING(t.des_aux FROM 17 FOR 3) Ind_Curva_E'+
         ' FROM TAB_AUXILIAR t'+
         ' WHERE t.tip_aux='+IntToStr(igDiaSemana)+
         ' AND   t.cod_aux='+sCodLoja;
  DMTransferencias.CDS_BuscaRapida.Close;
  DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
  DMTransferencias.CDS_BuscaRapida.Open;

  If DMTransferencias.CDS_BuscaRapida.FieldByName('Ind_Curva_A').AsString='SIM' Then
   sgCurvas:=QuotedStr('A');

  If DMTransferencias.CDS_BuscaRapida.FieldByName('Ind_Curva_B').AsString='SIM' Then
  Begin
    If sgCurvas='' Then
     sgCurvas:=QuotedStr('B')
    Else
     sgCurvas:=sgCurvas+', '+QuotedStr('B');
  End;

  If DMTransferencias.CDS_BuscaRapida.FieldByName('Ind_Curva_C').AsString='SIM' Then
  Begin
    If sgCurvas='' Then
     sgCurvas:=QuotedStr('C')
    Else
     sgCurvas:=sgCurvas+', '+QuotedStr('C');
  End;

  If DMTransferencias.CDS_BuscaRapida.FieldByName('Ind_Curva_D').AsString='SIM' Then
  Begin
    If sgCurvas='' Then
     sgCurvas:=QuotedStr('D')
    Else
     sgCurvas:=sgCurvas+', '+QuotedStr('D');
  End;

  If DMTransferencias.CDS_BuscaRapida.FieldByName('Ind_Curva_E').AsString='SIM' Then
  Begin
    If sgCurvas='' Then
     sgCurvas:=QuotedStr('E')
    Else
     sgCurvas:=sgCurvas+', '+QuotedStr('E');
  End;
  DMTransferencias.CDS_BuscaRapida.Close;
End; // Monta Curvas da Loja >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Produtos das Lojas/Calcula Necessidade de Compras >>>>>>>>>>>>>>>>>>>>>
Function  TFrmTransferencias.BuscaProdutosLojas: Boolean;
Var
  ii, i: Integer;
  MySql: String;

  sCodProdSidi, sCodProdLinx,
  sCodLoja, sCodEmpLinx: String;

  cQtdSaldo, cQtdMais: Currency;

  bConetada, bSiga, bNaoExiste: Boolean;
Begin
  Result:=True;

  //============================================================================
  // Busca Produtos do CD ======================================================
  //============================================================================
  MySql:=' SELECT *'+
         ' FROM ES_ESTOQUES_CD ec'+
         ' WHERE ec.dta_movto='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(dgDtaHoje))))+
         ' ORDER BY ec.cod_produto';
  DMTransferencias.CDS_EstoqueCD.Close;
  DMTransferencias.SDS_EstoqueCD.CommandText:=MySql;
  DMTransferencias.CDS_EstoqueCD.Open;
  //============================================================================
  SalvaProcessamento('10.01/999 - Busca Produtos do CD - '+TimeToStr(Time));
  //============================================================================

  //============================================================================
  // Abre ClientDataSet para Inclusao de Produtos da Loja ======================
  //============================================================================
  MySql:=' SELECT *'+
         ' FROM ES_ESTOQUES_LOJAS el'+
         ' WHERE el.cod_produto<''''';
  DMTransferencias.CDS_EstoqueLoja.Close;
  DMTransferencias.SDS_EstoqueLoja.CommandText:=MySql;
  DMTransferencias.CDS_EstoqueLoja.Open;
  //============================================================================
  SalvaProcessamento('10.02/999 - Abre ClientDataSet para Inclusao de Produtos da Loja - '+TimeToStr(Time));
  //============================================================================

  //============================================================================
  SalvaProcessamento('10.03/999 - PROCESSAMENTO DAS LOJAS - INICIO - '+TimeToStr(Time));
  //============================================================================
  For i:=0 to mgMemo.Lines.Count-1 do
  Begin
    sCodLoja:=Trim(mgMemo.Lines[i]);

    //==========================================================================
    // Calcula Dias �teis da Loja ==============================================
    //==========================================================================
    MySql:=' SELECT em.ind_domingo'+
           ' FROM EMP_CONEXOES em'+
           ' WHERE em.cod_filial='+QuotedStr(sCodLoja);
    DMTransferencias.CDS_BuscaRapida.Close;
    DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
    DMTransferencias.CDS_BuscaRapida.Open;
    bgTrabDomingo:=(Trim(DMTransferencias.CDS_BuscaRapida.FieldByName('Ind_Domingo').AsString)='S');
    DMTransferencias.CDS_BuscaRapida.Close;
    igDiasUteis:=DiasUteisBelShop(dgDtaInicio, dgDtaFim, bgTrabDomingo, True);
    // Calcula Dias �teis da Loja ==============================================
    //==========================================================================

    //==========================================================================
    // Busca Numero do Docto e Num_Seq =========================================
    //==========================================================================
    MySql:=' SELECT l.Num_Docto Nr_Docto, COALESCE(MAX(l.num_seq) ,1) NumSeq'+
           ' FROM ES_ESTOQUES_LOJAS l'+
           ' WHERE l.dta_movto=CURRENT_DATE'+
           ' AND   l.cod_loja='+QuotedStr(sCodLoja)+
           ' GROUP BY 1';
    DMTransferencias.CDS_BuscaRapida.Close;
    DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
    DMTransferencias.CDS_BuscaRapida.Open;

    sgNrDocto:=Trim(DMTransferencias.CDS_BuscaRapida.FieldByName('Nr_Docto').AsString);

    // Se Documento da Loja Existe =============================================
    If Trim(sgNrDocto)<>'' Then
    Begin
      MySql:=' ALTER SEQUENCE GEN_ODIR RESTART WITH '+DMTransferencias.CDS_BuscaRapida.FieldByName('NumSeq').AsString;
      DMTransferencias.SQLC.Execute(MySql,nil,nil);
    End;
    DMTransferencias.CDS_BuscaRapida.Close;

    // Se Documento da Loja N�O Existe =========================================
    If Trim(sgNrDocto)='' Then
    Begin
      MySql:=' ALTER SEQUENCE GEN_ODIR RESTART WITH 0';
      DMTransferencias.SQLC.Execute(MySql,nil,nil);

      MySql:=' SELECT COALESCE(MAX(el.num_docto)+1 ,1) Nr_Docto'+
             ' FROM ES_ESTOQUES_LOJAS el';
      DMTransferencias.CDS_BuscaRapida.Close;
      DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
      DMTransferencias.CDS_BuscaRapida.Open;
      sgNrDocto:=DMTransferencias.CDS_BuscaRapida.FieldByName('Nr_Docto').AsString;
      DMTransferencias.CDS_BuscaRapida.Close;
    End; // If Trim(sgNrDocto)<>'' Then
    // Busca Numero do Docto e Num_Seq =========================================
    //==========================================================================

    //==========================================================================
    // Busca C�digo da Loja Linx ===============================================
    //==========================================================================
    MySql:=' SELECT COALESCE(e.cod_linx,0) cod_linx'+
           ' FROM EMP_CONEXOES e'+
           ' WHERE e.cod_filial='+QuotedStr(sCodLoja);
    DMTransferencias.CDS_BuscaRapida.Close;
    DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
    DMTransferencias.CDS_BuscaRapida.Open;
    igCodLojaLinx:=DMTransferencias.CDS_BuscaRapida.FieldByName('cod_linx').AsInteger;
    DMTransferencias.CDS_BuscaRapida.Close;
    // Busca C�digo da Loja Linx ===============================================
    //==========================================================================

    //==========================================================================
    // Monta Curvas da Loja ====================================================
    //==========================================================================
    MontaCurvas(sCodLoja);
    //==========================================================================
    SalvaProcessamento('10.03.01/999 - Monta Curvas da Loja - '+sCodLoja+' - '+TimeToStr(Time));
    //==========================================================================

    //==========================================================================
    // Busca Produtos das Curvas da Loja =======================================
    //==========================================================================
    BuscaProdutosCurvas(sCodLoja);
    //==========================================================================
    SalvaProcessamento('10.03.02/999 - Busca Produtos das Curvas da Loja - '+sCodLoja+' - '+TimeToStr(Time));
    //==========================================================================

//OdirSemSIDICOM - 07/05/2019
//    // Conecta Loja - SIDICOM ==================================================
//    bConetada:=False;
//    If igCodLojaLinx=0 Then // SIDICOM
//    Begin
//      If ConexaoEmpIndividual('IBDB_'+sCodLoja, 'IBT_'+sCodLoja, 'A') Then
//      Begin
//        bConetada:=True;
//        try
//          CriaQueryIB('IBDB_'+sCodLoja,'IBT_'+sCodLoja,IBQ_TR_Filial, True);
//        Except
//          bConetada:=False;
//        End;
//      End;
//      //========================================================================
//      SalvaProcessamento('10.03.03/999 - Conecta Loja - '+sCodLoja+' - '+TimeToStr(Time));
//      //========================================================================
//    End; // If igCodLojaLinx=0 Then // SIDICOM

    // Monta Transacao =========================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMTransferencias.SQLC.StartTransaction(TD);
    Try
      // Busca Codigo da Empresa - Linx ========================================
      MySql:=' SELECT em.Cod_Cli_Linx'+
             ' FROM EMP_CONEXOES em'+
             ' WHERE em.cod_filial='+QuotedStr(sCodLoja);
      DMTransferencias.CDS_BuscaRapida.Close;
      DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
      DMTransferencias.CDS_BuscaRapida.Open;
      sCodEmpLinx:=DMTransferencias.CDS_BuscaRapida.FieldByName('Cod_Cli_Linx').AsString;
      DMTransferencias.CDS_BuscaRapida.Close;

      //========================================================================
      SalvaProcessamento('10.04/999 - PROCESSA PRODUTOS SELECIONADOS DA LOJA - '+sCodLoja+' - INICIO - '+TimeToStr(Time));
      //========================================================================
      // PROCESSA PRODUTOS SELECIONADOS DA LOJA ================================
      While Not DMTransferencias.CDS_CurvasLoja.Eof do
      Begin
        sCodProdSidi:=DMTransferencias.CDS_CurvasLojaCOD_PRODUTO.AsString;
        sCodProdLinx:=DMTransferencias.CDS_CurvasLojaCOD_PROD_LINX.AsString;

        // Verifica se J� Existe em ES_ESTOQUES_LOJAS ==========================
        MySql:=' SELECT l.cod_produto'+
               ' FROM ES_ESTOQUES_LOJAS l'+
               ' WHERE l.dta_movto=CURRENT_DATE'+
               ' AND   l.cod_loja='+QuotedStr(sCodLoja)+
               ' AND   l.cod_produto='+QuotedStr(sCodProdSidi);
        DMTransferencias.CDS_BuscaRapida.Close;
        DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
        DMTransferencias.CDS_BuscaRapida.Open;
        bNaoExiste:=(DMTransferencias.CDS_BuscaRapida.FieldByName('Cod_Produto').AsString<>'');
        DMTransferencias.CDS_BuscaRapida.Close;

        If Not bNaoExiste Then
        Begin
          // Busca Transferencias/Vendas em Transito ===========================
          cQtdMais:=0;

          // Busca Tranferencias/Vendas do CD Para a Loja ===========
          // SIDICOM Coloquei no Fim ================================
          MySql:=' SELECT m.documento, m.cod_produto, m.quantidade'+
                 ' FROM LINXMOVIMENTO m'+
                 ' WHERE m.cancelado=''N'''+
                 ' AND   m.excluido=''N''';

                 // TIPO_TRANSACAO ----------------------------------
                 // 'T' = Transferencias
                 // 'Null' = Saida de Venda ou Entrada de Compra
                 if igCodLojaLinx=23 Then // Wenceslau - Venda
                  Begin
                    MySql:=
                     MySql+' AND   m.tipo_transacao IS NULL';
                  End
                 Else
                  Begin
                    MySql:=
                     MySql+' AND   m.tipo_transacao=''T''';
                  End;

          // OPERACAO ----------------------------------------
          // 'S' = Saida
          // 'E' = Entrada
          MySql:=
           MySql+' AND   m.operacao=''S'''+
                 ' AND   m.empresa = 2'+ // =============== Codigo da Loja Emitente ( BelShop CD )
                 ' AND   m.codigo_cliente='+sCodEmpLinx+ // Codigo da Empresa Destinat�rio
                 ' AND   m.data_documento>='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(IncDay(dgDtaHoje,-100)))))+
                 ' AND   m.cod_produto='+sCodProdLinx;
          DMTransferencias.CDS_Busca.Close;
          DMTransferencias.SDS_Busca.CommandText:=MySql;
          DMTransferencias.CDS_Busca.Open;

          While Not DMTransferencias.CDS_Busca.Eof do
          Begin
            MySql:=' SELECT FIRST 1 m.documento numero'+
                   ' FROM LINXMOVIMENTO m'+

                   ' WHERE m.cancelado=''N'''+
                   ' AND   m.excluido=''N''';

                   // TIPO_TRANSACAO ----------------------------------
                   // 'T' = Transferencias
                   // 'Null' = Saida de Venda ou Entrada de Compra
                   if igCodLojaLinx=23 Then // Wenceslau - Venda
                    Begin
                      MySql:=
                       MySql+' AND   m.tipo_transacao IS NULL';
                    End
                   Else
                    Begin
                      MySql:=
                       MySql+' AND   m.tipo_transacao=''T''';
                    End;

            // OPERACAO ----------------------------------------
            // 'S' = Saida
            // 'E' = Entrada
            MySql:=
             MySql+' AND   m.operacao=''E'''+
                   ' AND   m.empresa = '+IntToStr(igCodLojaLinx)+ // Codigo da Loja Emitente
                   ' AND   m.codigo_cliente=13'+ // ==============// Codigo da Empresa Destinat�rio ( BelShop CD )
                   ' AND   m.documento='+DMTransferencias.CDS_Busca.FieldByName('documento').AsString;
            DMTransferencias.CDS_BuscaRapida.Close;
            DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
            DMTransferencias.CDS_BuscaRapida.Open;
            If Trim(DMTransferencias.CDS_BuscaRapida.FieldByName('Numero').AsString)='' Then
            Begin
              cQtdMais:=
               cQtdMais + DMTransferencias.CDS_Busca.FieldByName('Quantidade').AsCurrency;
            End;
            DMTransferencias.CDS_BuscaRapida.Close;

            DMTransferencias.CDS_Busca.Next;
          End; // While Not IBQ_MPMS.Eof do
          DMTransferencias.CDS_Busca.Close;

//OdirSemSIDICOM - 07/05/2019
//          // Busca Saldo no Linx ===============================================
//          sgSaldoLinx:=Trim(BuscaSaldoLinx(sCodLoja,DMTransferencias.CDS_CurvasLojaCOD_PRODUTO.AsString));
//
//          // Atualiza o Saldo do Produto ------------------------------
//          If sgSaldoLinx<>'' Then
//           Begin
//             If StrToFloat(sgSaldoLinx)<0.00 Then
//              sgSaldoLinx:='0.00';
//
//             cQtdSaldo:= StrToCurr(f_Troca('.',',',sgSaldoLinx)) + cQtdMais;
//           End
//          Else
//           Begin
//             cQtdSaldo:=DMTransferencias.CDS_CurvasLojaSALDOATUAL.AsCurrency + cQtdMais;
//           End;

          // Atualiza o Saldo do Produto ------------------------------
          cQtdSaldo:=DMTransferencias.CDS_CurvasLojaSALDOATUAL.AsCurrency + cQtdMais;

          // Se Saldo Negativo Alterar para 0.00 <Zero> ==========================
          If cQtdSaldo<0 Then
           cQtdSaldo:=0.00;

          // Busca Demanda/Quantidade de Reposi��o --------------------
          If BuscaProdutosDemanda(sCodLoja, sCodProdSidi, IntToStr(ParteInteiro(CurrToStr(cQtdSaldo)))) Then
          Begin
            // Acerta Arredondamento para Maior Inteiro ---------------
            DMTransferencias.CDS_ProdutoDemanda.Edit;
            DMTransferencias.CDS_ProdutoDemandaQTD_REPOSICAO.AsInteger:=
                   Ceil(DMTransferencias.CDS_ProdutoDemandaQTD_REPOSICAO.AsFloat);
            DMTransferencias.CDS_ProdutoDemanda.Post;

            // Verifica se Tem Produto com Estoque no CD --------------
            If (DMTransferencias.CDS_EstoqueCD.Locate('COD_PRODUTO',sCodProdSidi,[])) Then
             Begin
               DMTransferencias.CDS_EstoqueLoja.Insert;
               For ii:=0 to DMTransferencias.CDS_ProdutoDemanda.FieldCount-1 do
               Begin
                 If AnsiUpperCase(DMTransferencias.CDS_ProdutoDemanda.Fields[ii].DisplayLabel)<>'CODGRUPOSUB' Then
                  DMTransferencias.CDS_EstoqueLoja.Fields[ii].Assign(DMTransferencias.CDS_ProdutoDemanda.Fields[ii]);
               End; // For ii:=0 to DMTransferencias.CDS_ProdutoDemanda.FieldCount-1 do
               DMTransferencias.CDS_EstoqueLoja.Post;

               // Atualiza Apply --------------------------------------
               DMTransferencias.CDS_EstoqueLoja.ApplyUpdates(0);
             End
            Else // If (DMTransferencias.CDS_EstoqueCD.Locate('COD_PRODUTO',sCodProdSidi,[]))Then
             Begin
               DateSeparator:='.';
               DecimalSeparator:='.';

               // Apresentar para o Compras
               MySql:=' INSERT INTO ES_ESTOQUES_SEM (COD_LOJA, DTA_MOVTO, COD_PRODUTO, QTD_ESTOQUE, IND_CURVA)'+
                      ' VALUES ('+
                      QuotedStr(DMTransferencias.CDS_ProdutoDemandaCOD_LOJA.AsString)+', '+
                      QuotedStr(DMTransferencias.CDS_ProdutoDemandaDTA_MOVTO.AsString)+', '+
                      QuotedStr(DMTransferencias.CDS_ProdutoDemandaCOD_PRODUTO.AsString)+', '+
                      QuotedStr(DMTransferencias.CDS_ProdutoDemandaQTD_REPOSICAO.AsString)+', '+
                      QuotedStr(DMTransferencias.CDS_ProdutoDemandaIND_CURVA.AsString)+')';
               DMTransferencias.SQLC.Execute(MySql,nil,nil);

               DateSeparator:='/';
               DecimalSeparator:=',';
             End; // If (DMTransferencias.CDS_EstoqueCD.Locate('COD_PRODUTO',sCodProdSidi,[]))Then
          End; // If BuscaProdutosDemanda(sCodLoja, sCodProdSidi, IntToStr(ParteInteiro(CurrToStr(cQtdSaldo)))) Then
          DMTransferencias.CDS_ProdutoDemanda.Close;
        End; // If Not bNaoExiste Then

        DMTransferencias.CDS_CurvasLoja.Next;
      End; // While Not DMTransferencias.CDS_CurvasLoja.Eof do
      DMTransferencias.CDS_CurvasLoja.Close;
      //========================================================================
      SalvaProcessamento('10.04/999 - PROCESSA PRODUTOS SELECIONADOS DA LOJA - '+sCodLoja+' - FIM - '+TimeToStr(Time));
      //========================================================================

      // Fecha Transacao =======================================================
      DMTransferencias.SQLC.Commit(TD);

      bgArqErros:=True;
      tgArqErros.Add('Loja Bel_'+sCodLoja+' Processada com SUCESSO em '+DateTimeToStr(DataHoraServidorFI(DMTransferencias.SDS_DtaHoraServidor)));
    Except
      on e : Exception do
      Begin
        Result:=False;

//OdirSemSIDICOM - 07/05/2019
//        IBQ_TR_Filial.Close;

        bgArqErros:=True;
        tgArqErros.Add('BuscaProdutosLojas: '+sCodLoja+' - '+e.message);

        DMTransferencias.SQLC.Rollback(TD);
        DMTransferencias.CDS_EstoqueLoja.CancelUpdates;
      End; // on e : Exception do
    End; // Try

//OdirSemSIDICOM - 07/05/2019
//    If bConetada Then
//     ConexaoEmpIndividual('IBDB_'+sCodLoja, 'IBT_'+sCodLoja, 'F');

  End; // For i:=0 to mgMemo.Lines.Count-1 do
  DMTransferencias.CDS_EstoqueCD.Close;
  DMTransferencias.CDS_EstoqueLoja.Close;
  //============================================================================
  SalvaProcessamento('10.03/999 - PROCESSAMENTO DAS LOJAS - FIM - '+TimeToStr(Time));
  //============================================================================

End; // Busca Produtos das Lojas/Calcula Necessidade de Compras >>>>>>>>>>>>>>>>

// Insere Produtos no CD >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmTransferencias.InsereProdutosCD: Boolean;
Var
  i: Integer;
  MySql: String;
Begin
  Result:=True;

//OdirSemSIDICOM
//  DMTransferencias.CDS_EstoqueCD.Open;

  // Verifica se Transa��o esta Ativa
  If DMTransferencias.SQLC.InTransaction Then
   DMTransferencias.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMTransferencias.SQLC.StartTransaction(TD);
  Try
    // Delete Estoque de Produtos do CD do Dia ----------------------
    MySql:=' DELETE FROM ES_ESTOQUES_CD ec'+
           ' WHERE ec.dta_movto='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(dgDtaHoje))));
    DMTransferencias.SQLC.Execute(MySql,nil,nil);

    // Delete Estoque de Produtos da Lojas do Dia -------------------
    MySql:=' DELETE FROM ES_ESTOQUES_LOJAS el'+
           ' WHERE el.dta_movto='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(dgDtaHoje))));
    DMTransferencias.SQLC.Execute(MySql,nil,nil);

    // Delete Estoque de Produtos do CD do Dia ----------------------
    MySql:=' DELETE FROM ES_ESTOQUES_SEM es'+
           ' WHERE es.dta_movto='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(dgDtaHoje))));
    DMTransferencias.SQLC.Execute(MySql,nil,nil);

//OdirSemSIDICOM
//    // Insere Estoque de Produtos do CD -----------------------------
//    DMTransferencias.SQLQ_Busca.First;
//    While not DMTransferencias.SQLQ_Busca.Eof do
//    Begin
//      DMTransferencias.CDS_EstoqueCD.Insert;
//      For i:=0 to DMTransferencias.SQLQ_Busca.FieldCount-1 do
//       DMTransferencias.CDS_EstoqueCD.Fields[i].Assign(DMTransferencias.SQLQ_Busca.Fields[i]);
//
//      DMTransferencias.CDS_EstoqueCD.Post;
//
//      DMTransferencias.SQLQ_Busca.Next;
//    End; // While not DMTransferencias.SQLQ_Busca.Eof do
//
//    // Atualiza Transacao ======================================================
//    DMTransferencias.CDS_EstoqueCD.ApplyUpdates(0);

  MySql:=' INSERT INTO ES_ESTOQUES_CD'+
         ' SELECT CURRENT_DATE DTA_MOVTO,'+
//         '        pr.cod_produto COD_PRODUTO,'+ // Codigo produto LINX
         '        pr.cod_auxiliar COD_PRODUTO,'+  // Codigo produto SIDICOM
         '        CAST(COALESCE(es.quantidade,0.00) AS NUMERIC(18,2)) QTD_ESTOQUE,'+
         '        0.00 QTD_SAIDAS,'+
         '        CAST(COALESCE(es.quantidade,0.00)  AS NUMERIC(18,2)) QTD_SALDO,'+
         '        COALESCE(en.zonaendereco,99) END_ZONA,'+
         '        COALESCE(en.corredor,''999'') END_CORREDOR,'+
         '        COALESCE(en.prateleira,''999'') END_PRATELEIRA,'+
         '        COALESCE(en.gaveta,''9999'') END_GAVETA'+

         ' FROM LINXPRODUTOSDETALHES es'+
         '     LEFT JOIN LINXPRODUTOS pr  ON pr.cod_produto=es.cod_produto'+
         '     LEFT JOIN PROD_ENDERECO en ON en.cod_produto=es.cod_produto'+
         ' WHERE pr.desativado=''N'''+
         ' AND   es.empresa=2'+ // Loja LINX
         ' AND   en.cod_linx=2'+ // Loja LINX
         ' AND   pr.id_setor NOT IN (17, 20, 25)'+  // 17-IMOBILIZADOS 20-MOVEIS SAL�O 25-USO E CONSUMO
         ' AND   pr.id_linha NOT IN (33)'+ // 33-Brindes
         //' AND   pr.id_colecao NOT IN (197)'+ // 197-DESCONTINUADOS
         ' AND   pr.id_colecao NOT IN (294, 587)'+ // 294-BRINDE 587-KIDS
         ' AND   CHAR_LENGTH(Trim(pr.cod_auxiliar))<7'+
         ' AND   pr.cod_auxiliar is not null'+
         ' AND   COALESCE(es.quantidade,0)>0'+
// Retirado por Solicita��o da ANNA - 27/05/2019
//         ' AND   pr.cod_fornecedor NOT IN ('+sgFornNAO+')'+

         ' ORDER BY 2';
    DMTransferencias.SQLC.Execute(MySql,nil,nil);

    DMTransferencias.SQLC.Commit(TD);
  Except           
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      //OdirSemSIDICOM
      //      DMTransferencias.CDS_EstoqueCD.CancelUpdates;

      DMTransferencias.SQLC.Rollback(TD);

      Result:=False;

      bgArqErros:=True;
      tgArqErros.Add('InsereProdutosCD: 99 - '+e.message);
      SalvaErros;
    End; // on e : Exception do
  End; // Try
//OdirSemSIDICOM
//  DMTransferencias.SQLQ_Busca.Close;
//  DMTransferencias.CDS_EstoqueCD.Close;

End; // Insere Produtos no CD >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//OdirSemSIDICOM - 07/05/2019
//// Busca Produtos no CD - Somente se Houver com Estoque > 0 >>>>>>>>>>>>>>>>>>>>
//Function TFrmTransferencias.BuscaProdutosCD: Boolean;
//Var
//  MySql: String;
//Begin
//  Result:=True;
////OdirSemSIDICOM - 07/05/2019
////  MySql:=' SELECT CURRENT_DATE DTA_MOVTO,'+
////         '        e.codproduto COD_PRODUTO,'+
////         '        CAST(COALESCE(e.saldoatual,0.00) AS NUMERIC(18,2)) QTD_ESTOQUE,'+
////         '        0.00 QTD_SAIDAS,'+
////         '        CAST(COALESCE(e.saldoatual,0.00)  AS NUMERIC(18,2)) QTD_SALDO,'+
////         '        COALESCE(e.zonaendereco,0) END_ZONA,'+
////         '        COALESCE(e.corredor,''000'') END_CORREDOR,'+
////         '        COALESCE(e.prateleira,''000'') END_PRATELEIRA,'+
////         '        COALESCE(e.gaveta,''0000'') END_GAVETA'+
////
////         ' FROM ESTOQUE e, PRODUTO p'+
////
////         ' WHERE e.codproduto=p.codproduto'+
////         ' AND   p.codaplicacao<>''0015'''+ // N�o Processa: 0015=E-Commerce
////         ' AND   p.codaplicacao<>''0016'''+ // N�o Processa: 0016=Brindes
////         ' AND   e.codfilial=''99'''+
////         ' AND   COALESCE(e.saldoatual,0)>0'+
////
////         ' ORDER BY 2';
////OdirSemSIDICOM - 07/05/2019
//  MySql:=' SELECT CURRENT_DATE DTA_MOVTO,'+
////         '        pr.cod_produto COD_PRODUTO,'+ // Codigo produto LINX
//         '        pr.cod_auxiliar COD_PRODUTO,'+  // Codigo produto SIDICOM
//         '        CAST(COALESCE(es.quantidade,0.00) AS NUMERIC(18,2)) QTD_ESTOQUE,'+
//         '        0.00 QTD_SAIDAS,'+
//         '        CAST(COALESCE(es.quantidade,0.00)  AS NUMERIC(18,2)) QTD_SALDO,'+
//         '        COALESCE(en.zonaendereco,99) END_ZONA,'+
//         '        COALESCE(en.corredor,''999'') END_CORREDOR,'+
//         '        COALESCE(en.prateleira,''999'') END_PRATELEIRA,'+
//         '        COALESCE(en.gaveta,''9999'') END_GAVETA'+
//
//         ' FROM LINXPRODUTOSDETALHES es'+
//         '     LEFT JOIN LINXPRODUTOS pr  ON pr.cod_produto=es.cod_produto'+
//         '     LEFT JOIN PROD_ENDERECO en ON en.cod_produto=es.cod_produto'+
//         ' WHERE CHAR_LENGTH(Trim(pr.cod_auxiliar))<7'+
//         ' AND   pr.cod_auxiliar is not null'+
//         ' AND   es.empresa=2'+ // Loja LINX
//         ' AND   en.cod_linx=2'+ // Loja LINX
//         ' AND   pr.id_setor NOT IN (17, 20, 25)'+  // 17-IMOBILIZADOS 20-MOVEIS SAL�O 25-USO E CONSUMO
//         ' AND   pr.id_linha NOT IN (33)'+ // 33-Brindes
//         ' AND   pr.id_colecao NOT IN (197, 294, 587)'+ // 197-DESCONTINUADO-CAMPANHA DE R$0,50 (Antigo N�o Compra) 294-BRINDE 587-KIDS
//         ' AND   COALESCE(es.quantidade,0)>0'+
//         ' AND   pr.cod_fornecedor NOT IN ('+sgFornNAO+')'+
//
//         'ORDER BY 2';
//  DMTransferencias.SQLQ_Busca.Close;
//  DMTransferencias.SQLQ_Busca.SQL.Clear;
//  DMTransferencias.SQLQ_Busca.SQL.Add(MySql);
//  DMTransferencias.SQLQ_Busca.Open;
//
//  If DMTransferencias.SQLQ_Busca.Eof Then
//   Result:=False;
//
//End; // Busca Produtos no CD - Somente se Houver com Estoque > 0 >>>>>>>>>>>>>>>

//==============================================================================
// ODIR - FIM ==================================================================
//==============================================================================

procedure TFrmTransferencias.FormCreate(Sender: TObject);
Var
  MySql: String;
  sDta, sNomeDia,
  sUsuarioWindows, sComputadorWindows: String;

  bFeriado: Boolean;
begin

  //============================================================================
  // Windows: Nome do Usuario, Computador e Data Hoje Sem Separadores =========
  //=============================================================================
  UsuarioComputadorWindows(sUsuarioWindows, sComputadorWindows);

//  hHrInicio:=TimeToStr(DataHoraServidorFI(DMTransferencias.SDS));

  // Data Hoje Sem Separadores
  sDta:=DateToStr(DataHoraServidorFI(DMTransferencias.SDS_DtaHoraServidor));
  sDta:=f_Troca('/','',f_Troca('.','',f_Troca('-','',sDta)));
  // Windows: Nome do Usuario, Computador e Data Hoje ==========================
  //============================================================================

  //============================================================================
  // VERIFICA SE DIA � FERIADO =================================================
  //============================================================================
  MySql:=' SELECT f.Dta_Feriado'+
         ' FROM FIN_FERIADOS_ANO f'+
         ' WHERE f.dta_feriado ='+QuotedStr(f_Troca('/','.',f_Troca('-','.',
                                  DateToStr(DataHoraServidorFI(DMTransferencias.SDS_DtaHoraServidor)))));
  DMTransferencias.CDS_BuscaRapida.Close;
  DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
  DMTransferencias.CDS_BuscaRapida.Open;
  bFeriado:=(DMTransferencias.CDS_BuscaRapida.FieldByName('Dta_Feriado').AsString<>'');
  DMTransferencias.CDS_BuscaRapida.Close;
  // VERIFICA SE DIA � FERIADO =================================================
  //============================================================================

  //============================================================================
  // Fechar Programa do Agendamento Anterior ===================================
  //============================================================================
  // ApagaUltProcesso('PCurvasDemandas.exe');
  // Fechar Programa do Agendamento Anterior ===================================
  //============================================================================

  //============================================================================
  // Monta Arquivo Texto de Status =============================================
  //============================================================================
  sgArqErros:=IncludeTrailingPathDelimiter(sgPath_Local+'Arquivo Status Transf');
  If (Trim(sgCompServer)<>Trim(sComputadorWindows)) And (Trim(sComputadorWindows)<>'ODIR-PC') Then
  Begin
    sgArqErros:=f_Troca('C:\','',sgArqErros);
    sgArqErros:='\\'+sgIPInternetServer+'\'+sgArqErros;
  End;

  sgPastaStatus:=IncludeTrailingPathDelimiter(sgArqErros);

  If not DirectoryExists(sgArqErros) then
   ForceDirectories(sgArqErros);

  // Monta Caminha para Arquivo de Status
  sgArqErros:=sgArqErros+'ErrosTransf_'+sDta+'.txt';

  DeleteFile(sgArqErros);

  bgArqErros:=False;
  tgArqErros:=TStringList.Create;
  // Monta Arquivo Texto de Status =============================================
  //============================================================================

  //============================================================================
  // N�O PROCESSA NO S�BADO, DOMINGO E FERIADOS ================================
  //============================================================================
  // Apartir de 10/11/2018 - Roda no S�bado se Houver Movimento
  //  If (sNomeDia='DOMINGO') Or (sNomeDia='S�BADO') Or (bFeriado) Then
  sNomeDia:=AnsiUpperCase(DiaSemanaNome(DataHoraServidorFI(DMTransferencias.SDS_DtaHoraServidor)));
  If (sNomeDia='DOMINGO') Or (bFeriado) Then
  Begin
    bgArqErros:=True;
    tgArqErros.Add('N�o Roda no Dia (Domingo ou Feriado): '+sNomeDia);
    SalvaErros;
    DeleteFile(PChar(sgPastaStatus+'Odir.txt'));

    Application.Terminate;
    Exit;
  End;
  // N�O PROCESSA NO S�BADO, DOMINGO E FERIADOS ================================
  //============================================================================

  //============================================================================
  // Tranca Separa��o no CD - Odir.txt =========================================
  //============================================================================
  CopyFile(PChar(sgPastaStatus+'@Odir.txt'), PChar(sgPastaStatus+'Odir.txt'), True);
  // Tranca Separa��o no CD ====================================================
  //============================================================================

  //============================================================================
  // Monta Arquivo Texto de Acompanhamento Processamento =======================
  //============================================================================
  sgArqProc:=IncludeTrailingPathDelimiter(sgPath_Local+'Arquivo Status Transf');
  If (Trim(sgCompServer)<>Trim(sComputadorWindows)) And (Trim(sComputadorWindows)<>'ODIR-PC') Then
  Begin
    sgArqProc:=f_Troca('C:\','',sgArqProc);
    sgArqProc:='\\'+sgIPInternetServer+'\'+sgArqProc;
  End;

  If not DirectoryExists(sgArqProc) then
   ForceDirectories(sgArqProc);

  sgArqProc:=sgArqProc+'Processamento_'+sDta+'.txt';

  DeleteFile(sgArqProc);

  tgArqProc:=TStringList.Create;
  // Monta Arquivo Texto de Acompanhamento Processamento =======================
  //============================================================================

//OdirSemSIDICOM - 07/05/2019
//  //============================================================================
//  // Testa Conex�o CD ==========================================================
//  //============================================================================
//  If Not DMTransferencias.ConectaMPMS Then
//  Begin
//    bgArqErros:=True;
//    tgArqErros.Add('Erro ao Conectar CD');
//    SalvaErros;
//    DeleteFile(PChar(sgPastaStatus+'Odir.txt'));
//
//    Application.Terminate;
//    Exit;
//  End;
//  // Testa Conex�o CD ==========================================================
//  //============================================================================

  //============================================================================
  // Fornecedores que N�o S�o Processados ======================================
  //============================================================================
//OdirSemSIDICOM - 07/05/2019
//  MySql:=' SELECT CAST(LPAD(t.cod_aux,6,0) AS VARCHAR(6)) Forn_Nao';
  MySql:=' SELECT t.cod_aux FORN_NAO'+
         ' FROM TAB_AUXILIAR t'+
         ' WHERE t.tip_aux=13'; // Fornecedores que N�O Entram no Calculo de Reposi��es Autom�ticas
  DMTransferencias.CDS_BuscaRapida.Close;
  DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
  DMTransferencias.CDS_BuscaRapida.Open;
  sgFornNAO:='';
  While Not DMTransferencias.CDS_BuscaRapida.Eof do
  Begin
    If Trim(sgFornNAO)='' Then
     sgFornNAO:=DMTransferencias.CDS_BuscaRapida.FieldByName('Forn_Nao').AsString
    Else
     sgFornNAO:=sgFornNAO+', '+DMTransferencias.CDS_BuscaRapida.FieldByName('Forn_Nao').AsString;

    DMTransferencias.CDS_BuscaRapida.Next;
  End; // While Not DMTransferencias.CDS_BuscaRapida.Eof do
  DMTransferencias.CDS_BuscaRapida.Close;

  // Fornecedores N�o Fornecedores no Cadastro =================================
//OdirSemSIDICOM - 07/05/2019
//  If Trim(sgFornNAO)='' Then
//   sgFornNAO:='''000300'', ''000500'', ''000883'', ''010000'', ''001072'''
//  Else
//   sgFornNAO:=sgFornNAO+', ''000300'', ''000500'', ''000883'', ''010000'', ''001072''';
  If Trim(sgFornNAO)='' Then
   sgFornNAO:='6, 1014, 260'
  Else
   sgFornNAO:=
    sgFornNAO+', 6, 1014, 260';
  // Fornecedores que N�o S�o Processados ======================================
  //============================================================================
  SalvaProcessamento('01/999 - Fornecedores que N�o S�o Processados - '+TimeToStr(Time));
  //============================================================================

  //============================================================================
  // Numero do Dia da Semana ===================================================
  //============================================================================
  igDiaSemana:=DayOfWeek(DataHoraServidorFI(DMTransferencias.SDS_DtaHoraServidor))+110;
  // Numero do Dia da Semana ===================================================
  //============================================================================

  //============================================================================
  // Busca Lojas do Dia ========================================================
  //============================================================================
  MySql:=' SELECT LPAD(t.cod_aux,2,''0'') COD_LOJA , e.razao_social, e.ind_domingo'+

         ' FROM TAB_AUXILIAR t, EMP_CONEXOES e'+

         ' WHERE LPAD(t.cod_aux,2,''0'') =e.cod_filial'+
         ' AND   t.tip_aux='+IntToStr(igDiaSemana)+
         ' AND   t.des_aux1='+QuotedStr('SIM')+

         ' ORDER BY'+
         ' e.ind_domingo,'+
         ' SUBSTRING(t.des_aux FROM 1  FOR 3) desc,'+
         ' SUBSTRING(t.des_aux FROM 5  FOR 3) desc,'+
         ' SUBSTRING(t.des_aux FROM 9  FOR 3) desc,'+
         ' SUBSTRING(t.des_aux FROM 13 FOR 3) desc,'+
         ' SUBSTRING(t.des_aux FROM 17 FOR 3) desc,'+
         ' LPAD(t.cod_aux,2,''0'')';
  DMTransferencias.CDS_Busca.Close;
  DMTransferencias.SDS_Busca.CommandText:=MySql;
  DMTransferencias.CDS_Busca.Open;

  If DMTransferencias.CDS_Busca.Eof Then
  Begin
    bgArqErros:=True;
    tgArqErros.Add('Sem Loja Para Processamento Autom�tico no Dia '+DateToStr(DataHoraServidorFI(DMTransferencias.SDS_DtaHoraServidor)));

    If (sNomeDia='S�BADO') Then
    Begin
      bgArqErros:=True;
      tgArqErros.Add('S�BADO N�o Roda Sem Loja Para Processamento Autom�tico no Dia '+DateToStr(DataHoraServidorFI(DMTransferencias.SDS_DtaHoraServidor)));
      SalvaErros;
      DeleteFile(PChar(sgPastaStatus+'Odir.txt'));

      Application.Terminate;
      Exit;
    End;
  End; // If DMTransferencias.CDS_Busca.Eof Then
  // Busca Lojas do Dia ========================================================
  //============================================================================
  SalvaProcessamento('02/999 - Busca Lojas do Dia - '+TimeToStr(Time));
  //============================================================================

  //============================================================================
  // Busca Percentuais de Cortes das Curvas ====================================
  //============================================================================
  MySql:=' SELECT cc.Cod_Aux, COALESCE(cc.des_aux1,''0'') PerCorte'+
         ' FROM TAB_AUXILIAR cc'+
         ' WHERE cc.Tip_Aux=2'+
         ' ORDER BY cc.Cod_Aux';
  DMTransferencias.CDS_BuscaRapida.Close;
  DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
  DMTransferencias.CDS_BuscaRapida.Open;
  igPer_CorteA:=0;
  igPer_CorteB:=0;
  igPer_CorteC:=0;
  igPer_CorteD:=0;
  igPer_CorteE:=0;
  While not DMTransferencias.CDS_BuscaRapida.Eof do
  Begin
    If DMTransferencias.CDS_BuscaRapida.FieldByName('Cod_Aux'). AsInteger=1 Then
     igPer_CorteA:=DMTransferencias.CDS_BuscaRapida.FieldByName('PerCorte').AsInteger;

    If DMTransferencias.CDS_BuscaRapida.FieldByName('Cod_Aux'). AsInteger=2 Then
     igPer_CorteB:=DMTransferencias.CDS_BuscaRapida.FieldByName('PerCorte').AsInteger;

    If DMTransferencias.CDS_BuscaRapida.FieldByName('Cod_Aux'). AsInteger=3 Then
     igPer_CorteC:=DMTransferencias.CDS_BuscaRapida.FieldByName('PerCorte').AsInteger;

    If DMTransferencias.CDS_BuscaRapida.FieldByName('Cod_Aux'). AsInteger=4 Then
     igPer_CorteD:=DMTransferencias.CDS_BuscaRapida.FieldByName('PerCorte').AsInteger;

    If DMTransferencias.CDS_BuscaRapida.FieldByName('Cod_Aux'). AsInteger=5 Then
     igPer_CorteE:=DMTransferencias.CDS_BuscaRapida.FieldByName('PerCorte').AsInteger;

    DMTransferencias.CDS_BuscaRapida.Next;
  End; // While not DMTransferencias.CDS_BuscaRapida.Eof do
  DMTransferencias.CDS_BuscaRapida.Close;
  // Busca Percentuais de Cortes das Curvas ====================================
  //============================================================================
  SalvaProcessamento('03/999 - Busca Percentuais de Cortes das Curvas - '+TimeToStr(Time));
  //============================================================================

  //============================================================================
  // Zera Sequencia para Novo Docto ============================================
  //============================================================================
  MySql:=' ALTER SEQUENCE GEN_ODIR RESTART WITH 0';
  DMTransferencias.SQLC.Execute(MySql,nil,nil);
  // Zera Sequencia para Novo Docto ============================================
  //============================================================================
  SalvaProcessamento('04/999 - Zera Sequencia para Novo Docto - '+TimeToStr(Time));
  //============================================================================

  //============================================================================
  // Cria Memo para Codigos de Lojas ===========================================
  //============================================================================
  mgMemo:=TMemo.Create(Self);
  mgMemo.Visible:=False;
  mgMemo.Parent:=FrmTransferencias;
  mgMemo.Width:=500;
  mgMemo.Lines.Clear;

  While Not DMTransferencias.CDS_Busca.Eof do
  Begin
    mgMemo.Lines.Add(DMTransferencias.CDS_Busca.FieldByName('Cod_Loja').AsString);

    DMTransferencias.CDS_Busca.Next;
  End; // While Not DMTransferencias.CDS_Busca.Eof do
  DMTransferencias.CDS_BuscaRapida.Close;
  // Cria Memo para Codigos de Lojas ===========================================
  //============================================================================
  SalvaProcessamento('05/999 - Cria Memo para Codigos de Lojas - '+TimeToStr(Time));
  //============================================================================

  //============================================================================
  // Monta Per�odo Para Calculo ================================================
  //============================================================================
  dgDtaHoje  :=DataHoraServidorFI(DMTransferencias.SDS_DtaHoraServidor);
  dgDtaInicio:=IncMonth(dgDtaHoje,-4);
  dgDtaInicio:=StrToDate(DateToStr(dgDtaInicio));
  dgDtaFim   :=dgDtaHoje;
  dgDtaFim   :=StrToDate(DateToStr(dgDtaFim));
  // Monta Per�odo Para Calculo ================================================
  //============================================================================
  SalvaProcessamento('06/999 - Calcula Dias do Per�odo - '+TimeToStr(Time));
  //============================================================================

//OdirSemSIDICOM - 07/05/2019
//  //============================================================================
//  // Conecta CD ================================================================
//  //============================================================================
//  If Not DMTransferencias.ConectaMPMS Then
//  Begin
//    bgArqErros:=True;
//    tgArqErros.Add('Erro ao Conectar CD');
//    SalvaErros;
//    DeleteFile(PChar(sgPastaStatus+'Odir.txt'));
//
//    Application.Terminate;
//    Exit;
//  End;
//  // Conecta CD ================================================================
//  //============================================================================
//  SalvaProcessamento('07/999 - Conecta CD - '+TimeToStr(Time));
//  //============================================================================

//OdirSemSIDICOM - 07/05/2019
//  //============================================================================
//  // Busca Produtos com Saldo no CD ============================================
//  //============================================================================
////OdirAqui 1.Inicio
//  If Not BuscaProdutosCD Then
//  Begin
//    DMTransferencias.SQLQ_Busca.Close;
//
//    bgArqErros:=True;
//    tgArqErros.Add('Erro - BuscaProdutosCD');
//    SalvaErros;
//    DeleteFile(PChar(sgPastaStatus+'Odir.txt'));
//
//    Application.Terminate;
//    Exit;
//  End;
////OdirAqui 1.Fim
//  // Busca Produtos com Saldo no CD ============================================
//  //============================================================================
//  SalvaProcessamento('08/999 - Busca Produtos com Saldo no CD - '+TimeToStr(Time));
//  //============================================================================

  //============================================================================
  // Insere Produtos do CD =====================================================
  // Deleta Tabelas do Dia: ES_ESTOQUES_CD / ES_ESTOQUES_LOJAS / ES_ESTOQUES_SEM
  //============================================================================
//OdirAqui 2.Inicio
  If Not InsereProdutosCD Then
  Begin
    bgArqErros:=True;
    tgArqErros.Add('Erro - InsereProdutosCD');
    SalvaErros;
    DeleteFile(PChar(sgPastaStatus+'Odir.txt'));

    Application.Terminate;
    Exit;
  End;
//OdirAqui 2.Fim
  // Insere Produtos do CD =====================================================
  //============================================================================
  SalvaProcessamento('09/999 - Insere Produtos do CD - '+TimeToStr(Time));
  //============================================================================

  //============================================================================
  SalvaProcessamento('00/999 - Roda Transferencias Solicitadas Pelas Lojas - INICIO - '+TimeToStr(Time));
  //============================================================================
  // Busca Solicita��es Efetuadas Pelas Lojas ==================================
  //============================================================================
//OdirAqui 3.Inicio
  If Not TransferenciasLojas Then
  Begin
    bgArqErros:=True;
    tgArqErros.Add('Erro - TransferenciasLojas');
    SalvaErros;
    DeleteFile(PChar(sgPastaStatus+'Odir.txt'));

    Application.Terminate;
    Exit;
  End;
//OdirAqui 3.Fim
  // Busca Solicita��es Efetuadas Pelas Lojas ==================================
  //============================================================================
   SalvaProcessamento('00/999 - Roda Transferencias Solicitadas Pelas Lojas - FIM - '+TimeToStr(Time));
  //============================================================================

  //============================================================================
  SalvaProcessamento('10/999 - Busca Produtos nas Lojas com Necessidade de Compras - INICIO - '+TimeToStr(Time));
  //============================================================================
  // Busca Produtos das Lojas com Necessidade de Compra ========================
  //============================================================================
//OdirAqui 4.Inicio
  If Not BuscaProdutosLojas Then
  Begin
    bgArqErros:=True;
    tgArqErros.Add('Erro - BuscaProdutosLojas');
    SalvaErros;
    DeleteFile(PChar(sgPastaStatus+'Odir.txt'));

    Application.Terminate;
    Exit;
  End;
//OdirAqui 4.Fim
  // Busca Produtos das Lojas com Necessidade de Compra ========================
  //============================================================================
  SalvaProcessamento('10/999 - Busca Produtos nas Lojas com Necessidade de Compras - FIM - '+TimeToStr(Time));
  //============================================================================

  //============================================================================
  SalvaProcessamento('11/999 - Analisa e Atualiza Transferencias do Dia - INICIO - '+TimeToStr(Time));
  //============================================================================
  // Analisa e Atualiza Necessitadades de Transferencias do Dia ================
  //============================================================================
//OdirAqui 5.Inicio
  If Not AnalisaAtualizaTransferencias Then
  Begin
    bgArqErros:=True;
    tgArqErros.Add('Erro - AnalisaAtualizaTransferencias');
    SalvaErros;
    DeleteFile(PChar(sgPastaStatus+'Odir.txt'));

    Application.Terminate;
    Exit;
  End;
//OdirAqui 5.Fim
  // Analisa e Atualiza Necessitadades de Transferencias do Dia ================
  //============================================================================
  SalvaProcessamento('11/999 - Analisa e Atualiza Transferencias do Dia - FIM - '+TimeToStr(Time));
  //============================================================================

  //============================================================================
   SalvaProcessamento('12/999 - Busca Transferencias de Dias Anteiroes e Novas do Setor de Compras - INICIO - '+TimeToStr(Time));
  //============================================================================
  // Busca Solicita��es das Lojas de Dias Anteiroes e Novas do Setor de Compras
  //============================================================================
//OdirAqui 6.Inicio
  If Not ProcessaTransferenciasCompras Then
  Begin
    bgArqErros:=True;
    tgArqErros.Add('Erro - ProcessaTransferenciasCompras');
    SalvaErros;
    DeleteFile(PChar(sgPastaStatus+'Odir.txt'));

    Application.Terminate;
    Exit;
  End;
//OdirAqui 6.Fim
  // Busca Solicita��es das Lojas de Dias Anteiroes e Novas do Setor de Compras
  //============================================================================
  SalvaProcessamento('12/999 - Busca Transferencias de Dias Anteiroes e Novas do Setor de Compras - FIM - '+TimeToStr(Time));
  //============================================================================

  //============================================================================
  SalvaProcessamento('13/999 - Atualiza Prioridades - INICIO - '+TimeToStr(Time));
  //============================================================================
  // Atualiza Prioridades ======================================================
  // Prioridades:
  //   Repete at� Enviar
  // 0       SIM        = Produtos de Campanhas, Folhetos, etc. (Calculados no Autom�tico, Solicitados pelo Setor de Compras, Solicitados Direto da Loja)
  // 1       SIM        = Produtos Solicitados pelo Setor de Compras
  // 2       SIM        = Produtos Solicitados Direto da Loja
  // 3       N�O        = Produtos Calculados no Autom�tico
//OdirAqui 7.Inicio
  If Not AtualizaPrioridades Then
  Begin
    bgArqErros:=True;
    tgArqErros.Add('Erro - AtualizaPrioridades');
    SalvaErros;
    DeleteFile(PChar(sgPastaStatus+'Odir.txt'));

    Application.Terminate;
    Exit;
  End;
//OdirAqui 7.Fim
  //============================================================================
  SalvaProcessamento('13/999 - Atualiza Prioridades - FIM - '+TimeToStr(Time));
  //============================================================================

  // Encerra Programa ==========================================================
  If tgArqErros.Count>0 Then
  Begin
    bgArqErros:=True;
    SalvaErros;
  End;

  //============================================================================
  // Libera Separa��o no CD ====================================================
  //============================================================================
  DeleteFile(PChar(sgPastaStatus+'Odir.txt'));

  //============================================================================
  SalvaProcessamento('14/999 - FIM - '+TimeToStr(Time));
  //============================================================================

  Application.Terminate;
  Exit;
end;

end.
{
          // Busca Tranferencias do CD Para a Loja ==================
          // SIDICOM Coloque no Fim =================================
          MySql:=' SELECT mc.numero, mp.codproduto, mp.quantatendida'+
                 ' FROM MCLI mc, MCLIPRO mp'+
                 ' WHERE mc.chavenf=mp.chavenf'+
                 ' AND   mc.codcomprovante in (''009'',''020'')'+
                 ' AND   mc.codfilial=''99'''+
                 ' AND   mc.situacaonf=''L'''+
                 ' AND   mc.datadocumento>='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(IncDay(dgDtaHoje,-100)))))+
                 ' AND   mc.codcliente='+QuotedStr(sCodEmp)+
                 ' AND   mp.codproduto='+QuotedStr(sCodProduto);
          IBQ_MPMS.Close;
          IBQ_MPMS.SQL.Clear;
          IBQ_MPMS.SQL.Add(MySql);
          IBQ_MPMS.Open;

          While Not IBQ_MPMS.Eof do
          Begin
            If bConetada Then // SIDICOM
            Begin
              MySql:=' SELECT mf.numero'+
                     ' FROM MFOR mf'+
                     ' WHERE mf.situacaonf=1'+
                     ' AND   mf.codfornecedor=''000663'''+
                     ' AND   mf.CodFilial='+QuotedStr(sCodLoja)+
                     ' AND   mf.codcomprovante in (''010'',''016'')'+
                     ' AND   mf.numero='+QuotedStr(IBQ_MPMS.FieldByName('numero').AsString);
              IBQ_TR_Filial.Close;
              IBQ_TR_Filial.SQL.Clear;
              IBQ_TR_Filial.SQL.Add(MySql);

              // Abre Query -----------------------------------------
              ii:=0;
              bSiga:=False;
              While Not bSiga do
              Begin
                Try
                  IBQ_TR_Filial.Open;
                  bSiga:=True;
                Except
                  Inc(ii);
                End; // Try

                If ii>2 Then
                Begin
                  IBQ_TR_Filial.Close;
                  Break;
                End; // If i>2 Then
              End; // While Not bSiga do

              If (bSiga) and (Trim(IBQ_TR_Filial.FieldByName('Numero').AsString)='') Then
              Begin
                cQtdMais:=cQtdMais + IBQ_MPMS.FieldByName('QuantAtendida').AsCurrency;
              End;
              IBQ_TR_Filial.Close;
            End; // If bConetada Then // SIDICOM

            If igCodLojaLinx<>0 Then // LINX
            Begin
              MySql:=' SELECT FIRST 1 m.documento numero'+
                     ' FROM LINXMOVIMENTO m'+
                     ' WHERE m.codigo_cliente=13'+ // BELSHOP | CD | RS
                     ' AND   m.operacao=''E'''+
                     ' AND   COALESCE(m.tipo_transacao,''E'')=''E'''+
                     ' AND   m.cancelado=''N'''+
                     ' AND   m.excluido=''N'''+
                     ' and   m.empresa='+IntToStr(igCodLojaLinx)+
                     ' and   m.documento='+IBQ_MPMS.FieldByName('Numero').AsString;
              DMTransferencias.CDS_BuscaRapida.Close;
              DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
              DMTransferencias.CDS_BuscaRapida.Open;
              If Trim(DMTransferencias.CDS_BuscaRapida.FieldByName('Numero').AsString)='' Then
              Begin
                cQtdMais:=cQtdMais + IBQ_MPMS.FieldByName('QuantAtendida').AsCurrency;
              End;
              DMTransferencias.CDS_BuscaRapida.Close;
            End; // If igCodLojaLinx<>0 Then // LINX

            IBQ_MPMS.Next;
          End; // While Not IBQ_MPMS.Eof do
          IBQ_MPMS.Close;

          While Not DMTransferencias.CDS_Busca.Eof do
          Begin
            If bConetada Then // SIDICOM
            Begin
              MySql:=' SELECT mf.numero'+
                     ' FROM MFOR mf'+
                     ' WHERE mf.situacaonf=1'+
                     ' AND   mf.codfornecedor=''000663'''+
                     ' AND   mf.CodFilial='+QuotedStr(sCodLoja)+
                     ' AND   mf.codcomprovante in (''010'',''016'')'+
                     ' AND   mf.numero='+QuotedStr(IBQ_MPMS.FieldByName('numero').AsString);
              IBQ_TR_Filial.Close;
              IBQ_TR_Filial.SQL.Clear;
              IBQ_TR_Filial.SQL.Add(MySql);

              // Abre Query -----------------------------------------
              ii:=0;
              bSiga:=False;
              While Not bSiga do
              Begin
                Try
                  IBQ_TR_Filial.Open;
                  bSiga:=True;
                Except
                  Inc(ii);
                End; // Try

                If ii>2 Then
                Begin
                  IBQ_TR_Filial.Close;
                  Break;
                End; // If i>2 Then
              End; // While Not bSiga do

              If (bSiga) and (Trim(IBQ_TR_Filial.FieldByName('Numero').AsString)='') Then
              Begin
                cQtdMais:=cQtdMais + IBQ_MPMS.FieldByName('QuantAtendida').AsCurrency;
              End;
              IBQ_TR_Filial.Close;
            End; // If bConetada Then // SIDICOM

}
