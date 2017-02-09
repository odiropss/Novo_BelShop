unit UFrmTransferencias;

// LojaBel_18

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, IBQuery, Grids, DBGrids, StdCtrls, ExtCtrls;

type

  TFrmTransferencias = class(TForm)
    procedure FormCreate(Sender: TObject);

    // ODIR ====================================================================
    Function  BuscaProdutosCD: Boolean;
    Function  InsereProdutosCD: Boolean;

    Function  BuscaProdutosLojas: Boolean;
    Procedure MontaCurvas(sCodLoja: String);
    Procedure BuscaProdutosCurvas(sCodLoja: String);

    Function  BuscaProdutosDemanda(sCodLoja, sCodProduto, sSaldo: String): Boolean;

    Function  AnalisaAtualizaTransferencias: Boolean;

    Procedure SalvaErros;
    Procedure SalvaProcessamento(s:String);
    // ODIR ====================================================================

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTransferencias: TFrmTransferencias;

  bgConexaoLocal: Boolean; // Se Conexão com o Servidor da Matriz é Local - Verifica a Existencia do Arquivo "ConexaoExterna.ini"

  // Cria Ponteiro de transacão
  TD: TTransactionDesc;

  IBQ_TR_Filial,
  IBQ_MPMS: TIBQuery;

  igCodLojaLinx,
  igDiasUteis, igDiaSemana: Integer;

  dgDtaHoje, dgDtaInicio, dgDtaFim: TDate;

  sgFornNAO, sgCodLoja,
  sgNrDocto, sgCurvas: String;

  mgMemo: TMemo;

  tgArqErros: TStringList; // Arquivo de Erros
  bgArqErros: Boolean;     // Se Salva Arquivo de Erros
  sgArqErros: String;      // Nome do Arquivo de Erros

  tgArqProc : TStringList; // Arquivo de Acompanhamento de Processamento
  sgArqProc : String;      // Acompanhamento de Processamento

  // Percentuais de Corte de Reposição
  igPer_CorteA, igPer_CorteB, igPer_CorteC, igPer_CorteD, igPer_CorteE: Integer;

  Flags : Cardinal; // Verifica Internet Ativo - Encerra Necessario

//  hHrInicio, hHrFim: String;

implementation

uses DK_Procs1, UDMConexoes, uj_001, uj_002, UDMTransferencias, DB, DateUtils, Math;

{$R *.dfm}
//==============================================================================
// ODIR - INICIO ===============================================================
//==============================================================================

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
    { Libera a instancia da lista da memória }
    FreeAndNil(tgArqErros);
  End;
End; // Salva Arquivo de Erros, se Houver >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Analisa e Atualiza Transferencias do Dia >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmTransferencias.AnalisaAtualizaTransferencias: Boolean;
Var
  MySql: String;
  s, sObs, sCodProd, sCodGrupo, sCodSubGrupo: String;
  i, iQtdReposicao: Integer;
  bMultiplo, bRepoe: Boolean;
  iMultiplo, iQtdMultiplo: Integer;
  iQtdEst, iQtdMax: Integer;
  cReposicao: Currency;
