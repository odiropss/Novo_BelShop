unit UDMOCLinx;

{
  FrmOCLinx.Dbg_GeraOCGrid.SelectedIndex:=0;
  FrmOCLinx.Dbg_GeraOCGrid.SelectedIndex:=3;
}
interface

uses
  SysUtils, Classes, Variants, FMTBcd, IBCustomDataSet, IBUpdateSQL, DB, IBQuery,
  IBDatabase, Provider, DBClient, SqlExpr, Math, DBXpress;

type
  TDMOCLinx = class(TDataModule)
    DSP_AComprarOCs: TDataSetProvider;
    CDS_AComprarOCs: TClientDataSet;
    CDS_AComprarOCsGERAR: TStringField;
    CDS_AComprarOCsTIPO: TStringField;
    CDS_AComprarOCsCOD_EMP_FIL: TStringField;
    CDS_AComprarOCsCOD_LINX: TIntegerField;
    CDS_AComprarOCsDES_EMP_FIL: TStringField;
    CDS_AComprarOCsNUM_DOCUMENTO: TIntegerField;
    CDS_AComprarOCsIND_OC_GERADA: TStringField;
    CDS_AComprarOCsCOD_FORNECEDOR: TStringField;
    CDS_AComprarOCsFORNECEDOR: TStringField;
    CDS_AComprarOCsTOTAL_OCS: TFMTBCDField;
    CDS_AComprarOCsTOTAL_OC: TFMTBCDField;
    CDS_AComprarOCsNUM_OC_GERADA: TIntegerField;
    CDS_AComprarOCsDTA_OC_GERADA: TDateField;
    CDS_AComprarOCsTOTAL_BRUTO: TFMTBCDField;
    CDS_AComprarOCsTOTAL_DESCONTOS: TFMTBCDField;
    CDS_AComprarOCsTOTAL_IPI: TFMTBCDField;
    CDS_AComprarOCsTOTAL_DESPESAS: TFMTBCDField;
    CDS_AComprarOCsTOTAL_FRETE: TFMTBCDField;
    CDS_AComprarOCsTOTAL_ST: TFMTBCDField;
    CDS_AComprarOCsTOTAL_ICMS: TFMTBCDField;
    CDS_AComprarOCsTOTAL_REPASSE: TFMTBCDField;
    CDS_AComprarOCsCOD_COMPROVANTE_ICMS: TStringField;
    CDS_AComprarOCsTOTAL_ITENS: TIntegerField;
    CDS_AComprarOCsTOTAL_QTD: TFMTBCDField;
    CDS_AComprarOCsTOTAL_VENDA: TFMTBCDField;
    CDS_AComprarOCsTOTAL_ITENS_ACOMPRAR: TFMTBCDField;
    CDS_AComprarOCsTOTAL_QTD_TRANSF: TFMTBCDField;
    CDS_AComprarOCsTOTALGERAL: TAggregateField;
    CDS_AComprarOCsTOTALITENS: TAggregateField;
    DS_AComprarOCs: TDataSource;
    DS_AComprar: TDataSource;
    CDS_Sugestao: TClientDataSet;
    DSP_Sugestao: TDataSetProvider;
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
    IBQ_AComprarCOD_REFERENCIA: TIBStringField;
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
    IBQ_AComprarCOD_REFERENCIA_FORN: TIBStringField;
    IBQ_AComprarCOD_FORNECEDOR: TIBStringField;
    IBQ_AComprarDES_FORNECEDOR: TIBStringField;
    IBQ_AComprarTIP_PESSOA: TIBStringField;
    IBQ_AComprarDES_EMAIL: TIBStringField;
    IBQ_AComprarQTD_NR_DIAS: TIntegerField;
    IBQ_AComprarQTD_NR_MESES: TIntegerField;
    IBQ_AComprarQTD_TOT_MESES: TIntegerField;
    IBQ_AComprarCOD_COMPRADOR: TIntegerField;
    IBQ_AComprarBLOB_TEXTO: TMemoField;
    IBQ_AComprarIND_TRANSF: TIBStringField;
    IBQ_AComprarDTA_LIM_TRANSF: TDateField;
    IBQ_AComprarQTD_TRANSF: TIBBCDField;
    IBQ_AComprarIND_USAR: TIBStringField;
    IBQ_AComprarIND_QTD_ACIMA: TIBBCDField;
    IBQ_AComprarQTD_SUGERIDA_ANO: TIBBCDField;
    IBQ_AComprarQTD_TRANSF_PERIODO: TIBBCDField;
    IBQ_AComprarQTD_TRANSF_ANO: TIBBCDField;
    IBQ_AComprarEST_MINIMO: TIBBCDField;
    IBQ_AComprarDIAS_ESTOCAGEM: TIntegerField;
    IBQ_AComprarQTD_DEMANDA_DIA: TIBBCDField;
    IBQ_AComprarQTD_DEMANDA_ANO: TIBBCDField;
    IBQ_AComprarQTD_DIAS_ANO: TIntegerField;
    IBQ_AComprarDATAINCLUSAO: TDateField;
    IBQ_AComprarESTADO: TIBStringField;
    IBQ_AComprarDATAALTERACAO: TDateField;
    IBQ_AComprarIND_TRANSF_CD: TIBStringField;
    IBQ_AComprarDOC_TRANSF_CD: TIntegerField;
    IBU_AComprar: TIBUpdateSQL;
    IBQ_Executa: TIBQuery;
    IBQ_Busca: TIBQuery;
    DS_OrdemCompra: TDataSource;
    IBQ_OrdemCompra: TIBQuery;
    DS_AComprarEdita: TDataSource;
    IBQ_AComprarEdita: TIBQuery;
    IBQ_AComprarEditaNUM_SEQ: TIntegerField;
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
    IBQ_AComprarEditaQTD_TRANSF: TIBBCDField;
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
    IBQ_AComprarEditaDES_CLI_ULT_VENDA: TIBStringField;
    IBQ_AComprarEditaCOD_CLI_ULT_VENDA: TIBStringField;
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
    IBQ_AComprarEditaIND_TRANSF: TIBStringField;
    IBQ_AComprarEditaDTA_LIM_TRANSF: TDateField;
    IBQ_AComprarEditaIND_USAR: TIBStringField;
    IBQ_AComprarEditaIND_QTD_ACIMA: TIBBCDField;
    IBQ_AComprarEditaQTD_SUGERIDA_ANO: TIBBCDField;
    IBQ_AComprarEditaQTD_TRANSF_PERIODO: TIBBCDField;
    IBQ_AComprarEditaQTD_TRANSF_ANO: TIBBCDField;
    IBQ_AComprarEditaEST_MINIMO: TIBBCDField;
    IBQ_AComprarEditaDIAS_ESTOCAGEM: TIntegerField;
    IBQ_AComprarEditaQTD_DEMANDA_DIA: TIBBCDField;
    IBQ_AComprarEditaQTD_DEMANDA_ANO: TIBBCDField;
    IBQ_AComprarEditaQTD_DIAS_ANO: TIntegerField;
    IBQ_AComprarEditaDATAINCLUSAO: TDateField;
    IBQ_AComprarEditaESTADO: TIBStringField;
    IBQ_AComprarEditaDATAALTERACAO: TDateField;
    IBQ_AComprarEditaIND_TRANSF_CD: TIBStringField;
    IBQ_AComprarEditaDOC_TRANSF_CD: TIntegerField;
    IBU_AComprarEdita: TIBUpdateSQL;
    IBQ_OC_ComprarAdd: TIBQuery;
    IBUP_OC_ComprarAdd: TIBUpdateSQL;
    IBQ_BuscaRapida: TIBQuery;
    IBDS_Busca: TIBDataSet;
    SQLQ_AComprarOCs: TSQLQuery;
    SQLQ_Sugestao: TSQLQuery;
    DSP_OCProdLinx: TDataSetProvider;
    CDS_OCProdLinx: TClientDataSet;
    SQLQ_OCProdLinx: TSQLQuery;
    IBQ_OC_ComprarAddNUM_SEQ: TIntegerField;
    IBQ_OC_ComprarAddNUM_DOCUMENTO: TIntegerField;
    IBQ_OC_ComprarAddDTA_DOCUMENTO: TDateTimeField;
    IBQ_OC_ComprarAddIND_OC_GERADA: TIBStringField;
    IBQ_OC_ComprarAddDTA_OC_GERADA: TDateTimeField;
    IBQ_OC_ComprarAddNUM_OC_GERADA: TIntegerField;
    IBQ_OC_ComprarAddOBS_OC: TIBStringField;
    IBQ_OC_ComprarAddCOD_EMPRESA: TIBStringField;
    IBQ_OC_ComprarAddDES_EMPRESA: TIBStringField;
    IBQ_OC_ComprarAddCOD_ITEM: TIBStringField;
    IBQ_OC_ComprarAddDES_ITEM: TIBStringField;
    IBQ_OC_ComprarAddQTD_SUGERIDA: TIBBCDField;
    IBQ_OC_ComprarAddQTD_ACOMPRAR: TIBBCDField;
    IBQ_OC_ComprarAddQTD_SALDO: TIBBCDField;
    IBQ_OC_ComprarAddQTD_TRANSITO: TIBBCDField;
    IBQ_OC_ComprarAddQTD_DISPONIVEL: TIBBCDField;
    IBQ_OC_ComprarAddQTD_MEDIA_MES: TIBBCDField;
    IBQ_OC_ComprarAddQTD_MEDIA_DIA: TIBBCDField;
    IBQ_OC_ComprarAddQTD_DEM_MES1: TIBBCDField;
    IBQ_OC_ComprarAddQTD_DEM_MES2: TIBBCDField;
    IBQ_OC_ComprarAddQTD_DEM_MES3: TIBBCDField;
    IBQ_OC_ComprarAddQTD_DEM_MES4: TIBBCDField;
    IBQ_OC_ComprarAddQTD_DEM_MES5: TIBBCDField;
    IBQ_OC_ComprarAddQTD_DEM_MES6: TIBBCDField;
    IBQ_OC_ComprarAddQTD_DEM_MES7: TIBBCDField;
    IBQ_OC_ComprarAddQTD_DEM_MES8: TIBBCDField;
    IBQ_OC_ComprarAddUNI_COMPRA: TIntegerField;
    IBQ_OC_ComprarAddUNI_VENDA: TIntegerField;
    IBQ_OC_ComprarAddCOD_BARRAS: TIBStringField;
    IBQ_OC_ComprarAddCOD_GRUPO: TIBStringField;
    IBQ_OC_ComprarAddDES_GRUPO: TIBStringField;
    IBQ_OC_ComprarAddCOD_SUBGRUPO: TIBStringField;
    IBQ_OC_ComprarAddDES_SUBGRUPO: TIBStringField;
    IBQ_OC_ComprarAddDES_GENERICO: TIBStringField;
    IBQ_OC_ComprarAddCOD_APLICACAO: TIBStringField;
    IBQ_OC_ComprarAddDES_APLICACAO: TIBStringField;
    IBQ_OC_ComprarAddCOD_REFERENCIA: TIBStringField;
    IBQ_OC_ComprarAddCLA_CURVA_ABC: TIBStringField;
    IBQ_OC_ComprarAddCOD_FAMILIA_PRECO: TIBStringField;
    IBQ_OC_ComprarAddDES_FAMILIA_PRECO: TIBStringField;
    IBQ_OC_ComprarAddDTA_ULT_COMPRA: TDateField;
    IBQ_OC_ComprarAddCOD_FOR_ULT_COMPRA: TIBStringField;
    IBQ_OC_ComprarAddDES_FOR_ULT_COMPRA: TIBStringField;
    IBQ_OC_ComprarAddQTD_ULT_COMPRA: TIBBCDField;
    IBQ_OC_ComprarAddVLR_UNI_ULT_COMPRA: TIBBCDField;
    IBQ_OC_ComprarAddVLR_TOT_ULT_COMPRA: TIBBCDField;
    IBQ_OC_ComprarAddVLR_UNI_COMPRA: TIBBCDField;
    IBQ_OC_ComprarAddPER_DESCONTO: TIBBCDField;
    IBQ_OC_ComprarAddDTA_ULT_VENDA: TDateField;
    IBQ_OC_ComprarAddCOD_CLI_ULT_VENDA: TIBStringField;
    IBQ_OC_ComprarAddDES_CLI_ULT_VENDA: TIBStringField;
    IBQ_OC_ComprarAddQTD_ULT_VENDA: TIBBCDField;
    IBQ_OC_ComprarAddVLR_UNI_ULT_VENDA: TIBBCDField;
    IBQ_OC_ComprarAddVLR_TOT_ULT_VENDA: TIBBCDField;
    IBQ_OC_ComprarAddVLR_UNI_VENDA: TIBBCDField;
    IBQ_OC_ComprarAddCOD_LISTA_VENDA: TIBStringField;
    IBQ_OC_ComprarAddDES_LISTA_VENDA: TIBStringField;
    IBQ_OC_ComprarAddCOD_LISTA_COMPRA: TIBStringField;
    IBQ_OC_ComprarAddDES_LISTA_COMPRA: TIBStringField;
    IBQ_OC_ComprarAddVLR_CUSTO_MEDIO: TIBBCDField;
    IBQ_OC_ComprarAddVLR_TOT_VENDA: TIBBCDField;
    IBQ_OC_ComprarAddVLR_TOT_COMPRA: TIBBCDField;
    IBQ_OC_ComprarAddVLR_BRUTO: TIBBCDField;
    IBQ_OC_ComprarAddVLR_DESCONTOS: TIBBCDField;
    IBQ_OC_ComprarAddVLR_DESPESAS: TIBBCDField;
    IBQ_OC_ComprarAddVLR_FRETE: TIBBCDField;
    IBQ_OC_ComprarAddIND_SOMA_IPI_BASE_ICMS: TIBStringField;
    IBQ_OC_ComprarAddIND_SOMA_FRETE_BASE_ICMS: TIBStringField;
    IBQ_OC_ComprarAddIND_SOMA_DESPESA_BASE_ICMS: TIBStringField;
    IBQ_OC_ComprarAddIND_SOMA_IPI_BASE_ST: TIBStringField;
    IBQ_OC_ComprarAddIND_SOMA_FRETE_BASE_ST: TIBStringField;
    IBQ_OC_ComprarAddIND_SOMA_DESPESA_BASE_ST: TIBStringField;
    IBQ_OC_ComprarAddCOD_SIT_TRIBUTARIA: TIBStringField;
    IBQ_OC_ComprarAddCOD_IPI: TIBStringField;
    IBQ_OC_ComprarAddIND_IPI: TIBStringField;
    IBQ_OC_ComprarAddPER_IPI: TIBBCDField;
    IBQ_OC_ComprarAddVLR_IPI: TIBBCDField;
    IBQ_OC_ComprarAddCOD_ICMS: TIBStringField;
    IBQ_OC_ComprarAddPER_REDUCAO_ICMS: TIBBCDField;
    IBQ_OC_ComprarAddVLR_REDUCAO_ICMS: TIBBCDField;
    IBQ_OC_ComprarAddVLR_BASE_ICMS: TIBBCDField;
    IBQ_OC_ComprarAddPER_ICMS: TIBBCDField;
    IBQ_OC_ComprarAddVLR_ICMS: TIBBCDField;
    IBQ_OC_ComprarAddCOD_GRUPO_ST: TIntegerField;
    IBQ_OC_ComprarAddDES_GRUPO_ST: TIBStringField;
    IBQ_OC_ComprarAddPER_MARGEM_ST: TIBBCDField;
    IBQ_OC_ComprarAddIND_ST: TIBStringField;
    IBQ_OC_ComprarAddVLR_BASE_ST: TIBBCDField;
    IBQ_OC_ComprarAddPER_ST: TIBBCDField;
    IBQ_OC_ComprarAddVLR_ST: TIBBCDField;
    IBQ_OC_ComprarAddPER_REPASSE: TIBBCDField;
    IBQ_OC_ComprarAddVLR_REPASSE: TIBBCDField;
    IBQ_OC_ComprarAddCOD_COMPROVANTE_ICMS: TIBStringField;
    IBQ_OC_ComprarAddCOD_REFERENCIA_FORN: TIBStringField;
    IBQ_OC_ComprarAddCOD_FORNECEDOR: TIBStringField;
    IBQ_OC_ComprarAddDES_FORNECEDOR: TIBStringField;
    IBQ_OC_ComprarAddTIP_PESSOA: TIBStringField;
    IBQ_OC_ComprarAddDES_EMAIL: TIBStringField;
    IBQ_OC_ComprarAddQTD_NR_DIAS: TIntegerField;
    IBQ_OC_ComprarAddQTD_NR_MESES: TIntegerField;
    IBQ_OC_ComprarAddQTD_TOT_MESES: TIntegerField;
    IBQ_OC_ComprarAddCOD_COMPRADOR: TIntegerField;
    IBQ_OC_ComprarAddBLOB_TEXTO: TMemoField;
    IBQ_OC_ComprarAddIND_TRANSF: TIBStringField;
    IBQ_OC_ComprarAddDTA_LIM_TRANSF: TDateField;
    IBQ_OC_ComprarAddQTD_TRANSF: TIBBCDField;
    IBQ_OC_ComprarAddIND_USAR: TIBStringField;
    IBQ_OC_ComprarAddIND_QTD_ACIMA: TIBBCDField;
    IBQ_OC_ComprarAddQTD_SUGERIDA_ANO: TIBBCDField;
    IBQ_OC_ComprarAddQTD_TRANSF_PERIODO: TIBBCDField;
    IBQ_OC_ComprarAddQTD_TRANSF_ANO: TIBBCDField;
    IBQ_OC_ComprarAddEST_MINIMO: TIBBCDField;
    IBQ_OC_ComprarAddDIAS_ESTOCAGEM: TIntegerField;
    IBQ_OC_ComprarAddQTD_DEMANDA_DIA: TIBBCDField;
    IBQ_OC_ComprarAddQTD_DEMANDA_ANO: TIBBCDField;
    IBQ_OC_ComprarAddQTD_DIAS_ANO: TIntegerField;
    IBQ_OC_ComprarAddDATAINCLUSAO: TDateField;
    IBQ_OC_ComprarAddESTADO: TIBStringField;
    IBQ_OC_ComprarAddDATAALTERACAO: TDateField;
    IBQ_OC_ComprarAddIND_TRANSF_CD: TIBStringField;
    IBQ_OC_ComprarAddDOC_TRANSF_CD: TIntegerField;
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
    CDS_SugestaoCOD_REFERENCIA: TStringField;
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
    CDS_SugestaoPER_DESCONTO: TFMTBCDField;
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
    CDS_SugestaoCOD_REFERENCIA_FORN: TStringField;
    CDS_SugestaoCOD_FORNECEDOR: TStringField;
    CDS_SugestaoDES_FORNECEDOR: TStringField;
    CDS_SugestaoTIP_PESSOA: TStringField;
    CDS_SugestaoDES_EMAIL: TStringField;
    CDS_SugestaoQTD_NR_DIAS: TIntegerField;
    CDS_SugestaoQTD_NR_MESES: TIntegerField;
    CDS_SugestaoQTD_TOT_MESES: TIntegerField;
    CDS_SugestaoCOD_COMPRADOR: TIntegerField;
    CDS_SugestaoBLOB_TEXTO: TMemoField;
    CDS_SugestaoIND_TRANSF: TStringField;
    CDS_SugestaoDTA_LIM_TRANSF: TDateField;
    CDS_SugestaoQTD_TRANSF: TFMTBCDField;
    CDS_SugestaoIND_USAR: TStringField;
    CDS_SugestaoIND_QTD_ACIMA: TFMTBCDField;
    CDS_SugestaoQTD_SUGERIDA_ANO: TFMTBCDField;
    CDS_SugestaoQTD_TRANSF_PERIODO: TFMTBCDField;
    CDS_SugestaoQTD_TRANSF_ANO: TFMTBCDField;
    CDS_SugestaoEST_MINIMO: TFMTBCDField;
    CDS_SugestaoDIAS_ESTOCAGEM: TIntegerField;
    CDS_SugestaoQTD_DEMANDA_DIA: TFMTBCDField;
    CDS_SugestaoQTD_DEMANDA_ANO: TFMTBCDField;
    CDS_SugestaoQTD_DIAS_ANO: TIntegerField;
    CDS_SugestaoDATAINCLUSAO: TDateField;
    CDS_SugestaoESTADO: TStringField;
    CDS_SugestaoDATAALTERACAO: TDateField;
    CDS_SugestaoIND_TRANSF_CD: TStringField;
    CDS_SugestaoDOC_TRANSF_CD: TIntegerField;
    DSP_PedUltCompra: TDataSetProvider;
    CDS_PedUltCompra: TClientDataSet;
    SQLQ_PedUltCompra: TSQLQuery;
    CDS_PedUltCompraDTA_ULT_COMPRA: TSQLTimeStampField;
    CDS_PedUltCompraCOD_FOR_ULT_COMPRA: TIntegerField;
    CDS_PedUltCompraDES_FOR_ULT_COMPRA: TStringField;
    CDS_PedUltCompraQTD_ULT_COMPRA: TFMTBCDField;
    CDS_PedUltCompraVLR_UNI_ULT_COMPRA: TFMTBCDField;
    CDS_PedUltCompraVLR_TOT_ULT_COMPRA: TFMTBCDField;
    CDS_PedUltCompraVLR_UNI_COMPRA: TFMTBCDField;
    CDS_PedUltCompraPRECO_UNITARIO: TFMTBCDField;
    CDS_PedUltCompraCOD_IPI: TStringField;
    CDS_PedUltCompraPER_IPI: TFMTBCDField;
    CDS_PedUltCompraCOD_ICMS: TStringField;
    CDS_PedUltCompraPER_ICMS: TFMTBCDField;
    CDS_PedUltCompraPER_ST: TFMTBCDField;
    DSP_ParamCurvaABC: TDataSetProvider;
    CDS_ParamCurvaABC: TClientDataSet;
    SQLQ_ParamCurvaABC: TSQLQuery;
    CDS_ParamCurvaABCIND_CURVA: TIntegerField;
    CDS_ParamCurvaABCCURVA: TStringField;
    CDS_ParamCurvaABCPER_CURVA: TStringField;
    CDS_ParamCurvaABCQTD_DIAS: TFMTBCDField;
    CDS_ParamCurvaABCQTD_MIN: TFMTBCDField;
    CDS_ParamCurvaABCPER_CORTE: TStringField;
    IBQ_OrdemCompraDES_EMPRESA: TIBStringField;
    IBQ_OrdemCompraPEDIDOOC: TIBStringField;
    IBQ_OrdemCompraENDERECO: TIBStringField;
    IBQ_OrdemCompraDES_BAIRRO: TIBStringField;
    IBQ_OrdemCompraDES_CIDADE: TIBStringField;
    IBQ_OrdemCompraCOD_UF: TIBStringField;
    IBQ_OrdemCompraCOD_CEP: TIBStringField;
    IBQ_OrdemCompraNUM_CNPJ: TIBStringField;
    IBQ_OrdemCompraDTA_PEDIDO: TDateField;
    IBQ_OrdemCompraDTA_ENTREGA: TDateField;
    IBQ_OrdemCompraCOD_FORNECEDOR: TIBStringField;
    IBQ_OrdemCompraDES_FORNECEDOR: TIBStringField;
    IBQ_OrdemCompraCOD_ITEM: TIBStringField;
    IBQ_OrdemCompraCOD_BARRAS: TIBStringField;
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
    CDS_AComprarOCsSITUACAO: TStringField;
    IBQ_OrdemCompraSITUACAO: TIBStringField;
    IBQ_OrdemCompraINSCR_ESTADUAL: TIBStringField;
    IBQ_OrdemCompraPER_IPI: TIBBCDField;
    IBQ_OrdemCompraVLR_IPI: TIBBCDField;
    IBQ_OrdemCompraPER_ST: TIBBCDField;
    IBQ_OrdemCompraVLR_ST: TIBBCDField;
    IBQ_OrdemCompraPER_ICMS: TIBBCDField;
    IBQ_OrdemCompraVLR_ICMS: TIBBCDField;
    CDS_OCProdLinxNUM_SEQ: TIntegerField;
    CDS_OCProdLinxNUM_DOCUMENTO: TIntegerField;
    CDS_OCProdLinxDTA_DOCUMENTO: TSQLTimeStampField;
    CDS_OCProdLinxIND_OC_GERADA: TStringField;
    CDS_OCProdLinxDTA_OC_GERADA: TStringField;
    CDS_OCProdLinxNUM_OC_GERADA: TStringField;
    CDS_OCProdLinxOBS_OC: TStringField;
    CDS_OCProdLinxCOD_EMPRESA: TIntegerField;
    CDS_OCProdLinxDES_EMPRESA: TStringField;
    CDS_OCProdLinxCOD_ITEM: TFMTBCDField;
    CDS_OCProdLinxDES_ITEM: TStringField;
    CDS_OCProdLinxQTD_SUGERIDA: TIntegerField;
    CDS_OCProdLinxQTD_ACOMPRAR: TIntegerField;
    CDS_OCProdLinxQTD_SALDO: TFMTBCDField;
    CDS_OCProdLinxQTD_TRANSITO: TIntegerField;
    CDS_OCProdLinxQTD_DISPONIVEL: TFMTBCDField;
    CDS_OCProdLinxQTD_MEDIA_MES: TIntegerField;
    CDS_OCProdLinxQTD_MEDIA_DIA: TFMTBCDField;
    CDS_OCProdLinxQTD_DEM_MES1: TIntegerField;
    CDS_OCProdLinxQTD_DEM_MES2: TIntegerField;
    CDS_OCProdLinxQTD_DEM_MES3: TIntegerField;
    CDS_OCProdLinxQTD_DEM_MES4: TIntegerField;
    CDS_OCProdLinxQTD_DEM_MES5: TIntegerField;
    CDS_OCProdLinxQTD_DEM_MES6: TIntegerField;
    CDS_OCProdLinxQTD_DEM_MES7: TIntegerField;
    CDS_OCProdLinxQTD_DEM_MES8: TIntegerField;
    CDS_OCProdLinxUNI_COMPRA: TIntegerField;
    CDS_OCProdLinxUNI_VENDA: TIntegerField;
    CDS_OCProdLinxCOD_BARRAS: TStringField;
    CDS_OCProdLinxCOD_GRUPO: TIntegerField;
    CDS_OCProdLinxDES_GRUPO: TStringField;
    CDS_OCProdLinxCOD_SUBGRUPO: TIntegerField;
    CDS_OCProdLinxDES_SUBGRUPO: TStringField;
    CDS_OCProdLinxDES_GENERICO: TStringField;
    CDS_OCProdLinxCOD_APLICACAO: TIntegerField;
    CDS_OCProdLinxDES_APLICACAO: TStringField;
    CDS_OCProdLinxCOD_REFERENCIA: TStringField;
    CDS_OCProdLinxCLA_CURVA_ABC: TStringField;
    CDS_OCProdLinxCOD_FAMILIA_PRECO: TStringField;
    CDS_OCProdLinxDES_FAMILIA_PRECO: TStringField;
    CDS_OCProdLinxDTA_ULT_COMPRA: TStringField;
    CDS_OCProdLinxCOD_FOR_ULT_COMPRA: TIntegerField;
    CDS_OCProdLinxDES_FOR_ULT_COMPRA: TStringField;
    CDS_OCProdLinxQTD_ULT_COMPRA: TFMTBCDField;
    CDS_OCProdLinxVLR_UNI_ULT_COMPRA: TFMTBCDField;
    CDS_OCProdLinxVLR_TOT_ULT_COMPRA: TFMTBCDField;
    CDS_OCProdLinxVLR_UNI_COMPRA: TFMTBCDField;
    CDS_OCProdLinxPER_DESCONTO: TIntegerField;
    CDS_OCProdLinxDTA_ULT_VENDA: TStringField;
    CDS_OCProdLinxCOD_CLI_ULT_VENDA: TStringField;
    CDS_OCProdLinxDES_CLI_ULT_VENDA: TStringField;
    CDS_OCProdLinxQTD_ULT_VENDA: TStringField;
    CDS_OCProdLinxVLR_UNI_ULT_VENDA: TStringField;
    CDS_OCProdLinxVLR_TOT_ULT_VENDA: TStringField;
    CDS_OCProdLinxVLR_UNI_VENDA: TFMTBCDField;
    CDS_OCProdLinxCOD_LISTA_VENDA: TStringField;
    CDS_OCProdLinxDES_LISTA_VENDA: TStringField;
    CDS_OCProdLinxCOD_LISTA_COMPRA: TStringField;
    CDS_OCProdLinxDES_LISTA_COMPRA: TStringField;
    CDS_OCProdLinxVLR_CUSTO_MEDIO: TFMTBCDField;
    CDS_OCProdLinxVLR_TOT_VENDA: TFMTBCDField;
    CDS_OCProdLinxVLR_TOT_COMPRA: TFMTBCDField;
    CDS_OCProdLinxVLR_BRUTO: TFMTBCDField;
    CDS_OCProdLinxVLR_DESCONTOS: TFMTBCDField;
    CDS_OCProdLinxVLR_DESPESAS: TFMTBCDField;
    CDS_OCProdLinxVLR_FRETE: TFMTBCDField;
    CDS_OCProdLinxIND_SOMA_IPI_BASE_ICMS: TStringField;
    CDS_OCProdLinxIND_SOMA_FRETE_BASE_ICMS: TStringField;
    CDS_OCProdLinxIND_SOMA_DESPESA_BASE_ICMS: TStringField;
    CDS_OCProdLinxIND_SOMA_IPI_BASE_ST: TStringField;
    CDS_OCProdLinxIND_SOMA_FRETE_BASE_ST: TStringField;
    CDS_OCProdLinxIND_SOMA_DESPESA_BASE_ST: TStringField;
    CDS_OCProdLinxCOD_SIT_TRIBUTARIA: TStringField;
    CDS_OCProdLinxCOD_IPI: TStringField;
    CDS_OCProdLinxIND_IPI: TStringField;
    CDS_OCProdLinxPER_IPI: TFMTBCDField;
    CDS_OCProdLinxVLR_IPI: TFMTBCDField;
    CDS_OCProdLinxCOD_ICMS: TStringField;
    CDS_OCProdLinxPER_REDUCAO_ICMS: TFMTBCDField;
    CDS_OCProdLinxVLR_REDUCAO_ICMS: TFMTBCDField;
    CDS_OCProdLinxVLR_BASE_ICMS: TFMTBCDField;
    CDS_OCProdLinxPER_ICMS: TFMTBCDField;
    CDS_OCProdLinxVLR_ICMS: TFMTBCDField;
    CDS_OCProdLinxCOD_GRUPO_ST: TStringField;
    CDS_OCProdLinxDES_GRUPO_ST: TStringField;
    CDS_OCProdLinxPER_MARGEM_ST: TFMTBCDField;
    CDS_OCProdLinxIND_ST: TStringField;
    CDS_OCProdLinxVLR_BASE_ST: TFMTBCDField;
    CDS_OCProdLinxPER_ST: TFMTBCDField;
    CDS_OCProdLinxVLR_ST: TFMTBCDField;
    CDS_OCProdLinxPER_REPASSE: TFMTBCDField;
    CDS_OCProdLinxVLR_REPASSE: TFMTBCDField;
    CDS_OCProdLinxCOD_COMPROVANTE_ICMS: TStringField;
    CDS_OCProdLinxCOD_REFERENCIA_FORN: TStringField;
    CDS_OCProdLinxCOD_FORNECEDOR: TIntegerField;
    CDS_OCProdLinxDES_FORNECEDOR: TStringField;
    CDS_OCProdLinxTIP_PESSOA: TStringField;
    CDS_OCProdLinxDES_EMAIL: TStringField;
    CDS_OCProdLinxQTD_NR_DIAS: TIntegerField;
    CDS_OCProdLinxQTD_NR_MESES: TIntegerField;
    CDS_OCProdLinxQTD_TOT_MESES: TIntegerField;
    CDS_OCProdLinxCOD_COMPRADOR: TIntegerField;
    CDS_OCProdLinxBLOB_TEXTO: TStringField;
    CDS_OCProdLinxIND_TRANSF: TStringField;
    CDS_OCProdLinxDTA_LIM_TRANSF: TStringField;
    CDS_OCProdLinxQTD_TRANSF: TIntegerField;
    CDS_OCProdLinxIND_USAR: TStringField;
    CDS_OCProdLinxIND_QTD_ACIMA: TIntegerField;
    CDS_OCProdLinxQTD_SUGERIDA_ANO: TIntegerField;
    CDS_OCProdLinxQTD_TRANSF_PERIODO: TIntegerField;
    CDS_OCProdLinxQTD_TRANSF_ANO: TIntegerField;
    CDS_OCProdLinxEST_MINIMO: TIntegerField;
    CDS_OCProdLinxDIAS_ESTOCAGEM: TIntegerField;
    CDS_OCProdLinxQTD_DEMANDA_DIA: TIntegerField;
    CDS_OCProdLinxQTD_DEMANDA_ANO: TIntegerField;
    CDS_OCProdLinxQTD_DIAS_ANO: TIntegerField;
    CDS_OCProdLinxDATAINCLUSAO: TSQLTimeStampField;
    CDS_OCProdLinxESTADO: TStringField;
    CDS_OCProdLinxDATAALTERACAO: TSQLTimeStampField;
    procedure IBQ_AComprarAfterPost(DataSet: TDataSet);
    procedure IBQ_AComprarBeforePost(DataSet: TDataSet);
    procedure IBQ_AComprarEditaAfterPost(DataSet: TDataSet);
    procedure IBQ_AComprarEditaAfterScroll(DataSet: TDataSet);
    procedure IBQ_AComprarEditaBeforePost(DataSet: TDataSet);
    procedure IBQ_AComprarBeforeEdit(DataSet: TDataSet);
    procedure IBQ_AComprarAfterEdit(DataSet: TDataSet);

    //==========================================================================
    // Odir ====================================================================
    //==========================================================================
    Function OCGravaEstoqueMinino: Boolean;
    //==========================================================================
    // Odir ====================================================================
    //==========================================================================

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMOCLinx: TDMOCLinx;

  // Cria Ponteiro de transacão ================================================
  TD: TTransactionDesc;

  sgSeqDeletar  : String;

  bgLojaCXEmbarque: Boolean; // 6 - Considerar Percentual Limite de Caixa de Embarque para Compra - POR PRODUTO - SIDICOM: PRODUFOR.UnidadeCaixa
  cgPerCxEmpbarque: Currency; // Percentual de Utilização da Caixa de Embarque (Ligado ao Tipo 6)

