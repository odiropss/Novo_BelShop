unit UFrmAtualizaSeteHoras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, IBQuery, Grids, DBGrids, StdCtrls, ExtCtrls, DB, DateUtils,
  Math;

type

  TFrmAtualizaSeteHoras = class(TForm)
    procedure FormCreate(Sender: TObject);

    // ODIR ====================================================================
    Function  BuscaProdutosCD: Boolean;
    Function  InsereProdutosCD: Boolean;

    Function  BuscaProdutosLojas: Boolean;
    Procedure MontaCurvas(sCodLoja: String);
    Procedure BuscaProdutosCurvas(sCodLoja: String);

    Function  BuscaProdutosDemanda(sCodLoja, sCodProduto,sSaldo: String): Boolean;

    Function  AnalisaAtualizaTransferencias: Boolean;

    Procedure SalvaErros;
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
  TD: TTransactionDesc;


  bgExclidoMPMS: Boolean;

  IBQ_TR_Filial,
  IBQ_MPMS: TIBQuery;

  igDiasUteis, igDiaSemana: Integer;

  dgDtaHoje, dgDtaInicio, dgDtaFim: TDate;

  sgFornNAO, sgCodLoja,
  sgNrDocto, sgCurvas: String;

  mgMemo: TMemo;

  tgArqErros: TStringList; // Arquivo de Erros
  bgArqErros: Boolean;     // Se Salva Arquivo de Erros
  sgArqErros: String;      // Nome do Arquivo de Erros

  Flags : Cardinal; // Verifica Internet Ativo - Encerra Necessario
    
//  hHrInicio, hHrFim: String;

implementation

uses DK_Procs1, UDMConexoes, uj_001, uj_002, UDMAtualizaSeteHoras;

{$R *.dfm}
//==============================================================================
// ODIR - INICIO ===============================================================
//==============================================================================

// Salva Arquivo de Erros, se Houver >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaSeteHoras.SalvaErros;
Begin
  Try
    If bgArqErros Then
     tgArqErros.SaveToFile(sgArqErros);
  Finally
    { Libera a instancia da lista da memória }
    FreeAndNil(tgArqErros);
  End;
End; // Salva Arquivo de Erros, se Houver >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Analisa e Atualiza Transferencias do Dia >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmAtualizaSeteHoras.AnalisaAtualizaTransferencias: Boolean;
Var
  s, MySql: String;
  iQtdReposicao: Integer;
  bMultiplo: Boolean;
  iMultiplo, iQtdMultiplo: Integer;