Begin
  Result:=False;

  // Busca Produtos com Necessidades ============================================
  MySql:=' SELECT *'+
         ' FROM ES_ESTOQUES_LOJAS lo'+
         ' WHERE lo.dta_movto=CURRENT_DATE'+
         ' AND   lo.ind_transf=''CAL'''+
         ' ORDER BY lo.cod_produto';
  DMTransferencias.CDS_EstoqueLoja.Close;
  DMTransferencias.SDS_EstoqueLoja.CommandText:=MySql;
  DMTransferencias.CDS_EstoqueLoja.Open;

  If DMTransferencias.CDS_EstoqueLoja.IsEmpty Then
   Exit;

  // Verifica se Transação esta Ativa
  If DMTransferencias.SQLC.InTransaction Then
   DMTransferencias.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMTransferencias.SQLC.StartTransaction(TD);
  Try
    DMTransferencias.CDS_EstoqueLoja.First;
    While not DMTransferencias.CDS_EstoqueLoja.Eof do
    Begin
      sObs:='';

      s:=DMTransferencias.CDS_EstoqueLojaCOD_LOJA.AsString;

      // Busca Produto com Saldo do CD ------------------------------
      MySql:=' SELECT *'+
             ' FROM ES_ESTOQUES_CD cd'+
             ' WHERE cd.dta_movto=CURRENT_DATE'+
             ' AND   cd.cod_produto='+QuotedStr(DMTransferencias.CDS_EstoqueLojaCOD_PRODUTO.AsString)+
             ' AND   cd.qtd_saldo>0';
      DMTransferencias.CDS_EstoqueCD.Close;
      DMTransferencias.SDS_EstoqueCD.CommandText:=MySql;
      DMTransferencias.CDS_EstoqueCD.Open;

      If DMTransferencias.CDS_EstoqueCD.IsEmpty Then
       Begin
         DateSeparator:='.';
         DecimalSeparator:='.';

         // Apresentar para o Compras
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
         DMTransferencias.CDS_EstoqueLoja.Post;
       End
      Else // If DMTransferencias.CDS_EstoqueCD.IsEmpty Then
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
              sObs:=' - Sem Reposição Pelo Estoque Máximo Menor que Saldo';
              bRepoe:=False;
            End
           Else If (iQtdMax-iQtdEst)<iQtdReposicao Then
            Begin
              sObs:=' - Corte Pela Reposição Maior que Diferença Entre Estoque Máximo Saldo';
              iQtdReposicao:=(iQtdMax-iQtdEst);
            End;
         End;

         //=====================================================================
         // CALCULA MULTIPLOS E PERCENTUAIS DE CORTES ==========================
         //=====================================================================
         If bRepoe Then
         Begin
           //===================================================================
           // Busca Produto Caixa Embarque =====================================
           //===================================================================
           sCodProd:=DMTransferencias.CDS_EstoqueLojaCOD_PRODUTO.AsString;

           MySql:=' SELECT Trim(pr.codgrupo) CodGrupo, Trim(pr.codsubgrupo) CodSubGrupo'+
                  ' FROM PRODUTO pr'+
                  ' WHERE pr.codproduto='+QuotedStr(sCodProd);
           DMTransferencias.CDS_BuscaRapida.Close;
           DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
           DMTransferencias.CDS_BuscaRapida.Open;
           sCodGrupo   :=DMTransferencias.CDS_BuscaRapida.FieldByName('CodGrupo').AsString;
           sCodSubGrupo:=DMTransferencias.CDS_BuscaRapida.FieldByName('CodSubGrupo').AsString;
           DMTransferencias.CDS_BuscaRapida.Close;

           MySql:=' SELECT cp.Cod_Produto, cp.cod_grupo,  cp.cod_subgrupo,'+
                  '        cp.Qtd_Caixa, cp.Per_Corte'+
                  ' FROM PROD_CAIXA_CD cp'+
                  ' WHERE ((cp.cod_produto='+QuotedStr(sCodProd)+')'+
                  '        OR'+
                  '        ((cp.cod_grupo='+QuotedStr(sCodGrupo)+') and (cp.cod_subgrupo is null))'+
                  '        OR'+
                  '        ((cp.cod_grupo='+QuotedStr(sCodGrupo)+') and (cp.cod_subgrupo='+QuotedStr(sCodSubGrupo)+')))'+
                  ' ORDER BY 1 desc, 4 desc';
           DMTransferencias.CDS_BuscaRapida.Close;
           DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
           DMTransferencias.CDS_BuscaRapida.Open;

           bMultiplo:=(DMTransferencias.CDS_BuscaRapida.FieldByName('Per_Corte').AsInteger=0);

           // Calcula Multiplo =================================================
           If (bMultiplo) and (Trim(DMTransferencias.CDS_BuscaRapida.FieldByName('Per_Corte').AsString)<>'') Then
           Begin
             iMultiplo:=DMTransferencias.CDS_BuscaRapida.FieldByName('Qtd_Caixa').AsInteger;
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

             sObs:=Trim(sObs)+' - Utilizado Conforme Multiplo Qtd/Caixa: '+
                   DMTransferencias.CDS_BuscaRapida.FieldByName('Qtd_Caixa').AsString+
                   ' Corte: '+DMTransferencias.CDS_BuscaRapida.FieldByName('Per_Corte').AsString+'%';

           End; // If bMultiplo Then

           // Calcula Por Percentual de Corte ==================================
           If (Not bMultiplo) and (Trim(DMTransferencias.CDS_BuscaRapida.FieldByName('Per_Corte').AsString)<>'') Then
           Begin
             cReposicao:=RoundTo(iQtdReposicao/DMTransferencias.CDS_BuscaRapida.FieldByName('Qtd_Caixa').AsInteger,-2);
             iQtdReposicao:=ParteInteiro(CurrToStr(cReposicao));
             cReposicao:=(cReposicao-iQtdReposicao)*100;

             If cReposicao>=DMTransferencias.CDS_BuscaRapida.FieldByName('Per_Corte').AsCurrency Then
              iQtdReposicao:=iQtdReposicao+1;

             // Acerta Quantidade Final de Reposição ===========================
             iQtdReposicao:=iQtdReposicao*
                            DMTransferencias.CDS_BuscaRapida.FieldByName('Qtd_Caixa').AsInteger;

             bRepoe:=(iQtdReposicao>0);

             sObs:=Trim(sObs)+' - Utilizado Conforme Corte Qtd/Caixa: '+
                   DMTransferencias.CDS_BuscaRapida.FieldByName('Qtd_Caixa').AsString+
                   ' Corte: '+DMTransferencias.CDS_BuscaRapida.FieldByName('Per_Corte').AsString+'%';
           End; // If Not bMultiplo Then
           DMTransferencias.CDS_BuscaRapida.Close;