implementation

uses UDMBelShopPedidos, UFrmOCLinx, DK_Procs1;//, UFrmBelShopPedidos;

{$R *.dfm}
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Atualiza Estoque Minimo do Produto - ES_FINAN_CURVA_ABC >>>>>>>>>>>>>>>>>>>>>
Function TDMOCLinx.OCGravaEstoqueMinino: Boolean;
Var
  MySql: String;
Begin
  Result:=True;

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShopPedidos.SQLC.StartTransaction(TD);
  Try // Try da Transação
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' UPDATE ES_FINAN_CURVA_ABC fc'+
           ' SET fc.est_minimo='+QuotedStr(IBQ_AComprarEST_MINIMO.AsString)+
           ' ,   fc.usu_altera='+sgCodUsuLoja+
           ' ,   fc.dta_altera=CURRENT_TIMESTAMP'+

           ' WHERE fc.cod_linx='+sgLojaLinx+
           ' AND cod_prod_linx='+IBQ_AComprarCOD_ITEM.AsString;
    DMBelShopPedidos.SQLC.Execute(MySql, nil, nil);

    // Atualiza Transacao ======================================================
    DMBelShopPedidos.SQLC.Commit(TD);

  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShopPedidos.SQLC.Rollback(TD);
      Result:=False;
    End; // on e : Exception do
  End; // Try da Transação
  DateSeparator:='/';
  DecimalSeparator:=',';
