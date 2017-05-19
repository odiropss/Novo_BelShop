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
            // Procedimento: (A) Abrir Conexão (F) Fechar COnexão

    Procedure CriaQueryIB(sDataBase, sTransaction: String; Var IBQ_Free: TIBQuery;
                          bMatriz, bCriaIBQ: Boolean);
                        // sDataBase    = Database a Conectar
                        // sTransaction = Transaction a Conectar
                        // IBQ_Free     = Nome do TIBQuery a Destruir e Reconstruir
                        // bMatriz      = Se Conexão é Matriz
                        // Se Destruir e Reconstruir IBQuery

    Procedure AtualizaEstoquesMovtosLinx(sCodLinx, sCodBelShop, sDtaInicioLinx: String);

    // Odir ====================================================================
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAtualizaEstoques: TFrmAtualizaEstoques;

  bgConexaoLocal: Boolean; // Se Conexão com o Servidor da Matriz é Local - Verifica a Existencia do Arquivo "ConexaoExterna.ini"

  IBQ_Consulta: TIBQuery;

  TD : TTransactionDesc; // Ponteiro de Transação

implementation

uses UDMAtualizaEstoques, UDMConexoes, DK_Procs1, DB;

{$R *.dfm}

// Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaEstoques.AtualizaEstoquesMovtosLinx(sCodLinx, sCodBelShop, sDtaInicioLinx: String);
Var
  MySql: String;