// OdirApagar - 02/01/2017 - Substituido pela Utilização da Tabela PROD_CAIXA_CD
//           //=====================================================================
//           // ESMALTE - Acerta Quantidade de Reposição para Multiplo de Seis (6)
//           //=====================================================================
//           MySql:=' SELECT p.codproduto'+
//                  ' FROM PRODUTO p'+
//                  ' WHERE p.codproduto='+QuotedStr(DMTransferencias.CDS_EstoqueLojaCOD_PRODUTO.AsString)+
//                  ' AND P.CODGRUPOSUB='+QuotedStr('0100003'); // Sub-Grupo: Esmalte
//           DMTransferencias.CDS_BuscaRapida.Close;
//           DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
//           DMTransferencias.CDS_BuscaRapida.Open;
//           bMultiplo:=(Trim(DMTransferencias.CDS_BuscaRapida.FieldByName('CodProduto').AsString)<>'');
//           DMTransferencias.CDS_BuscaRapida.Close;
//
//           If bMultiplo Then
//           Begin
//             iMultiplo:=6;
//             iQtdMultiplo:=iMultiplo;
//
//             While bMultiplo do
//             Begin
//               If iQtdReposicao<iQtdMultiplo Then
//               Begin
//                 iQtdReposicao:=iQtdMultiplo;
//                 Break;
//               End;
//               iQtdMultiplo:=iQtdMultiplo+iMultiplo;
//             End; // While bMultiplo do
//           End; // If bMultiplo Then
//           //=====================================================================
//           // ESMALTE - Acerta Quantidade de Reposição para Multiplo de 6
//           //=====================================================================
//
//           //=====================================================================
//           // PRODUTO CÓDIGO 923834 - DERMABEL 2,8ML
//           // Acerta Quantidade de Reposição para Multiplo de 25
//           //=====================================================================
//           If (DMTransferencias.CDS_EstoqueLojaCOD_PRODUTO.AsString='923834') And (not bMultiplo) Then
//           Begin
//             iMultiplo:=25;
//             iQtdMultiplo:=iMultiplo;
//
//             bMultiplo:=True;
//             While bMultiplo do
//             Begin
//               If iQtdReposicao<iQtdMultiplo Then
//               Begin
//                 iQtdReposicao:=iQtdMultiplo;
//                 Break;
//               End;
//               iQtdMultiplo:=iQtdMultiplo+iMultiplo;
//             End; // While bMultiplo do
//           End; // If (DMTransferencias.CDS_EstoqueLojaCOD_PRODUTO.AsString='923834') And (not bMultiplo) Then
//           //=====================================================================
//           // PRODUTO CÓDIGO 923834 - DERMABEL 2,8ML
//           // Acerta Quantidade de Reposição para Multiplo de 25
//           //=====================================================================
//
//           //=====================================================================
//           // LUVAS - Acerta Quantidade de Reposição para Multiplo de Seis (100)
//           //=====================================================================
//           If not bMultiplo Then
//           Begin
//             MySql:=' SELECT p.codproduto'+
//                    ' FROM PRODUTO p'+
//                    ' WHERE p.codproduto='+QuotedStr(DMTransferencias.CDS_EstoqueLojaCOD_PRODUTO.AsString)+
//                    ' AND UPPER(p.apresentacao) LIKE ''LUVA%'''; // Nome que Contenha "LUVA"
//             DMTransferencias.CDS_BuscaRapida.Close;
//             DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
//             DMTransferencias.CDS_BuscaRapida.Open;
//             bMultiplo:=(Trim(DMTransferencias.CDS_BuscaRapida.FieldByName('CodProduto').AsString)<>'');
//             DMTransferencias.CDS_BuscaRapida.Close;
//
//             If bMultiplo Then
//             Begin
//               iMultiplo:=100;
//               iQtdMultiplo:=iMultiplo;
//
//               While bMultiplo do
//               Begin
//                 If iQtdReposicao<iQtdMultiplo Then
//                 Begin
//                   iQtdReposicao:=iQtdMultiplo;
//                   Break;
//                 End;
//                 iQtdMultiplo:=iQtdMultiplo+iMultiplo;
//               End; // While bMultiplo do
//             End; // If bMultiplo Then
//           End; // If not bMultiplo Then
//           //=====================================================================
//           // LUVAS - Acerta Quantidade de Reposição para Multiplo de Seis (100)
//           //=====================================================================
//
//           bMultiplo:=False;

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
             End; // If iQtdReposicao>=DMTransferencias.CDS_EstoqueCDQTD_SALDO.AsInteger Then

             //===========================================================================================
             // Mantem Quantidade Maxima de Reposição da Loja 18 em 12 Unidades ==========================
             //===========================================================================================
             If (igCodLojaLinx<>0) and (iQtdReposicao>12) Then
              iQtdReposicao:=12;
             //===========================================================================================

             // Verifica Percentual de Corte da Curva -------------------
             bRepoe:=True;
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
         End; // If bRepoe Then
         DMTransferencias.CDS_EstoqueLoja.Edit;

         // Se Repõe para Loja --------------------------------------
         If bRepoe Then
         Begin
           DMTransferencias.CDS_EstoqueLojaIND_TRANSF.AsString:='SIM';
           DMTransferencias.CDS_EstoqueLojaQTD_TRANSF.AsInteger:=iQtdReposicao;
           DMTransferencias.CDS_EstoqueLojaQTD_A_TRANSF.AsInteger:=iQtdReposicao;
           DMTransferencias.CDS_EstoqueLojaOBS_DOCTO.AsString:=Trim(sObs);

           // Acerta Saldo no CD ------------------------------------
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
           DMTransferencias.CDS_EstoqueLojaOBS_DOCTO.AsString:=Trim(sObs);
         End; // If Not bRepoe Then

         DMTransferencias.CDS_EstoqueLoja.Post;

       End; // If DMTransferencias.CDS_EstoqueCD.IsEmpty Then
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
      MySql:=' SELECT lo.num_seq, lo.cod_produto, TRIM(pr.apresentacao) nome_produto,'+
             ' COALESCE(cd.end_zona,''0'')||''.''||COALESCE(cd.end_corredor,''000'')||''.''||'+
             ' COALESCE(cd.end_prateleira,''000'')||''.''||COALESCE(cd.end_gaveta,''0000'') Enderecamento'+
             ' FROM ES_ESTOQUES_LOJAS lo'+
             '      LEFT JOIN PRODUTO        pr  ON pr.codproduto=lo.cod_produto'+
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

    // Encerra Transação =======================================================
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

      DateSeparator:='/';
      DecimalSeparator:=',';

      bgArqErros:=True;
      tgArqErros.Add('AnalisaAtualizaTransferencias: '+s+' - '+e.message)
    End; // on e : Exception do
  End; // Try
  DMTransferencias.CDS_EstoqueLoja.Close;
End; // Analisa e Atualiza Transferencias do Dia >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Produto e Demanda >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmTransferencias.BuscaProdutosDemanda(sCodLoja, sCodProduto, sSaldo: String): Boolean;
Var
  MySql: String;
  sCurva, sDiasEstocagem, sEstMinimo, sEstMaximo: String;
  sEstMinimoDec, sSaldoDec: String; // Decimal com Ponto