end; // Atualiza Estoque Minimo do Produto - ES_FINAN_CURVA_ABC >>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TDMOCLinx.IBQ_AComprarAfterPost(DataSet: TDataSet);
Var
  sCodItem, sCodLoja, sDoc, sDtaDoc: String;
  sCodItemDel, sCodLojaDel: String;

  iSeq: Integer;
begin
  IBQ_AComprar.DisableControls;
  If sgSeqDeletar<>'' Then
  Begin
    IBQ_AComprar.ApplyUpdates;
    DMBelShopPedidos.IBT_BelShop.CommitRetaining;
    DMBelShopPedidos.IBT_BelShop.Commit;

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
  sCodItem:=IBQ_AComprarCOD_ITEM.AsString;
  sCodLoja:=IBQ_AComprarCOD_EMPRESA.AsString;

  sDtaDoc:=IBQ_AComprarDTA_DOCUMENTO.AsString;
  Try
    sDtaDoc:=DateToStr(StrToDateTime(sDtaDoc));
  Except
    Try
      sDtaDoc:=DateToStr(StrToDateTime(f_Troca('.','/',f_Troca('-','/',sDtaDoc))));
    Except
      sDtaDoc:=DateToStr(StrToDateTime(f_Troca('/','.',f_Troca('-','.',sDtaDoc))));
    End;
  End;

  // OdirApagar - 28/03/2019 - Retirado Não Atualuza Qtd_Acomprar do CD (99) Com as Transferencias
  // AcertaCompraCD(sDoc, True, True);

  IBQ_AComprar.ApplyUpdates;
  DMBelShopPedidos.IBT_BelShop.CommitRetaining;
