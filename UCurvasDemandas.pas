unit UCurvasDemandas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvXPCore, JvXPButtons, Grids, DBGrids, QExtCtrls,
  IBQuery, IBDatabase, ExtCtrls, DBXpress, StdCtrls, ShellApi, DB, WinInet;

type
  TFrmCurvasDemandas = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Bt_Atualizar: TJvXPButton;
    EdtParamStr: TEdit;

    // Odir ====================================================================
    Function  ConexaoEmpIndividual(sDataBase, sTransaction, sProcedimento: String; bTestar: Boolean = False): Boolean;
    Procedure CriaQueryIB(sDataBase, sTransaction: String; Var IBQ_Free: TIBQuery; bMatriz, bCriaIBQ: Boolean);
        // sDataBase    = Database a Conectar
        // sTransaction = Transaction a Conectar
        // IBQ_Free     = Nome do TIBQuery a Destruir e Reconstruir
        // bMatriz      = Se Conex�o � Matriz (N�o Gera Sql Automaticamente)
        // bCriaIBQ     = Se Destruir e Reconstruir IBQuery
    Function IBTransacao(sSituacao, sTransaction: String): Boolean;

    Procedure CalculaCurvas;

    Procedure AtualizaCurvaCD;  //   // Atualiza Curva ABC no CD - SIDICOM

    // Odir ====================================================================

    procedure FormCreate(Sender: TObject);
    procedure Bt_AtualizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

const //  RODA PROGRAMA NA BARRA DE TAREFAS
  WM_TRAYICON = WM_USER+1;

var
  FrmCurvasDemandas: TFrmCurvasDemandas;

  bExecutaDireto: Boolean;

  sgCodLoja: String;
  cgPerCurvaA, cgPerCurvaB, cgPerCurvaC, cgPerCurvaD, cgPerCurvaE: Currency;

  igDiasEstocagemA, igDiasEstocagemB, igDiasEstocagemC, igDiasEstocagemD, igDiasEstocagemE: Integer;

  // Cria Ponteiro de Transac�o
  TD: TTransactionDesc;

  IBQ_MPMS : TIBQuery;
implementation

uses UDMConexoes, UDMMovtosEmpresas, DK_Procs1, DateUtils, IBCustomDataSet;

{$R *.dfm}

// Odir

Function TFrmCurvasDemandas.IBTransacao(sSituacao, sTransaction: String): Boolean;
Var
  i, ii: Integer;
  b: Boolean;
Begin
  Result:=False;
  b:=False;

  ii:=0;
  While Not b do
  Begin
    Try
      If ii=0 Then
       Begin
         For i:=0 to DMConexoes.ComponentCount-1 do
         Begin
           If DMConexoes.Components[i] is TIBTransaction Then
           Begin
             If (DMConexoes.Components[i] as TIBTransaction).Name=sTransaction Then
             Begin

               If sSituacao='S' Then
               Begin
                 If (DMConexoes.Components[i] as TIBTransaction).Active Then
                  (DMConexoes.Components[i] as TIBTransaction).Rollback;

                 (DMConexoes.Components[i] as TIBTransaction).StartTransaction;
               End; // If sSituacao='S' Then

               If sSituacao='C' Then
               Begin
                 (DMConexoes.Components[i] as TIBTransaction).Commit;
               End;

               If sSituacao='R' Then
               Begin
                 (DMConexoes.Components[i] as TIBTransaction).Rollback;
               End;

               Result:=True;
               ii:=99;
               Break;
             End; // If (DMConexoes.Components[i] as TIBTransaction).Name=sTransaction Then
           End; // If DMConexoes.Components[i] is TIBTransaction Then
         End; // For i:=0 to DMConexoes.ComponentCount-1 do
       End
      Else // If ii=0 Then
       Begin
         If sSituacao='S' Then
          (DMConexoes.Components[i] as TIBTransaction).StartTransaction;

         If sSituacao='C' Then
          (DMConexoes.Components[i] as TIBTransaction).Commit;

         If sSituacao='R' Then
          (DMConexoes.Components[i] as TIBTransaction).Rollback;

         Result:=True;
         ii:=99;
         Break;
       End;
    Except
      Inc(ii)
    End; // Try

    If (ii=0) or (ii>4) Then
     Break;
  End; // While Not b do
End; // Transacao IB >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Atualiza Conexao TIBQuery >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmCurvasDemandas.CriaQueryIB(sDataBase, sTransaction: String; Var IBQ_Free: TIBQuery; bMatriz, bCriaIBQ: Boolean);
Var
  i: Integer;
  iOk: Integer;
Begin
  iOk:=0;

  If bCriaIBQ Then
  Begin
    Try
      If IBQ_Free <> Nil Then
       FreeAndNil(IBQ_Free);
    Except
    End;

    IBQ_Free:=TIBQuery.Create(Self);
    IBQ_Free.BufferChunks := 100;   // Defaut = 1000 , coloque 100
    IBQ_Free.Unidirectional := False;
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
End; // Atualiza Conexao TIBQuery >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Conexao IB Individual >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Procedimento: (A) Abrir Conex�o (F) Fechar Conex�o
Function TFrmCurvasDemandas.ConexaoEmpIndividual(sDataBase, sTransaction, sProcedimento: String; bTestar: Boolean = False): Boolean;
Var
  i, ii: Integer;
  b: Boolean;