Begin
  Result:=True;

  sCurva        :=DMTransferencias.CDS_CurvasLojaIND_CURVA.AsString;
  sDiasEstocagem:=DMTransferencias.CDS_CurvasLojaDIAS_ESTOCAGEM.AsString;
  sEstMinimo    :=DMTransferencias.CDS_CurvasLojaEST_MINIMO.AsString;
  sEstMaximo    :=DMTransferencias.CDS_CurvasLojaEST_MAXIMO.AsString;

  sEstMinimoDec:=f_Troca(',','.',ZerosCentavos(sEstMinimo,2));
  sSaldoDec    :=f_Troca(',','.',ZerosCentavos(sSaldo,2));

  MySql:=' SELECT'+
         ' CAST(GEN_ID(GEN_ODIR,1) AS INTEGER) Num_Seq,'+
         ' CURRENT_DATE DTA_MOVTO, '+
         sgNrDocto+' NUM_DOCTO, '+
         QuotedStr(sCodLoja)+' COD_LOJA,'+
         ' pr.codproduto COD_PRODUTO, '+
         sEstMinimo+' EST_MINIMO, '+
         sEstMaximo+' EST_MAXIMO, '+
         sSaldo+' QTD_ESTOQUE,'+
         ' SUM(COALESCE(dm.quant_ref,0)) QTD_VENDAS, '+
         QuotedStr(sCurva)+' IND_CURVA, '+
         sDiasEstocagem+' DIAS_ESTOCAGEM, '+
         IntToStr(igDiasUteis)+' QTD_DIAS,'+
         ' ((SUM(COALESCE(dm.quant_ref,0)))/'+IntToStr(igDiasUteis)+') QTD_VENDA_DIA,'+

         ' CAST(((((SUM(COALESCE(dm.quant_ref,0)))/'+IntToStr(igDiasUteis)+')) * '+sDiasEstocagem+') AS INTEGER) QTD_DEMANDA,'+ // Quantidade em Dias de Estocagem

         ' CASE'+ // Quando Demanda Menor Que Estoque Minimo Vale Estoque Minimo
         '   WHEN (CAST(((((SUM(COALESCE(dm.quant_ref,0)))/'+IntToStr(igDiasUteis)+')) * '+sDiasEstocagem+') AS INTEGER))>='+sEstMinimo+' Then'+
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
         '                                   AND dm.codfilial='+QuotedStr(sCodLoja);

  MySql:=
   MySql+' WHERE pr.codproduto='+QuotedStr(sCodProduto)+

         ' GROUP BY 5,25'+

         ' HAVING (CASE'+ // Quando Demanda Menor Que Estoque Minimo Vale Estoque Minimo
         '           WHEN (CAST(((((SUM(COALESCE(dm.quant_ref,0)))/'+IntToStr(igDiasUteis)+')) * '+sDiasEstocagem+') AS INTEGER))>='+sEstMinimo+' Then'+
         '             ((((((SUM(COALESCE(dm.quant_ref,0)))/'+IntToStr(igDiasUteis)+')) * '+sDiasEstocagem+') - '+sSaldo+'))'+
         '           ELSE '+
                       sEstMinimo+' - '+sSaldo+
         '         END)>0';
  DMTransferencias.CDS_ProdutoDemanda.Close;
  DMTransferencias.SDS_ProdutoDemanda.CommandText:=MySql;
  DMTransferencias.CDS_ProdutoDemanda.Open;

  If DMTransferencias.CDS_ProdutoDemanda.Eof Then
  Begin
    Result:=False;
    DMTransferencias.CDS_ProdutoDemanda.Close;
  End;

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

  // Monta Select ==============================================================
  MySql:=' SELECT p.codproduto cod_produto,'+

         ' CASE';

         If bCurvaC Then
          MySql:=
           MySql+'    WHEN ((p.datainclusao>='+QuotedStr(sDta)+') AND (c.ind_curva=''E'')) OR'+
                 '         ((p.principalfor='+QuotedStr('000356')+') AND (c.ind_curva in (''D'',''E'')) AND (p.apresentacao like ''%YELLOW%'')) OR'+
                 '         ((p.principalfor='+QuotedStr('001188')+') AND (c.ind_curva in (''D'',''E'')) AND (p.apresentacao like ''NG %'')) OR'+
                 '         ((p.principalfor='+QuotedStr('000677')+') AND (c.ind_curva in (''D'',''E''))) THEN'
         Else
          MySql:=
           MySql+'    WHEN (p.datainclusao>='+QuotedStr(sDta)+') AND (c.ind_curva=''E'') THEN';

  MySql:=
   MySql+'     ''C'''+
         '    ELSE'+
         '     c.ind_curva'+
         ' END ind_curva,'+

         ' CAST(COALESCE(c.est_minimo,0) AS INTEGER) est_minimo,'+
         ' CAST(COALESCE(c.est_maximo,0) AS INTEGER) est_maximo,'+

         ' CAST(COALESCE(t.vlr_aux,0) AS INTEGER) Dias_Estocagem,'+
         ' CAST(COALESCE(e.saldoatual,0) AS INTEGER) saldoatual,'+
         ' p.datainclusao, p.dataalteracao'+

         ' FROM PRODUTO p'+
         '        LEFT JOIN ES_FINAN_CURVA_ABC c  ON c.cod_produto=p.codproduto'+
         '        LEFT JOIN ESTOQUE e             ON e.codfilial=c.cod_loja'+
         '                                       AND e.codproduto=p.codproduto'+
         '        LEFT JOIN TAB_AUXILIAR t  ON CASE';

         If bCurvaC Then
          MySql:=
           MySql+'                               WHEN ((p.datainclusao>'+QuotedStr(sDta)+') AND (c.ind_curva=''E'')) OR'+
                 '                                    ((p.principalfor='+QuotedStr('000356')+') AND (c.ind_curva in (''D'',''E'')) AND (p.apresentacao like ''%YELLOW%'')) OR'+
                 '                                    ((p.principalfor='+QuotedStr('001188')+') AND (c.ind_curva in (''D'',''E'')) AND (p.apresentacao like ''NG %'')) OR'+
                 '                                    ((p.principalfor='+QuotedStr('000677')+') AND (c.ind_curva in (''D'',''E''))) THEN 3'
         Else
          MySql:=
           MySql+'                               WHEN (p.datainclusao>'+QuotedStr(sDta)+') AND (c.ind_curva=''E'') THEN 3';

  MySql:=
   MySql+'                                       WHEN c.ind_curva=''A'' THEN 1'+
         '                                       WHEN c.ind_curva=''B'' THEN 2'+
         '                                       WHEN c.ind_curva=''C'' THEN 3'+
         '                                       WHEN c.ind_curva=''D'' THEN 4'+
         '                                       WHEN c.ind_curva=''E'' THEN 5'+
         '                                     END=t.cod_aux'+
         '                                 AND t.tip_aux=2'+

         ' WHERE p.situacaopro in (0,3)'+

         ' AND   CAST(COALESCE(c.est_minimo,0) AS INTEGER)>0'+

         ' AND   p.codaplicacao<>''0015'''+ // Não Processa: 0015 = E-Commerce
         ' AND   p.codaplicacao<>''0016'''+ // Não Processa: 0016 = Brindes
         ' AND   p.codaplicacao<>''0017'''+ // Não Processa: 0017 = Provadores
         ' AND   p.principalfor Not in ('+sgFornNAO+')'+ // Tira Fornecedores que Não Entram no Processo de Reposição Automática
         ' AND   UPPER(p.apresentacao) NOT LIKE ''LUVA%'''+ // Tira todas as Luvas

         ' AND   c.cod_loja='+QuotedStr(sCodLoja);

         If bCurvaC Then
          MySql:=
           MySql+' AND   ((c.ind_curva in ('+sgCurvas+')) OR (p.datainclusao>='+QuotedStr(sDta)+' AND c.ind_curva=''E'')'+
                 '         OR'+
                 '        ((p.principalfor='+QuotedStr('000356')+') AND (c.ind_curva in (''D'',''E'')) AND (p.apresentacao like ''%YELLOW%''))'+
                 '         OR'+
                 '        ((p.principalfor='+QuotedStr('000677')+') AND (c.ind_curva in (''D'',''E'')))'+
                 '         OR'+
                 '        ((p.principalfor='+QuotedStr('001188')+') AND (c.ind_curva in (''D'',''E'')) AND (p.apresentacao like ''NG %'')))'
         Else
          MySql:=
           MySql+' AND     ((c.ind_curva in ('+sgCurvas+')) OR (p.datainclusao>='+QuotedStr(sDta)+' AND c.ind_curva=''E''))'+
                 ' AND NOT (((p.principalfor='+QuotedStr('000356')+') AND (c.ind_curva in (''D'',''E'')) AND (p.apresentacao like ''%YELLOW%''))'+
                 '           OR'+
                 '          ((p.principalfor='+QuotedStr('000677')+') AND (c.ind_curva in (''D'',''E'')))'+
                 '           OR'+
                 '          ((p.principalfor='+QuotedStr('001188')+') AND (c.ind_curva in (''D'',''E'')) AND (p.apresentacao like ''NG %'')))';
  MySql:=
   MySql+' ORDER BY p.codproduto';
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

  sCodProduto,
  sCodLoja, sCodEmp: String;

  cQtdSaldo, cQtdMais: Currency;
  bConetada, bSiga: Boolean;
