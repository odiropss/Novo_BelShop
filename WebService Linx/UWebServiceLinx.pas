unit UWebServiceLinx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, JvExStdCtrls, JvRichEdit,
  JvExControls, JvEditorCommon, JvEditor, ComCtrls, JvHLEditor, JvMemo,
  JvUnicodeHLEditor, JvUnicodeEditor, RxRichEd, xmldom, XMLIntf, msxmldom,
  XMLDoc, JvXPCore, JvXPButtons, WinInet, DBXpress;

type
  TFrmWebServiceLinx = class(TForm)
    IdHTTP: TIdHTTP;
    XMLDocument1: TXMLDocument;
    Bt_LinxLojas: TJvXPButton;
    Bt_LinxVendedores: TJvXPButton;
    Bt_LinxClientesFornec: TJvXPButton;
    Bt_LinxProdutos: TJvXPButton;
    Bt_LinxProdutosDetalhes: TJvXPButton;
    Bt_LinxMovimento: TJvXPButton;
    Bt_LinxFaturas: TJvXPButton;
    Bt_AtualizaBancosDados: TJvXPButton;
    procedure Bt_LinxLojasClick(Sender: TObject);
    procedure Bt_LinxClientesFornecClick(Sender: TObject);
    procedure Bt_LinxMovimentoClick(Sender: TObject);
    procedure Bt_LinxVendedoresClick(Sender: TObject);
    procedure Bt_LinxProdutosDetalhesClick(Sender: TObject);
    procedure Bt_LinxProdutosClick(Sender: TObject);
    procedure Bt_LinxFaturasClick(Sender: TObject);

    // Odir ====================================================================
    Procedure SalvaProcessamento(s:String);

    Procedure MontaMetodoXMLPost(sSetor: String=''; sLinha: String=''; sMarca: String=''; sColecao: String='');

    Function  EnviaMetodoXMLPost: Boolean;

    Procedure LeMetodoXMLRetorno;
    // Odir ====================================================================

    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure Bt_AtualizaBancosDadosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmWebServiceLinx: TFrmWebServiceLinx;

  sgCodLoja,    // Código da Loja/Empresa em Processamento (Codigo da Loja no SIDICOM)
  sgCodEmpresa, // Código da Loja/Empresa em Processamento (Codigo da Loja no Microvix)
  sgMensagem, sgDta,
  sgPastaBelShop, sgPastaRetornos, sgPastaMetodos: String;

  tgArqProc: TStringList; // Arquivo de Acompanhamento de Processamento

  sgArqProc: String;      // Pasta e Nome do Arquivo de Acompanhamento de Processamento a Salvar
                          // C:\Projetos\BelShop\Fontes\WebService Linx\Retornos\@LinxWebService_'+sgDta+'.txt';
                          // Vem do Arquivo:  C:\Projetos\BelShop\Fontes\WebService Linx\Linx_WebService.Ini

  tgMetodos: TStringList; // Contem osd Metodos a Processar
                          // Vem do Arquivo:  C:\Projetos\BelShop\Fontes\WebService Linx\Linx_WebService.Ini

  sgMetodo,    // Metodo em Processamento
  sgArqXMLRet, // Nome do Arquivo de Retorno
  sgCNPJProc,  // CNPJ da Empresa Em Processamento
  sgDtaInicio, sgDtaFim, // Datas Para Busca de Dados

  // Parametros Linx WebService
  sgWebServiceSenha, sgWebServiceUsuario, sgWebServiceChave: String;

  // Comandos Sql de UpDate/Insert
  sSqlUpInCampos,  // Se sSqlUpInCampos='': Monta do Inicio SeNão: Não Faz Nada já Esta Montado
  sSqlUpInValores: // Se sSqlUpInValores='': Monta do Inicio com Values SeNão: Termina de Montar e Executa
  String;

  TD: TTransactionDesc; // Ponteiro de Transacão

implementation

uses
  IdMultipartFormData, DK_Procs1, uj_001, uj_002, UDMLinxWebService,
  StrUtils, DB;

{$R *.dfm}

//==============================================================================
// Odir - Inicio ===============================================================
//==============================================================================

// Le Retorno e Salva no Banco de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmWebServiceLinx.LeMetodoXMLRetorno;
Var
  MySql: String;
  sMensagem, sCampoDta: String;

  iFor: Integer;
  iii, ii, i: Integer;

  DOC:IXMLDocument;

  Note_Response, Node_Campos, Node_Valores: IXMLNode;

  tgCamposBD: TStringList;