Begin
  // Verifica se Transação esta Ativa
  If DMAtualizaEstoques.SQLC.InTransaction Then
   DMAtualizaEstoques.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMAtualizaEstoques.SQLC.StartTransaction(TD);
  Try // Try da Transação
    DateSeparator:='.';
    DecimalSeparator:='.';

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
//           ' AND   m.soma_relatorio=''S'''+
           ' AND   p.cod_auxiliar IS NOT NULL'+
           ' AND   Char_length(p.cod_auxiliar)<=6'+
           ' AND   m.data_documento>='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaInicioLinx)))+
           ' AND   m.empresa='+sCodLinx+

           ' GROUP BY 1';
    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

    // Atualiza Custo Médio ====================================================
    MySql:=' UPDATE ESTOQUE e'+
           ' SET e.cusmedvalor=COALESCE((SELECT lm.cusmedvalor'+
           '                             FROM W_LINX_MOVTOS lm'+
           '                             WHERE lm.codproduto=e.codproduto), 0.0000)'+
           ' WHERE e.codfilial='+QuotedStr(sCodBelShop);
    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

    // Atualiza Estoques e Outros Valores ======================================
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
           ' e.dataalteraestoque_ped=current_timestamp'+

           ' WHERE e.codfilial='+QuotedStr(sCodBelShop);
    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

    // Limpar Arquivo Work =====================================================
    MySql:=' DELETE FROM W_LINX_MOVTOS';
    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

    MySql:=' UPDATE OR INSERT INTO ES_PROCESSADOS (cod_loja, cod_linx, dta_proc, Tipo, obs)'+
           ' VALUES ('+
           QuotedStr(sCodBelShop)+', '+
           sCodLinx+', '+
           'CURRENT_TIMESTAMP,'+
           QuotedStr('LsI')+', '+ // Linx Sem Inventário
           '''OK'')'+
           'MATCHING (COD_LOJA)';
    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMAtualizaEstoques.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMAtualizaEstoques.SQLC.Rollback(TD);

      TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
      TD.IsolationLevel:=xilREADCOMMITTED;
      DMAtualizaEstoques.SQLC.StartTransaction(TD);

      MySql:=' UPDATE OR INSERT INTO ES_PROCESSADOS (cod_loja, cod_linx, dta_proc, Tipo, obs)'+
             ' VALUES ('+
             QuotedStr(sCodBelShop)+', '+
             sCodLinx+', '+
             ' CURRENT_TIMESTAMP,'+
             QuotedStr('LsI')+', '+ // Linx Sem Inventário
             QuotedStr(MySql)+')'+
             'MATCHING (COD_LOJA)';
      DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

      DMAtualizaEstoques.SQLC.Commit(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Exit;
    End; // on e : Exception do
  End; // Try da Transação

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

  MySql: String;

  sTipo: String; // Tipo de Processamento:
                 // Sdm = Sidicom
                 // LsI = Linx Sem Inventário
                 // LcI = Linx Com Inventário


  sCodEmpresa, sHora,
  sDtaLinx, sDtaInventLinx,
  sgDML, sgValues: String;

  iCodLinx: Integer;

  i: Integer;

  // Só Atualiza Estoques com Movtos Ent/Sai Linx
  bSoAtulMovtoLinx: Boolean;
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
    sDtaLinx      :=DMAtualizaEstoques.CDS_EmpProcessaDTA_INICIO_LINX.AsString;
    sDtaInventLinx:=DMAtualizaEstoques.CDS_EmpProcessaDTA_INVENTARIO_LINX.AsString;

    sCodEmpresa   :=DMAtualizaEstoques.CDS_EmpProcessaCOD_FILIAL.AsString;
    sHora:=TimeToStr(Time);

    // Odir Roda Uma Loja Linx
//    iCodLinx      :=15;
//    sDtaLinx      :='17/03/2017';
//    sDtaInventLinx:='09/05/2017';
//    sCodEmpresa   :='04';

    // Só Atualiza Estoques com Movtos Ent/Sai Linx (Com Linx Sem Inventário)
    sTipo:='';
    bSoAtulMovtoLinx:=False;
    If (iCodLinx<>0) and (sDtaInventLinx='') Then
    Begin
      AtualizaEstoquesMovtosLinx(IntToStr(iCodLinx), sCodEmpresa, sDtaLinx);

      bSoAtulMovtoLinx:=True;
    End; // If (iCodLinx<>0) and (sDtaInventLinx='') Then

    If Not bSoAtulMovtoLinx Then
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
          CriaQueryIB('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, IBQ_Consulta, False, True);

          If DMAtualizaEstoques.IBQ_EstoqueLoja.Active Then
           DMAtualizaEstoques.IBQ_EstoqueLoja.Close;

          DMAtualizaEstoques.IBQ_EstoqueLoja.Database:=IBQ_Consulta.Database;
          DMAtualizaEstoques.IBQ_EstoqueLoja.Transaction:=IBQ_Consulta.Transaction;

          MySql:=' SELECT'+
                 ' e.codfilial, e.codproduto, e.saldoatual, e.pedidopendente,'+
                 ' e.zonaendereco, e.corredor, e.prateleira, e.gaveta,'+
                 ' e.cusmedvalor, e.customedio, e.lastprecocompra, e.lastcustomedio,'+
                 ' e.estoqueideal, e.estoquemaximo,'+
                 ' e.dataalteracadastro, e.dataalteraestoque, e.dataalteraestoque_ped,'+
                 ' coalesce(p.principalfor,''000000'') principalfor,'+
                 ' e.saldoatual SALDO_FINAL_SIDICOM,'+
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
                 '           ORDER BY m.data_documento DESC), 0.0000) lastprecocompra,'+
                 ' lpd.custo_medio lastcustomedio,'+
                 ' 0 estoqueideal, 0 estoquemaximo,'+
                 ' lp.dt_update dataalteracadastro,'+
                 ' lp.dt_update dataalteraestoque,'+
                 ' lp.dt_update dataalteraestoque_ped,'+
                 ' pr.principalfor principalfor,'+
                 ' current_date DTA_ATUALIZACAO, '+QuotedStr(sHora)+' HRA_ATUALIZACAO'+

                 ' FROM LINXPRODUTOSDETALHES lpd'+
                 '          LEFT JOIN LINXPRODUTOS lp ON lp.cod_produto = lpd.cod_produto'+
                 '          LEFT JOIN PRODUTO pr ON pr.codproduto = CAST(LPAD(lp.cod_auxiliar,6,0) AS VARCHAR(6))'+
                 ' WHERE lpd.empresa = '+IntToStr(iCodLinx)+
                 ' AND   lp.cod_auxiliar IS NOT NULL'+
                 ' AND   Char_length(lp.cod_auxiliar)<=6';
          DMAtualizaEstoques.CDS_LojaLinx.Close;
          DMAtualizaEstoques.SDS_LojaLinx.CommandText:=MySql;
          DMAtualizaEstoques.CDS_LojaLinx.Open;

          sTipo:='LcI'; // Linx Com Inventário
        End; // If (iCodLinx<>0) and (sDtaInventLinx<>'') Then
        // =====================================================================
        // LINX COM INVENTARIO - LINX DIRETO ===================================
        // =====================================================================

        // Processamento =======================================================
        If bSiga Then
        Begin
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

            // Atualiza Estoques da Loja ----------------------------
            sgDML:=' UPDATE OR INSERT INTO ESTOQUE ('+
                   ' CODFILIAL, CODPRODUTO, SALDOATUAL, PEDIDOPENDENTE,'+
                   ' ZONAENDERECO, CORREDOR, PRATELEIRA, GAVETA,'+
                   ' CUSMEDVALOR, CUSTOMEDIO, LASTPRECOCOMPRA, LASTCUSTOMEDIO,'+
                   ' ESTOQUEIDEAL, ESTOQUEMAXIMO,'+
                   ' DATAALTERACADASTRO, DATAALTERAESTOQUE, DATAALTERAESTOQUE_PED,'+
                   ' PRINCIPALFOR,';

                   If iCodLinx=0 Then // Guarda Último Saldo de Estoque no SIDICOM
                    sgDML:=
                     sgDML+' SALDO_FINAL_SIDICOM,';

            sgDML:=
             sgDML+' DTA_ATUALIZACAO, HRA_ATUALIZACAO)'+
                   ' VALUES (';

            // Atualiza Estoques da Loja ----------------------------------
            // =================================================================
            // SIDICOM DIRETO ==================================================
            // =================================================================
            If iCodLinx=0 Then
            Begin
              While Not DMAtualizaEstoques.IBQ_EstoqueLoja.Eof do
              Begin
                sgValues:='';
                For i:=0 to DMAtualizaEstoques.IBQ_EstoqueLoja.FieldCount-1 do
                Begin
                  // ULTIMO CAMPO - HRA_ATUALIZACAO ============================
                  If Trim(DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].FieldName)='HRA_ATUALIZACAO' Then
                  Begin
                    sgValues:=sgValues+QuotedStr(DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].AsString)+')';
                  End // If Trim(DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].FieldName)='HRA_ATUALIZACAO' Then

                  // Grava Resto do Registro ===================================
                  Else
                   Begin
                     If Trim(DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].AsString)<>'' Then
                      sgValues:=sgValues+QuotedStr(DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].AsString)+', '
                     Else
                      sgValues:=sgValues+'NULL, ';
                   End;
                End; // For i:=0 to DMAtualizaEstoques.IBQ_EstoqueLoja.FieldCount-1 do

                // UPDATE OR INSERT INTO MCLI ==================================
                MySql:=sgDML+sgValues+' MATCHING (CODFILIAL, CODPRODUTO)';
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
                sgValues:='';
                For i:=0 to DMAtualizaEstoques.CDS_LojaLinx.FieldCount-1 do
                Begin
                  // ULTIMO CAMPO - HRA_ATUALIZACAO ============================
                  If Trim(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].FieldName)='HRA_ATUALIZACAO' Then
                   Begin
                     sgValues:=sgValues+QuotedStr(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].AsString)+')';
                   End // If Trim(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].FieldName)='HRA_ATUALIZACAO' Then
                  Else
                   Begin
                     // Grava Resto do Registro
                     If Trim(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].AsString)<>'' Then
                      sgValues:=sgValues+QuotedStr(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].AsString)+', '
                     Else
                      sgValues:=sgValues+'NULL, ';
                   End;
                End; // For i:=0 to DMAtualizaEstoques.CDS_LojaLinx.FieldCount-1 do

                // UPDATE OR INSERT INTO MCLI ==================================
                MySql:=sgDML+sgValues+' MATCHING (CODFILIAL, CODPRODUTO)';
                DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

                DMAtualizaEstoques.CDS_LojaLinx.Next;
              End; // While Not DMAtualizaEstoques.CDS_LojaLinx.Eof do
              DMAtualizaEstoques.CDS_LojaLinx.Close;
            End; // If (iCodLinx<>0) And (sDtaInventLinx<>'') Then
            // =================================================================
            // LINX COM INVENTARIO - LINX DIRETO ===============================
            // =================================================================

            MySql:=' UPDATE OR INSERT INTO ES_PROCESSADOS (cod_loja, cod_linx, dta_proc, Tipo, obs)'+
                   ' VALUES ('+
                   QuotedStr(sCodEmpresa)+', '+
                   IntToStr(iCodLinx)+', '+
                   ' CURRENT_TIMESTAMP,'+
                   QuotedStr(sTipo)+', '+ // Linx Com Inventário
                   '''OK'')'+
                   'MATCHING (COD_LOJA)';
            DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

            DMAtualizaEstoques.SQLC.Commit(TD);

            DateSeparator:='/';
            DecimalSeparator:=',';
          Except
            on e : Exception do
            Begin
              DMAtualizaEstoques.SQLC.Rollback(TD);
              DMAtualizaEstoques.IBQ_EstoqueLoja.Close;

              TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
              TD.IsolationLevel:=xilREADCOMMITTED;
              DMAtualizaEstoques.SQLC.StartTransaction(TD);

              MySql:=' UPDATE OR INSERT INTO ES_PROCESSADOS (cod_loja, cod_linx, dta_proc, Tipo, obs)'+
                     ' VALUES ('+
                     QuotedStr(sCodEmpresa)+', '+
                     IntToStr(iCodLinx)+', '+
                     ' CURRENT_TIMESTAMP,'+
                     QuotedStr(sTipo)+', '+ // Linx Com Inventário
                     QuotedStr(MySql)+')'+
                     'MATCHING (COD_LOJA)';
              DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

              DMAtualizaEstoques.SQLC.Commit(TD);

              DateSeparator:='/';
              DecimalSeparator:=',';

            End; // on e : Exception do
          End; // Try
        End; // If bSiga Then // Processamento =================================

        DateSeparator:='/';
        DecimalSeparator:=',';

        // Fecha Conexão =======================================================
        // =====================================================================
        // SIDICOM DIRETO ======================================================
        // =====================================================================
        If iCodLinx=0 Then // SIDICOM
         ConexaoEmpIndividual('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, 'F');
      End; // If bSiga Then // Entra no Processamento ==========================
    End; // If Not bSoAtulMovtoLinx Then

//    Application.Terminate;
    DMAtualizaEstoques.CDS_EmpProcessa.Next;
  End; // While Not DMAtualizaEstoques.CDS_EmpProcessa.Eof do
  DMAtualizaEstoques.CDS_EmpProcessa.Close;

// =============================================================================
// FIM DO PROCESSO =============================================================
// =============================================================================

   Close;
end;

end.