Begin
  Result:=False;
  b:=False;

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

                 (DMConexoes.Components[i] as TIBDatabase).Connected:=True;
                 Result:=True;
                 ii:=99;
                 Break;
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

           (DMConexoes.Components[i] as TIBDatabase).Connected:=True;
           Result:=True;
           ii:=99;
           Break;
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
      Begin
        If bTestar Then
        Begin
          Break;
          Exit;
        End;
        Inc(ii);
      End;
    End; // Try

    If (ii=0) or (ii>2) Then // 2 vezes
     Break;
  End; // While Not b do
End; // Conexao IB Individual >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Atualiza Curva ABC no CD - SIDICOM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmCurvasDemandas.AtualizaCurvaCD;
Var
  b: Boolean;
  MySql: String;
Begin
  // Conecta Empresa ===========================================================
  If Not ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'A') Then
  Begin
    Exit;
  End; // If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then

  // Cria Query da Empresa =====================================================
  CriaQueryIB('IBDB_99','IBT_99', IBQ_MPMS, True, True);

  // Monta Transacao ===========================================================
  b:=False;
  While Not b do
  Begin
    b:=IBTransacao('S', 'IBT_99');
  End; // While Not b do

  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMMovtosEmpresas.SQLC.StartTransaction(TD);

  Try
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Atualiza SIDICOM CD
    MySql:=' UPDATE PRODUTO pr'+
           ' SET pr.CLASSEABC='+QuotedStr('E')+
           ' WHERE pr.PRINCIPALFOR NOT IN (''000300'', ''000500'', ''000883'', ''010000'', ''001072'')'+
           ' AND   pr.CLASSEABC<>'+QuotedStr('E');
    IBQ_MPMS.Close;
    IBQ_MPMS.SQL.Clear;
    IBQ_MPMS.SQL.Add(MySql);
    IBQ_MPMS.ExecSQL;

    // Atualiza BelShop
    DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

    MySql:=' SELECT ca.cod_produto, ca.ind_curva'+
           ' FROM ES_FINAN_CURVA_ABC ca'+
           ' WHERE ca.cod_loja='+QuotedStr('99')+
           ' AND   ca.ind_curva<>'+QuotedStr('E')+
           ' ORDER BY ca.cod_produto';
     DMMovtosEmpresas.CDS_Busca.Close;
     DMMovtosEmpresas.SDS_Busca.CommandText:=MySql;
     DMMovtosEmpresas.CDS_Busca.Open;
     While Not DMMovtosEmpresas.CDS_Busca.Eof do
     Begin
       // Atualiza SIDICOM CD
       MySql:=' UPDATE PRODUTO pr'+
              ' SET pr.CLASSEABC='+QuotedStr(DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Curva').AsString)+
              ' WHERE pr.codproduto='+QuotedStr(DMMovtosEmpresas.CDS_Busca.FieldByName('Cod_Produto').AsString);
       IBQ_MPMS.Close;
       IBQ_MPMS.SQL.Clear;
       IBQ_MPMS.SQL.Add(MySql);
       IBQ_MPMS.ExecSQL;

       // Atualiza BelShop
       DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

       DMMovtosEmpresas.CDS_Busca.Next;
     End; // While Not DMMovtosEmpresas.CDS_Busca.Eof do
     DMMovtosEmpresas.CDS_Busca.Close;

    // Commita Transa��o ------------------------------------------
    DMMovtosEmpresas.SQLC.Commit(TD);

    b:=False;
    While Not b do
    Begin
      b:=IBTransacao('C', 'IBT_99');
    End; // While Not b do
  Except
    on e : Exception do
    Begin
      // Rollback Transacao -----------------------------------------
      DMMovtosEmpresas.SQLC.Rollback(TD);

      b:=False;
      While Not b do
      Begin
        b:=IBTransacao('R', 'IBT_99');
      End; // While Not b do
    End; // on e : Exception do
  End;

  DateSeparator:='/';
  DecimalSeparator:=',';

  // Fecha Conex�o =============================================================
  ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
End; // Atualiza Curva ABC no CD - SIDICOM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Calcula Curva ABC de Valores/Quantidades >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmCurvasDemandas.CalculaCurvas;
Var
  MySql,
  sCurva, sDiasEstocagen: String;
  cPerACum: Currency;
  bCurvaA, bCurvaB, bCurvaC, bCurvaD: Boolean;
Begin
  //============================================================================
  // Calculo Curva de Valores ==================================================
  //============================================================================
  MySql:=' SELECT f.cod_produto, f.per_participacao'+
         ' FROM ES_FINAN_CURVA_ABC f'+
         ' WHERE f.cod_loja='+QuotedStr(sgCodLoja)+
         ' ORDER BY f.per_participacao desc';
  DMMovtosEmpresas.CDS_Busca.Close;
  DMMovtosEmpresas.SDS_Busca.CommandText:=MySql;
  DMMovtosEmpresas.CDS_Busca.Open;

  cPerACum:=0;

  bCurvaA:=False;
  bCurvaB:=False;
  bCurvaC:=False;
  bCurvaD:=False;

  While Not DMMovtosEmpresas.CDS_Busca.Eof do
  Begin
    cPerACum:=cPerACum+DMMovtosEmpresas.CDS_Busca.FieldByName('Per_Participacao').AsCurrency;

    // Se Percentual � Zero Ent�o Curva "E" -------------------------
    If DMMovtosEmpresas.CDS_Busca.FieldByName('Per_Participacao').AsCurrency=0 Then
    Begin
      sCurva:='E';
      sDiasEstocagen:=IntToStr(igDiasEstocagemE);
    End
    Else // Curva "A" ---------------------------------------------
    If (cPerAcum<=cgPerCurvaA) Or (Not bCurvaA) Then
    Begin
      bCurvaA:=True;
      sCurva:='A';
      sDiasEstocagen:=IntToStr(igDiasEstocagemA);
    End
    Else // Curva "B" ---------------------------------------------
    If (cPerAcum<=cgPerCurvaB) Or (Not bCurvaB) Then
    Begin
      bCurvaB:=True;
      sCurva:='B';
      sDiasEstocagen:=IntToStr(igDiasEstocagemB);
    End
    Else // Curva "C" ---------------------------------------------
    If (cPerAcum<=cgPerCurvaC) Or (Not bCurvaC) Then
    Begin
      bCurvaC:=True;
      sCurva:='C';
      sDiasEstocagen:=IntToStr(igDiasEstocagemC);
    End
    Else // Curva "D" ---------------------------------------------
    If (cPerAcum<=cgPerCurvaD) Or (Not bCurvaD) Then
    Begin
      bCurvaD:=True;
      sCurva:='D';
      sDiasEstocagen:=IntToStr(igDiasEstocagemD);
    End
    Else // Curva "E" ---------------------------------------------
    Begin
      sCurva:='E';
      sDiasEstocagen:=IntToStr(igDiasEstocagemE);
    End;

    If sCurva<>'E' Then
     Begin
       MySql:=' UPDATE ES_FINAN_CURVA_ABC f'+
              ' SET f.Ind_Curva='+QuotedStr(sCurva)+
              ',    f.Num_Dias_Estocagem='+QuotedStr(sDiasEstocagen)+
              ' WHERE f.Cod_Loja='+QuotedStr(sgCodLoja)+
              ' AND   f.Cod_Produto='+QuotedStr(DMMovtosEmpresas.CDS_Busca.FieldByName('Cod_Produto').AsString);
       DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
     End
    Else
     Begin
       Break;
     End; // If sCurva<>'E' Then

     
    DMMovtosEmpresas.CDS_Busca.Next;
  End; // While Not DMMovtosEmpresas.CDS_Busca.Eof do
  DMMovtosEmpresas.CDS_Busca.Close;

  // Acerta Num_Dias_Estocagem da Curva E ======================================
  MySql:=' UPDATE ES_FINAN_CURVA_ABC f'+
         ' SET f.Num_Dias_Estocagem='+QuotedStr(sDiasEstocagen)+
         ' WHERE f.Cod_Loja='+QuotedStr(sgCodLoja)+
         ' AND   f.Ind_Curva='+QuotedStr(sCurva);
  DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

  //============================================================================
  // Calculo Curva de Quantidades ==============================================
  //============================================================================
  MySql:=' SELECT f.Cod_Produto, f.Per_Part_Qtd'+
         ' FROM ES_FINAN_CURVA_ABC f'+
         ' WHERE f.Cod_Loja='+QuotedStr(sgCodLoja)+
         ' ORDER BY f.Per_Part_Qtd desc';
  DMMovtosEmpresas.CDS_Busca.Close;
  DMMovtosEmpresas.SDS_Busca.CommandText:=MySql;
  DMMovtosEmpresas.CDS_Busca.Open;

  cPerACum:=0;
  While Not DMMovtosEmpresas.CDS_Busca.Eof do
  Begin
    cPerACum:=cPerACum+DMMovtosEmpresas.CDS_Busca.FieldByName('Per_Part_Qtd').AsCurrency;

    // Se Percentual � Zero Ent�o Curva "E" -------------------------
    If DMMovtosEmpresas.CDS_Busca.FieldByName('Per_Part_Qtd').AsCurrency=0 Then
    Begin
      sCurva:='E';
      sDiasEstocagen:=IntToStr(igDiasEstocagemE);
    End
    Else // Curva "A" ---------------------------------------------
    If cPerAcum<=cgPerCurvaA Then
    Begin
      sCurva:='A';
    End
    Else // Curva "B" ---------------------------------------------
    If cPerAcum<=cgPerCurvaB Then
    Begin
      sCurva:='B';
    End
    Else // Curva "C" ---------------------------------------------
    If cPerAcum<=cgPerCurvaC Then
    Begin
      sCurva:='C';
    End
    Else // Curva "D" ---------------------------------------------
    If cPerAcum<=cgPerCurvaD Then
    Begin
      sCurva:='D';
    End
    Else // Curva "E" ---------------------------------------------
    Begin
      sCurva:='E';
    End;

    If sCurva<>'E' Then
     Begin
       MySql:=' UPDATE ES_FINAN_CURVA_ABC f'+
              ' SET f.Ind_Curva_Qtd='+QuotedStr(sCurva)+
              ' WHERE f.Cod_Loja='+QuotedStr(sgCodLoja)+
              ' AND   f.Cod_Produto='+QuotedStr(DMMovtosEmpresas.CDS_Busca.FieldByName('Cod_Produto').AsString);
       DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
     End
    Else
     Begin
       Break;
     End; // If sCurva<>'E' Then
    DMMovtosEmpresas.CDS_Busca.Next;
  End; // While Not DMMovtosEmpresas.CDS_Busca.Eof do
  DMMovtosEmpresas.CDS_Busca.Close;

  //============================================================================
  // Altera Curva Conforme Solicitado peloa ANNA - 17/08/2016 ==================
  //============================================================================
  // 000356	- DELLY DISTR DE  SERV (ALTA MODA)
  //        -  Todos os Prodtos que Conter no Nome "YELLOW"
  //            - Passar da Curva "E' para Curva "C"
  // 001188	- NG DE FRANCE
  //        -  Todos os Prodtos que Iniciarem o Nome com "NG "
  //            - Passar da Curva "E' para Curva "C"
       MySql:=' UPDATE ES_FINAN_CURVA_ABC f'+
              ' SET f.Ind_Curva_Qtd='+QuotedStr(sCurva)+
              ' WHERE f.Cod_Loja='+QuotedStr(sgCodLoja)+
              ' AND   f.Cod_Produto='+QuotedStr(DMMovtosEmpresas.CDS_Busca.FieldByName('Cod_Produto').AsString);
       DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
  //============================================================================


End; // Calcula Curva ABC de Valores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmCurvasDemandas.FormCreate(Sender: TObject);
Var
  i: Integer;
begin

  // Fechar Programa do Agendamento Anterior ===================================
//  ApagaUltProcesso('PMovtosEmpresas.exe');
  //============================================================================

  // Verifica Parametro Enviado ================================================
  EdtParamStr.Clear;
  for i := 1 to ParamCount do
   EdtParamStr.Text:=LowerCase(ParamStr(i));

  If Trim(EdtParamStr.Text)='' Then
   EdtParamStr.Text:='ODIR'; // Agora � Direto por Agendamento

  If EdtParamStr.Text='' Then
  Begin
    Application.Terminate;
    Exit;
  End;

  bExecutaDireto:=False;

 If AnsiUpperCase(EdtParamStr.Text)='ODIR' Then
  Begin
   bExecutaDireto:=True;
  End
 Else
  Begin
    // N�o Apresenta o Form
    Application.ShowMainForm:=True;
  End;

  If bExecutaDireto Then
   Bt_AtualizarClick(Self);
end;

// Atualiza Curvas e Demandas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmCurvasDemandas.Bt_AtualizarClick(Sender: TObject);
Var
  MySql,
  sTotQtdDemandas, sTotVlrDemandas,
  sDtaDemI, sDtaDemF, sDtaTra: String;

  wAnoH, wMesH, wDiaH: Word;

  iTotFeriados, iTotDiasUteis: Integer;
begin
// =============================================================================
// INICIO DO PROCESSO ==========================================================
// =============================================================================
  // Percentuais e Dias de Estocagem das Curvas ABC ============================
  MySql:=' SELECT'+
         ' CASE t.cod_aux'+
         '   WHEN 1 THEN ''A'''+
         '   WHEN 2 THEN ''B'''+
         '   WHEN 3 THEN ''C'''+
         '   WHEN 4 THEN ''D'''+
         '   WHEN 5 THEN ''E'''+
         ' END Ind_Curva,'+
         ' t.des_aux Per_Curva, COALESCE(t.vlr_aux,0) Dias_Estocagem'+
         ' FROM tab_auxiliar t'+
         ' WHERE t.tip_aux=2'+
         ' ORDER BY 1';
  DMMovtosEmpresas.CDS_BuscaRapida.Close;
  DMMovtosEmpresas.SDS_BuscaRapida.CommandText:=MySql;
  DMMovtosEmpresas.CDS_BuscaRapida.Open;

  // Inicializa Variaveis ======================================================
  igDiasEstocagemA:=0;
  igDiasEstocagemB:=0;
  igDiasEstocagemC:=0;
  igDiasEstocagemD:=0;
  igDiasEstocagemE:=0;

  cgPerCurvaA:=0;
  cgPerCurvaB:=0;
  cgPerCurvaC:=0;
  cgPerCurvaD:=0;
  cgPerCurvaE:=0;

  While Not DMMovtosEmpresas.CDS_BuscaRapida.Eof do
  Begin
    If DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('Ind_Curva').AsString='A' Then
     Begin
       igDiasEstocagemA:=DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('Dias_Estocagem').AsInteger;
       cgPerCurvaA     :=DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('Per_Curva').AsCurrency;
     End
    Else If DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('Ind_Curva').AsString='B' Then
     Begin
       igDiasEstocagemB:=DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('Dias_Estocagem').AsInteger;
       cgPerCurvaB     :=DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('Per_Curva').AsCurrency;
     End
    Else If DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('Ind_Curva').AsString='C' Then
     Begin
       igDiasEstocagemC:=DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('Dias_Estocagem').AsInteger;
       cgPerCurvaC     :=DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('Per_Curva').AsCurrency;
     End
    Else If DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('Ind_Curva').AsString='D' Then
     Begin
       igDiasEstocagemD:=DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('Dias_Estocagem').AsInteger;
       cgPerCurvaD     :=DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('Per_Curva').AsCurrency;
     End
    Else If DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('Ind_Curva').AsString='E' Then
     Begin
       igDiasEstocagemE:=DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('Dias_Estocagem').AsInteger;
       cgPerCurvaE     :=DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('Per_Curva').AsCurrency;
     End; // If DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('Ind_Curva').AsString='A' Then

    DMMovtosEmpresas.CDS_BuscaRapida.Next;
  End; // While Not DMMovtosEmpresas.CDS_BuscaRapida.Eof do
  DMMovtosEmpresas.CDS_BuscaRapida.Close;

  // Acerta Percentual das Curvas para Calculo =================================
  cgPerCurvaB:=cgPerCurvaA+cgPerCurvaB;
  cgPerCurvaC:=cgPerCurvaB+cgPerCurvaC;
  cgPerCurvaD:=cgPerCurvaC+cgPerCurvaD;
  cgPerCurvaE:=cgPerCurvaD+cgPerCurvaE;

  // Acerta Datas ==============================================================
  sDtaTra:=DateToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor)-30);
  sDtaTra:=f_Troca('/','.',f_Troca('-','.',sDtaTra));

  DecodeDate(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor), wAnoH, wMesH, wDiaH);
  sDtaDemI:='01.';
  If wMesH<10 Then
   sDtaDemI:=sDtaDemI+'0'+IntToStr(wMesH)+'.'+IntToStr(wAnoH-1)
  Else
   sDtaDemI:=sDtaDemI+IntToStr(wMesH)+'.'+IntToStr(wAnoH-1);

  sDtaDemF:='01.';
  If wMesH<10 Then
   sDtaDemF:=sDtaDemF+'0'+IntToStr(wMesH)+'.'+IntToStr(wAnoH)
  Else
   sDtaDemF:=sDtaDemF+IntToStr(wMesH)+'.'+IntToStr(wAnoH);

  // Dias Uteis no Periodo =====================================================
  iTotDiasUteis:=DiasUteisBelShop(StrToDate(f_Troca('.','/',sDtaDemI)),StrToDate(f_Troca('.','/',sDtaDemF))-1, False, True);

  // Dias de Feriados no Periodo ===============================================
  MySql:=' SELECT COUNT(f.dta_feriado) Feriados'+
         ' FROM FIN_FERIADOS_ANO f'+
         ' WHERE f.dta_feriado BETWEEN '+QuotedStr(sDtaDemI)+' and '+QuotedStr(sDtaDemF)+
         ' AND   f.ind_ativo=''SIM''';
  DMMovtosEmpresas.CDS_BuscaRapida.Close;
  DMMovtosEmpresas.SDS_BuscaRapida.CommandText:=MySql;
  DMMovtosEmpresas.CDS_BuscaRapida.Open;
  iTotFeriados:=DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('Feriados').AsInteger;
  DMMovtosEmpresas.CDS_BuscaRapida.Close;

  // Verifica se Transa��o esta Ativa
  If DMMovtosEmpresas.SQLC.InTransaction Then
   DMMovtosEmpresas.SQLC.Rollback(TD);

  // Busca Lojas ===============================================================
  DMMovtosEmpresas.CDS_EmpProcessa.Close;
  DMMovtosEmpresas.CDS_EmpProcessa.Open;
  DMMovtosEmpresas.CDS_EmpProcessa.First;
  While Not DMMovtosEmpresas.CDS_EmpProcessa.Eof do
  Begin
    // Monta Transacao =========================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMMovtosEmpresas.SQLC.StartTransaction(TD);
    Try
      DateSeparator:='.';
      DecimalSeparator:='.';

      sgCodLoja:=DMMovtosEmpresas.CDS_EmpProcessaCOD_FILIAL.AsString;

      // Busca Valor e Quantidade Total de Demandas ============================
      If sgCodLoja<>'99' Then
       Begin
         MySql:=' SELECT'+
                ' SUM(ABS(COALESCE(mt.quant_ref,0))) Tot_Qtd_Demanda,'+
                ' SUM(ABS(COALESCE(mt.preco,0))) Tot_Vlr_Demanda'+

                ' FROM MOVTOS_EMPRESAS mt, PRODUTO pt, ESTOQUE es'+

                ' WHERE  mt.codproduto=pt.codproduto'+
                ' AND    es.codfilial=mt.codfilial'+
                ' AND    es.codproduto=mt.codproduto'+
                ' AND    mt.ind_tipo=''DM'''+
                ' AND    mt.dta_ref BETWEEN '+QuotedStr(sDtaDemI)+' and '+QuotedStr(sDtaDemF)+
                ' AND    COALESCE(pt.situacaopro,0) in (0,3)'+ // Somente Ativo e N�o Compra
                ' AND    pt.principalfor NOT IN (''010000'', ''000300'', ''000500'', ''001072'')'+
                ' AND    mt.codfilial='+QuotedStr(sgCodLoja);
       End
      Else // If sgCodLoja<>'99' Then
       Begin
         MySql:=' SELECT'+
                ' SUM(f.vlr_demandas) Tot_Vlr_Demanda,'+
                ' SUM(f.qtd_demandas) Tot_Qtd_Demanda'+
                ' FROM ES_FINAN_CURVA_ABC f'+
                ' WHERE EXISTS (SELECT 1'+
                '               FROM EMP_Conexoes c'+
                '               WHERE c.Ind_Ativo=''SIM'''+
                '               AND c.cod_filial=f.cod_loja)';
       End; // If sgCodLoja<>'99' Then
      DMMovtosEmpresas.SDS.Close;
      DMMovtosEmpresas.SDS.CommandText:=MySql;
      DMMovtosEmpresas.SDS.Open;

      sTotQtdDemandas:=DMMovtosEmpresas.SDS.FieldByName('Tot_Qtd_Demanda').AsString;
      sTotQtdDemandas:=f_Troca(',','.',sTotQtdDemandas);
      If Pos('.',sTotQtdDemandas)=0 Then
       sTotQtdDemandas:=sTotQtdDemandas+'.00';

      sTotVlrDemandas:=DMMovtosEmpresas.SDS.FieldByName('Tot_Vlr_Demanda').AsString;
      sTotVlrDemandas:=f_Troca(',','.',sTotVlrDemandas);
      If Pos('.',sTotVlrDemandas)=0 Then
       sTotVlrDemandas:=sTotVlrDemandas+'.00';

      DMMovtosEmpresas.SDS.Close;

      // Coloca num_dias_uteis = 999999 para excluir ap�s Insert ES_FINAN_CURVA_ABC ===
      MySql:=' UPDATE ES_FINAN_CURVA_ABC ff'+
             ' SET ff.num_dias_uteis=999999'+
             ' WHERE ff.cod_loja='+QuotedStr(sgCodLoja);
      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

      // Insere ES_FINAN_CURVA_ABC =============================================
      If sgCodLoja<>'99' Then
       Begin
         MySql:=' INSERT INTO ES_FINAN_CURVA_ABC'+
                ' (COD_LOJA, COD_PRODUTO, EST_MINIMO, NUM_DIAS_UTEIS, VLR_DEMANDAS_ANO,'+
                '  VLR_DEMANDAS, PER_PARTICIPACAO, IND_CURVA, QTD_DEMANDAS_ANO,'+
                '  QTD_DEMANDAS, PER_PART_QTD, IND_CURVA_QTD, NUM_DIAS_ESTOCAGEM,'+
                '  QTD_TRANSITO, DTA_ATUALIZACAO, HRA_ATUALIZACAO, USU_ALTERA,'+
                '  DTA_ALTERA)'+

                ' SELECT '+
                QuotedStr(sgCodLoja)+' COD_LOJA,'+
                ' pr.codproduto,'+

                ' CASE'+
                '   WHEN (pr.datainclusao>=current_date-30) Then'+
                '     COALESCE(fc.est_minimo,3)'+
                '   ELSE'+
                '     COALESCE(fc.est_minimo,0)'+
                ' END EST_MINIMO,'+

                ' ABS(CAST(CASE'+
                '            WHEN pr.datainclusao<CAST('+QuotedStr(sDtaDemI)+' as Date) THEN'+
                '              '+QuotedStr(IntToStr(iTotDiasUteis))+
                '            WHEN pr.datainclusao>cast('+QuotedStr(sDtaDemF)+' as Date) THEN'+
                '              1'+
                '            ELSE'+
                '              ((DATEDIFF(DAY FROM pr.datainclusao TO CAST('+QuotedStr(sDtaDemF)+' AS DATE)))-'+
                '               ((DATEDIFF(DAY FROM pr.datainclusao TO CAST('+QuotedStr(sDtaDemF)+' AS DATE)))/7)-'+
                                IntToStr(iTotFeriados)+')'+
                '          END AS INTEGER)) NUM_DIAS_UTEIS, '+

                sTotVlrDemandas+' Vlr_DEMANDAS_ANO,'+
                ' COALESCE(dem.VLR_DEMANDAS,0) VLR_DEMANDAS,'+
                ' COALESCE(dem.PER_PARTICIPACAO,0) PER_PARTICIPACAO,'+
                ' ''E'' IND_CURVA, '+
                sTotQtdDemandas+' Qtd_DEMANDAS_ANO,'+
                ' COALESCE(dem.QTD_DEMANDAS,0) QTD_DEMANDAS,'+
                ' COALESCE(dem.PER_PART_QTD,0) PER_PART_QTD,'+
                ' ''E'' IND_CURVA_QTD,'+
                ' 0 NUM_DIAS_ESTOCAGEM,'+
                ' COALESCE(dem.QTD_TRANSITO,0) QTD_TRANSITO,'+
                ' CURRENT_DATE Dta_Atualizacao,'+
                ' CURRENT_TIME Hra_Atualizacao,'+
                ' 0 USU_ALTERA,'+
                ' COALESCE(fc.dta_altera,CURRENT_TIMESTAMP) dta_altera'+

                ' FROM PRODUTO pr'+
                '        LEFT JOIN (SELECT md.codfilial,'+
                '                          md.codproduto,'+
                '                          CAST(SUM(DECODE(md.ind_tipo,''DM'',ABS(COALESCE(md.preco,0)))) AS NUMERIC(12,2)) VLR_DEMANDAS,'+
                '                          CAST((((SUM(DECODE(md.ind_tipo,''DM'',ABS(COALESCE(md.preco,0)))))*100)/'+
                                                   sTotVlrDemandas+') AS NUMERIC(12,4)) PER_PARTICIPACAO,'+
                '                          CAST(SUM(DECODE(md.ind_tipo,''DM'',ABS(COALESCE(md.quant_ref,0)))) AS INTEGER) QTD_DEMANDAS,'+
                '                          CAST((((SUM(DECODE(md.ind_tipo,''DM'',ABS(COALESCE(md.quant_ref,0)))))*100)/'+
                                                   sTotQtdDemandas+') AS NUMERIC(12,4)) PER_PART_QTD,'+
                '                          CAST(SUM(DECODE(md.ind_tipo,''TR'',ABS(COALESCE(md.quant_ref,0)))) AS INTEGER) QTD_TRANSITO'+
                '                   FROM MOVTOS_EMPRESAS md'+
                '                   WHERE ((md.ind_tipo=''DM'' AND md.dta_ref BETWEEN '+QuotedStr(sDtaDemI)+' AND '+QuotedStr(sDtaDemF)+')'+
                '                          OR'+
                '                          (md.ind_tipo=''TR'' AND md.dta_ref>='+QuotedStr(sDtaTra)+'))'+
                '                   GROUP BY 1,2) DEM  ON dem.codproduto=pr.codproduto'+
                '                                     AND dem.codfilial='+QuotedStr(sgCodLoja)+
                '        LEFT JOIN ES_FINAN_CURVA_ABC fc  ON fc.cod_produto=pr.codproduto'+
                '                                        AND fc.cod_loja='+QuotedStr(sgCodLoja)+
                '        LEFT JOIN ESTOQUE es  ON es.codproduto=pr.codproduto'+
                '                             AND es.codfilial='+QuotedStr(sgCodLoja)+
                ' WHERE COALESCE(pr.situacaopro,0) in (0,3)'+ // Somente Ativo e N�o Compra
                ' AND   pr.principalfor NOT IN (''010000'', ''000300'', ''000500'', ''001072'')';
       End
      Else // If sgCodLoja<>'99' Then
       Begin
         MySql:=' INSERT INTO ES_FINAN_CURVA_ABC'+
                ' (COD_LOJA, COD_PRODUTO, EST_MINIMO, NUM_DIAS_UTEIS, VLR_DEMANDAS_ANO,'+
                '  VLR_DEMANDAS, PER_PARTICIPACAO, IND_CURVA, QTD_DEMANDAS_ANO,'+
                '  QTD_DEMANDAS, PER_PART_QTD, IND_CURVA_QTD, NUM_DIAS_ESTOCAGEM,'+
                '  QTD_TRANSITO, DTA_ATUALIZACAO, HRA_ATUALIZACAO, USU_ALTERA,'+
                '  DTA_ALTERA)'+

                ' SELECT '+
                QuotedStr(sgCodLoja)+' COD_LOJA,'+
                ' pr.codproduto COD_PRODUTO,'+

                ' CASE'+
                '   WHEN (pr.datainclusao>=current_date-30) Then'+
                '     COALESCE(fc.est_minimo,3)'+
                '   ELSE'+
                '     COALESCE(fc.est_minimo,0)'+
                ' END EST_MINIMO,'+

                ' ABS(CAST(CASE'+
                '            WHEN pr.datainclusao<CAST('+QuotedStr(sDtaDemI)+' as Date) THEN'+
                '              '+QuotedStr(IntToStr(iTotDiasUteis))+
                '            WHEN pr.datainclusao>cast('+QuotedStr(sDtaDemF)+' as Date) THEN'+
                '              1'+
                '            ELSE'+
                '              ((DATEDIFF(DAY FROM pr.datainclusao TO CAST('+QuotedStr(sDtaDemF)+' AS DATE)))-'+
                '               ((DATEDIFF(DAY FROM pr.datainclusao TO CAST('+QuotedStr(sDtaDemF)+' AS DATE)))/7)-'+
                                IntToStr(iTotFeriados)+')'+
                '          END AS INTEGER)) NUM_DIAS_UTEIS, '+
                sTotVlrDemandas+' Vlr_DEMANDAS_ANO,'+
                ' CAST(COALESCE(dem.VLR_DEMANDAS,0) AS NUMERIC(12,2)) VLR_DEMANDAS,'+

                ' CAST('+
                ' CASE'+
                '    WHEN COALESCE(dem.VLR_DEMANDAS,0)<>0 THEN'+
                '       ((COALESCE(dem.VLR_DEMANDAS,0)*100)/'+sTotVlrDemandas+')'+
                '    ELSE'+
                '       0'+
                ' END AS NUMERIC(12,4))  PER_PARTICIPACAO,'+

                ' ''E'' IND_CURVA,'+
                sTotQtdDemandas+' Qtd_DEMANDAS_ANO,'+
                ' CAST(COALESCE(dem.QTD_DEMANDAS,0) AS INTEGER) QTD_DEMANDAS,'+

                ' CAST('+
                ' CASE'+
                '   WHEN COALESCE(dem.QTD_DEMANDAS,0)<>0 THEN'+
                '    ((COALESCE(dem.QTD_DEMANDAS,0)*100)/'+sTotQtdDemandas+')'+
                '   ELSE'+
                '     0'+
                ' END AS NUMERIC(12,4))PER_PART_QTD,'+

                ' ''E'' IND_CURVA_QTD,'+
                ' 0 NUM_DIAS_ESTOCAGEM,'+
                ' CAST(COALESCE(dem.QTD_TRANSITO,0) AS INTEGER) QTD_TRANSITO,'+
                ' CURRENT_DATE Dta_Atualizacao,'+
                ' CURRENT_TIME Hra_Atualizacao,'+
                ' 0 USU_ALTERA,'+
                ' COALESCE(fc.dta_altera,CURRENT_TIMESTAMP) dta_altera'+

                ' FROM produto pr'+
                '    LEFT JOIN (SELECT f.cod_produto,'+
                '                      CAST(SUM(f.vlr_demandas) AS NUMERIC(12,2)) vlr_demandas,'+
                '                      CAST(SUM(f.qtd_demandas) AS NUMERIC(12,2)) qtd_demandas,'+
                '                      CAST(SUM(f.qtd_transito) AS INTEGER) qtd_transito'+
                '               FROM ES_FINAN_CURVA_ABC f'+
                '               WHERE EXISTS (SELECT 1'+
                '                             FROM EMP_Conexoes c'+
                '                             WHERE c.Ind_Ativo=''SIM'''+
                '                             AND c.cod_filial=f.cod_loja)'+
                '               GROUP BY 1) DEM ON dem.cod_produto=pr.codproduto'+

                '    LEFT JOIN ESTOQUE es  ON es.codproduto=pr.codproduto'+
                '                      AND es.codfilial='+QuotedStr(sgCodLoja)+
                '    LEFT JOIN ES_FINAN_CURVA_ABC fc  ON fc.cod_produto=pr.codproduto'+
                '                                    AND fc.cod_loja='+QuotedStr(sgCodLoja)+