Begin
  Result:=False;
                 
  // Busca Produtos com Necessidades ============================================
  MySql:=' SELECT *'+
         ' FROM ES_ESTOQUES_LOJAS lo'+
         ' WHERE lo.dta_movto=CURRENT_DATE'+
         ' AND   lo.ind_transf=''CAL'''+
         ' ORDER BY lo.cod_produto';
  DMAtualizaSeteHoras.CDS_EstoqueLoja.Close;
  DMAtualizaSeteHoras.SDS_EstoqueLoja.CommandText:=MySql;
  DMAtualizaSeteHoras.CDS_EstoqueLoja.Open;

  If DMAtualizaSeteHoras.CDS_EstoqueLoja.IsEmpty Then
   Exit;

  // Verifica se Transação esta Ativa
  If DMAtualizaSeteHoras.SQLC.InTransaction Then
   DMAtualizaSeteHoras.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMAtualizaSeteHoras.SQLC.StartTransaction(TD);
  Try
    DMAtualizaSeteHoras.CDS_EstoqueLoja.First;
    While not DMAtualizaSeteHoras.CDS_EstoqueLoja.Eof do
    Begin
      s:=DMAtualizaSeteHoras.CDS_EstoqueLojaCOD_LOJA.AsString;

      // Busca Produto com Saldo do CD ------------------------------
      MySql:=' SELECT *'+
             ' FROM ES_ESTOQUES_CD cd'+
             ' WHERE cd.dta_movto=CURRENT_DATE'+
             ' AND   cd.cod_produto='+QuotedStr(DMAtualizaSeteHoras.CDS_EstoqueLojaCOD_PRODUTO.AsString)+
             ' AND   cd.qtd_saldo>0';
      DMAtualizaSeteHoras.CDS_EstoqueCD.Close;
      DMAtualizaSeteHoras.SDS_EstoqueCD.CommandText:=MySql;
      DMAtualizaSeteHoras.CDS_EstoqueCD.Open;

      If DMAtualizaSeteHoras.CDS_EstoqueCD.IsEmpty Then
       Begin
         DateSeparator:='.';
         DecimalSeparator:='.';

         // Apresentar para o Compras
         MySql:=' INSERT INTO ES_ESTOQUES_SEM (COD_LOJA, DTA_MOVTO, COD_PRODUTO, QTD_ESTOQUE, IND_CURVA)'+
                ' VALUES ('+
                QuotedStr(DMAtualizaSeteHoras.CDS_EstoqueLojaCOD_LOJA.AsString)+', '+
                QuotedStr(DMAtualizaSeteHoras.CDS_EstoqueLojaDTA_MOVTO.AsString)+', '+
                QuotedStr(DMAtualizaSeteHoras.CDS_EstoqueLojaCOD_PRODUTO.AsString)+', '+
                QuotedStr(DMAtualizaSeteHoras.CDS_EstoqueLojaQTD_REPOSICAO.AsString)+', '+
                QuotedStr(DMAtualizaSeteHoras.CDS_EstoqueLojaIND_CURVA.AsString)+')';
         DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

         DateSeparator:='/';
         DecimalSeparator:=',';

         DMAtualizaSeteHoras.CDS_EstoqueLoja.Edit;
         DMAtualizaSeteHoras.CDS_EstoqueLojaIND_TRANSF.AsString:='NAO';
         DMAtualizaSeteHoras.CDS_EstoqueLoja.Post;
       End
      Else // If DMAtualizaSeteHoras.CDS_EstoqueCD.IsEmpty Then
       Begin
         iQtdReposicao:=DMAtualizaSeteHoras.CDS_EstoqueLojaQTD_REPOSICAO.AsInteger;

         //=====================================================================
         // ESMALTE - Acerta Quantidade de Reposição para Multiplo de Seis (6)
         //=====================================================================
         MySql:=' SELECT p.codproduto'+
                ' FROM PRODUTO p'+
                ' WHERE p.codproduto='+QuotedStr(DMAtualizaSeteHoras.CDS_EstoqueLojaCOD_PRODUTO.AsString)+
                ' AND P.CODGRUPOSUB='+QuotedStr('0100003');
         DMAtualizaSeteHoras.CDS_BuscaRapida.Close;
         DMAtualizaSeteHoras.SDS_BuscaRapida.CommandText:=MySql;
         DMAtualizaSeteHoras.CDS_BuscaRapida.Open;
         bMultiplo:=(Trim(DMAtualizaSeteHoras.CDS_BuscaRapida.FieldByName('CodProduto').AsString)<>'');
         DMAtualizaSeteHoras.CDS_BuscaRapida.Close;

         If bMultiplo Then
         Begin
           iMultiplo:=6;
           iQtdMultiplo:=iMultiplo;
           While bMultiplo do
           Begin
             If iQtdReposicao<iQtdMultiplo Then
             Begin
               iQtdReposicao:=iQtdMultiplo;
               Break;
             End;
             iQtdMultiplo:=iQtdMultiplo+iMultiplo;
           End; // While bMultiplo do
         End; // If bMultiplo Then
         bMultiplo:=False;
         //=====================================================================
         // ESMALTE - Acerta Quantidade de Reposição para Multiplo de 6
         //=====================================================================

         //=====================================================================
         // PRODUTO CÓDIGO 923834 - Acerta Quantidade de Reposição para Multiplo de 25
         //=====================================================================
         If DMAtualizaSeteHoras.CDS_EstoqueLojaCOD_PRODUTO.AsString='923834' Then
         Begin
           iMultiplo:=25;
           iQtdMultiplo:=iMultiplo;
           While bMultiplo do
           Begin
             If iQtdReposicao<iQtdMultiplo Then
             Begin
               iQtdReposicao:=iQtdMultiplo;
               Break;
             End;
             iQtdMultiplo:=iQtdMultiplo+iMultiplo;
           End; // While bMultiplo do
         End; // If DMAtualizaSeteHoras.CDS_EstoqueLojaCOD_PRODUTO.AsString='923834' Then
         bMultiplo:=False;
         //=====================================================================
         // PRODUTO CÓDIGO 923834 - Acerta Quantidade de Reposição para Multiplo de 25
         //=====================================================================

         If iQtdReposicao>=DMAtualizaSeteHoras.CDS_EstoqueCDQTD_SALDO.AsInteger Then
         Begin
           // Apresentar para o Compras
           If iQtdReposicao>DMAtualizaSeteHoras.CDS_EstoqueCDQTD_SALDO.AsInteger Then
           Begin
             DateSeparator:='.';
             DecimalSeparator:='.';

             MySql:=' INSERT INTO ES_ESTOQUES_SEM (COD_LOJA, DTA_MOVTO, COD_PRODUTO, QTD_ESTOQUE, IND_CURVA)'+
                    ' VALUES ('+
                    QuotedStr(DMAtualizaSeteHoras.CDS_EstoqueLojaCOD_LOJA.AsString)+', '+
                    QuotedStr(DMAtualizaSeteHoras.CDS_EstoqueLojaDTA_MOVTO.AsString)+', '+
                    QuotedStr(DMAtualizaSeteHoras.CDS_EstoqueLojaCOD_PRODUTO.AsString)+', '+
                    QuotedStr(IntToStr(iQtdReposicao-DMAtualizaSeteHoras.CDS_EstoqueCDQTD_SALDO.AsInteger))+', '+
                    QuotedStr(DMAtualizaSeteHoras.CDS_EstoqueLojaIND_CURVA.AsString)+')';
             DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

             DateSeparator:='/';
             DecimalSeparator:=',';
           End; // If iQtdReposicao>DMAtualizaSeteHoras.CDS_EstoqueCDQTD_SALDO.AsInteger Then

           iQtdReposicao:=DMAtualizaSeteHoras.CDS_EstoqueCDQTD_SALDO.AsInteger;
         End; // If iQtdReposicao>=DMAtualizaSeteHoras.CDS_EstoqueCDQTD_SALDO.AsInteger Then

         // Transferencia para Loja ---------------------------------
         DMAtualizaSeteHoras.CDS_EstoqueLoja.Edit;
         DMAtualizaSeteHoras.CDS_EstoqueLojaIND_TRANSF.AsString:='SIM';
         DMAtualizaSeteHoras.CDS_EstoqueLojaQTD_TRANSF.AsInteger:=iQtdReposicao;
         DMAtualizaSeteHoras.CDS_EstoqueLojaQTD_A_TRANSF.AsInteger:=iQtdReposicao;
         DMAtualizaSeteHoras.CDS_EstoqueLoja.Post;

         // Acerta Saldo no CD --------------------------------------
         DMAtualizaSeteHoras.CDS_EstoqueCD.Edit;
         DMAtualizaSeteHoras.CDS_EstoqueCDQTD_SAIDAS.AsInteger:=
                             DMAtualizaSeteHoras.CDS_EstoqueCDQTD_SAIDAS.AsInteger+
                                                                  iQtdReposicao;
         DMAtualizaSeteHoras.CDS_EstoqueCDQTD_SALDO.AsInteger:=
                              DMAtualizaSeteHoras.CDS_EstoqueCDQTD_SALDO.AsInteger-
                                                                  iQtdReposicao;
         DMAtualizaSeteHoras.CDS_EstoqueCD.Post;

         DMAtualizaSeteHoras.CDS_EstoqueCD.ApplyUpdates(0);
       End; // If DMAtualizaSeteHoras.CDS_EstoqueCD.IsEmpty Then
      DMAtualizaSeteHoras.CDS_EstoqueCD.Close;

      DMAtualizaSeteHoras.CDS_EstoqueLoja.Next;
    End; // While not DMAtualizaSeteHoras.CDS_EstoqueLoja.Eof do

    // Atualiza Transacao ======================================================
    DMAtualizaSeteHoras.CDS_EstoqueLoja.ApplyUpdates(0);
    DMAtualizaSeteHoras.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    Result:=True;
  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMAtualizaSeteHoras.CDS_EstoqueLoja.CancelUpdates;
      DMAtualizaSeteHoras.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      bgArqErros:=True;
      tgArqErros.Add('AnalisaAtualizaTransferencias: '+s+' - '+e.message)
    End; // on e : Exception do
  End; // Try
  DMAtualizaSeteHoras.CDS_EstoqueLoja.Close;

