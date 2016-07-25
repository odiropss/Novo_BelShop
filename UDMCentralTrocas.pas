unit UDMCentralTrocas;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr,
  IBQuery, IBDatabase, IBCustomDataSet, IBUpdateSQL;

type
  TDMCentralTrocas = class(TDataModule)
    SDS_Transf_Cd: TSQLDataSet;
    DSP_Transf_Cd: TDataSetProvider;
    CDS_Transf_Cd: TClientDataSet;
    DS_Transf_Cd: TDataSource;
    CDS_Transf_CdNUM_SOLICITACAO: TIntegerField;
    CDS_Transf_CdDTA_SOLICITACAO: TDateField;
    CDS_Transf_CdCODPRODUTO: TStringField;
    CDS_Transf_CdAPRESENTACAO: TStringField;
    CDS_Transf_CdPRINCIPALFOR: TStringField;
    CDS_Transf_CdNOMEFORNECEDOR: TStringField;
    CDS_Transf_CdQUANT_CD: TFMTBCDField;
    CDS_Transf_CdCODBARRA: TStringField;
    CDS_NotasEntrada: TClientDataSet;
    SDS_NotasEntrada: TSQLDataSet;
    DSP_NotasEntrada: TDataSetProvider;
    DS_NotasEntrada: TDataSource;
    CDS_NotasEntradaNUM_SOLICITACAO: TIntegerField;
    CDS_NotasEntradaNFE_COD_LOJA: TStringField;
    CDS_NotasEntradaNFE_COD_PRODUTO: TStringField;
    CDS_NotasEntradaNFE_COD_BARRAS: TStringField;
    CDS_NotasEntradaNFE_PRODUTO: TStringField;
    CDS_NotasEntradaNFE_COD_FORNECEDOR: TStringField;
    CDS_NotasEntradaNFE_FORNECEDOR: TStringField;
    CDS_NotasEntradaNFE_COD_COMPROVANTE: TStringField;
    CDS_NotasEntradaNFE_NUMERO: TStringField;
    CDS_NotasEntradaNFE_SERIE: TStringField;
    CDS_NotasEntradaNFE_DTA_ENTRADA: TDateField;
    CDS_NotasEntradaNFE_DTA_COMPROVANTE: TDateField;
    CDS_NotasEntradaNFE_QTD: TFMTBCDField;
    CDS_NotasEntradaNFE_QTD_DEVOLUCAO: TFMTBCDField;
    CDS_NotasEntr: TClientDataSet;
    SDS_NotasEntr: TSQLDataSet;
    DSP_NotasEntr: TDataSetProvider;
    CDS_NotasEntrNUM_SEQ: TIntegerField;
    CDS_NotasEntrCODFILIAL: TStringField;
    CDS_NotasEntrCODCOMPROVANTE: TStringField;
    CDS_NotasEntrNUMERO: TStringField;
    CDS_NotasEntrSERIE: TStringField;
    CDS_NotasEntrSITUACAONF: TStringField;
    CDS_NotasEntrDATAENTRADA: TDateField;
    CDS_NotasEntrDATACOMPROVANTE: TDateField;
    CDS_NotasEntrCODFORNECEDOR: TStringField;
    CDS_NotasEntrCODPRODUTO: TStringField;
    CDS_NotasEntrQUANT: TFMTBCDField;
    CDS_NotasEntrQUANT_INFORMADA: TFMTBCDField;
    CDS_Transf_CdTOT_PRODUTOS: TAggregateField;
    CDS_Transf_CdTOT_QTD: TAggregateField;
    CDS_RomaneioDev: TClientDataSet;
    SDS_RomaneioDev: TSQLDataSet;
    DSP_RomaneioDev: TDataSetProvider;
    DS_RomaneioDev: TDataSource;
    CDS_RomaneioDevDES_LOJA: TStringField;
    CDS_RomaneioDevNUM_CNPJ: TStringField;
    CDS_RomaneioDevENDERECO: TStringField;
    CDS_RomaneioDevDES_BAIRRO: TStringField;
    CDS_RomaneioDevDES_CIDADE: TStringField;
    CDS_RomaneioDevCOD_UF: TStringField;
    CDS_RomaneioDevCOD_CEP: TStringField;
    CDS_RomaneioDevNOMEFORNECEDOR: TStringField;
    CDS_RomaneioDevCONTATO: TStringField;
    CDS_RomaneioDevTELEFONES: TStringField;
    CDS_RomaneioDevEMAIL: TStringField;
    CDS_RomaneioDevCODCOMPROVANTE: TStringField;
    CDS_RomaneioDevNUMERO: TStringField;
    CDS_RomaneioDevSERIE: TStringField;
    CDS_RomaneioDevSITUACAONF: TStringField;
    CDS_RomaneioDevDATACOMPROVANTE: TDateField;
    CDS_RomaneioDevDATAENTRADA: TDateField;
    CDS_RomaneioDevNOMEPRODUTO: TStringField;
    CDS_RomaneioDevUNID: TStringField;
    CDS_RomaneioDevUSUARIO: TStringField;
    CDS_RomaneioDevQTD_DEVOLVER: TFMTBCDField;
    CDS_RomaneioDevPRECOCOMPRA: TFMTBCDField;
    CDS_V_Geral: TClientDataSet;
    CDS_Transf_CdQTD_NAO: TFMTBCDField;
    CDS_V_GeralCodBarras: TStringField;
    CDS_Transf_CdSIT: TStringField;
    CDS_Transf_CdIND_IMPRESSO: TStringField;
    CDS_Transf_CdNUM_SEQ: TIntegerField;
    CDS_ReposicaoDocs: TClientDataSet;
    SDS_ReposicaoDocs: TSQLDataSet;
    DSP_ReposicaoDocs: TDataSetProvider;
    DS_ReposicaoDocs: TDataSource;
    CDS_ReposicaoDocsCOD_LOJA: TStringField;
    CDS_ReposicaoDocsRAZAO_SOCIAL: TStringField;
    CDS_ReposicaoDocsNUM_DOCTO: TIntegerField;
    CDS_ReposicaoDocsNUM_PRODUTOS: TIntegerField;
    CDS_ReposicaoTransf: TClientDataSet;
    SDS_ReposicaoTransf: TSQLDataSet;
    DSP_ReposicaoTransf: TDataSetProvider;
    DS_ReposicaoTransf: TDataSource;
    CDS_ReposicaoTransfCOD_PRODUTO: TStringField;
    CDS_ReposicaoTransfDES_PRODUTO: TStringField;
    CDS_ReposicaoTransfABC: TStringField;
    CDS_ReposicaoTransfQTD_A_TRANSF: TFMTBCDField;
    CDS_ReposicaoTransfNUM_PEDIDO: TStringField;
    CDS_ReposicaoTransfENDERECO: TStringField;
    CDS_ReposicaoTransfNUM_SEQ: TSmallintField;
    SDS_Ajustes: TSQLDataSet;
    DSP_Ajustes: TDataSetProvider;
    CDS_Ajustes: TClientDataSet;
    AggregateField1: TAggregateField;
    AggregateField2: TAggregateField;
    DS_Ajustes: TDataSource;
    CDS_AjustesLOJA: TStringField;
    CDS_AjustesNUM_DOCTO: TIntegerField;
    CDS_AjustesDTA_DOCTO: TDateField;
    CDS_AjustesTIPO_DOCTO: TStringField;
    CDS_AjustesCOD_COMPROVANTE: TStringField;
    CDS_AjustesNOMECOMPROVANTE: TStringField;
    CDS_AjustesNUM_SEQ: TIntegerField;
    CDS_AjustesCOD_PRODUTO: TStringField;
    CDS_AjustesDES_PRODUTO: TStringField;
    CDS_AjustesCOD_BARRAS: TStringField;
    CDS_AjustesUNIDADE: TStringField;
    CDS_AjustesDOC_SIDICOM: TStringField;
    CDS_AjustesQTD_AJUSTE: TFMTBCDField;
    CDS_AjustesDOC_POR: TStringField;
    CDS_AjustesSIDICOM_POR: TStringField;
    SDS_RelReposicao: TSQLDataSet;
    DSP_RelReposicao: TDataSetProvider;
    CDS_RelReposicao: TClientDataSet;
    CDS_RelReposicaoLOJA: TStringField;
    CDS_RelReposicaoCNPJ: TStringField;
    CDS_RelReposicaoNUM_DOCTO: TIntegerField;
    CDS_RelReposicaoDTA_MOVTO: TDateField;
    CDS_RelReposicaoSEQ: TIntegerField;
    CDS_RelReposicaoENDERECAMENTO: TStringField;
    CDS_RelReposicaoQTD_A_TRANSF: TFMTBCDField;
    CDS_RelReposicaoQTD_DISPONIVEL: TStringField;
    CDS_RelReposicaoCOD_PRODUTO: TStringField;
    CDS_RelReposicaoCODBARRA: TStringField;
    CDS_RelReposicaoDES_PRODUTO: TStringField;
    CDS_RelReposicaoUSUARIO: TStringField;
    CDS_RelReposicaoOBS_DOCTO: TStringField;
    DS_AnaliseReposicao: TDataSource;
    CDS_V_AnaliseReposicao: TClientDataSet;
