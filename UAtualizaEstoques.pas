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

uses UDMAtualizaEstoques, UDMConexoes, DK_Procs1;

{$R *.dfm}

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

  MySql,
  sCodEmpresa, sHora,
  sgDML, sgValues: String;

  i: Integer;
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

    sCodEmpresa:=DMAtualizaEstoques.CDS_EmpProcessaCOD_FILIAL.AsString;
                               
    sHora:=TimeToStr(Time);

    If sCodEmpresa<>'18' Then
    Begin
      // Conecta Empresa =======================================================
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
      End;

      If bSiga Then // Conexão
      Begin
        // =====================================================================
        // Busca ESTOQUE =======================================================
        // =====================================================================
        DateSeparator:='.';
        DecimalSeparator:='.';

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

        // Processamento  -------------------------------------------
        If bSiga Then // Consulta Transferencias de Entrada
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

            While Not DMAtualizaEstoques.IBQ_EstoqueLoja.Eof do
            Begin
              sgValues:='';
              For i:=0 to DMAtualizaEstoques.IBQ_EstoqueLoja.FieldCount-1 do
              Begin
                // ULTIMO CAMPO - HRA_ATUALIZACAO ==============================
                If Trim(DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].FieldName)='HRA_ATUALIZACAO' Then
                Begin
                  sgValues:=sgValues+QuotedStr(DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].AsString)+')';
                End // If Trim(DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].FieldName)='HRA_ATUALIZACAO' Then

                // Grava Resto do Registro =====================================
                Else
                 Begin
                   If Trim(DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].AsString)<>'' Then
                    sgValues:=sgValues+QuotedStr(DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].AsString)+', '
                   Else
                    sgValues:=sgValues+'NULL, ';
                 End;
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
        End; // If bSiga Then // Consulta Transferencias de Entrada

        DateSeparator:='/';
        DecimalSeparator:=',';
        // =====================================================================
        // Busca ESTOQUE =======================================================
        // =====================================================================

        // Fecha Conexão =========================================================
        ConexaoEmpIndividual('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, 'F');
      End; // If bSiga Then // Conexão
    End; // If sCodEmpresa:=<>'18' Then

    DMAtualizaEstoques.CDS_EmpProcessa.Next;
  End; // While Not DMAtualizaEstoques.CDS_EmpProcessa.Eof do
  DMAtualizaEstoques.CDS_EmpProcessa.Close;

// =============================================================================
// FIM DO PROCESSO =============================================================
// =============================================================================

   Close;
end;

end.