End; // Analisa e Atualiza Transferencias do Dia >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Produto e Demanda >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmAtualizaSeteHoras.BuscaProdutosDemanda(sCodLoja, sCodProduto, sSaldo: String): Boolean;
Var
  MySql: String;
  sCurva, sDiasEstocagem, sEstMinimo: String;
  sEstMinimoDec, sSaldoDec: String; // Decimal com Ponto
Begin
  Result:=True;

  sCurva        :=DMAtualizaSeteHoras.CDS_CurvasLojaIND_CURVA.AsString;
  sDiasEstocagem:=DMAtualizaSeteHoras.CDS_CurvasLojaDIAS_ESTOCAGEM.AsString;
  sEstMinimo    :=DMAtualizaSeteHoras.CDS_CurvasLojaEST_MINIMO.AsString;

  sEstMinimoDec:=f_Troca(',','.',ZerosCentavos(sEstMinimo,2));
  sSaldoDec    :=f_Troca(',','.',ZerosCentavos(sSaldo,2));

  MySql:=' SELECT CAST(GEN_ID(GEN_ODIR,1) AS INTEGER) Num_Seq,'+
         ' CURRENT_DATE DTA_MOVTO, '+
         sgNrDocto+' NUM_DOCTO, '+
         QuotedStr(sCodLoja)+' COD_LOJA,'+
         ' pr.codproduto COD_PRODUTO, '+
         sEstMinimo+' EST_MINIMO, '+
         sSaldo+' QTD_ESTOQUE,'+
         ' SUM(COALESCE(dm.quant_ref,0)) QTD_VENDAS, '+
         QuotedStr(sCurva)+' IND_CURVA, '+
         sDiasEstocagem+' DIAS_ESTOCAGEM, '+
         IntToStr(igDiasUteis)+' QTD_DIAS,'+
         ' ((SUM(COALESCE(dm.quant_ref,0)))/'+IntToStr(igDiasUteis)+') QTD_VENDA_DIA,'+

         ' CAST(((((SUM(COALESCE(dm.quant_ref,0)))/'+IntToStr(igDiasUteis)+')) * '+sDiasEstocagem+') AS INTEGER) QTD_DEMANDA,'+ // Quantidade em Dias de Estocagem

         ' CASE'+ // Quando Demanda Menor Que Estoque Minimo Vale Estoque Minimo
         '   WHEN (CAST(((((SUM(COALESCE(dm.quant_ref,0)))/'+IntToStr(igDiasUteis)+')) * '+sDiasEstocagem+') AS INTEGER))>='+sEstMinimo+' Then'+
//         '      (CAST((((((SUM(COALESCE(dm.quant_ref,0)))/'+IntToStr(igDiasUteis)+')) * '+sDiasEstocagem+') - '+sSaldo+') AS INTEGER))'+
         '      ((((((SUM(COALESCE(dm.quant_ref,0)))/'+IntToStr(igDiasUteis)+')) * '+sDiasEstocagem+') - '+sSaldo+'))'+
         '   ELSE '+
                sEstMinimo+' - '+sSaldo+
         ' END QTD_REPOSICAO,'+ // Quantidade de Reposição

         ' 0.00 QTD_TRANSF,'+
         ' 0.00 QTD_A_TRANSF,'+
         ' ''000000'' NUM_PEDIDO,'+
         ' ''CAL'' IND_TRANSF,'+
         ' 0 USU_ALTERA,'+
         ' CURRENT_TIMESTAMP DTA_ALTERA,'+
         ' 0 NUM_TR_GERADA,'+
         ' 0.00 QTD_TRANSF_OC,'+
         ' '' '' OBS_DOCTO,'+
         ' pr.CODGRUPOSUB'+

         ' FROM PRODUTO pr'+
         '      LEFT JOIN MOVTOS_EMPRESAS dm  ON dm.ind_tipo=''DM'''+
         '                                   AND dm.codproduto=pr.codproduto'+
         '                                   AND dm.dta_ref>='+
         QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(PrimUltDia(dgDtaInicio,'P')))))+
         '                                   AND dm.dta_ref<='+
         QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(dgDtaFim))))+
         '                                   AND dm.codfilial='+QuotedStr(sCodLoja)+

         ' WHERE pr.codproduto='+QuotedStr(sCodProduto)+

         ' GROUP BY 5,24'+

         ' HAVING (CASE'+ // Quando Demanda Menor Que Estoque Minimo Vale Estoque Minimo
         '           WHEN (CAST(((((SUM(COALESCE(dm.quant_ref,0)))/'+IntToStr(igDiasUteis)+')) * '+sDiasEstocagem+') AS INTEGER))>='+sEstMinimo+' Then'+
         '             ((((((SUM(COALESCE(dm.quant_ref,0)))/'+IntToStr(igDiasUteis)+')) * '+sDiasEstocagem+') - '+sSaldo+'))'+
         '           ELSE '+
                       sEstMinimo+' - '+sSaldo+
         '         END)>0';
  DMAtualizaSeteHoras.CDS_ProdutoDemanda.Close;
  DMAtualizaSeteHoras.SDS_ProdutoDemanda.CommandText:=MySql;
  DMAtualizaSeteHoras.CDS_ProdutoDemanda.Open;

  If DMAtualizaSeteHoras.CDS_ProdutoDemanda.Eof Then
  Begin
    Result:=False;
    DMAtualizaSeteHoras.CDS_ProdutoDemanda.Close;
  End;

end; // Busca Produto e Demanda >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Produtos das Curvas da Loja >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaSeteHoras.BuscaProdutosCurvas(sCodLoja: String);
Var
  MySql, sDta: String;
