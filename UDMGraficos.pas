unit UDMGraficos;

interface

uses
  Windows, SysUtils, Classes, DBXpress, FMTBcd, DB, DBClient, Provider, SqlExpr,
  Forms, IBQuery, IBDatabase;

type
  TDMGraficos = class(TDataModule)
    SQLC: TSQLConnection;
    SDS_Busca: TSQLDataSet;
    DSP_Busca: TDataSetProvider;
    CDS_Busca: TClientDataSet;
    SDS_DtaHoraServidor: TSQLDataSet;
    SDS_BuscaRapida: TSQLDataSet;
    DSP_BuscaRapida: TDataSetProvider;
    CDS_BuscaRapida: TClientDataSet;
    DataSource1: TDataSource;
    CDS_V_Grafico: TClientDataSet;
    CDS_V_GraficoCOD_LOJA: TStringField;
    CDS_V_GraficoVLR_OBJETIVO: TCurrencyField;
    CDS_V_GraficoVLR_TOTAL: TCurrencyField;
    CDS_V_GraficoPER_ALCANCADO: TCurrencyField;
    CDS_V_GraficoVLR_SALAO: TCurrencyField;
    CDS_V_GraficoVLR_SALAO_OBJETIVO: TCurrencyField;
    CDS_V_GraficoPER_SALAO: TCurrencyField;
    CDS_V_GraficoCONECTADO: TStringField;
    procedure DataModuleCreate(Sender: TObject);

    // Odir ====================================================================
    Procedure ConectaBanco;
    Procedure MontaConexaoEmpresas;
    Function  ConectaMPMS: Boolean;

    Procedure FechaTudoGraficos;

    Procedure CriaQueryIB(sDataBase, sTransaction: String; Var IBQ_Free: TIBQuery; bCriaIBQ: Boolean);
        // sDataBase    = Database a Conectar
        // sTransaction = Transaction a Conectar
        // IBQ_Free     = Nome do TIBQuery a Destruir e Reconstruir
        // bCriaIBQ     = Se Destruir e Reconstruir IBQuery

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
  DMGraficos: TDMGraficos;

  sgPath_Local: String;

  sgTpConexao, sgNomeServidor, sgCodLojaUnica: String;

  sgCompMaster, sgComServer: String; // Dados dos Servidores, Computador Local
  sgFTPUsar, // Se Utiliza Transmissão por FTP
  sgIPServer, sgIPInternetServer: String; // Ips do Servidor
  sgFTPUser, sgFTPSenha: String; // Usuario FTP
  sgPastaAreaFTP: String; // Pasta da Area de FTP

  Function ConexaoEmpIndividual(sDataBase, sTransaction, sProcedimento: String; bTestar: Boolean = False): Boolean; Forward;
                           // Procedimento: (A) Abrir Conexão (F) Fechar COnexão
  Function IBTransacao(sSituacao, sTransaction: String): Boolean; Forward;
                           // sSituacao: (S)Start Transação (C)ommit (R)ollback

implementation

uses  DK_Procs1, UDMConexoes, UFrmGraficos;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMGraficos.FechaTudoGraficos;
Var
  i: Integer;
Begin

  // Fecha Series dos Graficos =================================================
  FrmGrafico.FechaSeriesGraficos;

  // Fecha Componentes DMGraficos ==============================================
  For i:=0 to DMGraficos.ComponentCount-1 do
  Begin
    If DMGraficos.Components[i] is TClientDataSet Then
     If (DMGraficos.Components[i] as TClientDataSet).Active Then
      (DMGraficos.Components[i] as TClientDataSet).Close;
  End;

  SQLC.Close;
end; // Diversos - Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Monta Empresas a Conectar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMGraficos.MontaConexaoEmpresas;
Var
  tsArquivo: TStringList;
  s: String;

  MySql: String;
  sEndIP: String;
  i: Integer;
