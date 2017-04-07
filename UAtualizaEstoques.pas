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
    Function  ConexaoEmpIndividual(sDataBase, sTransaction, sProcedimento: String): Boolean;
             // Procedimento: (A) Abrir Conex�o (F) Fechar COnex�o

    Procedure CriaQueryIB(sDataBase, sTransaction: String; Var IBQ_Free: TIBQuery;
                          bMatriz, bCriaIBQ: Boolean);

    Function  BuscaMovtosLinx(sCodsInLinx, sCodLojaLinx: String): Boolean;

    // Odir ====================================================================
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAtualizaEstoques: TFrmAtualizaEstoques;

  bgConexaoLocal: Boolean; // Se Conex�o com o Servidor da Matriz � Local - Verifica a Existencia do Arquivo "ConexaoExterna.ini"

  IBQ_Consulta: TIBQuery;

  TD : TTransactionDesc; // Ponteiro de Transa��o

implementation

uses UDMAtualizaEstoques, UDMConexoes, DK_Procs1, DB;

{$R *.dfm}

// Odir ========================================================================
Function TFrmAtualizaEstoques.BuscaMovtosLinx(sCodsInLinx, sCodLojaLinx: String): Boolean;
Var
  MySql: String;
Begin
  Result:=False;

  MySql:=' SELECT p.cod_auxiliar codproduto,'+
         ' COALESCE(ulc.valor_liquido, 0.0000) lastprecocompra,'+
         ' COALESCE((SUM(d.custo_medio) / COUNT(p.cod_auxiliar)), 0.0000) cusmedvalor,'+ /// IGUAL PARA CUSTOMEDIO, LASTCUSTOMEDIO,
         ' CURRENT_TIMESTAMP dataalteracadastro,'+ // Igual para dataalteraestoque, dataalteraestoque_ped,
         ' COALESCE(SUM('+
         '              CASE'+
         '                WHEN m.operacao IN (''E'', ''DS'') THEN'+
         '                  COALESCE(m.quantidade, 0.0000)'+
         '                WHEN m.operacao IN (''S'', ''DE'') THEN'+
         '                  COALESCE(-m.quantidade, 0.0000)'+
         '              END)'+
         ' , 0.00) qtd_movto'+

         ' FROM LINXMOVIMENTO m'+
         '         LEFT JOIN LINXPRODUTOS p          ON m.cod_produto = p.cod_produto'+
         '         LEFT JOIN LINXPRODUTOSDETALHES d  ON m.cod_produto = d.cod_produto'+
         '                                          AND m.empresa     = d.empresa'+
         '         LEFT JOIN(SELECT FIRST 1 uc.cod_produto, COALESCE(uc.valor_liquido, 0.0000) valor_liquido'+
         '                   FROM LINXMOVIMENTO uc'+
         '                   WHERE uc.operacao = ''E'''+
         '                   AND   ((uc.tipo_transacao = ''S'') OR (uc.tipo_transacao = ''E'') OR (uc.tipo_transacao IS NULL))'+
         '                   AND   uc.cancelado = ''N'''+
         '                   AND   uc.excluido = ''N'''+
         '                   AND   uc.empresa = '+sCodLojaLinx+
         '                   ORDER BY uc.data_documento DESC) ulc ON ulc.cod_produto = m.cod_produto'+

         ' WHERE m.operacao IN (''E'', ''DS'', ''S'', ''DE'')'+
         ' AND   m.cancelado = ''N'''+
         ' AND   m.excluido = ''N'''+
         ' AND   m.soma_relatorio = ''S'''+
         ' AND   p.cod_auxiliar IS NOT NULL'+
         ' AND   m.empresa ='+sCodLojaLinx+
         ' AND   m.cod_produto IN ('+sCodsInLinx+')'+
         ' GROUP BY 1, 2';
  DMAtualizaEstoques.CDS_LojaLinx.Close;
  DMAtualizaEstoques.SDS_LojaLinx.CommandText:=MySql;
  DMAtualizaEstoques.CDS_LojaLinx.Open;

  If Trim(DMAtualizaEstoques.CDS_LojaLinx.FieldByName('CodProduto').AsString)<>'' Then
   Result:=True
  Else
   DMAtualizaEstoques.CDS_LojaLinx.Close;