Begin
  sDta:=f_Troca('/','.',f_Troca('-','.',DateToStr(dgDtaInicio)));

  MySql:=' SELECT p.codproduto cod_produto,'+

         ' CASE'+
         '    WHEN (p.datainclusao>='+QuotedStr(sDta)+') AND (c.ind_curva=''E'') THEN'+
         '     ''C'''+
         '    ELSE'+
         '     c.ind_curva'+
         ' END ind_curva,'+

         ' CASE'+
         '   WHEN (p.datainclusao>='+QuotedStr(sDta)+') AND (c.ind_curva=''E'') AND (t.vlr_aux1>c.est_minimo) THEN'+
         '    CAST(t.vlr_aux1 AS INTEGER)'+
         '   ELSE'+
         '    CAST(c.est_minimo AS INTEGER)'+
         ' END est_minimo,'+
         ' CAST(COALESCE(t.vlr_aux,0) AS INTEGER) Dias_Estocagem,'+
         ' CAST(COALESCE(e.saldoatual,0) AS INTEGER) saldoatual,'+
         ' p.datainclusao, p.dataalteracao'+

         ' FROM PRODUTO p'+
         '        LEFT JOIN ES_FINAN_CURVA_ABC c  ON c.cod_produto=p.codproduto'+
         '        LEFT JOIN ESTOQUE      e  ON e.codfilial=c.cod_loja'+
         '                                 AND e.codproduto=p.codproduto'+
         '        LEFT JOIN TAB_AUXILIAR t  ON CASE'+
         '                                       WHEN (p.datainclusao>'+QuotedStr(sDta)+') AND (c.ind_curva=''E'') THEN 3'+
         '                                       WHEN c.ind_curva=''A'' THEN 1'+
         '                                       WHEN c.ind_curva=''B'' THEN 2'+
         '                                       WHEN c.ind_curva=''C'' THEN 3'+
         '                                       WHEN c.ind_curva=''D'' THEN 4'+
         '                                       WHEN c.ind_curva=''E'' THEN 5'+
         '                                     END=t.cod_aux'+
         '                                 AND t.tip_aux=2'+

         ' WHERE p.situacaopro in (0,3)'+
         ' AND   c.est_minimo>0'+

         ' AND   p.codaplicacao<>''0015'''+ // Não Processa: 0015=E-Commerce
         ' AND   p.codaplicacao<>''0016'''+ // Não Processa: 0016=Brindes

         ' AND   c.cod_loja='+QuotedStr(sCodLoja)+
         ' AND   p.principalfor Not in ('+sgFornNAO+')'+
         ' AND   ((c.ind_curva in ('+sgCurvas+')) OR (p.datainclusao>='+QuotedStr(sDta)+' AND c.ind_curva=''E''))'+
         ' ORDER BY p.codproduto';
  DMAtualizaSeteHoras.CDS_CurvasLoja.Close;
  DMAtualizaSeteHoras.SDS_CurvasLoja.CommandText:=MySql;
  DMAtualizaSeteHoras.CDS_CurvasLoja.Open;

End; // Busca Produtos das Curvas da Loja >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Monta Curvas da Loja >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaSeteHoras.MontaCurvas(sCodLoja: String);
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
  DMAtualizaSeteHoras.CDS_BuscaRapida.Close;
  DMAtualizaSeteHoras.SDS_BuscaRapida.CommandText:=MySql;
  DMAtualizaSeteHoras.CDS_BuscaRapida.Open;

  If DMAtualizaSeteHoras.CDS_BuscaRapida.FieldByName('Ind_Curva_A').AsString='SIM' Then
   sgCurvas:=QuotedStr('A');

  If DMAtualizaSeteHoras.CDS_BuscaRapida.FieldByName('Ind_Curva_B').AsString='SIM' Then
  Begin
    If sgCurvas='' Then
     sgCurvas:=QuotedStr('B')
    Else
     sgCurvas:=sgCurvas+', '+QuotedStr('B');
  End;

  If DMAtualizaSeteHoras.CDS_BuscaRapida.FieldByName('Ind_Curva_C').AsString='SIM' Then
  Begin
    If sgCurvas='' Then
     sgCurvas:=QuotedStr('C')
    Else
     sgCurvas:=sgCurvas+', '+QuotedStr('C');
  End;

  If DMAtualizaSeteHoras.CDS_BuscaRapida.FieldByName('Ind_Curva_D').AsString='SIM' Then
  Begin
    If sgCurvas='' Then
     sgCurvas:=QuotedStr('D')
    Else
     sgCurvas:=sgCurvas+', '+QuotedStr('D');
  End;

  If DMAtualizaSeteHoras.CDS_BuscaRapida.FieldByName('Ind_Curva_E').AsString='SIM' Then
  Begin
    If sgCurvas='' Then
     sgCurvas:=QuotedStr('E')
    Else
     sgCurvas:=sgCurvas+', '+QuotedStr('E');
  End;
  DMAtualizaSeteHoras.CDS_BuscaRapida.Close;
End; // Monta Curvas da Loja >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Produtos das Lojas/Calcula Necessidade de Compras >>>>>>>>>>>>>>>>>>>>>
Function  TFrmAtualizaSeteHoras.BuscaProdutosLojas: Boolean;
Var
  ii, i: Integer;
  MySql: String;
  sCodProduto, sCodLoja, sCodEmp: String;
  cQtdSaldo, cQtdMais: Currency;
  bConetada, bSiga, bRepoe: Boolean;