//    IBQ_SID_PedidoODIR: TIBQuery;
//    IBU_SID_PedidoODIR: TIBUpdateSQL;
//    IBQ_SID_PedidoODIRCODPEDIDO: TIBStringField;
//    IBQ_SID_PedidoODIRCODCLIENTE: TIBStringField;
//    IBQ_SID_PedidoODIRCODFILIAL: TIBStringField;
//    IBQ_SID_PedidoODIRSITUACAO: TIBStringField;
//    IBQ_SID_PedidoODIRSITUACAOAUX: TIBStringField;
//    IBQ_SID_PedidoODIRPEDIDOEMUSO: TIBStringField;
//    IBQ_SID_PedidoODIRPEDIDOBLOQUEADO: TIBStringField;
//    IBQ_SID_PedidoODIRSEPARAESTOQUE: TIBStringField;
//    IBQ_SID_PedidoODIRCODLOTE: TIBStringField;
//    IBQ_SID_PedidoODIRCODVENDEDOR: TIBStringField;
//    IBQ_SID_PedidoODIRCODVENDEDOR2: TIBStringField;
//    IBQ_SID_PedidoODIRCODVENDEDOR3: TIBStringField;
//    IBQ_SID_PedidoODIRCODTRANSPORTE: TIBStringField;
//    IBQ_SID_PedidoODIRDATAPEDIDO: TDateField;
//    IBQ_SID_PedidoODIRHORAPEDIDO: TTimeField;
//    IBQ_SID_PedidoODIRDATAEMISSAO: TDateField;
//    IBQ_SID_PedidoODIRHORAEMISSAO: TIBStringField;
//    IBQ_SID_PedidoODIRDATAENTREGA: TDateField;
//    IBQ_SID_PedidoODIRHORAENTREGA: TIBStringField;
//    IBQ_SID_PedidoODIRCODDIGITADOR: TIBStringField;
//    IBQ_SID_PedidoODIRCODDPTO: TIBStringField;
//    IBQ_SID_PedidoODIRREPREFORNECEDOR: TIBStringField;
//    IBQ_SID_PedidoODIRREPRECLIENTE: TIBStringField;
//    IBQ_SID_PedidoODIRREPRENUMPEDIDO: TIBStringField;
//    IBQ_SID_PedidoODIRCONTATOPEDIDO: TIBStringField;
//    IBQ_SID_PedidoODIRCODCONDICAO: TIBStringField;
//    IBQ_SID_PedidoODIRCODBANCO: TIBStringField;
//    IBQ_SID_PedidoODIRCODFISCAL: TIBStringField;
//    IBQ_SID_PedidoODIRESPECIALPEDIDO: TIBStringField;
//    IBQ_SID_PedidoODIRESPECIALCOMPROV: TIBStringField;
//    IBQ_SID_PedidoODIRESPECIALCONDICAO: TIBStringField;
//    IBQ_SID_PedidoODIRPENDENTESITUACAO: TIBStringField;
//    IBQ_SID_PedidoODIRPENDENTEPONTEIRO: TIBStringField;
//    IBQ_SID_PedidoODIRCODCENTROCUSTO: TIBStringField;
//    IBQ_SID_PedidoODIRISENTOICM: TIBStringField;
//    IBQ_SID_PedidoODIRISENTOIPI: TIBStringField;
//    IBQ_SID_PedidoODIRISENTOSUBST: TIBStringField;
//    IBQ_SID_PedidoODIRTRANFRETE: TIBStringField;
//    IBQ_SID_PedidoODIRTRANVOLUME: TIBStringField;
//    IBQ_SID_PedidoODIRTRANQUANTIDADE: TIntegerField;
//    IBQ_SID_PedidoODIRTRANPESOBRUTO: TIBBCDField;
//    IBQ_SID_PedidoODIRTRANPESOLIQUIDO: TIBBCDField;
//    IBQ_SID_PedidoODIRTRANCUBAGEM: TFloatField;
//    IBQ_SID_PedidoODIRTOTITENS: TIntegerField;
//    IBQ_SID_PedidoODIRTOTATENDIDO: TIntegerField;
//    IBQ_SID_PedidoODIRTOTPARCIAL: TIntegerField;
//    IBQ_SID_PedidoODIRTOTNAOATENDIDO: TIntegerField;
//    IBQ_SID_PedidoODIRTOTBRUTO: TIBBCDField;
//    IBQ_SID_PedidoODIRTOTDESCITEM: TIBBCDField;
//    IBQ_SID_PedidoODIRTOTIPI: TIBBCDField;
//    IBQ_SID_PedidoODIRSUBSTITUICAO: TIBBCDField;
//    IBQ_SID_PedidoODIRTOTFRETE: TIBBCDField;
//    IBQ_SID_PedidoODIRTOTDESPESAS: TIBBCDField;
//    IBQ_SID_PedidoODIRTOTNOTA: TIBBCDField;
//    IBQ_SID_PedidoODIRTOTISS: TIBBCDField;
//    IBQ_SID_PedidoODIROBSERVACAO: TIBStringField;
//    IBQ_SID_PedidoODIRVALIDADEPEDIDO: TDateField;
//    IBQ_SID_PedidoODIROBSINTERNA: TIBStringField;
//    IBQ_SID_PedidoODIRCONTRIBUINTE: TIBStringField;
//    IBQ_SID_PedidoODIRCONFERENCIA: TIBStringField;
//    IBQ_SID_PedidoODIRTOTVALORPAGO: TIBBCDField;
//    IBQ_SID_PedidoODIRCONVENIADO: TIBStringField;
//    IBQ_SID_PedidoODIRENDERECOCONVENIO: TIBStringField;
//    IBQ_SID_PedidoODIRCODCOMPROVANTEPED: TIBStringField;
//    IBQ_SID_PedidoODIRORCAMENTOSN: TIBStringField;
//    IBQ_SID_PedidoODIRMOSTRASUBUN_SN: TIBStringField;
//    IBQ_SID_PedidoODIRPLACA: TIBStringField;
//    IBQ_SID_PedidoODIRPLACAESTADO: TIBStringField;
//    IBQ_SID_PedidoODIRTOTBASEPISCOFINS: TIBBCDField;
//    IBQ_SID_PedidoODIRTOTPIS: TIBBCDField;
//    IBQ_SID_PedidoODIRTOTCOFINS: TIBBCDField;
//    IBQ_SID_PedidoODIRENTREGASEQUENCIA: TIntegerField;
//    IBQ_SID_PedidoODIRRSICMSN: TIBStringField;
//    IBQ_SID_PedidoODIRTOTDESCONTORS: TIBBCDField;
//    IBQ_SID_PedidoODIRCODROTEIROMOVIM: TIBStringField;
//    IBQ_SID_PedidoODIRSIMPLESESTADUAL: TIBStringField;
//    IBQ_SID_PedidoODIRISENTOPISCOFINS: TIBStringField;
//    IBQ_SID_PedidoODIRTRANVOLUMESPESO: TIntegerField;
//    IBQ_SID_PedidoODIRPEDIDOFOIPESADOSN: TIBStringField;
//    IBQ_SID_PedidoODIRCODPEDIDOORIGEM: TIBStringField;
//    IBQ_SID_PedidoODIRECOMMERCE_TIPO_PED: TIntegerField;
//    IBQ_SID_PedidoODIRUFEMBARQ: TIBStringField;
//    IBQ_SID_PedidoODIRLOCEMBARQ: TIBStringField;
//    IBQ_SID_PedidoODIRDESP_VALDESPESASOUTROS: TIBBCDField;
//    IBQ_SID_PedidoODIRDESP_VALCUSTOBOLETOBANCO: TIBBCDField;
//    IBQ_SID_PedidoODIRDESP_PERACRECIMOCONDPGTO: TIBBCDField;
//    IBQ_SID_PedidoODIRDESP_VALACRECIMOCONDPGTO: TIBBCDField;
//    IBQ_SID_PedidoODIRPERDESCONTOCONDPGTO: TIBBCDField;
//    IBQ_SID_PedidoODIRCODVENDEDOR4: TIBStringField;
//    IBQ_SID_PedidoODIRCODVENDEDOR5: TIBStringField;
//    IBQ_SID_PedidoODIRTOTDESCONTOSUFRAMA: TIBBCDField;
//    IBQ_SID_PedidoODIRDESCONTAICMSPRO_SN: TIBStringField;
//    IBQ_SID_PedidoODIRCODFILIALORIGEM: TIBStringField;
//    IBQ_SID_PedidoODIRSOMOU_FRETE_SN: TIBStringField;
//    IBQ_SID_PedidoODIRTRANPESOCUBADO: TIBBCDField;
//    IBQ_SID_PedidoODIRTRANMODAL_FRETE: TIntegerField;
//    IBQ_SID_PedidoODIRTOT_RET_PIS: TIBBCDField;
//    IBQ_SID_PedidoODIRTOT_RET_COFINS: TIBBCDField;
//    IBQ_SID_PedidoODIRCODPEDIDO_NAOATEND: TIBStringField;
//    IBQ_SID_PedidoODIRINDPRES: TSmallintField;
//    IBQ_SID_PedidoODIRCONSUMIDOR_FINAL: TIntegerField;
//    IBQ_SID_PedidoODIRNFCE_SN: TIBStringField;
//    IBQ_SID_PedidoODIRTOTICMS_DIFERIDO: TIBBCDField;
//    IBQ_SID_PedidoODIRTOTICMS_BRUTO: TIBBCDField;
//    IBQ_SID_PedidoODIRTOTICM: TIBBCDField;
//    IBQ_SID_PedidoODIRTOTBASEICMS_DESONERADO: TIBBCDField;
//    IBQ_SID_PedidoODIRTOTICMS_DESONERADO: TIBBCDField;
//    IBQ_SID_PedidoItODIR: TIBQuery;
//    IBU_SID_PedidoItODIR: TIBUpdateSQL;
//    IBQ_SID_PedidoItODIRCHAVEPEDIDO: TIBStringField;
//    IBQ_SID_PedidoItODIRCODPEDIDO: TIBStringField;
//    IBQ_SID_PedidoItODIRCODPRODUTO: TIBStringField;
//    IBQ_SID_PedidoItODIRSOMOUESTOQUE: TIBStringField;
//    IBQ_SID_PedidoItODIRUNIDADEESTOQUE: TIntegerField;
//    IBQ_SID_PedidoItODIRQUANTPEDIDA: TIBBCDField;
//    IBQ_SID_PedidoItODIRQUANTATENDIDA: TIBBCDField;
//    IBQ_SID_PedidoItODIRQUANTPENDENTE: TIBBCDField;
//    IBQ_SID_PedidoItODIRPRECO: TIBBCDField;
//    IBQ_SID_PedidoItODIRCODLISTA: TIBStringField;
//    IBQ_SID_PedidoItODIRALIQIPI: TIBBCDField;
//    IBQ_SID_PedidoItODIRIPIPERCOUVALOR: TIBStringField;
//    IBQ_SID_PedidoItODIRALIQICM: TIBBCDField;
//    IBQ_SID_PedidoItODIRALIQICMREDUCAO: TIBBCDField;
//    IBQ_SID_PedidoItODIRALIQISS: TIBBCDField;
//    IBQ_SID_PedidoItODIRSUBSTVALPER: TIBStringField;
//    IBQ_SID_PedidoItODIRSUBSTMARGEM: TIBBCDField;
//    IBQ_SID_PedidoItODIRSUBSTALIQ: TIBBCDField;
//    IBQ_SID_PedidoItODIRDESCONTO1: TIBBCDField;
//    IBQ_SID_PedidoItODIRDESCONTO2: TIBBCDField;
//    IBQ_SID_PedidoItODIRDESCONTO3: TIBBCDField;
//    IBQ_SID_PedidoItODIRDESCONTO4: TIBBCDField;
//    IBQ_SID_PedidoItODIRDESCONTOCALC: TIBBCDField;
//    IBQ_SID_PedidoItODIRVALBRUTO: TIBBCDField;
//    IBQ_SID_PedidoItODIRVALDESCITEM: TIBBCDField;
//    IBQ_SID_PedidoItODIRVALIPI: TIBBCDField;
//    IBQ_SID_PedidoItODIRVALSUBSTITUICAO: TIBBCDField;
//    IBQ_SID_PedidoItODIRVALTOTAL: TIBBCDField;
//    IBQ_SID_PedidoItODIRVALBASEICM: TIBBCDField;
//    IBQ_SID_PedidoItODIRVALBASESUBST: TIBBCDField;
//    IBQ_SID_PedidoItODIRVALISS: TIBBCDField;
//    IBQ_SID_PedidoItODIRCOMISSAO1ALTERA: TIBStringField;
//    IBQ_SID_PedidoItODIRCOMISSAO2ALTERA: TIBStringField;
//    IBQ_SID_PedidoItODIRCOMISSAO3ALTERA: TIBStringField;
//    IBQ_SID_PedidoItODIRCOMISSAO1PERC: TIBBCDField;
//    IBQ_SID_PedidoItODIRCOMISSAO2PERC: TIBBCDField;
//    IBQ_SID_PedidoItODIRCOMISSAO3PERC: TIBBCDField;
//    IBQ_SID_PedidoItODIRCODICMPED: TIBStringField;
//    IBQ_SID_PedidoItODIRVALBASEIPI: TIBBCDField;
//    IBQ_SID_PedidoItODIRDATAENTREGA: TDateField;
//    IBQ_SID_PedidoItODIRORDEMCOMPRA: TIBStringField;
//    IBQ_SID_PedidoItODIRPRECOORIGEM: TIBBCDField;
//    IBQ_SID_PedidoItODIRCODFISCALPRO: TIBStringField;
//    IBQ_SID_PedidoItODIRSEQUENCIADOPRODUTO: TIntegerField;
//    IBQ_SID_PedidoItODIRMOMENTOCUSTOMEDIO: TIBBCDField;
//    IBQ_SID_PedidoItODIRMOMENTOPRECOBRUTO: TIBBCDField;
//    IBQ_SID_PedidoItODIRMOMENTOPRECOLIQUIDO: TIBBCDField;
//    IBQ_SID_PedidoItODIRVALBASEPISCOFINS: TIBBCDField;
//    IBQ_SID_PedidoItODIRALIQPIS: TIBBCDField;
//    IBQ_SID_PedidoItODIRALIQCOFINS: TIBBCDField;
//    IBQ_SID_PedidoItODIRVALPIS: TIBBCDField;
//    IBQ_SID_PedidoItODIRVALCOFINS: TIBBCDField;
//    IBQ_SID_PedidoItODIRVALDESCONTORS: TIBBCDField;
//    IBQ_SID_PedidoItODIRVALFRETE: TIBBCDField;
//    IBQ_SID_PedidoItODIRVALDESPESAS: TIBBCDField;
//    IBQ_SID_PedidoItODIRSUBSTDESCONTO: TIBBCDField;
//    IBQ_SID_PedidoItODIRALIQREPASSE: TIBBCDField;
//    IBQ_SID_PedidoItODIRVALREPASSE: TIBBCDField;
//    IBQ_SID_PedidoItODIRVALISENTOICM: TIBBCDField;
//    IBQ_SID_PedidoItODIRVALOUTROSICM: TIBBCDField;
//    IBQ_SID_PedidoItODIRVALISENTOIPI: TIBBCDField;
//    IBQ_SID_PedidoItODIRVALOUTROSIPI: TIBBCDField;
//    IBQ_SID_PedidoItODIRCST_ICMS: TIBStringField;
//    IBQ_SID_PedidoItODIRSUBSTITUICAOSN: TIBStringField;
//    IBQ_SID_PedidoItODIROPERACAOCREDEBICM: TIBStringField;
//    IBQ_SID_PedidoItODIROPERACAOCREDEBIPI: TIBStringField;
//    IBQ_SID_PedidoItODIRSOMAIPIBASEICM: TIBStringField;
//    IBQ_SID_PedidoItODIRSOMAFRETEBASEICM: TIBStringField;
//    IBQ_SID_PedidoItODIRSOMADESPESABASEICM: TIBStringField;
//    IBQ_SID_PedidoItODIRSOMAIPIBASESUBST: TIBStringField;
//    IBQ_SID_PedidoItODIRSOMAFRETEBASEIPI: TIBStringField;
//    IBQ_SID_PedidoItODIRSOMADESPESABASEIPI: TIBStringField;
//    IBQ_SID_PedidoItODIRFOIPESADOSN: TIBStringField;
//    IBQ_SID_PedidoItODIRVALPECAS: TIntegerField;
//    IBQ_SID_PedidoItODIRPRECOMAXCONSUMIDOR: TIBBCDField;
//    IBQ_SID_PedidoItODIRSOMAFRETEBASEST: TIBStringField;
//    IBQ_SID_PedidoItODIRSOMADESPESABASEST: TIBStringField;
//    IBQ_SID_PedidoItODIRALIQICMORIGEM: TIBBCDField;
//    IBQ_SID_PedidoItODIRCODKIT: TIntegerField;
//    IBQ_SID_PedidoItODIRCODAGRUPACARGA: TIntegerField;
//    IBQ_SID_PedidoItODIRSOMASTBASEPISCOFINS: TIBStringField;
//    IBQ_SID_PedidoItODIRCST_IPI: TIBStringField;
//    IBQ_SID_PedidoItODIRCST_PIS: TIBStringField;
//    IBQ_SID_PedidoItODIRCST_COFINS: TIBStringField;
//    IBQ_SID_PedidoItODIRVALREDUCAOICM: TIBBCDField;
//    IBQ_SID_PedidoItODIRCOMISSAO4ALTERA: TIBStringField;
//    IBQ_SID_PedidoItODIRCOMISSAO5ALTERA: TIBStringField;
//    IBQ_SID_PedidoItODIRCOMISSAO4PERC: TIBBCDField;
//    IBQ_SID_PedidoItODIRCOMISSAO5PERC: TIBBCDField;
//    IBQ_SID_PedidoItODIRVALDESCONTOSUFRAMA: TIBBCDField;
//    IBQ_SID_PedidoItODIRUSOU_MULTIPLO_SN: TIBStringField;
//    IBQ_SID_PedidoItODIRALIQ_RET_PIS: TIBBCDField;
//    IBQ_SID_PedidoItODIRALIQ_RET_COFINS: TIBBCDField;
//    IBQ_SID_PedidoItODIRVAL_RET_PIS: TIBBCDField;
//    IBQ_SID_PedidoItODIRVAL_RET_COFINS: TIBBCDField;
//    IBQ_SID_PedidoItODIRPISCOFPERCOUVALOR: TIBStringField;
//    IBQ_SID_PedidoItODIRPERC_DIFERIDO: TIBBCDField;
//    IBQ_SID_PedidoItODIRVALICMS_DIFERIDO: TIBBCDField;
//    IBQ_SID_PedidoItODIRVALICMS_BRUTO: TIBBCDField;
//    IBQ_SID_PedidoItODIRVALBASEICMS_DESONERADO: TIBBCDField;
//    IBQ_SID_PedidoItODIRVALICMS_DESONERADO: TIBBCDField;
//    IBQ_SID_PedidoItODIRMOTDESICMS: TSmallintField;
    procedure CDS_Transf_CdAfterScroll(DataSet: TDataSet);

    // Odir
    Procedure FechaTudoCentralTrocas;

    Procedure CriaQueryIB(sDataBase, sTransaction: String; Var IBQ_Free: TIBQuery; bMatriz, bCriaIBQ: Boolean);
    procedure CDS_ReposicaoDocsAfterScroll(DataSet: TDataSet);
        // sDataBase    = Database a Conectar
        // sTransaction = Transaction a Conectar
        // IBQ_Free     = Nome do TIBQuery a Destruir e Reconstruir
        // bMatriz      = Se Conexão é Matriz (Não Gera Sql Automaticamente)
        // bCriaIBQ     = Se Destruir e Reconstruir IBQuery

    // Odir

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCentralTrocas: TDMCentralTrocas;

