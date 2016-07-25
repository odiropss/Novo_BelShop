unit UDMSalao;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, DBXpress, StdCtrls;
//  Último: StdCtrls;

type
  TDMSalao = class(TDataModule)
    SDS_Profissionais: TSQLDataSet;
    DSP_Profissionais: TDataSetProvider;
    CDS_Profissionais: TClientDataSet;
    DS_Profissionais: TDataSource;
    CDS_ProfissionaisCOD_LOJA: TStringField;
    CDS_ProfissionaisCOD_PROFISSIONAL: TStringField;
    CDS_ProfissionaisDES_PROFISSIONAL: TStringField;
    CDS_ProfissionaisDES_APELIDO: TStringField;
    CDS_ProfissionaisNUM_CPF: TStringField;
    CDS_ProfissionaisNUM_RG: TStringField;
    CDS_ProfissionaisNUM_ALVARA_LOCAL: TStringField;
    CDS_ProfissionaisBLOB_FOTO: TBlobField;
    CDS_ProfissionaisNUM_CEP: TStringField;
    CDS_ProfissionaisIND_TAXA_SINDICATO: TStringField;
    CDS_ProfissionaisVLR_TAXA_SINDICATO: TFMTBCDField;
    CDS_ProfissionaisCOD_COMPRV_SINDICATO: TStringField;
    CDS_ProfissionaisIND_TAXA_NAOSOCIO: TStringField;
    CDS_ProfissionaisVLR_TAXA_NAOSOCIO: TFMTBCDField;
    CDS_ProfissionaisCOD_COMPRV_NAOSOCIO: TStringField;
    CDS_ProfissionaisNUM_INSS: TStringField;
    CDS_ProfissionaisPER_INSS: TFMTBCDField;
    CDS_ProfissionaisCOD_COMPRV_INSS: TStringField;
    CDS_ProfissionaisNUM_TECBIZ: TStringField;
    CDS_ProfissionaisNUM_MATRICULA_TECBIZ: TStringField;
    CDS_ProfissionaisCOD_COMPRV_TECBIZ: TStringField;
    CDS_ProfissionaisCOD_PLANO_SAUDE: TIntegerField;
    CDS_ProfissionaisVLR_PLANO_SAUDE: TFMTBCDField;
    CDS_ProfissionaisCOD_COMPRV_PL_SAUDE: TStringField;
    CDS_ProfissionaisNUM_BANCO: TIntegerField;
    CDS_ProfissionaisDES_BANCO: TStringField;
    CDS_ProfissionaisNUM_AGENCIA: TStringField;
    CDS_ProfissionaisDES_AGENCIA: TStringField;
    CDS_ProfissionaisNUM_CONTA: TStringField;
    CDS_ProfissionaisNUM_CONTRATO: TIntegerField;
    CDS_ProfissionaisNUM_MESES_CONTRATO: TIntegerField;
    CDS_ProfissionaisDTA_INI_CONTRATO: TDateField;
    CDS_ProfissionaisDTA_FIM_CONTRATO: TDateField;
    CDS_ProfissionaisNUM_SINDICATO: TStringField;
    CDS_ProfissionaisBLOB_CONTRATO_MOVEIS: TMemoField;
    CDS_ProfissionaisIND_LIBERADO: TStringField;
    CDS_ProfissionaisBLOB_RENOVACOES: TMemoField;
    CDS_ProfissionaisNUM_CONTRATO_BENS: TIntegerField;
    CDS_ProfissionaisLOC_W_CONTRATO: TStringField;
    CDS_ProfissionaisLOC_W_ALTER_CONTRATUAL: TStringField;
    CDS_ProfissionaisLOC_W_LOC_BENS: TStringField;
    CDS_ProfissionaisVLR_PAGTO_MINIMO: TFMTBCDField;
    CDS_ProfissionaisVLR_CAUCAO: TFMTBCDField;
    CDS_ProfissionaisPER_COMISSAO: TFMTBCDField;
    CDS_ProfissionaisPER_EXTRA_ANO: TFMTBCDField;
    CDS_ProfissionaisDTA_PERIODO_INI_CAL: TDateField;
    CDS_ProfissionaisDTA_PERIODO_FIM_CAL: TDateField;
    CDS_ProfissionaisIND_ATIVO: TStringField;
    CDS_ProfissionaisUSU_INCLUI: TIntegerField;
    CDS_ProfissionaisDTA_INCLUI: TSQLTimeStampField;
    CDS_ProfissionaisUSU_ALTERA: TIntegerField;
    CDS_ProfissionaisDTA_ALTERA: TSQLTimeStampField;
    SDS_Habilidades: TSQLDataSet;
    DSP_Habilidades: TDataSetProvider;
    CDS_Habilidades: TClientDataSet;
    DS_Habilidades: TDataSource;
    SDS_Servicos: TSQLDataSet;
    DSP_Servicos: TDataSetProvider;
    CDS_Servicos: TClientDataSet;
    DS_Servicos: TDataSource;
    CDS_HabilidadesVLR_HABSERV: TFMTBCDField;
    CDS_HabilidadesIND_ATIVO: TStringField;
    CDS_HabilidadesCOD_HAB: TIntegerField;
    CDS_HabilidadesDES_HABILIDADE: TStringField;
    CDS_ServicosCOD_SERVICO: TIntegerField;
    CDS_ServicosDES_SERVICO: TStringField;
    CDS_ServicosVLR_HABSERV: TFMTBCDField;
    CDS_ServicosIND_ATIVO: TStringField;
    CDS_ServicosCOD_SIDICOM: TStringField;
    CDS_HabilidadesCOD_SIDICOM: TStringField;
    CDS_ProfissionaisDES_ENDERECO: TStringField;
    CDS_ProfissionaisNUM_ENDERECO: TStringField;
    CDS_ProfissionaisDES_BAIRRO: TStringField;
    CDS_ProfissionaisBLOB_OBS: TMemoField;
    CDS_ProfissionaisCPL_ENDERECO: TStringField;
    CDS_ProfissionaisCOD_MUNICIPIO_IBGE: TIntegerField;
    CDS_ProfissionaisDES_MUNICIPIO: TStringField;
    CDS_ProfissionaisCOD_ESTADO_IBGE: TIntegerField;
    CDS_ProfissionaisDES_UF: TStringField;
    CDS_ProfissionaisDES_ESTADO: TStringField;
    CDS_V_RetornoIBGE: TClientDataSet;
    CDS_V_RetornoIBGECEP: TStringField;
    CDS_V_RetornoIBGEEndereco: TStringField;
    CDS_V_RetornoIBGEBairro: TStringField;
    CDS_V_RetornoIBGEMunicipio: TStringField;
    CDS_V_RetornoIBGEUF: TStringField;
    CDS_V_RetornoIBGEUF_IBGE: TIntegerField;
    CDS_V_RetornoIBGEMunicipio_IBGE: TIntegerField;
    DS_V_RetornoIBGE: TDataSource;
    CDS_ProfissionaisDTA_NASCIMENTO: TDateField;
    CDS_V_ProfFones: TClientDataSet;
    DS_V_ProfFones: TDataSource;
    CDS_V_ProfFonesDes_Localizacao: TStringField;
    CDS_V_ProfFonesDes_DDD: TStringField;
    CDS_V_ProfFonesDes_Fone: TStringField;
    CDS_V_ProfEmail: TClientDataSet;
    CDS_V_ProfEmailDes_Localizacao: TStringField;
    CDS_V_ProfEmailDes_Email: TStringField;
    DS_V_ProfEmail: TDataSource;
    CDS_ProfissionaisBLOB_LOCALIZACOES: TMemoField;
    CDS_V_Dependentes: TClientDataSet;
    DS_V_Dependentes: TDataSource;
    CDS_V_DependentesDes_Dependente: TStringField;
    CDS_V_DependentesDes_Parentesco: TStringField;
    CDS_V_DependentesDta_Nascimento: TDateField;
    CDS_ProfissionaisPER_COMISSAO_SUPERVISOR: TFMTBCDField;
    CDS_ProfissionaisDIA_PERIODO_INI_COM: TStringField;
    CDS_ProfissionaisDIA_PERIODO_FIM_COM: TStringField;
    SDS_HabilidadesProf: TSQLDataSet;
    DSP_HabilidadesProf: TDataSetProvider;
    CDS_HabilidadesProf: TClientDataSet;
    DS_HabilidadesProf: TDataSource;
    SDS_ServicosProf: TSQLDataSet;
    DSP_ServicosProf: TDataSetProvider;
    CDS_ServicosProf: TClientDataSet;
    DS_ServicosProf: TDataSource;
    CDS_HabilidadesProfHABILIDADE: TStringField;
    CDS_HabilidadesProfPRECO: TFMTBCDField;
    CDS_HabilidadesProfPER_COMISSAO: TFMTBCDField;
    CDS_HabilidadesProfCOD_HABILIDADE: TIntegerField;
    CDS_HabilidadesProfATIVO: TStringField;
    CDS_ServicosProfSERVICO: TStringField;
    CDS_ServicosProfPRECO: TFMTBCDField;
    CDS_ServicosProfPER_COMISSAO: TFMTBCDField;
    CDS_ServicosProfCOD_SERVICO: TIntegerField;
    CDS_HabilidadesProfCOD_LOJA: TStringField;
    CDS_HabilidadesProfCOD_PROFISSIONAL: TStringField;
    CDS_ServicosProfIND_ATIVO: TStringField;
    CDS_ProfissionaisPER_LOCADOR: TFMTBCDField;
    CDS_ProfissionaisIND_CAD_SIDICOM: TStringField;
    CDS_ProfissionaisDTA_INI_RENOVACAO: TDateField;
    CDS_ProfissionaisDTA_FIM_RENOVACAO: TDateField;
    CDS_ProfissionaisIND_SID_NIVELTABELA: TSmallintField;
    CDS_ProfissionaisTIP_SID_COMISSAO: TStringField;
    CDS_ProfissionaisIND_SID_TABELAPROC: TStringField;
    CDS_ProfissionaisVLR_SID_QUOTA: TFMTBCDField;
    CDS_SID_Supervisor: TClientDataSet;
    DS_SID_Supervisor: TDataSource;
    CDS_SID_Vendedores: TClientDataSet;
    DS_SID_Vendedores: TDataSource;
    SDS_SID_Supervisor: TSQLDataSet;
    DSP_SID_Supervisor: TDataSetProvider;
    CDS_SID_SupervisorCODIGO: TStringField;
    CDS_SID_SupervisorSUPERVIDOR: TStringField;
    SDS_SID_Vendedores: TSQLDataSet;
    DSP_SID_Vendedores: TDataSetProvider;
    CDS_SID_VendedoresCODIGO: TStringField;
    CDS_SID_VendedoresVENDEDOR: TStringField;
    CDS_ProfissionaisTIP_PESSOA: TStringField;
    CDS_ValesProfissionais: TClientDataSet;
    DS_ValesProfissionais: TDataSource;
    SDS_ValesProfissionais: TSQLDataSet;
    DSP_ValesProfissionais: TDataSetProvider;
    CDS_Vales: TClientDataSet;
    CDS_ValesNUM_SEQ: TIntegerField;
    CDS_ValesTP_PESSOA: TIntegerField;
    CDS_ValesCOD_LOJA: TStringField;
    CDS_ValesCOD_PESSOA: TIntegerField;
    CDS_ValesNUM_DOCTO: TIntegerField;
    CDS_ValesTOT_PRESTACAO: TIntegerField;
    CDS_ValesVLR_ORIGINAL: TFMTBCDField;
    CDS_ValesNUM_PRESTACAO: TIntegerField;
    CDS_ValesDTA_VENCIMENTO: TDateField;
    CDS_ValesVLR_PRESTACAO: TFMTBCDField;
    CDS_ValesVLR_DESCONTO: TFMTBCDField;
    CDS_ValesVLR_ACRESCIMOS: TFMTBCDField;
    CDS_ValesVLR_APAGAR: TFMTBCDField;
    CDS_ValesVLR_PAGO: TFMTBCDField;
    CDS_ValesNUM_DOCTO_PAGTO: TIntegerField;
    CDS_ValesDTA_PAGAMENTO: TDateField;
    CDS_ValesUSU_INCLUI: TIntegerField;
    CDS_ValesDTA_INCLUI: TSQLTimeStampField;
    CDS_ValesUSU_ALTERA: TIntegerField;
    CDS_ValesDTA_ALTERA: TSQLTimeStampField;
    DS_Vales: TDataSource;
    SDS_Vales: TSQLDataSet;
    DSP_Vales: TDataSetProvider;
    CDS_ValesProfissionaisCOD_PROFISSIONAL: TStringField;
    CDS_ValesProfissionaisDES_PROFISSIONAL: TStringField;
    CDS_ValesProfissionaisNUM_DOCTO: TIntegerField;
    CDS_ValesProfissionaisTOT_PRESTACAO: TIntegerField;
    CDS_ValesProfissionaisVLR_ORIGINAL: TFMTBCDField;
    CDS_ValesProfissionaisCOD_LOJA: TStringField;
    CDS_ValesProfissionaisIND_ATIVO: TStringField;
    CDS_ValesProfissionaisNUM_PRAZO: TIntegerField;
    CDS_ValesProfissionaisDTA_PRIM_VENC: TDateField;
    CDS_ValesNUM_PRAZO: TIntegerField;
    CDS_ValesDTA_PRIM_VENC: TDateField;
    CDS_ValesProfissionaisCHAVE: TStringField;
    CDS_MetasProfissionais: TClientDataSet;
    DS_MetasProfissionais: TDataSource;
    SDS_MetasProfissionais: TSQLDataSet;
    DSP_MetasProfissionais: TDataSetProvider;
    CDS_MetasHabilidades: TClientDataSet;
    DS_MetasHabilidades: TDataSource;
    SDS_MetasHabilidades: TSQLDataSet;
    DSP_MetasHabilidades: TDataSetProvider;
    CDS_MetasProfissionaisCOD_PROFISSIONAL: TStringField;
    CDS_MetasProfissionaisDES_PROFISSIONAL: TStringField;
    CDS_MetasHabilidadesCOD_HABILIDADE: TIntegerField;
    CDS_MetasHabilidadesDES_HABSERV: TStringField;
    CDS_MetasProf: TClientDataSet;
    DS_MetasProf: TDataSource;
    SDS_MetasProf: TSQLDataSet;
    DSP_MetasProf: TDataSetProvider;
    CDS_MetasProfCOD_LOJA: TStringField;
    CDS_MetasProfCOD_PROFISSIONAL: TStringField;
    CDS_MetasProfCOD_HABILIDADE: TIntegerField;
    CDS_MetasProfDES_ANO: TIntegerField;
    CDS_MetasProfOBJ_MES01: TFMTBCDField;
    CDS_MetasProfOBJ_MES02: TFMTBCDField;
    CDS_MetasProfOBJ_MES03: TFMTBCDField;
    CDS_MetasProfOBJ_MES04: TFMTBCDField;
    CDS_MetasProfOBJ_MES05: TFMTBCDField;
    CDS_MetasProfOBJ_MES06: TFMTBCDField;
    CDS_MetasProfOBJ_MES07: TFMTBCDField;
    CDS_MetasProfOBJ_MES08: TFMTBCDField;
    CDS_MetasProfOBJ_MES09: TFMTBCDField;
    CDS_MetasProfOBJ_MES10: TFMTBCDField;
    CDS_MetasProfOBJ_MES11: TFMTBCDField;
    CDS_MetasProfOBJ_MES12: TFMTBCDField;
    CDS_MetasProfUSU_INCLUI: TIntegerField;
    CDS_MetasProfDTA_INCLUI: TSQLTimeStampField;
    CDS_MetasProfUSU_ALTERA: TIntegerField;
    CDS_MetasProfDTA_ALTERA: TSQLTimeStampField;
    CDS_MetasProfissionaisCOD_LOJA: TStringField;
    CDS_MetasProfPER_META_ANO: TFMTBCDField;
    CDS_MetasProfPER_OBJ_MES01: TFMTBCDField;
    CDS_MetasProfPER_OBJ_MES02: TFMTBCDField;
    CDS_MetasProfPER_OBJ_MES03: TFMTBCDField;
    CDS_MetasProfPER_OBJ_MES04: TFMTBCDField;
    CDS_MetasProfPER_OBJ_MES05: TFMTBCDField;
    CDS_MetasProfPER_OBJ_MES06: TFMTBCDField;
    CDS_MetasProfPER_OBJ_MES07: TFMTBCDField;
    CDS_MetasProfPER_OBJ_MES08: TFMTBCDField;
    CDS_MetasProfPER_OBJ_MES09: TFMTBCDField;
    CDS_MetasProfPER_OBJ_MES10: TFMTBCDField;
    CDS_MetasProfPER_OBJ_MES11: TFMTBCDField;
    CDS_MetasProfPER_OBJ_MES12: TFMTBCDField;
    CDS_V_PagtoProf: TClientDataSet;
    DS_V_PagtoProf: TDataSource;
    CDS_V_PagtoProfCODIGO: TStringField;
    CDS_V_PagtoProfNOME: TStringField;
    CDS_V_PagtoProfAPELIDO: TStringField;
    CDS_V_PagtoProfDIA_INICIO: TStringField;
    CDS_V_PagtoProfDIA_FINAL: TStringField;
    CDS_V_PagtoProfINI_ULT_CALCULO: TDateField;
    CDS_V_PagtoProfFIM_ULT_CALCULO: TDateField;
    CDS_V_PagtoProfDTA_INI_CALCULO: TStringField;
    CDS_V_PagtoProfDTA_FIM_CALCULO: TStringField;
    CDS_V_PagtoProfCALCULAR: TStringField;
    CDS_V_PagtoProfLOJA: TStringField;
    CDS_V_PagtosVendas: TClientDataSet;
    DS_V_PagtosVendas: TDataSource;
    CDS_V_PagtosVendasCOD_PROF: TStringField;
    CDS_V_PagtosVendasDES_PROFISSIONAL: TStringField;
    CDS_V_PagtosVendasVLR_TOT_COMISSAO: TFMTBCDField;
    CDS_V_PagtosVendasNUM_DOCTO: TStringField;
    CDS_V_PagtosVendasDTA_COMPROV: TDateField;
    CDS_V_PagtosVendasCOD_COMPROV: TStringField;
    CDS_V_PagtosVendasTIP_DOCTO: TStringField;
    CDS_V_PagtosVendasCOD_PRODUTO: TStringField;
    CDS_V_PagtosVendasQTD_SERVICO: TFMTBCDField;
    CDS_V_PagtosVendasVLR_TOTALITEM: TFMTBCDField;
    CDS_V_PagtosVendasPER_COMIS_GERAL: TFMTBCDField;
    CDS_V_PagtosVendasDES_HABILIDADE: TStringField;
    CDS_V_PagtosVendasPER_COMIS_HAB: TFMTBCDField;
    CDS_V_PagtosVendasDES_SERVICO: TStringField;
    CDS_V_PagtosVendasPER_COMIS_SERV: TFMTBCDField;
    CDS_V_PagtosVendasCOD_HABILIDADE: TIntegerField;
    CDS_V_PagtosVendasCOD_SERVICO: TIntegerField;
    CDS_V_PagtoProfSUPERVISOR: TStringField;
    CDS_V_PagtosVendasSINTETICO: TStringField;
    CDS_V_PagtoProfPER_COMIS_SUPER: TFMTBCDField;
    CDS_V_PagtosVendasINDEX: TIntegerField;
    CDS_V_PagtosVendasVLR_TOT_COMISSAO_SID: TFMTBCDField;
    CDS_V_PagtosVendasPER_COMIS_SID: TFMTBCDField;
    CDS_V_PagtosDebCred: TClientDataSet;
    CDS_V_PagtosDebCredCOD_PROF: TStringField;
    CDS_V_PagtosDebCredDES_PROFISSIONAL: TStringField;
    CDS_V_PagtosDebCredVLR_ORIGINAL: TFMTBCDField;
    CDS_V_PagtosDebCredVLR_PRESTACAO: TFMTBCDField;
    CDS_V_PagtosDebCredVLR_DESCONTO: TFMTBCDField;
    CDS_V_PagtosDebCredVLR_ACRESCIMO: TFMTBCDField;
    CDS_V_PagtosDebCredNUM_DOCTO: TStringField;
    CDS_V_PagtosDebCredDTA_PRIM_VENC: TDateField;
    CDS_V_PagtosDebCredSINTETICO: TStringField;
    CDS_V_PagtosDebCredINDEX: TIntegerField;
    DS_V_PagtosDebCred: TDataSource;
    CDS_V_PagtosDebCredDTA_VENCIMENTO: TDateField;
    CDS_V_PagtoProfVLR_SAL_MINIMO: TFMTBCDField;
    CDS_V_PagtosDebCredVLR_CREDITO: TFMTBCDField;
    CDS_V_PagtosDebCredVLR_DEBITO: TFMTBCDField;
    CDS_V_PagtosDebCredVLR_SALDO: TFMTBCDField;
    CDS_V_PagtosDebCredNUM_PRESTACOES: TStringField;
    CDS_V_PagtosDebCredNUM_PRESTACAO: TStringField;
    CDS_ValesIND_DEBCRED: TStringField;
    CDS_ProfissionaisIND_COBRA_INSS: TStringField;
    CDS_V_Inss: TClientDataSet;
    DS_V_Inss: TDataSource;
    CDS_V_InssLOJA: TStringField;
    CDS_V_InssCODIGO: TStringField;
    CDS_V_InssNOME: TStringField;
    CDS_V_InssAPELIDO: TStringField;
    CDS_V_InssNUM_INSS: TStringField;
    CDS_V_InssPER_INSS: TFMTBCDField;
    CDS_V_InssVLR_APAGAR: TFMTBCDField;
    CDS_V_InssNUM_SEQ: TIntegerField;
    CDS_V_InssPAGO: TStringField;
    CDS_V_InssDTA_VENCIMENTO: TDateField;
    CDS_V_PagtosDebCredNUM_SEQ: TIntegerField;
    CDS_V_PagtosDebCredTP_DOC: TIntegerField;
    CDS_V_PagtoProfPER_INSS: TFMTBCDField;
    SDS_PagtosPlan: TSQLDataSet;
    DSP_PagtosPlan: TDataSetProvider;
    CDS_PagtosPlan: TClientDataSet;
    DS_PagtosPlan: TDataSource;
     CDS_PagtosPlanNUM_PLANILHA: TIntegerField;
    CDS_PagtosPlanDES_PROFISSIONAL: TStringField;
    CDS_PagtosPlanFIM_CONTRATO: TDateField;
    CDS_PagtosPlanVLR_COMISSAO: TFMTBCDField;
    CDS_PagtosPlanVLR_PLANO_SAUDE: TFMTBCDField;
    CDS_PagtosPlanNUM_TECBIZ: TStringField;
    CDS_PagtosPlanVLR_TAXAS: TFMTBCDField;
    CDS_PagtosPlanVLR_VALES: TFMTBCDField;
    CDS_PagtosPlanVLR_INSS: TFMTBCDField;
    CDS_PagtosPlanNUM_INSS: TStringField;
    CDS_PagtosPlanPER_INSS: TFMTBCDField;
    CDS_PagtosPlanVLR_ARREDONDA: TFMTBCDField;
    CDS_PagtosPlanVLR_DEPOSITO: TFMTBCDField;
    CDS_PagtosPlanNUM_BANCO: TIntegerField;
    CDS_PagtosPlanDES_BANCO: TStringField;
    CDS_PagtosPlanNUM_AGENCIA: TStringField;
    CDS_PagtosPlanNUM_CONTA: TStringField;
    CDS_PagtosPlanORDEM: TIntegerField;
    CDS_PagtosPlanCOM_SALDO: TStringField;
    CDS_PagtosPlanVLR_TECBIZ: TFMTBCDField;
    SDS_PagtosDebCred: TSQLDataSet;
    DSP_PagtosDebCred: TDataSetProvider;
    CDS_PagtosDebCred: TClientDataSet;
    DS_PagtosDebCred: TDataSource;
    CDS_PagtosDebCredNUM_PLANILHA: TIntegerField;
    CDS_PagtosDebCredCOD_LOJA: TStringField;
    CDS_PagtosDebCredCOD_PROFISSIONAL: TStringField;
    CDS_PagtosDebCredDES_PROFISSIONAL: TStringField;
    CDS_PagtosDebCredVLR_CREDITOS: TFMTBCDField;
    CDS_PagtosDebCredVLR_DEBITOS: TFMTBCDField;
    CDS_PagtosDebCredVLR_SALDO: TFMTBCDField;
    CDS_PagtosDebCredNUM_DOCTO: TStringField;
    CDS_PagtosDebCredVLR_ORIGINAL: TFMTBCDField;
    CDS_PagtosDebCredNUM_PRESTACOES: TStringField;
    CDS_PagtosDebCredDTA_PRIM_VENC: TDateField;
    CDS_PagtosDebCredNUM_PRESTACAO: TStringField;
    CDS_PagtosDebCredDTA_VENCIMENTO: TDateField;
    CDS_PagtosDebCredVLR_PRESTACAO: TFMTBCDField;
    CDS_PagtosDebCredVLR_DESCONTO: TFMTBCDField;
    CDS_PagtosDebCredVLR_ACRESCIMOS: TFMTBCDField;
    CDS_PagtosDebCredNUM_SEQ: TIntegerField;
    CDS_PagtosDebCredSINTETICO: TStringField;
    CDS_PagtosDebCredIDX_INDEX: TIntegerField;
    CDS_PagtosDebCredTP_DOC: TIntegerField;
    SDS_PagtosVendas: TSQLDataSet;
    DSP_PagtosVendas: TDataSetProvider;
    CDS_PagtosVendas: TClientDataSet;
    DS_PagtosVendas: TDataSource;
    CDS_PagtosVendasNUM_PLANILHA: TIntegerField;
    CDS_PagtosVendasCOD_LOJA: TStringField;
    CDS_PagtosVendasCOD_PROFISSIONAL: TStringField;
    CDS_PagtosVendasDES_PROFISSIONAL: TStringField;
    CDS_PagtosVendasQTD_SERVICO: TFMTBCDField;
    CDS_PagtosVendasVLR_TOTALITEM: TFMTBCDField;
    CDS_PagtosVendasVLR_TOT_COMISSAO: TFMTBCDField;
    CDS_PagtosVendasVLR_TOT_COMISSAO_SID: TFMTBCDField;
    CDS_PagtosVendasPER_COMIS_SERV: TFMTBCDField;
    CDS_PagtosVendasPER_COMIS_HAB: TFMTBCDField;
    CDS_PagtosVendasPER_COMIS_GERAL: TFMTBCDField;
    CDS_PagtosVendasPER_COMIS_SID: TFMTBCDField;
    CDS_PagtosVendasNUM_DOCTO: TStringField;
    CDS_PagtosVendasDTA_COMPROV: TDateField;
    CDS_PagtosVendasCOD_COMPROV: TStringField;
    CDS_PagtosVendasTIP_DOCTO: TStringField;
    CDS_PagtosVendasCOD_PRODUTO: TStringField;
    CDS_PagtosVendasCOD_HABILIDADE: TIntegerField;
    CDS_PagtosVendasDES_HABILIDADE: TStringField;
    CDS_PagtosVendasCOD_SERVICO: TIntegerField;
    CDS_PagtosVendasDES_SERVICO: TStringField;
    CDS_PagtosVendasSINTETICO: TStringField;
    CDS_PagtosVendasINDEX: TIntegerField;
    CDS_V_PagtoProfNUM_TECBIZ: TStringField;
    CDS_V_PagtoProfNUM_INSS: TStringField;
    CDS_V_PagtoProfNUM_BANCO: TIntegerField;
    CDS_V_PagtoProfDES_BANCO: TStringField;
    CDS_V_PagtoProfNUM_AGENCIA: TStringField;
    CDS_V_PagtoProfDES_AGENCIA: TStringField;
    CDS_V_PagtoProfNUM_CONTA: TStringField;
    CDS_V_PagtoProfFIM_CONTRATO: TDateField;
    CDS_PagtosDebCredCODPROF: TStringField;
    CDS_V_PagtosDebCredCODPROF: TStringField;
    CDS_V_DependentesVlr_PlanoSaude: TCurrencyField;
    CDS_V_ManutPlSaude: TClientDataSet;
    CDS_V_ManutPlSaudeVlr_Titular: TCurrencyField;
    DS_V_ManutPlSaude: TDataSource;
    CDS_V_ManutPlSaudeCod_Plano: TIntegerField;
    CDS_V_ManutPlSaudeDes_Plano: TStringField;
    CDS_V_ManutPlSaudeAlterar: TStringField;
    CDS_V_ManutPlSaudeVlr_Dependente: TCurrencyField;
    CDS_V_DependentesNum_Seq: TIntegerField;
    CDS_V_DependentesInd_Exc: TStringField;
    CDS_V_TaxaSindicato: TClientDataSet;
    CDS_V_TaxaSindicatoLOJA: TStringField;
    CDS_V_TaxaSindicatoCODIGO: TStringField;
    CDS_V_TaxaSindicatoNOME: TStringField;
    CDS_V_TaxaSindicatoAPELIDO: TStringField;
    CDS_V_TaxaSindicatoVLR_APAGAR: TFMTBCDField;
    CDS_V_TaxaSindicatoDTA_VENCIMENTO: TDateField;
    CDS_V_TaxaSindicatoNUM_SEQ: TIntegerField;
    DS_V_TaxaSindicato: TDataSource;
    CDS_V_TaxaSindicatoNUM_DOCTO: TStringField;
    CDS_V_TaxaSindicatoDES_DOCTO: TStringField;
    CDS_V_TaxaSindicatoVLR_PAGO: TFMTBCDField;
    CDS_V_TaxaSindicatoDTA_PAGAMENTO: TDateField;
    CDS_V_TaxaSindicatoNUM_DOCTO_PAGTO: TStringField;
    CDS_V_ProfSeleciona: TClientDataSet;
    DS_V_ProfSeleciona: TDataSource;
    CDS_V_ProfSelecionaPROC: TStringField;
    CDS_V_ProfSelecionaCOD_LOJA: TStringField;
    CDS_V_ProfSelecionaDES_PROFISSIONAL: TStringField;
    CDS_V_ProfSelecionaDES_APELIDO: TStringField;
    CDS_V_ProfSelecionaCOD_PROFISSIONAL: TStringField;
    CDS_V_ProfSelecionaNUM_CPF: TStringField;
    CDS_V_ProfSelecionaIND_ATIVO: TStringField;
    CDS_HabilidadesDES_ABREVIATURA: TStringField;
    CDS_ApresGrid: TClientDataSet;
    DS_ApresGrid: TDataSource;
    SDS_ApresGrid: TSQLDataSet;
    DSP_ApresGrid: TDataSetProvider;
    CDS_TecBizApres: TClientDataSet;
    DS_TecBizApres: TDataSource;
    SDS_TecBizApres: TSQLDataSet;
    DSP_TecBizApres: TDataSetProvider;
    CDS_TecBizApresDTA_INI_PERIODO: TDateField;
    CDS_TecBizApresDTA_FIM_PERIODO: TDateField;
    CDS_TecBizApresCOD_TECBIZ: TStringField;
    CDS_TecBizApresDES_PESSOA: TStringField;
    CDS_TecBizApresVLR_TECBIZ: TFMTBCDField;
    CDS_TecBizApresIND_PAGO: TStringField;
    CDS_TecBizApresDES_ARQUIVO: TStringField;
    CDS_V_RelPlanPagto: TClientDataSet;
    CDS_V_RelPlanPagtoTP_DEPOSITO: TStringField;
    CDS_V_RelPlanPagtoDES_PROFISSIONAL: TStringField;
    CDS_V_RelPlanPagtoDTA_FIM_CONTRATO: TDateField;
    CDS_V_RelPlanPagtoNUM_TECBIZ: TStringField;
    CDS_V_RelPlanPagtoNUM_INSS: TStringField;
    CDS_V_RelPlanPagtoDES_BANCO: TStringField;
    CDS_V_RelPlanPagtoNUM_AGENCIA: TStringField;
    CDS_V_RelPlanPagtoNUM_CONTA: TStringField;
    CDS_V_RelPlanPagtoNUM_BANCO: TStringField;
    CDS_V_RelPlanPagtoCOD_PROF: TStringField;
    CDS_V_RelPlanPagtoVLR_COMISSAO: TFloatField;
    CDS_V_RelPlanPagtoVLR_PLANOSAUDE: TFloatField;
    CDS_V_RelPlanPagtoVLR_TECBIZ: TFloatField;
    CDS_V_RelPlanPagtoVLR_TAXAS: TFloatField;
    CDS_V_RelPlanPagtoVLR_VALES: TFloatField;
    CDS_V_RelPlanPagtoVLR_INSS: TFloatField;
    CDS_V_RelPlanPagtoPER_INSS: TFloatField;
    CDS_V_RelPlanPagtoVLR_ARREDONDA: TFloatField;
    CDS_V_RelPlanPagtoVLR_DEPOSITO: TFloatField;
    CDS_V_RelPlanPagtoVLR_VENDA: TFloatField;
    CDS_ProfissionaisSIT_PREVIDENCIARIA: TIntegerField;
    CDS_PlanoSaudeApres: TClientDataSet;
    DS_PlanoSaudeApres: TDataSource;
    SDS_PlanoSaudeApres: TSQLDataSet;
    DSP_PlanoSaudeApres: TDataSetProvider;
    CDS_PlanoSaudeApresCOD_PESSOA: TIntegerField;
    CDS_PlanoSaudeApresDES_PROFISSIONAL: TStringField;
    CDS_PlanoSaudeApresDES_DOCTO: TStringField;
    CDS_PlanoSaudeApresDTA_VENCIMENTO: TDateField;
    CDS_PlanoSaudeApresVLR_APAGAR: TFMTBCDField;
    CDS_PlanoSaudeApresPAGTO: TStringField;
    CDS_PlanoSaudeApresDES_ARQUIVO: TStringField;
    CDS_V_RelPlanPagtoVLR_BENEFICIO: TFloatField;
    CDS_PagtosPlanVLR_BENEFICIOS: TFMTBCDField;
    SDS_Beneficios: TSQLDataSet;
    DSP_Beneficios: TDataSetProvider;
    CDS_Beneficios: TClientDataSet;
    DS_Beneficios: TDataSource;
    CDS_BeneficiosCOD_LOJA: TStringField;
    CDS_BeneficiosCOD_PROF: TStringField;
    CDS_BeneficiosPROFISSIONAL: TStringField;
    CDS_BeneficiosPROF_ATIVO: TStringField;
    CDS_BeneficiosNUM_DOCTO: TIntegerField;
    CDS_BeneficiosDES_DOCTO: TStringField;
    CDS_BeneficiosVLR_DOCTO: TFMTBCDField;
    CDS_BeneficiosDTA_ULT_GERACAO: TDateField;
    CDS_BeneficiosDTA_ULT_PAGTO: TDateField;
    CDS_BeneficiosTIPO_PAGTO: TStringField;
    CDS_BeneficiosSITUACAO_PAGTO: TStringField;
    CDS_BeneficiosATIVO: TStringField;
    CDS_BeneficiosDTA_INI_BENEFICIO: TDateField;
    CDS_BeneficiosDTA_FIM_BENEFICIO: TDateField;
    procedure CDS_HabilidadesAfterScroll(DataSet: TDataSet);
    procedure CDS_HabilidadesProfAfterScroll(DataSet: TDataSet);
    procedure CDS_ValesProfissionaisAfterScroll(DataSet: TDataSet);
    procedure CDS_MetasProfissionaisAfterScroll(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMSalao: TDMSalao;

  // Cria Ponteiro de transacão
  TD: TTransactionDesc;

implementation

uses UDMBelShop, UFrmSalao;

{$R *.dfm}

procedure TDMSalao.CDS_HabilidadesAfterScroll(DataSet: TDataSet);
begin
  CDS_Servicos.Close;
  If Not CDS_Habilidades.IsEmpty Then
  Begin
    SDS_Servicos.Params.ParamByName('Cod_Hab').AsInteger:=
                                               CDS_HabilidadesCOD_HAB.AsInteger;
    CDS_Servicos.Open;
  End;
end;

procedure TDMSalao.CDS_HabilidadesProfAfterScroll(DataSet: TDataSet);
begin
  CDS_ServicosProf.Close;
  If Not CDS_HabilidadesProf.IsEmpty Then
  Begin
    CDS_ServicosProf.Close;
    SDS_ServicosProf.Params.ParamByName('CodLoja').AsString:=
                                           CDS_HabilidadesProfCOD_LOJA.AsString;
    SDS_ServicosProf.Params.ParamByName('CodProf').AsString:=
                                   CDS_HabilidadesProfCOD_PROFISSIONAL.AsString;
    SDS_ServicosProf.Params.ParamByName('CodHab').AsString:=
                                     CDS_HabilidadesProfCOD_HABILIDADE.AsString;
    CDS_ServicosProf.Open;
  End;

end;

procedure TDMSalao.CDS_ValesProfissionaisAfterScroll(DataSet: TDataSet);
Var
  MySql:String;
begin
  CDS_Vales.Close;
  If Not CDS_ValesProfissionais.IsEmpty Then
  Begin
    MySql:=' SELECT v.*'+
           ' FROM  PS_VALES_PESSOAS v'+
           ' WHERE v.tp_pessoa=1'+
           ' AND   v.ind_debcred='+QuotedStr('D')+

           ' AND   v.cod_loja='+QuotedStr(FormatFloat('00',CDS_ValesProfissionaisCOD_LOJA.AsInteger))+
           ' AND   v.cod_pessoa='+QuotedStr(FormatFloat('000000',CDS_ValesProfissionaisCOD_PROFISSIONAL.AsInteger))+
           ' AND   v.num_docto='+QuotedStr(CDS_ValesProfissionaisNUM_DOCTO.AsString)+
           ' AND   v.tot_prestacao='+QuotedStr(CDS_ValesProfissionaisTOT_PRESTACAO.AsString)+
           ' AND   v.vlr_original='+StringReplace(CDS_ValesProfissionaisVLR_ORIGINAL.AsString,',', '.', [rfReplaceAll]);

//odirapagar - 29/01/2015
//           ' AND   v.vlr_original='+QuotedStr(CDS_ValesProfissionaisVLR_ORIGINAL.AsString);

          If (FrmSalao.Ckb_ValesAbertos.Checked) And (Not FrmSalao.Ckb_ValesFechados.Checked)Then
           MySql:=MySql+' AND v.vlr_pago=0';

          If (Not FrmSalao.Ckb_ValesAbertos.Checked) And (FrmSalao.Ckb_ValesFechados.Checked)Then
           MySql:=MySql+' AND v.vlr_pago<>0';
    CDS_Vales.Close;
    SDS_Vales.CommandText:=MySql;
    CDS_Vales.Open;
  End; // If Not CDS_ValesProfissionais.IsEmpty Then
end;

procedure TDMSalao.CDS_MetasProfissionaisAfterScroll(DataSet: TDataSet);
Var
  MySql: String;
begin
  CDS_MetasHabilidades.Close;
  CDS_MetasProf.Close;
  If Not CDS_MetasProfissionais.IsEmpty Then
  Begin
    MySql:=' SELECT hs.cod_habilidade, ha.des_habserv'+

           ' FROM SAL_PROF_HABILIDADES hs, SAL_HAB_SERV ha'+

           ' WHERE hs.cod_loja=hs.cod_loja'+
           ' AND hs.cod_habilidade=ha.cod_habserv'+
           ' AND ha.tip_habserv='+QuotedStr('H')+
           ' AND  hs.cod_servico IS NULL'+
           ' AND  hs.cod_loja='+QuotedStr(CDS_MetasProfissionaisCOD_LOJA.AsString)+
           ' AND  hs.cod_profissional='+QuotedStr(CDS_MetasProfissionaisCOD_PROFISSIONAL.AsString)+
           ' ORDER BY 2';
    CDS_MetasHabilidades.Close;
    SDS_MetasHabilidades.CommandText:=MySql;
    CDS_MetasHabilidades.Open;

//    If Not CDS_MetasHabilidades.IsEmpty Then
    MySql:=' SELECT *'+
           ' FROM SAL_METAS m'+
           ' WHERE m.cod_loja='+QuotedStr(CDS_MetasProfissionaisCOD_LOJA.AsString)+
           ' AND m.cod_profissional='+QuotedStr(CDS_MetasProfissionaisCOD_PROFISSIONAL.AsString)+
//           ' AND m.cod_habilidade='+QuotedStr(CDS_MetasHabilidadesCOD_HABILIDADE.AsString)+
           ' AND m.des_ano='+IntToStr(FrmSalao.EdtMetasAno.AsInteger);
    CDS_MetasProf.Close;
    SDS_MetasProf.CommandText:=MySql;
    CDS_MetasProf.Open;

    If CDS_MetasProf.IsEmpty Then
     FrmSalao.CriaMetasProfissional;
  End; // If Not CDS_MetasProfissionais.IsEmpty Then
end;

end.


