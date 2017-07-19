unit UWebServiceLinx;
{
-> M�todos: LinxMetodos
   - 1 Vez
   ====================
   Retorna as informa��es atualizadas dos nomes e par�metros dos m�todos do
   WebService Linx Microvix padr�o.

-> Grupo Lojas: LinxGrupoLojas
   - 1 Vez
   ===========================
   Ir� retornar todos os CNPJs do Grupo ou Rede.

-> Lojas: LinxLojas
   - Por Loja
   ================
   Ir� conter as informa��es de cada loja do Portal com o sistema Microvix.

-> Clientes/Fornecedores: LinxClientesFornec
   - 1 Vez
   =========================================
   Ir� conter as informa��es dos clientes/fornecedores cadastrados nas lojas.

-> Movimento: LinxMovimento
   - Por Loja
   ========================
   Ir� conter as informa��es referente as notas fiscais e tickets devenda.

-> Movimento Trocas: LinxMovimentoTrocas
   - Por Loja
   =====================================
   Ir� conter as informa��es de valores das trocas utilizadas nas vendas

-> Movimento Origem Devolu��es: LinxMovimentoOrigemDevolucoes
   - Por Loja
   ==========================================================
   Ir� conter as informa��es de documentos de origem das devolu��es relacionadas.

-> Movimento Seriais: LinxMovimentoSerial
   - Por Loja
   ======================================
   Ir� conter as informa��es dos seriais movimentados

-> Movimento Planos: LinxMovimentoPlanos
   - Por Loja
   ======================================
   Ir� conter as informa��es dos planos de pagamentos utilizados nas movimenta��es

-> Movimento A��es Promocionais: LinxMovimentoAcoesPromocionais
   - Por Loja
   ============================================================
   Ir� conter as informa��es das A��es Promocionais utilizadas nas vendas

-> A��es Promocionais: LinxAcoesPromocionais
   - Por Loja
   =========================================
   Ir� retornar o cadastro das A��es Promocionais

-> Vendedores: LinxVendedores
   - Por Loja
   ==========================
  - Ira conter as informa��es dos Vendedores cadastrados na loja

-> Produtos Detalhes: LinxProdutosDetalhes
   - Por Loja
   =======================================
   Ir� conter as informa��es de produtos por empresa, comosaldo, pre�os,
   custos e configura��o tribut�ria

-> Produtos: LinxProdutos
   - 1 Vez
   ======================
   Ira conter com informa��es de produtos

-> Produtos Cod Bar: LinxProdutosCodBar
   - 1 Vez
   ====================================
   Ir� listar as informa��es de c�digos de barras de produtos.

-> Faturas: LinxFaturas
   - Por Loja
   ====================
   Ir� conter as informa��es de faturas a receber e a pagar;

-> Lan�amentos cont�beis: LinxLancContabil
   - Por Loja
   =======================================
   Ir� conter as informa��es dos lan�amentos cont�beis por contas e empresas.

-> Pedidos de venda: LinxPedidosVenda
   - Por Loja
   ==================================
   Ir� conter as informa��es dos pedidos de venda

-> Pedidos de Compra: LinxPedidosCompra
   - Por Loja
   =====================================
   Ir� conter as informa��es dos pedidos de compra

-> Produtos Detalhes: LinxReducoesZ
   - Por Loja
   =======================================
   Retorna as Redu��esZ de acordo com a loja pesquisada, somente para clientes
   que ainda utilizam a impressora fiscal

}
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

  sgCodLoja,    // C�digo da Loja/Empresa em Processamento (Codigo da Loja no SIDICOM)
  sgCodLojaLinx, // C�digo da Loja/Empresa em Processamento (Codigo da Loja no Microvix)
  sgDtaInicioLinx,  // Data que a Loija Inicio com o Sistema Linx
  sgCodProduto,  // Codigo do Produto para Busca Individual
  sgMensagem,
  sgDta, sgCnpjPortal,
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
  sgParametroMetodos, sgParametroRetornos, // Parametro: Pastas de Gera��o de Metodos e Retornos

  sgCampoUpdate,
  sgMetodo,    // Metodo em Processamento
  sgArqXMLRet, // Nome do Arquivo de Retorno
  sgCNPJProc,  // CNPJ da Empresa Em Processamento
  sgDtaInicio, sgDtaFim, // Datas Para Busca de Dados

  sgWebServiceSenha, sgWebServiceUsuario,
  sgWebServiceChave, sgWebServiceGrupo: // Parametros Linx WebService
  String;

  // Utilizado no M�todo: LinxAcoesPromocionais
  sgAtiva: String;
  // Busca Varia��es
  // sgAtiva=1
  // sgAtiva=0

  bgMontouPost: Boolean;

  // Comandos Sql de UpDate/Insert
  sSqlUpInCampos,  // Se sSqlUpInCampos='': Monta do Inicio SeN�o: N�o Faz Nada j� Esta Montado
  sSqlUpInValores: // Se sSqlUpInValores='': Monta do Inicio com Values SeN�o: Termina de Montar e Executa
  String;

  TD: TTransactionDesc; // Ponteiro de Transac�o

implementation

uses
  IdMultipartFormData, DK_Procs1, uj_001, uj_002, UDMLinxWebService,
  StrUtils, DB, RTLConsts;

{$R *.dfm}

//==============================================================================
// Odir - Inicio ===============================================================
//==============================================================================

// Le Retorno e Salva no Banco de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmWebServiceLinx.LeMetodoXMLRetorno;
Var
  MySql: String;
  sObs, sMensagem, sCampoDta, sConteudoCampo, sDtaAtual: String;

  iii, ii, i: Integer;

  DOC:IXMLDocument;

  Note_Response, Node_Campos, Node_Valores: IXMLNode;

  tgCamposBD: TStringList;
Begin

  sDtaAtual:=DateToStr(DataHoraServidorFI(DMLinxWebService.SDS_DtaHoraServidor));
  sDtaAtual:=f_Troca('/','',f_Troca('.','',f_Troca('-','',sDtaAtual)));

  // Verifica se Transa��o esta Ativa
  If DMLinxWebService.SQLC.InTransaction Then
   DMLinxWebService.SQLC.Rollback(TD);

  tgCamposBD:=TStringList.Create;

  // Inicializa Retorno do Metodo ==============================================
  DOC:=LoadXMLDocument(sgPastaRetornos+sgArqXMLRet);

  // Verifica se Erro Com Erro =================================================
  If DOC.ChildNodes.Nodes['Microvix'].ChildNodes['ResponseResult'].ChildNodes['ResponseSuccess'].Text='False' Then
  Begin
    SalvaProcessamento('=====================================');
    SalvaProcessamento('Loja Linx: '+sgCodLojaLinx+' Metodo: '+sgMetodo+' Resposta Negativa !!');

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
      // Busca Campos da Tabela para Compara��es ===============================
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