Begin
  Result:=False;

  // Busca Produtos do CD ======================================================
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

  // Abre ClientDataSet para Inclusao de Produtos da Loja ======================
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
    // Zera Sequencia para Novo Docto ==========================================
    MySql:=' ALTER SEQUENCE GEN_ODIR RESTART WITH 0';
    DMTransferencias.SQLC.Execute(MySql,nil,nil);

    // Busca Numero do Docto ===================================================
    MySql:=' SELECT COALESCE(MAX(el.num_docto)+1 ,1) Nr_Docto'+
           ' FROM ES_ESTOQUES_LOJAS el';
    DMTransferencias.CDS_BuscaRapida.Close;
    DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
    DMTransferencias.CDS_BuscaRapida.Open;
    sgNrDocto:=DMTransferencias.CDS_BuscaRapida.FieldByName('Nr_Docto').AsString;
    DMTransferencias.CDS_BuscaRapida.Close;

    sCodLoja:=Trim(mgMemo.Lines[i]);

    // Busca Código da Loja Linx ===============================================
    MySql:=' SELECT COALESCE(e.cod_linx,0) cod_linx'+
           ' FROM EMP_CONEXOES e'+
           ' WHERE e.cod_filial='+QuotedStr(sCodLoja);
    DMTransferencias.CDS_BuscaRapida.Close;
    DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
    DMTransferencias.CDS_BuscaRapida.Open;
    igCodLojaLinx:=DMTransferencias.CDS_BuscaRapida.FieldByName('cod_linx').AsInteger;
    DMTransferencias.CDS_BuscaRapida.Close;


    // Monta Curvas da Loja ====================================================
    MontaCurvas(sCodLoja);
    //==========================================================================
    SalvaProcessamento('10.03.01/999 - Monta Curvas da Loja - '+sCodLoja+' - '+TimeToStr(Time));
    //==========================================================================

    // Busca Produtos das Curvas da Loja =======================================
    BuscaProdutosCurvas(sCodLoja);
    //==========================================================================
    SalvaProcessamento('10.03.02/999 - Busca Produtos das Curvas da Loja - '+sCodLoja+' - '+TimeToStr(Time));
    //==========================================================================

    // Conecta Loja - SIDICOM ==================================================
    bConetada:=False;
    If igCodLojaLinx=0 Then // SIDICOM
    Begin
      If ConexaoEmpIndividual('IBDB_'+sCodLoja, 'IBT_'+sCodLoja, 'A') Then
      Begin
        bConetada:=True;
        try
          CriaQueryIB('IBDB_'+sCodLoja,'IBT_'+sCodLoja,IBQ_TR_Filial, True);
        Except
          bConetada:=False;
        End;
      End;
    End; // If igCodLojaLinx=0 Then // SIDICOM
    //==========================================================================
    SalvaProcessamento('10.03.03/999 - Conecta Loja - '+sCodLoja+' - '+TimeToStr(Time));
    //==========================================================================

    // Monta Transacao ===================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMTransferencias.SQLC.StartTransaction(TD);
    Try
      // Busca Codigo da Loja ---------------------------------------
      MySql:=' SELECT CAST(LPAD(em.cod_emp,6,''0'') AS VARCHAR(6)) Codigo'+
             ' FROM EMP_CONEXOES em'+
             ' WHERE em.cod_filial='+QuotedStr(sCodLoja);
      DMTransferencias.CDS_BuscaRapida.Close;
      DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
      DMTransferencias.CDS_BuscaRapida.Open;
      sCodEmp:=DMTransferencias.CDS_BuscaRapida.FieldByName('Codigo').AsString;
      DMTransferencias.CDS_BuscaRapida.Close;

      //========================================================================
      SalvaProcessamento('10.04/999 - PROCESSA PRODUTOS SELECIONADOS DA LOJA - '+sCodLoja+' - INICIO - '+TimeToStr(Time));
      //========================================================================
      // PROCESSA PRODUTOS SELECIONADOS DA LOJA ================================
      While Not DMTransferencias.CDS_CurvasLoja.Eof do
      Begin
        sCodProduto:=DMTransferencias.CDS_CurvasLojaCOD_PRODUTO.AsString;

        // Busca Transferencias =====================================
        cQtdMais:=0;

        if bConetada Then // SIDICOM
        Begin
          // Busca Tranferencias ------------------------------------
          MySql:=' SELECT mc.numero, mp.codproduto, mp.quantatendida'+
                 ' FROM MCLI mc, MCLIPRO mp'+
                 ' WHERE mc.chavenf=mp.chavenf'+
                 ' AND   mc.codcomprovante in (''009'',''020'')'+
                 ' AND   mc.codfilial=''99'''+
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
                   ' AND   mf.CodFilial='+QuotedStr(sCodLoja)+
                   ' AND   mf.codcomprovante in (''010'',''016'')'+
                   ' AND   mf.numero='+QuotedStr(IBQ_MPMS.FieldByName('numero').AsString);
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
        End; // if bConetada Then // SIDICOM

        // Atualiza o Saldo do Produto ------------------------------
        cQtdSaldo:=DMTransferencias.CDS_CurvasLojaSALDOATUAL.AsCurrency+cQtdMais;

        // Busca Demanda/Quantidade de Reposição --------------------
        If BuscaProdutosDemanda(sCodLoja, sCodProduto, IntToStr(ParteInteiro(CurrToStr(cQtdSaldo)))) Then
        Begin

          // Acerta Arredondamento para Maior Inteiro ---------------
          DMTransferencias.CDS_ProdutoDemanda.Edit;
          DMTransferencias.CDS_ProdutoDemandaQTD_REPOSICAO.AsInteger:=
                 Ceil(DMTransferencias.CDS_ProdutoDemandaQTD_REPOSICAO.AsFloat);
          DMTransferencias.CDS_ProdutoDemanda.Post;

          // Verifica se Tem Produto com Estoque no CD --------------
          If (DMTransferencias.CDS_EstoqueCD.Locate('COD_PRODUTO',sCodProduto,[])) Then
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
          Else // If (DMTransferencias.CDS_EstoqueCD.Locate('COD_PRODUTO',sCodProduto,[]))Then
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
           End; // If (DMTransferencias.CDS_EstoqueCD.Locate('COD_PRODUTO',sCodProduto,[]))Then
        End; // If BuscaProdutosDemanda(sCodLoja, sCodProduto, IntToStr(ParteInteiro(CurrToStr(cQtdSaldo)))) Then
        DMTransferencias.CDS_ProdutoDemanda.Close;

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

      Result:=True;
    Except
      on e : Exception do
      Begin
        IBQ_TR_Filial.Close;

        bgArqErros:=True;
        tgArqErros.Add('BuscaProdutosLojas: '+sCodLoja+' - '+e.message);

        DMTransferencias.SQLC.Rollback(TD);
        DMTransferencias.CDS_EstoqueLoja.CancelUpdates;
      End; // on e : Exception do
    End; // Try

    If bConetada Then
     ConexaoEmpIndividual('IBDB_'+sCodLoja, 'IBT_'+sCodLoja, 'F');

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

  DMTransferencias.CDS_EstoqueCD.Open;

  // Verifica se Transação esta Ativa
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

    // Insere Estoque de Produtos do CD -----------------------------
    IBQ_MPMS.First;
    While not IBQ_MPMS.Eof do
    Begin
      DMTransferencias.CDS_EstoqueCD.Insert;
      For i:=0 to IBQ_MPMS.FieldCount-1 do
       DMTransferencias.CDS_EstoqueCD.Fields[i].Assign(IBQ_MPMS.Fields[i]);

      DMTransferencias.CDS_EstoqueCD.Post;

      IBQ_MPMS.Next;
    End; // While not IBQ_MPMS.Eof do

    // Atualiza Transacao ======================================================
    DMTransferencias.CDS_EstoqueCD.ApplyUpdates(0);
    DMTransferencias.SQLC.Commit(TD);
  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMTransferencias.CDS_EstoqueCD.CancelUpdates;
      DMTransferencias.SQLC.Rollback(TD);

      Result:=False;

      bgArqErros:=True;
      tgArqErros.Add('InsereProdutosCD: 99 - '+e.message)
    End; // on e : Exception do
  End; // Try
  IBQ_MPMS.Close;
  DMTransferencias.CDS_EstoqueCD.Close;