//  DMBelShopPedidos.IBT_BelShop.Commit;

  // Calucla os Totais do Documento
  If Not DMBelShopPedidos.Doc_CalculaValores(sDoc, sDtaDoc, sCodItem, sCodLoja) Then
   msg('Erro no Totalizador !!'+cr+cr+'Entrar em Contato com o Odir !!','A');

//OdirApagar
//  If Not IBQ_AComprar.Active Then
//  Begin
//   IBQ_AComprar.Refresh;
////    IBQ_AComprar.DisableControls;
////    IBQ_AComprar.Open;
////    IBQ_AComprar.Locate('COD_ITEM', sCodItem,[]);
////    IBQ_AComprar.EnableControls;
////    CDS_AComprarOCs.Open;
//  End; // If Not IBQ_AComprar.Active Then

  If igRecNoOCs<>0 Then
  Begin
    CDS_AComprarOCs.RecNo:=igRecNoOCs;
  End;

// OdirApagar - 17/05/2019
//  If Trim(sCodItemDel)<>'' Then
//   Begin
//    if not IBQ_AComprar.Locate('COD_ITEM;COD_EMPRESA',VarArrayOf([sCodItemDel,sCodLojaDel]),[]) Then
//     IBQ_AComprar.Locate('Num_Seq', iSeq,[]);
////   End
////  Else
////   Begin
////     IBQ_AComprar.Locate('Num_Seq', iSeq,[]);
//   End; // If Trim(sCodItemDel)<>'' Then
  If Trim(sCodItemDel)<>'' Then
   Begin
    if not IBQ_AComprar.Locate('COD_ITEM;COD_EMPRESA',VarArrayOf([sCodItemDel,sCodLojaDel]),[]) Then
     IBQ_AComprar.Locate('Num_Seq', iSeq,[]);
   End; // If Trim(sCodItemDel)<>'' Then

  If FrmOCLinx.EdtGeraOCBuscaDocto.AsInteger<>0 Then
   FrmOCLinx.AlteraAComprar(IBQ_AComprar, 'Q', VarToStr(FrmOCLinx.EdtGeraOCBuscaDocto.Value), DateToStr(FrmOCLinx.DtEdt_GeraOCDataDocto.Date))
  Else
   FrmOCLinx.AlteraAComprar(IBQ_AComprar, 'Q', VarToStr(FrmOCLinx.EdtGeraOCBuscaDocto.Value), DateToStr(FrmOCLinx.DtEdt_GeraOCDataDocto.Date));

  IBQ_AComprar.EnableControls;

