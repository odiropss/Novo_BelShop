unit UCurvasDemandas;
// OdirRetornar

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
// OdirApagar - SIDICOM - 22/06/2019
//    Function  ConexaoEmpIndividual(sDataBase, sTransaction, sProcedimento: String; bTestar: Boolean = False): Boolean;

// OdirApagar - SIDICOM - 22/06/2019
//    Procedure CriaQueryIB(sDataBase, sTransaction: String; Var IBQ_Free: TIBQuery; bMatriz, bCriaIBQ: Boolean);
        // sDataBase    = Database a Conectar
        // sTransaction = Transaction a Conectar
        // IBQ_Free     = Nome do TIBQuery a Destruir e Reconstruir
        // bMatriz      = Se Conex�o � Matriz (N�o Gera Sql Automaticamente)
        // bCriaIBQ     = Se Destruir e Reconstruir IBQuery

// OdirApagar - SIDICOM - 22/06/2019
//    Function  IBTransacao(sSituacao, sTransaction: String): Boolean;

    Procedure CalculaCurvas;

    // OdirApagar - SIDICOM - 22/06/2019
    // Procedure AtualizaCurvaCD; // Atualiza Curva ABC no CD - SIDICOM

    // OdirApagar - SIDICOM - 22/06/2019
    // Procedure Es_Finan_Curva_ABC_CodLinx; // Atualiza Codigos Linx para Produtos Sem Codigo

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

  // Cria Ponteiro de Transac�o
  TD: TTransactionDesc;

  bExecutaDireto: Boolean;

  sgCodLjSid, sgCodLjLinx: String;
  cgPerCurvaA, cgPerCurvaB, cgPerCurvaC, cgPerCurvaD, cgPerCurvaE: Currency;

  igDiasEstocagemA, igDiasEstocagemB, igDiasEstocagemC, igDiasEstocagemD, igDiasEstocagemE: Integer;

  tgMySqlErro: TStringList; // Arquivo de Processamento e Erros

implementation

uses UDMConexoes, UDMMovtosEmpresas, DK_Procs1, DateUtils, IBCustomDataSet;

{$R *.dfm}

// Odir

// OdirApagar - SIDICOM - 22/06/2019
//// Atualiza Codigos Linx para Produtos Sem Codigo >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//Procedure TFrmCurvasDemandas.Es_Finan_Curva_ABC_CodLinx;
//Var
//  MySql: String;
//Begin
//  // Verifica se Transa��o esta Ativa
//  If DMMovtosEmpresas.SQLC.InTransaction Then
//   DMMovtosEmpresas.SQLC.Rollback(TD);
//
//  // Monta Transacao Para Arrumar Produtos Descontinuados nos Mixs =============
//  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
//  TD.IsolationLevel:=xilREADCOMMITTED;
//  DMMovtosEmpresas.SQLC.StartTransaction(TD);
//
//  // Tira Produtos Descontinuados dos Mix ======================================
//  Try // Try da Transa��o
//    DateSeparator:='.';
//    DecimalSeparator:='.';
//
//    MySql:=' UPDATE ES_FINAN_CURVA_ABC f'+
//           ' SET f.cod_prod_linx=(SELECT p.cod_produto'+
//           '                      FROM LINXPRODUTOS p'+
//           '                      WHERE p.cod_auxiliar=f.cod_produto'+
//           '                      AND   p.desativado=''N'''+
//           '                      AND   EXISTS (SELECT 1'+
//           '                                    FROM LINXPRODUTOS p1'+
//           '                                    WHERE p1.cod_auxiliar IS NOT NULL'+
//           '                                    AND   p1.cod_auxiliar=p.cod_auxiliar'+
//           '                                    GROUP BY p1.cod_auxiliar'+
//           '                                    HAVING COUNT(p1.cod_auxiliar)=1))';
//    DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
//
//    // Atualiza Transacao ======================================================
//    DMMovtosEmpresas.SQLC.Commit(TD);
//  Except // Except da Transa��o
//    on e : Exception do
//    Begin
//      // Abandona Transacao ====================================================
//      DMMovtosEmpresas.SQLC.Rollback(TD);
//    End; // on e : Exception do
//  End; // Try da Transa��o
//  DateSeparator:='/';
//  DecimalSeparator:=',';
//End; // Atualiza Codigos Linx para Produtos Sem Codigo >>>>>>>>>>>>>>>>>>>>>>>>>

