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

    Procedure Demanda4Meses;
    Procedure BuscaMovtosDebCre;
    Procedure CalculaFluxoCaixaFornecedores(sDt: String=''; sCodForn: String ='');
    Procedure CentroCustos;

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

  igDiasUteis: Integer;

  MySqlSelect: String;

  sgDtaInicio, sgDtaFim,
  sgCodForn, sgCodEmp, sgDesLoja: String;

  bgProcessar: Boolean;

  Flags : Cardinal; // Verifica Internet Ativo - Encerra Necessario

implementation

uses DK_Procs1, UDMConexoes, uj_001, uj_002, UDMAtualizaSeteHoras;

{$R *.dfm}
//==============================================================================
// ODIR - INICIO ===============================================================
//==============================================================================

// Atualiza Centro de Custos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaSeteHoras.CentroCustos;
Var
   bSiga: Boolean;
   i: Integer;
   MySql: String;
   sCodForn, sNumSeq: String;
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
               '         S.CODSUBCUSTO, S.NOMESUBCUSTO'+
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
  dDtaHoje, dDtaInicio, dDtaFim: TDate;
  sMes1, sMes2, sMes3, sMes4, sMes5: String;
  i, ii: Integer;
Begin
  dDtaHoje  :=DataHoraServidorFI(DMAtualizaSeteHoras.SDS_DtaHoraServidor);
  dDtaInicio:=IncMonth(dDtaHoje,-4);
  dDtaInicio:=PrimUltDia(dDtaInicio,'P');
  dDtaFim   :=dDtaHoje;
  dDtaFim   :=StrToDate(DateToStr(dDtaFim-1));

  sgDtaInicio:=f_Troca('/','.',f_Troca('-','.',DateToStr(dDtaInicio)));
  sgDtaFim   :=f_Troca('/','.',f_Troca('-','.',DateToStr(dDtaFim)));

  igDiasUteis:=DiasUteisBelShop(dDtaInicio, dDtaFim, False, True);

  // Calcula os Meses de Demandas Vendas =======================================
  i:=0;
  For ii:=MonthOf(dDtaInicio) to MonthOf(dDtaFim) do
  Begin
    Inc(i);
    if i=1 Then sMes1:=FormatFloat('00',ii);
    if i=2 Then sMes2:=FormatFloat('00',ii);
    if i=3 Then sMes3:=FormatFloat('00',ii);
    if i=4 Then sMes4:=FormatFloat('00',ii);
    if i=5 Then sMes5:=FormatFloat('00',ii);
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
           '     When Cast(lpad(extract(month from dem.dta_ref),2,''0'') as varchar(2))='+sMes1+' Then'+
           '       CAST(dem.quant_ref AS INTEGER)'+
           '     Else'+
           '       0'+
           '   End)'+
           ' AS INTEGER) qtd_venda_M1,'+
           ' CAST(SUM('+
           '   CASE'+
           '     When Cast(lpad(extract(month from dem.dta_ref),2,''0'') as varchar(2))='+sMes2+' Then'+
           '       CAST(dem.quant_ref AS INTEGER)'+
           '     Else'+
           '       0'+
           '   End)'+
           ' AS INTEGER) qtd_venda_M2,'+
           ' CAST(SUM('+
           '   CASE'+
           '     When Cast(lpad(extract(month from dem.dta_ref),2,''0'') as varchar(2))='+sMes3+' Then'+
           '       CAST(dem.quant_ref AS INTEGER)'+
           '     Else'+
           '       0'+
           '   End)'+
           ' AS INTEGER) qtd_venda_M3,'+
           ' CAST(SUM('+
           '   CASE'+
           '     When Cast(lpad(extract(month from dem.dta_ref),2,''0'') as varchar(2))='+sMes4+' Then'+
           '       CAST(dem.quant_ref AS INTEGER)'+
           '     Else'+
           '       0'+
           '   End)'+
           ' AS INTEGER) qtd_venda_M4,'+
           ' CAST(SUM('+
           '   CASE'+
           '     When Cast(lpad(extract(month from dem.dta_ref),2,''0'') as varchar(2))='+sMes5+' Then'+
           '       CAST(dem.quant_ref AS INTEGER)'+
           '     Else'+
           '       0'+
           '   End)'+
           ' AS INTEGER) qtd_venda_M5,'+

           '        CAST(SUM(dem.quant_ref) AS INTEGER) qtd_venda,'+
           '        CAST((SUM(CAST(dem.quant_ref AS NUMERIC(12,4))) / '+IntToStr(igDiasUteis)+') AS NUMERIC(12,4)) qtd_venda_dia,'+

           ' CAST(SUM('+
           '   CASE'+
           '     When Cast(lpad(extract(month from dem.dta_ref),2,''0'') as varchar(2))='+sMes1+' Then'+
           '       CAST(dem.preco AS NUMERIC(12,2))'+
           '     Else'+
           '       0'+
           '   End)'+
           ' AS NUMERIC(12,2)) vlr_venda_M1,'+
           ' CAST(SUM('+
           '   CASE'+
           '     When Cast(lpad(extract(month from dem.dta_ref),2,''0'') as varchar(2))='+sMes2+' Then'+
           '       CAST(dem.preco AS NUMERIC(12,2))'+
           '     Else'+
           '       0'+
           '   End)'+
           ' AS NUMERIC(12,2)) vlr_venda_M2,'+
           ' CAST(SUM('+
           '   CASE'+
           '     When Cast(lpad(extract(month from dem.dta_ref),2,''0'') as varchar(2))='+sMes3+' Then'+
           '       CAST(dem.preco AS NUMERIC(12,2))'+
           '     Else'+
           '       0'+
           '   End)'+
           ' AS NUMERIC(12,2)) vlr_venda_M3,'+
           ' CAST(SUM('+
           '   CASE'+
           '     When Cast(lpad(extract(month from dem.dta_ref),2,''0'') as varchar(2))='+sMes4+' Then'+
           '       CAST(dem.preco AS NUMERIC(12,2))'+
           '     Else'+
           '       0'+
           '   End)'+
           ' AS NUMERIC(12,2)) vlr_venda_M4,'+
           ' CAST(SUM('+
           '   CASE'+
           '     When Cast(lpad(extract(month from dem.dta_ref),2,''0'') as varchar(2))='+sMes5+' Then'+
           '       CAST(dem.preco AS NUMERIC(12,2))'+
           '     Else'+
           '       0'+
           '   End)'+
           ' AS NUMERIC(12,2)) vlr_venda_M5,'+

           '        CAST(SUM(dem.preco) AS NUMERIC(12,2)) vlr_venda,'+
           '        CAST((SUM(CAST(dem.preco AS NUMERIC(12,4))) / '+IntToStr(igDiasUteis)+') AS NUMERIC(12,2)) vlr_venda_dia,'+
           '      '+QuotedStr(sgDtaInicio)+' periodo_inicio,'+
           '      '+QuotedStr(sgDtaFim)+'    periodo_fim,'+
           '      '+IntToStr(igDiasUteis)+'  dias_uteis,'+
           '        CURRENT_DATE dta_atualizacao,'+
           '        CURRENT_TIME hra_atualizacao'+

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

