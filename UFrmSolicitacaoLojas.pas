unit UFrmSolicitacaoLojas;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBXpress, DB;

type
  TFrmSolicitacaoLojas = class(TForm)
    Panel1: TPanel;
    Timer1: TTimer;

    // ODIR ====================================================================

    // Importa Arquvio de Solcitação para BelShop.FDB
    Procedure ImportaSolicitacoes;

    // ODIR ====================================================================

    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSolicitacaoLojas: TFrmSolicitacaoLojas;

  bgConexaoLocal: Boolean; // Se Conexão com o Servidor da Matriz é Local - Verifica a Existencia do Arquivo "ConexaoExterna.ini"

  // Cria Ponteiro de transacão
  TD: TTransactionDesc;

implementation

uses DK_Procs1, UDMSolicitacaoLojas;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Importa Arquvio de Solcitação para BelShop.FDB >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSolicitacaoLojas.ImportaSolicitacoes;
var
  s, sNomeArquivo, sConteudo, sNomeCampo, sPastaFTP: String;
  SR: TSearchRec; // Localiza Arquivos

  MySql: String;

  slArquivos: Tstrings;
  Arq: TextFile;
  sLinha, sLinhaCompl: String;
  bProcessa: Boolean;

  i, ii, iii: Integer;
  iNumCampos: Integer;