Begin
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

  MySql:=' SELECT p.FTP_Usar, p.computer_master, p.computer_server,'+
         ' p.IP_Server, p.IP_Internet_Server,'+
         ' p.FTP_User, p.FTP_Password'+
         ' FROM PARAMETROS p';
  DMGraficos.CDS_Busca.Close;
  DMGraficos.SDS_Busca.CommandText:=MySql;
  DMGraficos.CDS_Busca.Open;

  sgCompMaster      :=AnsiUpperCase(DMGraficos.CDS_Busca.FieldByName('computer_master').AsString);
  sgComServer       :=AnsiUpperCase(DMGraficos.CDS_Busca.FieldByName('computer_server').AsString);

  sgFTPUsar         :=DMGraficos.CDS_Busca.FieldByName('FTP_Usar').AsString;

  sgIPServer        :=AnsiUpperCase(DMGraficos.CDS_Busca.FieldByName('IP_Server').AsString);
  sgIPInternetServer:=AnsiUpperCase(DMGraficos.CDS_Busca.FieldByName('IP_Internet_Server').AsString);

  sgFTPUser         :=AnsiUpperCase(DMGraficos.CDS_Busca.FieldByName('FTP_User').AsString);
  sgFTPSenha        :=AnsiUpperCase(DMGraficos.CDS_Busca.FieldByName('FTP_Password').AsString);
  sgPastaAreaFTP    :='C:\Projetos\BelShop\AreaFTP\';

  MySql:=' Select *'+
         ' From EMP_Conexoes e'+
         ' Where (e.Ind_Ativo=''SIM'' or e.Tip_Emp=''M'')'+
         ' Order by Cod_Emp';
  DMGraficos.CDS_Busca.Close;
  DMGraficos.SDS_Busca.CommandText:=MySql;
  DMGraficos.CDS_Busca.Open;

  While Not DMGraficos.CDS_Busca.Eof do
  Begin
    // Monta Conexões de Empresas Ativas =======================================
    For i:=0 to DMConexoes.ComponentCount-1 do
    Begin
      If DMConexoes.Components[i] is TIBDatabase Then
      Begin
        If (DMConexoes.Components[i] as TIBDatabase).Name='IBDB_'+DMGraficos.CDS_Busca.FieldByName('COD_FILIAL').AsString Then
        Begin
          (DMConexoes.Components[i] as TIBDatabase).Connected:=False;

          sEndIP:=DMGraficos.CDS_Busca.FieldByName('ENDERECO_IP').AsString;

          // Tipo de Conexão: TCP/IP NetBEUI
          If (Trim(sgTpConexao)='')              Or (Trim(sgTpConexao)='NetBEUI') Or
             (AnsiUpperCase(sEndIP)='LOCALHOST') Or (AnsiUpperCase(sEndIP)=sgComServer) Then
           s:='\\'+IncludeTrailingPathDelimiter(sEndIP)+
                   IncludeTrailingPathDelimiter(DMGraficos.CDS_Busca.FieldByName('PASTA_BASE_DADOS').AsString)+
                                                DMGraficos.CDS_Busca.FieldByName('DES_BASE_DADOS').AsString;

          If (Trim(sgTpConexao)='TCP/IP') and (AnsiUpperCase(sEndIP)<>'LOCALHOST') and (AnsiUpperCase(sEndIP)<>sgComServer) Then
           s:=sEndIP+':'+
              IncludeTrailingPathDelimiter(DMGraficos.CDS_Busca.FieldByName('PASTA_BASE_DADOS').AsString)+
                                           DMGraficos.CDS_Busca.FieldByName('DES_BASE_DADOS').AsString;

          //==============================================================================
          // Acerta Conexao com a Loja 08 - 201.86.212.9:C:\SIDICOM.NEW\BIGNEW.FDB - TCPIP
          //==============================================================================
          If DMGraficos.CDS_Busca.FieldByName('Cod_Filial').AsString='08' Then
           s:=sEndIP+':'+
              IncludeTrailingPathDelimiter(DMGraficos.CDS_Busca.FieldByName('PASTA_BASE_DADOS').AsString)+
                                           DMGraficos.CDS_Busca.FieldByName('DES_BASE_DADOS').AsString;

          //  \\201.86.212.10\C:\SIDICOM.NEW\BANCO.FDB

          (DMConexoes.Components[i] as TIBDatabase).DatabaseName:=s;
          Break;
        End;
      End; // If DMConexoes.Components[i] is TIBDatabase Then
    End; // For i:=0 to DMConexoes.ComponentCount-1 do

    DMGraficos.CDS_Busca.Next;
  End; // While Not DMGraficos.CDS_Busca.Eof do
  DMGraficos.CDS_Busca.Close;

  // Monta Conexões de Empresas Inativas Válidas ===============================
  MySql:='Select *'+
         ' From EMP_Conexoes e'+
         ' Where e.Ind_Ativo=''NAO'''+
         ' And e.cod_filial>30'+
         ' Order by Cod_Emp';
  DMGraficos.CDS_Busca.Close;
  DMGraficos.SDS_Busca.CommandText:=MySql;
  DMGraficos.CDS_Busca.Open;

  While Not DMGraficos.CDS_Busca.Eof do
  Begin
    For i:=0 to DMConexoes.ComponentCount-1 do
    Begin
      If DMConexoes.Components[i] is TIBDatabase Then
      Begin
        If (DMConexoes.Components[i] as TIBDatabase).Name='IBDB_'+DMGraficos.CDS_Busca.FieldByName('Cod_Filial').AsString Then
        Begin
           (DMConexoes.Components[i] as TIBDatabase).Connected:=False;

           sEndIP:=DMGraficos.CDS_Busca.FieldByName('ENDERECO_IP').AsString;

           //Tipo de Conexão: TCP/IP NetBEUI
           If (Trim(sgTpConexao)='') Or (Trim(sgTpConexao)='NetBEUI')  Or
              (AnsiUpperCase(sEndIP)='LOCALHOST') Or (AnsiUpperCase(sEndIP)=sgComServer) Then
           Begin
             s:='\\';

             // Se Conexão Local ou Externa ======================================
             //  \\201.86.212.10\C:\SIDICOM.NEW\BANCO.FDB
             If (Not bgConexaoLocal) and (Trim(DMGraficos.CDS_Busca.FieldByName('Endereco_IP_Externo').AsString)<>'') Then
              s:=s+IncludeTrailingPathDelimiter(DMGraficos.CDS_Busca.FieldByName('ENDERECO_IP_EXTERNO').AsString)
             Else
              s:=s+IncludeTrailingPathDelimiter(sEndIP);

             s:=s+IncludeTrailingPathDelimiter(DMGraficos.CDS_Busca.FieldByName('Pasta_Base_Dados').AsString)+
                                               DMGraficos.CDS_Busca.FieldByName('Des_Base_Dados').AsString;
           End; // If (Trim(sgTpConexao)='') Or (Trim(sgTpConexao)='NetBEUI') Then

           If (Trim(sgTpConexao)='TCP/IP') and (AnsiUpperCase(sEndIP)<>'LOCALHOST') and (AnsiUpperCase(sEndIP)<>sgComServer) Then
           Begin
             s:=sEndIP+':'+
                IncludeTrailingPathDelimiter(DMGraficos.CDS_Busca.FieldByName('Pasta_Base_Dados').AsString)+
                                             DMGraficos.CDS_Busca.FieldByName('Des_Base_Dados').AsString;
           End; // If Trim(sgTpConexao)='TCP/IP' Then

          (DMConexoes.Components[i] as TIBDatabase).DatabaseName:=s;
          Break;
        End;
      End; // If DMConexoes.Components[i] is TIBDatabase Then
    End; // For i:=0 to DMConexoes.ComponentCount-1 do

    DMGraficos.CDS_Busca.Next;
  End; // While Not DMGraficos.CDS_Busca.Eof do
  DMGraficos.CDS_Busca.Close;

