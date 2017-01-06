unit UDMAtualizaSeteHoras;

interface

uses
  SysUtils, Classes, DBXpress, FMTBcd, DB, DBClient, Provider, SqlExpr,
  Forms, IBQuery, IBDatabase;

type
  TDMAtualizaSeteHoras = class(TDataModule)
    SQLC: TSQLConnection;
    SDS_Busca: TSQLDataSet;
    DSP_Busca: TDataSetProvider;
    CDS_Busca: TClientDataSet;
    SDS_DtaHoraServidor: TSQLDataSet;
    SDS_BuscaRapida: TSQLDataSet;
    DSP_BuscaRapida: TDataSetProvider;
    CDS_BuscaRapida: TClientDataSet;
    SDS_Lojas: TSQLDataSet;
    DSP_Lojas: TDataSetProvider;
    CDS_Lojas: TClientDataSet;
    SDS_While: TSQLDataSet;
    DSP_While: TDataSetProvider;
    CDS_While: TClientDataSet;
    SDS_Pesquisa: TSQLDataSet;
    DSP_Pesquisa: TDataSetProvider;
    CDS_Pesquisa: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);

    // Odir ====================================================================

    Procedure ConectaBanco;
    Function  BuscaServidorLojaUnica: Boolean; // Nome do Servidor, Tipo de Conexão e Codigo da Loja Se Unica ---------------
    Procedure MontaConexaoEmpresas;

    // Odir ====================================================================

  private
    { Private declarations }
  public
    { Public declarations }
  end;

Const
   sUser_Name: String='SYSDBA';
   sPassword: String='masterkey';
   cr = #13#10;

var
  DMAtualizaSeteHoras: TDMAtualizaSeteHoras;

  sgPath_Local: String;
  sgNomeServidor, sgCodLojaUnica, sgTpConexao: String;
  sgCompMaster, sgCompServer: String; // Dados dos Servidores, Computador Local
  sgIPServer, sgIPInternetServer: String; // Ips do Servidor

  Function ConexaoEmpIndividual(sDataBase, sTransaction, sProcedimento: String; bTestar: Boolean = False): Boolean; Forward;
                           // Procedimento: (A) Abrir Conexão (F) Fechar COnexão
  Function IBTransacao(sSituacao, sTransaction: String): Boolean; Forward;
                           // sSituacao: (S)Start Transação (C)ommit (R)ollback

  Procedure CriaQueryIB(sDataBase, sTransaction: String; Var IBQ_Free: TIBQuery; bCriaIBQ: Boolean);
        // sDataBase    = Database a Conectar
        // sTransaction = Transaction a Conectar
        // IBQ_Free     = Nome do TIBQuery a Destruir e Reconstruir
        // bCriaIBQ     = Se Destruir e Reconstruir IBQuery

  // Dias Uteis para BelShop =================================================
  function DiasUteisBelShop(dDataI, dDataF: TDateTime; bDomingo, bSabado: Boolean): Integer;

implementation

uses UDMConexoes, DK_Procs1, UFrmAtualizaSeteHoras;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Nome do Servidor, Tipo de Conexão e Codigo da Loja Se Unica >>>>>>>>>>>>>>>>>
Function TDMAtualizaSeteHoras.BuscaServidorLojaUnica: Boolean;
Var
  tsArquivo: TStringList;
  s: String;
  i: Integer;
Begin
  Result:=True;

  tsArquivo:= TStringList.Create;
  Try
    { Carrega o conteúdo do arquivo texto para a   memória }
    tsArquivo.LoadFromFile(IncludeTrailingPathDelimiter(sgPath_Local)+'Servidor_Adm.ini');

    { Realiza um loop em toda a lista }
    s:='';
    sgNomeServidor:='';
    sgCodLojaUnica:='';
    sgTpConexao   :='';
    For i := 0 to tsArquivo.Count - 1 do
    Begin
      s:=tsArquivo[i];

      If Trim(s)<>'' Then
      Begin
        If i=0 Then sgNomeServidor:=Trim(s);
        If i=1 Then sgCodLojaUnica:=Trim(s);
        If i=2 Then sgTpConexao:=Trim(s);
      End;
    End; // For i := 0 to tsArquivo.Count - 1 do

  Finally // Try
    { Libera a instancia da lista da memória }
    FreeAndNil(tsArquivo);
  End; // Try
  tsArquivo.Free;