end;

procedure TDMOCLinx.IBQ_AComprarBeforePost(DataSet: TDataSet);
Var
  cQtdComp, cPerApurCxEmb: Currency;
  s, sNumSeq, MySql: String;
  // OdirApgar - 17/05/2019
  // cSaldo: Currency;
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
     // Não Altera nada ========================================================
     If (IBQ_AComprarQTD_ACOMPRAR.AsCurrency<>0) And (IBQ_AComprarQTD_TRANSF.AsCurrency<>0) and
        (IBQ_AComprarQTD_ACOMPRAR.NewValue<>IBQ_AComprarQTD_ACOMPRAR.OldValue) And
        (IBQ_AComprarQTD_TRANSF.NewValue=IBQ_AComprarQTD_TRANSF.OldValue) Then
     Begin
       IBQ_AComprarQTD_ACOMPRAR.NewValue:=IBQ_AComprarQTD_ACOMPRAR.OldValue;
       Exit;
     End;

     // Caixa de Embarque ======================================================
     bgLojaCXEmbarque:=False;
     If (bgLojaCXEmbarque) And (IBQ_AComprarQTD_ACOMPRAR.AsCurrency>0) And (IBQ_AComprarUNI_COMPRA.AsCurrency>0) Then
     Begin
       cPerApurCxEmb:=RoundTo((IBQ_AComprarQTD_ACOMPRAR.AsCurrency/IBQ_AComprarUNI_COMPRA.AsCurrency),-2);

       igTotInteiro:=ParteInteiro(VarToStr(cPerApurCxEmb));
       cPerApurCxEmb:=cPerApurCxEmb-igTotInteiro;

       If ((cPerApurCxEmb*100)>=cgPerCxEmpbarque) Then
        igTotInteiro:=igTotInteiro+1;

       IBQ_AComprarQTD_ACOMPRAR.AsCurrency:=igTotInteiro*IBQ_AComprarUNI_COMPRA.AsCurrency;
     End; // If Ckb_GeraOCCalculoCxEmbarque.Checked Then