Begin
  slArquivos:=TStringList.Create;

  // Verificva se Transação esta Ativa
  If DMSolicitacaoLojas.SQLC.InTransaction Then
   DMSolicitacaoLojas.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMSolicitacaoLojas.SQLC.StartTransaction(TD);

  Try // Principal /////////////////////////////////////////////////////////////
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Busca Numero de Campos da Tabelas OC_COMPRAR_LOJAS ======================
    MySql:=' SELECT COUNT(DISTINCT CAMPOS.RDB$FIELD_NAME) Tot_Campos'+
           ' FROM RDB$RELATIONS TABELAS, RDB$RELATION_FIELDS CAMPOS'+
           ' WHERE TABELAS.RDB$RELATION_NAME = CAMPOS.RDB$RELATION_NAME'+
           ' AND   TABELAS.RDB$SYSTEM_FLAG = 0'+
           ' AND   TABELAS.RDB$RELATION_NAME=''OC_COMPRAR_LOJAS''';
    DMSolicitacaoLojas.CDS_Busca.Close;
    DMSolicitacaoLojas.SDS_Busca.CommandText:=MySql;
    DMSolicitacaoLojas.CDS_Busca.Open;
    iNumCampos:=DMSolicitacaoLojas.CDS_Busca.FieldByNAme('Tot_Campos').AsInteger;
    DMSolicitacaoLojas.CDS_Busca.Close;

    // Busca Nome de Arquivo de Solicitação ==================================
    sPastaFTP:=sgPath_Local+'AreaFTP\';
    i := FindFirst(sPastaFTP+'*.TXT', faAnyFile, SR);
    while i = 0 do
    begin
      if (SR.Attr and faDirectory) <> faDirectory then
       slArquivos.Add(sPastaFTP+SR.Name);

      i := FindNext(SR);
    end; // while i = 0 do

    // Abre OC_COMPRAR_LOJAS =================================================
    DMSolicitacaoLojas.CDS_AcomprarLoja.Open;

    // Loop de Arquivo Encontrados =============================================
    If slArquivos.Count>0 Then
    Begin
      For i := 0 to slArquivos.Count - 1 do
      Begin
        sleep(60000);
        sNomeArquivo:=slArquivos[i];
        AssignFile(Arq,slArquivos[i]);

        sLinhaCompl:='';
        ii:=0;
        Reset(Arq);
        While not Eof(Arq) do
        Begin
          Readln(Arq,sLinha);

          If copy(sLinha,length(sLinha),1)<>';' Then
           Begin
             If sLinhaCompl='' Then
              sLinhaCompl:=sLinha
             Else
              sLinhaCompl:=sLinhaCompl+' - '+sLinha;

             bProcessa:=False;
           End
          Else // If copy(sLinha,length(sLinha),1)<>';' Then
           Begin
             If sLinhaCompl<>'' Then
              sLinha:=sLinhaCompl+' - '+sLinha;

             bProcessa:=True;
           End;

          If bProcessa Then
          Begin
            sLinhaCompl:='';

            // Grava OC_COMPRAR_MESES_LOJAS ======================================
            If Separa_String(sLinha,1)='DEMANDA' Then
            Begin
              MySql:=' INSERT INTO OC_COMPRAR_MESES_LOJAS'+
                     ' (COD_LOJA, NUM_DOCUMENTO, MES1, MES2, MES3, MES4, MES5, MES6, MES7, MES8)'+
                     ' VALUES ('+
                     QuotedStr(Separa_String(sLinha,2))+', '+
                     QuotedStr(Separa_String(sLinha,3))+', '+
                     QuotedStr(Separa_String(sLinha,4))+', '+
                     QuotedStr(Separa_String(sLinha,5))+', '+
                     QuotedStr(Separa_String(sLinha,6))+', '+
                     QuotedStr(Separa_String(sLinha,7))+', '+
                     QuotedStr(Separa_String(sLinha,8))+', '+
                     QuotedStr(Separa_String(sLinha,9))+', '+
                     QuotedStr(Separa_String(sLinha,10))+', '+
                     QuotedStr(Separa_String(sLinha,11))+')';
              DMSolicitacaoLojas.SQLC.Execute(MySql,nil,nil);

              Break;
            End;

            // Grava OC_COMPRAR_LOJAS ============================================
            If ii<>0 Then // Não Processa Cabecalho
            Begin
              DMSolicitacaoLojas.CDS_AcomprarLoja.Insert;
              For iii:=1 to iNumCampos do
              Begin
                sConteudo:=Separa_String(sLinha,iii);
                sNomeCampo:=DMSolicitacaoLojas.CDS_AcomprarLoja.Fields[iii-1].FieldName;

                If Trim(sConteudo)='' Then
                 DMSolicitacaoLojas.CDS_AcomprarLoja.FieldByName(sNomeCampo).AsString:=EmptyStr
                Else
                 DMSolicitacaoLojas.CDS_AcomprarLoja.FieldByName(sNomeCampo).AsVariant:=sConteudo;

              End; // For iii:=1 to iNumCampos do
              DMSolicitacaoLojas.CDS_AcomprarLoja.Post;
            End; // If ii<>0 Then // Não Processa Cabecalho

          End; // If bProcessa Then

          inc(ii);
        End; // While not Eof(Arq) do

        CloseFile(Arq);

        // Renomeia o Arquivo como Processado ==================================
        s:=ExtractName(slArquivos[i]);
        s:=IncludeTrailingPathDelimiter(ExtractFilePath(slArquivos[i]))+s+'.PROC';
        RenameFile(slArquivos[i],s);

        // Move para Arquivo Processados ======================================
        DeleteFile(sPastaFTP+'ArquivosProcessados\'+ExtractFileName(s));
        MoveFile(PChar(s),PChar(sPastaFTP+'ArquivosProcessados\'+ExtractFileName(s)));
      End; // For i := 0 to slArquivos.Count - 1 do

      // Atualiza Transacao ====================================================
      DMSolicitacaoLojas.CDS_AcomprarLoja.ApplyUpdates(0);

      // Acerta Totais nas Solictações de Lojas ================================
      MySql:=' UPDATE oc_comprar_lojas'+
             ' SET VLR_DESCONTOS=((QTD_ACOMPRAR*VLR_UNI_COMPRA)*(PER_DESCONTO/100))'+
             ' , VLR_BRUTO=(QTD_ACOMPRAR*VLR_UNI_COMPRA)-VLR_DESCONTOS'+
             ' , VLR_BASE_ICMS=VLR_BRUTO'+
             ' , VLR_ICMS=CAST(((VLR_BASE_ICMS*PER_ICMS)/100) AS NUMERIC(12,2))'+
             ' , VLR_IPI=CAST(((VLR_BRUTO*PER_IPI)/100) AS NUMERIC(12,2))'+
             ' , VLR_BASE_ST=VLR_BRUTO+(CAST(((VLR_BRUTO*PER_MARGEM_ST)/100) AS NUMERIC(12,2)))'+
             ' , VLR_ST=(CAST(((VLR_BASE_ST*PER_ST)/100) AS NUMERIC(12,2))-VLR_ICMS)'+
             ' , VLR_TOT_COMPRA=VLR_BRUTO+VLR_ST+VLR_IPI'+
             ' , VLR_TOT_VENDA=QTD_ACOMPRAR*VLR_UNI_VENDA'+

             ' WHERE qtd_acomprar<>0'+
             ' AND vlr_tot_compra=0'+
             ' AND vlr_uni_compra<>0';
      DMSolicitacaoLojas.SQLC.Execute(MySql,nil,nil);

      // Coloca para Lixeira o Que não é para Comprar ==========================
      MySql:=' UPDATE oc_comprar_lojas l'+
             ' SET l.ind_oc_gerada=''L'','+
             ' l.dta_oc_gerada=current_timestamp,'+
             ' l.num_oc_gerada=999999999'+
             ' WHERE qtd_acomprar=0';
      DMSolicitacaoLojas.SQLC.Execute(MySql,nil,nil);

      DMSolicitacaoLojas.SQLC.Commit(TD);
    End; // If slArquivos.Count>0 Then

    { Libera a instancia da lista da memória }
    DMSolicitacaoLojas.CDS_AcomprarLoja.Close;
    FreeAndNil(slArquivos);
    slArquivos.Free;

    DateSeparator:='/';
    DecimalSeparator:=',';
  Except // Try // Principal ///////////////////////////////////////////////////
    on e : Exception do
    Begin

      // Abandona Transacao ====================================================
      DMSolicitacaoLojas.CDS_AcomprarLoja.CancelUpdates;
      DMSolicitacaoLojas.SQLC.Rollback(TD);

      DMSolicitacaoLojas.CDS_AcomprarLoja.Close;
      DateSeparator:='/';
      DecimalSeparator:=',';

      CloseFile(Arq);

      // Renomeia para não processado - Olhar Arquivo de Erro ==================
      s:=ExtractName(sNomeArquivo);
      s:=ExtractFilePath(sNomeArquivo)+s+'.NPROC';
      RenameFile(sNomeArquivo,s);

      // Salva Erro
      AssignFile(Arq,sPastaFTP+ExtractName(sNomeArquivo)+'.ERR');
      Rewrite(Arq);
      s:='Mensagem de erro do sistema:'+cr+
         'Nome Arquivo: '+sNomeArquivo+cr+
         'Seq: '+IntToStr(iii)+cr+
         'Nome Campo: '+sNomeCampo+cr+
         'Conteudo: '+sConteudo+cr+
         'Erro: '+e.message;
      Writeln(Arq,s);
      CloseFile(Arq);
    End; // on e : Exception do
  End; // Try // Principal /////////////////////////////////////////////////////

End; // Importa Arquvio de Solcitação para BelShop.FDB >>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmSolicitacaoLojas.Timer1Timer(Sender: TObject);
Var
  sHora: String;
begin
  Timer1.Enabled:=False;

  // Importa Arquvio de Solcitação para BelShop.FDB ============================
  ImportaSolicitacoes;

  sHora:=TimeToStr(DataHoraServidorFI(DMSolicitacaoLojas.SDS_DtaHoraServidor));
  sHora:=copy(sHora,1,2);

  If sHora='22' Then
  Begin
    Application.Terminate;
    Exit;
  End;

  Timer1.Enabled:=True;

end;

end.