End;

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

procedure TFrmAtualizaEstoques.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.Terminate;
  Exit;

end;

procedure TFrmAtualizaEstoques.FormCreate(Sender: TObject);
begin
  Bt_AtualizarClick(Self);
end;

procedure TFrmAtualizaEstoques.Bt_AtualizarClick(Sender: TObject);
var
  bSiga: Boolean;

  MySql,
  sCodEmpresa, sHora,
  sgDML, sgValues: String;

  iCodLinx: Integer;

  i: Integer;

  // Linx
  sCodsInLinx,
  sDtaLinx,
  sDescCampo, sSaldoSidicom,
  sCusMedValor, sDataAlteraCadastro: String;

  bAchouLinx: Boolean;
begin
  If Not DMAtualizaEstoques.CDS_EmpProcessa.Active Then
   DMAtualizaEstoques.CDS_EmpProcessa.Open;

  // Inicia Processamento ======================================================
  DMAtualizaEstoques.CDS_EmpProcessa.First;
  While Not DMAtualizaEstoques.CDS_EmpProcessa.Eof do
  Begin

    if not InternetGetConnectedState(@Flags, 0) then
    Begin
      Application.Terminate;
      Exit;
    End;

    Try
     iCodLinx:=DMAtualizaEstoques.CDS_EmpProcessaCOD_LINX.AsInteger;
    Except
      iCodLinx:=0;
    End;
    sDtaLinx   :=DMAtualizaEstoques.CDS_EmpProcessaDTA_INICIO_LINX.AsString;
    sCodEmpresa:='08';//DMAtualizaEstoques.CDS_EmpProcessaCOD_FILIAL.AsString;
    iCodLinx:=23;

    sHora:=TimeToStr(Time);

    // =========================================================================
    // SIDICOM =================================================================
    // =========================================================================
    bSiga:=True;
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
    // SIDICOM =================================================================

    // Entra no Processamento ==================================================
    If bSiga Then
    Begin

      // =======================================================================
      // Busca ESTOQUE =========================================================
      // =======================================================================
      DateSeparator:='.';
      DecimalSeparator:='.';

      // =======================================================================
      // SIDICOM ===============================================================
      // =======================================================================
      // Cria Query da Empresa --------------------------------------
      CriaQueryIB('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, IBQ_Consulta, False, True);

      If DMAtualizaEstoques.IBQ_EstoqueLoja.Active Then
       DMAtualizaEstoques.IBQ_EstoqueLoja.Close;

      DMAtualizaEstoques.IBQ_EstoqueLoja.Database:=IBQ_Consulta.Database;
      DMAtualizaEstoques.IBQ_EstoqueLoja.Transaction:=IBQ_Consulta.Transaction;

      MySql:=' SELECT'+
             ' e.codfilial, e.codproduto, COALESCE(e.saldoatual,0.0000) saldoatual, e.pedidopendente,'+
             ' e.zonaendereco, e.corredor, e.prateleira, e.gaveta,'+
             ' e.cusmedvalor, e.customedio, e.lastprecocompra, e.lastcustomedio,'+
             ' e.estoqueideal, e.estoquemaximo,'+
             ' e.dataalteracadastro, e.dataalteraestoque, e.dataalteraestoque_ped,'+
             ' coalesce(p.principalfor,''000000'') principalfor,'+
             ' current_date DTA_ATUALIZACAO, '+QuotedStr(sHora)+' HRA_ATUALIZACAO'+
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
        End; // Try

        If i>2 Then
         Break;
      End; // While Not bSiga do

      // Processamento =========================================================
      If bSiga Then
      Begin
        Try
          // Monta Transacao  -------------------------------------
          TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
          TD.IsolationLevel:=xilREADCOMMITTED;
          DMAtualizaEstoques.SQLC.StartTransaction(TD);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // Atualiza Estoques da Loja ----------------------------
          sgDML:=' UPDATE OR INSERT INTO ESTOQUE ('+
                 ' CODFILIAL, CODPRODUTO, SALDOATUAL, PEDIDOPENDENTE,'+
                 ' ZONAENDERECO, CORREDOR, PRATELEIRA, GAVETA,'+
                 ' CUSMEDVALOR, CUSTOMEDIO, LASTPRECOCOMPRA, LASTCUSTOMEDIO,'+
                 ' ESTOQUEIDEAL, ESTOQUEMAXIMO,'+
                 ' DATAALTERACADASTRO, DATAALTERAESTOQUE, DATAALTERAESTOQUE_PED,'+
                 ' PRINCIPALFOR,'+
                 ' DTA_ATUALIZACAO, HRA_ATUALIZACAO)'+

                 ' VALUES (';

          // Atualiza Estoques da Loja =========================================
          While Not DMAtualizaEstoques.IBQ_EstoqueLoja.Eof do
          Begin
            i:=DMAtualizaEstoques.IBQ_EstoqueLoja.RecNo;

            // Busca Movimentos LINX - INICIO ==================================
            bAchouLinx:=False;
            iCodLinx:=0;
            If iCodLinx<>0 Then
            Begin
              // Busca Codigo no Linx
              MySql:=' SELECT pr.cod_produto'+
                     ' FROM LINXPRODUTOS pr'+
                     ' WHERE Trim(pr.cod_auxiliar)='+QuotedStr(DMAtualizaEstoques.IBQ_EstoqueLojaCODPRODUTO.AsString);
              DMAtualizaEstoques.CDS_Busca.Close;
              DMAtualizaEstoques.SDS_Busca.CommandText:=MySql;
              DMAtualizaEstoques.CDS_Busca.Open;
              sCodsInLinx:='';
              While Not DMAtualizaEstoques.CDS_Busca.Eof do
              Begin
                If sCodsInLinx='' Then
                 sCodsInLinx:=DMAtualizaEstoques.CDS_Busca.FieldByName('Cod_Produto').AsString
                Else
                 sCodsInLinx:=
                  sCodsInLinx+', '+DMAtualizaEstoques.CDS_Busca.FieldByName('Cod_Produto').AsString;

                DMAtualizaEstoques.CDS_Busca.Next;
              End; // While Not DMAtualizaEstoques.CDS_Busca.Eof do
              DMAtualizaEstoques.CDS_Busca.Close;

              if Trim(sCodsInLinx)<>'' Then
              Begin
                If BuscaMovtosLinx(sCodsInLinx, IntToStr(iCodLinx)) Then
                 bAchouLinx:=True
              End;
            End; // If iCodLinx<>0 Then
            // Busca Movimentos LINX - FIM =====================================

            sgValues:='';
            For i:=0 to DMAtualizaEstoques.IBQ_EstoqueLoja.FieldCount-1 do
            Begin

              // ULTIMO CAMPO - HRA_ATUALIZACAO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
              If Trim(DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].FieldName)='HRA_ATUALIZACAO' Then
               Begin
                 sgValues:=sgValues+QuotedStr(DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].AsString)+')';
               End

              // GRAVA RESTO DO REGISTRO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
              Else
               Begin
                 sDescCampo:=Trim(DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].FieldName);

                 // Acerta Valores Conforma LINX >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                 If (iCodLinx<>0) And (bAchouLinx) and
                    ((sDescCampo='PEDIDOPENDENTE')        Or (sDescCampo='ZONAENDERECO')       Or(sDescCampo='ESTOQUEIDEAL') Or
                     (sDescCampo='ESTOQUEMAXIMO')         Or (sDescCampo='CORREDOR')           Or (sDescCampo='PRATELEIRA')  Or
                     (sDescCampo='GAVETA')                Or (sDescCampo='CUSMEDVALOR')        Or (sDescCampo='CUSTOMEDIO')  Or
                     (sDescCampo='LASTPRECOCOMPRA')       Or (sDescCampo='DATAALTERACADASTRO') Or (sDescCampo='DATAALTERAESTOQUE') Or
                     (sDescCampo='DATAALTERAESTOQUE_PED') Or (sDescCampo='LASTCUSTOMEDIO')     Or (sDescCampo='SALDOATUAL')) Then
                  Begin

                    If sDescCampo='PEDIDOPENDENTE' Then
                     sgValues:=sgValues+QuotedStr('0.0000')+', ';

                    If (sDescCampo='ZONAENDERECO') Or (sDescCampo='ESTOQUEIDEAL') Or (sDescCampo='ESTOQUEMAXIMO') Then
                     sgValues:=sgValues+QuotedStr('0')+', ';

                    If (sDescCampo='CORREDOR') Or (sDescCampo='PRATELEIRA') Then
                     sgValues:=sgValues+QuotedStr('000')+', ';

                    If sDescCampo='GAVETA' Then
                     sgValues:=sgValues+QuotedStr('0000')+', ';

                    If sDescCampo='CUSMEDVALOR' Then
                    Begin
                      sCusMedValor:=DMAtualizaEstoques.CDS_LojaLinx.FieldByName('CUSMEDVALOR').AsString;
                      sgValues:=sgValues+QuotedStr(sCusMedValor)+', ';
                    End;

                    If (sDescCampo='CUSTOMEDIO') Or (sDescCampo='LASTCUSTOMEDIO') Then
                    Begin
                      sgValues:=sgValues+QuotedStr(sCusMedValor)+', ';
                    End;

                    If sDescCampo='LASTPRECOCOMPRA' Then
                    Begin
                      sgValues:=sgValues+QuotedStr(DMAtualizaEstoques.CDS_LojaLinx.FieldByName('LASTPRECOCOMPRA').AsString)+', ';
                    End;

                    If sDescCampo='DATAALTERACADASTRO' Then
                    Begin
                      sDataAlteraCadastro:=DMAtualizaEstoques.CDS_LojaLinx.FieldByName('DATAALTERACADASTRO').AsString;
                      sgValues:=sgValues+QuotedStr(sDataAlteraCadastro)+', ';
                    End;

                    If (sDescCampo='DATAALTERAESTOQUE') Or (sDescCampo='DATAALTERAESTOQUE_PED') Then
                    Begin
                      sgValues:=sgValues+QuotedStr(sDataAlteraCadastro)+', ';
                    End;

                    If sDescCampo='SALDOATUAL' Then
                    Begin
                      sSaldoSidicom:=DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].AsString;
                      sSaldoSidicom:=FloatToStr(StrToFloat(sSaldoSidicom)+DMAtualizaEstoques.CDS_LojaLinx.FieldByName('qtd_movto').AsFloat);
                      sgValues:=sgValues+QuotedStr(sSaldoSidicom)+', ';
                    End;
                  End

                 // VALORES NORMAIS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                 Else If Trim(DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].AsString)<>'' Then
                  Begin
                   sgValues:=sgValues+QuotedStr(DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].AsString)+', '
                  End
                 Else // SEM VALOR >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  Begin
                   sgValues:=sgValues+'NULL, ';
                  End;
               End; // If Trim(DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].FieldName)='HRA_ATUALIZACAO' Then

            End; // For i:=0 to DMAtualizaEstoques.IBQ_EstoqueLoja.FieldCount-1 do

            // UPDATE OR INSERT INTO MCLI ====================================
            MySql:=sgDML+sgValues+' MATCHING (CODFILIAL, CODPRODUTO)';
            DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

            DMAtualizaEstoques.IBQ_EstoqueLoja.Next;
          End; // While Not DMAtualizaEstoques.IBQ_EstoqueLoja.Eof do
          DMAtualizaEstoques.IBQ_EstoqueLoja.Close;

          DMAtualizaEstoques.SQLC.Commit(TD);

          DateSeparator:='/';
          DecimalSeparator:=',';
        Except
          on e : Exception do
          Begin
            DMAtualizaEstoques.SQLC.Rollback(TD);
            DMAtualizaEstoques.IBQ_EstoqueLoja.Close;

            DateSeparator:='/';
            DecimalSeparator:=',';

          End; // on e : Exception do
        End; // Try
      End; // If bSiga Then // Processamento ===================================

      DateSeparator:='/';
      DecimalSeparator:=',';

      // Fecha Conex�o =========================================================