Begin
  Result:=False;

  // Busca Produtos do CD ======================================================
  MySql:=' SELECT *'+
         ' FROM ES_ESTOQUES_CD ec'+
         ' WHERE ec.dta_movto='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(dgDtaHoje))))+
         ' ORDER BY ec.cod_produto';
  DMAtualizaSeteHoras.CDS_EstoqueCD.Close;
  DMAtualizaSeteHoras.SDS_EstoqueCD.CommandText:=MySql;
  DMAtualizaSeteHoras.CDS_EstoqueCD.Open;

  // Abre ClientDataSet para Inclusao de Produtos da Loja ======================
  MySql:=' SELECT *'+
         ' FROM ES_ESTOQUES_LOJAS el'+
         ' WHERE el.cod_produto<''''';
  DMAtualizaSeteHoras.CDS_EstoqueLoja.Close;
  DMAtualizaSeteHoras.SDS_EstoqueLoja.CommandText:=MySql;
  DMAtualizaSeteHoras.CDS_EstoqueLoja.Open;

  For i:=0 to mgMemo.Lines.Count-1 do
  Begin
    // Zera Sequencia para Novo Docto ==========================================
    MySql:=' ALTER SEQUENCE GEN_ODIR RESTART WITH 0';
    DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

    // Busca Numero do Docto ===================================================
    MySql:=' SELECT COALESCE(MAX(el.num_docto)+1 ,1) Nr_Docto'+
           ' FROM ES_ESTOQUES_LOJAS el';
    DMAtualizaSeteHoras.CDS_BuscaRapida.Close;
    DMAtualizaSeteHoras.SDS_BuscaRapida.CommandText:=MySql;
    DMAtualizaSeteHoras.CDS_BuscaRapida.Open;
    sgNrDocto:=DMAtualizaSeteHoras.CDS_BuscaRapida.FieldByName('Nr_Docto').AsString;
    DMAtualizaSeteHoras.CDS_BuscaRapida.Close;

    sCodLoja:=Trim(mgMemo.Lines[i]);

    // Monta Curvas da Loja ====================================================
    MontaCurvas(sCodLoja);

    // Busca Produtos das Curvas da Loja =======================================
    BuscaProdutosCurvas(sCodLoja);

    // Conecta Empresa =======================================================
    bConetada:=False;
    If ConexaoEmpIndividual('IBDB_'+sCodLoja, 'IBT_'+sCodLoja, 'A') Then
    Begin
      bConetada:=True;
      try
        CriaQueryIB('IBDB_'+sCodLoja,'IBT_'+sCodLoja,IBQ_TR_Filial, True);
      Except
        bConetada:=False;
      End;
    End;

    // Monta Transacao ===================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMAtualizaSeteHoras.SQLC.StartTransaction(TD);
    Try
      // Busca Codigo da Loja ---------------------------------------
      MySql:=' SELECT CAST(LPAD(em.cod_emp,6,''0'') AS VARCHAR(6)) Codigo'+
             ' FROM EMP_CONEXOES em'+
             ' WHERE em.cod_filial='+QuotedStr(sCodLoja);
      DMAtualizaSeteHoras.CDS_BuscaRapida.Close;
      DMAtualizaSeteHoras.SDS_BuscaRapida.CommandText:=MySql;
      DMAtualizaSeteHoras.CDS_BuscaRapida.Open;
      sCodEmp:=DMAtualizaSeteHoras.CDS_BuscaRapida.FieldByName('Codigo').AsString;
      DMAtualizaSeteHoras.CDS_BuscaRapida.Close;

      While Not DMAtualizaSeteHoras.CDS_CurvasLoja.Eof do
      Begin
        sCodProduto:=DMAtualizaSeteHoras.CDS_CurvasLojaCOD_PRODUTO.AsString;

        // Se Loja Conectada - Busca Transferencias -----------------
        cQtdMais:=0;
        if bConetada Then
        Begin
          // Busca Tranferencias ------------------------------------
          MySql:=' SELECT mc.numero, mp.codproduto, mp.quantatendida'+
                 ' FROM MCLI mc, MCLIPRO mp'+
                 ' WHERE mc.chavenf=mp.chavenf';

                 If sCodLoja='01' Then
                  MySql:=
                   MySql+' AND   mc.codcomprovante=''009'''
                 Else
                  MySql:=
                   MySql+' AND   mc.codcomprovante=''020''';

          MySql:=
           MySql+' AND   mc.codfilial=''99'''+
                 ' AND   mc.situacaonf=''L'''+
                 ' AND   mc.datadocumento>='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(IncDay(dgDtaHoje,-15)))))+
                 ' AND   mc.codcliente='+QuotedStr(sCodEmp)+
                 ' AND   mp.codproduto='+QuotedStr(sCodProduto);
          IBQ_MPMS.Close;
          IBQ_MPMS.SQL.Clear;
          IBQ_MPMS.SQL.Add(MySql);
          IBQ_MPMS.Open;

          While Not IBQ_MPMS.Eof do
          Begin
            MySql:=' SELECT mf.numero'+
                   ' FROM MFOR mf'+
                   ' WHERE mf.situacaonf=1'+
                   ' AND   mf.codfornecedor=''000663'''+
                   ' AND   mf.CodFilial='+QuotedStr(sCodLoja);

                 If sCodLoja='01' Then
                  MySql:=
                   MySql+' AND   mf.codcomprovante=''010'''
                 Else
                  MySql:=
                   MySql+' AND   mf.codcomprovante=''016''';
            MySql:=
             MySql+' AND mf.numero='+QuotedStr(IBQ_MPMS.FieldByName('numero').AsString);
            IBQ_TR_Filial.Close;
            IBQ_TR_Filial.SQL.Clear;
            IBQ_TR_Filial.SQL.Add(MySql);

            // Abre Query -------------------------------------------
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

            If (bSiga) and (Trim(IBQ_TR_Filial.FieldByName('numero').AsString)='') Then
            Begin
              cQtdMais:=cQtdMais+IBQ_MPMS.FieldByName('quantatendida').AsCurrency;
            End;
            IBQ_TR_Filial.Close;

            IBQ_MPMS.Next;
          End; // While Not IBQ_MPMS.Eof do
          IBQ_MPMS.Close;
        End; // if bConetada Then

        // Atualiza o Saldo do Produto ------------------------------
        cQtdSaldo:=DMAtualizaSeteHoras.CDS_CurvasLojaSALDOATUAL.AsCurrency+cQtdMais;

        // Busca Demanda/Quantidade de reposição --------------------
        If BuscaProdutosDemanda(sCodLoja, sCodProduto, IntToStr(ParteInteiro(CurrToStr(cQtdSaldo)))) Then
        Begin

          // Acerta Arredondamento para Maior Inteiro ---------------
          DMAtualizaSeteHoras.CDS_ProdutoDemanda.Edit;
          DMAtualizaSeteHoras.CDS_ProdutoDemandaQTD_REPOSICAO.AsInteger:=
                 Ceil(DMAtualizaSeteHoras.CDS_ProdutoDemandaQTD_REPOSICAO.AsFloat);
          DMAtualizaSeteHoras.CDS_ProdutoDemanda.Post;

          // Verifica se Tem Produto com Estoque no CD --------------
          If (DMAtualizaSeteHoras.CDS_EstoqueCD.Locate('COD_PRODUTO',sCodProduto,[])) Then
           Begin
             // Verifica Percentual de 70 Para reposição ------------
             bRepoe:=True;
             If (DMAtualizaSeteHoras.CDS_ProdutoDemandaQTD_ESTOQUE.AsInteger>0) Then
              bRepoe:=(((DMAtualizaSeteHoras.CDS_ProdutoDemandaQTD_REPOSICAO.AsCurrency*100)/
                         DMAtualizaSeteHoras.CDS_ProdutoDemandaQTD_ESTOQUE.AsCurrency)>30);

             // Inclui o Produto da Loja ----------------------------
             If bRepoe Then
             Begin
               DMAtualizaSeteHoras.CDS_EstoqueLoja.Insert;
               For ii:=0 to DMAtualizaSeteHoras.CDS_ProdutoDemanda.FieldCount-1 do
               Begin
                 If AnsiUpperCase(DMAtualizaSeteHoras.CDS_ProdutoDemanda.Fields[ii].DisplayLabel)<>'CODGRUPOSUB' Then
                  DMAtualizaSeteHoras.CDS_EstoqueLoja.Fields[ii].Assign(DMAtualizaSeteHoras.CDS_ProdutoDemanda.Fields[ii]);
               End; // For ii:=0 to DMAtualizaSeteHoras.CDS_ProdutoDemanda.FieldCount-1 do
               DMAtualizaSeteHoras.CDS_EstoqueLoja.Post;

               // Atualiza Apply --------------------------------------
               DMAtualizaSeteHoras.CDS_EstoqueLoja.ApplyUpdates(0);
             End; // If bRepoe Then
             DMAtualizaSeteHoras.CDS_ProdutoDemanda.Close;
           End
          Else // If (DMAtualizaSeteHoras.CDS_EstoqueCD.Locate('COD_PRODUTO',sCodProduto,[]))Then
           Begin
             DateSeparator:='.';
             DecimalSeparator:='.';

             // Apresentar para o Compras
             MySql:=' INSERT INTO ES_ESTOQUES_SEM (COD_LOJA, DTA_MOVTO, COD_PRODUTO, QTD_ESTOQUE, IND_CURVA)'+
                    ' VALUES ('+
                    QuotedStr(DMAtualizaSeteHoras.CDS_ProdutoDemandaCOD_LOJA.AsString)+', '+
                    QuotedStr(DMAtualizaSeteHoras.CDS_ProdutoDemandaDTA_MOVTO.AsString)+', '+
                    QuotedStr(DMAtualizaSeteHoras.CDS_ProdutoDemandaCOD_PRODUTO.AsString)+', '+
                    QuotedStr(DMAtualizaSeteHoras.CDS_ProdutoDemandaQTD_REPOSICAO.AsString)+', '+
                    QuotedStr(DMAtualizaSeteHoras.CDS_ProdutoDemandaIND_CURVA.AsString)+')';
             DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

             DateSeparator:='/';
             DecimalSeparator:=',';
           End; // If (DMAtualizaSeteHoras.CDS_EstoqueCD.Locate('COD_PRODUTO',sCodProduto,[]))Then
        End; // If BuscaProdutosDemanda(sCodLoja, sCodProduto, IntToStr(ParteInteiro(CurrToStr(cQtdSaldo)))) Then

        DMAtualizaSeteHoras.CDS_CurvasLoja.Next;
      End; // While Not DMAtualizaSeteHoras.CDS_CurvasLoja.Eof do
      DMAtualizaSeteHoras.CDS_CurvasLoja.Close;

      // Acerta Num_Seq ========================================================
      MySql:=' SELECT lo.num_seq, lo.cod_produto, TRIM(pr.apresentacao) nome_produto,'+
             ' COALESCE(cd.end_zona,''0'')||''.''||COALESCE(cd.end_corredor,''000'')||''.''||'+
             ' COALESCE(cd.end_prateleira,''000'')||''.''||COALESCE(cd.end_gaveta,''0000'') Enderecamento'+
             ' FROM ES_ESTOQUES_LOJAS lo'+
             '      LEFT JOIN PRODUTO        pr  ON pr.codproduto=lo.cod_produto'+
             '      LEFT JOIN ES_ESTOQUES_CD cd  ON cd.dta_movto=lo.dta_movto'+
             '                                  AND cd.cod_produto=lo.cod_produto'+
             ' WHERE lo.dta_movto=CURRENT_DATE'+
             ' AND   lo.num_docto='+QuotedStr(sgNrDocto)+
             ' AND   lo.cod_loja='+QuotedStr(sCodLoja)+
             ' ORDER BY 4,3';
      DMAtualizaSeteHoras.CDS_Busca.Close;
      DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
      DMAtualizaSeteHoras.CDS_Busca.Open;

      ii:=0;
      While Not DMAtualizaSeteHoras.CDS_Busca.Eof do
      Begin
        Inc(ii);

        MySql:=' UPDATE ES_ESTOQUES_LOJAS lo'+
               ' SET lo.num_seq='+IntToStr(ii)+
               ' WHERE lo.dta_movto=CURRENT_DATE'+
               ' AND   lo.num_docto='+QuotedStr(sgNrDocto)+
               ' AND   lo.cod_loja='+QuotedStr(sCodLoja)+
               ' AND   lo.num_seq='+DMAtualizaSeteHoras.CDS_Busca.FieldByName('Num_Seq').AsString+
               ' AND   lo.cod_produto='+QuotedStr(DMAtualizaSeteHoras.CDS_Busca.FieldByName('cod_produto').AsString);
        DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

        DMAtualizaSeteHoras.CDS_Busca.Next;
      End; // While Not DMAtualizaSeteHoras.CDS_Busca.Eof do
      DMAtualizaSeteHoras.CDS_Busca.Close;

      // Fecha Transacao ===================================================
      DMAtualizaSeteHoras.SQLC.Commit(TD);

      bgArqErros:=True;
      tgArqErros.Add('Loja Bel_'+sCodLoja+' Processada com SUCESSO em '+DateTimeToStr(DataHoraServidorFI(DMAtualizaSeteHoras.SDS_DtaHoraServidor)));

      Result:=True;
    Except
      on e : Exception do
      Begin
        IBQ_TR_Filial.Close;

        bgArqErros:=True;
        tgArqErros.Add('BuscaProdutosLojas: '+sCodLoja+' - '+e.message);

        DMAtualizaSeteHoras.SQLC.Rollback(TD);
        DMAtualizaSeteHoras.CDS_EstoqueLoja.CancelUpdates;
      End; // on e : Exception do
    End; // Try

    If bConetada Then
     ConexaoEmpIndividual('IBDB_'+sCodLoja, 'IBT_'+sCodLoja, 'F');

  End; // For i:=0 to mgMemo.Lines.Count-1 do
  DMAtualizaSeteHoras.CDS_EstoqueCD.Close;
  DMAtualizaSeteHoras.CDS_EstoqueLoja.Close;

