unit UDMLojaUnica;

interface

uses
  SysUtils, Classes, FMTBcd, SqlExpr, DB, Provider, DBClient;
  // Ultimo: DBClient
type
  TDMLojaUnica = class(TDataModule)
    CDS_ParamLjFornDia: TClientDataSet;
    CDS_ParamLjFornDiaPROC: TStringField;
    CDS_ParamLjFornDiaCOD_LOJA: TStringField;
    CDS_ParamLjFornDiaCODFORNECEDOR: TStringField;
    CDS_ParamLjFornDiaNOMEFORNECEDOR: TStringField;
    CDS_ParamLjFornDiaTIPO_CALCULO: TStringField;
    CDS_ParamLjFornDiaSITUACAO_CALCULO: TStringField;
    CDS_ParamLjFornDiaDIAS_MESES: TStringField;
    CDS_ParamLjFornDiaFORN: TStringField;
    DSP_ParamLjFornDia: TDataSetProvider;
    DS_ParamLjFornDia: TDataSource;
    CDS_ParamLojasFTP: TClientDataSet;
    CDS_ParamLojasFTPIND_ORDEM: TStringField;
    CDS_ParamLojasFTPIND_TIPO: TIntegerField;
    CDS_ParamLojasFTPIND_DML: TStringField;
    CDS_ParamLojasFTPNUM_SEQ: TIntegerField;
    CDS_ParamLojasFTPCOD_LOJA: TStringField;
    CDS_ParamLojasFTPDML_EXC: TStringField;
    CDS_ParamLojasFTPDML_INC: TStringField;
    DSP_ParamLojasFTP: TDataSetProvider;
    DS_ParamLojasFTP: TDataSource;
    CDS_ParametrosLoja: TClientDataSet;
    CDS_ParametrosLojaNUM_SEQ: TIntegerField;
    CDS_ParametrosLojaIND_TIPO: TIntegerField;
    CDS_ParametrosLojaCOD_LOJA: TStringField;
    CDS_ParametrosLojaIND_SIM_NAO: TStringField;
    CDS_ParametrosLojaNUM_DIA_CALCULO: TIntegerField;
    CDS_ParametrosLojaCOD_FORNECEDOR: TStringField;
    CDS_ParametrosLojaPER_ACEITO: TFMTBCDField;
    CDS_ParametrosLojaDTA_ULT_CALCULO: TDateField;
    CDS_ParametrosLojaDTA_PROX_CALCULO: TDateField;
    CDS_ParametrosLojaIND_DIARIAMENTE: TStringField;
    CDS_ParametrosLojaIND_TODOS_DIAS: TStringField;
    CDS_ParametrosLojaCADA_NUM_DIAS: TIntegerField;
    CDS_ParametrosLojaIND_SEMANAMENTE: TStringField;
    CDS_ParametrosLojaCADA_NUM_SEMANA: TIntegerField;
    CDS_ParametrosLojaDIA_SEG: TStringField;
    CDS_ParametrosLojaDIA_TER: TStringField;
    CDS_ParametrosLojaDIA_QUA: TStringField;
    CDS_ParametrosLojaDIA_QUI: TStringField;
    CDS_ParametrosLojaDIA_SEX: TStringField;
    CDS_ParametrosLojaIND_MENSALMENTE: TStringField;
    CDS_ParametrosLojaDES_POSICAO: TStringField;
    CDS_ParametrosLojaDIA_DIAS: TStringField;
    CDS_ParametrosLojaMES_JAN: TStringField;
    CDS_ParametrosLojaMES_FEV: TStringField;
    CDS_ParametrosLojaMES_MAR: TStringField;
    CDS_ParametrosLojaMES_ABR: TStringField;
    CDS_ParametrosLojaMES_MAI: TStringField;
    CDS_ParametrosLojaMES_JUN: TStringField;
    CDS_ParametrosLojaMES_JUL: TStringField;
    CDS_ParametrosLojaMES_AGO: TStringField;
    CDS_ParametrosLojaMES_SET: TStringField;
    CDS_ParametrosLojaMES_OUT: TStringField;
    CDS_ParametrosLojaMES_NOV: TStringField;
    CDS_ParametrosLojaMES_DEZ: TStringField;
    CDS_ParametrosLojaIND_DML: TStringField;
    DSP_ParametrosLoja: TDataSetProvider;
    DS_ParametrosLoja: TDataSource;
    SDS_ParamLjFornDia: TSQLDataSet;
    SDS_ParametrosLoja: TSQLDataSet;
    SDS_ParamLojasFTP: TSQLDataSet;
    CDS_V_OCTotForn: TClientDataSet;
    DS_V_OCTotForn: TDataSource;
    CDS_V_OCTotFornCOD_FORN: TStringField;
    CDS_V_OCTotFornDES_FORNECEDOR: TStringField;
    CDS_V_OCTotFornVLR_VENDAS: TCurrencyField;
    CDS_V_OCTotFornVLR_COMPRAS: TCurrencyField;
    CDS_V_OCTotFornPROC: TStringField;
    CDS_V_OCTotFornTOT_ITENS: TIntegerField;
    CDS_V_OCTotFornQTD_TOTAL: TCurrencyField;
    CDS_V_OCTotFornTOT_ITENS_ACOMPRAR: TIntegerField;
    CDS_V_OCTotFornIND_TRANSF: TStringField;
    CDS_V_SolicitFornLojas: TClientDataSet;
    DS_V_SolicitFornLojas: TDataSource;
    CDS_V_SolicitFornLojasPROC: TStringField;
    CDS_V_SolicitFornLojasCOD_FORNECEDOR: TStringField;
    CDS_V_SolicitFornLojasNOMEFORNECEDOR: TStringField;
    CDS_V_SolicitFornLojasCOD_LOJA: TStringField;
    CDS_V_SolicitFornLojasESTE: TStringField;
    SDS_AComprarOCs: TSQLDataSet;
    DSP_AComprarOCs: TDataSetProvider;
    CDS_AComprarOCs: TClientDataSet;
    CDS_AComprarOCsGERAR: TStringField;
    CDS_AComprarOCsCOD_EMP_FIL: TStringField;
    CDS_AComprarOCsDES_EMP_FIL: TStringField;
    CDS_AComprarOCsNUM_DOCUMENTO: TIntegerField;
    CDS_AComprarOCsIND_OC_GERADA: TStringField;
    CDS_AComprarOCsCOD_FORNECEDOR: TStringField;
    CDS_AComprarOCsFORNECEDOR: TStringField;
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
    CDS_AComprarOCsTOTALGERAL: TAggregateField;
    CDS_AComprarOCsTOTALITENS: TAggregateField;
    DS_AComprarOCs: TDataSource;
    SDS_ImpListaPreco: TSQLDataSet;
    CDS_ImpListaPreco: TClientDataSet;
    DSP_ImpListaPreco: TDataSetProvider;
    CDS_ImpListaPrecoCODLISTA: TStringField;
    CDS_ImpListaPrecoCODPRODUTO: TStringField;
    CDS_ImpListaPrecoPRECOCOMPRA: TFMTBCDField;
    CDS_ImpListaPrecoMARGEM: TFMTBCDField;
    CDS_ImpListaPrecoPRECOVENDA: TFMTBCDField;
    CDS_ImpListaPrecoPRECOANTERIOR: TFMTBCDField;
    CDS_ImpListaPrecoDATAALTERACAO: TDateField;
    CDS_ImpListaPrecoHORAALTERACAO: TTimeField;
    CDS_ImpListaPrecoDESCONTO: TFMTBCDField;
    CDS_ImpListaPrecoDESCONTOMAX: TFMTBCDField;
    CDS_ImpListaPrecoDESATIVADO: TStringField;
    CDS_ImpListaPrecoPRECODOLAR: TFMTBCDField;
    CDS_ImpListaPrecoACRECIMOLISTA: TFMTBCDField;
    CDS_ImpListaPrecoCUSTOSLISTA: TFMTBCDField;
    CDS_ImpListaPrecoDTA_ATUALIZACAO: TDateField;
    SDS_ImpFornecedor: TSQLDataSet;
    CDS_ImpFornecedor: TClientDataSet;
    DSP_ImpFornecedor: TDataSetProvider;
    CDS_ImpFornecedorCODFORNECEDOR: TStringField;
    CDS_ImpFornecedorNOMEFORNECEDOR: TStringField;
    CDS_ImpFornecedorEFILIAL: TStringField;
    CDS_ImpFornecedorCODTIPOFOR: TStringField;
    CDS_ImpFornecedorCIDADE: TStringField;
    CDS_ImpFornecedorESTADO: TStringField;
    CDS_ImpFornecedorCODIGOPOSTAL: TStringField;
    CDS_ImpFornecedorNUMEROCGCMF: TStringField;
    CDS_ImpFornecedorNUMEROINSC: TStringField;
    CDS_ImpFornecedorNUMEROISSQN: TStringField;
    CDS_ImpFornecedorNUMEROCPF: TStringField;
    CDS_ImpFornecedorPESSOA: TStringField;
    CDS_ImpFornecedorFONE1: TStringField;
    CDS_ImpFornecedorFONE2: TStringField;
    CDS_ImpFornecedorFONEFAX: TStringField;
    CDS_ImpFornecedorINTERNET: TStringField;
    CDS_ImpFornecedorEMAIL: TStringField;
    CDS_ImpFornecedorCLASSEFOR: TStringField;
    CDS_ImpFornecedorCONTATO: TStringField;
    CDS_ImpFornecedorOBSERVACAO: TMemoField;
    CDS_ImpFornecedorBAIRRO: TStringField;
    CDS_ImpFornecedorSIMPLESESTADUAL: TStringField;
    CDS_ImpFornecedorCODCENTROCUSTO: TStringField;
    CDS_ImpFornecedorLOGRADOURO: TStringField;
    CDS_ImpFornecedorLOGNUMERO: TStringField;
    CDS_ImpFornecedorLOGCOMPL: TStringField;
    CDS_ImpFornecedorCODPAIS: TStringField;
    CDS_ImpFornecedorRAZAOSOCIAL: TStringField;
    CDS_ImpFornecedorDATAALTERACAO: TSQLTimeStampField;
    CDS_ImpFornecedorFORISENTOICM: TStringField;
    CDS_ImpFornecedorFORISENTOIPI: TStringField;
    CDS_ImpFornecedorFORISENTOSUBST: TStringField;
    CDS_ImpFornecedorFORISENTOPISCOFINS: TStringField;
    CDS_ImpFornecedorUSAICMCOMPRA2_SN: TStringField;
    CDS_ImpFornecedorDTA_ATUALIZACAO: TSQLTimeStampField;
    SDS_ImpProdutos: TSQLDataSet;
    CDS_ImpProdutos: TClientDataSet;
    DSP_ImpProdutos: TDataSetProvider;
    CDS_ImpProdutosCODPRODUTO: TStringField;
    CDS_ImpProdutosAPRESENTACAO: TStringField;
    CDS_ImpProdutosCODBARRA: TStringField;
    CDS_ImpProdutosSITUACAOPRO: TStringField;
    CDS_ImpProdutosUNIDADE: TStringField;
    CDS_ImpProdutosUNIDADEESTOQUE: TIntegerField;
    CDS_ImpProdutosCLASSEABC: TStringField;
    CDS_ImpProdutosPRINCIPALFOR: TStringField;
    CDS_ImpProdutosNOMEFORNECEDOR: TStringField;
    CDS_ImpProdutosREFERENCIA: TStringField;
    CDS_ImpProdutosCODGRUPOSUB: TStringField;
    CDS_ImpProdutosCODGRUPO: TStringField;
    CDS_ImpProdutosNOMEGRUPO: TStringField;
    CDS_ImpProdutosCODSUBGRUPO: TStringField;
    CDS_ImpProdutosNOMESUBGRUPO: TStringField;
    CDS_ImpProdutosCODFAMILIAPRECO: TStringField;
    CDS_ImpProdutosNOMEFAMILIAPRECO: TStringField;
    CDS_ImpProdutosNOMEGENERICO: TStringField;
    CDS_ImpProdutosCODAPLICACAO: TStringField;
    CDS_ImpProdutosNOMEAPLICACAO: TStringField;
    CDS_ImpProdutosCODICMVENDA: TStringField;
    CDS_ImpProdutosCODICMCOMPRA: TStringField;
    CDS_ImpProdutosCODIPICOMPRA: TStringField;
    CDS_ImpProdutosCODIPIVENDA: TStringField;
    CDS_ImpProdutosISS: TFMTBCDField;
    CDS_ImpProdutosPESO: TFMTBCDField;
    CDS_ImpProdutosPESOBRUTO: TFMTBCDField;
    CDS_ImpProdutosCODNACIONALIDADE: TStringField;
    CDS_ImpProdutosCONTROLALOTE: TStringField;
    CDS_ImpProdutosDIASVENCELOTE: TIntegerField;
    CDS_ImpProdutosNAOVENDEZERADO: TStringField;
    CDS_ImpProdutosCODMERCOSULNCM: TStringField;
    CDS_ImpProdutosGRUPOSTMVA: TIntegerField;
    CDS_ImpProdutosCODPISCOFINS_VENDA: TStringField;
    CDS_ImpProdutosCODPISCOFINS_COMPRA: TStringField;
    CDS_ImpProdutosECOMMERCE_SN: TStringField;
    CDS_ImpProdutosDATAINCLUSAO: TDateField;
    CDS_ImpProdutosDATAALTERACAO: TDateField;
    CDS_ImpProdutosDTA_ATUALIZACAO: TDateField;
    CDS_V_SolicitFornLojasDEM_MES1: TStringField;
    CDS_V_SolicitFornLojasDEM_MES2: TStringField;
    CDS_V_SolicitFornLojasDEM_MES3: TStringField;
    CDS_V_SolicitFornLojasDEM_MES4: TStringField;
    CDS_V_SolicitFornLojasDEM_MES5: TStringField;
    CDS_V_SolicitFornLojasDEM_MES6: TStringField;
    CDS_V_SolicitFornLojasDEM_MES7: TStringField;
    CDS_V_SolicitFornLojasDEM_MES8: TStringField;
    CDS_V_SolicitFornLojasDTA_SOLICITACAO: TDateField;

    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMLojaUnica: TDMLojaUnica;

implementation

uses DK_Procs1, UDMBelShop, UFrmGeraPedidosComprasLojas;

{$R *.dfm}

end.