implementation

uses UDMBelShop, UDMConexoes, UFrmCentralTrocas, JvValidateEdit;

{$R *.dfm}

// =============================================================================
// Odir - INICIO ===============================================================
// =============================================================================

Procedure TDMCentralTrocas.CriaQueryIB(sDataBase, sTransaction: String; Var IBQ_Free: TIBQuery; bMatriz, bCriaIBQ: Boolean);
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
  End;
End; // Atualiza Conexao TIBQuery >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Diversos - Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMCentralTrocas.FechaTudoCentralTrocas;
Var
  i: Integer;
Begin

  // Fecha Componentes DMConciliacao =====================================
  For i:=0 to DMCentralTrocas.ComponentCount-1 do
  Begin
    If DMCentralTrocas.Components[i] is TClientDataSet Then
     If (DMCentralTrocas.Components[i] as TClientDataSet).Active Then
      (DMCentralTrocas.Components[i] as TClientDataSet).Close;
  End; // For i:=0 to DMCentralTrocas.ComponentCount-1 do
end; // Diversos - Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TDMCentralTrocas.CDS_Transf_CdAfterScroll(DataSet: TDataSet);
begin
 If Not CDS_Transf_Cd.IsEmpty Then
 Begin
   CDS_NotasEntrada.Close;
   SDS_NotasEntrada.Params.ParamByName('NUMERO').Value :=CDS_Transf_CdNUM_SOLICITACAO.AsInteger;
   SDS_NotasEntrada.Params.ParamByName('PRODUTO').Value:=CDS_Transf_CdCODPRODUTO.AsString;
   SDS_NotasEntrada.Params.ParamByName('Qtd').Value    :=CDS_Transf_CdQUANT_CD.AsCurrency;
   SDS_NotasEntrada.Params.ParamByName('NumSeq').Value :=CDS_Transf_CdNUM_SEQ.AsCurrency;
   CDS_NotasEntrada.OPen;
 End; // If Not CDS_Transf_Cd.IsEmpty Then