Begin
  // Verifica se Transação esta Ativa
  If DMLinxWebService.SQLC.InTransaction Then
   DMLinxWebService.SQLC.Rollback(TD);

  tgCamposBD:=TStringList.Create;

  // Inicializa Retorno do Metodo ==============================================
  DOC:=LoadXMLDocument(sgPastaRetornos+sgArqXMLRet);

  // Verifica se Erro Com Erro =================================================
  If DOC.ChildNodes.Nodes['Microvix'].ChildNodes['ResponseResult'].ChildNodes['ResponseSuccess'].Text='False' Then
  Begin
    SalvaProcessamento('=====================================');
    SalvaProcessamento(sgMetodo+' com Erro no Post !!');
    sMensagem:='';
    For i:=0 to DOC.ChildNodes.Nodes['Microvix'].ChildNodes['ResponseResult'].ChildNodes['ResponseError'].ChildNodes.Count-1 do
    Begin
      If DOC.ChildNodes.Nodes['Microvix'].ChildNodes['ResponseResult'].ChildNodes['ResponseError'].ChildNodes[i].NodeName='Message' Then
       sMensagem:=Trim(sMensagem+' '+
                  DOC.ChildNodes.Nodes['Microvix'].ChildNodes['ResponseResult'].ChildNodes['ResponseError'].ChildNodes[i].NodeValue);

    End;
    SalvaProcessamento(sgMetodo+': '+sMensagem);
    SalvaProcessamento('=====================================');
    Exit;
  End;

  // Le XML de Retorno e Atualiza Banco de Dados ===============================
  For i:=0 to DOC.ChildNodes.Nodes['Microvix'].ChildNodes.Count-1 do
  Begin
    // Guarda Código da Empresa ==============================================
    if AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxLojas') Then
     sgCodEmpresa:=DOC.ChildNodes.Nodes['Microvix'].ChildNodes['ResponseData'].ChildNodes['R'].ChildNodes[1].NodeValue;

    Note_Response := DOC.ChildNodes.Nodes['Microvix'].ChildNodes[i];

    If Note_Response.NodeName = 'ResponseData' Then
    Begin
      // Busca Campos da Tabela para Comparações ===============================
      MySql:=' SELECT DISTINCT Trim(c.rdb$field_name) Campo'+
             ' FROM RDB$RELATION_FIELDS c'+
             ' WHERE UPPER(c.rdb$relation_name)='+QuotedStr(AnsiUpperCase(sgMetodo))+
             ' ORDER BY c.rdb$field_position';
      DMLinxWebService.CDS_Busca.Close;
      DMLinxWebService.SDS_Busca.CommandText:=MySql;
      DMLinxWebService.CDS_Busca.Open;

      // Monta Inicio Sql -------------------------------------------
      sSqlUpInCampos:=' UPDATE OR INSERT INTO '+sgMetodo+' ('+
                       DMLinxWebService.CDS_Busca.FieldByName('Campo').AsString;

      tgCamposBD.Clear;
      While Not DMLinxWebService.CDS_Busca.Eof do
      Begin
         If DMLinxWebService.CDS_Busca.RecNo<>1 Then
          sSqlUpInCampos:=
           sSqlUpInCampos+', '+DMLinxWebService.CDS_Busca.FieldByName('Campo').AsString;

        tgCamposBD.Add(DMLinxWebService.CDS_Busca.FieldByName('Campo').AsString);

        DMLinxWebService.CDS_Busca.Next;
      End; // While Not DMLinxWebService.CDS_Busca.Eof do
      DMLinxWebService.CDS_Busca.Close;

      // Termina sSqlUpInCampos -------------------------------------
      sSqlUpInCampos:=
       sSqlUpInCampos+')';

      // Inicia sSqlUpInCampos --------------------------------------
      sSqlUpInValores:=' VALUES (';

      // Analisa Campos Node "C" ===============================================
      Node_Campos := Note_Response.ChildNodes.Nodes['C'];
      If Assigned(Node_Campos) Then
      Begin
        for ii := 0 to Node_Campos.ChildNodes.Count-1 do // Node "C"
        Begin
          iii:=ii;

          // Considera Campo Empresa das TABELAS ===============================
          If ((AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxFaturas'))   Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimento')) Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosDetalhes'))) And (ii>0) Then
           iii:=iii+1;

          If AnsiUpperCase(Trim(Node_Campos.ChildNodes[ii].NodeValue))<>AnsiUpperCase(tgCamposBD[iii]) Then
          Begin
            SalvaProcessamento('=====================================');
            SalvaProcessamento(sgMetodo+' Campos em Divergencia !!');
            Exit;
          End; // If Trim(Node_Campos.ChildNodes[ii].NodeValue)<>tgCamposBD[ii] Then
        End; // for ii := 0 to Node_Campos.ChildNodes.Count-1 do
      End; // If Assigned(Node_Campos) Then

      // Monta Transacao =======================================================
      TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
      TD.IsolationLevel:=xilREADCOMMITTED;
      DMLinxWebService.SQLC.StartTransaction(TD);
      Try // Try da Transação //////////////////////////////////////////////////
        DateSeparator:='.';
        DecimalSeparator:='.';

        // Le Valores dos Campos = Node "R" ====================================
        For iii:=0 to Note_Response.ChildNodes.Count - 1 do // Node "C"
        Begin
          Node_Valores := Note_Response.ChildNodes[iii]; // Node "R"

          // Se Node de Registro - Node "R"
          If VarToStr(Node_Valores.NodeName)='R' Then // Node "R"
          Begin
            // Inicia sSqlUpInCampos --------------------------------
            sSqlUpInValores:=' VALUES (';

            If Assigned(Node_Valores) Then // Libera Node "R" Para Leitura
            Begin
              For ii:=0 to Node_Valores.ChildNodes.Count-1 do // Le Node "R"
              Begin
                sCampoDta:='';

                // Considera Campo "Empresa" das TABELAS ------------
                If ((AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxFaturas'))   Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimento')) Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosDetalhes'))) And (ii=1) Then
                Begin
                  sSqlUpInValores:=
                   sSqlUpInValores+QuotedStr(sgCodEmpresa)+', ';
                End; // If ((AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxFaturas'))   Or...

                // Monta sSqlUpInValores ---------------------
                if VarIsNull(Node_Valores.ChildNodes[ii].NodeValue) Then
                 Begin
                   sSqlUpInValores:=
                    sSqlUpInValores+'NULL, ';
                 End
                Else // if VarIsNull(Node_Valores.ChildNodes[ii].NodeValue) Then
                 Begin
                   // Guarda Valor Campo Data
                   sCampoDta:='';
                   If (Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),5,1)='-') And
                      (Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),8,1)='-') Then
                   Begin
                     sCampoDta:=Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),9,2)+'.'+
                                Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),6,2)+'.'+
                                Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),1,4);

                     Try
                       StrToDate(sCampoDta);
                     Except
                       sCampoDta:='';
                     End
                   End; // If (Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),5,1)='-') And ....

                   If Trim(sCampoDta)<>'' Then
                    Begin
                      sSqlUpInValores:=
                       sSqlUpInValores+QuotedStr(sCampoDta)+', ';
                    End
                   Else
                    Begin
                      sSqlUpInValores:=
                       sSqlUpInValores+QuotedStr(Trim(Node_Valores.ChildNodes[ii].NodeValue))+', ';
                    End; // If Trim(sCampoDta)<>'' Then
                 End; // if VarIsNull(Node_Valores.ChildNodes[ii].NodeValue) Then
              End; // For ii:=0 to Node_Valores.ChildNodes.Count-1 do // Le Node "R"

              // Termina de Montar sSqlUpInValores =============================

              // Considera Campo "Cod_loja do SIDICOM" das TABELAS ------------
              If (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxFaturas'))   Or
                  (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxLojas')) Or
                  (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimento')) Or
                  (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosDetalhes')) Then
               Begin
                 sSqlUpInValores:=
                  sSqlUpInValores+' '+QuotedStr(sgCodLoja)+', current_date, current_time)';
               End
              Else
               Begin
                 sSqlUpInValores:=
                  sSqlUpInValores+' current_date, current_time)';
               End;

              // Inclu MATCHING em sSqlUpInValores ---------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxLojas') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (empresa, cnpj_emp)';

              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxVendedores') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (cod_vendedor)';

              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxClientesFornec') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (cod_cliente)';

              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutos') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (cod_produto)';

              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosDetalhes') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (empresa, cnpj_emp, cod_produto)';

              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimento') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (empresa, cnpj_emp, transacao, documento, '+
                                           'chave_nf, codigo_cliente, operacao, tipo_transacao, '+
                                           'cod_produto, cod_barra, identificador)';

              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxFaturas') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (empresa, cnpj_emp, codigo_fatura, data_emissao, '+
                                           'cod_cliente, documento, serie, identificador)';

              // Executa Sql Update/Insert -----------------
              MySql:=sSqlUpInCampos+sSqlUpInValores;
              DMLinxWebService.SQLC.Execute(MySql, nil, nil);
            End; // If Assigned(Node_Valores) Then // Libera Node "R" Para Leitura
          End; // If VarToStr(Node_Valores.NodeName)='R' Then // Node "R"
        End; // For iii:=0 to Note_Response.ChildNodes.Count - 1 do // Node "C"

        // Atualiza Transacao ============================================
        DMLinxWebService.SQLC.Commit(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';

      Except // Except da Transação  /////////////////////////////////////
        on e : Exception do
        Begin
          // Abandona Transacao ==========================================
          DMLinxWebService.SQLC.Rollback(TD);

          DateSeparator:='/';
          DecimalSeparator:=',';

          sMensagem:='Erro DML: '+e.message;
          SalvaProcessamento(sgMetodo+': '+sMensagem);
          SalvaProcessamento('=====================================');
        End; // on e : Exception do
      End; // Try da Transação  ////////////////////////////////////////////////
    End; // If Note_Response.NodeName = 'ResponseData' Then
  End; // For i:=0 to DOC.ChildNodes.Nodes['Microvix'].ChildNodes.Count-1 do
end; // // Le Retorno e Salva no Banco de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Monta e Envia Htttp.Post >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmWebServiceLinx.EnviaMetodoXMLPost: Boolean;
var
  xml : TStringlist;
  sResponse: String;
  fsParams: TFileStream;
begin
  Result:=True;

  fsParams := TFileStream.Create(sgPastaMetodos+sgMetodo+'.xml', fmOpenRead or fmShareDenyWrite);

  xml := TStringlist.Create;
  try
    IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
    IdHTTP.Request.ContentEncoding := 'multipart/form-data';
    sResponse := IdHTTP.Post('http://webapi.microvix.com.br/1.0/api/integracao', fsParams);

    xml.Text:=sResponse;
    xml.SaveToFile(sgPastaRetornos+sgArqXMLRet);
  except
    on E: Exception do
    Begin
      Result:=False;
      SalvaProcessamento('=====================================');
      SalvaProcessamento(sgMetodo+' com Erro no Post !!');
      SalvaProcessamento(sgMetodo+': '+E.Message);
      SalvaProcessamento('=====================================');
    End;
  end;
  FreeAndNil(fsParams);
  FreeAndNil(xml);
End; // Monta e Envia Htttp.Post >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Salva Arquivo de Acompanhamento de Processamento >>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmWebServiceLinx.SalvaProcessamento(s:String);
Begin
  tgArqProc.Add(s);
  tgArqProc.SaveToFile(sgArqProc);
End; // Salva Arquivo de Acompanhamento de Processamento >>>>>>>>>>>>>>>>>>>>>>>

// Monta Metodos Post >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmWebServiceLinx.MontaMetodoXMLPost(sSetor: String=''; sLinha: String=''; sMarca: String=''; sColecao: String='');
Var
  txtArq:TextFile;
  sArq:String;
  sXML:String;
Begin
  // Gera Arquivo ==============================================================
  sArq:=sgPastaMetodos+sgMetodo+'.XML';

  // Exclui Arquivos Existentes ================================================
  DeleteFile(sArq);
  DeleteFile(sgPastaRetornos+sgArqXMLRet);

  // Monta Metodos =============================================================
  AssignFile(txtArq,sArq);
  Rewrite(txtArq);

  // Grava Linha Padrões =======================================================
  sXML:='<?xml version="1.0" encoding="UTF-8"?>';
  Writeln(txtArq,sXML);
  sXML:='<LinxMicrovix>';
  Writeln(txtArq,sXML);
  sXML:='	<Authentication password="'+sgWebServiceSenha+'" user="'+sgWebServiceUsuario+'"/>';
  Writeln(txtArq,sXML);
  sXML:='	<ResponseFormat>xml</ResponseFormat>';
  Writeln(txtArq,sXML);
  sXML:='	<Command>';
  Writeln(txtArq,sXML);
  sXML:='		<Name>'+sgMetodo+'</Name>'; // LinxLojas
  Writeln(txtArq,sXML);
  sXML:='		<Parameters>';
  Writeln(txtArq,sXML);
  sXML:='			<Parameter id="chave">'+sgWebServiceChave+'</Parameter>'; // d52511f4-3541-4a65-9adc-665513ea3207
  Writeln(txtArq,sXML);
  sXML:='			<Parameter id="cnpjEmp">'+sgCNPJProc+'</Parameter>'; // 03772229001880
  Writeln(txtArq,sXML);

  // LinxVendedores ============================================================
  If sgMetodo='LinxVendedores' Then
  Begin
    sXML:='			<Parameter id="data_upd_inicial">'+sgDtaInicio+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="data_upd_fim">'+sgDtaFim+'</Parameter>';
    Writeln(txtArq,sXML);
  End;

  // LinxClientesFornec / LinxMovimento ========================================
  If (sgMetodo='LinxClientesFornec') Or (sgMetodo='LinxMovimento') Or (sgMetodo='LinxFaturas') Then
  Begin
    sXML:='			<Parameter id="data_inicial">'+sgDtaInicio+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="data_fim">'+sgDtaFim+'</Parameter>';
    Writeln(txtArq,sXML);
  End;

  // LinxProdutos ==============================================================
  If sgMetodo='LinxProdutos' Then
  Begin
    sXML:='			<Parameter id="id_setor">'+sSetor+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="id_linha">'+sLinha+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="id_marca">'+sMarca+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="id_colecao">'+sColecao+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="dt_update_inicio">'+sgDtaInicio+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="dt_update_fim">'+sgDtaFim+'</Parameter>';
    Writeln(txtArq,sXML);
  End;

  // LinxProdutosDetalhes ======================================================
  If sgMetodo='LinxProdutosDetalhes' Then
  Begin
    sXML:='			<Parameter id="data_mov_ini">'+sgDtaInicio+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="data_mov_fim">'+sgDtaFim+'</Parameter>';
    Writeln(txtArq,sXML);
  End;

  // Grava Linhas de Encerramento XML ==========================================
  sXML:='		</Parameters>';
  Writeln(txtArq,sXML);
  sXML:='	</Command>';
  Writeln(txtArq,sXML);
  sXML:='</LinxMicrovix>';
  Writeln(txtArq,sXML);
                   
  CloseFile(txtArq);
End; // Monta Metodos Post >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//==============================================================================
// Odir - Inicio ===============================================================
//==============================================================================
procedure TFrmWebServiceLinx.Bt_LinxLojasClick(Sender: TObject);
var
  xml : TStringlist;
  sResponse: String;
  fsParams: TFileStream;
begin
//  MontaMetodoXMLPost('LinxLojas', 'd52511f4-3541-4a65-9adc-665513ea3207', '03772229001880');
//
//  // LinxLojas.xml
//  fsParams := TFileStream.Create(sgPastaMetodos+'LinxLojas.xml', fmOpenRead or fmShareDenyWrite);
//
//  xml := TStringlist.Create;
//  try
//    IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
//    IdHTTP.Request.ContentEncoding := 'multipart/form-data';
//    sResponse := IdHTTP.Post('http://webapi.microvix.com.br/1.0/api/integracao', fsParams);
//
//    xml.Text:=sResponse;
//    xml.SaveToFile(sgPastaRetornos+'Retorno_LinxLojas.XML');
//  except
//    on E: Exception do
//      ShowMessage('Error encountered during POST: ' + E.Message);
//  end;
//  FreeAndNil(fsParams);
//  FreeAndNil(xml);
end;

procedure TFrmWebServiceLinx.Bt_LinxClientesFornecClick(Sender: TObject);
var
  xml : TStringlist;
  sResponse: String;
  fsParams: TFileStream;
begin
//
//  MontaMetodoXMLPost('LinxClientesFornec', 'd52511f4-3541-4a65-9adc-665513ea3207', '03772229001880', '2017-01-01', '2017-01-05');
//
//  // LinxClientesFornec.xml
//  fsParams := TFileStream.Create(sgPastaMetodos+'LinxClientesFornec.xml', fmOpenRead or fmShareDenyWrite);
//
//  xml := TStringlist.Create;
//  try
//    IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
//    IdHTTP.Request.ContentEncoding := 'multipart/form-data';
//    sResponse := IdHTTP.Post('http://webapi.microvix.com.br/1.0/api/integracao', fsParams);
//
//    xml.Text:=sResponse;
//    xml.SaveToFile(sgPastaRetornos+'Retorno_LinxClientesFornec.XML');
//  except
//    on E: Exception do
//      ShowMessage('Error encountered during POST: ' + E.Message);
//  end;
//  FreeAndNil(fsParams);
//  FreeAndNil(xml);
end;

procedure TFrmWebServiceLinx.Bt_LinxMovimentoClick(Sender: TObject);
var
  xml : TStringlist;
  sResponse: String;
  fsParams: TFileStream;
begin
//  MontaMetodoXMLPost('LinxMovimento', 'd52511f4-3541-4a65-9adc-665513ea3207', '03772229001880',
//                     '2017-01-10', '2017-01-10');
//
//  // LinxMovimento.xml
//  fsParams := TFileStream.Create(sgPastaMetodos+'LinxMovimento.xml', fmOpenRead or fmShareDenyWrite);
//
//  xml := TStringlist.Create;
//  try
//    IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
//    IdHTTP.Request.ContentEncoding := 'multipart/form-data';
//    sResponse := IdHTTP.Post('http://webapi.microvix.com.br/1.0/api/integracao', fsParams);
//
//    xml.Text:=sResponse;
//    xml.SaveToFile(sgPastaRetornos+'Retorno_LinxMovimento.XML');
//  except
//    on E: Exception do
//      ShowMessage('Error encountered during POST: ' + E.Message);
//  end;
//  FreeAndNil(fsParams);
//  FreeAndNil(xml);
end;

procedure TFrmWebServiceLinx.Bt_LinxVendedoresClick(Sender: TObject);
var
  xml : TStringlist;
  sResponse: String;
  fsParams: TFileStream;
  i: Integer;
begin
//  MontaMetodoXMLPost('LinxVendedores', 'd52511f4-3541-4a65-9adc-665513ea3207', '03772229001880', '2016-10-01', '2017-01-05');
//
//  // LinxVendedores.xml
//  fsParams := TFileStream.Create(sgPastaMetodos+'LinxVendedores.xml', fmOpenRead or fmShareDenyWrite);
//
//  xml := TStringlist.Create;
//  try
//    IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
//    IdHTTP.Request.ContentEncoding := 'multipart/form-data';
//    sResponse := IdHTTP.Post('http://webapi.microvix.com.br/1.0/api/integracao', fsParams);
//
//    xml.Text:=sResponse;
//    xml.SaveToFile(sgPastaRetornos+'Retorno_LinxVendedores.XML');
//  except
//    on E: Exception do
//      ShowMessage('Error encountered during POST: ' + E.Message);
//  end;
//  FreeAndNil(fsParams);
//  FreeAndNil(xml);
end;

procedure TFrmWebServiceLinx.Bt_LinxProdutosDetalhesClick(Sender: TObject);
var
  xml : TStringlist;
  sResponse: String;
  fsParams: TFileStream;
  i: Integer;
begin
//  MontaMetodoXMLPost('LinxProdutosDetalhes', 'd52511f4-3541-4a65-9adc-665513ea3207', '03772229001880',
//                     '2016-12-20', '2017-01-05');
//
//  // LinxProdutosDetalhes.xml
//  fsParams := TFileStream.Create(sgPastaMetodos+'LinxProdutosDetalhes.xml', fmOpenRead or fmShareDenyWrite);
//
//  xml := TStringlist.Create;
//  try
//    IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
//    IdHTTP.Request.ContentEncoding := 'multipart/form-data';
//    sResponse := IdHTTP.Post('http://webapi.microvix.com.br/1.0/api/integracao', fsParams);
//
//    xml.Text:=sResponse;
//    xml.SaveToFile(sgPastaRetornos+'Retorno_LinxProdutosDetalhes.XML');
//  except
//    on E: Exception do
//      ShowMessage('Error encountered during POST: ' + E.Message);
//  end;
//  FreeAndNil(fsParams);
//  FreeAndNil(xml);
end;

procedure TFrmWebServiceLinx.Bt_LinxProdutosClick(Sender: TObject);
var
  xml : TStringlist;
  sResponse: String;
  fsParams: TFileStream;
  i: Integer;
begin
//  MontaMetodoXMLPost('LinxProdutos', 'd52511f4-3541-4a65-9adc-665513ea3207', '03772229001880',
//                     '2016-12-20', '2017-01-05', 'NULL', 'NULL', 'NULL', 'NULL');
//
//  // LinxProdutos.xml
//  fsParams := TFileStream.Create(sgPastaMetodos+'LinxProdutos.xml', fmOpenRead or fmShareDenyWrite);
//
//  xml := TStringlist.Create;
//  try
//    IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
//    IdHTTP.Request.ContentEncoding := 'multipart/form-data';
//    sResponse := IdHTTP.Post('http://webapi.microvix.com.br/1.0/api/integracao', fsParams);
//
//    xml.Text:=sResponse;
//    xml.SaveToFile(sgPastaRetornos+'Retorno_LinxProdutos.XML');
//  except
//    on E: Exception do
//      ShowMessage('Error encountered during POST: ' + E.Message);
//  end;
//  FreeAndNil(fsParams);
//  FreeAndNil(xml);
end;

procedure TFrmWebServiceLinx.Bt_LinxFaturasClick(Sender: TObject);
var
  xml : TStringlist;
  sResponse: String;
  fsParams: TFileStream;
begin
//  MontaMetodoXMLPost('LinxFaturas', 'd52511f4-3541-4a65-9adc-665513ea3207', '03772229001880',
//                     '2017-01-01', '2017-01-05');
//
//  // LinxFaturas.xml
//  fsParams := TFileStream.Create(sgPastaMetodos+'LinxFaturas.xml', fmOpenRead or fmShareDenyWrite);
//
//  xml := TStringlist.Create;
//  try
//    IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
//    IdHTTP.Request.ContentEncoding := 'multipart/form-data';
//    sResponse := IdHTTP.Post('http://webapi.microvix.com.br/1.0/api/integracao', fsParams);
//
//    xml.Text:=sResponse;
//    xml.SaveToFile(sgPastaRetornos+'Retorno_LinxFaturas.XML');
//  except
//    on E: Exception do
//      ShowMessage('Error encountered during POST: ' + E.Message);
//  end;
//  FreeAndNil(fsParams);
//  FreeAndNil(xml);
end;

procedure TFrmWebServiceLinx.FormCreate(Sender: TObject);
Var
  Arq: TextFile;
  sLinha: String;
  i, iFor: Integer;

  Flags : Cardinal; // Verifica Internet Ativo - Encerra Necessario

  MySql: String;
  bSiga: Boolean;
Begin

  // Cria Arquivo de Metodos a Processar =======================================
  tgMetodos:=TStringList.Create;

  // Ler Arquivo Ini de Pastas =================================================
  AssignFile(Arq,'Linx_WebService.Ini');

  Reset(Arq);
  i:=0;
  While not Eof(Arq) do
  Begin
    Readln(Arq,sLinha);

    If i=0 Then
     Begin
       sgPastaMetodos:=Trim(sLinha);
     End
    Else If i=1 Then
     Begin
       sgPastaRetornos:=Trim(sLinha);
     End
    Else
     Begin
       tgMetodos.Add(Trim(sLinha));
     End;

    Inc(i);
  End; // While not Eof(Arq) do
  CloseFile(Arq);

  // Pasta BelShop =============================================================
  i:=pos('BelShop',sgPastaMetodos);
  sgPastaBelShop:=Copy(sgPastaMetodos,1,i+7);

  // Verifica se Arquivo Ini de Conexão Existe =================================
  If Not (FileExists(sgPastaBelShop+'PCTConect_IB.ini')) Then
  Begin
    SalvaProcessamento(sgPastaMetodos+'PCTConect_IB.ini Não Encontrado !!');
    Application.Terminate;
    Exit;
  End;

  // Cria Arquivo de Acompanhamento do Processamento ===========================
  tgArqProc:=TStringList.Create;

  // Verifica se Interet Esta Ativa ============================================
  if not InternetGetConnectedState(@Flags, 0) then
  Begin
    SalvaProcessamento(sgDta+'Internet Não Conectada !!');
    Application.Terminate;
    Exit;
  End;

///////////////////
  // Conecta o Banco de Dados ==================================================
  If Not DMLinxWebService.ConectaBanco Then
  Begin
    SalvaProcessamento('Erro de Conexão!! '+sgMensagem);
    Application.Terminate;
    Exit;
  End;

  // Data Inicio da Atualização ================================================
  sgDta:=DateToStr(DataHoraServidorFI(DMLinxWebService.SDS_DtaHoraServidor));
  sgDta:=f_Troca('/','',f_Troca('.','',f_Troca('-','',sgDta)));

  // Salva Pasta e Nome do Arquivo de Acompanhamento de Processamento ==========
  sgArqProc:=sgPastaRetornos+'@LinxWebService_'+sgDta+'.txt';
  DeleteFile(sgArqProc);
///////////////////

  // Busca Parametros da Linx para WebService ==================================
  MySql:=' SELECT lp.usuario, lp.senha, lp.chave'+
         ' FROM LINXWEBSERVICE lp';
  DMLinxWebService.CDS_Busca.Close;
  DMLinxWebService.SDS_Busca.CommandText:=MySql;
  DMLinxWebService.CDS_Busca.Open;
  sgWebServiceUsuario:=DMLinxWebService.CDS_Busca.FieldByName('Usuario').AsString;
  sgWebServiceSenha  :=DMLinxWebService.CDS_Busca.FieldByName('Senha').AsString;
  sgWebServiceChave  :=DMLinxWebService.CDS_Busca.FieldByName('Chave').AsString;
  DMLinxWebService.CDS_Busca.Close;

  // Processa Lojas ============================================================
  MySql:=' SELECT em.cod_filial, em.num_cnpj'+
         ' FROM EMP_CONEXOES em'+
         ' WHERE em.cod_filial in ('+QuotedStr('18')+')'+
         ' ORDER BY 1';
  DMLinxWebService.CDS_Lojas.Close;
  DMLinxWebService.SDS_Lojas.CommandText:=MySql;
  DMLinxWebService.CDS_Lojas.Open;

  While Not DMLinxWebService.CDS_Lojas.Eof do
  Begin
    // Apropria Variaveis=====================================================
    sgCNPJProc:=Trim(DMLinxWebService.CDS_LojasNUM_CNPJ.AsString);
    sgCodLoja :=Trim(DMLinxWebService.CDS_LojasCOD_FILIAL.AsString);

    //==========================================================================
    // Loop nos Metodos - INICIO ===============================================
    //==========================================================================
    For iFor:=0 to tgMetodos.Count-1 do
    Begin
      sgMetodo  :=tgMetodos[iFor];
      sgArqXMLRet:='Retorno_'+sgMetodo+'.XML';

      // Montagem do Http.Post =================================================
      If sgMetodo='LinxLojas' Then
      Begin
        MontaMetodoXMLPost();
      End; // If sgMetodo='LinxLojas' Then

      If sgMetodo='LinxVendedores' Then
      Begin
//        sgDtaInicio:='NULL';
//        sgDtaFim   :='NULL';
        sgDtaInicio:='2005-01-01';
        sgDtaFim   :='2017-01-16';

        MontaMetodoXMLPost();
      End;

      If sgMetodo='LinxClientesFornec' Then
      Begin
//        sgDtaInicio:='2017-01-01';
//        sgDtaFim   :='2017-01-07';
        sgDtaInicio:='2005-01-01';
        sgDtaFim   :='2017-01-16';

        MontaMetodoXMLPost();
      End;

      If sgMetodo='LinxProdutos' Then
      Begin
        sgDtaInicio:='2017-01-01';
        sgDtaFim   :='2017-01-17';
//        sgDtaInicio:='NULL'; //
//        sgDtaFim   :='NULL'; //

        MontaMetodoXMLPost('NULL', 'NULL', 'NULL', 'NULL');
      End;

      If sgMetodo='LinxProdutosDetalhes' Then
      Begin
        sgDtaInicio:='2005-01-01';
        sgDtaFim   :='2017-01-17';
//        sgDtaInicio:='NULL'; // ODIR Altera para NULL a Primeira Vez
//        sgDtaFim   :='NULL'; // ODIR Altera para NULL a Primeira Vez

        MontaMetodoXMLPost();
      End;

      If sgMetodo='LinxMovimento' Then
      Begin
        sgDtaInicio:='2016-12-13'; // ODIR Altera para '2016-12-13' a Primeira Vez
        sgDtaFim   :='2017-01-16'; // ODIR Altera para 'data mais atual' a Primeira Vez

        MontaMetodoXMLPost();
      End;

      If sgMetodo='LinxFaturas' Then
      Begin
        sgDtaInicio:='2016-12-13'; // ODIR Altera para '2016-12-13' a Primeira Vez
        sgDtaFim   :='2017-01-16'; // ODIR Altera para 'data mais atual' a Primeira Vez

        MontaMetodoXMLPost();
      End;

      // Envio do Http.post ====================================================
      bSiga:=True;
      If Not EnviaMetodoXMLPost Then
       bSiga:=False;

      // Ler XML de Retorno e Salva no Banco de Dados ==========================
      If bSiga Then
       LeMetodoXMLRetorno;

    End; // For iFor:=0 to tgMetodos.Count-1 do
    //==========================================================================
    // Loop nos Metodos - FIM ==================================================
    //==========================================================================

    DMLinxWebService.CDS_Lojas.Next;
  End; // While Not DMLinxWebService.CDS_Lojas.Eof do
  DMLinxWebService.CDS_Lojas.Close;

  Application.Terminate;
  Exit;

end;

procedure TFrmWebServiceLinx.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FreeAndNil(tgArqProc);
  FreeAndNil(tgMetodos);
end;

procedure TFrmWebServiceLinx.FormActivate(Sender: TObject);
begin
//Odir Apagar
//  // Conecta o Banco de Dados ==================================================
//  If Not DMLinxWebService.ConectaBanco Then
//  Begin
//    SalvaProcessamento('Erro de Conexão!! '+sgMensagem);
//    Application.Terminate;
//    Exit;
//  End;
//
//  // Data Inicio da Atualização ================================================
//  sgDta:=DateToStr(DataHoraServidorFI(DMLinxWebService.SDS_DtaHoraServidor));
//  sgDta:=f_Troca('/','',f_Troca('.','',f_Troca('-','',sgDta)));
//
//  // Salva Pasta e Nome do Arquivo de Acompanhamento de Processamento ==========
//  sgArqProc:=sgPastaRetornos+'@LinxWebService_'+sgDta+'.txt';
//  DeleteFile(sgArqProc);

end;

procedure TFrmWebServiceLinx.Bt_AtualizaBancosDadosClick(Sender: TObject);
Var
  MySql: String;

  bSiga: Boolean;

  sArqXML, sMensagem, sCampoDta: String;

  iFor: Integer;
  iii, ii, i: Integer;

  DOC:IXMLDocument;

  Note_Response, Node_Campos, Node_Valores: IXMLNode;

  tgCamposBD: TStringList;
begin
//
//  // Verifica se Transação esta Ativa
//  If DMLinxWebService.SQLC.InTransaction Then
//   DMLinxWebService.SQLC.Rollback(TD);
//
//  tgCamposBD:=TStringList.Create;
//
//  For iFor:=0 to tgMetodos.Count-1 do
//  Begin
//    // Salva Nome do Metodo ====================================================
//    sgMetodo:=tgMetodos[iFor];
//    sArqXML:='Retorno_'+sgMetodo+'.XML';
//
//    // Le Retorno do Metodo ====================================================
//    DOC:=LoadXMLDocument(sgPastaRetornos+sArqXML);
//
//    // Verifica se existe Erros e Grava ========================================
//    bSiga:=True;
//    If DOC.ChildNodes.Nodes['Microvix'].ChildNodes['ResponseResult'].ChildNodes['ResponseSuccess'].Text='False' Then
//    Begin
//      bSiga:=False;
//      SalvaProcessamento('=====================================');
//      SalvaProcessamento(sgMetodo+' com Erro no Post !!');
//      sMensagem:='';
//      For i:=0 to DOC.ChildNodes.Nodes['Microvix'].ChildNodes['ResponseResult'].ChildNodes['ResponseError'].ChildNodes.Count-1 do
//      Begin
//        If DOC.ChildNodes.Nodes['Microvix'].ChildNodes['ResponseResult'].ChildNodes['ResponseError'].ChildNodes[i].NodeName='Message' Then
//         sMensagem:=Trim(sMensagem+' '+
//                    DOC.ChildNodes.Nodes['Microvix'].ChildNodes['ResponseResult'].ChildNodes['ResponseError'].ChildNodes[i].NodeValue);
//
//      End;
//      SalvaProcessamento(sgMetodo+': '+sMensagem);
//      SalvaProcessamento('=====================================');
//    End;
//
//    // Le XML de Retorno e Atualiza Banco de Dados =============================
//    If bSiga Then
//    Begin
//      // Guarda Código da Empresa ==============================================
//      if AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxLojas') Then
//       sgCodLoja:=DOC.ChildNodes.Nodes['Microvix'].ChildNodes['ResponseData'].ChildNodes['R'].ChildNodes[1].NodeValue;
//
//
//      For i:=0 to DOC.ChildNodes.Nodes['Microvix'].ChildNodes.Count-1 do
//      Begin
//        Note_Response := DOC.ChildNodes.Nodes['Microvix'].ChildNodes[i];
//
//        If Note_Response.NodeName = 'ResponseData' Then
//        Begin
//          // Busca Campos da Tabela para Comparações ===========================
//          MySql:=' SELECT DISTINCT Trim(c.rdb$field_name) Campo'+
//                 ' FROM RDB$RELATION_FIELDS c'+
//                 ' WHERE UPPER(c.rdb$relation_name)='+QuotedStr(AnsiUpperCase(sgMetodo))+
//                 ' ORDER BY c.rdb$field_position';
//          DMLinxWebService.CDS_Busca.Close;
//          DMLinxWebService.SDS_Busca.CommandText:=MySql;
//          DMLinxWebService.CDS_Busca.Open;
//
//          // Monta Inicio Sql ---------------------------------------
//          sSqlUpInCampos:=' UPDATE OR INSERT INTO ';
//
//          If (sgMetodo='LinxMovimento') Or (sgMetodo='LinxFaturas') Then
//           sSqlUpInCampos:=' INSERT INTO ';
//
//          sSqlUpInCampos:=
//           sSqlUpInCampos+sgMetodo+' ('+DMLinxWebService.CDS_Busca.FieldByName('Campo').AsString;
//
//          tgCamposBD.Clear;
//          While Not DMLinxWebService.CDS_Busca.Eof do
//          Begin
//             If DMLinxWebService.CDS_Busca.RecNo<>1 Then
//              sSqlUpInCampos:=
//               sSqlUpInCampos+', '+DMLinxWebService.CDS_Busca.FieldByName('Campo').AsString;
//
//            tgCamposBD.Add(DMLinxWebService.CDS_Busca.FieldByName('Campo').AsString);
//
//            DMLinxWebService.CDS_Busca.Next;
//          End; // While Not DMLinxWebService.CDS_Busca.Eof do
//          DMLinxWebService.CDS_Busca.Close;
//
//          // Termina sSqlUpInCampos ---------------------------------
//          sSqlUpInCampos:=
//           sSqlUpInCampos+')';
//
//          // Inicia sSqlUpInCampos ----------------------------------
//          sSqlUpInValores:=' VALUES (';
//
//          // Analisa Campos Node "C" ===========================================
//          Node_Campos := Note_Response.ChildNodes.Nodes['C'];
//          If Assigned(Node_Campos) Then
//          Begin
//            for ii := 0 to Node_Campos.ChildNodes.Count-1 do // Node "C"
//            Begin
//              iii:=ii;
//
//              // Considera Campo Empresa das TABELAS ===========================
//              If ((AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxFaturas'))   Or
//                  (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimento')) Or
//                  (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosDetalhes'))) And (ii>0) Then
//               iii:=iii+1;
//
//              If AnsiUpperCase(Trim(Node_Campos.ChildNodes[ii].NodeValue))<>AnsiUpperCase(tgCamposBD[iii]) Then
//              Begin
//                bSiga:=False;
//                SalvaProcessamento('=====================================');
//                SalvaProcessamento(sgMetodo+' Campos em Divergencia !!');
//              End; // If Trim(Node_Campos.ChildNodes[ii].NodeValue)<>tgCamposBD[ii] Then
//            End; // for ii := 0 to Node_Campos.ChildNodes.Count-1 do
//          End; // If Assigned(Node_Campos) Then
//
//          If bSiga Then // Se Campos Sem Divergencia ===========================
//          Begin
//            // Monta Transacao =================================================
//            TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
//            TD.IsolationLevel:=xilREADCOMMITTED;
//            DMLinxWebService.SQLC.StartTransaction(TD);
//            Try // Try da Transação ////////////////////////////////////////////
//              DateSeparator:='.';
//              DecimalSeparator:='.';
//
////odiropss INICIO//////////////////////////////////////////
//              // Le Valores dos Campos = Node "R" ===============================
//              For iii:=0 to Note_Response.ChildNodes.Count - 1 do // Node "C"
//              Begin
//                Node_Valores := Note_Response.ChildNodes[iii]; // Node "R"
//
//                // Se Node de Registro - Node "R"
//                If VarToStr(Node_Valores.NodeName)='R' Then // Node "R"
//                Begin
//                  // Inicia sSqlUpInCampos ----------------------------------
//                  sSqlUpInValores:=' VALUES (';
//
//                  If Assigned(Node_Valores) Then // Libera Node "R" Para Leitura
//                  Begin
//                    For ii:=0 to Node_Valores.ChildNodes.Count-1 do // Le Node "R"
//                    Begin
//                      sCampoDta:='';
//
//                      // Considera Campo Empresa das TABELAS -----
//                      If ((AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxFaturas'))   Or
//                          (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimento')) Or
//                          (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosDetalhes'))) And (ii=1) Then
//                      Begin
//                        sSqlUpInValores:=
//                         sSqlUpInValores+QuotedStr(sgCodLoja)+', ';
//                      End;
//
//                      // Monta sSqlUpInValores ---------------------
//                      if VarIsNull(Node_Valores.ChildNodes[ii].NodeValue) Then
//                       Begin
//                         sSqlUpInValores:=
//                          sSqlUpInValores+'NULL, ';
//                       End
//                      Else // if VarIsNull(Node_Valores.ChildNodes[ii].NodeValue) Then
//                       Begin
//                         // Guarda Valor Campo Data
//                         sCampoDta:='';
//                         If (Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),5,1)='-') And
//                            (Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),8,1)='-') Then
//                         Begin
//                           sCampoDta:=Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),9,2)+'.'+
//                                      Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),6,2)+'.'+
//                                      Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),1,4);
//
//                           Try
//                             StrToDate(sCampoDta);
//                           Except
//                             sCampoDta:='';
//                           End
//                         End; // If (Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),5,1)='-') And ....
//
//                         If Trim(sCampoDta)<>'' Then
//                          Begin
//                            sSqlUpInValores:=
//                             sSqlUpInValores+QuotedStr(sCampoDta)+', ';
//                          End
//                         Else
//                          Begin
//                            sSqlUpInValores:=
//                             sSqlUpInValores+QuotedStr(Trim(Node_Valores.ChildNodes[ii].NodeValue))+', ';
//                          End; // If Trim(sCampoDta)<>'' Then
//                       End; // if VarIsNull(Node_Valores.ChildNodes[ii].NodeValue) Then
//                    End; // For ii:=0 to Node_Valores.ChildNodes.Count-1 do // Le Node "R"
//
//                    // Executa o Ultimo ========================================
//                    // Termina de Montar sSqlUpInValores ---------
//                    sSqlUpInValores:=
//                     sSqlUpInValores+' current_date, current_time)';
//
//                    // Inclu MATCHING em sSqlUpInValores ---------
//                    If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxLojas') Then
//                     sSqlUpInValores:=
//                      sSqlUpInValores+' MATCHING (EMPRESA, cnpj_emp)';
//
//                    If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxVendedores') Then
//                     sSqlUpInValores:=
//                      sSqlUpInValores+' MATCHING (cod_vendedor)';
//
//                    If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxClientesFornec') Then
//                     sSqlUpInValores:=
//                      sSqlUpInValores+' MATCHING (cod_cliente)';
//
//                    If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutos') Then
//                     sSqlUpInValores:=
//                      sSqlUpInValores+' MATCHING (cod_produto)';
//
//                    If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosDetalhes') Then
//                     sSqlUpInValores:=
//                      sSqlUpInValores+' MATCHING (empresa, cnpj_emp, cod_produto)';
//
//                    // Executa Sql Update/Insert -----------------
//                    MySql:=sSqlUpInCampos+sSqlUpInValores;
//                    DMLinxWebService.SQLC.Execute(MySql, nil, nil);
//                  End; // If Assigned(Node_Valores) Then // Libera Node "R" Para Leitura
//                End; // If VarToStr(Node_Valores.NodeName)='R' Then // Node "R"
//              End; // For iii:=0 to Note_Response.ChildNodes.Count - 1 do // Node "C"
////odiropss FIM//////////////////////////////////////////
//
//              // Atualiza Transacao ============================================
//              DMLinxWebService.SQLC.Commit(TD);
//
//              DateSeparator:='/';
//              DecimalSeparator:=',';
//
//            Except // Except da Transação  /////////////////////////////////////
//              on e : Exception do
//              Begin
//                // Abandona Transacao ==========================================
//                DMLinxWebService.SQLC.Rollback(TD);
//
//                DateSeparator:='/';
//                DecimalSeparator:=',';
//
//                sMensagem:='Erro DML: '+e.message;
//                SalvaProcessamento(sgMetodo+': '+sMensagem);
//                SalvaProcessamento('=====================================');
//              End; // on e : Exception do
//            End; // Try da Transação  //////////////////////////////////////////
//          End; // If bSiga Then // Se Campos Sem Divergencia
//        End; // If Note_Response.NodeName = 'ResponseData' Then
//      End; // For i:=0 to DOC.ChildNodes.Nodes['Microvix'].ChildNodes.Count-1 do
//    End; // If bSiga Then
//  End; // For i:=0 to tgMetodos.Count-1 do
//
//  FreeAndNil(tgCamposBD);
end;

end.

{
//odiropss INICIO//////////////////////////////////////////
              // Le Valores dos Campos = Node "R" ===============================
              For iii:=0 to Note_Response.ChildNodes.Count - 1 do // Node "C"
              Begin
                Node_Valores := Note_Response.ChildNodes[iii]; // Node "R"

                // Se Node de Registro - Node "R"
                If VarToStr(Node_Valores.NodeName)='R' Then // Node "R"
                Begin
                  If Assigned(Node_Valores) Then // Libera Node "R" Para Leitura
                  Begin
                    iReg:=1;
                    For ii:=0 to Node_Valores.ChildNodes.Count-1 do // Le Node "R"
                    Begin
                      sCampoDta:='';
                      If iReg=iii Then // Monta Update/Insert
                       Begin
                         // Considera Campo Empresa das TABELAS -----
                         If ((AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxFaturas'))   Or
                             (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimento')) Or
                             (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosDetalhes'))) And (ii>0) Then
                         Begin
                           sSqlUpInValores:=
                            sSqlUpInValores+QuotedStr(sgCodLoja)+', ';
                         End;

                         // Monta sSqlUpInValores ---------------------
                         if VarIsNull(Node_Valores.ChildNodes[ii].NodeValue) Then
                          Begin
                            sSqlUpInValores:=
                             sSqlUpInValores+'NULL, ';
                          End
                         Else // if VarIsNull(Node_Valores.ChildNodes[ii].NodeValue) Then
                          Begin
                            // Guarda Valor Campo Data
                            sCampoDta:='';
                            If (Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),5,1)='-') And
                               (Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),8,1)='-') Then
                            Begin
                              sCampoDta:=Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),9,2)+'.'+
                                         Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),6,2)+'.'+
                                         Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),1,4);

                              Try
                                StrToDate(sCampoDta);
                              Except
                                sCampoDta:='';
                              End
                            End; // If (Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),5,1)='-') And ....

                            If Trim(sCampoDta)<>'' Then
                             Begin
                               sSqlUpInValores:=
                                sSqlUpInValores+QuotedStr(sCampoDta)+', ';
                             End
                            Else
                             Begin
                               sSqlUpInValores:=
                                sSqlUpInValores+QuotedStr(Trim(Node_Valores.ChildNodes[ii].NodeValue))+', ';
                             End; // If Trim(sCampoDta)<>'' Then
                          End; // if VarIsNull(Node_Valores.ChildNodes[ii].NodeValue) Then
                       End
                      Else // If iReg=iii Then // Monta Update/Insert
                       Begin
                         // Termina de Montar sSqlUpInValores ---------
                         sSqlUpInValores:=
                          sSqlUpInValores+' current_date, current_time)';

                         // Inclu MATCHING em sSqlUpInValores ---------
                         If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxLojas') Then
                          sSqlUpInValores:=
                           sSqlUpInValores+' MATCHING (EMPRESA, cnpj_emp)';

                         If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxVendedores') Then
                          sSqlUpInValores:=
                           sSqlUpInValores+' MATCHING (cod_vendedor)';

                         If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxClientesFornec') Then
                          sSqlUpInValores:=
                           sSqlUpInValores+' MATCHING (cod_cliente)';

                         If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutos') Then
                          sSqlUpInValores:=
                           sSqlUpInValores+' MATCHING (cod_produto)';

                         If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosDetalhes') Then
                          sSqlUpInValores:=
                           sSqlUpInValores+' MATCHING (empresa, cnpj_emp, cod_produto)';

                         // Executa Sql Update/Insert -----------------
                         MySql:=sSqlUpInCampos+sSqlUpInValores;
                         DMLinxWebService.SQLC.Execute(MySql, nil, nil);

                         // Monta Novo sSqlUpInValores ----------------
                         if VarIsNull(Node_Valores.ChildNodes[ii].NodeValue) Then
                          sSqlUpInValores:=
                           sSqlUpInValores+'NULL, '
                         Else
                         sSqlUpInValores:=
                          sSqlUpInValores+QuotedStr(Node_Valores.ChildNodes[ii].NodeValue);

                         Inc(iReg);
                       End; // If iReg=iii Then // Monta Update/Insert
                    End; // For ii:=0 to Node_Valores.ChildNodes.Count-1 do // Le Node "R"

                    // Executa o Ultimo ========================================
                    // Termina de Montar sSqlUpInValores ---------
                    sSqlUpInValores:=
                     sSqlUpInValores+' current_date, current_time)';

                    // Inclu MATCHING em sSqlUpInValores ---------
                    If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxLojas') Then
                     sSqlUpInValores:=
                      sSqlUpInValores+' MATCHING (EMPRESA, cnpj_emp)';

                    If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxVendedores') Then
                     sSqlUpInValores:=
                      sSqlUpInValores+' MATCHING (cod_vendedor)';

                    If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxClientesFornec') Then
                     sSqlUpInValores:=
                      sSqlUpInValores+' MATCHING (cod_cliente)';

                    If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutos') Then
                     sSqlUpInValores:=
                      sSqlUpInValores+' MATCHING (cod_produto)';

                    If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosDetalhes') Then
                     sSqlUpInValores:=
                      sSqlUpInValores+' MATCHING (empresa, cnpj_emp, cod_produto)';

                    // Executa Sql Update/Insert -----------------
                    MySql:=sSqlUpInCampos+sSqlUpInValores;
                    DMLinxWebService.SQLC.Execute(MySql, nil, nil);
                  End; // If Assigned(Node_Valores) Then // Libera Node "R" Para Leitura
                End; // If VarToStr(Node_Valores.NodeName)='R' Then // Node "R"
              End; // For iii:=0 to Note_Response.ChildNodes.Count - 1 do // Node "C"
//odiropss FIM//////////////////////////////////////////

}