//     IBQ_AComprarOBS_OC.AsString:=QuotedStr('Calculado em: '+DateTimeToStr(
//                              DataHoraServidorFI(DMBelShopPedidos.SQLQuery1))+' por ');//+sgNomeLoja);
//     IBQ_AComprar.FieldByName('BLOB_TEXTO').AsString:=
//                        IBQ_AComprar.FieldByName('BLOB_TEXTO').AsString+#13#10+
//                        ' - Alterado em: '+DateTimeToStr(
//                        DataHoraServidorFI(DMBelShopPedidos.SQLQuery1))+
//                        ' por '+sgNomeUsuario+
//                        ' - Qtd Anterior: '+VarToStr(IBQ_AComprarQTD_ACOMPRAR.OldValue)+
//                        ' - Qtd Atual: '+VarToStr(IBQ_AComprarQTD_ACOMPRAR.NewValue);

     //=========================================================================
     // Insere Quantidade de Transferencia =====================================
     //=========================================================================

     If (IBQ_AComprarQTD_TRANSF.AsCurrency<>0) and (IBQ_AComprarCOD_EMPRESA.AsString='99') Then
     Begin
       IBQ_AComprarQTD_TRANSF.AsCurrency:=0;
       Exit;
     End;

     //=========================================================================
     // Verifica Saldo no CD para Transferencia ================================
     //=========================================================================