End; // // Nome do Servidor, Tipo de Conexão e Codigo da Loja Se Unica >>>>>>>>>

// Monta Empresas a Conectar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMAtualizaSeteHoras.MontaConexaoEmpresas;
Var
  MySql, s: String;
  sEndIP: String;
  i: Integer;
Begin
  MySql:=' SELECT p.computer_master, p.computer_server, IP_Server, IP_Internet_Server'+
         ' FROM PARAMETROS p';
  CDS_BuscaRapida.Close;
  SDS_BuscaRapida.CommandText:=MySql;
  CDS_BuscaRapida.Open;

  sgCompMaster      :=AnsiUpperCase(CDS_BuscaRapida.FieldByName('computer_master').AsString);
  sgCompServer       :=AnsiUpperCase(CDS_BuscaRapida.FieldByName('computer_server').AsString);
  sgIPServer        :=AnsiUpperCase(CDS_BuscaRapida.FieldByName('IP_Server').AsString);
  sgIPInternetServer:=AnsiUpperCase(CDS_BuscaRapida.FieldByName('IP_Internet_Server').AsString);

  CDS_BuscaRapida.Close;

  MySql:=' Select *'+
         ' From EMP_Conexoes e'+
         ' Order by Cod_Emp';
  CDS_Busca.Close;
  SDS_Busca.CommandText:=MySql;
  CDS_Busca.Open;

  While Not CDS_Busca.Eof do
  Begin
    // Monta Conexões de Empresas Ativas =======================================
    For i:=0 to DMConexoes.ComponentCount-1 do
    Begin
      If DMConexoes.Components[i] is TIBDatabase Then
      Begin
        If (DMConexoes.Components[i] as TIBDatabase).Name='IBDB_'+CDS_Busca.FieldByName('Cod_Filial').AsString Then
        Begin
          (DMConexoes.Components[i] as TIBDatabase).Connected:=False;

          sEndIP:=CDS_Busca.FieldByName('Endereco_IP').AsString;

          // Tipo de Conexão: NetBEUI
          If (Trim(sgTpConexao)='')              Or (Trim(sgTpConexao)='NetBEUI') Or
             (AnsiUpperCase(sEndIP)='LOCALHOST') Or (AnsiUpperCase(sEndIP)=sgCompServer) Or
             (AnsiUpperCase(sEndIP)=sgIPServer) Then
           s:='\\'+IncludeTrailingPathDelimiter(sEndIP)+
                   IncludeTrailingPathDelimiter(CDS_Busca.FieldByName('Pasta_Base_Dados').AsString)+
                                                CDS_Busca.FieldByName('DES_BASE_DADOS').AsString;

          // Tipo de Conexão: TCP/IP
          If (Trim(sgTpConexao)='TCP/IP')          and (AnsiUpperCase(sEndIP)<>'LOCALHOST') and
             (AnsiUpperCase(sEndIP)<>sgCompServer) and (AnsiUpperCase(sEndIP)<>sgIPServer) Then
           s:=sEndIP+':'+
              IncludeTrailingPathDelimiter(CDS_Busca.FieldByName('Pasta_Base_Dados').AsString)+
                                           CDS_Busca.FieldByName('DES_BASE_DADOS').AsString;

          //==============================================================================
          // Acerta Conexao com a Loja 08 - 201.86.212.9:C:\SIDICOM.NEW\BIGNEW.FDB - TCPIP
          //==============================================================================
          If CDS_Busca.FieldByName('Cod_Filial').AsString='08' Then
           s:=sEndIP+':'+
              IncludeTrailingPathDelimiter(CDS_Busca.FieldByName('Pasta_Base_Dados').AsString)+
                                           CDS_Busca.FieldByName('DES_BASE_DADOS').AsString;

          //  \\201.86.212.10\C:\SIDICOM.NEW\BANCO.FDB

          (DMConexoes.Components[i] as TIBDatabase).DatabaseName:=s;
          Break;
        End;
      End; // If DMConexoes.Components[i] is TIBDatabase Then
    End; // For i:=0 to DMConexoes.ComponentCount-1 do

    CDS_Busca.Next;
  End; // While Not CDS_Busca.Eof do
  CDS_Busca.Close;