End; // Insere Produtos no CD >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Produtos no CD - Somente se Houver com Estoque > 0 >>>>>>>>>>>>>>>>>>>>
Function TFrmTransferencias.BuscaProdutosCD: Boolean;
Var
  MySql: String;
Begin
  Result:=True;

// OdirApagar Inicio - 02/01/2017
//  MySql:=' SELECT CURRENT_DATE DTA_MOVTO, e.codproduto cod_produto,'+
//
//         ' COALESCE(e.saldoatual,0) qtd_estoque,'+
//         ' 0.00 qtd_saidas,'+
//         ' COALESCE(e.saldoatual,0) qtd_saldo,'+
//
//         // Acerta Multiplos
//         ' CAST(CASE'+
//         '         WHEN p.codgruposub=''0100003'' THEN'+ // ESMALTES - Multiplo de 6
//         '            COALESCE(e.saldoatual,0)/6'+
//         '         WHEN p.codproduto=''923834'' THEN'+ // DERMABEL 2,8ML - Multiplo de 25
//         '            COALESCE(e.saldoatual,0)/25'+
//         '         WHEN UPPER(p.apresentacao) LIKE ''LUVA%'' THEN'+ // LUVAS - Multiplo de 100
//         '            COALESCE(e.saldoatual,0)/100'+
//         '         ELSE'+
//         '            COALESCE(e.saldoatual,0)'+
//         '      END'+
//         ' AS INTEGER) qtd_estoque,'+
//
//         ' 0.00 qtd_saidas,'+
//
//         // Acerta Multiplos
//         ' CAST(CASE'+
//         '         WHEN p.codgruposub=''0100003'' THEN'+ // ESMALTES - Multiplo de 6
//         '            COALESCE(e.saldoatual,0)/6'+
//         '         WHEN p.codproduto=''923834'' THEN'+ // DERMABEL 2,8ML - Multiplo de 25
//         '            COALESCE(e.saldoatual,0)/25'+
//         '         WHEN UPPER(p.apresentacao) LIKE ''LUVA%'' THEN'+ // LUVAS - Multiplo de 100
//         '            COALESCE(e.saldoatual,0)/100'+
//         '         ELSE'+
//         '            COALESCE(e.saldoatual,0)'+
//         '      END'+
//         ' AS INTEGER) qtd_saldo,'+
// OdirApagar Fim - 02/01/2017

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