//     If bgVerificaSaldoCD Then
//     Begin
//       If IBQ_AComprarQTD_TRANSF.NewValue<>IBQ_AComprarQTD_TRANSF.OldValue Then
//       Begin
//         // Saldo de Transferencias do Compras em Aberto =======================
//         MySql:=' SELECT SUM(oc.qtd_transf) QTD_TRANSF'+
//                ' FROM OC_COMPRAR oc'+
//                ' WHERE ( (oc.num_oc_gerada>20160300)'+ // Numero do Documento de Transferencia
//                '         OR'+
//                '         (oc.qtd_transf<>0'+
//                '          AND'+
//                '          oc.num_documento='+IBQ_AComprarNUM_DOCUMENTO.AsString+
//                '          AND'+
//                '          oc.cod_empresa<>'+QuotedStr(Trim(IBQ_AComprarCOD_EMPRESA.AsString))+') )'+
//                ' AND   oc.ind_transf_cd=''N'''+
//                ' AND   oc.cod_item='+QuotedStr(IBQ_AComprarCOD_ITEM.AsString);
//         SQLQuery3.Close;
//         SQLQuery3.SQL.Clear;
//         SQLQuery3.SQL.Add(MySql);
//         SQLQuery3.Open;
//
//         cSaldo:=0;
//         If Trim(SQLQuery3.FieldByName('Qtd_Transf').AsString)<>'' Then
//          cSaldo:=SQLQuery3.FieldByName('Qtd_Transf').AsCurrency;
//         SQLQuery3.Close;
//
//         // Verifica se Produto tem Quantidade de Reposição no CD a Separar ====
//         MySql:=' SELECT SUM(l.qtd_a_transf) Qtd_Separa'+
//                ' FROM ES_ESTOQUES_LOJAS l'+
//                ' WHERE l.dta_movto=CURRENT_DATE'+
//                ' AND   l.ind_transf=''SIM'''+
//                ' AND   l.num_pedido=''000000'''+
//                ' AND   COALESCE(l.rel_separacao,0)<>0'+
//                ' AND   l.qtd_a_transf>0'+
//                ' AND   l.cod_produto='+QuotedStr(IBQ_AComprarCOD_ITEM.AsString);
//         SQLQuery3.Close;
//         SQLQuery3.SQL.Clear;
//         SQLQuery3.SQL.Add(MySql);
//         SQLQuery3.Open;
//
//         If Trim(SQLQuery3.FieldByName('Qtd_Separa').AsString)<>'' Then
//          cSaldo:=cSaldo+SQLQuery3.FieldByName('Qtd_Separa').AsCurrency;
//         SQLQuery3.Close;
//
//         // Verifica Produto Solicitados pelas Lojas Ainda não Enviado para o CD ==
//         MySql:=' SELECT SUM(c.Qtd_Transf) QTD_SOLIC'+
//                ' FROM SOL_TRANSFERENCIA_CD c'+
//                ' WHERE c.doc_gerado=0'+
//                ' AND   c.cod_loja_sidi='+QuotedStr(IBQ_AComprarCOD_ITEM.AsString);
//         SQLQuery3.Close;
//         SQLQuery3.SQL.Clear;
//         SQLQuery3.SQL.Add(MySql);
//         SQLQuery3.Open;
//
//         If Trim(SQLQuery3.FieldByName('Qtd_Solic').AsString)<>'' Then
//          cSaldo:=cSaldo+SQLQuery3.FieldByName('Qtd_Solic').AsCurrency;
//         SQLQuery3.Close;
//
//         // Ajusta Saldo no CD =================================================
//         MySql:=' SELECT COALESCE(ld.quantidade,0.0000) - '+f_Troca(',','.',CurrToStr(cSaldo))+' Saldo'+
//                ' FROM LINXPRODUTOSDETALHES ld'+
//                ' WHERE ld.empresa=2'+
//                ' AND   ld.cod_produto='+CDS_AComprarItensCOD_LINX.AsString;
//         SQLQuery3.Close;
//         SQLQuery3.SQL.Clear;
//         SQLQuery3.SQL.Add(MySql);
//         SQLQuery3.Open;
//         cSaldo:=SQLQuery3.FieldByName('Saldo').AsCurrency; // +IBQ_AComprarQTD_TRANSF.OldValue;
//         SQLQuery3.Close;
//
//         If cSaldo < IBQ_AComprarQTD_TRANSF.AsCurrency Then
//         Begin
//           msg('Saldo Atual no CD é Insuficiente'+cr+cr+'Para esta Transferências !!'+cr+cr+' SALDO: '+CurrToStr(cSaldo),'X');
//           IBQ_AComprarQTD_TRANSF.AsCurrency:=IBQ_AComprarQTD_TRANSF.OldValue;
//           Exit;
//         End;
//       End; // If IBQ_AComprarQTD_TRANSF.NewValue<>IBQ_AComprarQTD_TRANSF.OldValue Then
//     End; // If bgVerificaSaldoCD Then
     // Verifica Saldo no CD para Transferencia ================================
     //=========================================================================

     If (IBQ_AComprarQTD_TRANSF.AsCurrency<>0) and (IBQ_AComprarQTD_TRANSF.OldValue=0) Then
     Begin
       sgNumSeq:=IBQ_AComprarNUM_SEQ.AsString;

       // Verifica se Ja Existe Transferencia do Produto na Loja ===============
       MySql:=' SELECT o.Num_Seq, Coalesce(o.qtd_acomprar,0) qtd_acomprar'+
              ' FROM   OC_COMPRAR o'+
              ' WHERE  o.num_documento='+IBQ_AComprarNUM_DOCUMENTO.AsString+
              ' AND    CAST(o.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(IBQ_AComprarDTA_DOCUMENTO.AsDateTime))))+
              ' AND    o.cod_item='+QuotedStr(IBQ_AComprarCOD_ITEM.AsString)+
              ' AND    o.cod_empresa='+QuotedStr(IBQ_AComprarCOD_EMPRESA.AsString)+
              ' AND    o.num_seq<>'+QuotedStr(IBQ_AComprarNUM_SEQ.AsString)+
              ' AND    o.qtd_transf<>0'+
              ' AND    o.ind_oc_gerada='+QuotedStr('N')+
              ' Order by o.Num_Seq Desc';
       DMBelShopPedidos.CDS_BuscaRapida.Close;
       DMBelShopPedidos.SQLQ_BuscaRapida.Close;
       DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Clear;
       DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Add(MySql);
       DMBelShopPedidos.CDS_BuscaRapida.Open;
       sNumSeq:=DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Num_Seq').AsString;
       s:=DMBelShopPedidos.CDS_BuscaRapida.FieldByName('qtd_acomprar').AsString;
       DMBelShopPedidos.CDS_BuscaRapida.Close;

       If Trim(sNumSeq)<>'' Then
        Begin
         msg('Movto de Transferência já Existe !!'+cr+cr+'Favor Utilizá-lo !!','A');

         IBQ_AComprarQTD_TRANSF.AsCurrency:=0;
        End
       Else // If Trim(s)<>'' Then
        Begin
          DMBelShopPedidos.DML_ProdutoDocto('I', IBQ_AComprarNUM_DOCUMENTO.AsString, DateToStr(IBQ_AComprarDTA_DOCUMENTO.AsDateTime), sgNumSeq);

          IBQ_AComprarQTD_ACOMPRAR.AsCurrency:=IBQ_AComprarQTD_TRANSF.AsCurrency;
        End;
     End; // If (IBQ_AComprarQTD_TRANSF.AsCurrency<>0) and (IBQ_AComprarQTD_TRANSF.OldValue=0) Then

     //=========================================================================
     // Altera Quantidade de Transferencia =====================================
     //=========================================================================
     If (IBQ_AComprarQTD_TRANSF.AsCurrency=0) and (IBQ_AComprarQTD_TRANSF.OldValue<>0) Then
     Begin
       sgNumSeq:=IBQ_AComprarNUM_SEQ.AsString;

       DMBelShopPedidos.DML_ProdutoDocto('A', IBQ_AComprarNUM_DOCUMENTO.AsString, DateToStr(IBQ_AComprarDTA_DOCUMENTO.AsDateTime), sgNumSeq);
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
              ' AND    CAST(o.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(IBQ_AComprarDTA_DOCUMENTO.AsDateTime))))+
              ' AND    o.cod_item='+QuotedStr(IBQ_AComprarCOD_ITEM.AsString)+
              ' AND    o.cod_empresa='+QuotedStr(IBQ_AComprarCOD_EMPRESA.AsString)+
              ' AND    o.num_seq<>'+QuotedStr(IBQ_AComprarNUM_SEQ.AsString)+
              ' AND    o.qtd_transf=0'+
              ' Order by o.Num_Seq Desc';
       DMBelShopPedidos.CDS_BuscaRapida.Close;
       DMBelShopPedidos.SQLQ_BuscaRapida.Close;
       DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Clear;
       DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Add(MySql);
       DMBelShopPedidos.CDS_BuscaRapida.Open;
       sNumSeq :=DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Num_Seq').AsString;
       cQtdComp:=DMBelShopPedidos.CDS_BuscaRapida.FieldByName('qtd_acomprar').AsCurrency;
       DMBelShopPedidos.CDS_BuscaRapida.Close;

       cQtdComp:=(cQtdComp+IBQ_AComprarQTD_ACOMPRAR.OldValue)-IBQ_AComprarQTD_TRANSF.AsCurrency;
       If cQtdComp<0 Then
        cQtdComp:=0;

       MySql:=' UPDATE oc_comprar c'+
              ' SET    c.qtd_acomprar='+F_Troca(',','.',CurrToStr(cQtdComp))+
              ' WHERE  c.num_documento='+IBQ_AComprarNUM_DOCUMENTO.AsString+
              ' AND    CAST(c.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(IBQ_AComprarDTA_DOCUMENTO.AsDateTime))))+
              ' AND    c.num_seq='+sNumSeq;
       DMBelShopPedidos.SQLC.Execute(MySql,nil, nil);

       IBQ_AComprarQTD_ACOMPRAR.AsCurrency:=IBQ_AComprarQTD_TRANSF.AsCurrency;
     End; // If (IBQ_AComprarQTD_TRANSF.AsCurrency<>0) and (IBQ_AComprarQTD_TRANSF.OldValue<>0) Then

     //=========================================================================
     // Atualiza Estoque Minimo Alterado e Sugestão ============================
     //=========================================================================
     If IBQ_AComprarEST_MINIMO.OldValue<>IBQ_AComprarEST_MINIMO.NewValue Then
     Begin
       // Grava Estoque Mínimo =================================================
       If Not OCGravaEstoqueMinino Then
       Begin
         msg('Erro ao Atualizar o Estoque Mínimo !!'+cr+cr+'Entrar em Contato com o Odir'+cr+'TI BelShop','A');
       End; // If Not OCGravaEstoqueMinino Then

       // Atualiza Sugestão se Necessário ======================================
       If (IBQ_AComprarEST_MINIMO.AsInteger-IBQ_AComprarQTD_SALDO.AsInteger)>IBQ_AComprarQTD_SUGERIDA.AsInteger Then
       Begin
         IBQ_AComprarQTD_SUGERIDA.AsInteger:=IBQ_AComprarEST_MINIMO.AsInteger-IBQ_AComprarQTD_SALDO.AsInteger;
       End;

       // Atualiza AComprar se Necessário ======================================
       If (IBQ_AComprarEST_MINIMO.AsInteger-IBQ_AComprarQTD_SALDO.AsInteger)>IBQ_AComprarQTD_ACOMPRAR.AsInteger Then
       Begin
         IBQ_AComprarQTD_ACOMPRAR.AsInteger:=IBQ_AComprarEST_MINIMO.AsInteger-IBQ_AComprarQTD_SALDO.AsInteger;
       End;
     End; // If IBQ_AComprarEST_MINIMO.OldValue<>IBQ_AComprarEST_MINIMO.NewValue Then
     // Analisa Estoque Minimo Alterado e Sugestão =============================
     //=========================================================================
   End; // If IBQ_AComprarIND_OC_GERADA.AsString='S' Then

