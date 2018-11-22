unit UWebServiceLinx;
//aquiodir
{
odirTeste

-> LinxClientesFornecContatos
   - 1 vez
   ===========================
   Retorna os campos referentes ao contato do cadastro dos
   Clientes/Fornecedores cadastrados no portal

-> LinxPlanos
   - 1 vez
   ==========
   Retorna o cadastro dos Planos de Pagamentos do portal

-> LinxListaDaVez
   - Por Loja
   ==============
   Retorna os registros gerados na rotina de Lista da Vez

-> LinxMetasVendedores
   - Por Loja
   ===================
   Retorna as Metas de Vendedores das lojas

->  LinxProdutosDepositos
   - 1 vez
   ======================
   Retorna informações do cadastro de depósitos no Microvix

-> LinxProdutosInventario
   - Por Loja
   ======================
   Retorna informações do saldo do produto na data pesquisada

-> LinxConfiguracoesTributarias
   - Por Loja
   ============================
   Retorna o cadastro de configurações tributárias da empresa

-> LinxConfiguracoesTributariasDetalhes (Problema no Tamanho dos Campos)
   - Por Loja
      - 1 Vez (Nome da Tabela: LinxConfigTributariasDetalhes)

   ====================================
   Retorna o detalhamento das configurações tributárias da empresa
create table LinxConfiguracoesTributariasDetalhes
(
portal integer,
EMPRESA              INTEGER,
cnpj_emp VARCHAR (14),
id_config_tributaria integer,
desc_classe_fiscal VarChar(150),
cod_natureza_operacao integer,
desc_natureza_operacao VarChar(40),
cfop_fiscal VarChar(5),
desc_cfop_fiscal VarChar(200),
aliq_icms numeric(12,4),
valor_tributado_icms numeric(12,4),
aliq_pis numeric(12,4),
aliq_cofins numeric(12,4),
perc_reducao_icms numeric(12,4),
perc_reducao_icms_st numeric(12,4),
margem_st numeric(12,4),
aliquota_st numeric(12,4),
margem_st_simulador numeric(12,4),
aliquota_st_simulador numeric(12,4),
desconto_icms numeric(12,4),
cst_icms_fiscal VarChar(4),
desc_cst_icms_fiscal VarChar(150),
cst_ipi_fiscal VarChar(4),
desc_cst_ipi_fiscal VarChar(150),
cst_pis_fiscal VarChar(4),
desc_cst_pis_fiscal VarChar(150),
cst_cofins_fiscal VarChar(4),
desc_cst_cofins_fiscal VarChar(150),
desc_obs_padrao VarChar(250),
icms_credito integer,
ipi_credito integer,
cod_enquadramento_ipi VarChar(3),
desc_enquadramento_ipi VarChar(600),
perc_aliquota_interna_uf_destinatario numeric(12,4),
perc_aliquota_interestadual_uf_envolvidas numeric(12,4),
csosn_fiscal VarChar(5),
desc_csosn_fiscal VarChar(200),
forma_tributacao_pis integer,
forma_tributacao_cofins integer,
COD_LOJA             VARCHAR(2),
DTA_ATUALIZACAO       DATE,
HRA_ATUALIZACAO       TIME
)

================================================================================

-> Métodos: LinxMetodos
   - 1 Vez
   ====================
   Retorna as informações atualizadas dos nomes e parâmetros dos métodos do
   WebService Linx Microvix padrão.

-> Grupo Lojas: LinxGrupoLojas
   - 1 Vez
   ===========================
   Irá retornar todos os CNPJs do Grupo ou Rede.

-> Lojas: LinxLojas
   - Por Loja
   ================
   Irá conter as informações de cada loja do Portal com o sistema Microvix.

-> Clientes/Fornecedores: LinxClientesFornec
   - 1 Vez
   =========================================
   Irá conter as informações dos clientes/fornecedores cadastrados nas lojas.

-> Campos Adicionais de Clientes/Fornecedores: LinxClientesFornecCamposAdicionais
   - 1 Vez (Nome da Tabela: LinxClientesFornecAdicionais)
   =========================================
   Retorna os campos adicionais preenchidos dos Clientes/Fornecedores cadastrados no portal

-> Movimento: LinxMovimento (Inclui LinxMovtosAjustesEntradas, LinxMovtosAjustesSaidas)
   - Por Loja
   ========================
   Irá conter as informações referente as notas fiscais e tickets devenda.

-> Movimento Trocas: LinxMovimentoTrocas
   - Por Loja
   =====================================
   Irá conter as informações de valores das trocas utilizadas nas vendas

-> Movimento Origem Devoluções: LinxMovimentoOrigemDevolucoes
   - Por Loja
   ==========================================================
   Irá conter as informações de documentos de origem das devoluções relacionadas.

-> Movimento Seriais: LinxMovimentoSerial
   - Por Loja
   ======================================
   Irá conter as informações dos seriais movimentados

-> Movimento Planos: LinxMovimentoPlanos
   - Por Loja
   ======================================
   Irá conter as informações dos planos de pagamentos utilizados nas movimentações

-> Movimento Ações Promocionais: LinxMovimentoAcoesPromocionais
   - Por Loja
   ============================================================
   Irá conter as informações das Ações Promocionais utilizadas nas vendas

-> Ações Promocionais: LinxAcoesPromocionais
   - Por Loja
   =========================================
   Irá retornar o cadastro das Ações Promocionais

-> Vendedores: LinxVendedores
   - Por Loja
   ==========================
  - Ira conter as informações dos Vendedores cadastrados na loja

-> Produtos: LinxProdutos
   - 1 Vez
   ======================
   Ira conter com informações de produtos

-> Produtos: LinxProdutosCamposAdicionais
   - 1 Vez
   ======================
   Retorna os campos adicionais preenchidos dos Produtos cadastrados no portal

-> Produtos Detalhes: LinxProdutosDetalhes
   - Por Loja
   =======================================
   Irá conter as informações de produtos por empresa, comosaldo, preços,
   custos e configuração tributária

-> Produtos Cod Bar: LinxProdutosCodBar
   - 1 Vez
   ====================================
   Irá listar as informações de códigos de barras de produtos.

-> Faturas: LinxFaturas
   - Por Loja
   ====================
   Irá conter as informações de faturas a receber e a pagar;

-> Lançamentos contábeis: LinxLancContabil
   - Por Loja
   =======================================
   Irá conter as informações dos lançamentos contábeis por contas e empresas.

-> Pedidos de venda: LinxPedidosVenda
   - Por Loja
   ==================================
   Irá conter as informações dos pedidos de venda

-> Planos de Pagamentos nos pedidos de vendas: LinxPlanosPedidoVenda
   - Por Loja
   ==================================
   Retorna os Planos de Pagamentos realizados nos pedidos de vendas

-> Pedidos de Compra: LinxPedidosCompra
   - Por Loja
   =====================================
   Irá conter as informações dos pedidos de compra

-> Produtos Detalhes: LinxReducoesZ
   - Por Loja
   =======================================
   Retorna as ReduçõesZ de acordo com a loja pesquisada, somente para clientes
   que ainda utilizam a impressora fiscal

-> Sangrias e Suprimentos de Caixa: LinxSangriaSuprimentos
   - Por Loja
   =======================================
   Retorna as informações das Sangrias ou Suprimentos feitos no caixa
   Os valores negativos são referentes a Sangrias e os valores positivos são
   referentes aos Suprimentos.

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

    // OdirAqui -Não Utilizado Mais - Agora o Saldo CD é Direto do Local 1
    Procedure AcertaSaldo_Deposito9;

    Procedure AcertaSaldo_CD_Deposito1;

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

  sgCodLoja,        // Código da Loja/Empresa em Processamento (Codigo da Loja no SIDICOM)
  sgCodLojaLinx,    // Código da Loja/Empresa em Processamento (Codigo da Loja no Microvix)
  sgDtaInicioLinx,  // Data que a Loija Inicio com o Sistema Linx
  sgCodProduto,     // Parametro: Codigo do Produto para Busca Individual
  sgCodQualquer,    // Parametro: Codigo Qualquer para Busca Individual
  sgReferenciaProd, // Parametro: Codigo de Referencia do Produto para Busca Individual (Não Usado)
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

  // Variaveis de Recebimento de Parametros Externos ===========================
  bgParametroDtaEmissao: Boolean; // Parametro: Se Pesquisa é Pela Data de Emissão Docto
                                  // Se NÃO Pesquisa é Pela Data de Pagamento Docto
                                  // Usado em LinxFaturas

  sgParametroMetodo,      // Parametro: Metodo a Processar
  sgParametroCodLoja,     // Parametro: Loja a Processar
  sgParametroMetodos,     // Parametro: Pastas de Geração de Metodos
  sgParametroRetornos,    // Parametro: Pastas de Geração de Retornos
  sgParametroDtaInicio,   // Parametro: Data do Inico do Periodo
  sgParametroDtaFim,      // Parametro: Data do Fim do Periodo
  sgParametroCodProduto,  // Parametro: Codigo do Produto
  sgParametroCodQualquer, //`Parametro: Um Codigo Qualquer a Ser Solicitado

  sgCampoUpdate,
  sgMetodo,    // Metodo em Processamento
  sgArqXMLRet, // Nome do Arquivo de Retorno
  sgCNPJProc,  // CNPJ da Empresa Em Processamento

  sgDtaInicio, sgDtaFim, // Datas Para Busca de Dados
  sgDtaUpdateInicio, sgDtaUpdateFim, // Datas UpDate Para Busca de Dados

  sgWebServiceSenha, sgWebServiceUsuario,
  sgWebServiceChave, sgWebServiceGrupo: // Parametros Linx WebService
  String;

  // Utilizado no Método: LinxAcoesPromocionais
  sgAtiva: String;
  // Busca Variações
  // sgAtiva=1
  // sgAtiva=0

  bgMontouPost: Boolean;
  igCodTrib: Integer; // Incremento para Busca da Tributação (Metodo LinxConfiguracoesTributariasDetalhes)

  // Comandos Sql de UpDate/Insert
  sgMetodoNomeTabela,   // É preenchido com o Nome da Tabela se Diferente do Nome do Metodo
  sSqlUpInCampos,  // Se sSqlUpInCampos='': Monta do Inicio SeNão: Não Faz Nada já Esta Montado
  sSqlUpInValores: // Se sSqlUpInValores='': Monta do Inicio com Values SeNão: Termina de Montar e Executa
  String;

  TD: TTransactionDesc; // Ponteiro de Transacão

implementation

uses
  IdMultipartFormData, DK_Procs1, uj_001, uj_002, UDMLinxWebService,
  StrUtils, DB, RTLConsts;

{$R *.dfm}

//==============================================================================
// Odir - Inicio ===============================================================
//==============================================================================

// Acerta Estoque no CD - Depósito 1 - Estoques >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmWebServiceLinx.AcertaSaldo_CD_Deposito1;
Var
  MySql: String;
  i: Integer;
Begin
  // Verifica se Transação esta Ativa
  If DMLinxWebService.SQLC.InTransaction Then
   DMLinxWebService.SQLC.Rollback(TD);

  // Busca Saldo do Local de Estoque - 1 =======================================
  MySql:=' SELECT i.cod_produto, i.quantidade'+
         ' FROM LINXPRODUTOSINVENTARIO i'+
         ' WHERE i.cod_deposito=1'+
         ' AND   i.empresa='+sgCodLojaLinx+
         ' ORDER BY 1';
  DMLinxWebService.SQLQ_Busca.Close;
  DMLinxWebService.SQLQ_Busca.SQL.Clear;
  DMLinxWebService.SQLQ_Busca.SQL.Add(MySql);
  DMLinxWebService.SQLQ_Busca.Open;

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMLinxWebService.SQLC.StartTransaction(TD);
  Try // Try da Transação
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Zera Saldos Linx do CD ==================================================
    MySql:=' UPDATE LINXPRODUTOSDETALHES d'+
           ' SET d.quantidade=0.0000'+
           ' WHERE d.empresa='+sgCodLojaLinx+
           ' AND   d.quantidade<>0';
    DMLinxWebService.SQLC.Execute(MySql,nil,nil);

    // Atualiza Saldo Linx do Cd Conforme Local de Estoque - 1 =================
    DMLinxWebService.SQLQ_Busca.DisableControls;
    While not DMLinxWebService.SQLQ_Busca.Eof do
    Begin
      // Atualiza Saldo no CD ==================================================
      MySql:=' UPDATE LINXPRODUTOSDETALHES d'+
             ' SET d.quantidade='+DMLinxWebService.SQLQ_Busca.FieldByName('Quantidade').AsString+
             ' WHERE d.empresa='+sgCodLojaLinx+
             ' AND   d.cod_produto='+DMLinxWebService.SQLQ_Busca.FieldByName('Cod_Produto').AsString;
      DMLinxWebService.SQLC.Execute(MySql,nil,nil);

      Inc(i);

      if i mod 500 = 0 Then
      Begin
        DMLinxWebService.SQLC.Commit(TD);
        DMLinxWebService.SQLC.StartTransaction(TD);
      End;

      DMLinxWebService.SQLQ_Busca.Next;
    End; // While not DMLinxWebService.SQLQ_Busca.Eof do
    DMLinxWebService.SQLQ_Busca.EnableControls;
    DMLinxWebService.SQLQ_Busca.Close;

    // Atualiza Transacao ======================================================
    DMLinxWebService.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMLinxWebService.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      DMLinxWebService.SQLQ_Busca.EnableControls;
      DMLinxWebService.SQLQ_Busca.Close;
    End; // on e : Exception do
  End; // Try da Transação
End; // Acerta Estoque no CD - Depósito 1 - Estoques >>>>>>>>>>>>>>>>>>>>>>>>>>>

// OdirAqui -Não Utilizado Mais - Agora o Saldo CD é Direto do Local 1 >>>>>>>>>
// Acerta Estoque no CD - Depósito 9 - Depósito 09 | Devolução >>>>>>>>>>>>>>>>>
Procedure TFrmWebServiceLinx.AcertaSaldo_Deposito9;
Var
  MySql: String;

  bBuscaMovCD: Boolean;
  sCodLoja: String;
  i, iSaldoAtual: Integer;
Begin
  // Busca Deposito 9 - Depósito 09 | Devolução da Loja Em Seleção =============
  MySql:=' SELECT i.cod_produto, i.quantidade'+
         ' FROM LINXPRODUTOSINVENTARIO i'+
         ' WHERE i.cod_deposito=9'+
         ' AND   i.empresa='+sgCodLojaLinx;
  DMLinxWebService.SQLQ_Busca.Close;
  DMLinxWebService.SQLQ_Busca.SQL.Clear;
  DMLinxWebService.SQLQ_Busca.SQL.Add(MySql);
  DMLinxWebService.SQLQ_Busca.Open;

  bBuscaMovCD:=False;
  If (DMLinxWebService.SQLQ_Busca.IsEmpty) And (sgCodLojaLinx<>'2') Then
  Begin
    DMLinxWebService.SQLQ_Busca.Close;
    Exit;
  End;

  If (DMLinxWebService.SQLQ_Busca.IsEmpty) And (sgCodLojaLinx='2') Then
  Begin
    DMLinxWebService.SQLQ_Busca.Close;
    bBuscaMovCD:=True;
  End;

  If bBuscaMovCD Then
  Begin
    // Busca Saldo do Depósito 09 | Devolução ====================================
    sCodLoja:='2';
    MySql:=' SELECT m.cod_produto,'+
           ' CAST(SUM(COALESCE(decode(m.operacao,''E'',m.quantidade,''DS'',m.quantidade),0))'+
           '      -'+ // Menos
           '      SUM(COALESCE(decode(m.operacao,''S'',m.quantidade,''DE'',m.quantidade,0),0))'+
           ' AS INTEGER) Qtd_Deposito'+

           ' FROM LINXMOVIMENTO m'+
           ' WHERE m.deposito IS NOT NULL'+
           ' AND m.excluido=''N'''+
           ' AND m.cancelado=''N'''+
           ' AND m.empresa='+sCodLoja+
           ' AND TRIM(SUBSTRING(TRIM(m.deposito) FROM 1 FOR 2)) = ''9'''+
           ' GROUP BY 1'+
           ' HAVING CAST(SUM(COALESCE(DECODE(m.operacao,''E'',m.quantidade,''DS'',m.quantidade),0))'+
           '             -'+
           '             SUM(COALESCE(DECODE(m.operacao,''S'',m.quantidade,''DE'',m.quantidade,0),0))'+
           '        AS INTEGER) <> 0';
    DMLinxWebService.SQLQ_Busca.Close;
    DMLinxWebService.SQLQ_Busca.SQL.Clear;
    DMLinxWebService.SQLQ_Busca.SQL.Add(MySql);
    DMLinxWebService.SQLQ_Busca.Open;
  End; // If bBuscaMovCD Then

  // Verifica se Transação esta Ativa
  If DMLinxWebService.SQLC.InTransaction Then
   DMLinxWebService.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMLinxWebService.SQLC.StartTransaction(TD);
  Try // Try da Transação
    DateSeparator:='.';
    DecimalSeparator:='.';

    i:=0;
    DMLinxWebService.SQLQ_Busca.DisableControls;
    While not DMLinxWebService.SQLQ_Busca.Eof do
    Begin
      If bBuscaMovCD Then
      Begin
        // Busca Saldo atual do produto
        MySql:=' SELECT CAST(COALESCE(d.quantidade,0) AS INTEGER) SaldoAtual'+
               ' FROM LINXPRODUTOSDETALHES d'+
               ' WHERE d.empresa='+sCodLoja+
               ' AND   d.cod_produto='+DMLinxWebService.SQLQ_Busca.FieldByName('Cod_Produto').AsString;
        DMLinxWebService.CDS_BuscaRapida.Close;
        DMLinxWebService.SDS_BuscaRapida.CommandText:=MySql;
        DMLinxWebService.CDS_BuscaRapida.Open;

        iSaldoAtual:=DMLinxWebService.CDS_BuscaRapida.FieldByName('SaldoAtual').AsInteger;
        If iSaldoAtual >= DMLinxWebService.SQLQ_Busca.FieldByName('Qtd_Deposito').AsInteger Then
         iSaldoAtual:=DMLinxWebService.SQLQ_Busca.FieldByName('Qtd_Deposito').AsInteger;

        DMLinxWebService.CDS_BuscaRapida.Close;
      End; // If bBuscaMovCD Then

      If Not bBuscaMovCD Then
      Begin
        sCodLoja:=sgCodLojaLinx;
        iSaldoAtual:=DMLinxWebService.SQLQ_Busca.FieldByName('Quantidade').AsInteger;
      End; // bBuscaMovCD

      // Atualiza Saldo no CD ==================================================
      MySql:=' UPDATE LINXPRODUTOSDETALHES d'+
             ' SET d.quantidade=d.quantidade-('+IntToStr(iSaldoAtual)+')'+
             ' WHERE d.empresa='+sCodLoja+
             ' AND   d.cod_produto='+DMLinxWebService.SQLQ_Busca.FieldByName('Cod_Produto').AsString;
      DMLinxWebService.SQLC.Execute(MySql,nil,nil);

      Inc(i);

      if i mod 500 = 0 Then
      Begin
        DMLinxWebService.SQLC.Commit(TD);
        DMLinxWebService.SQLC.StartTransaction(TD);
      End;

      DMLinxWebService.SQLQ_Busca.Next;
    End; // While not DMLinxWebService.SQLQ_Busca.Eof do
    DMLinxWebService.SQLQ_Busca.EnableControls;
    DMLinxWebService.SQLQ_Busca.Close;

    // Atualiza Transacao ======================================================
    DMLinxWebService.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMLinxWebService.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      DMLinxWebService.SQLQ_Busca.EnableControls;
      DMLinxWebService.SQLQ_Busca.Close;
    End; // on e : Exception do
  End; // Try da Transação

End; // Acerta Estoque no CD - Depósito 9 - Depósito 09 | Devolução >>>>>>>>>>>>

// Le Retorno e Salva no Banco de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmWebServiceLinx.LeMetodoXMLRetorno;
Var
  MySql, MySqlDelete: String;

  sObs, sMensagem, sCampoDta, sConteudoCampo,
  sDtaAtual, sHraAtual,
  sDtaIniDelete, sDtaFimDelete: String;

  iii, ii, i: Integer;

  DOC:IXMLDocument;

  Note_Response, Node_Campos, Node_Valores: IXMLNode;

  tgCamposBD: TStringList;
Begin

  // Guarda Data e Hora do Dia =================================================
  sDtaAtual:=DateToStr(DataHoraServidorFI(DMLinxWebService.SDS_DtaHoraServidor));
  sDtaAtual:=f_Troca('/','.',f_Troca('-','.',sDtaAtual));
  sHraAtual:=TimeToStr(DataHoraServidorFI(DMLinxWebService.SDS_DtaHoraServidor));

  sDtaIniDelete:='';
  If sgDtaInicio<>'NULL' Then
   sDtaIniDelete:=Copy(sgDtaInicio,9,2)+'.'+Copy(sgDtaInicio,6,2)+'.'+Copy(sgDtaInicio,1,4);

  sDtaFimDelete:='';
  If sgDtaFim<>'NULL' Then
   sDtaFimDelete:=Copy(sgDtaFim,9,2)+'.'+Copy(sgDtaFim,6,2)+'.'+Copy(sgDtaFim,1,4);

  // Verifica se Transação esta Ativa
  If DMLinxWebService.SQLC.InTransaction Then
   DMLinxWebService.SQLC.Rollback(TD);

  tgCamposBD:=TStringList.Create;

  // Inicializa Retorno do Metodo ==============================================
  //aquiodir
   DOC:=LoadXMLDocument(sgPastaRetornos+sgArqXMLRet);
  //DOC:=LoadXMLDocument(sgPastaRetornos+'Retorno_LinxClientesFornec_Copia.XML');

  // Verifica se Erro Com Erro =================================================
  If DOC.ChildNodes.Nodes['Microvix'].ChildNodes['ResponseResult'].ChildNodes['ResponseSuccess'].Text='False' Then
  Begin
    SalvaProcessamento('=====================================');
    SalvaProcessamento('Loja Linx: '+sgCodLojaLinx+' Metodo: '+sgMetodo+' Resposta Negativa !!');

    sMensagem:='';
    For i:=0 to DOC.ChildNodes.Nodes['Microvix'].ChildNodes['ResponseResult'].ChildNodes['ResponseError'].ChildNodes.Count-1 do
    Begin
      If DOC.ChildNodes.Nodes['Microvix'].ChildNodes['ResponseResult'].ChildNodes['ResponseError'].ChildNodes[i].NodeName='Message' Then
      Begin
        sMensagem:=Trim(sMensagem+' '+DOC.ChildNodes.Nodes['Microvix'].ChildNodes['ResponseResult'].ChildNodes['ResponseError'].ChildNodes[i].NodeValue);
      End;
    End; // For i:=0 to DOC.ChildNodes.Nodes['Microvix'].ChildNodes['ResponseResult'].ChildNodes['ResponseError'].ChildNodes.Count-1 do

    SalvaProcessamento(sgMetodo+': '+sMensagem);
    SalvaProcessamento('=====================================');
    Exit;
  End; // If DOC.ChildNodes.Nodes['Microvix'].ChildNodes['ResponseResult'].ChildNodes['ResponseSuccess'].Text='False' Then

  // Le XML de Retorno e Atualiza Banco de Dados ===============================
  For i:=0 to DOC.ChildNodes.Nodes['Microvix'].ChildNodes.Count-1 do
  Begin
    Note_Response := DOC.ChildNodes.Nodes['Microvix'].ChildNodes[i];

    If Note_Response.NodeName = 'ResponseData' Then
    Begin
      // Busca Campos da Tabela para Comparações ===============================
      MySql:=' SELECT DISTINCT UPPER(TRIM(c.rdb$field_name)) Campo'+
             ' FROM RDB$RELATION_FIELDS c';

             If Trim(sgMetodoNomeTabela)<>'' Then
              MySql:=
               MySql+' WHERE UPPER(c.rdb$relation_name)='+QuotedStr(AnsiUpperCase(sgMetodoNomeTabela))
             Else
              MySql:=
               MySql+' WHERE UPPER(c.rdb$relation_name)='+QuotedStr(AnsiUpperCase(sgMetodo));

      MySql:=
       MySql+' ORDER BY c.rdb$field_position';
      DMLinxWebService.CDS_Busca.Close;
      DMLinxWebService.SDS_Busca.CommandText:=MySql;
      DMLinxWebService.CDS_Busca.Open;

      // ------------------------------------------------------------
      // Monta Inicio Sql -------------------------------------------
      // ------------------------------------------------------------

      // Se é Somente Insert Com Nome do Metodo Diferente do Nome da Tabela
      If (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxSangriaSuprimentos')) And (Trim(sgMetodoNomeTabela)<>'') Then
       sSqlUpInCampos:=' INSERT INTO '+sgMetodoNomeTabela+' ('+
                       DMLinxWebService.CDS_Busca.FieldByName('Campo').AsString
      // Se é Somente Insert Com Nome do Metodo Igual ao Nome da Tabela
      Else If (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxSangriaSuprimentos')) And (Trim(sgMetodoNomeTabela)='') Then
       sSqlUpInCampos:=' INSERT INTO '+sgMetodo+' ('+
                       DMLinxWebService.CDS_Busca.FieldByName('Campo').AsString
      // Se Nome do Metodo Diferente do Nome da Tabela
      Else If Trim(sgMetodoNomeTabela)<>'' Then
       sSqlUpInCampos:=' UPDATE OR INSERT INTO '+sgMetodoNomeTabela+' ('+
                       DMLinxWebService.CDS_Busca.FieldByName('Campo').AsString
      // Normal: Se Nome do Metodo é Igual ao Nome da Tabela
      Else
       sSqlUpInCampos:=' UPDATE OR INSERT INTO '+sgMetodo+' ('+
                       DMLinxWebService.CDS_Busca.FieldByName('Campo').AsString;

      tgCamposBD.Clear;
      While Not DMLinxWebService.CDS_Busca.Eof do
      Begin
         If DMLinxWebService.CDS_Busca.RecNo<>1 Then
          sSqlUpInCampos:=
           sSqlUpInCampos+', '+DMLinxWebService.CDS_Busca.FieldByName('Campo').AsString;

        //======================================================================
        // Campo Com Nome Alterado =============================================
        //======================================================================
        If AnsiUpperCase(Trim(DMLinxWebService.CDS_Busca.FieldByName('Campo').AsString))='ALIQ_INTERNA_UF_DEST' Then // LinxConfiguracoesTributariasDetalhes
         tgCamposBD.Add('PERC_ALIQUOTA_INTERNA_UF_DESTINATARIO')

        Else If AnsiUpperCase(Trim(DMLinxWebService.CDS_Busca.FieldByName('Campo').AsString))='ALIQ_INTERESTADUAL_UF_ENV' Then // LinxConfiguracoesTributariasDetalhes
         tgCamposBD.Add('PERC_ALIQUOTA_INTERESTADUAL_UF_ENVOLVIDAS')

        Else // Sem Alteração de Nome
         tgCamposBD.Add(Trim(DMLinxWebService.CDS_Busca.FieldByName('Campo').AsString));
        // Campo Com Nome Alterado =============================================
        //======================================================================

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

//odirAqui 3 - Campo "EMPRESA Colocado Pelo Odir" COM Campo "Portal"
//           - ATENÇÃO:
//                 - Com o parentes Final. Todos com 2 e no Final com 3.
//                 - "Or" em todos no Último "AND"
          // Considera Campo "Empresa (ODIR)" COM Campo "Portal" das TABELAS ==========
          If ((AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxFaturas'))                            Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimento'))                          Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoTrocas'))                    Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxVendedores'))                         Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoPlanos'))                    Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoSerial'))                    Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoOrigemDevolucoes'))          Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoAcoesPromocionais'))         Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxAcoesPromocionais'))                  Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxLancContabil'))                       Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxPedidosVenda'))                       Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxPedidosCompra'))                      Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosDetalhes'))                   Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxPlanosPedidoVenda'))                  Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosInventario'))                 Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxConfiguracoesTributarias'))           Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxConfiguracoesTributariasDetalhes'))   Or
              (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxSangriaSuprimentos')))               And
              (ii>0) Then
           iii:=iii+1;

          // OdirAqui (Não Apagar)
          // Verifica Conteúdo de Retorno do Campos
          // sConteudoCampo:=Trim(Node_Campos.ChildNodes[ii].NodeValue);

//odirAqui 4 - Campo "Empresa" SEM Campo "Portal"
          // Considera Campo "Empresa" SEM Campo "Portal" das TABELAS ==========
          If ((AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxGrupoLojas'))) Then
           iii:=iii+1;

          If AnsiUpperCase(Trim(Node_Campos.ChildNodes[ii].NodeValue))<>AnsiUpperCase(tgCamposBD[iii]) Then
          Begin
            SalvaProcessamento('=====================================');
            SalvaProcessamento(sgMetodo+' Campos em Divergencia !!');
            FreeAndNil(tgCamposBD);
            Exit;
          End; // If Trim(Node_Campos.ChildNodes[ii].NodeValue)<>tgCamposBD[ii] Then
        End; // for ii := 0 to Node_Campos.ChildNodes.Count-1 do
      End; // If Assigned(Node_Campos) Then
      FreeAndNil(tgCamposBD);

      // Monta Transacao =======================================================
      TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
      TD.IsolationLevel:=xilREADCOMMITTED;
      DMLinxWebService.SQLC.StartTransaction(TD);
      Try // Try da Transação //////////////////////////////////////////////////
        DateSeparator:='.';
        DecimalSeparator:='.';
        sObs:='';

        // odiraqui 9 -
        // =====================================================================
        // Exclui Registros da Tabela antes do UPDATE OR INSERT Statements
        // =====================================================================
        // LinxSangriaSuprimentos -----------------------------
        If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxSangriaSuprimentos') Then
        Begin
          MySqlDelete:=' DELETE FROM LINXSANGRIASUPRIMENTOS s'+
                       ' WHERE s.empresa='+sgCodLojaLinx;

                       If (Trim(sDtaIniDelete)<>'') And (Trim(sDtaFimDelete)='') Then
                        MySqlDelete:=
                         MySqlDelete+' AND s.data>='+QuotedStr(sDtaIniDelete);

                       If (Trim(sDtaIniDelete)<>'') And (Trim(sDtaFimDelete)<>'') Then
                        MySqlDelete:=
                         MySqlDelete+' AND s.data BETWEEN '+QuotedStr(sDtaIniDelete)+ ' AND '+QuotedStr(sDtaFimDelete);

          If (Trim(sDtaIniDelete)<>'') Or (Trim(sDtaFimDelete)<>'') Then
           DMLinxWebService.SQLC.Execute(MySqlDelete, nil, nil);
          MySqlDelete:='';
        End; // If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxSangriaSuprimentos') Then
        // Exclui Registros da Tabela antes do UPDATE OR INSERT Statements
        // =====================================================================

        // Le Valores dos Campos = Node "R" ====================================
        For iii:=0 to Note_Response.ChildNodes.Count - 1 do // Node "C"
        Begin
          Node_Valores := Note_Response.ChildNodes[iii]; // Node "R"

          // Se Node de Registro - Node "R" ====================================
          If VarToStr(Node_Valores.NodeName)='R' Then // Node "R"
          Begin
            // Inicia sSqlUpInCampos --------------------------------
            sSqlUpInValores:=' VALUES (';

            If Assigned(Node_Valores) Then // Libera Node "R" Para Leitura
            Begin
              For ii:=0 to Node_Valores.ChildNodes.Count-1 do // Le Node "R"
              Begin
                sCampoDta:='';

//odiraqui 5 - Campo "EMPRESA Colocado Pelo Odir"
//           - ATENÇÃO:
//                 - Com o parentes Final. Todos com 2 e no Final com 3.
//                 - "Or" em todos no Último "AND"
                // Considera Campo "Empresa" das TABELAS ------------
                If ((AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxFaturas'))                              Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimento'))                            Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoTrocas'))                      Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxVendedores'))                           Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxGrupoLojas'))                           Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoSerial'))                      Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoPlanos'))                      Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoOrigemDevolucoes'))            Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoAcoesPromocionais'))           Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxAcoesPromocionais'))                    Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxLancContabil'))                         Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxPedidosVenda'))                         Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxPedidosCompra'))                        Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosDetalhes'))                     Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxPlanosPedidoVenda'))                    Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosInventario'))                   Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxConfiguracoesTributarias'))             Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxConfiguracoesTributariasDetalhes'))     Or
                    (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxSangriaSuprimentos')))                 And
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
                   // Campo Data Invertida
                   If ((Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),5,1)='-') And
                       (Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),8,1)='-')) Or
                      ((Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),5,1)='/') And
                       (Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),8,1)='/')) Then
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

                   // Campo Data Normal
                   If ((Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),3,1)='-') And
                       (Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),6,1)='-')) Or
                      ((Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),3,1)='/') And
                       (Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),6,1)='/')) Then
                   Begin
                     sCampoDta:=Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),1,2)+'.'+
                                Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),4,2)+'.'+
                                Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),7,4);

                     Try
                       StrToDate(sCampoDta);
                     Except
                       sCampoDta:='';
                     End
                   End; // If (Copy(Trim(Node_Valores.ChildNodes[ii].NodeValue),5,1)='-') And ....

                   //===========================================================
                   // If Trim(sCampoDta)<>'' Then ==============================
                   //===========================================================
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

                      // Método LinxSangriaSuprimentos: Acerta Campo CONFERIDO False/True para 0/1
                      If (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxSangriaSuprimentos')) And (ii=7) Then
                       Begin
                         If AnsiUpperCase(sConteudoCampo)='FALSE' Then
                          sSqlUpInValores:=
                           sSqlUpInValores+'0, '
                         Else If AnsiUpperCase(sConteudoCampo)='TRUE' Then
                          sSqlUpInValores:=
                           sSqlUpInValores+'1, '
                         Else
                          sSqlUpInValores:=
                           sSqlUpInValores+QuotedStr(sConteudoCampo)+', ';
                       End
                      Else // Método LinxProdutosDepositos: Acerta Campo DISPONIVEL / DISPONIVEL_TRANSFERENCIA False/True para 0/1
                       If (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosDepositos')) And ((ii=3) or (ii=4)) Then
                        Begin
                          If AnsiUpperCase(sConteudoCampo)='FALSE' Then
                           sSqlUpInValores:=
                            sSqlUpInValores+'0, '
                          Else If AnsiUpperCase(sConteudoCampo)='TRUE' Then
                           sSqlUpInValores:=
                            sSqlUpInValores+'1, '
                          Else
                           sSqlUpInValores:=
                            sSqlUpInValores+QuotedStr(sConteudoCampo)+', ';
                        End
                      Else // Método LinxConfiguracoesTributariasDetalhes Acerta Campo ICMS_CREDITO / IPI_CREDITO False/True para 0/1
                       If (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxConfiguracoesTributariasDetalhes')) And
                          ((ii=28) or (ii=29) or (ii=36) or (ii=37)) Then
                        Begin
                          If AnsiUpperCase(sConteudoCampo)='FALSE' Then
                           sSqlUpInValores:=
                            sSqlUpInValores+'0, '
                          Else If AnsiUpperCase(sConteudoCampo)='TRUE' Then
                           sSqlUpInValores:=
                            sSqlUpInValores+'1, '
                          Else If AnsiUpperCase(sConteudoCampo)='PERCENTUAL' Then
                           sSqlUpInValores:=
                            sSqlUpInValores+'NULL, '
                          Else
                           sSqlUpInValores:=
                            sSqlUpInValores+QuotedStr(sConteudoCampo)+', ';
                        End

                      Else // Apropria Resto dos Campos
                       Begin
                        sSqlUpInValores:=
                         sSqlUpInValores+QuotedStr(sConteudoCampo)+', ';
                       End;

                    End; // If Trim(sCampoDta)<>'' Then
                    // If Trim(sCampoDta)<>'' Then =============================
                    //==========================================================
                 End; // if VarIsNull(Node_Valores.ChildNodes[ii].NodeValue) Then
              End; // For ii:=0 to Node_Valores.ChildNodes.Count-1 do // Le Node "R"

              // Termina de Montar sSqlUpInValores =============================

//odiraqui 6 - Campo "COD_LOJA do SIDICOM"
              // Considera Campo "Cod_Loja do SIDICOM" das TABELAS ------------
              If (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxFaturas'))                                 Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxGrupoLojas'))                              Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxLojas'))                                   Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoTrocas'))                         Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoOrigemDevolucoes'))               Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoSerial'))                         Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoPlanos'))                         Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxVendedores'))                              Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimento'))                               Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoAcoesPromocionais'))              Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxAcoesPromocionais'))                       Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxLancContabil'))                            Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxPedidosVenda'))                            Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxPedidosCompra'))                           Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxReducoesZ'))                               Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosDetalhes'))                        Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxPlanosPedidoVenda'))                       Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosInventario'))                      Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxConfiguracoesTributarias'))                Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxConfiguracoesTributariasDetalhes'))        Or
                 (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxSangriaSuprimentos'))                      Then
               Begin
                 sSqlUpInValores:=
                  sSqlUpInValores+' '+QuotedStr(sgCodLoja)+', '+QuotedStr(sDtaAtual)+', '+QuotedStr(sHraAtual)+')';
               End
              Else
               Begin
                 sSqlUpInValores:=
                  sSqlUpInValores+' '+QuotedStr(sDtaAtual)+', '+QuotedStr(sHraAtual)+')';
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
                sSqlUpInValores+' MATCHING (empresa, cnpj_emp, identificador, num_vale,'+
                                '           doc_origem, serie_origem, doc_venda, serie_venda)';

              // LinxMovimentoPlanos --------------------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxMovimentoPlanos') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (empresa, cnpj_emp, identificador)';

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
                sSqlUpInValores+' MATCHING (empresa, transacao, documento)';

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

              // LinxClientesFornecCamposAdicionais -----------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxClientesFornecCamposAdicionais') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (cod_cliente, campo)';

              // LinxProdutosCamposAdicionais -----------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosCamposAdicionais') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (cod_produto, campo)';

              // LinxPlanos -----------------------------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxPlanos') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (plano)';

              // LinxPlanosPedidoVenda ------------------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxPlanosPedidoVenda') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (empresa, cnpj_emp, cod_pedido, plano)';

              // LinxProdutosDepositos ------------------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosDepositos') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (cod_deposito)';

              // LinxProdutosInventario -----------------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosInventario') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (empresa, cnpj_emp, cod_produto, cod_barra, cod_deposito)';

              // LinxConfiguracoesTributarias -----------------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxConfiguracoesTributarias') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (empresa, cnpj_emp, id_config_tributaria)';

              // LinxConfiguracoesTributariasDetalhes ---------------
              If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxConfiguracoesTributariasDetalhes') Then
               sSqlUpInValores:=
                sSqlUpInValores+' MATCHING (empresa, cnpj_emp, id_config_tributaria, desc_classe_fiscal, cod_natureza_operacao)';

              // SQL Com Insert Direto ------------------------------
              // LinxSangriaSuprimentos

              // Executa Sql Update/Insert --------------------------
              MySql:=sSqlUpInCampos+sSqlUpInValores;
              MySql:=F_Troca(#$A#$A, ' ', MySql);
              MySql:=F_Troca(#$A, ' ', MySql);

              // ===============================================================
// odiraqui 10 - Executa o UPDATE OR INSERT Statements
              // ===============================================================
              DMLinxWebService.SQLC.Execute(MySql, nil, nil);
            End; // If Assigned(Node_Valores) Then // Libera Node "R" Para Leitura
          End; // If VarToStr(Node_Valores.NodeName)='R' Then // Node "R"
        End; // For iii:=0 to Note_Response.ChildNodes.Count - 1 do // Node "C"

        //======================================================================
        // Acerta LinxProduto.COD_AUXILIAR para 6 Caracteres (SIDICOM) =========
        //======================================================================
        If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutos') Then
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
        End; // If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutos') Then
        // Acerta LinxProduto.COD_AUXILIAR para 6 Caracteres (SIDICOM) =========
        //======================================================================

        //======================================================================
        // Atualiza Tabela LinxProdutoDetalhes com Produto Sem Saldo ===========
        //======================================================================
        If (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosDetalhes')) Then
        Begin
          sOBS:='ERRO em Atualiza Tabela LinxProdutoDetalhes Zera Produto Sem Saldo';

          MySql:=' UPDATE LINXPRODUTOSDETALHES d'+
                 ' SET d.quantidade=0.0000'+
                 ' WHERE d.dta_atualizacao<>'+QuotedStr(sDtaAtual)+
                 ' AND d.quantidade<>0.000'+
                 ' AND d.empresa='+sgCodLojaLinx;

                 If (Trim(sgCodProduto)<>'') And (Trim(sgCodProduto)<>'NULL') Then
                 Begin
                   MySql:=
                    MySql+' AND   d.cod_produto='+sgCodProduto;
                 End; // If (Trim(sgCodProduto)<>'') And (Trim(sgCodProduto)<>'NULL') Then

                 If (Trim(sgReferenciaProd)<>'') And (Trim(sgReferenciaProd)<>'NULL') Then
                 Begin
                   MySql:=
                    MySql+' AND EXISTS (SELECT 1'+
                          '             FROM LINXPRODUTOS p'+
                          '             WHERE p.cod_produto=d.cod_produto'+
                          '             AND   p.referencia='+Trim(sgReferenciaProd)+')';
                 End; // If (Trim(sgReferenciaProd)<>'') And (Trim(sgReferenciaProd)<>'NULL') Then
          DMLinxWebService.SQLC.Execute(MySql, nil, nil);

          sOBS:='ERRO em Atualiza Tabela LinxProdutoDetalhes com Produto Sem Saldo';

          MySql:=' INSERT INTO LINXPRODUTOSDETALHES'+
                 ' (PORTAL, EMPRESA, CNPJ_EMP, COD_PRODUTO, COD_BARRA, QUANTIDADE,'+
                 '  PRECO_CUSTO, PRECO_VENDA, CUSTO_MEDIO, ID_CONFIG_TRIBUTARIA,'+
                 '  DESC_CONFIG_TRIBUTARIA, DESPESAS1, COD_LOJA, DTA_ATUALIZACAO,'+
                 ' HRA_ATUALIZACAO)'+

                 ' SELECT'+
                 ' lp.portal,'+
                 sgCodLojaLinx+' EMPRESA,'+ // CODIGO EMPRESA MICROVIX
                 QuotedStr(sgCNPJProc)+' CNPJ_EMP,'+ // CNPJ DA EMPRESA
                 ' LP.cod_produto COD_PRODUTO, LP.cod_barra COD_BARRA,'+
                 ' 0.0000 QUANTIDADE, 0.0000 PRECO_CUSTO, 0.0000 PRECO_VENDA, 0.0000 CUSTO_MEDIO,'+
                 ' NULL ID_CONFIG_TRIBUTARIA, NULL DESC_CONFIG_TRIBUTARIA, 0 DESPESAS1,'+
                 QuotedStr(sgCodLoja)+' COD_LOJA, '+ // CODIGO EMPRESA SIDICOM
                 QuotedStr(sDtaAtual)+' DTA_ATUALIZACAO, '+
                 QuotedStr(sHraAtual)+' HRA_ATUALIZACAO'+

                 ' FROM LINXPRODUTOS lp'+
                 ' WHERE NOT EXISTS (SELECT 1'+
                 '                   FROM LINXPRODUTOSDETALHES lpd'+
                 '                   WHERE lpd.cod_produto=lp.cod_produto'+
                 '                   AND   lpd.empresa='+sgCodLojaLinx+')'; // CODIGO EMPRESA MICROVIX
          DMLinxWebService.SQLC.Execute(MySql, nil, nil);
          sOBS:='';
        End; // If (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosDetalhes')) Then
        // Atualiza Tabela LinxProdutoDetalhes com Produto Sem Saldo ===========
        //======================================================================

        //======================================================================
        // Exclui Estoque de Depósito Anteriores ===============================
        //======================================================================
        If AnsiUpperCase(Trim(sgMetodo))=AnsiUpperCase('LinxProdutosInventario') Then
        Begin
          MySql:=' DELETE FROM LINXPRODUTOSINVENTARIO li'+
                 ' WHERE li.dta_atualizacao<>'+QuotedStr(sDtaAtual)+
                 ' AND   li.empresa='+sgCodLojaLinx;

                 If (Trim(sgCodProduto)<>'') And (Trim(sgCodProduto)<>'NULL') Then
                 Begin
                   MySql:=
                    MySql+' AND   li.cod_produto='+sgCodProduto;
                 End; // If (Trim(sgCodProduto)<>'') And (Trim(sgCodProduto)<>'NULL') Then

                 If (Trim(sgCodQualquer)<>'') And (Trim(sgCodQualquer)<>'NULL') Then
                 Begin
                   MySql:=
                    MySql+' AND li.cod_deposito='+sgCodQualquer;
                 End; // If (Trim(sgCodQualquer)<>'') And (Trim(sgCodQualquer)<>'NULL') Then

                 If (Trim(sgReferenciaProd)<>'') And (Trim(sgReferenciaProd)<>'NULL') Then
                 Begin
                   MySql:=
                    MySql+' AND EXISTS (SELECT 1'+
                          '             FROM LINXPRODUTOS p'+
                          '             WHERE p.cod_produto=li.cod_produto'+
                          '             AND   p.referencia='+Trim(sgReferenciaProd)+')';
                 End; // If (Trim(sgReferenciaProd)<>'') And (Trim(sgReferenciaProd)<>'NULL') Then
          DMLinxWebService.SQLC.Execute(MySql, nil, nil);
        End; // If AnsiUpperCase(Trim(sgMetodo))=AnsiUpperCase('LinxProdutosInventario') Then
        // Exclui Estoque de Depósito Anteriores ===============================
        //======================================================================

        //======================================================================
        // Exclui Codigos de Barras que Sobraram ===============================
        //======================================================================
        If (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosCodBar')) And
           ((Trim(sgCodProduto)='') or (Trim(sgCodProduto)='NULL')) Then
        Begin
          MySql:=' DELETE FROM LINXPRODUTOSCODBAR cb'+
                 ' WHERE cb.dta_atualizacao<>'+QuotedStr(sDtaAtual);
          DMLinxWebService.SQLC.Execute(MySql, nil, nil);
        End; // If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosCodBar') Then
        // Exclui Codigos de Barras que Sobraram ===============================
        //======================================================================

        //======================================================================
        // Coloca Código <Zero> 0 para Código de Histórico NULL na SANGRIA =====
        //======================================================================
        If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxSangriaSuprimentos') Then
        Begin
          MySql:=' UPDATE LINXSANGRIASUPRIMENTOS s'+
                 ' SET s.cod_historico=0'+
                 ' WHERE s.cod_historico IS NULL';
          DMLinxWebService.SQLC.Execute(MySql, nil, nil);
        End; // If AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxSangriaSuprimentos') Then

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
           SalvaProcessamento('Loja: '+sgCodLojaLinx+' - Metodo: '+sgMetodo+'(Último Erro): '+sMensagem);

          SalvaProcessamento('Loja......: '+sgCodLojaLinx+cr+
                             'Metodo....: '+sgMetodo+cr+
                             'Registro..: '+IntToStr(ii)+cr+
                             'Erro DML..: '+e.message+cr+
                             'Script SQL: '+MySql);

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

  wDia, wMes, wAno: Word;
Begin
  // odirOPSS - odirteste
  // ShowMessage('Odir 7 Post '+sgMetodo);

  // ===========================================================================
  // Se Recebe do Parametros Período Acerta Datas ==============================
  // ===========================================================================
  If Trim(sgParametroDtaInicio)<>'' Then
  Begin
    DecodeDate(StrToDate(sgParametroDtaInicio), wAno, wMes, wDia);
    sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);
  End;

  If Trim(sgParametroDtaFim)<>'' Then
  Begin
    DecodeDate(StrToDate(sgParametroDtaFim), wAno, wMes, wDia);
    sgDtaFim:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);
  End;
  // Se Recebe do Parametros Período Acerta Datas ==============================
  // ===========================================================================

  // ===========================================================================
  // Gera Arquivo XML para POST ================================================
  // ===========================================================================
  sArq:=sgPastaMetodos+sgMetodo+'.XML';
  // Gera Arquivo XML para POST ================================================
  // ===========================================================================

  // ===========================================================================
  // Exclui Arquivos Existentes ================================================
  // ===========================================================================
  DeleteFile(sArq);
  DeleteFile(sgPastaRetornos+sgArqXMLRet);
  // Exclui Arquivos Existentes ================================================
  // ===========================================================================

  // ===========================================================================
  // Monta Metodos =============================================================
  // ===========================================================================
  AssignFile(txtArq,sArq);
  Rewrite(txtArq);
  // Monta Metodos =============================================================
  // ===========================================================================

  // ===========================================================================
  // Grava Linhas Inicias Padrões ==============================================
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
  // Grava Linhas Inicias Padrões ==============================================
  // ===========================================================================

  // ===========================================================================
  // Cabecalho de Parametro Padrão para Todos os Metodos =======================
  // Parametros:
  // - chave
  // - cnpjEmp
  //
  // Menos para os Metodos:
  //-----------------------
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
  End; // If (sgMetodo<>'LinxMetodos') And (sgMetodo<>'LinxGrupoLojas') Then // Cabecalho de Parametro Padrão
  // ===========================================================================

  // ===========================================================================
  // Parametros:
  // - id_config_tributaria
  //
  // Metodos:
  // --------
  // LinxConfiguracoesTributariasDetalhes
  // ===========================================================================
  If sgMetodo='LinxConfiguracoesTributariasDetalhes' Then // Cabecalho de Parametro
  Begin
    sXML:='			<Parameter id="id_config_tributaria">'+sSetor+'</Parameter>';
    Writeln(txtArq,sXML);
  End; // If sgMetodo='LinxGrupoLojas' Then // Cabecalho de Parametro
  // ===========================================================================

  // ===========================================================================
  // Parametros:
  // - chave
  // - grupo
  //
  // Metodos:
  // --------
  // LinxGrupoLojas
  // ===========================================================================
  If sgMetodo='LinxGrupoLojas' Then // Cabecalho de Parametro
  Begin
    sXML:='		<Parameters>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="chave">'+sgWebServiceChave+'</Parameter>'; // d52511f4-3541-4a65-9adc-665513ea3207
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="grupo">'+QuotedStr(sgWebServiceGrupo)+'</Parameter>'; // Belshop – 8560
    Writeln(txtArq,sXML);
  End; // If sgMetodo='LinxGrupoLojas' Then // Cabecalho de Parametro
  // ===========================================================================

  // ===========================================================================
  // Parametros:
  // - data_upd_inicial
  // - data_upd_fim
  //
  // Metodos:
  // --------
  // LinxVendedores
  // LinxPlanos
  // ===========================================================================
  If (sgMetodo='LinxVendedores') Or (sgMetodo='LinxPlanos')Then
  Begin
    sXML:='			<Parameter id="data_upd_inicial">'+sgDtaInicio+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="data_upd_fim">'+sgDtaFim+'</Parameter>';
    Writeln(txtArq,sXML);

    //====================================
    // PARAMETRO OPCIONAL E NÃO UTILIZADOS
    //====================================
    //       Metodo         Parametro
    //--------------------  --------------
    // LinxVendedores       Cod_Vendedor
    //====================================
  End; // If (sgMetodo='LinxVendedores') Or (sgMetodo='LinxPlanos')Then
  // ===========================================================================

  // ===========================================================================
  // Parametros:
  // - ativa
  // - data_inicial
  // - data_fim
  // - integrada
  //
  // Metodos:
  // --------
  // LinxAcoesPromocionais
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
  // Parametros:
  // - identificador
  // - cnpjPortal
  // - cod_pedido
  // - data_inicial
  // - data_fim
  // - hora_inicial
  // - hora_fim
  // - sSetor
  // - sLinha
  // - data_inventario
  //
  // Metodos:
  // --------
  // LinxMovimento
  // LinxClientesFornec
  // LinxMovimentoTrocas
  // LinxMovimentoOrigemDevolucoes
  // LinxMovimentoSerial
  // LinxMovimentoPlanos
  // LinxMovimentoAcoesPromocionais
  // LinxPedidosVenda
  // LinxPedidosCompra
  // LinxReducoesZ
  // LinxSangriaSuprimentos
  // LinxPlanosPedidoVenda
  // LinxClientesFornecCamposAdicionais
  // ===========================================================================
  If (sgMetodo='LinxClientesFornec')     Or (sgMetodo='LinxMovimento') Or
     (sgMetodo='LinxMovimentoTrocas')    Or (sgMetodo='LinxMovimentoOrigemDevolucoes') Or
     (sgMetodo='LinxMovimentoSerial')    Or (sgMetodo='LinxMovimentoAcoesPromocionais') Or
     (sgMetodo='LinxMovimentoPlanos')    Or (sgMetodo='LinxPedidosVenda') Or
     (sgMetodo='LinxPedidosCompra')      Or (sgMetodo='LinxReducoesZ') Or
     (sgMetodo='LinxSangriaSuprimentos') Or (sgMetodo='LinxPlanosPedidoVenda') Or
     (sgMetodo='LinxClientesFornecCamposAdicionais') Then
  Begin
    //---------------------------------------------------------------
    // Parametros:
    // - identificador
    //
    // Metodos:
    // --------
    // LinxMovimentoTrocas
    // LinxMovimentoOrigemDevolucoes
    // LinxMovimentoSerial
    // LinxMovimentoPlanos
    // LinxMovimentoAcoesPromocionais
    //---------------------------------------------------------------
    If (sgMetodo='LinxMovimentoTrocas') Or (sgMetodo='LinxMovimentoOrigemDevolucoes') Or
       (sgMetodo='LinxMovimentoSerial') Or (sgMetodo='LinxMovimentoAcoesPromocionais') Or
       (sgMetodo='LinxMovimentoPlanos') Then
    Begin
      sXML:='			<Parameter id="identificador">'+'NULL'+'</Parameter>';
      Writeln(txtArq,sXML);
    End; // If (sgMetodo='LinxMovimentoTrocas') Then

    //---------------------------------------------------------------
    // Parametros:
    // - cnpjPortal
    //
    // Metodos:
    // --------
    // LinxReducoesZ
    //---------------------------------------------------------------
    If (sgMetodo='LinxReducoesZ') Then
    Begin
      sXML:='			<Parameter id="cnpjPortal">'+sgCnpjPortal+'</Parameter>';
      Writeln(txtArq,sXML);
    End; // If (sgMetodo='LinxReducoesZ') Then

    //---------------------------------------------------------------
    // Parametros:
    // - cod_pedido
    //
    // Metodos:
    // --------
    // LinxPlanosPedidoVenda
    //---------------------------------------------------------------
    If (sgMetodo='LinxPlanosPedidoVenda') Then
    Begin
      sXML:='			<Parameter id="cod_pedido">'+'NULL'+'</Parameter>';
      Writeln(txtArq,sXML);
    End; // If (sgMetodo='LinxPlanosPedidoVenda') Then

    //---------------------------------------------------------------
    // Parametros:
    // - data_inicial
    // - data_fim
    //
    // Metodos:
    // --------
    // LinxMovimento
    // LinxClientesFornec
    // LinxClientesFornec
    // LinxMovimentoTrocas
    // LinxMovimentoOrigemDevolucoes
    // LinxMovimentoSerial
    // LinxMovimentoPlanos
    // LinxMovimentoAcoesPromocionais
    // LinxPedidosVenda
    // LinxPedidosCompra
    // LinxReducoesZ
    // LinxSangriaSuprimentos
    // LinxPlanosPedidoVenda
    // LinxClientesFornecCamposAdicionais
    //---------------------------------------------------------------

    sXML:='			<Parameter id="data_inicial">'+sgDtaInicio+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="data_fim">'+sgDtaFim+'</Parameter>';
    Writeln(txtArq,sXML);

    //---------------------------------------------------------------
    // Parametros:
    // - hora_inicial
    // - hora_fim
    //
    // Metodos:
    // --------
    // LinxMovimento
    // LinxPedidosVenda
    // LinxPlanosPedidoVenda
    //---------------------------------------------------------------
    If (sgMetodo='LinxMovimento') Or (sgMetodo='LinxPedidosVenda') Or (sgMetodo='LinxPlanosPedidoVenda') Then
    Begin
      sXML:='			<Parameter id="hora_inicial">'+'NULL'+'</Parameter>';
      Writeln(txtArq,sXML);
      sXML:='			<Parameter id="hora_fim">'+'NULL'+'</Parameter>';
      Writeln(txtArq,sXML);
    End; // If (sgMetodo='LinxMovimento') Or (sgMetodo='LinxPedidosVenda') Or (sgMetodo='LinxPlanosPedidoVenda') Then

    //---------------------------------------------------------------
    // Parametros:
    // - operacao
    // - tipo_transacao
    //
    // Metodos:
    // --------
    // LinxMovimento
    //---------------------------------------------------------------
    If (sgMetodo='LinxMovimento') Then
    Begin
      sXML:='			<Parameter id="operacao">'+sSetor+'</Parameter>'; // Variavel sSetor Usada como Variavel operacao
      Writeln(txtArq,sXML);
      sXML:='			<Parameter id="tipo_transacao">'+sLinha+'</Parameter>'; // Variavel sLinha Usada como Variavel tipo_transacao
      Writeln(txtArq,sXML);
    End; // If (sgMetodo='LinxMovimento') Then

    //========================================================
    // PARAMETRO OPCIONAL E NÃO UTILIZADOS
    //=========================================================
    //       Metodo                         Parametro
    //-----------------------------------   --------------
    // LinxClientesFornecCamposAdicionais   cod_cliente
    //==========================================================
  End; // If (sgMetodo='LinxClientesFornec')     Or (sgMetodo='LinxMovimento') Or
  // ===========================================================================

  // ===========================================================================
  // Parametros:
  // - data_inventario
  //
  // Metodos:
  // --------
  // LinxProdutosInventario
  // ===========================================================================
  If (sgMetodo='LinxProdutosInventario') Then
  Begin
    sXML:='			<Parameter id="data_inventario">'+sgDtaInicio+'</Parameter>';
    Writeln(txtArq,sXML);
  End; // If (sgMetodo='LinxProdutosInventario') Then

  // ===========================================================================
  // Parametros:
  // - id_setor
  // - id_linha
  // - id_marca
  // - id_colecao
  //
  // Metodos:
  // --------
  // LinxProdutos
  // LinxProdutosCodBar
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

    //==========================================================================
    // METODO: LinxProdutosCodBar - PARAMETRO OPCIONAL: Cod_Produto (sgCodProduto)
    //==========================================================================
    If (sgMetodo='LinxProdutosCodBar') and (Trim(sgCodProduto)<>'') Then
    Begin
      sXML:='			<Parameter id="cod_produto">'+sgCodProduto+'</Parameter>';
      Writeln(txtArq,sXML);
    End; // If (sgMetodo='LinxProdutosCodBar') and (Trim(sgCodProduto)<>'') Then

  End; // If (sgMetodo='LinxProdutos') Or (sgMetodo='LinxProdutosCodBar') Then

  // ===========================================================================
  // Parametros:
  // - dt_update_inicial
  // - dt_update_inicio
  // - dt_update_fim
  // - cod_produto
  //
  // Metodos:
  // --------
  // LinxProdutos
  // LinxClientesFornec
  // ===========================================================================
  If (sgMetodo='LinxProdutos') Or (sgMetodo='LinxClientesFornec') Then
  Begin
    // Metodo LinxProdutos ------------------------------------------
    If (sgMetodo='LinxProdutos') Then
    Begin
      sXML:='			<Parameter id="dt_update_inicio">'+sgDtaInicio+'</Parameter>';
      Writeln(txtArq,sXML);
      sXML:='			<Parameter id="dt_update_fim">'+sgDtaFim+'</Parameter>';
      Writeln(txtArq,sXML);

      //===============================================
      // PARAMETRO OPCIONAL: Cod_Produto (sgCodProduto)
      //===============================================
      If Trim(sgCodProduto)<>'' Then
      Begin
        sXML:='			<Parameter id="cod_produto">'+sgCodProduto+'</Parameter>';
        Writeln(txtArq,sXML);
      End; // If Trim(sgCodProduto)<>'' Then
    End; // If (sgMetodo='LinxProdutos') Then

    // Metodo LinxClientesFornec ------------------------------------
    If (sgMetodo='LinxClientesFornec') Then
    Begin
      sXML:='			<Parameter id="dt_update_inicial">'+sgDtaUpdateInicio+'</Parameter>';
      Writeln(txtArq,sXML);
      sXML:='			<Parameter id="dt_update_fim">'+sgDtaUpdateFim+'</Parameter>';
      Writeln(txtArq,sXML);

      //========================================================
      // PARAMETRO OPCIONAL E NÃO UTILIZADOS
      //=========================================================
      //       Metodo                         Parametro
      //-----------------------------------   --------------
      // LinxClientesFornec                   cod_Cliente
      //                                      doc_cliente
      //                                      matricula_conveniado
      //==========================================================
    End; // If (sgMetodo='LinxClientesFornec') Then
  End; // If (sgMetodo='LinxProdutos') Or (sgMetodo='LinxClientesFornec') Then
  // ===========================================================================

  // ===========================================================================
  // Parametros:
  // - data_mov_ini
  // - data_mov_fim
  // - cod_produto
  // - referencia
  //
  // Metodos:
  // --------
  // LinxProdutosDetalhes
  // LinxProdutosCamposAdicionais
  // ===========================================================================
  If (sgMetodo='LinxProdutosDetalhes') Or (sgMetodo='LinxProdutosCamposAdicionais') Then
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

    //===============================================
    // PARAMETRO OPCIONAL: Referencia (sgReferenciaProd)
    //===============================================
    If Trim(sgReferenciaProd)<>'' Then
    Begin
      sXML:='			<Parameter id="referencia">'+sgReferenciaProd+'</Parameter>';
      Writeln(txtArq,sXML);
    End; // If Trim(sgReferenciaProd)<>'' Then
  End; // If (sgMetodo='LinxProdutosDetalhes') Or (sgMetodo='LinxProdutosCamposAdicionais') Then
  // ===========================================================================

  // ===========================================================================
  // Parametros:
  // - cod_produto
  // - referencia
  //
  // Metodos:
  // --------
  // LinxProdutosInventario
  // ===========================================================================
  If sgMetodo='LinxProdutosInventario' Then
  Begin
    sXML:='			<Parameter id="cod_produto">'+sgCodProduto+'</Parameter>';
    Writeln(txtArq,sXML);
    sXML:='			<Parameter id="referencia">'+sgReferenciaProd+'</Parameter>';
    Writeln(txtArq,sXML);
  End; // If sgMetodo='LinxProdutosInventario' Then
  // ===========================================================================

  // ===========================================================================
  // Parametros:
  // - cod_deposito
  //
  // Metodos:
  // --------
  // LinxProdutosInventario
  // LinxProdutosDepositos
  // ===========================================================================
  If (sgMetodo='LinxProdutosInventario') Or (sgMetodo='LinxProdutosDepositos') Then
  Begin
    sXML:='			<Parameter id="cod_deposito">'+sgCodQualquer+'</Parameter>';
    Writeln(txtArq,sXML);
  End; //   If (sgMetodo='LinxProdutosInventario') Or (sgMetodo='LinxProdutosDepositos') Then
  // ===========================================================================

  // ===========================================================================
  // Parametros:
  // - data_inicial
  // - data_fim
  // - data_inicial_pag
  // - data_fim_pag
  //  -identificador
  //
  // Metodos:
  // --------
  // LinxFaturas
  // ===========================================================================
  If (sgMetodo='LinxFaturas') Then
  Begin
    // SEM PARAMETRO Busca Pela Data de Emissão ================================
    If bgParametroDtaEmissao Then
    Begin
      sXML:='			<Parameter id="data_inicial">'+sgDtaInicio+'</Parameter>';
      Writeln(txtArq,sXML);
      sXML:='			<Parameter id="data_fim">'+sgDtaFim+'</Parameter>';
      Writeln(txtArq,sXML);
      sXML:='			<Parameter id="data_inicial_pag">'+'NULL'+'</Parameter>';
      Writeln(txtArq,sXML);
      sXML:='			<Parameter id="data_fim_pag">'+'NULL'+'</Parameter>';
      Writeln(txtArq,sXML);
      sXML:='			<Parameter id="identificador">'+'NULL'+'</Parameter>';
      Writeln(txtArq,sXML);
    End; // If bgParametroDtaEmissao Then

    // COM PARAMETRO Busca Pela Data de Pagamento ==============================
    If Not bgParametroDtaEmissao Then
    Begin
      sXML:='			<Parameter id="data_inicial">'+'NULL'+'</Parameter>';
      Writeln(txtArq,sXML);
      sXML:='			<Parameter id="data_fim">'+'NULL'+'</Parameter>';
      Writeln(txtArq,sXML);
      sXML:='			<Parameter id="data_inicial_pag">'+sgDtaInicio+'</Parameter>';
      Writeln(txtArq,sXML);
      sXML:='			<Parameter id="data_fim_pag">'+sgDtaFim+'</Parameter>';
      Writeln(txtArq,sXML);
      sXML:='			<Parameter id="identificador">'+'NULL'+'</Parameter>';
      Writeln(txtArq,sXML);
    End; // If Not bgParametroDtaEmissao Then
  End; // If (sgMetodo='LinxFaturas') Then
  // ===========================================================================

  // ===========================================================================
  // Parametros:
  // - data_lanc_ini
  // - data_lanc_fim
  // - cod_cc
  // - cod_conta
  //
  // Metodos:
  // --------
  // LinxLancContabil
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

  bUmaVez, // Se Já Processou uma Vez
  bSiga: Boolean;

  sMetodoEspecifico: String;

  dDtaUltAtual, // Data da Table Linx??? para Pesquisa na Web Services
  dDtaHoje: TDate;

  wDia, wMes, wAno: Word;

  hHrInicio: String; // Não permite rodar com Parametro entre as 16 e 18 Horas - Existe um processo rodando
Begin
  // Parametro: Somente o Metodo Enviado =======================================
  sgParametroMetodo     :=''; // Metodo a Processar
  sgParametroCodLoja    :=''; // Loja a Processar
  sgParametroMetodos    :=''; // Pasta Metodo  - \\192.168.0.252\Projetos\BelShop\WebService Linx\Metodos\
  sgParametroRetornos   :=''; // Pasta Retorno - \\192.168.0.252\Projetos\BelShop\WebService Linx\Retornos\
  sgParametroDtaInicio  :=''; // Data do Inico do Periodo
  sgParametroDtaFim     :=''; // Data do Fim do Periodo
  sgParametroCodProduto :=''; // Codigo Qualquer
  sgParametroCodQualquer:=''; // Codigo Qualquer

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// OdirOPSS - Utiliza Parametro ================================================
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//  Estrutura dos Paramentros
//  =========================
//  NomeMetodo
//  Codigo_Loja_Linx
//  Pasta_Metodos
//  Pasta_Retornos
//  Data_Início         => Pode ser Nulo - NULL
//  Data_Fim            => Pode ser Nulo - NULL
//  Codigo do Produto   => Pode ser Nulo - NULL
//  Codigo Qualqueer    => Pode ser Nulo - NULL
//  Campo Data para Pesquisa => SIM ou Branco => Se Utilização de Data de Emissão Para Pesquisa
//                           => NAO ===========> Se Utilização de Data de Pagamento Para Pesquisa
//                              - Utilizado em:
//                                      - LinxFaturas

//  >>>>>>>>>>>>>> EXEMPLO PELO ODIR >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//  >>>>>>>>>>>>>> Paramento Separados por PontoVirgula (;)
//  NomeMetodo;Codigo_Loja_Linx;Pasta_Metodos;Pasta_Retornos;Data_Início;Data_Fim

//  \\192.168.0.252\Projetos\BelShop\WebService Linx\PWebServiceLinx.exe LinxMovimento;15;\\192.168.0.252\Projetos\BelShop\WebService Linx\Metodos\;\\192.168.0.252\Projetos\BelShop\WebService Linx\Retornos\;;;';
//==>>  sgParametroMetodo:='LinxSangriaSuprimentos;15;\\192.168.0.252\Projetos\BelShop\WebService Linx\Metodos\;\\192.168.0.252\Projetos\BelShop\WebService Linx\Retornos\;25/09/2017;26/10/2017;';
//  sgParametroMetodo:='LinxSangriaSuprimentos;15;\\192.168.0.252\Projetos\BelShop\WebService Linx\Metodos\;\\192.168.0.252\Projetos\BelShop\WebService Linx\Retornos\;';
//
//  >>>>>>>>>>>>>> EXEMPLO PELO PARAMETRO  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//  >>>>>>>>>>>>>> Parameto Separados por Espaço em Branco ( ) e Aspas (") para String com espaço em Branco
//  NomeMetodo Codigo_Loja_Linx "Pasta Metodos" "Pasta Retornos" Data_Início Data_Fim
//
//  \\192.168.0.252\Projetos\BelShop\WebService Linx\PWebServiceLinx.exe LinxMovimento 15 "\\192.168.0.252\Projetos\BelShop\WebService Linx\Metodos\" "\\192.168.0.252\Projetos\BelShop\WebService Linx\Retornos\"

{
PARAMETRO EXTERNO:
=================
NomeMetodo; LinxSangriaSuprimentos;
Codigo_Loja_Linx; 15;
Pasta_Metodos; \\192.168.0.252\Projetos\BelShop\WebService Linx\Metodos\;
Pasta_Retornos; \\192.168.0.252\Projetos\BelShop\WebService Linx\Retornos\;
Data_Início;25/09/2017;
Data_Fim 26/10/2017;

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>> EXECUÇÃO - Parameto Separados por Espaço em Branco ( ) e Aspas (") para String com espaço em Branco
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
While CDS_Lojas.Eof do
Begin
  sgDtaI:='01/12/2017';
  sgDtaF:='10/12/2017';

  sParametros:=sgPastaWebService+'PWebServiceLinx.exe LinxSangriaSuprimentos';                  ==>> Excutavel e Metodo a Processar
  sParametros:=sParametros+' '+CDS_Lojas.FieldByName('Cod_Linx').AsString;              '       ==>> Codigo da Loja a Processar
  sParametros:=sParametros+' "'+IncludeTrailingPathDelimiter(sgPastaWebService+'Metodos')+'"';  ==>> Pasta dos Metodos
  sParametros:=sParametros+' "'+IncludeTrailingPathDelimiter(sgPastaWebService+'Retornos')+'"'; ==>> Pasta dos Retornos
  sParametros:=sParametros+' "'+sgDtaI+'"';                                                     ==>> Data Inicial
  sParametros:=sParametros+' "'+sgDtaF+'"';                                                     ==>> Data Final
  sParametros:=sParametros+' '+sgCodProduto;                                                    ==>> Codigo do Produto
  sParametros:=sParametros+' '+sgCodQualquer;                                                   ==>> Codigo Qualquer

  sParametros:=sParametros+' "NAO"'; // Data de Pesquisa

  // Envia Parametro e Aguarda Termino do Processo =============================
  CreateProcessSimple(sParametros);

  CDS_Lojas.Next;
End;
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>> EXECUÇÃO
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
}
// OdirOPSS - Utiliza Parametro ================================================
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  //============================================================================
  // Se Utiliza Data de Emissão para Pesquina no Metodo LinxFaturas ============
  //============================================================================
  bgParametroDtaEmissao:=True;

  //============================================================================
  // Le Parametros Enviado =====================================================
  //============================================================================
  sgParametroMetodo:=ParamStr(1);

  // sgParametroMetodo:='LinxFaturas;2;C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\;C:\Projetos\BelShop\Fontes\WebService Linx\Retornos\;25/07/2017;25/07/2017;0;SIM;';
  // sgParametroMetodo:='LinxProdutosDepositos;2;C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\;C:\Projetos\BelShop\Fontes\WebService Linx\Retornos\;01/03/2018;14/03/2018;';
  // sgParametroMetodo:='LinxProdutosDetalhes;2;C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\;C:\Projetos\BelShop\Fontes\WebService Linx\Retornos\;;;;;;';
  /// sgParametroMetodo:='LinxProdutosInventario;2;C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\;C:\Projetos\BelShop\Fontes\WebService Linx\Retornos\;;;;6;;';
  // Le Parametros Enviado =====================================================
  //============================================================================

  //============================================================================
  // Pasta Executável PWebServiceLinx Não Rede =================================
  //============================================================================
  sgPastaExecutavel:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  // Pasta Executável PWebServiceLinx Não Rede =================================
  //============================================================================

  //============================================================================
  // Parametros na Rede ========================================================
  //============================================================================
  If Trim(sgParametroMetodo)<>'' Then
  Begin
    // Executa pelo Parametro ==================================================
    If Trim(ParamStr(1))<>'' Then
    Begin
      sgParametroMetodo     :=Trim(ParamStr(1));
      sgParametroCodLoja    :=Trim(ParamStr(2));
      sgParametroMetodos    :=Trim(ParamStr(3));
      sgParametroRetornos   :=Trim(ParamStr(4));
      sgParametroDtaInicio  :=Trim(ParamStr(5));
      sgParametroDtaFim     :=Trim(ParamStr(6));
      sgParametroCodProduto :=Trim(ParamStr(7));
      sgParametroCodQualquer:=Trim(ParamStr(8));

      // Data de Pesquida do metodo LinxFaturas
      bgParametroDtaEmissao :=Trim(ParamStr(9))='SIM';
    End; // If Trim(ParamStr(1))<>'' Then

//opss
    // Executa pelo Odir =======================================================
    If Trim(ParamStr(1))='' Then
    Begin
      sgParametroCodLoja    :=Separa_String(Trim(sgParametroMetodo),2);
      sgParametroMetodos    :=Separa_String(Trim(sgParametroMetodo),3);
      sgParametroRetornos   :=Separa_String(Trim(sgParametroMetodo),4);
      sgParametroDtaInicio  :=Separa_String(Trim(sgParametroMetodo),5);
      sgParametroDtaFim     :=Separa_String(Trim(sgParametroMetodo),6);
      sgParametroCodProduto :=Separa_String(Trim(sgParametroMetodo),7);
      sgParametroCodQualquer:=Separa_String(Trim(sgParametroMetodo),8);

      // Data de Pesquida do metodo LinxFaturas
      bgParametroDtaEmissao :=Separa_String(Trim(sgParametroMetodo),9)='SIM';

      sgParametroMetodo  :=Separa_String(Trim(sgParametroMetodo),1); // Ultimo Devido a substituição do
                                                                     // Conteudo da Variavel sgParametroMetodo
    End; // If Trim(ParamStr(1))='' Then
//opss

    //==========================================================================
    // Verifica se Existem Parametros Finais ===================================
    //==========================================================================
    If (Trim(sgParametroDtaInicio)='Limite Superado') Or (AnsiUpperCase(Trim(sgParametroDtaInicio))='NULL') Then
     sgParametroDtaInicio  :=''; // Parametro: Data do Inico do Periodo

    If (Trim(sgParametroDtaFim)='Limite Superado') Or (AnsiUpperCase(Trim(sgParametroDtaFim))='NULL') Then
     sgParametroDtaFim     :=''; // Parametro: Data do Fim do Periodo

    If (Trim(sgParametroCodProduto)='Limite Superado') Or (AnsiUpperCase(Trim(sgParametroCodProduto))='NULL') Then
     sgParametroCodProduto:=''; // Parametro: Codigo do Produto

    If (Trim(sgParametroCodQualquer)='Limite Superado') Or (AnsiUpperCase(Trim(sgParametroCodQualquer))='NULL') Then
     sgParametroCodQualquer:=''; // Parametro: Codigo Qualquer

    // Verifica se Existem Parametros Finais ===================================
    //==========================================================================

    //==========================================================================
    // Pasta do executavel =====================================================
    //==========================================================================
    sgPastaExecutavel:=Copy(sgParametroMetodos,1,Pos('Metodos\', sgParametroMetodos)-1);
    // Pasta do executavel =====================================================
    //==========================================================================
  End; // If Trim(sgParametroMetodo)<>'' Then
  // Parametros na Rede ========================================================
  //============================================================================

  //odirOPSS - odirteste
//  ShowMessage('Metodo: '+sgParametroMetodo);
//  ShowMessage('Demonstracao '+sgParametroMetodo);
//  ShowMessage('Loja: '+sgParametroCodLoja);
//  ShowMessage('Pasta Metodos: '+sgParametroMetodos);
//  ShowMessage('Pasta Retornos: '+sgParametroRetornos);
//  ShowMessage('Data Inicio: '+sgParametroDtaInicio);
//  ShowMessage('Data Fim: '+sgParametroDtaFim);
//  ShowMessage('Codigo Produto: '+sgParametroCodProduto);
//  ShowMessage('Codigo Qualquer: '+sgParametroCodQualquer);
//  ShowMessage('Pesquisa Data: '+BoolToStr(bgParametroDtaEmissao));
//  ShowMessage('Pasta Exec: '+sgPastaExecutavel);

  //============================================================================
  // Cria Arquivo de Metodos ===================================================
  //============================================================================
  tgMetodos:=TStringList.Create;

  //============================================================================
  // Somente o Metodo Conforme Parametro Enviado ===============================
  //============================================================================
  If Trim(sgParametroMetodo)<>'' Then
  Begin
    If Trim(sgParametroMetodo)='LinxProdutosDetalhes' Then
     tgMetodos.Add('LinxProdutosInventario');

    tgMetodos.Add(Trim(sgParametroMetodo));
  End; // If Trim(sgParametroMetodo)<>'' Then
  // Somente o Metodo Conforme Parametro Enviado ===============================
  //============================================================================

  //============================================================================
  // Ler Arquivo Ini de Pastas =================================================
  //============================================================================
  AssignFile(Arq,sgPastaExecutavel+'Linx_WebService.Ini');
  Reset(Arq);
  i:=0;
  While not Eof(Arq) do
  Begin
    Readln(Arq,sLinha);

    If Trim(sLinha)='' Then
     Break;

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
       If Trim(sgParametroMetodo)='' Then
       Begin
         tgMetodos.Add(Trim(sLinha));
       End; // If Trim(sgParametroMetodo)='' Then
     End;

    Inc(i);
  End; // While not Eof(Arq) do
  CloseFile(Arq);
  // Ler Arquivo Ini de Pastas =================================================
  //============================================================================

  //============================================================================
  // Se Processamento por PARAMETRO Atualiza Pastas ============================
  //============================================================================
  If Trim(sgParametroMetodo)<>'' Then
  Begin
    sgPastaMetodos :=IncludeTrailingPathDelimiter(sgParametroMetodos);
    sgPastaRetornos:=IncludeTrailingPathDelimiter(sgParametroRetornos);
  End; // If Trim(sgParametroMetodo)<>'' Then
  // Se Processamento por PARAMETRO Atualiza Pastas ============================
  //============================================================================

  //============================================================================
  // Pasta BelShop =============================================================
  //============================================================================
  i:=pos('BelShop',sgPastaMetodos);
  sgPastaBelShop:=Copy(sgPastaMetodos,1,i+7);
  // Pasta BelShop =============================================================
  //============================================================================

  //============================================================================
  // Verifica se Arquivo Ini de Conexão Existe =================================
  //============================================================================
  If Not (FileExists(sgPastaBelShop+'PCTConect_IB.ini')) Then
  Begin
    SalvaProcessamento(sgPastaMetodos+'PCTConect_IB.ini Não Encontrado !!');
    Application.Terminate;
    Exit;
  End;
  // Verifica se Arquivo Ini de Conexão Existe =================================
  //============================================================================

  //============================================================================
  // Verifica se Interet Esta Ativa ============================================
  //============================================================================
  if not InternetGetConnectedState(@Flags, 0) then
  Begin
    SalvaProcessamento(sgDta+'Internet Não Conectada !!');
    Application.Terminate;
    Exit;
  End;
  // Verifica se Interet Esta Ativa ============================================
  //============================================================================

  //============================================================================
  // Cria Arquivo de Acompanhamento do Processamento ===========================
  //============================================================================
  tgArqProc:=TStringList.Create;
  // Cria Arquivo de Acompanhamento do Processamento ===========================
  //============================================================================

  //============================================================================
  // Conecta o Banco de Dados ==================================================
  //============================================================================
  If Not DMLinxWebService.ConectaBanco Then
  Begin
    If Trim(sgArqProc)='' Then
     sgArqProc:=sgPastaRetornos+'@LinxWebService_NAO_CONECTOU.txt';

    SalvaProcessamento('Erro de Conexão!! '+sgMensagem);
    Application.Terminate;
    Exit;
  End;
  // Conecta o Banco de Dados ==================================================
  //============================================================================

  //============================================================================
  // Executa Programa Com Parametros Somente até as 21 Horas ===================
  //============================================================================
//  If Trim(sgParametroMetodo)<>'' Then
//  Begin
//    hHrInicio:=TimeToStr(DataHoraServidorFI(DMLinxWebService.SDS_DtaHoraServidor));
//    If (StrToTime(hHrInicio)>StrToTime('21:00:00')) Then
//    Begin
//      Application.Terminate;
//      Exit;
//    End;
//  End; // If Trim(sgParametroMetodo)<>'' Then
  // Executa Programa Com Parametros Somente até as 21 Horas ===================
  //============================================================================

  //============================================================================
  // Data Inicio da Atualização ================================================
  //============================================================================
  sgDta:=DateToStr(DataHoraServidorFI(DMLinxWebService.SDS_DtaHoraServidor));
  sgDta:=f_Troca('/','',f_Troca('.','',f_Troca('-','',sgDta)));
  // Data Inicio da Atualização ================================================
  //============================================================================

  //============================================================================
  // Salva Pasta e Nome do Arquivo de Acompanhamento de Processamento ==========
  //============================================================================
  sgArqProc:=sgPastaRetornos+'@LinxWebService_'+sgDta+'.txt';

  DeleteFile(sgArqProc);
  // Salva Pasta e Nome do Arquivo de Acompanhamento de Processamento ==========
  //============================================================================

  //============================================================================
  // Busca Parametros da Linx para WebService ==================================
  //============================================================================
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
  // Busca Parametros da Linx para WebService ==================================
  //============================================================================

  // ===========================================================================
  // Busca Definição de Todos os Metodos =======================================
  // ===========================================================================
  If Trim(sgParametroMetodo)='' Then
  Begin
    // ShowMessage('Odir 1 '+sgMetodo);
    sgMetodo:='LinxMetodos';
    sgArqXMLRet:='Retorno_'+sgMetodo+'.XML';
    MontaMetodoXMLPost();
    EnviaMetodoXMLPost;
  End;
  // Busca Definição de Todos os Metodos =======================================
  // ===========================================================================

  // ===========================================================================
  // Busca Lojas para Processamento ============================================
  // ===========================================================================
  MySql:=' SELECT em.num_cnpj, em.cod_filial, em.cod_linx,'+
         '        em.dta_inicio_linx, em.ind_domingo'+
         ' FROM EMP_CONEXOES em'+
         ' WHERE em.dta_inicio_linx IS NOT NULL';

         If sgParametroCodLoja<>'' Then
          MySql:=
           MySql+' AND em.cod_linx='+sgParametroCodLoja
         Else
          MySql:=
           MySql+' AND em.cod_linx<>0'+
                 ' ORDER BY 5,4';
  DMLinxWebService.CDS_Lojas.Close;
  DMLinxWebService.SDS_Lojas.CommandText:=MySql;
  DMLinxWebService.CDS_Lojas.Open;
  //ShowMessage('Odir 2 - SQL Lojas');
  // Busca Lojas para Processamento ============================================
  // ===========================================================================

  // ===========================================================================
  // INICIO do Processamento ===================================================
  // ===========================================================================
  bUmaVez:=False;
  sgAtiva:='';
  While Not DMLinxWebService.CDS_Lojas.Eof do
  Begin
//    ShowMessage('Odir 3 - While Not DMLinxWebService.CDS_Lojas');

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
      sgReferenciaProd:='';

      If Trim(tgMetodos[iFor])='' Then
       Break;

      bgMontouPost:=False;
      sgMetodo  :=tgMetodos[iFor];

      // odirOPSS - odirteste
      // ShowMessage('Odir 5 - Metodo em Execução: '+sgMetodo);

      //========================================================================
      // Metodo Especifico: Quando o Método Chama Outro Método Principal =======
      //========================================================================
      sMetodoEspecifico:='';
      If (sgMetodo='LinxMovtosAjustesEntradas') Or (sgMetodo='LinxMovtosAjustesSaidas') Then
      Begin
        sMetodoEspecifico:=sgMetodo;
        sgMetodo:='LinxMovimento'
      End; // If (sgMetodo='LinxMovtosAjustesEntradas') Or (sgMetodo='LinxMovtosAjustesSaidas') Then
      // Metodo Especifico: Quando o Método Chama Outro Método Principal =======
      //========================================================================

      //========================================================================
      // Monta Nome do Arquivo de Retorno ======================================
      //========================================================================
      sgArqXMLRet:='Retorno_'+sgMetodo+'.XML';
      // Monta Nome do Arquivo de Retorno ======================================
      //========================================================================

      //========================================================================
      // Nome da Tabela for Diferente da Nome do Metodo ========================
      //========================================================================
      sgMetodoNomeTabela:='';
      If sgMetodo='LinxClientesFornecCamposAdicionais' Then
       sgMetodoNomeTabela:='LinxClientesFornecAdicionais';

      If sgMetodo='LinxConfiguracoesTributariasDetalhes' Then
       sgMetodoNomeTabela:='LinxConfigTributariasDetalhes';
      // Nome da Tabela for Diferente da Nome do Metodo ========================
      //========================================================================

      //========================================================================
      // Data Hoje =============================================================
      //========================================================================
      dDtaHoje:=DataHoraServidorFI(DMLinxWebService.SDS_DtaHoraServidor);
      // Data Hoje =============================================================
      //========================================================================

      //========================================================================
      // TODOS OS METODOS ======================================================
      // Data Utilizada para Busca da Ultima Atualização no Linx ===============
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

      MySql:=' SELECT CAST(MAX(Lx.'+sgCampoUpdate+') AS DATE) Dta_Ult_Alteracao';
             If Trim(sgMetodoNomeTabela)<>'' Then
              MySql:=
               MySql+' FROM '+sgMetodoNomeTabela+' lx'
             Else
              MySql:=
               MySql+' FROM '+sgMetodo+' lx';

//Odiraqui 2 - Quando Contem CAMPO: EMPRESA
             If (AnsiUpperCase(sgMetodo)='LINXFATURAS')                                 or
                (AnsiUpperCase(sgMetodo)='LINXLOJAS')                                   or
                (AnsiUpperCase(sgMetodo)='LINXMOVIMENTO')                               or
                (AnsiUpperCase(sgMetodo)='LINXMOVIMENTOTROCAS')                         or
                (AnsiUpperCase(sgMetodo)='LINXGRUPOLOJAS')                              or
                (AnsiUpperCase(sgMetodo)='LINXMOVIMENTOORIGEMDEVOLUCOES')               or
                (AnsiUpperCase(sgMetodo)='LINXMOVIMENTOSERIAL')                         or
                (AnsiUpperCase(sgMetodo)='LINXVENDEDORES')                              or
                (AnsiUpperCase(sgMetodo)='LINXMOVIMENTOPLANOS')                         or
                (AnsiUpperCase(sgMetodo)='LINXMOVIMENTOACOESPROMOCIONAIS')              or
                (AnsiUpperCase(sgMetodo)='LINXACOESPROMOCIONAIS')                       or
                (AnsiUpperCase(sgMetodo)='LINXLANCCONTABIL')                            or
                (AnsiUpperCase(sgMetodo)='LINXPEDIDOSVENDA')                            or
                (AnsiUpperCase(sgMetodo)='LINXPLANOSPEDIDOVENDA')                       or
                (AnsiUpperCase(sgMetodo)='LINXPEDIDOSCOMPRA')                           or
                (AnsiUpperCase(sgMetodo)='LINXREDUCOESZ')                               or
                (AnsiUpperCase(sgMetodo)='LINXSANGRIASUPRIMENTOS')                      or
                (AnsiUpperCase(sgMetodo)='LINXCONFIGURACOESTRIBUTARIAS')                or
                (AnsiUpperCase(sgMetodo)='LINXCONFIGURACOESTRIBUTARIASDETALHES')        or
                (AnsiUpperCase(sgMetodo)='LINXPRODUTOSDETALHES')                        Then
              MySql:=
               MySql+' WHERE lx.Empresa='+sgCodLojaLinx;
      DMLinxWebService.CDS_Busca.Close;
      DMLinxWebService.SDS_Busca.CommandText:=MySql;
      DMLinxWebService.CDS_Busca.Open;
      dDtaUltAtual:=DMLinxWebService.CDS_Busca.FieldByName('Dta_Ult_Alteracao').AsDateTime;
      DMLinxWebService.CDS_Busca.Close;
      // TODOS OS METODOS ======================================================
      // Data Utilizada para Busca da Ultima Atualização no Linx ===============
      //========================================================================

      //========================================================================
      // LinxGrupoLojas ========================================================
      //========================================================================
      If (sgMetodo='LinxGrupoLojas') And (Not bUmaVez) Then
      Begin
        MontaMetodoXMLPost();
      End; // If (sgMetodo='LinxGrupoLojas') And (Not bUmaVez) Then
      // LinxGrupoLojas ========================================================
      //========================================================================

//      ShowMessage('Odir 6 - Vai Executa '+sgMetodo);

      //========================================================================
      // LinxLojas =============================================================
      //========================================================================
      If sgMetodo='LinxLojas' Then
      Begin
        MontaMetodoXMLPost();
      End; // If sgMetodo='LinxLojas' Then
      // LinxLojas =============================================================
      //========================================================================

      //========================================================================
      // LinxConfiguracoesTributarias ==========================================
      //========================================================================
      If sgMetodo='LinxConfiguracoesTributarias' Then
      Begin
        MontaMetodoXMLPost();
      End; // If sgMetodo='LinxConfiguracoesTributarias' Then
      // LinxConfiguracoesTributarias ==========================================
      //========================================================================

      //========================================================================
      // LinxConfiguracoesTributarias ==========================================
      //========================================================================
      If (sgMetodo='LinxConfiguracoesTributariasDetalhes') And (sgCodLojaLinx='2') Then
      Begin
        For igCodTrib:=1 to 300 do
        Begin
          MontaMetodoXMLPost(IntToStr(igCodTrib));

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
        End; // For igCodTrib:=1 to 300 do
        bgMontouPost:=False;
      End; // If sgMetodo='LinxConfiguracoesTributarias' Then
      // LinxConfiguracoesTributarias ==========================================
      //========================================================================

      //========================================================================
      // LinxClientesFornec ====================================================
      //========================================================================
      If (sgMetodo='LinxClientesFornec') And (Not bUmaVez) Then
      Begin
        If dDtaUltAtual=0 Then
         dDtaUltAtual:=DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime+4;

        DecodeDate(dDtaUltAtual-30, wAno, wMes, wDia);
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

        // Mesmas Datas de Inclusão e de Alteração no Cadastro
        sgDtaUpdateInicio:=sgDtaInicio;
        sgDtaUpdateFim   :=sgDtaFim;

        // Todo o Cadastro
        //aquiodir
        // sgDtaInicio:='2016-11-01'; // Inicio dos Cadastros
        // sgDtaFim:='2018-11-13'; // Hoje

        MontaMetodoXMLPost();
      End; // If (sgMetodo='LinxClientesFornec') And (Not bUmaVez) Then Then
      // LinxClientesFornec ====================================================
      //========================================================================

      //========================================================================
      // LinxClientesFornecCamposAdicionais ====================================
      //========================================================================
      If (sgMetodo='LinxClientesFornecCamposAdicionais') And (Not bUmaVez) Then
      Begin
        If dDtaUltAtual=0 Then
         dDtaUltAtual:=DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime+4;;

        DecodeDate(dDtaUltAtual-30, wAno, wMes, wDia);
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
      End; // If (sgMetodo='LinxClientesFornecCamposAdicionais') And (Not bUmaVez) Then Then
      // LinxClientesFornecCamposAdicionais ====================================
      //========================================================================

      //========================================================================
      // LinxMovimento e Ajustes (Utiliza sMetodoEspecifico) ===================
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

          // Odir Acerta Período Anterior ao Inicio da Loja
          // dDtaUltAtual:=DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime-60;
          // DecodeDate(dDtaUltAtual, wAno, wMes, wDia);
          // sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

          // dDtaUltAtual:=DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime-1;
          // DecodeDate(dDtaUltAtual, wAno, wMes, wDia);
          // sgDtaFim:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

          MontaMetodoXMLPost('NULL', 'NULL'); // operacao, tipo_transacao
        End; // If (sMetodoEspecifico='') Then

        // Metodo Especifico Ajustes de Estoques ===============================
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
      // LinxMovimento e Ajustes (Utiliza sMetodoEspecifico) ===================
      //========================================================================

      //========================================================================
      // LinxMovimentoTrocas ===================================================
      //========================================================================
      If sgMetodo='LinxMovimentoTrocas' Then
      Begin
        If (dDtaUltAtual=0) Or ((dDtaUltAtual-7)<DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime) Then
         dDtaUltAtual:=DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime+7;

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

//        sgDtaInicio:='01/01/2018';
//        sgDtaFim:='09/10/2018';
//        DecodeDate(StrToDate(sgDtaInicio), wAno, wMes, wDia);
//        sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);
//        DecodeDate(StrToDate(sgDtaFim), wAno, wMes, wDia);
//        sgDtaFim:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);

        MontaMetodoXMLPost();
      End; // If sgMetodo='LinxMovimentoTrocas' Then
      // LinxMovimentoTrocas ===================================================
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
      // LinxMovimentoOrigemDevolucoes =========================================
      //========================================================================

      //========================================================================
      // LinxMovimentoSerial (NÃO EXECUTAR - NÃO EXISTE DADOS PARA BELSHOP) ====
      //========================================================================
//      If sgMetodo='LinxMovimentoSerial' Then
//      Begin
//        If (dDtaUltAtual=0) Or ((dDtaUltAtual-7)<DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime) Then
//         dDtaUltAtual:=DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime+7;
//
//        DecodeDate(dDtaUltAtual-7, wAno, wMes, wDia);
//        sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);
//
//        DecodeDate(dDtaHoje, wAno, wMes, wDia);
//        sgDtaFim:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);
//
//        // Metodo por Parametro (Acerta Data Inicial)
//        If Trim(sgParametroMetodo)<>'' Then
//        Begin
//          If dDtaUltAtual=dDtaHoje Then
//          Begin
//            sgDtaInicio:=sgDtaFim;
//          End;
//
//          If dDtaUltAtual<dDtaHoje Then
//          Begin
//            DecodeDate(dDtaUltAtual, wAno, wMes, wDia);
//            sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);
//          End;
//        End; // If Trim(sgParametroMetodo)<>'' Then
//
//        MontaMetodoXMLPost();
//      End; // If sgMetodo='LinxMovimentoSerial' Then
//      // LinxMovimentoSerial (NÃO EXECUTAR - NÃO EXISTE DADOS PARA BELSHOP) ====
//      //========================================================================

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

        // Buscar Todos
        // sgDtaInicio:='NULL';
        // sgDtaFim:='NULL';

        MontaMetodoXMLPost();
      End; // If sgMetodo='LinxMovimentoPlanos' Then
      // LinxMovimentoPlanos ===================================================
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
      // LinxMovimentoAcoesPromocionais ========================================
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

        // Busca Variações por Ser Obrigatório
        // sgAtiva=1
        // sgAtiva=0
        If Trim(sgAtiva)='' Then
         sgAtiva:='0'
        Else
         sgAtiva:='1';

        MontaMetodoXMLPost();
      End; // If sgMetodo='LinxAcoesPromocionais' Then
      // LinxAcoesPromocionais =================================================
      //========================================================================

      //========================================================================
      // LinxVendedores ========================================================
      //========================================================================
      If sgMetodo='LinxVendedores' Then
      Begin
        // Buscar Todos
        sgDtaInicio:='NULL';
        sgDtaFim:='NULL';

        MontaMetodoXMLPost();
      End; // If sgMetodo='LinxVendedores' Then
      // LinxVendedores ========================================================
      //========================================================================

      //========================================================================
      // LinxProdutos ==========================================================
      //========================================================================
      If (sgMetodo='LinxProdutos') And (Not bUmaVez) Then
      Begin
        sgCodProduto:='';
        sgReferenciaProd:='';

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

        // Busca Todos os Produtos ==================================
        sgDtaInicio:='NULL';
        sgDtaFim:='NULL';

        // sgCodProduto:='10171';

                        // sSetor  sLinha  sMarca  sColecao
        MontaMetodoXMLPost('NULL', 'NULL', 'NULL', 'NULL');
      End; // If (sgMetodo='LinxProdutos') And (Not bUmaVez) Then
      // LinxProdutos ==========================================================
      //========================================================================

      //========================================================================
      // LinxProdutosCamposAdicionais ==========================================
      //========================================================================
      If (sgMetodo='LinxProdutosCamposAdicionais') And (Not bUmaVez) Then
      Begin
        // Busca Todos os Produtos ==================================
        sgDtaInicio:='NULL';
        sgDtaFim:='NULL';

        MontaMetodoXMLPost();
      End; // If (sgMetodo='LinxProdutosCamposAdicionais') And (Not bUmaVez) Then
      // LinxProdutosCamposAdicionais ==========================================
      //========================================================================

      //========================================================================
      // LinxPlanos ============================================================
      //========================================================================
      If (sgMetodo='LinxPlanos') And (Not bUmaVez) Then
      Begin
        // Busca Todos os Planos ===================================
        sgDtaInicio:='NULL';
        sgDtaFim:='NULL';

        MontaMetodoXMLPost();
      End; // If (sgMetodo='LinxPlanos') And (Not bUmaVez) Then
      // LinxPlanos ============================================================
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

        // Busca o Saldo de Todos os Produtos com Saldo > 0.0000 ====
        sgDtaInicio:='NULL';
        sgDtaFim:='NULL';

        sgCodProduto:='';
        sgReferenciaProd:='';

        MontaMetodoXMLPost();
      End; // If sgMetodo='LinxProdutosDetalhes' Then
      // LinxProdutosDetalhes ==================================================
      //========================================================================

      //========================================================================
      // LinxProdutosDepositos =================================================
      //========================================================================
      If (sgMetodo='LinxProdutosDepositos')  And (Not bUmaVez) Then
      Begin
        // Codigo do Deposito de Estoque
        sgCodQualquer:=sgParametroCodQualquer;

        If Trim(sgCodQualquer)='' Then
         sgCodQualquer:='NULL';

        MontaMetodoXMLPost();
      End; //       If (sgMetodo='LinxProdutosDepositos')  And (Not bUmaVez) Then
      // LinxProdutosDepositos =================================================
      //========================================================================

      //========================================================================
      // LinxProdutosInventario ================================================
      //========================================================================
      If sgMetodo='LinxProdutosInventario' Then
      Begin
        sgDtaInicio:=sgParametroDtaInicio;
        If Trim(sgDtaInicio)='' Then
        Begin
          DecodeDate(dDtaHoje, wAno, wMes, wDia);
          sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);
        End;

        sgCodProduto:=sgParametroCodProduto;
        If Trim(sgCodProduto)='' Then
         sgCodProduto:='NULL';

        If Trim(sgReferenciaProd)='' Then
         sgReferenciaProd:='NULL';

        // Codigo do Deposito de Estoque Por Parametros
        sgCodQualquer   :=sgParametroCodQualquer;

        // Sem Parametros o Saldo CD é Direto do Deposito 1
        If Trim(sgCodQualquer)='' Then
         sgCodQualquer:='1';

        MontaMetodoXMLPost();
      End; // If sgMetodo='LinxProdutosInventario' Then
      // LinxProdutosInventario ================================================
      //========================================================================

      //========================================================================
      // LinxProdutosCodBar ====================================================
      //========================================================================
      If (sgMetodo='LinxProdutosCodBar') And (Not bUmaVez) Then
      Begin
        sgCodProduto:='';
                        // sSetor  sLinha  sMarca  sColecao
        MontaMetodoXMLPost('NULL', 'NULL', 'NULL', 'NULL');
      End; // If (sgMetodo='LinxProdutosCodBar') And (Not bUmaVez) Then
      // LinxProdutosCodBar ====================================================
      //========================================================================

      //========================================================================
      // LinxFaturas ===========================================================
      //========================================================================
      If sgMetodo='LinxFaturas' Then
      Begin
        // OBS: Só poderá ser fornecido um período de listagem (Emissão ou Pagamento),
        //      o outro deverá ficar como NULL. Mas deverá pelo menos ter um Período informado.

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
      // LinxFaturas ===========================================================
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
      // LinxLancContabil ======================================================
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
      // LinxPedidosVenda ======================================================
      //========================================================================

      //========================================================================
      // LinxPlanosPedidoVenda ======================================================
      //========================================================================
      If sgMetodo='LinxPlanosPedidoVenda' Then
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
      End; // If sgMetodo='LinxPlanosPedidoVenda' Then
      // LinxPlanosPedidoVenda ======================================================
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
      // LinxPedidosCompra ======================================================
      //========================================================================

      //========================================================================
      // LinxReducoesZ (NÃO EXECUTAR - NÃO EXISTE DADOS PARA BELSHOP) ==========
      //========================================================================
//      If sgMetodo='LinxReducoesZ' Then
//      Begin
//        If (dDtaUltAtual=0) Or ((dDtaUltAtual-7)<DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime) Then
//         dDtaUltAtual:=DMLinxWebService.CDS_LojasDTA_INICIO_LINX.AsDateTime+7;
//
//        DecodeDate(dDtaUltAtual-7, wAno, wMes, wDia);
//        sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);
//
//        DecodeDate(dDtaHoje, wAno, wMes, wDia);
//        sgDtaFim:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);
//
//        // Metodo por Parametro (Acerta Data Inicial)
//        If Trim(sgParametroMetodo)<>'' Then
//        Begin
//          If dDtaUltAtual=dDtaHoje Then
//          Begin
//            sgDtaInicio:=sgDtaFim;
//          End;
//
//          If dDtaUltAtual<dDtaHoje Then
//          Begin
//            DecodeDate(dDtaUltAtual, wAno, wMes, wDia);
//            sgDtaInicio:=VarToStr(wAno)+'-'+FormatFloat('00',wMes)+'-'+FormatFloat('00',wDia);
//          End;
//        End; // If Trim(sgParametroMetodo)<>'' Then
//
//        // cnpjPortal -----------------------------------------------
//        // (S) = Retorna registros de todos CNPJs do Portal
//        //       (utiliza como base o cnpj informado nocampo cnpjEmp para pesquisar o portal).
//        // (N) = Retorna registros somente do CNPJ pesquisa
//        sgCnpjPortal:='N';
//
//        MontaMetodoXMLPost();
//      End; // If sgMetodo='LinxReducoesZ' Then
//      // LinxReducoesZ (NÃO EXECUTAR - NÃO EXISTE DADOS PARA BELSHOP) ==========
//      //========================================================================

      //========================================================================
      // LinxSangriaSuprimentos ================================================
      //========================================================================
      If sgMetodo='LinxSangriaSuprimentos' Then
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
      End; // If sgMetodo='LinxSangriaSuprimentos' Then
      // LinxSangriaSuprimentos ================================================
      //========================================================================

      //========================================================================
      // Envio do Http.post ====================================================
      // Ler XML de Retorno e Salva no Banco de Dados ==========================
      //========================================================================
      If bgMontouPost Then
      Begin
        bSiga:=True;
//aquiodir
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

        //======================================================================
        // Acerta Estoque no CD - Depósito 9 - Depósito 09 | Devolução =========
        //======================================================================
        If (AnsiUpperCase(sgMetodo)=AnsiUpperCase('LinxProdutosDetalhes')) Then
        Begin
          // OdirAqui -Não Utilizado Mais - Agora o Saldo CD é Direto do Local 1
          // Acerta Estoque no CD - Depósito 9 - Depósito 09 | Devolução
          // AcertaSaldo_Deposito9;

          // Acerta Estoque no CD - Depósito 1 - Estoque
          AcertaSaldo_CD_Deposito1;
        End;
        // Acerta Estoque no CD - Depósito 9 - Depósito 09 | Devolução =========
        //======================================================================
      End; // If bgMontouPost Then
      // Envio do Http.post ====================================================
      // Ler XML de Retorno e Salva no Banco de Dados ==========================
      //========================================================================

// OdirApagar - 14/11/2018 -> Metodo de Parametro incluido em tgMetodos
//      //========================================================================
//      // Encerra Loop nos Metodos - Quando Metodo é Envia por Parametro ========
//      //========================================================================
//      If Trim(sgParametroMetodo)<>'' Then
//      Begin
//        Break;
//      End; // If Trim(sgParametroMetodo)<>'' Then
//      // Encerra Loop nos Metodos - Quando Metodo é Envia por Parametro ========
//      //========================================================================
    End; // For iFor:=0 to tgMetodos.Count-1 do
    // Loop nos Metodos - FIM ==================================================
    //==========================================================================

    bUmaVez:=True;

    DMLinxWebService.CDS_Lojas.Next;
  End; // While Not DMLinxWebService.CDS_Lojas.Eof do
  DMLinxWebService.CDS_Lojas.Close;
  // FIM do Processamento ======================================================
  // ===========================================================================

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
      GRUPOLOJAS  VARCHAR(20) = Belshop – 8560

      COMMENT ON COLUMN LINXWEBSERVICE.GRUPOLOJAS IS
      'Chave para Acesso ao Método: LinxGrupoLojas';

  - LINXMOVIMENTO
    =============
    - Alteração do Tamanho
      - PROTOCOLO_AUT_NFE   VARCHAR(15)

  - LINXFATURAS
    ===========
    DOCUMENTO_SEM_TEF varchar(60) - Descrição
    AUTORIZACAO_SEM_TEF - Descrição


CRIAR NOVO
==========
  - CREATE TABLE LINXGRUPOLOJAS
                 ==============
    - Não Baixou Nada

  - CREATE TABLE LINXMOVIMENTOTROCAS
                 ===================
    - Erro na Estrutura
      - Web Service Com Campos Diferentes em Relação a Documentação
    - Baixou

  - CREATE TABLE LINXMOVIMENTOORIGEMDEVOLUCOES
                 =============================
    - Não Baixou Nada

  - CREATE TABLE LINXMOVIMENTOSERIAL
                 ===================
    - Não Baixou Nada

  - CREATE TABLE LINXMOVIMENTOPLANOS
                 ====================
    - Erro na Descrição do Campo
      - Na Estrutura Campo "VALOR" Correto "TOTAL"
    - Baixou

  - CREATE TABLE LINXMOVIMENTOACOESPROMOCIONAIS
                 ==============================
    - Erro na Descrição do Campo
      - Na Estrutura Campo "VALOR_DESCONTO" Correto "DESCONTO_ITEM"
    - Baixou

  - CREATE TABLE LINXACOESPROMOCIONAIS
                 =====================
    - Erro na Descrição do Campo
      - Na Estrutura Campo
        - Ativa     BIT 1=Sim, 0=Não - Baixa Errado: TRUE/FALSE
        - Excluida  BIT 1=Sim, 0=Não - Baixa Errado: TRUE/FALSE
        - Integrada BIT 1=Sim, 0=Não - Baixa Correto: 1/0
    - Baixou

  - CREATE TABLE LINXPRODUTOSCODBAR
                 ==================
    - Baixou

  - CREATE TABLE LINXLANCCONTABIL
                 ================
    - Erro na Estrutura
      - Web Service não apresenta Campos da Documentação
          - cod_historico  - Código do Histórico no Microvix   - INT
          - desc_historico - Descrição do Histórico - VARCHAR(50)

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

ATENÇÃO
========
   - LinxVendedores
    - Não Consta na Relação do Escopo do WebService no Inicio do Documento de
      ESPECIFICAÇÃO Web Service Linx Microvix Padrão
}