end;

// =============================================================================
// Odir - FIM ==================================================================
// =============================================================================

procedure TDMCentralTrocas.CDS_ReposicaoDocsAfterScroll(DataSet: TDataSet);
Var
  iQtdI, iQtdF: Integer;
begin
  If FrmCentralTrocas.Cbx_ReposLojasCons.ItemIndex=0 Then // Maior que
  Begin
    iQtdI:=FrmCentralTrocas.EdtReposLojasQtdInicio.AsInteger;
    iQtdF:=99999999;
  End;

  If FrmCentralTrocas.Cbx_ReposLojasCons.ItemIndex=1 Then // Menor que
  Begin
    iQtdI:=-1;
    iQtdF:=FrmCentralTrocas.EdtReposLojasQtdInicio.AsInteger;
  End;

  If FrmCentralTrocas.Cbx_ReposLojasCons.ItemIndex=2 Then // Intervalo de
  Begin
    iQtdI:=FrmCentralTrocas.EdtReposLojasQtdInicio.AsInteger-1;
    iQtdF:=FrmCentralTrocas.EdtReposLojasQtdFim.AsInteger+1;
  End;

  If FrmCentralTrocas.Cbx_ReposLojasCons.ItemIndex=3 Then // TODAS
  Begin
    iQtdI:=-1;
    iQtdF:=99999999;
  End;

  CDS_ReposicaoTransf.Close;
  SDS_ReposicaoTransf.Params.ParamByName('sDta').AsDate:=FrmCentralTrocas.DtaEdt_ReposLojas.Date;
  SDS_ReposicaoTransf.Params.ParamByName('Doc').AsInteger:=CDS_ReposicaoDocsNUM_DOCTO.AsInteger;
  SDS_ReposicaoTransf.Params.ParamByName('QtdInicio').AsInteger:=iQtdI;
  SDS_ReposicaoTransf.Params.ParamByName('QtdFim').AsInteger:=iQtdF;
  CDS_ReposicaoTransf.Open;

  CDS_ReposicaoDocs.Edit;
  CDS_ReposicaoDocsNUM_PRODUTOS.AsInteger:=CDS_ReposicaoTransf.RecordCount;
  CDS_ReposicaoDocs.Post;
end;

end.
