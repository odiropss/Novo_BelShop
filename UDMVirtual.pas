unit UDMVirtual;

interface

uses
  SysUtils, Classes, DB, DBClient, Math, DBXpress, IBCustomDataSet, IBQuery,
  FMTBcd, SqlExpr, Provider;
//  �ltimo: Provider;
                                           
type
  TDMVirtual = class(TDataModule)
    CDS_V_EmpConexoes: TClientDataSet;
    CDS_V_EmpConexoesCONECTAR: TStringField;
    CDS_V_EmpConexoesCOD_FILIAL: TStringField;
    CDS_V_EmpConexoesENDERECO_IP: TStringField;
    CDS_V_EmpConexoesPASTA_BASE_DADOS: TStringField;
    CDS_V_EmpConexoesDES_BASE_DADOS: TStringField;
    CDS_V_EmpConexoesCOD_EMP: TStringField;
    CDS_V_EmpConexoesRAZAO_SOCIAL: TStringField;
    CDS_V_EmpConexoesTIP_EMP: TStringField;
    CDS_V_EmpConexoesDES_BAIRRO: TStringField;
    CDS_V_EmpConexoesDES_CIDADE: TStringField;
    CDS_V_EmpConexoesCOD_UF: TStringField;
    CDS_V_EmpConexoesCOD_CEP: TStringField;
    CDS_V_EmpConexoesNUM_CNPJ: TStringField;
    CDS_V_EmpConexoesINSCR_ESTADUAL: TStringField;
    CDS_V_EmpConexoesDES_ENDERECO: TStringField;
    CDS_V_EmpConexoesNUM_ENDERECO: TStringField;
    CDS_V_EmpConexoesCOMPL_ENDERECO: TStringField;
    CDS_V_EmpConexoesIND_ATIVO: TStringField;
    CDS_V_EmpConexoesCONEXAO: TStringField;
    CDS_V_EmpConexoesDATABASE: TStringField;
    CDS_V_EmpConexoesTRANSACAO: TStringField;
    DS_V_GruposProdutos: TDataSource;
    CDS_V_SubGruposProdutos: TClientDataSet;
    CDS_V_SubGruposProdutosCod_SubGrupo: TStringField;
    CDS_V_SubGruposProdutosDes_SubGrupo: TStringField;
    CDS_V_SubGruposProdutosCod_Grupo: TStringField;
    CDS_V_SubGruposProdutosCod_GrupoSub: TStringField;
    DS_V_SubGruposProdutos: TDataSource;
    CDS_V_Fornecedores: TClientDataSet;
    DS_V_Fornecedores: TDataSource;
    CDS_V_FornecedoresDes_Fornecedor: TStringField;
    CDS_V_FornecedoresCod_Fornecedor: TStringField;
    CDS_V_Aplicacao: TClientDataSet;
    DS_V_Aplicacao: TDataSource;
    CDS_V_AplicacaoCod_Aplicacao: TStringField;
    CDS_V_AplicacaoDes_Aplicacao: TStringField;
    CDS_V_FamiliaPrecos: TClientDataSet;
    DS_V_FamiliaPrecos: TDataSource;
    CDS_V_FamiliaPrecosDes_FamiliaPreco: TStringField;
    CDS_V_FamiliaPrecosCod_FamiliaPreco: TStringField;
    CDS_V_GrupoST: TClientDataSet;
    DS_V_GrupoST: TDataSource;
    CDS_V_GrupoSTCod_GrupoST: TStringField;
    CDS_V_GrupoSTDes_GrupoST: TStringField;
    CDS_GruposST: TClientDataSet;
    DS_GruposST: TDataSource;
    CDS_GruposSTDes_GrupoST: TStringField;
    CDS_GruposSTCod_GrupoST: TIntegerField;
    CDS_V_Produtos: TClientDataSet;
    DS_V_Produtos: TDataSource;
    CDS_V_ProdutosCod_Produto: TStringField;
    CDS_V_ProdutosDes_Produto: TStringField;
    CDS_V_GruposProdutos: TClientDataSet;
    CDS_V_GruposProdutosDes_Grupo: TStringField;
    CDS_V_GruposProdutosCod_Grupo: TStringField;
    CDS_V_PlanFinanceira: TClientDataSet;
    CDS_V_PlanFinanceiraTipo: TStringField;
    CDS_V_PlanFinanceiraCod_Comprovante: TStringField;
    CDS_V_PlanFinanceiraDes_Comprovante: TStringField;
    CDS_V_PlanFinanceiraVlr_Empresa01: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa02: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa03: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa04: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa05: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa06: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa07: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa08: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa09: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa10: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa11: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa12: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa13: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa14: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa15: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa16: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa17: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa18: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa19: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa20: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa21: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa22: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa23: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa24: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa25: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa26: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa27: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa28: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa29: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa30: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa_Total: TCurrencyField;
    DS_V_PlanFinanceira: TDataSource;
    CDS_V_ApresComprovantes: TClientDataSet;
    DS_V_ApresComprovantes: TDataSource;
    CDS_V_ApresComprovantesDATACOMPROVANTE: TDateField;
    CDS_V_ApresComprovantesDATADOCUMENTO: TDateField;
    CDS_V_ApresComprovantesCOMP_ANOMES: TStringField;
    CDS_V_ApresComprovantesCOD_CLI_FOR: TStringField;
    CDS_V_ApresComprovantesNOME_CLI_FOR: TStringField;
    CDS_V_ApresComprovantesVLR_COMPROVANTE: TFMTBCDField;
    CDS_V_PlanFinanceiraINDICE: TIntegerField;
    CDS_V_PlanFinanceiraVlr_Empresa50: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Empresa99: TCurrencyField;
    CDS_V_PlanDemonsResultados: TClientDataSet;
    DS_V_PlanDemonsResultados: TDataSource;
    CDS_V_PlanDemonsResultadosCod_Demonstrativo: TStringField;
    CDS_V_PlanDemonsResultadosDes_Demonstrativo: TStringField;
    CDS_V_PlanDemonsResultadosVlr_Empresa01: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa02: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa03: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa04: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa05: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa06: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa07: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa08: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa09: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa10: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa11: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa12: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa13: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa14: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa15: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa16: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa17: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa18: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa19: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa20: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa21: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa22: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa23: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa24: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa25: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa26: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa27: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa28: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa29: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa30: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa50: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa99: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa_Total: TCurrencyField;
    CDS_V_PlanDemonsResultadosINDICE: TIntegerField;
    CDS_V_PlanFinanceiraVisivel: TBooleanField;
    CDS_V_CurvaABCEndereco: TClientDataSet;
    DS_V_CurvaABCEndereco: TDataSource;
    CDS_V_CurvaABCEnderecoCOD_PRODUTO: TStringField;
    CDS_V_CurvaABCEnderecoDES_PRODUTO: TStringField;
    CDS_V_CurvaABCEnderecoVLR_REFERENCIA: TCurrencyField;
    CDS_V_CurvaABCEnderecoPER_PARTICIPACAO: TCurrencyField;
    CDS_V_CurvaABCEnderecoIND_CURVA: TStringField;
    CDS_V_CurvaABCEnderecoDES_ZONA: TIntegerField;
    CDS_V_CurvaABCEnderecoDES_CORREDOR: TStringField;
    CDS_V_CurvaABCEnderecoDES_PRATELEIRA: TStringField;
    CDS_V_CurvaABCEnderecoDES_GAVETA: TStringField;
    CDS_V_CurvaABCEnderecoIND_SITUACAO: TStringField;
    CDS_V_PlanFinanceiraVlr_Mes01: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Mes02: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Mes03: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Mes04: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Mes05: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Mes06: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Mes07: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Mes08: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Mes09: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Mes10: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Mes11: TCurrencyField;
    CDS_V_PlanFinanceiraVlr_Mes12: TCurrencyField;
    CDS_V_PlanoContasCompr200: TClientDataSet;
    DS_V_PlanoContasCompr200: TDataSource;
    CDS_V_PlanoContasCompr200Des_PlanoContas: TStringField;
    CDS_V_PlanoContasCompr200Vlr_Empresa01: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa02: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa03: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa04: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa05: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa06: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa07: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa08: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa09: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa10: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa11: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa12: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa13: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa14: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa15: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa16: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa17: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa18: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa19: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa20: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa21: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa22: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa23: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa24: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa25: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa26: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa27: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa28: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa29: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa30: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa50: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa99: TCurrencyField;
    CDS_V_PlanoContasCompr200Vlr_Empresa_Total: TCurrencyField;
    DS_V_ObjetivosDias: TDataSource;
    CDS_V_ObjetivosDias: TClientDataSet;
    CDS_V_ObjetivosDiasINDICE: TIntegerField;
    CDS_V_ObjetivosDiasDes_Empresa: TStringField;
    CDS_V_ObjetivosDiasTipo: TStringField;
    CDS_V_ObjetivosDiasVlr_Dia01: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia02: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia03: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia04: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia05: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia06: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia07: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia08: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia09: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia10: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia11: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia12: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia13: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia14: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia15: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia16: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia17: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia18: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia19: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia20: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia21: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia22: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia23: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia24: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia25: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia26: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia27: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia28: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia29: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia30: TCurrencyField;
    CDS_V_ObjetivosDiasVlr_Dia31: TCurrencyField;
    CDS_V_ObjetivosDiasCod_Emp: TStringField;
    CDS_V_ObjetivosDiasCod_Objetivo: TIntegerField;
    CDS_V_ObjetivosDiasDes_Objetivo: TStringField;
    CDS_V_ObjetivosDiasVlr_Objetivo: TCurrencyField;
    CDS_V_ProdutosCod_Fornecedor: TStringField;
    CDS_V_EstFisFinanEmp: TClientDataSet;
    DS_V_EstFisFinanEmp: TDataSource;
    DS_V_EmpConexoes: TDataSource;
    CDS_V_EstFisFinanLojas: TClientDataSet;
    DS_V_EstFisFinanLojas: TDataSource;
    CDS_V_EstFisFinanEmpDES_FORNECEDOR: TStringField;
    CDS_V_EstFisFinanEmpCOD_PRODUTO: TStringField;
    CDS_V_EstFisFinanEmpDES_PRODUTO: TStringField;
    CDS_V_EstFisFinanEmpQTD_ESTOQUE: TCurrencyField;
    CDS_V_EstFisFinanEmpVLR_PC_CUSTO: TCurrencyField;
    CDS_V_EstFisFinanEmpVLR_TOTAL_CUSTO: TCurrencyField;
    CDS_V_EstFisFinanEmpVLR_PC_VENDA: TCurrencyField;
    CDS_V_EstFisFinanEmpVLR_TOTAL_VENDA: TCurrencyField;
    CDS_V_EstFisFinanEmpINDICE: TIntegerField;
    CDS_V_EstFisFinanLojasLINK: TIntegerField;
    CDS_V_EstFisFinanEmpCOD_FORNECEDOR: TStringField;
    CDS_V_EstFisFinanLojasDES_FORNECEDOR: TStringField;
    CDS_V_EstFisFinanLojasCOD_PRODUTO: TStringField;
    CDS_V_EstFisFinanLojasDES_PRODUTO: TStringField;
    CDS_V_EstFisFinanLojasQTD_ESTOQUE: TCurrencyField;
    CDS_V_EstFisFinanLojasVLR_PC_CUSTO: TCurrencyField;
    CDS_V_EstFisFinanLojasVLR_TOTAL_CUSTO: TCurrencyField;
    CDS_V_EstFisFinanLojasVLR_PC_VENDA: TCurrencyField;
    CDS_V_EstFisFinanLojasVLR_TOTAL_VENDA: TCurrencyField;
    CDS_V_EstFisFinanLojasINDICE: TIntegerField;
    CDS_V_CurvaABCEnderecoCOD_FORNECEDOR: TStringField;
    CDS_V_CurvaABCEnderecoDES_FORNECEDOR: TStringField;
    DS_V_ObjetivosMeses: TDataSource;
    CDS_V_ObjetivosMeses: TClientDataSet;
    CDS_V_ObjetivosMesesDes_Objetivo: TStringField;
    CDS_V_ObjetivosMesesVlr_Objetivo: TCurrencyField;
    CDS_V_ObjetivosMesesDes_Empresa: TStringField;
    CDS_V_ObjetivosMesesTipo: TStringField;
    CDS_V_ObjetivosMesesVlr_Mes01: TCurrencyField;
    CDS_V_ObjetivosMesesVlr_Mes02: TCurrencyField;
    CDS_V_ObjetivosMesesVlr_Mes03: TCurrencyField;
    CDS_V_ObjetivosMesesVlr_Mes04: TCurrencyField;
    CDS_V_ObjetivosMesesVlr_Mes05: TCurrencyField;
    CDS_V_ObjetivosMesesVlr_Mes06: TCurrencyField;
    CDS_V_ObjetivosMesesVlr_Mes07: TCurrencyField;
    CDS_V_ObjetivosMesesVlr_Mes08: TCurrencyField;
    CDS_V_ObjetivosMesesVlr_Mes09: TCurrencyField;
    CDS_V_ObjetivosMesesVlr_Mes10: TCurrencyField;
    CDS_V_ObjetivosMesesVlr_Mes11: TCurrencyField;
    CDS_V_ObjetivosMesesVlr_Mes12: TCurrencyField;
    CDS_V_ObjetivosMesesINDICE: TIntegerField;
    CDS_V_ObjetivosMesesCod_Objetivo: TIntegerField;
    CDS_V_ObjetivosMesesCod_Emp: TStringField;
    CDS_V_ObjetivosMesesVlr_Empresa: TCurrencyField;
    DS_V_ObjetivosMovtos: TDataSource;
    CDS_V_ObjetivosMovtos: TClientDataSet;
    CDS_V_ObjetivosMovtosORDEM: TIntegerField;
    CDS_V_ObjetivosMovtosTIP_CALCULO: TStringField;
    CDS_V_ObjetivosMovtosDATA: TStringField;
    CDS_V_ObjetivosMovtosCOD_OBJETIVO: TIntegerField;
    CDS_V_ObjetivosMovtosCOD_FILIAL: TIntegerField;
    CDS_V_ObjetivosMovtosQTD_COMPROV: TIntegerField;
    CDS_V_ObjetivosMovtosTOT_ITENS: TIntegerField;
    CDS_V_ObjetivosMovtosTICKET_MEDIO: TCurrencyField;
    CDS_V_ObjetivosMovtosTOT_DESC_ITENS: TCurrencyField;
    CDS_V_ObjetivosMovtosTOT_BRUTO: TCurrencyField;
    CDS_V_ObjetivosMovtosTOT_NOTA: TCurrencyField;
    CDS_V_ObjetivosMovtosTOT_FRETE: TCurrencyField;
    CDS_V_ObjetivosMovtosTOT_DESPESAS: TCurrencyField;
    CDS_V_ObjetivosMovtosTOT_COMP_15: TCurrencyField;
    CDS_V_ObjetivosMovtosTOT_VENDAS: TCurrencyField;
    DS_V_ObjetivosAuditorias: TDataSource;
    CDS_V_ObjetivosAuditorias: TClientDataSet;
    CDS_V_ObjetivosAuditoriasORDEM: TIntegerField;
    CDS_V_ObjetivosAuditoriasDES_OBJETIVO: TStringField;
    CDS_V_ObjetivosAuditoriasDES_LOJA: TStringField;
    CDS_V_ObjetivosAuditoriasDTA_AUDITORIA: TDateField;
    CDS_V_ObjetivosAuditoriasLIMITE_OBJETIVO: TStringField;
    CDS_V_ObjetivosAuditoriasREALIZADO: TCurrencyField;
    CDS_V_ObjetivosAuditoriasPERCENTUAL: TCurrencyField;
    CDS_V_ObjetivosAuditoriasCOD_LOJA: TStringField;
    CDS_V_ObjetivosAuditoriasCOR: TStringField;
    DS_V_NFe: TDataSource;
    CDS_V_NFe: TClientDataSet;
    CDS_V_NFeDES_LOJA: TStringField;
    CDS_V_NFeCOD_FORNECEDOR: TStringField;
    CDS_V_NFeDES_FORNECEDOR: TStringField;
    CDS_V_NFeNUM_NOTA: TStringField;
    CDS_V_NFeDES_SERIE: TStringField;
    CDS_V_NFeDTA_NOTA: TDateField;
    CDS_V_NFeDTA_ENTRADA: TDateField;
    CDS_V_NFeTOT_ITENS: TIntegerField;
    CDS_V_NFeVLR_NOTA: TCurrencyField;
    CDS_V_NFeORDEM: TIntegerField;
    CDS_V_NFeCOD_LOJA: TStringField;
    CDS_V_ObjetivosDiasVISIVEL: TStringField;
    CDS_V_ObjetivosMesesVISIVEL: TStringField;
    DS_V_GiroEstoque: TDataSource;
    CDS_V_GiroEstoque: TClientDataSet;
    CDS_V_GiroEstoqueORDEM: TIntegerField;
    CDS_V_GiroEstoqueCOD_PRODUTO: TStringField;
    CDS_V_GiroEstoqueDES_PRODUTO: TStringField;
    CDS_V_GiroEstoqueQTD_EST_INICIAL: TCurrencyField;
    CDS_V_GiroEstoqueQTD_VENDAS: TCurrencyField;
    CDS_V_GiroEstoqueQTD_EST_FINAL: TCurrencyField;
    CDS_V_GiroEstoqueMEDIA_ESTOQUE: TCurrencyField;
    CDS_V_GiroEstoqueIND_CURVA: TStringField;
    CDS_V_GiroEstoqueIND_SITUACAO: TStringField;
    CDS_V_GiroEstoqueCOD_FORNECEDOR: TStringField;
    CDS_V_GiroEstoqueDES_FORNECEDOR: TStringField;
    CDS_V_GiroEstoqueGIRO_ESTOQUE: TCurrencyField;
    CDS_V_GiroEstoqueTEMPO_MEDIO: TCurrencyField;
    CDS_V_GiroEstoqueCOD_LOJA: TStringField;
    CDS_V_GiroEstoquePROD_PESQUISA: TStringField;
    CDS_V_GiroEstoqueLOJA_PESQUISA: TStringField;
    DS_V_Mix_Prod: TDataSource;
    CDS_V_Mix_Prod: TClientDataSet;
    CDS_V_Mix_ProdCOD_LOJA: TStringField;
    CDS_V_Mix_ProdRAZAO_SOCIAL: TStringField;
    CDS_V_Mix_ProdIND_CURVA_A: TStringField;
    CDS_V_Mix_ProdIND_CURVA_B: TStringField;
    CDS_V_Mix_ProdIND_CURVA_C: TStringField;
    CDS_V_Mix_ProdIND_CURVA_D: TStringField;
    CDS_V_Mix_ProdIND_CURVA_E: TStringField;
    CDS_V_CurvaABCEnderecoIND_EMP_ATUALIZADA: TStringField;
    CDS_V_NFeCOD_COMPROV: TStringField;
    CDS_V_NFeDES_COMPROV: TStringField;
    CDS_V_CurvaABCEnderecoSEQ: TIntegerField;
    CDS_V_CurvaABCEnderecoDTA_INCLUSAO: TDateField;
    CDS_V_Comprovantes: TClientDataSet;
    DS_V_Comprovantes: TDataSource;
    CDS_V_ComprovantesCOD_COMPROV: TIntegerField;
    CDS_V_ComprovantesDES_COMPROV: TStringField;
    CDS_V_ComprovantesIND_ATIVO: TStringField;
    CDS_V_CurvaABCEnderecoQTD_ESTOQUE: TCurrencyField;
    CDS_V_CurvaABCEnderecoVLR_PC_CUSTO: TCurrencyField;
    CDS_V_CurvaABCEnderecoVLR_TOTAL_CUSTO: TCurrencyField;
    CDS_V_CurvaABCEnderecoVLR_PC_VENDA: TCurrencyField;
    CDS_V_CurvaABCEnderecoVLR_TOTAL_VENDA: TCurrencyField;
    CDS_V_CurvaABCEnderecoPER_MARGEM: TCurrencyField;
    CDS_V_CurvaABCEnderecoVLR_MARGEM: TCurrencyField;
    CDS_V_MargLucroBonif: TClientDataSet;
    DS_V_MargLucroBonif: TDataSource;
    CDS_V_MargLucroBonifRes: TClientDataSet;
    DS_V_MargLucroBonifRes: TDataSource;
    DS_V_MargLucroFinal: TDataSource;
    CDS_V_MargLucroFinal: TClientDataSet;
    CDS_V_MargLucroBonifCODFILIAL: TStringField;
    CDS_V_MargLucroBonifCODPRODUTO: TStringField;
    CDS_V_MargLucroBonifAPRESENTACAO: TStringField;
    CDS_V_MargLucroBonifCODCOMPROVANTE: TStringField;
    CDS_V_MargLucroBonifENT_SAI: TStringField;
    CDS_V_MargLucroBonifQTD_TOTAL: TFMTBCDField;
    CDS_V_MargLucroBonifTOT_VALBRUTO: TFMTBCDField;
    CDS_V_MargLucroBonifTOT_VALDESCONTO: TFMTBCDField;
    CDS_V_MargLucroBonifTOT_VALIPI: TFMTBCDField;
    CDS_V_MargLucroBonifTOT_VALSUBSTITUICAO: TFMTBCDField;
    CDS_V_MargLucroBonifTOT_VALREPASSE: TFMTBCDField;
    CDS_V_MargLucroBonifTOT_VALTOTAL: TFMTBCDField;
    CDS_V_MargLucroBonifNOMECOMPROVANTE: TStringField;
    CDS_V_MargLucroBonifPRINCIPALFOR: TStringField;
    CDS_V_MargLucroBonifNOMEFORNECEDOR: TStringField;
    CDS_V_MargLucroBonifResCODCOMPROVANTE: TStringField;
    CDS_V_MargLucroBonifResSINALESTOQUE: TStringField;
    CDS_V_MargLucroBonifResQTD_TOTAL: TFMTBCDField;
    CDS_V_MargLucroBonifResTOT_VALBRUTO: TFMTBCDField;
    CDS_V_MargLucroBonifResTOT_VALDESCONTO: TFMTBCDField;
    CDS_V_MargLucroBonifResTOT_VALIPI: TFMTBCDField;
    CDS_V_MargLucroBonifResTOT_VALSUBSTITUICAO: TFMTBCDField;
    CDS_V_MargLucroBonifResTOT_VALREPASSE: TFMTBCDField;
    CDS_V_MargLucroBonifResTOT_VALTOTAL: TFMTBCDField;
    CDS_V_MargLucroBonifResLOJA: TStringField;
    CDS_V_MargLucroFinalLoja: TStringField;
    CDS_V_MargLucroFinalDesc_Tipo: TStringField;
    CDS_V_MargLucroFinalTot_Vendas: TCurrencyField;
    CDS_V_MargLucroFinalTot_Custos: TCurrencyField;
    CDS_V_MargLucroFinalPer_Margem: TCurrencyField;
    CDS_V_MargemLucro: TClientDataSet;
    CDS_V_MargemLucroCODFILIAL: TStringField;
    CDS_V_MargemLucroCODPRODUTO: TStringField;
    CDS_V_MargemLucroAPRESENTACAO: TStringField;
    CDS_V_MargemLucroCODFORNECEDOR: TStringField;
    CDS_V_MargemLucroNOMEFORNECEDOR: TStringField;
    CDS_V_MargemLucroTOT_QTD_COMPRA: TFMTBCDField;
    CDS_V_MargemLucroPRECOCUSTO: TFMTBCDField;
    CDS_V_MargemLucroTOT_QTD_VENDA: TFMTBCDField;
    CDS_V_MargemLucroPRECOVENDA: TFMTBCDField;
    CDS_V_MargemLucro_MARGEM_1: TFMTBCDField;
    CDS_V_MargemLucro_MARGEM_2: TFMTBCDField;
    CDS_V_MargemLucroVALOR_MARGEM: TFMTBCDField;
    CDS_V_MargemLucroPER_MARKUP: TFMTBCDField;
    CDS_V_MargemLucroVLR_VENDA_PV: TFMTBCDField;
    CDS_V_MargemLucroVLR_VENDA_PC: TFMTBCDField;
    CDS_V_MargemLucroLucro: TFMTBCDField;
    CDS_V_MargemLucroPartVenda: TFMTBCDField;
    CDS_V_MargemLucroPartCusto: TFMTBCDField;
    CDS_V_MargemLucroNUMSEQ: TIntegerField;
    CDS_V_MargemLucroVLR_BAP: TFMTBCDField;
    CDS_V_MargemLucroVLR_VENDA_PC_BAP: TFMTBCDField;
    CDS_V_MargemLucroPER_BAP_VENDA: TFMTBCDField;
    CDS_V_MargemLucroPER_LUCRO_FINAL: TFMTBCDField;
    DS_V_MargemLucro: TDataSource;
    CDS_V_MargemLucroULT_ALTERACAO: TStringField;
    CDS_V_MargLucroBonifResDESCOMPROVANTE: TStringField;
    CDS_V_MargemLucroAG_VLR_VENDA_PV: TAggregateField;
    CDS_V_MargemLucroAG_VLR_VENDA_PC: TAggregateField;
    CDS_V_MargemLucroAG_TOT_QTD_COMPRA: TAggregateField;
    CDS_V_MargemLucroAG_PRECOCUSTO: TAggregateField;
    CDS_V_MargemLucroAG_TOT_QTD_VENDA: TAggregateField;
    CDS_V_MargemLucroAG_PRECOVENDA: TAggregateField;
    CDS_V_MargemLucroAG_VLR_BAP: TAggregateField;
    CDS_V_MargemLucroAG_VLR_VENDA_PC_BAP: TAggregateField;
    CDS_V_MargemLucroAG_VLR_MARGEM_FINAL: TAggregateField;
    CDS_V_MargemLucroAG_VLR_MARGEM_TOTAL: TAggregateField;
    CDS_V_MargemLucroVLR_MARGEM_TOTAL: TFMTBCDField;
    CDS_V_MargemLucroVLR_MARGEM_FINAL: TFMTBCDField;
    CDS_V_MargemLucroForn: TClientDataSet;
    CDS_V_MargemLucroFornCODFORNECEDOR: TStringField;
    CDS_V_MargemLucroFornNOMEFORNECEDOR: TStringField;
    CDS_V_MargemLucroFornTOT_QTD_COMPRA: TFMTBCDField;
    CDS_V_MargemLucroFornTOT_QTD_VENDA: TFMTBCDField;
    CDS_V_MargemLucroFornVALOR_MARGEM: TFMTBCDField;
    CDS_V_MargemLucroFornVLR_VENDA_PV: TFMTBCDField;
    CDS_V_MargemLucroFornVLR_VENDA_PC: TFMTBCDField;
    CDS_V_MargemLucroFornPARTVENDA: TFMTBCDField;
    CDS_V_MargemLucroFornPARTCUSTO: TFMTBCDField;
    CDS_V_MargemLucroFornVLR_BAP: TFMTBCDField;
    CDS_V_MargemLucroFornPER_BAP_VENDA: TFMTBCDField;
    CDS_V_MargemLucroFornVLR_VENDA_PC_BAP: TFMTBCDField;
    CDS_V_MargemLucroFornPER_LUCRO_FINAL: TFMTBCDField;
    CDS_V_MargemLucroFornVLR_MARGEM_TOTAL: TFMTBCDField;
    CDS_V_MargemLucroFornVLR_MARGEM_FINAL: TFMTBCDField;
    DS_V_MargemLucroForn: TDataSource;
    CDS_V_MargemLucroFornLUCRO: TFMTBCDField;
    CDS_V_MargemLucroFornNUMSEQ: TIntegerField;
    CDS_V_MargemLucroScroll: TClientDataSet;
    CDS_V_MargemLucroScrollCODFILIAL: TStringField;
    CDS_V_MargemLucroScrollCODPRODUTO: TStringField;
    CDS_V_MargemLucroScrollAPRESENTACAO: TStringField;
    CDS_V_MargemLucroScrollCODFORNECEDOR: TStringField;
    CDS_V_MargemLucroScrollNOMEFORNECEDOR: TStringField;
    CDS_V_MargemLucroScrollTOT_QTD_COMPRA: TFMTBCDField;
    CDS_V_MargemLucroScrollPRECOCUSTO: TFMTBCDField;
    CDS_V_MargemLucroScrollTOT_QTD_VENDA: TFMTBCDField;
    CDS_V_MargemLucroScrollPRECOVENDA: TFMTBCDField;
    CDS_V_MargemLucroScroll_MARGEM_1: TFMTBCDField;
    CDS_V_MargemLucroScroll_MARGEM_2: TFMTBCDField;
    CDS_V_MargemLucroScrollVALOR_MARGEM: TFMTBCDField;
    CDS_V_MargemLucroScrollPER_MARKUP: TFMTBCDField;
    CDS_V_MargemLucroScrollVLR_VENDA_PV: TFMTBCDField;
    CDS_V_MargemLucroScrollVLR_VENDA_PC: TFMTBCDField;
    CDS_V_MargemLucroScrollLucro: TFMTBCDField;
    CDS_V_MargemLucroScrollPartVenda: TFMTBCDField;
    CDS_V_MargemLucroScrollPartCusto: TFMTBCDField;
    CDS_V_MargemLucroScrollNUMSEQ: TIntegerField;
    CDS_V_MargemLucroScrollVLR_BAP: TFMTBCDField;
    CDS_V_MargemLucroScrollPER_BAP_VENDA: TFMTBCDField;
    CDS_V_MargemLucroScrollVLR_VENDA_PC_BAP: TFMTBCDField;
    CDS_V_MargemLucroScrollPER_LUCRO_FINAL: TFMTBCDField;
    CDS_V_MargemLucroScrollULT_ALTERACAO: TStringField;
    CDS_V_MargemLucroScrollVLR_MARGEM_TOTAL: TFMTBCDField;
    CDS_V_MargemLucroScrollVLR_MARGEM_FINAL: TFMTBCDField;
    DS_V_MargemLucroScroll: TDataSource;
    CDS_V_EmpConexoesCOD_LISTAPRE: TStringField;
    DS_V_ParamSalMinimo: TDataSource;
    CDS_V_ParamSalMinimo: TClientDataSet;
    CDS_V_ParamSalMinimoNUM_SEQ: TIntegerField;
    CDS_V_ParamSalMinimoTP_REGISTRO: TIntegerField;
    CDS_V_ParamSalMinimoSEQ_REG: TIntegerField;
    CDS_V_ParamSalMinimoVLR_INICIAL: TFMTBCDField;
    CDS_V_ParamSalMinimoVLR_FINAL: TFMTBCDField;
    CDS_V_ParamSalMinimoPER_ALIQUOTA: TFMTBCDField;
    CDS_V_ParamSalMinimoVLR_DEDUCAO: TFMTBCDField;
    CDS_V_ParamSalMinimoDTA_VIGENCIA_INICIO: TDateField;
    CDS_V_ParamSalMinimoDTA_VIGENCIA_FINAL: TDateField;
    CDS_V_ParamSalMinimoUSU_INCLUI: TIntegerField;
    CDS_V_ParamSalMinimoDTA_INCLUI: TSQLTimeStampField;
    CDS_V_ParamSalMinimoUSU_ALTERA: TIntegerField;
    CDS_V_ParamSalMinimoDTA_ALTERA: TSQLTimeStampField;
    CDS_V_ParamSalMinimoIND_SIT: TStringField;
    CDS_V_Kits: TClientDataSet;
    CDS_V_KitsNotas: TClientDataSet;
    DS_V_Kits: TDataSource;
    DS_V_KitsNotas: TDataSource;
    CDS_V_KitsTipo: TStringField;
    CDS_V_KitsCodigo: TStringField;
    CDS_V_KitsDescricao: TStringField;
    CDS_V_KitsQuant: TFMTBCDField;
    CDS_V_KitsVlr_Total: TFMTBCDField;
    CDS_V_KitsVlr_Desc: TFMTBCDField;
    CDS_V_KitsDta_Validade_Ini: TDateField;
    CDS_V_KitsDta_Validade_Fim: TDateField;
    CDS_V_KitsNotasTipo: TStringField;
    CDS_V_KitsNotasNum_Codigo: TStringField;
    CDS_V_KitsNotasDescricao: TStringField;
    CDS_V_KitsNotasQuant: TFMTBCDField;
    CDS_V_KitsNotasVlr_Desc: TFMTBCDField;
    CDS_V_KitsNotasVlr_Total: TFMTBCDField;
    CDS_V_KitsNotasData1: TDateField;
    CDS_V_KitsNotasData2: TDateField;
    CDS_V_KitsNotasCodigo: TStringField;
    CDS_V_KitsCod_Barras: TStringField;
    CDS_V_KitsNotasNumero: TStringField;
    CDS_V_KitsNotasCod_Produto: TStringField;
    CDS_V_KitsNotasDes_Prod: TStringField;
    CDS_V_KitsNotasPer_Desc: TFMTBCDField;
    CDS_V_KitsNotasVlr_Bruto: TFMTBCDField;
    CDS_V_KitsSintetico: TStringField;
    CDS_V_KitsNum_Seq: TIntegerField;
    CDS_V_KitsNotasNum_Seq: TIntegerField;
    CDS_V_KitsCod_Kit: TIntegerField;
    CDS_V_MargLucroBonifResTOT_VALRETIDO: TCurrencyField;
    CDS_V_SaldoTransf: TClientDataSet;
    CDS_V_SaldoTransfCOD_LOJA: TStringField;
    CDS_V_SaldoTransfCOD_PRODUTO: TStringField;
    CDS_V_SaldoTransfCOD_FORNECEDOR: TStringField;
    CDS_V_SaldoTransfQTD_SALDO: TCurrencyField;
    CDS_V_SaldoTransfQTD_UTILIZADA: TCurrencyField;
    CDS_V_SaldoTransfQTD_DISPONIVEL: TCurrencyField;
    DataSource1: TDataSource;
    CDS_V_PlanFinanceiraVlr_Empresa98: TCurrencyField;
    CDS_V_PlanDemonsResultadosVlr_Empresa98: TCurrencyField;
    CDS_V_CurvaABCEnderecoORDENAR: TIntegerField;
    CDS_V_CurvaABCEnderecoEST_IDEAL: TCurrencyField;
    CDS_V_CurvaABCEnderecoEST_MAXIMO: TCurrencyField;
    CDS_V_CurvaABCEnderecoQTD_DEMANDA: TCurrencyField;
    CDS_V_Estoques: TClientDataSet;
    DS_V_Estoques: TDataSource;
    CDS_V_ParamLojaNeces: TClientDataSet;
    DS_V_ParamLojaNeces: TDataSource;
    CDS_V_ParamLojaNecesDES_LOJA: TStringField;
    CDS_V_ParamLojaNecesIND_CURVA_A: TStringField;
    CDS_V_ParamLojaNecesIND_CURVA_B: TStringField;
    CDS_V_ParamLojaNecesIND_CURVA_C: TStringField;
    CDS_V_ParamLojaNecesIND_CURVA_D: TStringField;
    CDS_V_ParamLojaNecesIND_CURVA_E: TStringField;
    CDS_V_ParamLojaNecesCOD_LOJA: TStringField;
    IBQ_EstoqueLoja: TIBQuery;
    IBQ_EstoqueLojaCODFILIAL: TIBStringField;
    IBQ_EstoqueLojaCODPRODUTO: TIBStringField;
    IBQ_EstoqueLojaSALDOATUAL: TIBBCDField;
    IBQ_EstoqueLojaPEDIDOPENDENTE: TIBBCDField;
    IBQ_EstoqueLojaCUSMEDVALOR: TIBBCDField;
    IBQ_EstoqueLojaCUSTOMEDIO: TIBBCDField;
    IBQ_EstoqueLojaLASTPRECOCOMPRA: TIBBCDField;
    IBQ_EstoqueLojaLASTCUSTOMEDIO: TIBBCDField;
    IBQ_EstoqueLojaESTOQUEIDEAL: TIBBCDField;
    IBQ_EstoqueLojaESTOQUEMAXIMO: TIBBCDField;
    IBQ_EstoqueLojaDATAALTERACADASTRO: TDateTimeField;
    IBQ_EstoqueLojaDATAALTERAESTOQUE: TDateTimeField;
    IBQ_EstoqueLojaDATAALTERAESTOQUE_PED: TDateTimeField;
    IBQ_EstoqueLojaDTA_ATUALIZACAO: TDateField;
    IBQ_EstoqueLojaHRA_ATUALIZACAO: TIBStringField;
    IBQ_UsuarioTable: TIBQuery;
    IBQ_UsuarioTableNOME_CAMPO: TIBStringField;
    CDS_V_NFeTOT_QTDS: TCurrencyField;
    CDS_V_ParamLojaNecesIND_ATIVO: TStringField;
    DS_V_EstoqueLojas: TDataSource;
    IBQ_EstoqueLojaPRINCIPALFOR: TIBStringField;
    IBQ_EstoqueLojaZONAENDERECO: TIntegerField;
    IBQ_EstoqueLojaCORREDOR: TIBStringField;
    IBQ_EstoqueLojaPRATELEIRA: TIBStringField;
    IBQ_EstoqueLojaGAVETA: TIBStringField;
    CDS_V_EstoquesSEQ: TFMTBCDField;
    CDS_V_EstoquesDES_PRODUTO: TStringField;
    CDS_V_EstoquesIND_CURVA: TStringField;
    CDS_V_EstoquesVLR_VENDAS_ANO: TFMTBCDField;
    CDS_V_EstoquesVLR_VENDAS_4M: TFMTBCDField;
    CDS_V_EstoquesQTD_VENDAS_ANO: TIntegerField;
    CDS_V_EstoquesQTD_VENDAS_4M: TIntegerField;
    CDS_V_EstoquesQTD_ESTOCAGEM_ANO: TIntegerField;
    CDS_V_EstoquesPER_PARTICIPACAO: TFMTBCDField;
    CDS_V_EstoquesQTD_ESTOQUE: TIntegerField;
    CDS_V_EstoquesQTD_TRANSITO: TIntegerField;
    CDS_V_EstoquesEST_IDEAL: TIntegerField;
    CDS_V_EstoquesPC_VENDA: TFMTBCDField;
    CDS_V_EstoquesCOD_FORNECEDOR: TStringField;
    CDS_V_EstoquesDES_FORNECEDOR: TStringField;
    CDS_V_EstoquesORDENAR: TFMTBCDField;
    CDS_V_EstoquesNUM_DIASUTEIS: TIntegerField;
    CDS_V_EstoquesNUM_LINHA: TIntegerField;
    CDS_V_EstoquesVLR_VD_M1: TFMTBCDField;
    CDS_V_EstoquesVLR_VD_M2: TFMTBCDField;
    CDS_V_EstoquesVLR_VD_M3: TFMTBCDField;
    CDS_V_EstoquesVLR_VD_M4: TFMTBCDField;
    CDS_V_EstoquesVLR_VD_M5: TFMTBCDField;
    CDS_V_EstoquesQTD_VD_M1: TIntegerField;
    CDS_V_EstoquesQTD_VD_M2: TIntegerField;
    CDS_V_EstoquesQTD_VD_M3: TIntegerField;
    CDS_V_EstoquesQTD_VD_M4: TIntegerField;
    CDS_V_EstoquesQTD_VD_M5: TIntegerField;
    CDS_V_EstoquesPC_CUSTO: TFMTBCDField;
    CDS_V_EstoquesPER_MARGEM: TFMTBCDField;
    CDS_V_EstoquesEST_MAXIMO: TIntegerField;
    CDS_V_EstoquesQTD_MEDIA_MES: TFMTBCDField;
    CDS_V_EstoqueLojas: TClientDataSet;
    CDS_V_EstoqueLojasCOD_LOJA: TStringField;
    CDS_V_EstoqueLojasQTD_ESTOQUE: TIntegerField;
    CDS_V_EstoqueLojasVLR_ESTOQUE: TCurrencyField;
    CDS_V_EstoqueLojasQTD_VENDAS: TIntegerField;
    CDS_V_EstoqueLojasEST_SIMULADO: TIntegerField;
    CDS_V_EstoqueLojasVLR_SIMULADO: TCurrencyField;
    CDS_V_EstoqueLojasPER_SIMULADOR: TCurrencyField;
    CDS_V_EstoqueLojasDIA_UTEIS: TIntegerField;
    CDS_V_EstoqueLojasDTA_INICIO: TDateField;
    CDS_V_EstoqueLojasDTA_FIM: TDateField;
    CDS_V_EstoquesFinan: TClientDataSet;
    DS_V_EstoquesFinan: TDataSource;
    CDS_V_EstoquesFinanCLASSE: TStringField;
    CDS_V_EstoquesFinanDM: TIntegerField;
    CDS_V_EstoquesFinanDM_PC: TFMTBCDField;
    CDS_V_EstoquesFinanDM_PV: TFMTBCDField;
    CDS_V_EstoquesFinanEST: TIntegerField;
    CDS_V_EstoquesFinanEST_PC: TFMTBCDField;
    CDS_V_EstoquesFinanEST_PV: TFMTBCDField;
    CDS_V_EstoquesFinanDIF_EST_DM: TIntegerField;
    CDS_V_EstoquesFinanDIF_EST_DM_PC: TFMTBCDField;
    CDS_V_EstoquesFinanDIF_EST_DM_PV: TFMTBCDField;
    DS_V_NFeProdutos: TDataSource;
    CDS_V_NFeProdutos: TClientDataSet;
    CDS_V_NFeProdutosCOD_LOJA: TStringField;
    CDS_V_NFeProdutosCOD_PROD: TStringField;
    CDS_V_NFeProdutosDES_PROD: TStringField;
    CDS_V_NFeProdutosCOD_COMPRV: TStringField;
    CDS_V_NFeProdutosDES_COMPRV: TStringField;
    CDS_V_NFeProdutosQTD_TOTAL: TIntegerField;
    CDS_V_NFeProdutosVLR_TOTAL: TFMTBCDField;
    DSP_SelectLoja: TDataSetProvider;
    CDS_SelectLoja: TClientDataSet;
    DS_SelectLoja: TDataSource;
    SDS_SelectLoja: TSQLDataSet;
    CDS_SelectLojaCOD_LOJA: TStringField;
    CDS_SelectLojaRAZAO_SOCIAL: TStringField;
    CDS_V_EmpConexoesCOD_LINX: TIntegerField;
    CDS_V_EmpConexoesDTA_INICIO_LINX: TDateField;
    CDS_V_EmpConexoesDTA_INVENTARIO_LINX: TDateField;
    CDS_V_Creditos: TClientDataSet;
    CDS_V_CreditosDes_Credito: TStringField;
    CDS_V_CreditosCod_Credito: TStringField;
    Ds_V_Creditos: TDataSource;
    SQLQ_Busca: TSQLQuery;
    DSP_SQLQ_Busca: TDataSetProvider;
    CDS_V_MixAnaliseForn: TClientDataSet;
    CDS_V_MixAnaliseFornCOD_AUXILIAR: TStringField;
    CDS_V_MixAnaliseFornCOD_PRODUTO: TFMTBCDField;
    CDS_V_MixAnaliseFornNOME: TStringField;
    CDS_V_MixAnaliseFornABC: TStringField;
    CDS_V_MixAnaliseFornFAT_PERIODO: TFMTBCDField;
    CDS_V_MixAnaliseFornDESC_SETOR: TStringField;
    CDS_V_MixAnaliseFornDESC_COLECAO: TStringField;
    CDS_V_MixAnaliseFornLOJA1: TIntegerField;
    CDS_V_MixAnaliseFornLOJA2: TIntegerField;
    CDS_V_MixAnaliseFornLOJA3: TIntegerField;
    CDS_V_MixAnaliseFornLOJA4: TIntegerField;
    CDS_V_MixAnaliseFornLOJA5: TIntegerField;
    CDS_V_MixAnaliseFornLOJA6: TIntegerField;
    CDS_V_MixAnaliseFornLOJA7: TIntegerField;
    CDS_V_MixAnaliseFornLOJA8: TIntegerField;
    CDS_V_MixAnaliseFornLOJA9: TIntegerField;
    CDS_V_MixAnaliseFornLOJA10: TIntegerField;
    CDS_V_MixAnaliseFornLOJA11: TIntegerField;
    CDS_V_MixAnaliseFornLOJA12: TIntegerField;
    CDS_V_MixAnaliseFornLOJA13: TIntegerField;
    CDS_V_MixAnaliseFornLOJA14: TIntegerField;
    CDS_V_MixAnaliseFornLOJA15: TIntegerField;
    CDS_V_MixAnaliseFornLOJA16: TIntegerField;
    CDS_V_MixAnaliseFornLOJA17: TIntegerField;
    CDS_V_MixAnaliseFornLOJA18: TIntegerField;
    CDS_V_MixAnaliseFornLOJA19: TIntegerField;
    CDS_V_MixAnaliseFornLOJA20: TIntegerField;
    CDS_V_MixAnaliseFornLOJA21: TIntegerField;
    CDS_V_MixAnaliseFornLOJA22: TIntegerField;
    CDS_V_MixAnaliseFornLOJA23: TIntegerField;
    CDS_V_MixAnaliseFornLOJA24: TIntegerField;
    CDS_V_MixAnaliseFornLOJA25: TIntegerField;
    CDS_V_MixAnaliseFornLOJA26: TIntegerField;
    CDS_V_MixAnaliseFornLOJA27: TIntegerField;
    CDS_V_MixAnaliseFornLOJA28: TIntegerField;
    CDS_V_MixAnaliseFornLOJA29: TIntegerField;
    CDS_V_MixAnaliseFornLOJA30: TIntegerField;
    CDS_V_MixAnaliseFornLOJA31: TIntegerField;
    CDS_V_MixAnaliseFornLOJA32: TIntegerField;
    CDS_V_MixAnaliseFornLOJA33: TIntegerField;
    CDS_V_MixAnaliseFornLOJA34: TIntegerField;
    CDS_V_MixAnaliseFornLOJA35: TIntegerField;
    CDS_V_MixAnaliseFornCOD_FORNECEDOR: TIntegerField;
    CDS_V_MixAnaliseFornFORN: TStringField;
    DS_V_MixAnaliseForn: TDataSource;
    CDS_V_MixAnaliseFornIND_MULTISEL: TSmallintField;
    CDS_V_MixAnaliseFornID_COLECAO: TIntegerField;
    ClientDataSet1: TClientDataSet;
    FMTBCDField1: TFMTBCDField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FMTBCDField2: TFMTBCDField;
    FMTBCDField3: TFMTBCDField;
    FMTBCDField4: TFMTBCDField;
    FMTBCDField5: TFMTBCDField;
    FMTBCDField6: TFMTBCDField;
    FMTBCDField7: TFMTBCDField;
    FMTBCDField8: TFMTBCDField;
    FMTBCDField9: TFMTBCDField;
    FMTBCDField10: TFMTBCDField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    FMTBCDField11: TFMTBCDField;
    FMTBCDField12: TFMTBCDField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    FMTBCDField13: TFMTBCDField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    IntegerField14: TIntegerField;
    FMTBCDField14: TFMTBCDField;
    FMTBCDField15: TFMTBCDField;
    FMTBCDField16: TFMTBCDField;
    FMTBCDField17: TFMTBCDField;
    FMTBCDField18: TFMTBCDField;
    FMTBCDField19: TFMTBCDField;
    FMTBCDField20: TFMTBCDField;
    DateField1: TDateField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    FMTBCDField21: TFMTBCDField;
    FMTBCDField22: TFMTBCDField;
    StringField14: TStringField;
    FMTBCDField23: TFMTBCDField;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    IntegerField17: TIntegerField;
    DataSource2: TDataSource;
    SQLQuery1: TSQLQuery;
    DataSetProvider1: TDataSetProvider;
    CDS_V_EstoquesCOD_PRODUTO: TFMTBCDField;
    CDS_V_EstoquesDTA_INCLUSAO: TSQLTimeStampField;
    CDS_V_EstoquesCOD_SETOR: TIntegerField;
    CDS_V_EstoquesNOME_SETOR: TStringField;
    CDS_V_EstoquesCOD_LINHA: TIntegerField;
    CDS_V_EstoquesNOME_LINHA: TStringField;
    CDS_V_EstoquesCOD_MARCA: TIntegerField;
    CDS_V_EstoquesNOME_MARCA: TStringField;
    CDS_V_EstoquesCOD_COLECAO: TIntegerField;
    CDS_V_EstoquesNOME_COLECAO: TStringField;
    CDS_V_EstoquesQTD_ESTOCAGEM_4M: TIntegerField;
    CDS_V_EstoquesQTD_DISPONIVEL: TFMTBCDField;
    ClientDataSet2: TClientDataSet;
    FMTBCDField24: TFMTBCDField;
    FMTBCDField25: TFMTBCDField;
    StringField15: TStringField;
    StringField16: TStringField;
    FMTBCDField26: TFMTBCDField;
    FMTBCDField27: TFMTBCDField;
    FMTBCDField28: TFMTBCDField;
    FMTBCDField29: TFMTBCDField;
    FMTBCDField30: TFMTBCDField;
    FMTBCDField31: TFMTBCDField;
    FMTBCDField32: TFMTBCDField;
    FMTBCDField33: TFMTBCDField;
    FMTBCDField34: TFMTBCDField;
    IntegerField18: TIntegerField;
    IntegerField19: TIntegerField;
    IntegerField20: TIntegerField;
    IntegerField21: TIntegerField;
    IntegerField22: TIntegerField;
    IntegerField23: TIntegerField;
    FMTBCDField35: TFMTBCDField;
    FMTBCDField36: TFMTBCDField;
    IntegerField24: TIntegerField;
    IntegerField25: TIntegerField;
    IntegerField26: TIntegerField;
    FMTBCDField37: TFMTBCDField;
    IntegerField27: TIntegerField;
    IntegerField28: TIntegerField;
    FMTBCDField38: TFMTBCDField;
    IntegerField29: TIntegerField;
    IntegerField30: TIntegerField;
    FMTBCDField39: TFMTBCDField;
    FMTBCDField40: TFMTBCDField;
    FMTBCDField41: TFMTBCDField;
    FMTBCDField42: TFMTBCDField;
    FMTBCDField43: TFMTBCDField;
    FMTBCDField44: TFMTBCDField;
    FMTBCDField45: TFMTBCDField;
    SQLTimeStampField1: TSQLTimeStampField;
    IntegerField31: TIntegerField;
    StringField17: TStringField;
    IntegerField32: TIntegerField;
    StringField18: TStringField;
    IntegerField33: TIntegerField;
    StringField19: TStringField;
    IntegerField34: TIntegerField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    StringField23: TStringField;
    IntegerField35: TIntegerField;
    StringField24: TStringField;
    FMTBCDField46: TFMTBCDField;
    FMTBCDField47: TFMTBCDField;
    StringField25: TStringField;
    FMTBCDField48: TFMTBCDField;
    IntegerField36: TIntegerField;
    IntegerField37: TIntegerField;
    IntegerField38: TIntegerField;
    IntegerField39: TIntegerField;
    IntegerField40: TIntegerField;
    IntegerField41: TIntegerField;
    IntegerField42: TIntegerField;
    IntegerField43: TIntegerField;
    FMTBCDField49: TFMTBCDField;
    FMTBCDField50: TFMTBCDField;
    FMTBCDField51: TFMTBCDField;
    FMTBCDField52: TFMTBCDField;
    FMTBCDField53: TFMTBCDField;
    FMTBCDField54: TFMTBCDField;
    FMTBCDField55: TFMTBCDField;
    FMTBCDField56: TFMTBCDField;
    FMTBCDField57: TFMTBCDField;
    FMTBCDField58: TFMTBCDField;
    IntegerField44: TIntegerField;
    IntegerField45: TIntegerField;
    IntegerField46: TIntegerField;
    IntegerField47: TIntegerField;
    IntegerField48: TIntegerField;
    IntegerField49: TIntegerField;
    IntegerField50: TIntegerField;
    IntegerField51: TIntegerField;
    IntegerField52: TIntegerField;
    IntegerField53: TIntegerField;
    FMTBCDField59: TFMTBCDField;
    FMTBCDField60: TFMTBCDField;
    FMTBCDField61: TFMTBCDField;
    FMTBCDField62: TFMTBCDField;
    FMTBCDField63: TFMTBCDField;
    DataSource3: TDataSource;
    SQLQuery2: TSQLQuery;
    DataSetProvider2: TDataSetProvider;
    CDS_V_EstoquesCOD_COMPRADOR: TIntegerField;
    CDS_V_EstoquesDES_COMPRADOR: TStringField;
    procedure CDS_V_GruposProdutosAfterScroll(DataSet: TDataSet);
    procedure CDS_V_EstFisFinanEmpAfterScroll(DataSet: TDataSet);
    procedure CDS_V_MargemLucroFornAfterScroll(DataSet: TDataSet);
    procedure CDS_V_EstoquesAfterPost(DataSet: TDataSet);

    // Odir ====================================================================
    // Odir ====================================================================

    procedure CDS_V_EstoquesAfterEdit(DataSet: TDataSet);
    procedure CDS_V_EstoquesCalcFields(DataSet: TDataSet);
    procedure CDS_SelectLojaAfterScroll(DataSet: TDataSet);
    procedure CDS_V_NFeProdutosAfterScroll(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
    bSeProcessa1, // Se Libera FrmEstoques.Dbg_Estoques.Columns[10 e 11].ReadOnly:=True (Estoque Minimo/Maximo)
    bSeProcessa2, // Se Atualiza Valores de Estoques
    bSeCalcCurva  // Se Esta Calculando Curva ABC
    : Boolean;

    // Clients Virtuais ==========================================================
    gCDS_V1: TClientDataSet;
    gDS_V1: TDataSource;

    gCDS_V2: TClientDataSet;
    gDS_V2: TDataSource;

    gCDS_V3: TClientDataSet;
    gDS_V3: TDataSource;

    gCDS_V4: TClientDataSet;
    gDS_V4: TDataSource;

    gCDS_V5: TClientDataSet;
    gDS_V5: TDataSource;

    bgNFeProdutos: Boolean; // Se Executa o Evento: TDMVirtual.CDS_V_NFeProdutosAfterScroll(DataSet: TDataSet);
  end;

var
  DMVirtual: TDMVirtual;

  TD: TTransactionDesc;

  iQtdEstMinOld, iQtdEstMinNew: Integer;
  iQtdEstMaxOld, iQtdEstMaxNew: Integer;

implementation

uses UFrmEstoques, UFrmBelShop, UDMBelShop, DK_Procs1;

// uses SysConst;

{$R *.dfm}

//==============================================================================
// ODIR - Inicio ===============================================================
//==============================================================================

//==============================================================================
// ODIR - Fim ==================================================================
//==============================================================================

procedure TDMVirtual.CDS_V_GruposProdutosAfterScroll(DataSet: TDataSet);
Var
  sCodGrupo: String;
begin
  If Not CDS_V_GruposProdutos.IsEmpty Then
  Begin
    CDS_V_SubGruposProdutos.Filtered:=False;
    If Not CDS_V_SubGruposProdutos.IsEmpty Then
    Begin
      sCodGrupo:='99999999';
      If Trim(CDS_V_GruposProdutosCod_Grupo.AsString)<>'' Then
       sCodGrupo:=CDS_V_GruposProdutosCod_Grupo.AsString;

      CDS_V_SubGruposProdutos.Filter:='Cod_Grupo='+sCodGrupo;

      CDS_V_SubGruposProdutos.Filtered:=True;
    End; // If Not CDS_V_SubGruposProdutos.IsEmpty Then
  End; // If Not CDS_V_GruposProdutos.IsEmpty Then

end;

procedure TDMVirtual.CDS_V_EstFisFinanEmpAfterScroll(DataSet: TDataSet);
begin
  If (Not CDS_V_EstFisFinanLojas.IsEmpty) and (Trim(CDS_V_EstFisFinanEmpINDICE.AsString)<>'') Then
  Begin
    CDS_V_EstFisFinanLojas.Filtered:=False;
    CDS_V_EstFisFinanLojas.Filter:='LINK = '+CDS_V_EstFisFinanEmpINDICE.AsString+
    ' OR LINK=999999';
    CDS_V_EstFisFinanLojas.Filtered:=True;
  End; // If Not CDS_V_EstFisFinanLojas.IsEmpty Then

end;

procedure TDMVirtual.CDS_V_MargemLucroFornAfterScroll(DataSet: TDataSet);
begin
  If Not CDS_V_MargemLucroScroll.IsEmpty Then
  Begin
    CDS_V_MargemLucroScroll.Filtered:=False;
    CDS_V_MargemLucroScroll.Filter:='CODFORNECEDOR='+QuotedStr(
                                   CDS_V_MargemLucroFornCODFORNECEDOR.AsString);
    CDS_V_MargemLucroScroll.Filtered:=True;
  End; // If Not CDS_V_MargemLucroScroll.IsEmpty Then

end;

procedure TDMVirtual.CDS_V_EstoquesAfterPost(DataSet: TDataSet);
var
  MySql, s: string;
  bAtualizar: Boolean;
  sMix, sProdSidicom: String;
begin
  bAtualizar:=False;

  If Not FrmEstoques.Dbg_Estoques.Columns[10].ReadOnly Then
  Begin
    If igNrEmpProc=1 Then bAtualizar:=True;

    iQtdEstMinNew :=CDS_V_EstoquesEST_IDEAL.AsInteger;
    iQtdEstMaxNew :=CDS_V_EstoquesEST_MAXIMO.AsInteger;
  End;

  // Atualiza Produtos na Curva ABC Financeira ===============================
  If (bAtualizar) and (Not bSeCalcCurva) Then
  Begin
    If (iQtdEstMinOld<>iQtdEstMinNew) Or (iQtdEstMaxOld<>iQtdEstMaxNew)  Then
    Begin
      If DMBelShop.SQLC.InTransaction Then
       DMBelShop.SQLC.Rollback(TD);

      // Monta Transacao ===========================================================
      TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
      TD.IsolationLevel:=xilREADCOMMITTED;
      DMBelShop.SQLC.StartTransaction(TD);
      Try
        // Atualiza ES_FINAN_CURVA_ABC
        MySql:=' UPDATE ES_FINAN_CURVA_ABC c'+
               ' SET c.EST_MINIMO='+QuotedStr(CDS_V_EstoquesEST_IDEAL.AsString)+
               ', c.EST_MAXIMO='+QuotedStr(CDS_V_EstoquesEST_MAXIMO.AsString)+
               ', c.USU_ALTERA='+QuotedStr(Cod_Usuario)+
               ', c.DTA_ALTERA=current_timestamp'+
               ' WHERE C.COD_LINX='+IntToStr(igCodLojaLinx)+
               ' AND C.COD_PROD_LINX='+CDS_V_EstoquesCOD_PRODUTO.AsString;
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        sMix:='0';
        If CDS_V_EstoquesEST_IDEAL.AsInteger>0 Then
         sMix:='1';

        // Produto Sidicom
        MySql:=' SELECT'+
               ' CASE'+
               '   WHEN CHAR_LENGTH(TRIM(p.cod_auxiliar))>6 THEN'+
               '     NULL'+
               '   ELSE'+
               '     TRIM(p.cod_auxiliar)'+
               ' END COD_AUXILIAR'+
               ' FROM LINXPRODUTOS p'+
               ' WHERE p.cod_produto='+CDS_V_EstoquesCOD_PRODUTO.AsString;
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;
        sProdSidicom:=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Auxiliar').AsString);
        DMBelShop.CDS_BuscaRapida.Close;

        // Atualiza ES_PRODUTOS_MIX
        MySql:=' UPDATE OR INSERT INTO ES_PRODUTOS_MIX'+
               ' (COD_LOJA, EMPRESA, CODPRODUTO, COD_PRODUTO, IND_CURVA, IND_MIX, DTA_ATUALIZACAO)'+
               'VALUES ('+
               QuotedStr(sgCodEmp)+', '+ // COD_LOJA
               IntToStr(igCodLojaLinx)+', '+ // EMPRESA
               QuotedStr(sProdSidicom)+', '+ // CODPRODUTO
               CDS_V_EstoquesCOD_PRODUTO.AsString+', '+ // COD_PRODUTO
               QuotedStr(CDS_V_EstoquesIND_CURVA.AsString)+', '+ // IND_CURVA
               sMix+', '+ // IND_MIX
               ' CURRENT_DATE)'+ //DTA_ATUALIZACAO
               ' MATCHING (EMPRESA, COD_PRODUTO)';
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        // Atualiza Transacao ====================================================
        DMBelShop.SQLC.Commit(TD);
      Except
        on e : Exception do
        Begin
          // Abandona Transacao ==================================================
          DMBelShop.SQLC.Rollback(TD);
        End; // on e : Exception do
      End; // Try
    End; // If iQtdEstMinOld<>iQtdEstMinNew Then
  End; // If (bAtualizar) and (Not bSeCalcCurva) Then

end;

procedure TDMVirtual.CDS_V_EstoquesAfterEdit(DataSet: TDataSet);
var
 MySql, s: string;
begin
  If Not FrmEstoques.Dbg_Estoques.Columns[10].ReadOnly Then
  Begin
    iQtdEstMinOld :=CDS_V_EstoquesEST_IDEAL.AsInteger;
    iQtdEstMaxOld :=CDS_V_EstoquesEST_MAXIMO.AsInteger;
  End;

end;

procedure TDMVirtual.CDS_V_EstoquesCalcFields(DataSet: TDataSet);
begin
  // Acerta N�mero do Registro =================================================
  CDS_V_EstoquesNUM_LINHA.AsInteger:=CDS_V_Estoques.RecNo;
end;

procedure TDMVirtual.CDS_SelectLojaAfterScroll(DataSet: TDataSet);
begin
  If bgNFeProdutos Then
  Begin
    CDS_V_NFeProdutos.DisableControls;
    CDS_V_NFeProdutos.Close;
    CDS_V_NFeProdutos.Filtered:=False;
    CDS_V_NFeProdutos.Filter:='COD_LOJA='+QuotedStr(Copy(CDS_SelectLojaCOD_LOJA.AsString,5,2));
    CDS_V_NFeProdutos.Filtered:=True;
    CDS_V_NFeProdutos.Open;
    CDS_V_NFeProdutos.EnableControls;
  End;

end;

procedure TDMVirtual.CDS_V_NFeProdutosAfterScroll(DataSet: TDataSet);
begin
  If (CDS_V_NFeProdutosCOD_PROD.AsString='TOTAIS') And (bgNFeProdutos) Then
  Begin
    CDS_V_NFeProdutos.Next;
  End;

end;

end.