end;

procedure TDMOCLinx.IBQ_AComprarEditaAfterPost(DataSet: TDataSet);
Var
// OdiApagar - 19/03/2019
//  sTotal_Valor, sTotal_Itens, sTotal_Qtd: String;
  sCodForn, sCodItem, sCodLoja, sDoc: String;
  iSeq: Integer;
begin
  iSeq:=IBQ_AComprarEdita.RecNo;

  sDoc:=IBQ_AComprarEditaNUM_DOCUMENTO.AsString;
  sCodItem:=IBQ_AComprarEditaCOD_ITEM.AsString;
  sCodLoja:=IBQ_AComprarEditaCOD_EMPRESA.AsString;
  sCodForn:=IBQ_AComprarEditaCOD_FORNECEDOR.AsString;

  IBQ_AComprarEdita.ApplyUpdates;
  DMBelShopPedidos.IBT_BelShop.CommitRetaining;

  // Busca Totais do Pedido ===================================================
// OdiApagar - 19/03/2019
//  If FrmOCLinx.Rb_GeraOCEditaComQtd.Checked Then s:='C';
//  If FrmOCLinx.Rb_GeraOCEditaSemQtd.Checked Then s:='S';
//  If FrmOCLinx.Rb_GeraOCEditaTodosItens.Checked Then s:='T';
//
//  FrmOCLinx.TotaisPedOC(sTotal_Valor, sTotal_Itens, sTotal_Qtd, sDoc, sCodLoja, s, '', sCodForn);

  If FrmOCLinx.EdtGeraOCBuscaDocto.AsInteger<>0 Then
   FrmOCLinx.AlteraAComprar(IBQ_AComprarEdita, 'Q', VarToStr(FrmOCLinx.EdtGeraOCBuscaDocto.Value), DateToStr(FrmOCLinx.DtEdt_GeraOCDataDocto.Date))
  Else
   FrmOCLinx.AlteraAComprar(IBQ_AComprar, 'Q', VarToStr(FrmOCLinx.EdtGeraOCBuscaDocto.Value), DateToStr(FrmOCLinx.DtEdt_GeraOCDataDocto.Date));

// OdiApagar - 19/03/2019
//  FrmOCLinx.EdtGeraOCEditaTotalGeral.Value  :=StrToCurr(sTotal_Valor);
//  FrmOCLinx.EdtGeraOCEditaTotalItens.Value  :=StrToCurr(sTotal_Itens);
//  FrmOCLinx.EdtGeraOCEditaTotallQtd.Value   :=StrToCurr(sTotal_Qtd);
//
//  If Not IBQ_AComprarEdita.Locate('NUM_SEQ',iSeq,[]) Then
//   If Not IBQ_AComprarEdita.Locate('NUM_SEQ',iSeq+1,[]) Then
//    IBQ_AComprarEdita.Locate('NUM_SEQ',iSeq-1,[]);

  IBQ_AComprarEdita.RecNo:=iSeq-1;

// OdiApagar - 19/03/2019
//  FrmOCLinx.Dbg_GeraOCEditaGrid.SelectedIndex:=2;
//  FrmOCLinx.Dbg_GeraOCEditaGrid.SetFocus;

end;

procedure TDMOCLinx.IBQ_AComprarEditaAfterScroll(DataSet: TDataSet);
begin
// OdiApagar - 19/03/2019
//  FrmOCLinx.Dbg_GeraOCEditaGrid.SelectedIndex:=2;

end;

procedure TDMOCLinx.IBQ_AComprarEditaBeforePost(DataSet: TDataSet);
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

     // OdiApagar - 19/03/2019
//     If FrmOCLinx.Bt_GeraOCPreVisualizaOC.Caption=' Pré-Visualização TR' Then
//     Begin
//       IBQ_AComprarEditaQTD_TRANSF.AsCurrency:=IBQ_AComprarEditaQTD_ACOMPRAR.AsCurrency;
//     End;

     IBQ_AComprarEditaOBS_OC.AsString:=QuotedStr('Calculado em: '+DateTimeToStr(
                                       DataHoraServidorFI(DMBelShopPedidos.SQLQuery1))+
                                       ' por '+sgNomeUsuario);
     IBQ_AComprarEdita.FieldByName('BLOB_TEXTO').AsString:=
                    IBQ_AComprarEdita.FieldByName('BLOB_TEXTO').AsString+#13#10+
                    ' - Alterado em: '+DateTimeToStr(
                    DataHoraServidorFI(DMBelShopPedidos.SQLQuery1))+
                    ' por '+sgNomeUsuario+
                    ' - Qtd Anterior: '+VarToStr(IBQ_AComprarEditaQTD_ACOMPRAR.OldValue)+
                    ' - Qtd Atual: '+VarToStr(IBQ_AComprarEditaQTD_ACOMPRAR.NewValue);
   End;
end;

procedure TDMOCLinx.IBQ_AComprarBeforeEdit(DataSet: TDataSet);
begin
  sgCodProdLinx:=sgCodProdLinx;
end;

procedure TDMOCLinx.IBQ_AComprarAfterEdit(DataSet: TDataSet);
begin
  sgCodProdLinx:=sgCodProdLinx;

end;

end.