//odraqui      If iCodLinx=0 Then // SIDICOM

      ConexaoEmpIndividual('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, 'F');
    End; // If bSiga Then // Entra no Processamento ============================

    DMAtualizaEstoques.CDS_EmpProcessa.Next;
  End; // While Not DMAtualizaEstoques.CDS_EmpProcessa.Eof do
  DMAtualizaEstoques.CDS_EmpProcessa.Close;

// =============================================================================
// FIM DO PROCESSO =============================================================
// =============================================================================

   Close;
end;

end.

//odiraqui
//      // =======================================================================
//      // LINX ==================================================================
//      // =======================================================================
//      If iCodLinx<>0 Then
//      Begin
//        MySql:=' SELECT '+
//               QuotedStr(sCodEmpresa)+' codfilial,'+
//               ' lp.cod_auxiliar codproduto,'+
//               ' lpd.quantidade saldoatual, 0.0000 pedidopendente,'+
//               ' 0 zonaendereco, ''000'' corredor, ''000'' prateleira, ''0000'' gaveta,'+
//               ' lpd.custo_medio cusmedvalor, lpd.custo_medio customedio,'+
//               ' COALESCE((SELECT FIRST 1 m.valor_liquido'+
//               '           FROM LINXMOVIMENTO m'+
//               '           WHERE m.empresa = '+IntToStr(iCodLinx)+
//               '           AND   m.operacao = ''E'''+
//               '           AND   ((m.tipo_transacao=''S'') OR (m.tipo_transacao=''E'') OR (m.tipo_transacao IS NULL))'+
//               '           AND   m.cancelado=''N'''+
//               '           AND   m.excluido=''N'''+
//               '           AND   m.cod_produto = lpd.cod_produto'+
//               '           ORDER BY m.data_documento DESC), 0.0000) lastprecocompra,'+
//               ' lpd.custo_medio lastcustomedio,'+
//               ' 0 estoqueideal, 0 estoquemaximo,'+
//               ' lp.dt_update dataalteracadastro,'+
//               ' lp.dt_update dataalteraestoque,'+
//               ' lp.dt_update dataalteraestoque_ped,'+
//               ' pr.principalfor principalfor,'+
//               ' current_date DTA_ATUALIZACAO, '+QuotedStr(sHora)+' HRA_ATUALIZACAO'+
//
//               ' FROM LINXPRODUTOSDETALHES lpd'+
//               '          LEFT JOIN LINXPRODUTOS lp ON lp.cod_produto = lpd.cod_produto'+
//               '          LEFT JOIN PRODUTO pr ON pr.codproduto = lp.cod_auxiliar'+
//               ' WHERE lpd.empresa = '+IntToStr(iCodLinx)+
//               ' AND   lp.cod_auxiliar IS NOT NULL';
//        DMAtualizaEstoques.CDS_LojaLinx.Close;
//        DMAtualizaEstoques.SDS_LojaLinx.CommandText:=MySql;
//        DMAtualizaEstoques.CDS_LojaLinx.Open;
//      End; // If iCodLinx<>0 Then // LINX ======================================

//OdirAqui
//          If iCodLinx<>0 Then // LINX //////////////////////////////////////////
//          Begin
//            While Not DMAtualizaEstoques.CDS_LojaLinx.Eof do
//            Begin
//              sgValues:='';
//              For i:=0 to DMAtualizaEstoques.CDS_LojaLinx.FieldCount-1 do
//              Begin
//                // ULTIMO CAMPO - HRA_ATUALIZACAO ==================================
//                If Trim(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].FieldName)='HRA_ATUALIZACAO' Then
//                 Begin
//                   sgValues:=sgValues+QuotedStr(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].AsString)+')';
//                 End // If Trim(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].FieldName)='HRA_ATUALIZACAO' Then
//                Else
//                 Begin
//                   // Grava Resto do Registro
//                   If Trim(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].AsString)<>'' Then
//                    sgValues:=sgValues+QuotedStr(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].AsString)+', '
//                   Else
//                    sgValues:=sgValues+'NULL, ';
//                 End;
//              End; // For i:=0 to DMAtualizaEstoques.CDS_LojaLinx.FieldCount-1 do
//
//              // UPDATE OR INSERT INTO MCLI ========================================
//              MySql:=sgDML+sgValues+' MATCHING (CODFILIAL, CODPRODUTO)';
//              DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);
//
//              DMAtualizaEstoques.CDS_LojaLinx.Next;
//            End; // While Not DMAtualizaEstoques.CDS_LojaLinx.Eof do
//            DMAtualizaEstoques.CDS_LojaLinx.Close;
//          End; // If iCodLinx<>0 Then // LINX //////////////////////////////////

