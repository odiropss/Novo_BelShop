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

    // Odir ====================================================================
    Procedure SalvaProcessamento(s:String);

    Procedure MontaMetodoXMLPost(sSetor: String=''; sLinha: String=''; sMarca: String=''; sColecao: String='');

    Function  EnviaMetodoXMLPost: Boolean;

    Procedure LeMetodoXMLRetorno;
    // Odir ====================================================================

    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmWebServiceLinx: TFrmWebServiceLinx;

  sgCodLoja,    // Código da Loja/Empresa em Processamento (Codigo da Loja no SIDICOM)
  sgCodLojaLinx, // Código da Loja/Empresa em Processamento (Codigo da Loja no Microvix)
  sgDtaInicioLinx,  // Data que a Loija Inicio com o Sistema Linx
  sgMensagem, sgDta,
  sgPastaExecutavel, sgPastaBelShop, sgPastaRetornos, sgPastaMetodos:
  String;

  tgArqProc: TStringList; // Arquivo de Acompanhamento de Processamento

  sgArqProc: String;      // Pasta e Nome do Arquivo de Acompanhamento de Processamento a Salvar
                          // C:\Projetos\BelShop\Fontes\WebService Linx\Retornos\@LinxWebService_'+sgDta+'.txt';
                          // Vem do Arquivo:  C:\Projetos\BelShop\Fontes\WebService Linx\Linx_WebService.Ini

  tgMetodos: TStringList; // Contem osd Metodos a Processar
                          // Vem do Arquivo:  C:\Projetos\BelShop\Fontes\WebService Linx\Linx_WebService.Ini

  sgParametroMetodo,  // Parametro: Metodo a Processar
  sgParametroCodLoja, // Paraemtro: Loja a Processar
  sgParametroMetodos, sgParametroRetornos, // Parametro: Pastas de Geração de Metodos e Retornos
  
  sgCampoUpdate,
  sgMetodo,    // Metodo em Processamento
  sgArqXMLRet, // Nome do Arquivo de Retorno
  sgCNPJProc,  // CNPJ da Empresa Em Processamento
  sgDtaInicio, sgDtaFim, // Datas Para Busca de Dados
  sgWebServiceSenha, sgWebServiceUsuario, sgWebServiceChave: // Parametros Linx WebService
  String;

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
  sObs, sMensagem, sCampoDta, sConteudoCampo: String;

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
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxVendedores')) Or
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
        sObs:='';

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
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxVendedores')) Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosDetalhes'))) And
                    (ii=1) Then // COLOCA COD_EMPRES NO MICROVIX
                Begin
                  sSqlUpInValores:=
                   sSqlUpInValores+QuotedStr(sgCodLojaLinx)+', ';
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
                      sConteudoCampo:=Trim(Node_Valores.ChildNodes[ii].NodeValue);

                      If (sgMetodo='LinxMovimento') and (Length(sConteudoCampo)>1000) Then
                        sConteudoCampo:=Copy(sConteudoCampo,1,1000);

                      sSqlUpInValores:=
                       sSqlUpInValores+QuotedStr(sConteudoCampo)+', ';
                    End; // If Trim(sCampoDta)<>'' Then
                 End; // if VarIsNull(Node_Valores.ChildNodes[ii].NodeValue) Then
              End; // For ii:=0 to Node_Valores.ChildNodes.Count-1 do // Le Node "R"

              // Termina de Montar sSqlUpInValores =============================

              // Considera Campo "Cod_Loja do SIDICOM" das TABELAS ------------
              If (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxFaturas'))   Or
                  (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxLojas')) Or
                  (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxVendedores')) Or
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
                sSqlUpInValores+' MATCHING (cod_vendedor, empresa)';

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
                                           'codigo_cliente, operacao, tipo_transacao, '+
                                           'cod_produto, identificador)';

              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxFaturas') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (empresa, cnpj_emp, codigo_fatura, data_emissao, '+
                                           'cod_cliente, documento, serie, identificador)';

              // Executa Sql Update/Insert -----------------
              MySql:=sSqlUpInCampos+sSqlUpInValores;
              MySql:=F_Troca(#$A#$A, ' ', MySql);
              MySql:=F_Troca(#$A, ' ', MySql);

              DMLinxWebService.SQLC.Execute(MySql, nil, nil);
            End; // If Assigned(Node_Valores) Then // Libera Node "R" Para Leitura
          End; // If VarToStr(Node_Valores.NodeName)='R' Then // Node "R"
        End; // For iii:=0 to Note_Response.ChildNodes.Count - 1 do // Node "C"

        //======================================================================
        // Acerta LinxProduto.COD_AUXILIAR para 6 Caracteres (SIDICOM) =========
        //======================================================================
        If sgMetodo='LinxProdutos' Then
        Begin
          // Verifica se Existe
          MySql:=' SELECT ptl.cod_auxiliar'+
                 ' FROM LINXPRODUTOS ptl'+
                 ' WHERE ptl.cod_auxiliar IS NOT NULL'+
                 ' AND CHAR_LENGTH(Trim(ptl.cod_auxiliar))<6';
          DMLinxWebService.CDS_Busca.Close;
          DMLinxWebService.SDS_Busca.CommandText:=MySql;
          DMLinxWebService.CDS_Busca.Open;

          If Trim(DMLinxWebService.CDS_Busca.FieldByName('Cod_auxiliar').AsString)<>'' Then
          Begin
            sObs:='ERRO em Acerta LinxProduto.COD_AUXILIAR';

            MySql:=' UPDATE LINXPRODUTOS ptl'+
                   ' SET ptl.cod_auxiliar=lpad(Trim(ptl.cod_auxiliar),6,''0'')'+
                   ' WHERE ptl.cod_auxiliar IS NOT NULL'+
                   ' AND CHAR_LENGTH(Trim(ptl.cod_auxiliar))<6';
            DMLinxWebService.SQLC.Execute(MySql, nil, nil);
          End; // If Trim(DMLinxWebService.CDS_Busca.FieldByName('Cod_auxiliar').AsString)<>'' Then
          DMLinxWebService.CDS_Busca.Close;
          sObs:='';
        End; // If sgMetodo='LinxProdutos' Then

        //======================================================================
        // Atualiza Tabela LinxProdutoDetalhes com Produto Sem Saldo ===========
        //======================================================================
        If sgMetodo='LinxProdutosDetalhes' Then
        Begin
          sOBS:='ERRO em Atualiza Tabela LinxProdutoDetalhes com Produto Sem Saldo';

          MySql:=' INSERT INTO LINXPRODUTOSDETALHES'+
                 ' SELECT'+
                 ' lp.portal,'+
                 sgCodLojaLinx+' EMPRESA,'+ // CODIGO EMPRESA MICROVIX
                 sgCNPJProc+' CNPJ_EMP,'+ // CNPJ DA EMPRESA
                 ' LP.cod_produto COD_PRODUTO, LP.cod_barra COD_BARRA,'+
                 ' 0.0000 QUANTIDADE, 0.0000 PRECO_CUSTO, 0.0000 PRECO_VENDA, 0.0000 CUSTO_MEDIO,'+
                 ' NULL ID_CONFIG_TRIBUTARIA, NULL DESC_CONFIG_TRIBUTARIA,'+
                 QuotedStr(sgCodLoja)+' COD_LOJA,'+ // CODIGO EMPRESA SIDICOM
                 ' current_date DTA_ATUALIZACAO, current_time HRA_ATUALIZACAO'+

                 ' FROM LINXPRODUTOS lp'+
                 ' WHERE NOT EXISTS (SELECT 1'+
                 '                   FROM LINXPRODUTOSDETALHES lpd'+
                 '                   WHERE lpd.cod_produto=lp.cod_produto'+
                 '                   AND   lpd.empresa='+sgCodLojaLinx+')'; // CODIGO EMPRESA MICROVIX
          DMLinxWebService.SQLC.Execute(MySql, nil, nil);
          sOBS:='';
        End; // If sgMetodo='LinxProdutosDetalhes' Then

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

          If Trim(sMensagem)<>'' Then
           SalvaProcessamento(sgMetodo+'_'+sgCodLojaLinx+'(Último Erro): '+sMensagem);

          sMensagem:='Erro DML: '+e.message;
          SalvaProcessamento(sgMetodo+'_'+sgCodLojaLinx+': '+sMensagem);

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
  // ===========================================================================
  // Gera Arquivo ==============================================================
  // ===========================================================================
  sArq:=sgPastaMetodos+sgMetodo+'.XML';

  // ===========================================================================
  // Exclui Arquivos Existentes ================================================
  // ===========================================================================
  DeleteFile(sArq);
  DeleteFile(sgPastaRetornos+sgArqXMLRet);

  // ===========================================================================
  // Monta Metodos =============================================================
  // ===========================================================================
  AssignFile(txtArq,sArq);
  Rewrite(txtArq);

  // ===========================================================================
  // Grava Linha Padrões =======================================================
  // ===========================================================================
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

  If sgMetodo<>'LinxMetodos' Then // Metodo Sem Parametro
  Begin
    sXML:='		<Parameters>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="chave">'+sgWebServiceChave+'</Parameter>'; // d52511f4-3541-4a65-9adc-665513ea3207
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="cnpjEmp">'+sgCNPJProc+'</Parameter>'; // 03772229001880
    Writeln(txtArq,sXML);
  End; // If sgMetodo<>'LinxMetodos' Then // Metodo Sem Parametro

  // ===========================================================================
  // LinxLojas (Somente Parametros Padrões) ====================================
  // ===========================================================================

  // ===========================================================================
  // LinxVendedores ============================================================
  // ===========================================================================
  If sgMetodo='LinxVendedores' Then
  Begin
    sXML:='			<Parameter id="data_upd_inicial">'+sgDtaInicio+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="data_upd_fim">'+sgDtaFim+'</Parameter>';
    Writeln(txtArq,sXML);

    // Parametro Opcional
    // sXML:='			<Parameter id="cod_vendedor">'+Codigo do Vendedor - INTEIRO+'</Parameter>';
    // Writeln(txtArq,sXML);
  End; // If sgMetodo='LinxVendedores' Then

  // ===========================================================================
  // LinxClientesFornec / LinxMovimento ========================================
  // ===========================================================================
  If (sgMetodo='LinxClientesFornec') Or (sgMetodo='LinxMovimento') Then
  Begin
    sXML:='			<Parameter id="data_inicial">'+sgDtaInicio+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="data_fim">'+sgDtaFim+'</Parameter>';
    Writeln(txtArq,sXML);
  End; // If (sgMetodo='LinxClientesFornec') Or (sgMetodo='LinxMovimento') Then

  // ===========================================================================
  // LinxProdutos ==============================================================
  // ===========================================================================
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
  End; // If sgMetodo='LinxProdutos' Then

  // ===========================================================================
  // LinxProdutosDetalhes ======================================================
  // ===========================================================================
  If sgMetodo='LinxProdutosDetalhes' Then
  Begin
    sXML:='			<Parameter id="data_mov_ini">'+sgDtaInicio+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="data_mov_fim">'+sgDtaFim+'</Parameter>';
    Writeln(txtArq,sXML);
  End; // If sgMetodo='LinxProdutosDetalhes' Then

  // ===========================================================================
  // LinxFaturas ===============================================================
  // ===========================================================================
  If (sgMetodo='LinxFaturas') Then
  Begin
    sXML:='			<Parameter id="data_inicial">'+sgDtaInicio+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="data_fim">'+sgDtaFim+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="data_inicial_pag">'+'NULL'+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="data_fim_pag">'+'NULL'+'</Parameter>';
    Writeln(txtArq,sXML);
  End; // If (sgMetodo='LinxFaturas') Then

  // ===========================================================================
  // Grava Linhas de Encerramento XML ==========================================
  // ===========================================================================
  If sgMetodo<>'LinxMetodos' Then // Metodo Sem Parametro
  Begin
    sXML:='		</Parameters>';
    Writeln(txtArq,sXML);
  End; // If sgMetodo<>'LinxMetodos' Then // Metodo Sem Parametro

  sXML:='	</Command>';
  Writeln(txtArq,sXML);

  sXML:='</LinxMicrovix>';
  Writeln(txtArq,sXML);

  CloseFile(txtArq);

End; // Monta Metodos Post >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//==============================================================================
// Odir - Inicio ===============================================================
//==============================================================================
procedure TFrmWebServiceLinx.FormCreate(Sender: TObject);
Var
  Arq: TextFile;
  sLinha: String;
  i, iFor: Integer;

  Flags : Cardinal; // Verifica Internet Ativo - Encerra Necessario

  MySql: String;

  bUmaVez,
  bSiga: Boolean;

  dDtaUltAtual, dDtaHoje: TDate;
  wDia, wMes, wAno: Word;

  hHrInicio: String; // Não permite rodar com Parametro entre as 16 e 18 Horas - Existe um processo rodando
Begin
  // Parametro: Somente o Metodo Enviado =======================================
  sgParametroMetodo   :=''; // Metodo a Processar
  sgParametroCodLoja  :=''; // Loja a Processar
  sgParametroMetodos  :=''; // Pasta Metodo  - \\192.168.0.252\Projetos\BelShop\WebService Linx\Metodos\
  sgParametroRetornos :=''; // Pasta Retorno - \\192.168.0.252\Projetos\BelShop\WebService Linx\Retornos\

  // Le Parametros Enviado =====================================================
  sgParametroMetodo:=ParamStr(1);

  // OdirAqui - Utiliza Parametro ==============================================
  // Estrutura (Paramentros Separedos por Espaço ' ';
  // NomeMetodo Codigo_Loja_Linx Pasta_Metodos Pasta_Retornos
  // >>>>>>>>>>>>>> EXEMPLO PELO PARAMETRO <<<<<<<<<<<
  // \\192.168.0.252\Projetos\BelShop\WebService Linx\PWebServiceLinx.exe LinxMovimento 15 "\\192.168.0.252\Projetos\BelShop\WebService Linx\Metodos\" "\\192.168.0.252\Projetos\BelShop\WebService Linx\Retornos\"
  // >>>>>>>>>>>>>> EXEMPLO PELO ODIR (Separados por (;) <<<<<<<<<<<
  // sgParametroMetodo:='\\192.168.0.252\Projetos\BelShop\WebService Linx\PWebServiceLinx.exe LinxMovimento;15;\\192.168.0.252\Projetos\BelShop\WebService Linx\Metodos\;\\192.168.0.252\Projetos\BelShop\WebService Linx\Retornos\;';

  // Pasta Executável PWebServiceLinx Não Rede
  // OdirAqui
  sgPastaExecutavel:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));

  // Parametros na Rede
  If Trim(sgParametroMetodo)<>'' Then
  Begin
    // Executa pelo Parametro ==================================================
    If Trim(ParamStr(1))<>'' Then
    Begin
      sgParametroMetodo  :=Trim(ParamStr(1));
      sgParametroCodLoja :=Trim(ParamStr(2));
      sgParametroMetodos :=Trim(ParamStr(3));
      sgParametroRetornos:=Trim(ParamStr(4));
    End;

    // Executa pelo Odir =======================================================
    If Trim(ParamStr(1))='' Then
    Begin
      sgParametroCodLoja :=Separa_String(Trim(sgParametroMetodo),2);
      sgParametroMetodos :=Separa_String(Trim(sgParametroMetodo),3);
      sgParametroRetornos:=Separa_String(Trim(sgParametroMetodo),4);
      sgParametroMetodo  :=Separa_String(Trim(sgParametroMetodo),1); // Ultimo Devido a substituição do
                                                                     // Conteudo da Variavel sgParametroMetodo
    End;

    sgPastaExecutavel:=Copy(sgParametroMetodos,1,Pos('Metodos\', sgParametroMetodos)-1);
  End;

  //odirAqui
//  ShowMessage('Metodo: '+sgParametroMetodo);
//  ShowMessage('demonstracao '+sgParametroMetodo);
//  ShowMessage('Loja: '+sgParametroCodLoja);
//  ShowMessage('Pasta Metodos: '+sgParametroMetodos);
//  ShowMessage('Pasta Retornos: '+sgParametroRetornos);
//  ShowMessage('Pasta Exec: '+sgPastaExecutavel);

  // Cria Arquivo de Metodos a Processar =======================================
  tgMetodos:=TStringList.Create;

  // Ler Arquivo Ini de Pastas =================================================
  AssignFile(Arq,sgPastaExecutavel+'Linx_WebService.Ini');

  Reset(Arq);
  i:=0;
  While not Eof(Arq) do
  Begin
    Readln(Arq,sLinha);

    If i=0 Then
     Begin
       sgPastaMetodos:=IncludeTrailingPathDelimiter(Trim(sLinha));
     End
    Else If i=1 Then
     Begin
       sgPastaRetornos:=IncludeTrailingPathDelimiter(Trim(sLinha));
     End
    Else
     Begin
       tgMetodos.Add(Trim(sLinha));
     End;

    Inc(i);
  End; // While not Eof(Arq) do
  CloseFile(Arq);

  //============================================================================
  // Se Processamento por PARAMETRO Atualiza Pastas ============================
  //============================================================================
  If sgParametroMetodo<>'' Then
  Begin
    sgPastaMetodos :=IncludeTrailingPathDelimiter(sgParametroMetodos);
    sgPastaRetornos:=IncludeTrailingPathDelimiter(sgParametroRetornos);
  End; // If sgParametroMetodo<>'' Then

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

  // Conecta o Banco de Dados ==================================================
  If Not DMLinxWebService.ConectaBanco Then
  Begin
    If Trim(sgArqProc)='' Then
     sgArqProc:=sgPastaRetornos+'@LinxWebService_NAO_CONECTOU.txt';

    SalvaProcessamento('Erro de Conexão!! '+sgMensagem);
    Application.Terminate;
    Exit;
  End;

  // Se Progrma Já em Execução Encerra =========================================
  If Trim(sgParametroMetodo)<>'' Then
  Begin
    hHrInicio:=TimeToStr(DataHoraServidorFI(DMLinxWebService.SDS_DtaHoraServidor));
    If (StrToTime(hHrInicio)>StrToTime('16:00:00')) and (StrToTime(hHrInicio)<StrToTime('18:00:00')) Then
    Begin
      Application.Terminate;
      Exit;
    End;
  End; // If Trim(sgParametroMetodo)<>'' Then

  // Data Inicio da Atualização ================================================
  sgDta:=DateToStr(DataHoraServidorFI(DMLinxWebService.SDS_DtaHoraServidor));
  sgDta:=f_Troca('/','',f_Troca('.','',f_Troca('-','',sgDta)));

  // Salva Pasta e Nome do Arquivo de Acompanhamento de Processamento ==========
  sgArqProc:=sgPastaRetornos+'@LinxWebService_'+sgDta+'.txt';

  DeleteFile(sgArqProc);

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

  // ===========================================================================
  // Busca Definição de Todos os Metodos =======================================
  // ===========================================================================
  sgMetodo:='LinxMetodos';
  sgArqXMLRet:='Retorno_'+sgMetodo+'.XML';
  MontaMetodoXMLPost();
  EnviaMetodoXMLPost;
  // ===========================================================================

  // Processa Lojas ============================================================
  MySql:=' SELECT em.num_cnpj, em.cod_filial, em.cod_linx, em.dta_inicio_linx'+
         ' FROM EMP_CONEXOES em';

         If sgParametroCodLoja<>'' tHEN
          MySql:=
           MySql+' WHERE em.cod_linx='+sgParametroCodLoja
         Else
          MySql:=
           MySql+' WHERE em.cod_linx<>0'+
                 ' ORDER BY 3';
  DMLinxWebService.CDS_Lojas.Close;
  DMLinxWebService.SDS_Lojas.CommandText:=MySql;
  DMLinxWebService.CDS_Lojas.Open;

  bUmaVez:=False;
  While Not DMLinxWebService.CDS_Lojas.Eof do
  Begin
    // Apropria Variaveis=======================================================
    sgCNPJProc      :=Trim(DMLinxWebService.CDS_LojasNUM_CNPJ.AsString);
    sgCodLoja       :=Trim(DMLinxWebService.CDS_LojasCOD_FILIAL.AsString);
    sgCodLojaLinx   :=Trim(DMLinxWebService.CDS_LojasCOD_LINX.AsString);
    sgDtaInicioLinx :=Trim(DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsString);

    //==========================================================================
    // Loop nos Metodos - INICIO ===============================================
    //==========================================================================
    For iFor:=0 to tgMetodos.Count-1 do
    Begin
      If Trim(tgMetodos[iFor])='' Then
       Break;

      sgMetodo  :=tgMetodos[iFor];

      // Somente o Metodo Conforme Parametro Enviado ===========================
      If Trim(sgParametroMetodo)<>'' Then
       sgMetodo:=sgParametroMetodo;

      sgArqXMLRet:='Retorno_'+sgMetodo+'.XML';

      // Data Hoje =============================================================
      dDtaHoje:=DataHoraServidorFI(DMLinxWebService.SDS_DtaHoraServidor);

      //========================================================================
      // TODOS OS METODOS - Data Ultima Atualização Linx =======================
      //========================================================================
      // Campo: dt_upd ----------------------------------------------
      If (AnsiUpperCase(sgMetodo)='LINXVENDEDORES')  Then
       sgCampoUpdate:='Dt_Upd'
      Else If (AnsiUpperCase(sgMetodo)='LINXCLIENTESFORNEC') or (AnsiUpperCase(sgMetodo)='LINXPRODUTOS') Then
       sgCampoUpdate:='Dt_Update'
      Else If (AnsiUpperCase(sgMetodo)='LINXPRODUTOSDETALHES') or (AnsiUpperCase(sgMetodo)='LINXLOJAS') Then
       sgCampoUpdate:='Dta_Atualizacao'
      Else If (AnsiUpperCase(sgMetodo)='LINXMOVIMENTO') Then
       sgCampoUpdate:='Data_Documento'
      Else If (AnsiUpperCase(sgMetodo)='LINXFATURAS') Then
       sgCampoUpdate:='Data_Emissao'
      ELSE
       sgCampoUpdate:='Dta_Atualizacao';

      MySql:=' SELECT CAST(MAX(Lx.'+sgCampoUpdate+') AS DATE) Dta_Ult_Alteracao'+
             ' FROM '+sgMetodo+' lx';

             If (AnsiUpperCase(sgMetodo)='LINXFATURAS')   or
                (AnsiUpperCase(sgMetodo)='LINXLOJAS')     or
                (AnsiUpperCase(sgMetodo)='LINXMOVIMENTO') or
                (AnsiUpperCase(sgMetodo)='LINXVENDEDORES') or
                (AnsiUpperCase(sgMetodo)='LINXPRODUTOSDETALHES') Then
              MySql:=
               MySql+' WHERE lx.Empresa='+sgCodLojaLinx;
      DMLinxWebService.CDS_Busca.Close;
      DMLinxWebService.SDS_Busca.CommandText:=MySql;
      DMLinxWebService.CDS_Busca.Open;
      dDtaUltAtual:=DMLinxWebService.CDS_Busca.FieldByName('Dta_Ult_Alteracao').AsDateTime;
      DMLinxWebService.CDS_Busca.Close;

      // Montagem do Http.Post =================================================
      //=============================================================
      // LinxLojas ==================================================
      //=============================================================
      If sgMetodo='LinxLojas' Then
      Begin
        MontaMetodoXMLPost();
      End; // If sgMetodo='LinxLojas' Then

      //=============================================================
      // LinxVendedores =============================================
      //=============================================================
      If sgMetodo='LinxVendedores' Then
      Begin
        If dDtaUltAtual=0 Then
         Begin
           sgDtaInicio:='NULL';
           sgDtaFim:='NULL';
         End
        Else
         Begin
           DecodeDate(dDtaUltAtual-4, wAno, wMes, wDia);
           sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

           DecodeDate(dDtaHoje, wAno, wMes, wDia);
           sgDtaFim:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

           // Metodo por Parametro (Acerta Data Inicial
           If Trim(sgParametroMetodo)<>'' Then
           Begin
             If dDtaUltAtual=dDtaHoje Then
             Begin
               sgDtaInicio:=sgDtaFim
             End;

             If dDtaUltAtual<dDtaHoje Then
             Begin
               DecodeDate(dDtaUltAtual, wAno, wMes, wDia);
               sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);
             End;
           End; // If Trim(sgParametroMetodo)<>'' Then
         End; // If dDtaUltAtual=0 Then

        MontaMetodoXMLPost();
      End; // If (sgMetodo='LinxVendedores') And (Not bUmaVez) Then

      //=============================================================
      // LinxClientesFornec =========================================
      //=============================================================
      If sgMetodo='LinxClientesFornec' Then
      Begin
        If dDtaUltAtual=0 Then
         dDtaUltAtual:=DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime+4;;

        DecodeDate(dDtaUltAtual-4, wAno, wMes, wDia);
        sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        DecodeDate(dDtaHoje, wAno, wMes, wDia);
        sgDtaFim:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        // Metodo por Parametro (Acerta Data Inicial
        If Trim(sgParametroMetodo)<>'' Then
        Begin
          If dDtaUltAtual=dDtaHoje Then
          Begin
            sgDtaInicio:=sgDtaFim
          End;

          If dDtaUltAtual<dDtaHoje Then
          Begin
            DecodeDate(dDtaUltAtual, wAno, wMes, wDia);
            sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);
          End;
        End; // If Trim(sgParametroMetodo)<>'' Then

        MontaMetodoXMLPost();
      End; // If (sgMetodo='LinxClientesFornec') And (Not bUmaVez) Then Then

      //=============================================================
      // LinxProdutos ===============================================
      //=============================================================
      If sgMetodo='LinxProdutos' Then
      Begin
        If dDtaUltAtual=0 Then
         Begin
           sgDtaInicio:='NULL';
           sgDtaFim:='NULL';
         End
        Else
         Begin
           DecodeDate(dDtaUltAtual-4, wAno, wMes, wDia);
           sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

           DecodeDate(dDtaHoje+1, wAno, wMes, wDia);
           sgDtaFim:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

           // Metodo por Parametro (Acerta Data Inicial
           If Trim(sgParametroMetodo)<>'' Then
           Begin
             If dDtaUltAtual=dDtaHoje Then
             Begin
               DecodeDate(dDtaHoje, wAno, wMes, wDia);
               sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);
             End;

             If dDtaUltAtual<dDtaHoje Then
             Begin
               DecodeDate(dDtaUltAtual, wAno, wMes, wDia);
               sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);
             End;
           End; // If Trim(sgParametroMetodo)<>'' Then
         End; // If dDtaUltAtual=0 Then

        MontaMetodoXMLPost('NULL', 'NULL', 'NULL', 'NULL');
      End; // If (sgMetodo='LinxProdutos') And (Not bUmaVez) Then

      //=============================================================
      // LinxProdutosDetalhes =======================================
      //=============================================================
      If sgMetodo='LinxProdutosDetalhes' Then
      Begin
        If dDtaUltAtual=0 Then
         Begin
           sgDtaInicio:='NULL';
           sgDtaFim:='NULL';
         End
        Else
         Begin
           DecodeDate(dDtaUltAtual-4, wAno, wMes, wDia);
           sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

           DecodeDate(dDtaHoje+1, wAno, wMes, wDia);
           sgDtaFim:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

           // Metodo por Parametro (Acerta Data Inicial
           If Trim(sgParametroMetodo)<>'' Then
           Begin
             If dDtaUltAtual=dDtaHoje Then
             Begin
               DecodeDate(dDtaHoje, wAno, wMes, wDia);
               sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);
             End;

             If dDtaUltAtual<dDtaHoje Then
             Begin
               DecodeDate(dDtaUltAtual, wAno, wMes, wDia);
               sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);
             End;
           End; // If Trim(sgParametroMetodo)<>'' Then
         End; // If dDtaUltAtual=0 Then

        MontaMetodoXMLPost();
      End; // If sgMetodo='LinxProdutosDetalhes' Then

      //=============================================================
      // LinxMovimento ==============================================
      //=============================================================
      If sgMetodo='LinxMovimento' Then
      Begin
        If dDtaUltAtual=0 Then
         dDtaUltAtual:=DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime+15;

        DecodeDate(dDtaUltAtual-15, wAno, wMes, wDia);
        sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        DecodeDate(dDtaHoje, wAno, wMes, wDia);
        sgDtaFim:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        // Metodo por Parametro (Acerta Data Inicial
        If Trim(sgParametroMetodo)<>'' Then
        Begin
          If dDtaUltAtual=dDtaHoje Then
          Begin
            sgDtaInicio:=sgDtaFim;
          End;

          If dDtaUltAtual<dDtaHoje Then
          Begin
            DecodeDate(dDtaUltAtual, wAno, wMes, wDia);
            sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);
          End;
        End; // If Trim(sgParametroMetodo)<>'' Then

        MontaMetodoXMLPost();
      End; // If sgMetodo='LinxMovimento' Then

      //=============================================================
      // LinxFaturas ================================================
      //=============================================================
      If sgMetodo='LinxFaturas' Then
      Begin
        // OBS: Só poderá ser fornecido um período de listagem (Emissão ou Pagamento),
        //      o outro deverá ficar como NULL. Mas deverá pelo menos ter um Período informado.</D>

        If dDtaUltAtual=0 Then
         dDtaUltAtual:=DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime+15;

        DecodeDate(dDtaUltAtual-15, wAno, wMes, wDia);
        sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        DecodeDate(dDtaHoje, wAno, wMes, wDia);
        sgDtaFim:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        // Metodo por Parametro (Acerta Data Inicial
        If Trim(sgParametroMetodo)<>'' Then
        Begin
          If dDtaUltAtual=dDtaHoje Then
          Begin
            sgDtaInicio:=sgDtaFim;
          End;

          If dDtaUltAtual<dDtaHoje Then
          Begin
            DecodeDate(dDtaUltAtual, wAno, wMes, wDia);
            sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);
          End;
        End; // If Trim(sgParametroMetodo)<>'' Then

        MontaMetodoXMLPost();
      End; // If sgMetodo='LinxFaturas' Then

      // Envio do Http.post ====================================================
      bSiga:=True;
      If Not EnviaMetodoXMLPost Then
      Begin
        bSiga:=False;
      End; // If Not EnviaMetodoXMLPost Then

      // Ler XML de Retorno e Salva no Banco de Dados ==========================
      If bSiga Then
      Begin
        LeMetodoXMLRetorno;
      End; // If bSiga Then

      // Qunado Somente Um Metodo Conforme Parametro Envia ======================
      If Trim(sgParametroMetodo)<>'' Then
       Break;
    End; // For iFor:=0 to tgMetodos.Count-1 do
    //==========================================================================
    // Loop nos Metodos - FIM ==================================================
    //==========================================================================

    bUmaVez:=True;

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

end.