End; // Monta Empresas a Conectar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Dias Uteis para BelShop >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
function DiasUteisBelShop(dDataI, dDataF: TDateTime; bDomingo, bSabado: Boolean): Integer;
Var
  MySql, sDiaSemanaMes: String;
  sDateSeparator: string;
begin
  Result:=0;

  sDateSeparator:=DateSeparator;

  DateSeparator:='/';
  MySql:=' Select f.Dta_Feriado'+
         ' From FIN_FERIADOS_ANO f'+
         ' Where f.Ind_Ativo=''SIM'''+
         ' And f.Dta_Feriado between '+
         QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(dDataI))))+' AND '+
         QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(dDataF))))+
         ' Order by f.Dta_Feriado';
  DMAtualizaSeteHoras.CDS_BuscaRapida.Close;
  DMAtualizaSeteHoras.SDS_BuscaRapida.CommandText:=MySql;
  DMAtualizaSeteHoras.CDS_BuscaRapida.Open;

  While dDataI<=dDataF do
  Begin
    sDiaSemanaMes:=DateToStr(dDataI);
    sDiaSemanaMes:='1';
    If DMAtualizaSeteHoras.CDS_BuscaRapida.Locate('Dta_Feriado',dDataI,[]) Then
     Begin
       sDiaSemanaMes:='0';
     End
    Else If (DiaSemanaAbrev(dDataI)='Dom') and (Not bDomingo) Then
     Begin
       sDiaSemanaMes:='0';
     End
    Else If (DiaSemanaAbrev(dDataI)='Sab') and (Not bSabado) Then
     Begin
       sDiaSemanaMes:='0';
     End; // If (DiaSemanaAbrev(StrToDateTime(sgDtaInicio))='Dom') Then

    If sDiaSemanaMes<>'0' Then
    Begin
      Inc(Result);
    End; // If sDiaSemana<>'0' Then

    dDataI:=dDataI+1;
  End; // While dDataI<=dDataF do
  DMAtualizaSeteHoras.CDS_BuscaRapida.Close;

  If sDateSeparator='/' Then DateSeparator:='/' Else DateSeparator:='.';
End; // Dias Uteis para BelShop >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Situacao: (S)StarT Transação (C)ommit (R)ollback
Function IBTransacao(sSituacao, sTransaction: String): Boolean;
Var
  i, ii: Integer;
  b: Boolean;
Begin
  Result:=False;
  b:=False;

  ii:=0;
  While Not b do
  Begin
    Application.ProcessMessages;
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
                (DMConexoes.Components[i] as TIBTransaction).Commit;

               If sSituacao='R' Then
                (DMConexoes.Components[i] as TIBTransaction).Rollback;

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

    If (ii=0) or (ii>2) Then
     Break;
  End; // While Not b do
End; // Transacao IB >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Procedimento: (A) Abrir Conexão (F) Fechar Conexão
Function ConexaoEmpIndividual(sDataBase, sTransaction, sProcedimento: String; bTestar: Boolean = False): Boolean;
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

               // Abre Conexão --------------------------------------
               If sProcedimento='A' Then
               Begin
                 If (DMConexoes.Components[i] as TIBDatabase).Connected Then
                  (DMConexoes.Components[i] as TIBDatabase).Connected:=False;

                 (DMConexoes.Components[i] as TIBDatabase).Connected:=True;
                 Result:=True;
                 ii:=99;
                 Break;
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

           (DMConexoes.Components[i] as TIBDatabase).Connected:=True;
           Result:=True;
           ii:=99;
           Break;
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
      Begin
        If bTestar Then
        Begin
          Break;
          Exit;
        End;
        Inc(ii);
      End;
    End; // Try

    If (ii=0) or (ii>1) Then // 2 vezes
     Break;
  End; // While Not b do
End; // Conexao IB Individual >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Procedure CriaQueryIB(sDataBase, sTransaction: String; Var IBQ_Free: TIBQuery; bCriaIBQ: Boolean);
Var
  i: Integer;
  iOk: Integer;
Begin

  iOk:=0;

  If bCriaIBQ Then
  Begin
    Try
      If IBQ_Free <> Nil Then
      Begin
        IBQ_Free.Free;
        IBQ_Free:=nil;
      End;
    Except
    End;

    IBQ_Free:=TIBQuery.Create(IBQ_Free);
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

// Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMAtualizaSeteHoras.ConectaBanco;
Var
  Arq: TextFile;
  s, sBancoIB: String;
  i: Integer;
  b: Boolean;