//odirapagar
//                ' WHERE ((COALESCE(pr.situacaopro,0)=0) OR (COALESCE(pr.situacaopro,0)=3 AND COALESCE(es.saldoatual,0)>0))'+
                ' WHERE COALESCE(pr.situacaopro,0) in (0,3)'+ // Somente Ativo e N�o Compra
                ' AND   pr.principalfor NOT IN (''010000'', ''000300'', ''000500'', ''001072'')';
       End; // If sgCodLoja<>'99' Then
      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

      // Exclui Movtos com Num_Dias_Uteis = 999999 ES_FINAN_CURVA_ABC =================
      MySql:=' DELETE FROM ES_FINAN_CURVA_ABC ff'+
             ' WHERE ff.cod_loja='+QuotedStr(sgCodLoja)+
             ' AND   ff.num_dias_uteis=999999';
      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

      // Calcula Curvas de Valores e Quantidades ===============================
      CalculaCurvas;

      // Atualiza TABELA ES_CURVA_ABC ==========================================
      MySql:=' DELETE FROM ES_CURVA_ABC ec'+
             ' WHERE ec.cod_loja='+QuotedStr(sgCodLoja);
      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

      MySql:=' INSERT INTO ES_CURVA_ABC'+
             ' SELECT ff.cod_loja COD_LOJA, ff.cod_produto COD_PRODUTO,'+
             '        ff.ind_curva IND_CURVA, pr.datainclusao DTA_INCLUSAO,'+
             '        ff.dta_atualizacao DTA_ATUALIZACAO'+
             ' FROM ES_FINAN_CURVA_ABC ff, PRODUTO pr'+
             ' WHERE ff.cod_produto=pr.codproduto'+
             ' AND   ff.cod_loja='+QuotedStr(sgCodLoja)+
             ' ORDER BY ff.cod_produto';
      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

      // Atualiza Transacao ====================================================
      DMMovtosEmpresas.SQLC.Commit(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
    Except
      on e : Exception do
      Begin
        // Abandona Transacao ==================================================
        DMMovtosEmpresas.SQLC.Rollback(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
      End; // on e : Exception do
    End; // Try

    DMMovtosEmpresas.CDS_EmpProcessa.Next;
  End; // If Lbx_EmpresasProcessar.Items.Count=0 Then
  DMMovtosEmpresas.CDS_EmpProcessa.Close;

  // Atualiza Curva ABC no CD - SIDICOM
  AtualizaCurvaCD;

  Application.Terminate;
  Exit;

// =============================================================================
// FIM DO PROCESSO =============================================================
// =============================================================================
end; // Atualiza Curvas e Demandas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


procedure TFrmCurvasDemandas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  Try
    Application.Terminate;
    Exit;
  Except
  End;
end;

procedure TFrmCurvasDemandas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Try
    Application.Terminate;
    Exit;
  Except
  End;

end;

end.




