{
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Todos os Controles estão em: C:\Projetos\BelShop\Outras Pastas\Documentos\@Coisas BelShop.doc
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
}

unit UDMBelShop;

interface

uses
  Windows, Forms, SysUtils, Classes, DBXpress, FMTBcd, ExtCtrls, SqlExpr, IBCustomDataSet,
  IBUpdateSQL, DB, IBQuery, IBDatabase, DBClient, Provider, Math, WinInet, Variants,
  StrUtils, QStdCtrls, Menus, IBTable, SimpleDS;

type
  TDMBelShop = class(TDataModule)
    SQLC: TSQLConnection;
    SDS_Busca: TSQLDataSet;
    DSP_Usuario: TDataSetProvider;
    CDS_Usuario: TClientDataSet;
    DS_Usuario: TDataSource;
    SDS_Usuario: TSQLDataSet;
    SDS_Pesquisa: TSQLDataSet;
    CDS_Pesquisa: TClientDataSet;
    DSP_Pesquisa: TDataSetProvider;
    DS_Pesquisa: TDataSource;
    DSP_Empresa: TDataSetProvider;
    CDS_Empresa: TClientDataSet;
    DS_Empresa: TDataSource;
    SDS_Empresa: TSQLDataSet;
    CDS_EmpresaCOD_FILIAL: TStringField;
    CDS_EmpresaENDERECO_IP: TStringField;
    CDS_EmpresaPASTA_BASE_DADOS: TStringField;
    CDS_EmpresaDES_BASE_DADOS: TStringField;
    CDS_EmpresaCOD_EMP: TStringField;
    CDS_EmpresaRAZAO_SOCIAL: TStringField;
    CDS_EmpresaTIP_EMP: TStringField;
    CDS_EmpresaDES_BAIRRO: TStringField;
    CDS_EmpresaDES_CIDADE: TStringField;
    CDS_EmpresaCOD_UF: TStringField;
    CDS_EmpresaCOD_CEP: TStringField;
    CDS_EmpresaNUM_CNPJ: TStringField;
    CDS_EmpresaDES_ENDERECO: TStringField;
    CDS_EmpresaNUM_ENDERECO: TStringField;
    CDS_EmpresaCOMPL_ENDERECO: TStringField;
    CDS_EmpresaIND_ATIVO: TStringField;
    CDS_EmpresaUSU_INCLUI: TIntegerField;
    CDS_EmpresaDTA_INCLUI: TSQLTimeStampField;
    CDS_EmpresaUSU_ALTERA: TIntegerField;
    CDS_EmpresaDTA_ALTERA: TSQLTimeStampField;
    CDS_EmpresaINSCR_ESTADUAL: TStringField;
    DS_AComprar: TDataSource;
    SDS_AComprarItens: TSQLDataSet;
    CDS_AComprarItens: TClientDataSet;
    DSP_AComprarItens: TDataSetProvider;
    DS_AComprarItens: TDataSource;
    CDS_AComprarItensCOD_ITEM: TStringField;
    CDS_AComprarItensDES_ITEM: TStringField;
    CDS_AComprarItensNUM_DOCUMENTO: TIntegerField;
    DSP_AComprarOCs: TDataSetProvider;
    CDS_AComprarOCs: TClientDataSet;
    DS_AComprarOCs: TDataSource;
    SDS_AComprarOCs: TSQLDataSet;
    CDS_AComprarOCsCOD_EMP_FIL: TStringField;
    CDS_AComprarOCsFORNECEDOR: TStringField;
    CDS_AComprarOCsTOTAL_OC: TFMTBCDField;
    CDS_AComprarOCsTOTALGERAL: TAggregateField;
    CDS_AComprarOCsDES_EMP_FIL: TStringField;
    CDS_AComprarOCsNUM_OC_GERADA: TIntegerField;
    CDS_AComprarOCsGERAR: TStringField;
    CDS_Sugestao: TClientDataSet;
    SDS_Sugestao: TSQLDataSet;
    DSP_Sugestao: TDataSetProvider;
    CDS_SugestaoNUM_SEQ: TIntegerField;
    CDS_SugestaoNUM_DOCUMENTO: TIntegerField;
    CDS_SugestaoDTA_DOCUMENTO: TSQLTimeStampField;
    CDS_SugestaoIND_OC_GERADA: TStringField;
    CDS_SugestaoDTA_OC_GERADA: TSQLTimeStampField;
    CDS_SugestaoNUM_OC_GERADA: TIntegerField;
    CDS_SugestaoOBS_OC: TStringField;
    CDS_SugestaoCOD_EMPRESA: TStringField;
    CDS_SugestaoDES_EMPRESA: TStringField;
    CDS_SugestaoCOD_ITEM: TStringField;
    CDS_SugestaoDES_ITEM: TStringField;
    CDS_SugestaoQTD_SUGERIDA: TFMTBCDField;
    CDS_SugestaoQTD_ACOMPRAR: TFMTBCDField;
    CDS_SugestaoQTD_SALDO: TFMTBCDField;
    CDS_SugestaoQTD_TRANSITO: TFMTBCDField;
    CDS_SugestaoQTD_DISPONIVEL: TFMTBCDField;
    CDS_SugestaoQTD_MEDIA_MES: TFMTBCDField;
    CDS_SugestaoQTD_MEDIA_DIA: TFMTBCDField;
    CDS_SugestaoQTD_DEM_MES1: TFMTBCDField;
    CDS_SugestaoQTD_DEM_MES2: TFMTBCDField;
    CDS_SugestaoQTD_DEM_MES3: TFMTBCDField;
    CDS_SugestaoQTD_DEM_MES4: TFMTBCDField;
    CDS_SugestaoQTD_DEM_MES5: TFMTBCDField;
    CDS_SugestaoQTD_DEM_MES6: TFMTBCDField;
    CDS_SugestaoQTD_DEM_MES7: TFMTBCDField;
    CDS_SugestaoQTD_DEM_MES8: TFMTBCDField;
    CDS_SugestaoUNI_COMPRA: TIntegerField;
    CDS_SugestaoUNI_VENDA: TIntegerField;
    CDS_SugestaoCOD_BARRAS: TStringField;
    CDS_SugestaoCOD_GRUPO: TStringField;
    CDS_SugestaoDES_GRUPO: TStringField;
    CDS_SugestaoCOD_SUBGRUPO: TStringField;
    CDS_SugestaoDES_SUBGRUPO: TStringField;
    CDS_SugestaoDES_GENERICO: TStringField;
    CDS_SugestaoCOD_APLICACAO: TStringField;
    CDS_SugestaoDES_APLICACAO: TStringField;
    CDS_SugestaoCLA_CURVA_ABC: TStringField;
    CDS_SugestaoCOD_FAMILIA_PRECO: TStringField;
    CDS_SugestaoDES_FAMILIA_PRECO: TStringField;
    CDS_SugestaoDTA_ULT_COMPRA: TDateField;
    CDS_SugestaoCOD_FOR_ULT_COMPRA: TStringField;
    CDS_SugestaoDES_FOR_ULT_COMPRA: TStringField;
    CDS_SugestaoQTD_ULT_COMPRA: TFMTBCDField;
    CDS_SugestaoVLR_UNI_ULT_COMPRA: TFMTBCDField;
    CDS_SugestaoVLR_TOT_ULT_COMPRA: TFMTBCDField;
    CDS_SugestaoVLR_UNI_COMPRA: TFMTBCDField;
    CDS_SugestaoDTA_ULT_VENDA: TDateField;
    CDS_SugestaoCOD_CLI_ULT_VENDA: TStringField;
    CDS_SugestaoDES_CLI_ULT_VENDA: TStringField;
    CDS_SugestaoQTD_ULT_VENDA: TFMTBCDField;
    CDS_SugestaoVLR_UNI_ULT_VENDA: TFMTBCDField;
    CDS_SugestaoVLR_TOT_ULT_VENDA: TFMTBCDField;
    CDS_SugestaoVLR_UNI_VENDA: TFMTBCDField;
    CDS_SugestaoCOD_LISTA_VENDA: TStringField;
    CDS_SugestaoDES_LISTA_VENDA: TStringField;
    CDS_SugestaoCOD_LISTA_COMPRA: TStringField;
    CDS_SugestaoDES_LISTA_COMPRA: TStringField;
    CDS_SugestaoVLR_CUSTO_MEDIO: TFMTBCDField;
    CDS_SugestaoVLR_TOT_VENDA: TFMTBCDField;
    CDS_SugestaoVLR_TOT_COMPRA: TFMTBCDField;
    CDS_SugestaoVLR_BRUTO: TFMTBCDField;
    CDS_SugestaoVLR_DESCONTOS: TFMTBCDField;
    CDS_SugestaoVLR_DESPESAS: TFMTBCDField;
    CDS_SugestaoVLR_FRETE: TFMTBCDField;
    CDS_SugestaoIND_SOMA_IPI_BASE_ICMS: TStringField;
    CDS_SugestaoIND_SOMA_FRETE_BASE_ICMS: TStringField;
    CDS_SugestaoIND_SOMA_DESPESA_BASE_ICMS: TStringField;
    CDS_SugestaoIND_SOMA_IPI_BASE_ST: TStringField;
    CDS_SugestaoIND_SOMA_FRETE_BASE_ST: TStringField;
    CDS_SugestaoIND_SOMA_DESPESA_BASE_ST: TStringField;
    CDS_SugestaoCOD_SIT_TRIBUTARIA: TStringField;
    CDS_SugestaoCOD_IPI: TStringField;
    CDS_SugestaoIND_IPI: TStringField;
    CDS_SugestaoPER_IPI: TFMTBCDField;
    CDS_SugestaoVLR_IPI: TFMTBCDField;
    CDS_SugestaoCOD_ICMS: TStringField;
    CDS_SugestaoPER_REDUCAO_ICMS: TFMTBCDField;
    CDS_SugestaoVLR_REDUCAO_ICMS: TFMTBCDField;
    CDS_SugestaoVLR_BASE_ICMS: TFMTBCDField;
    CDS_SugestaoPER_ICMS: TFMTBCDField;
    CDS_SugestaoVLR_ICMS: TFMTBCDField;
    CDS_SugestaoCOD_GRUPO_ST: TIntegerField;
    CDS_SugestaoDES_GRUPO_ST: TStringField;
    CDS_SugestaoPER_MARGEM_ST: TFMTBCDField;
    CDS_SugestaoIND_ST: TStringField;
    CDS_SugestaoVLR_BASE_ST: TFMTBCDField;
    CDS_SugestaoPER_ST: TFMTBCDField;
    CDS_SugestaoVLR_ST: TFMTBCDField;
    CDS_SugestaoPER_REPASSE: TFMTBCDField;
    CDS_SugestaoVLR_REPASSE: TFMTBCDField;
    CDS_SugestaoCOD_COMPROVANTE_ICMS: TStringField;
    CDS_SugestaoCOD_FORNECEDOR: TStringField;
    CDS_SugestaoDES_FORNECEDOR: TStringField;
    CDS_SugestaoTIP_PESSOA: TStringField;
    CDS_SugestaoDES_EMAIL: TStringField;
    CDS_SugestaoQTD_NR_DIAS: TIntegerField;
    CDS_SugestaoQTD_NR_MESES: TIntegerField;
    CDS_SugestaoQTD_TOT_MESES: TIntegerField;
    CDS_AComprarOCsTOTAL_BRUTO: TFMTBCDField;
    CDS_AComprarOCsTOTAL_DESCONTOS: TFMTBCDField;
    CDS_AComprarOCsTOTAL_IPI: TFMTBCDField;
    CDS_AComprarOCsTOTAL_DESPESAS: TFMTBCDField;
    CDS_AComprarOCsTOTAL_ST: TFMTBCDField;
    CDS_AComprarOCsTOTAL_FRETE: TFMTBCDField;
    CDS_AComprarOCsTOTAL_ICMS: TFMTBCDField;
    CDS_AComprarOCsTOTAL_REPASSE: TFMTBCDField;
    CDS_AComprarOCsCOD_COMPROVANTE_ICMS: TStringField;
    CDS_AComprarOCsTOTAL_ITENS: TIntegerField;
    CDS_AComprarOCsTOTAL_QTD: TFMTBCDField;
    CDS_SugestaoPER_DESCONTO: TFMTBCDField;
    CDS_SugestaoCOD_COMPRADOR: TIntegerField;
    IBDB_BelShop: TIBDatabase;
    IBT_BelShop: TIBTransaction;
    IBQ_AComprar: TIBQuery;
    IBQ_AComprarNUM_SEQ: TIntegerField;
    IBQ_AComprarNUM_DOCUMENTO: TIntegerField;
    IBQ_AComprarDTA_DOCUMENTO: TDateTimeField;
    IBQ_AComprarIND_OC_GERADA: TIBStringField;
    IBQ_AComprarDTA_OC_GERADA: TDateTimeField;
    IBQ_AComprarNUM_OC_GERADA: TIntegerField;
    IBQ_AComprarOBS_OC: TIBStringField;
    IBQ_AComprarCOD_EMPRESA: TIBStringField;
    IBQ_AComprarDES_EMPRESA: TIBStringField;
    IBQ_AComprarCOD_ITEM: TIBStringField;
    IBQ_AComprarDES_ITEM: TIBStringField;
    IBQ_AComprarQTD_SUGERIDA: TIBBCDField;
    IBQ_AComprarQTD_ACOMPRAR: TIBBCDField;
    IBQ_AComprarQTD_SALDO: TIBBCDField;
    IBQ_AComprarQTD_TRANSITO: TIBBCDField;
    IBQ_AComprarQTD_DISPONIVEL: TIBBCDField;
    IBQ_AComprarQTD_MEDIA_MES: TIBBCDField;
    IBQ_AComprarQTD_MEDIA_DIA: TIBBCDField;
    IBQ_AComprarQTD_DEM_MES1: TIBBCDField;
    IBQ_AComprarQTD_DEM_MES2: TIBBCDField;
    IBQ_AComprarQTD_DEM_MES3: TIBBCDField;
    IBQ_AComprarQTD_DEM_MES4: TIBBCDField;
    IBQ_AComprarQTD_DEM_MES5: TIBBCDField;
    IBQ_AComprarQTD_DEM_MES6: TIBBCDField;
    IBQ_AComprarQTD_DEM_MES7: TIBBCDField;
    IBQ_AComprarQTD_DEM_MES8: TIBBCDField;
    IBQ_AComprarUNI_COMPRA: TIntegerField;
    IBQ_AComprarUNI_VENDA: TIntegerField;
    IBQ_AComprarCOD_BARRAS: TIBStringField;
    IBQ_AComprarCOD_GRUPO: TIBStringField;
    IBQ_AComprarDES_GRUPO: TIBStringField;
    IBQ_AComprarCOD_SUBGRUPO: TIBStringField;
    IBQ_AComprarDES_SUBGRUPO: TIBStringField;
    IBQ_AComprarDES_GENERICO: TIBStringField;
    IBQ_AComprarCOD_APLICACAO: TIBStringField;
    IBQ_AComprarDES_APLICACAO: TIBStringField;
    IBQ_AComprarCLA_CURVA_ABC: TIBStringField;
    IBQ_AComprarCOD_FAMILIA_PRECO: TIBStringField;
    IBQ_AComprarDES_FAMILIA_PRECO: TIBStringField;
    IBQ_AComprarDTA_ULT_COMPRA: TDateField;
    IBQ_AComprarCOD_FOR_ULT_COMPRA: TIBStringField;
    IBQ_AComprarDES_FOR_ULT_COMPRA: TIBStringField;
    IBQ_AComprarQTD_ULT_COMPRA: TIBBCDField;
    IBQ_AComprarVLR_UNI_ULT_COMPRA: TIBBCDField;
    IBQ_AComprarVLR_TOT_ULT_COMPRA: TIBBCDField;
    IBQ_AComprarVLR_UNI_COMPRA: TIBBCDField;
    IBQ_AComprarPER_DESCONTO: TIBBCDField;
    IBQ_AComprarDTA_ULT_VENDA: TDateField;
    IBQ_AComprarCOD_CLI_ULT_VENDA: TIBStringField;
    IBQ_AComprarDES_CLI_ULT_VENDA: TIBStringField;
    IBQ_AComprarQTD_ULT_VENDA: TIBBCDField;
    IBQ_AComprarVLR_UNI_ULT_VENDA: TIBBCDField;
    IBQ_AComprarVLR_TOT_ULT_VENDA: TIBBCDField;
    IBQ_AComprarVLR_UNI_VENDA: TIBBCDField;
    IBQ_AComprarCOD_LISTA_VENDA: TIBStringField;
    IBQ_AComprarDES_LISTA_VENDA: TIBStringField;
    IBQ_AComprarCOD_LISTA_COMPRA: TIBStringField;
    IBQ_AComprarDES_LISTA_COMPRA: TIBStringField;
    IBQ_AComprarVLR_CUSTO_MEDIO: TIBBCDField;
    IBQ_AComprarVLR_TOT_VENDA: TIBBCDField;
    IBQ_AComprarVLR_TOT_COMPRA: TIBBCDField;
    IBQ_AComprarVLR_BRUTO: TIBBCDField;
    IBQ_AComprarVLR_DESCONTOS: TIBBCDField;
    IBQ_AComprarVLR_DESPESAS: TIBBCDField;
    IBQ_AComprarVLR_FRETE: TIBBCDField;
    IBQ_AComprarIND_SOMA_IPI_BASE_ICMS: TIBStringField;
    IBQ_AComprarIND_SOMA_FRETE_BASE_ICMS: TIBStringField;
    IBQ_AComprarIND_SOMA_DESPESA_BASE_ICMS: TIBStringField;
    IBQ_AComprarIND_SOMA_IPI_BASE_ST: TIBStringField;
    IBQ_AComprarIND_SOMA_FRETE_BASE_ST: TIBStringField;
    IBQ_AComprarIND_SOMA_DESPESA_BASE_ST: TIBStringField;
    IBQ_AComprarCOD_SIT_TRIBUTARIA: TIBStringField;
    IBQ_AComprarCOD_IPI: TIBStringField;
    IBQ_AComprarIND_IPI: TIBStringField;
    IBQ_AComprarPER_IPI: TIBBCDField;
    IBQ_AComprarVLR_IPI: TIBBCDField;
    IBQ_AComprarCOD_ICMS: TIBStringField;
    IBQ_AComprarPER_REDUCAO_ICMS: TIBBCDField;
    IBQ_AComprarVLR_REDUCAO_ICMS: TIBBCDField;
    IBQ_AComprarVLR_BASE_ICMS: TIBBCDField;
    IBQ_AComprarPER_ICMS: TIBBCDField;
    IBQ_AComprarVLR_ICMS: TIBBCDField;
    IBQ_AComprarCOD_GRUPO_ST: TIntegerField;
    IBQ_AComprarDES_GRUPO_ST: TIBStringField;
    IBQ_AComprarPER_MARGEM_ST: TIBBCDField;
    IBQ_AComprarIND_ST: TIBStringField;
    IBQ_AComprarVLR_BASE_ST: TIBBCDField;
    IBQ_AComprarPER_ST: TIBBCDField;
    IBQ_AComprarVLR_ST: TIBBCDField;
    IBQ_AComprarPER_REPASSE: TIBBCDField;
    IBQ_AComprarVLR_REPASSE: TIBBCDField;
    IBQ_AComprarCOD_COMPROVANTE_ICMS: TIBStringField;
    IBQ_AComprarCOD_FORNECEDOR: TIBStringField;
    IBQ_AComprarDES_FORNECEDOR: TIBStringField;
    IBQ_AComprarTIP_PESSOA: TIBStringField;
    IBQ_AComprarDES_EMAIL: TIBStringField;
    IBQ_AComprarQTD_NR_DIAS: TIntegerField;
    IBQ_AComprarQTD_NR_MESES: TIntegerField;
    IBQ_AComprarQTD_TOT_MESES: TIntegerField;
    IBQ_AComprarCOD_COMPRADOR: TIntegerField;
    IBU_AComprar: TIBUpdateSQL;
    IBQ_Executa: TIBQuery;
    IBQ_Busca: TIBQuery;
    CDS_AComprarOCsCOD_FORNECEDOR: TStringField;
    DS_OrdemCompra: TDataSource;
    IBQ_OrdemCompra: TIBQuery;
    IBQ_OrdemCompraDES_EMPRESA: TIBStringField;
    IBQ_OrdemCompraNUM_OC_GERADA: TIntegerField;
    IBQ_OrdemCompraENDERECO: TIBStringField;
    IBQ_OrdemCompraDES_BAIRRO: TIBStringField;
    IBQ_OrdemCompraDES_CIDADE: TIBStringField;
    IBQ_OrdemCompraCOD_UF: TIBStringField;
    IBQ_OrdemCompraCOD_CEP: TIBStringField;
    IBQ_OrdemCompraNUM_CNPJ: TIBStringField;
    IBQ_OrdemCompraINSCR_ESTADUAL: TIBStringField;
    IBQ_OrdemCompraSITUACAO: TIBStringField;
    IBQ_OrdemCompraDTA_PEDIDO: TDateField;
    IBQ_OrdemCompraDTA_ENTREGA: TDateField;
    IBQ_OrdemCompraCOD_FORNECEDOR: TIBStringField;
    IBQ_OrdemCompraDES_FORNECEDOR: TIBStringField;
    IBQ_OrdemCompraCOD_ITEM: TIBStringField;
    IBQ_OrdemCompraCOD_REFERENCIA_FORN: TIBStringField;
    IBQ_OrdemCompraDES_ITEM: TIBStringField;
    IBQ_OrdemCompraUNI_COMPRA: TIntegerField;
    IBQ_OrdemCompraUNI_VENDA: TIntegerField;
    IBQ_OrdemCompraQTD_ACOMPRAR: TIBBCDField;
    IBQ_OrdemCompraVLR_UNI_COMPRA: TIBBCDField;
    IBQ_OrdemCompraPER_DESCONTO: TIBBCDField;
    IBQ_OrdemCompraVLR_TOT_COMPRA: TIBBCDField;
    IBQ_OrdemCompraOBS_OC: TIBStringField;
    IBQ_OrdemCompraCOD_COMPRADOR: TIntegerField;
    IBQ_OrdemCompraDES_USUARIO: TIBStringField;
    CDS_AComprarOCsIND_OC_GERADA: TStringField;
    CDS_AComprarItensCOD_COMPRADOR: TIntegerField;
    IBQ_AComprarBLOB_TEXTO: TMemoField;
    DS_Busca: TDataSource;
    CDS_AComprarOCsNUM_DOCUMENTO: TIntegerField;
    CDS_AComprarItensDES_USUARIO: TStringField;
    SDS_DtaHoraServidor: TSQLDataSet;
    CDS_AComprarOCsDTA_OC_GERADA: TDateField;
    SDS_FluxoFornecedor: TSQLDataSet;
    CDS_FluxoFornecedor: TClientDataSet;
    DSP_FluxoFornecedor: TDataSetProvider;
    DS_FluxoFornecedor: TDataSource;
    SDS_While: TSQLDataSet;
    CDS_While: TClientDataSet;
    DSP_While: TDataSetProvider;
    CDS_FluxoFornecedorCOD_EMPRESA: TStringField;
    CDS_FluxoFornecedorRAZAO_SOCIAL: TStringField;
    CDS_FluxoFornecedorCOD_HISTORICO: TIntegerField;
    CDS_FluxoFornecedorDES_HISTORICO: TStringField;
    CDS_FluxoFornecedorNUM_DOCUMENTO: TStringField;
    CDS_FluxoFornecedorNUM_SERIE: TStringField;
    CDS_FluxoFornecedorVLR_CREDITO: TFMTBCDField;
    CDS_FluxoFornecedorVLR_DEBITO: TFMTBCDField;
    CDS_FluxoFornecedorTXT_OBS: TStringField;
    CDS_FluxoFornecedorCOD_FORNECEDOR: TStringField;
    CDS_FluxoFornecedorDES_FORNECEDOR: TStringField;
    CDS_FluxoFornecedorDATA: TDateField;
    CDS_FluxoFornecedorNUM_SEQ: TIntegerField;
    CDS_FluxoFornecedorNUM_CHAVENF: TStringField;
    CDS_FluxoFornecedorTIP_DEBCRE: TStringField;
    SDS_EmpProcessa: TSQLDataSet;
    CDS_EmpProcessa: TClientDataSet;
    DSP_EmpProcessa: TDataSetProvider;
    DS_EmpProcessa: TDataSource;
    CDS_EmpProcessaPROC: TStringField;
    CDS_EmpProcessaCOD_FILIAL: TStringField;
    CDS_EmpProcessaENDERECO_IP: TStringField;
    CDS_EmpProcessaPASTA_BASE_DADOS: TStringField;
    CDS_EmpProcessaDES_BASE_DADOS: TStringField;
    CDS_EmpProcessaCOD_EMP: TStringField;
    CDS_EmpProcessaRAZAO_SOCIAL: TStringField;
    CDS_EmpProcessaTIP_EMP: TStringField;
    CDS_EmpProcessaDES_BAIRRO: TStringField;
    CDS_EmpProcessaDES_CIDADE: TStringField;
    CDS_EmpProcessaCOD_UF: TStringField;
    CDS_EmpProcessaCOD_CEP: TStringField;
    CDS_EmpProcessaNUM_CNPJ: TStringField;
    CDS_EmpProcessaINSCR_ESTADUAL: TStringField;
    CDS_EmpProcessaDES_ENDERECO: TStringField;
    CDS_EmpProcessaNUM_ENDERECO: TStringField;
    CDS_EmpProcessaCOMPL_ENDERECO: TStringField;
    CDS_EmpProcessaIND_ATIVO: TStringField;
    CDS_EmpProcessaUSU_INCLUI: TIntegerField;
    CDS_EmpProcessaDTA_INCLUI: TSQLTimeStampField;
    CDS_EmpProcessaUSU_ALTERA: TIntegerField;
    CDS_EmpProcessaDTA_ALTERA: TSQLTimeStampField;
    DS_AComprarEdita: TDataSource;
    IBQ_AComprarEdita: TIBQuery;
    IBU_AComprarEdita: TIBUpdateSQL;
    IBQ_AComprarEditaNUM_DOCUMENTO: TIntegerField;
    IBQ_AComprarEditaDTA_DOCUMENTO: TDateTimeField;
    IBQ_AComprarEditaIND_OC_GERADA: TIBStringField;
    IBQ_AComprarEditaDTA_OC_GERADA: TDateTimeField;
    IBQ_AComprarEditaNUM_OC_GERADA: TIntegerField;
    IBQ_AComprarEditaOBS_OC: TIBStringField;
    IBQ_AComprarEditaCOD_EMPRESA: TIBStringField;
    IBQ_AComprarEditaDES_EMPRESA: TIBStringField;
    IBQ_AComprarEditaCOD_ITEM: TIBStringField;
    IBQ_AComprarEditaDES_ITEM: TIBStringField;
    IBQ_AComprarEditaQTD_SUGERIDA: TIBBCDField;
    IBQ_AComprarEditaQTD_ACOMPRAR: TIBBCDField;
    IBQ_AComprarEditaQTD_SALDO: TIBBCDField;
    IBQ_AComprarEditaQTD_TRANSITO: TIBBCDField;
    IBQ_AComprarEditaQTD_DISPONIVEL: TIBBCDField;
    IBQ_AComprarEditaQTD_MEDIA_MES: TIBBCDField;
    IBQ_AComprarEditaQTD_MEDIA_DIA: TIBBCDField;
    IBQ_AComprarEditaQTD_DEM_MES1: TIBBCDField;
    IBQ_AComprarEditaQTD_DEM_MES2: TIBBCDField;
    IBQ_AComprarEditaQTD_DEM_MES3: TIBBCDField;
    IBQ_AComprarEditaQTD_DEM_MES4: TIBBCDField;
    IBQ_AComprarEditaQTD_DEM_MES5: TIBBCDField;
    IBQ_AComprarEditaQTD_DEM_MES6: TIBBCDField;
    IBQ_AComprarEditaQTD_DEM_MES7: TIBBCDField;
    IBQ_AComprarEditaQTD_DEM_MES8: TIBBCDField;
    IBQ_AComprarEditaUNI_COMPRA: TIntegerField;
    IBQ_AComprarEditaUNI_VENDA: TIntegerField;
    IBQ_AComprarEditaCOD_BARRAS: TIBStringField;
    IBQ_AComprarEditaCOD_GRUPO: TIBStringField;
    IBQ_AComprarEditaDES_GRUPO: TIBStringField;
    IBQ_AComprarEditaCOD_SUBGRUPO: TIBStringField;
    IBQ_AComprarEditaDES_SUBGRUPO: TIBStringField;
    IBQ_AComprarEditaDES_GENERICO: TIBStringField;
    IBQ_AComprarEditaCOD_APLICACAO: TIBStringField;
    IBQ_AComprarEditaDES_APLICACAO: TIBStringField;
    IBQ_AComprarEditaCOD_REFERENCIA: TIBStringField;
    IBQ_AComprarEditaCLA_CURVA_ABC: TIBStringField;
    IBQ_AComprarEditaCOD_FAMILIA_PRECO: TIBStringField;
    IBQ_AComprarEditaDES_FAMILIA_PRECO: TIBStringField;
    IBQ_AComprarEditaDTA_ULT_COMPRA: TDateField;
    IBQ_AComprarEditaCOD_FOR_ULT_COMPRA: TIBStringField;
    IBQ_AComprarEditaDES_FOR_ULT_COMPRA: TIBStringField;
    IBQ_AComprarEditaQTD_ULT_COMPRA: TIBBCDField;
    IBQ_AComprarEditaVLR_UNI_ULT_COMPRA: TIBBCDField;
    IBQ_AComprarEditaVLR_TOT_ULT_COMPRA: TIBBCDField;
    IBQ_AComprarEditaVLR_UNI_COMPRA: TIBBCDField;
    IBQ_AComprarEditaPER_DESCONTO: TIBBCDField;
    IBQ_AComprarEditaDTA_ULT_VENDA: TDateField;
    IBQ_AComprarEditaCOD_CLI_ULT_VENDA: TIBStringField;
    IBQ_AComprarEditaDES_CLI_ULT_VENDA: TIBStringField;
    IBQ_AComprarEditaQTD_ULT_VENDA: TIBBCDField;
    IBQ_AComprarEditaVLR_UNI_ULT_VENDA: TIBBCDField;
    IBQ_AComprarEditaVLR_TOT_ULT_VENDA: TIBBCDField;
    IBQ_AComprarEditaVLR_UNI_VENDA: TIBBCDField;
    IBQ_AComprarEditaCOD_LISTA_VENDA: TIBStringField;
    IBQ_AComprarEditaDES_LISTA_VENDA: TIBStringField;
    IBQ_AComprarEditaCOD_LISTA_COMPRA: TIBStringField;
    IBQ_AComprarEditaDES_LISTA_COMPRA: TIBStringField;
    IBQ_AComprarEditaVLR_CUSTO_MEDIO: TIBBCDField;
    IBQ_AComprarEditaVLR_TOT_VENDA: TIBBCDField;
    IBQ_AComprarEditaVLR_TOT_COMPRA: TIBBCDField;
    IBQ_AComprarEditaVLR_BRUTO: TIBBCDField;
    IBQ_AComprarEditaVLR_DESCONTOS: TIBBCDField;
    IBQ_AComprarEditaVLR_DESPESAS: TIBBCDField;
    IBQ_AComprarEditaVLR_FRETE: TIBBCDField;
    IBQ_AComprarEditaIND_SOMA_IPI_BASE_ICMS: TIBStringField;
    IBQ_AComprarEditaIND_SOMA_FRETE_BASE_ICMS: TIBStringField;
    IBQ_AComprarEditaIND_SOMA_DESPESA_BASE_ICMS: TIBStringField;
    IBQ_AComprarEditaIND_SOMA_IPI_BASE_ST: TIBStringField;
    IBQ_AComprarEditaIND_SOMA_FRETE_BASE_ST: TIBStringField;
    IBQ_AComprarEditaIND_SOMA_DESPESA_BASE_ST: TIBStringField;
    IBQ_AComprarEditaCOD_SIT_TRIBUTARIA: TIBStringField;
    IBQ_AComprarEditaCOD_IPI: TIBStringField;
    IBQ_AComprarEditaIND_IPI: TIBStringField;
    IBQ_AComprarEditaPER_IPI: TIBBCDField;
    IBQ_AComprarEditaVLR_IPI: TIBBCDField;
    IBQ_AComprarEditaCOD_ICMS: TIBStringField;
    IBQ_AComprarEditaPER_REDUCAO_ICMS: TIBBCDField;
    IBQ_AComprarEditaVLR_REDUCAO_ICMS: TIBBCDField;
    IBQ_AComprarEditaVLR_BASE_ICMS: TIBBCDField;
    IBQ_AComprarEditaPER_ICMS: TIBBCDField;
    IBQ_AComprarEditaVLR_ICMS: TIBBCDField;
    IBQ_AComprarEditaCOD_GRUPO_ST: TIntegerField;
    IBQ_AComprarEditaDES_GRUPO_ST: TIBStringField;
    IBQ_AComprarEditaPER_MARGEM_ST: TIBBCDField;
    IBQ_AComprarEditaIND_ST: TIBStringField;
    IBQ_AComprarEditaVLR_BASE_ST: TIBBCDField;
    IBQ_AComprarEditaPER_ST: TIBBCDField;
    IBQ_AComprarEditaVLR_ST: TIBBCDField;
    IBQ_AComprarEditaPER_REPASSE: TIBBCDField;
    IBQ_AComprarEditaVLR_REPASSE: TIBBCDField;
    IBQ_AComprarEditaCOD_COMPROVANTE_ICMS: TIBStringField;
    IBQ_AComprarEditaCOD_REFERENCIA_FORN: TIBStringField;
    IBQ_AComprarEditaCOD_FORNECEDOR: TIBStringField;
    IBQ_AComprarEditaDES_FORNECEDOR: TIBStringField;
    IBQ_AComprarEditaTIP_PESSOA: TIBStringField;
    IBQ_AComprarEditaDES_EMAIL: TIBStringField;
    IBQ_AComprarEditaQTD_NR_DIAS: TIntegerField;
    IBQ_AComprarEditaQTD_NR_MESES: TIntegerField;
    IBQ_AComprarEditaQTD_TOT_MESES: TIntegerField;
    IBQ_AComprarEditaCOD_COMPRADOR: TIntegerField;
    IBQ_AComprarEditaBLOB_TEXTO: TMemoField;
    DSP_OCs: TDataSetProvider;
    CDS_OCs: TClientDataSet;
    CDS_OCsCOD_EMP_FIL: TStringField;
    CDS_OCsDES_EMP_FIL: TStringField;
    CDS_OCsTOTAL_OC: TFMTBCDField;
    CDS_OCsNUM_OC_GERADA: TIntegerField;
    CDS_OCsDTA_OC_GERADA: TDateField;
    CDS_OCsTOTAL_BRUTO: TFMTBCDField;
    CDS_OCsTOTAL_DESCONTOS: TFMTBCDField;
    CDS_OCsTOTAL_IPI: TFMTBCDField;
    CDS_OCsTOTAL_DESPESAS: TFMTBCDField;
    CDS_OCsTOTAL_FRETE: TFMTBCDField;
    CDS_OCsTOTAL_ST: TFMTBCDField;
    CDS_OCsTOTAL_ICMS: TFMTBCDField;
    CDS_OCsTOTAL_REPASSE: TFMTBCDField;
    CDS_OCsCOD_COMPROVANTE_ICMS: TStringField;
    CDS_OCsTOTAL_ITENS: TIntegerField;
    CDS_OCsTOTAL_QTD: TFMTBCDField;
    CDS_OCsTOTALGERAL: TAggregateField;
    DS_OCs: TDataSource;
    SDS_OCs: TSQLDataSet;
    CDS_OCsNUM_DOCUMENTO: TIntegerField;
    CDS_OCsCOD_FORNECEDOR: TStringField;
    CDS_VerTransito: TClientDataSet;
    DSP_VerTransito: TDataSetProvider;
    DS_VerTransito: TDataSource;
    SDS_VerTransito: TSQLDataSet;
    CDS_VerTransitoCODFILIAL: TStringField;
    CDS_VerTransitoIND_TIPO: TStringField;
    CDS_VerTransitoCODPRODUTO: TStringField;
    CDS_VerTransitoCODFORNECEDOR: TStringField;
    CDS_VerTransitoNOMEFORNECEDOR: TStringField;
    CDS_VerTransitoDTA_REF: TDateField;
    CDS_VerTransitoQUANT_REF: TFMTBCDField;
    CDS_VerTransitoPRECO: TFMTBCDField;
    CDS_VerTransitoNUM_REF: TIntegerField;
    CDS_VerTransitoCOD_SITUACAO: TStringField;
    CDS_VerTransitoDES_SITUACAO: TStringField;
    CDS_VerTransitoVALBRUTO: TFMTBCDField;
    CDS_VerTransitoVALDESCONTO: TFMTBCDField;
    CDS_VerTransitoVALSUBSTITUICAO: TFMTBCDField;
    CDS_VerTransitoVLR_TOTAL_REF: TFMTBCDField;
    CDS_VerTransitoDTA_ATUALIZACAO: TSQLTimeStampField;
    SDS_BuscaRapida: TSQLDataSet;
    CDS_BuscaRapida: TClientDataSet;
    DSP_BuscaRapida: TDataSetProvider;
    DS_BuscaRapida: TDataSource;
    CDS_Comprovantes: TClientDataSet;
    DSP_Comprovantes: TDataSetProvider;
    DS_Comprovantes: TDataSource;
    SDS_Comprovantes: TSQLDataSet;
    CDS_ComprovantesCOD_COMPROV: TStringField;
    CDS_ComprovantesDES_COMPROV: TStringField;
    CDS_ComprovantesCOD_GR_FINAN: TIntegerField;
    CDS_ComprovantesIND_PLANILHA: TStringField;
    CDS_ComprovantesSOMAR_EM: TStringField;
    CDS_ComprovantesIND_ATIVO: TStringField;
    CDS_ComprovantesSUBTRAIR_DE: TStringField;
    CDS_ComprovantesDES_GR_FINAN: TStringField;
    CDS_Comprovante: TClientDataSet;
    DSP_Comprovante: TDataSetProvider;
    DS_Comprovante: TDataSource;
    SDS_Comprovante: TSQLDataSet;
    CDS_ComprovanteCOD_COMPROV: TStringField;
    CDS_ComprovanteDES_COMPROV: TStringField;
    CDS_ComprovanteCOD_GR_FINAN: TIntegerField;
    CDS_ComprovanteIND_PLANILHA: TStringField;
    CDS_ComprovanteSOMAR_EM: TStringField;
    CDS_ComprovanteSUBTRAIR_DE: TStringField;
    CDS_ComprovanteIND_ATIVO: TStringField;
    CDS_ComprovanteUSU_INCLUI: TIntegerField;
    CDS_ComprovanteDTA_INCLUI: TSQLTimeStampField;
    CDS_ComprovanteUSU_ALTERA: TIntegerField;
    CDS_ComprovanteDTA_ALTERA: TSQLTimeStampField;
    CDS_Gr_Financeiro: TClientDataSet;
    DSP_Gr_Financeiro: TDataSetProvider;
    DS_Gr_Financeiro: TDataSource;
    SDS_Gr_Financeiro: TSQLDataSet;
    CDS_Gr_FinanceiroCOD_GR_FINAN: TIntegerField;
    CDS_Gr_FinanceiroDES_GR_FINAN: TStringField;
    CDS_Gr_FinanceiroDES_PESQUISA: TStringField;
    CDS_Gr_FinanceiroNUM_ORDEM: TIntegerField;
    CDS_Gr_FinanceiroUSU_INCLUI: TIntegerField;
    CDS_Gr_FinanceiroDTA_INCLUI: TSQLTimeStampField;
    CDS_Gr_FinanceiroUSU_ALTERA: TIntegerField;
    CDS_Gr_FinanceiroDTA_ALTERA: TSQLTimeStampField;
    CDS_ComprovantesIND_SOMA_GRUPO: TStringField;
    CDS_ComprovanteIND_SOMA_GRUPO: TStringField;
    CDS_ComprovantesDES_FORMULA: TStringField;
    CDS_ComprovanteDES_FORMULA: TStringField;
    CDS_Gr_FinanceiroIND_ATIVO: TStringField;
    CDS_ComprovanteNUM_DECIMAIS: TIntegerField;
    CDS_ComprovantesNUM_DECIMAIS: TIntegerField;
    CDS_DemonsResultado: TClientDataSet;
    DSP_DemonsResultado: TDataSetProvider;
    DS_DemonsResultado: TDataSource;
    SDS_DemonsResultado: TSQLDataSet;
    CDS_DemonsResultadoCOD_VISAO: TIntegerField;
    CDS_DemonsResultadoCOD_DEMONSTRATIVO: TIntegerField;
    CDS_DemonsResultadoDES_DEMONSTRATIVO: TStringField;
    CDS_DemonsResultadoDES_FORMULA: TStringField;
    CDS_DemonsResultadoNUM_DECIMAIS: TIntegerField;
    CDS_DemonsResultadoNUM_ORDEM: TIntegerField;
    CDS_DemonsResultadoUSU_INCLUI: TIntegerField;
    CDS_DemonsResultadoDTA_INCLUI: TSQLTimeStampField;
    CDS_DemonsResultadoUSU_ALTERA: TIntegerField;
    CDS_DemonsResultadoDTA_ALTERA: TSQLTimeStampField;
    SDS_Demandas: TSQLDataSet;
    DSP_Demandas: TDataSetProvider;
    CDS_Demandas: TClientDataSet;
    CDS_VisualObjetos: TClientDataSet;
    DSP_VisualObjetos: TDataSetProvider;
    DS_VisualObjetos: TDataSource;
    SDS_VisualObjetos: TSQLDataSet;
    CDS_VisualObjetosCOD_USUARIO: TIntegerField;
    CDS_VisualObjetosDES_USUARIO: TStringField;
    CDS_Objetivos: TClientDataSet;
    DSP_Objetivos: TDataSetProvider;
    DS_Objetivos: TDataSource;
    SDS_Objetivos: TSQLDataSet;
    CDS_ObjetivosCOD_OBJETIVO: TIntegerField;
    CDS_ObjetivosDES_OBJETIVO: TStringField;
    CDS_ObjetivosIND_FIXO: TStringField;
    CDS_ObjetivosDES_FORMULA: TStringField;
    CDS_ObjetivosNUM_DECIMAIS: TIntegerField;
    CDS_ObjetivosNUM_ORDEM: TIntegerField;
    CDS_ObjetivosIND_ATIVO: TStringField;
    CDS_ObjetivosUSU_INCLUI: TIntegerField;
    CDS_ObjetivosDTA_INCLUI: TSQLTimeStampField;
    CDS_ObjetivosUSU_ALTERA: TIntegerField;
    CDS_ObjetivosDTA_ALTERA: TSQLTimeStampField;
    DSP_ObjetivosEmpresas: TDataSetProvider;
    CDS_ObjetivosEmpresas: TClientDataSet;
    DS_ObjetivosEmpresas: TDataSource;
    SDS_ObjetivosEmpresas: TSQLDataSet;
    CDS_ObjetivosMetas: TClientDataSet;
    DSP_ObjetivosMetas: TDataSetProvider;
    DS_ObjetivosMetas: TDataSource;
    SDS_ObjetivosMetas: TSQLDataSet;
    CDS_ObjetivosMetasCOD_FILIAL: TStringField;
    CDS_ObjetivosMetasCOD_OBJETIVO: TIntegerField;
    CDS_ObjetivosMetasDES_ANO: TIntegerField;
    CDS_ObjetivosMetasOBJ_MES01: TFMTBCDField;
    CDS_ObjetivosMetasOBJ_MES02: TFMTBCDField;
    CDS_ObjetivosMetasOBJ_MES03: TFMTBCDField;
    CDS_ObjetivosMetasOBJ_MES04: TFMTBCDField;
    CDS_ObjetivosMetasOBJ_MES05: TFMTBCDField;
    CDS_ObjetivosMetasOBJ_MES06: TFMTBCDField;
    CDS_ObjetivosMetasOBJ_MES07: TFMTBCDField;
    CDS_ObjetivosMetasOBJ_MES08: TFMTBCDField;
    CDS_ObjetivosMetasOBJ_MES09: TFMTBCDField;
    CDS_ObjetivosMetasOBJ_MES10: TFMTBCDField;
    CDS_ObjetivosMetasOBJ_MES11: TFMTBCDField;
    CDS_ObjetivosMetasOBJ_MES12: TFMTBCDField;
    CDS_ObjetivosMetasUSU_INCLUI: TIntegerField;
    CDS_ObjetivosMetasDTA_INCLUI: TSQLTimeStampField;
    CDS_ObjetivosMetasUSU_ALTERA: TIntegerField;
    CDS_ObjetivosMetasDTA_ALTERA: TSQLTimeStampField;
    CDS_FeriadosAno: TClientDataSet;
    DSP_FeriadosAno: TDataSetProvider;
    DS_FeriadosAno: TDataSource;
    SDS_FeriadosAno: TSQLDataSet;
    CDS_FeriadosAnoDTA_FERIADO: TDateField;
    CDS_FeriadosAnoDES_FERIADO: TStringField;
    CDS_FeriadosAnoIND_CALCULADO: TStringField;
    CDS_FeriadosAnoIND_ATIVO: TStringField;
    CDS_EmpresaENDERECO_IP_EXTERNO: TStringField;
    CDS_ObjetivosPROC: TStringField;
    CDS_ObjetivosIND_OPERACAO: TIntegerField;
    CDS_ObjetivosIND_NAOCOMPRA: TStringField;
    SDS_Enderecamento: TSQLDataSet;
    DSP_Enderecamento: TDataSetProvider;
    CDS_Enderecamento: TClientDataSet;
    CDS_EnderecamentoCOD_ZONA: TIntegerField;
    CDS_EnderecamentoDES_ZONA: TStringField;
    CDS_EnderecamentoCOD_CORREDOR: TStringField;
    CDS_EnderecamentoDES_CORREDOR: TStringField;
    CDS_EnderecamentoCOD_PRATELEIRA: TStringField;
    CDS_EnderecamentoDES_PRATELEIRA: TStringField;
    CDS_EnderecamentoCOD_GAVETA: TStringField;
    CDS_EnderecamentoDES_GAVETA: TStringField;
    CDS_EnderecamentoTIP_CURVAABC: TStringField;
    CDS_EnderecamentoCOD_PRODUTO: TStringField;
    CDS_EnderecamentoDES_PRODUTO: TStringField;
    CDS_EnderecamentoCOD_FORNECEDOR: TStringField;
    CDS_EnderecamentoDES_FORNECEDOR: TStringField;
    DS_Enderecamento: TDataSource;
    SDS_ConectaEmpresa: TSQLDataSet;
    CDS_ConectaEmpresa: TClientDataSet;
    DSP_ConectaEmpresa: TDataSetProvider;
    CDS_Auditorias: TClientDataSet;
    DSP_Auditorias: TDataSetProvider;
    DS_Auditorias: TDataSource;
    SDS_Auditorias: TSQLDataSet;
    CDS_AuditoriasCOD_LOJA: TStringField;
    CDS_AuditoriasDTA_AUDITORIA: TDateField;
    CDS_AuditoriasQTD_EST_INICIAL: TFMTBCDField;
    CDS_AuditoriasVLR_EST_NEG_REAL: TFMTBCDField;
    CDS_AuditoriasVLR_EST_LOJA: TFMTBCDField;
    CDS_AuditoriasVLR_EST_INICIAL: TFMTBCDField;
    CDS_AuditoriasQTD_COD_CONTADOS: TIntegerField;
    CDS_AuditoriasQTD_COD_OK: TIntegerField;
    CDS_AuditoriasQTD_COD_ENTRADAS: TIntegerField;
    CDS_AuditoriasVLR_COD_ENTRADAS: TFMTBCDField;
    CDS_AuditoriasPER_COD_ENTRADAS: TFMTBCDField;
    CDS_AuditoriasQTD_COD_SAIDAS: TIntegerField;
    CDS_AuditoriasVLR_COD_SAIDAS: TFMTBCDField;
    CDS_AuditoriasPER_COD_SAIDAS: TFMTBCDField;
    CDS_AuditoriasQTD_COD_NAO_CONTADOS: TIntegerField;
    CDS_AuditoriasVLR_COD_NAO_CONTADOS: TFMTBCDField;
    CDS_AuditoriasPER_COD_NAO_CONTADOS: TFMTBCDField;
    CDS_AuditoriasVLR_EST_FINAL: TFMTBCDField;
    CDS_AuditoriasPER_ADMISSIVEL: TFMTBCDField;
    CDS_AuditoriasVLR_ADMISS_EQUIVALENTE: TFMTBCDField;
    CDS_AuditoriasPER_PERDA_FINAL: TFMTBCDField;
    CDS_AuditoriasVLR_PERDA_EQUIVALENTE: TFMTBCDField;
    CDS_AuditoriasQTD_PROD_NAO_FECHADOS: TIntegerField;
    CDS_AuditoriasPER_PROD_FECHADOS: TFMTBCDField;
    CDS_AuditoriasUSU_INCLUI: TIntegerField;
    CDS_AuditoriasDTA_INCLUI: TSQLTimeStampField;
    CDS_AuditoriasUSU_ALTERA: TIntegerField;
    CDS_AuditoriasDTA_ALTERA: TSQLTimeStampField;
    CDS_AuditoriasPER_PROD_NAO_FECHADOS: TFMTBCDField;
    CDS_AuditoriasPER_PROD_FECHADOS_ENCONT: TFMTBCDField;
    CDS_AuditoriasPER_PROD_NAO_FECHADOS_ENCONT: TFMTBCDField;
    CDS_AuditoriasPER_OBJ_PER_ADMISSIVEL: TFMTBCDField;
    CDS_AuditoriasPER_OBJ_VLR_ADMISSIVEL: TFMTBCDField;
    CDS_AuditoriasQTD_PROD_NAO_RESOLVIDOS: TIntegerField;
    CDS_AuditoriasPER_PROD_NAO_CONTADOS: TFMTBCDField;
    CDS_AuditoriasPER_PROD_NAO_RESOLVIDOS: TFMTBCDField;
    CDS_AuditoriasPER_PROD_NAO_RESOLVIDOS_ENCONT: TFMTBCDField;
    CDS_AuditoriaDatas: TClientDataSet;
    DSP_AuditoriaDatas: TDataSetProvider;
    DS_AuditoriaDatas: TDataSource;
    SDS_AuditoriaDatas: TSQLDataSet;
    CDS_AuditoriaDatasDTA_AUDITORIA: TDateField;
    CDS_AComprarItensDTA_DOCUMENTO: TSQLTimeStampField;
    CDS_ObjetivosULT_12_MESES: TStringField;
    CDS_AuditoriaAnalise: TClientDataSet;
    DSP_AuditoriaAnalise: TDataSetProvider;
    DS_AuditoriaAnalise: TDataSource;
    SDS_AuditoriaAnalise: TSQLDataSet;
    CDS_AuditoriaAnaliseCOD_LOJA: TStringField;
    CDS_AuditoriaAnaliseRAZAO_SOCIAL: TStringField;
    CDS_AuditoriaAnalisePER_ADMISSIVEL: TFMTBCDField;
    CDS_AuditoriaAnalisePER_PERDA_FINAL: TFMTBCDField;
    CDS_AuditoriaAnaliseVLR_ADMISS_EQUIVALENTE: TFMTBCDField;
    CDS_AuditoriaAnaliseVLR_PERDA_EQUIVALENTE: TFMTBCDField;
    CDS_AuditoriaAnalisePER_OBJ_PER_ADMISSIVEL: TFMTBCDField;
    CDS_AuditoriaAnalisePER_OBJ_VLR_ADMISSIVEL: TFMTBCDField;
    CDS_AuditoriaAnaliseDTA_AUDITORIA: TDateField;
    CDS_AuditoriaAnaliseCORPER: TStringField;
    IBQ_AComprarIND_TRANSF: TIBStringField;
    IBQ_AComprarDTA_LIM_TRANSF: TDateField;
    IBQ_AComprarQTD_TRANSF: TIBBCDField;
    IBQ_AComprarIND_USAR: TIBStringField;
    IBQ_AComprarIND_QTD_ACIMA: TIBBCDField;
    IBQ_AComprarEditaQTD_TRANSF: TIBBCDField;   
    IBQ_AComprarEditaIND_TRANSF: TIBStringField;
    IBQ_AComprarEditaDTA_LIM_TRANSF: TDateField;
    IBQ_AComprarEditaIND_USAR: TIBStringField;
    IBQ_AComprarEditaIND_QTD_ACIMA: TIBBCDField;
    CDS_SugestaoBLOB_TEXTO: TMemoField;
    CDS_SugestaoIND_TRANSF: TStringField;
    CDS_SugestaoDTA_LIM_TRANSF: TDateField;
    CDS_SugestaoIND_USAR: TStringField;
    CDS_SugestaoIND_QTD_ACIMA: TFMTBCDField;
    CDS_SugestaoQTD_TRANSF: TFMTBCDField;
    SDS_Join: TSQLDataSet;
    DSP_Join: TDataSetProvider;
    CDS_Join: TClientDataSet;
    DS_Join: TDataSource;
    SDS_FechaCaixa: TSQLDataSet;
    DS_FechaCaixa: TDataSource;
    DSP_FechaCaixa: TDataSetProvider;
    CDS_FechaCaixa: TClientDataSet;
    CDS_FechaCaixaCOD_CREDITO: TIntegerField;
    CDS_FechaCaixaDES_CREDITO: TStringField;
    CDS_FechaCaixaNUM_DOCTO: TStringField;
    CDS_FechaCaixaVLR_CREDITO: TFMTBCDField;
    CDS_FechaCaixaVLR_INFORMADO: TFMTBCDField;
    CDS_FechaCaixaVLR_DIFERENCA: TFMTBCDField;
    CDS_FechaCaixaOBS: TStringField;
    CDS_FechaCaixaIND_INFORMADO: TStringField;
    CDS_FechaCaixaUSU_INCLUI: TIntegerField;
    SDS_FechaCaixaTotais: TSQLDataSet;
    DS_FechaCaixaTotais: TDataSource;
    DSP_FechaCaixaTotais: TDataSetProvider;
    CDS_FechaCaixaTotais: TClientDataSet;
    CDS_FechaCaixaTotaisCOD_CREDITO: TIntegerField;
    CDS_FechaCaixaTotaisDES_CREDITO: TStringField;
    CDS_FechaCaixaTotaisNUM_DOCTO: TStringField;
    CDS_FechaCaixaTotaisVLR_CREDITO: TFMTBCDField;
    CDS_FechaCaixaTotaisVLR_INFORMADO: TFMTBCDField;
    CDS_FechaCaixaTotaisVLR_DIFERENCA: TFMTBCDField;
    CDS_FechaCaixaTotaisIND_INFORMADO: TStringField;
    CDS_FechaCaixaTotaisUSU_INCLUI: TIntegerField;
    SDS_FechaDiarioMov: TSQLDataSet;
    DSP_FechaDiarioMov: TDataSetProvider;
    CDS_FechaDiarioMov: TClientDataSet;
    DS_FechaDiarioMov: TDataSource;
    CDS_FechaDiarioMovNUM_SEQ: TIntegerField;
    CDS_FechaDiarioMovTIP_DOCTO: TIntegerField;
    CDS_FechaDiarioMovDES_TIPO: TStringField;
    CDS_FechaDiarioMovNUM_DOCTO: TStringField;
    CDS_FechaDiarioMovDES_DOCTO: TStringField;
    CDS_FechaDiarioMovNUM_NOTA: TStringField;
    CDS_FechaDiarioMovDTA_VENCIMENTO: TDateField;
    CDS_FechaDiarioMovVLR_DOCTO: TFMTBCDField;
    CDS_FechaDiarioMovIND_REALIZADO: TStringField;
    CDS_FechaDiarioMovVLR_REALIZADO: TFMTBCDField;
    CDS_FechaDiarioMovVLR_DIFERENCA: TFMTBCDField;
    SDS_FechaDiarioTot: TSQLDataSet;
    DSP_FechaDiarioTot: TDataSetProvider;
    CDS_FechaDiarioTot: TClientDataSet;
    DS_FechaDiarioTot: TDataSource;
    CDS_FechaDiarioTotNUM_SEQ: TIntegerField;
    CDS_FechaDiarioTotTIP_DOCTO: TIntegerField;
    CDS_FechaDiarioTotNUM_DOCTO: TStringField;
    CDS_FechaDiarioTotDES_DOCTO: TStringField;
    CDS_FechaDiarioTotVLR_DOCTO: TFMTBCDField;
    CDS_FechaCaixaTotaisOBS: TStringField;
    DS_Geral: TDataSource;
    CDS_EmpresaDTA_LIM_TRANSF: TDateField;
    CDS_EmpresaQTD_TRANSF_DIA: TIntegerField;
    CDS_EmpresaCOD_LISTAPRE: TStringField;
    SDS_Seguranca: TSQLDataSet;
    DSP_Seguranca: TDataSetProvider;
    CDS_Seguranca: TClientDataSet;
    CDS_SegurancaUSUARIO: TStringField;
    CDS_SegurancaTAG: TIntegerField;
    CDS_SegurancaACESSO: TIntegerField;
    CDS_SegurancaINCLUSAO: TIntegerField;
    CDS_SegurancaALTERACAO: TIntegerField;
    CDS_SegurancaEXCLUSAO: TIntegerField;
    CDS_SegurancaRELATORIO: TIntegerField;
    DS_Seguranca: TDataSource;
    SQLSP: TSQLStoredProc;
    CDS_EmpProcessaCOD_LISTAPRE: TStringField;
    CDS_EmpresaNUM_SINDICATO: TStringField;
    CDS_EmpresaNUM_ALVARA_MUN: TStringField;
    IBQ_Contar: TIBQuery;
    SDS_ParametrosSis: TSQLDataSet;
    CDS_ParametrosSis: TClientDataSet;
    DSP_ParametrosSis: TDataSetProvider;
    DS_ParametrosSis: TDataSource;
    CDS_ParametrosSisNUM_DIAS_CONCILIA: TIntegerField;
    CDS_ParametrosSisIND_CONSISTE_NFE: TStringField;
    CDS_ParametrosSisHR_IN_CONS_NFE_OC: TStringField;
    CDS_ParametrosSisDIA_INI_COMISSAO_PROF: TStringField;
    CDS_ParametrosSisDIA_FIM_COMISSAO_PROF: TStringField;
    SDS_Consistencias: TSQLDataSet;
    DSP_Consistencias: TDataSetProvider;
    CDS_Consistencias: TClientDataSet;
    DS_Consistencias: TDataSource;
    CDS_ConsistenciasNUM_SEQ: TIntegerField;
    CDS_ConsistenciasCODIGO: TIntegerField;
    CDS_ConsistenciasDES_MODULO: TStringField;
    CDS_ConsistenciasDES_LABEL: TStringField;
    CDS_ConsistenciasDES_COMPONENTE: TStringField;
    CDS_ConsistenciasIND_LIBERADO: TStringField;
    CDS_ConsistenciasUSU_ALTERA: TIntegerField;
    CDS_ConsistenciasDTA_ALTERA: TSQLTimeStampField;
    SDS_EmpBusca: TSQLDataSet;
    CDS_EmpBusca: TClientDataSet;
    DSP_EmpBusca: TDataSetProvider;
    DS_EmpBusca: TDataSource;
    CDS_AComprarOCsTOTAL_VENDA: TFMTBCDField;
    CDS_AComprarOCsTOTAL_ITENS_ACOMPRAR: TFMTBCDField;
    CDS_AComprarOCsTOTALITENS: TAggregateField;
    CDS_ParametrosSisCOMPUTER_MASTER: TStringField;
    CDS_ParametrosSisCOMPUTER_SERVER: TStringField;
    CDS_ParametrosSisIP_SERVER: TStringField;
    CDS_ParametrosSisIP_INTERNET_SERVER: TStringField;
    CDS_ParametrosSisFTP_USER: TStringField;
    CDS_ParametrosSisFTP_PASSWORD: TStringField;
    CDS_ParametrosSisMES_COBRANCA_SINDICATO: TStringField;
    CDS_ParametrosSisPOS_COBRANCA_SINDICATO: TStringField;
    CDS_ParametrosSisDIA_COBRANCA_SINDICATO: TStringField;
    CDS_ParametrosSisVLR_TAXASINDICATO: TFMTBCDField;
    SQLQuery2: TSQLQuery;
    SQLQuery3: TSQLQuery;
    IBQ_OrdemCompraCOD_BARRAS: TIBStringField;
    CDS_AComprarOCsTIPO: TStringField;
    CDS_AComprarOCsTOTAL_QTD_TRANSF: TFMTBCDField;
    IBQ_AComprarCOD_REFERENCIA: TIBStringField;
    IBQ_AComprarCOD_REFERENCIA_FORN: TIBStringField;
    CDS_SugestaoCOD_REFERENCIA: TStringField;
    CDS_SugestaoCOD_REFERENCIA_FORN: TStringField;
    IBQ_AComprarEditaNUM_SEQ: TIntegerField;
    CDS_AComprarOCsTOTAL_OCS: TFMTBCDField;
    CDS_ParametrosSisFTP_USAR: TStringField;
    ClientDataSet1: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    DateField1: TDateField;
    FMTBCDField1: TFMTBCDField;
    FMTBCDField2: TFMTBCDField;
    FMTBCDField3: TFMTBCDField;
    FMTBCDField4: TFMTBCDField;
    FMTBCDField5: TFMTBCDField;
    FMTBCDField6: TFMTBCDField;
    StringField3: TStringField;
    DataSetProvider1: TDataSetProvider;
    DataSource2: TDataSource;
    SDS_SidicomPermissoes: TSQLDataSet;
    CDS_EmpresaCOD_CONTABIL: TStringField;
    IBQ_OrdemCompraENDERECAMENTO: TIBStringField;
    SDS_CurvaFinanceira: TSQLDataSet;
    DS_CurvaFinanceira: TDataSource;
    DSP_CurvaFinanceira: TDataSetProvider;
    CDS_CurvaFinanceira: TClientDataSet;
    CDS_CurvaFinanceiraCOD_LOJA: TStringField;
    CDS_CurvaFinanceiraCOD_PRODUTO: TStringField;
    CDS_CurvaFinanceiraIND_CURVA: TStringField;
    CDS_CurvaFinanceiraEST_MINIMO: TIntegerField;
    CDS_CurvaFinanceiraUSU_ALTERA: TIntegerField;
    CDS_CurvaFinanceiraDTA_ALTERA: TSQLTimeStampField;
    IBQ_AComprarQTD_SUGERIDA_ANO: TIBBCDField;
    IBQ_AComprarQTD_TRANSF_PERIODO: TIBBCDField;
    IBQ_AComprarQTD_TRANSF_ANO: TIBBCDField;
    IBQ_AComprarEST_MINIMO: TIBBCDField;
    IBQ_AComprarDIAS_ESTOCAGEM: TIntegerField;
    IBQ_AComprarEditaQTD_SUGERIDA_ANO: TIBBCDField;
    IBQ_AComprarEditaQTD_TRANSF_PERIODO: TIBBCDField;
    IBQ_AComprarEditaQTD_TRANSF_ANO: TIBBCDField;
    IBQ_AComprarEditaEST_MINIMO: TIBBCDField;
    IBQ_AComprarEditaDIAS_ESTOCAGEM: TIntegerField;
    IBQ_OC_ComprarAdd: TIBQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    DateTimeField1: TDateTimeField;
    IBStringField1: TIBStringField;
    DateTimeField2: TDateTimeField;
    IntegerField3: TIntegerField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    IBBCDField1: TIBBCDField;
    IBBCDField2: TIBBCDField;
    IBBCDField3: TIBBCDField;
    IBBCDField4: TIBBCDField;
    IBBCDField5: TIBBCDField;
    IBBCDField6: TIBBCDField;
    IBBCDField7: TIBBCDField;
    IBBCDField8: TIBBCDField;
    IBBCDField9: TIBBCDField;
    IBBCDField10: TIBBCDField;
    IBBCDField11: TIBBCDField;
    IBBCDField12: TIBBCDField;
    IBBCDField13: TIBBCDField;
    IBBCDField14: TIBBCDField;
    IBBCDField15: TIBBCDField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    IBStringField9: TIBStringField;
    IBStringField10: TIBStringField;
    IBStringField11: TIBStringField;
    IBStringField12: TIBStringField;
    IBStringField13: TIBStringField;
    IBStringField14: TIBStringField;
    IBStringField15: TIBStringField;
    IBStringField16: TIBStringField;
    IBStringField17: TIBStringField;
    IBStringField18: TIBStringField;
    DateField2: TDateField;
    IBStringField19: TIBStringField;
    IBStringField20: TIBStringField;
    IBBCDField16: TIBBCDField;
    IBBCDField17: TIBBCDField;
    IBBCDField18: TIBBCDField;
    IBBCDField19: TIBBCDField;
    IBBCDField20: TIBBCDField;
    DateField3: TDateField;
    IBStringField21: TIBStringField;
    IBStringField22: TIBStringField;
    IBBCDField21: TIBBCDField;
    IBBCDField22: TIBBCDField;
    IBBCDField23: TIBBCDField;
    IBBCDField24: TIBBCDField;
    IBStringField23: TIBStringField;
    IBStringField24: TIBStringField;
    IBStringField25: TIBStringField;
    IBStringField26: TIBStringField;
    IBBCDField25: TIBBCDField;
    IBBCDField26: TIBBCDField;
    IBBCDField27: TIBBCDField;
    IBBCDField28: TIBBCDField;
    IBBCDField29: TIBBCDField;
    IBBCDField30: TIBBCDField;
    IBBCDField31: TIBBCDField;
    IBStringField27: TIBStringField;
    IBStringField28: TIBStringField;
    IBStringField29: TIBStringField;
    IBStringField30: TIBStringField;
    IBStringField31: TIBStringField;
    IBStringField32: TIBStringField;
    IBStringField33: TIBStringField;
    IBStringField34: TIBStringField;
    IBStringField35: TIBStringField;
    IBBCDField32: TIBBCDField;
    IBBCDField33: TIBBCDField;
    IBStringField36: TIBStringField;
    IBBCDField34: TIBBCDField;
    IBBCDField35: TIBBCDField;
    IBBCDField36: TIBBCDField;
    IBBCDField37: TIBBCDField;
    IBBCDField38: TIBBCDField;
    IntegerField6: TIntegerField;
    IBStringField37: TIBStringField;
    IBBCDField39: TIBBCDField;
    IBStringField38: TIBStringField;
    IBBCDField40: TIBBCDField;
    IBBCDField41: TIBBCDField;
    IBBCDField42: TIBBCDField;
    IBBCDField43: TIBBCDField;
    IBBCDField44: TIBBCDField;
    IBStringField39: TIBStringField;
    IBStringField40: TIBStringField;
    IBStringField41: TIBStringField;
    IBStringField42: TIBStringField;
    IBStringField43: TIBStringField;
    IBStringField44: TIBStringField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    MemoField1: TMemoField;
    IBStringField45: TIBStringField;
    DateField4: TDateField;
    IBBCDField45: TIBBCDField;
    IBStringField46: TIBStringField;
    IBBCDField46: TIBBCDField;
    IBBCDField47: TIBBCDField;
    IBBCDField48: TIBBCDField;
    IBBCDField49: TIBBCDField;
    IBBCDField50: TIBBCDField;
    IntegerField11: TIntegerField;
    IBUP_OC_ComprarAdd: TIBUpdateSQL;
    SDS_DemandasNovo: TSQLDataSet;
    DSP_DemandasNovo: TDataSetProvider;
    CDS_DemandasNovo: TClientDataSet;
    SDS_UltCompraTransito: TSQLDataSet;
    DSP_UltCompraTransito: TDataSetProvider;
    CDS_UltCompraTransito: TClientDataSet;
    CDS_SugestaoQTD_SUGERIDA_ANO: TFMTBCDField;
    CDS_SugestaoQTD_TRANSF_PERIODO: TFMTBCDField;
    CDS_SugestaoQTD_TRANSF_ANO: TFMTBCDField;
    CDS_SugestaoEST_MINIMO: TFMTBCDField;
    CDS_SugestaoDIAS_ESTOCAGEM: TIntegerField;
    CDS_SugestaoQTD_DEMANDA_DIA: TFMTBCDField;
    CDS_SugestaoQTD_DEMANDA_ANO: TFMTBCDField;
    CDS_SugestaoQTD_DIAS_ANO: TIntegerField;
    IBQ_AComprarEditaQTD_DEMANDA_ANO: TIBBCDField;
    IBQ_AComprarEditaQTD_DIAS_ANO: TIntegerField;
    IBQ_OC_ComprarAddQTD_DEMANDA_ANO: TIBBCDField;
    IBQ_OC_ComprarAddQTD_DIAS_ANO: TIntegerField;
    IBQ_AComprarQTD_DEMANDA_ANO: TIBBCDField;
    IBQ_AComprarQTD_DIAS_ANO: TIntegerField;
    IBQ_AComprarQTD_DEMANDA_DIA: TIBBCDField;
    IBQ_AComprarEditaQTD_DEMANDA_DIA: TIBBCDField;
    IBQ_OC_ComprarAddQTD_DEMANDA_DIA: TIBBCDField;
    IBQ_AComprarDATAINCLUSAO: TDateField;
    IBQ_AComprarESTADO: TIBStringField;
    IBQ_AComprarEditaDATAINCLUSAO: TDateField;
    IBQ_AComprarEditaESTADO: TIBStringField;
    IBQ_OC_ComprarAddDATAINCLUSAO: TDateField;
    IBQ_OC_ComprarAddESTADO: TIBStringField;
    CDS_SugestaoDATAINCLUSAO: TDateField;
    CDS_SugestaoESTADO: TStringField;
    DSP_OCComparaPedidos: TDataSetProvider;
    CDS_OCComparaPedidos: TClientDataSet;
    DS_OCComparaPedidos: TDataSource;
    SDS_OCComparaPedidos: TSQLDataSet;
    CDS_OCComparaPedidosCOD_LOJA: TStringField;
    CDS_OCComparaPedidosDES_LOJA: TStringField;
    CDS_OCComparaPedidosPEDIDOS: TStringField;
    CDS_OCComparaPedidosCOD_FORN: TStringField;
    CDS_OCComparaPedidosDES_FORNECEDOR: TStringField;
    CDS_OCComparaPedidosTOTAL_PEDIDO: TFMTBCDField;
    CDS_OCComparaPedidosTOTAL_VENDA: TFMTBCDField;
    CDS_OCComparaPedidosTOTAL_BRUTO: TFMTBCDField;
    CDS_OCComparaPedidosTOTAL_DESCONTOS: TFMTBCDField;
    CDS_OCComparaPedidosTOTAL_IPI: TFMTBCDField;
    CDS_OCComparaPedidosTOTAL_DESPESAS: TFMTBCDField;
    CDS_OCComparaPedidosTOTAL_ST: TFMTBCDField;
    CDS_OCComparaPedidosTOTAL_FRETE: TFMTBCDField;
    CDS_OCComparaPedidosTOTAL_ICMS: TFMTBCDField;
    CDS_OCComparaPedidosTOTAL_REPASSE: TFMTBCDField;
    CDS_OCComparaPedidosNUM_DOCTO: TIntegerField;
    CDS_OCComparaPedidosTOTAL_ITENS: TIntegerField;
    CDS_OCComparaPedidosTOTAL_QTDS: TFMTBCDField;
    CDS_OCComparaPedidosTOTAL_ITENS_COMPRAR: TFMTBCDField;
    IBQ_AComprarDATAALTERACAO: TDateField;
    IBQ_AComprarEditaDATAALTERACAO: TDateField;
    IBQ_OC_ComprarAddDATAALTERACAO: TDateField;
    SDS_Busca1: TSQLDataSet;
    CDS_Busca1: TClientDataSet;
    DSP_Busca1: TDataSetProvider;
    DS_Busca1: TDataSource;
    IBQ_AComprarIND_TRANSF_CD: TIBStringField;
    IBQ_AComprarDOC_TRANSF_CD: TIntegerField;
    IBQ_AComprarEditaIND_TRANSF_CD: TIBStringField;
    IBQ_AComprarEditaDOC_TRANSF_CD: TIntegerField;
    IBQ_OC_ComprarAddIND_TRANSF_CD: TIBStringField;
    IBQ_OC_ComprarAddDOC_TRANSF_CD: TIntegerField;
    CDS_SugestaoDATAALTERACAO: TDateField;
    CDS_SugestaoIND_TRANSF_CD: TStringField;
    CDS_SugestaoDOC_TRANSF_CD: TIntegerField;
    IBQ_ConsultaFilial: TSQLQuery;
    IBQ_BuscaRapida: TIBQuery;
    SQLQuery1: TSQLQuery;
    SQLQ_Busca: TSQLQuery;
    CDS_DemandasNovoCODPRODUTO: TStringField;
    CDS_DemandasNovoDTA_REF: TDateField;
    CDS_DemandasNovoDEMANDA: TStringField;
    CDS_DemandasNovoNUM_DIAS: TIntegerField;
    CDS_DemandasNovoDEM: TFMTBCDField;
    SDS_BuscaCurva: TSQLQuery;
    SDS_BuscaCurvaIND_CURVA_QTD: TStringField;
    SDS_BuscaCurvaIND_CURVA_VLR: TStringField;
    DSP_Busca: TDataSetProvider;
    CDS_Busca: TClientDataSet;
    DSP_SQLQ_Busca: TDataSetProvider;
    CDS_SQLQ_Busca: TClientDataSet;
    SDS_FaltasCDLojas: TSQLDataSet;
    CDS_FaltasCDLojas: TClientDataSet;
    DSP_FaltasCDLojas: TDataSetProvider;
    DS_FaltasCDLojas: TDataSource;
    SDS_FluxoFornecedores: TSQLDataSet;
    CDS_FluxoFornecedores: TClientDataSet;
    DSP_FluxoFornecedores: TDataSetProvider;
    DS_FluxoFornecedores: TDataSource;
    CDS_FluxoFornecedoresCOD_FORNECEDOR: TStringField;
    CDS_FluxoFornecedoresNOMEFORNECEDOR: TStringField;
    CDS_FluxoFornecedoresDTA_INICIAL: TDateField;
    CDS_FluxoFornecedoresDTA_FINAL: TDateField;
    SDS_FluxoFornHistorico: TSQLDataSet;
    CDS_FluxoFornHistorico: TClientDataSet;
    DSP_FluxoFornHistorico: TDataSetProvider;
    DS_FluxoFornHistorico: TDataSource;
    CDS_FluxoFornecedorLOJA: TStringField;
    CDS_FluxoFornecedoresVLR_SALDO: TFMTBCDField;
    CDS_FluxoFornecedoresDTA_CC: TDateField;
    CDS_FluxoFornecedoresORDEM: TIntegerField;
    CDS_FluxoFornecedoresDES_AUX: TStringField;
    CDS_FluxoFornecedoresLIMITE: TStringField;
    CDS_FluxoFornecedorVLR_SALDO: TFloatField;
    CDS_FluxoFornecedoresCOMPRADOR: TStringField;
    SDS_EstoquePrevisao: TSQLDataSet;
    DSP_EstoquePrevisao: TDataSetProvider;
    CDS_EstoquePrevisao: TClientDataSet;
    DS_EstoquePrevisao: TDataSource;
    CDS_EstoquePrevisaoNUM_DIAS_ESTOCAGEM: TIntegerField;
    CDS_EstoquePrevisaoQTD_ESTOQUE: TIntegerField;
    CDS_EstoquePrevisaoEST_PC_CUSTO: TFMTBCDField;
    CDS_EstoquePrevisaoEST_PC_VENDA: TFMTBCDField;
    CDS_EstoquePrevisaoDM_PREVISTA: TIntegerField;
    CDS_EstoquePrevisaoDM_PREV_PC_CUSTO: TFMTBCDField;
    CDS_EstoquePrevisaoDM_PREV_PC_VENDA: TFMTBCDField;
    CDS_EstoquePrevisaoQTD_VENDA_DIA: TFMTBCDField;
    CDS_FluxoFornHistoricoDES_HISTORICO: TStringField;
    CDS_FluxoFornHistoricoDEB_CRE: TStringField;
    CDS_FluxoFornHistoricoCOD_HISTORICO: TIntegerField;
    CDS_FluxoFornecedorDTA_ORIGEM: TDateField;
    CDS_FluxoFornecedorVLR_ORIGEM: TFMTBCDField;
    CDS_FluxoFornecedorPER_REDUCAO: TFMTBCDField;
    SDS_FluxoFornReducao: TSQLDataSet;
    CDS_FluxoFornReducao: TClientDataSet;
    DSP_FluxoFornReducao: TDataSetProvider;
    DS_FluxoFornReducao: TDataSource;
    SDS_FluxoPercReducao: TSQLDataSet;
    CDS_FluxoPercReducao: TClientDataSet;
    DSP_FluxoPercReducao: TDataSetProvider;
    DS_FluxoPercReducao: TDataSource;
    CDS_FluxoFornReducaoCOD_FORNECEDOR: TStringField;
    CDS_FluxoFornReducaoNOMEFORNECEDOR: TStringField;
    CDS_FluxoPercReducaoCOD_COMPRV: TStringField;
    CDS_FluxoPercReducaoNOMECOMPROVANTE: TStringField;
    CDS_FluxoPercReducaoDTA_INCIO: TDateField;
    CDS_FluxoPercReducaoDTA_FIM: TDateField;
    CDS_FluxoPercReducaoPER_REDUCAO: TFMTBCDField;
    CDS_FluxoPercReducaoNUM_SEQ: TIntegerField;

    //==========================================================================
    // Odir ====================================================================
    //==========================================================================

    // CHAMDAS INTERNAS ========================================================
    Procedure ConectaBanco;
    Procedure MontaConexaoEmpresas;
    Procedure Desconecta;
    Function  TestaConexao: Boolean;

    Function  ConsisteConexaoEmpresas: Boolean;
    Function  AjustaDadosLojas: Boolean;
    // CHAMDAS INTERNAS ========================================================

    // Manutenção de Produto no Docto ==========================================
    Function  DML_ProdutoDocto(sTpProc, sDoc: String; var sNumSeqDoc: String): Boolean;

    // Calucla os Totais do Documento ==========================================
    Function  Doc_CalculaValores(sDoc: String; sCodProd: String='0'; sCodLoja: String='0'): Boolean;

    // Acerta Compra para CD (Conforme Transferencias) =========================
    // Colocar Dentro de Uma Transação ==========================
    Procedure AcertaCompraCD(sDocto: String; bSoma: Boolean; bUsatIBQ: Boolean; sCodProd: String = '0');

    // Atualiza Transferencia do CD (99)
    // Colocar Dentro de Uma Transação ==========================
    Procedure AtualizaTransfCD(sDoc: String);

    // Atualiza Endereçamento dos Produtos (Colocar Dentro de Uma Transação) ===
    Procedure AtualizaEnderecamentoProduto(sCodLoja, sCodProd, sQuemExecuta: String);

    // Seleciona OC ou Romaneiros ==============================================
    Procedure SelecionaOCRomaneiro(sTipo: String; bMarcar, bAberto: Boolean);

    // Monta Variavies de Filtros Padrões ======================================
    Procedure MontaFiltros(bGrupo: Boolean=True; bAplicacao: Boolean=True; bFamilia: Boolean=True; bGrupoST: Boolean=True);
                          // Montado com Alias < pr. >
                          //      USAR: MySql:=MySql+f_Troca('pr.','p.',**);
                          // ** = sgGrupos
    //==========================================================================
    // Odir ====================================================================
    //==========================================================================

    procedure CDS_EmpresaAfterScroll(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure CDS_AComprarOCsAfterScroll(DataSet: TDataSet);
    procedure IBQ_AComprarAfterPost(DataSet: TDataSet);
    procedure IBQ_AComprarBeforePost(DataSet: TDataSet);
    procedure CDS_AComprarItensBeforeScroll(DataSet: TDataSet);
    procedure CDS_AComprarItensAfterScroll(DataSet: TDataSet);
    procedure IBQ_AComprarEditaAfterPost(DataSet: TDataSet);
    procedure IBQ_AComprarEditaBeforePost(DataSet: TDataSet);
    procedure IBQ_AComprarEditaAfterScroll(DataSet: TDataSet);
    procedure IBQ_AComprarAfterScroll(DataSet: TDataSet);
    procedure CDS_Gr_FinanceiroAfterScroll(DataSet: TDataSet);
    procedure CDS_ObjetivosAfterScroll(DataSet: TDataSet);
    procedure CDS_ObjetivosEmpresasAfterScroll(DataSet: TDataSet);
    procedure IBQ_AComprarAfterOpen(DataSet: TDataSet);
    procedure CDS_FluxoFornecedoresAfterScroll(DataSet: TDataSet);
    procedure CDS_FluxoFornReducaoAfterScroll(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

Const
   sUser_Name: String='SYSDBA';
   sPassword: String='masterkey';
   cr = #13#10;
   Tab =#9;

var
  DMBelShop: TDMBelShop;

  sgMensagemERRO: String;

  sPath_Local   : String; // Somente a Pasta do Executável
  // sgPastaExecutavel: String; // Pasta e Executável (FrmBelShop)

  sgNomeServidor: String;
  sgCodLojaUnica: String;
  sgPCTConect_IB: String;

  sgTpConexao   : String;
  igTentaConexao: Integer;

  sgSeqDeletar  : String;

  sgZona        : String;
  sgCorredor    : String;
  sgPrateleira  : String;
  sgGaveta      : String;

  //============================================================================
  // Loja Unica - Inicializados em FrmBelShop ==================================
  //============================================================================

  cgLojaPerLimFornPadrao, // 0 - Percentual PADRÃO do Limite para Faturamento de Fornecedor - POR LOJA
  cgPerCxEmpbarque: Currency; // Percentual de Utilização da Caixa de Embarque (Ligado ao Tipo 6)
  sgLojaNrDias: String; // 3 - Numero de Dias para Calculo de Necessidade de Compra - POR LOJA

  bgLojaEstoque,   // 1 - Considerar SALDO ATUAL no Calculo de Necessidade de Compra ?
  bgLojaTransito,  // 2 - Considerar Produto em Transito, se Houver, no Calculo de Necessidade de Compra ?
  bgLojaEstMinino, // 5 - Considerar Estoque Ideal (Estoque mínimo) ?  - POR PRODUTO - SIDICOM: ESTOQUE.EstoqueIdeal
  bgLojaCXEmbarque: Boolean; // 6 - Considerar Percentual Limite de Caixa de Embarque para Compra - POR PRODUTO - SIDICOM: PRODUFOR.UnidadeCaixa

  bgOC_COMPRAR_Docs: Boolean; // Se Grava OC_COMPRAR_DOCS

  bgImprimirOC:Boolean; // True=Imprime OC  False=Imprime Romaneio Separação

  //============================================================================
  // Loja Unica - Inicializados em FrmBelShop ==================================
  //============================================================================

  //============================================================================
  // Inicializados em FrmLogin =================================================
  //============================================================================
  sgCompMaster, sgCompServer: String; // Dados dos Servidores, Computador Local
  sgNomeComputador, sgNomeUsuario: String; // Usuario e Windows
  sgFTPUsar, // Se Utiliza Transmissão por FTP
  sgIPServer, sgIPInternetServer: String; // Ips do Servidor
  sgFTPUser, sgFTPSenha: String; // Usuario FTP
  sgPastaAreaFTP: String; // Pasta da Area de FTP
  //============================================================================
  // Inicializados em FrmLogin =================================================
  //============================================================================

  // Altera Transferecia no CD
  sQtdOld, cQtdNew: Currency;

  // DubloCkique Verifica se Altera Gerar
  sgIndOCGerada, sgTipo: String;
  igQtd_Tipo: Integer;

  sDMFilial: String;

  sgTipoImpressao: String;

  TD : TTransactionDesc; // Ponteiro de Transação

  // OC = Ordem de Compra

  //============================================================================
  // Odir - CHAMADAS EXTERNAS ==================================================
  //============================================================================
  Function BuscaNumeradoLoja(sNumerado, sAdicionar, sCodLoja: String; Var sSeq: String): Boolean; Forward;
                              // sNumerado =  Codigo do Numerado
                              // sAdicionar = somar numerado (S) Soma (N) Não Soma
  // Conexão InerBase
  Function ConexaoEmpIndividual(sDataBase, sTransaction, sProcedimento: String; bTestar: Boolean = False): Boolean; Forward;
                           // Procedimento: (A) Abrir Conexão (F) Fechar COnexão
  Function IBTransacao(sSituacao, sTransaction: String): Boolean; Forward;
                           // sSituacao: (S)Start Transação (C)ommit (R)ollback
  Procedure MargemLucroSinteticoFornecedores; Forward;

  // Nome do Servidor, Tipo de Conexão e Codigo da Loja Se Unica ---------------
  Function BuscaServidorLojaUnica: Boolean; Forward;
  // Loja Unica ----------------------------------------------------------------

  // Atualiza OC_COMPRAR_DOCS --------------------------------------------------
  Procedure OC_COMPRAR_DOCS(sTipo, sDoc: String; sOrigem: String=''); Forward;
                               // sTipo=(I)nsert (D)elete

  // // Verifica Se ClientDataSet Contém CAMPO (sCampo) Preenchido com sContem
  Function ClientMarcado(cd: TClientDataSet; sCampo, sContem: String): Boolean;
                                          // sCampo  = Nome do Campo a Analisar
                                          // sContem = Valor do Campo que deve Conter

  // Dias Uteis para BelShop =================================================
  function DiasUteisBelShop(dDataI, dDataF: TDateTime; bDomingo, bSabado: Boolean): Integer;

  // Habilita/Desabilita menu no Gerenciador BelShop
  Procedure HabDesabMenu(Var mMenu: TMainMenu; bHabilita: Boolean);

  // Cria e Atualiza Conexao TIBTable ========================================
  Procedure CriaIBTable(sDataBase, sTransaction: String; Var IBT_Free: TIBTable; bCriaIBT: Boolean);

  //============================================================================
  // Odir - CHAMADAS EXTERNAS ==================================================
  //============================================================================

implementation

uses DK_Procs1, UFrmBelShop, UDMConexoes,  UFrmSolicitacoes, UDMVirtual,
  UFrmGeraPedidosComprasLojas, UWindowsFirewall, UEntrada,
  UDMBancosConciliacao;
     // DBGrids, Variants, RTLConsts,
{$R *.dfm}

// =============================================================================
// Odir - INICIO ===============================================================
// =============================================================================

// Monta Variavies de Filtros Padrões >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMBelShop.MontaFiltros(bGrupo: Boolean=True; bAplicacao: Boolean=True; bFamilia: Boolean=True; bGrupoST: Boolean=True);
Begin
  //============================================================================
  // Grupos e SubGrupos Selecionados ===========================================
  //============================================================================
  If bGrupo Then
  Begin
    sgGrupos:='';
    sgSubGrupos:='';
    If Not DMVirtual.CDS_V_GruposProdutos.IsEmpty Then
    Begin

      DMVirtual.CDS_V_GruposProdutos.First;
      While Not DMVirtual.CDS_V_GruposProdutos.Eof do
      Begin
        If sgGrupos='' Then
         sgGrupos:='(pr.codgrupo='+
                       QuotedStr(DMVirtual.CDS_V_GruposProdutosCod_Grupo.AsString)
        Else
         sgGrupos:=sgGrupos+' Or pr.codgrupo='+
                      QuotedStr(DMVirtual.CDS_V_GruposProdutosCod_Grupo.AsString);

        If Not DMVirtual.CDS_V_SubGruposProdutos.IsEmpty Then
        Begin
          While Not DMVirtual.CDS_V_SubGruposProdutos.Eof do
          Begin
            If sgSubGrupos='' Then
             sgSubGrupos:=QuotedStr(DMVirtual.CDS_V_SubGruposProdutosCod_GrupoSub.AsString)
            Else
             sgSubGrupos:=sgSubGrupos+', '+
                QuotedStr(DMVirtual.CDS_V_SubGruposProdutosCod_GrupoSub.AsString);

            DMVirtual.CDS_V_SubGruposProdutos.Next;
          End; // While Not DMVirtual.CDS_V_SubGruposProdutos.Eof do
          DMVirtual.CDS_V_SubGruposProdutos.First;

        End; // If Not DMVirtual.CDS_V_SubGruposProdutos.IsEmpty Then

        If sgSubGrupos<>'' Then
         sgGrupos:=sgGrupos+' and pr.codgruposub in ('+sgSubGrupos+')';

        sgSubGrupos:='';

        DMVirtual.CDS_V_GruposProdutos.Next;
      End; // While Not DMVirtual.CDS_V_GruposProdutos.Eof do
      DMVirtual.CDS_V_GruposProdutos.First;

      If sgGrupos<>'' Then
       sgGrupos:=sgGrupos+')';
    End; // If Not DMVirtual.CDS_V_GruposProdutos.IsEmpty Then
  End; // If bGrupo Then

  //============================================================================
  // Aplicacoes Selecionadas ===================================================
  //============================================================================
  If bAplicacao Then
  Begin
    sgAplicacoes:='';
    If Not DMVirtual.CDS_V_Aplicacao.IsEmpty Then
    Begin

      DMVirtual.CDS_V_Aplicacao.First;
      While Not DMVirtual.CDS_V_Aplicacao.Eof do
      Begin
        If sgAplicacoes='' Then
         sgAplicacoes:=QuotedStr(DMVirtual.CDS_V_AplicacaoCod_Aplicacao.AsString)
        Else
         sgAplicacoes:=sgAplicacoes+', '+
                       QuotedStr(DMVirtual.CDS_V_AplicacaoCod_Aplicacao.AsString);

        DMVirtual.CDS_V_Aplicacao.Next;
      End; // While Not DMVirtual.CDS_V_Aplicacao.Eof do
      DMVirtual.CDS_V_Aplicacao.First;

      If Trim(sgAplicacoes)<>'' Then
       sgAplicacoes:='('+sgAplicacoes+')';

    End; // If Not DMVirtual.CDS_V_Aplicacao.IsEmpty Then
  End; // If bAplicacao Then

  //============================================================================
  // Familias Preços Selecionadas ==============================================
  //============================================================================
  If bFamilia Then
  Begin
    sgFamiliaPrecos:='';
    If Not DMVirtual.CDS_V_FamiliaPrecos.IsEmpty Then
    Begin

      DMVirtual.CDS_V_FamiliaPrecos.First;
      While Not DMVirtual.CDS_V_FamiliaPrecos.Eof do
      Begin
        If sgFamiliaPrecos='' Then
         sgFamiliaPrecos:=
                 QuotedStr(DMVirtual.CDS_V_FamiliaPrecosCod_FamiliaPreco.AsString)
        Else
         sgFamiliaPrecos:=sgFamiliaPrecos+', '+
                QuotedStr(DMVirtual.CDS_V_FamiliaPrecosCod_FamiliaPreco.AsString);

        DMVirtual.CDS_V_FamiliaPrecos.Next;
      End; // While Not DMVirtual.CDS_V_FamiliaPrecos.Eof do
      DMVirtual.CDS_V_FamiliaPrecos.First;

      If Trim(sgFamiliaPrecos)<>'' Then
       sgFamiliaPrecos:='('+sgFamiliaPrecos+')';

    End; // If Not DMVirtual.CDS_V_FamiliaPrecos.IsEmpty Then
  End; // If bFamilia Then

  //============================================================================
  // Grupos ST =================================================================
  //============================================================================
  If bGrupoST Then
  Begin
    sgGruposST:='';
    If Not DMVirtual.CDS_V_GrupoST.IsEmpty Then
    Begin

      DMVirtual.CDS_V_GrupoST.First;
      While Not DMVirtual.CDS_V_GrupoST.Eof do
      Begin
        If sgGruposST='' Then
         sgGruposST:=QuotedStr(DMVirtual.CDS_V_GrupoSTCod_GrupoST.AsString)
        Else
         sgGruposST:=sgGruposST+', '+
                           QuotedStr(DMVirtual.CDS_V_GrupoSTCod_GrupoST.AsString);

        DMVirtual.CDS_V_GrupoST.Next;
      End; // While Not DMVirtual.CDS_V_GrupoST.Eof do
      DMVirtual.CDS_V_GrupoST.First;

      If Trim(sgGruposST)<>'' Then
       sgGruposST:='('+sgGruposST+')';

    End; // If Not DMVirtual.CDS_V_GrupoST.IsEmpty Then
  End; // If bGrupoST Then

End; // Monta Variavies de Filtros Padrões >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Cria e Atualiza Conexao TIBTable >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure CriaIBTable(sDataBase, sTransaction: String; Var IBT_Free: TIBTable; bCriaIBT: Boolean);
Var
  i: Integer;
  iOk: Integer;
Begin

  iOk:=0;

  If bCriaIBT Then
  Begin
    Try
      If IBT_Free <> Nil Then
       FreeAndNil(IBT_Free);
    Except
    End;

    IBT_Free:=TIBTable.Create(IBT_Free);
    IBT_Free.BufferChunks := 100;   // Defaut = 1000 , coloque 100
    IBT_Free.FetchAll;
  End;

  IBT_Free.Close;

  For i:=0 to DMConexoes.ComponentCount-1 do
  Begin
    If DMConexoes.Components[i] is TIBDatabase Then
    Begin
      If (DMConexoes.Components[i] as TIBDatabase).Name=sDataBase Then
      Begin
        IBT_Free.Database:=(DMConexoes.Components[i] as TIBDatabase);
        Inc(iOk);
      End;
    End;

    If DMConexoes.Components[i] is TIBTransaction Then
    Begin
      If (DMConexoes.Components[i] as TIBTransaction).Name=sTransaction Then
      Begin
        IBT_Free.Transaction:=(DMConexoes.Components[i] as TIBTransaction);
        Inc(iOk);
      End;
    End;

    If iOk = 2 Then
    Begin
      Break;
    End;
  End;
End; // Cria e Atualiza Conexao TIBTable >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Acerta Menu - Habilita e Desabilita >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure HabDesabMenu(Var mMenu: TMainMenu; bHabilita: Boolean);
Var
  i: Integer;
Begin

  For i:=0 to mMenu.Items.Count-1 do
  Begin
    If (mMenu.Items.Items[i].Caption<>'&SAIR') and
       (mMenu.Items.Items[i].Caption<>'&Troca Usuário') and
       (mMenu.Items.Items[i].Caption<>'&Versão Sistema') and
       (mMenu.Items.Items[i].Caption<>'&Empresas e Conexões') and
       (mMenu.Items.Items[i].Caption<>'C&alculadora') Then
     mMenu.Items.Items[i].Enabled:=bHabilita
    Else
     mMenu.Items.Items[i].Enabled:=True;
  End; // For i:=0 to mMenu.Items.Count-1 do

End; // // Acerta Menu - Habilita e Desabilita >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  While dDataI<=dDataF do
  Begin
    sDiaSemanaMes:=DateToStr(dDataI);
    sDiaSemanaMes:='1';
    If DMBelShop.CDS_BuscaRapida.Locate('Dta_Feriado',dDataI,[]) Then
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
  DMBelShop.CDS_BuscaRapida.Close;

  If sDateSeparator='/' Then DateSeparator:='/' Else DateSeparator:='.';
End; // Dias Uteis para BelShop >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Seleciona OC ou Romaneiros >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMBelShop.SelecionaOCRomaneiro(sTipo: String; bMarcar, bAberto: Boolean);
Var
  s: String;
  bOK: Boolean;
  i: Integer;
Begin
  If CDS_AComprarOCs.IsEmpty Then
   Exit;

  If sTipo='OC' Then s:='SEM Ordem(ns) de Compra Selecionada(s) !!';
  If sTipo='TR' Then s:='SEM Romaneio(s) Selecionado(s) !!';

  bgSiga:=False;
  i:=0;

  CDS_AComprarOCs.First;
  While Not CDS_AComprarOCs.Eof do
  Begin
    bOK:=True;
    If (CDS_AComprarOCsTIPO.AsString='OC') And (DMBelShop.CDS_AComprarOCsIND_OC_GERADA.AsString='S')  Then
     bOK:=False;

    If bOK Then
    Begin
      CDS_AComprarOCs.Edit;
      CDS_AComprarOCsGERAR.AsString:='N';

      If (bMarcar) And (CDS_AComprarOCsTOTAL_OC.AsCurrency<>0) Then
      Begin
        If CDS_AComprarOCsTIPO.AsString=sTipo Then
        Begin
          If (bAberto) and (CDS_AComprarOCsIND_OC_GERADA.AsString='N') Then
          Begin
            CDS_AComprarOCsGERAR.AsString:='S';
            bgSiga:=True;

            sgIndOCGerada:=CDS_AComprarOCsIND_OC_GERADA.AsString;
            sgTipo:=sTipo;
            igQtd_Tipo:=igQtd_Tipo+1;
          End;

          If (Not bAberto) and (CDS_AComprarOCsIND_OC_GERADA.AsString='S') Then
          Begin
            CDS_AComprarOCsGERAR.AsString:='S';
            bgSiga:=True;

            sgIndOCGerada:=CDS_AComprarOCsIND_OC_GERADA.AsString;
            sgTipo:=sTipo;
            igQtd_Tipo:=igQtd_Tipo+1;
          End;
        End; // If (CDS_AComprarOCsTIPO.AsString=sTipo) Then
      End; // If (bMarcar) And (CDS_AComprarOCsTOTAL_OC.AsCurrency<>0) Then
      
      If Not bMarcar Then
      Begin
        bgSiga:=True;
        sgIndOCGerada:='';
        sgTipo:='';
        igQtd_Tipo:=0;
      End;
      CDS_AComprarOCs.Post;
    End; // If bOK Then

    CDS_AComprarOCs.Next;
  End;

  If Not bgSiga Then
  Begin
    msg(s,'A');
  End;

  CDS_AComprarOCs.First;
End; // Seleciona OC ou Romaneiros >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Atualiza Transferencia do CD (99) >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMBelShop.AtualizaTransfCD(sDoc: String);
Var
  MySql: String;
  sCod_Loja, sCod_Forn, sCod_Prod: String;
  cQtd_Trans: Currency;
Begin
  // Colocar Dentro de Uma Transação ==========================

  // Busca Produtos com Quantidade a Comprar ===================================
  MySql:=' SELECT o.num_seq, o.cod_empresa, o.cod_fornecedor, o.cod_item, o.qtd_acomprar'+
         ' FROM OC_COMPRAR o'+
         ' WHERE o.qtd_acomprar>0'+
         ' AND   o.qtd_transf=0'+
         ' AND   o.cod_empresa<>'+QuotedStr('99')+
         ' AND   o.num_documento='+sDoc+
         ' ORDER BY o.cod_item, o.Num_Seq';
  CDS_Busca.Close;
  SDS_Busca.CommandText:=MySql;
  CDS_Busca.Open;

  FrmBelShop.MontaProgressBar(True, FrmBelShop);
  pgProgBar.Properties.Max:=CDS_Busca.RecordCount;
  pgProgBar.Position:=0;

  // Sequencia do Regiatro no Docto ============================================
  MySql:=' SELECT COALESCE(MAX(o.num_seq) ,0) Num_seq'+
         ' FROM OC_COMPRAR o'+
         ' WHERE o.num_documento='+sDoc;
  CDS_BuscaRapida.Close;
  SDS_BuscaRapida.CommandText:=MySql;
  CDS_BuscaRapida.Open;
  iNumSeqDoc:=CDS_BuscaRapida.FieldByName('Num_Seq').AsInteger;
  CDS_BuscaRapida.Close;

  While Not CDS_Busca.Eof do
  Begin
    Application.ProcessMessages;
    pgProgBar.Position:=CDS_Busca.RecNo;

    sCod_Loja:='99'; // CDS_Busca.FieldByName('Cod_Empresa').AsString;
    sCod_Forn:=CDS_Busca.FieldByName('Cod_Fornecedor').AsString;
    sCod_Prod:=CDS_Busca.FieldByName('Cod_Item').AsString;

    // Verifica se Tem Saldo Disponível ========================================
    If DMVirtual.CDS_V_SaldoTransf.Locate('COD_LOJA;COD_FORNECEDOR;COD_PRODUTO', VarArrayOf([sCod_Loja, sCod_Forn, sCod_Prod]),[]) Then
    Begin
      FrmBelShop.Refresh;

      cQtd_Trans:=0;
      If DMVirtual.CDS_V_SaldoTransfQTD_DISPONIVEL.AsCurrency>0 Then
      Begin
        // Se A Comprar For Maior ou Igual ao Saldo Disponivel =================
        If CDS_Busca.FieldByName('qtd_acomprar').AsCurrency>=DMVirtual.CDS_V_SaldoTransfQTD_DISPONIVEL.AsCurrency Then
         cQtd_Trans:=DMVirtual.CDS_V_SaldoTransfQTD_DISPONIVEL.AsCurrency;

        // Se A Comprar For Menor do que o Saldo Disponivel ====================
        If CDS_Busca.FieldByName('qtd_acomprar').AsCurrency<DMVirtual.CDS_V_SaldoTransfQTD_DISPONIVEL.AsCurrency Then
         cQtd_Trans:=CDS_Busca.FieldByName('qtd_acomprar').AsCurrency;

        If cQtd_Trans<>0 Then
        Begin
          Inc(iNumSeqDoc);

          // Insere Transferencia ==============================================
          MySql:=' INSERT INTO OC_COMPRAR'+
                 ' SELECT'+
                 ' '+IntToStr(iNumSeqDoc)+' NUM_SEQ, o.NUM_DOCUMENTO, o.DTA_DOCUMENTO, o.IND_OC_GERADA, o.DTA_OC_GERADA,'+
                 ' o.NUM_OC_GERADA, o.OBS_OC, o.COD_EMPRESA, o.DES_EMPRESA, o.COD_ITEM, o.DES_ITEM,'+
                 ' o.QTD_SUGERIDA, '+QuotedStr(f_Troca(',','.',CurrToStr(cQtd_Trans)))+' QTD_ACOMPRAR,'+
                 ' o.QTD_SALDO, o.QTD_TRANSITO, o.QTD_DISPONIVEL,'+
                 ' o.QTD_MEDIA_MES, o.QTD_MEDIA_DIA, o.QTD_DEM_MES1, o.QTD_DEM_MES2, o.QTD_DEM_MES3,'+
                 ' o.QTD_DEM_MES4, o.QTD_DEM_MES5, o.QTD_DEM_MES6, o.QTD_DEM_MES7, o.QTD_DEM_MES8,'+
                 ' o.UNI_COMPRA, o.UNI_VENDA, o.COD_BARRAS, o.COD_GRUPO, o.DES_GRUPO, o.COD_SUBGRUPO,'+
                 ' o.DES_SUBGRUPO, o.DES_GENERICO, o.COD_APLICACAO, o.DES_APLICACAO, o.COD_REFERENCIA,'+
                 ' o.CLA_CURVA_ABC, o.COD_FAMILIA_PRECO, o.DES_FAMILIA_PRECO, o.DTA_ULT_COMPRA,'+
                 ' o.COD_FOR_ULT_COMPRA, o.DES_FOR_ULT_COMPRA, o.QTD_ULT_COMPRA, o.VLR_UNI_ULT_COMPRA,'+
                 ' o.VLR_TOT_ULT_COMPRA, o.VLR_UNI_COMPRA, o.PER_DESCONTO, o.DTA_ULT_VENDA, o.COD_CLI_ULT_VENDA,'+
                 ' o.DES_CLI_ULT_VENDA, o.QTD_ULT_VENDA, o.VLR_UNI_ULT_VENDA, o.VLR_TOT_ULT_VENDA, o.VLR_UNI_VENDA,'+
                 ' o.COD_LISTA_VENDA, o.DES_LISTA_VENDA, o.COD_LISTA_COMPRA, o.DES_LISTA_COMPRA,'+
                 ' o.VLR_CUSTO_MEDIO, o.VLR_TOT_VENDA, o.VLR_TOT_COMPRA, o.VLR_BRUTO, o.VLR_DESCONTOS,'+
                 ' o.VLR_DESPESAS, o.VLR_FRETE, o.IND_SOMA_IPI_BASE_ICMS, o.IND_SOMA_FRETE_BASE_ICMS,'+
                 ' o.IND_SOMA_DESPESA_BASE_ICMS, o.IND_SOMA_IPI_BASE_ST, o.IND_SOMA_FRETE_BASE_ST,'+
                 ' o.IND_SOMA_DESPESA_BASE_ST, o.COD_SIT_TRIBUTARIA, o.COD_IPI, o.IND_IPI, o.PER_IPI,'+
                 ' o.VLR_IPI, o.COD_ICMS, o.PER_REDUCAO_ICMS, o.VLR_REDUCAO_ICMS, o.VLR_BASE_ICMS,'+
                 ' o.PER_ICMS, o.VLR_ICMS, o.COD_GRUPO_ST, o.DES_GRUPO_ST, o.PER_MARGEM_ST, o.IND_ST,'+
                 ' o.VLR_BASE_ST, o.PER_ST, o.VLR_ST, o.PER_REPASSE, o.VLR_REPASSE, o.COD_COMPROVANTE_ICMS,'+
                 ' o.COD_REFERENCIA_FORN, o.COD_FORNECEDOR, o.DES_FORNECEDOR, o.TIP_PESSOA, o.DES_EMAIL,'+
                 ' o.QTD_NR_DIAS, o.QTD_NR_MESES, o.QTD_TOT_MESES, o.COD_COMPRADOR, o.BLOB_TEXTO, o.IND_TRANSF,'+
                 ' o.DTA_LIM_TRANSF, '+QuotedStr(f_Troca(',','.',CurrToStr(cQtd_Trans)))+' QTD_TRANSF,'+
                 ' o.IND_USAR, '+QuotedStr('0')+' IND_QTD_ACIMA,'+
                 ' o.QTD_SUGERIDA_ANO, o.QTD_TRANSF_PERIODO, o.QTD_TRANSF_ANO, o.EST_MINIMO,'+
                 ' o.DIAS_ESTOCAGEM, o.QTD_DEMANDA_DIA, o.QTD_DEMANDA_ANO, o.QTD_DIAS_ANO,'+
                 ' o.DATAINCLUSAO, o.ESTADO, o.DATAALTERACAO, o.IND_TRANSF_CD, o.DOC_TRANSF_CD'+

                 ' FROM OC_COMPRAR o'+

                 ' WHERE o.num_documento='+sDoc+
                 ' AND o.NUM_SEQ='+CDS_Busca.FieldByName('Num_Seq').AsString;
          SQLC.Execute(MySql,nil,nil);

          // Atualiza Qtd A Comprar ============================================
          MySql:= ' UPDATE OC_COMPRAR o'+
                  ' SET Qtd_AComprar=Qtd_AComprar-'+f_Troca(',','.',CurrToStr(cQtd_Trans))+
                  ' WHERE o.num_documento='+sDoc+
                  ' AND o.NUM_SEQ='+CDS_Busca.FieldByName('Num_Seq').AsString;
          SQLC.Execute(MySql,nil,nil);

          // Atualiza Saldo Disponivel =========================================
          DMVirtual.CDS_V_SaldoTransf.Edit;
          DMVirtual.CDS_V_SaldoTransfQTD_DISPONIVEL.AsCurrency:=(DMVirtual.CDS_V_SaldoTransfQTD_DISPONIVEL.AsCurrency-cQtd_Trans);
          DMVirtual.CDS_V_SaldoTransfQTD_UTILIZADA.AsCurrency:=(DMVirtual.CDS_V_SaldoTransfQTD_UTILIZADA.AsCurrency+cQtd_Trans);
          DMVirtual.CDS_V_SaldoTransf.Post;

          // Verifica se Precisa Inserir o Produto no CD =======================
          MySql:=' Select dc.cod_empresa'+
                 ' From oc_comprar dc'+
                 ' WHERE dc.num_documento='+sDoc+
                 ' AND   dc.cod_empresa='+QuotedStr(sCod_Loja)+
                 ' AND   dc.ind_oc_gerada='+QuotedStr('N')+
                 ' AND   dc.Cod_Item='+QuotedStr(sCod_Prod);
          CDS_BuscaRapida.Close;
          SDS_BuscaRapida.CommandText:=MySql;
          CDS_BuscaRapida.Open;

          If Trim(CDS_BuscaRapida.FieldByName('cod_empresa').AsString)='' Then
          Begin
            // Insere Produto no CD ==============================================
            Inc(iNumSeqDoc);
            MySql:=' INSERT INTO OC_COMPRAR'+
                   ' SELECT'+
                   ' '+IntToStr(iNumSeqDoc)+' NUM_SEQ, o.NUM_DOCUMENTO, o.DTA_DOCUMENTO,'+
                   QuotedStr('N')+' IND_OC_GERADA, NULL DTA_OC_GERADA, NULL NUM_OC_GERADA,'+
                   ' o.OBS_OC, o.COD_EMPRESA, o.DES_EMPRESA, o.COD_ITEM, o.DES_ITEM,'+
                   ' 0 QTD_SUGERIDA, 0 QTD_ACOMPRAR,'+
                   ' o.QTD_SALDO, o.QTD_TRANSITO, o.QTD_DISPONIVEL,'+
                   ' o.QTD_MEDIA_MES, o.QTD_MEDIA_DIA, o.QTD_DEM_MES1, o.QTD_DEM_MES2, o.QTD_DEM_MES3,'+
                   ' o.QTD_DEM_MES4, o.QTD_DEM_MES5, o.QTD_DEM_MES6, o.QTD_DEM_MES7, o.QTD_DEM_MES8,'+
                   ' o.UNI_COMPRA, o.UNI_VENDA, o.COD_BARRAS, o.COD_GRUPO, o.DES_GRUPO, o.COD_SUBGRUPO,'+
                   ' o.DES_SUBGRUPO, o.DES_GENERICO, o.COD_APLICACAO, o.DES_APLICACAO, o.COD_REFERENCIA,'+
                   ' o.CLA_CURVA_ABC, o.COD_FAMILIA_PRECO, o.DES_FAMILIA_PRECO, o.DTA_ULT_COMPRA,'+
                   ' o.COD_FOR_ULT_COMPRA, o.DES_FOR_ULT_COMPRA, o.QTD_ULT_COMPRA, o.VLR_UNI_ULT_COMPRA,'+
                   ' o.VLR_TOT_ULT_COMPRA, o.VLR_UNI_COMPRA, o.PER_DESCONTO, o.DTA_ULT_VENDA, o.COD_CLI_ULT_VENDA,'+
                   ' o.DES_CLI_ULT_VENDA, o.QTD_ULT_VENDA, o.VLR_UNI_ULT_VENDA, o.VLR_TOT_ULT_VENDA, o.VLR_UNI_VENDA,'+
                   ' o.COD_LISTA_VENDA, o.DES_LISTA_VENDA, o.COD_LISTA_COMPRA, o.DES_LISTA_COMPRA,'+
                   ' o.VLR_CUSTO_MEDIO, o.VLR_TOT_VENDA, o.VLR_TOT_COMPRA, o.VLR_BRUTO, o.VLR_DESCONTOS,'+
                   ' o.VLR_DESPESAS, o.VLR_FRETE, o.IND_SOMA_IPI_BASE_ICMS, o.IND_SOMA_FRETE_BASE_ICMS,'+
                   ' o.IND_SOMA_DESPESA_BASE_ICMS, o.IND_SOMA_IPI_BASE_ST, o.IND_SOMA_FRETE_BASE_ST,'+
                   ' o.IND_SOMA_DESPESA_BASE_ST, o.COD_SIT_TRIBUTARIA, o.COD_IPI, o.IND_IPI, o.PER_IPI,'+
                   ' o.VLR_IPI, o.COD_ICMS, o.PER_REDUCAO_ICMS, o.VLR_REDUCAO_ICMS, o.VLR_BASE_ICMS,'+
                   ' o.PER_ICMS, o.VLR_ICMS, o.COD_GRUPO_ST, o.DES_GRUPO_ST, o.PER_MARGEM_ST, o.IND_ST,'+
                   ' o.VLR_BASE_ST, o.PER_ST, o.VLR_ST, o.PER_REPASSE, o.VLR_REPASSE, o.COD_COMPROVANTE_ICMS,'+
                   ' o.COD_REFERENCIA_FORN, o.COD_FORNECEDOR, o.DES_FORNECEDOR, o.TIP_PESSOA, o.DES_EMAIL,'+
                   ' o.QTD_NR_DIAS, o.QTD_NR_MESES, o.QTD_TOT_MESES, o.COD_COMPRADOR, o.BLOB_TEXTO, o.IND_TRANSF,'+
                   ' o.DTA_LIM_TRANSF, o.QTD_TRANSF, o.IND_USAR, 0.IND_QTD_ACIMA,'+
                   ' o.QTD_SUGERIDA_ANO, o.QTD_TRANSF_PERIODO, o.QTD_TRANSF_ANO, o.EST_MINIMO,'+
                   ' o.DIAS_ESTOCAGEM, o.QTD_DEMANDA_DIA, o.QTD_DEMANDA_ANO, o.QTD_DIAS_ANO,'+
                   ' o.DATAINCLUSAO, o.ESTADO, o.DATAALTERACAO, o.IND_TRANSF_CD, o.DOC_TRANSF_CD'+

                   ' FROM OC_COMPRAR o'+

                   ' WHERE o.num_documento='+sDoc+
                   ' AND   o.cod_empresa='+QuotedStr(sCod_Loja)+
                   ' AND   o.ind_oc_gerada='+QuotedStr('S')+
                   ' AND   o.Cod_Item='+QuotedStr(sCod_Prod);
            SQLC.Execute(MySql,nil,nil);
          End;
          CDS_BuscaRapida.Close

        end; // If cQtd_Trans<>0 Then
      End; // If DMVirtual.CDS_V_SaldoTransfQTD_DISPONIVEL.AsCurrency>0 Then
    End; // If DMVirtual.CDS_V_SaldoTransf.Locate('COD_LOJA;COD_FORNECEDOR;COD_PRODUTO', VarArrayOf([sCod_Loja, sCod_Forn, sCod_Prod]),[]) Then

    CDS_Busca.Next;
  End; // While Not CDS_Busca.Eof do
  CDS_Busca.Close;
  DMVirtual.CDS_V_SaldoTransf.Close;
  FrmBelShop.MontaProgressBar(False, FrmBelShop);

End; // Atualiza Transferencia do CD (99) >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Acerta Compra para CD (Conforme Transferencias >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMBelShop.AcertaCompraCD(sDocto: String; bSoma: Boolean; bUsatIBQ: Boolean; sCodProd: String = '0');
Var
  MySql: String;
Begin
  // Colocar Dentro de Uma Transação ==========================
  MySql:=' UPDATE oc_comprar dc';

         If bSoma Then
          MySql:=
           MySql+' SET dc.qtd_acomprar=dc.qtd_acomprar + Coalesce((SELECT SUM(oc.qtd_transf)'+
                 '                                               FROM oc_comprar oc'+
                 '                                               WHERE oc.num_documento=dc.num_documento'+
                 '                                               AND oc.cod_item=dc.cod_item'+
                 '                                               AND oc.qtd_transf<>0'+
                 '                                               AND oc.ind_oc_gerada=''N''),0)'
         Else
          MySql:=
           MySql+' SET dc.qtd_acomprar=dc.qtd_acomprar - Coalesce((SELECT SUM(oc.qtd_transf)'+
                 '                                               FROM oc_comprar oc'+
                 '                                               WHERE oc.num_documento=dc.num_documento'+
                 '                                               AND oc.cod_item=dc.cod_item'+
                 '                                               AND oc.qtd_transf<>0'+
                 '                                               AND oc.ind_oc_gerada=''N''),0)';
  MySql:=
   MySql+' WHERE dc.num_documento='+sDocto+
         ' AND   dc.cod_empresa=''99'''+
         ' AND dc.ind_oc_gerada=''N''';

         If sCodProd<>'0' Then
          MySql:=MySql+' AND dc.Cod_Item='+QuotedStr(sCodProd);
  If Not bUsatIBQ Then
   Begin
    SQLC.Execute(MySql,nil,nil);
   End
  Else
   Begin
     IBQ_Executa.Close;
     IBQ_Executa.SQL.Clear;
     IBQ_Executa.SQL.Add(MySql);
     IBQ_Executa.ExecSQL;
   End;
End; // Acerta Compra para CD (Conforme Transferencias >>>>>>>>>>>>>>>>>>>>>>>>>

// Atualiza Endereçamento dos Produtos (Colocar Dentro de Uma Transação) >>>>>>>
Procedure TDMBelShop.AtualizaEnderecamentoProduto(sCodLoja, sCodProd, sQuemExecuta: String);
Var
  MySql: String;
Begin
  // Colocar Dentro de Uma Transação <<<<<<<<<<<<<<
  // Conectar MPMS Antes de Iniciar Processo - ConectaMPMS;

  MySql:=' SELECT COALESCE(lc.zonaendereco, ''000'') Zona,'+
         '        COALESCE(lc.corredor, ''000'') corredor,'+
         '        COALESCE(lc.prateleira, ''000'') prateleira,'+
         '        COALESCE(lc.gaveta, ''0000'') gaveta'+
         ' FROM estoque lc'+
         ' WHERE lc.codfilial='+QuotedStr(sCodLoja)+
         ' AND lc.codproduto ='+QuotedStr(sCodProd);
  FrmBelShop.IBQ_MPMS.Close;
  FrmBelShop.IBQ_MPMS.SQL.Clear;
  FrmBelShop.IBQ_MPMS.SQL.Add(MySql);
  FrmBelShop.IBQ_MPMS.Open;

  sgZona      :='0';
  sgCorredor  :='000';
  sgPrateleira:='000';
  sgGaveta    :='0000';

  If Trim(FrmBelShop.IBQ_MPMS.FieldByName('Corredor').AsString)<>'' Then
  Begin
    sgZona:=FrmBelShop.IBQ_MPMS.FieldByName('Zona').AsString;
    sgCorredor:=FrmBelShop.IBQ_MPMS.FieldByName('Corredor').AsString;
    sgPrateleira:=FrmBelShop.IBQ_MPMS.FieldByName('Prateleira').AsString;
    sgGaveta:=FrmBelShop.IBQ_MPMS.FieldByName('Gaveta').AsString;
  End;
  FrmBelShop.IBQ_MPMS.Close;

  MySql:=' DELETE FROM PROD_ENDERECO pe'+
         ' WHERE pe.Cod_loja='+QuotedStr(sCodLoja)+
         ' AND   pe.Cod_Item='+QuotedStr(sCodProd);

  If sQuemExecuta='SQLC' Then
  Begin
    SQLC.Execute(MySql,nil,nil);
  End;

  If sQuemExecuta='IBQ_Executa' Then
  Begin
    IBQ_Executa.Close;
    IBQ_Executa.SQL.Clear;
    IBQ_Executa.SQL.Add(MySql);
    IBQ_Executa.ExecSQL;
  End;

  MySql:=' INSERT INTO PROD_ENDERECO (COD_LOJA, COD_ITEM, ZONAENDERECO, CORREDOR, PRATELEIRA, GAVETA)'+
         ' VALUES('+
         QuotedStr(sCodLoja)+', '+ // COD_LOJA
         QuotedStr(sCodProd)+', '+ // COD_ITEM
         QuotedStr(sgZona)+', '+ // ZONAENDERECO
         QuotedStr(sgCorredor)+', '+ // CORREDOR
         QuotedStr(sgPrateleira)+', '+ // PRATELEIRA
         QuotedStr(sgGaveta)+')'; // GAVETA

  If sQuemExecuta='SQLC' Then
  Begin
    SQLC.Execute(MySql,nil,nil);
  End;

  If sQuemExecuta='IBQ_Executa' Then
  Begin
    IBQ_Executa.Close;
    IBQ_Executa.SQL.Clear;
    IBQ_Executa.SQL.Add(MySql);
    IBQ_Executa.ExecSQL;
  End;

End; // Atualiza Endereçamento dos Produtos (Colocar Dentro de Uma Transação) >>

// Calucla os Totais do Documento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TDMBelShop.Doc_CalculaValores(sDoc: String; sCodProd: String='0'; sCodLoja: String='0'): Boolean;
Var
  MySql: String;
Begin
  Result:=False;

  // Verifica se Transação esta Ativa
  If SQLC.InTransaction Then
   SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  SQLC.StartTransaction(TD);
  Try
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' Update OC_COMPRAR'+
           ' Set VLR_DESCONTOS=((QTD_ACOMPRAR*VLR_UNI_COMPRA)*(PER_DESCONTO/100))'+
           ', VLR_BRUTO=(QTD_ACOMPRAR*VLR_UNI_COMPRA)-VLR_DESCONTOS'+
           ', VLR_BASE_ICMS=VLR_BRUTO'+
           ', VLR_ICMS=Cast(((VLR_BASE_ICMS*PER_ICMS)/100) as Numeric(12,2))'+
           ', VLR_IPI=Cast(((VLR_BRUTO*PER_IPI)/100) as Numeric(12,2))'+
           ', VLR_BASE_ST=VLR_BRUTO+(Cast(((VLR_BRUTO*PER_MARGEM_ST)/100) as Numeric(12,2)))'+
           ', VLR_ST=(Cast(((VLR_BASE_ST*PER_ST)/100) as Numeric(12,2))-VLR_ICMS)'+
           ', VLR_TOT_COMPRA=VLR_BRUTO+VLR_ST+VLR_IPI'+
           ', VLR_TOT_VENDA=QTD_ACOMPRAR*VLR_UNI_VENDA'+

           ' WHERE Ind_OC_Gerada=''N'''+
           ' AND Num_Documento='+QuotedStr(sDoc);

           If sCodProd<>'0' Then
            MySql:=MySql+' AND Cod_Item='+QuotedStr(sCodProd);

           If sCodLoja<>'0' Then
            MySql:=MySql+' AND Cod_Empresa='+QuotedStr(sCodLoja);
    SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao =======================================
    SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    Result:=True;

  Except
    on e : Exception do
    Begin
      // Abandona Transacao =====================================
      SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      MessageBox(Application.Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try

End; // Calucla os Totais do Documento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Manutenção de Produto no Docto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function  TDMBelShop.DML_ProdutoDocto(sTpProc, sDoc: String; var sNumSeqDoc: String): Boolean;
Var
  i: Integer;
  MySql: String;
  s: String;
  cQtdSaldo: Currency;
Begin
  sgSeqDeletar:='';
  Result:=False;
  s:='';

  cQtdSaldo:=0;
  If IBQ_AComprarQTD_ACOMPRAR.AsCurrency > IBQ_AComprarQTD_TRANSF.AsCurrency Then
   cQtdSaldo:=IBQ_AComprarQTD_ACOMPRAR.AsCurrency-IBQ_AComprarQTD_TRANSF.AsCurrency
  Else If IBQ_AComprarQTD_ACOMPRAR.AsCurrency <= IBQ_AComprarQTD_TRANSF.AsCurrency Then
   cQtdSaldo:=0;

  // Altera Produto no Docto ===================================================
  If sTpProc='A' Then
  Begin
    // Verifica se Ja Existe Treanferencia do Produto na Loja ==================
    MySql:=' SELECT o.Num_Seq'+
           ' FROM   OC_COMPRAR o'+
           ' WHERE  o.num_documento='+sDoc+
           ' AND    o.cod_item='+QuotedStr(IBQ_AComprarCOD_ITEM.AsString)+
           ' AND    o.cod_empresa='+QuotedStr(IBQ_AComprarCOD_EMPRESA.AsString)+
           ' AND    o.num_seq<>'+QuotedStr(IBQ_AComprarNUM_SEQ.AsString)+
           ' AND    o.qtd_transf=0'+
           ' Order by o.Num_Seq Desc';
    CDS_BuscaRapida.Close;
    SDS_BuscaRapida.CommandText:=MySql;
    CDS_BuscaRapida.Open;
    s:=CDS_BuscaRapida.FieldByName('Num_Seq').AsString;
    CDS_BuscaRapida.Close;

    sTpProc:='I';
  End;

  // Inclui Produto no Docto ===================================================
  If sTpProc='I' Then
  Begin
    If Trim(s)='' Then // Grava Novo Produtos para Compra
     Begin
       MySql:=' SELECT COALESCE(MAX(o.num_seq)+1 ,1) Num_seq'+
              ' FROM OC_COMPRAR o'+
              ' WHERE o.num_documento='+sDoc;
       CDS_BuscaRapida.Close;
       SDS_BuscaRapida.CommandText:=MySql;
       CDS_BuscaRapida.Open;
       i:=CDS_BuscaRapida.FieldByName('Num_Seq').AsInteger;
       CDS_BuscaRapida.Close;

       MySql:=' INSERT INTO OC_COMPRAR'+
              ' SELECT'+
              ' '+IntToStr(i)+' NUM_SEQ, o.NUM_DOCUMENTO, o.DTA_DOCUMENTO, o.IND_OC_GERADA, o.DTA_OC_GERADA,'+
              ' o.NUM_OC_GERADA, o.OBS_OC, o.COD_EMPRESA, o.DES_EMPRESA, o.COD_ITEM, o.DES_ITEM,'+
              ' o.QTD_SUGERIDA, '+QuotedStr(f_Troca(',','.',CurrToStr(cQtdSaldo)))+' QTD_ACOMPRAR,'+
              ' o.QTD_SALDO, o.QTD_TRANSITO, o.QTD_DISPONIVEL,'+
              ' o.QTD_MEDIA_MES, o.QTD_MEDIA_DIA, o.QTD_DEM_MES1, o.QTD_DEM_MES2, o.QTD_DEM_MES3,'+
              ' o.QTD_DEM_MES4, o.QTD_DEM_MES5, o.QTD_DEM_MES6, o.QTD_DEM_MES7, o.QTD_DEM_MES8,'+
              ' o.UNI_COMPRA, o.UNI_VENDA, o.COD_BARRAS, o.COD_GRUPO, o.DES_GRUPO, o.COD_SUBGRUPO,'+
              ' o.DES_SUBGRUPO, o.DES_GENERICO, o.COD_APLICACAO, o.DES_APLICACAO, o.COD_REFERENCIA,'+
              ' o.CLA_CURVA_ABC, o.COD_FAMILIA_PRECO, o.DES_FAMILIA_PRECO, o.DTA_ULT_COMPRA,'+
              ' o.COD_FOR_ULT_COMPRA, o.DES_FOR_ULT_COMPRA, o.QTD_ULT_COMPRA, o.VLR_UNI_ULT_COMPRA,'+
              ' o.VLR_TOT_ULT_COMPRA, o.VLR_UNI_COMPRA, o.PER_DESCONTO, o.DTA_ULT_VENDA, o.COD_CLI_ULT_VENDA,'+
              ' o.DES_CLI_ULT_VENDA, o.QTD_ULT_VENDA, o.VLR_UNI_ULT_VENDA, o.VLR_TOT_ULT_VENDA, o.VLR_UNI_VENDA,'+
              ' o.COD_LISTA_VENDA, o.DES_LISTA_VENDA, o.COD_LISTA_COMPRA, o.DES_LISTA_COMPRA,'+
              ' o.VLR_CUSTO_MEDIO, o.VLR_TOT_VENDA, o.VLR_TOT_COMPRA, o.VLR_BRUTO, o.VLR_DESCONTOS,'+
              ' o.VLR_DESPESAS, o.VLR_FRETE, o.IND_SOMA_IPI_BASE_ICMS, o.IND_SOMA_FRETE_BASE_ICMS,'+
              ' o.IND_SOMA_DESPESA_BASE_ICMS, o.IND_SOMA_IPI_BASE_ST, o.IND_SOMA_FRETE_BASE_ST,'+
              ' o.IND_SOMA_DESPESA_BASE_ST, o.COD_SIT_TRIBUTARIA, o.COD_IPI, o.IND_IPI, o.PER_IPI,'+
              ' o.VLR_IPI, o.COD_ICMS, o.PER_REDUCAO_ICMS, o.VLR_REDUCAO_ICMS, o.VLR_BASE_ICMS,'+
              ' o.PER_ICMS, o.VLR_ICMS, o.COD_GRUPO_ST, o.DES_GRUPO_ST, o.PER_MARGEM_ST, o.IND_ST,'+
              ' o.VLR_BASE_ST, o.PER_ST, o.VLR_ST, o.PER_REPASSE, o.VLR_REPASSE, o.COD_COMPROVANTE_ICMS,'+
              ' o.COD_REFERENCIA_FORN, o.COD_FORNECEDOR, o.DES_FORNECEDOR, o.TIP_PESSOA, o.DES_EMAIL,'+
              ' o.QTD_NR_DIAS, o.QTD_NR_MESES, o.QTD_TOT_MESES, o.COD_COMPRADOR, o.BLOB_TEXTO, o.IND_TRANSF,'+
              ' o.DTA_LIM_TRANSF, '+QuotedStr('0')+' QTD_TRANSF, o.IND_USAR, '+QuotedStr('0')+' IND_QTD_ACIMA,'+
              ' o.QTD_SUGERIDA_ANO, o.QTD_TRANSF_PERIODO, o.QTD_TRANSF_ANO, o.EST_MINIMO,'+
              ' o.DIAS_ESTOCAGEM, o.QTD_DEMANDA_DIA, o.QTD_DEMANDA_ANO, o.QTD_DIAS_ANO,'+
              ' o.DATAINCLUSAO, o.ESTADO, o.DATAALTERACAO, o.IND_TRANSF_CD, o.DOC_TRANSF_CD'+

              ' FROM OC_COMPRAR o'+

              ' WHERE o.num_documento='+sDoc+
              ' AND o.NUM_SEQ='+sNumSeqDoc;
       IBQ_Executa.Close;
       IBQ_Executa.SQL.Clear;
       IBQ_Executa.SQL.Add(MySql);
       IBQ_Executa.ExecSQL;

       IBT_BelShop.CommitRetaining;
     End
    Else // If Trim(s)='' Then // Grava Novo Produtos para Compra
     Begin
         sgSeqDeletar:=sNumSeqDoc;
         sNumSeqDoc:=s;

         MySql:=' UPDATE oc_comprar c'+
                ' SET    c.qtd_acomprar=c.qtd_acomprar+'+f_Troca(',','.',IBQ_AComprarQTD_TRANSF.OldValue)+
                ' WHERE  c.num_documento='+sDoc+
                ' AND    c.num_seq='+sNumSeqDoc;
         IBQ_Executa.Close;
         IBQ_Executa.SQL.Clear;
         IBQ_Executa.SQL.Add(MySql);
         IBQ_Executa.ExecSQL;

         IBT_BelShop.CommitRetaining;
     End;
  End; // If sTpProc='I' Then

  Result:=True;
End; // Manutenção de Produto no Docto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Verifica Se ClientDataSet Contém CAMPO (sCampo) Preenchido com sContem >>>>>>
Function ClientMarcado(cd: TClientDataSet; sCampo, sContem: String): Boolean;
Begin
  // sCampo  = Nome do Campo a Analisar
  // sContem = Valor do Campo que deve Conter

  Result:=False;

  If Trim(sCampo)='' Then
  Begin
    msg('Erro do Nome do Campo !!'+cr+cr+'Falar com o Odir !!','A');
    Exit;
  End; // If Trim(sCampo)='' Then

  cd.First;
  cd.DisableControls;
  While Not cd.Eof do
  Begin
    If cd.FieldByName(sCampo).AsString=sContem Then
    Begin
      Result:=True;
      Break;
    End;

    cd.Next;
  End; // While Not cd.Eof do
  cd.EnableControls;
  cd.First;

End; // Verifica Se ClientDataSet Contém CAMPO (sCampo) Preenchido com sContem >>>>>>

// Manutenção do Arquivo de Documentos de OC >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure OC_COMPRAR_DOCS(sTipo, sDoc: String; sOrigem: String='');
Var
  MySql: String;
  bOrigem: Boolean;
Begin
  //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  // OBS: DEVE ESTAR DENTRO DE UMA TRANSAÇÃO
  //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  // sTipo=(I)nsert (D)elete
  // sOrigem  = '' - Busca as lojas do Docto
  //          = 'BelShop' - Vale o seu Conteudo
  //          = 'OC(s) Importada(s):' - Busca as lojas do Docto

  If sTipo='D' Then
  Begin
    MySql:=' DELETE FROM OC_COMPRAR_DOCS d'+
           ' WHERE d.num_docto='+QuotedStr(sDoc);
    DMBelShop.SQLC.Execute(MySql,nil,nil);
    Exit;
  End; // If sTipo='D' Then

  If sTipo='I' Then
  Begin
    MySql:=' SELECT d.num_docto'+
           ' FROM oc_comprar_docs d'+
           ' WHERE d.num_docto='+sDoc;
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('num_docto').AsString)='' Then
    Begin
      bOrigem:=False;
      If (Trim(sOrigem)='') Or (Trim(sOrigem)='OC(s) Importada(s):') Then
       bOrigem:=True;

      MySql:=' SELECT DISTINCT CAST(c.dta_documento AS DATE) Dta_Doc,'+
             ' c.cod_comprador,'+
             ' CASE'+
             '   WHEN u.des_usuario IS NULL THEN ''Usuário Excluído'''+
             '   ELSE u.des_usuario'+
             ' END des_Comprador';

             If bOrigem Then
              MySql:=MySql+',  ''BEL_''||c.cod_empresa Cod_Loja';

      MySql:=
       MySql+' FROM oc_comprar c'+
             '    LEFT JOIN ps_usuarios u ON u.cod_usuario=c.cod_comprador'+
             ' WHERE c.num_documento='+QuotedStr(sDoc);
      DMBelShop.CDS_Busca.Close;
      DMBelShop.SDS_Busca.CommandText:=MySql;
      DMBelShop.CDS_Busca.Open;

      If bOrigem Then
      Begin
        While Not DMBelShop.CDS_Busca.Eof do
        Begin
          If Trim(sOrigem)='' Then
           Begin
             sOrigem:=DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString;
           End
          Else // If Trim(sOrigem)='' Then
           Begin
             If sOrigem='OC(s) Importada(s):' Then
              sOrigem:=sOrigem+' '+DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString
             Else
              sOrigem:=sOrigem+' / '+DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString;
           End; // If Trim(sOrigem)='' Then

          DMBelShop.CDS_Busca.Next;
        End; // While Not DMBelShop.CDS_Busca.Eof do
      End; // If bOrigem Then

      DMBelShop.CDS_Busca.First;
      MySql:=' INSERT INTO OC_COMPRAR_DOCS'+
             ' (NUM_DOCTO, DTA_DOCTO, COD_COMPRADOR, DES_COMPRADOR, ORIGEM)'+
             ' VALUES ('+
             QuotedStr(sDoc)+', '+
             QuotedStr(f_Troca('/','.',(f_Troca('-','.',DMBelShop.CDS_Busca.FieldByName('Dta_Doc').AsString))))+', '+
             QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Comprador').AsString)+', '+
             QuotedStr(DMBelShop.CDS_Busca.FieldByName('Des_Comprador').AsString)+', '+
             QuotedStr(sOrigem)+')';
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      DMBelShop.CDS_Busca.Close;
    End; // If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('num_docto').AsString)='' Then
    DMBelShop.CDS_BuscaRapida.Close;

    Exit;
  End; // If sTipo='I' Then

End; // Manutenção do Arquivo de Documentos de OC >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Consiste Conexão Empresas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TDMBelShop.ConsisteConexaoEmpresas: Boolean;
Var
  MySql: String;
Begin
  Result:=True;

  // Codigo da Empresa
  If Trim(FrmBelShop.Dbe_ConEmpresasCodEmp.Text)='' Then
  Begin
    sgMensagem:='Favor Informar o Código !!';
    FrmBelShop.Dbe_ConEmpresasCodEmp.SetFocus;
    Result:=False;
    Exit;
  End;

  MySql:=' Select Cod_Emp'+
         ' From EMP_Conexoes'+
         ' Where Cod_Emp='+QuotedStr(CDS_Empresa.FieldByName('Cod_Emp').NewValue)+
         ' And Cod_Emp<>'+QuotedStr(CDS_Empresa.FieldByName('Cod_Emp').OldValue);
  CDS_ConectaEmpresa.Close;
  SDS_ConectaEmpresa.CommandText:=MySql;
  CDS_ConectaEmpresa.Open;

  If Trim(CDS_ConectaEmpresa.FieldByName('Cod_Emp').AsString)<>'' Then
  Begin
    sgMensagem:='Codigo da Empresa Já Existente !!';
    FrmBelShop.Dbe_ConEmpresasCodEmp.SetFocus;
    Result:=False;
    Exit;
  end;

  // Tipo da Empresa
  If (Trim(FrmBelShop.Dbcb_ConEmpresasTipo.Text)<>'F') and (Trim(FrmBelShop.Dbcb_ConEmpresasTipo.Text)<>'M') Then
  Begin
    sgMensagem:='Tipo Inálido !!'+cr+cr+'(M)atriz ou (F)ilial!!';
    FrmBelShop.Dbcb_ConEmpresasTipo.SetFocus;
    Result:=False;
    Exit;
  End;

  If Trim(FrmBelShop.Dbcb_ConEmpresasTipo.Text)='M' Then
  Begin
    MySql:='Select Cod_Emp, Tip_Emp'+
           ' From Emp_Conexoes'+
           ' Where Tip_Emp=''M'''+
           ' And (Cod_Emp<>'+CDS_Empresa.FieldByName('Cod_Emp').OldValue+
           ' Or Cod_Emp<>'+CDS_Empresa.FieldByName('Cod_Emp').NewValue+')';
    SDS_Busca.Close;
    SDS_Busca.CommandText:=MySql;
    SDS_Busca.Open;

    If Trim(SDS_Busca.FieldByName('Tip_Emp').AsString)<>'' Then
    Begin
      sgMensagem:='A Empresa de Código '+SDS_Busca.FieldByName('Cod_Emp').AsString+cr+cr+
                  'Já Esta como Matriz...';

      SDS_Busca.Close;
      FrmBelShop.Dbcb_ConEmpresasTipo.SetFocus;
      Result:=False;
      Exit;
    End;
    SDS_Busca.Close;
  End; // If Trim(FrmBelShop.Dbcb_ConEmpresasTipo.Text)='M' Then

  // Ativo/Inativo da Empresa
  If (Trim(FrmBelShop.Dbcb_ConEmpresasAtvio.Text)<>'NAO') and (Trim(FrmBelShop.Dbcb_ConEmpresasAtvio.Text)<>'SIM') Then
  Begin
    sgMensagem:='Ativo Inálido !!'+cr+cr+'(SIM) ou (NAO)';
    FrmBelShop.Dbcb_ConEmpresasAtvio.SetFocus;
    Result:=False;
    Exit;
  End;

  // Lista de Precos
  If Trim(FrmBelShop.Dbe_ConEmpresasCodLP.Text)='' Then
  Begin
    sgMensagem:='Favor Informar a Lista de Preços da Loja !!';
    FrmBelShop.Dbe_ConEmpresasCodLP.SetFocus;
    Result:=False;
    Exit;
  End;

  // Razao Social da Empresa
  If Trim(FrmBelShop.Dbe_ConEmpresasRazaoSocial.Text)='' Then
  Begin
    sgMensagem:='Favor Informar o Nome/Razão Social !!';
    FrmBelShop.Dbe_ConEmpresasRazaoSocial.SetFocus;
    Result:=False;
    Exit;
  End;

  MySql:='Select Cod_Emp'+
         ' From EMP_Conexoes'+
         ' Where Razao_Social='+QuotedStr(CDS_Empresa.FieldByName('Razao_Social').NewValue)+
         ' And Cod_Emp<>'+QuotedStr(CDS_Empresa.FieldByName('Cod_Emp').OldValue);
  CDS_ConectaEmpresa.Close;
  SDS_ConectaEmpresa.CommandText:=MySql;
  CDS_ConectaEmpresa.Open;

  If Trim(CDS_ConectaEmpresa.FieldByName('Cod_Emp').AsString)<>'' Then
  Begin
    If msg('Razão Social da Empresa Já Existente !!'+cr+cr+'Deseja Manter ?','C')=2 Then
    Begin
      FrmBelShop.Dbe_ConEmpresasRazaoSocial.SetFocus;
      Result:=False;
      Exit;
    End;
  end;

  // CNPJ da Empresa
  If Trim(Tira_Mascara(FrmBelShop.Me_ConEmpresasCNPJ.Text))='' Then
  Begin
    sgMensagem:='Favor Informar o CNPJ !!';
    FrmBelShop.Me_ConEmpresasCNPJ.SetFocus;
    Result:=False;
    Exit;
  End;

  If not tbIsCNPJ(Tira_Mascara(FrmBelShop.Me_ConEmpresasCNPJ.Text)) Then
  Begin
    msg('CNPJ Inválido !!','A');
    FrmBelShop.Me_ConEmpresasCNPJ.SetFocus;
    Result:=False;
    Exit;
  end;

  MySql:='Select Cod_Emp'+
         ' From EMP_Conexoes'+
         ' Where Num_CNPJ='+QuotedStr(Tira_Mascara(FrmBelShop.Me_ConEmpresasCNPJ.Text))+
         ' And Num_CNPJ<>''00000000000000'''+
         ' And Cod_Emp<>'+QuotedStr(CDS_Empresa.FieldByName('Cod_Emp').OldValue);
  CDS_ConectaEmpresa.Close;
  SDS_ConectaEmpresa.CommandText:=MySql;
  CDS_ConectaEmpresa.Open;

  If Trim(CDS_ConectaEmpresa.FieldByName('Cod_Emp').AsString)<>'' Then
  Begin
    sgMensagem:='CNPJ Já Existente !!';
    FrmBelShop.Me_ConEmpresasCNPJ.SetFocus;
    Result:=False;
    Exit;
  end;

  // Inscricao Estadual da Empresa
  If Trim(FrmBelShop.Dbe_ConEmpresasInscrEstadual.Text)='' Then
  Begin
    sgMensagem:='Favor Informar a Inscrição Estadual !!';
    FrmBelShop.Dbe_ConEmpresasInscrEstadual.SetFocus;
    Result:=False;
    Exit;
  End;

  if not Valida_Insc_Est(Trim(Tira_Mascara(FrmBelShop.Dbe_ConEmpresasInscrEstadual.Text)), FrmBelShop.Dbe_ConEmpresasUF.Text) Then
  begin
    sgMensagem:='A Inscrição Estadual Inválida!!'+cr+cr+'Sem Inscrição Estadual Informe: ISENTO'
                +cr+'Ou Verifique se o UF esta CORRETO !!';
    FrmBelShop.Dbe_ConEmpresasInscrEstadual.SetFocus;
    Result:=False;
    Exit;
  End;

  MySql:='Select Cod_Emp'+
         ' From EMP_Conexoes'+
         ' Where INSCR_ESTADUAL<>''ISENTO'''+
         ' and INSCR_ESTADUAL='+QuotedStr(CDS_Empresa.FieldByName('Inscr_Estadual').NewValue)+
         ' And Cod_Emp<>'+QuotedStr(CDS_Empresa.FieldByName('Cod_Emp').OldValue);
  CDS_ConectaEmpresa.Close;
  SDS_ConectaEmpresa.CommandText:=MySql;
  CDS_ConectaEmpresa.Open;

  If Trim(CDS_ConectaEmpresa.FieldByName('Cod_Emp').AsString)<>'' Then
  Begin
    sgMensagem:='Inscrição Estadual Já Existente !!';
    FrmBelShop.Dbe_ConEmpresasInscrEstadual.SetFocus;
    Result:=False;
    Exit;
  End;

  // Codigo da Filial
  MySql:='Select Cod_Emp'+
         ' From EMP_Conexoes'+
         ' Where Cod_Filial='+QuotedStr(CDS_Empresa.FieldByName('Cod_Filial').NewValue)+
         ' And Cod_Emp<>'+QuotedStr(CDS_Empresa.FieldByName('Cod_Emp').OldValue);
  CDS_ConectaEmpresa.Close;
  SDS_ConectaEmpresa.CommandText:=MySql;
  CDS_ConectaEmpresa.Open;

  If Trim(CDS_ConectaEmpresa.FieldByName('Cod_Emp').AsString)<>'' Then
  Begin
    sgMensagem:='Codigo Filial Já Existente !!';
    FrmBelShop.Dbe_ConEmpresasCodFilial.SetFocus;
    Result:=False;
    Exit;
  end;

  // Inscrição Sindicato dos Salões de Beleza
  If Trim(FrmBelShop.Dbe_ConEmpresasNumSindicato.Text)='' Then
  Begin
    If msg('Loja Sem a Inscrição Sindicato'+cr+'dos Salões de Beleza !!'+cr+cr+'Manter SEM ??','C')=2 Then
    Begin
      FrmBelShop.Dbe_ConEmpresasNumSindicato.SetFocus;
      Result:=False;
      Exit;
    End;
  End;

  // Número do Alvará Municipário
  If Trim(FrmBelShop.Dbe_ConEmpresasNumAlvaraMun.Text)='' Then
  Begin
    If msg('Loja Sem o Número do'+cr+'Alvará Municipário !!'+cr+cr+'Manter SEM ??','C')=2 Then
    Begin
      FrmBelShop.Dbe_ConEmpresasNumAlvaraMun.SetFocus;
      Result:=False;
      Exit;
    End;
  End;

  If Trim(FrmBelShop.Dbe_ConEmpresasIP.Text)='' Then
  Begin
    sgMensagem:='Favor Informar o IP do Banco de Dados !!';
    FrmBelShop.Dbe_ConEmpresasIP.SetFocus;
    Result:=False;
    Exit;
  End;

  // Pasta da Base de Dados
  If Trim(FrmBelShop.Dbe_ConEmpresasPastaBD.Text)='' Then
  Begin
    sgMensagem:='Favor Informar o Pasta - Local da Base de Dados !!';
    FrmBelShop.Dbe_ConEmpresasPastaBD.SetFocus;
    Result:=False;
    Exit;
  End;

  // Nome da Base de Dados
  If Trim(FrmBelShop.Dbe_ConEmpresasBaseDados.Text)='' Then
  Begin
    sgMensagem:='Favor Informar o Nome da Base de Dados !!';
    FrmBelShop.Dbe_ConEmpresasBaseDados.SetFocus;
    Result:=False;
    Exit;
  End;

End; // Consiste Conexão Empresas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Banco de Dados - Ajusta Dados das Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TDMBelShop.AjustaDadosLojas: Boolean;
Var
  MySql: String;
Begin
  Result:=True;

  // Verifica se Transação esta Ativa
  If SQLC.InTransaction Then
   SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  SQLC.StartTransaction(TD);
  Try
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' Select ec.cod_emp'+
           ' From EMP_CONEXOES ec'+
           ' Order by ec.cod_emp';
    CDS_Busca.Close;
    SDS_Busca.CommandText:=MySql;
    CDS_Busca.Open;

    While Not CDS_Busca.Eof do
    Begin
      MySql:=' Select cl.nomecliente razao_social, cl.numerocgcmf CNPJ, cl.numeroinsc,'+
             ' cl.bairro, cl.cidade, cl.estado, cl.codigopostal CEP,'+
             ' cl.logradouro, cl.lognumero, cl.logcompl'+

             ' From CLIENTE cl'+

             ' Where cl.codcliente='+CDS_Busca.FieldByName('Cod_Emp').AsString;
      FrmBelShop.IBQ_MPMS.Close;
      FrmBelShop.IBQ_MPMS.SQL.Clear;
      FrmBelShop.IBQ_MPMS.SQL.Add(MySql);
      FrmBelShop.IBQ_MPMS.Open;

      MySql:=' Update EMP_CONEXOES ce'+
             ' Set ce.Razao_Social='+
             QuotedStr(Trim(FrmBelShop.IBQ_MPMS.FieldByName('Razao_Social').AsString))+', '+
             ' ce.Des_Bairro='+
             QuotedStr(Trim(FrmBelShop.IBQ_MPMS.FieldByName('Bairro').AsString))+', '+
             ' ce.Des_Cidade='+
             QuotedStr(Trim(FrmBelShop.IBQ_MPMS.FieldByName('Cidade').AsString))+', '+
             ' ce.Cod_UF='+
             QuotedStr(Trim(FrmBelShop.IBQ_MPMS.FieldByName('Estado').AsString))+', '+
             ' ce.Cod_CEP='+
             QuotedStr(Trim(FrmBelShop.IBQ_MPMS.FieldByName('CEP').AsString))+', '+
             ' ce.Num_CNPJ='+
             QuotedStr(Trim(FrmBelShop.IBQ_MPMS.FieldByName('CNPJ').AsString))+', '+
             ' ce.Inscr_Estadual='+
             QuotedStr(Trim(FrmBelShop.IBQ_MPMS.FieldByName('NumeroInsc').AsString))+', '+
             ' ce.Des_Endereco='+
             QuotedStr(Trim(FrmBelShop.IBQ_MPMS.FieldByName('Logradouro').AsString))+', '+
             ' ce.Num_Endereco='+
             QuotedStr(Trim(FrmBelShop.IBQ_MPMS.FieldByName('LogNumero').AsString))+', '+
             ' ce.Compl_Endereco='+
             QuotedStr(Trim(FrmBelShop.IBQ_MPMS.FieldByName('LogCompl').AsString))+

             ' Where ce.Cod_Emp='+
             CDS_Busca.FieldByName('Cod_Emp').AsString;
      SQLC.Execute(MySql,nil,nil);

      CDS_Busca.Next;
    End; // While Not CDS_Busca.Eof do
    CDS_Busca.Close;
    FrmBelShop.IBQ_MPMS.Close;

    // Atualiza Transacao =======================================
    SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

  Except
    on e : Exception do
    Begin
      // Abandona Transacao =====================================
      Result:=False;

      CDS_Busca.Close;
      FrmBelShop.IBQ_MPMS.Close;

      SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      sgMensagem:='Mensagem de erro do sistema:'+#13+e.message;
    End; // on e : Exception do
  End; // Try

End; // Banco de Dados - Ajusta Dados das Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Nome do Servidor, Tipo de Conexão e Codigo da Loja Se Unica >>>>>>>>>>>>>>>>>
Function BuscaServidorLojaUnica: Boolean;
Var
  tsArquivo: TStringList;
  s: String;
  i: Integer;
Begin
  Result:=True;

  tsArquivo:= TStringList.Create;
  Try
    { Carrega o conteúdo do arquivo texto para a   memória }
    tsArquivo.LoadFromFile(IncludeTrailingPathDelimiter(sPath_Local)+'Servidor_Adm.ini');

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

  If sgCodLojaUnica='999999' Then
   Result:=False

End; // // Nome do Servidor, Tipo de Conexão e Codigo da Loja Se Unica >>>>>>>>>

// Busca Sequencia - Numerado - nas Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function BuscaNumeradoLoja(sNumerado, sAdicionar, sCodLoja: String; Var sSeq: String): Boolean;
Var
  b: Boolean;
  i: Integer;
Begin
  // sNumerado =  Codigo do Numerado
  // sAdicionar = somar numerado (S) Soma (N) Não Soma

  Result:=False;

  If Not ConexaoEmpIndividual('IBDB_'+sCodLoja, 'IBT_'+sCodLoja, 'A') Then
  Begin
    sgMensagem:='Loja Bel_'+sCodLoja+' Não Conectada !!'+cr+cr+'Tente Mais Tarde...';
    Exit;
  End; // If ConexaoEmpIndividual('IBDB_'+sCodLoja, 'IBT_'+sCodLoja, 'A') Then

  // Monta Transacao ===========================================================
  If Not IBTransacao('S', 'IBT_'+sCodLoja) Then
  Begin
    sgMensagem:='Loja Bel_'+sCodLoja+' Perdeu a Conexão !!'+cr+cr+'Tente Mais Tarde...';
    Exit;
  End;

  // Inicializa StoredProc
  b:=False;
  i:=0;
  While Not b do
  Begin
    Try
      FrmBelShop.StoredProcInicializa(IBSP_Geral,'IBDB_'+sCodLoja, 'IBT_'+sCodLoja);
      b:=True;
      i:=0;
    Except
      i:=i+1
    End;

    If i=10 Then
    Begin
      sgMensagem:='Loja Bel_'+sCodLoja+' Perdeu a Conexão !!'+cr+cr+'Tente Mais Tarde...';
      Exit;
    End;
  End; // While Not b do

  Try
    IBSP_Geral.StoredProcName:='BUSCA_NUMERADOR_AUTOMATICO';
    IBSP_Geral.Prepare;
    IBSP_Geral.ParamByName('PAR_CODNUMERADOR').Value:=sNumerado;
    IBSP_Geral.ParamByName('PAR_ADICIONA_SN').Value:=sAdicionar;
    IBSP_Geral.ExecProc;
    sSeq:=FormatFloat('000000',(IBSP_Geral.ParamByName('RET_NUMERO').AsInteger));
    IBSP_Geral.Prepared:=False;

    // Atualiza Transacao =======================================
    IBTransacao('C', 'IBT_'+sCodLoja);

    Result:=True;
  Except
    on e : Exception do
    Begin
      // Abandona Transacao =====================================
      IBTransacao('R', 'IBT_'+sCodLoja);
      MessageBox(Application.Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try

  ConexaoEmpIndividual('IBDB_'+sCodLoja, 'IBT_'+sCodLoja, 'F');

End; // Busca Sequencia - Numerado - nas Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Caclcula Margem de Lucro Sintético dos Fornecedores >>>>>>>>>>>>>>>>>>>>>>>>>
Procedure MargemLucroSinteticoFornecedores;
Var
  sCodForn: String;
  cTot_Venda_PV, cTot_Venda_PC: Currency;
  iNumSeq: Integer;
Begin
  // Calcula Margem de Lucro dos Fornecedores ==================================
  DMVirtual.CDS_V_MargemLucro.DisableControls;
  DMVirtual.CDS_V_MargemLucro.Last;
  cTot_Venda_Pv:=StrToCurr(DMVirtual.CDS_V_MargemLucroVLR_VENDA_PV.AsString);
  cTot_Venda_PC:=StrToCurr(DMVirtual.CDS_V_MargemLucroVLR_VENDA_PC.AsString);
  iNumSeq:=0;

  DMVirtual.CDS_V_MargemLucro.First;
  While Not DMVirtual.CDS_V_MargemLucro.Eof do
  Begin
    Application.ProcessMessages;

    sCodForn:=DMVirtual.CDS_V_MargemLucroCODFORNECEDOR.AsString;

    If Trim(sCodForn)<>'' Then
    Begin
      If DMVirtual.CDS_V_MargemLucroForn.Locate('CODFORNECEDOR', sCodForn,[]) Then
       Begin
         DMVirtual.CDS_V_MargemLucroForn.Edit;

         DMVirtual.CDS_V_MargemLucroFornTOT_QTD_COMPRA.AsCurrency:=
                       DMVirtual.CDS_V_MargemLucroFornTOT_QTD_COMPRA.AsCurrency+
                       DMVirtual.CDS_V_MargemLucroTOT_QTD_COMPRA.AsCurrency;

         DMVirtual.CDS_V_MargemLucroFornTOT_QTD_VENDA.AsCurrency:=
                        DMVirtual.CDS_V_MargemLucroFornTOT_QTD_VENDA.AsCurrency+
                        DMVirtual.CDS_V_MargemLucroTOT_QTD_VENDA.AsCurrency;

         DMVirtual.CDS_V_MargemLucroFornVALOR_MARGEM.AsCurrency:=
                         DMVirtual.CDS_V_MargemLucroFornVALOR_MARGEM.AsCurrency+
                         DMVirtual.CDS_V_MargemLucroVALOR_MARGEM.AsCurrency;

         DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PV.AsCurrency:=
                         DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PV.AsCurrency+
                         DMVirtual.CDS_V_MargemLucroVLR_VENDA_PV.AsCurrency;

         DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PC.AsCurrency:=
                         DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PC.AsCurrency+
                         DMVirtual.CDS_V_MargemLucroVLR_VENDA_PC.AsCurrency;

         DMVirtual.CDS_V_MargemLucroFornVLR_BAP.AsCurrency:=
                              DMVirtual.CDS_V_MargemLucroFornVLR_BAP.AsCurrency+
                              DMVirtual.CDS_V_MargemLucroVLR_BAP.AsCurrency;

         DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PC_BAP.AsCurrency:=
                     DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PC_BAP.AsCurrency+
                     DMVirtual.CDS_V_MargemLucroVLR_VENDA_PC_BAP.AsCurrency;
       End
      Else // If DMVirtual.CDS_V_MargemLucroForn.Locate('CODFORNECEDOR', sCodForn,[]) Then
       Begin
         inc(iNumSeq);
         DMVirtual.CDS_V_MargemLucroForn.Insert;
         DMVirtual.CDS_V_MargemLucroFornCODFORNECEDOR.AsString:=sCodForn;
         DMVirtual.CDS_V_MargemLucroFornNOMEFORNECEDOR.AsString:=
                             DMVirtual.CDS_V_MargemLucroNOMEFORNECEDOR.AsString;

         DMVirtual.CDS_V_MargemLucroFornTOT_QTD_COMPRA.AsCurrency:=
                           DMVirtual.CDS_V_MargemLucroTOT_QTD_COMPRA.AsCurrency;

         DMVirtual.CDS_V_MargemLucroFornTOT_QTD_VENDA.AsCurrency:=
                            DMVirtual.CDS_V_MargemLucroTOT_QTD_VENDA.AsCurrency;

         DMVirtual.CDS_V_MargemLucroFornVALOR_MARGEM.AsCurrency:=
                             DMVirtual.CDS_V_MargemLucroVALOR_MARGEM.AsCurrency;

         DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PV.AsCurrency:=
                             DMVirtual.CDS_V_MargemLucroVLR_VENDA_PV.AsCurrency;

         DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PC.AsCurrency:=
                             DMVirtual.CDS_V_MargemLucroVLR_VENDA_PC.AsCurrency;

         DMVirtual.CDS_V_MargemLucroFornVLR_BAP.AsCurrency:=
                                  DMVirtual.CDS_V_MargemLucroVLR_BAP.AsCurrency;

         DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PC_BAP.AsCurrency:=
                         DMVirtual.CDS_V_MargemLucroVLR_VENDA_PC_BAP.AsCurrency;

         DMVirtual.CDS_V_MargemLucroFornNUMSEQ.AsInteger:=iNumSeq;
       End; // If DMVirtual.CDS_V_MargemLucroForn.Locate('CODFORNECEDOR', sCodForn,[]) Then

      // Valores Calculados ====================================================
      DMVirtual.CDS_V_MargemLucroFornPARTVENDA.AsCurrency:=RoundTo(((
                    DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PV.AsCurrency*100)/
                    cTot_Venda_PV),-2);

      DMVirtual.CDS_V_MargemLucroFornPARTCUSTO.AsCurrency:=RoundTo(((
                    DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PC.AsCurrency*100)/
                    cTot_Venda_PC),-2);

      DMVirtual.CDS_V_MargemLucroFornVLR_MARGEM_TOTAL.AsCurrency:=
                         DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PV.AsCurrency-
                         DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PC.AsCurrency;
      // Lucro
      If FrmBelShop.Rb_MLTpCalculoMargem.Checked Then
       Begin
         If DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PV.AsCurrency<>0 Then
          DMVirtual.CDS_V_MargemLucroFornLUCRO.AsCurrency:=RoundTo((((
                DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PV.AsCurrency-
                DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PC.AsCurrency)/
                DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PV.AsCurrency)*100),-2)
         Else
          DMVirtual.CDS_V_MargemLucroFornLUCRO.AsCurrency:=0.00;
       End
      Else
       Begin
         If DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PC.AsCurrency<>0 Then
          DMVirtual.CDS_V_MargemLucroFornLUCRO.AsCurrency:=RoundTo((((
                DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PV.AsCurrency-
                DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PC.AsCurrency)/
                DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PC.AsCurrency)*100),-2)
         Else
          DMVirtual.CDS_V_MargemLucroFornLUCRO.AsCurrency:=0.00;
       End;

      DMVirtual.CDS_V_MargemLucroFornPER_BAP_VENDA.AsCurrency:=RoundTo(((
                    DMVirtual.CDS_V_MargemLucroFornVLR_BAP.AsCurrency*100)/
                    DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PV.AsCurrency),-2);

      DMVirtual.CDS_V_MargemLucroFornVLR_MARGEM_FINAL.AsCurrency:=
                     DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PV.AsCurrency-
                     DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PC_BAP.AsCurrency;

      // Lucro Final
      If FrmBelShop.Rb_MLTpCalculoMargem.Checked Then
       Begin
         If DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PV.AsCurrency<>0 Then
          DMVirtual.CDS_V_MargemLucroFornPER_LUCRO_FINAL.AsCurrency:=RoundTo((((
                DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PV.AsCurrency-
                DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PC_BAP.AsCurrency)/
                DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PV.AsCurrency)*100),-2)
         Else
          DMVirtual.CDS_V_MargemLucroFornPER_LUCRO_FINAL.AsCurrency:=0.00;
       End
      Else
       Begin
         If DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PC_BAP.AsCurrency<>0 Then
          DMVirtual.CDS_V_MargemLucroFornPER_LUCRO_FINAL.AsCurrency:=RoundTo((((
            DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PV.AsCurrency-
            DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PC_BAP.AsCurrency)/
            DMVirtual.CDS_V_MargemLucroFornVLR_VENDA_PC_BAP.AsCurrency)*100),-2)
         Else
          DMVirtual.CDS_V_MargemLucroFornPER_LUCRO_FINAL.AsCurrency:=0.00;
       End;

      DMVirtual.CDS_V_MargemLucroForn.Post;

    End; // If Trim(sCodForn)<>'' Then

    DMVirtual.CDS_V_MargemLucro.Next;
  End; // While Not DMVirtual.CDS_V_MargemLucro.Eof do
  DMVirtual.CDS_V_MargemLucro.EnableControls;

  DMVirtual.CDS_V_MargemLucro.First;
  DMVirtual.CDS_V_MargemLucroForn.First;

End; // Caclcula Margem de Lucro Sintético dos Fornecedores >>>>>>>>>>>>>>>>>>>>

// Transacao IB >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Situacao: (S)StarT Transação (F)Fecha Transação  (C)ommit (R)ollback
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

    If (ii=0) or (ii>1) Then // 2 vezes
     Break;
  End; // While Not b do
End; // Conexao IB Individual >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Desconecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMBelShop.Desconecta;
Var
  i: Integer;
begin
  For i:=0 to DMConexoes.ComponentCount-1 do
  Begin
    If DMConexoes.Components[i] is TIBDatabase Then
    Begin
      If (DMConexoes.Components[i] as TIBDatabase).Connected Then
      Begin
        Try
         (DMConexoes.Components[i] as TIBDatabase).Connected:=False;
        Except
        End; // Try
      End; // If (DMConexoes.Components[i] as TIBDatabase).Connected Then
    End; // If DMConexoes.Components[i] is TIBDatabase Then
  End; // For i:=0 to DMConexoes.ComponentCount-1 do

  If DMVirtual.CDS_V_EmpConexoes.Active Then
  Begin
    DMVirtual.CDS_V_EmpConexoes.First;
    While Not DMVirtual.CDS_V_EmpConexoes.Eof do
    Begin
      DMVirtual.CDS_V_EmpConexoes.Edit;
      DMVirtual.CDS_V_EmpConexoesCONEXAO.AsString:='Não';
      DMVirtual.CDS_V_EmpConexoes.Post;

      DMVirtual.CDS_V_EmpConexoes.Next;
    End; // While Not DMVirtual.CDS_V_EmpConexoes.Eof do
    DMVirtual.CDS_V_EmpConexoes.First;

  End; // If DMVirtual.CDS_V_EmpConexoes.Active Then

End; // Desconecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Testa Conexão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function  TDMBelShop.TestaConexao: Boolean;
Begin
  Inc(igTentaConexao);

  Result:=True;

  FrmEntrada.OdirPanApres.Caption:='AGUARDE !! Testando Conexão Matriz - '+IntToStr(igTentaConexao);
  FrmEntrada.Refresh;
  If (Not FrmBelShop.ConectaMatriz(True)) Then
    Result:=False;

  If (Result) Then
  Begin
    FrmEntrada.OdirPanApres.Caption:='AGUARDE !! Testando Conexão MPMS - '+IntToStr(igTentaConexao);
    FrmEntrada.Refresh;
    If (Not FrmBelShop.ConectaMPMS(True))  Then
     Result:=False;
  End; // If (bgSair) Then

  If (Result) Then
  Begin
    FrmEntrada.OdirPanApres.Caption:='AGUARDE !! Testando Conexão Bel_01 - '+IntToStr(igTentaConexao);
    FrmEntrada.Refresh;
    If (Not ConexaoEmpIndividual('IBDB_01', 'IBT_01', 'A', True)) Then
     Result:=False
    Else
     ConexaoEmpIndividual('IBDB_01', 'IBT_01', 'F');
  End; // If (bgSair) Then

  If (Result) Then
  Begin
    FrmEntrada.OdirPanApres.Caption:='AGUARDE !! Testando Conexão Bel_05 - '+IntToStr(igTentaConexao);
    FrmEntrada.Refresh;
    If (Not ConexaoEmpIndividual('IBDB_05', 'IBT_05', 'A', True)) Then
     Result:=False
    Else
     ConexaoEmpIndividual('IBDB_05', 'IBT_05', 'F');
  End; // If (bgSair) Then

  If (Not Result) Then
  Begin
    If Trim(sgTpConexao)='TCP/IP' Then
     sgTpConexao:=''
    Else
     sgTpConexao:='TCP/IP';
  End; // If (Not bgSiga) Then
End; // Testa Conexão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Monta Empresas a Conectar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMBelShop.MontaConexaoEmpresas;
Var
  MySql, s: String;
  sEndIP: String;
  i: Integer;
Begin
  MySql:=' SELECT p.FTP_Usar, p.computer_master, p.computer_server,'+
         ' p.IP_Server, p.IP_Internet_Server,'+
         ' p.FTP_User, p.FTP_Password'+
         ' FROM PARAMETROS p';
  CDS_BuscaRapida.Close;
  SDS_BuscaRapida.CommandText:=MySql;
  CDS_BuscaRapida.Open;

  sgCompMaster      :=AnsiUpperCase(CDS_BuscaRapida.FieldByName('computer_master').AsString);
  sgCompServer       :=AnsiUpperCase(CDS_BuscaRapida.FieldByName('computer_server').AsString);

  sgFTPUsar         :=CDS_BuscaRapida.FieldByName('FTP_Usar').AsString;

  sgIPServer        :=AnsiUpperCase(CDS_BuscaRapida.FieldByName('IP_Server').AsString);
  sgIPInternetServer:=AnsiUpperCase(CDS_BuscaRapida.FieldByName('IP_Internet_Server').AsString);

  sgFTPUser         :=AnsiUpperCase(CDS_BuscaRapida.FieldByName('FTP_User').AsString);
  sgFTPSenha        :=AnsiUpperCase(CDS_BuscaRapida.FieldByName('FTP_Password').AsString);
  sgPastaAreaFTP    :='C:\Projetos\BelShop\AreaFTP\';

  CDS_BuscaRapida.Close;

  // Guarda Empresas Ativas ====================================================
  // Se trancar aqui é Por Falta do Registro da Dll MIDAS.
  // regsvr32 c:\windows\system32\Midas.dll
  If DMVirtual.CDS_V_EmpConexoes.Active Then
   DMVirtual.CDS_V_EmpConexoes.Close;

  DMVirtual.CDS_V_EmpConexoes.CreateDataSet;
  DMVirtual.CDS_V_EmpConexoes.IndexFieldNames:='';
  DMVirtual.CDS_V_EmpConexoes.Open;

  MySql:='Select *'+
         ' From EMP_Conexoes e'+
         ' Where (e.Ind_Ativo=''SIM'' or e.Tip_Emp=''M'')'+
         ' Order by Cod_Emp';
  CDS_ConectaEmpresa.Close;
  SDS_ConectaEmpresa.CommandText:=MySql;
  CDS_ConectaEmpresa.Open;

  While Not CDS_ConectaEmpresa.Eof do
  Begin
    DMVirtual.CDS_V_EmpConexoes.Insert;
    DMVirtual.CDS_V_EmpConexoesCOD_CEP.AsString:=
                            CDS_ConectaEmpresa.FieldByName('Cod_CEP').AsString;
    DMVirtual.CDS_V_EmpConexoesCOD_EMP.AsString:=
                            CDS_ConectaEmpresa.FieldByName('Cod_Emp').AsString;
    DMVirtual.CDS_V_EmpConexoesCOD_FILIAL.AsString:=
                         CDS_ConectaEmpresa.FieldByName('Cod_Filial').AsString;
    DMVirtual.CDS_V_EmpConexoesCOD_UF.AsString:=
                             CDS_ConectaEmpresa.FieldByName('Cod_UF').AsString;
    DMVirtual.CDS_V_EmpConexoesCOMPL_ENDERECO.AsString:=
                     CDS_ConectaEmpresa.FieldByName('Compl_Endereco').AsString;
    DMVirtual.CDS_V_EmpConexoesCONECTAR.AsString:='SIM';
    DMVirtual.CDS_V_EmpConexoesCONEXAO.AsString:='Não';
    DMVirtual.CDS_V_EmpConexoesDES_BAIRRO.AsString:=
                         CDS_ConectaEmpresa.FieldByName('Des_Bairro').AsString;
    DMVirtual.CDS_V_EmpConexoesDES_BASE_DADOS.AsString:=
                     CDS_ConectaEmpresa.FieldByName('Des_Base_Dados').AsString;
    DMVirtual.CDS_V_EmpConexoesDES_CIDADE.AsString:=
                         CDS_ConectaEmpresa.FieldByName('Des_Cidade').AsString;
    DMVirtual.CDS_V_EmpConexoesDES_ENDERECO.AsString:=
                       CDS_ConectaEmpresa.FieldByName('Des_Endereco').AsString;
    DMVirtual.CDS_V_EmpConexoesCOD_LISTAPRE.AsString:=
                       CDS_ConectaEmpresa.FieldByName('Cod_ListaPre').AsString;

    // Se Conexão Local / Externa / Loja Unica
    If (Not bgConexaoLocal) and (Trim(CDS_ConectaEmpresa.FieldByName('Endereco_IP_Externo').AsString)<>'') Then
     DMVirtual.CDS_V_EmpConexoesENDERECO_IP.AsString:=
                 CDS_ConectaEmpresa.FieldByName('Endereco_IP_Externo').AsString
    Else
     DMVirtual.CDS_V_EmpConexoesENDERECO_IP.AsString:=
                        CDS_ConectaEmpresa.FieldByName('Endereco_IP').AsString;

    DMVirtual.CDS_V_EmpConexoesIND_ATIVO.AsString:=
                          CDS_ConectaEmpresa.FieldByName('Ind_Ativo').AsString;

    DMVirtual.CDS_V_EmpConexoesINSCR_ESTADUAL.AsString:=
                     CDS_ConectaEmpresa.FieldByName('Inscr_Estadual').AsString;
    DMVirtual.CDS_V_EmpConexoesNUM_CNPJ.AsString:=
                           CDS_ConectaEmpresa.FieldByName('Num_CNPJ').AsString;
    DMVirtual.CDS_V_EmpConexoesNUM_ENDERECO.AsString:=
                       CDS_ConectaEmpresa.FieldByName('Num_Endereco').AsString;
    DMVirtual.CDS_V_EmpConexoesPASTA_BASE_DADOS.AsString:=
                   CDS_ConectaEmpresa.FieldByName('Pasta_Base_Dados').AsString;
    DMVirtual.CDS_V_EmpConexoesRAZAO_SOCIAL.AsString:=
                       CDS_ConectaEmpresa.FieldByName('Razao_Social').AsString;
    DMVirtual.CDS_V_EmpConexoesTIP_EMP.AsString:=
                            CDS_ConectaEmpresa.FieldByName('Tip_Emp').AsString;
    DMVirtual.CDS_V_EmpConexoesDATABASE.AsString:='IBDB_'+
                         CDS_ConectaEmpresa.FieldByName('Cod_Filial').AsString;
    DMVirtual.CDS_V_EmpConexoesTRANSACAO.AsString:='IBT_'+
                         CDS_ConectaEmpresa.FieldByName('Cod_Filial').AsString;
    DMVirtual.CDS_V_EmpConexoes.Post;

    // Monta Conexões de Empresas Ativas =======================================
    For i:=0 to DMConexoes.ComponentCount-1 do
    Begin
      If DMConexoes.Components[i] is TIBDatabase Then
      Begin
        If (DMConexoes.Components[i] as TIBDatabase).Name=DMVirtual.CDS_V_EmpConexoesDATABASE.AsString Then
        Begin
          (DMConexoes.Components[i] as TIBDatabase).Connected:=False;

          sEndIP:=DMVirtual.CDS_V_EmpConexoesENDERECO_IP.AsString;

          // Tipo de Conexão: NetBEUI
          If (Trim(sgTpConexao)='')              Or (Trim(sgTpConexao)='NetBEUI') Or
             (AnsiUpperCase(sEndIP)='LOCALHOST') Or (AnsiUpperCase(sEndIP)=sgCompServer) Or
             (AnsiUpperCase(sEndIP)=sgIPServer) Then
           s:='\\'+IncludeTrailingPathDelimiter(sEndIP)+
                   IncludeTrailingPathDelimiter(DMVirtual.CDS_V_EmpConexoesPASTA_BASE_DADOS.AsString)+
                                               DMVirtual.CDS_V_EmpConexoesDES_BASE_DADOS.AsString;

          // Tipo de Conexão: TCP/IP
          If (Trim(sgTpConexao)='TCP/IP')          and (AnsiUpperCase(sEndIP)<>'LOCALHOST') and
             (AnsiUpperCase(sEndIP)<>sgCompServer) and (AnsiUpperCase(sEndIP)<>sgIPServer) Then
           s:=sEndIP+':'+
              IncludeTrailingPathDelimiter(DMVirtual.CDS_V_EmpConexoesPASTA_BASE_DADOS.AsString)+
                                           DMVirtual.CDS_V_EmpConexoesDES_BASE_DADOS.AsString;

          //==============================================================================
          // Acerta Conexao com a Loja 08 - 201.86.212.9:C:\SIDICOM.NEW\BIGNEW.FDB - TCPIP
          //==============================================================================
          If CDS_ConectaEmpresa.FieldByName('Cod_Filial').AsString='08' Then
           s:=sEndIP+':'+
              IncludeTrailingPathDelimiter(DMVirtual.CDS_V_EmpConexoesPASTA_BASE_DADOS.AsString)+
                                           DMVirtual.CDS_V_EmpConexoesDES_BASE_DADOS.AsString;

          //  \\201.86.212.10\C:\SIDICOM.NEW\BANCO.FDB

          (DMConexoes.Components[i] as TIBDatabase).DatabaseName:=s;
          Break;
        End;
      End; // If DMConexoes.Components[i] is TIBDatabase Then
    End; // For i:=0 to DMConexoes.ComponentCount-1 do

    CDS_ConectaEmpresa.Next;
  End; // While Not CDS_ConectaEmpresa.Eof do
  DMVirtual.CDS_V_EmpConexoes.First;
  CDS_ConectaEmpresa.Close;

  // Monta Conexões de Empresas Inativas Válidas ===============================
  MySql:='Select *'+
         ' From EMP_Conexoes e'+
         ' Where e.Ind_Ativo=''NAO'''+
         ' And e.cod_filial>40'+
         ' Order by Cod_Emp';
  CDS_ConectaEmpresa.Close;
  SDS_ConectaEmpresa.CommandText:=MySql;
  CDS_ConectaEmpresa.Open;

  While Not CDS_ConectaEmpresa.Eof do
  Begin
    For i:=0 to DMConexoes.ComponentCount-1 do
    Begin
      If DMConexoes.Components[i] is TIBDatabase Then
      Begin
        If (DMConexoes.Components[i] as TIBDatabase).Name='IBDB_'+CDS_ConectaEmpresa.FieldByName('Cod_Filial').AsString Then
        Begin
           (DMConexoes.Components[i] as TIBDatabase).Connected:=False;

           sEndIP:=CDS_ConectaEmpresa.FieldByName('ENDERECO_IP').AsString;

           // Tipo de Conexão: NetBEUI
           If (Trim(sgTpConexao)='')              Or (Trim(sgTpConexao)='NetBEUI')  Or
              (AnsiUpperCase(sEndIP)='LOCALHOST') Or (AnsiUpperCase(sEndIP)=sgIPServer) Or
              (AnsiUpperCase(sEndIP)=sgCompServer) Then
           Begin
             s:='\\';

             // Se Conexão Local ou Externa ======================================
             //  \\201.86.212.10\C:\SIDICOM.NEW\BANCO.FDB
             If (Not bgConexaoLocal) and (Trim(CDS_ConectaEmpresa.FieldByName('Endereco_IP_Externo').AsString)<>'') Then
              s:=s+IncludeTrailingPathDelimiter(CDS_ConectaEmpresa.FieldByName('ENDERECO_IP_EXTERNO').AsString)
             Else
              s:=s+IncludeTrailingPathDelimiter(sEndIP);

             s:=s+IncludeTrailingPathDelimiter(CDS_ConectaEmpresa.FieldByName('Pasta_Base_Dados').AsString)+
                                               CDS_ConectaEmpresa.FieldByName('Des_Base_Dados').AsString;
           End; // If (Trim(sgTpConexao)='') Or (Trim(sgTpConexao)='NetBEUI') Then ...

           // Tipo de Conexão: TCP/IP
           If (Trim(sgTpConexao)='TCP/IP')          and (AnsiUpperCase(sEndIP)<>'LOCALHOST') and
              (AnsiUpperCase(sEndIP)<>sgCompServer) and (AnsiUpperCase(sEndIP)<>sgIPServer) Then
           Begin
             s:=sEndIP+':'+
                IncludeTrailingPathDelimiter(CDS_ConectaEmpresa.FieldByName('Pasta_Base_Dados').AsString)+
                                             CDS_ConectaEmpresa.FieldByName('Des_Base_Dados').AsString;
           End; // If Trim(sgTpConexao)='TCP/IP' Then

          (DMConexoes.Components[i] as TIBDatabase).DatabaseName:=s;
          Break;
        End;
      End; // If DMConexoes.Components[i] is TIBDatabase Then
    End; // For i:=0 to DMConexoes.ComponentCount-1 do

    CDS_ConectaEmpresa.Next;
  End; // While Not CDS_ConectaEmpresa.Eof do
  CDS_ConectaEmpresa.Close;

End; // Monta Empresas a Conectar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMBelShop.ConectaBanco;
Var
  Arq: TextFile;
  s, sBancoIB: String;
  i: Integer;
  b: Boolean;
  Flags : Cardinal;
begin

  if not InternetGetConnectedState(@Flags, 0) then
  Begin
    If msg('Você não está conectado à Internet !!'+cr+cr+'Deseja Continuar Assim Mesmo ??','C')=2 Then
    Begin
      Application.Terminate;
      Exit;
    End;
  End;
                     
  If Not (FileExists(sPath_Local+sgPCTConect_IB)) Then
  Begin
    msg('Arquivo de Configuração Não Existe...'+cr+'O Sistema será Encerrado !!','A');
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
      LoadParamsFromIniFile(sPath_Local+sgPCTConect_IB);

      Params.Add('User_Name='+sUser_Name);
      Params.Add('Password='+sPassword);
      b:=False;
      While Not b do
      Begin
        Try
          Connected:=True;
          Break;
        Except
          on e : Exception do
          Begin
            MessageBox(Application.Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
            Application.Terminate;
            exit;
          End; // on e : Exception do
        End;
      End;
    Except // finally
    End;
  end;

  FrmBelShop.Mem_Odir.Lines.Add(SQLC.Params.GetText);

  If SQLC.Connected Then FrmBelShop.Mem_Odir.Lines.Add('CONNECTED=True') Else FrmBelShop.Mem_Odir.Lines.Add('CONNECTED=False');
  If bgConexaoLocal Then FrmBelShop.Mem_Odir.Lines.Add('CONEXÃO LOCAL=True') Else FrmBelShop.Mem_Odir.Lines.Add('CONEXÃO LOCAL=False');

  // ===========================================================================
  // Conexão IBDatabase BelShop ================================================
  // ===========================================================================
  AssignFile(Arq,IncludeTrailingPathDelimiter(sPath_Local)+sgPCTConect_IB);

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

  IBDB_BelShop.DatabaseName:=sBancoIB;
  DMConexoes.IBDB_BelShop.DatabaseName:=sBancoIB;
  i:=0;
  b:=False;
  While Not b do
  Begin
    Try
      IBDB_BelShop.Connected:=True;
      b:=True;
    Except
      on e : Exception do
      Begin
         i:=i+1;
         If i=2 Then
         Begin
           s:=e.message;
           MessageBox(Application.Handle, pChar('Erro ao Conectar Bando BelShop !!'+cr+e.message), 'Erro', MB_ICONERROR);
           Application.Terminate;
           b:=True;
         End;
      End;
    End;
  End;

  // Guarda Momento de Abertura do Aplicativo ==================================
  b:=False;
  While Not b do
  Begin
    Try
      sgDataHoraAplicativo:=DateTimeToStr(
                              DataHoraServidorFI(SDS_DtaHoraServidor));
      b:=True;
    Except
    End;
  End; // While Not b do

End; // Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// =============================================================================
// Odir - FIM ==================================================================
// =============================================================================
          
procedure TDMBelShop.CDS_EmpresaAfterScroll(DataSet: TDataSet);
Var
  s:String;
  MySql: String;
begin
  s:=Tira_Mascara(Trim(CDS_Empresa.FieldByName('Num_CNPJ').AsString));
  FrmBelShop.Me_ConEmpresasCNPJ.Text:=tbFmtCPForCNPJ(ZerosEsquerda(s,14));

  s:=Tira_Mascara(Trim(CDS_Empresa.FieldByName('Cod_Cep').AsString));
  FrmBelShop.Me_ConEmpresasCEP.Text:=tbFmtCEP(s);

  s:=FrmBelShop.NomeUfEstado(CDS_Empresa.FieldByName('Cod_UF').AsString);
  FrmBelShop.EdtConEmpresasEstado.Text:=Separa_String(s,1);

  FrmBelShop.EdtConEmpresasUsuInclui.Clear;
  If Trim(CDS_Empresa.FieldByName('Usu_Inclui').AsString)<>'' Then
  Begin
    MySql:='Select Des_Login'+
           ' From PS_Usuarios'+
           ' Where Cod_Usuario='+CDS_Empresa.FieldByName('Usu_Inclui').AsString;
    SDS_Busca.Close;
    SDS_Busca.CommandText:=MySql;
    SDS_Busca.Open;
    FrmBelShop.EdtConEmpresasUsuInclui.Text:=SDS_Busca.FieldByName('Des_Login').AsString;
    SDS_Busca.Close;
  End;

  FrmBelShop.EdtConEmpresasUsuAltera.Clear;
  If Trim(CDS_Empresa.FieldByName('Usu_Altera').AsString)<>'' Then
  Begin
    MySql:='Select Des_Login'+
           ' From PS_Usuarios'+
           ' Where Cod_Usuario='+CDS_Empresa.FieldByName('Usu_Altera').AsString;
    SDS_Busca.Close;
    SDS_Busca.CommandText:=MySql;
    SDS_Busca.Open;
    FrmBelShop.EdtConEmpresasUsuAltera.Text:=SDS_Busca.FieldByName('Des_Login').AsString;
    SDS_Busca.Close;
  End;

end;

procedure TDMBelShop.DataModuleCreate(Sender: TObject);
Var
  i: Integer;
  Arq: TextFile;
  sArquivo: TStringList;
  sLinha: String;
  sNewIP: String;
  MySql: String;
  b, bTestaConexao: Boolean;
begin
// odir - Apresenta Erro ao sair do Programa
   // Windows: Nome do Usuario e do Computador =================================
  UsuarioComputadorWindows(sgNomeUsuario, sgNomeComputador);

  // Pasta Executavel ==========================================================
  sPath_Local:=IncludeTrailingPathDelimiter(ExtractFilePAth(Application.ExeName));

  // Adiciona PBelShop no FireWall =============================================
  Try
    addApplicationToFirewall('Gerenciador BelShop', IncludeTrailingPathDelimiter(sPath_Local)+'PBelShop.exe');
  Except
  End;

  // Nome do Servidor, Tipo de Conexão e Codigo da Loja Se Unica ===============
  sgCodLojaUnica:='';
  BuscaServidorLojaUnica;

  // Conexão com Banco de Dados BelShop.FDB ====================================
  sgPCTConect_IB:='PCTConect_IB.ini';
  If sgCodLojaUnica<>'' Then
  Begin
    sgPCTConect_IB:='PCTConect_IB_Loja.ini';
  End; // If sgCodLojaUnica<>'' Then

  // Verifica Existencia do Arquivo de Configuração de Conexão =================
  If not(fileexists(IncludeTrailingPathDelimiter(sPath_Local)+sgPCTConect_IB)) then
  Begin
    msg('Arquivo '+sgPCTConect_IB+' Não Encontrado !!','A');
    Application.Terminate;
    Exit;
  End;

  // Verifica Tipo de Conexão para Loja Unica ==================================
  If sgCodLojaUnica<>'' Then
  Begin
    // Substitui Arquivo
    DeleteFile(IncludeTrailingPathDelimiter(sPath_Local)+'PCTConect_IB_Loja.ini');
    CopyFile(PChar(IncludeTrailingPathDelimiter(sPath_Local)+'PCTConect_IB_Loja_Original.ini'),
             PChar(IncludeTrailingPathDelimiter(sPath_Local)+'PCTConect_IB_Loja.ini'),False);

    sArquivo:= TStringList.Create;

    Try
      sArquivo.LoadFromFile(IncludeTrailingPathDelimiter(sPath_Local)+sgPCTConect_IB);

      For i := 0 to sArquivo.Count - 1 do
      Begin
        // Linha 4 = TCP/IP
        // Linha 5 = NetBEUI

        If ((Trim(sgTpConexao)='NetBEUI') or ((Trim(sgTpConexao)=''))) and
           (i=4) And (Trim(sArquivo[i])='Database=LOCALHOST:C:\Projetos\BelShop\Dados\BELSHOP_LOJA.FDB') Then
        Begin
          sArquivo.Delete(i);
          Break;
        End;

        If (Trim(sgTpConexao)='TCP/IP') and
           (i=5) And (Trim(sArquivo[i])='Database=\\LocalHost\c:\Projetos\BelShop\Dados\BELSHOP_LOJA.FDB') Then
        Begin
          sArquivo.Delete(i);
          Break;
        End;
      End; // For i := 0 to sArquivo.Count - 1 do

      sArquivo.SaveToFile(IncludeTrailingPathDelimiter(sPath_Local)+sgPCTConect_IB);
    Finally // Try
      FreeAndNil(sArquivo);
    End; // Try

    sArquivo.Free;
  End; // If sgCodLojaUnica<>'' Then

  // Verifica a Existencia do Arquivo "ConexaoExterna.ini" =====================
  sNewIP:='';
  bgConexaoLocal:=True;
  If fileexists(sPath_Local+'ConexaoExterna.ini') then
  Begin
    bgConexaoLocal:=False;

    // Busca Novo IP do Banco de Dados BelShop.FDB ------------------
    AssignFile(Arq,sPath_Local+'ConexaoExterna.ini');

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
        sArquivo.LoadFromFile(sPath_Local+sgPCTConect_IB);

        For i:=0 to sArquivo.Count - 1 do
        Begin
          If AnsiUpperCase(Copy(sArquivo[i],1,8))='DATABASE' Then
          Begin
            sArquivo[i]:='Database=\\'+sNewIP+'\C:\Projetos\BelShop\Dados\BELSHOP.FDB';
            Break;
          End; // If Copy(s,1,2)=Edit1.Text Then
        End; // For i:=0 to sArquivo.Count - 1 do

       sArquivo.SaveToFile(sPath_Local+sgPCTConect_IB);
      Finally // Try
        { Libera a instancia da lista da memória }
        FreeAndNil(sArquivo);
      End; // Try

      sArquivo.Free;
    End; // If sNewIP<>'' Then
  End; // If fileexists(sPath_Local+'ConexaoExterna.ini') then

  // Conecta Banco BelShop.FDB =================================================
  SQLC.Connected:=False;
  IBDB_BelShop.Connected:=False;
  DMConexoes.IBDB_BelShop.Connected:=False;

  ConectaBanco;

  MontaConexaoEmpresas;
end;

procedure TDMBelShop.CDS_AComprarOCsAfterScroll(DataSet: TDataSet);
begin
  FrmBelShop.Bt_GeraOCImpEditOC.Visible:=False;
  If Not CDS_AComprarOCs.IsEmpty Then
  Begin
    If Trim(CDS_AComprarOCsIND_OC_GERADA.AsString)='S' Then
     Begin
       If CDS_AComprarOCsTIPO.AsString='OC' Then
       Begin
         FrmBelShop.Lab_ItensOC.Caption:='Itens OCs';
         FrmBelShop.Lab_Qtds_OC.Caption:='Qtds OCs';

         FrmBelShop.Bt_GeraOCImpEditOC.Visible:=True;
         FrmBelShop.Bt_GeraOCImpEditOC.Glyph:=FrmBelShop.Bt_GeraOCGraficoImprime.Glyph;
         FrmBelShop.Bt_GeraOCImpEditOC.Caption:='Imprimir OC';
       End; // If CDS_AComprarOCsTIPO.AsString='OC' Then

       If CDS_AComprarOCsTIPO.AsString='TR' Then
       Begin
         FrmBelShop.Lab_ItensOC.Caption:='Itens TRs';
         FrmBelShop.Lab_Qtds_OC.Caption:='Qtds TRs';
       End; // If CDS_AComprarOCsTIPO.AsString='TR' Then

     End
    Else // If Trim(CDS_AComprarOCsIND_OC_GERADA.AsString)='S' Then
     Begin
       If CDS_AComprarOCsTIPO.AsString='OC' Then
       Begin
         FrmBelShop.Lab_ItensOC.Caption:='Itens OCs';
         FrmBelShop.Lab_Qtds_OC.Caption:='Qtds OCs';

         FrmBelShop.Bt_GeraOCImpEditOC.Visible:=True;
         FrmBelShop.Bt_GeraOCImpEditOC.Glyph:=FrmBelShop.Bt_GeraOCGraficoEdit.Glyph;
         FrmBelShop.Bt_GeraOCImpEditOC.Caption:='Editar OC';
       End;

       If CDS_AComprarOCsTIPO.AsString='TR' Then
       Begin
         FrmBelShop.Lab_ItensOC.Caption:='Itens TRs';
         FrmBelShop.Lab_Qtds_OC.Caption:='Qtds TRs';
       End; // If CDS_AComprarOCsTIPO.AsString='TR' Then

     End; // If Trim(CDS_AComprarOCsIND_OC_GERADA.AsString)='S' Then
  End;
end;

procedure TDMBelShop.IBQ_AComprarAfterPost(DataSet: TDataSet);
Var
  sCodItem, sCodLoja, sDoc: String;
  sCodItemDel, sCodLojaDel: String;
  iSeq: Integer;
begin
  If sgSeqDeletar<>'' Then
  Begin
    IBQ_AComprar.ApplyUpdates;
    IBT_BelShop.CommitRetaining;
    IBT_BelShop.Commit;

    IBQ_AComprar.Close;
    IBQ_AComprar.Open;

    If IBQ_AComprar.Locate('NUM_SEQ', sgSeqDeletar,[]) Then
    Begin
      sCodItemDel:=IBQ_AComprarCOD_ITEM.AsString;
      sCodLojaDel:=IBQ_AComprarCOD_EMPRESA.AsString;
      IBQ_AComprar.Delete;
    End;

    sgSeqDeletar:='';
  End;

  iSeq:=IBQ_AComprarNUM_SEQ.AsInteger;
  sDoc:=IBQ_AComprarNUM_DOCUMENTO.AsString;
  sCodItem:=CDS_AComprarItensCOD_ITEM.AsString;
  sCodLoja:=IBQ_AComprarCOD_EMPRESA.AsString;

  // Retirado Não Atualuza Qtd_Acomprar do CD (99) Com as Transferencias
  // AcertaCompraCD(sDoc, True, True);

  IBQ_AComprar.ApplyUpdates;
  IBT_BelShop.CommitRetaining;
  IBT_BelShop.Commit;

  // Calucla os Totais do Documento
  If Not Doc_CalculaValores(sDoc, sCodItem, sCodLoja) Then
   msg('Erro no Totalizador !!'+cr+cr+'Entrar em Contato com o Odir !!','A');

  CDS_AComprarItens.Open;
  CDS_AComprarItens.Locate('COD_ITEM', sCodItem,[]);
  IBQ_AComprar.Open;
  CDS_AComprarOCs.Open;

  If Trim(sCodItemDel)<>'' Then
   Begin
    if not IBQ_AComprar.Locate('COD_ITEM;COD_EMPRESA',VarArrayOf([sCodItemDel,sCodLojaDel]),[]) Then
     IBQ_AComprar.Locate('Num_Seq', iSeq,[]);
   End
  Else
   Begin
     IBQ_AComprar.Locate('Num_Seq', iSeq,[]);
   End; // If Trim(sCodItemDel)<>'' Then

  If sgCodLojaUnica='' Then
   FrmBelShop.AlteraAComprar(IBQ_AComprar, 'Q', VarToStr(FrmBelShop.EdtGeraOCBuscaDocto.Value))
  Else
   FrmBelShop.AlteraAComprar(IBQ_AComprar, 'Q', VarToStr(FrmGeraPedidosComprasLojas.EdtGeraOCBuscaDocto.Value));

end;

procedure TDMBelShop.IBQ_AComprarBeforePost(DataSet: TDataSet);
Var
  cQtdComp, cPerApurCxEmb: Currency;
  s, sNumSeq, MySql: String;
begin
  // Retirado Não Atualuza Qtd_Acomprar do CD (99) Com as Transferencias
  // AcertaCompraCD(IBQ_AComprarNUM_DOCUMENTO.AsString, False, True);

  If IBQ_AComprarIND_OC_GERADA.AsString='S' Then
   Begin
     IBQ_AComprarQTD_ACOMPRAR.AsCurrency:=IBQ_AComprarQTD_ACOMPRAR.OldValue;
     IBQ_AComprarQTD_TRANSF.AsCurrency  :=IBQ_AComprarQTD_TRANSF.OldValue;
   End
  Else // If IBQ_AComprarIND_OC_GERADA.AsString='S' Then
   Begin
     // Caixa de Embarque =====================================================
     If (bgLojaCXEmbarque) And (IBQ_AComprarQTD_ACOMPRAR.AsCurrency>0) And (IBQ_AComprarUNI_COMPRA.AsCurrency>0) Then
     Begin
       cPerApurCxEmb:=RoundTo((IBQ_AComprarQTD_ACOMPRAR.AsCurrency/IBQ_AComprarUNI_COMPRA.AsCurrency),-2);

       igTotInteiro:=ParteInteiro(VarToStr(cPerApurCxEmb));
       cPerApurCxEmb:=cPerApurCxEmb-igTotInteiro;

       If ((cPerApurCxEmb*100)>=cgPerCxEmpbarque) Then
        igTotInteiro:=igTotInteiro+1;

       IBQ_AComprarQTD_ACOMPRAR.AsCurrency:=igTotInteiro*IBQ_AComprarUNI_COMPRA.AsCurrency;
     End; // If Ckb_GeraOCCalculoCxEmbarque.Checked Then

     IBQ_AComprarOBS_OC.AsString:=QuotedStr('Calculado em: '+DateTimeToStr(
                              DataHoraServidorFI(SDS_DtaHoraServidor))+' por '+Des_Usuario);
     IBQ_AComprar.FieldByName('BLOB_TEXTO').AsString:=
                        IBQ_AComprar.FieldByName('BLOB_TEXTO').AsString+#13#10+
                        'Aberturta do Aplicativo: '+sgDataHoraAplicativo+
                        ' - Alterado em: '+DateTimeToStr(
                        DataHoraServidorFI(SDS_DtaHoraServidor))+
                        ' por '+Des_Usuario+
                        ' - Qtd Anterior: '+VarToStr(IBQ_AComprarQTD_ACOMPRAR.OldValue)+
                        ' - Qtd Atual: '+VarToStr(IBQ_AComprarQTD_ACOMPRAR.NewValue);

     //=========================================================================
     // Insere Quantidade de Transferencia =====================================
     //=========================================================================

     If (IBQ_AComprarQTD_TRANSF.AsCurrency<>0) and (IBQ_AComprarCOD_EMPRESA.AsString='99') Then
     Begin
       IBQ_AComprarQTD_TRANSF.AsCurrency:=0;
       Exit;
     End;

     If (IBQ_AComprarQTD_TRANSF.AsCurrency<>0) and (IBQ_AComprarQTD_TRANSF.OldValue=0) Then
     Begin
       sgNumSeq:=IBQ_AComprarNUM_SEQ.AsString;

       // Verifica se Ja Existe Transferencia do Produto na Loja ===============
       MySql:=' SELECT o.Num_Seq, Coalesce(o.qtd_acomprar,0) qtd_acomprar'+
              ' FROM   OC_COMPRAR o'+
              ' WHERE  o.num_documento='+IBQ_AComprarNUM_DOCUMENTO.AsString+
              ' AND    o.cod_item='+QuotedStr(IBQ_AComprarCOD_ITEM.AsString)+
              ' AND    o.cod_empresa='+QuotedStr(IBQ_AComprarCOD_EMPRESA.AsString)+
              ' AND    o.num_seq<>'+QuotedStr(IBQ_AComprarNUM_SEQ.AsString)+
              ' AND    o.qtd_transf<>0'+
              ' AND    o.ind_oc_gerada='+QuotedStr('N')+
              ' Order by o.Num_Seq Desc';
       CDS_BuscaRapida.Close;
       SDS_BuscaRapida.CommandText:=MySql;
       CDS_BuscaRapida.Open;
       sNumSeq:=CDS_BuscaRapida.FieldByName('Num_Seq').AsString;
       s:=CDS_BuscaRapida.FieldByName('qtd_acomprar').AsString;
       CDS_BuscaRapida.Close;

       If Trim(sNumSeq)<>'' Then
        Begin
         msg('Movto de Transferência já Existe !!'+cr+cr+'Favor Utilizá-lo !!','A');

         IBQ_AComprarQTD_TRANSF.AsCurrency:=0;
        End
       Else // If Trim(s)<>'' Then
        Begin
          DML_ProdutoDocto('I', IBQ_AComprarNUM_DOCUMENTO.AsString, sgNumSeq);

          IBQ_AComprarQTD_ACOMPRAR.AsCurrency:=IBQ_AComprarQTD_TRANSF.AsCurrency;
        End;
     End; // If (IBQ_AComprarQTD_TRANSF.AsCurrency<>0) and (IBQ_AComprarQTD_TRANSF.OldValue=0) Then

     //=========================================================================
     // Altera Quantidade de Transferencia =====================================
     //=========================================================================
     If (IBQ_AComprarQTD_TRANSF.AsCurrency=0) and (IBQ_AComprarQTD_TRANSF.OldValue<>0) Then
     Begin
       sgNumSeq:=IBQ_AComprarNUM_SEQ.AsString;

       DML_ProdutoDocto('A', IBQ_AComprarNUM_DOCUMENTO.AsString, sgNumSeq);
     End; // If (IBQ_AComprarQTD_TRANSF.AsCurrency=0) and (IBQ_AComprarQTD_TRANSF.OldValue<>0) Then

     //=========================================================================
     // Altera Quantidade de Transferencia já Existente ========================
     //=========================================================================
     If (IBQ_AComprarQTD_TRANSF.AsCurrency<>0) and (IBQ_AComprarQTD_TRANSF.OldValue<>0) Then
     Begin
       // Verifica se Ja Existe Transferencia do Produto na Loja ===============
       MySql:=' SELECT o.Num_Seq, Coalesce(o.qtd_acomprar,0) qtd_acomprar'+
              ' FROM   OC_COMPRAR o'+
              ' WHERE  o.num_documento='+IBQ_AComprarNUM_DOCUMENTO.AsString+
              ' AND    o.cod_item='+QuotedStr(IBQ_AComprarCOD_ITEM.AsString)+
              ' AND    o.cod_empresa='+QuotedStr(IBQ_AComprarCOD_EMPRESA.AsString)+
              ' AND    o.num_seq<>'+QuotedStr(IBQ_AComprarNUM_SEQ.AsString)+
              ' AND    o.qtd_transf=0'+
              ' Order by o.Num_Seq Desc';
       CDS_BuscaRapida.Close;
       SDS_BuscaRapida.CommandText:=MySql;
       CDS_BuscaRapida.Open;
       sNumSeq:=CDS_BuscaRapida.FieldByName('Num_Seq').AsString;
       cQtdComp:=CDS_BuscaRapida.FieldByName('qtd_acomprar').AsCurrency;
       CDS_BuscaRapida.Close;

       cQtdComp:=(cQtdComp+IBQ_AComprarQTD_ACOMPRAR.OldValue)-IBQ_AComprarQTD_TRANSF.AsCurrency;
       If cQtdComp<0 Then
        cQtdComp:=0;

       MySql:=' UPDATE oc_comprar c'+
              ' SET    c.qtd_acomprar='+F_Troca(',','.',CurrToStr(cQtdComp))+
              ' WHERE  c.num_documento='+IBQ_AComprarNUM_DOCUMENTO.AsString+
              ' AND    c.num_seq='+sNumSeq;
       SQLC.Execute(MySql,nil, nil);

       IBQ_AComprarQTD_ACOMPRAR.AsCurrency:=IBQ_AComprarQTD_TRANSF.AsCurrency;
     End; // If (IBQ_AComprarQTD_TRANSF.AsCurrency<>0) and (IBQ_AComprarQTD_TRANSF.OldValue<>0) Then
   End; // If IBQ_AComprarIND_OC_GERADA.AsString='S' Then
end;

procedure TDMBelShop.CDS_AComprarItensBeforeScroll(DataSet: TDataSet);
begin
  If Not IBQ_AComprar.IsEmpty Then
   sDMFilial:=IBQ_AComprarCOD_EMPRESA.AsString;

end;

procedure TDMBelShop.CDS_AComprarItensAfterScroll(DataSet: TDataSet);
begin
  If (Not IBQ_AComprar.IsEmpty) and (sDMFilial<>'') Then
  Begin
    IBQ_AComprar.Locate('COD_EMPRESA', sDMFilial,[]);

    If FrmBelShop.PC_GeraOCApresentacao.ActivePage=FrmBelShop.Ts_GeraOCGrid Then
    Begin
      FrmBelShop.Dbg_GeraOCGrid.SelectedIndex:=0;
      FrmBelShop.Dbg_GeraOCGrid.SelectedIndex:=3;
    End;
  End;

end;

procedure TDMBelShop.IBQ_AComprarEditaAfterPost(DataSet: TDataSet);
Var
  sTotal_Valor, sTotal_Itens, sTotal_Qtd: String;
  s, sCodForn, sCodItem, sCodLoja, sDoc: String;
  iSeq: Integer;
begin
  iSeq:=IBQ_AComprarEdita.RecNo;

  sDoc:=IBQ_AComprarEditaNUM_DOCUMENTO.AsString;
  sCodItem:=IBQ_AComprarEditaCOD_ITEM.AsString;
  sCodLoja:=IBQ_AComprarEditaCOD_EMPRESA.AsString;
  sCodForn:=IBQ_AComprarEditaCOD_FORNECEDOR.AsString;

  IBQ_AComprarEdita.ApplyUpdates;
  IBT_BelShop.CommitRetaining;

  // Busca Totais do Pedido ===================================================
  If FrmBelShop.Rb_GeraOCEditaComQtd.Checked Then s:='C';
  If FrmBelShop.Rb_GeraOCEditaSemQtd.Checked Then s:='S';
  If FrmBelShop.Rb_GeraOCEditaTodosItens.Checked Then s:='T';

  FrmBelShop.TotaisPedOC(sTotal_Valor, sTotal_Itens, sTotal_Qtd, sDoc, sCodLoja, s, '', sCodForn);


  If sgCodLojaUnica='' Then
   FrmBelShop.AlteraAComprar(IBQ_AComprarEdita, 'Q', VarToStr(FrmBelShop.EdtGeraOCBuscaDocto.Value))
  Else
   FrmBelShop.AlteraAComprar(IBQ_AComprarEdita, 'Q', VarToStr(FrmGeraPedidosComprasLojas.EdtGeraOCBuscaDocto.Value));

  FrmBelShop.EdtGeraOCEditaTotalGeral.Value  :=StrToCurr(sTotal_Valor);
  FrmBelShop.EdtGeraOCEditaTotalItens.Value  :=StrToCurr(sTotal_Itens);
  FrmBelShop.EdtGeraOCEditaTotallQtd.Value   :=StrToCurr(sTotal_Qtd);

//  If Not IBQ_AComprarEdita.Locate('NUM_SEQ',iSeq,[]) Then
//   If Not IBQ_AComprarEdita.Locate('NUM_SEQ',iSeq+1,[]) Then
//    IBQ_AComprarEdita.Locate('NUM_SEQ',iSeq-1,[]);

  IBQ_AComprarEdita.RecNo:=iSeq-1;

  FrmBelShop.Dbg_GeraOCEditaGrid.SelectedIndex:=2;
  FrmBelShop.Dbg_GeraOCEditaGrid.SetFocus;

end;

procedure TDMBelShop.IBQ_AComprarEditaBeforePost(DataSet: TDataSet);
Var
  cPerApurCxEmb: Currency;
begin

  If IBQ_AComprarEditaIND_OC_GERADA.AsString='S' Then
   Begin
     IBQ_AComprarEditaQTD_ACOMPRAR.AsCurrency:=IBQ_AComprarEditaQTD_ACOMPRAR.OldValue;
     IBQ_AComprarEditaQTD_ACOMPRAR.AsCurrency:=IBQ_AComprarEditaQTD_ACOMPRAR.OldValue;
   End
  Else
   Begin
      // Caixa de Embarque =====================================================
      If (bgLojaCXEmbarque) And (IBQ_AComprarEditaQTD_ACOMPRAR.AsCurrency>0) And (IBQ_AComprarEditaUNI_COMPRA.AsCurrency>0) Then
      Begin
        cPerApurCxEmb:=RoundTo((IBQ_AComprarEditaQTD_ACOMPRAR.AsCurrency/IBQ_AComprarEditaUNI_COMPRA.AsCurrency),-2);

        igTotInteiro:=ParteInteiro(VarToStr(cPerApurCxEmb));
        cPerApurCxEmb:=cPerApurCxEmb-igTotInteiro;

        If ((cPerApurCxEmb*100)>=cgPerCxEmpbarque) Then
         igTotInteiro:=igTotInteiro+1;

        IBQ_AComprarEditaQTD_ACOMPRAR.AsCurrency:=igTotInteiro*IBQ_AComprarEditaUNI_COMPRA.AsCurrency;
      End; // If Ckb_GeraOCCalculoCxEmbarque.Checked Then

     IBQ_AComprarEditaOBS_OC.AsString:=QuotedStr('Calculado em: '+DateTimeToStr(
                              DataHoraServidorFI(SDS_DtaHoraServidor))+' por '+Des_Usuario);
     IBQ_AComprarEdita.FieldByName('BLOB_TEXTO').AsString:=
                    IBQ_AComprarEdita.FieldByName('BLOB_TEXTO').AsString+#13#10+
                    'Aberturta do Aplicativo: '+sgDataHoraAplicativo+
                    ' - Alterado em: '+DateTimeToStr(
                    DataHoraServidorFI(SDS_DtaHoraServidor))+
                    ' por '+Des_Usuario+
                    ' - Qtd Anterior: '+VarToStr(IBQ_AComprarEditaQTD_ACOMPRAR.OldValue)+
                    ' - Qtd Atual: '+VarToStr(IBQ_AComprarEditaQTD_ACOMPRAR.NewValue);
   End;
//  IBQ_AComprarEditaVLR_TOT_COMPRA.AsCurrency:=IBQ_AComprarEditaQTD_ACOMPRAR.AsCurrency*IBQ_AComprarEditaVLR_UNI_COMPRA.AsCurrency;
//  IBQ_AComprarEditaVLR_TOT_ULT_VENDA.AsCurrency:=IBQ_AComprarEditaQTD_ACOMPRAR.AsCurrency*IBQ_AComprarEditaVLR_UNI_VENDA.AsCurrency;

end;

procedure TDMBelShop.IBQ_AComprarEditaAfterScroll(DataSet: TDataSet);
begin
  FrmBelShop.Dbg_GeraOCEditaGrid.SelectedIndex:=2;
end;

procedure TDMBelShop.IBQ_AComprarAfterScroll(DataSet: TDataSet);
begin

  If Trim(sgCodLojaUnica)<>'' Then // Loja Unica
  Begin
    // Apresenta Fornecedor -----------------------------------------
    If Not IBQ_AComprar.IsEmpty Then
     FrmGeraPedidosComprasLojas.Sb_SelectEmpProc2.Panels[0].Text:=
                   'Forn: '+IBQ_AComprarCOD_FORNECEDOR.AsString+' - '+
                   IBQ_AComprarDES_FORNECEDOR.AsString;

    If FrmGeraPedidosComprasLojas.PC_GeraOCApresentacao.ActivePage=FrmGeraPedidosComprasLojas.Ts_GeraOCGrid Then
     FrmGeraPedidosComprasLojas.Dbg_GeraOCGrid.SelectedIndex:=4;

  End; // If Trim(sgCodLojaUnica)<>'' Then

end;

procedure TDMBelShop.CDS_Gr_FinanceiroAfterScroll(DataSet: TDataSet);
begin
  If (Not CDS_Gr_Financeiro.IsEmpty) and (CDS_Gr_Financeiro.Active) Then
  Begin
    FrmBelShop.Ckb_FinanGrFinanAtivo.Checked:=CDS_Gr_FinanceiroIND_ATIVO.AsString='SIM';
    AcertaCkb_SN(FrmBelShop.Ckb_FinanGrFinanAtivo);

    If Trim(CDS_Gr_FinanceiroCOD_GR_FINAN.AsString)<>'' Then
    Begin
      CDS_VisualObjetos.Close;
      SDS_VisualObjetos.Params.ParamByName('Tabela').AsString:='FIN_GR_FINANCEIRO';
      SDS_VisualObjetos.Params.ParamByName('CodTabela').AsString:=
                                           CDS_Gr_FinanceiroCOD_GR_FINAN.AsString;
      CDS_VisualObjetos.Open;
    End; // If Trim(CDS_Gr_FinanceiroCOD_GR_FINAN.AsString)<>'' Then
  End; // If (Not CDS_Gr_Financeiro.IsEmpty) and (CDS_Gr_Financeiro.Active) Then

end;

procedure TDMBelShop.CDS_ObjetivosAfterScroll(DataSet: TDataSet);
begin
  If (Not CDS_Objetivos.IsEmpty) and (CDS_Objetivos.Active) Then
  Begin
    // Tipo de Operação ========================================================
    FrmBelShop.Rb_FinanObjetivosManutTpOperacaoLoja.Checked:=False;
    If CDS_ObjetivosIND_OPERACAO.AsInteger=1 Then
     FrmBelShop.Rb_FinanObjetivosManutTpOperacaoLoja.Checked:=True;

    FrmBelShop.Rb_FinanObjetivosManutTpOperacaoSalao.Checked:=False;
    If CDS_ObjetivosIND_OPERACAO.AsInteger=2 Then
     FrmBelShop.Rb_FinanObjetivosManutTpOperacaoSalao.Checked:=True;

    FrmBelShop.Rb_FinanObjetivosManutTpOperacaoAmbos.Checked:=False;
    If CDS_ObjetivosIND_OPERACAO.AsInteger=3 Then
     FrmBelShop.Rb_FinanObjetivosManutTpOperacaoAmbos.Checked:=True;

    AcertaRb_Style(FrmBelShop.Rb_FinanObjetivosManutTpOperacaoLoja);
    AcertaRb_Style(FrmBelShop.Rb_FinanObjetivosManutTpOperacaoSalao);
    AcertaRb_Style(FrmBelShop.Rb_FinanObjetivosManutTpOperacaoAmbos);

    // Fixo / Ativo / Auditoria ================================================
    FrmBelShop.Ckb_FinanObjetivosManutVlrFixo.Checked:=CDS_ObjetivosIND_FIXO.AsString='SIM';
    FrmBelShop.Ckb_FinanObjetivosManutNaoCompra.Checked:=CDS_ObjetivosIND_NAOCOMPRA.AsString='SIM';
    FrmBelShop.Ckb_FinanObjetivosManutAtivo.Checked:=CDS_ObjetivosIND_ATIVO.AsString='SIM';
    FrmBelShop.Ckb_FinanObjetivosManutUlt12Meses.Checked:=CDS_ObjetivosULT_12_MESES.AsString='SIM';

    FrmBelShop.Ckb_FinanObjetivosManutAuditoria.Checked:=CDS_ObjetivosDES_FORMULA.AsString='AUDITORIA/EST. FINAN. AUDITORIA';

    FrmBelShop.Ckb_FinanObjetivosManutAvarias.Checked:=CDS_ObjetivosDES_FORMULA.AsString='AVARIAS E VENCIDOS/VENDAS MÊS';

    FrmBelShop.Gb_FinanObjetivosManutUlt12Meses.Visible:=True;
    If FrmBelShop.Ckb_FinanObjetivosManutAuditoria.Checked Then
     FrmBelShop.Gb_FinanObjetivosManutUlt12Meses.Visible:=False;

    // Acerta JvXPCheckbox =====================================================
    AcertaCkb_SN(FrmBelShop.Ckb_FinanObjetivosManutVlrFixo);
    AcertaCkb_SN(FrmBelShop.Ckb_FinanObjetivosManutAtivo);
    AcertaCkb_SN(FrmBelShop.Ckb_FinanObjetivosManutUlt12Meses);

    AcertaCkb_Style(FrmBelShop.Ckb_FinanObjetivosManutAuditoria);
    AcertaCkb_Style(FrmBelShop.Ckb_FinanObjetivosManutAvarias);
    AcertaCkb_Style(FrmBelShop.Ckb_FinanObjetivosManutNaoCompra);

    // Verifica Existencia de Objetivos ========================================
    If CDS_ObjetivosEmpresas.Active Then
     CDS_ObjetivosEmpresasAfterScroll(CDS_ObjetivosEmpresas);

  End; // If (Not CDS_Objetivos.IsEmpty) and (CDS_Objetivos.Active) Then

end;

procedure TDMBelShop.CDS_ObjetivosEmpresasAfterScroll(DataSet: TDataSet);
Var
  MySql: String;
  i: Integer;
begin
  CDS_ObjetivosMetas.Close;
  If (FrmBelShop.EdtFinanObjetivosAno.Value<>0) And
     (Trim(CDS_ObjetivosCOD_OBJETIVO.AsString)<>'') And
     (Trim(FrmBelShop.Dbe_FinanObjetivosManutDesObjetivo.Text)<>'') And
     (Trim(FrmBelShop.Dbe_FinanObjetivosManutFormula.Text)<>'') And
     (Trim(FrmBelShop.Dbe_FinanObjetivosManutOrdem.Text)<>'')
     //And ((CDS_ObjetivosMetas.State<>dsEdit) and (CDS_ObjetivosMetas.State<>dsInsert))
     Then
  Begin
    i:=CDS_ObjetivosEmpresas.RecNo;

    // Busca Objetivos Metas ===================================================
    MySql:=' Select *'+
           ' From fin_objetivos_metas e'+
           ' Where e.cod_filial='+QuotedStr(CDS_ObjetivosEmpresas.FieldByName('Cod_Filial').AsString)+
           ' And e.cod_objetivo='+CDS_ObjetivosCOD_OBJETIVO.AsString+
           ' And e.des_ano='+QuotedStr(VarToStr(FrmBelShop.EdtFinanObjetivosAno.Value));
    CDS_ObjetivosMetas.Close;
    SDS_ObjetivosMetas.CommandText:=MySql;
    CDS_ObjetivosMetas.Open;

    CDS_ObjetivosEmpresas.RecNo:=i;

    // Libera Botões ===========================================================
    If FrmBelShop.Bt_FinanObjetivosManutSalvar.Enabled Then
    Begin
      If Trim(CDS_ObjetivosMetasCOD_FILIAL.AsString)='' Then
       FrmBelShop.Bt_FinanObjetivosManutObjetivos.Caption:='Incluir'
      Else
       FrmBelShop.Bt_FinanObjetivosManutObjetivos.Caption:='Alterar';

      FrmBelShop.Bt_FinanObjetivosManutObjetivos.Enabled:=True;
    End; // If FrmBelShop.Bt_FinanObjetivosManutSalvar.Enabled Then

  End; // If FrmBelShop.EdtFinanObjetivosAno.Value<>0 Then

end;

// OdirApagar - 23/05/2016 - Excluir Componente Timer1 - OdirDuvida
procedure TDMBelShop.IBQ_AComprarAfterOpen(DataSet: TDataSet);
begin
  sgIndOCGerada:='';
  sgTipo :='';
  igQtd_Tipo:=0;

end;

procedure TDMBelShop.CDS_FluxoFornecedoresAfterScroll(DataSet: TDataSet);
begin
  If (DMBelShop.CDS_FluxoFornecedores.RecNo<4) and (DMBelShop.CDS_FluxoFornecedores.RecNo>1) Then
  Begin
    DMBelShop.CDS_FluxoFornecedores.RecNo:=4;
  End;

end;

procedure TDMBelShop.CDS_FluxoFornReducaoAfterScroll(DataSet: TDataSet);
begin
  CDS_FluxoPercReducao.Close;
  If Not CDS_FluxoFornReducao.IsEmpty Then
  Begin
    SDS_FluxoPercReducao.Params.ParamByName('CodForn').AsString:=
                                    CDS_FluxoFornReducaoCOD_FORNECEDOR.AsString;
    CDS_FluxoPercReducao.Open;
  End; // If Not CDS_FluxoFornReducao.IsEmpty Then

end;

end.