procedure TFrmTransferencias.FormCreate(Sender: TObject);
Var
  MySql: String;
  sDta, sUsuarioWindows, sComputadorWindows: String;
begin
  // Fechar Programa do Agendamento Anterior ===================================
//  ApagaUltProcesso('PCurvasDemandas.exe');
  //============================================================================

  // Windows: Nome do Usuario e do Computador ==================================
  UsuarioComputadorWindows(sUsuarioWindows, sComputadorWindows);

//  hHrInicio:=TimeToStr(DataHoraServidorFI(DMTransferencias.SDS));

  sDta:=DateToStr(DataHoraServidorFI(DMTransferencias.SDS_DtaHoraServidor));
  sDta:=f_Troca('/','',f_Troca('.','',f_Troca('-','',sDta)));

  //============================================================================
  // Monta Arquivo Texto de Status =============================================
  //============================================================================
  sgArqErros:=IncludeTrailingPathDelimiter(sgPath_Local+'Arquivo Status Transf');
  If (Trim(sgCompServer)<>Trim(sComputadorWindows)) And (Trim(sComputadorWindows)<>'ODIR-PC') Then
  Begin
    sgArqErros:=f_Troca('C:\','',sgArqErros);
    sgArqErros:='\\'+sgIPInternetServer+'\'+sgArqErros;
  End;

  If not DirectoryExists(sgArqErros) then
   ForceDirectories(sgArqErros);

  sgArqErros:=sgArqErros+'ErrosTransf_'+sDta+'.txt';

  DeleteFile(sgArqErros);

  bgArqErros:=False;
  tgArqErros:=TStringList.Create;

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

  //============================================================================
  // Fornecedores que Não São Processados ======================================
  //============================================================================
  MySql:=' SELECT CAST(LPAD(t.cod_aux,6,0) AS VARCHAR(6)) Forn_Nao'+
         ' FROM TAB_AUXILIAR t'+
         ' WHERE t.tip_aux=13';
  DMTransferencias.CDS_BuscaRapida.Close;
  DMTransferencias.SDS_BuscaRapida.CommandText:=MySql;
  DMTransferencias.CDS_BuscaRapida.Open;
  sgFornNAO:='';
  While Not DMTransferencias.CDS_BuscaRapida.Eof do
  Begin
    If Trim(sgFornNAO)='' Then
     sgFornNAO:=QuotedStr(DMTransferencias.CDS_BuscaRapida.FieldByName('Forn_Nao').AsString)
    Else
     sgFornNAO:=sgFornNAO+', '+QuotedStr(DMTransferencias.CDS_BuscaRapida.FieldByName('Forn_Nao').AsString);

    DMTransferencias.CDS_BuscaRapida.Next;
  End; // While Not DMTransferencias.CDS_BuscaRapida.Eof do
  DMTransferencias.CDS_BuscaRapida.Close;

  // Fornecedores Não Fornecedores no Cadastro =================================
  If Trim(sgFornNAO)='' Then
   sgFornNAO:='''000300'', ''000500'', ''000883'', ''010000'', ''001072'''
  Else
   sgFornNAO:=sgFornNAO+', ''000300'', ''000500'', ''000883'', ''010000'', ''001072''';
  //============================================================================
  SalvaProcessamento('01/999 - Fornecedores que Não São Processados - '+TimeToStr(Time));
  //============================================================================

  // Numero do Dia da Semana ===================================================
  igDiaSemana:=DayOfWeek(DataHoraServidorFI(DMTransferencias.SDS_DtaHoraServidor))+110;

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
  DMTransferencias.CDS_Busca.Close;
  DMTransferencias.SDS_Busca.CommandText:=MySql;
  DMTransferencias.CDS_Busca.Open;

  If DMTransferencias.CDS_Busca.Eof Then
  Begin
    tgArqErros.Add('Sem Loja Para Processamento no Dia '+DateToStr(DataHoraServidorFI(DMTransferencias.SDS_DtaHoraServidor)));

    bgArqErros:=True;
    SalvaErros;

    Application.Terminate;
    Exit;
  End;
  //============================================================================
  SalvaProcessamento('02/999 - Busca Lojas do Dia - '+TimeToStr(Time));
  //============================================================================

  // Busca Percentuais de Cortes das Curvas ====================================
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
  //============================================================================
  SalvaProcessamento('03/999 - Busca Percentuais de Cortes das Curvas - '+TimeToStr(Time));
  //============================================================================

  // Zera Sequencia para Novo Docto ============================================
  MySql:=' ALTER SEQUENCE GEN_ODIR RESTART WITH 0';
  DMTransferencias.SQLC.Execute(MySql,nil,nil);
  //============================================================================
  SalvaProcessamento('04/999 - Zera Sequencia para Novo Docto - '+TimeToStr(Time));
  //============================================================================

  // Cria Memo para Codigos de Lojas ===========================================
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
  //============================================================================
  SalvaProcessamento('05/999 - Cria Memo para Codigos de Lojas - '+TimeToStr(Time));
  //============================================================================

  // Calcula Dias Uteis no Período =============================================
  dgDtaHoje  :=DataHoraServidorFI(DMTransferencias.SDS_DtaHoraServidor);
  dgDtaInicio:=IncMonth(dgDtaHoje,-4);
  dgDtaInicio:=StrToDate(DateToStr(dgDtaInicio));
  dgDtaFim   :=dgDtaHoje;
  dgDtaFim   :=StrToDate(DateToStr(dgDtaFim));

  igDiasUteis:=DiasUteisBelShop(dgDtaInicio, dgDtaFim, False, True);
  //============================================================================
  SalvaProcessamento('06/999 - Calcula Dias Uteis no Período - '+TimeToStr(Time));
  //============================================================================

  // Conecta CD ================================================================
  If Not DMTransferencias.ConectaMPMS Then
  Begin
    tgArqErros.Add('Erro ao Conectar CD');

    bgArqErros:=True;
    SalvaErros;

    Application.Terminate;
    Exit;
  End;
  //============================================================================
  SalvaProcessamento('07/999 - Conecta CD - '+TimeToStr(Time));
  //============================================================================

  // Busca Produtos com Saldo no CD ============================================
  If Not BuscaProdutosCD Then
  Begin
    tgArqErros.Add('Erro ao Localizar Estoques no CD');

    bgArqErros:=True;
    SalvaErros;

    Application.Terminate;
    Exit;
  End;
  //============================================================================
  SalvaProcessamento('08/999 - Busca Produtos com Saldo no CD - '+TimeToStr(Time));
  //============================================================================

  // Insere Produtos do CD =====================================================
  If Not InsereProdutosCD Then
  Begin
    bgArqErros:=True;
    SalvaErros;

    Application.Terminate;
    Exit;
  End;
  //============================================================================
  SalvaProcessamento('09/999 - Insere Produtos do CD - '+TimeToStr(Time));
  //============================================================================

  //============================================================================
  SalvaProcessamento('10/999 - Busca Produtos nas Lojas com Necessidade de Compras - INICIO - '+TimeToStr(Time));
  //============================================================================
  // Busca Produtos nas Lojas com Necessidade de Compras =======================
  If Not BuscaProdutosLojas Then
  Begin
    bgArqErros:=True;
    SalvaErros;

    Application.Terminate;
    Exit;
  End;
  //============================================================================
  SalvaProcessamento('10/999 - Busca Produtos nas Lojas com Necessidade de Compras - FIM - '+TimeToStr(Time));
  //============================================================================

  //============================================================================
  SalvaProcessamento('11/999 - Analisa e Atualiza Transferencias do Dia - INICIO - '+TimeToStr(Time));
  //============================================================================
  // Analisa e Atualiza Transferencias do Dia ==================================
  If Not AnalisaAtualizaTransferencias Then
  Begin
    bgArqErros:=True;
    SalvaErros;

    Application.Terminate;
    Exit;
  End;
  //============================================================================
  SalvaProcessamento('11/999 - Analisa e Atualiza Transferencias do Dia - FIM - '+TimeToStr(Time));
  //============================================================================

  // Enceerra Programa =========================================================
  If tgArqErros.Count>0 Then
  Begin
    bgArqErros:=True;
    SalvaErros;
  End;

  //============================================================================
  SalvaProcessamento('12/999 - FIM - '+TimeToStr(Time));
  //============================================================================

  Application.Terminate;
  Exit;

end;

end.