//  hHrFim:=TimeToStr(DataHoraServidorFI(DMAtualizaSeteHoras.SDS));
//  msg('TEMPO: '+TimeToStr(StrToTime(hHrFim)-StrToTime(hHrInicio)),'A');

End; // Busca Produtos das Lojas/Calcula Necessidade de Compras >>>>>>>>>>>>>>>>

// Insere Produtos no CD >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmAtualizaSeteHoras.InsereProdutosCD: Boolean;
Var
  i: Integer;
  MySql: String;
Begin
  Result:=True;

  DMAtualizaSeteHoras.CDS_EstoqueCD.Open;

  // Verifica se Transação esta Ativa
  If DMAtualizaSeteHoras.SQLC.InTransaction Then
   DMAtualizaSeteHoras.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMAtualizaSeteHoras.SQLC.StartTransaction(TD);
  Try
    // Delete Estoque de Produtos do CD do Dia ----------------------
    MySql:=' DELETE FROM ES_ESTOQUES_CD ec'+
           ' WHERE ec.dta_movto='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(dgDtaHoje))));
    DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

    // Delete Estoque de Produtos da Lojas do Dia -------------------
    MySql:=' DELETE FROM ES_ESTOQUES_LOJAS el'+
           ' WHERE el.dta_movto='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(dgDtaHoje))));
    DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

    // Delete Estoque de Produtos do CD do Dia ----------------------
    MySql:=' DELETE FROM ES_ESTOQUES_SEM es'+
           ' WHERE es.dta_movto='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(dgDtaHoje))));
    DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

    // Insere Estoque de Produtos do CD -----------------------------
    IBQ_MPMS.First;
    While not IBQ_MPMS.Eof do
    Begin
      DMAtualizaSeteHoras.CDS_EstoqueCD.Insert;
      For i:=0 to IBQ_MPMS.FieldCount-1 do
       DMAtualizaSeteHoras.CDS_EstoqueCD.Fields[i].Assign(IBQ_MPMS.Fields[i]);

      DMAtualizaSeteHoras.CDS_EstoqueCD.Post;

      IBQ_MPMS.Next;
    End; // While not IBQ_MPMS.Eof do

    // Atualiza Transacao ======================================================
    DMAtualizaSeteHoras.CDS_EstoqueCD.ApplyUpdates(0);
    DMAtualizaSeteHoras.SQLC.Commit(TD);
  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMAtualizaSeteHoras.CDS_EstoqueCD.CancelUpdates;
      DMAtualizaSeteHoras.SQLC.Rollback(TD);

      Result:=False;

      bgArqErros:=True;
      tgArqErros.Add('InsereProdutosCD: 99 - '+e.message)
    End; // on e : Exception do
  End; // Try
  IBQ_MPMS.Close;
  DMAtualizaSeteHoras.CDS_EstoqueCD.Close;