begin

  If not(fileexists(IncludeTrailingPathDelimiter(sgPath_Local)+'PCTConect_IB.ini')) then
  Begin
    Application.Terminate;
    Exit;
  End;

  If SQLC.Connected Then
   SQLC.Connected:=False;

  InicializaFormatos; // define as configurações regionais para ignorar a configuração do windows

  // ===========================================================================
  // Conexão DBExpress BelShop =================================================
  // ===========================================================================
  with SQLC do
  Begin
    try
      SQLC.Params.Clear;
      LoadParamsFromIniFile(sgPath_Local+'PCTConect_IB.ini');
      Params.Add('User_Name='+sUser_Name);
      Params.Add('Password='+sPassword);
      Connected:=True;
      b:=False;
      While Not b do
      Begin
        Try
          Connected:=True;
          Break;
        Except
        End;
      End;
    Except // finally
    End;
  end;

  // ===========================================================================
  // Conexão IBDatabase BelShop ================================================
  // ===========================================================================
  AssignFile(Arq,IncludeTrailingPathDelimiter(sgPath_Local)+'PCTConect_IB.ini');

  Reset(Arq);
  While not Eof(Arq) do
  Begin
   Readln(Arq,s);

   sBancoIB:='';
   i:=pos('Database=localhost/3050:', Trim(s));
   If i<>0 Then
    sBancoIB:=copy(Trim(s),i+24,length(Trim(s)));

   If (i=0) and (sBancoIB='') Then
   Begin
     i:=pos('Database=', Trim(s));
     If i<>0 Then
      sBancoIB:=copy(Trim(s),i+9,length(Trim(s)));
   End;

   If sBancoIB<>'' Then
    Break;

  End;
  CloseFile(Arq);

End; // Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TDMAtualizaSeteHoras.DataModuleCreate(Sender: TObject);
Var
  i: Integer;
  Arq: TextFile;
  sArquivo: TStringList;
  sLinha: String;
  sNewIP: String;
begin
  // Pasta Executavel ==========================================================
  sgPath_Local:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));

  // Nome do Servidor, Tipo de Conexão e Codigo da Loja Se Unica ===============
  sgCodLojaUnica:='';
  BuscaServidorLojaUnica;

  // Verifica a Existencia do Arquivo "ConexaoExterna.ini" =====================
  sNewIP:='';
  bgConexaoLocal:=True;
  If fileexists(sgPath_Local+'ConexaoExterna.ini') then
  Begin
    bgConexaoLocal:=False;

    // Busca Novo IP do Banco de Dados BelShop.FDB ------------------
    AssignFile(Arq,sgPath_Local+'ConexaoExterna.ini');

    Reset(Arq);
    While not Eof(Arq) do
    Begin
     Readln(Arq,sLinha);

     If Trim(Copy(sLinha,1,33))='IP do Banco de Dados BELSHOP.FDB:' Then
     Begin
       i:=pos(':', sLinha);
       sNewIP:=Trim(Copy(sLinha,i+1,Length(sLinha)));
       Break
     End; // If i=2 Then
    End; // While not Eof(Arq) do
    CloseFile(Arq);

    // Acerta Caminho do Banco BelShop.FDB em PCTConect_IB.ini ------
    If sNewIP<>'' Then
    Begin
      sArquivo:=TStringList.Create;

      Try
        sArquivo.LoadFromFile(sgPath_Local+'PCTConect_IB.ini');

        For i:=0 to sArquivo.Count - 1 do
        Begin
          If AnsiUpperCase(Copy(sArquivo[i],1,8))='DATABASE' Then
          Begin
            sArquivo[i]:='Database=\\'+sNewIP+'\C:\Projetos\BelShop\Dados\BELSHOP.FDB';
            Break;
          End; // If Copy(s,1,2)=Edit1.Text Then
        End; // For i:=0 to sArquivo.Count - 1 do

       sArquivo.SaveToFile(sgPath_Local+'PCTConect_IB.ini');
      Finally // Try
        { Libera a instancia da lista da memória }
        FreeAndNil(sArquivo);
      End; // Try

      sArquivo.Free;
    End; // If sNewIP<>'' Then
  End; // If fileexists(sgPath_Local+'ConexaoExterna.ini') then

  SQLC.Connected:=False;

  ConectaBanco;
  MontaConexaoEmpresas;

end;

end.