// OdirApagar - SIDICOM - 22/06/2019
//// Transacao IB >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//Function TFrmCurvasDemandas.IBTransacao(sSituacao, sTransaction: String): Boolean;
//Var
//  i, ii: Integer;
//  b: Boolean;
//Begin
//  Result:=False;
//  b:=False;
//
//  ii:=0;
//  While Not b do
//  Begin
//    Try
//      If ii=0 Then
//       Begin
//         For i:=0 to DMConexoes.ComponentCount-1 do
//         Begin
//           If DMConexoes.Components[i] is TIBTransaction Then
//           Begin
//             If (DMConexoes.Components[i] as TIBTransaction).Name=sTransaction Then
//             Begin
//
//               If sSituacao='S' Then
//               Begin
//                 If (DMConexoes.Components[i] as TIBTransaction).Active Then
//                  (DMConexoes.Components[i] as TIBTransaction).Rollback;
//
//                 (DMConexoes.Components[i] as TIBTransaction).StartTransaction;
//               End; // If sSituacao='S' Then
//
//               If sSituacao='C' Then
//               Begin
//                 (DMConexoes.Components[i] as TIBTransaction).Commit;
//               End;
//
//               If sSituacao='R' Then
//               Begin
//                 (DMConexoes.Components[i] as TIBTransaction).Rollback;
//               End;
//
//               Result:=True;
//               ii:=99;
//               Break;
//             End; // If (DMConexoes.Components[i] as TIBTransaction).Name=sTransaction Then
//           End; // If DMConexoes.Components[i] is TIBTransaction Then
//         End; // For i:=0 to DMConexoes.ComponentCount-1 do
//       End
//      Else // If ii=0 Then
//       Begin
//         If sSituacao='S' Then
//          (DMConexoes.Components[i] as TIBTransaction).StartTransaction;
//
//         If sSituacao='C' Then
//          (DMConexoes.Components[i] as TIBTransaction).Commit;
//
//         If sSituacao='R' Then
//          (DMConexoes.Components[i] as TIBTransaction).Rollback;
//
//         Result:=True;
//         ii:=99;
//         Break;
//       End;
//    Except
//      Inc(ii)
//    End; // Try
//
//    If (ii=0) or (ii>4) Then
//     Break;
//  End; // While Not b do
//End; // Transacao IB >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// OdirApagar - SIDICOM - 22/06/2019
//// Atualiza Conexao TIBQuery >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//Procedure TFrmCurvasDemandas.CriaQueryIB(sDataBase, sTransaction: String; Var IBQ_Free: TIBQuery; bMatriz, bCriaIBQ: Boolean);
//Var
//  i: Integer;
//  iOk: Integer;
//Begin
//  iOk:=0;
//
//  If bCriaIBQ Then
//  Begin
//    Try
//      If IBQ_Free <> Nil Then
//       FreeAndNil(IBQ_Free);
//    Except
//    End;
//
//    IBQ_Free:=TIBQuery.Create(Self);
//    IBQ_Free.BufferChunks := 100;   // Defaut = 1000 , coloque 100
//    IBQ_Free.Unidirectional := False;
//    IBQ_Free.FetchAll;
//  End;
//
//  IBQ_Free.Close;
//
//  For i:=0 to DMConexoes.ComponentCount-1 do
//  Begin
//    If DMConexoes.Components[i] is TIBDatabase Then
//    Begin
//      If (DMConexoes.Components[i] as TIBDatabase).Name=sDataBase Then
//      Begin
//        IBQ_Free.Database:=(DMConexoes.Components[i] as TIBDatabase);
//        Inc(iOk);
//      End;
//    End;
//
//    If DMConexoes.Components[i] is TIBTransaction Then
//    Begin
//      If (DMConexoes.Components[i] as TIBTransaction).Name=sTransaction Then
//      Begin
//        IBQ_Free.Transaction:=(DMConexoes.Components[i] as TIBTransaction);
//        Inc(iOk);
//      End;
//    End;
//
//    If iOk = 2 Then
//    Begin
//      Break;
//    End;
//  End;
//End; // Atualiza Conexao TIBQuery >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// OdirApagar - SIDICOM - 22/06/2019
//// Conexao IB Individual >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//// Procedimento: (A) Abrir Conex�o (F) Fechar Conex�o
//Function TFrmCurvasDemandas.ConexaoEmpIndividual(sDataBase, sTransaction, sProcedimento: String; bTestar: Boolean = False): Boolean;
//Var
//  i, ii: Integer;
//  b: Boolean;
//Begin
//  Result:=False;
//  b:=False;
//
//  ii:=0;
//  While Not b do
//  Begin
//    Try
//      If ii=0 Then
//       Begin
//         For i:=0 to DMConexoes.ComponentCount-1 do
//         Begin
//           If DMConexoes.Components[i] is TIBDatabase Then
//           Begin
//             If (DMConexoes.Components[i] as TIBDatabase).Name=sDataBase Then
//             Begin
//
//               // Abre Conex�o --------------------------------------
//               If sProcedimento='A' Then
//               Begin
//                 If (DMConexoes.Components[i] as TIBDatabase).Connected Then
//                  (DMConexoes.Components[i] as TIBDatabase).Connected:=False;
//
//                 (DMConexoes.Components[i] as TIBDatabase).Connected:=True;
//                 Result:=True;
//                 ii:=99;
//                 Break;
//               End; // If sProcedimento='A' Then
//
//               // Fecha Conex�o --------------------------------------
//               If sProcedimento='F' Then
//               Begin
//                 (DMConexoes.Components[i] as TIBDatabase).Connected:=False;
//                 Result:=True;
//                 ii:=99;
//                 Break;
//               End; // If sProcedimento='A' Then
//             End;
//           End; // If DMConexoes.Components[i] is TIBDatabase Then
//         End; // For i:=0 to DMConexoes.ComponentCount-1 do
//       End
//      Else // If ii=0 Then
//       Begin
//
//         // Abre Conex�o --------------------------------------
//         If sProcedimento='A' Then
//         Begin
//           If (DMConexoes.Components[i] as TIBDatabase).Connected Then
//            (DMConexoes.Components[i] as TIBDatabase).Connected:=False;
//
//           (DMConexoes.Components[i] as TIBDatabase).Connected:=True;
//           Result:=True;
//           ii:=99;
//           Break;
//         End; // If sProcedimento='A' Then
//
//         // Fecha Conex�o -------------------------------------
//         If sProcedimento='F' Then
//         Begin
//           (DMConexoes.Components[i] as TIBDatabase).Connected:=False;
//           Result:=True;
//           ii:=99;
//           Break;
//         End; // If sProcedimento='A' Then
//
//       End;
//    Except
//      Begin
//        If bTestar Then
//        Begin
//          Break;
//          Exit;
//        End;
//        Inc(ii);
//      End;
//    End; // Try
//
//    If (ii=0) or (ii>2) Then // 2 vezes
//     Break;
//  End; // While Not b do
//End; // Conexao IB Individual >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// OdirApagar - SIDICOM - 22/06/2019
//// Atualiza Curva ABC no CD - SIDICOM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//Procedure TFrmCurvasDemandas.AtualizaCurvaCD;
//Var
//  b: Boolean;
//  MySql: String;
//Begin
//  // Conecta Empresa ===========================================================
//  If Not ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'A') Then
//  Begin
//    Exit;
//  End; // If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then
//
//  // Cria Query da Empresa =====================================================
//  CriaQueryIB('IBDB_99','IBT_99', IBQ_MPMS, True, True);
//
//  // Monta Transacao ===========================================================
//  b:=False;
//  While Not b do
//  Begin
//    b:=IBTransacao('S', 'IBT_99');
//  End; // While Not b do
//
//  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
//  TD.IsolationLevel:=xilREADCOMMITTED;
//  DMMovtosEmpresas.SQLC.StartTransaction(TD);
//
//  Try
//    DateSeparator:='.';
//    DecimalSeparator:='.';
//
//    // Atualiza SIDICOM CD
//    MySql:=' UPDATE PRODUTO pr'+
//           ' SET pr.CLASSEABC='+QuotedStr('E')+
//           ' WHERE ((pr.principalfor NOT IN (''000300'', ''000500'', ''001072'', ''000883'', ''010000''))'+
//           '         OR'+
//           '        (pr.codaplicacao Not in (''0015'',''0016'',''0017'')))'+
//           ' AND   pr.CLASSEABC<>'+QuotedStr('E');
//    IBQ_MPMS.Close;
//    IBQ_MPMS.SQL.Clear;
//    IBQ_MPMS.SQL.Add(MySql);
//    IBQ_MPMS.ExecSQL;
//
//    // Atualiza BelShop
//    DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
//
//    MySql:=' SELECT ca.cod_produto, ca.ind_curva'+
//           ' FROM ES_FINAN_CURVA_ABC ca'+
//           ' WHERE ca.cod_loja='+QuotedStr('99')+
//           ' AND   ca.ind_curva<>'+QuotedStr('E')+
//           ' ORDER BY ca.cod_produto';
//     DMMovtosEmpresas.CDS_Busca.Close;
//     DMMovtosEmpresas.SDS_Busca.CommandText:=MySql;
//     DMMovtosEmpresas.CDS_Busca.Open;
//     While Not DMMovtosEmpresas.CDS_Busca.Eof do
//     Begin
//       // Atualiza SIDICOM CD
//       MySql:=' UPDATE PRODUTO pr'+
//              ' SET pr.CLASSEABC='+QuotedStr(DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Curva').AsString)+
//              ' WHERE pr.codproduto='+QuotedStr(DMMovtosEmpresas.CDS_Busca.FieldByName('Cod_Produto').AsString);
//       IBQ_MPMS.Close;
//       IBQ_MPMS.SQL.Clear;
//       IBQ_MPMS.SQL.Add(MySql);
//       IBQ_MPMS.ExecSQL;
//
//       // Atualiza BelShop
//       DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
//
//       DMMovtosEmpresas.CDS_Busca.Next;
//     End; // While Not DMMovtosEmpresas.CDS_Busca.Eof do
//     DMMovtosEmpresas.CDS_Busca.Close;
//
//    // Commita Transa��o ------------------------------------------
//    DMMovtosEmpresas.SQLC.Commit(TD);
//
//    b:=False;
//    While Not b do
//    Begin
//      b:=IBTransacao('C', 'IBT_99');
//    End; // While Not b do
//  Except
//    on e : Exception do
//    Begin
//      // Rollback Transacao -----------------------------------------
//      DMMovtosEmpresas.SQLC.Rollback(TD);
//
//      b:=False;
//      While Not b do
//      Begin
//        b:=IBTransacao('R', 'IBT_99');
//      End; // While Not b do
//    End; // on e : Exception do
//  End;
//
//  DateSeparator:='/';
//  DecimalSeparator:=',';
//
//  // Fecha Conex�o =============================================================
//  ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
//End; // Atualiza Curva ABC no CD - SIDICOM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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
  MySql:=' SELECT f.cod_prod_linx, f.per_participacao'+
         ' FROM ES_FINAN_CURVA_ABC f'+
         ' WHERE f.cod_linx='+sgCodLjLinx+
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
              ' WHERE f.Cod_Linx='+sgCodLjLinx+
              ' AND   f.Cod_Prod_Linx='+QuotedStr(DMMovtosEmpresas.CDS_Busca.FieldByName('cod_prod_linx').AsString);
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
         ' WHERE f.Cod_Linx='+sgCodLjLinx+
         ' AND   f.Ind_Curva='+QuotedStr(sCurva);
  DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

  //============================================================================
  // Calculo Curva de Quantidades ==============================================
  //============================================================================
  MySql:=' SELECT f.cod_prod_linx, f.per_part_qtd'+
         ' FROM ES_FINAN_CURVA_ABC f'+
         ' WHERE f.Cod_Linx='+sgCodLjLinx+
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
              ' WHERE f.Cod_Linx='+sgCodLjLinx+
              ' AND   f.Cod_Prod_Linx='+QuotedStr(DMMovtosEmpresas.CDS_Busca.FieldByName('cod_prod_linx').AsString);
       DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
     End
    Else
     Begin
       Break;
     End; // If sCurva<>'E' Then
    DMMovtosEmpresas.CDS_Busca.Next;
  End; // While Not DMMovtosEmpresas.CDS_Busca.Eof do
  DMMovtosEmpresas.CDS_Busca.Close;

