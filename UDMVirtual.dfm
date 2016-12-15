object DMVirtual: TDMVirtual
  OldCreateOrder = False
  Left = 156
  Top = 82
  Height = 646
  Width = 1134
  object CDS_V_EmpConexoes: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'COD_EMP'
    Params = <>
    Left = 72
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
  end
  object DS_V_GruposProdutos: TDataSource
    DataSet = CDS_V_GruposProdutos
    Left = 276
    Top = 130
  end
  object CDS_V_SubGruposProdutos: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Des_SubGrupo'
    Params = <>
    Left = 224
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
    Left = 276
    Top = 195
  end
  object CDS_V_Fornecedores: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Des_Fornecedor'
    Params = <>
    Left = 224
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
    Left = 276
    Top = 74
  end
  object CDS_V_Aplicacao: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Des_Aplicacao'
    Params = <>
    Left = 224
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
    Left = 276
    Top = 259
  end
  object CDS_V_FamiliaPrecos: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Des_FamiliaPreco'
    Params = <>
    Left = 224
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
    Left = 276
    Top = 316
  end
  object CDS_V_GrupoST: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Des_GrupoST'
    Params = <>
    Left = 224
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
    Left = 276
    Top = 380
  end
  object CDS_GruposST: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Des_GrupoST'
    Params = <>
    Left = 224
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
    Left = 276
    Top = 444
  end
  object CDS_V_Produtos: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Cod_Produto'
    Params = <>
    Left = 224
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
    Left = 276
    Top = 23
  end
  object CDS_V_GruposProdutos: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Des_Grupo'
    Params = <>
    AfterScroll = CDS_V_GruposProdutosAfterScroll
    Left = 224
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
    Left = 72
    Top = 96
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
    Left = 108
    Top = 112
  end
  object CDS_V_ApresComprovantes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 176
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
    Left = 108
    Top = 192
  end
  object CDS_V_PlanDemonsResultados: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'INDICE'
    Params = <>
    Left = 72
    Top = 248
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
    Left = 108
    Top = 264
  end
  object CDS_V_CurvaABCEndereco: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 405
    Top = 8
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
    Left = 456
    Top = 24
  end
  object CDS_V_PlanoContasCompr200: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Des_PlanoContas'
    Params = <>
    Left = 72
    Top = 320
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
    Left = 108
    Top = 336
  end
  object DS_V_ObjetivosDias: TDataSource
    DataSet = CDS_V_ObjetivosDias
    Left = 664
    Top = 17
  end
  object CDS_V_ObjetivosDias: TClientDataSet
    Aggregates = <>
    Filter = 'VISIVEL='#39'S'#39
    Filtered = True
    IndexFieldNames = 'INDICE'
    Params = <>
    Left = 608
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
    Left = 616
    Top = 418
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
    Left = 659
    Top = 431
  end
  object DS_V_EmpConexoes: TDataSource
    DataSet = CDS_V_EmpConexoes
    Left = 108
    Top = 24
  end
  object CDS_V_EstFisFinanLojas: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'INDICE'
    Params = <>
    Left = 616
    Top = 482
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
    Left = 661
    Top = 498
  end
  object DS_V_ObjetivosMeses: TDataSource
    DataSet = CDS_V_ObjetivosMeses
    Left = 664
    Top = 81
  end
  object CDS_V_ObjetivosMeses: TClientDataSet
    Aggregates = <>
    Filter = 'VISIVEL='#39'S'#39
    Filtered = True
    IndexFieldNames = 'INDICE'
    Params = <>
    Left = 608
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
    Left = 664
    Top = 137
  end
  object CDS_V_ObjetivosMovtos: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'COD_FILIAL;COD_OBJETIVO;ORDEM;'
    Params = <>
    Left = 608
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
    Left = 664
    Top = 192
  end
  object CDS_V_ObjetivosAuditorias: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ORDEM'
    Params = <>
    Left = 608
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
    Left = 456
    Top = 273
  end
  object CDS_V_NFe: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ORDEM'
    Params = <>
    Left = 400
    Top = 265
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
    Left = 664
    Top = 553
  end
  object CDS_V_GiroEstoque: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ORDEM'
    Params = <>
    Left = 608
    Top = 545
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
    Left = 664
    Top = 370
  end
  object CDS_V_Mix_Prod: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 608
    Top = 362
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
    Left = 224
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
    Left = 276
    Top = 500
  end
  object CDS_V_MargLucroBonif: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CODFILIAL;APRESENTACAO'
    Params = <>
    Left = 808
    Top = 80
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
    Left = 875
    Top = 93
  end
  object CDS_V_MargLucroBonifRes: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'SINALESTOQUE;DESCOMPROVANTE'
    Params = <>
    Left = 808
    Top = 138
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
    Left = 880
    Top = 150
  end
  object DS_V_MargLucroFinal: TDataSource
    DataSet = CDS_V_MargLucroFinal
    Left = 880
    Top = 210
  end
  object CDS_V_MargLucroFinal: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 808
    Top = 194
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
    Left = 809
    Top = 24
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
    Left = 871
    Top = 36
  end
  object CDS_V_MargemLucroForn: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CDS_V_MargemLucroFornAfterScroll
    Left = 809
    Top = 264
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
    Left = 879
    Top = 276
  end
  object CDS_V_MargemLucroScroll: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 809
    Top = 328
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
    Left = 880
    Top = 352
  end
  object CDS_V_AudCompVend: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 816
    Top = 416
    object CDS_V_AudCompVendCOD_LOJA: TStringField
      DisplayLabel = 'Loja'
      FieldName = 'COD_LOJA'
      Size = 6
    end
    object CDS_V_AudCompVendCODPRODUTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODPRODUTO'
      FixedChar = True
      Size = 6
    end
    object CDS_V_AudCompVendDESC_PRODUTO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESC_PRODUTO'
      Size = 80
    end
    object CDS_V_AudCompVendSITUACAOPRO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAOPRO'
      FixedChar = True
      Size = 5
    end
    object CDS_V_AudCompVendNCM: TStringField
      Alignment = taRightJustify
      FieldName = 'NCM'
      FixedChar = True
      Size = 8
    end
    object CDS_V_AudCompVendCODFISCAL: TIntegerField
      DisplayLabel = 'Cod_Fiscal'
      FieldName = 'CODFISCAL'
    end
    object CDS_V_AudCompVendCODFISCALPRO: TIntegerField
      DisplayLabel = 'Cod_Fiscal_Prod'
      FieldName = 'CODFISCALPRO'
    end
    object CDS_V_AudCompVendCOMPRA_VENDA: TStringField
      DisplayLabel = 'Compra/Venda'
      FieldName = 'COMPRA_VENDA'
      FixedChar = True
      Size = 8
    end
    object CDS_V_AudCompVendNAOSOMAESTOQUE: TStringField
      Alignment = taCenter
      DisplayLabel = 'N'#227'o_Soma_Estoque'
      FieldName = 'NAOSOMAESTOQUE'
      FixedChar = True
      Size = 3
    end
    object CDS_V_AudCompVendSOMOUESTOQUE: TStringField
      Alignment = taCenter
      DisplayLabel = 'Somou_Estoque'
      FieldName = 'SOMOUESTOQUE'
      FixedChar = True
      Size = 3
    end
    object CDS_V_AudCompVendQUANTIDADE: TCurrencyField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      DisplayFormat = '0.,00'
    end
    object CDS_V_AudCompVendVLR_BRUTO: TFMTBCDField
      DisplayLabel = 'Valor_Bruto'
      FieldName = 'VLR_BRUTO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendPER_DESCONTO: TFMTBCDField
      DisplayLabel = '%_Desc'
      FieldName = 'PER_DESCONTO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendVLR_DESC_ITEM: TFMTBCDField
      DisplayLabel = 'Valor_Desc_Item'
      FieldName = 'VLR_DESC_ITEM'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendVLR_DESCONTO_RS: TFMTBCDField
      DisplayLabel = 'Valor_Desc_RS'
      FieldName = 'VLR_DESCONTO_RS'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendSOMADESPESABASEICM: TStringField
      Alignment = taCenter
      DisplayLabel = 'Soma_Despesa_Base_ICM'
      FieldName = 'SOMADESPESABASEICM'
      FixedChar = True
      Size = 3
    end
    object CDS_V_AudCompVendSOMADESPESABASEIPI: TStringField
      Alignment = taCenter
      DisplayLabel = 'Soma_Despessa_Base_IPI'
      FieldName = 'SOMADESPESABASEIPI'
      FixedChar = True
      Size = 3
    end
    object CDS_V_AudCompVendSOMADESPESABASEST: TStringField
      Alignment = taCenter
      DisplayLabel = 'Soma_Despessa_Base_ST'
      FieldName = 'SOMADESPESABASEST'
      FixedChar = True
      Size = 3
    end
    object CDS_V_AudCompVendVLR_DESPESAS: TFMTBCDField
      DisplayLabel = 'Valor_Despesas'
      FieldName = 'VLR_DESPESAS'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendVLR_TOTAL: TFMTBCDField
      DisplayLabel = 'Valor_Total'
      FieldName = 'VLR_TOTAL'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendVLR_ARREDONDA: TFMTBCDField
      DisplayLabel = 'Vlr Arredonda'
      FieldName = 'VLR_ARREDONDA'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendRS_ICM_SN: TStringField
      Alignment = taCenter
      DisplayLabel = 'RS_ICMS_S/N'
      FieldName = 'RS_ICM_SN'
      FixedChar = True
      Size = 3
    end
    object CDS_V_AudCompVendISENTO_ICM: TStringField
      Alignment = taCenter
      DisplayLabel = 'Isento_ICM'
      FieldName = 'ISENTO_ICM'
      FixedChar = True
      Size = 3
    end
    object CDS_V_AudCompVendCST_ICMS: TStringField
      Alignment = taCenter
      FieldName = 'CST_ICMS'
      FixedChar = True
      Size = 3
    end
    object CDS_V_AudCompVendVLR_BASEICM: TFMTBCDField
      DisplayLabel = 'Valor_Base_ICM'
      FieldName = 'VLR_BASEICM'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendALIQICMORIGEM: TFMTBCDField
      DisplayLabel = '%_ICM_Origem'
      FieldName = 'ALIQICMORIGEM'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendALIQICM: TFMTBCDField
      DisplayLabel = '%_ICM'
      FieldName = 'ALIQICM'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendVLR_ICM: TFMTBCDField
      DisplayLabel = 'Valor_ICM'
      FieldName = 'VLR_ICM'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendALIQICMREDUCAO: TFMTBCDField
      DisplayLabel = '%_ICM_Redu'#231#227'o'
      FieldName = 'ALIQICMREDUCAO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 4
    end
    object CDS_V_AudCompVendVLR_REDUCAOICM: TFMTBCDField
      DisplayLabel = 'Valor_Redu'#231#227'o_ICM'
      FieldName = 'VLR_REDUCAOICM'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendVLR_ISENTOICM: TFMTBCDField
      DisplayLabel = 'Valor_Isento_ICM'
      FieldName = 'VLR_ISENTOICM'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendVLR_OUTROSICM: TFMTBCDField
      DisplayLabel = 'Valor_Outros_ICM'
      FieldName = 'VLR_OUTROSICM'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendISENTO_IPI: TStringField
      Alignment = taCenter
      DisplayLabel = 'Isento_IPI'
      FieldName = 'ISENTO_IPI'
      FixedChar = True
      Size = 3
    end
    object CDS_V_AudCompVendSOMAIPIBASEICM: TStringField
      Alignment = taCenter
      DisplayLabel = 'Soma_IPI_Base_ICM'
      FieldName = 'SOMAIPIBASEICM'
      FixedChar = True
      Size = 3
    end
    object CDS_V_AudCompVendSOMAIPIBASESUBST: TStringField
      Alignment = taCenter
      DisplayLabel = 'Soma_IPI_Base_ST'
      FieldName = 'SOMAIPIBASESUBST'
      FixedChar = True
      Size = 3
    end
    object CDS_V_AudCompVendIPI_PERC_OU_VALOR: TStringField
      Alignment = taCenter
      DisplayLabel = 'IPI_Perc_ou_Valor'
      FieldName = 'IPI_PERC_OU_VALOR'
      FixedChar = True
      Size = 1
    end
    object CDS_V_AudCompVendIPISOMATOTAL_SN: TStringField
      Alignment = taCenter
      DisplayLabel = 'IPI_Soma_Total_S/N'
      FieldName = 'IPISOMATOTAL_SN'
      FixedChar = True
      Size = 3
    end
    object CDS_V_AudCompVendCST_IPI: TStringField
      Alignment = taCenter
      FieldName = 'CST_IPI'
      Size = 11
    end
    object CDS_V_AudCompVendVLR_BASEIPI: TFMTBCDField
      DisplayLabel = 'Valor_Base_IPI'
      FieldName = 'VLR_BASEIPI'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendALIQIPI: TFMTBCDField
      DisplayLabel = '%_IPI'
      FieldName = 'ALIQIPI'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendVLR_IPI: TFMTBCDField
      DisplayLabel = 'Valor_IPI'
      FieldName = 'VLR_IPI'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendVLR_ISENTOIPI: TFMTBCDField
      DisplayLabel = 'Valor_Isento_IPI'
      FieldName = 'VLR_ISENTOIPI'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendVLR_OUTROSIPI: TFMTBCDField
      DisplayLabel = 'Valor_Outros_IPI'
      FieldName = 'VLR_OUTROSIPI'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendIPIREDUCAO: TFMTBCDField
      DisplayLabel = 'IPI_Redu'#231#227'o'
      FieldName = 'IPIREDUCAO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendSUBSTITUICAO_S_N: TStringField
      Alignment = taCenter
      DisplayLabel = 'ST_S/N'
      FieldName = 'SUBSTITUICAO_S_N'
      FixedChar = True
      Size = 3
    end
    object CDS_V_AudCompVendISENTO_SUBST: TStringField
      Alignment = taCenter
      DisplayLabel = 'Isento_ST'
      FieldName = 'ISENTO_SUBST'
      FixedChar = True
      Size = 3
    end
    object CDS_V_AudCompVendSOMASTBASEPISCOFINS: TStringField
      Alignment = taCenter
      DisplayLabel = 'Soma_ST_Base_PisCofins'
      FieldName = 'SOMASTBASEPISCOFINS'
      FixedChar = True
      Size = 3
    end
    object CDS_V_AudCompVendSUBST_VAL_PER: TStringField
      Alignment = taCenter
      DisplayLabel = 'ST_Vlr/Perc'
      FieldName = 'SUBST_VAL_PER'
      Size = 11
    end
    object CDS_V_AudCompVendSUBSTMARGEM: TFMTBCDField
      DisplayLabel = 'ST_Margem'
      FieldName = 'SUBSTMARGEM'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 4
    end
    object CDS_V_AudCompVendVLR_BASESUBST: TFMTBCDField
      DisplayLabel = 'Valor_Base_ST'
      FieldName = 'VLR_BASESUBST'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendSUBSTALIQ: TFMTBCDField
      DisplayLabel = '%_ST'
      FieldName = 'SUBSTALIQ'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendVLR_SUBSTITUICAO: TFMTBCDField
      DisplayLabel = 'Valor_ST'
      FieldName = 'VLR_SUBSTITUICAO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendSUBSTDESCONTO: TFMTBCDField
      DisplayLabel = 'ST_Desconto'
      FieldName = 'SUBSTDESCONTO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendISENTO_PISCOFINS: TStringField
      DisplayLabel = 'Isento_PisCofins'
      FieldName = 'ISENTO_PISCOFINS'
      FixedChar = True
      Size = 3
    end
    object CDS_V_AudCompVendVLR_BASEPISCOFINS: TFMTBCDField
      DisplayLabel = 'Valor_Base_PisCofins'
      FieldName = 'VLR_BASEPISCOFINS'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendCST_PIS: TStringField
      Alignment = taCenter
      FieldName = 'CST_PIS'
      Size = 11
    end
    object CDS_V_AudCompVendALIQPIS: TFMTBCDField
      DisplayLabel = '%_PIS'
      FieldName = 'ALIQPIS'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendVLR_PIS: TFMTBCDField
      DisplayLabel = 'Valor_PIS'
      FieldName = 'VLR_PIS'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendCST_COFINS: TStringField
      Alignment = taCenter
      DisplayLabel = 'CST_Cofins'
      FieldName = 'CST_COFINS'
      Size = 11
    end
    object CDS_V_AudCompVendALIQCOFINS: TFMTBCDField
      DisplayLabel = '%_Cofins'
      FieldName = 'ALIQCOFINS'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendVLR_COFINS: TFMTBCDField
      DisplayLabel = 'Valor_Cofins'
      FieldName = 'VLR_COFINS'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendVLR_BASEPIS_ST: TFMTBCDField
      DisplayLabel = 'Valor_Base_PIS_ST'
      FieldName = 'VLR_BASEPIS_ST'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendMARGEM_PIS: TFMTBCDField
      DisplayLabel = 'Margem_PIS'
      FieldName = 'MARGEM_PIS'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendVLR_PIS_ST: TFMTBCDField
      DisplayLabel = 'Valor_PIS_ST'
      FieldName = 'VLR_PIS_ST'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendVLR_BASECOFINS_ST: TFMTBCDField
      DisplayLabel = 'Valor_Base_Cofins_ST'
      FieldName = 'VLR_BASECOFINS_ST'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendMARGEM_COFINS: TFMTBCDField
      DisplayLabel = 'Margem_Cofins'
      FieldName = 'MARGEM_COFINS'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendVLR_COFINS_ST: TFMTBCDField
      DisplayLabel = 'Valor_Cofins_ST'
      FieldName = 'VLR_COFINS_ST'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendALIQREPASSE: TFMTBCDField
      DisplayLabel = '%'#31'_Repasse'
      FieldName = 'ALIQREPASSE'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendVLR_REPASSE: TFMTBCDField
      DisplayLabel = 'Valor_Repasse'
      FieldName = 'VLR_REPASSE'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendSOMAFRETEBASEICM: TStringField
      Alignment = taCenter
      DisplayLabel = 'Soma_Frete_Base_ICM'
      FieldName = 'SOMAFRETEBASEICM'
      FixedChar = True
      Size = 3
    end
    object CDS_V_AudCompVendSOMAFRETEBASEIPI: TStringField
      Alignment = taCenter
      DisplayLabel = 'Soma_Frete_Base_IPI'
      FieldName = 'SOMAFRETEBASEIPI'
      FixedChar = True
      Size = 3
    end
    object CDS_V_AudCompVendSOMAFRETEBASEST: TStringField
      Alignment = taCenter
      DisplayLabel = 'Soma_Frete_Base_ST'
      FieldName = 'SOMAFRETEBASEST'
      FixedChar = True
      Size = 3
    end
    object CDS_V_AudCompVendVLR_FRETE: TFMTBCDField
      DisplayLabel = 'Valor_Frete'
      FieldName = 'VLR_FRETE'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendVLR_FRETE_INCLUSO: TFMTBCDField
      DisplayLabel = 'Valor_Frete_Incluso'
      FieldName = 'VLR_FRETE_INCLUSO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendVLR_FRETENAO: TFMTBCDField
      DisplayLabel = 'Valor_Frete_N'#227'o'
      FieldName = 'VLR_FRETENAO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendVLR_SEGURO: TFMTBCDField
      DisplayLabel = 'Valor_Seguro'
      FieldName = 'VLR_SEGURO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendALIQISS: TFMTBCDField
      DisplayLabel = '%_ISS'
      FieldName = 'ALIQISS'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendVLR_ISS: TFMTBCDField
      DisplayLabel = 'Valor_ISS'
      FieldName = 'VLR_ISS'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendVLR_BASEII: TFMTBCDField
      DisplayLabel = 'Valor_Base_Imp_Imp'
      FieldName = 'VLR_BASEII'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendALIQII: TFMTBCDField
      DisplayLabel = '%_Imp_Imp'
      FieldName = 'ALIQII'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendVLR_II: TFMTBCDField
      DisplayLabel = 'Valor_Imp_Imp'
      FieldName = 'VLR_II'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendVLR_BONIFICADO: TFMTBCDField
      DisplayLabel = 'Valor_Bonifica'#231#227'o'
      FieldName = 'VLR_BONIFICADO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendCOMP_VALTOTBONIFICADO: TFMTBCDField
      DisplayLabel = 'Comp_Vlr_Bonificado'
      FieldName = 'COMP_VALTOTBONIFICADO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_AudCompVendSIMPLESESTADUAL: TStringField
      Alignment = taCenter
      DisplayLabel = 'Simples_Estadual'
      FieldName = 'SIMPLESESTADUAL'
      FixedChar = True
      Size = 3
    end
    object CDS_V_AudCompVendNum_Seq: TIntegerField
      FieldName = 'Num_Seq'
      Visible = False
    end
  end
  object DS_V_AudCompVend: TDataSource
    DataSet = CDS_V_AudCompVend
    Left = 888
    Top = 432
  end
  object DS_V_ParamSalMinimo: TDataSource
    DataSet = CDS_V_ParamSalMinimo
    Left = 120
    Top = 440
  end
  object CDS_V_ParamSalMinimo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 64
    Top = 432
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
    Left = 976
    Top = 24
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
    Left = 976
    Top = 80
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
    Left = 1048
    Top = 32
  end
  object DS_V_KitsNotas: TDataSource
    DataSet = CDS_V_KitsNotas
    Left = 1040
    Top = 96
  end
  object CDS_V_SaldoTransf: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 992
    Top = 168
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
    Left = 1008
    Top = 232
  end
  object CDS_V_Estoques: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    AfterEdit = CDS_V_EstoquesAfterEdit
    AfterPost = CDS_V_EstoquesAfterPost
    AfterScroll = CDS_V_EstoquesAfterScroll
    OnCalcFields = CDS_V_EstoquesCalcFields
    Left = 413
    Top = 96
    object CDS_V_EstoquesSEQ: TFMTBCDField
      DisplayLabel = 'Seq'
      FieldName = 'SEQ'
      Required = True
      DisplayFormat = '0,'
      Precision = 15
      Size = 0
    end
    object CDS_V_EstoquesCOD_PRODUTO: TStringField
      DisplayLabel = 'C'#243'd'
      FieldName = 'COD_PRODUTO'
      FixedChar = True
      Size = 6
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
    object CDS_V_EstoquesVLR_MEDIA_MES: TFMTBCDField
      DisplayLabel = '$ '#215' Vd M'
      FieldName = 'VLR_MEDIA_MES'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesVLR_MEDIA_DIA: TFMTBCDField
      DisplayLabel = '$ '#215' Vd Dia'
      FieldName = 'VLR_MEDIA_DIA'
      DisplayFormat = '0,.00'
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
    object CDS_V_EstoquesQTD_VENDAS_ANO: TIntegerField
      DisplayLabel = 'Qt Vd AA'
      FieldName = 'QTD_VENDAS_ANO'
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
      DisplayFormat = '0,'
      Precision = 15
      Size = 4
    end
    object CDS_V_EstoquesQTD_MEDIA_DIA: TFMTBCDField
      DisplayLabel = 'Qt '#215' Vd Dia'
      FieldName = 'QTD_MEDIA_DIA'
      DisplayFormat = '0,.0000'
      Precision = 15
      Size = 4
    end
    object CDS_V_EstoquesQTD_ESTCAGEM_4M: TIntegerField
      DisplayLabel = 'Qt EstG 4 M'
      FieldName = 'QTD_ESTCAGEM_4M'
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
    object CDS_V_EstoquesQTD_DISPONIVEL: TIntegerField
      DisplayLabel = 'Qt Disp'
      FieldName = 'QTD_DISPONIVEL'
      DisplayFormat = '0,'
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
    object CDS_V_EstoquesVLR_TOTAL_VENDA: TFMTBCDField
      DisplayLabel = '$ Qt Disp P'#231' Vd'
      FieldName = 'VLR_DISP_PC_VENDA'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesVLR_EST_PC_VENDA: TFMTBCDField
      DisplayLabel = '$ Qt Est P'#231' Vd'
      FieldName = 'VLR_EST_PC_VENDA'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesPC_CUSTO: TFMTBCDField
      DisplayLabel = 'P'#231' Ct'
      FieldName = 'PC_CUSTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesVLR_DISP_PC_CUSTO: TFMTBCDField
      DisplayLabel = '$ Qt Disp P'#231' Ct'
      FieldName = 'VLR_DISP_PC_CUSTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesVLR_EST_PC_CUSTO: TFMTBCDField
      DisplayLabel = '$ Qt Est P'#231' Ct'
      FieldName = 'VLR_EST_PC_CUSTO'
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
    object CDS_V_EstoquesDTA_INCLUSAO: TDateField
      DisplayLabel = 'Dt Incl'
      FieldName = 'DTA_INCLUSAO'
    end
    object CDS_V_EstoquesCODGRUPO: TStringField
      DisplayLabel = 'C'#243'd Gr'
      FieldName = 'CODGRUPO'
      FixedChar = True
      Size = 3
    end
    object CDS_V_EstoquesNOMEGRUPO: TStringField
      DisplayLabel = 'Desc Gr'
      FieldName = 'NOMEGRUPO'
      FixedChar = True
      Size = 30
    end
    object CDS_V_EstoquesCODSUBGRUPO: TStringField
      DisplayLabel = 'C'#243'd Sub-Gr'
      FieldName = 'CODSUBGRUPO'
      FixedChar = True
      Size = 4
    end
    object CDS_V_EstoquesNOMESUBGRUPO: TStringField
      DisplayLabel = 'Desc Sub-Gr'
      FieldName = 'NOMESUBGRUPO'
      FixedChar = True
      Size = 30
    end
    object CDS_V_EstoquesCODGRUPOSUB: TStringField
      DisplayLabel = 'C'#243'd Gr Sub'
      FieldName = 'CODGRUPOSUB'
      FixedChar = True
      Size = 7
    end
    object CDS_V_EstoquesIND_SITUACAO: TStringField
      DisplayLabel = 'Sit Prod'
      FieldName = 'IND_SITUACAO'
      Required = True
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
    object CDS_V_EstoquesCOD_COMPRADOR: TStringField
      FieldName = 'COD_COMPRADOR'
      FixedChar = True
      Size = 7
    end
    object CDS_V_EstoquesDES_COMPRADOR: TStringField
      DisplayLabel = 'Desc Comprador'
      FieldName = 'DES_COMPRADOR'
      FixedChar = True
      Size = 30
    end
    object CDS_V_EstoquesVLR_VENDAS_ACUM: TFMTBCDField
      DisplayLabel = 'Vendas Acumuladas'
      FieldName = 'VLR_VENDAS_ACUM'
      Required = True
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesORDENAR: TFMTBCDField
      FieldName = 'ORDENAR'
      Required = True
      Precision = 15
      Size = 0
    end
    object CDS_V_EstoquesALTERACAO: TStringField
      FieldName = 'ALTERACAO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object CDS_V_EstoquesVLR_VENDAS_ACUM_OK: TFMTBCDField
      DisplayLabel = 'Vendas Acumuladas OK'
      FieldName = 'VLR_VENDAS_ACUM_OK'
      Required = True
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesNUM_DIASUTEIS: TIntegerField
      DisplayLabel = 'N'#186' Dias Uteis Ano'
      FieldName = 'NUM_DIASUTEIS'
      DisplayFormat = '0,'
    end
    object CDS_V_EstoquesDIAS_UTEIS_4M: TIntegerField
      DisplayLabel = 'N'#186' Dias Uteis 4Meses'
      FieldName = 'DIAS_UTEIS_4M'
      DisplayFormat = '0,'
    end
    object CDS_V_EstoquesNUM_LINHA: TIntegerField
      DisplayLabel = 'Seq'
      FieldKind = fkCalculated
      FieldName = 'NUM_LINHA'
      Calculated = True
    end
    object CDS_V_EstoquesEST_CURVAA: TIntegerField
      FieldName = 'EST_CURVAA'
    end
    object CDS_V_EstoquesEST_CURVAB: TIntegerField
      FieldName = 'EST_CURVAB'
    end
    object CDS_V_EstoquesEST_CURVAC: TIntegerField
      FieldName = 'EST_CURVAC'
    end
    object CDS_V_EstoquesEST_CURVAD: TIntegerField
      FieldName = 'EST_CURVAD'
    end
    object CDS_V_EstoquesEST_CURVAE: TIntegerField
      FieldName = 'EST_CURVAE'
    end
    object CDS_V_EstoquesEST_CURVAA_PC: TFMTBCDField
      FieldName = 'EST_CURVAA_PC'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesEST_CURVAB_PC: TFMTBCDField
      FieldName = 'EST_CURVAB_PC'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesEST_CURVAC_PC: TFMTBCDField
      FieldName = 'EST_CURVAC_PC'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesEST_CURVAD_PC: TFMTBCDField
      FieldName = 'EST_CURVAD_PC'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesEST_CURVAE_PC: TFMTBCDField
      FieldName = 'EST_CURVAE_PC'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesEST_CURVAA_PV: TFMTBCDField
      FieldName = 'EST_CURVAA_PV'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesEST_CURVAB_PV: TFMTBCDField
      FieldName = 'EST_CURVAB_PV'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesEST_CURVAC_PV: TFMTBCDField
      FieldName = 'EST_CURVAC_PV'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesEST_CURVAD_PV: TFMTBCDField
      FieldName = 'EST_CURVAD_PV'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesEST_CURVAE_PV: TFMTBCDField
      FieldName = 'EST_CURVAE_PV'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesDM_CURVAA: TFMTBCDField
      DisplayLabel = 'Dm Cl "A"'
      FieldName = 'DM_CURVAA'
      DisplayFormat = '0.'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesDM_CURVAB: TFMTBCDField
      DisplayLabel = 'Dm Cl "B"'
      FieldName = 'DM_CURVAB'
      DisplayFormat = '0.'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesDM_CURVAC: TFMTBCDField
      DisplayLabel = 'Dm Cl "C"'
      FieldName = 'DM_CURVAC'
      DisplayFormat = '0.'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesDM_CURVAD: TFMTBCDField
      DisplayLabel = 'Dm Cl "D"'
      FieldName = 'DM_CURVAD'
      DisplayFormat = '0.'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesDM_CURVAE: TFMTBCDField
      DisplayLabel = 'Dm Cl "E"'
      FieldName = 'DM_CURVAE'
      DisplayFormat = '0.'
      Precision = 15
      Size = 2
    end
    object CDS_V_EstoquesDM_CURVAA_PC: TFMTBCDField
      FieldName = 'DM_CURVAA_PC'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 6
    end
    object CDS_V_EstoquesDM_CURVAB_PC: TFMTBCDField
      DisplayLabel = 'DM_CURVAA_PC'
      FieldName = 'DM_CURVAB_PC'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 6
    end
    object CDS_V_EstoquesDM_CURVAC_PC: TFMTBCDField
      DisplayLabel = 'DM_CURVAA_PC'
      FieldName = 'DM_CURVAC_PC'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 6
    end
    object CDS_V_EstoquesDM_CURVAD_PC: TFMTBCDField
      DisplayLabel = 'DM_CURVAA_PC'
      FieldName = 'DM_CURVAD_PC'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 6
    end
    object CDS_V_EstoquesDM_CURVAE_PC: TFMTBCDField
      DisplayLabel = 'DM_CURVAA_PC'
      FieldName = 'DM_CURVAE_PC'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 6
    end
    object CDS_V_EstoquesDM_CURVAA_PV: TFMTBCDField
      DisplayLabel = 'DM_CURVAA_PC'
      FieldName = 'DM_CURVAA_PV'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 6
    end
    object CDS_V_EstoquesDM_CURVAB_PV: TFMTBCDField
      DisplayLabel = 'DM_CURVAA_PC'
      FieldName = 'DM_CURVAB_PV'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 6
    end
    object CDS_V_EstoquesDM_CURVAC_PV: TFMTBCDField
      DisplayLabel = 'DM_CURVAA_PC'
      FieldName = 'DM_CURVAC_PV'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 6
    end
    object CDS_V_EstoquesDM_CURVAD_PV: TFMTBCDField
      DisplayLabel = 'DM_CURVAA_PC'
      FieldName = 'DM_CURVAD_PV'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 6
    end
    object CDS_V_EstoquesDM_CURVAE_PV: TFMTBCDField
      DisplayLabel = 'DM_CURVAA_PC'
      FieldName = 'DM_CURVAE_PV'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 6
    end
    object CDS_V_EstoquesEST_CURVA_B: TAggregateField
      Alignment = taRightJustify
      FieldName = 'EST_CURVA_B'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(EST_CURVAB)'
    end
    object CDS_V_EstoquesEST_CURVA_A: TAggregateField
      Alignment = taRightJustify
      FieldName = 'EST_CURVA_A'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(EST_CURVAA)'
    end
    object CDS_V_EstoquesEST_CURVA_C: TAggregateField
      Alignment = taRightJustify
      FieldName = 'EST_CURVA_C'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(EST_CURVAC)'
    end
    object CDS_V_EstoquesEST_CURVA_D: TAggregateField
      Alignment = taRightJustify
      FieldName = 'EST_CURVA_D'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(EST_CURVAD)'
    end
    object CDS_V_EstoquesEST_CURVA_E: TAggregateField
      Alignment = taRightJustify
      FieldName = 'EST_CURVA_E'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(EST_CURVAE)'
    end
    object CDS_V_EstoquesEST_CURVA_A_PC: TAggregateField
      Alignment = taRightJustify
      FieldName = 'EST_CURVA_A_PC'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(EST_CURVAA_PC)'
    end
    object CDS_V_EstoquesEST_CURVA_B_PC: TAggregateField
      Alignment = taRightJustify
      FieldName = 'EST_CURVA_B_PC'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(EST_CURVAB_PC)'
    end
    object CDS_V_EstoquesEST_CURVA_C_PC: TAggregateField
      Alignment = taRightJustify
      FieldName = 'EST_CURVA_C_PC'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(EST_CURVAC_PC)'
    end
    object CDS_V_EstoquesEST_CURVA_D_PC: TAggregateField
      Alignment = taRightJustify
      FieldName = 'EST_CURVA_D_PC'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(EST_CURVAD_PC)'
    end
    object CDS_V_EstoquesEST_CURVA_E_PC: TAggregateField
      Alignment = taRightJustify
      FieldName = 'EST_CURVA_E_PC'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(EST_CURVAE_PC)'
    end
    object CDS_V_EstoquesDM_CURVA_E_PV: TAggregateField
      Alignment = taRightJustify
      FieldName = 'DM_CURVA_E_PV'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(DM_CURVAE_PV)'
    end
    object CDS_V_EstoquesDM_CURVA_D_PV: TAggregateField
      Alignment = taRightJustify
      FieldName = 'DM_CURVA_D_PV'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(DM_CURVAD_PV)'
    end
    object CDS_V_EstoquesDM_CURVA_C_PV: TAggregateField
      Alignment = taRightJustify
      FieldName = 'DM_CURVA_C_PV'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(DM_CURVAC_PV)'
    end
    object CDS_V_EstoquesDM_CURVA_B_PV: TAggregateField
      Alignment = taRightJustify
      FieldName = 'DM_CURVA_B_PV'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(DM_CURVAB_PV)'
    end
    object CDS_V_EstoquesDM_CURVA_A_PV: TAggregateField
      Alignment = taRightJustify
      FieldName = 'DM_CURVA_A_PV'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(DM_CURVAA_PV)'
    end
    object CDS_V_EstoquesDM_CURVA_E_PC: TAggregateField
      Alignment = taRightJustify
      FieldName = 'DM_CURVA_E_PC'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(DM_CURVAE_PC)'
    end
    object CDS_V_EstoquesDM_CURVA_D_PC: TAggregateField
      Alignment = taRightJustify
      FieldName = 'DM_CURVA_D_PC'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(DM_CURVAD_PC)'
    end
    object CDS_V_EstoquesDM_CURVA_C_PC: TAggregateField
      Alignment = taRightJustify
      FieldName = 'DM_CURVA_C_PC'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(DM_CURVAC_PC)'
    end
    object CDS_V_EstoquesDM_CURVA_B_PC: TAggregateField
      Alignment = taRightJustify
      FieldName = 'DM_CURVA_B_PC'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(DM_CURVAB_PC)'
    end
    object CDS_V_EstoquesDM_CURVA_E: TAggregateField
      Alignment = taRightJustify
      FieldName = 'DM_CURVA_E'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(DM_CURVAE)'
    end
    object CDS_V_EstoquesDM_CURVA_D: TAggregateField
      Alignment = taRightJustify
      FieldName = 'DM_CURVA_D'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(DM_CURVAD)'
    end
    object CDS_V_EstoquesDM_CURVA_C: TAggregateField
      Alignment = taRightJustify
      FieldName = 'DM_CURVA_C'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(DM_CURVAC)'
    end
    object CDS_V_EstoquesDM_CURVA_A: TAggregateField
      Alignment = taRightJustify
      FieldName = 'DM_CURVA_A'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(DM_CURVAA)'
    end
    object CDS_V_EstoquesDM_CURVA_B: TAggregateField
      Alignment = taRightJustify
      FieldName = 'DM_CURVA_B'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(DM_CURVAB)'
    end
    object CDS_V_EstoquesDM_CURVA_A_PC: TAggregateField
      Alignment = taRightJustify
      FieldName = 'DM_CURVA_A_PC'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(DM_CURVAA_PC)'
    end
    object CDS_V_EstoquesEST_CURVA_E_PV: TAggregateField
      Alignment = taRightJustify
      FieldName = 'EST_CURVA_E_PV'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(EST_CURVAE_PV)'
    end
    object CDS_V_EstoquesEST_CURVA_D_PV: TAggregateField
      Alignment = taRightJustify
      FieldName = 'EST_CURVA_D_PV'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(EST_CURVAD_PV)'
    end
    object CDS_V_EstoquesEST_CURVA_C_PV: TAggregateField
      Alignment = taRightJustify
      FieldName = 'EST_CURVA_C_PV'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(EST_CURVAC_PV)'
    end
    object CDS_V_EstoquesEST_CURVA_B_PV: TAggregateField
      Alignment = taRightJustify
      FieldName = 'EST_CURVA_B_PV'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(EST_CURVAB_PV)'
    end
    object CDS_V_EstoquesEST_CURVA_A_PV: TAggregateField
      Alignment = taRightJustify
      FieldName = 'EST_CURVA_A_PV'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(EST_CURVAA_PV)'
    end
  end
  object DS_V_Estoques: TDataSource
    DataSet = CDS_V_Estoques
    Left = 464
    Top = 120
  end
  object CDS_V_ParamLojaNeces: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 488
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
    Left = 136
    Top = 504
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
    Left = 432
    Top = 456
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
    Left = 432
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
    Left = 894
    Top = 499
  end
  object CDS_V_EstoqueLojas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 816
    Top = 488
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
    Left = 409
    Top = 172
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
    Left = 461
    Top = 192
  end
  object DS_V_NFeProdutos: TDataSource
    DataSet = CDS_V_NFeProdutos
    Left = 456
    Top = 327
  end
  object CDS_V_NFeProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CDS_V_NFeProdutosAfterScroll
    Left = 408
    Top = 319
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
    Left = 418
    Top = 394
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
    Left = 455
    Top = 378
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
    Left = 493
    Top = 395
  end
  object SDS_SelectLoja: TSQLDataSet
    CommandText = 
      'SELECT '#39'Bel_'#39' || e.cod_filial cod_loja, e.razao_social'#13#10'FROM emp' +
      '_conexoes e'#13#10'WHERE e.cod_filial IN ('#39'01'#39', '#39'02'#39')'#13#10'ORDER BY 1  '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 384
    Top = 384
  end
end
