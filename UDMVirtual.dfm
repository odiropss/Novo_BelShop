object DMVirtual: TDMVirtual
  OldCreateOrder = False
  Left = 239
  Top = 109
  Height = 615
  Width = 1097
  object CDS_V_EmpConexoes: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'COD_EMP'
    Params = <>
    Left = 65
    Top = 8
    object CDS_V_EmpConexoesCONECTAR: TStringField
      FieldName = 'CONECTAR'
      Size = 3
    end
    object CDS_V_EmpConexoesCOD_FILIAL: TStringField
      Alignment = taRightJustify
      FieldName = 'COD_FILIAL'
      Size = 2
    end
    object CDS_V_EmpConexoesENDERECO_IP: TStringField
      FieldName = 'ENDERECO_IP'
      Size = 30
    end
    object CDS_V_EmpConexoesPASTA_BASE_DADOS: TStringField
      FieldName = 'PASTA_BASE_DADOS'
      Size = 100
    end
    object CDS_V_EmpConexoesDES_BASE_DADOS: TStringField
      FieldName = 'DES_BASE_DADOS'
      Size = 100
    end
    object CDS_V_EmpConexoesCOD_EMP: TStringField
      Alignment = taRightJustify
      FieldName = 'COD_EMP'
      Size = 6
    end
    object CDS_V_EmpConexoesRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 60
    end
    object CDS_V_EmpConexoesTIP_EMP: TStringField
      Alignment = taCenter
      FieldName = 'TIP_EMP'
      Size = 1
    end
    object CDS_V_EmpConexoesDES_BAIRRO: TStringField
      FieldName = 'DES_BAIRRO'
      Size = 30
    end
    object CDS_V_EmpConexoesDES_CIDADE: TStringField
      FieldName = 'DES_CIDADE'
      Size = 60
    end
    object CDS_V_EmpConexoesCOD_UF: TStringField
      FieldName = 'COD_UF'
      Size = 2
    end
    object CDS_V_EmpConexoesCOD_CEP: TStringField
      FieldName = 'COD_CEP'
      Size = 8
    end
    object CDS_V_EmpConexoesNUM_CNPJ: TStringField
      FieldName = 'NUM_CNPJ'
      Size = 18
    end
    object CDS_V_EmpConexoesINSCR_ESTADUAL: TStringField
      FieldName = 'INSCR_ESTADUAL'
      Size = 18
    end
    object CDS_V_EmpConexoesDES_ENDERECO: TStringField
      FieldName = 'DES_ENDERECO'
      Size = 60
    end
    object CDS_V_EmpConexoesNUM_ENDERECO: TStringField
      Alignment = taRightJustify
      FieldName = 'NUM_ENDERECO'
      Size = 15
    end
    object CDS_V_EmpConexoesCOMPL_ENDERECO: TStringField
      FieldName = 'COMPL_ENDERECO'
      Size = 30
    end
    object CDS_V_EmpConexoesIND_ATIVO: TStringField
      Alignment = taCenter
      FieldName = 'IND_ATIVO'
      Size = 3
    end
    object CDS_V_EmpConexoesCONEXAO: TStringField
      Alignment = taCenter
      FieldName = 'CONEXAO'
      Size = 3
    end
    object CDS_V_EmpConexoesDATABASE: TStringField
      FieldName = 'DATABASE'
      Size = 15
    end
    object CDS_V_EmpConexoesTRANSACAO: TStringField
      FieldName = 'TRANSACAO'
      Size = 15
    end
    object CDS_V_EmpConexoesCOD_LISTAPRE: TStringField
      FieldName = 'COD_LISTAPRE'
      Size = 4
    end
    object CDS_V_EmpConexoesCOD_LINX: TIntegerField
      FieldName = 'COD_LINX'
    end
    object CDS_V_EmpConexoesDTA_INICIO_LINX: TDateField
      FieldName = 'DTA_INICIO_LINX'
    end
    object CDS_V_EmpConexoesDTA_INVENTARIO_LINX: TDateField
      FieldName = 'DTA_INVENTARIO_LINX'
    end
  end
  object DS_V_GruposProdutos: TDataSource
    DataSet = CDS_V_GruposProdutos
    Left = 269
    Top = 130
  end
  object CDS_V_SubGruposProdutos: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Des_SubGrupo'
    Params = <>
    Left = 217
    Top = 179
    object CDS_V_SubGruposProdutosCod_SubGrupo: TStringField
      Alignment = taRightJustify
      FieldName = 'Cod_SubGrupo'
      Size = 4
    end
    object CDS_V_SubGruposProdutosDes_SubGrupo: TStringField
      FieldName = 'Des_SubGrupo'
      Size = 30
    end
    object CDS_V_SubGruposProdutosCod_Grupo: TStringField
      Alignment = taRightJustify
      FieldName = 'Cod_Grupo'
      Size = 3
    end
    object CDS_V_SubGruposProdutosCod_GrupoSub: TStringField
      Alignment = taRightJustify
      FieldName = 'Cod_GrupoSub'
      Size = 7
    end
  end
  object DS_V_SubGruposProdutos: TDataSource
    DataSet = CDS_V_SubGruposProdutos
    Left = 269
    Top = 195
  end
  object CDS_V_Fornecedores: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Des_Fornecedor'
    Params = <>
    Left = 217
    Top = 58
    object CDS_V_FornecedoresDes_Fornecedor: TStringField
      FieldName = 'Des_Fornecedor'
      Size = 50
    end
    object CDS_V_FornecedoresCod_Fornecedor: TStringField
      Alignment = taRightJustify
      FieldName = 'Cod_Fornecedor'
      Size = 6
    end
  end
  object DS_V_Fornecedores: TDataSource
    DataSet = CDS_V_Fornecedores
    Left = 269
    Top = 74
  end
  object CDS_V_Aplicacao: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Des_Aplicacao'
    Params = <>
    Left = 217
    Top = 243
    object CDS_V_AplicacaoDes_Aplicacao: TStringField
      FieldName = 'Des_Aplicacao'
      Size = 30
    end
    object CDS_V_AplicacaoCod_Aplicacao: TStringField
      Alignment = taRightJustify
      FieldName = 'Cod_Aplicacao'
      Size = 4
    end
  end
  object DS_V_Aplicacao: TDataSource
    DataSet = CDS_V_Aplicacao
    Left = 269
    Top = 259
  end
  object CDS_V_FamiliaPrecos: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Des_FamiliaPreco'
    Params = <>
    Left = 217
    Top = 300
    object CDS_V_FamiliaPrecosDes_FamiliaPreco: TStringField
      FieldName = 'Des_FamiliaPreco'
      Size = 40
    end
    object CDS_V_FamiliaPrecosCod_FamiliaPreco: TStringField
      Alignment = taRightJustify
      FieldName = 'Cod_FamiliaPreco'
      Size = 4
    end
  end
  object DS_V_FamiliaPrecos: TDataSource
    DataSet = CDS_V_FamiliaPrecos
    Left = 269
    Top = 316
  end
  object CDS_V_GrupoST: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Des_GrupoST'
    Params = <>
    Left = 217
    Top = 364
    object CDS_V_GrupoSTDes_GrupoST: TStringField
      FieldName = 'Des_GrupoST'
      Size = 30
    end
    object CDS_V_GrupoSTCod_GrupoST: TStringField
      Alignment = taRightJustify
      FieldName = 'Cod_GrupoST'
      Size = 4
    end
  end
  object DS_V_GrupoST: TDataSource
    DataSet = CDS_V_GrupoST
    Left = 269
    Top = 380
  end
  object CDS_GruposST: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Des_GrupoST'
    Params = <>
    Left = 217
    Top = 428
    object CDS_GruposSTDes_GrupoST: TStringField
      FieldName = 'Des_GrupoST'
      Size = 30
    end
    object CDS_GruposSTCod_GrupoST: TIntegerField
      FieldName = 'Cod_GrupoST'
    end
  end
  object DS_GruposST: TDataSource
    DataSet = CDS_GruposST
    Left = 269
    Top = 444
  end
  object CDS_V_Produtos: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Cod_Produto'
    Params = <>
    Left = 217
    Top = 7
    object CDS_V_ProdutosCod_Produto: TStringField
      FieldName = 'Cod_Produto'
      Size = 6
    end
    object CDS_V_ProdutosDes_Produto: TStringField
      FieldName = 'Des_Produto'
      Size = 80
    end
    object CDS_V_ProdutosCod_Fornecedor: TStringField
      FieldName = 'Cod_Fornecedor'
      Size = 6
    end
  end
  object DS_V_Produtos: TDataSource
    DataSet = CDS_V_Produtos
    Left = 269
    Top = 23
  end
  object CDS_V_GruposProdutos: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Des_Grupo'
    Params = <>
    AfterScroll = CDS_V_GruposProdutosAfterScroll
    Left = 217
    Top = 117
    object CDS_V_GruposProdutosDes_Grupo: TStringField
      FieldName = 'Des_Grupo'
      Size = 30
    end
    object CDS_V_GruposProdutosCod_Grupo: TStringField
      Alignment = taRightJustify
      FieldName = 'Cod_Grupo'
      Size = 3
    end
  end
  object CDS_V_PlanFinanceira: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'INDICE'
    Params = <>
    Left = 65
    Top = 80
    object CDS_V_PlanFinanceiraTipo: TStringField
      FieldName = 'Tipo'
    end
    object CDS_V_PlanFinanceiraCod_Comprovante: TStringField
      Alignment = taRightJustify
      FieldName = 'Cod_Comprovante'
      Size = 4
    end
    object CDS_V_PlanFinanceiraDes_Comprovante: TStringField
      FieldName = 'Des_Comprovante'
      Size = 35
    end
    object CDS_V_PlanFinanceiraVlr_Empresa01: TCurrencyField
      FieldName = 'Vlr_Empresa01'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa02: TCurrencyField
      FieldName = 'Vlr_Empresa02'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa03: TCurrencyField
      FieldName = 'Vlr_Empresa03'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa04: TCurrencyField
      FieldName = 'Vlr_Empresa04'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa05: TCurrencyField
      FieldName = 'Vlr_Empresa05'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa06: TCurrencyField
      FieldName = 'Vlr_Empresa06'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa07: TCurrencyField
      FieldName = 'Vlr_Empresa07'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa08: TCurrencyField
      FieldName = 'Vlr_Empresa08'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa09: TCurrencyField
      FieldName = 'Vlr_Empresa09'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa10: TCurrencyField
      FieldName = 'Vlr_Empresa10'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa11: TCurrencyField
      FieldName = 'Vlr_Empresa11'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa12: TCurrencyField
      FieldName = 'Vlr_Empresa12'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa13: TCurrencyField
      FieldName = 'Vlr_Empresa13'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa14: TCurrencyField
      FieldName = 'Vlr_Empresa14'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa15: TCurrencyField
      FieldName = 'Vlr_Empresa15'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa16: TCurrencyField
      FieldName = 'Vlr_Empresa16'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa17: TCurrencyField
      FieldName = 'Vlr_Empresa17'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa18: TCurrencyField
      FieldName = 'Vlr_Empresa18'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa19: TCurrencyField
      FieldName = 'Vlr_Empresa19'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa20: TCurrencyField
      FieldName = 'Vlr_Empresa20'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa21: TCurrencyField
      FieldName = 'Vlr_Empresa21'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa22: TCurrencyField
      FieldName = 'Vlr_Empresa22'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa23: TCurrencyField
      FieldName = 'Vlr_Empresa23'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa24: TCurrencyField
      FieldName = 'Vlr_Empresa24'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa25: TCurrencyField
      FieldName = 'Vlr_Empresa25'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa26: TCurrencyField
      FieldName = 'Vlr_Empresa26'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa27: TCurrencyField
      FieldName = 'Vlr_Empresa27'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa28: TCurrencyField
      FieldName = 'Vlr_Empresa28'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa29: TCurrencyField
      FieldName = 'Vlr_Empresa29'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa30: TCurrencyField
      FieldName = 'Vlr_Empresa30'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa50: TCurrencyField
      FieldName = 'Vlr_Empresa50'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa98: TCurrencyField
      FieldName = 'Vlr_Empresa98'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa99: TCurrencyField
      FieldName = 'Vlr_Empresa99'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Empresa_Total: TCurrencyField
      DisplayLabel = 'TOTAL EMPRESA'
      FieldName = 'Vlr_Empresa_Total'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraINDICE: TIntegerField
      FieldName = 'INDICE'
      Visible = False
    end
    object CDS_V_PlanFinanceiraVisivel: TBooleanField
      FieldName = 'Visivel'
      Visible = False
    end
    object CDS_V_PlanFinanceiraVlr_Mes01: TCurrencyField
      FieldName = 'Vlr_Mes01'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Mes02: TCurrencyField
      FieldName = 'Vlr_Mes02'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Mes03: TCurrencyField
      FieldName = 'Vlr_Mes03'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Mes04: TCurrencyField
      FieldName = 'Vlr_Mes04'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Mes05: TCurrencyField
      FieldName = 'Vlr_Mes05'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Mes06: TCurrencyField
      FieldName = 'Vlr_Mes06'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Mes07: TCurrencyField
      FieldName = 'Vlr_Mes07'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Mes08: TCurrencyField
      FieldName = 'Vlr_Mes08'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Mes09: TCurrencyField
      FieldName = 'Vlr_Mes09'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Mes10: TCurrencyField
      FieldName = 'Vlr_Mes10'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Mes11: TCurrencyField
      FieldName = 'Vlr_Mes11'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanFinanceiraVlr_Mes12: TCurrencyField
      FieldName = 'Vlr_Mes12'
      Visible = False
      DisplayFormat = '0.,00'
    end
  end
  object DS_V_PlanFinanceira: TDataSource
    DataSet = CDS_V_PlanFinanceira
    Left = 101
    Top = 96
  end
  object CDS_V_ApresComprovantes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 65
    Top = 152
    object CDS_V_ApresComprovantesDATACOMPROVANTE: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Comprov'
      FieldName = 'DATACOMPROVANTE'
    end
    object CDS_V_ApresComprovantesDATADOCUMENTO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Docto'
      FieldName = 'DATADOCUMENTO'
    end
    object CDS_V_ApresComprovantesCOMP_ANOMES: TStringField
      Alignment = taCenter
      DisplayLabel = 'Ano/M'#234's'
      FieldName = 'COMP_ANOMES'
      Size = 13
    end
    object CDS_V_ApresComprovantesCOD_CLI_FOR: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Cli For'
      FieldName = 'COD_CLI_FOR'
      FixedChar = True
      Size = 6
    end
    object CDS_V_ApresComprovantesNOME_CLI_FOR: TStringField
      DisplayLabel = 'Nome Cli For'
      FieldName = 'NOME_CLI_FOR'
      Size = 40
    end
    object CDS_V_ApresComprovantesVLR_COMPROVANTE: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VLR_COMPROVANTE'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
  end
  object DS_V_ApresComprovantes: TDataSource
    DataSet = CDS_V_ApresComprovantes
    Left = 101
    Top = 168
  end
  object CDS_V_PlanDemonsResultados: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'INDICE'
    Params = <>
    Left = 65
    Top = 216
    object CDS_V_PlanDemonsResultadosCod_Demonstrativo: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Cod_Demonstrativo'
      Size = 4
    end
    object CDS_V_PlanDemonsResultadosDes_Demonstrativo: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Des_Demonstrativo'
      Size = 35
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa01: TCurrencyField
      FieldName = 'Vlr_Empresa01'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa02: TCurrencyField
      FieldName = 'Vlr_Empresa02'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa03: TCurrencyField
      FieldName = 'Vlr_Empresa03'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa04: TCurrencyField
      FieldName = 'Vlr_Empresa04'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa05: TCurrencyField
      FieldName = 'Vlr_Empresa05'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa06: TCurrencyField
      FieldName = 'Vlr_Empresa06'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa07: TCurrencyField
      FieldName = 'Vlr_Empresa07'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa08: TCurrencyField
      FieldName = 'Vlr_Empresa08'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa09: TCurrencyField
      FieldName = 'Vlr_Empresa09'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa10: TCurrencyField
      FieldName = 'Vlr_Empresa10'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa11: TCurrencyField
      FieldName = 'Vlr_Empresa11'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa12: TCurrencyField
      FieldName = 'Vlr_Empresa12'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa13: TCurrencyField
      FieldName = 'Vlr_Empresa13'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa14: TCurrencyField
      FieldName = 'Vlr_Empresa14'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa15: TCurrencyField
      FieldName = 'Vlr_Empresa15'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa16: TCurrencyField
      FieldName = 'Vlr_Empresa16'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa17: TCurrencyField
      FieldName = 'Vlr_Empresa17'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa18: TCurrencyField
      FieldName = 'Vlr_Empresa18'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa19: TCurrencyField
      FieldName = 'Vlr_Empresa19'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa20: TCurrencyField
      FieldName = 'Vlr_Empresa20'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa21: TCurrencyField
      FieldName = 'Vlr_Empresa21'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa22: TCurrencyField
      FieldName = 'Vlr_Empresa22'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa23: TCurrencyField
      FieldName = 'Vlr_Empresa23'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa24: TCurrencyField
      FieldName = 'Vlr_Empresa24'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa25: TCurrencyField
      FieldName = 'Vlr_Empresa25'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa26: TCurrencyField
      FieldName = 'Vlr_Empresa26'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa27: TCurrencyField
      FieldName = 'Vlr_Empresa27'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa28: TCurrencyField
      FieldName = 'Vlr_Empresa28'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa29: TCurrencyField
      FieldName = 'Vlr_Empresa29'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa30: TCurrencyField
      FieldName = 'Vlr_Empresa30'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa50: TCurrencyField
      FieldName = 'Vlr_Empresa50'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa98: TCurrencyField
      FieldName = 'Vlr_Empresa98'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa99: TCurrencyField
      FieldName = 'Vlr_Empresa99'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosVlr_Empresa_Total: TCurrencyField
      DisplayLabel = 'TOTAL EMPRESA'
      FieldName = 'Vlr_Empresa_Total'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanDemonsResultadosINDICE: TIntegerField
      FieldName = 'INDICE'
      Visible = False
    end
  end
  object DS_V_PlanDemonsResultados: TDataSource
    DataSet = CDS_V_PlanDemonsResultados
    Left = 101
    Top = 232
  end
  object CDS_V_CurvaABCEndereco: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 46
    Top = 488
    object CDS_V_CurvaABCEnderecoSEQ: TIntegerField
      DisplayLabel = 'Seq'
      FieldName = 'SEQ'
    end
    object CDS_V_CurvaABCEnderecoCOD_PRODUTO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PRODUTO'
      Size = 6
    end
    object CDS_V_CurvaABCEnderecoDES_PRODUTO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_PRODUTO'
      Size = 80
    end
    object CDS_V_CurvaABCEnderecoIND_CURVA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Curva'
      FieldName = 'IND_CURVA'
      Size = 1
    end
    object CDS_V_CurvaABCEnderecoVLR_REFERENCIA: TCurrencyField
      FieldName = 'VLR_REFERENCIA'
      DisplayFormat = '0.,00'
    end
    object CDS_V_CurvaABCEnderecoPER_PARTICIPACAO: TCurrencyField
      DisplayLabel = '% Participa'#231#227'o'
      FieldName = 'PER_PARTICIPACAO'
      DisplayFormat = '0.,0000'
    end
    object CDS_V_CurvaABCEnderecoDTA_INCLUSAO: TDateField
      DisplayLabel = 'Data Inclus'#227'o'
      FieldName = 'DTA_INCLUSAO'
    end
    object CDS_V_CurvaABCEnderecoQTD_ESTOQUE: TCurrencyField
      DisplayLabel = 'Estoque'
      FieldName = 'QTD_ESTOQUE'
      DisplayFormat = '0.,00'
    end
    object CDS_V_CurvaABCEnderecoEST_IDEAL: TCurrencyField
      DisplayLabel = 'Est. Ideal'
      FieldName = 'EST_IDEAL'
      DisplayFormat = '0.,00'
    end
    object CDS_V_CurvaABCEnderecoEST_MAXIMO: TCurrencyField
      DisplayLabel = 'Est. M'#225'ximo'
      FieldName = 'EST_MAXIMO'
      DisplayFormat = '0.,00'
    end
    object CDS_V_CurvaABCEnderecoVLR_PC_CUSTO: TCurrencyField
      DisplayLabel = 'P'#231' Custo'
      FieldName = 'VLR_PC_CUSTO'
      DisplayFormat = '0.,00'
    end
    object CDS_V_CurvaABCEnderecoVLR_TOTAL_CUSTO: TCurrencyField
      DisplayLabel = 'Total P'#231' Custo'
      FieldName = 'VLR_TOTAL_CUSTO'
      DisplayFormat = '0.,00'
    end
    object CDS_V_CurvaABCEnderecoVLR_PC_VENDA: TCurrencyField
      DisplayLabel = 'P'#231' Venda'
      FieldName = 'VLR_PC_VENDA'
      DisplayFormat = '0.,00'
    end
    object CDS_V_CurvaABCEnderecoVLR_TOTAL_VENDA: TCurrencyField
      DisplayLabel = 'Total P'#231' Venda'
      FieldName = 'VLR_TOTAL_VENDA'
      DisplayFormat = '0.,00'
    end
    object CDS_V_CurvaABCEnderecoPER_MARGEM: TCurrencyField
      DisplayLabel = '% Margem'
      FieldName = 'PER_MARGEM'
      DisplayFormat = '0.,00'
    end
    object CDS_V_CurvaABCEnderecoVLR_MARGEM: TCurrencyField
      DisplayLabel = 'Valor Margem'
      FieldName = 'VLR_MARGEM'
      DisplayFormat = '0.,00'
    end
    object CDS_V_CurvaABCEnderecoDES_ZONA: TIntegerField
      DisplayLabel = 'Zona'
      FieldName = 'DES_ZONA'
      Visible = False
    end
    object CDS_V_CurvaABCEnderecoDES_CORREDOR: TStringField
      DisplayLabel = 'Corredor'
      FieldName = 'DES_CORREDOR'
      Visible = False
      Size = 3
    end
    object CDS_V_CurvaABCEnderecoDES_PRATELEIRA: TStringField
      DisplayLabel = 'Prateleira'
      FieldName = 'DES_PRATELEIRA'
      Visible = False
      Size = 3
    end
    object CDS_V_CurvaABCEnderecoDES_GAVETA: TStringField
      DisplayLabel = 'Gaveta'
      FieldName = 'DES_GAVETA'
      Visible = False
      Size = 4
    end
    object CDS_V_CurvaABCEnderecoIND_SITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'IND_SITUACAO'
    end
    object CDS_V_CurvaABCEnderecoCOD_FORNECEDOR: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Forn'
      FieldName = 'COD_FORNECEDOR'
      Size = 6
    end
    object CDS_V_CurvaABCEnderecoDES_FORNECEDOR: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'DES_FORNECEDOR'
      Size = 60
    end
    object CDS_V_CurvaABCEnderecoIND_EMP_ATUALIZADA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Emp Atualizada'
      FieldName = 'IND_EMP_ATUALIZADA'
      Size = 3
    end
    object CDS_V_CurvaABCEnderecoQTD_DEMANDA: TCurrencyField
      FieldName = 'QTD_DEMANDA'
      Visible = False
    end
    object CDS_V_CurvaABCEnderecoORDENAR: TIntegerField
      FieldName = 'ORDENAR'
      Visible = False
    end
  end
  object DS_V_CurvaABCEndereco: TDataSource
    DataSet = CDS_V_CurvaABCEndereco
    Left = 97
    Top = 504
  end
  object CDS_V_PlanoContasCompr200: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Des_PlanoContas'
    Params = <>
    Left = 65
    Top = 280
    object CDS_V_PlanoContasCompr200Des_PlanoContas: TStringField
      DisplayLabel = 'Plano de Contas'
      FieldName = 'Des_PlanoContas'
      Size = 35
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa01: TCurrencyField
      FieldName = 'Vlr_Empresa01'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa02: TCurrencyField
      FieldName = 'Vlr_Empresa02'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa03: TCurrencyField
      FieldName = 'Vlr_Empresa03'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa04: TCurrencyField
      FieldName = 'Vlr_Empresa04'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa05: TCurrencyField
      FieldName = 'Vlr_Empresa05'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa06: TCurrencyField
      FieldName = 'Vlr_Empresa06'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa07: TCurrencyField
      FieldName = 'Vlr_Empresa07'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa08: TCurrencyField
      FieldName = 'Vlr_Empresa08'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa09: TCurrencyField
      FieldName = 'Vlr_Empresa09'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa10: TCurrencyField
      FieldName = 'Vlr_Empresa10'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa11: TCurrencyField
      FieldName = 'Vlr_Empresa11'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa12: TCurrencyField
      FieldName = 'Vlr_Empresa12'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa13: TCurrencyField
      FieldName = 'Vlr_Empresa13'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa14: TCurrencyField
      FieldName = 'Vlr_Empresa14'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa15: TCurrencyField
      FieldName = 'Vlr_Empresa15'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa16: TCurrencyField
      FieldName = 'Vlr_Empresa16'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa17: TCurrencyField
      FieldName = 'Vlr_Empresa17'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa18: TCurrencyField
      FieldName = 'Vlr_Empresa18'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa19: TCurrencyField
      FieldName = 'Vlr_Empresa19'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa20: TCurrencyField
      FieldName = 'Vlr_Empresa20'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa21: TCurrencyField
      FieldName = 'Vlr_Empresa21'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa22: TCurrencyField
      FieldName = 'Vlr_Empresa22'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa23: TCurrencyField
      FieldName = 'Vlr_Empresa23'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa24: TCurrencyField
      FieldName = 'Vlr_Empresa24'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa25: TCurrencyField
      FieldName = 'Vlr_Empresa25'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa26: TCurrencyField
      FieldName = 'Vlr_Empresa26'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa27: TCurrencyField
      FieldName = 'Vlr_Empresa27'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa28: TCurrencyField
      FieldName = 'Vlr_Empresa28'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa29: TCurrencyField
      FieldName = 'Vlr_Empresa29'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa30: TCurrencyField
      FieldName = 'Vlr_Empresa30'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa50: TCurrencyField
      FieldName = 'Vlr_Empresa50'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa99: TCurrencyField
      FieldName = 'Vlr_Empresa99'
      Visible = False
      DisplayFormat = '0.,00'
    end
    object CDS_V_PlanoContasCompr200Vlr_Empresa_Total: TCurrencyField
      DisplayLabel = 'TOTAL EMPRESA'
      FieldName = 'Vlr_Empresa_Total'
      Visible = False
      DisplayFormat = '0.,00'
    end
  end
  object DS_V_PlanoContasCompr200: TDataSource
    DataSet = CDS_V_PlanoContasCompr200
    Left = 101
    Top = 296
  end
  object DS_V_ObjetivosDias: TDataSource
    DataSet = CDS_V_ObjetivosDias
    Left = 632
    Top = 17
  end
  object CDS_V_ObjetivosDias: TClientDataSet
    Aggregates = <>
    Filter = 'VISIVEL='#39'S'#39
    Filtered = True
    IndexFieldNames = 'INDICE'
    Params = <>
    Left = 576
    Top = 9
    object CDS_V_ObjetivosDiasCod_Objetivo: TIntegerField
      FieldName = 'Cod_Objetivo'
    end
    object CDS_V_ObjetivosDiasDes_Objetivo: TStringField
      FieldName = 'Des_Objetivo'
      Size = 50
    end
    object CDS_V_ObjetivosDiasVlr_Objetivo: TCurrencyField
      FieldName = 'Vlr_Objetivo'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasCod_Emp: TStringField
      FieldName = 'Cod_Emp'
      Size = 4
    end
    object CDS_V_ObjetivosDiasDes_Empresa: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'Des_Empresa'
      Size = 10
    end
    object CDS_V_ObjetivosDiasTipo: TStringField
      FieldName = 'Tipo'
      Size = 40
    end
    object CDS_V_ObjetivosDiasVlr_Dia01: TCurrencyField
      DisplayLabel = 'Dia_01'
      FieldName = 'Vlr_Dia01'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia02: TCurrencyField
      DisplayLabel = 'Dia_02'
      FieldName = 'Vlr_Dia02'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia03: TCurrencyField
      DisplayLabel = 'Dia_03'
      FieldName = 'Vlr_Dia03'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia04: TCurrencyField
      DisplayLabel = 'Dia_04'
      FieldName = 'Vlr_Dia04'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia05: TCurrencyField
      DisplayLabel = 'Dia_05'
      FieldName = 'Vlr_Dia05'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia06: TCurrencyField
      DisplayLabel = 'Dia_06'
      FieldName = 'Vlr_Dia06'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia07: TCurrencyField
      DisplayLabel = 'Dia_07'
      FieldName = 'Vlr_Dia07'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia08: TCurrencyField
      DisplayLabel = 'Dia_08'
      FieldName = 'Vlr_Dia08'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia09: TCurrencyField
      DisplayLabel = 'Dia_09'
      FieldName = 'Vlr_Dia09'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia10: TCurrencyField
      DisplayLabel = 'Dia_10'
      FieldName = 'Vlr_Dia10'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia11: TCurrencyField
      DisplayLabel = 'Dia_11'
      FieldName = 'Vlr_Dia11'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia12: TCurrencyField
      DisplayLabel = 'Dia_12'
      FieldName = 'Vlr_Dia12'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia13: TCurrencyField
      DisplayLabel = 'Dia_13'
      FieldName = 'Vlr_Dia13'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia14: TCurrencyField
      DisplayLabel = 'Dia_14'
      FieldName = 'Vlr_Dia14'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia15: TCurrencyField
      DisplayLabel = 'Dia_15'
      FieldName = 'Vlr_Dia15'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia16: TCurrencyField
      DisplayLabel = 'Dia_16'
      FieldName = 'Vlr_Dia16'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia17: TCurrencyField
      DisplayLabel = 'Dia_17'
      FieldName = 'Vlr_Dia17'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia18: TCurrencyField
      DisplayLabel = 'Dia_18'
      FieldName = 'Vlr_Dia18'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia19: TCurrencyField
      DisplayLabel = 'Dia_19'
      FieldName = 'Vlr_Dia19'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia20: TCurrencyField
      DisplayLabel = 'Dia_20'
      FieldName = 'Vlr_Dia20'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia21: TCurrencyField
      DisplayLabel = 'Dia_21'
      FieldName = 'Vlr_Dia21'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia22: TCurrencyField
      DisplayLabel = 'Dia_22'
      FieldName = 'Vlr_Dia22'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia23: TCurrencyField
      DisplayLabel = 'Dia_23'
      FieldName = 'Vlr_Dia23'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia24: TCurrencyField
      DisplayLabel = 'Dia_24'
      FieldName = 'Vlr_Dia24'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia25: TCurrencyField
      DisplayLabel = 'Dia_25'
      FieldName = 'Vlr_Dia25'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia26: TCurrencyField
      DisplayLabel = 'Dia_26'
      FieldName = 'Vlr_Dia26'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia27: TCurrencyField
      DisplayLabel = 'Dia_27'
      FieldName = 'Vlr_Dia27'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia28: TCurrencyField
      DisplayLabel = 'Dia_28'
      FieldName = 'Vlr_Dia28'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia29: TCurrencyField
      DisplayLabel = 'Dia_29'
      FieldName = 'Vlr_Dia29'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia30: TCurrencyField
      DisplayLabel = 'Dia_30'
      FieldName = 'Vlr_Dia30'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasVlr_Dia31: TCurrencyField
      DisplayLabel = 'Dia_31'
      FieldName = 'Vlr_Dia31'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosDiasINDICE: TIntegerField
      FieldName = 'INDICE'
    end
    object CDS_V_ObjetivosDiasVISIVEL: TStringField
      FieldName = 'VISIVEL'
      Size = 1
    end
  end
  object CDS_V_EstFisFinanEmp: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'DES_PRODUTO'
    Params = <>
    AfterScroll = CDS_V_EstFisFinanEmpAfterScroll
    Left = 584
    Top = 298
    object CDS_V_EstFisFinanEmpCOD_PRODUTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PRODUTO'
      Size = 6
    end
    object CDS_V_EstFisFinanEmpDES_PRODUTO: TStringField
      DisplayLabel = 'Descri'#231#227'o Produto'
      FieldName = 'DES_PRODUTO'
      Size = 50
    end
    object CDS_V_EstFisFinanEmpCOD_FORNECEDOR: TStringField
      FieldName = 'COD_FORNECEDOR'
      Size = 6
    end
    object CDS_V_EstFisFinanEmpDES_FORNECEDOR: TStringField
      DisplayLabel = 'Descri'#231#227'o Fornecedor'
      FieldName = 'DES_FORNECEDOR'
      Size = 40
    end
    object CDS_V_EstFisFinanEmpQTD_ESTOQUE: TCurrencyField
      DisplayLabel = 'Estoque'
      FieldName = 'QTD_ESTOQUE'
      DisplayFormat = '0.,00'
    end
    object CDS_V_EstFisFinanEmpVLR_PC_CUSTO: TCurrencyField
      DisplayLabel = 'P'#231' Custo'
      FieldName = 'VLR_PC_CUSTO'
      DisplayFormat = '0.,00'
    end
    object CDS_V_EstFisFinanEmpVLR_TOTAL_CUSTO: TCurrencyField
      DisplayLabel = 'Total P'#231' Custo'
      FieldName = 'VLR_TOTAL_CUSTO'
      DisplayFormat = '0.,00'
    end
    object CDS_V_EstFisFinanEmpVLR_PC_VENDA: TCurrencyField
      DisplayLabel = 'P'#231' Venda'
      FieldName = 'VLR_PC_VENDA'
      DisplayFormat = '0.,00'
    end
    object CDS_V_EstFisFinanEmpVLR_TOTAL_VENDA: TCurrencyField
      DisplayLabel = 'Total P'#231' Venda'
      FieldName = 'VLR_TOTAL_VENDA'
      DisplayFormat = '0.,00'
    end
    object CDS_V_EstFisFinanEmpINDICE: TIntegerField
      FieldName = 'INDICE'
      Visible = False
    end
  end
  object DS_V_EstFisFinanEmp: TDataSource
    DataSet = CDS_V_EstFisFinanEmp
    Left = 627
    Top = 311
  end
  object DS_V_EmpConexoes: TDataSource
    DataSet = CDS_V_EmpConexoes
    Left = 101
    Top = 24
  end
  object CDS_V_EstFisFinanLojas: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'INDICE'
    Params = <>
    Left = 584
    Top = 362
    object CDS_V_EstFisFinanLojasCOD_PRODUTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PRODUTO'
      Size = 6
    end
    object CDS_V_EstFisFinanLojasDES_PRODUTO: TStringField
      DisplayLabel = 'Descri'#231#227'o Produto'
      FieldName = 'DES_PRODUTO'
      Size = 50
    end
    object CDS_V_EstFisFinanLojasDES_FORNECEDOR: TStringField
      DisplayLabel = 'Descri'#231#227'o Fornecedor'
      FieldName = 'DES_FORNECEDOR'
      Size = 40
    end
    object CDS_V_EstFisFinanLojasQTD_ESTOQUE: TCurrencyField
      DisplayLabel = 'Estoque'
      FieldName = 'QTD_ESTOQUE'
      DisplayFormat = '0.,00'
    end
    object CDS_V_EstFisFinanLojasVLR_PC_CUSTO: TCurrencyField
      DisplayLabel = 'P'#231' Custo'
      FieldName = 'VLR_PC_CUSTO'
      DisplayFormat = '0.,00'
    end
    object CDS_V_EstFisFinanLojasVLR_TOTAL_CUSTO: TCurrencyField
      DisplayLabel = 'Total P'#231' Custo'
      FieldName = 'VLR_TOTAL_CUSTO'
      DisplayFormat = '0.,00'
    end
    object CDS_V_EstFisFinanLojasVLR_PC_VENDA: TCurrencyField
      DisplayLabel = 'P'#231' Venda'
      FieldName = 'VLR_PC_VENDA'
      DisplayFormat = '0.,00'
    end
    object CDS_V_EstFisFinanLojasVLR_TOTAL_VENDA: TCurrencyField
      DisplayLabel = 'Total P'#231' Venda'
      FieldName = 'VLR_TOTAL_VENDA'
      DisplayFormat = '0.,00'
    end
    object CDS_V_EstFisFinanLojasINDICE: TIntegerField
      FieldName = 'INDICE'
      Visible = False
    end
    object CDS_V_EstFisFinanLojasLINK: TIntegerField
      FieldName = 'LINK'
      Visible = False
    end
  end
  object DS_V_EstFisFinanLojas: TDataSource
    DataSet = CDS_V_EstFisFinanLojas
    Left = 629
    Top = 378
  end
  object DS_V_ObjetivosMeses: TDataSource
    DataSet = CDS_V_ObjetivosMeses
    Left = 632
    Top = 81
  end
  object CDS_V_ObjetivosMeses: TClientDataSet
    Aggregates = <>
    Filter = 'VISIVEL='#39'S'#39
    Filtered = True
    IndexFieldNames = 'INDICE'
    Params = <>
    Left = 576
    Top = 65
    object CDS_V_ObjetivosMesesCod_Objetivo: TIntegerField
      FieldName = 'Cod_Objetivo'
      Visible = False
    end
    object CDS_V_ObjetivosMesesDes_Objetivo: TStringField
      FieldName = 'Des_Objetivo'
      Size = 50
    end
    object CDS_V_ObjetivosMesesVlr_Objetivo: TCurrencyField
      FieldName = 'Vlr_Objetivo'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosMesesCod_Emp: TStringField
      FieldName = 'Cod_Emp'
      Visible = False
      Size = 4
    end
    object CDS_V_ObjetivosMesesDes_Empresa: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'Des_Empresa'
      Size = 10
    end
    object CDS_V_ObjetivosMesesTipo: TStringField
      FieldName = 'Tipo'
      Size = 40
    end
    object CDS_V_ObjetivosMesesVlr_Mes01: TCurrencyField
      DisplayLabel = 'Mes_01'
      FieldName = 'Vlr_Mes01'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosMesesVlr_Mes02: TCurrencyField
      DisplayLabel = 'Mes_02'
      FieldName = 'Vlr_Mes02'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosMesesVlr_Mes03: TCurrencyField
      DisplayLabel = 'Mes_03'
      FieldName = 'Vlr_Mes03'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosMesesVlr_Mes04: TCurrencyField
      DisplayLabel = 'Mes_04'
      FieldName = 'Vlr_Mes04'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosMesesVlr_Mes05: TCurrencyField
      DisplayLabel = 'Mes_05'
      FieldName = 'Vlr_Mes05'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosMesesVlr_Mes06: TCurrencyField
      DisplayLabel = 'Mes_06'
      FieldName = 'Vlr_Mes06'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosMesesVlr_Mes07: TCurrencyField
      DisplayLabel = 'Mes_07'
      FieldName = 'Vlr_Mes07'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosMesesVlr_Mes08: TCurrencyField
      DisplayLabel = 'Mes_08'
      FieldName = 'Vlr_Mes08'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosMesesVlr_Mes09: TCurrencyField
      DisplayLabel = 'Mes_09'
      FieldName = 'Vlr_Mes09'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosMesesVlr_Mes10: TCurrencyField
      DisplayLabel = 'Mes_10'
      FieldName = 'Vlr_Mes10'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosMesesVlr_Mes11: TCurrencyField
      DisplayLabel = 'Mes_11'
      FieldName = 'Vlr_Mes11'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosMesesVlr_Mes12: TCurrencyField
      DisplayLabel = 'Mes_12'
      FieldName = 'Vlr_Mes12'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosMesesVlr_Empresa: TCurrencyField
      DisplayLabel = 'Vlr_Emp'
      FieldName = 'Vlr_Empresa'
      DisplayFormat = '0.,00'
    end
    object CDS_V_ObjetivosMesesINDICE: TIntegerField
      FieldName = 'INDICE'
      Visible = False
    end
    object CDS_V_ObjetivosMesesVISIVEL: TStringField
      FieldName = 'VISIVEL'
      Size = 1
    end
  end
  object DS_V_ObjetivosMovtos: TDataSource
    DataSet = CDS_V_ObjetivosMovtos
    Left = 632
    Top = 137
  end
  object CDS_V_ObjetivosMovtos: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'COD_FILIAL;COD_OBJETIVO;ORDEM;'
    Params = <>
    Left = 576
    Top = 129
    object CDS_V_ObjetivosMovtosORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
    object CDS_V_ObjetivosMovtosCOD_FILIAL: TIntegerField
      FieldName = 'COD_FILIAL'
    end
    object CDS_V_ObjetivosMovtosCOD_OBJETIVO: TIntegerField
      FieldName = 'COD_OBJETIVO'
    end
    object CDS_V_ObjetivosMovtosTIP_CALCULO: TStringField
      FieldName = 'TIP_CALCULO'
      Size = 1
    end
    object CDS_V_ObjetivosMovtosDATA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Data/M'#234's'
      FieldName = 'DATA'
      Size = 10
    end
    object CDS_V_ObjetivosMovtosQTD_COMPROV: TIntegerField
      DisplayLabel = 'Qtd Comprov'
      FieldName = 'QTD_COMPROV'
      DisplayFormat = '0,'
    end
    object CDS_V_ObjetivosMovtosTOT_ITENS: TIntegerField
      DisplayLabel = 'Total de Itens'
      FieldName = 'TOT_ITENS'
      DisplayFormat = '0,'
    end
    object CDS_V_ObjetivosMovtosTICKET_MEDIO: TCurrencyField
      DisplayLabel = 'Ticket M'#233'dio'
      FieldName = 'TICKET_MEDIO'
      DisplayFormat = '0,.00'
    end
    object CDS_V_ObjetivosMovtosTOT_DESC_ITENS: TCurrencyField
      DisplayLabel = 'Total de Desc Itens'
      FieldName = 'TOT_DESC_ITENS'
      DisplayFormat = '0,.00'
    end
    object CDS_V_ObjetivosMovtosTOT_BRUTO: TCurrencyField
      DisplayLabel = 'Total Bruto'
      FieldName = 'TOT_BRUTO'
      DisplayFormat = '0,.00'
    end
    object CDS_V_ObjetivosMovtosTOT_NOTA: TCurrencyField
      DisplayLabel = 'Total da Nota'
      FieldName = 'TOT_NOTA'
      DisplayFormat = '0,.00'
    end
    object CDS_V_ObjetivosMovtosTOT_FRETE: TCurrencyField
      DisplayLabel = 'Total do Frete'
      FieldName = 'TOT_FRETE'
      DisplayFormat = '0,.00'
    end
    object CDS_V_ObjetivosMovtosTOT_DESPESAS: TCurrencyField
      DisplayLabel = 'Total das Despesas'
      FieldName = 'TOT_DESPESAS'
      DisplayFormat = '0,.00'
    end
    object CDS_V_ObjetivosMovtosTOT_COMP_15: TCurrencyField
      DisplayLabel = 'Total do Compr 15'
      FieldName = 'TOT_COMP_15'
      DisplayFormat = '0,.00'
    end
    object CDS_V_ObjetivosMovtosTOT_VENDAS: TCurrencyField
      DisplayLabel = 'Total das Vendas'
      FieldName = 'TOT_VENDAS'
      DisplayFormat = '0,.00'
    end
  end
  object DS_V_ObjetivosAuditorias: TDataSource
    DataSet = CDS_V_ObjetivosAuditorias
    Left = 632
    Top = 192
  end
  object CDS_V_ObjetivosAuditorias: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ORDEM'
    Params = <>
    Left = 576
    Top = 184
    object CDS_V_ObjetivosAuditoriasORDEM: TIntegerField
      FieldName = 'ORDEM'
      Visible = False
    end
    object CDS_V_ObjetivosAuditoriasDES_OBJETIVO: TStringField
      DisplayLabel = 'Objetivo'
      FieldName = 'DES_OBJETIVO'
      Size = 50
    end
    object CDS_V_ObjetivosAuditoriasCOD_LOJA: TStringField
      Alignment = taCenter
      DisplayLabel = 'C'#243'd Loja'
      FieldName = 'COD_LOJA'
      Size = 2
    end
    object CDS_V_ObjetivosAuditoriasDES_LOJA: TStringField
      DisplayLabel = 'Descri'#231#227'o da Loja'
      FieldName = 'DES_LOJA'
      Size = 60
    end
    object CDS_V_ObjetivosAuditoriasDTA_AUDITORIA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Auditoria'
      FieldName = 'DTA_AUDITORIA'
    end
    object CDS_V_ObjetivosAuditoriasLIMITE_OBJETIVO: TStringField
      DisplayLabel = 'Limites Admiss'#237'veis'
      FieldName = 'LIMITE_OBJETIVO'
      Size = 50
    end
    object CDS_V_ObjetivosAuditoriasREALIZADO: TCurrencyField
      DisplayLabel = 'Realizado'
      FieldName = 'REALIZADO'
      DisplayFormat = '0,.00'
    end
    object CDS_V_ObjetivosAuditoriasPERCENTUAL: TCurrencyField
      DisplayLabel = 'Percentual'
      FieldName = 'PERCENTUAL'
      DisplayFormat = '0,.00'
    end
    object CDS_V_ObjetivosAuditoriasCOR: TStringField
      FieldName = 'COR'
      Visible = False
      Size = 1
    end
  end
  object DS_V_NFe: TDataSource
    DataSet = CDS_V_NFe
    Left = 433
    Top = 201
  end
  object CDS_V_NFe: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ORDEM'
    Params = <>
    Left = 385
    Top = 193
    object CDS_V_NFeCOD_LOJA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Loja'
      FieldName = 'COD_LOJA'
      Size = 4
    end
    object CDS_V_NFeDES_LOJA: TStringField
      DisplayLabel = 'Descri'#231#227'o da Loja'
      FieldName = 'DES_LOJA'
      Size = 40
    end
    object CDS_V_NFeCOD_FORNECEDOR: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Forn'
      FieldName = 'COD_FORNECEDOR'
      Size = 6
    end
    object CDS_V_NFeDES_FORNECEDOR: TStringField
      DisplayLabel = 'Descri'#231#227'o do Fornecedor'
      FieldName = 'DES_FORNECEDOR'
      Size = 40
    end
    object CDS_V_NFeCOD_COMPROV: TStringField
      DisplayLabel = 'CPV'
      FieldName = 'COD_COMPROV'
      Size = 8
    end
    object CDS_V_NFeNUM_NOTA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#186' Docto'
      FieldName = 'NUM_NOTA'
      Size = 6
    end
    object CDS_V_NFeDES_SERIE: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'DES_SERIE'
      Size = 4
    end
    object CDS_V_NFeDTA_NOTA: TDateField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'DTA_NOTA'
    end
    object CDS_V_NFeDTA_ENTRADA: TDateField
      DisplayLabel = 'Data Entrada'
      FieldName = 'DTA_ENTRADA'
    end
    object CDS_V_NFeTOT_QTDS: TCurrencyField
      DisplayLabel = 'Total de Qtds'
      FieldName = 'TOT_QTDS'
      DisplayFormat = '0.,00'
    end
    object CDS_V_NFeTOT_ITENS: TIntegerField
      DisplayLabel = 'Total de Itens'
      FieldName = 'TOT_ITENS'
      DisplayFormat = '0.'
    end
    object CDS_V_NFeVLR_NOTA: TCurrencyField
      DisplayLabel = 'Valor da Nota'
      FieldName = 'VLR_NOTA'
      DisplayFormat = '0.,00'
    end
    object CDS_V_NFeDES_COMPROV: TStringField
      FieldName = 'DES_COMPROV'
    end
    object CDS_V_NFeORDEM: TIntegerField
      FieldName = 'ORDEM'
      Visible = False
    end
  end
  object DS_V_GiroEstoque: TDataSource
    DataSet = CDS_V_GiroEstoque
    Left = 632
    Top = 433
  end
  object CDS_V_GiroEstoque: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ORDEM'
    Params = <>
    Left = 576
    Top = 425
    object CDS_V_GiroEstoqueCOD_LOJA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Loja'
      FieldName = 'COD_LOJA'
      Size = 7
    end
    object CDS_V_GiroEstoqueCOD_PRODUTO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PRODUTO'
      Size = 6
    end
    object CDS_V_GiroEstoqueDES_PRODUTO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_PRODUTO'
      Size = 80
    end
    object CDS_V_GiroEstoqueIND_CURVA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Curva'
      FieldName = 'IND_CURVA'
      Size = 1
    end
    object CDS_V_GiroEstoqueIND_SITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'IND_SITUACAO'
    end
    object CDS_V_GiroEstoqueQTD_EST_INICIAL: TCurrencyField
      DisplayLabel = 'Estoque Inicial'
      FieldName = 'QTD_EST_INICIAL'
      DisplayFormat = '0.,00'
    end
    object CDS_V_GiroEstoqueQTD_EST_FINAL: TCurrencyField
      DisplayLabel = 'Estoque Final'
      FieldName = 'QTD_EST_FINAL'
      DisplayFormat = '0.,00'
    end
    object CDS_V_GiroEstoqueMEDIA_ESTOQUE: TCurrencyField
      DisplayLabel = 'M'#233'dia Estoque'
      FieldName = 'MEDIA_ESTOQUE'
      DisplayFormat = '0.,00'
    end
    object CDS_V_GiroEstoqueQTD_VENDAS: TCurrencyField
      DisplayLabel = 'Sa'#237'das Per'#237'odo'
      FieldName = 'QTD_VENDAS'
      DisplayFormat = '0.,00'
    end
    object CDS_V_GiroEstoqueGIRO_ESTOQUE: TCurrencyField
      DisplayLabel = '(GE) Giro de Estoque'
      FieldName = 'GIRO_ESTOQUE'
      DisplayFormat = '0.,00'
    end
    object CDS_V_GiroEstoqueTEMPO_MEDIO: TCurrencyField
      DisplayLabel = '(TM) Tempo M'#233'dio'
      FieldName = 'TEMPO_MEDIO'
      DisplayFormat = '0.,00'
    end
    object CDS_V_GiroEstoqueCOD_FORNECEDOR: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Forn'
      FieldName = 'COD_FORNECEDOR'
      Size = 6
    end
    object CDS_V_GiroEstoqueDES_FORNECEDOR: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'DES_FORNECEDOR'
      Size = 60
    end
    object CDS_V_GiroEstoqueORDEM: TIntegerField
      FieldName = 'ORDEM'
      Visible = False
    end
    object CDS_V_GiroEstoqueLOJA_PESQUISA: TStringField
      FieldName = 'LOJA_PESQUISA'
      Visible = False
      Size = 3
    end
    object CDS_V_GiroEstoquePROD_PESQUISA: TStringField
      FieldName = 'PROD_PESQUISA'
      Visible = False
      Size = 6
    end
  end
  object DS_V_Mix_Prod: TDataSource
    DataSet = CDS_V_Mix_Prod
    Left = 632
    Top = 250
  end
  object CDS_V_Mix_Prod: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 576
    Top = 242
    object CDS_V_Mix_ProdCOD_LOJA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Cod Loja'
      FieldName = 'COD_LOJA'
      Required = True
      Size = 2
    end
    object CDS_V_Mix_ProdRAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAO_SOCIAL'
      Size = 60
    end
    object CDS_V_Mix_ProdIND_CURVA_A: TStringField
      Alignment = taCenter
      DisplayLabel = 'Mix Curva A'
      FieldName = 'IND_CURVA_A'
      Size = 3
    end
    object CDS_V_Mix_ProdIND_CURVA_B: TStringField
      Alignment = taCenter
      DisplayLabel = 'Mix Curva B'
      FieldName = 'IND_CURVA_B'
      Size = 3
    end
    object CDS_V_Mix_ProdIND_CURVA_C: TStringField
      Alignment = taCenter
      DisplayLabel = 'Mix Curva C'
      FieldName = 'IND_CURVA_C'
      Size = 3
    end
    object CDS_V_Mix_ProdIND_CURVA_D: TStringField
      Alignment = taCenter
      DisplayLabel = 'Mix Curva D'
      FieldName = 'IND_CURVA_D'
      Size = 3
    end
    object CDS_V_Mix_ProdIND_CURVA_E: TStringField
      Alignment = taCenter
      DisplayLabel = 'Mix Curva E'
      FieldName = 'IND_CURVA_E'
      Size = 3
    end
  end
  object CDS_V_Comprovantes: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'DES_COMPROV'
    Params = <>
    Left = 217
    Top = 484
    object CDS_V_ComprovantesCOD_COMPROV: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_COMPROV'
    end
    object CDS_V_ComprovantesDES_COMPROV: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_COMPROV'
      Size = 50
    end
    object CDS_V_ComprovantesIND_ATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'IND_ATIVO'
      Size = 10
    end
  end
  object DS_V_Comprovantes: TDataSource
    DataSet = CDS_V_Comprovantes
    Left = 269
    Top = 500
  end
  object CDS_V_MargLucroBonif: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CODFILIAL;APRESENTACAO'
    Params = <>
    Left = 728
    Top = 64
    object CDS_V_MargLucroBonifCODFILIAL: TStringField
      Alignment = taCenter
      DisplayLabel = 'Loja'
      FieldName = 'CODFILIAL'
      FixedChar = True
      Size = 2
    end
    object CDS_V_MargLucroBonifCODPRODUTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd Produto'
      FieldName = 'CODPRODUTO'
      FixedChar = True
      Size = 6
    end
    object CDS_V_MargLucroBonifAPRESENTACAO: TStringField
      DisplayLabel = 'Descri'#231#227'o Produto'
      FieldName = 'APRESENTACAO'
      Size = 80
    end
    object CDS_V_MargLucroBonifCODCOMPROVANTE: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'CPV'
      FieldName = 'CODCOMPROVANTE'
      FixedChar = True
      Size = 4
    end
    object CDS_V_MargLucroBonifENT_SAI: TStringField
      DisplayLabel = 'Tp'
      FieldName = 'ENT_SAI'
      FixedChar = True
      Size = 1
    end
    object CDS_V_MargLucroBonifQTD_TOTAL: TFMTBCDField
      DisplayLabel = 'Qtd Total'
      FieldName = 'QTD_TOTAL'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 4
    end
    object CDS_V_MargLucroBonifTOT_VALBRUTO: TFMTBCDField
      DisplayLabel = 'Tot Vlr Bruto'
      FieldName = 'TOT_VALBRUTO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargLucroBonifTOT_VALDESCONTO: TFMTBCDField
      DisplayLabel = 'Tot Vlr Desc'
      FieldName = 'TOT_VALDESCONTO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargLucroBonifTOT_VALIPI: TFMTBCDField
      DisplayLabel = 'Tot Vlr IPI'
      FieldName = 'TOT_VALIPI'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargLucroBonifTOT_VALSUBSTITUICAO: TFMTBCDField
      DisplayLabel = 'Tot Vlr ST'
      FieldName = 'TOT_VALSUBSTITUICAO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargLucroBonifTOT_VALREPASSE: TFMTBCDField
      DisplayLabel = 'Tot Vlr Repasse'
      FieldName = 'TOT_VALREPASSE'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargLucroBonifTOT_VALTOTAL: TFMTBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'TOT_VALTOTAL'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargLucroBonifNOMECOMPROVANTE: TStringField
      DisplayLabel = 'Comprovante'
      FieldName = 'NOMECOMPROVANTE'
      FixedChar = True
    end
    object CDS_V_MargLucroBonifPRINCIPALFOR: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd Forn'
      FieldName = 'PRINCIPALFOR'
      FixedChar = True
      Size = 6
    end
    object CDS_V_MargLucroBonifNOMEFORNECEDOR: TStringField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 100
      FieldName = 'NOMEFORNECEDOR'
      Size = 100
    end
  end
  object DS_V_MargLucroBonif: TDataSource
    DataSet = CDS_V_MargLucroBonif
    Left = 795
    Top = 77
  end
  object CDS_V_MargLucroBonifRes: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'SINALESTOQUE;DESCOMPROVANTE'
    Params = <>
    Left = 728
    Top = 122
    object CDS_V_MargLucroBonifResLOJA: TStringField
      FieldName = 'LOJA'
      FixedChar = True
      Size = 2
    end
    object CDS_V_MargLucroBonifResCODCOMPROVANTE: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'CPV'
      FieldName = 'CODCOMPROVANTE'
      FixedChar = True
      Size = 4
    end
    object CDS_V_MargLucroBonifResDESCOMPROVANTE: TStringField
      DisplayLabel = 'Comprovante'
      FieldName = 'DESCOMPROVANTE'
      Size = 40
    end
    object CDS_V_MargLucroBonifResSINALESTOQUE: TStringField
      DisplayLabel = 'Tipo Docto'
      FieldName = 'SINALESTOQUE'
      FixedChar = True
      Size = 35
    end
    object CDS_V_MargLucroBonifResQTD_TOTAL: TFMTBCDField
      DisplayLabel = 'Qtd Total'
      FieldName = 'QTD_TOTAL'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 4
    end
    object CDS_V_MargLucroBonifResTOT_VALBRUTO: TFMTBCDField
      DisplayLabel = 'Tot Vlr Bruto'
      FieldName = 'TOT_VALBRUTO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargLucroBonifResTOT_VALDESCONTO: TFMTBCDField
      DisplayLabel = 'Tot Vlr Desc'
      FieldName = 'TOT_VALDESCONTO'
      Visible = False
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargLucroBonifResTOT_VALIPI: TFMTBCDField
      DisplayLabel = 'Tot Vlr IPI'
      FieldName = 'TOT_VALIPI'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargLucroBonifResTOT_VALSUBSTITUICAO: TFMTBCDField
      DisplayLabel = 'Tot Vlr ST'
      FieldName = 'TOT_VALSUBSTITUICAO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargLucroBonifResTOT_VALREPASSE: TFMTBCDField
      DisplayLabel = 'Tot Vlr Repasse'
      FieldName = 'TOT_VALREPASSE'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargLucroBonifResTOT_VALTOTAL: TFMTBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'TOT_VALTOTAL'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargLucroBonifResTOT_VALRETIDO: TCurrencyField
      FieldName = 'TOT_VALRETIDO'
    end
  end
  object DS_V_MargLucroBonifRes: TDataSource
    DataSet = CDS_V_MargLucroBonifRes
    Left = 800
    Top = 134
  end
  object DS_V_MargLucroFinal: TDataSource
    DataSet = CDS_V_MargLucroFinal
    Left = 800
    Top = 194
  end
  object CDS_V_MargLucroFinal: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 728
    Top = 178
    object CDS_V_MargLucroFinalLoja: TStringField
      FieldName = 'Loja'
      Size = 2
    end
    object CDS_V_MargLucroFinalDesc_Tipo: TStringField
      FieldName = 'Desc_Tipo'
      Size = 35
    end
    object CDS_V_MargLucroFinalTot_Vendas: TCurrencyField
      DisplayLabel = 'Tot Vlr Vendas'
      FieldName = 'Tot_Vendas'
      DisplayFormat = '0.,00'
    end
    object CDS_V_MargLucroFinalTot_Custos: TCurrencyField
      DisplayLabel = 'Tot vlr Custos'
      FieldName = 'Tot_Custos'
      DisplayFormat = '0.,00'
    end
    object CDS_V_MargLucroFinalPer_Margem: TCurrencyField
      DisplayLabel = '% Lucro'
      FieldName = 'Per_Margem'
      DisplayFormat = '0.,00'
    end
  end
  object CDS_V_MargemLucro: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 729
    Top = 8
    object CDS_V_MargemLucroCODFILIAL: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Loja'
      FieldName = 'CODFILIAL'
      Size = 2
    end
    object CDS_V_MargemLucroCODPRODUTO: TStringField
      DisplayLabel = 'C'#243'd Prod'
      FieldName = 'CODPRODUTO'
      Size = 6
    end
    object CDS_V_MargemLucroAPRESENTACAO: TStringField
      DisplayLabel = 'Descri'#231#227'o Produto'
      FieldName = 'APRESENTACAO'
      Size = 80
    end
    object CDS_V_MargemLucroCODFORNECEDOR: TStringField
      DisplayLabel = 'C'#243'd Forn'
      FieldName = 'CODFORNECEDOR'
      FixedChar = True
      Size = 6
    end
    object CDS_V_MargemLucroNOMEFORNECEDOR: TStringField
      DisplayLabel = 'Descri'#231#227'o Fornecedor'
      FieldName = 'NOMEFORNECEDOR'
      Size = 40
    end
    object CDS_V_MargemLucroTOT_QTD_COMPRA: TFMTBCDField
      DisplayLabel = 'Qtd Total Compras'
      FieldName = 'TOT_QTD_COMPRA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroPRECOCUSTO: TFMTBCDField
      DisplayLabel = 'P'#231' Custo M'#233'dio'
      FieldName = 'PRECOCUSTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object CDS_V_MargemLucroTOT_QTD_VENDA: TFMTBCDField
      DisplayLabel = 'Qtd Total Vendas'
      FieldName = 'TOT_QTD_VENDA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroPRECOVENDA: TFMTBCDField
      DisplayLabel = 'P'#231' Venda'
      FieldName = 'PRECOVENDA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object CDS_V_MargemLucro_MARGEM_1: TFMTBCDField
      FieldName = '%_MARGEM_1=((PV-PC)/PV)*100'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucro_MARGEM_2: TFMTBCDField
      FieldName = '%_MARGEM_2=((PV/PC)*100)-100'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroVALOR_MARGEM: TFMTBCDField
      DisplayLabel = 'Vlr Margem'
      FieldName = 'VALOR_MARGEM'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroPER_MARKUP: TFMTBCDField
      DisplayLabel = '% MarkUP'
      FieldName = 'PER_MARKUP'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroVLR_VENDA_PV: TFMTBCDField
      DisplayLabel = 'Vlr Total Venda P'#231' Venda'
      FieldName = 'VLR_VENDA_PV'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroVLR_VENDA_PC: TFMTBCDField
      DisplayLabel = 'Vlr Total Venda P'#231' Custo'
      FieldName = 'VLR_VENDA_PC'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroLucro: TFMTBCDField
      FieldName = '% Lucro'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroPartVenda: TFMTBCDField
      FieldName = '% Part Venda'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object CDS_V_MargemLucroPartCusto: TFMTBCDField
      FieldName = '% Part Custo'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object CDS_V_MargemLucroNUMSEQ: TIntegerField
      FieldName = 'NUMSEQ'
      Visible = False
    end
    object CDS_V_MargemLucroVLR_BAP: TFMTBCDField
      FieldName = 'VLR_BAP'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object CDS_V_MargemLucroPER_BAP_VENDA: TFMTBCDField
      FieldName = 'PER_BAP_VENDA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object CDS_V_MargemLucroVLR_VENDA_PC_BAP: TFMTBCDField
      FieldName = 'VLR_VENDA_PC_BAP'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object CDS_V_MargemLucroPER_LUCRO_FINAL: TFMTBCDField
      FieldName = 'PER_LUCRO_FINAL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object CDS_V_MargemLucroULT_ALTERACAO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Ult Alteracao'
      FieldName = 'ULT_ALTERACAO'
      Size = 10
    end
    object CDS_V_MargemLucroVLR_MARGEM_TOTAL: TFMTBCDField
      FieldName = 'VLR_MARGEM_TOTAL'
      DisplayFormat = '0,.00'
    end
    object CDS_V_MargemLucroVLR_MARGEM_FINAL: TFMTBCDField
      FieldName = 'VLR_MARGEM_FINAL'
      DisplayFormat = '0,.00'
      Size = 0
    end
    object CDS_V_MargemLucroAG_VLR_VENDA_PV: TAggregateField
      FieldName = 'AG_VLR_VENDA_PV'
      Active = True
      DisplayFormat = '0,.00'
      Expression = 'SUM(VLR_VENDA_PV)'
    end
    object CDS_V_MargemLucroAG_VLR_VENDA_PC: TAggregateField
      FieldName = 'AG_VLR_VENDA_PC'
      Active = True
      DisplayFormat = '0,.00'
      Expression = 'SUM(VLR_VENDA_PC)'
    end
    object CDS_V_MargemLucroAG_TOT_QTD_COMPRA: TAggregateField
      FieldName = 'AG_TOT_QTD_COMPRA'
      Active = True
      DisplayFormat = '0,.00'
      Expression = 'SUM(TOT_QTD_COMPRA)'
    end
    object CDS_V_MargemLucroAG_PRECOCUSTO: TAggregateField
      FieldName = 'AG_PRECOCUSTO'
      Active = True
      DisplayFormat = '0,.00'
      Expression = 'SUM(PRECOCUSTO)'
    end
    object CDS_V_MargemLucroAG_TOT_QTD_VENDA: TAggregateField
      FieldName = 'AG_TOT_QTD_VENDA'
      Active = True
      DisplayFormat = '0,.00'
      Expression = 'SUM(TOT_QTD_VENDA)'
    end
    object CDS_V_MargemLucroAG_PRECOVENDA: TAggregateField
      FieldName = 'AG_PRECOVENDA'
      Active = True
      DisplayFormat = '0,.00'
      Expression = 'SUM(PRECOVENDA)'
    end
    object CDS_V_MargemLucroAG_VLR_BAP: TAggregateField
      FieldName = 'AG_VLR_BAP'
      Active = True
      DisplayFormat = '0,.00'
      Expression = 'SUM(VLR_BAP)'
    end
    object CDS_V_MargemLucroAG_VLR_VENDA_PC_BAP: TAggregateField
      FieldName = 'AG_VLR_VENDA_PC_BAP'
      Active = True
      DisplayFormat = '0,.00'
      Expression = 'SUM(VLR_VENDA_PC_BAP)'
    end
    object CDS_V_MargemLucroAG_VLR_MARGEM_FINAL: TAggregateField
      FieldName = 'AG_VLR_MARGEM_FINAL'
      Active = True
      DisplayFormat = '0,.00'
      Expression = 'SUM(VLR_MARGEM_FINAL)'
    end
    object CDS_V_MargemLucroAG_VLR_MARGEM_TOTAL: TAggregateField
      FieldName = 'AG_VLR_MARGEM_TOTAL'
      Active = True
      DisplayFormat = '0,.00'
      Expression = 'SUM(VLR_MARGEM_TOTAL)'
    end
  end
  object DS_V_MargemLucro: TDataSource
    DataSet = CDS_V_MargemLucro
    Left = 791
    Top = 20
  end
  object CDS_V_MargemLucroForn: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CDS_V_MargemLucroFornAfterScroll
    Left = 729
    Top = 248
    object CDS_V_MargemLucroFornCODFORNECEDOR: TStringField
      DisplayLabel = 'C'#243'd Forn'
      FieldName = 'CODFORNECEDOR'
      FixedChar = True
      Size = 6
    end
    object CDS_V_MargemLucroFornNOMEFORNECEDOR: TStringField
      DisplayLabel = 'Descri'#231#227'o Fornecedor'
      FieldName = 'NOMEFORNECEDOR'
      Size = 40
    end
    object CDS_V_MargemLucroFornTOT_QTD_COMPRA: TFMTBCDField
      DisplayLabel = 'Qt Comp'
      FieldName = 'TOT_QTD_COMPRA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroFornTOT_QTD_VENDA: TFMTBCDField
      DisplayLabel = 'Qt Vendas'
      FieldName = 'TOT_QTD_VENDA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroFornVALOR_MARGEM: TFMTBCDField
      DisplayLabel = 'Vlr Margem'
      FieldName = 'VALOR_MARGEM'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroFornVLR_VENDA_PV: TFMTBCDField
      DisplayLabel = 'Total Vendas'
      FieldName = 'VLR_VENDA_PV'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroFornVLR_VENDA_PC: TFMTBCDField
      DisplayLabel = 'Total Custos'
      FieldName = 'VLR_VENDA_PC'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroFornPARTVENDA: TFMTBCDField
      DisplayLabel = '% Venda'
      FieldName = '% Part Venda'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroFornPARTCUSTO: TFMTBCDField
      DisplayLabel = '% Custo'
      FieldName = '% Part Custo'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroFornVLR_MARGEM_TOTAL: TFMTBCDField
      DisplayLabel = 'Vlr Margem Total'
      FieldName = 'VLR_MARGEM_TOTAL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroFornLUCRO: TFMTBCDField
      FieldName = '% Lucro'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroFornVLR_BAP: TFMTBCDField
      DisplayLabel = 'Total BAP'
      FieldName = 'VLR_BAP'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroFornPER_BAP_VENDA: TFMTBCDField
      DisplayLabel = '% BAP Venda'
      FieldName = 'PER_BAP_VENDA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroFornVLR_VENDA_PC_BAP: TFMTBCDField
      DisplayLabel = 'Total Custos BAP'
      FieldName = 'VLR_VENDA_PC_BAP'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroFornVLR_MARGEM_FINAL: TFMTBCDField
      DisplayLabel = 'Vlr Margem Final'
      FieldName = 'VLR_MARGEM_FINAL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroFornPER_LUCRO_FINAL: TFMTBCDField
      DisplayLabel = '% Lucro Final'
      FieldName = 'PER_LUCRO_FINAL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroFornNUMSEQ: TIntegerField
      FieldName = 'NUMSEQ'
      Visible = False
    end
  end
  object DS_V_MargemLucroForn: TDataSource
    DataSet = CDS_V_MargemLucroForn
    Left = 799
    Top = 260
  end
  object CDS_V_MargemLucroScroll: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 729
    Top = 312
    object CDS_V_MargemLucroScrollCODFILIAL: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Loja'
      FieldName = 'CODFILIAL'
      Size = 2
    end
    object CDS_V_MargemLucroScrollCODPRODUTO: TStringField
      DisplayLabel = 'C'#243'd Prod'
      FieldName = 'CODPRODUTO'
      Size = 6
    end
    object CDS_V_MargemLucroScrollAPRESENTACAO: TStringField
      DisplayLabel = 'Descri'#231#227'o Produto'
      FieldName = 'APRESENTACAO'
      Size = 80
    end
    object CDS_V_MargemLucroScrollCODFORNECEDOR: TStringField
      DisplayLabel = 'C'#243'd Forn'
      FieldName = 'CODFORNECEDOR'
      FixedChar = True
      Size = 6
    end
    object CDS_V_MargemLucroScrollNOMEFORNECEDOR: TStringField
      DisplayLabel = 'Descri'#231#227'o Fornecedor'
      FieldName = 'NOMEFORNECEDOR'
      Size = 40
    end
    object CDS_V_MargemLucroScrollTOT_QTD_COMPRA: TFMTBCDField
      DisplayLabel = 'Qtd Total Compras'
      FieldName = 'TOT_QTD_COMPRA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroScrollPRECOCUSTO: TFMTBCDField
      DisplayLabel = 'P'#231' Custo M'#233'dio'
      FieldName = 'PRECOCUSTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object CDS_V_MargemLucroScrollTOT_QTD_VENDA: TFMTBCDField
      DisplayLabel = 'Qtd Total Vendas'
      FieldName = 'TOT_QTD_VENDA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroScrollPRECOVENDA: TFMTBCDField
      DisplayLabel = 'P'#231' Venda'
      FieldName = 'PRECOVENDA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object CDS_V_MargemLucroScroll_MARGEM_1: TFMTBCDField
      FieldName = '%_MARGEM_1=((PV-PC)/PV)*100'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroScroll_MARGEM_2: TFMTBCDField
      FieldName = '%_MARGEM_2=((PV/PC)*100)-100'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroScrollVALOR_MARGEM: TFMTBCDField
      DisplayLabel = 'Vlr Margem'
      FieldName = 'VALOR_MARGEM'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroScrollPER_MARKUP: TFMTBCDField
      DisplayLabel = '% MarkUP'
      FieldName = 'PER_MARKUP'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroScrollVLR_VENDA_PV: TFMTBCDField
      DisplayLabel = 'Vlr Total Venda P'#231' Venda'
      FieldName = 'VLR_VENDA_PV'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroScrollVLR_VENDA_PC: TFMTBCDField
      DisplayLabel = 'Vlr Total Venda P'#231' Custo'
      FieldName = 'VLR_VENDA_PC'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroScrollLucro: TFMTBCDField
      FieldName = '% Lucro'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_MargemLucroScrollPartVenda: TFMTBCDField
      FieldName = '% Part Venda'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object CDS_V_MargemLucroScrollPartCusto: TFMTBCDField
      FieldName = '% Part Custo'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object CDS_V_MargemLucroScrollNUMSEQ: TIntegerField
      FieldName = 'NUMSEQ'
      Visible = False
    end
    object CDS_V_MargemLucroScrollVLR_BAP: TFMTBCDField
      FieldName = 'VLR_BAP'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object CDS_V_MargemLucroScrollPER_BAP_VENDA: TFMTBCDField
      FieldName = 'PER_BAP_VENDA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object CDS_V_MargemLucroScrollVLR_VENDA_PC_BAP: TFMTBCDField
      FieldName = 'VLR_VENDA_PC_BAP'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object CDS_V_MargemLucroScrollPER_LUCRO_FINAL: TFMTBCDField
      FieldName = 'PER_LUCRO_FINAL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object CDS_V_MargemLucroScrollULT_ALTERACAO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Ult Alteracao'
      FieldName = 'ULT_ALTERACAO'
      Size = 10
    end
    object CDS_V_MargemLucroScrollVLR_MARGEM_TOTAL: TFMTBCDField
      FieldName = 'VLR_MARGEM_TOTAL'
      DisplayFormat = '0,.00'
    end
    object CDS_V_MargemLucroScrollVLR_MARGEM_FINAL: TFMTBCDField
      FieldName = 'VLR_MARGEM_FINAL'
      DisplayFormat = '0,.00'
      Size = 0
    end
  end
  object DS_V_MargemLucroScroll: TDataSource
    DataSet = CDS_V_MargemLucroScroll
    Left = 800
    Top = 336
  end
  object DS_V_ParamSalMinimo: TDataSource
    DataSet = CDS_V_ParamSalMinimo
    Left = 105
    Top = 360
  end
  object CDS_V_ParamSalMinimo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 57
    Top = 352
    object CDS_V_ParamSalMinimoNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
      Required = True
    end
    object CDS_V_ParamSalMinimoTP_REGISTRO: TIntegerField
      FieldName = 'TP_REGISTRO'
      Required = True
    end
    object CDS_V_ParamSalMinimoSEQ_REG: TIntegerField
      FieldName = 'SEQ_REG'
      Required = True
    end
    object CDS_V_ParamSalMinimoVLR_INICIAL: TFMTBCDField
      FieldName = 'VLR_INICIAL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_ParamSalMinimoVLR_FINAL: TFMTBCDField
      FieldName = 'VLR_FINAL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_ParamSalMinimoPER_ALIQUOTA: TFMTBCDField
      FieldName = 'PER_ALIQUOTA'
      Precision = 15
      Size = 2
    end
    object CDS_V_ParamSalMinimoVLR_DEDUCAO: TFMTBCDField
      FieldName = 'VLR_DEDUCAO'
      Precision = 15
      Size = 2
    end
    object CDS_V_ParamSalMinimoDTA_VIGENCIA_INICIO: TDateField
      FieldName = 'DTA_VIGENCIA_INICIO'
    end
    object CDS_V_ParamSalMinimoDTA_VIGENCIA_FINAL: TDateField
      FieldName = 'DTA_VIGENCIA_FINAL'
    end
    object CDS_V_ParamSalMinimoUSU_INCLUI: TIntegerField
      FieldName = 'USU_INCLUI'
    end
    object CDS_V_ParamSalMinimoDTA_INCLUI: TSQLTimeStampField
      FieldName = 'DTA_INCLUI'
      Required = True
    end
    object CDS_V_ParamSalMinimoUSU_ALTERA: TIntegerField
      FieldName = 'USU_ALTERA'
    end
    object CDS_V_ParamSalMinimoDTA_ALTERA: TSQLTimeStampField
      FieldName = 'DTA_ALTERA'
    end
    object CDS_V_ParamSalMinimoIND_SIT: TStringField
      FieldName = 'IND_SIT'
      Size = 8
    end
  end
  object CDS_V_Kits: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Cod_Kit;Num_Seq'
    Params = <>
    Left = 920
    Top = 8
    object CDS_V_KitsTipo: TStringField
      FieldName = 'Tipo'
      Size = 10
    end
    object CDS_V_KitsCodigo: TStringField
      DisplayLabel = 'Cod Kit / Produto'
      FieldName = 'Codigo'
      Size = 10
    end
    object CDS_V_KitsDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 60
    end
    object CDS_V_KitsQuant: TFMTBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'Quant'
      DisplayFormat = '0,.00'
      Size = 15
    end
    object CDS_V_KitsVlr_Desc: TFMTBCDField
      DisplayLabel = 'Valor Desc'
      FieldName = 'Vlr_Desc'
      DisplayFormat = '0,.00'
      Size = 15
    end
    object CDS_V_KitsVlr_Total: TFMTBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'Vlr_Total'
      DisplayFormat = '0,.00'
      Size = 15
    end
    object CDS_V_KitsDta_Validade_Ini: TDateField
      DisplayLabel = 'Incio Validade'
      FieldName = 'Dta_Validade_Ini'
    end
    object CDS_V_KitsDta_Validade_Fim: TDateField
      DisplayLabel = 'Fim Validade'
      FieldName = 'Dta_Validade_Fim'
    end
    object CDS_V_KitsCod_Barras: TStringField
      DisplayLabel = 'C'#243'digo de Barras'
      FieldName = 'Cod_Barras'
    end
    object CDS_V_KitsSintetico: TStringField
      FieldName = 'Sintetico'
      Visible = False
      Size = 1
    end
    object CDS_V_KitsNum_Seq: TIntegerField
      FieldName = 'Num_Seq'
      Visible = False
    end
    object CDS_V_KitsCod_Kit: TIntegerField
      FieldName = 'Cod_Kit'
      Visible = False
    end
  end
  object CDS_V_KitsNotas: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Num_Seq'
    Params = <>
    Left = 920
    Top = 64
    object CDS_V_KitsNotasTipo: TStringField
      FieldName = 'Tipo'
      Size = 10
    end
    object CDS_V_KitsNotasNum_Codigo: TStringField
      DisplayLabel = 'N'#186' NT / Cod Kit'
      FieldName = 'Num_Codigo'
      Size = 10
    end
    object CDS_V_KitsNotasCodigo: TStringField
      DisplayLabel = 'Cod Compr / Barras Kit'
      FieldName = 'Codigo'
    end
    object CDS_V_KitsNotasDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 60
    end
    object CDS_V_KitsNotasData1: TDateField
      DisplayLabel = 'Data Docto/Validade In'#237'cio Kit'
      FieldName = 'Data1'
    end
    object CDS_V_KitsNotasData2: TDateField
      DisplayLabel = 'Data Validade Final Kit'
      FieldName = 'Data2'
    end
    object CDS_V_KitsNotasNumero: TStringField
      DisplayLabel = 'Ch NT / Seq Item'
      FieldName = 'Numero'
    end
    object CDS_V_KitsNotasCod_Produto: TStringField
      DisplayLabel = 'C'#243'd Produto'
      FieldName = 'Cod_Produto'
      Size = 6
    end
    object CDS_V_KitsNotasDes_Prod: TStringField
      DisplayLabel = 'Descri'#231#227'o Produto'
      FieldName = 'Des_Prod'
      Size = 60
    end
    object CDS_V_KitsNotasQuant: TFMTBCDField
      DisplayLabel = 'Qtd Atendida'
      FieldName = 'Quant'
      DisplayFormat = '0,.00'
      Size = 15
    end
    object CDS_V_KitsNotasVlr_Bruto: TFMTBCDField
      DisplayLabel = 'Valor Bruto'
      FieldName = 'Vlr_Bruto'
      DisplayFormat = '0,.00'
      Size = 15
    end
    object CDS_V_KitsNotasPer_Desc: TFMTBCDField
      DisplayLabel = '% Desc'
      FieldName = 'Per_Desc'
      DisplayFormat = '0,.00'
      Size = 15
    end
    object CDS_V_KitsNotasVlr_Desc: TFMTBCDField
      DisplayLabel = 'Valor Desc'
      FieldName = 'Vlr_Desc'
      DisplayFormat = '0,.00'
      Size = 15
    end
    object CDS_V_KitsNotasVlr_Total: TFMTBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'Vlr_Total'
      DisplayFormat = '0,.00'
      Size = 15
    end
    object CDS_V_KitsNotasNum_Seq: TIntegerField
      FieldName = 'Num_Seq'
    end
  end
  object DS_V_Kits: TDataSource
    DataSet = CDS_V_Kits
    Left = 976
    Top = 16
  end
  object DS_V_KitsNotas: TDataSource
    DataSet = CDS_V_KitsNotas
    Left = 976
    Top = 80
  end
  object CDS_V_SaldoTransf: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 920
    Top = 120
    object CDS_V_SaldoTransfCOD_LOJA: TStringField
      FieldName = 'COD_LOJA'
      Size = 2
    end
    object CDS_V_SaldoTransfCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      Size = 6
    end
    object CDS_V_SaldoTransfCOD_FORNECEDOR: TStringField
      FieldName = 'COD_FORNECEDOR'
      Size = 6
    end
    object CDS_V_SaldoTransfQTD_SALDO: TCurrencyField
      FieldName = 'QTD_SALDO'
    end
    object CDS_V_SaldoTransfQTD_UTILIZADA: TCurrencyField
      FieldName = 'QTD_UTILIZADA'
    end
    object CDS_V_SaldoTransfQTD_DISPONIVEL: TCurrencyField
      FieldName = 'QTD_DISPONIVEL'
    end
  end
  object DataSource1: TDataSource
    DataSet = CDS_V_SaldoTransf
    Left = 976
    Top = 144
  end
  object CDS_V_Estoques: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DSP_SQLQ_Busca'
    AfterEdit = CDS_V_EstoquesAfterEdit
    AfterPost = CDS_V_EstoquesAfterPost
    OnCalcFields = CDS_V_EstoquesCalcFields
    Left = 446
    Top = 24
    object CDS_V_EstoquesSEQ: TFMTBCDField
      DisplayLabel = 'Seq'
      FieldName = 'SEQ'
      Required = True
      DisplayFormat = '0,'
      Precision = 15
      Size = 0
    end
    object CDS_V_EstoquesCOD_PRODUTO: TFMTBCDField
      DisplayLabel = 'C'#243'd'
      FieldName = 'COD_PRODUTO'
      Precision = 15
      Size = 0
    end
    object CDS_V_EstoquesDES_PRODUTO: TStringField
      DisplayLabel = 'Desc Prod'
      FieldName = 'DES_PRODUTO'
      Size = 80
    end
    object CDS_V_EstoquesIND_CURVA: TStringField
      Alignment = taCenter
      DisplayLabel = 'CL'
      FieldName = 'IND_CURVA'
      Size = 1
    end
    object CDS_V_EstoquesVLR_VD_M1: TFMTBCDField
      FieldName = 'VLR_VD_M1'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesVLR_VD_M2: TFMTBCDField
      FieldName = 'VLR_VD_M2'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesVLR_VD_M3: TFMTBCDField
      FieldName = 'VLR_VD_M3'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesVLR_VD_M4: TFMTBCDField
      FieldName = 'VLR_VD_M4'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesVLR_VD_M5: TFMTBCDField
      FieldName = 'VLR_VD_M5'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesVLR_VENDAS_ANO: TFMTBCDField
      DisplayLabel = '$ Vd AA'
      FieldName = 'VLR_VENDAS_ANO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesVLR_VENDAS_4M: TFMTBCDField
      DisplayLabel = '$ Vd 4 M'
      FieldName = 'VLR_VENDAS_4M'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesQTD_VD_M1: TIntegerField
      FieldName = 'QTD_VD_M1'
      DisplayFormat = '0,'
    end
    object CDS_V_EstoquesQTD_VD_M2: TIntegerField
      FieldName = 'QTD_VD_M2'
      DisplayFormat = '0,'
    end
    object CDS_V_EstoquesQTD_VD_M3: TIntegerField
      FieldName = 'QTD_VD_M3'
      DisplayFormat = '0,'
    end
    object CDS_V_EstoquesQTD_VD_M4: TIntegerField
      FieldName = 'QTD_VD_M4'
      DisplayFormat = '0,'
    end
    object CDS_V_EstoquesQTD_VD_M5: TIntegerField
      FieldName = 'QTD_VD_M5'
      DisplayFormat = '0,'
    end
    object CDS_V_EstoquesQTD_VENDAS_4M: TIntegerField
      DisplayLabel = 'Qt Vd 4 M'
      FieldName = 'QTD_VENDAS_4M'
      DisplayFormat = '0,'
    end
    object CDS_V_EstoquesQTD_MEDIA_MES: TFMTBCDField
      DisplayLabel = 'Qt '#215' Vd M'
      FieldName = 'QTD_MEDIA_MES'
      DisplayFormat = '0,.0000'
      Precision = 15
      Size = 4
    end
    object CDS_V_EstoquesQTD_ESTOCAGEM_4M: TIntegerField
      DisplayLabel = 'Qt EstG 4 M'
      FieldName = 'QTD_ESTOCAGEM_4M'
      Required = True
    end
    object CDS_V_EstoquesQTD_VENDAS_ANO: TIntegerField
      DisplayLabel = 'Qt Vd AA'
      FieldName = 'QTD_VENDAS_ANO'
      DisplayFormat = '0,'
    end
    object CDS_V_EstoquesQTD_ESTOCAGEM_ANO: TIntegerField
      DisplayLabel = 'Qt EstG AA'
      FieldName = 'QTD_ESTOCAGEM_ANO'
      DisplayFormat = '0,'
    end
    object CDS_V_EstoquesPER_PARTICIPACAO: TFMTBCDField
      DisplayLabel = '% Part'
      FieldName = 'PER_PARTICIPACAO'
      DisplayFormat = '0.,0000'
      Precision = 15
      Size = 4
    end
    object CDS_V_EstoquesQTD_ESTOQUE: TIntegerField
      DisplayLabel = 'Qt Est'
      FieldName = 'QTD_ESTOQUE'
      DisplayFormat = '0,'
    end
    object CDS_V_EstoquesQTD_TRANSITO: TIntegerField
      DisplayLabel = 'Qt Trans'
      FieldName = 'QTD_TRANSITO'
      DisplayFormat = '0,'
    end
    object CDS_V_EstoquesQTD_DISPONIVEL: TFMTBCDField
      FieldName = 'QTD_DISPONIVEL'
      Precision = 15
      Size = 0
    end
    object CDS_V_EstoquesEST_IDEAL: TIntegerField
      DisplayLabel = 'Est M'#237'n'
      FieldName = 'EST_IDEAL'
      DisplayFormat = '0,'
    end
    object CDS_V_EstoquesEST_MAXIMO: TIntegerField
      DisplayLabel = 'Est M'#225'x'
      FieldName = 'EST_MAXIMO'
      DisplayFormat = '0,'
    end
    object CDS_V_EstoquesPC_VENDA: TFMTBCDField
      DisplayLabel = 'P'#231' Vd'
      FieldName = 'PC_VENDA'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 4
    end
    object CDS_V_EstoquesPC_CUSTO: TFMTBCDField
      DisplayLabel = 'P'#231' Ct'
      FieldName = 'PC_CUSTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesPER_MARGEM: TFMTBCDField
      DisplayLabel = '% Mg Lc'
      FieldName = 'PER_MARGEM'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object CDS_V_EstoquesDTA_INCLUSAO: TSQLTimeStampField
      DisplayLabel = 'Dt Incl'
      FieldName = 'DTA_INCLUSAO'
    end
    object CDS_V_EstoquesCOD_SETOR: TIntegerField
      FieldName = 'COD_SETOR'
    end
    object CDS_V_EstoquesNOME_SETOR: TStringField
      FieldName = 'NOME_SETOR'
      Size = 30
    end
    object CDS_V_EstoquesCOD_LINHA: TIntegerField
      FieldName = 'COD_LINHA'
    end
    object CDS_V_EstoquesNOME_LINHA: TStringField
      FieldName = 'NOME_LINHA'
      Size = 30
    end
    object CDS_V_EstoquesCOD_MARCA: TIntegerField
      FieldName = 'COD_MARCA'
    end
    object CDS_V_EstoquesNOME_MARCA: TStringField
      FieldName = 'NOME_MARCA'
      Size = 30
    end
    object CDS_V_EstoquesCOD_COLECAO: TIntegerField
      FieldName = 'COD_COLECAO'
    end
    object CDS_V_EstoquesNOME_COLECAO: TStringField
      FieldName = 'NOME_COLECAO'
      Size = 50
    end
    object CDS_V_EstoquesCOD_FORNECEDOR: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd Forn'
      FieldName = 'COD_FORNECEDOR'
      FixedChar = True
      Size = 6
    end
    object CDS_V_EstoquesDES_FORNECEDOR: TStringField
      DisplayLabel = 'Desc Forn'
      FieldName = 'DES_FORNECEDOR'
      Size = 40
    end
    object CDS_V_EstoquesCOD_COMPRADOR: TIntegerField
      FieldName = 'COD_COMPRADOR'
      Required = True
    end
    object CDS_V_EstoquesDES_COMPRADOR: TStringField
      DisplayLabel = 'Desc Comprador'
      FieldName = 'DES_COMPRADOR'
      FixedChar = True
      Size = 1
    end
    object CDS_V_EstoquesORDENAR: TFMTBCDField
      FieldName = 'ORDENAR'
      Required = True
      Precision = 15
      Size = 0
    end
    object CDS_V_EstoquesNUM_DIASUTEIS: TIntegerField
      DisplayLabel = 'N'#186' Dias Uteis Ano'
      FieldName = 'NUM_DIASUTEIS'
      DisplayFormat = '0,'
    end
    object CDS_V_EstoquesNUM_LINHA: TIntegerField
      DisplayLabel = 'Seq'
      FieldKind = fkCalculated
      FieldName = 'NUM_LINHA'
      Calculated = True
    end
  end
  object DS_V_Estoques: TDataSource
    DataSet = CDS_V_Estoques
    Left = 497
    Top = 40
  end
  object CDS_V_ParamLojaNeces: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 57
    Top = 408
    object CDS_V_ParamLojaNecesCOD_LOJA: TStringField
      Alignment = taCenter
      DisplayLabel = 'C'#243'd'
      FieldName = 'COD_LOJA'
      Size = 2
    end
    object CDS_V_ParamLojaNecesDES_LOJA: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'DES_LOJA'
      Size = 50
    end
    object CDS_V_ParamLojaNecesIND_CURVA_A: TStringField
      Alignment = taCenter
      DisplayLabel = 'Class A'
      FieldName = 'IND_CURVA_A'
      Size = 3
    end
    object CDS_V_ParamLojaNecesIND_CURVA_B: TStringField
      Alignment = taCenter
      DisplayLabel = 'Class B'
      FieldName = 'IND_CURVA_B'
      Size = 3
    end
    object CDS_V_ParamLojaNecesIND_CURVA_C: TStringField
      Alignment = taCenter
      DisplayLabel = 'Class C'
      FieldName = 'IND_CURVA_C'
      Size = 3
    end
    object CDS_V_ParamLojaNecesIND_CURVA_D: TStringField
      Alignment = taCenter
      DisplayLabel = 'Class D'
      FieldName = 'IND_CURVA_D'
      Size = 3
    end
    object CDS_V_ParamLojaNecesIND_CURVA_E: TStringField
      Alignment = taCenter
      DisplayLabel = 'Class E'
      FieldName = 'IND_CURVA_E'
      Size = 3
    end
    object CDS_V_ParamLojaNecesIND_ATIVO: TStringField
      FieldName = 'IND_ATIVO'
      Size = 3
    end
  end
  object DS_V_ParamLojaNeces: TDataSource
    DataSet = CDS_V_ParamLojaNeces
    Left = 121
    Top = 424
  end
  object IBQ_EstoqueLoja: TIBQuery
    Database = DMConexoes.IBDB_01
    Transaction = DMConexoes.IBT_01
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'e.codfilial, e.codproduto, e.saldoatual, e.pedidopendente, '
      'e.zonaendereco, e.corredor, e.prateleira, e.gaveta, '
      'e.cusmedvalor, e.customedio, '
      
        'e.lastprecocompra, e.lastcustomedio, e.estoqueideal, e.estoquema' +
        'ximo, '
      
        'e.dataalteracadastro, e.dataalteraestoque, e.dataalteraestoque_p' +
        'ed, '
      'coalesce(p.principalfor,'#39'000000'#39') principalfor, '
      'current_date DTA_ATUALIZACAO, '#39'19:28:14'#39' HRA_ATUALIZACAO '
      'FROM ESTOQUE e'
      '      LEFT JOIN PRODUTO p on e.codproduto=p.codproduto '
      'WHERE e.codfilial='#39'99'#39)
    Left = 385
    Top = 488
    object IBQ_EstoqueLojaCODFILIAL: TIBStringField
      FieldName = 'CODFILIAL'
      Origin = 'ESTOQUE.CODFILIAL'
      Required = True
      FixedChar = True
      Size = 2
    end
    object IBQ_EstoqueLojaCODPRODUTO: TIBStringField
      FieldName = 'CODPRODUTO'
      Origin = 'ESTOQUE.CODPRODUTO'
      Required = True
      FixedChar = True
      Size = 6
    end
    object IBQ_EstoqueLojaSALDOATUAL: TIBBCDField
      FieldName = 'SALDOATUAL'
      Origin = 'ESTOQUE.SALDOATUAL'
      Precision = 18
      Size = 4
    end
    object IBQ_EstoqueLojaPEDIDOPENDENTE: TIBBCDField
      FieldName = 'PEDIDOPENDENTE'
      Origin = 'ESTOQUE.PEDIDOPENDENTE'
      Precision = 18
      Size = 4
    end
    object IBQ_EstoqueLojaZONAENDERECO: TIntegerField
      FieldName = 'ZONAENDERECO'
      Origin = 'ESTOQUE.ZONAENDERECO'
    end
    object IBQ_EstoqueLojaCORREDOR: TIBStringField
      FieldName = 'CORREDOR'
      Origin = 'ESTOQUE.CORREDOR'
      FixedChar = True
      Size = 3
    end
    object IBQ_EstoqueLojaPRATELEIRA: TIBStringField
      FieldName = 'PRATELEIRA'
      Origin = 'ESTOQUE.PRATELEIRA'
      FixedChar = True
      Size = 3
    end
    object IBQ_EstoqueLojaGAVETA: TIBStringField
      FieldName = 'GAVETA'
      Origin = 'ESTOQUE.GAVETA'
      FixedChar = True
      Size = 4
    end
    object IBQ_EstoqueLojaCUSMEDVALOR: TIBBCDField
      FieldName = 'CUSMEDVALOR'
      Origin = 'ESTOQUE.CUSMEDVALOR'
      Precision = 18
      Size = 2
    end
    object IBQ_EstoqueLojaCUSTOMEDIO: TIBBCDField
      FieldName = 'CUSTOMEDIO'
      Origin = 'ESTOQUE.CUSTOMEDIO'
      Precision = 18
      Size = 4
    end
    object IBQ_EstoqueLojaLASTPRECOCOMPRA: TIBBCDField
      FieldName = 'LASTPRECOCOMPRA'
      Origin = 'ESTOQUE.LASTPRECOCOMPRA'
      Precision = 18
      Size = 4
    end
    object IBQ_EstoqueLojaLASTCUSTOMEDIO: TIBBCDField
      FieldName = 'LASTCUSTOMEDIO'
      Origin = 'ESTOQUE.LASTCUSTOMEDIO'
      Precision = 18
      Size = 4
    end
    object IBQ_EstoqueLojaESTOQUEIDEAL: TIBBCDField
      FieldName = 'ESTOQUEIDEAL'
      Origin = 'ESTOQUE.ESTOQUEIDEAL'
      Precision = 18
      Size = 4
    end
    object IBQ_EstoqueLojaESTOQUEMAXIMO: TIBBCDField
      FieldName = 'ESTOQUEMAXIMO'
      Origin = 'ESTOQUE.ESTOQUEMAXIMO'
      Precision = 18
      Size = 4
    end
    object IBQ_EstoqueLojaDATAALTERACADASTRO: TDateTimeField
      FieldName = 'DATAALTERACADASTRO'
      Origin = 'ESTOQUE.DATAALTERACADASTRO'
    end
    object IBQ_EstoqueLojaDATAALTERAESTOQUE: TDateTimeField
      FieldName = 'DATAALTERAESTOQUE'
      Origin = 'ESTOQUE.DATAALTERAESTOQUE'
    end
    object IBQ_EstoqueLojaDATAALTERAESTOQUE_PED: TDateTimeField
      FieldName = 'DATAALTERAESTOQUE_PED'
      Origin = 'ESTOQUE.DATAALTERAESTOQUE_PED'
    end
    object IBQ_EstoqueLojaPRINCIPALFOR: TIBStringField
      FieldName = 'PRINCIPALFOR'
      FixedChar = True
      Size = 6
    end
    object IBQ_EstoqueLojaDTA_ATUALIZACAO: TDateField
      FieldName = 'DTA_ATUALIZACAO'
      Required = True
    end
    object IBQ_EstoqueLojaHRA_ATUALIZACAO: TIBStringField
      FieldName = 'HRA_ATUALIZACAO'
      Required = True
      FixedChar = True
      Size = 8
    end
  end
  object IBQ_UsuarioTable: TIBQuery
    Database = DMConexoes.IBDB_01
    Transaction = DMConexoes.IBT_01
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      'CASE c.RDB$FIELD_POSITION'
      '  WHEN 0 THEN'
      '    CASE'
      '      WHEN TRIM(c.RDB$FIELD_NAME)='#39'CODUSUARIO'#39' THEN'
      
        '        '#39'SELECT '#39#39'UPDATE OR INSERT INTO '#39'||TRIM(c.RDB$RELATION_N' +
        'AME)||'#39' VALUES ('#39#39#39#39'CODODIR'#39#39#39#39','#39#39'||'#39
      '      ELSE'
      '        CASE'
      '          WHEN f.RDB$FIELD_TYPE = 261 THEN --261-Blob'
      
        '            '#39'SELECT '#39#39'UPDATE OR INSERT INTO '#39'||TRIM(c.RDB$RELATI' +
        'ON_NAME)||'#39' VALUES ('#39#39'||'#39#39#39#39#39#39#39#39'||'#39#39'NULL'#39#39'||'#39#39#39#39#39#39','#39#39'||'#39
      
        '          WHEN f.RDB$FIELD_TYPE IN (14, 37) THEN --14-CHAR 37-VA' +
        'RCHAR'
      
        '            '#39'SELECT '#39#39'UPDATE OR INSERT INTO '#39'||TRIM(c.RDB$RELATI' +
        'ON_NAME)||'#39' VALUES ('#39#39'||'#39#39#39#39#39#39#39#39'||COALESCE(substring(REPLACE('#39'||' +
        'TRIM(c.RDB$FIELD_NAME)||'#39','#39#39#39#39#39#39#39#39','#39#39#39#39#39#39#39#39#39#39#39#39') From 1 for '#39'||f' +
        '.RDB$FIELD_LENGTH||'#39'),'#39#39'NULL'#39#39')||'#39#39#39#39#39#39','#39#39'||'#39
      '          ELSE'
      
        '            '#39'SELECT '#39#39'UPDATE OR INSERT INTO '#39'||TRIM(c.RDB$RELATI' +
        'ON_NAME)||'#39' VALUES ('#39#39'||'#39#39#39#39#39#39#39#39'||COALESCE('#39'||TRIM(c.RDB$FIELD_N' +
        'AME)||'#39','#39#39'NULL'#39#39')||'#39#39#39#39#39#39','#39#39'||'#39
      '        END'
      '    END'
      '  ELSE'
      '    CASE'
      '      WHEN TRIM(c.RDB$FIELD_NAME)='#39'CODUSUARIO'#39' THEN'
      '        '#39#39#39#39#39#39#39'CODODIR'#39#39#39#39','#39#39'||'#39
      '      WHEN TRIM(c.RDB$FIELD_NAME)='#39'NOMEUSUARIO'#39' THEN'
      '        '#39#39#39#39#39#39#39'NOMEODIR'#39#39#39#39','#39#39'||'#39
      '      WHEN TRIM(c.RDB$FIELD_NAME)='#39'SENHAUSUARIO'#39' THEN'
      '        '#39#39#39#39#39#39#39'SENHAODIR'#39#39#39#39','#39#39'||'#39
      '      WHEN TRIM(c.RDB$FIELD_NAME)='#39'NOME_COMPLETO'#39' THEN'
      '        '#39#39#39#39#39#39#39'NOMECOMPLODIR'#39#39#39#39','#39#39'||'#39
      '      WHEN TRIM(c.RDB$FIELD_NAME)='#39'EMAIL'#39' THEN'
      '        '#39#39#39#39#39#39#39'EMAILODIR'#39#39#39#39','#39#39'||'#39
      '      WHEN TRIM(c.RDB$FIELD_NAME)='#39'DATA_NASCIMENTO'#39' THEN'
      '        '#39#39#39#39#39#39#39'DTNASCODIR'#39#39#39#39','#39#39'||'#39
      '      WHEN TRIM(c.RDB$FIELD_NAME)='#39'SEXO'#39' THEN'
      '        '#39#39#39#39#39#39#39'SEXOODIR'#39#39#39#39','#39#39'||'#39
      '      WHEN TRIM(c.RDB$FIELD_NAME)='#39'SETOR'#39' THEN'
      '        '#39#39#39#39#39#39#39'SETORODIR'#39#39#39#39','#39#39'||'#39
      '      WHEN TRIM(c.RDB$FIELD_NAME)='#39'CARGO'#39' THEN'
      '        '#39#39#39#39#39#39#39'CARGOODIR'#39#39#39#39','#39#39'||'#39
      '      WHEN TRIM(c.RDB$FIELD_NAME)='#39'TELEFONE'#39' THEN'
      '        '#39#39#39#39#39#39#39'FONEODIR'#39#39#39#39','#39#39'||'#39
      
        '      WHEN c.RDB$FIELD_POSITION=(SELECT  COUNT(t.RDB$FIELD_POSIT' +
        'ION)-1'
      '                                 FROM RDB$RELATION_FIELDS t'
      
        '                                 WHERE TRIM(t.RDB$RELATION_NAME)' +
        ' = TRIM(c.RDB$RELATION_NAME)) THEN'
      '        CASE'
      '          WHEN f.RDB$FIELD_TYPE = 261 THEN --261-Blob'
      '            '#39#39#39#39#39#39#39#39#39#39#39'NULL'#39#39'||'#39#39#39#39#39#39')'#39#39#39
      
        '          WHEN f.RDB$FIELD_TYPE IN (14, 37) THEN --14-CHAR 37-VA' +
        'RCHAR'
      
        '            '#39#39#39#39#39#39#39#39#39'||COALESCE(substring(REPLACE('#39'||TRIM(c.RDB$' +
        'FIELD_NAME)||'#39','#39#39#39#39#39#39#39#39','#39#39#39#39#39#39#39#39#39#39#39#39') From 1 for '#39'||f.RDB$FIELD_' +
        'LENGTH||'#39'),'#39#39'NULL'#39#39')||'#39#39#39#39#39#39')'#39#39#39
      '          ELSE'
      
        '            '#39#39#39#39#39#39#39#39#39'||COALESCE('#39'||TRIM(c.RDB$FIELD_NAME)||'#39','#39#39'N' +
        'ULL'#39#39')||'#39#39#39#39#39#39')'#39#39#39
      '        END'
      '      ELSE'
      '        CASE'
      '          WHEN f.RDB$FIELD_TYPE = 261 THEN --261-Blob'
      '            '#39#39#39#39#39#39#39#39#39'||'#39#39'NULL'#39#39'||'#39#39#39#39#39#39','#39#39'||'#39
      
        '          WHEN f.RDB$FIELD_TYPE IN (14, 37) THEN --14-CHAR 37-VA' +
        'RCHAR'
      
        '            '#39#39#39#39#39#39#39#39#39'||COALESCE(substring(REPLACE('#39'||TRIM(c.RDB$' +
        'FIELD_NAME)||'#39','#39#39#39#39#39#39#39#39','#39#39#39#39#39#39#39#39#39#39#39#39') From 1 for '#39'||f.RDB$FIELD_' +
        'LENGTH||'#39'),'#39#39'NULL'#39#39')||'#39#39#39#39#39#39','#39#39'||'#39
      '          ELSE'
      
        '            '#39#39#39#39#39#39#39#39#39'||COALESCE('#39'||TRIM(c.RDB$FIELD_NAME)||'#39','#39#39'N' +
        'ULL'#39#39')||'#39#39#39#39#39#39','#39#39'||'#39
      '        END'
      '    END'
      'END Nome_Campo'
      ''
      'FROM RDB$RELATION_FIELDS c, RDB$FIELDS f'
      ''
      'WHERE c.rdb$field_source = f.rdb$field_name'
      'AND   TRIM(c.RDB$RELATION_NAME) = UPPER(:Tabela)'
      'ORDER BY c.RDB$FIELD_POSITION')
    Left = 481
    Top = 512
    ParamData = <
      item
        DataType = ftString
        Name = 'Tabela'
        ParamType = ptUnknown
        Value = 'Usuario'
      end>
    object IBQ_UsuarioTableNOME_CAMPO: TIBStringField
      FieldName = 'NOME_CAMPO'
      Size = 495
    end
  end
  object DS_V_EstoqueLojas: TDataSource
    DataSet = CDS_V_EstoqueLojas
    Left = 462
    Top = 395
  end
  object CDS_V_EstoqueLojas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 384
    object CDS_V_EstoqueLojasCOD_LOJA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Loja'
      FieldName = 'COD_LOJA'
      Size = 8
    end
    object CDS_V_EstoqueLojasQTD_ESTOQUE: TIntegerField
      DisplayLabel = 'Qtd Estoques'
      FieldName = 'QTD_ESTOQUE'
      DisplayFormat = '0,'
    end
    object CDS_V_EstoqueLojasVLR_ESTOQUE: TCurrencyField
      DisplayLabel = 'Vlr Estoques'
      FieldName = 'VLR_ESTOQUE'
      DisplayFormat = '0,.00'
    end
    object CDS_V_EstoqueLojasQTD_VENDAS: TIntegerField
      DisplayLabel = 'Qtd Vendas'
      FieldName = 'QTD_VENDAS'
      DisplayFormat = '0,'
    end
    object CDS_V_EstoqueLojasEST_SIMULADO: TIntegerField
      DisplayLabel = 'Est Simulado'
      FieldName = 'EST_SIMULADO'
      DisplayFormat = '0,'
    end
    object CDS_V_EstoqueLojasVLR_SIMULADO: TCurrencyField
      DisplayLabel = 'Vlr Simulado'
      FieldName = 'VLR_SIMULADO'
      DisplayFormat = '0,.00'
    end
    object CDS_V_EstoqueLojasPER_SIMULADOR: TCurrencyField
      DisplayLabel = '% Simulador'
      FieldName = 'PER_SIMULADOR'
      DisplayFormat = '0,.00'
    end
    object CDS_V_EstoqueLojasDIA_UTEIS: TIntegerField
      DisplayLabel = 'Dias Uteis'
      FieldName = 'DIA_UTEIS'
      DisplayFormat = '0,'
    end
    object CDS_V_EstoqueLojasDTA_INICIO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data In'#237'cio'
      FieldName = 'DTA_INICIO'
    end
    object CDS_V_EstoqueLojasDTA_FIM: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Fim'
      FieldName = 'DTA_FIM'
    end
  end
  object CDS_V_EstoquesFinan: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CLASSE'
    Params = <>
    ProviderName = 'DSP_EstoquesFinan'
    Left = 386
    Top = 108
    object CDS_V_EstoquesFinanCLASSE: TStringField
      DisplayLabel = 'Cl'
      FieldName = 'CLASSE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDS_V_EstoquesFinanDM: TIntegerField
      DisplayLabel = 'Dm'
      FieldName = 'DM'
      Required = True
      DisplayFormat = '0,'
    end
    object CDS_V_EstoquesFinanDM_PC: TFMTBCDField
      DisplayLabel = 'Dm P'#231' Ct'
      FieldName = 'DM_PC'
      Required = True
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesFinanDM_PV: TFMTBCDField
      DisplayLabel = 'Dm P'#231' Vd'
      FieldName = 'DM_PV'
      Required = True
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesFinanEST: TIntegerField
      DisplayLabel = 'Est'
      FieldName = 'EST'
      Required = True
      DisplayFormat = '0,'
    end
    object CDS_V_EstoquesFinanEST_PC: TFMTBCDField
      DisplayLabel = 'Est P'#231' Ct'
      FieldName = 'EST_PC'
      Required = True
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesFinanEST_PV: TFMTBCDField
      DisplayLabel = 'Est P'#231' Vd'
      FieldName = 'EST_PV'
      Required = True
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesFinanDIF_EST_DM: TIntegerField
      DisplayLabel = '# Est Dm'
      FieldName = 'DIF_EST_DM'
      Required = True
      DisplayFormat = '0,'
    end
    object CDS_V_EstoquesFinanDIF_EST_DM_PC: TFMTBCDField
      DisplayLabel = '# Est Dm P'#231' Ct'
      FieldName = 'DIF_EST_DM_PC'
      Required = True
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesFinanDIF_EST_DM_PV: TFMTBCDField
      DisplayLabel = '# Est Dm P'#231' Pv'
      FieldName = 'DIF_EST_DM_PV'
      Required = True
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
  end
  object DS_V_EstoquesFinan: TDataSource
    DataSet = CDS_V_EstoquesFinan
    Left = 446
    Top = 128
  end
  object DS_V_NFeProdutos: TDataSource
    DataSet = CDS_V_NFeProdutos
    Left = 433
    Top = 255
  end
  object CDS_V_NFeProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CDS_V_NFeProdutosAfterScroll
    Left = 385
    Top = 247
    object CDS_V_NFeProdutosCOD_LOJA: TStringField
      Alignment = taCenter
      FieldName = 'COD_LOJA'
      FixedChar = True
      Size = 2
    end
    object CDS_V_NFeProdutosCOD_PROD: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd Prod'
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object CDS_V_NFeProdutosDES_PROD: TStringField
      DisplayLabel = 'Desc Prod'
      FieldName = 'DES_PROD'
      Size = 80
    end
    object CDS_V_NFeProdutosCOD_COMPRV: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd Comprv'
      FieldName = 'COD_COMPRV'
      FixedChar = True
      Size = 3
    end
    object CDS_V_NFeProdutosDES_COMPRV: TStringField
      DisplayLabel = 'Desc Comprv'
      FieldName = 'DES_COMPRV'
      FixedChar = True
    end
    object CDS_V_NFeProdutosQTD_TOTAL: TIntegerField
      DisplayLabel = 'Qt Total'
      FieldName = 'QTD_TOTAL'
      DisplayFormat = '0,'
    end
    object CDS_V_NFeProdutosVLR_TOTAL: TFMTBCDField
      DisplayLabel = '$ Total'
      FieldName = 'VLR_TOTAL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
  end
  object DSP_SelectLoja: TDataSetProvider
    DataSet = SDS_SelectLoja
    Options = [poRetainServerOrder]
    Left = 395
    Top = 322
  end
  object CDS_SelectLoja: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'COD_LOJA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 6
      end
      item
        Name = 'RAZAO_SOCIAL'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    ObjectView = False
    Params = <>
    ProviderName = 'DSP_SelectLoja'
    StoreDefs = True
    AfterScroll = CDS_SelectLojaAfterScroll
    Left = 432
    Top = 306
    object CDS_SelectLojaCOD_LOJA: TStringField
      DisplayLabel = 'C'#243'd Loja'
      FieldName = 'COD_LOJA'
      Required = True
      Size = 6
    end
    object CDS_SelectLojaRAZAO_SOCIAL: TStringField
      DisplayLabel = 'Desc Loja'
      FieldName = 'RAZAO_SOCIAL'
      Size = 60
    end
  end
  object DS_SelectLoja: TDataSource
    DataSet = CDS_SelectLoja
    Left = 470
    Top = 323
  end
  object SDS_SelectLoja: TSQLDataSet
    CommandText = 
      'SELECT '#39'Bel_'#39' || e.cod_filial cod_loja, e.razao_social'#13#10'FROM emp' +
      '_conexoes e'#13#10'WHERE e.cod_filial IN ('#39'01'#39', '#39'02'#39')'#13#10'ORDER BY 1  '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 361
    Top = 312
  end
  object CDS_V_Creditos: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Des_Credito'
    Params = <>
    Left = 920
    Top = 187
    object CDS_V_CreditosDes_Credito: TStringField
      FieldName = 'Des_Credito'
      Size = 30
    end
    object CDS_V_CreditosCod_Credito: TStringField
      Alignment = taRightJustify
      FieldName = 'Cod_Credito'
      Size = 4
    end
  end
  object Ds_V_Creditos: TDataSource
    DataSet = CDS_V_Creditos
    Left = 980
    Top = 203
  end
  object SQLQ_Busca: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      'GEN_ID(gen_odir,1) SEQ,'
      'pr.cod_produto COD_PRODUTO,'
      'TRIM(pr.nome) DES_PRODUTO,'
      'TRIM(fc.ind_curva) IND_CURVA,'
      'CAST(COALESCE(e4.vlr_venda_m1,0.00) AS NUMERIC(12,2)) VLR_VD_M1,'
      'CAST(COALESCE(e4.vlr_venda_m2,0.00) AS NUMERIC(12,2)) VLR_VD_M2,'
      'CAST(COALESCE(e4.vlr_venda_m3,0.00) AS NUMERIC(12,2)) VLR_VD_M3,'
      'CAST(COALESCE(e4.vlr_venda_m4,0.00) AS NUMERIC(12,2)) VLR_VD_M4,'
      'CAST(COALESCE(e4.vlr_venda_m5,0.00) AS NUMERIC(12,2)) VLR_VD_M5,'
      'COALESCE(e4.vlr_venda,0) VLR_VENDAS_4M, 0.00 VLR_VENDAS_ANO,'
      ''
      'CAST(COALESCE(e4.qtd_venda_m1,0) AS INTEGER) QTD_VD_M1,'
      'CAST(COALESCE(e4.qtd_venda_m2,0) AS INTEGER) QTD_VD_M2,'
      'CAST(COALESCE(e4.qtd_venda_m3,0) AS INTEGER) QTD_VD_M3,'
      'CAST(COALESCE(e4.qtd_venda_m4,0) AS INTEGER) QTD_VD_M4,'
      'CAST(COALESCE(e4.qtd_venda_m5,0) AS INTEGER) QTD_VD_M5,'
      'CAST(COALESCE(e4.qtd_venda,0) AS INTEGER)  QTD_VENDAS_4M,'
      ''
      'COALESCE(CAST(((COALESCE(e4.qtd_venda_m1,0.0000)+'
      '                COALESCE(e4.qtd_venda_m2,0.0000)+'
      '                COALESCE(e4.qtd_venda_m3,0.0000)+'
      '                COALESCE(e4.qtd_venda_m4,0.0000))/4)'
      'AS NUMERIC(12,4)) , 0) QTD_MEDIA_MES,'
      ''
      '0 QTD_ESTOCAGEM_4M,'
      '0 QTD_VENDAS_ANO,'
      '0 QTD_ESTOCAGEM_ANO,'
      'COALESCE(fc.per_participacao,0.0000) PER_PARTICIPACAO,'
      'CAST(pd.quantidade AS INTEGER) QTD_ESTOQUE,'
      'COALESCE(fc.qtd_transito,0) QTD_TRANSITO,'
      
        '(CAST(pd.quantidade AS INTEGER) + COALESCE(fc.qtd_transito,0)) Q' +
        'TD_DISPONIVEL,'
      'CAST(COALESCE(fc.est_minimo,0) AS INTEGER) EST_IDEAL,'
      'CAST(COALESCE(fc.est_maximo,0) AS INTEGER) EST_MAXIMO,'
      'CAST(COALESCE(pd.preco_venda,0.0000) AS NUMERIC(15,4)) PC_VENDA,'
      'CAST(COALESCE(pd.preco_custo,0.0000) AS NUMERIC(15,4)) PC_CUSTO,'
      '0.0000 PER_MARGEM,'
      'pr.dt_inclusao DTA_INCLUSAO,'
      'pr.id_setor COD_SETOR,'
      'TRIM(pr.desc_setor) NOME_SETOR,'
      'pr.id_linha COD_LINHA,'
      'TRIM(pr.desc_linha) NOME_LINHA,'
      'pr.id_marca COD_MARCA,'
      'TRIM(pr.desc_marca) NOME_MARCA,'
      'pr.id_colecao COD_COLECAO,'
      'TRIM(pr.desc_colecao) NOME_COLECAO,'
      'TRIM(pr.cod_fornecedor) COD_FORNECEDOR,'
      'TRIM(fo.nome_cliente) DES_FORNECEDOR,'
      '0 COD_COMPRADOR,'
      'NUll DES_COMPRADOR,'
      'GEN_ID(gen_tecbiz,1)+12 ORDENAR,'
      'COALESCE(fc.num_dias_uteis,0) NUM_DIASUTEIS,'
      '0 NUM_LINHA'
      'FROM ES_FINAN_CURVA_ABC fc'
      
        '     LEFT JOIN LINXPRODUTOS pr          ON pr.cod_produto=fc.cod' +
        '_prod_linx'
      
        '     LEFT JOIN LINXPRODUTOSDETALHES pd  ON pd.cod_produto=fc.cod' +
        '_prod_linx'
      
        '                                       AND pd.empresa=fc.cod_lin' +
        'x'
      
        '     LEFT JOIN ES_DEMANDAS_4MESES e4    ON e4.cod_linx =fc.cod_l' +
        'inx'
      
        '                                       AND e4.cod_prod_linx=fc.c' +
        'od_prod_linx'
      
        '     LEFT JOIN LINXCLIENTESFORNEC fo    ON fo.cod_cliente=pr.cod' +
        '_fornecedor'
      ''
      'WHERE fc.cod_linx=30'
      'AND   pr.desativado='#39'N'#39
      'AND   NOT (COALESCE(pr.id_setor, 0) in (17, 20, 25))'
      'AND   NOT (COALESCE(pr.id_linha, 0) in (33))'
      'AND   NOT (COALESCE(pr.id_colecao, 0) in (294, 587))'
      'AND   NOT (COALESCE(pr.cod_fornecedor, 0) in (6, 1014, 260))'
      'ORDER BY fc.ind_curva, fc.per_participacao desc'
      '')
    SQLConnection = DMBelShop.SQLC
    Left = 357
    Top = 24
  end
  object DSP_SQLQ_Busca: TDataSetProvider
    DataSet = SQLQ_Busca
    Options = [poRetainServerOrder]
    Left = 405
    Top = 46
  end
  object CDS_V_MixAnaliseForn: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 919
    Top = 259
    object CDS_V_MixAnaliseFornCOD_AUXILIAR: TStringField
      FieldName = 'COD_AUXILIAR'
      Size = 40
    end
    object CDS_V_MixAnaliseFornCOD_PRODUTO: TFMTBCDField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PRODUTO'
      Precision = 15
      Size = 0
    end
    object CDS_V_MixAnaliseFornNOME: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'NOME'
      Size = 250
    end
    object CDS_V_MixAnaliseFornABC: TStringField
      FieldName = 'ABC'
      Size = 1
    end
    object CDS_V_MixAnaliseFornFAT_PERIODO: TFMTBCDField
      DisplayLabel = 'Fat Per'#237'odo'
      FieldName = 'FAT_PERIODO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object CDS_V_MixAnaliseFornDESC_SETOR: TStringField
      DisplayLabel = 'Setor'
      FieldName = 'DESC_SETOR'
      Size = 30
    end
    object CDS_V_MixAnaliseFornDESC_COLECAO: TStringField
      DisplayLabel = 'Cole'#231#227'o'
      FieldName = 'DESC_COLECAO'
      Size = 50
    end
    object CDS_V_MixAnaliseFornLOJA1: TIntegerField
      FieldName = 'LOJA1'
    end
    object CDS_V_MixAnaliseFornLOJA2: TIntegerField
      FieldName = 'LOJA2'
    end
    object CDS_V_MixAnaliseFornLOJA3: TIntegerField
      FieldName = 'LOJA3'
    end
    object CDS_V_MixAnaliseFornLOJA4: TIntegerField
      FieldName = 'LOJA4'
    end
    object CDS_V_MixAnaliseFornLOJA5: TIntegerField
      FieldName = 'LOJA5'
    end
    object CDS_V_MixAnaliseFornLOJA6: TIntegerField
      FieldName = 'LOJA6'
    end
    object CDS_V_MixAnaliseFornLOJA7: TIntegerField
      FieldName = 'LOJA7'
    end
    object CDS_V_MixAnaliseFornLOJA8: TIntegerField
      FieldName = 'LOJA8'
    end
    object CDS_V_MixAnaliseFornLOJA9: TIntegerField
      FieldName = 'LOJA9'
    end
    object CDS_V_MixAnaliseFornLOJA10: TIntegerField
      FieldName = 'LOJA10'
    end
    object CDS_V_MixAnaliseFornLOJA11: TIntegerField
      FieldName = 'LOJA11'
    end
    object CDS_V_MixAnaliseFornLOJA12: TIntegerField
      FieldName = 'LOJA12'
    end
    object CDS_V_MixAnaliseFornLOJA13: TIntegerField
      FieldName = 'LOJA13'
    end
    object CDS_V_MixAnaliseFornLOJA14: TIntegerField
      FieldName = 'LOJA14'
    end
    object CDS_V_MixAnaliseFornLOJA15: TIntegerField
      FieldName = 'LOJA15'
    end
    object CDS_V_MixAnaliseFornLOJA16: TIntegerField
      FieldName = 'LOJA16'
    end
    object CDS_V_MixAnaliseFornLOJA17: TIntegerField
      FieldName = 'LOJA17'
    end
    object CDS_V_MixAnaliseFornLOJA18: TIntegerField
      FieldName = 'LOJA18'
    end
    object CDS_V_MixAnaliseFornLOJA19: TIntegerField
      FieldName = 'LOJA19'
    end
    object CDS_V_MixAnaliseFornLOJA20: TIntegerField
      FieldName = 'LOJA20'
    end
    object CDS_V_MixAnaliseFornLOJA21: TIntegerField
      FieldName = 'LOJA21'
    end
    object CDS_V_MixAnaliseFornLOJA22: TIntegerField
      FieldName = 'LOJA22'
    end
    object CDS_V_MixAnaliseFornLOJA23: TIntegerField
      FieldName = 'LOJA23'
    end
    object CDS_V_MixAnaliseFornLOJA24: TIntegerField
      FieldName = 'LOJA24'
    end
    object CDS_V_MixAnaliseFornLOJA25: TIntegerField
      FieldName = 'LOJA25'
    end
    object CDS_V_MixAnaliseFornLOJA26: TIntegerField
      FieldName = 'LOJA26'
    end
    object CDS_V_MixAnaliseFornLOJA27: TIntegerField
      FieldName = 'LOJA27'
    end
    object CDS_V_MixAnaliseFornLOJA28: TIntegerField
      FieldName = 'LOJA28'
    end
    object CDS_V_MixAnaliseFornLOJA29: TIntegerField
      FieldName = 'LOJA29'
    end
    object CDS_V_MixAnaliseFornLOJA30: TIntegerField
      FieldName = 'LOJA30'
    end
    object CDS_V_MixAnaliseFornLOJA31: TIntegerField
      FieldName = 'LOJA31'
    end
    object CDS_V_MixAnaliseFornLOJA32: TIntegerField
      FieldName = 'LOJA32'
    end
    object CDS_V_MixAnaliseFornLOJA33: TIntegerField
      FieldName = 'LOJA33'
    end
    object CDS_V_MixAnaliseFornLOJA34: TIntegerField
      FieldName = 'LOJA34'
    end
    object CDS_V_MixAnaliseFornLOJA35: TIntegerField
      FieldName = 'LOJA35'
    end
    object CDS_V_MixAnaliseFornID_COLECAO: TIntegerField
      FieldName = 'ID_COLECAO'
    end
    object CDS_V_MixAnaliseFornCOD_FORNECEDOR: TIntegerField
      DisplayLabel = 'C'#243'd Forn'
      FieldName = 'COD_FORNECEDOR'
    end
    object CDS_V_MixAnaliseFornFORN: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORN'
      Size = 60
    end
    object CDS_V_MixAnaliseFornIND_MULTISEL: TSmallintField
      FieldName = 'IND_MULTISEL'
    end
  end
  object DS_V_MixAnaliseForn: TDataSource
    DataSet = CDS_V_MixAnaliseForn
    Left = 977
    Top = 273
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DSP_SQLQ_Busca'
    AfterEdit = CDS_V_EstoquesAfterEdit
    AfterPost = CDS_V_EstoquesAfterPost
    OnCalcFields = CDS_V_EstoquesCalcFields
    Left = 894
    Top = 424
    object FMTBCDField1: TFMTBCDField
      DisplayLabel = 'Seq'
      FieldName = 'SEQ'
      Required = True
      DisplayFormat = '0,'
      Precision = 15
      Size = 0
    end
    object StringField1: TStringField
      DisplayLabel = 'C'#243'd'
      FieldName = 'COD_PRODUTO'
      FixedChar = True
      Size = 6
    end
    object StringField2: TStringField
      DisplayLabel = 'Desc Prod'
      FieldName = 'DES_PRODUTO'
      Size = 80
    end
    object StringField3: TStringField
      Alignment = taCenter
      DisplayLabel = 'CL'
      FieldName = 'IND_CURVA'
      Size = 1
    end
    object FMTBCDField2: TFMTBCDField
      FieldName = 'VLR_VD_M1'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField3: TFMTBCDField
      FieldName = 'VLR_VD_M2'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField4: TFMTBCDField
      FieldName = 'VLR_VD_M3'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField5: TFMTBCDField
      FieldName = 'VLR_VD_M4'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField6: TFMTBCDField
      FieldName = 'VLR_VD_M5'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField7: TFMTBCDField
      DisplayLabel = '$ Vd AA'
      FieldName = 'VLR_VENDAS_ANO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField8: TFMTBCDField
      DisplayLabel = '$ Vd 4 M'
      FieldName = 'VLR_VENDAS_4M'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField9: TFMTBCDField
      DisplayLabel = '$ '#215' Vd M'
      FieldName = 'VLR_MEDIA_MES'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField10: TFMTBCDField
      DisplayLabel = '$ '#215' Vd Dia'
      FieldName = 'VLR_MEDIA_DIA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object IntegerField1: TIntegerField
      FieldName = 'QTD_VD_M1'
      DisplayFormat = '0,'
    end
    object IntegerField2: TIntegerField
      FieldName = 'QTD_VD_M2'
      DisplayFormat = '0,'
    end
    object IntegerField3: TIntegerField
      FieldName = 'QTD_VD_M3'
      DisplayFormat = '0,'
    end
    object IntegerField4: TIntegerField
      FieldName = 'QTD_VD_M4'
      DisplayFormat = '0,'
    end
    object IntegerField5: TIntegerField
      FieldName = 'QTD_VD_M5'
      DisplayFormat = '0,'
    end
    object IntegerField6: TIntegerField
      DisplayLabel = 'Qt Vd 4 M'
      FieldName = 'QTD_VENDAS_4M'
      DisplayFormat = '0,'
    end
    object FMTBCDField11: TFMTBCDField
      DisplayLabel = 'Qt '#215' Vd M'
      FieldName = 'QTD_MEDIA_MES'
      DisplayFormat = '0,.0000'
      Precision = 15
      Size = 4
    end
    object FMTBCDField12: TFMTBCDField
      DisplayLabel = 'Qt '#215' Vd Dia'
      FieldName = 'QTD_MEDIA_DIA'
      DisplayFormat = '0,.0000'
      Precision = 15
      Size = 4
    end
    object IntegerField7: TIntegerField
      DisplayLabel = 'Qt EstG 4 M'
      FieldName = 'QTD_ESTCAGEM_4M'
      DisplayFormat = '0,'
    end
    object IntegerField8: TIntegerField
      DisplayLabel = 'Qt Vd AA'
      FieldName = 'QTD_VENDAS_ANO'
      DisplayFormat = '0,'
    end
    object IntegerField9: TIntegerField
      DisplayLabel = 'Qt EstG AA'
      FieldName = 'QTD_ESTOCAGEM_ANO'
      DisplayFormat = '0,'
    end
    object FMTBCDField13: TFMTBCDField
      DisplayLabel = '% Part'
      FieldName = 'PER_PARTICIPACAO'
      DisplayFormat = '0.,0000'
      Precision = 15
      Size = 4
    end
    object IntegerField10: TIntegerField
      DisplayLabel = 'Qt Est'
      FieldName = 'QTD_ESTOQUE'
      DisplayFormat = '0,'
    end
    object IntegerField11: TIntegerField
      DisplayLabel = 'Qt Trans'
      FieldName = 'QTD_TRANSITO'
      DisplayFormat = '0,'
    end
    object IntegerField12: TIntegerField
      DisplayLabel = 'Qt Disp'
      FieldName = 'QTD_DISPONIVEL'
      DisplayFormat = '0,'
    end
    object IntegerField13: TIntegerField
      DisplayLabel = 'Est M'#237'n'
      FieldName = 'EST_IDEAL'
      DisplayFormat = '0,'
    end
    object IntegerField14: TIntegerField
      DisplayLabel = 'Est M'#225'x'
      FieldName = 'EST_MAXIMO'
      DisplayFormat = '0,'
    end
    object FMTBCDField14: TFMTBCDField
      DisplayLabel = 'P'#231' Vd'
      FieldName = 'PC_VENDA'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 4
    end
    object FMTBCDField15: TFMTBCDField
      DisplayLabel = '$ Qt Disp P'#231' Vd'
      FieldName = 'VLR_DISP_PC_VENDA'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField16: TFMTBCDField
      DisplayLabel = '$ Qt Est P'#231' Vd'
      FieldName = 'VLR_EST_PC_VENDA'
      Precision = 15
      Size = 2
    end
    object FMTBCDField17: TFMTBCDField
      DisplayLabel = 'P'#231' Ct'
      FieldName = 'PC_CUSTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField18: TFMTBCDField
      DisplayLabel = '$ Qt Disp P'#231' Ct'
      FieldName = 'VLR_DISP_PC_CUSTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField19: TFMTBCDField
      DisplayLabel = '$ Qt Est P'#231' Ct'
      FieldName = 'VLR_EST_PC_CUSTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField20: TFMTBCDField
      DisplayLabel = '% Mg Lc'
      FieldName = 'PER_MARGEM'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object DateField1: TDateField
      DisplayLabel = 'Dt Incl'
      FieldName = 'DTA_INCLUSAO'
    end
    object StringField4: TStringField
      DisplayLabel = 'C'#243'd Gr'
      FieldName = 'CODGRUPO'
      FixedChar = True
      Size = 3
    end
    object StringField5: TStringField
      DisplayLabel = 'Desc Gr'
      FieldName = 'NOMEGRUPO'
      FixedChar = True
      Size = 30
    end
    object StringField6: TStringField
      DisplayLabel = 'C'#243'd Sub-Gr'
      FieldName = 'CODSUBGRUPO'
      FixedChar = True
      Size = 4
    end
    object StringField7: TStringField
      DisplayLabel = 'Desc Sub-Gr'
      FieldName = 'NOMESUBGRUPO'
      FixedChar = True
      Size = 30
    end
    object StringField8: TStringField
      DisplayLabel = 'C'#243'd Gr Sub'
      FieldName = 'CODGRUPOSUB'
      FixedChar = True
      Size = 7
    end
    object StringField9: TStringField
      DisplayLabel = 'Sit Prod'
      DisplayWidth = 5
      FieldName = 'IND_SITUACAO'
      Required = True
      Size = 5
    end
    object StringField10: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd Forn'
      FieldName = 'COD_FORNECEDOR'
      FixedChar = True
      Size = 6
    end
    object StringField11: TStringField
      DisplayLabel = 'Desc Forn'
      FieldName = 'DES_FORNECEDOR'
      Size = 40
    end
    object StringField12: TStringField
      FieldName = 'COD_COMPRADOR'
      FixedChar = True
      Size = 7
    end
    object StringField13: TStringField
      DisplayLabel = 'Desc Comprador'
      FieldName = 'DES_COMPRADOR'
      FixedChar = True
      Size = 30
    end
    object FMTBCDField21: TFMTBCDField
      DisplayLabel = 'Vendas Acumuladas'
      FieldName = 'VLR_VENDAS_ACUM'
      Required = True
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField22: TFMTBCDField
      FieldName = 'ORDENAR'
      Required = True
      Precision = 15
      Size = 0
    end
    object StringField14: TStringField
      FieldName = 'ALTERACAO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object FMTBCDField23: TFMTBCDField
      DisplayLabel = 'Vendas Acumuladas OK'
      FieldName = 'VLR_VENDAS_ACUM_OK'
      Required = True
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object IntegerField15: TIntegerField
      DisplayLabel = 'N'#186' Dias Uteis Ano'
      FieldName = 'NUM_DIASUTEIS'
      DisplayFormat = '0,'
    end
    object IntegerField16: TIntegerField
      DisplayLabel = 'N'#186' Dias Uteis 4Meses'
      FieldName = 'DIAS_UTEIS_4M'
      DisplayFormat = '0,'
    end
    object IntegerField17: TIntegerField
      DisplayLabel = 'Seq'
      FieldKind = fkCalculated
      FieldName = 'NUM_LINHA'
      Calculated = True
    end
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet1
    Left = 945
    Top = 440
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 805
    Top = 424
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLQuery1
    Options = [poRetainServerOrder]
    Left = 853
    Top = 446
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DSP_SQLQ_Busca'
    AfterEdit = CDS_V_EstoquesAfterEdit
    AfterPost = CDS_V_EstoquesAfterPost
    OnCalcFields = CDS_V_EstoquesCalcFields
    Left = 902
    Top = 496
    object FMTBCDField24: TFMTBCDField
      DisplayLabel = 'Seq'
      FieldName = 'SEQ'
      Required = True
      DisplayFormat = '0,'
      Precision = 15
      Size = 0
    end
    object FMTBCDField25: TFMTBCDField
      DisplayLabel = 'C'#243'd'
      FieldName = 'COD_PRODUTO'
      Precision = 15
      Size = 0
    end
    object StringField15: TStringField
      DisplayLabel = 'Desc Prod'
      FieldName = 'DES_PRODUTO'
      Size = 80
    end
    object StringField16: TStringField
      Alignment = taCenter
      DisplayLabel = 'CL'
      FieldName = 'IND_CURVA'
      Size = 1
    end
    object FMTBCDField26: TFMTBCDField
      FieldName = 'VLR_VD_M1'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField27: TFMTBCDField
      FieldName = 'VLR_VD_M2'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField28: TFMTBCDField
      FieldName = 'VLR_VD_M3'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField29: TFMTBCDField
      FieldName = 'VLR_VD_M4'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField30: TFMTBCDField
      FieldName = 'VLR_VD_M5'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField31: TFMTBCDField
      DisplayLabel = '$ Vd AA'
      FieldName = 'VLR_VENDAS_ANO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField32: TFMTBCDField
      DisplayLabel = '$ Vd 4 M'
      FieldName = 'VLR_VENDAS_4M'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField33: TFMTBCDField
      DisplayLabel = '$ '#215' Vd M'
      FieldName = 'VLR_MEDIA_MES'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField34: TFMTBCDField
      DisplayLabel = '$ '#215' Vd Dia'
      FieldName = 'VLR_MEDIA_DIA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object IntegerField18: TIntegerField
      FieldName = 'QTD_VD_M1'
      DisplayFormat = '0,'
    end
    object IntegerField19: TIntegerField
      FieldName = 'QTD_VD_M2'
      DisplayFormat = '0,'
    end
    object IntegerField20: TIntegerField
      FieldName = 'QTD_VD_M3'
      DisplayFormat = '0,'
    end
    object IntegerField21: TIntegerField
      FieldName = 'QTD_VD_M4'
      DisplayFormat = '0,'
    end
    object IntegerField22: TIntegerField
      FieldName = 'QTD_VD_M5'
      DisplayFormat = '0,'
    end
    object IntegerField23: TIntegerField
      DisplayLabel = 'Qt Vd 4 M'
      FieldName = 'QTD_VENDAS_4M'
      DisplayFormat = '0,'
    end
    object FMTBCDField35: TFMTBCDField
      DisplayLabel = 'Qt '#215' Vd M'
      FieldName = 'QTD_MEDIA_MES'
      DisplayFormat = '0,.0000'
      Precision = 15
      Size = 4
    end
    object FMTBCDField36: TFMTBCDField
      DisplayLabel = 'Qt '#215' Vd Dia'
      FieldName = 'QTD_MEDIA_DIA'
      DisplayFormat = '0,.0000'
      Precision = 15
      Size = 4
    end
    object IntegerField24: TIntegerField
      DisplayLabel = 'Qt EstG 4 M'
      FieldName = 'QTD_ESTOCAGEM_4M'
      Required = True
    end
    object IntegerField25: TIntegerField
      DisplayLabel = 'Qt Vd AA'
      FieldName = 'QTD_VENDAS_ANO'
      DisplayFormat = '0,'
    end
    object IntegerField26: TIntegerField
      DisplayLabel = 'Qt EstG AA'
      FieldName = 'QTD_ESTOCAGEM_ANO'
      DisplayFormat = '0,'
    end
    object FMTBCDField37: TFMTBCDField
      DisplayLabel = '% Part'
      FieldName = 'PER_PARTICIPACAO'
      DisplayFormat = '0.,0000'
      Precision = 15
      Size = 4
    end
    object IntegerField27: TIntegerField
      DisplayLabel = 'Qt Est'
      FieldName = 'QTD_ESTOQUE'
      DisplayFormat = '0,'
    end
    object IntegerField28: TIntegerField
      DisplayLabel = 'Qt Trans'
      FieldName = 'QTD_TRANSITO'
      DisplayFormat = '0,'
    end
    object FMTBCDField38: TFMTBCDField
      FieldName = 'QTD_DISPONIVEL'
      Precision = 15
      Size = 0
    end
    object IntegerField29: TIntegerField
      DisplayLabel = 'Est M'#237'n'
      FieldName = 'EST_IDEAL'
      DisplayFormat = '0,'
    end
    object IntegerField30: TIntegerField
      DisplayLabel = 'Est M'#225'x'
      FieldName = 'EST_MAXIMO'
      DisplayFormat = '0,'
    end
    object FMTBCDField39: TFMTBCDField
      DisplayLabel = 'P'#231' Vd'
      FieldName = 'PC_VENDA'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 4
    end
    object FMTBCDField40: TFMTBCDField
      DisplayLabel = '$ Qt Disp P'#231' Vd'
      FieldName = 'VLR_DISP_PC_VENDA'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField41: TFMTBCDField
      DisplayLabel = '$ Qt Est P'#231' Vd'
      FieldName = 'VLR_EST_PC_VENDA'
      Precision = 15
      Size = 2
    end
    object FMTBCDField42: TFMTBCDField
      DisplayLabel = 'P'#231' Ct'
      FieldName = 'PC_CUSTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField43: TFMTBCDField
      DisplayLabel = '$ Qt Disp P'#231' Ct'
      FieldName = 'VLR_DISP_PC_CUSTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField44: TFMTBCDField
      DisplayLabel = '$ Qt Est P'#231' Ct'
      FieldName = 'VLR_EST_PC_CUSTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField45: TFMTBCDField
      DisplayLabel = '% Mg Lc'
      FieldName = 'PER_MARGEM'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object SQLTimeStampField1: TSQLTimeStampField
      DisplayLabel = 'Dt Incl'
      FieldName = 'DTA_INCLUSAO'
    end
    object IntegerField31: TIntegerField
      FieldName = 'COD_SETOR'
    end
    object StringField17: TStringField
      FieldName = 'NOME_SETOR'
      Size = 30
    end
    object IntegerField32: TIntegerField
      FieldName = 'COD_LINHA'
    end
    object StringField18: TStringField
      FieldName = 'NOME_LINHA'
      Size = 30
    end
    object IntegerField33: TIntegerField
      FieldName = 'COD_MARCA'
    end
    object StringField19: TStringField
      FieldName = 'NOME_MARCA'
      Size = 30
    end
    object IntegerField34: TIntegerField
      FieldName = 'COD_COLECAO'
    end
    object StringField20: TStringField
      FieldName = 'NOME_COLECAO'
      Size = 50
    end
    object StringField21: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object StringField22: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd Forn'
      FieldName = 'COD_FORNECEDOR'
      FixedChar = True
      Size = 6
    end
    object StringField23: TStringField
      DisplayLabel = 'Desc Forn'
      FieldName = 'DES_FORNECEDOR'
      Size = 40
    end
    object IntegerField35: TIntegerField
      FieldName = 'COD_COMPRADOR'
      Required = True
    end
    object StringField24: TStringField
      DisplayLabel = 'Desc Comprador'
      FieldName = 'DES_COMPRADOR'
      FixedChar = True
      Size = 30
    end
    object FMTBCDField46: TFMTBCDField
      DisplayLabel = 'Vendas Acumuladas'
      FieldName = 'VLR_VENDAS_ACUM'
      Required = True
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField47: TFMTBCDField
      FieldName = 'ORDENAR'
      Required = True
      Precision = 15
      Size = 0
    end
    object StringField25: TStringField
      FieldName = 'ALTERACAO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object FMTBCDField48: TFMTBCDField
      DisplayLabel = 'Vendas Acumuladas OK'
      FieldName = 'VLR_VENDAS_ACUM_OK'
      Required = True
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object IntegerField36: TIntegerField
      DisplayLabel = 'N'#186' Dias Uteis Ano'
      FieldName = 'NUM_DIASUTEIS'
      DisplayFormat = '0,'
    end
    object IntegerField37: TIntegerField
      DisplayLabel = 'N'#186' Dias Uteis 4Meses'
      FieldName = 'DIAS_UTEIS_4M'
      DisplayFormat = '0,'
    end
    object IntegerField38: TIntegerField
      DisplayLabel = 'Seq'
      FieldKind = fkCalculated
      FieldName = 'NUM_LINHA'
      Calculated = True
    end
    object IntegerField39: TIntegerField
      FieldName = 'EST_CURVAA'
      Visible = False
    end
    object IntegerField40: TIntegerField
      FieldName = 'EST_CURVAB'
      Visible = False
    end
    object IntegerField41: TIntegerField
      FieldName = 'EST_CURVAC'
      Visible = False
    end
    object IntegerField42: TIntegerField
      FieldName = 'EST_CURVAD'
      Visible = False
    end
    object IntegerField43: TIntegerField
      FieldName = 'EST_CURVAE'
      Visible = False
    end
    object FMTBCDField49: TFMTBCDField
      FieldName = 'EST_CURVAA_PC'
      Visible = False
      Precision = 15
      Size = 2
    end
    object FMTBCDField50: TFMTBCDField
      FieldName = 'EST_CURVAB_PC'
      Visible = False
      Precision = 15
      Size = 2
    end
    object FMTBCDField51: TFMTBCDField
      FieldName = 'EST_CURVAC_PC'
      Visible = False
      Precision = 15
      Size = 2
    end
    object FMTBCDField52: TFMTBCDField
      FieldName = 'EST_CURVAD_PC'
      Visible = False
      Precision = 15
      Size = 2
    end
    object FMTBCDField53: TFMTBCDField
      FieldName = 'EST_CURVAE_PC'
      Visible = False
      Precision = 15
      Size = 2
    end
    object FMTBCDField54: TFMTBCDField
      FieldName = 'EST_CURVAA_PV'
      Visible = False
      Precision = 15
      Size = 2
    end
    object FMTBCDField55: TFMTBCDField
      FieldName = 'EST_CURVAB_PV'
      Visible = False
      Precision = 15
      Size = 2
    end
    object FMTBCDField56: TFMTBCDField
      FieldName = 'EST_CURVAC_PV'
      Visible = False
      Precision = 15
      Size = 2
    end
    object FMTBCDField57: TFMTBCDField
      FieldName = 'EST_CURVAD_PV'
      Visible = False
      Precision = 15
      Size = 2
    end
    object FMTBCDField58: TFMTBCDField
      FieldName = 'EST_CURVAE_PV'
      Visible = False
      Precision = 15
      Size = 2
    end
    object IntegerField44: TIntegerField
      FieldName = 'DM_CURVAA'
      Visible = False
    end
    object IntegerField45: TIntegerField
      FieldName = 'DM_CURVAB'
      Visible = False
    end
    object IntegerField46: TIntegerField
      FieldName = 'DM_CURVAC'
      Visible = False
    end
    object IntegerField47: TIntegerField
      FieldName = 'DM_CURVAD'
      Visible = False
    end
    object IntegerField48: TIntegerField
      FieldName = 'DM_CURVAE'
      Visible = False
    end
    object IntegerField49: TIntegerField
      FieldName = 'DM_CURVAA_PC'
      Visible = False
    end
    object IntegerField50: TIntegerField
      FieldName = 'DM_CURVAB_PC'
      Visible = False
    end
    object IntegerField51: TIntegerField
      FieldName = 'DM_CURVAC_PC'
      Visible = False
    end
    object IntegerField52: TIntegerField
      FieldName = 'DM_CURVAD_PC'
      Visible = False
    end
    object IntegerField53: TIntegerField
      FieldName = 'DM_CURVAE_PC'
      Visible = False
    end
    object FMTBCDField59: TFMTBCDField
      FieldName = 'DM_CURVAA_PV'
      Visible = False
      Precision = 15
      Size = 2
    end
    object FMTBCDField60: TFMTBCDField
      FieldName = 'DM_CURVAB_PV'
      Visible = False
      Precision = 15
      Size = 2
    end
    object FMTBCDField61: TFMTBCDField
      FieldName = 'DM_CURVAC_PV'
      Visible = False
      Precision = 15
      Size = 2
    end
    object FMTBCDField62: TFMTBCDField
      FieldName = 'DM_CURVAD_PV'
      Visible = False
      Precision = 15
      Size = 2
    end
    object FMTBCDField63: TFMTBCDField
      FieldName = 'DM_CURVAE_PV'
      Visible = False
      Precision = 15
      Size = 2
    end
  end
  object DataSource3: TDataSource
    DataSet = ClientDataSet2
    Left = 953
    Top = 512
  end
  object SQLQuery2: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      'GEN_ID(gen_odir,1) SEQ,'
      'pr.cod_produto COD_PRODUTO,'
      'TRIM(pr.nome) DES_PRODUTO,'
      'TRIM(fc.ind_curva) IND_CURVA,'
      ''
      'CAST(COALESCE(e4.vlr_venda_m1,0.00) AS NUMERIC(12,2)) VLR_VD_M1,'
      'CAST(COALESCE(e4.vlr_venda_m2,0.00) AS NUMERIC(12,2)) VLR_VD_M2,'
      'CAST(COALESCE(e4.vlr_venda_m3,0.00) AS NUMERIC(12,2)) VLR_VD_M3,'
      'CAST(COALESCE(e4.vlr_venda_m4,0.00) AS NUMERIC(12,2)) VLR_VD_M4,'
      'CAST(COALESCE(e4.vlr_venda_m5,0.00) AS NUMERIC(12,2)) VLR_VD_M5,'
      ''
      'COALESCE(e4.vlr_venda,0) VLR_VENDAS_4M,'
      ''
      '0.00 VLR_VENDAS_ANO,'
      ''
      '0.00 VLR_MEDIA_MES,'
      ''
      '0.00 VLR_MEDIA_DIA,'
      ''
      'CAST(COALESCE(e4.qtd_venda_m1,0) AS INTEGER) QTD_VD_M1,'
      'CAST(COALESCE(e4.qtd_venda_m2,0) AS INTEGER) QTD_VD_M2,'
      'CAST(COALESCE(e4.qtd_venda_m3,0) AS INTEGER) QTD_VD_M3,'
      'CAST(COALESCE(e4.qtd_venda_m4,0) AS INTEGER) QTD_VD_M4,'
      'CAST(COALESCE(e4.qtd_venda_m5,0) AS INTEGER) QTD_VD_M5,'
      'CAST(COALESCE(e4.qtd_venda,0) AS INTEGER)  QTD_VENDAS_4M,'
      ''
      'COALESCE(CAST(((COALESCE(e4.qtd_venda_m1,0.0000)+'
      '                COALESCE(e4.qtd_venda_m2,0.0000)+'
      '                COALESCE(e4.qtd_venda_m3,0.0000)+'
      '                COALESCE(e4.qtd_venda_m4,0.0000))/4)'
      '         AS NUMERIC(12,4))'
      ', 0) QTD_MEDIA_MES,'
      ''
      '0.0000 QTD_MEDIA_DIA,'
      ''
      '0 QTD_ESTOCAGEM_4M,'
      ''
      '0 QTD_VENDAS_ANO,'
      ''
      '0 QTD_ESTOCAGEM_ANO,'
      ''
      'COALESCE(fc.per_participacao,0.0000) PER_PARTICIPACAO,'
      ''
      'CAST(pd.quantidade AS INTEGER) QTD_ESTOQUE,'
      ''
      'COALESCE(fc.qtd_transito,0) QTD_TRANSITO,'
      
        '(CAST(pd.quantidade AS INTEGER) + COALESCE(fc.qtd_transito,0)) Q' +
        'TD_DISPONIVEL,'
      ''
      'CAST(COALESCE(fc.est_minimo,0) AS INTEGER) EST_IDEAL,'
      'CAST(COALESCE(fc.est_maximo,0) AS INTEGER) EST_MAXIMO,'
      ''
      'CAST(COALESCE(pd.preco_venda,0.0000) AS NUMERIC(15,4)) PC_VENDA,'
      ''
      '0.00 VLR_DISP_PC_VENDA,'
      '0.00 VLR_EST_PC_VENDA,'
      ''
      'CAST(COALESCE(pd.preco_custo,0.0000) AS NUMERIC(15,4)) PC_CUSTO,'
      ''
      '0.0000 VLR_DISP_PC_CUSTO,'
      '0.0000 VLR_EST_PC_CUSTO,'
      ''
      '0.0000 PER_MARGEM,'
      ''
      'pr.dt_inclusao DTA_INCLUSAO,'
      ''
      ''
      'pr.id_setor   COD_SETOR,'
      'TRIM(pr.desc_setor) NOME_SETOR,'
      'pr.id_linha   COD_LINHA,'
      'TRIM(pr.desc_linha) NOME_LINHA,'
      'pr.id_marca  COD_MARCA,'
      'TRIM(pr.desc_marca) NOME_MARCA,'
      'pr.id_colecao  COD_COLECAO,'
      'TRIM(pr.desc_colecao) NOME_COLECAO,'
      ''
      'CASE'
      '  WHEN pr.desativado='#39'N'#39' THEN'
      '     '#39'SIM'#39
      '  ELSE'
      '     '#39'NAO'#39
      'END ATIVO,'
      ''
      'TRIM(pr.cod_fornecedor) COD_FORNECEDOR,'
      'TRIM(fo.nome_cliente) DES_FORNECEDOR,'
      ''
      '0 COD_COMPRADOR,'
      'LPAD('#39#39', 30, '#39' '#39')  DES_COMPRADOR,'
      ''
      '0.00 VLR_VENDAS_ACUM,'
      'GEN_ID(gen_tecbiz,1)+12 ORDENAR,'
      #39'NAO'#39' ALTERACAO,'
      '0.00 VLR_VENDAS_ACUM_OK,'
      'COALESCE(fc.num_dias_uteis,0) NUM_DIASUTEIS,'
      'COALESCE(121,0) DIAS_UTEIS_4M,'
      '0 NUM_LINHA,'
      ''
      '0 EST_CurvaA,'
      '0 EST_CurvaB,'
      '0 EST_CurvaC,'
      '0 EST_CurvaD,'
      '0 EST_CurvaE,'
      ''
      '0.00 EST_CurvaA_PC,'
      '0.00 EST_CurvaB_PC,'
      '0.00 EST_CurvaC_PC,'
      '0.00 EST_CurvaD_PC,'
      '0.00 EST_CurvaE_PC,'
      ''
      '0.00 EST_CurvaA_PV,'
      '0.00 EST_CurvaB_PV,'
      '0.00 EST_CurvaC_PV,'
      '0.00 EST_CurvaD_PV,'
      '0.00 EST_CurvaE_PV,'
      ''
      '0 DM_CurvaA,'
      '0 DM_CurvaB,'
      '0 DM_CurvaC,'
      '0 DM_CurvaD,'
      '0 DM_CurvaE,'
      ''
      '0 DM_CurvaA_PC,'
      '0 DM_CurvaB_PC,'
      '0 DM_CurvaC_PC,'
      '0 DM_CurvaD_PC,'
      '0 DM_CurvaE_PC,'
      ''
      '0.00 DM_CurvaA_PV,'
      '0.00 DM_CurvaB_PV,'
      '0.00 DM_CurvaC_PV,'
      '0.00 DM_CurvaD_PV,'
      '0.00 DM_CurvaE_PV'
      ''
      'FROM ES_FINAN_CURVA_ABC fc'
      
        '    LEFT JOIN LINXPRODUTOS pr          ON pr.cod_produto=fc.cod_' +
        'prod_linx'
      
        '    LEFT JOIN LINXPRODUTOSDETALHES pd  ON pd.cod_produto=fc.cod_' +
        'prod_linx'
      '                                      AND pd.empresa=fc.cod_linx'
      
        '    LEFT JOIN ES_DEMANDAS_4MESES e4    ON e4.cod_linx =fc.cod_li' +
        'nx'
      
        '                                      AND e4.cod_prod_linx=fc.co' +
        'd_prod_linx'
      
        '    LEFT JOIN LINXCLIENTESFORNEC fo    ON fo.cod_cliente=pr.cod_' +
        'fornecedor'
      '/*'
      
        '    LEFT JOIN (SELECT FIRST 1 xx.cod_comprador, xx.des_comprador' +
        ','
      '                              xx.num_ordens, xx.cod_produto'
      '               FROM PRODUTOS_COMPRADORES xx'
      
        '               ORDER BY xx.num_ordens desc) cp on cp.cod_produto' +
        '=pr.cod_produto'
      '*/'
      'WHERE fc.cod_linx=30'
      'AND   pr.desativado='#39'N'#39
      'AND   NOT (COALESCE(pr.id_setor, 0) in (17, 20, 25))'
      'AND   NOT (COALESCE(pr.id_linha, 0) in (33))'
      'AND   NOT (COALESCE(pr.id_colecao, 0) in (294, 587))'
      'AND   NOT (COALESCE(pr.cod_fornecedor, 0) in (6, 1014, 260))'
      ''
      'ORDER BY fc.ind_curva, fc.per_participacao desc'
      ''
      ''
      '')
    SQLConnection = DMBelShop.SQLC
    Left = 813
    Top = 496
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = SQLQuery2
    Options = [poRetainServerOrder]
    Left = 861
    Top = 518
  end
end