//odirAqui 3 - Campo "Empresa Colocado Pelo Odir" COM Campo "Portal"
          // Considera Campo "Empresa (ODIR)" COM Campo "Portal" das TABELAS ==========
          If ((AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxFaturas'))                    Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimento'))                  Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoTrocas'))            Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxVendedores'))                 Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoPlanos'))            Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoSerial'))            Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoOrigemDevolucoes'))  Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoAcoesPromocionais')) Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxAcoesPromocionais'))          Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxLancContabil'))               Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxPedidosVenda'))               Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxPedidosCompra'))              Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosDetalhes')))         And
              (ii>0) Then
           iii:=iii+1;

          // OdirAqui (N�o Apagar)
          // Verifica Conte�do de Retorno do Campos
          // sConteudoCampo:=Trim(Node_Campos.ChildNodes[ii].NodeValue);

//odirAqui 4 - Campo "Empresa" SEM Campo "Portal"
          // Considera Campo "Empresa" SEM Campo "Portal" das TABELAS ==========
          If ((AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxGrupoLojas'))) Then
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
      Try // Try da Transa��o //////////////////////////////////////////////////
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

//odiraqui 5 - Campo "Empresa Colocado Pelo Odir"
                // Considera Campo "Empresa" das TABELAS ------------
                If ((AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxFaturas'))                    Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimento'))                  Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoTrocas'))            Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxVendedores'))                 Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxGrupoLojas'))                 Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoSerial'))            Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoPlanos'))            Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoOrigemDevolucoes'))  Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoAcoesPromocionais')) Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxAcoesPromocionais'))          Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxLancContabil'))               Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxPedidosVenda'))               Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxPedidosCompra'))              Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosDetalhes')))         And
                    (ii=1) Then // COLOCA COD_EMPRESA NO MICROVIX
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

//odiraqui 6 - Campo "Cod_Loja do SIDICOM"
              // Considera Campo "Cod_Loja do SIDICOM" das TABELAS ------------
              If (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxFaturas'))                    Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxGrupoLojas'))                 Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxLojas'))                      Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoTrocas'))            Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoOrigemDevolucoes'))  Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoSerial'))            Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoPlanos'))            Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxVendedores'))                 Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimento'))                  Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoAcoesPromocionais')) Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxAcoesPromocionais'))          Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxLancContabil'))               Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxPedidosVenda'))               Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxPedidosCompra'))              Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxReducoesZ'))                  Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosDetalhes'))           Then
               Begin
                 sSqlUpInValores:=
                  sSqlUpInValores+' '+QuotedStr(sgCodLoja)+', '+QuotedStr(sDtaAtual)+', current_time)';
                  // OdirApagar
                  //sSqlUpInValores+' '+QuotedStr(sgCodLoja)+', current_date, current_time)';
               End
              Else
               Begin
                 sSqlUpInValores:=
                  sSqlUpInValores+' '+QuotedStr(sDtaAtual)+', current_time)';
               End;

//OdirAqui 7 - Inclui MATCHING
              //================================================================
              // Inclui MATCHING em sSqlUpInValores ----------------------------
              //================================================================
              // LinxGrupoLojas -------------------------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxGrupoLojas') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (empresa, cnpj)';

              // LinxPedidosCompra ----------------------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxPedidosCompra') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (empresa, cnpj_emp, cod_pedido, data_pedido, transacao)';

              // LinxPedidosVenda -----------------------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxPedidosVenda') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (empresa, cnpj_emp, cod_pedido, data_lancamento, transacao)';

              // LinxLancContabil -----------------------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxLancContabil') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (empresa, identificador)';