// Busca Movtos de Debito/Credito de Fornecedores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaSeteHoras.BuscaMovtosDebCre;
Var
   bSiga: Boolean;
   i: Integer;
   MySql: String;
   sCodForn, sNumSeq: String;
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
    // Abre Query -----------------------------------------------
    i:=0;
    bSiga:=False;
    While Not bSiga do
    Begin
      Try
        IBQ_ConsultaFilial.Close;
        IBQ_ConsultaFilial.SQL.Clear;
        IBQ_ConsultaFilial.SQL.Add(MySqlSelect);
        IBQ_ConsultaFilial.ParamByName('CodLoja').AsString:=sgCodEmp;
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

        // Exclui Lançamentos para Substituição e Inclução de todos ============
        MySql:=' DELETE FROM FL_CAIXA_FORNECEDORES f'+
               ' WHERE  (f.cod_empresa='+QuotedStr(sgCodEmp)+' or (f.cod_historico=0 or f.cod_historico=999999))'+
               ' AND    f.dta_caixa>='+QuotedStr(sgDtaInicio);
        DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

        While Not IBQ_ConsultaFilial.Eof do
        Begin
          sCodForn:=IBQ_ConsultaFilial.FieldByName('codfornecedor').AsString;
          sgDtaFim:=IBQ_ConsultaFilial.FieldByName('dataentrada').AsString;

          // Busca Num_seq do Dia do Fornecedor ---------------------
          MySql:=' SELECT coalesce(max(cf.num_seq)+1 ,1) Num_Seq'+
                 ' FROM FL_CAIXA_FORNECEDORES cf'+
                 ' WHERE cf.dta_caixa='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDtaFim)))+
                 ' AND   cf.cod_fornecedor='+QuotedStr(sCodForn)+
                 ' AND   cf.num_seq>0'+
                 ' AND   cf.num_seq<999999';
          DMAtualizaSeteHoras.CDS_Busca.Close;
          DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
          DMAtualizaSeteHoras.CDS_Busca.Open;

          sNumSeq:=Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('Num_Seq').AsString);
          DMAtualizaSeteHoras.CDS_Busca.Close;

          // Insere Caixa -----------------------------------------------
          MySql:=' INSERT INTO FL_CAIXA_fORNECEDORES ('+
                 ' COD_FORNECEDOR, DES_FORNECEDOR, DTA_CAIXA, NUM_SEQ,'+
                 ' NUM_CHAVENF, COD_EMPRESA, COD_HISTORICO, TXT_OBS,'+
                 ' NUM_DOCUMENTO, NUM_SERIE, TIP_DEBCRE, VLR_CAIXA, VLR_SALDO)'+

                 ' VALUES ('+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('CODFORNECEDOR').AsString)+', '+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('NOMEFORNECEDOR').AsString)+', '+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('DATAENTRADA').AsString)+', '+
                 sNumSeq+', '+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('CHAVENF').AsString)+', '+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('CODFILIAL').AsString)+', '+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('CODCOMPROVANTE').AsString)+', '+
                 QuotedStr(AnsiUpperCase(IBQ_ConsultaFilial.FieldByName('OBSERVACAO').AsString))+', '+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('NUMERO').AsString)+', '+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('SERIE').AsString)+', '+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('TP_DEBCRE').AsString)+', '+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('VLR_TOTAL').AsString)+', '+
                 ' 0)';
          DMAtualizaSeteHoras.SQLC.Execute(MySql, nil, nil);

          // Guarda Codigo do Fornecedor ----------------------------
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
           Mem_Odir.Lines.Add(sCodForn);

          IBQ_ConsultaFilial.Next;
        End; // While Not IBQ_ConsultaFilial.Eof do
        IBQ_ConsultaFilial.Close;

        //======================================================================
        // Busva total de Compras ==============================================
        //======================================================================



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
end; // Busca Movtos de Debito/Credito de Fornecedores >>>>>>>>>>>>>>>>>>>>>>>>>

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
             MySql+' WHERE c.DTA_CAIXA>='+QuotedStr(f_Troca('/','.',sDt));

           If (Trim(sCodForn)<>'') and (Trim(sDt)<>'') Then
            MySql:=MySql+' And c.COD_FORNECEDOR='+QuotedStr(sCodForn);

           If (Trim(sCodForn)<>'') and (Trim(sDt)='') Then
            MySql:=MySql+' WHERE c.COD_FORNECEDOR='+QuotedStr(sCodForn);

           MySql:=MySql+' ORDER BY c.COD_FORNECEDOR';
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
             ' cx.TIP_DEBCRE, cx.VLR_CAIXA, cx.VLR_SALDO'+
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
                    ' COD_HISTORICO, VLR_SALDO)'+
                    ' Values ('+
                    QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Cod_Fornecedor').AsString)+', '+
                    QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Des_Fornecedor').AsString)+', '+
                    QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Dta_Caixa').AsString)+', '+
                    QuotedStr('0')+', '+
                    QuotedStr('0')+', ';

                   If Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('DtAnterior').AsString)='' Then
                    Begin
                      MySql:=MySql+QuotedStr('0')+')';
                      cVlrSaldo:=0;
                    End
                   Else // If Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('DtAnterior').AsString)='' Then
                    Begin
                      MySql:=MySql+QuotedStr(
                      DMAtualizaSeteHoras.CDS_Busca.FieldByName('Vlr_Saldo').AsString)+')';
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
                        ' SET Vlr_Saldo='+QuotedStr(f_Troca(',','.',CurrToStr(cVlrSaldo)))+
                        ' WHERE DTA_CAIXA='+QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Dta_Caixa').AsString)+
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
           cVlrSaldo:=cVlrSaldo+DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Vlr_Caixa').AsCurrency
          Else
           cVlrSaldo:=cVlrSaldo-DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Vlr_Caixa').AsCurrency;

          MySql:=MySql+' SET Vlr_Saldo='+QuotedStr(f_Troca(',','.',CurrToStr(cVlrSaldo)))+
                       ' WHERE DTA_CAIXA='+QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Dta_Caixa').AsString)+
                       ' And NUM_SEQ='+QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Num_Seq').AsString)+
                       ' And COD_FORNECEDOR='+QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('COD_FORNECEDOR').AsString);
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
                    ' COD_HISTORICO, VLR_SALDO)'+
                    ' VALUES ('+
                    QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Cod_Fornecedor').AsString)+', '+
                    QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Des_Fornecedor').AsString)+', '+
                    QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Dta_Caixa').AsString)+', '+
                    QuotedStr('999999')+', '+
                    QuotedStr('999999')+', '+
                    QuotedStr(f_Troca(',','.',CurrToStr(cVlrSaldo)))+')';
             DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);
           End
          Else // If DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger<>999999 Then
           Begin
             // Atualiza Movto --------------------------------------
             MySql:=' UPDATE FL_CAIXA_FORNECEDORES'+
                    ' SET Vlr_Saldo='+QuotedStr(f_Troca(',','.',CurrToStr(cVlrSaldo)))+
                    ' WHERE DTA_CAIXA='+QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Dta_Caixa').AsString)+
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
  sCompDeb, sCompCre: String;