End; // Insere Produtos no CD >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Produtos no CD - Somente se Houver com Estoque > 0 >>>>>>>>>>>>>>>>>>>>
Function TFrmAtualizaSeteHoras.BuscaProdutosCD: Boolean;
Var
  MySql: String;
Begin
  Result:=True;

  MySql:=' SELECT CURRENT_DATE DTA_MOVTO, e.codproduto cod_produto,'+
         ' COALESCE(e.saldoatual,0) qtd_estoque,'+
         ' 0.00 qtd_saidas,'+
         ' COALESCE(e.saldoatual,0) qtd_saldo,'+
         ' COALESCE(e.zonaendereco,''0'') end_zona,'+
         ' COALESCE(e.corredor,''000'') end_corredor,'+
         ' COALESCE(e.prateleira,''000'') end_prateleira,'+
         ' COALESCE(e.gaveta,''0000'') end_gaveta'+

         ' FROM ESTOQUE e, PRODUTO p'+

         ' WHERE e.codproduto=p.codproduto'+

         ' AND   p.codaplicacao<>''0015'''+ // Não Processa: 0015=E-Commerce
         ' AND   p.codaplicacao<>''0016'''+ // Não Processa: 0016=Brindes

         ' AND   e.codfilial=''99'''+
         ' AND   p.principalfor Not in ('+sgFornNAO+')'+
         ' AND   COALESCE(e.saldoatual,0)>0'+

         ' ORDER BY 2';
  IBQ_MPMS.Close;
  IBQ_MPMS.SQL.Clear;
  IBQ_MPMS.SQL.Add(MySql);
  IBQ_MPMS.Open;

  If IBQ_MPMS.Eof Then
   Result:=False;

End; // Busca Produtos no CD - Somente se Houver com Estoque > 0 >>>>>>>>>>>>>>>

//==============================================================================
// ODIR - FIM ==================================================================
//==============================================================================

procedure TFrmAtualizaSeteHoras.FormCreate(Sender: TObject);
Var
  MySql: String;
  sDta, sUsuarioWindows, sComputadorWindows: String;
begin
  // Fechar Programa do Agendamento Anterior ===================================
//  ApagaUltProcesso('PCurvasDemandas.exe');
//odir teste de fonte
  //============================================================================

  // Windows: Nome do Usuario e do Computador =================================
  UsuarioComputadorWindows(sUsuarioWindows, sComputadorWindows);