End; // Calcula Curva ABC de Valores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmCurvasDemandas.FormCreate(Sender: TObject);
Var
  i: Integer;
begin
  tgMySqlErro:=TStringList.Create;
  tgMySqlErro.Clear;
  tgMySqlErro.Add('==================================');
  tgMySqlErro.Add('Processamento IN�CIO: '+DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor)));
  tgMySqlErro.Add('==================================');
  tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Curva_ABC_Erros.txt');

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
  sTotQtdDemandas, sTotVlrDemandas, // Qtd e Vlr Total de Demanda de Venda dos �ltimos 6 Meses
  sDtaDemI, sDtaDemF, sDtaTra, sDtaProdNovo: String;

  wAnoH, wMesH, wDiaH: Word;

  i: Integer;
  iTotFeriados,    iTotDiasUteis   : Integer;

  hHrIniLj, hHrFimLj:String;
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

  // Data de Transito ==========================================================
  sDtaTra:=DateToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor)-30);
  sDtaTra:=f_Troca('/','.',f_Troca('-','.',sDtaTra));

  // Data do Inicio do Per�odo =================================================
  sDtaDemI:=DateToStr(PrimeiroUltimoDia(IncMonth(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor),-6),'P'));
  sDtaDemI:=f_Troca('/','.',f_Troca('-','.',sDtaDemI));

  // Data do Inicio do Per�odo =================================================
  sDtaDemF:=DateToStr(PrimeiroUltimoDia(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor),'P'));
  sDtaDemF:=f_Troca('/','.',f_Troca('-','.',sDtaDemF));

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

  //===========================================================================
  // INICIA PROCESSO ===========================================================
  MySql:=' SELECT e.cod_filial, e.cod_linx, e.ind_domingo'+
         ' FROM EMP_CONEXOES e'+
         ' WHERE ((e.ind_ativo = ''SIM'') OR (e.cod_filial = ''99''))'+
         ' AND   e.dta_inicio_linx IS NOT NULL'+
         ' ORDER BY 1';
  DMMovtosEmpresas.CDS_Pesquisa.Close;
  DMMovtosEmpresas.SDS_Pesquisa.CommandText:=MySql;
  DMMovtosEmpresas.CDS_Pesquisa.Open;

  While Not DMMovtosEmpresas.CDS_Pesquisa.Eof do
  Begin
    hHrIniLj:=TimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor));

    // Monta Transacao =========================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMMovtosEmpresas.SQLC.StartTransaction(TD);
    Try
      sgCodLjSid :=DMMovtosEmpresas.CDS_Pesquisa.FieldByName('Cod_Filial').AsString;
      sgCodLjLinx:=DMMovtosEmpresas.CDS_Pesquisa.FieldByName('Cod_Linx').AsString;

      // Dias Uteis no Periodo =====================================================
      If DMMovtosEmpresas.CDS_Pesquisa.FieldByName('ind_domingo').AsString='N' Then
       iTotDiasUteis:=DiasUteisBelShop(StrToDate(f_Troca('.','/',sDtaDemI)),StrToDate(f_Troca('.','/',sDtaDemF))-1, False, True)
      Else
       iTotDiasUteis:=DiasUteisBelShop(StrToDate(f_Troca('.','/',sDtaDemI)),StrToDate(f_Troca('.','/',sDtaDemF))-1, True, True);

      DateSeparator:='.';
      DecimalSeparator:='.';

      // Busca Valor e Quantidade Total de Demandas ============================
      If sgCodLjLinx<>'2' Then
       Begin
         MySql:=' SELECT'+
                ' SUM(ABS(COALESCE(mt.quant_ref,0))) Tot_Qtd_Demanda,'+
                ' SUM(ABS(COALESCE(mt.preco,0))) Tot_Vlr_Demanda'+

                ' FROM MOVTOS_EMPRESAS mt, LINXPRODUTOS pt'+

                ' WHERE mt.cod_prod_linx=pt.cod_produto'+
                ' AND   mt.ind_tipo=''DM'''+
                ' AND   mt.dta_ref BETWEEN '+QuotedStr(sDtaDemI)+' and '+QuotedStr(sDtaDemF)+
                ' AND   mt.cod_linx='+sgCodLjLinx;
       End
      Else // If sgCodLjLinx='2' CD
       Begin
         MySql:=' SELECT'+
                ' SUM(f.qtd_demandas) Tot_Qtd_Demanda,'+
                ' SUM(f.vlr_demandas) Tot_Vlr_Demanda'+
                ' FROM ES_FINAN_CURVA_ABC f'+
                ' WHERE EXISTS (SELECT 1'+
                '               FROM EMP_CONEXOES c'+
                '               WHERE c.Ind_Ativo=''SIM'''+
                '               AND   c.cod_linx=f.cod_linx'+
                '               AND   c.dta_inicio_linx IS NOT NULL)';
       End; // If sgCodLjLinx<>'2' Then
      DMMovtosEmpresas.SQLQuery1.Close;
      DMMovtosEmpresas.SQLQuery1.SQL.Clear;;
      DMMovtosEmpresas.SQLQuery1.SQL.Add(MySql);
      DMMovtosEmpresas.SQLQuery1.Open;

      sTotQtdDemandas:=DMMovtosEmpresas.SQLQuery1.FieldByName('Tot_Qtd_Demanda').AsString;
      sTotQtdDemandas:=f_Troca(',','.',sTotQtdDemandas);
      If Pos('.',sTotQtdDemandas)=0 Then
       sTotQtdDemandas:=sTotQtdDemandas+'.00';

      sTotVlrDemandas:=DMMovtosEmpresas.SQLQuery1.FieldByName('Tot_Vlr_Demanda').AsString;
      sTotVlrDemandas:=f_Troca(',','.',sTotVlrDemandas);
      If Pos('.',sTotVlrDemandas)=0 Then
       sTotVlrDemandas:=sTotVlrDemandas+'.00';

      DMMovtosEmpresas.SQLQuery1.Close;

      // Exclui Movimento Anterior =============================================
      MySql:=' UPDATE ES_FINAN_CURVA_ABC f'+
             ' SET f.dta_atualizacao=CURRENT_DATE-1'+
             ' WHERE f.dta_atualizacao=CURRENT_DATE'+
             ' AND f.cod_linx='+sgCodLjLinx;
      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

      // Insere ES_FINAN_CURVA_ABC =============================================
      MySql:=' INSERT INTO ES_FINAN_CURVA_ABC'+
             ' (COD_LOJA, COD_PRODUTO, EST_MINIMO, EST_MAXIMO, NUM_DIAS_UTEIS,'+
             '  VLR_DEMANDAS_ANO, VLR_DEMANDAS, PER_PARTICIPACAO, IND_CURVA,'+
             '  QTD_DEMANDAS_ANO, QTD_DEMANDAS, PER_PART_QTD, IND_CURVA_QTD,'+
             '  NUM_DIAS_ESTOCAGEM, QTD_TRANSITO, DTA_ATUALIZACAO, HRA_ATUALIZACAO,'+
             '  USU_ALTERA, DTA_ALTERA, COD_PROD_LINX, COD_LINX)'+

             ' SELECT '+
             QuotedStr(sgCodLjSid)+' COD_LOJA,'+

             ' CASE'+
             '    WHEN CHAR_LENGTH(TRIM(pr.cod_auxiliar))>6 THEN'+
             '      NULL'+
             '    ELSE'+
             '      pr.cod_auxiliar'+
             ' END COD_PRODUTO,'+

             ' COALESCE(fc.est_minimo,0) EST_MINIMO,'+
             ' COALESCE(fc.est_maximo,0) EST_MAXIMO,'+

             ' ABS(CAST(CASE'+
             '            WHEN pr.dt_inclusao<CAST('+QuotedStr(sDtaDemI)+' as Date) THEN'+
             '              '+QuotedStr(IntToStr(iTotDiasUteis))+
             '            WHEN pr.dt_inclusao>cast('+QuotedStr(sDtaDemF)+' as Date) THEN'+
             '              1'+
             '            ELSE'+
             '              ((DATEDIFF(DAY FROM pr.dt_inclusao TO CAST('+QuotedStr(sDtaDemF)+' AS DATE)))-'+
             '               ((DATEDIFF(DAY FROM pr.dt_inclusao TO CAST('+QuotedStr(sDtaDemF)+' AS DATE)))/7)-'+
                              IntToStr(iTotFeriados)+')'+
             '          END'+
             ' AS INTEGER)) NUM_DIAS_UTEIS, '+

             sTotVlrDemandas+' Vlr_DEMANDAS_ANO,'+
             ' 0.00 VLR_DEMANDAS,'+
             ' 0.0000 PER_PARTICIPACAO,'+
             ' ''E'' IND_CURVA, '+
             sTotQtdDemandas+' Qtd_DEMANDAS_ANO,'+
             ' 0 QTD_DEMANDAS,'+
             ' 0.0000 PER_PART_QTD,'+
             ' ''E'' IND_CURVA_QTD,'+
             ' 0 NUM_DIAS_ESTOCAGEM,'+
             ' 0 QTD_TRANSITO,'+
             ' CURRENT_DATE Dta_Atualizacao,'+
             ' CURRENT_TIME Hra_Atualizacao,'+
             ' fc.usu_altera USU_ALTERA,'+
             ' COALESCE(fc.dta_altera,CURRENT_TIMESTAMP) dta_altera,'+
             ' pr.cod_produto COD_PROD_LINX, '+
             sgCodLjLinx+' COD_LINX'+

             ' FROM ES_FINAN_CURVA_ABC fc, LINXPRODUTOS pr'+
             ' WHERE fc.cod_prod_linx=pr.cod_produto'+
             ' AND   fc.cod_linx='+sgCodLjLinx+
             ' GROUP BY 2,3,4,5,18,19,20';
      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

      // Exclui Movimento Anterior =============================================
      MySql:=' DELETE FROM ES_FINAN_CURVA_ABC cv'+
             ' WHERE cv.cod_linx='+sgCodLjLinx+
             ' AND   cv.dta_atualizacao<CURRENT_DATE';
      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
      // Atualiza Transacao ====================================================
      DMMovtosEmpresas.SQLC.Commit(TD);

      // Busca Demandas Lojas N�o CD  ==========================================
      If sgCodLjLinx<>'2' Then
      Begin
        MySql:=' SELECT md.cod_prod_linx,'+

               ' CASE'+
               '   WHEN CAST(SUM(DECODE(md.ind_tipo,''DM'',COALESCE(md.preco,0),0.00)) AS NUMERIC(12,2))>0 THEN'+
               '     CAST(SUM(DECODE(md.ind_tipo,''DM'',COALESCE(md.preco,0),0.00)) AS NUMERIC(12,2))'+
               '   ELSE'+
               '     0.00'+
               ' END VLR_DEMANDAS,'+

               ' CASE'+
               '   WHEN CAST(SUM(DECODE(md.ind_tipo,''DM'',COALESCE(md.preco,0),0.00)) AS NUMERIC(12,2))>0 THEN'+
               '     CAST((((SUM(DECODE(md.ind_tipo,''DM'',COALESCE(md.preco,0),0.0000)))*100)/'+sTotVlrDemandas+') AS NUMERIC(12,4))'+
               '   ELSE'+
               '     0.0000'+
               ' END PER_PARTICIPACAO,'+

               ' CASE'+
               '   WHEN CAST(SUM(DECODE(md.ind_tipo,''DM'',COALESCE(md.quant_ref,0),0)) AS INTEGER)>0 THEN'+
               '     CAST(SUM(DECODE(md.ind_tipo,''DM'',COALESCE(md.quant_ref,0),0)) AS INTEGER)'+
               '   ELSE'+
               '     0'+
               ' END QTD_DEMANDAS,'+

               ' CASE'+
               '   WHEN CAST(SUM(DECODE(md.ind_tipo,''DM'',COALESCE(md.quant_ref,0),0)) AS INTEGER)>0 THEN'+
               '     CAST((((SUM(DECODE(md.ind_tipo,''DM'',COALESCE(md.quant_ref,0),0.0000)))*100)/'+sTotQtdDemandas+') AS NUMERIC(12,4))'+
               '   ELSE'+
               '     0'+
               ' END PER_PART_QTD,'+

               ' CAST(SUM(DECODE(md.ind_tipo,''TR'',COALESCE(md.quant_ref,0),0)) AS INTEGER) QTD_TRANSITO'+

               ' FROM MOVTOS_EMPRESAS md'+
               ' WHERE ((md.ind_tipo=''DM'' AND md.dta_ref BETWEEN '+QuotedStr(sDtaDemI)+' AND '+QuotedStr(sDtaDemF)+')'+
               '        OR'+
               '        (md.ind_tipo=''TR'' AND md.dta_ref>='+QuotedStr(sDtaTra)+'))'+
               ' AND   md.cod_prod_linx is not null'+
               ' AND   md.cod_linx='+sgCodLjLinx+
               ' GROUP BY 1';
      End; // If sgCodLjLinx<>'2' Then

      // Busca Demandas CD  ====================================================
      If sgCodLjLinx='2' Then
      Begin
        MySql:=' SELECT fc.cod_prod_linx,'+

               ' SUM(fc.vlr_demandas) VLR_DEMANDAS,'+

               ' CASE'+
               '   WHEN SUM(fc.vlr_demandas)>0 THEN'+
               '     CAST(((CAST(SUM(fc.vlr_demandas)  AS NUMERIC(12,4)) * 100) / '+sTotVlrDemandas+') AS NUMERIC(12,4))'+
               '   ELSE'+
               '     0.0000'+
               ' END PER_PARTICIPACAO,'+

               ' SUM(fc.qtd_demandas) QTD_DEMANDAS,'+

               ' CASE'+
               '   WHEN SUM(fc.qtd_demandas)>0 THEN'+
               '     CAST(((CAST(SUM(fc.qtd_demandas) AS NUMERIC(12,4)) * 100) / '+sTotQtdDemandas+') AS NUMERIC(12,4))'+
               '   ELSE'+
               '     0'+
               ' END PER_PART_QTD,'+

               ' SUM(fc.qtd_transito) QTD_TRANSITO'+

               ' FROM ES_FINAN_CURVA_ABC fc'+
               ' WHERE fc.dta_atualizacao=CURRENT_DATE'+
               ' AND   fc.cod_prod_linx IS NOT NULL'+
               ' AND   EXISTS (SELECT 1'+
               '               FROM EMP_CONEXOES c'+
               '               WHERE c.Ind_Ativo=''SIM'''+
               '               AND   c.cod_linx=fc.cod_linx'+
               '               AND   c.dta_inicio_linx IS NOT NULL)'+
               ' GROUP BY 1';
      End; // If sgCodLjLinx='2' Then
      DMMovtosEmpresas.SQLQuery1.Close;
      DMMovtosEmpresas.SQLQuery1.SQL.Clear;;
      DMMovtosEmpresas.SQLQuery1.SQL.Add(MySql);
      DMMovtosEmpresas.SQLQuery1.Open;

      // Atualiza Demandas =====================================================
      TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
      TD.IsolationLevel:=xilREADCOMMITTED;
      DMMovtosEmpresas.SQLC.StartTransaction(TD);

      DMMovtosEmpresas.SQLQuery1.DisableControls;
      While Not DMMovtosEmpresas.SQLQuery1.Eof do
      Begin
        MySql:=' UPDATE ES_FINAN_CURVA_ABC cv'+
               ' SET cv.vlr_demandas='+QuotedStr(DMMovtosEmpresas.SQLQuery1.FieldByName('VLR_DEMANDAS').AsString)+
               ',    cv.per_participacao='+QuotedStr(DMMovtosEmpresas.SQLQuery1.FieldByName('PER_PARTICIPACAO').AsString)+
               ',    cv.qtd_demandas='+QuotedStr(DMMovtosEmpresas.SQLQuery1.FieldByName('QTD_DEMANDAS').AsString)+
               ',    cv.per_part_qtd='+QuotedStr(DMMovtosEmpresas.SQLQuery1.FieldByName('PER_PART_QTD').AsString)+
               ',    cv.qtd_transito='+QuotedStr(DMMovtosEmpresas.SQLQuery1.FieldByName('QTD_TRANSITO').AsString)+
               ' WHERE cv.cod_linx='+sgCodLjLinx+
               ' AND   cv.cod_prod_linx='+DMMovtosEmpresas.SQLQuery1.FieldByName('cod_prod_linx').AsString+
               ' AND   cv.dta_atualizacao=CURRENT_DATE';
        DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

        DMMovtosEmpresas.SQLQuery1.Next;
      End; // While Not DMMovtosEmpresas.SQLQuery1.Eof do
      DMMovtosEmpresas.SQLQuery1.EnableControls;
      DMMovtosEmpresas.SQLQuery1.Close;

      DMMovtosEmpresas.SQLC.Commit(TD);

      // Calcula Curvas de Valores e Quantidades ===============================
      TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
      TD.IsolationLevel:=xilREADCOMMITTED;
      DMMovtosEmpresas.SQLC.StartTransaction(TD);

      CalculaCurvas;

      DMMovtosEmpresas.SQLC.Commit(TD);

      // Coloca Pprodutos Novos (At� 6 Meses de Cadastro) ======================
      // da Curva "E" para Curva "C" ===========================================
      TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
      TD.IsolationLevel:=xilREADCOMMITTED;
      DMMovtosEmpresas.SQLC.StartTransaction(TD);

      sDtaProdNovo:=DateToStr(IncMonth(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor),-6));

      MySql:=' UPDATE ES_FINAN_CURVA_ABC cv'+
             ' SET cv.ind_curva=''C'''+
             ' WHERE EXISTS (SELECT 1'+
             '               FROM LINXPRODUTOS pl'+
             '               WHERE pl.cod_produto=cv.cod_prod_linx'+
             '               AND   CAST(pl.dt_inclusao AS DATE)>='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaProdNovo)))+')'+
             ' AND cv.ind_curva=''E''';
      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

      // Atualiza Transacao ====================================================
      DMMovtosEmpresas.SQLC.Commit(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      hHrFimLj:=TimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor));
      tgMySqlErro.Add('Linx: '+sgCodLjLinx+' Sid: '+sgCodLjSid+' - Inicio: '+hHrIniLj+' Fim: '+hHrFimLj+' - TEMPO: '+TimeToStr(StrToTime(hHrFimLj)-StrToTime(hHrIniLj)));
      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Curva_ABC_Erros.txt');
    Except
      on e : Exception do
      Begin
        // Abandona Transacao ==================================================
        DMMovtosEmpresas.SQLC.Rollback(TD);

        tgMySqlErro.Add('==================================');
        tgMySqlErro.Add('ERRO ==>> Linx: '+sgCodLjLinx+' Sid: '+sgCodLjSid);
        tgMySqlErro.Add(MySql);
        tgMySqlErro.Add('==================================');
        tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Curva_ABC_Erros.txt');

        DateSeparator:='/';
        DecimalSeparator:=',';
      End; // on e : Exception do
    End; // Try

    DMMovtosEmpresas.CDS_Pesquisa.Next;
  End; // While Not DMMovtosEmpresas.CDS_Pesquisa.Eof do
  DMMovtosEmpresas.CDS_Pesquisa.Close;

  tgMySqlErro.Add('==================================');
  tgMySqlErro.Add('Processamento FIM: '+DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor)));
  tgMySqlErro.Add('==================================');
  tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Curva_ABC_Erros.txt');

  FreeAndNil(tgMySqlErro);

// OdirApagar - SIDICOM - 22/06/2019
//  // Atualiza Curva ABC no CD - SIDICOM
//  AtualizaCurvaCD;

// OdirApagar - SIDICOM - 22/06/2019
//  // Atualiza Codigos Linx para Produtos Sem Codigo
//  Es_Finan_Curva_ABC_CodLinx;

  Application.Terminate;
  Exit;

// =============================================================================
// FIM DO PROCESSO =============================================================
// =============================================================================
end; // Atualiza Curvas e Demandas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


procedure TFrmCurvasDemandas.FormClose(Sender: TObject;var Action: TCloseAction);
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
  FreeAndNil(tgMySqlErro);

  Try
    Application.Terminate;
    Exit;
  Except
  End;

end;

end.