//                sSqlUpInValores+' MATCHING (empresa, cnpj_emp, cod_lanc, centro_custo, ind_conta, cod_conta, identificador)';

              // LinxProdutosCodBar ---------------------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosCodBar') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (cod_produto, cod_barra)';

              // LinxAcoesPromocionais ------------------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxAcoesPromocionais') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (empresa, cnpj_emp, id_acoes_promocionais)';

              // LinxMovimentoAcoesPromocionais ---------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoAcoesPromocionais') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (empresa, cnpj_emp, identificador, transacao)';

              // LinxMovimentoSerial --------------------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoSerial') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (empresa, cnpj_emp, identificador, transacao)';

              // LinxMovimentoTrocas --------------------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoTrocas') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (empresa, cnpj_emp, identificador, num_vale)';

              // LinxMovimentoPlanos --------------------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoPlanos') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (empresa, cnpj_emp, identificador, plano)';

              // LinxMovimentoOrigemDevolucoes ----------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoOrigemDevolucoes') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (empresa, cnpj_emp, identificador, nota_origem)';

              // LinxLojas ------------------------------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxLojas') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (empresa, cnpj_emp)';

              // LinxVendedores -------------------------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxVendedores') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (cod_vendedor, empresa)';

              // LinxClientesFornec ---------------------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxClientesFornec') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (cod_cliente)';

              // LinxProdutos ---------------------------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutos') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (cod_produto)';

              // LinxProdutosDetalhes -------------------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosDetalhes') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (empresa, cod_produto)';

              // LinxMovimento --------------------------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimento') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (empresa, transacao, documento, '+
                                           'codigo_cliente, operacao, tipo_transacao, '+
                                           'cod_produto, identificador)';

              // LinxFaturas ----------------------------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxFaturas') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (empresa, codigo_fatura, data_emissao, '+
                                           'cod_cliente, documento, serie, identificador)';

              // LinxReducoesZ --------------------------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxReducoesZ') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (empresa, cnpj, data_fechamento, numero_ecf,'+
                                           'numeroserie, data_mov)';

              // Executa Sql Update/Insert --------------------------
              MySql:=sSqlUpInCampos+sSqlUpInValores;
              MySql:=F_Troca(#$A#$A, ' ', MySql);
              MySql:=F_Troca(#$A, ' ', MySql);
// odiraqui 9
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

          sOBS:='ERRO em Atualiza Tabela LinxProdutoDetalhes Zera Produto Sem Saldo';

          MySql:=' UPDATE LINXPRODUTOSDETALHES d'+
                 ' SET d.quantidade=0.0000'+
                 ' WHERE d.dta_atualizacao<>'+QuotedStr(sDtaAtual)+
                 ' AND d.quantidade<>0.000'+
                 ' AND d.empresa='+sgCodLojaLinx;
          DMLinxWebService.SQLC.Execute(MySql, nil, nil);

          sOBS:='ERRO em Atualiza Tabela LinxProdutoDetalhes com Produto Sem Saldo';

          MySql:=' INSERT INTO LINXPRODUTOSDETALHES'+
                 ' SELECT'+
                 ' lp.portal,'+
                 sgCodLojaLinx+' EMPRESA,'+ // CODIGO EMPRESA MICROVIX
                 QuotedStr(sgCNPJProc)+' CNPJ_EMP,'+ // CNPJ DA EMPRESA
                 ' LP.cod_produto COD_PRODUTO, LP.cod_barra COD_BARRA,'+
                 ' 0.0000 QUANTIDADE, 0.0000 PRECO_CUSTO, 0.0000 PRECO_VENDA, 0.0000 CUSTO_MEDIO,'+
                 ' NULL ID_CONFIG_TRIBUTARIA, NULL DESC_CONFIG_TRIBUTARIA,'+
                 QuotedStr(sgCodLoja)+' COD_LOJA, '+ // CODIGO EMPRESA SIDICOM
                 QuotedStr(sDtaAtual)+' DTA_ATUALIZACAO, current_time HRA_ATUALIZACAO'+

                 ' FROM LINXPRODUTOS lp'+
                 ' WHERE NOT EXISTS (SELECT 1'+
                 '                   FROM LINXPRODUTOSDETALHES lpd'+
                 '                   WHERE lpd.cod_produto=lp.cod_produto'+
                 '                   AND   lpd.empresa='+sgCodLojaLinx+')'; // CODIGO EMPRESA MICROVIX
          DMLinxWebService.SQLC.Execute(MySql, nil, nil);
          sOBS:='';
        End; // If sgMetodo='LinxProdutosDetalhes' Then

        //======================================================================
        // Exclui Codigos de Barras que Sobraram ===============================
        //======================================================================
        If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosCodBar') Then
        Begin
          MySql:=' DELETE FROM LINXPRODUTOSCODBAR cb'+
                 ' WHERE cb.dta_atualizacao<>'+QuotedStr(sDtaAtual);
          DMLinxWebService.SQLC.Execute(MySql, nil, nil);
        End; // If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosCodBar') Then

        // Atualiza Transacao ============================================
        DMLinxWebService.SQLC.Commit(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';

      Except // Except da Transa��o  /////////////////////////////////////
        on e : Exception do
        Begin
          // Abandona Transacao ==========================================
          DMLinxWebService.SQLC.Rollback(TD);

          DateSeparator:='/';
          DecimalSeparator:=',';

          If Trim(sMensagem)<>'' Then
           SalvaProcessamento(sgMetodo+'_'+sgCodLojaLinx+'(�ltimo Erro): '+sMensagem);

          sMensagem:='Erro DML: '+e.message;
          SalvaProcessamento(sgMetodo+'_'+sgCodLojaLinx+'(Reg '+IntToStr(ii)+'): '+sMensagem);

          SalvaProcessamento('=====================================');
        End; // on e : Exception do
      End; // Try da Transa��o  ////////////////////////////////////////////////
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
      SalvaProcessamento('Loja Linx: '+sgCodLojaLinx+' Metodo: '+sgMetodo+' com Erro no Post !!');
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
  // Grava Linha Padr�es =======================================================
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
  sXML:='		<Name>'+sgMetodo+'</Name>';
  Writeln(txtArq,sXML);
  // ===========================================================================

//OdirAqui 8 - Acerta Post - Ultima Altera��o
  // ===========================================================================
  // Cabecalho de Parametro Padr�o para Todos os Metodos =======================
  // Menos para os Metodos:
  // LinxMetodos
  // LinxGrupoLojas
  // ===========================================================================
  If (sgMetodo<>'LinxMetodos') And (sgMetodo<>'LinxGrupoLojas') Then
  Begin
    sXML:='		<Parameters>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="chave">'+sgWebServiceChave+'</Parameter>'; // d52511f4-3541-4a65-9adc-665513ea3207
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="cnpjEmp">'+sgCNPJProc+'</Parameter>'; // 03772229001880
    Writeln(txtArq,sXML);
  End; // If (sgMetodo<>'LinxMetodos') And (sgMetodo<>'LinxGrupoLojas') Then // Cabecalho de Parametro Padr�o
  // ===========================================================================

  // ===========================================================================
  // LinxGrupoLojas ============================================================
  // ===========================================================================
  If sgMetodo='LinxGrupoLojas' Then // Cabecalho de Parametro
  Begin
    sXML:='		<Parameters>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="chave">'+sgWebServiceChave+'</Parameter>'; // d52511f4-3541-4a65-9adc-665513ea3207
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="grupo">'+QuotedStr(sgWebServiceGrupo)+'</Parameter>'; // Belshop � 8560
    Writeln(txtArq,sXML);
  End; // If sgMetodo='LinxGrupoLojas' Then // Cabecalho de Parametro
  // ===========================================================================

  // ===========================================================================
  // Somente Parametros Padr�es ================================================
  // LinxLojas =================================================================
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

    //====================================
    // PARAMETRO OPCIONAL E N�O UTILIZADOS
    //====================================
    //       Metodo         Parametro
    //--------------------  --------------
    // LinxVendedores       Cod_Vendedor
    //====================================
  End; // If sgMetodo='LinxVendedores' Then
  // ===========================================================================

  // ===========================================================================
  // LinxAcoesPromocionais =====================================================
  // ===========================================================================
  If (sgMetodo='LinxAcoesPromocionais') Then
  Begin
    sXML:='			<Parameter id="ativa">'+sgAtiva+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="data_inicial">'+sgDtaInicio+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="data_fim">'+sgDtaFim+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="integrada">'+'NULL'+'</Parameter>';
    Writeln(txtArq,sXML);
  End; // If (sgMetodo='LinxAcoesPromocionais') Then
  // ===========================================================================

  // ===========================================================================
  // LinxClientesFornec ========================================================
  // LinxMovimento =============================================================
  // LinxMovimentoTrocas =======================================================
  // LinxMovimentoOrigemDevolucoes =============================================
  // LinxMovimentoSerial =======================================================
  // LinxMovimentoPlanos =======================================================
  // LinxMovimentoAcoesPromocionais ============================================
  // LinxPedidosVenda ==========================================================
  // LinxPedidosCompra =========================================================
  // LinxReducoesZ =============================================================
  // ===========================================================================
  If (sgMetodo='LinxClientesFornec')  Or (sgMetodo='LinxMovimento') Or
     (sgMetodo='LinxMovimentoTrocas') Or (sgMetodo='LinxMovimentoOrigemDevolucoes') Or
     (sgMetodo='LinxMovimentoSerial') Or (sgMetodo='LinxMovimentoAcoesPromocionais') Or
     (sgMetodo='LinxMovimentoPlanos') Or (sgMetodo='LinxPedidosVenda') Or
     (sgMetodo='LinxPedidosCompra')   Or (sgMetodo='LinxReducoesZ') Then
  Begin
    //---------------------------------------------------------------
    // LinxMovimentoTrocas ------------------------------------------
    // LinxMovimentoOrigemDevolucoes --------------------------------
    // LinxMovimentoSerial ------------------------------------------
    // LinxMovimentoPlanos ------------------------------------------
    // LinxMovimentoAcoesPromocionais -------------------------------
    //---------------------------------------------------------------
    If (sgMetodo='LinxMovimentoTrocas') Or (sgMetodo='LinxMovimentoOrigemDevolucoes') Or
       (sgMetodo='LinxMovimentoSerial') Or (sgMetodo='LinxMovimentoAcoesPromocionais') Or
       (sgMetodo='LinxMovimentoPlanos') Then
    Begin
      sXML:='			<Parameter id="identificador">'+'NULL'+'</Parameter>';
      Writeln(txtArq,sXML);
    End; // If (sgMetodo='LinxMovimentoTrocas') Then

    //---------------------------------------------------------------
    // LinxReducoesZ ------------------------------------------------
    //---------------------------------------------------------------
    If (sgMetodo='LinxReducoesZ') Then
    Begin
      sXML:='			<Parameter id="cnpjPortal">'+sgCnpjPortal+'</Parameter>';
      Writeln(txtArq,sXML);
    End; // If (sgMetodo='LinxMovimentoTrocas') Then

    //---------------------------------------------------------------
    // LinxClientesFornec -------------------------------------------
    // LinxMovimento ------------------------------------------------
    // LinxMovimentoTrocas ------------------------------------------
    // LinxMovimentoOrigemDevolucoes --------------------------------
    // LinxMovimentoSerial ------------------------------------------
    // LinxMovimentoPlanos ------------------------------------------
    // LinxMovimentoAcoesPromocionais -------------------------------
    // LinxPedidosVenda ---------------------------------------------
    // LinxPedidosCompra --------------------------------------------
    // LinxReducoesZ ------------------------------------------------
    //---------------------------------------------------------------
    sXML:='			<Parameter id="data_inicial">'+sgDtaInicio+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="data_fim">'+sgDtaFim+'</Parameter>';
    Writeln(txtArq,sXML);

    //---------------------------------------------------------------
    // LinxMovimento ------------------------------------------------
    // LinxPedidosVenda ---------------------------------------------
    //---------------------------------------------------------------
    If (sgMetodo='LinxMovimento') Or (sgMetodo='LinxPedidosVenda') Then
    Begin
      sXML:='			<Parameter id="hora_inicial">'+'NULL'+'</Parameter>';
      Writeln(txtArq,sXML);
      sXML:='			<Parameter id="hora_fim">'+'NULL'+'</Parameter>';
      Writeln(txtArq,sXML);
    End; // If (sgMetodo='LinxMovimento') oR (sgMetodo='LinxPedidosVenda') Then

    //---------------------------------------------------------------
    // LinxMovimento ------------------------------------------------
    //---------------------------------------------------------------
    If (sgMetodo='LinxMovimento') Then
    Begin
      sXML:='			<Parameter id="operacao">'+sSetor+'</Parameter>'; // Variavel sSetor Usada como Variavel operacao
      Writeln(txtArq,sXML);
      sXML:='			<Parameter id="tipo_transacao">'+sLinha+'</Parameter>'; // Variavel sLinha Usada como Variavel tipo_transacao
      Writeln(txtArq,sXML);
    End; // If (sgMetodo='LinxMovimento') Then

    //====================================
    // PARAMETRO OPCIONAL E N�O UTILIZADOS
    //====================================
    //       Metodo         Parametro
    //--------------------  --------------
    // LinxClientesFornec   Cod_Cliente
    //====================================
  End; // If (sgMetodo='LinxClientesFornec')  Or (sgMetodo='LinxMovimento') Or ...
  // ===========================================================================

  // ===========================================================================
  // LinxProdutos ==============================================================
  // LinxProdutosCodBar ========================================================
  // ===========================================================================
  If (sgMetodo='LinxProdutos') Or (sgMetodo='LinxProdutosCodBar') Then
  Begin
    sXML:='			<Parameter id="id_setor">'+sSetor+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="id_linha">'+sLinha+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="id_marca">'+sMarca+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="id_colecao">'+sColecao+'</Parameter>';
    Writeln(txtArq,sXML);

    //====================================
    // PARAMETRO OPCIONAL E N�O UTILIZADOS
    //====================================
    //       Metodo         Parametro
    //--------------------  --------------
    // LinxProdutosCodBar   Cod_Produto
    //====================================
  End; // If (sgMetodo='LinxProdutos') Or (sgMetodo='LinxProdutosCodBar') Then

  If sgMetodo='LinxProdutos' Then
  Begin
    sXML:='			<Parameter id="dt_update_inicio">'+sgDtaInicio+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="dt_update_fim">'+sgDtaFim+'</Parameter>';
    Writeln(txtArq,sXML);

    //====================================
    // PARAMETRO OPCIONAL E N�O UTILIZADOS
    //====================================
    //       Metodo         Parametro
    //--------------------  --------------
    // LinxProdutos         Cod_Produto
    //====================================
  End; // If sgMetodo='LinxProdutos' Then
  // ===========================================================================

  // ===========================================================================
  // LinxProdutosDetalhes ======================================================
  // ===========================================================================
  If sgMetodo='LinxProdutosDetalhes' Then
  Begin
    sXML:='			<Parameter id="data_mov_ini">'+sgDtaInicio+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="data_mov_fim">'+sgDtaFim+'</Parameter>';
    Writeln(txtArq,sXML);

    //===============================================
    // PARAMETRO OPCIONAL: Cod_Produto (sgCodProduto)
    //===============================================
    If Trim(sgCodProduto)<>'' Then
    Begin
      sXML:='			<Parameter id="cod_produto">'+sgCodProduto+'</Parameter>';
      Writeln(txtArq,sXML);
    End; // If Trim(sgCodProduto)<>'' Then
  End; // If sgMetodo='LinxProdutosDetalhes' Then
  // ===========================================================================

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

    //====================================
    // PARAMETRO OPCIONAL E N�O UTILIZADOS
    //====================================
    //       Metodo         Parametro
    //--------------------  --------------
    // LinxFaturas          Identificador
    //====================================
  End; // If (sgMetodo='LinxFaturas') Then
  // ===========================================================================

  // ===========================================================================
  // LinxLancContabil =====================================================
  // ===========================================================================
  If (sgMetodo='LinxLancContabil') Then
  Begin
    sXML:='			<Parameter id="data_lanc_ini">'+sgDtaInicio+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="data_lanc_fim">'+sgDtaFim+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="cod_cc">'+sSetor+'</Parameter>'; // Variavel sSetor Usada como Variavel cod_cc
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="cod_conta">'+sLinha+'</Parameter>'; // Variavel sLinha Usada como Variavel cod_conta
    Writeln(txtArq,sXML);
  End; // If (sgMetodo='LinxLancContabil') Then
  // ===========================================================================

  // ===========================================================================
  // Grava Linhas de Encerramento XML ==========================================
  // ===========================================================================
  If sgMetodo<>'LinxMetodos' Then // Metodo Sem Parametro
  Begin
    sXML:='		</Parameters>';
    Writeln(txtArq,sXML);
  End; // If sgMetodo<>'LinxMetodos' Then // Metodo Sem Parametro
  // ===========================================================================

  sXML:='	</Command>';
  Writeln(txtArq,sXML);

  sXML:='</LinxMicrovix>';
  Writeln(txtArq,sXML);

  CloseFile(txtArq);

  bgMontouPost:=True;

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

  sMetodoEspecifico: String;

  dDtaUltAtual, dDtaHoje: TDate;
  wDia, wMes, wAno: Word;

  hHrInicio: String; // N�o permite rodar com Parametro entre as 16 e 18 Horas - Existe um processo rodando
Begin
  // Parametro: Somente o Metodo Enviado =======================================
  sgParametroMetodo   :=''; // Metodo a Processar
  sgParametroCodLoja  :=''; // Loja a Processar
  sgParametroMetodos  :=''; // Pasta Metodo  - \\192.168.0.252\Projetos\BelShop\WebService Linx\Metodos\
  sgParametroRetornos :=''; // Pasta Retorno - \\192.168.0.252\Projetos\BelShop\WebService Linx\Retornos\

  // Le Parametros Enviado =====================================================
  sgParametroMetodo:=ParamStr(1);

  // OdirOPSS - Utiliza Parametro ==============================================
  // Estrutura (Paramentros Separedos por Espa�o ' ';
  // NomeMetodo Codigo_Loja_Linx Pasta_Metodos Pasta_Retornos
  // >>>>>>>>>>>>>> EXEMPLO PELO PARAMETRO <<<<<<<<<<<
  // \\192.168.0.252\Projetos\BelShop\WebService Linx\PWebServiceLinx.exe LinxMovimento 15 "\\192.168.0.252\Projetos\BelShop\WebService Linx\Metodos\" "\\192.168.0.252\Projetos\BelShop\WebService Linx\Retornos\"
  // >>>>>>>>>>>>>> EXEMPLO PELO ODIR (Separados por (;) <<<<<<<<<<<
  // sgParametroMetodo:='\\192.168.0.252\Projetos\BelShop\WebService Linx\PWebServiceLinx.exe LinxMovimento;15;\\192.168.0.252\Projetos\BelShop\WebService Linx\Metodos\;\\192.168.0.252\Projetos\BelShop\WebService Linx\Retornos\;';

  // Pasta Execut�vel PWebServiceLinx N�o Rede
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
      sgParametroMetodo  :=Separa_String(Trim(sgParametroMetodo),1); // Ultimo Devido a substitui��o do
                                                                     // Conteudo da Variavel sgParametroMetodo
    End;

    sgPastaExecutavel:=Copy(sgParametroMetodos,1,Pos('Metodos\', sgParametroMetodos)-1);
  End; // If Trim(sgParametroMetodo)<>'' Then

  //odirOPSS
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
  If Trim(sgParametroMetodo)<>'' Then
  Begin
    sgPastaMetodos :=IncludeTrailingPathDelimiter(sgParametroMetodos);
    sgPastaRetornos:=IncludeTrailingPathDelimiter(sgParametroRetornos);
  End; // If Trim(sgParametroMetodo)<>'' Then

  // Pasta BelShop =============================================================
  i:=pos('BelShop',sgPastaMetodos);
  sgPastaBelShop:=Copy(sgPastaMetodos,1,i+7);

  // Verifica se Arquivo Ini de Conex�o Existe =================================
  If Not (FileExists(sgPastaBelShop+'PCTConect_IB.ini')) Then
  Begin
    SalvaProcessamento(sgPastaMetodos+'PCTConect_IB.ini N�o Encontrado !!');
    Application.Terminate;
    Exit;
  End;

  // Cria Arquivo de Acompanhamento do Processamento ===========================
  tgArqProc:=TStringList.Create;

  // Verifica se Interet Esta Ativa ============================================
  if not InternetGetConnectedState(@Flags, 0) then
  Begin
    SalvaProcessamento(sgDta+'Internet N�o Conectada !!');
    Application.Terminate;
    Exit;
  End;

  // Conecta o Banco de Dados ==================================================
  If Not DMLinxWebService.ConectaBanco Then
  Begin
    If Trim(sgArqProc)='' Then
     sgArqProc:=sgPastaRetornos+'@LinxWebService_NAO_CONECTOU.txt';

    SalvaProcessamento('Erro de Conex�o!! '+sgMensagem);
    Application.Terminate;
    Exit;
  End;

  // Se Progrma J� em Execu��o Encerra =========================================
  If Trim(sgParametroMetodo)<>'' Then
  Begin
    hHrInicio:=TimeToStr(DataHoraServidorFI(DMLinxWebService.SDS_DtaHoraServidor));
    If (StrToTime(hHrInicio)>StrToTime('16:00:00')) and (StrToTime(hHrInicio)<StrToTime('18:00:00')) Then
    Begin
      Application.Terminate;
      Exit;
    End;
  End; // If Trim(sgParametroMetodo)<>'' Then

  // Data Inicio da Atualiza��o ================================================
  sgDta:=DateToStr(DataHoraServidorFI(DMLinxWebService.SDS_DtaHoraServidor));
  sgDta:=f_Troca('/','',f_Troca('.','',f_Troca('-','',sgDta)));

  // Salva Pasta e Nome do Arquivo de Acompanhamento de Processamento ==========
  sgArqProc:=sgPastaRetornos+'@LinxWebService_'+sgDta+'.txt';

  DeleteFile(sgArqProc);

  // Busca Parametros da Linx para WebService ==================================
  MySql:=' SELECT lp.usuario, lp.senha, lp.chave, lp.grupolojas'+
         ' FROM LINXWEBSERVICE lp';
  DMLinxWebService.CDS_Busca.Close;
  DMLinxWebService.SDS_Busca.CommandText:=MySql;
  DMLinxWebService.CDS_Busca.Open;
  sgWebServiceUsuario:=DMLinxWebService.CDS_Busca.FieldByName('Usuario').AsString;
  sgWebServiceSenha  :=DMLinxWebService.CDS_Busca.FieldByName('Senha').AsString;
  sgWebServiceChave  :=DMLinxWebService.CDS_Busca.FieldByName('Chave').AsString;
  sgWebServiceGrupo  :=DMLinxWebService.CDS_Busca.FieldByName('grupolojas').AsString;
  DMLinxWebService.CDS_Busca.Close;

  // ===========================================================================
  // Busca Defini��o de Todos os Metodos =======================================
  // ===========================================================================
  sgMetodo:='LinxMetodos';
  sgArqXMLRet:='Retorno_'+sgMetodo+'.XML';
  MontaMetodoXMLPost();
  EnviaMetodoXMLPost;
  // ===========================================================================

  // Processa Lojas ============================================================
  MySql:=' SELECT em.num_cnpj, em.cod_filial, em.cod_linx, em.dta_inicio_linx'+
         ' FROM EMP_CONEXOES em';

         If sgParametroCodLoja<>'' Then
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
  sgAtiva:='';
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
      sgCodProduto:='';

      If Trim(tgMetodos[iFor])='' Then
       Break;

      bgMontouPost:=False;
      sgMetodo  :=tgMetodos[iFor];

      // Somente o Metodo Conforme Parametro Enviado ===========================
      If Trim(sgParametroMetodo)<>'' Then
      Begin
        sgMetodo:=sgParametroMetodo;
      End; // If Trim(sgParametroMetodo)<>'' Then

      sMetodoEspecifico:='';
      If (sgMetodo='LinxMovtosAjustesEntradas') Or (sgMetodo='LinxMovtosAjustesSaidas') Then
      Begin
        sMetodoEspecifico:=sgMetodo;
        sgMetodo:='LinxMovimento'
      End; // If (sgMetodo='LinxMovtosAjustesEntradas') Or (sgMetodo='LinxMovtosAjustesSaidas') Then

      sgArqXMLRet:='Retorno_'+sgMetodo+'.XML';

      // Data Hoje =============================================================
      dDtaHoje:=DataHoraServidorFI(DMLinxWebService.SDS_DtaHoraServidor);

      //========================================================================
      // TODOS OS METODOS - Data Ultima Atualiza��o Linx =======================
      //========================================================================
//odiraqui 1 - Campo Data para Pesquisa
      // Campo Data para Pesquisa ----------------------------------------------
      If (AnsiUpperCase(sgMetodo)='LINXVENDEDORES')  Then
       sgCampoUpdate:='Dt_Upd'
      Else If (AnsiUpperCase(sgMetodo)='LINXCLIENTESFORNEC') or (AnsiUpperCase(sgMetodo)='LINXPRODUTOS') Then
       sgCampoUpdate:='Dt_Update'
      Else If (AnsiUpperCase(sgMetodo)='LINXMOVIMENTO') Then
       sgCampoUpdate:='Data_Documento'
      Else If (AnsiUpperCase(sgMetodo)='LINXFATURAS') Then
       sgCampoUpdate:='Data_Emissao'
      Else If (AnsiUpperCase(sgMetodo)='LINXLANCCONTABIL') Then
       sgCampoUpdate:='DATA_LANC'
      Else If (AnsiUpperCase(sgMetodo)='LINXPEDIDOSVENDA') Then
       sgCampoUpdate:='DATA_LANCAMENTO'
      Else If (AnsiUpperCase(sgMetodo)='LINXPEDIDOSCOMPRA') Then
       sgCampoUpdate:='DATA_PEDIDO'
      Else If (AnsiUpperCase(sgMetodo)='LINXREDUCOESZ') Then
       sgCampoUpdate:='DATA_MOV'
      ELSE
       sgCampoUpdate:='Dta_Atualizacao';

      MySql:=' SELECT CAST(MAX(Lx.'+sgCampoUpdate+') AS DATE) Dta_Ult_Alteracao'+
             ' FROM '+sgMetodo+' lx';

//Odiraqui 2 - Quando Contem CAMPO: EMPRESA
             If (AnsiUpperCase(sgMetodo)='LINXFATURAS')                    or
                (AnsiUpperCase(sgMetodo)='LINXLOJAS')                      or
                (AnsiUpperCase(sgMetodo)='LINXMOVIMENTO')                  or
                (AnsiUpperCase(sgMetodo)='LINXMOVIMENTOTROCAS')            or
                (AnsiUpperCase(sgMetodo)='LINXGRUPOLOJAS')                 or
                (AnsiUpperCase(sgMetodo)='LINXMOVIMENTOORIGEMDEVOLUCOES')  or
                (AnsiUpperCase(sgMetodo)='LINXMOVIMENTOSERIAL')            or
                (AnsiUpperCase(sgMetodo)='LINXVENDEDORES')                 or
                (AnsiUpperCase(sgMetodo)='LINXMOVIMENTOPLANOS')            or
                (AnsiUpperCase(sgMetodo)='LINXMOVIMENTOACOESPROMOCIONAIS') or
                (AnsiUpperCase(sgMetodo)='LINXACOESPROMOCIONAIS')          or
                (AnsiUpperCase(sgMetodo)='LINXLANCCONTABIL')               or
                (AnsiUpperCase(sgMetodo)='LINXPEDIDOSVENDA')               or
                (AnsiUpperCase(sgMetodo)='LINXPEDIDOSCOMPRA')              or
                (AnsiUpperCase(sgMetodo)='LINXREDUCOESZ')                  or
                (AnsiUpperCase(sgMetodo)='LINXPRODUTOSDETALHES')           Then
              MySql:=
               MySql+' WHERE lx.Empresa='+sgCodLojaLinx;
      DMLinxWebService.CDS_Busca.Close;
      DMLinxWebService.SDS_Busca.CommandText:=MySql;
      DMLinxWebService.CDS_Busca.Open;
      dDtaUltAtual:=DMLinxWebService.CDS_Busca.FieldByName('Dta_Ult_Alteracao').AsDateTime;
      DMLinxWebService.CDS_Busca.Close;
      //========================================================================

      // Montagem do Http.Post =================================================

      //========================================================================
      // LinxGrupoLojas ========================================================
      //========================================================================
      If (sgMetodo='LinxGrupoLojas') And (Not bUmaVez) Then
      Begin
        MontaMetodoXMLPost();
      End; // If (sgMetodo='LinxGrupoLojas') And (Not bUmaVez) Then

      //========================================================================
      // LinxLojas =============================================================
      //========================================================================
      If sgMetodo='LinxLojas' Then
      Begin
        MontaMetodoXMLPost();
      End; // If sgMetodo='LinxLojas' Then
      //========================================================================

      //========================================================================
      // LinxClientesFornec ====================================================
      //========================================================================
      If (sgMetodo='LinxClientesFornec') And (Not bUmaVez) Then
      Begin
        If dDtaUltAtual=0 Then
         dDtaUltAtual:=DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime+4;;

        DecodeDate(dDtaUltAtual-4, wAno, wMes, wDia);
        sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        DecodeDate(dDtaHoje, wAno, wMes, wDia);
        sgDtaFim:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        // Metodo por Parametro (Acerta Data Inicial)
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
      //========================================================================

      //========================================================================
      // LinxMovimento e Ajustes ===============================================
      //========================================================================
      If (sgMetodo='LinxMovimento') Then
      Begin
        If (sMetodoEspecifico='') Then
        Begin
          If (dDtaUltAtual=0) Or ((dDtaUltAtual-7)<DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime) Then
           dDtaUltAtual:=DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime+7;

          DecodeDate(dDtaUltAtual-7, wAno, wMes, wDia);
          sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

          DecodeDate(dDtaHoje, wAno, wMes, wDia);
          sgDtaFim:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

          // Metodo por Parametro (Acerta Data Inicial)
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

          MontaMetodoXMLPost('NULL', 'NULL'); // operacao, tipo_transacao
        End; // If (sMetodoEspecifico='') Then

        // Busca Todos os Ajustes de Estoques desde o Inicio da Loja Linx ======
        If (sMetodoEspecifico='LinxMovtosAjustesEntradas') Or (sMetodoEspecifico='LinxMovtosAjustesSaidas') Then
        Begin
          If (dDtaUltAtual=0) Or ((dDtaUltAtual-15)<DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime) Then
           dDtaUltAtual:=DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime+15;

          DecodeDate(dDtaUltAtual-15, wAno, wMes, wDia);
          sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

          DecodeDate(dDtaHoje, wAno, wMes, wDia);
          sgDtaFim:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

          // Metodo por Parametro (Acerta Data Inicial)
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

          If (sMetodoEspecifico='LinxMovtosAjustesEntradas') Then
          Begin
            MontaMetodoXMLPost('E', 'J'); // operacao, tipo_transacao
          End;

          If (sMetodoEspecifico='LinxMovtosAjustesSaidas') Then
          Begin
            MontaMetodoXMLPost('S', 'J'); // operacao, tipo_transacao
          End;
        End; // If (sMetodoEspecifico='LinxMovtosAjustesEntradas') Or (sMetodoEspecifico='LinxMovtosAjustesSaidas') Then
      End; // If sgMetodo='LinxMovimento' Then
      //========================================================================

      //========================================================================
      // LinxMovimentoTrocas ===================================================
      //========================================================================
      If sgMetodo='LinxMovimentoTrocas' Then
      Begin
        If (dDtaUltAtual=0) Or ((dDtaUltAtual-7)<DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime) Then
         dDtaUltAtual:=DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime+7;

        DecodeDate(dDtaUltAtual-7, wAno, wMes, wDia);
        sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        DecodeDate(dDtaHoje, wAno, wMes, wDia);
        sgDtaFim:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        // Metodo por Parametro (Acerta Data Inicial)
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
      End; // If sgMetodo='LinxMovimentoTrocas' Then
      //========================================================================

      //========================================================================
      // LinxMovimentoOrigemDevolucoes =========================================
      //========================================================================
      If sgMetodo='LinxMovimentoOrigemDevolucoes' Then
      Begin
        If (dDtaUltAtual=0) Or ((dDtaUltAtual-7)<DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime) Then
         dDtaUltAtual:=DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime+7;

        DecodeDate(dDtaUltAtual-7, wAno, wMes, wDia);
        sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        DecodeDate(dDtaHoje, wAno, wMes, wDia);
        sgDtaFim:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        // Metodo por Parametro (Acerta Data Inicial)
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
      End; // If sgMetodo='LinxMovimentoOrigemDevolucoes' Then
      //========================================================================

      //========================================================================
      // LinxMovimentoSerial ===================================================
      //========================================================================
      If sgMetodo='LinxMovimentoSerial' Then
      Begin
        If (dDtaUltAtual=0) Or ((dDtaUltAtual-7)<DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime) Then
         dDtaUltAtual:=DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime+7;

        DecodeDate(dDtaUltAtual-7, wAno, wMes, wDia);
        sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        DecodeDate(dDtaHoje, wAno, wMes, wDia);
        sgDtaFim:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        // Metodo por Parametro (Acerta Data Inicial)
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
      End; // If sgMetodo='LinxMovimentoSerial' Then
      //========================================================================

      //========================================================================
      // LinxMovimentoPlanos ===================================================
      //========================================================================
      If sgMetodo='LinxMovimentoPlanos' Then
      Begin
        If (dDtaUltAtual=0) Or ((dDtaUltAtual-7)<DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime) Then
         dDtaUltAtual:=DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime+7;

        DecodeDate(dDtaUltAtual-7, wAno, wMes, wDia);
        sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        DecodeDate(dDtaHoje, wAno, wMes, wDia);
        sgDtaFim:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        // Metodo por Parametro (Acerta Data Inicial)
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
      End; // If sgMetodo='LinxMovimentoPlanos' Then
      //========================================================================

      //========================================================================
      // LinxMovimentoAcoesPromocionais ========================================
      //========================================================================
      If sgMetodo='LinxMovimentoAcoesPromocionais' Then
      Begin
        If (dDtaUltAtual=0) Or ((dDtaUltAtual-7)<DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime) Then
         dDtaUltAtual:=DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime+7;

        DecodeDate(dDtaUltAtual-7, wAno, wMes, wDia);
        sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        DecodeDate(dDtaHoje, wAno, wMes, wDia);
        sgDtaFim:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        // Metodo por Parametro (Acerta Data Inicial)
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
      End; // If sgMetodo='LinxMovimentoAcoesPromocionais' Then
      //========================================================================

      //========================================================================
      // LinxAcoesPromocionais =================================================
      //========================================================================
      If sgMetodo='LinxAcoesPromocionais' Then
      Begin
        If (dDtaUltAtual=0) Or ((dDtaUltAtual-7)<DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime) Then
         dDtaUltAtual:=DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime+7;

        DecodeDate(dDtaUltAtual-7, wAno, wMes, wDia);
        sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        DecodeDate(dDtaHoje, wAno, wMes, wDia);
        sgDtaFim:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        // Metodo por Parametro (Acerta Data Inicial)
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

        // Busca Varia��es por Ser Obrigat�rio
        // sgAtiva=1
        // sgAtiva=0
        If Trim(sgAtiva)='' Then
         sgAtiva:='0'
        Else
         sgAtiva:='1';

        MontaMetodoXMLPost();
      End; // If sgMetodo='LinxAcoesPromocionais' Then
      //========================================================================

      //========================================================================
      // LinxVendedores ========================================================
      //========================================================================
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

           // Metodo por Parametro (Acerta Data Inicial)
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
      End; // If sgMetodo='LinxVendedores' Then
      //========================================================================

      //========================================================================
      // LinxProdutos ==========================================================
      //========================================================================
      If (sgMetodo='LinxProdutos') And (Not bUmaVez) Then
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

           // Metodo por Parametro (Acerta Data Inicial)
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

                         // Setor   Linha   Marca   Colecao
        MontaMetodoXMLPost('NULL', 'NULL', 'NULL', 'NULL');
      End; // If (sgMetodo='LinxProdutos') And (Not bUmaVez) Then
      //========================================================================

      //========================================================================
      // LinxProdutosDetalhes ==================================================
      //========================================================================
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

           // Metodo por Parametro (Acerta Data Inicial)
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

        // Atualiza o Saldo de Todos os Produtos com Saldo > 0.0000
        sgDtaInicio:='NULL';
        sgDtaFim:='NULL';

        MontaMetodoXMLPost();
      End; // If sgMetodo='LinxProdutosDetalhes' Then
      //========================================================================

      //========================================================================
      // LinxProdutosCodBar ====================================================
      //========================================================================
      If (sgMetodo='LinxProdutosCodBar') And (Not bUmaVez) Then
      Begin
                         // Setor   Linha   Marca   Colecao
        MontaMetodoXMLPost('NULL', 'NULL', 'NULL', 'NULL');
      End; // If (sgMetodo='LinxProdutosCodBar') And (Not bUmaVez) Then

      //========================================================================
      // LinxFaturas ===========================================================
      //========================================================================
      If sgMetodo='LinxFaturas' Then
      Begin
        // OBS: S� poder� ser fornecido um per�odo de listagem (Emiss�o ou Pagamento),
        //      o outro dever� ficar como NULL. Mas dever� pelo menos ter um Per�odo informado.</D>

        If (dDtaUltAtual=0) Or ((dDtaUltAtual-7)<DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime) Then
         dDtaUltAtual:=DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime+7;

        DecodeDate(dDtaUltAtual-7, wAno, wMes, wDia);
        sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        DecodeDate(dDtaHoje, wAno, wMes, wDia);
        sgDtaFim:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        // Metodo por Parametro (Acerta Data Inicial)
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
      //========================================================================

      //========================================================================
      // LinxLancContabil ======================================================
      //========================================================================
      If sgMetodo='LinxLancContabil' Then
      Begin
        If (dDtaUltAtual=0) Or ((dDtaUltAtual-7)<DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime) Then
         dDtaUltAtual:=DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime+7;

        DecodeDate(dDtaUltAtual-7, wAno, wMes, wDia);
        sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        DecodeDate(dDtaHoje, wAno, wMes, wDia);
        sgDtaFim:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        // Metodo por Parametro (Acerta Data Inicial)
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

        MontaMetodoXMLPost('NULL', 'NULL'); // cod_cc, cod_conta
      End; // If sgMetodo='LinxLancContabil' Then
      //========================================================================

      //========================================================================
      // LinxPedidosVenda ======================================================
      //========================================================================
      If sgMetodo='LinxPedidosVenda' Then
      Begin
        If (dDtaUltAtual=0) Or ((dDtaUltAtual-7)<DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime) Then
         dDtaUltAtual:=DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime+7;

        DecodeDate(dDtaUltAtual-7, wAno, wMes, wDia);
        sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        DecodeDate(dDtaHoje, wAno, wMes, wDia);
        sgDtaFim:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        // Metodo por Parametro (Acerta Data Inicial)
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
      End; // If sgMetodo='LinxPedidosVenda' Then
      //========================================================================

      //========================================================================
      // LinxPedidosCompra ======================================================
      //========================================================================
      If sgMetodo='LinxPedidosCompra' Then
      Begin
        If (dDtaUltAtual=0) Or ((dDtaUltAtual-7)<DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime) Then
         dDtaUltAtual:=DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime+7;

        DecodeDate(dDtaUltAtual-7, wAno, wMes, wDia);
        sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        DecodeDate(dDtaHoje, wAno, wMes, wDia);
        sgDtaFim:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        // Metodo por Parametro (Acerta Data Inicial)
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
      End; // If sgMetodo='LinxPedidosCompra' Then
      //========================================================================

      //========================================================================
      // LinxReducoesZ =========================================================
      //========================================================================
      If sgMetodo='LinxReducoesZ' Then
      Begin
        If (dDtaUltAtual=0) Or ((dDtaUltAtual-7)<DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime) Then
         dDtaUltAtual:=DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime+7;

        DecodeDate(dDtaUltAtual-7, wAno, wMes, wDia);
        sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        DecodeDate(dDtaHoje, wAno, wMes, wDia);
        sgDtaFim:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        // Metodo por Parametro (Acerta Data Inicial)
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

        // cnpjPortal -----------------------------------------------
        // (S) = Retorna registros de todos CNPJs do Portal
        //       (utiliza como base o cnpj informado nocampo cnpjEmp para pesquisar o portal).
        // (N) = Retorna registros somente do CNPJ pesquisa
        sgCnpjPortal:='N';

        MontaMetodoXMLPost();
      End; // If sgMetodo='LinxReducoesZ' Then
      //========================================================================

      //========================================================================
      // Envio do Http.post
      // Ler XML de Retorno e Salva no Banco de Dados
      //========================================================================
      If bgMontouPost Then
      Begin
        bSiga:=True;
        // Envio do Http.post ==================================================
        If Not EnviaMetodoXMLPost Then
        Begin
          bSiga:=False;
        End; // If Not EnviaMetodoXMLPost Then

        // Ler XML de Retorno e Salva no Banco de Dados ========================
        If bSiga Then
        Begin
          LeMetodoXMLRetorno;
        End; // If bSiga Then
      End; // If bgMontouPost Then
      //========================================================================

      // Quando Somente Um Metodo Conforme Parametro Envia =====================
      If Trim(sgParametroMetodo)<>'' Then
      Begin
        Break;
      End; // If Trim(sgParametroMetodo)<>'' Then
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
{
ALTERAR TABELAS
===============
  - LINXWEBSERVICE
    ==============
      GRUPOLOJAS  VARCHAR(20) = Belshop � 8560

      COMMENT ON COLUMN LINXWEBSERVICE.GRUPOLOJAS IS
      'Chave para Acesso ao M�todo: LinxGrupoLojas';

  - LINXMOVIMENTO
    =============
    - Altera��o do Tamanho
      - PROTOCOLO_AUT_NFE   VARCHAR(15)

  - LINXFATURAS
    ===========
    DOCUMENTO_SEM_TEF varchar(60) - Descri��o
    AUTORIZACAO_SEM_TEF - Descri��o


CRIAR NOVO
==========
  - CREATE TABLE LINXGRUPOLOJAS
                 ==============
    - N�o Baixou Nada

  - CREATE TABLE LINXMOVIMENTOTROCAS
                 ===================
    - Erro na Estrutura
      - Web Service Com Campos Diferentes em Rela��o a Documenta��o
    - Baixou

  - CREATE TABLE LINXMOVIMENTOORIGEMDEVOLUCOES
                 =============================
    - N�o Baixou Nada

  - CREATE TABLE LINXMOVIMENTOSERIAL
                 ===================
    - N�o Baixou Nada

  - CREATE TABLE LINXMOVIMENTOPLANOS
                 ====================
    - Erro na Descri��o do Campo
      - Na Estrutura Campo "VALOR" Correto "TOTAL"
    - Baixou

  - CREATE TABLE LINXMOVIMENTOACOESPROMOCIONAIS
                 ==============================
    - Erro na Descri��o do Campo
      - Na Estrutura Campo "VALOR_DESCONTO" Correto "DESCONTO_ITEM"
    - Baixou

  - CREATE TABLE LINXACOESPROMOCIONAIS
                 =====================
    - Erro na Descri��o do Campo
      - Na Estrutura Campo
        - Ativa     BIT 1=Sim, 0=N�o - Baixa Errado: TRUE/FALSE
        - Excluida  BIT 1=Sim, 0=N�o - Baixa Errado: TRUE/FALSE
        - Integrada BIT 1=Sim, 0=N�o - Baixa Correto: 1/0
    - Baixou

  - CREATE TABLE LINXPRODUTOSCODBAR
                 ==================
    - Baixou

  - CREATE TABLE LINXLANCCONTABIL
                 ================
    - Erro na Estrutura
      - Web Service n�o apresenta Campos da Documenta��o
          - cod_historico  - C�digo do Hist�rico no Microvix   - INT
          - desc_historico - Descri��o do Hist�rico - VARCHAR(50)

      - Erro no Tamanho do Campo
        - compl_conta - Complemento - VARCHAR (60)
          - Baixa mais de 60, Coloquei VARCHAR(300)
        - nome_conta - Nome Conta - VARCHAR (30)
          - Baixa mais de 30, Coloquei VARCHAR(60)
    - Baixou

  - CREATE TABLE LINXPEDIDOSVENDA
                 ================
    - Nao Baixou Nada

  - CREATE TABLE LINXPEDIDOSCOMPRA
                 =================
    - Nao Baixou Nada

ATEN��O
========
   - LinxVendedores
    - N�o Consta na Rela��o do Escopo do WebService no Inicio do Documento de
      ESPECIFICA��O Web Service Linx Microvix Padr�o


}