//  hHrInicio:=TimeToStr(DataHoraServidorFI(DMAtualizaSeteHoras.SDS));

  sDta:=DateToStr(DataHoraServidorFI(DMAtualizaSeteHoras.SDS_DtaHoraServidor));
  sDta:=f_Troca('/','',f_Troca('.','',f_Troca('-','',sDta)));

  sgArqErros:=IncludeTrailingPathDelimiter(sgPath_Local+'Arquivo Status Transf');
  If (Trim(sgCompServer)<>Trim(sComputadorWindows)) And (Trim(sComputadorWindows)<>'ODIR-PC') Then
  Begin
    sgArqErros:=f_Troca('C:\','',sgArqErros);
    sgArqErros:='\\'+sgIPInternetServer+'\'+sgArqErros;
  End;

  sgArqErros:=sgArqErros+'ErrosTransf_'+sDta+'.txt';

  DeleteFile(sgArqErros);

  bgArqErros:=False;
  tgArqErros:=TStringList.Create;

  // Fornecedores que Não São Processados ======================================
  MySql:=' SELECT CAST(LPAD(t.cod_aux,6,0) AS VARCHAR(6)) Forn_Nao'+
         ' FROM TAB_AUXILIAR t'+
         ' WHERE t.tip_aux=13';
  DMAtualizaSeteHoras.CDS_BuscaRapida.Close;
  DMAtualizaSeteHoras.SDS_BuscaRapida.CommandText:=MySql;
  DMAtualizaSeteHoras.CDS_BuscaRapida.Open;
  sgFornNAO:='';
  While Not DMAtualizaSeteHoras.CDS_BuscaRapida.Eof do
  Begin
    If Trim(sgFornNAO)='' Then
     sgFornNAO:=QuotedStr(DMAtualizaSeteHoras.CDS_BuscaRapida.FieldByName('Forn_Nao').AsString)
    Else
     sgFornNAO:=sgFornNAO+', '+QuotedStr(DMAtualizaSeteHoras.CDS_BuscaRapida.FieldByName('Forn_Nao').AsString);

    DMAtualizaSeteHoras.CDS_BuscaRapida.Next;
  End; // While Not DMAtualizaSeteHoras.CDS_BuscaRapida.Eof do
  DMAtualizaSeteHoras.CDS_BuscaRapida.Close;

  // Fornecedores Não Fornecedores no Cadastro =================================
  If Trim(sgFornNAO)='' Then
   sgFornNAO:='''000300'', ''000500'', ''000883'', ''010000'', ''001072'''
  Else
   sgFornNAO:=sgFornNAO+', ''000300'', ''000500'', ''000883'', ''010000'', ''001072''';

  // Numero do Dia da Semana ===================================================
  igDiaSemana:=DayOfWeek(DataHoraServidorFI(DMAtualizaSeteHoras.SDS_DtaHoraServidor))+110;

  // Busca Lojas do Dia ========================================================
  MySql:=' SELECT LPAD(t.cod_aux,2,''0'') Cod_Loja'+
         ' FROM TAB_AUXILIAR t'+
         ' WHERE t.tip_aux='+IntToStr(igDiaSemana)+
         ' AND   t.des_aux1='+QuotedStr('SIM')+
         ' ORDER BY'+
         ' SUBSTRING(t.des_aux FROM 1  FOR 3) desc,'+
         ' SUBSTRING(t.des_aux FROM 5  FOR 3) desc,'+
         ' SUBSTRING(t.des_aux FROM 9  FOR 3) desc,'+
         ' SUBSTRING(t.des_aux FROM 13 FOR 3) desc,'+
         ' SUBSTRING(t.des_aux FROM 17 FOR 3) desc';
  DMAtualizaSeteHoras.CDS_Busca.Close;
  DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
  DMAtualizaSeteHoras.CDS_Busca.Open;

  If DMAtualizaSeteHoras.CDS_Busca.Eof Then
  Begin
    tgArqErros.Add('Sem Loja Para Processamento no Dia '+DateToStr(DataHoraServidorFI(DMAtualizaSeteHoras.SDS_DtaHoraServidor)));

    bgArqErros:=True;
    SalvaErros;

    Application.Terminate;
    Exit;
  End;

  // Zera Sequencia para Novo Docto ============================================
  MySql:=' ALTER SEQUENCE GEN_ODIR RESTART WITH 0';
  DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

  // Cria Memo para Codigos de Lojas ===========================================
  mgMemo:=TMemo.Create(Self);
  mgMemo.Visible:=False;
  mgMemo.Parent:=FrmAtualizaSeteHoras;
  mgMemo.Width:=500;
  mgMemo.Lines.Clear;

  While Not DMAtualizaSeteHoras.CDS_Busca.Eof do
  Begin
    mgMemo.Lines.Add(DMAtualizaSeteHoras.CDS_Busca.FieldByName('Cod_Loja').AsString);

    DMAtualizaSeteHoras.CDS_Busca.Next;
  End; // While Not DMAtualizaSeteHoras.CDS_Busca.Eof do
  DMAtualizaSeteHoras.CDS_BuscaRapida.Close;

  // Calcula Dias Uteis no Período =============================================
  dgDtaHoje  :=DataHoraServidorFI(DMAtualizaSeteHoras.SDS_DtaHoraServidor);
  dgDtaInicio:=IncMonth(dgDtaHoje,-4);
  dgDtaInicio:=StrToDate(DateToStr(dgDtaInicio));
  dgDtaFim   :=dgDtaHoje;
  dgDtaFim   :=StrToDate(DateToStr(dgDtaFim));

  igDiasUteis:=DiasUteisBelShop(dgDtaInicio, dgDtaFim, False, True);

  // Conecta CD ================================================================
  If Not DMAtualizaSeteHoras.ConectaMPMS Then
  Begin
    tgArqErros.Add('Erro ao Conectar CD');

    bgArqErros:=True;
    SalvaErros;

    Application.Terminate;
    Exit;
  End;

  // Busca Produtos com Saldo no CD ============================================
  If Not BuscaProdutosCD Then
  Begin
    tgArqErros.Add('Erro ao Localizar Estoques no CD');

    bgArqErros:=True;
    SalvaErros;

    Application.Terminate;
    Exit;
  End;

  // Insere Produtos do CD =====================================================
  If Not InsereProdutosCD Then
  Begin
    bgArqErros:=True;
    SalvaErros;

    Application.Terminate;
    Exit;
  End;

  // Busca Produtos nas Lojas com Necessidade de Compras =======================
  If Not BuscaProdutosLojas Then
  Begin
    bgArqErros:=True;
    SalvaErros;

    Application.Terminate;
    Exit;
  End;

  // Analisa e Atualiza Transferencias do Dia ==================================
  If Not AnalisaAtualizaTransferencias Then
  Begin
    bgArqErros:=True;
    SalvaErros;

    Application.Terminate;
    Exit;
  End;

  // Enceerra Programa =========================================================
  If tgArqErros.Count>0 Then
  Begin
    bgArqErros:=True;
    SalvaErros;
  End;

  Application.Terminate;
  Exit;

end;

end.