begin

  //============================================================================
  // Atualiza Demanda 4 Meses ==================================================
  //============================================================================
  Demanda4Meses;

  //============================================================================
  // VERIFICA SE A INTERNET ESTA CONECTADA =====================================
  //============================================================================
  if not InternetGetConnectedState(@Flags, 0) then
  Begin
    Application.Terminate;
    Exit;
  End;

  //============================================================================
  // ATUALIZA CONTA CORRENTE FORNECEDORES ======================================
  //============================================================================
  // Verifica Parametro Enviado ================================================
  sgCodForn:='';
  for i := 1 to ParamCount do
   sgCodForn:=LowerCase(ParamStr(i));

  // Inicializa Data Inicial ===================================================
  sgDtaInicio:=DateToStr(DataHoraServidorFI(DMAtualizaSeteHoras.SDS_DtaHoraServidor)-31);
  sgDtaInicio:=f_Troca('/','.',f_Troca('-','.',sgDtaInicio));

  // Busca Comprovantes ========================================================
  MySql:=' SELECT LPAD(h.cod_historico, 3, ''0'') cod_comprv, h.ind_debcre'+
         ' FROM FL_CAIXA_HISTORICOS h'+
         ' WHERE h.cod_historico <> 0'+
         ' AND   h.cod_historico <> 999999';
  DMAtualizaSeteHoras.CDS_BuscaRapida.Close;
  DMAtualizaSeteHoras.SDS_BuscaRapida.CommandText:=MySql;
  DMAtualizaSeteHoras.CDS_BuscaRapida.Open;

  sCompCre:='';
  sCompDeb:='';
  While Not DMAtualizaSeteHoras.CDS_BuscaRapida.Eof do
  Begin
    If DMAtualizaSeteHoras.CDS_BuscaRapida.FieldByName('ind_debcre').AsString='D' Then
    Begin
      If Trim(sCompDeb)='' Then
       sCompDeb:=QuotedStr(DMAtualizaSeteHoras.CDS_BuscaRapida.FieldByName('cod_comprv').AsString)
      Else
       sCompDeb:=sCompDeb+', '+QuotedStr(DMAtualizaSeteHoras.CDS_BuscaRapida.FieldByName('cod_comprv').AsString);
    End;

    If DMAtualizaSeteHoras.CDS_BuscaRapida.FieldByName('ind_debcre').AsString='C' Then
    Begin
      If Trim(sCompCre)='' Then
       sCompCre:=QuotedStr(DMAtualizaSeteHoras.CDS_BuscaRapida.FieldByName('cod_comprv').AsString)
      Else
       sCompCre:=sCompCre+', '+QuotedStr(DMAtualizaSeteHoras.CDS_BuscaRapida.FieldByName('cod_comprv').AsString);
    End;

    DMAtualizaSeteHoras.CDS_BuscaRapida.Next;
  End; // While Not DMAtualizaSeteHoras.CDS_BuscaRapida.Eof do
  DMAtualizaSeteHoras.CDS_BuscaRapida.Close;

  // Monta Select de Busca de Debitos e Créditos ===============================
  MySqlSelect:=' SELECT mf.codfornecedor, f.nomefornecedor,'+
               ' mf.dataentrada, mf.codcomprovante,'+
               ' CASE'+
               '   WHEN mf.codcomprovante IN ('+sCompCre+') Then'+
               '    ''C'''+
               '   WHEN mf.codcomprovante IN ('+sCompDeb+') Then'+
               '    ''D'''+
               ' End Tp_DebCre,'+
               ' mf.codfilial, mf.observacao, mf.chavenf, mf.numero, mf.serie,'+
               ' ABS(COALESCE(mf.totnota,0.00)) Vlr_Total'+

               ' FROM MFOR mf, FORNECED f'+
               ' WHERE  mf.codfornecedor=f.codfornecedor'+
               ' AND    mf.codfilial=:CodLoja'+
               ' AND    mf.codcomprovante in ('+sCompCre+', '+sCompDeb+')'+
               ' AND    mf.dataentrada>='+QuotedStr(sgDtaInicio);

               If Trim(sgCodForn)<>'' Then
                MySqlSelect:=
                 MySqlSelect+' AND mf.codfornecedor in ('+sgCodForn+')';

               MySqlSelect:=
                MySqlSelect+' ORDER BY mf.codfornecedor, mf.dataentrada';

  // Limpa Codigos de Fornecedores =============================================
  Mem_Odir.Lines.Clear;

  // Busca Lojas ===============================================================
  MySql:=' SELECT e.cod_filial'+
         ' FROM EMP_CONEXOES e'+
         ' WHERE ((e.ind_ativo = ''SIM'') OR'+
         '        (e.cod_filial = ''99'') OR'+
         '        (e.cod_filial = ''50''))'+
         ' ORDER BY 1';
  DMAtualizaSeteHoras.CDS_Lojas.Close;
  DMAtualizaSeteHoras.SDS_Lojas.CommandText:=MySql;
  DMAtualizaSeteHoras.CDS_Lojas.Open;

  DMAtualizaSeteHoras.CDS_Lojas.First;
  While Not DMAtualizaSeteHoras.CDS_Lojas.Eof do
  Begin
    sgCodEmp:=DMAtualizaSeteHoras.CDS_Lojas.FieldByName('COD_FILIAL').AsString;

    BuscaMovtosDebCre;

    DMAtualizaSeteHoras.CDS_Lojas.Next;
  End; // While Not DMAtualizaSeteHoras.CDS_Busca.Eof do
  DMAtualizaSeteHoras.CDS_Lojas.Close;

  // Calcula Fluxo de Caixa do Fornecedore =====================================
  For i:=0 to Mem_Odir.Lines.Count-1 do
  Begin
    CalculaFluxoCaixaFornecedores(sgDtaInicio,Mem_Odir.Lines[i])
  End; // For i:=0 to FrmBelShop.Mem_Odir.Lines.Count-1 do

  //============================================================================
  // Atualiza Centro de Custos =================================================
  //============================================================================
  CentroCustos;

  // Encerra Programa ==========================================================
  Application.Terminate;
  Exit;

end;

end.