End; // Monta Empresas a Conectar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Conecta a Administraçao MPMS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TDMGraficos.ConectaMPMS: Boolean;
Var
  MySql: String;
  i: Integer;
  s: String;
  sEndIP: String;
Begin
  Result:=False;

  Try
    MySql:='Select *'+
           ' From EMP_Conexoes e'+
           ' Where e.cod_filial='+QuotedStr('99');
    DMGraficos.CDS_Busca.Close;
    DMGraficos.SDS_Busca.CommandText:=MySql;
    DMGraficos.CDS_Busca.Open;

    // Inicializa Conexao
    For i:=0 to DMConexoes.ComponentCount-1 do
    Begin
      If DMConexoes.Components[i] is TIBDatabase Then
      Begin
        If (DMConexoes.Components[i] as TIBDatabase).Name='IBDB_MPMS' Then
        Begin
           (DMConexoes.Components[i] as TIBDatabase).Connected:=False;

           sEndIP:=DMGraficos.CDS_Busca.FieldByName('ENDERECO_IP').AsString;

           // Tipo de Conexão: TCP/IP
           s:=sEndIP+':'+
              IncludeTrailingPathDelimiter(DMGraficos.CDS_Busca.FieldByName('PASTA_BASE_DADOS').AsString)+
                                           DMGraficos.CDS_Busca.FieldByName('DES_BASE_DADOS').AsString;

          (DMConexoes.Components[i] as TIBDatabase).DatabaseName:=s;
          Break;
        End;
      End; // If DMConexoes.Components[i] is TIBDatabase Then
    End; // For i:=0 to DMConexoes.ComponentCount-1 do

    ConexaoEmpIndividual('IBDB_MPMS', 'IBT_MPMS','A');
    DMGraficos.CriaQueryIB('IBDB_MPMS', 'IBT_MPMS', IBQ_MPMS, True);
    DMGraficos.CDS_Busca.Close;

    Result:=True;
  Except
  End;
End; // Conecta a Administraçao MPMS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Atualiza Conexao TIBQuery >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMGraficos.CriaQueryIB(sDataBase, sTransaction: String; Var IBQ_Free: TIBQuery; bCriaIBQ: Boolean);
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
  End; // For i:=0 to DMConexoes.ComponentCount-1 do
End; // Atualiza Conexao TIBQuery >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Transacao IB >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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

    If (ii=0) or (ii>4) Then
     Break;
  End; // While Not b do
End; // Transacao IB >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Conexao IB Individual >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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

    If (ii=0) or (ii>0) Then // 1 vezes
     Break;
  End; // While Not b do
End; // Conexao IB Individual >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMGraficos.ConectaBanco;
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
      Params.Clear;
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
//      try
//         Connected:=False;
//
//        Params.Clear;
//        LoadParamsFromIniFile(sgPath_Local+'PCTConect_IB._DNSini');
//        Params.Add('User_Name='+sUser_Name);
//        Params.Add('Password='+sPassword);
//        Connected:=True;
//      Except // finally
//      End;

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

procedure TDMGraficos.DataModuleCreate(Sender: TObject);
Var
  i: Integer;
  Arq: TextFile;
  sArquivo: TStringList;
  sLinha: String;
  sNewIP: String;
begin
  // Pasta Executavel ==========================================================
  sgPath_Local:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));

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

  bgSiga:=True;
end;

end.
