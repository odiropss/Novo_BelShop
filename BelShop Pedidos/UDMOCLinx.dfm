object DMOCLinx: TDMOCLinx
  OldCreateOrder = False
  Left = 245
  Top = 110
  Height = 610
  Width = 1097
  object DSP_AComprarOCs: TDataSetProvider
    DataSet = SQLQ_AComprarOCs
    Options = [poRetainServerOrder]
    Left = 119
    Top = 41
  end
  object CDS_AComprarOCs: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'GERAR'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TIPO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'COD_EMP_FIL'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'DES_EMP_FIL'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'COD_LINX'
        DataType = ftInteger
      end
      item
        Name = 'IND_OC_GERADA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'COD_FORNECEDOR'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'FORNECEDOR'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TOTAL_BRUTO'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_DESCONTOS'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_IPI'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_DESPESAS'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_ST'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_FRETE'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_REPASSE'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_OCS'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_OC'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_VENDA'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'NUM_DOCUMENTO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NUM_OC_GERADA'
        DataType = ftInteger
      end
      item
        Name = 'DTA_OC_GERADA'
        DataType = ftDate
      end
      item
        Name = 'COD_COMPROVANTE_ICMS'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'TOTAL_ITENS'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'TOTAL_QTD'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_QTD_TRANSF'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_ITENS_ACOMPRAR'
        DataType = ftFMTBcd
        Precision = 15
      end
      item
        Name = 'SITUACAO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 9
      end>
    IndexDefs = <>
    ObjectView = False
    Params = <>
    ProviderName = 'DSP_AComprarOCs'
    StoreDefs = True
    Left = 156
    Top = 29
    object CDS_AComprarOCsGERAR: TStringField
      FieldName = 'GERAR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDS_AComprarOCsTIPO: TStringField
      DisplayLabel = 'Tp'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object CDS_AComprarOCsCOD_EMP_FIL: TStringField
      Alignment = taCenter
      DisplayLabel = 'Sidicom'
      FieldName = 'COD_EMP_FIL'
      Size = 6
    end
    object CDS_AComprarOCsDES_EMP_FIL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'DES_EMP_FIL'
      Size = 60
    end
    object CDS_AComprarOCsCOD_LINX: TIntegerField
      DisplayLabel = 'Linx'
      FieldName = 'COD_LINX'
    end
    object CDS_AComprarOCsIND_OC_GERADA: TStringField
      FieldName = 'IND_OC_GERADA'
      Size = 1
    end
    object CDS_AComprarOCsCOD_FORNECEDOR: TStringField
      FieldName = 'COD_FORNECEDOR'
      Size = 6
    end
    object CDS_AComprarOCsFORNECEDOR: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORNECEDOR'
      Size = 40
    end
    object CDS_AComprarOCsTOTAL_BRUTO: TFMTBCDField
      DisplayLabel = 'Total Bruto'
      FieldName = 'TOTAL_BRUTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_DESCONTOS: TFMTBCDField
      DisplayLabel = 'Total Descontos'
      FieldName = 'TOTAL_DESCONTOS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_IPI: TFMTBCDField
      DisplayLabel = 'Total IPI'
      FieldName = 'TOTAL_IPI'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_DESPESAS: TFMTBCDField
      DisplayLabel = 'Total Despesas'
      FieldName = 'TOTAL_DESPESAS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_ST: TFMTBCDField
      DisplayLabel = 'Total ST'
      FieldName = 'TOTAL_ST'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_FRETE: TFMTBCDField
      DisplayLabel = 'Total Frete'
      FieldName = 'TOTAL_FRETE'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_ICMS: TFMTBCDField
      DisplayLabel = 'Total ICMS'
      FieldName = 'TOTAL_ICMS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_REPASSE: TFMTBCDField
      DisplayLabel = 'Total Repasse'
      FieldName = 'TOTAL_REPASSE'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_OCS: TFMTBCDField
      FieldName = 'TOTAL_OCS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_OC: TFMTBCDField
      DisplayLabel = 'Total OC'
      FieldName = 'TOTAL_OC'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_VENDA: TFMTBCDField
      DisplayLabel = 'Total Vendas'
      FieldName = 'TOTAL_VENDA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsNUM_DOCUMENTO: TIntegerField
      FieldName = 'NUM_DOCUMENTO'
      Required = True
    end
    object CDS_AComprarOCsNUM_OC_GERADA: TIntegerField
      DisplayLabel = 'OC Gerada'
      FieldName = 'NUM_OC_GERADA'
      DisplayFormat = '0,'
    end
    object CDS_AComprarOCsDTA_OC_GERADA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'DTA_OC_GERADA'
    end
    object CDS_AComprarOCsCOD_COMPROVANTE_ICMS: TStringField
      Alignment = taCenter
      DisplayLabel = 'Comprov ICMS'
      FieldName = 'COD_COMPROVANTE_ICMS'
      Size = 3
    end
    object CDS_AComprarOCsTOTAL_ITENS: TIntegerField
      DisplayLabel = 'Total Itens'
      FieldName = 'TOTAL_ITENS'
      Required = True
      DisplayFormat = '0,'
    end
    object CDS_AComprarOCsTOTAL_QTD: TFMTBCDField
      DisplayLabel = 'Total Qtd'
      FieldName = 'TOTAL_QTD'
      DisplayFormat = '0,'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_QTD_TRANSF: TFMTBCDField
      FieldName = 'TOTAL_QTD_TRANSF'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_ITENS_ACOMPRAR: TFMTBCDField
      DisplayLabel = 'Total Itens a Comprar'
      FieldName = 'TOTAL_ITENS_ACOMPRAR'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 0
    end
    object CDS_AComprarOCsSITUACAO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Situa'#231#227'o do Pedido'
      FieldName = 'SITUACAO'
      Required = True
      FixedChar = True
      Size = 9
    end
    object CDS_AComprarOCsTOTALGERAL: TAggregateField
      Alignment = taRightJustify
      FieldName = 'TOTALGERAL'
      Active = True
      DisplayFormat = '0.,00'
      Expression = 'Sum(TOTAL_OCS)'
    end
    object CDS_AComprarOCsTOTALITENS: TAggregateField
      Alignment = taRightJustify
      FieldName = 'TOTALITENS'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(Total_Itens)'
    end
  end
  object DS_AComprarOCs: TDataSource
    DataSet = CDS_AComprarOCs
    Left = 194
    Top = 42
  end
  object DS_AComprar: TDataSource
    DataSet = IBQ_AComprar
    Left = 863
    Top = 192
  end
  object CDS_Sugestao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Sugestao'
    Left = 854
    Top = 380
    object CDS_SugestaoNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
      Required = True
    end
    object CDS_SugestaoNUM_DOCUMENTO: TIntegerField
      FieldName = 'NUM_DOCUMENTO'
      Required = True
    end
    object CDS_SugestaoDTA_DOCUMENTO: TSQLTimeStampField
      FieldName = 'DTA_DOCUMENTO'
    end
    object CDS_SugestaoIND_OC_GERADA: TStringField
      FieldName = 'IND_OC_GERADA'
      Size = 1
    end
    object CDS_SugestaoDTA_OC_GERADA: TSQLTimeStampField
      FieldName = 'DTA_OC_GERADA'
    end
    object CDS_SugestaoNUM_OC_GERADA: TIntegerField
      FieldName = 'NUM_OC_GERADA'
    end
    object CDS_SugestaoOBS_OC: TStringField
      FieldName = 'OBS_OC'
      Size = 2000
    end
    object CDS_SugestaoCOD_EMPRESA: TStringField
      FieldName = 'COD_EMPRESA'
      Size = 6
    end
    object CDS_SugestaoDES_EMPRESA: TStringField
      FieldName = 'DES_EMPRESA'
      Size = 60
    end
    object CDS_SugestaoCOD_ITEM: TStringField
      FieldName = 'COD_ITEM'
      Size = 6
    end
    object CDS_SugestaoDES_ITEM: TStringField
      FieldName = 'DES_ITEM'
      Size = 80
    end
    object CDS_SugestaoQTD_SUGERIDA: TFMTBCDField
      FieldName = 'QTD_SUGERIDA'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_ACOMPRAR: TFMTBCDField
      FieldName = 'QTD_ACOMPRAR'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_SALDO: TFMTBCDField
      FieldName = 'QTD_SALDO'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_TRANSITO: TFMTBCDField
      FieldName = 'QTD_TRANSITO'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_DISPONIVEL: TFMTBCDField
      FieldName = 'QTD_DISPONIVEL'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_MEDIA_MES: TFMTBCDField
      FieldName = 'QTD_MEDIA_MES'
      Precision = 15
      Size = 4
    end
    object CDS_SugestaoQTD_MEDIA_DIA: TFMTBCDField
      FieldName = 'QTD_MEDIA_DIA'
      Precision = 15
      Size = 4
    end
    object CDS_SugestaoQTD_DEM_MES1: TFMTBCDField
      FieldName = 'QTD_DEM_MES1'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_DEM_MES2: TFMTBCDField
      FieldName = 'QTD_DEM_MES2'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_DEM_MES3: TFMTBCDField
      FieldName = 'QTD_DEM_MES3'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_DEM_MES4: TFMTBCDField
      FieldName = 'QTD_DEM_MES4'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_DEM_MES5: TFMTBCDField
      FieldName = 'QTD_DEM_MES5'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_DEM_MES6: TFMTBCDField
      FieldName = 'QTD_DEM_MES6'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_DEM_MES7: TFMTBCDField
      FieldName = 'QTD_DEM_MES7'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_DEM_MES8: TFMTBCDField
      FieldName = 'QTD_DEM_MES8'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoUNI_COMPRA: TIntegerField
      FieldName = 'UNI_COMPRA'
    end
    object CDS_SugestaoUNI_VENDA: TIntegerField
      FieldName = 'UNI_VENDA'
    end
    object CDS_SugestaoCOD_BARRAS: TStringField
      FieldName = 'COD_BARRAS'
      Size = 19
    end
    object CDS_SugestaoCOD_GRUPO: TStringField
      FieldName = 'COD_GRUPO'
      Size = 3
    end
    object CDS_SugestaoDES_GRUPO: TStringField
      FieldName = 'DES_GRUPO'
      Size = 30
    end
    object CDS_SugestaoCOD_SUBGRUPO: TStringField
      FieldName = 'COD_SUBGRUPO'
      Size = 7
    end
    object CDS_SugestaoDES_SUBGRUPO: TStringField
      FieldName = 'DES_SUBGRUPO'
      Size = 30
    end
    object CDS_SugestaoDES_GENERICO: TStringField
      FieldName = 'DES_GENERICO'
      Size = 80
    end
    object CDS_SugestaoCOD_APLICACAO: TStringField
      FieldName = 'COD_APLICACAO'
      Size = 4
    end
    object CDS_SugestaoDES_APLICACAO: TStringField
      FieldName = 'DES_APLICACAO'
      Size = 30
    end
    object CDS_SugestaoCOD_REFERENCIA: TStringField
      FieldName = 'COD_REFERENCIA'
      Size = 30
    end
    object CDS_SugestaoCLA_CURVA_ABC: TStringField
      FieldName = 'CLA_CURVA_ABC'
      Size = 1
    end
    object CDS_SugestaoCOD_FAMILIA_PRECO: TStringField
      FieldName = 'COD_FAMILIA_PRECO'
      Size = 4
    end
    object CDS_SugestaoDES_FAMILIA_PRECO: TStringField
      FieldName = 'DES_FAMILIA_PRECO'
      Size = 40
    end
    object CDS_SugestaoDTA_ULT_COMPRA: TDateField
      FieldName = 'DTA_ULT_COMPRA'
    end
    object CDS_SugestaoCOD_FOR_ULT_COMPRA: TStringField
      FieldName = 'COD_FOR_ULT_COMPRA'
      Size = 6
    end
    object CDS_SugestaoDES_FOR_ULT_COMPRA: TStringField
      FieldName = 'DES_FOR_ULT_COMPRA'
      Size = 40
    end
    object CDS_SugestaoQTD_ULT_COMPRA: TFMTBCDField
      FieldName = 'QTD_ULT_COMPRA'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_UNI_ULT_COMPRA: TFMTBCDField
      FieldName = 'VLR_UNI_ULT_COMPRA'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_TOT_ULT_COMPRA: TFMTBCDField
      FieldName = 'VLR_TOT_ULT_COMPRA'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_UNI_COMPRA: TFMTBCDField
      FieldName = 'VLR_UNI_COMPRA'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoPER_DESCONTO: TFMTBCDField
      FieldName = 'PER_DESCONTO'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoDTA_ULT_VENDA: TDateField
      FieldName = 'DTA_ULT_VENDA'
    end
    object CDS_SugestaoCOD_CLI_ULT_VENDA: TStringField
      FieldName = 'COD_CLI_ULT_VENDA'
      Size = 6
    end
    object CDS_SugestaoDES_CLI_ULT_VENDA: TStringField
      FieldName = 'DES_CLI_ULT_VENDA'
      Size = 40
    end
    object CDS_SugestaoQTD_ULT_VENDA: TFMTBCDField
      FieldName = 'QTD_ULT_VENDA'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_UNI_ULT_VENDA: TFMTBCDField
      FieldName = 'VLR_UNI_ULT_VENDA'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_TOT_ULT_VENDA: TFMTBCDField
      FieldName = 'VLR_TOT_ULT_VENDA'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_UNI_VENDA: TFMTBCDField
      FieldName = 'VLR_UNI_VENDA'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoCOD_LISTA_VENDA: TStringField
      FieldName = 'COD_LISTA_VENDA'
      Size = 4
    end
    object CDS_SugestaoDES_LISTA_VENDA: TStringField
      FieldName = 'DES_LISTA_VENDA'
      Size = 30
    end
    object CDS_SugestaoCOD_LISTA_COMPRA: TStringField
      FieldName = 'COD_LISTA_COMPRA'
      Size = 4
    end
    object CDS_SugestaoDES_LISTA_COMPRA: TStringField
      FieldName = 'DES_LISTA_COMPRA'
      Size = 30
    end
    object CDS_SugestaoVLR_CUSTO_MEDIO: TFMTBCDField
      FieldName = 'VLR_CUSTO_MEDIO'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_TOT_VENDA: TFMTBCDField
      FieldName = 'VLR_TOT_VENDA'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_TOT_COMPRA: TFMTBCDField
      FieldName = 'VLR_TOT_COMPRA'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_BRUTO: TFMTBCDField
      FieldName = 'VLR_BRUTO'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_DESCONTOS: TFMTBCDField
      FieldName = 'VLR_DESCONTOS'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_DESPESAS: TFMTBCDField
      FieldName = 'VLR_DESPESAS'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_FRETE: TFMTBCDField
      FieldName = 'VLR_FRETE'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoIND_SOMA_IPI_BASE_ICMS: TStringField
      FieldName = 'IND_SOMA_IPI_BASE_ICMS'
      Size = 1
    end
    object CDS_SugestaoIND_SOMA_FRETE_BASE_ICMS: TStringField
      FieldName = 'IND_SOMA_FRETE_BASE_ICMS'
      Size = 1
    end
    object CDS_SugestaoIND_SOMA_DESPESA_BASE_ICMS: TStringField
      FieldName = 'IND_SOMA_DESPESA_BASE_ICMS'
      Size = 1
    end
    object CDS_SugestaoIND_SOMA_IPI_BASE_ST: TStringField
      FieldName = 'IND_SOMA_IPI_BASE_ST'
      Size = 1
    end
    object CDS_SugestaoIND_SOMA_FRETE_BASE_ST: TStringField
      FieldName = 'IND_SOMA_FRETE_BASE_ST'
      Size = 1
    end
    object CDS_SugestaoIND_SOMA_DESPESA_BASE_ST: TStringField
      FieldName = 'IND_SOMA_DESPESA_BASE_ST'
      Size = 1
    end
    object CDS_SugestaoCOD_SIT_TRIBUTARIA: TStringField
      FieldName = 'COD_SIT_TRIBUTARIA'
      Size = 2
    end
    object CDS_SugestaoCOD_IPI: TStringField
      FieldName = 'COD_IPI'
      Size = 2
    end
    object CDS_SugestaoIND_IPI: TStringField
      FieldName = 'IND_IPI'
      Size = 1
    end
    object CDS_SugestaoPER_IPI: TFMTBCDField
      FieldName = 'PER_IPI'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_IPI: TFMTBCDField
      FieldName = 'VLR_IPI'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoCOD_ICMS: TStringField
      FieldName = 'COD_ICMS'
      Size = 2
    end
    object CDS_SugestaoPER_REDUCAO_ICMS: TFMTBCDField
      FieldName = 'PER_REDUCAO_ICMS'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_REDUCAO_ICMS: TFMTBCDField
      FieldName = 'VLR_REDUCAO_ICMS'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_BASE_ICMS: TFMTBCDField
      FieldName = 'VLR_BASE_ICMS'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoPER_ICMS: TFMTBCDField
      FieldName = 'PER_ICMS'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_ICMS: TFMTBCDField
      FieldName = 'VLR_ICMS'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoCOD_GRUPO_ST: TIntegerField
      FieldName = 'COD_GRUPO_ST'
    end
    object CDS_SugestaoDES_GRUPO_ST: TStringField
      FieldName = 'DES_GRUPO_ST'
      Size = 30
    end
    object CDS_SugestaoPER_MARGEM_ST: TFMTBCDField
      FieldName = 'PER_MARGEM_ST'
      Precision = 15
      Size = 4
    end
    object CDS_SugestaoIND_ST: TStringField
      FieldName = 'IND_ST'
      Size = 1
    end
    object CDS_SugestaoVLR_BASE_ST: TFMTBCDField
      FieldName = 'VLR_BASE_ST'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoPER_ST: TFMTBCDField
      FieldName = 'PER_ST'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_ST: TFMTBCDField
      FieldName = 'VLR_ST'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoPER_REPASSE: TFMTBCDField
      FieldName = 'PER_REPASSE'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_REPASSE: TFMTBCDField
      FieldName = 'VLR_REPASSE'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoCOD_COMPROVANTE_ICMS: TStringField
      FieldName = 'COD_COMPROVANTE_ICMS'
      Size = 3
    end
    object CDS_SugestaoCOD_REFERENCIA_FORN: TStringField
      FieldName = 'COD_REFERENCIA_FORN'
      Size = 30
    end
    object CDS_SugestaoCOD_FORNECEDOR: TStringField
      FieldName = 'COD_FORNECEDOR'
      Size = 6
    end
    object CDS_SugestaoDES_FORNECEDOR: TStringField
      FieldName = 'DES_FORNECEDOR'
      Size = 40
    end
    object CDS_SugestaoTIP_PESSOA: TStringField
      FieldName = 'TIP_PESSOA'
      Size = 1
    end
    object CDS_SugestaoDES_EMAIL: TStringField
      FieldName = 'DES_EMAIL'
      Size = 80
    end
    object CDS_SugestaoQTD_NR_DIAS: TIntegerField
      FieldName = 'QTD_NR_DIAS'
    end
    object CDS_SugestaoQTD_NR_MESES: TIntegerField
      FieldName = 'QTD_NR_MESES'
    end
    object CDS_SugestaoQTD_TOT_MESES: TIntegerField
      FieldName = 'QTD_TOT_MESES'
    end
    object CDS_SugestaoCOD_COMPRADOR: TIntegerField
      FieldName = 'COD_COMPRADOR'
    end
    object CDS_SugestaoBLOB_TEXTO: TMemoField
      FieldName = 'BLOB_TEXTO'
      BlobType = ftMemo
      Size = 1
    end
    object CDS_SugestaoIND_TRANSF: TStringField
      FieldName = 'IND_TRANSF'
      Size = 1
    end
    object CDS_SugestaoDTA_LIM_TRANSF: TDateField
      FieldName = 'DTA_LIM_TRANSF'
    end
    object CDS_SugestaoQTD_TRANSF: TFMTBCDField
      FieldName = 'QTD_TRANSF'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoIND_USAR: TStringField
      FieldName = 'IND_USAR'
      Size = 3
    end
    object CDS_SugestaoIND_QTD_ACIMA: TFMTBCDField
      FieldName = 'IND_QTD_ACIMA'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_SUGERIDA_ANO: TFMTBCDField
      FieldName = 'QTD_SUGERIDA_ANO'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_TRANSF_PERIODO: TFMTBCDField
      FieldName = 'QTD_TRANSF_PERIODO'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_TRANSF_ANO: TFMTBCDField
      FieldName = 'QTD_TRANSF_ANO'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoEST_MINIMO: TFMTBCDField
      FieldName = 'EST_MINIMO'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoDIAS_ESTOCAGEM: TIntegerField
      FieldName = 'DIAS_ESTOCAGEM'
    end
    object CDS_SugestaoQTD_DEMANDA_DIA: TFMTBCDField
      FieldName = 'QTD_DEMANDA_DIA'
      Precision = 15
      Size = 4
    end
    object CDS_SugestaoQTD_DEMANDA_ANO: TFMTBCDField
      FieldName = 'QTD_DEMANDA_ANO'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_DIAS_ANO: TIntegerField
      FieldName = 'QTD_DIAS_ANO'
    end
    object CDS_SugestaoDATAINCLUSAO: TDateField
      FieldName = 'DATAINCLUSAO'
    end
    object CDS_SugestaoESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object CDS_SugestaoDATAALTERACAO: TDateField
      FieldName = 'DATAALTERACAO'
    end
    object CDS_SugestaoIND_TRANSF_CD: TStringField
      FieldName = 'IND_TRANSF_CD'
      FixedChar = True
      Size = 1
    end
    object CDS_SugestaoDOC_TRANSF_CD: TIntegerField
      FieldName = 'DOC_TRANSF_CD'
    end
  end
  object DSP_Sugestao: TDataSetProvider
    DataSet = SQLQ_Sugestao
    Options = [poRetainServerOrder]
    Left = 815
    Top = 396
  end
  object IBQ_AComprar: TIBQuery
    Database = DMBelShopPedidos.IBDB_BelShop
    Transaction = DMBelShopPedidos.IBT_BelShop
    ForcedRefresh = True
    AfterEdit = IBQ_AComprarAfterEdit
    AfterPost = IBQ_AComprarAfterPost
    BeforeEdit = IBQ_AComprarBeforeEdit
    BeforePost = IBQ_AComprarBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select *'
      'From oc_comprar oc'
      'Where oc.num_documento= :Num_Documento'
      'AND oc.cod_empresa= :Cod_Loja'
      'ORDER BY oc.cla_curva_abc, oc.des_item'
      '')
    UpdateObject = IBU_AComprar
    Left = 775
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUM_DOCUMENTO'
        ParamType = ptUnknown
        Size = 4
        Value = '155'
      end
      item
        DataType = ftString
        Name = 'Cod_loja'
        ParamType = ptUnknown
        Value = '28'
      end>
    object IBQ_AComprarNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
      Origin = 'OC_COMPRAR.NUM_SEQ'
      Required = True
    end
    object IBQ_AComprarNUM_DOCUMENTO: TIntegerField
      FieldName = 'NUM_DOCUMENTO'
      Origin = 'OC_COMPRAR.NUM_DOCUMENTO'
      Required = True
    end
    object IBQ_AComprarDTA_DOCUMENTO: TDateTimeField
      Alignment = taCenter
      FieldName = 'DTA_DOCUMENTO'
      Origin = 'OC_COMPRAR.DTA_DOCUMENTO'
    end
    object IBQ_AComprarIND_OC_GERADA: TIBStringField
      Alignment = taCenter
      FieldName = 'IND_OC_GERADA'
      Origin = 'OC_COMPRAR.IND_OC_GERADA'
      Size = 1
    end
    object IBQ_AComprarDTA_OC_GERADA: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data OC'
      FieldName = 'DTA_OC_GERADA'
      Origin = 'OC_COMPRAR.DTA_OC_GERADA'
    end
    object IBQ_AComprarNUM_OC_GERADA: TIntegerField
      DisplayLabel = 'N'#186' OC'
      FieldName = 'NUM_OC_GERADA'
      Origin = 'OC_COMPRAR.NUM_OC_GERADA'
    end
    object IBQ_AComprarOBS_OC: TIBStringField
      DisplayLabel = 'Obs OC'
      FieldName = 'OBS_OC'
      Origin = 'OC_COMPRAR.OBS_OC'
      Size = 2000
    end
    object IBQ_AComprarCOD_EMPRESA: TIBStringField
      Alignment = taRightJustify
      FieldName = 'COD_EMPRESA'
      Origin = 'OC_COMPRAR.COD_EMPRESA'
      Size = 6
    end
    object IBQ_AComprarDES_EMPRESA: TIBStringField
      FieldName = 'DES_EMPRESA'
      Origin = 'OC_COMPRAR.DES_EMPRESA'
      Size = 60
    end
    object IBQ_AComprarCOD_ITEM: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_ITEM'
      Origin = 'OC_COMPRAR.COD_ITEM'
      Size = 6
    end
    object IBQ_AComprarDES_ITEM: TIBStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'DES_ITEM'
      Origin = 'OC_COMPRAR.DES_ITEM'
      Size = 80
    end
    object IBQ_AComprarQTD_SUGERIDA: TIBBCDField
      DisplayLabel = 'Sug. MESES'
      FieldName = 'QTD_SUGERIDA'
      Origin = 'OC_COMPRAR.QTD_SUGERIDA'
      DisplayFormat = '0.'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_ACOMPRAR: TIBBCDField
      DisplayLabel = 'A Comprar'
      FieldName = 'QTD_ACOMPRAR'
      Origin = 'OC_COMPRAR.QTD_ACOMPRAR'
      DisplayFormat = '0.'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_SALDO: TIBBCDField
      DisplayLabel = 'Saldo'
      FieldName = 'QTD_SALDO'
      Origin = 'OC_COMPRAR.QTD_SALDO'
      DisplayFormat = '0.'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_TRANSITO: TIBBCDField
      DisplayLabel = 'Tr'#226'nsito'
      FieldName = 'QTD_TRANSITO'
      Origin = 'OC_COMPRAR.QTD_TRANSITO'
      DisplayFormat = '0.'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_DISPONIVEL: TIBBCDField
      DisplayLabel = 'Previsto'
      FieldName = 'QTD_DISPONIVEL'
      Origin = 'OC_COMPRAR.QTD_DISPONIVEL'
      DisplayFormat = '0.'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_MEDIA_MES: TIBBCDField
      DisplayLabel = 'M'#233'dia M'#234's'
      FieldName = 'QTD_MEDIA_MES'
      Origin = 'OC_COMPRAR.QTD_MEDIA_MES'
      DisplayFormat = '0.,0000'
      Precision = 18
      Size = 4
    end
    object IBQ_AComprarQTD_MEDIA_DIA: TIBBCDField
      DisplayLabel = 'M'#233'dia Dia'
      FieldName = 'QTD_MEDIA_DIA'
      Origin = 'OC_COMPRAR.QTD_MEDIA_DIA'
      DisplayFormat = '0.,0000'
      Precision = 18
      Size = 4
    end
    object IBQ_AComprarQTD_DEM_MES1: TIBBCDField
      FieldName = 'QTD_DEM_MES1'
      Origin = 'OC_COMPRAR.QTD_DEM_MES1'
      DisplayFormat = '0.'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_DEM_MES2: TIBBCDField
      FieldName = 'QTD_DEM_MES2'
      Origin = 'OC_COMPRAR.QTD_DEM_MES2'
      DisplayFormat = '0.'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_DEM_MES3: TIBBCDField
      FieldName = 'QTD_DEM_MES3'
      Origin = 'OC_COMPRAR.QTD_DEM_MES3'
      DisplayFormat = '0.'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_DEM_MES4: TIBBCDField
      FieldName = 'QTD_DEM_MES4'
      Origin = 'OC_COMPRAR.QTD_DEM_MES4'
      DisplayFormat = '0.'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_DEM_MES5: TIBBCDField
      FieldName = 'QTD_DEM_MES5'
      Origin = 'OC_COMPRAR.QTD_DEM_MES5'
      DisplayFormat = '0.'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_DEM_MES6: TIBBCDField
      FieldName = 'QTD_DEM_MES6'
      Origin = 'OC_COMPRAR.QTD_DEM_MES6'
      DisplayFormat = '0.'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_DEM_MES7: TIBBCDField
      FieldName = 'QTD_DEM_MES7'
      Origin = 'OC_COMPRAR.QTD_DEM_MES7'
      DisplayFormat = '0.'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_DEM_MES8: TIBBCDField
      FieldName = 'QTD_DEM_MES8'
      Origin = 'OC_COMPRAR.QTD_DEM_MES8'
      DisplayFormat = '0.'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarUNI_COMPRA: TIntegerField
      DisplayLabel = 'CxE'
      FieldName = 'UNI_COMPRA'
      Origin = 'OC_COMPRAR.UNI_COMPRA'
    end
    object IBQ_AComprarUNI_VENDA: TIntegerField
      DisplayLabel = 'Uni Venda'
      FieldName = 'UNI_VENDA'
      Origin = 'OC_COMPRAR.UNI_VENDA'
    end
    object IBQ_AComprarCOD_BARRAS: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'EAN'
      FieldName = 'COD_BARRAS'
      Origin = 'OC_COMPRAR.COD_BARRAS'
      Size = 19
    end
    object IBQ_AComprarCOD_GRUPO: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Grupo'
      FieldName = 'COD_GRUPO'
      Origin = 'OC_COMPRAR.COD_GRUPO'
      Size = 3
    end
    object IBQ_AComprarDES_GRUPO: TIBStringField
      DisplayLabel = 'Grupo'
      FieldName = 'DES_GRUPO'
      Origin = 'OC_COMPRAR.DES_GRUPO'
      Size = 30
    end
    object IBQ_AComprarCOD_SUBGRUPO: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod SubGrupo'
      FieldName = 'COD_SUBGRUPO'
      Origin = 'OC_COMPRAR.COD_SUBGRUPO'
      Size = 7
    end
    object IBQ_AComprarDES_SUBGRUPO: TIBStringField
      DisplayLabel = 'SubGrupo'
      FieldName = 'DES_SUBGRUPO'
      Origin = 'OC_COMPRAR.DES_SUBGRUPO'
      Size = 30
    end
    object IBQ_AComprarDES_GENERICO: TIBStringField
      DisplayLabel = 'Gen'#233'rico'
      FieldName = 'DES_GENERICO'
      Origin = 'OC_COMPRAR.DES_GENERICO'
      Size = 80
    end
    object IBQ_AComprarCOD_APLICACAO: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Aplic'
      FieldName = 'COD_APLICACAO'
      Origin = 'OC_COMPRAR.COD_APLICACAO'
      Size = 4
    end
    object IBQ_AComprarDES_APLICACAO: TIBStringField
      DisplayLabel = 'Aplica'#231#227'o'
      FieldName = 'DES_APLICACAO'
      Origin = 'OC_COMPRAR.DES_APLICACAO'
      Size = 30
    end
    object IBQ_AComprarCOD_REFERENCIA: TIBStringField
      FieldName = 'COD_REFERENCIA'
      Origin = 'OC_COMPRAR.COD_REFERENCIA'
      Size = 30
    end
    object IBQ_AComprarCLA_CURVA_ABC: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'ABC'
      FieldName = 'CLA_CURVA_ABC'
      Origin = 'OC_COMPRAR.CLA_CURVA_ABC'
      Size = 1
    end
    object IBQ_AComprarCOD_FAMILIA_PRECO: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Fam Pre'#231'o'
      FieldName = 'COD_FAMILIA_PRECO'
      Origin = 'OC_COMPRAR.COD_FAMILIA_PRECO'
      Size = 4
    end
    object IBQ_AComprarDES_FAMILIA_PRECO: TIBStringField
      DisplayLabel = 'Fam'#237'lia Pre'#231'o'
      FieldName = 'DES_FAMILIA_PRECO'
      Origin = 'OC_COMPRAR.DES_FAMILIA_PRECO'
      Size = 40
    end
    object IBQ_AComprarDTA_ULT_COMPRA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Ult Compra'
      FieldName = 'DTA_ULT_COMPRA'
      Origin = 'OC_COMPRAR.DTA_ULT_COMPRA'
    end
    object IBQ_AComprarCOD_FOR_ULT_COMPRA: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Forn Ult Compra'
      FieldName = 'COD_FOR_ULT_COMPRA'
      Origin = 'OC_COMPRAR.COD_FOR_ULT_COMPRA'
      Size = 6
    end
    object IBQ_AComprarDES_FOR_ULT_COMPRA: TIBStringField
      DisplayLabel = 'Fornecedor Ult Compra'
      FieldName = 'DES_FOR_ULT_COMPRA'
      Origin = 'OC_COMPRAR.DES_FOR_ULT_COMPRA'
      Size = 40
    end
    object IBQ_AComprarQTD_ULT_COMPRA: TIBBCDField
      DisplayLabel = 'Qtd Ult Comp'
      FieldName = 'QTD_ULT_COMPRA'
      Origin = 'OC_COMPRAR.QTD_ULT_COMPRA'
      DisplayFormat = '0.'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_UNI_ULT_COMPRA: TIBBCDField
      DisplayLabel = 'Vr Un Ult Comp'
      FieldName = 'VLR_UNI_ULT_COMPRA'
      Origin = 'OC_COMPRAR.VLR_UNI_ULT_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_TOT_ULT_COMPRA: TIBBCDField
      DisplayLabel = 'Vr Tot Ult Comp'
      FieldName = 'VLR_TOT_ULT_COMPRA'
      Origin = 'OC_COMPRAR.VLR_TOT_ULT_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_UNI_COMPRA: TIBBCDField
      DisplayLabel = 'Vr Un Compra'
      FieldName = 'VLR_UNI_COMPRA'
      Origin = 'OC_COMPRAR.VLR_UNI_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarPER_DESCONTO: TIBBCDField
      DisplayLabel = '% Desc'
      FieldName = 'PER_DESCONTO'
      Origin = 'OC_COMPRAR.PER_DESCONTO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarDTA_ULT_VENDA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dta Ult Venda'
      FieldName = 'DTA_ULT_VENDA'
      Origin = 'OC_COMPRAR.DTA_ULT_VENDA'
    end
    object IBQ_AComprarCOD_CLI_ULT_VENDA: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Cli Ult Venda'
      FieldName = 'COD_CLI_ULT_VENDA'
      Origin = 'OC_COMPRAR.COD_CLI_ULT_VENDA'
      Size = 6
    end
    object IBQ_AComprarDES_CLI_ULT_VENDA: TIBStringField
      DisplayLabel = 'Cliente Ult Venda'
      FieldName = 'DES_CLI_ULT_VENDA'
      Origin = 'OC_COMPRAR.DES_CLI_ULT_VENDA'
      Size = 40
    end
    object IBQ_AComprarQTD_ULT_VENDA: TIBBCDField
      DisplayLabel = 'Qtd Ult Venda'
      FieldName = 'QTD_ULT_VENDA'
      Origin = 'OC_COMPRAR.QTD_ULT_VENDA'
      DisplayFormat = '0.'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_UNI_ULT_VENDA: TIBBCDField
      DisplayLabel = 'Vlr Unit Ult Venda'
      FieldName = 'VLR_UNI_ULT_VENDA'
      Origin = 'OC_COMPRAR.VLR_UNI_ULT_VENDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_TOT_ULT_VENDA: TIBBCDField
      DisplayLabel = 'Vlr Tot Ult Venda'
      FieldName = 'VLR_TOT_ULT_VENDA'
      Origin = 'OC_COMPRAR.VLR_TOT_ULT_VENDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_UNI_VENDA: TIBBCDField
      DisplayLabel = 'Vl Un Venda'
      FieldName = 'VLR_UNI_VENDA'
      Origin = 'OC_COMPRAR.VLR_UNI_VENDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarCOD_LISTA_VENDA: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Lista Venda'
      FieldName = 'COD_LISTA_VENDA'
      Origin = 'OC_COMPRAR.COD_LISTA_VENDA'
      Size = 4
    end
    object IBQ_AComprarDES_LISTA_VENDA: TIBStringField
      DisplayLabel = 'Lista Venda'
      FieldName = 'DES_LISTA_VENDA'
      Origin = 'OC_COMPRAR.DES_LISTA_VENDA'
      Size = 30
    end
    object IBQ_AComprarCOD_LISTA_COMPRA: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Lista Compra'
      FieldName = 'COD_LISTA_COMPRA'
      Origin = 'OC_COMPRAR.COD_LISTA_COMPRA'
      Size = 4
    end
    object IBQ_AComprarDES_LISTA_COMPRA: TIBStringField
      DisplayLabel = 'Lista Compra'
      FieldName = 'DES_LISTA_COMPRA'
      Origin = 'OC_COMPRAR.DES_LISTA_COMPRA'
      Size = 30
    end
    object IBQ_AComprarVLR_CUSTO_MEDIO: TIBBCDField
      DisplayLabel = 'Custo M'#233'dio'
      FieldName = 'VLR_CUSTO_MEDIO'
      Origin = 'OC_COMPRAR.VLR_CUSTO_MEDIO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_TOT_VENDA: TIBBCDField
      DisplayLabel = 'Vlr Tot Venda'
      FieldName = 'VLR_TOT_VENDA'
      Origin = 'OC_COMPRAR.VLR_TOT_VENDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_TOT_COMPRA: TIBBCDField
      DisplayLabel = 'Vr Tot Compra'
      FieldName = 'VLR_TOT_COMPRA'
      Origin = 'OC_COMPRAR.VLR_TOT_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_BRUTO: TIBBCDField
      DisplayLabel = 'Vlr Bruto'
      FieldName = 'VLR_BRUTO'
      Origin = 'OC_COMPRAR.VLR_BRUTO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_DESCONTOS: TIBBCDField
      DisplayLabel = 'Vlr Desc'
      FieldName = 'VLR_DESCONTOS'
      Origin = 'OC_COMPRAR.VLR_DESCONTOS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_DESPESAS: TIBBCDField
      DisplayLabel = 'Vlr Desp'
      FieldName = 'VLR_DESPESAS'
      Origin = 'OC_COMPRAR.VLR_DESPESAS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_FRETE: TIBBCDField
      DisplayLabel = 'Vlr Frete'
      FieldName = 'VLR_FRETE'
      Origin = 'OC_COMPRAR.VLR_FRETE'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarIND_SOMA_IPI_BASE_ICMS: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Soma IPI BICMS'
      FieldName = 'IND_SOMA_IPI_BASE_ICMS'
      Origin = 'OC_COMPRAR.IND_SOMA_IPI_BASE_ICMS'
      Size = 1
    end
    object IBQ_AComprarIND_SOMA_FRETE_BASE_ICMS: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Soma Frete BICMS'
      FieldName = 'IND_SOMA_FRETE_BASE_ICMS'
      Origin = 'OC_COMPRAR.IND_SOMA_FRETE_BASE_ICMS'
      Size = 1
    end
    object IBQ_AComprarIND_SOMA_DESPESA_BASE_ICMS: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Soma Desp BICMS'
      FieldName = 'IND_SOMA_DESPESA_BASE_ICMS'
      Origin = 'OC_COMPRAR.IND_SOMA_DESPESA_BASE_ICMS'
      Size = 1
    end
    object IBQ_AComprarIND_SOMA_IPI_BASE_ST: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Soma IPI BST'
      FieldName = 'IND_SOMA_IPI_BASE_ST'
      Origin = 'OC_COMPRAR.IND_SOMA_IPI_BASE_ST'
      Size = 1
    end
    object IBQ_AComprarIND_SOMA_FRETE_BASE_ST: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Soma Frete BST'
      FieldName = 'IND_SOMA_FRETE_BASE_ST'
      Origin = 'OC_COMPRAR.IND_SOMA_FRETE_BASE_ST'
      Size = 1
    end
    object IBQ_AComprarIND_SOMA_DESPESA_BASE_ST: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Soma Desp BST'
      FieldName = 'IND_SOMA_DESPESA_BASE_ST'
      Origin = 'OC_COMPRAR.IND_SOMA_DESPESA_BASE_ST'
      Size = 1
    end
    object IBQ_AComprarCOD_SIT_TRIBUTARIA: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Sit Trib'
      FieldName = 'COD_SIT_TRIBUTARIA'
      Origin = 'OC_COMPRAR.COD_SIT_TRIBUTARIA'
      Size = 2
    end
    object IBQ_AComprarCOD_IPI: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod IPI'
      FieldName = 'COD_IPI'
      Origin = 'OC_COMPRAR.COD_IPI'
      Size = 2
    end
    object IBQ_AComprarIND_IPI: TIBStringField
      DisplayLabel = 'Ind IPI'
      FieldName = 'IND_IPI'
      Origin = 'OC_COMPRAR.IND_IPI'
      Size = 1
    end
    object IBQ_AComprarPER_IPI: TIBBCDField
      DisplayLabel = 'Per IPI'
      FieldName = 'PER_IPI'
      Origin = 'OC_COMPRAR.PER_IPI'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBQ_AComprarVLR_IPI: TIBBCDField
      DisplayLabel = 'Vlr IPI'
      FieldName = 'VLR_IPI'
      Origin = 'OC_COMPRAR.VLR_IPI'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarCOD_ICMS: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod ICMS'
      FieldName = 'COD_ICMS'
      Origin = 'OC_COMPRAR.COD_ICMS'
      Size = 2
    end
    object IBQ_AComprarPER_REDUCAO_ICMS: TIBBCDField
      DisplayLabel = 'Per Red ICMS'
      FieldName = 'PER_REDUCAO_ICMS'
      Origin = 'OC_COMPRAR.PER_REDUCAO_ICMS'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBQ_AComprarVLR_REDUCAO_ICMS: TIBBCDField
      DisplayLabel = 'Vlr Red ICMS'
      FieldName = 'VLR_REDUCAO_ICMS'
      Origin = 'OC_COMPRAR.VLR_REDUCAO_ICMS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_BASE_ICMS: TIBBCDField
      DisplayLabel = 'Vlr Base ICMS'
      FieldName = 'VLR_BASE_ICMS'
      Origin = 'OC_COMPRAR.VLR_BASE_ICMS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarPER_ICMS: TIBBCDField
      DisplayLabel = 'Per ICMS'
      FieldName = 'PER_ICMS'
      Origin = 'OC_COMPRAR.PER_ICMS'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBQ_AComprarVLR_ICMS: TIBBCDField
      DisplayLabel = 'Vlr ICMS'
      FieldName = 'VLR_ICMS'
      Origin = 'OC_COMPRAR.VLR_ICMS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarCOD_GRUPO_ST: TIntegerField
      DisplayLabel = 'Cod Gr ST'
      FieldName = 'COD_GRUPO_ST'
      Origin = 'OC_COMPRAR.COD_GRUPO_ST'
    end
    object IBQ_AComprarDES_GRUPO_ST: TIBStringField
      DisplayLabel = 'Grupo ST'
      FieldName = 'DES_GRUPO_ST'
      Origin = 'OC_COMPRAR.DES_GRUPO_ST'
      Size = 30
    end
    object IBQ_AComprarPER_MARGEM_ST: TIBBCDField
      DisplayLabel = 'Per Margem ST'
      FieldName = 'PER_MARGEM_ST'
      Origin = 'OC_COMPRAR.PER_MARGEM_ST'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 4
    end
    object IBQ_AComprarIND_ST: TIBStringField
      DisplayLabel = 'Ind ST'
      FieldName = 'IND_ST'
      Origin = 'OC_COMPRAR.IND_ST'
      Size = 1
    end
    object IBQ_AComprarVLR_BASE_ST: TIBBCDField
      DisplayLabel = 'Vlr Base ST'
      FieldName = 'VLR_BASE_ST'
      Origin = 'OC_COMPRAR.VLR_BASE_ST'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarPER_ST: TIBBCDField
      DisplayLabel = 'Per ST'
      FieldName = 'PER_ST'
      Origin = 'OC_COMPRAR.PER_ST'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBQ_AComprarVLR_ST: TIBBCDField
      DisplayLabel = 'Vlr ST'
      FieldName = 'VLR_ST'
      Origin = 'OC_COMPRAR.VLR_ST'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarPER_REPASSE: TIBBCDField
      DisplayLabel = 'Per Repasse'
      FieldName = 'PER_REPASSE'
      Origin = 'OC_COMPRAR.PER_REPASSE'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBQ_AComprarVLR_REPASSE: TIBBCDField
      DisplayLabel = 'Vlr Repasse'
      FieldName = 'VLR_REPASSE'
      Origin = 'OC_COMPRAR.VLR_REPASSE'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarCOD_COMPROVANTE_ICMS: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Comprovante ICMS'
      FieldName = 'COD_COMPROVANTE_ICMS'
      Origin = 'OC_COMPRAR.COD_COMPROVANTE_ICMS'
      Size = 3
    end
    object IBQ_AComprarCOD_REFERENCIA_FORN: TIBStringField
      FieldName = 'COD_REFERENCIA_FORN'
      Origin = 'OC_COMPRAR.COD_REFERENCIA_FORN'
      Size = 30
    end
    object IBQ_AComprarCOD_FORNECEDOR: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Forn'
      FieldName = 'COD_FORNECEDOR'
      Origin = 'OC_COMPRAR.COD_FORNECEDOR'
      Size = 6
    end
    object IBQ_AComprarDES_FORNECEDOR: TIBStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'DES_FORNECEDOR'
      Origin = 'OC_COMPRAR.DES_FORNECEDOR'
      Size = 40
    end
    object IBQ_AComprarTIP_PESSOA: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Tp Pessoa'
      FieldName = 'TIP_PESSOA'
      Origin = 'OC_COMPRAR.TIP_PESSOA'
      Size = 1
    end
    object IBQ_AComprarDES_EMAIL: TIBStringField
      DisplayLabel = 'E-Mail'
      FieldName = 'DES_EMAIL'
      Origin = 'OC_COMPRAR.DES_EMAIL'
      Size = 80
    end
    object IBQ_AComprarQTD_NR_DIAS: TIntegerField
      DisplayLabel = 'Nr Dias'
      FieldName = 'QTD_NR_DIAS'
      Origin = 'OC_COMPRAR.QTD_NR_DIAS'
      DisplayFormat = '0.'
    end
    object IBQ_AComprarQTD_NR_MESES: TIntegerField
      DisplayLabel = 'Nr Meses'
      FieldName = 'QTD_NR_MESES'
      Origin = 'OC_COMPRAR.QTD_NR_MESES'
      DisplayFormat = '0.'
    end
    object IBQ_AComprarQTD_TOT_MESES: TIntegerField
      DisplayLabel = 'Total Meses'
      FieldName = 'QTD_TOT_MESES'
      Origin = 'OC_COMPRAR.QTD_TOT_MESES'
      DisplayFormat = '0.'
    end
    object IBQ_AComprarCOD_COMPRADOR: TIntegerField
      FieldName = 'COD_COMPRADOR'
      Origin = 'OC_COMPRAR.COD_COMPRADOR'
    end
    object IBQ_AComprarBLOB_TEXTO: TMemoField
      FieldName = 'BLOB_TEXTO'
      Origin = 'OC_COMPRAR.BLOB_TEXTO'
      BlobType = ftMemo
      Size = 8
    end
    object IBQ_AComprarIND_TRANSF: TIBStringField
      FieldName = 'IND_TRANSF'
      Origin = 'OC_COMPRAR.IND_TRANSF'
      Size = 1
    end
    object IBQ_AComprarDTA_LIM_TRANSF: TDateField
      FieldName = 'DTA_LIM_TRANSF'
      Origin = 'OC_COMPRAR.DTA_LIM_TRANSF'
    end
    object IBQ_AComprarQTD_TRANSF: TIBBCDField
      DisplayLabel = 'Qtd Transf'
      FieldName = 'QTD_TRANSF'
      Origin = 'OC_COMPRAR.QTD_TRANSF'
      DisplayFormat = '0.'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarIND_USAR: TIBStringField
      FieldName = 'IND_USAR'
      Origin = 'OC_COMPRAR.IND_USAR'
      Size = 3
    end
    object IBQ_AComprarIND_QTD_ACIMA: TIBBCDField
      DisplayLabel = 'Excedente'
      FieldName = 'IND_QTD_ACIMA'
      Origin = 'OC_COMPRAR.IND_QTD_ACIMA'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_SUGERIDA_ANO: TIBBCDField
      DisplayLabel = 'Sug. ANO'
      FieldName = 'QTD_SUGERIDA_ANO'
      Origin = 'OC_COMPRAR.QTD_SUGERIDA_ANO'
      DisplayFormat = '0.'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_TRANSF_PERIODO: TIBBCDField
      DisplayLabel = 'Transf Per'#237'odo'
      FieldName = 'QTD_TRANSF_PERIODO'
      Origin = 'OC_COMPRAR.QTD_TRANSF_PERIODO'
      DisplayFormat = '0.'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_TRANSF_ANO: TIBBCDField
      DisplayLabel = 'Transf Ano'
      FieldName = 'QTD_TRANSF_ANO'
      Origin = 'OC_COMPRAR.QTD_TRANSF_ANO'
      DisplayFormat = '0.'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEST_MINIMO: TIBBCDField
      DisplayLabel = 'Est. M'#237'n.'
      FieldName = 'EST_MINIMO'
      Origin = 'OC_COMPRAR.EST_MINIMO'
      DisplayFormat = '0,'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarDIAS_ESTOCAGEM: TIntegerField
      DisplayLabel = 'Dias Est.'
      FieldName = 'DIAS_ESTOCAGEM'
      Origin = 'OC_COMPRAR.DIAS_ESTOCAGEM'
      DisplayFormat = '0,'
    end
    object IBQ_AComprarQTD_DEMANDA_DIA: TIBBCDField
      DisplayLabel = 'Dem. Dia'
      FieldName = 'QTD_DEMANDA_DIA'
      Origin = 'OC_COMPRAR.QTD_DEMANDA_DIA'
      DisplayFormat = '0,.00'
      Precision = 18
      Size = 4
    end
    object IBQ_AComprarQTD_DEMANDA_ANO: TIBBCDField
      DisplayLabel = 'Qtd Dem.'
      FieldName = 'QTD_DEMANDA_ANO'
      Origin = 'OC_COMPRAR.QTD_DEMANDA_ANO'
      DisplayFormat = '0,.00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_DIAS_ANO: TIntegerField
      DisplayLabel = 'Dias Uteis'
      FieldName = 'QTD_DIAS_ANO'
      Origin = 'OC_COMPRAR.QTD_DIAS_ANO'
      DisplayFormat = '0.'
    end
    object IBQ_AComprarDATAINCLUSAO: TDateField
      DisplayLabel = 'Inclus'#227'o'
      FieldName = 'DATAINCLUSAO'
      Origin = 'OC_COMPRAR.DATAINCLUSAO'
    end
    object IBQ_AComprarESTADO: TIBStringField
      DisplayLabel = 'UF'
      FieldName = 'ESTADO'
      Origin = 'OC_COMPRAR.ESTADO'
      FixedChar = True
      Size = 2
    end
    object IBQ_AComprarDATAALTERACAO: TDateField
      FieldName = 'DATAALTERACAO'
      Origin = 'OC_COMPRAR.DATAALTERACAO'
    end
    object IBQ_AComprarIND_TRANSF_CD: TIBStringField
      FieldName = 'IND_TRANSF_CD'
      Origin = 'OC_COMPRAR.IND_TRANSF_CD'
      FixedChar = True
      Size = 1
    end
    object IBQ_AComprarDOC_TRANSF_CD: TIntegerField
      FieldName = 'DOC_TRANSF_CD'
      Origin = 'OC_COMPRAR.DOC_TRANSF_CD'
    end
  end
  object IBU_AComprar: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from oc_comprar '
      'where'
      '  NUM_SEQ = :NUM_SEQ'
      ' and  NUM_DOCUMENTO = :NUM_DOCUMENTO')
    ModifySQL.Strings = (
      'update oc_comprar'
      'set'
      '  QTD_SUGERIDA = :QTD_SUGERIDA,'
      '  QTD_ACOMPRAR = :QTD_ACOMPRAR,'
      '  QTD_TRANSF = :QTD_TRANSF,'
      '  EST_MINIMO = :EST_MINIMO,'
      '  VLR_UNI_COMPRA = :VLR_UNI_COMPRA,'
      '  PER_DESCONTO = :PER_DESCONTO,'
      '  VLR_DESCONTOS=((QTD_ACOMPRAR*VLR_UNI_COMPRA)*'
      '(PER_DESCONTO/100)),'
      '  VLR_BRUTO=(QTD_ACOMPRAR*VLR_UNI_COMPRA)-VLR_DESCONTOS,'
      '  VLR_BASE_ICMS=VLR_BRUTO,'
      
        '  VLR_ICMS=Cast(((VLR_BASE_ICMS*PER_ICMS)/100) as Numeric(12,2))' +
        ','
      '  VLR_IPI=Cast(((VLR_BRUTO*PER_IPI)/100) as Numeric(12,2)),'
      
        '  VLR_BASE_ST=VLR_BRUTO+(Cast(((VLR_BRUTO*PER_MARGEM_ST)/100) as' +
        ' '
      'Numeric(12,2))),'
      
        '  VLR_ST=(Cast(((VLR_BASE_ST*PER_ST)/100) as Numeric(12,2))-VLR_' +
        'ICMS),'
      '  VLR_TOT_COMPRA=VLR_BRUTO+VLR_ST+VLR_IPI,'
      '  VLR_TOT_ULT_VENDA=QTD_ACOMPRAR*VLR_UNI_VENDA,'
      '  BLOB_TEXTO = :BLOB_TEXTO'
      'where'
      '  NUM_SEQ = :NUM_SEQ'
      '  and NUM_DOCUMENTO = :NUM_DOCUMENTO'
      '  and cod_item= :COD_ITEM')
    InsertSQL.Strings = (
      'insert into oc_comprar'
      '  (NUM_SEQ, NUM_DOCUMENTO, DTA_DOCUMENTO, IND_OC_GERADA, '
      'DTA_OC_GERADA,'
      '   NUM_OC_GERADA, OBS_OC, COD_EMPRESA, DES_EMPRESA, COD_ITEM, '
      'DES_ITEM,'
      '   QTD_SUGERIDA, QTD_ACOMPRAR, QTD_SALDO, QTD_TRANSITO, '
      'QTD_DISPONIVEL,'
      '   QTD_MEDIA_MES, QTD_MEDIA_DIA, QTD_DEM_MES1, QTD_DEM_MES2, '
      'QTD_DEM_MES3,'
      '   QTD_DEM_MES4, QTD_DEM_MES5, QTD_DEM_MES6, QTD_DEM_MES7, '
      'QTD_DEM_MES8,'
      '   UNI_COMPRA, UNI_VENDA, COD_BARRAS, COD_GRUPO, DES_GRUPO, '
      'COD_SUBGRUPO,'
      '   DES_SUBGRUPO, DES_GENERICO, COD_APLICACAO, DES_APLICACAO, '
      'COD_REFERENCIA,'
      '   CLA_CURVA_ABC, COD_FAMILIA_PRECO, DES_FAMILIA_PRECO, '
      'DTA_ULT_COMPRA,'
      '   COD_FOR_ULT_COMPRA, DES_FOR_ULT_COMPRA, QTD_ULT_COMPRA, '
      'VLR_UNI_ULT_COMPRA,'
      '   VLR_TOT_ULT_COMPRA, VLR_UNI_COMPRA, PER_DESCONTO, '
      'DTA_ULT_VENDA, COD_CLI_ULT_VENDA,'
      '   DES_CLI_ULT_VENDA, QTD_ULT_VENDA, VLR_UNI_ULT_VENDA, '
      'VLR_TOT_ULT_VENDA,'
      '   VLR_UNI_VENDA, COD_LISTA_VENDA, DES_LISTA_VENDA, '
      'COD_LISTA_COMPRA, DES_LISTA_COMPRA,'
      '   VLR_CUSTO_MEDIO, VLR_TOT_VENDA, VLR_TOT_COMPRA, VLR_BRUTO, '
      'VLR_DESCONTOS,'
      '   VLR_DESPESAS, VLR_FRETE, IND_SOMA_IPI_BASE_ICMS, '
      'IND_SOMA_FRETE_BASE_ICMS,'
      '   IND_SOMA_DESPESA_BASE_ICMS, IND_SOMA_IPI_BASE_ST, '
      'IND_SOMA_FRETE_BASE_ST,'
      
        '   IND_SOMA_DESPESA_BASE_ST, COD_SIT_TRIBUTARIA, COD_IPI, IND_IP' +
        'I, '
      'PER_IPI,'
      '   VLR_IPI, COD_ICMS, PER_REDUCAO_ICMS, VLR_REDUCAO_ICMS, '
      'VLR_BASE_ICMS,'
      '   PER_ICMS, VLR_ICMS, COD_GRUPO_ST, DES_GRUPO_ST, '
      'PER_MARGEM_ST, IND_ST,'
      '   VLR_BASE_ST, PER_ST, VLR_ST, PER_REPASSE, VLR_REPASSE, '
      'COD_COMPROVANTE_ICMS,'
      '   COD_REFERENCIA_FORN, COD_FORNECEDOR, DES_FORNECEDOR, '
      'TIP_PESSOA, DES_EMAIL,'
      '   QTD_NR_DIAS, QTD_NR_MESES, QTD_TOT_MESES, COD_COMPRADOR, '
      'BLOB_TEXTO,'
      '   IND_TRANSF, DTA_LIM_TRANSF, QTD_TRANSF, IND_USAR, '
      'IND_QTD_ACIMA,'
      '  QTD_SUGERIDA_ANO, QTD_TRANSF_PERIODO, QTD_TRANSF_ANO, '
      'EST_MINIMO,'
      '  DIAS_ESTOCAGEM, QTD_DEMANDA_DIA, QTD_DEMANDA_ANO, '
      'QTD_DIAS_ANO,'
      '  DATAINCLUSAO, ESTADO, DATAALTERACAO)'
      'values'
      '  (:NUM_SEQ, :NUM_DOCUMENTO, :DTA_DOCUMENTO, :IND_OC_GERADA, '
      ':DTA_OC_GERADA,'
      
        '   :NUM_OC_GERADA, :OBS_OC, :COD_EMPRESA, :DES_EMPRESA, :COD_ITE' +
        'M, '
      ':DES_ITEM,'
      '   :QTD_SUGERIDA, :QTD_ACOMPRAR, :QTD_SALDO, :QTD_TRANSITO, '
      ':QTD_DISPONIVEL,'
      
        '   :QTD_MEDIA_MES, :QTD_MEDIA_DIA, :QTD_DEM_MES1, :QTD_DEM_MES2,' +
        ' '
      ':QTD_DEM_MES3,'
      '   :QTD_DEM_MES4, :QTD_DEM_MES5, :QTD_DEM_MES6, :QTD_DEM_MES7, '
      ':QTD_DEM_MES8,'
      
        '   :UNI_COMPRA, :UNI_VENDA, :COD_BARRAS, :COD_GRUPO, :DES_GRUPO,' +
        ' '
      ':COD_SUBGRUPO,'
      '   :DES_SUBGRUPO, :DES_GENERICO, :COD_APLICACAO, :DES_APLICACAO,'
      '    :COD_REFERENCIA,'
      '   :CLA_CURVA_ABC, :COD_FAMILIA_PRECO, :DES_FAMILIA_PRECO, '
      ':DTA_ULT_COMPRA,'
      '   :COD_FOR_ULT_COMPRA, :DES_FOR_ULT_COMPRA, :QTD_ULT_COMPRA,'
      '   :VLR_UNI_ULT_COMPRA,'
      '   :VLR_TOT_ULT_COMPRA, :VLR_UNI_COMPRA, :PER_DESCONTO, '
      ':DTA_ULT_VENDA,'
      '   :COD_CLI_ULT_VENDA, :DES_CLI_ULT_VENDA, :QTD_ULT_VENDA, '
      ':VLR_UNI_ULT_VENDA,'
      '   :VLR_TOT_ULT_VENDA, :VLR_UNI_VENDA, :COD_LISTA_VENDA, '
      ':DES_LISTA_VENDA,'
      '   :COD_LISTA_COMPRA, :DES_LISTA_COMPRA, :VLR_CUSTO_MEDIO, '
      ':VLR_TOT_VENDA,'
      '   :VLR_TOT_COMPRA, :VLR_BRUTO, :VLR_DESCONTOS, :VLR_DESPESAS, '
      ':VLR_FRETE,'
      '   :IND_SOMA_IPI_BASE_ICMS, :IND_SOMA_FRETE_BASE_ICMS,'
      '   :IND_SOMA_DESPESA_BASE_ICMS,'
      '   :IND_SOMA_IPI_BASE_ST, :IND_SOMA_FRETE_BASE_ST, '
      ':IND_SOMA_DESPESA_BASE_ST,'
      
        '   :COD_SIT_TRIBUTARIA, :COD_IPI, :IND_IPI, :PER_IPI, :VLR_IPI, ' +
        ':COD_ICMS,'
      '    :PER_REDUCAO_ICMS,  :VLR_REDUCAO_ICMS,'
      '    :VLR_BASE_ICMS, :PER_ICMS, :VLR_ICMS, :COD_GRUPO_ST,'
      
        '   :DES_GRUPO_ST, :PER_MARGEM_ST, :IND_ST, :VLR_BASE_ST, :PER_ST' +
        ', '
      ':VLR_ST,'
      '   :PER_REPASSE, :VLR_REPASSE, :COD_COMPROVANTE_ICMS, '
      ':COD_REFERENCIA_FORN,'
      '   :COD_FORNECEDOR, :DES_FORNECEDOR, :TIP_PESSOA, :DES_EMAIL,'
      '   :QTD_NR_DIAS, :QTD_NR_MESES, :QTD_TOT_MESES, :COD_COMPRADOR, '
      ':BLOB_TEXTO,'
      '   :IND_TRANSF, :DTA_LIM_TRANSF, :QTD_TRANSF, :IND_USAR, '
      ':IND_QTD_ACIMA,'
      '   :QTD_SUGERIDA_ANO, :QTD_TRANSF_PERIODO, :QTD_TRANSF_ANO, '
      ':EST_MINIMO,'
      '   :DIAS_ESTOCAGEM, :QTD_DEMANDA_DIA, :QTD_DEMANDA_ANO, '
      ':QTD_DIAS_ANO,'
      '   :DATAINCLUSAO, :ESTADO, :DATAALTERACAO)'
      '')
    DeleteSQL.Strings = (
      'delete from oc_comprar'
      'where  NUM_SEQ = :NUM_SEQ'
      'and NUM_DOCUMENTO = :NUM_DOCUMENTO'
      'and cod_item= :COD_ITEM')
    Left = 823
    Top = 206
  end
  object IBQ_Executa: TIBQuery
    Database = DMBelShopPedidos.IBDB_BelShop
    Transaction = DMBelShopPedidos.IBT_BelShop
    BufferChunks = 1000
    CachedUpdates = False
    Left = 783
    Top = 99
  end
  object IBQ_Busca: TIBQuery
    Database = DMBelShopPedidos.IBDB_BelShop
    Transaction = DMBelShopPedidos.IBT_BelShop
    BufferChunks = 1000
    CachedUpdates = False
    Left = 784
    Top = 45
  end
  object DS_OrdemCompra: TDataSource
    DataSet = IBQ_OrdemCompra
    Left = 823
    Top = 459
  end
  object IBQ_OrdemCompra: TIBQuery
    Database = DMBelShopPedidos.IBDB_BelShop
    Transaction = DMBelShopPedidos.IBT_BelShop
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      'oc.des_empresa,'
      'CASE'
      '   WHEN COALESCE(oc.num_oc_gerada,0)=0 THEN'
      '        '#39'Pedido N'#250'mero: '#39'||oc.num_documento'
      '   ELSE'
      '     '#39'Ordem de Compra N'#250'mero: '#39'||oc.num_oc_gerada'
      'END PEDIDOOC,'
      ''
      'CASE co.complement_emp'
      '  WHEN '#39#39' THEN'
      '     co.endereco_emp ||'#39', '#39'|| co.num_emp'
      
        '  ELSE    co.endereco_emp ||'#39', '#39'|| co.num_emp ||'#39' - '#39'|| co.compl' +
        'ement_emp'
      'End ENDERECO,'
      ''
      'co.bairro_emp DES_BAIRRO,'
      'CAST(co.cidade_emp AS VARCHAR(60)) DES_CIDADE,'
      'co.estado_emp COD_UF,'
      'CAST(co.cep_emp AS VARCHAR(9)) COD_CEP,'
      ''
      'CAST(( SUBSTRING(co.cnpj_emp FROM 1 FOR 2) ||'#39'.'#39'||'
      '       SUBSTRING(co.cnpj_emp FROM 3 FOR 3) ||'#39'.'#39'||'
      '       SUBSTRING(co.cnpj_emp FROM 6 FOR 3) ||'#39'/'#39'||'
      '       SUBSTRING(co.cnpj_emp FROM 9 FOR 4) ||'#39'-'#39'||'
      '       SUBSTRING(co.cnpj_emp FROM 13 FOR 2 ))'
      'AS VARCHAR(18)) NUM_CNPJ,'
      ''
      'co.inscricao_emp inscr_estadual,'
      'CAST(oc.dta_oc_gerada AS DATE) DTA_PEDIDO,'
      'CAST(oc.dta_oc_gerada as Date) DTA_ENTREGA,'
      'oc.cod_fornecedor,'
      'oc.des_fornecedor,'
      'oc.cod_item,'
      'oc.cod_barras,'
      'oc.cod_referencia_forn,'
      'oc.des_item,'
      'oc.uni_compra,'
      'oc.uni_venda,'
      'oc.qtd_acomprar,'
      'oc.vlr_uni_compra,'
      'oc.per_desconto,'
      'oc.vlr_tot_compra,'
      'oc.per_icms,'
      'oc.vlr_icms,'
      'oc.per_ipi,'
      'oc.vlr_ipi,'
      'oc.per_st,'
      'oc.vlr_st,'
      'oc.obs_oc,'
      'oc.cod_comprador,'
      'us.des_usuario,'
      ''
      'CASE'
      '  WHEN oc.ind_oc_gerada='#39'S'#39' THEN'
      '    '#39'OC GERADA'#39
      '  WHEN UPPER(TRIM(dc.origem)) = '#39'LINX'#39' THEN'
      '    '#39'FECHADO'#39
      '  ELSE'
      '    '#39'ABERTO'#39
      'END SITUACAO'
      ''
      'FROM OC_COMPRAR oc'
      '     LEFT JOIN LINXLOJAS    co     ON co.empresa=oc.cod_empresa'
      
        '     LEFT JOIN PS_USUARIOS  us     ON us.cod_usuario=oc.cod_comp' +
        'rador'
      
        '     LEFT JOIN OC_COMPRAR_DOCS dc  ON dc.num_docto=oc.num_docume' +
        'nto'
      
        '                                  AND dc.dta_docto=CAST(oc.dta_d' +
        'ocumento AS DATE)'
      
        '                                  AND dc.cod_comprador=oc.cod_co' +
        'mprador'
      ''
      'WHERE oc.qtd_acomprar>0'
      'AND   oc.num_documento='#39'181'#39
      'AND   Cast(oc.dta_documento as Date)='#39'02.04.2019'#39
      'AND   oc.cod_empresa='#39'28'#39
      'AND   oc.cod_fornecedor=185'
      'AND   oc.num_oc_gerada IS NULL'
      ''
      'ORDER BY oc.des_item')
    Left = 775
    Top = 448
    object IBQ_OrdemCompraDES_EMPRESA: TIBStringField
      FieldName = 'DES_EMPRESA'
      Origin = 'OC_COMPRAR.DES_EMPRESA'
      Size = 60
    end
    object IBQ_OrdemCompraPEDIDOOC: TIBStringField
      FieldName = 'PEDIDOOC'
      Size = 35
    end
    object IBQ_OrdemCompraENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Size = 326
    end
    object IBQ_OrdemCompraDES_BAIRRO: TIBStringField
      FieldName = 'DES_BAIRRO'
      Origin = 'LINXLOJAS.BAIRRO_EMP'
      Size = 50
    end
    object IBQ_OrdemCompraDES_CIDADE: TIBStringField
      FieldName = 'DES_CIDADE'
      Size = 60
    end
    object IBQ_OrdemCompraCOD_UF: TIBStringField
      FieldName = 'COD_UF'
      Origin = 'LINXLOJAS.ESTADO_EMP'
      FixedChar = True
      Size = 2
    end
    object IBQ_OrdemCompraCOD_CEP: TIBStringField
      FieldName = 'COD_CEP'
      Size = 9
    end
    object IBQ_OrdemCompraNUM_CNPJ: TIBStringField
      FieldName = 'NUM_CNPJ'
      Size = 18
    end
    object IBQ_OrdemCompraINSCR_ESTADUAL: TIBStringField
      FieldName = 'INSCR_ESTADUAL'
      Origin = 'LINXLOJAS.INSCRICAO_EMP'
    end
    object IBQ_OrdemCompraDTA_PEDIDO: TDateField
      FieldName = 'DTA_PEDIDO'
    end
    object IBQ_OrdemCompraDTA_ENTREGA: TDateField
      FieldName = 'DTA_ENTREGA'
    end
    object IBQ_OrdemCompraCOD_FORNECEDOR: TIBStringField
      FieldName = 'COD_FORNECEDOR'
      Origin = 'OC_COMPRAR.COD_FORNECEDOR'
      Size = 6
    end
    object IBQ_OrdemCompraDES_FORNECEDOR: TIBStringField
      FieldName = 'DES_FORNECEDOR'
      Origin = 'OC_COMPRAR.DES_FORNECEDOR'
      Size = 40
    end
    object IBQ_OrdemCompraCOD_ITEM: TIBStringField
      FieldName = 'COD_ITEM'
      Origin = 'OC_COMPRAR.COD_ITEM'
      Size = 6
    end
    object IBQ_OrdemCompraCOD_BARRAS: TIBStringField
      FieldName = 'COD_BARRAS'
      Origin = 'OC_COMPRAR.COD_BARRAS'
      Size = 19
    end
    object IBQ_OrdemCompraCOD_REFERENCIA_FORN: TIBStringField
      FieldName = 'COD_REFERENCIA_FORN'
      Origin = 'OC_COMPRAR.COD_REFERENCIA_FORN'
      Size = 30
    end
    object IBQ_OrdemCompraDES_ITEM: TIBStringField
      FieldName = 'DES_ITEM'
      Origin = 'OC_COMPRAR.DES_ITEM'
      Size = 80
    end
    object IBQ_OrdemCompraUNI_COMPRA: TIntegerField
      FieldName = 'UNI_COMPRA'
      Origin = 'OC_COMPRAR.UNI_COMPRA'
    end
    object IBQ_OrdemCompraUNI_VENDA: TIntegerField
      FieldName = 'UNI_VENDA'
      Origin = 'OC_COMPRAR.UNI_VENDA'
    end
    object IBQ_OrdemCompraQTD_ACOMPRAR: TIBBCDField
      FieldName = 'QTD_ACOMPRAR'
      Origin = 'OC_COMPRAR.QTD_ACOMPRAR'
      Precision = 18
      Size = 2
    end
    object IBQ_OrdemCompraVLR_UNI_COMPRA: TIBBCDField
      FieldName = 'VLR_UNI_COMPRA'
      Origin = 'OC_COMPRAR.VLR_UNI_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_OrdemCompraPER_DESCONTO: TIBBCDField
      FieldName = 'PER_DESCONTO'
      Origin = 'OC_COMPRAR.PER_DESCONTO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_OrdemCompraVLR_TOT_COMPRA: TIBBCDField
      FieldName = 'VLR_TOT_COMPRA'
      Origin = 'OC_COMPRAR.VLR_TOT_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_OrdemCompraPER_ICMS: TIBBCDField
      FieldName = 'PER_ICMS'
      Origin = 'OC_COMPRAR.PER_ICMS'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBQ_OrdemCompraVLR_ICMS: TIBBCDField
      FieldName = 'VLR_ICMS'
      Origin = 'OC_COMPRAR.VLR_ICMS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_OrdemCompraPER_IPI: TIBBCDField
      FieldName = 'PER_IPI'
      Origin = 'OC_COMPRAR.PER_IPI'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBQ_OrdemCompraVLR_IPI: TIBBCDField
      FieldName = 'VLR_IPI'
      Origin = 'OC_COMPRAR.VLR_IPI'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_OrdemCompraPER_ST: TIBBCDField
      FieldName = 'PER_ST'
      Origin = 'OC_COMPRAR.PER_ST'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBQ_OrdemCompraVLR_ST: TIBBCDField
      FieldName = 'VLR_ST'
      Origin = 'OC_COMPRAR.VLR_ST'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_OrdemCompraOBS_OC: TIBStringField
      FieldName = 'OBS_OC'
      Origin = 'OC_COMPRAR.OBS_OC'
      Size = 2000
    end
    object IBQ_OrdemCompraCOD_COMPRADOR: TIntegerField
      FieldName = 'COD_COMPRADOR'
      Origin = 'OC_COMPRAR.COD_COMPRADOR'
    end
    object IBQ_OrdemCompraDES_USUARIO: TIBStringField
      FieldName = 'DES_USUARIO'
      Origin = 'PS_USUARIOS.DES_USUARIO'
      Size = 50
    end
    object IBQ_OrdemCompraSITUACAO: TIBStringField
      FieldName = 'SITUACAO'
      Required = True
      FixedChar = True
      Size = 9
    end
  end
  object DS_AComprarEdita: TDataSource
    DataSet = IBQ_AComprarEdita
    Left = 863
    Top = 249
  end
  object IBQ_AComprarEdita: TIBQuery
    Database = DMBelShopPedidos.IBDB_BelShop
    Transaction = DMBelShopPedidos.IBT_BelShop
    AfterPost = IBQ_AComprarEditaAfterPost
    AfterScroll = IBQ_AComprarEditaAfterScroll
    BeforePost = IBQ_AComprarEditaBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *'
      'from oc_comprar o'
      'where o.num_seq<14')
    UpdateObject = IBU_AComprarEdita
    Left = 775
    Top = 256
    object IBQ_AComprarEditaNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
      Origin = 'OC_COMPRAR.NUM_SEQ'
      Required = True
    end
    object IBQ_AComprarEditaNUM_DOCUMENTO: TIntegerField
      FieldName = 'NUM_DOCUMENTO'
      Origin = 'OC_COMPRAR.NUM_DOCUMENTO'
      Required = True
    end
    object IBQ_AComprarEditaDTA_DOCUMENTO: TDateTimeField
      Alignment = taCenter
      FieldName = 'DTA_DOCUMENTO'
      Origin = 'OC_COMPRAR.DTA_DOCUMENTO'
    end
    object IBQ_AComprarEditaIND_OC_GERADA: TIBStringField
      FieldName = 'IND_OC_GERADA'
      Origin = 'OC_COMPRAR.IND_OC_GERADA'
      Size = 1
    end
    object IBQ_AComprarEditaDTA_OC_GERADA: TDateTimeField
      Alignment = taCenter
      FieldName = 'DTA_OC_GERADA'
      Origin = 'OC_COMPRAR.DTA_OC_GERADA'
    end
    object IBQ_AComprarEditaNUM_OC_GERADA: TIntegerField
      FieldName = 'NUM_OC_GERADA'
      Origin = 'OC_COMPRAR.NUM_OC_GERADA'
    end
    object IBQ_AComprarEditaOBS_OC: TIBStringField
      FieldName = 'OBS_OC'
      Origin = 'OC_COMPRAR.OBS_OC'
      Size = 2000
    end
    object IBQ_AComprarEditaCOD_EMPRESA: TIBStringField
      Alignment = taRightJustify
      FieldName = 'COD_EMPRESA'
      Origin = 'OC_COMPRAR.COD_EMPRESA'
      Size = 6
    end
    object IBQ_AComprarEditaDES_EMPRESA: TIBStringField
      FieldName = 'DES_EMPRESA'
      Origin = 'OC_COMPRAR.DES_EMPRESA'
      Size = 60
    end
    object IBQ_AComprarEditaCOD_ITEM: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd Produto'
      FieldName = 'COD_ITEM'
      Origin = 'OC_COMPRAR.COD_ITEM'
      Size = 6
    end
    object IBQ_AComprarEditaDES_ITEM: TIBStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'DES_ITEM'
      Origin = 'OC_COMPRAR.DES_ITEM'
      Size = 80
    end
    object IBQ_AComprarEditaQTD_SUGERIDA: TIBBCDField
      DisplayLabel = 'Sugest'#227'o'
      FieldName = 'QTD_SUGERIDA'
      Origin = 'OC_COMPRAR.QTD_SUGERIDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_ACOMPRAR: TIBBCDField
      DisplayLabel = 'A Comprar'
      FieldName = 'QTD_ACOMPRAR'
      Origin = 'OC_COMPRAR.QTD_ACOMPRAR'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_SALDO: TIBBCDField
      DisplayLabel = 'Saldo'
      FieldName = 'QTD_SALDO'
      Origin = 'OC_COMPRAR.QTD_SALDO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_TRANSITO: TIBBCDField
      DisplayLabel = 'Tr'#226'nsito'
      FieldName = 'QTD_TRANSITO'
      Origin = 'OC_COMPRAR.QTD_TRANSITO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_TRANSF: TIBBCDField
      DisplayLabel = 'Transf'
      FieldName = 'QTD_TRANSF'
      Origin = 'OC_COMPRAR.QTD_TRANSF'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_DISPONIVEL: TIBBCDField
      DisplayLabel = 'Previsto'
      FieldName = 'QTD_DISPONIVEL'
      Origin = 'OC_COMPRAR.QTD_DISPONIVEL'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_MEDIA_MES: TIBBCDField
      DisplayLabel = 'M'#233'dia M'#234's'
      FieldName = 'QTD_MEDIA_MES'
      Origin = 'OC_COMPRAR.QTD_MEDIA_MES'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 4
    end
    object IBQ_AComprarEditaQTD_MEDIA_DIA: TIBBCDField
      DisplayLabel = 'M'#233'dia Dia'
      FieldName = 'QTD_MEDIA_DIA'
      Origin = 'OC_COMPRAR.QTD_MEDIA_DIA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 4
    end
    object IBQ_AComprarEditaQTD_DEM_MES1: TIBBCDField
      FieldName = 'QTD_DEM_MES1'
      Origin = 'OC_COMPRAR.QTD_DEM_MES1'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_DEM_MES2: TIBBCDField
      FieldName = 'QTD_DEM_MES2'
      Origin = 'OC_COMPRAR.QTD_DEM_MES2'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_DEM_MES3: TIBBCDField
      FieldName = 'QTD_DEM_MES3'
      Origin = 'OC_COMPRAR.QTD_DEM_MES3'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_DEM_MES4: TIBBCDField
      FieldName = 'QTD_DEM_MES4'
      Origin = 'OC_COMPRAR.QTD_DEM_MES4'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_DEM_MES5: TIBBCDField
      FieldName = 'QTD_DEM_MES5'
      Origin = 'OC_COMPRAR.QTD_DEM_MES5'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_DEM_MES6: TIBBCDField
      FieldName = 'QTD_DEM_MES6'
      Origin = 'OC_COMPRAR.QTD_DEM_MES6'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_DEM_MES7: TIBBCDField
      FieldName = 'QTD_DEM_MES7'
      Origin = 'OC_COMPRAR.QTD_DEM_MES7'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_DEM_MES8: TIBBCDField
      FieldName = 'QTD_DEM_MES8'
      Origin = 'OC_COMPRAR.QTD_DEM_MES8'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaUNI_COMPRA: TIntegerField
      DisplayLabel = 'Uni Compra'
      FieldName = 'UNI_COMPRA'
      Origin = 'OC_COMPRAR.UNI_COMPRA'
    end
    object IBQ_AComprarEditaUNI_VENDA: TIntegerField
      DisplayLabel = 'Uni Venda'
      FieldName = 'UNI_VENDA'
      Origin = 'OC_COMPRAR.UNI_VENDA'
    end
    object IBQ_AComprarEditaCOD_BARRAS: TIBStringField
      DisplayLabel = 'EAN'
      FieldName = 'COD_BARRAS'
      Origin = 'OC_COMPRAR.COD_BARRAS'
      Size = 19
    end
    object IBQ_AComprarEditaCOD_GRUPO: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Grupo'
      FieldName = 'COD_GRUPO'
      Origin = 'OC_COMPRAR.COD_GRUPO'
      Size = 3
    end
    object IBQ_AComprarEditaDES_GRUPO: TIBStringField
      DisplayLabel = 'Grupo'
      FieldName = 'DES_GRUPO'
      Origin = 'OC_COMPRAR.DES_GRUPO'
      Size = 30
    end
    object IBQ_AComprarEditaCOD_SUBGRUPO: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod SubGrupo'
      FieldName = 'COD_SUBGRUPO'
      Origin = 'OC_COMPRAR.COD_SUBGRUPO'
      Size = 7
    end
    object IBQ_AComprarEditaDES_SUBGRUPO: TIBStringField
      DisplayLabel = 'SubGrupo'
      FieldName = 'DES_SUBGRUPO'
      Origin = 'OC_COMPRAR.DES_SUBGRUPO'
      Size = 30
    end
    object IBQ_AComprarEditaDES_GENERICO: TIBStringField
      DisplayLabel = 'Gen'#233'rico'
      FieldName = 'DES_GENERICO'
      Origin = 'OC_COMPRAR.DES_GENERICO'
      Size = 80
    end
    object IBQ_AComprarEditaCOD_APLICACAO: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Aplic'
      FieldName = 'COD_APLICACAO'
      Origin = 'OC_COMPRAR.COD_APLICACAO'
      Size = 4
    end
    object IBQ_AComprarEditaDES_APLICACAO: TIBStringField
      DisplayLabel = 'Aplica'#231#227'o'
      FieldName = 'DES_APLICACAO'
      Origin = 'OC_COMPRAR.DES_APLICACAO'
      Size = 30
    end
    object IBQ_AComprarEditaCOD_REFERENCIA: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Refer'#234'ncia'
      FieldName = 'COD_REFERENCIA'
      Origin = 'OC_COMPRAR.COD_REFERENCIA'
      Size = 15
    end
    object IBQ_AComprarEditaCLA_CURVA_ABC: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Curva ABC'
      FieldName = 'CLA_CURVA_ABC'
      Origin = 'OC_COMPRAR.CLA_CURVA_ABC'
      Size = 1
    end
    object IBQ_AComprarEditaCOD_FAMILIA_PRECO: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Fam Pre'#231'o'
      FieldName = 'COD_FAMILIA_PRECO'
      Origin = 'OC_COMPRAR.COD_FAMILIA_PRECO'
      Size = 4
    end
    object IBQ_AComprarEditaDES_FAMILIA_PRECO: TIBStringField
      DisplayLabel = 'Fam'#237'lia Pre'#231'o'
      FieldName = 'DES_FAMILIA_PRECO'
      Origin = 'OC_COMPRAR.DES_FAMILIA_PRECO'
      Size = 40
    end
    object IBQ_AComprarEditaDTA_ULT_COMPRA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dta Ult Compra'
      FieldName = 'DTA_ULT_COMPRA'
      Origin = 'OC_COMPRAR.DTA_ULT_COMPRA'
    end
    object IBQ_AComprarEditaCOD_FOR_ULT_COMPRA: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Forn Ult Compra'
      FieldName = 'COD_FOR_ULT_COMPRA'
      Origin = 'OC_COMPRAR.COD_FOR_ULT_COMPRA'
      Size = 6
    end
    object IBQ_AComprarEditaDES_FOR_ULT_COMPRA: TIBStringField
      DisplayLabel = 'Fornecedor Ult Compra'
      FieldName = 'DES_FOR_ULT_COMPRA'
      Origin = 'OC_COMPRAR.DES_FOR_ULT_COMPRA'
      Size = 40
    end
    object IBQ_AComprarEditaQTD_ULT_COMPRA: TIBBCDField
      DisplayLabel = 'Qtd Ult Compra'
      FieldName = 'QTD_ULT_COMPRA'
      Origin = 'OC_COMPRAR.QTD_ULT_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_UNI_ULT_COMPRA: TIBBCDField
      DisplayLabel = 'Vlr Unit Ult Compra'
      FieldName = 'VLR_UNI_ULT_COMPRA'
      Origin = 'OC_COMPRAR.VLR_UNI_ULT_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_TOT_ULT_COMPRA: TIBBCDField
      DisplayLabel = 'Vlr Tot Ult Compra'
      FieldName = 'VLR_TOT_ULT_COMPRA'
      Origin = 'OC_COMPRAR.VLR_TOT_ULT_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_UNI_COMPRA: TIBBCDField
      DisplayLabel = 'Vlr Unit Compra'
      FieldName = 'VLR_UNI_COMPRA'
      Origin = 'OC_COMPRAR.VLR_UNI_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaPER_DESCONTO: TIBBCDField
      DisplayLabel = 'Per Desc'
      FieldName = 'PER_DESCONTO'
      Origin = 'OC_COMPRAR.PER_DESCONTO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaDTA_ULT_VENDA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dta Ult Venda'
      FieldName = 'DTA_ULT_VENDA'
      Origin = 'OC_COMPRAR.DTA_ULT_VENDA'
    end
    object IBQ_AComprarEditaDES_CLI_ULT_VENDA: TIBStringField
      DisplayLabel = 'Cliente Ult Venda'
      FieldName = 'DES_CLI_ULT_VENDA'
      Origin = 'OC_COMPRAR.DES_CLI_ULT_VENDA'
      Size = 40
    end
    object IBQ_AComprarEditaCOD_CLI_ULT_VENDA: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Cli Ult Venda'
      FieldName = 'COD_CLI_ULT_VENDA'
      Origin = 'OC_COMPRAR.COD_CLI_ULT_VENDA'
      Size = 6
    end
    object IBQ_AComprarEditaQTD_ULT_VENDA: TIBBCDField
      DisplayLabel = 'Qtd Ult Venda'
      FieldName = 'QTD_ULT_VENDA'
      Origin = 'OC_COMPRAR.QTD_ULT_VENDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_UNI_ULT_VENDA: TIBBCDField
      DisplayLabel = 'Vlr Unit Ult Venda'
      FieldName = 'VLR_UNI_ULT_VENDA'
      Origin = 'OC_COMPRAR.VLR_UNI_ULT_VENDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_TOT_ULT_VENDA: TIBBCDField
      DisplayLabel = 'Vlr Tot Ult Venda'
      FieldName = 'VLR_TOT_ULT_VENDA'
      Origin = 'OC_COMPRAR.VLR_TOT_ULT_VENDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_UNI_VENDA: TIBBCDField
      DisplayLabel = 'Vlr Unit Venda'
      FieldName = 'VLR_UNI_VENDA'
      Origin = 'OC_COMPRAR.VLR_UNI_VENDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaCOD_LISTA_VENDA: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Lista Venda'
      FieldName = 'COD_LISTA_VENDA'
      Origin = 'OC_COMPRAR.COD_LISTA_VENDA'
      Size = 4
    end
    object IBQ_AComprarEditaDES_LISTA_VENDA: TIBStringField
      DisplayLabel = 'Lista Venda'
      FieldName = 'DES_LISTA_VENDA'
      Origin = 'OC_COMPRAR.DES_LISTA_VENDA'
      Size = 30
    end
    object IBQ_AComprarEditaCOD_LISTA_COMPRA: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Lista Compra'
      FieldName = 'COD_LISTA_COMPRA'
      Origin = 'OC_COMPRAR.COD_LISTA_COMPRA'
      Size = 4
    end
    object IBQ_AComprarEditaDES_LISTA_COMPRA: TIBStringField
      DisplayLabel = 'Lista Compra'
      FieldName = 'DES_LISTA_COMPRA'
      Origin = 'OC_COMPRAR.DES_LISTA_COMPRA'
      Size = 30
    end
    object IBQ_AComprarEditaVLR_CUSTO_MEDIO: TIBBCDField
      DisplayLabel = 'Vlr Custo M'#233'dio'
      FieldName = 'VLR_CUSTO_MEDIO'
      Origin = 'OC_COMPRAR.VLR_CUSTO_MEDIO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_TOT_VENDA: TIBBCDField
      DisplayLabel = 'Vlr Tot Venda'
      FieldName = 'VLR_TOT_VENDA'
      Origin = 'OC_COMPRAR.VLR_TOT_VENDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_TOT_COMPRA: TIBBCDField
      DisplayLabel = 'Vlr Tot Compra'
      FieldName = 'VLR_TOT_COMPRA'
      Origin = 'OC_COMPRAR.VLR_TOT_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_BRUTO: TIBBCDField
      FieldName = 'VLR_BRUTO'
      Origin = 'OC_COMPRAR.VLR_BRUTO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_DESCONTOS: TIBBCDField
      DisplayLabel = 'Vlr Desc'
      FieldName = 'VLR_DESCONTOS'
      Origin = 'OC_COMPRAR.VLR_DESCONTOS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_DESPESAS: TIBBCDField
      DisplayLabel = 'Vlr Desp'
      FieldName = 'VLR_DESPESAS'
      Origin = 'OC_COMPRAR.VLR_DESPESAS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_FRETE: TIBBCDField
      DisplayLabel = 'Vlr Frete'
      FieldName = 'VLR_FRETE'
      Origin = 'OC_COMPRAR.VLR_FRETE'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaIND_SOMA_IPI_BASE_ICMS: TIBStringField
      Alignment = taCenter
      FieldName = 'IND_SOMA_IPI_BASE_ICMS'
      Origin = 'OC_COMPRAR.IND_SOMA_IPI_BASE_ICMS'
      Size = 1
    end
    object IBQ_AComprarEditaIND_SOMA_FRETE_BASE_ICMS: TIBStringField
      Alignment = taCenter
      FieldName = 'IND_SOMA_FRETE_BASE_ICMS'
      Origin = 'OC_COMPRAR.IND_SOMA_FRETE_BASE_ICMS'
      Size = 1
    end
    object IBQ_AComprarEditaIND_SOMA_DESPESA_BASE_ICMS: TIBStringField
      Alignment = taCenter
      FieldName = 'IND_SOMA_DESPESA_BASE_ICMS'
      Origin = 'OC_COMPRAR.IND_SOMA_DESPESA_BASE_ICMS'
      Size = 1
    end
    object IBQ_AComprarEditaIND_SOMA_IPI_BASE_ST: TIBStringField
      Alignment = taCenter
      FieldName = 'IND_SOMA_IPI_BASE_ST'
      Origin = 'OC_COMPRAR.IND_SOMA_IPI_BASE_ST'
      Size = 1
    end
    object IBQ_AComprarEditaIND_SOMA_FRETE_BASE_ST: TIBStringField
      Alignment = taCenter
      FieldName = 'IND_SOMA_FRETE_BASE_ST'
      Origin = 'OC_COMPRAR.IND_SOMA_FRETE_BASE_ST'
      Size = 1
    end
    object IBQ_AComprarEditaIND_SOMA_DESPESA_BASE_ST: TIBStringField
      Alignment = taCenter
      FieldName = 'IND_SOMA_DESPESA_BASE_ST'
      Origin = 'OC_COMPRAR.IND_SOMA_DESPESA_BASE_ST'
      Size = 1
    end
    object IBQ_AComprarEditaCOD_SIT_TRIBUTARIA: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Sit Trib'
      FieldName = 'COD_SIT_TRIBUTARIA'
      Origin = 'OC_COMPRAR.COD_SIT_TRIBUTARIA'
      Size = 2
    end
    object IBQ_AComprarEditaCOD_IPI: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod IPI'
      FieldName = 'COD_IPI'
      Origin = 'OC_COMPRAR.COD_IPI'
      Size = 2
    end
    object IBQ_AComprarEditaIND_IPI: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Ind IPI'
      FieldName = 'IND_IPI'
      Origin = 'OC_COMPRAR.IND_IPI'
      Size = 1
    end
    object IBQ_AComprarEditaPER_IPI: TIBBCDField
      DisplayLabel = 'Per IPI'
      FieldName = 'PER_IPI'
      Origin = 'OC_COMPRAR.PER_IPI'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBQ_AComprarEditaVLR_IPI: TIBBCDField
      DisplayLabel = 'Vlr IPI'
      FieldName = 'VLR_IPI'
      Origin = 'OC_COMPRAR.VLR_IPI'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaCOD_ICMS: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod ICMS'
      FieldName = 'COD_ICMS'
      Origin = 'OC_COMPRAR.COD_ICMS'
      Size = 2
    end
    object IBQ_AComprarEditaPER_REDUCAO_ICMS: TIBBCDField
      DisplayLabel = 'Per Red ICMS'
      FieldName = 'PER_REDUCAO_ICMS'
      Origin = 'OC_COMPRAR.PER_REDUCAO_ICMS'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBQ_AComprarEditaVLR_REDUCAO_ICMS: TIBBCDField
      DisplayLabel = 'Vlr Red ICMS'
      FieldName = 'VLR_REDUCAO_ICMS'
      Origin = 'OC_COMPRAR.VLR_REDUCAO_ICMS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_BASE_ICMS: TIBBCDField
      DisplayLabel = 'Vlr Base ICMS'
      FieldName = 'VLR_BASE_ICMS'
      Origin = 'OC_COMPRAR.VLR_BASE_ICMS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaPER_ICMS: TIBBCDField
      DisplayLabel = 'Per ICMS'
      FieldName = 'PER_ICMS'
      Origin = 'OC_COMPRAR.PER_ICMS'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBQ_AComprarEditaVLR_ICMS: TIBBCDField
      DisplayLabel = 'Vlr ICMS'
      FieldName = 'VLR_ICMS'
      Origin = 'OC_COMPRAR.VLR_ICMS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaCOD_GRUPO_ST: TIntegerField
      DisplayLabel = 'Cod Gr ST'
      FieldName = 'COD_GRUPO_ST'
      Origin = 'OC_COMPRAR.COD_GRUPO_ST'
    end
    object IBQ_AComprarEditaDES_GRUPO_ST: TIBStringField
      DisplayLabel = 'Grupo ST'
      FieldName = 'DES_GRUPO_ST'
      Origin = 'OC_COMPRAR.DES_GRUPO_ST'
      Size = 30
    end
    object IBQ_AComprarEditaPER_MARGEM_ST: TIBBCDField
      DisplayLabel = 'Per Margem ST'
      FieldName = 'PER_MARGEM_ST'
      Origin = 'OC_COMPRAR.PER_MARGEM_ST'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 4
    end
    object IBQ_AComprarEditaIND_ST: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Ind ST'
      FieldName = 'IND_ST'
      Origin = 'OC_COMPRAR.IND_ST'
      Size = 1
    end
    object IBQ_AComprarEditaVLR_BASE_ST: TIBBCDField
      DisplayLabel = 'Vlr Base ST'
      FieldName = 'VLR_BASE_ST'
      Origin = 'OC_COMPRAR.VLR_BASE_ST'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaPER_ST: TIBBCDField
      DisplayLabel = 'Per ST'
      FieldName = 'PER_ST'
      Origin = 'OC_COMPRAR.PER_ST'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBQ_AComprarEditaVLR_ST: TIBBCDField
      DisplayLabel = 'Vlr ST'
      FieldName = 'VLR_ST'
      Origin = 'OC_COMPRAR.VLR_ST'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaPER_REPASSE: TIBBCDField
      DisplayLabel = 'Per Repasse'
      FieldName = 'PER_REPASSE'
      Origin = 'OC_COMPRAR.PER_REPASSE'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBQ_AComprarEditaVLR_REPASSE: TIBBCDField
      DisplayLabel = 'Vlr Repasse'
      FieldName = 'VLR_REPASSE'
      Origin = 'OC_COMPRAR.VLR_REPASSE'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaCOD_COMPROVANTE_ICMS: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Comprovante ICMS'
      FieldName = 'COD_COMPROVANTE_ICMS'
      Origin = 'OC_COMPRAR.COD_COMPROVANTE_ICMS'
      Size = 3
    end
    object IBQ_AComprarEditaCOD_REFERENCIA_FORN: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Referencia Forn'
      FieldName = 'COD_REFERENCIA_FORN'
      Origin = 'OC_COMPRAR.COD_REFERENCIA_FORN'
      Size = 14
    end
    object IBQ_AComprarEditaCOD_FORNECEDOR: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Forn'
      FieldName = 'COD_FORNECEDOR'
      Origin = 'OC_COMPRAR.COD_FORNECEDOR'
      Size = 6
    end
    object IBQ_AComprarEditaDES_FORNECEDOR: TIBStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'DES_FORNECEDOR'
      Origin = 'OC_COMPRAR.DES_FORNECEDOR'
      Size = 40
    end
    object IBQ_AComprarEditaTIP_PESSOA: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Tipo Pessoa'
      FieldName = 'TIP_PESSOA'
      Origin = 'OC_COMPRAR.TIP_PESSOA'
      Size = 1
    end
    object IBQ_AComprarEditaDES_EMAIL: TIBStringField
      DisplayLabel = 'E-Mail'
      FieldName = 'DES_EMAIL'
      Origin = 'OC_COMPRAR.DES_EMAIL'
      Size = 80
    end
    object IBQ_AComprarEditaQTD_NR_DIAS: TIntegerField
      DisplayLabel = 'Nr Dias'
      FieldName = 'QTD_NR_DIAS'
      Origin = 'OC_COMPRAR.QTD_NR_DIAS'
    end
    object IBQ_AComprarEditaQTD_NR_MESES: TIntegerField
      DisplayLabel = 'Nr Meses'
      FieldName = 'QTD_NR_MESES'
      Origin = 'OC_COMPRAR.QTD_NR_MESES'
    end
    object IBQ_AComprarEditaQTD_TOT_MESES: TIntegerField
      DisplayLabel = 'Total Meses'
      FieldName = 'QTD_TOT_MESES'
      Origin = 'OC_COMPRAR.QTD_TOT_MESES'
    end
    object IBQ_AComprarEditaCOD_COMPRADOR: TIntegerField
      FieldName = 'COD_COMPRADOR'
      Origin = 'OC_COMPRAR.COD_COMPRADOR'
    end
    object IBQ_AComprarEditaBLOB_TEXTO: TMemoField
      FieldName = 'BLOB_TEXTO'
      Origin = 'OC_COMPRAR.BLOB_TEXTO'
      BlobType = ftMemo
      Size = 8
    end
    object IBQ_AComprarEditaIND_TRANSF: TIBStringField
      FieldName = 'IND_TRANSF'
      Origin = 'OC_COMPRAR.IND_TRANSF'
      Size = 1
    end
    object IBQ_AComprarEditaDTA_LIM_TRANSF: TDateField
      FieldName = 'DTA_LIM_TRANSF'
      Origin = 'OC_COMPRAR.DTA_LIM_TRANSF'
    end
    object IBQ_AComprarEditaIND_USAR: TIBStringField
      FieldName = 'IND_USAR'
      Origin = 'OC_COMPRAR.IND_USAR'
      Size = 3
    end
    object IBQ_AComprarEditaIND_QTD_ACIMA: TIBBCDField
      FieldName = 'IND_QTD_ACIMA'
      Origin = 'OC_COMPRAR.IND_QTD_ACIMA'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_SUGERIDA_ANO: TIBBCDField
      DisplayLabel = 'Sug. ANO'
      FieldName = 'QTD_SUGERIDA_ANO'
      Origin = 'OC_COMPRAR.QTD_SUGERIDA_ANO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_TRANSF_PERIODO: TIBBCDField
      DisplayLabel = 'Transf Per'#237'odo'
      FieldName = 'QTD_TRANSF_PERIODO'
      Origin = 'OC_COMPRAR.QTD_TRANSF_PERIODO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_TRANSF_ANO: TIBBCDField
      DisplayLabel = 'Transf Ano'
      FieldName = 'QTD_TRANSF_ANO'
      Origin = 'OC_COMPRAR.QTD_TRANSF_ANO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaEST_MINIMO: TIBBCDField
      DisplayLabel = 'Est. M'#237'nimo'
      FieldName = 'EST_MINIMO'
      Origin = 'OC_COMPRAR.EST_MINIMO'
      DisplayFormat = '0,'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaDIAS_ESTOCAGEM: TIntegerField
      DisplayLabel = 'Dias Estocagem'
      FieldName = 'DIAS_ESTOCAGEM'
      Origin = 'OC_COMPRAR.DIAS_ESTOCAGEM'
      DisplayFormat = '0,'
    end
    object IBQ_AComprarEditaQTD_DEMANDA_DIA: TIBBCDField
      FieldName = 'QTD_DEMANDA_DIA'
      Origin = 'OC_COMPRAR.QTD_DEMANDA_DIA'
      Precision = 18
      Size = 4
    end
    object IBQ_AComprarEditaQTD_DEMANDA_ANO: TIBBCDField
      FieldName = 'QTD_DEMANDA_ANO'
      Origin = 'OC_COMPRAR.QTD_DEMANDA_ANO'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_DIAS_ANO: TIntegerField
      FieldName = 'QTD_DIAS_ANO'
      Origin = 'OC_COMPRAR.QTD_DIAS_ANO'
    end
    object IBQ_AComprarEditaDATAINCLUSAO: TDateField
      DisplayLabel = 'Inclus'#227'o'
      FieldName = 'DATAINCLUSAO'
      Origin = 'OC_COMPRAR.DATAINCLUSAO'
    end
    object IBQ_AComprarEditaESTADO: TIBStringField
      DisplayLabel = 'UF'
      FieldName = 'ESTADO'
      Origin = 'OC_COMPRAR.ESTADO'
      FixedChar = True
      Size = 2
    end
    object IBQ_AComprarEditaDATAALTERACAO: TDateField
      FieldName = 'DATAALTERACAO'
      Origin = 'OC_COMPRAR.DATAALTERACAO'
    end
    object IBQ_AComprarEditaIND_TRANSF_CD: TIBStringField
      FieldName = 'IND_TRANSF_CD'
      Origin = 'OC_COMPRAR.IND_TRANSF_CD'
      FixedChar = True
      Size = 1
    end
    object IBQ_AComprarEditaDOC_TRANSF_CD: TIntegerField
      FieldName = 'DOC_TRANSF_CD'
      Origin = 'OC_COMPRAR.DOC_TRANSF_CD'
    end
  end
  object IBU_AComprarEdita: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from oc_comprar '
      'where'
      '  NUM_SEQ = :NUM_SEQ'
      ' and  NUM_DOCUMENTO = :NUM_DOCUMENTO')
    ModifySQL.Strings = (
      'update oc_comprar'
      'set'
      '  QTD_SUGERIDA = :QTD_SUGERIDA,'
      '  QTD_ACOMPRAR = :QTD_ACOMPRAR,'
      '  QTD_TRANSF = :QTD_TRANSF,'
      '  EST_MINIMO = :EST_MINIMO,'
      '  VLR_UNI_COMPRA = :VLR_UNI_COMPRA,'
      '  PER_DESCONTO = :PER_DESCONTO,'
      '  VLR_DESCONTOS=((QTD_ACOMPRAR*VLR_UNI_COMPRA)*'
      '(PER_DESCONTO/100)),'
      '  VLR_BRUTO=(QTD_ACOMPRAR*VLR_UNI_COMPRA)-VLR_DESCONTOS,'
      '  VLR_BASE_ICMS=VLR_BRUTO,'
      
        '  VLR_ICMS=Cast(((VLR_BASE_ICMS*PER_ICMS)/100) as Numeric(12,2))' +
        ','
      '  VLR_IPI=Cast(((VLR_BRUTO*PER_IPI)/100) as Numeric(12,2)),'
      
        '  VLR_BASE_ST=VLR_BRUTO+(Cast(((VLR_BRUTO*PER_MARGEM_ST)/100) as' +
        ' '
      'Numeric(12,2))),'
      
        '  VLR_ST=(Cast(((VLR_BASE_ST*PER_ST)/100) as Numeric(12,2))-VLR_' +
        'ICMS),'
      '  VLR_TOT_COMPRA=VLR_BRUTO+VLR_ST+VLR_IPI,'
      '  VLR_TOT_ULT_VENDA=QTD_ACOMPRAR*VLR_UNI_VENDA,'
      '  BLOB_TEXTO = :BLOB_TEXTO'
      'where'
      '  NUM_SEQ = :NUM_SEQ'
      '  and NUM_DOCUMENTO = :NUM_DOCUMENTO')
    InsertSQL.Strings = (
      'insert into oc_comprar'
      
        '  (NUM_SEQ, NUM_DOCUMENTO, DTA_DOCUMENTO, IND_OC_GERADA, DTA_OC_' +
        'GERADA, '
      
        '   NUM_OC_GERADA, OBS_OC, COD_EMPRESA, DES_EMPRESA, COD_ITEM, DE' +
        'S_ITEM, '
      
        '   QTD_SUGERIDA, QTD_ACOMPRAR, QTD_SALDO, QTD_TRANSITO, QTD_DISP' +
        'ONIVEL, '
      
        '   QTD_MEDIA_MES, QTD_MEDIA_DIA, QTD_DEM_MES1, QTD_DEM_MES2, QTD' +
        '_DEM_MES3, '
      
        '   QTD_DEM_MES4, QTD_DEM_MES5, QTD_DEM_MES6, QTD_DEM_MES7, QTD_D' +
        'EM_MES8, '
      
        '   UNI_COMPRA, UNI_VENDA, COD_BARRAS, COD_GRUPO, DES_GRUPO, COD_' +
        'SUBGRUPO, '
      
        '   DES_SUBGRUPO, DES_GENERICO, COD_APLICACAO, DES_APLICACAO, COD' +
        '_REFERENCIA, '
      
        '   CLA_CURVA_ABC, COD_FAMILIA_PRECO, DES_FAMILIA_PRECO, DTA_ULT_' +
        'COMPRA, '
      
        '   COD_FOR_ULT_COMPRA, DES_FOR_ULT_COMPRA, QTD_ULT_COMPRA, VLR_U' +
        'NI_ULT_COMPRA, '
      
        '   VLR_TOT_ULT_COMPRA, VLR_UNI_COMPRA, PER_DESCONTO, DTA_ULT_VEN' +
        'DA, COD_CLI_ULT_VENDA, '
      
        '   DES_CLI_ULT_VENDA, QTD_ULT_VENDA, VLR_UNI_ULT_VENDA, VLR_TOT_' +
        'ULT_VENDA, '
      
        '   VLR_UNI_VENDA, COD_LISTA_VENDA, DES_LISTA_VENDA, COD_LISTA_CO' +
        'MPRA, DES_LISTA_COMPRA, '
      
        '   VLR_CUSTO_MEDIO, VLR_TOT_VENDA, VLR_TOT_COMPRA, VLR_BRUTO, VL' +
        'R_DESCONTOS, '
      
        '   VLR_DESPESAS, VLR_FRETE, IND_SOMA_IPI_BASE_ICMS, IND_SOMA_FRE' +
        'TE_BASE_ICMS, '
      
        '   IND_SOMA_DESPESA_BASE_ICMS, IND_SOMA_IPI_BASE_ST, IND_SOMA_FR' +
        'ETE_BASE_ST, '
      
        '   IND_SOMA_DESPESA_BASE_ST, COD_SIT_TRIBUTARIA, COD_IPI, IND_IP' +
        'I, PER_IPI, '
      
        '   VLR_IPI, COD_ICMS, PER_REDUCAO_ICMS, VLR_REDUCAO_ICMS, VLR_BA' +
        'SE_ICMS, '
      
        '   PER_ICMS, VLR_ICMS, COD_GRUPO_ST, DES_GRUPO_ST, PER_MARGEM_ST' +
        ', IND_ST, '
      
        '   VLR_BASE_ST, PER_ST, VLR_ST, PER_REPASSE, VLR_REPASSE, COD_CO' +
        'MPROVANTE_ICMS, '
      
        '   COD_REFERENCIA_FORN, COD_FORNECEDOR, DES_FORNECEDOR, TIP_PESS' +
        'OA, DES_EMAIL, '
      
        '   QTD_NR_DIAS, QTD_NR_MESES, QTD_TOT_MESES, COD_COMPRADOR, BLOB' +
        '_TEXTO, '
      
        '   IND_TRANSF, DTA_LIM_TRANSF, QTD_TRANSF, IND_USAR, IND_QTD_ACI' +
        'MA,'
      
        '  QTD_SUGERIDA_ANO, QTD_TRANSF_PERIODO, QTD_TRANSF_ANO, EST_MINI' +
        'MO, '
      
        '  DIAS_ESTOCAGEM, QTD_DEMANDA_DIA, QTD_DEMANDA_ANO, QTD_DIAS_ANO' +
        ','
      '  DATAINCLUSAO, ESTADO, DATAALTERACAO)'
      'values'
      
        '  (:NUM_SEQ, :NUM_DOCUMENTO, :DTA_DOCUMENTO, :IND_OC_GERADA, :DT' +
        'A_OC_GERADA, '
      
        '   :NUM_OC_GERADA, :OBS_OC, :COD_EMPRESA, :DES_EMPRESA, :COD_ITE' +
        'M, :DES_ITEM, '
      
        '   :QTD_SUGERIDA, :QTD_ACOMPRAR, :QTD_SALDO, :QTD_TRANSITO, :QTD' +
        '_DISPONIVEL, '
      
        '   :QTD_MEDIA_MES, :QTD_MEDIA_DIA, :QTD_DEM_MES1, :QTD_DEM_MES2,' +
        ' :QTD_DEM_MES3, '
      
        '   :QTD_DEM_MES4, :QTD_DEM_MES5, :QTD_DEM_MES6, :QTD_DEM_MES7, :' +
        'QTD_DEM_MES8, '
      
        '   :UNI_COMPRA, :UNI_VENDA, :COD_BARRAS, :COD_GRUPO, :DES_GRUPO,' +
        ' :COD_SUBGRUPO, '
      
        '   :DES_SUBGRUPO, :DES_GENERICO, :COD_APLICACAO, :DES_APLICACAO,' +
        ' :COD_REFERENCIA, '
      
        '   :CLA_CURVA_ABC, :COD_FAMILIA_PRECO, :DES_FAMILIA_PRECO, :DTA_' +
        'ULT_COMPRA, '
      
        '   :COD_FOR_ULT_COMPRA, :DES_FOR_ULT_COMPRA, :QTD_ULT_COMPRA, :V' +
        'LR_UNI_ULT_COMPRA, '
      
        '   :VLR_TOT_ULT_COMPRA, :VLR_UNI_COMPRA, :PER_DESCONTO, :DTA_ULT' +
        '_VENDA, '
      
        '   :COD_CLI_ULT_VENDA, :DES_CLI_ULT_VENDA, :QTD_ULT_VENDA, :VLR_' +
        'UNI_ULT_VENDA, '
      
        '   :VLR_TOT_ULT_VENDA, :VLR_UNI_VENDA, :COD_LISTA_VENDA, :DES_LI' +
        'STA_VENDA, '
      
        '   :COD_LISTA_COMPRA, :DES_LISTA_COMPRA, :VLR_CUSTO_MEDIO, :VLR_' +
        'TOT_VENDA, '
      
        '   :VLR_TOT_COMPRA, :VLR_BRUTO, :VLR_DESCONTOS, :VLR_DESPESAS, :' +
        'VLR_FRETE, '
      
        '   :IND_SOMA_IPI_BASE_ICMS, :IND_SOMA_FRETE_BASE_ICMS, :IND_SOMA' +
        '_DESPESA_BASE_ICMS, '
      
        '   :IND_SOMA_IPI_BASE_ST, :IND_SOMA_FRETE_BASE_ST, :IND_SOMA_DES' +
        'PESA_BASE_ST, '
      
        '   :COD_SIT_TRIBUTARIA, :COD_IPI, :IND_IPI, :PER_IPI, :VLR_IPI, ' +
        ':COD_ICMS, :PER_REDUCAO_ICMS, '
      
        '   :VLR_REDUCAO_ICMS, :VLR_BASE_ICMS, :PER_ICMS, :VLR_ICMS, :COD' +
        '_GRUPO_ST, '
      
        '   :DES_GRUPO_ST, :PER_MARGEM_ST, :IND_ST, :VLR_BASE_ST,    :PER' +
        '_ST, :VLR_ST,'
      
        '   :PER_REPASSE, :VLR_REPASSE, :COD_COMPROVANTE_ICMS, :COD_REFER' +
        'ENCIA_FORN, '
      '   :COD_FORNECEDOR, :DES_FORNECEDOR, :TIP_PESSOA, :DES_EMAIL, '
      
        '   :QTD_NR_DIAS, :QTD_NR_MESES, :QTD_TOT_MESES, :COD_COMPRADOR, ' +
        ':BLOB_TEXTO, '
      
        '   :IND_TRANSF, :DTA_LIM_TRANSF, :QTD_TRANSF, :IND_USAR, :IND_QT' +
        'D_ACIMA,'
      
        '   :QTD_SUGERIDA_ANO, :QTD_TRANSF_PERIODO, :QTD_TRANSF_ANO, :EST' +
        '_MINIMO, '
      
        '   :DIAS_ESTOCAGEM, :QTD_DEMANDA_DIA, :QTD_DEMANDA_ANO, :QTD_DIA' +
        'S_ANO,'
      '   :DATAINCLUSAO, :ESTADO, :DATAALTERACAO)'
      ''
      ''
      '')
    DeleteSQL.Strings = (
      'delete from oc_comprar'
      'where'
      '  NUM_SEQ = :NUM_SEQ'
      '  and NUM_DOCUMENTO = :NUM_DOCUMENTO')
    Left = 823
    Top = 262
  end
  object IBQ_OC_ComprarAdd: TIBQuery
    Database = DMBelShopPedidos.IBDB_BelShop
    Transaction = DMBelShopPedidos.IBT_BelShop
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select *'
      'From oc_comprar oc'
      'Where oc.num_documento<1')
    UpdateObject = IBUP_OC_ComprarAdd
    Left = 775
    Top = 312
    object IBQ_OC_ComprarAddNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
      Origin = 'OC_COMPRAR.NUM_SEQ'
      Required = True
    end
    object IBQ_OC_ComprarAddNUM_DOCUMENTO: TIntegerField
      FieldName = 'NUM_DOCUMENTO'
      Origin = 'OC_COMPRAR.NUM_DOCUMENTO'
      Required = True
    end
    object IBQ_OC_ComprarAddDTA_DOCUMENTO: TDateTimeField
      FieldName = 'DTA_DOCUMENTO'
      Origin = 'OC_COMPRAR.DTA_DOCUMENTO'
    end
    object IBQ_OC_ComprarAddIND_OC_GERADA: TIBStringField
      FieldName = 'IND_OC_GERADA'
      Origin = 'OC_COMPRAR.IND_OC_GERADA'
      Size = 1
    end
    object IBQ_OC_ComprarAddDTA_OC_GERADA: TDateTimeField
      FieldName = 'DTA_OC_GERADA'
      Origin = 'OC_COMPRAR.DTA_OC_GERADA'
    end
    object IBQ_OC_ComprarAddNUM_OC_GERADA: TIntegerField
      FieldName = 'NUM_OC_GERADA'
      Origin = 'OC_COMPRAR.NUM_OC_GERADA'
    end
    object IBQ_OC_ComprarAddOBS_OC: TIBStringField
      FieldName = 'OBS_OC'
      Origin = 'OC_COMPRAR.OBS_OC'
      Size = 2000
    end
    object IBQ_OC_ComprarAddCOD_EMPRESA: TIBStringField
      FieldName = 'COD_EMPRESA'
      Origin = 'OC_COMPRAR.COD_EMPRESA'
      Size = 6
    end
    object IBQ_OC_ComprarAddDES_EMPRESA: TIBStringField
      FieldName = 'DES_EMPRESA'
      Origin = 'OC_COMPRAR.DES_EMPRESA'
      Size = 60
    end
    object IBQ_OC_ComprarAddCOD_ITEM: TIBStringField
      FieldName = 'COD_ITEM'
      Origin = 'OC_COMPRAR.COD_ITEM'
      Size = 6
    end
    object IBQ_OC_ComprarAddDES_ITEM: TIBStringField
      FieldName = 'DES_ITEM'
      Origin = 'OC_COMPRAR.DES_ITEM'
      Size = 80
    end
    object IBQ_OC_ComprarAddQTD_SUGERIDA: TIBBCDField
      FieldName = 'QTD_SUGERIDA'
      Origin = 'OC_COMPRAR.QTD_SUGERIDA'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddQTD_ACOMPRAR: TIBBCDField
      FieldName = 'QTD_ACOMPRAR'
      Origin = 'OC_COMPRAR.QTD_ACOMPRAR'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddQTD_SALDO: TIBBCDField
      FieldName = 'QTD_SALDO'
      Origin = 'OC_COMPRAR.QTD_SALDO'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddQTD_TRANSITO: TIBBCDField
      FieldName = 'QTD_TRANSITO'
      Origin = 'OC_COMPRAR.QTD_TRANSITO'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddQTD_DISPONIVEL: TIBBCDField
      FieldName = 'QTD_DISPONIVEL'
      Origin = 'OC_COMPRAR.QTD_DISPONIVEL'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddQTD_MEDIA_MES: TIBBCDField
      FieldName = 'QTD_MEDIA_MES'
      Origin = 'OC_COMPRAR.QTD_MEDIA_MES'
      Precision = 18
      Size = 4
    end
    object IBQ_OC_ComprarAddQTD_MEDIA_DIA: TIBBCDField
      FieldName = 'QTD_MEDIA_DIA'
      Origin = 'OC_COMPRAR.QTD_MEDIA_DIA'
      Precision = 18
      Size = 4
    end
    object IBQ_OC_ComprarAddQTD_DEM_MES1: TIBBCDField
      FieldName = 'QTD_DEM_MES1'
      Origin = 'OC_COMPRAR.QTD_DEM_MES1'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddQTD_DEM_MES2: TIBBCDField
      FieldName = 'QTD_DEM_MES2'
      Origin = 'OC_COMPRAR.QTD_DEM_MES2'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddQTD_DEM_MES3: TIBBCDField
      FieldName = 'QTD_DEM_MES3'
      Origin = 'OC_COMPRAR.QTD_DEM_MES3'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddQTD_DEM_MES4: TIBBCDField
      FieldName = 'QTD_DEM_MES4'
      Origin = 'OC_COMPRAR.QTD_DEM_MES4'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddQTD_DEM_MES5: TIBBCDField
      FieldName = 'QTD_DEM_MES5'
      Origin = 'OC_COMPRAR.QTD_DEM_MES5'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddQTD_DEM_MES6: TIBBCDField
      FieldName = 'QTD_DEM_MES6'
      Origin = 'OC_COMPRAR.QTD_DEM_MES6'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddQTD_DEM_MES7: TIBBCDField
      FieldName = 'QTD_DEM_MES7'
      Origin = 'OC_COMPRAR.QTD_DEM_MES7'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddQTD_DEM_MES8: TIBBCDField
      FieldName = 'QTD_DEM_MES8'
      Origin = 'OC_COMPRAR.QTD_DEM_MES8'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddUNI_COMPRA: TIntegerField
      FieldName = 'UNI_COMPRA'
      Origin = 'OC_COMPRAR.UNI_COMPRA'
    end
    object IBQ_OC_ComprarAddUNI_VENDA: TIntegerField
      FieldName = 'UNI_VENDA'
      Origin = 'OC_COMPRAR.UNI_VENDA'
    end
    object IBQ_OC_ComprarAddCOD_BARRAS: TIBStringField
      FieldName = 'COD_BARRAS'
      Origin = 'OC_COMPRAR.COD_BARRAS'
      Size = 19
    end
    object IBQ_OC_ComprarAddCOD_GRUPO: TIBStringField
      FieldName = 'COD_GRUPO'
      Origin = 'OC_COMPRAR.COD_GRUPO'
      Size = 3
    end
    object IBQ_OC_ComprarAddDES_GRUPO: TIBStringField
      FieldName = 'DES_GRUPO'
      Origin = 'OC_COMPRAR.DES_GRUPO'
      Size = 30
    end
    object IBQ_OC_ComprarAddCOD_SUBGRUPO: TIBStringField
      FieldName = 'COD_SUBGRUPO'
      Origin = 'OC_COMPRAR.COD_SUBGRUPO'
      Size = 7
    end
    object IBQ_OC_ComprarAddDES_SUBGRUPO: TIBStringField
      FieldName = 'DES_SUBGRUPO'
      Origin = 'OC_COMPRAR.DES_SUBGRUPO'
      Size = 30
    end
    object IBQ_OC_ComprarAddDES_GENERICO: TIBStringField
      FieldName = 'DES_GENERICO'
      Origin = 'OC_COMPRAR.DES_GENERICO'
      Size = 80
    end
    object IBQ_OC_ComprarAddCOD_APLICACAO: TIBStringField
      FieldName = 'COD_APLICACAO'
      Origin = 'OC_COMPRAR.COD_APLICACAO'
      Size = 4
    end
    object IBQ_OC_ComprarAddDES_APLICACAO: TIBStringField
      FieldName = 'DES_APLICACAO'
      Origin = 'OC_COMPRAR.DES_APLICACAO'
      Size = 30
    end
    object IBQ_OC_ComprarAddCOD_REFERENCIA: TIBStringField
      FieldName = 'COD_REFERENCIA'
      Origin = 'OC_COMPRAR.COD_REFERENCIA'
      Size = 30
    end
    object IBQ_OC_ComprarAddCLA_CURVA_ABC: TIBStringField
      FieldName = 'CLA_CURVA_ABC'
      Origin = 'OC_COMPRAR.CLA_CURVA_ABC'
      Size = 1
    end
    object IBQ_OC_ComprarAddCOD_FAMILIA_PRECO: TIBStringField
      FieldName = 'COD_FAMILIA_PRECO'
      Origin = 'OC_COMPRAR.COD_FAMILIA_PRECO'
      Size = 4
    end
    object IBQ_OC_ComprarAddDES_FAMILIA_PRECO: TIBStringField
      FieldName = 'DES_FAMILIA_PRECO'
      Origin = 'OC_COMPRAR.DES_FAMILIA_PRECO'
      Size = 40
    end
    object IBQ_OC_ComprarAddDTA_ULT_COMPRA: TDateField
      FieldName = 'DTA_ULT_COMPRA'
      Origin = 'OC_COMPRAR.DTA_ULT_COMPRA'
    end
    object IBQ_OC_ComprarAddCOD_FOR_ULT_COMPRA: TIBStringField
      FieldName = 'COD_FOR_ULT_COMPRA'
      Origin = 'OC_COMPRAR.COD_FOR_ULT_COMPRA'
      Size = 6
    end
    object IBQ_OC_ComprarAddDES_FOR_ULT_COMPRA: TIBStringField
      FieldName = 'DES_FOR_ULT_COMPRA'
      Origin = 'OC_COMPRAR.DES_FOR_ULT_COMPRA'
      Size = 40
    end
    object IBQ_OC_ComprarAddQTD_ULT_COMPRA: TIBBCDField
      FieldName = 'QTD_ULT_COMPRA'
      Origin = 'OC_COMPRAR.QTD_ULT_COMPRA'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddVLR_UNI_ULT_COMPRA: TIBBCDField
      FieldName = 'VLR_UNI_ULT_COMPRA'
      Origin = 'OC_COMPRAR.VLR_UNI_ULT_COMPRA'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddVLR_TOT_ULT_COMPRA: TIBBCDField
      FieldName = 'VLR_TOT_ULT_COMPRA'
      Origin = 'OC_COMPRAR.VLR_TOT_ULT_COMPRA'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddVLR_UNI_COMPRA: TIBBCDField
      FieldName = 'VLR_UNI_COMPRA'
      Origin = 'OC_COMPRAR.VLR_UNI_COMPRA'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddPER_DESCONTO: TIBBCDField
      FieldName = 'PER_DESCONTO'
      Origin = 'OC_COMPRAR.PER_DESCONTO'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddDTA_ULT_VENDA: TDateField
      FieldName = 'DTA_ULT_VENDA'
      Origin = 'OC_COMPRAR.DTA_ULT_VENDA'
    end
    object IBQ_OC_ComprarAddCOD_CLI_ULT_VENDA: TIBStringField
      FieldName = 'COD_CLI_ULT_VENDA'
      Origin = 'OC_COMPRAR.COD_CLI_ULT_VENDA'
      Size = 6
    end
    object IBQ_OC_ComprarAddDES_CLI_ULT_VENDA: TIBStringField
      FieldName = 'DES_CLI_ULT_VENDA'
      Origin = 'OC_COMPRAR.DES_CLI_ULT_VENDA'
      Size = 40
    end
    object IBQ_OC_ComprarAddQTD_ULT_VENDA: TIBBCDField
      FieldName = 'QTD_ULT_VENDA'
      Origin = 'OC_COMPRAR.QTD_ULT_VENDA'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddVLR_UNI_ULT_VENDA: TIBBCDField
      FieldName = 'VLR_UNI_ULT_VENDA'
      Origin = 'OC_COMPRAR.VLR_UNI_ULT_VENDA'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddVLR_TOT_ULT_VENDA: TIBBCDField
      FieldName = 'VLR_TOT_ULT_VENDA'
      Origin = 'OC_COMPRAR.VLR_TOT_ULT_VENDA'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddVLR_UNI_VENDA: TIBBCDField
      FieldName = 'VLR_UNI_VENDA'
      Origin = 'OC_COMPRAR.VLR_UNI_VENDA'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddCOD_LISTA_VENDA: TIBStringField
      FieldName = 'COD_LISTA_VENDA'
      Origin = 'OC_COMPRAR.COD_LISTA_VENDA'
      Size = 4
    end
    object IBQ_OC_ComprarAddDES_LISTA_VENDA: TIBStringField
      FieldName = 'DES_LISTA_VENDA'
      Origin = 'OC_COMPRAR.DES_LISTA_VENDA'
      Size = 30
    end
    object IBQ_OC_ComprarAddCOD_LISTA_COMPRA: TIBStringField
      FieldName = 'COD_LISTA_COMPRA'
      Origin = 'OC_COMPRAR.COD_LISTA_COMPRA'
      Size = 4
    end
    object IBQ_OC_ComprarAddDES_LISTA_COMPRA: TIBStringField
      FieldName = 'DES_LISTA_COMPRA'
      Origin = 'OC_COMPRAR.DES_LISTA_COMPRA'
      Size = 30
    end
    object IBQ_OC_ComprarAddVLR_CUSTO_MEDIO: TIBBCDField
      FieldName = 'VLR_CUSTO_MEDIO'
      Origin = 'OC_COMPRAR.VLR_CUSTO_MEDIO'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddVLR_TOT_VENDA: TIBBCDField
      FieldName = 'VLR_TOT_VENDA'
      Origin = 'OC_COMPRAR.VLR_TOT_VENDA'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddVLR_TOT_COMPRA: TIBBCDField
      FieldName = 'VLR_TOT_COMPRA'
      Origin = 'OC_COMPRAR.VLR_TOT_COMPRA'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddVLR_BRUTO: TIBBCDField
      FieldName = 'VLR_BRUTO'
      Origin = 'OC_COMPRAR.VLR_BRUTO'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddVLR_DESCONTOS: TIBBCDField
      FieldName = 'VLR_DESCONTOS'
      Origin = 'OC_COMPRAR.VLR_DESCONTOS'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddVLR_DESPESAS: TIBBCDField
      FieldName = 'VLR_DESPESAS'
      Origin = 'OC_COMPRAR.VLR_DESPESAS'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddVLR_FRETE: TIBBCDField
      FieldName = 'VLR_FRETE'
      Origin = 'OC_COMPRAR.VLR_FRETE'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddIND_SOMA_IPI_BASE_ICMS: TIBStringField
      FieldName = 'IND_SOMA_IPI_BASE_ICMS'
      Origin = 'OC_COMPRAR.IND_SOMA_IPI_BASE_ICMS'
      Size = 1
    end
    object IBQ_OC_ComprarAddIND_SOMA_FRETE_BASE_ICMS: TIBStringField
      FieldName = 'IND_SOMA_FRETE_BASE_ICMS'
      Origin = 'OC_COMPRAR.IND_SOMA_FRETE_BASE_ICMS'
      Size = 1
    end
    object IBQ_OC_ComprarAddIND_SOMA_DESPESA_BASE_ICMS: TIBStringField
      FieldName = 'IND_SOMA_DESPESA_BASE_ICMS'
      Origin = 'OC_COMPRAR.IND_SOMA_DESPESA_BASE_ICMS'
      Size = 1
    end
    object IBQ_OC_ComprarAddIND_SOMA_IPI_BASE_ST: TIBStringField
      FieldName = 'IND_SOMA_IPI_BASE_ST'
      Origin = 'OC_COMPRAR.IND_SOMA_IPI_BASE_ST'
      Size = 1
    end
    object IBQ_OC_ComprarAddIND_SOMA_FRETE_BASE_ST: TIBStringField
      FieldName = 'IND_SOMA_FRETE_BASE_ST'
      Origin = 'OC_COMPRAR.IND_SOMA_FRETE_BASE_ST'
      Size = 1
    end
    object IBQ_OC_ComprarAddIND_SOMA_DESPESA_BASE_ST: TIBStringField
      FieldName = 'IND_SOMA_DESPESA_BASE_ST'
      Origin = 'OC_COMPRAR.IND_SOMA_DESPESA_BASE_ST'
      Size = 1
    end
    object IBQ_OC_ComprarAddCOD_SIT_TRIBUTARIA: TIBStringField
      FieldName = 'COD_SIT_TRIBUTARIA'
      Origin = 'OC_COMPRAR.COD_SIT_TRIBUTARIA'
      Size = 2
    end
    object IBQ_OC_ComprarAddCOD_IPI: TIBStringField
      FieldName = 'COD_IPI'
      Origin = 'OC_COMPRAR.COD_IPI'
      Size = 2
    end
    object IBQ_OC_ComprarAddIND_IPI: TIBStringField
      FieldName = 'IND_IPI'
      Origin = 'OC_COMPRAR.IND_IPI'
      Size = 1
    end
    object IBQ_OC_ComprarAddPER_IPI: TIBBCDField
      FieldName = 'PER_IPI'
      Origin = 'OC_COMPRAR.PER_IPI'
      Precision = 9
      Size = 2
    end
    object IBQ_OC_ComprarAddVLR_IPI: TIBBCDField
      FieldName = 'VLR_IPI'
      Origin = 'OC_COMPRAR.VLR_IPI'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddCOD_ICMS: TIBStringField
      FieldName = 'COD_ICMS'
      Origin = 'OC_COMPRAR.COD_ICMS'
      Size = 2
    end
    object IBQ_OC_ComprarAddPER_REDUCAO_ICMS: TIBBCDField
      FieldName = 'PER_REDUCAO_ICMS'
      Origin = 'OC_COMPRAR.PER_REDUCAO_ICMS'
      Precision = 9
      Size = 2
    end
    object IBQ_OC_ComprarAddVLR_REDUCAO_ICMS: TIBBCDField
      FieldName = 'VLR_REDUCAO_ICMS'
      Origin = 'OC_COMPRAR.VLR_REDUCAO_ICMS'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddVLR_BASE_ICMS: TIBBCDField
      FieldName = 'VLR_BASE_ICMS'
      Origin = 'OC_COMPRAR.VLR_BASE_ICMS'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddPER_ICMS: TIBBCDField
      FieldName = 'PER_ICMS'
      Origin = 'OC_COMPRAR.PER_ICMS'
      Precision = 9
      Size = 2
    end
    object IBQ_OC_ComprarAddVLR_ICMS: TIBBCDField
      FieldName = 'VLR_ICMS'
      Origin = 'OC_COMPRAR.VLR_ICMS'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddCOD_GRUPO_ST: TIntegerField
      FieldName = 'COD_GRUPO_ST'
      Origin = 'OC_COMPRAR.COD_GRUPO_ST'
    end
    object IBQ_OC_ComprarAddDES_GRUPO_ST: TIBStringField
      FieldName = 'DES_GRUPO_ST'
      Origin = 'OC_COMPRAR.DES_GRUPO_ST'
      Size = 30
    end
    object IBQ_OC_ComprarAddPER_MARGEM_ST: TIBBCDField
      FieldName = 'PER_MARGEM_ST'
      Origin = 'OC_COMPRAR.PER_MARGEM_ST'
      Precision = 9
      Size = 4
    end
    object IBQ_OC_ComprarAddIND_ST: TIBStringField
      FieldName = 'IND_ST'
      Origin = 'OC_COMPRAR.IND_ST'
      Size = 1
    end
    object IBQ_OC_ComprarAddVLR_BASE_ST: TIBBCDField
      FieldName = 'VLR_BASE_ST'
      Origin = 'OC_COMPRAR.VLR_BASE_ST'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddPER_ST: TIBBCDField
      FieldName = 'PER_ST'
      Origin = 'OC_COMPRAR.PER_ST'
      Precision = 9
      Size = 2
    end
    object IBQ_OC_ComprarAddVLR_ST: TIBBCDField
      FieldName = 'VLR_ST'
      Origin = 'OC_COMPRAR.VLR_ST'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddPER_REPASSE: TIBBCDField
      FieldName = 'PER_REPASSE'
      Origin = 'OC_COMPRAR.PER_REPASSE'
      Precision = 9
      Size = 2
    end
    object IBQ_OC_ComprarAddVLR_REPASSE: TIBBCDField
      FieldName = 'VLR_REPASSE'
      Origin = 'OC_COMPRAR.VLR_REPASSE'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddCOD_COMPROVANTE_ICMS: TIBStringField
      FieldName = 'COD_COMPROVANTE_ICMS'
      Origin = 'OC_COMPRAR.COD_COMPROVANTE_ICMS'
      Size = 3
    end
    object IBQ_OC_ComprarAddCOD_REFERENCIA_FORN: TIBStringField
      FieldName = 'COD_REFERENCIA_FORN'
      Origin = 'OC_COMPRAR.COD_REFERENCIA_FORN'
      Size = 30
    end
    object IBQ_OC_ComprarAddCOD_FORNECEDOR: TIBStringField
      FieldName = 'COD_FORNECEDOR'
      Origin = 'OC_COMPRAR.COD_FORNECEDOR'
      Size = 6
    end
    object IBQ_OC_ComprarAddDES_FORNECEDOR: TIBStringField
      FieldName = 'DES_FORNECEDOR'
      Origin = 'OC_COMPRAR.DES_FORNECEDOR'
      Size = 40
    end
    object IBQ_OC_ComprarAddTIP_PESSOA: TIBStringField
      FieldName = 'TIP_PESSOA'
      Origin = 'OC_COMPRAR.TIP_PESSOA'
      Size = 1
    end
    object IBQ_OC_ComprarAddDES_EMAIL: TIBStringField
      FieldName = 'DES_EMAIL'
      Origin = 'OC_COMPRAR.DES_EMAIL'
      Size = 80
    end
    object IBQ_OC_ComprarAddQTD_NR_DIAS: TIntegerField
      FieldName = 'QTD_NR_DIAS'
      Origin = 'OC_COMPRAR.QTD_NR_DIAS'
    end
    object IBQ_OC_ComprarAddQTD_NR_MESES: TIntegerField
      FieldName = 'QTD_NR_MESES'
      Origin = 'OC_COMPRAR.QTD_NR_MESES'
    end
    object IBQ_OC_ComprarAddQTD_TOT_MESES: TIntegerField
      FieldName = 'QTD_TOT_MESES'
      Origin = 'OC_COMPRAR.QTD_TOT_MESES'
    end
    object IBQ_OC_ComprarAddCOD_COMPRADOR: TIntegerField
      FieldName = 'COD_COMPRADOR'
      Origin = 'OC_COMPRAR.COD_COMPRADOR'
    end
    object IBQ_OC_ComprarAddBLOB_TEXTO: TMemoField
      FieldName = 'BLOB_TEXTO'
      Origin = 'OC_COMPRAR.BLOB_TEXTO'
      BlobType = ftMemo
      Size = 8
    end
    object IBQ_OC_ComprarAddIND_TRANSF: TIBStringField
      FieldName = 'IND_TRANSF'
      Origin = 'OC_COMPRAR.IND_TRANSF'
      Size = 1
    end
    object IBQ_OC_ComprarAddDTA_LIM_TRANSF: TDateField
      FieldName = 'DTA_LIM_TRANSF'
      Origin = 'OC_COMPRAR.DTA_LIM_TRANSF'
    end
    object IBQ_OC_ComprarAddQTD_TRANSF: TIBBCDField
      FieldName = 'QTD_TRANSF'
      Origin = 'OC_COMPRAR.QTD_TRANSF'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddIND_USAR: TIBStringField
      FieldName = 'IND_USAR'
      Origin = 'OC_COMPRAR.IND_USAR'
      Size = 3
    end
    object IBQ_OC_ComprarAddIND_QTD_ACIMA: TIBBCDField
      FieldName = 'IND_QTD_ACIMA'
      Origin = 'OC_COMPRAR.IND_QTD_ACIMA'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddQTD_SUGERIDA_ANO: TIBBCDField
      FieldName = 'QTD_SUGERIDA_ANO'
      Origin = 'OC_COMPRAR.QTD_SUGERIDA_ANO'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddQTD_TRANSF_PERIODO: TIBBCDField
      FieldName = 'QTD_TRANSF_PERIODO'
      Origin = 'OC_COMPRAR.QTD_TRANSF_PERIODO'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddQTD_TRANSF_ANO: TIBBCDField
      FieldName = 'QTD_TRANSF_ANO'
      Origin = 'OC_COMPRAR.QTD_TRANSF_ANO'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddEST_MINIMO: TIBBCDField
      FieldName = 'EST_MINIMO'
      Origin = 'OC_COMPRAR.EST_MINIMO'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddDIAS_ESTOCAGEM: TIntegerField
      FieldName = 'DIAS_ESTOCAGEM'
      Origin = 'OC_COMPRAR.DIAS_ESTOCAGEM'
    end
    object IBQ_OC_ComprarAddQTD_DEMANDA_DIA: TIBBCDField
      FieldName = 'QTD_DEMANDA_DIA'
      Origin = 'OC_COMPRAR.QTD_DEMANDA_DIA'
      Precision = 18
      Size = 4
    end
    object IBQ_OC_ComprarAddQTD_DEMANDA_ANO: TIBBCDField
      FieldName = 'QTD_DEMANDA_ANO'
      Origin = 'OC_COMPRAR.QTD_DEMANDA_ANO'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddQTD_DIAS_ANO: TIntegerField
      FieldName = 'QTD_DIAS_ANO'
      Origin = 'OC_COMPRAR.QTD_DIAS_ANO'
    end
    object IBQ_OC_ComprarAddDATAINCLUSAO: TDateField
      FieldName = 'DATAINCLUSAO'
      Origin = 'OC_COMPRAR.DATAINCLUSAO'
    end
    object IBQ_OC_ComprarAddESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'OC_COMPRAR.ESTADO'
      FixedChar = True
      Size = 2
    end
    object IBQ_OC_ComprarAddDATAALTERACAO: TDateField
      FieldName = 'DATAALTERACAO'
      Origin = 'OC_COMPRAR.DATAALTERACAO'
    end
    object IBQ_OC_ComprarAddIND_TRANSF_CD: TIBStringField
      FieldName = 'IND_TRANSF_CD'
      Origin = 'OC_COMPRAR.IND_TRANSF_CD'
      FixedChar = True
      Size = 1
    end
    object IBQ_OC_ComprarAddDOC_TRANSF_CD: TIntegerField
      FieldName = 'DOC_TRANSF_CD'
      Origin = 'OC_COMPRAR.DOC_TRANSF_CD'
    end
  end
  object IBUP_OC_ComprarAdd: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from oc_comprar '
      'where'
      '  NUM_SEQ = :NUM_SEQ'
      ' and  NUM_DOCUMENTO = :NUM_DOCUMENTO')
    ModifySQL.Strings = (
      'update oc_comprar'
      'set'
      '  DTA_DOCUMENTO = :DTA_DOCUMENTO,'
      '  IND_OC_GERADA = :IND_OC_GERADA,'
      '  DTA_OC_GERADA = :DTA_OC_GERADA,'
      '  NUM_OC_GERADA = :NUM_OC_GERADA,'
      '  OBS_OC = :OBS_OC,'
      '  COD_EMPRESA = :COD_EMPRESA,'
      '  DES_EMPRESA = :DES_EMPRESA,'
      '  COD_ITEM = :COD_ITEM,'
      '  DES_ITEM = :DES_ITEM,'
      '  QTD_SUGERIDA = :QTD_SUGERIDA,'
      '  QTD_ACOMPRAR = :QTD_ACOMPRAR,'
      '  QTD_SALDO = :QTD_SALDO,'
      '  QTD_TRANSITO = :QTD_TRANSITO,'
      '  QTD_DISPONIVEL = :QTD_DISPONIVEL,'
      '  QTD_MEDIA_MES = :QTD_MEDIA_MES,'
      '  QTD_MEDIA_DIA = :QTD_MEDIA_DIA,'
      '  QTD_DEM_MES1 = :QTD_DEM_MES1,'
      '  QTD_DEM_MES2 = :QTD_DEM_MES2,'
      '  QTD_DEM_MES3 = :QTD_DEM_MES3,'
      '  QTD_DEM_MES4 = :QTD_DEM_MES4,'
      '  QTD_DEM_MES5 = :QTD_DEM_MES5,'
      '  QTD_DEM_MES6 = :QTD_DEM_MES6,'
      '  QTD_DEM_MES7 = :QTD_DEM_MES7,'
      '  QTD_DEM_MES8 = :QTD_DEM_MES8,'
      '  UNI_COMPRA = :UNI_COMPRA,'
      '  UNI_VENDA = :UNI_VENDA,'
      '  COD_BARRAS = :COD_BARRAS,'
      '  COD_GRUPO = :COD_GRUPO,'
      '  DES_GRUPO = :DES_GRUPO,'
      '  COD_SUBGRUPO = :COD_SUBGRUPO,'
      '  DES_SUBGRUPO = :DES_SUBGRUPO,'
      '  DES_GENERICO = :DES_GENERICO,'
      '  COD_APLICACAO = :COD_APLICACAO,'
      '  DES_APLICACAO = :DES_APLICACAO,'
      '  COD_REFERENCIA = :COD_REFERENCIA,'
      '  CLA_CURVA_ABC = :CLA_CURVA_ABC,'
      '  COD_FAMILIA_PRECO = :COD_FAMILIA_PRECO,'
      '  DES_FAMILIA_PRECO = :DES_FAMILIA_PRECO,'
      '  DTA_ULT_COMPRA = :DTA_ULT_COMPRA,'
      '  COD_FOR_ULT_COMPRA = :COD_FOR_ULT_COMPRA,'
      '  DES_FOR_ULT_COMPRA = :DES_FOR_ULT_COMPRA,'
      '  QTD_ULT_COMPRA = :QTD_ULT_COMPRA,'
      '  VLR_UNI_ULT_COMPRA = :VLR_UNI_ULT_COMPRA,'
      '  VLR_TOT_ULT_COMPRA = :VLR_TOT_ULT_COMPRA,'
      '  VLR_UNI_COMPRA = :VLR_UNI_COMPRA,'
      '  PER_DESCONTO = :PER_DESCONTO,'
      '  DTA_ULT_VENDA = :DTA_ULT_VENDA,'
      '  COD_CLI_ULT_VENDA = :COD_CLI_ULT_VENDA,'
      '  DES_CLI_ULT_VENDA = :DES_CLI_ULT_VENDA,'
      '  QTD_ULT_VENDA = :QTD_ULT_VENDA,'
      '  VLR_UNI_ULT_VENDA = :VLR_UNI_ULT_VENDA,'
      '  VLR_TOT_ULT_VENDA = :VLR_TOT_ULT_VENDA,'
      '  VLR_UNI_VENDA = :VLR_UNI_VENDA,'
      '  COD_LISTA_VENDA = :COD_LISTA_VENDA,'
      '  DES_LISTA_VENDA = :DES_LISTA_VENDA,'
      '  COD_LISTA_COMPRA = :COD_LISTA_COMPRA,'
      '  DES_LISTA_COMPRA = :DES_LISTA_COMPRA,'
      '  VLR_CUSTO_MEDIO = :VLR_CUSTO_MEDIO,'
      '  VLR_TOT_VENDA = :VLR_TOT_VENDA,'
      '  VLR_TOT_COMPRA = :VLR_TOT_COMPRA,'
      '  VLR_BRUTO = :VLR_BRUTO,'
      '  VLR_DESCONTOS = :VLR_DESCONTOS,'
      '  VLR_DESPESAS = :VLR_DESPESAS,'
      '  VLR_FRETE = :VLR_FRETE,'
      '  IND_SOMA_IPI_BASE_ICMS = :IND_SOMA_IPI_BASE_ICMS,'
      '  IND_SOMA_FRETE_BASE_ICMS = :IND_SOMA_FRETE_BASE_ICMS,'
      '  IND_SOMA_DESPESA_BASE_ICMS = :IND_SOMA_DESPESA_BASE_ICMS,'
      '  IND_SOMA_IPI_BASE_ST = :IND_SOMA_IPI_BASE_ST,'
      '  IND_SOMA_FRETE_BASE_ST = :IND_SOMA_FRETE_BASE_ST,'
      '  IND_SOMA_DESPESA_BASE_ST = :IND_SOMA_DESPESA_BASE_ST,'
      '  COD_SIT_TRIBUTARIA = :COD_SIT_TRIBUTARIA,'
      '  COD_IPI = :COD_IPI,'
      '  IND_IPI = :IND_IPI,'
      '  PER_IPI = :PER_IPI,'
      '  VLR_IPI = :VLR_IPI,'
      '  COD_ICMS = :COD_ICMS,'
      '  PER_REDUCAO_ICMS = :PER_REDUCAO_ICMS,'
      '  VLR_REDUCAO_ICMS = :VLR_REDUCAO_ICMS,'
      '  VLR_BASE_ICMS = :VLR_BASE_ICMS,'
      '  PER_ICMS = :PER_ICMS,'
      '  VLR_ICMS = :VLR_ICMS,'
      '  COD_GRUPO_ST = :COD_GRUPO_ST,'
      '  DES_GRUPO_ST = :DES_GRUPO_ST,'
      '  PER_MARGEM_ST = :PER_MARGEM_ST,'
      '  IND_ST = :IND_ST,'
      '  VLR_BASE_ST = :VLR_BASE_ST,'
      '  PER_ST = :PER_ST,'
      '  VLR_ST = :VLR_ST,'
      '  PER_REPASSE = :PER_REPASSE,'
      '  VLR_REPASSE = :VLR_REPASSE,'
      '  COD_COMPROVANTE_ICMS = :COD_COMPROVANTE_ICMS,'
      '  COD_REFERENCIA_FORN = :COD_REFERENCIA_FORN,'
      '  COD_FORNECEDOR = :COD_FORNECEDOR,'
      '  DES_FORNECEDOR = :DES_FORNECEDOR,'
      '  TIP_PESSOA = :TIP_PESSOA,'
      '  DES_EMAIL = :DES_EMAIL,'
      '  QTD_NR_DIAS = :QTD_NR_DIAS,'
      '  QTD_NR_MESES = :QTD_NR_MESES,'
      '  QTD_TOT_MESES = :QTD_TOT_MESES,'
      '  COD_COMPRADOR = :COD_COMPRADOR,'
      '  BLOB_TEXTO = :BLOB_TEXTO,'
      '  IND_TRANSF = :IND_TRANSF,'
      '  DTA_LIM_TRANSF = :DTA_LIM_TRANSF,'
      '  QTD_TRANSF = :QTD_TRANSF,'
      '  IND_USAR = :IND_USAR,'
      '  IND_QTD_ACIMA = :IND_QTD_ACIMA,'
      '  QTD_SUGERIDA_ANO = :QTD_SUGERIDA_ANO,'
      '  QTD_TRANSF_PERIODO = :QTD_TRANSF_PERIODO,'
      '  QTD_TRANSF_ANO = :QTD_TRANSF_ANO,'
      '  EST_MINIMO = :EST_MINIMO,'
      '  DIAS_ESTOCAGEM = :DIAS_ESTOCAGEM,'
      '  QTD_DEMANDA_DIA = :QTD_DEMANDA_DIA,'
      '  QTD_DEMANDA_ANO = :QTD_DEMANDA_ANO,'
      '  QTD_DIAS_ANO = :QTD_DIAS_ANO,'
      '  DATAINCLUSAO = :DATAINCLUSAO,'
      '  ESTADO = :ESTADO,'
      '  DATAALTERACAO = :DATAALTERACAO'
      'where'
      '  NUM_SEQ = :NUM_SEQ'
      '  and NUM_DOCUMENTO = :NUM_DOCUMENTO'
      '')
    InsertSQL.Strings = (
      'insert into oc_comprar'
      '  (NUM_SEQ, NUM_DOCUMENTO, DTA_DOCUMENTO, IND_OC_GERADA, '
      'DTA_OC_GERADA, '
      '   NUM_OC_GERADA, OBS_OC, COD_EMPRESA, DES_EMPRESA, COD_ITEM, '
      'DES_ITEM, '
      '   QTD_SUGERIDA, QTD_ACOMPRAR, QTD_SALDO, QTD_TRANSITO, '
      'QTD_DISPONIVEL, '
      '   QTD_MEDIA_MES, QTD_MEDIA_DIA, QTD_DEM_MES1, QTD_DEM_MES2, '
      'QTD_DEM_MES3, '
      '   QTD_DEM_MES4, QTD_DEM_MES5, QTD_DEM_MES6, QTD_DEM_MES7, '
      'QTD_DEM_MES8, '
      '   UNI_COMPRA, UNI_VENDA, COD_BARRAS, COD_GRUPO, DES_GRUPO, '
      'COD_SUBGRUPO, '
      '   DES_SUBGRUPO, DES_GENERICO, COD_APLICACAO, DES_APLICACAO, '
      'COD_REFERENCIA, '
      '   CLA_CURVA_ABC, COD_FAMILIA_PRECO, DES_FAMILIA_PRECO, '
      'DTA_ULT_COMPRA, '
      '   COD_FOR_ULT_COMPRA, DES_FOR_ULT_COMPRA, QTD_ULT_COMPRA, '
      'VLR_UNI_ULT_COMPRA, '
      '   VLR_TOT_ULT_COMPRA, VLR_UNI_COMPRA, PER_DESCONTO, '
      'DTA_ULT_VENDA, COD_CLI_ULT_VENDA, '
      '   DES_CLI_ULT_VENDA, QTD_ULT_VENDA, VLR_UNI_ULT_VENDA, '
      'VLR_TOT_ULT_VENDA, '
      '   VLR_UNI_VENDA, COD_LISTA_VENDA, DES_LISTA_VENDA, '
      'COD_LISTA_COMPRA, DES_LISTA_COMPRA, '
      '   VLR_CUSTO_MEDIO, VLR_TOT_VENDA, VLR_TOT_COMPRA, VLR_BRUTO, '
      'VLR_DESCONTOS, '
      '   VLR_DESPESAS, VLR_FRETE, IND_SOMA_IPI_BASE_ICMS, '
      'IND_SOMA_FRETE_BASE_ICMS, '
      '   IND_SOMA_DESPESA_BASE_ICMS, IND_SOMA_IPI_BASE_ST, '
      'IND_SOMA_FRETE_BASE_ST, '
      
        '   IND_SOMA_DESPESA_BASE_ST, COD_SIT_TRIBUTARIA, COD_IPI, IND_IP' +
        'I, '
      'PER_IPI, '
      '   VLR_IPI, COD_ICMS, PER_REDUCAO_ICMS, VLR_REDUCAO_ICMS, '
      'VLR_BASE_ICMS, '
      '   PER_ICMS, VLR_ICMS, COD_GRUPO_ST, DES_GRUPO_ST, '
      'PER_MARGEM_ST, IND_ST, '
      '   VLR_BASE_ST, PER_ST, VLR_ST, PER_REPASSE, VLR_REPASSE, '
      'COD_COMPROVANTE_ICMS, '
      '   COD_REFERENCIA_FORN, COD_FORNECEDOR, DES_FORNECEDOR, '
      'TIP_PESSOA, DES_EMAIL, '
      '   QTD_NR_DIAS, QTD_NR_MESES, QTD_TOT_MESES, COD_COMPRADOR, '
      'BLOB_TEXTO, '
      '   IND_TRANSF, DTA_LIM_TRANSF, QTD_TRANSF, IND_USAR, '
      'IND_QTD_ACIMA,'
      '  QTD_SUGERIDA_ANO, QTD_TRANSF_PERIODO, QTD_TRANSF_ANO, '
      'EST_MINIMO, '
      '  DIAS_ESTOCAGEM, QTD_DEMANDA_DIA, QTD_DEMANDA_ANO, '
      'QTD_DIAS_ANO,'
      '  DATAINCLUSAO, ESTADO, DATAALTERACAO)'
      'values'
      '  (:NUM_SEQ, :NUM_DOCUMENTO, :DTA_DOCUMENTO, :IND_OC_GERADA, '
      ':DTA_OC_GERADA, '
      
        '   :NUM_OC_GERADA, :OBS_OC, :COD_EMPRESA, :DES_EMPRESA, :COD_ITE' +
        'M, '
      ':DES_ITEM, '
      '   :QTD_SUGERIDA, :QTD_ACOMPRAR, :QTD_SALDO, :QTD_TRANSITO, '
      ':QTD_DISPONIVEL, '
      
        '   :QTD_MEDIA_MES, :QTD_MEDIA_DIA, :QTD_DEM_MES1, :QTD_DEM_MES2,' +
        ' '
      ':QTD_DEM_MES3, '
      '   :QTD_DEM_MES4, :QTD_DEM_MES5, :QTD_DEM_MES6, :QTD_DEM_MES7, '
      ':QTD_DEM_MES8, '
      
        '   :UNI_COMPRA, :UNI_VENDA, :COD_BARRAS, :COD_GRUPO, :DES_GRUPO,' +
        ' '
      ':COD_SUBGRUPO, '
      
        '   :DES_SUBGRUPO, :DES_GENERICO, :COD_APLICACAO, :DES_APLICACAO,' +
        ' '
      ':COD_REFERENCIA, '
      '   :CLA_CURVA_ABC, :COD_FAMILIA_PRECO, :DES_FAMILIA_PRECO, '
      ':DTA_ULT_COMPRA, '
      '   :COD_FOR_ULT_COMPRA, :DES_FOR_ULT_COMPRA, :QTD_ULT_COMPRA, '
      ':VLR_UNI_ULT_COMPRA, '
      '   :VLR_TOT_ULT_COMPRA, :VLR_UNI_COMPRA, :PER_DESCONTO, '
      ':DTA_ULT_VENDA, '
      '   :COD_CLI_ULT_VENDA, :DES_CLI_ULT_VENDA, :QTD_ULT_VENDA, '
      ':VLR_UNI_ULT_VENDA, '
      '   :VLR_TOT_ULT_VENDA, :VLR_UNI_VENDA, :COD_LISTA_VENDA, '
      ':DES_LISTA_VENDA, '
      '   :COD_LISTA_COMPRA, :DES_LISTA_COMPRA, :VLR_CUSTO_MEDIO, '
      ':VLR_TOT_VENDA, '
      '   :VLR_TOT_COMPRA, :VLR_BRUTO, :VLR_DESCONTOS, :VLR_DESPESAS, '
      ':VLR_FRETE, '
      '   :IND_SOMA_IPI_BASE_ICMS, :IND_SOMA_FRETE_BASE_ICMS, '
      ':IND_SOMA_DESPESA_BASE_ICMS, '
      '   :IND_SOMA_IPI_BASE_ST, :IND_SOMA_FRETE_BASE_ST, '
      ':IND_SOMA_DESPESA_BASE_ST, '
      
        '   :COD_SIT_TRIBUTARIA, :COD_IPI, :IND_IPI, :PER_IPI, :VLR_IPI, ' +
        ':COD_ICMS, '
      ':PER_REDUCAO_ICMS, '
      '   :VLR_REDUCAO_ICMS, :VLR_BASE_ICMS, :PER_ICMS, :VLR_ICMS, '
      ':COD_GRUPO_ST, '
      
        '   :DES_GRUPO_ST, :PER_MARGEM_ST, :IND_ST, :VLR_BASE_ST,    :PER' +
        '_ST, '
      ':VLR_ST,'
      '   :PER_REPASSE, :VLR_REPASSE, :COD_COMPROVANTE_ICMS, '
      ':COD_REFERENCIA_FORN, '
      '   :COD_FORNECEDOR, :DES_FORNECEDOR, :TIP_PESSOA, :DES_EMAIL, '
      '   :QTD_NR_DIAS, :QTD_NR_MESES, :QTD_TOT_MESES, :COD_COMPRADOR, '
      ':BLOB_TEXTO, '
      '   :IND_TRANSF, :DTA_LIM_TRANSF, :QTD_TRANSF, :IND_USAR, '
      ':IND_QTD_ACIMA,'
      '   :QTD_SUGERIDA_ANO, :QTD_TRANSF_PERIODO, :QTD_TRANSF_ANO, '
      ':EST_MINIMO, '
      '   :DIAS_ESTOCAGEM, :QTD_DEMANDA_DIA, :QTD_DEMANDA_ANO, '
      ':QTD_DIAS_ANO,'
      '   :DATAINCLUSAO, :ESTADO, :DATAALTERACAO)'
      '')
    DeleteSQL.Strings = (
      'delete from oc_comprar'
      'where'
      '  NUM_SEQ = :NUM_SEQ'
      '  and NUM_DOCUMENTO = :NUM_DOCUMENTO')
    Left = 823
    Top = 326
  end
  object IBQ_BuscaRapida: TIBQuery
    Database = DMBelShopPedidos.IBDB_BelShop
    Transaction = DMBelShopPedidos.IBT_BelShop
    BufferChunks = 1000
    CachedUpdates = False
    Left = 855
    Top = 59
  end
  object IBDS_Busca: TIBDataSet
    Database = DMBelShopPedidos.IBDB_BelShop
    Transaction = DMBelShopPedidos.IBT_BelShop
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      ' SELECT'
      ' TRIM(pr.cod_auxiliar) COD_AUXILIAR,'
      ' pr.cod_produto,'
      ' TRIM(pr.nome) NOME,'
      ''
      
        ' (SELECT mx.ind_curva FROM ES_PRODUTOS_MIX mx  WHERE mx.cod_prod' +
        'uto=pr.cod_produto AND mx.empresa=2) ABC,'
      ' CAST(COALESCE((SELECT SUM(COALESCE(fa.vlr_fat,0.00))'
      '      FROM ES_FAT_PERIODO fa'
      '      WHERE fa.cod_produto=pr.cod_produto) , 0.00)'
      ' AS NUMERIC(12,2)) Fat_Periodo,'
      ''
      ' TRIM(pr.desc_setor) DESC_SETOR,'
      ' TRIM(pr.desc_colecao) DESC_COLECAO,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=1)  LOJA1,'
      ' 0 LOJA2,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=3)  LOJA3,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=4)  LOJA4,'
      ' 0 LOJA5,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=6)  LOJA6,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=7)  LOJA7,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=8)  LOJA8,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=9)  LOJA9,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=10)  LOJA10,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=11)  LOJA11,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=12)  LOJA12,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=13)  LOJA13,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=14)  LOJA14,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=15)  LOJA15,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=16)  LOJA16,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=17)  LOJA17,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=18)  LOJA18,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=19)  LOJA19,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=20)  LOJA20,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=21)  LOJA21,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=22)  LOJA22,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=23)  LOJA23,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=24)  LOJA24,'
      ''
      ' 0 LOJA25,'
      
        ' 0 LOJA26, 0 LOJA27, 0 LOJA28, 0 LOJA29, 0 LOJA30, 0 LOJA31, 0 L' +
        'OJA32, 0 LOJA33, 0 LOJA34,'
      ' 0 LOJA35, pr.cod_fornecedor,'
      
        ' (SELECT fo.nome_cliente FROM LINXCLIENTESFORNEC fo WHERE fo.cod' +
        '_cliente=pr.cod_fornecedor) Forn'
      ''
      ' FROM lINXPRODUTOS pr'
      ' WHERE pr.id_linha<>33'
      ' AND   id_colecao<>294'
      ' AND   pr.desativado='#39'N'#39
      ' AND   pr.cod_auxiliar IS NOT NULL'
      ' AND   pr.cod_fornecedor=56')
    Left = 864
    Top = 116
  end
  object SQLQ_AComprarOCs: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      #39'N'#39' GERAR, -- 1'
      'CASE'
      '   WHEN COALESCE(oc.num_oc_gerada, 0) > 0 THEN'
      '     '#39'OC'#39
      '   ELSE'
      '     '#39'PD'#39
      'END tipo, -- 2'
      'oc.cod_empresa COD_EMP_FIL, -- 3'
      'oc.des_empresa DES_EMP_FIL, -- 4'
      'Cast(oc.cod_empresa as integer) COD_LINX, -- 5'
      'oc.ind_oc_gerada, -- 6'
      'oc.cod_fornecedor, -- 7'
      'oc.des_fornecedor FORNECEDOR, -- 8'
      'SUM(COALESCE(oc.vlr_bruto, 0.00)) TOTAL_BRUTO, -- 9'
      'SUM(COALESCE(oc.vlr_descontos, 0.00)) TOTAL_DESCONTOS, -- 10'
      'SUM(COALESCE(oc.vlr_ipi, 0.00)) TOTAL_IPI, -- 11'
      'SUM(COALESCE(oc.vlr_despesas, 0.00)) TOTAL_DESPESAS, -- 12'
      'SUM(COALESCE(oc.vlr_st, 0.00)) TOTAL_ST, -- 13'
      'SUM(COALESCE(oc.vlr_frete, 0.00)) TOTAL_FRETE, -- 14'
      'SUM(COALESCE(oc.vlr_icms, 0.00)) TOTAL_ICMS, -- 15'
      'SUM(COALESCE(oc.vlr_repasse, 0.00)) TOTAL_REPASSE, -- 16'
      'SUM(CASE'
      '       WHEN oc.qtd_transf = 0 THEN'
      '         COALESCE(oc.vlr_tot_compra, 0.00)'
      '       ELSE'
      '         0'
      'END) TOTAL_OCS, -- 17'
      'SUM(COALESCE(oc.vlr_tot_compra, 0.00)) TOTAL_OC, -- 18'
      'SUM(COALESCE(oc.vlr_tot_venda, 0.00)) TOTAL_VENDA, -- 19'
      'oc.num_documento, -- 20'
      'oc.num_oc_gerada, -- 21'
      'CAST(oc.dta_oc_gerada AS DATE) DTA_OC_GERADA, -- 22'
      'oc.cod_comprovante_icms, -- 23'
      'COUNT(oc.cod_item) TOTAL_ITENS, -- 24'
      'SUM(COALESCE(oc.qtd_acomprar, 0)) TOTAL_QTD, -- 25'
      'SUM(COALESCE(oc.qtd_transf, 0)) TOTAL_QTD_TRANSF, -- 26'
      'SUM(CASE'
      '       WHEN oc.qtd_acomprar > 0 THEN'
      '         1'
      '       ELSE'
      '         0'
      'END) TOTAL_ITENS_ACOMPRAR, -- 27'
      ''
      'CASE'
      '  WHEN oc.ind_oc_gerada='#39'S'#39' THEN'
      '    '#39'OC GERADA'#39
      '  WHEN UPPER(TRIM(dc.origem)) = '#39'LINX'#39' THEN'
      '    '#39'FECHADO'#39
      '  ELSE'
      '    '#39'ABERTO'#39
      'END SITUACAO -- 28'
      ''
      'FROM OC_COMPRAR oc, OC_COMPRAR_DOCS dc'
      ''
      'WHERE oc.num_documento = dc.num_docto'
      'AND   CAST(oc.dta_documento AS DATE) = dc.dta_docto'
      'AND   oc.cod_comprador = dc.cod_comprador'
      'AND   UPPER(TRIM(dc.origem)) LIKE '#39'LINX%'#39
      '--AND   oc.num_documento=sNrDoc+'
      'AND   oc.cod_empresa=28'
      ''
      'GROUP BY TIPO,'
      '         oc.cod_empresa, oc.des_empresa, COD_LINX,'
      '         oc.ind_oc_gerada, oc.cod_fornecedor, oc.des_fornecedor,'
      '         oc.num_documento, oc.num_oc_gerada,'
      
        '         CAST(oc.dta_oc_gerada AS DATE), oc.cod_comprovante_icms' +
        ','
      '         SITUACAO'
      'ORDER BY oc.cod_empresa, oc.des_fornecedor, oc.num_oc_gerada')
    SQLConnection = DMBelShopPedidos.SQLC
    Left = 48
    Top = 24
  end
  object SQLQ_Sugestao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NumDocto'
        ParamType = ptInput
        Value = '155'
      end
      item
        DataType = ftString
        Name = 'Dta'
        ParamType = ptInput
        Value = '14.01.2019'
      end
      item
        DataType = ftString
        Name = 'CodLoja'
        ParamType = ptInput
        Value = '28'
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM OC_COMPRAR oc'
      'WHERE oc.num_documento=:NumDocto'
      'AND   CAST(oc.dta_documento AS DATE)=:Dta'
      'AND   OC.cod_empresa=:CodLoja'
      'ORDER BY oc.cod_item')
    SQLConnection = DMBelShopPedidos.SQLC
    Left = 760
    Top = 384
  end
  object DSP_OCProdLinx: TDataSetProvider
    DataSet = SQLQ_OCProdLinx
    Options = [poRetainServerOrder]
    Left = 100
    Top = 133
  end
  object CDS_OCProdLinx: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_OCProdLinx'
    Left = 148
    Top = 116
    object CDS_OCProdLinxNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
      Required = True
    end
    object CDS_OCProdLinxNUM_DOCUMENTO: TIntegerField
      FieldName = 'NUM_DOCUMENTO'
      Required = True
    end
    object CDS_OCProdLinxDTA_DOCUMENTO: TSQLTimeStampField
      FieldName = 'DTA_DOCUMENTO'
      Required = True
    end
    object CDS_OCProdLinxIND_OC_GERADA: TStringField
      FieldName = 'IND_OC_GERADA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxDTA_OC_GERADA: TStringField
      FieldName = 'DTA_OC_GERADA'
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxNUM_OC_GERADA: TStringField
      FieldName = 'NUM_OC_GERADA'
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxOBS_OC: TStringField
      FieldName = 'OBS_OC'
      Required = True
      FixedChar = True
      Size = 42
    end
    object CDS_OCProdLinxCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object CDS_OCProdLinxDES_EMPRESA: TStringField
      FieldName = 'DES_EMPRESA'
      Required = True
      FixedChar = True
      Size = 12
    end
    object CDS_OCProdLinxCOD_ITEM: TFMTBCDField
      FieldName = 'COD_ITEM'
      Precision = 15
      Size = 0
    end
    object CDS_OCProdLinxDES_ITEM: TStringField
      FieldName = 'DES_ITEM'
      Size = 250
    end
    object CDS_OCProdLinxQTD_SUGERIDA: TIntegerField
      FieldName = 'QTD_SUGERIDA'
      Required = True
    end
    object CDS_OCProdLinxQTD_ACOMPRAR: TIntegerField
      FieldName = 'QTD_ACOMPRAR'
      Required = True
    end
    object CDS_OCProdLinxQTD_SALDO: TFMTBCDField
      FieldName = 'QTD_SALDO'
      Precision = 15
      Size = 4
    end
    object CDS_OCProdLinxQTD_TRANSITO: TIntegerField
      FieldName = 'QTD_TRANSITO'
      Required = True
    end
    object CDS_OCProdLinxQTD_DISPONIVEL: TFMTBCDField
      FieldName = 'QTD_DISPONIVEL'
      Precision = 15
      Size = 4
    end
    object CDS_OCProdLinxQTD_MEDIA_MES: TIntegerField
      FieldName = 'QTD_MEDIA_MES'
      Required = True
    end
    object CDS_OCProdLinxQTD_MEDIA_DIA: TFMTBCDField
      FieldName = 'QTD_MEDIA_DIA'
      Precision = 15
      Size = 4
    end
    object CDS_OCProdLinxQTD_DEM_MES1: TIntegerField
      FieldName = 'QTD_DEM_MES1'
    end
    object CDS_OCProdLinxQTD_DEM_MES2: TIntegerField
      FieldName = 'QTD_DEM_MES2'
    end
    object CDS_OCProdLinxQTD_DEM_MES3: TIntegerField
      FieldName = 'QTD_DEM_MES3'
    end
    object CDS_OCProdLinxQTD_DEM_MES4: TIntegerField
      FieldName = 'QTD_DEM_MES4'
    end
    object CDS_OCProdLinxQTD_DEM_MES5: TIntegerField
      FieldName = 'QTD_DEM_MES5'
    end
    object CDS_OCProdLinxQTD_DEM_MES6: TIntegerField
      FieldName = 'QTD_DEM_MES6'
      Required = True
    end
    object CDS_OCProdLinxQTD_DEM_MES7: TIntegerField
      FieldName = 'QTD_DEM_MES7'
      Required = True
    end
    object CDS_OCProdLinxQTD_DEM_MES8: TIntegerField
      FieldName = 'QTD_DEM_MES8'
      Required = True
    end
    object CDS_OCProdLinxUNI_COMPRA: TIntegerField
      FieldName = 'UNI_COMPRA'
      Required = True
    end
    object CDS_OCProdLinxUNI_VENDA: TIntegerField
      FieldName = 'UNI_VENDA'
      Required = True
    end
    object CDS_OCProdLinxCOD_BARRAS: TStringField
      FieldName = 'COD_BARRAS'
    end
    object CDS_OCProdLinxCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
    end
    object CDS_OCProdLinxDES_GRUPO: TStringField
      FieldName = 'DES_GRUPO'
      Size = 30
    end
    object CDS_OCProdLinxCOD_SUBGRUPO: TIntegerField
      FieldName = 'COD_SUBGRUPO'
    end
    object CDS_OCProdLinxDES_SUBGRUPO: TStringField
      FieldName = 'DES_SUBGRUPO'
      Size = 30
    end
    object CDS_OCProdLinxDES_GENERICO: TStringField
      FieldName = 'DES_GENERICO'
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxCOD_APLICACAO: TIntegerField
      FieldName = 'COD_APLICACAO'
    end
    object CDS_OCProdLinxDES_APLICACAO: TStringField
      FieldName = 'DES_APLICACAO'
      Size = 50
    end
    object CDS_OCProdLinxCOD_REFERENCIA: TStringField
      FieldName = 'COD_REFERENCIA'
    end
    object CDS_OCProdLinxCLA_CURVA_ABC: TStringField
      FieldName = 'CLA_CURVA_ABC'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxCOD_FAMILIA_PRECO: TStringField
      FieldName = 'COD_FAMILIA_PRECO'
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxDES_FAMILIA_PRECO: TStringField
      FieldName = 'DES_FAMILIA_PRECO'
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxDTA_ULT_COMPRA: TStringField
      FieldName = 'DTA_ULT_COMPRA'
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxCOD_FOR_ULT_COMPRA: TIntegerField
      FieldName = 'COD_FOR_ULT_COMPRA'
      Required = True
    end
    object CDS_OCProdLinxDES_FOR_ULT_COMPRA: TStringField
      FieldName = 'DES_FOR_ULT_COMPRA'
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxQTD_ULT_COMPRA: TFMTBCDField
      FieldName = 'QTD_ULT_COMPRA'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_OCProdLinxVLR_UNI_ULT_COMPRA: TFMTBCDField
      FieldName = 'VLR_UNI_ULT_COMPRA'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_OCProdLinxVLR_TOT_ULT_COMPRA: TFMTBCDField
      FieldName = 'VLR_TOT_ULT_COMPRA'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_OCProdLinxVLR_UNI_COMPRA: TFMTBCDField
      FieldName = 'VLR_UNI_COMPRA'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_OCProdLinxPER_DESCONTO: TIntegerField
      FieldName = 'PER_DESCONTO'
      Required = True
    end
    object CDS_OCProdLinxDTA_ULT_VENDA: TStringField
      FieldName = 'DTA_ULT_VENDA'
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxCOD_CLI_ULT_VENDA: TStringField
      FieldName = 'COD_CLI_ULT_VENDA'
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxDES_CLI_ULT_VENDA: TStringField
      FieldName = 'DES_CLI_ULT_VENDA'
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxQTD_ULT_VENDA: TStringField
      FieldName = 'QTD_ULT_VENDA'
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxVLR_UNI_ULT_VENDA: TStringField
      FieldName = 'VLR_UNI_ULT_VENDA'
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxVLR_TOT_ULT_VENDA: TStringField
      FieldName = 'VLR_TOT_ULT_VENDA'
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxVLR_UNI_VENDA: TFMTBCDField
      FieldName = 'VLR_UNI_VENDA'
      Precision = 15
      Size = 2
    end
    object CDS_OCProdLinxCOD_LISTA_VENDA: TStringField
      FieldName = 'COD_LISTA_VENDA'
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxDES_LISTA_VENDA: TStringField
      FieldName = 'DES_LISTA_VENDA'
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxCOD_LISTA_COMPRA: TStringField
      FieldName = 'COD_LISTA_COMPRA'
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxDES_LISTA_COMPRA: TStringField
      FieldName = 'DES_LISTA_COMPRA'
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxVLR_CUSTO_MEDIO: TFMTBCDField
      FieldName = 'VLR_CUSTO_MEDIO'
      Precision = 15
      Size = 4
    end
    object CDS_OCProdLinxVLR_TOT_VENDA: TFMTBCDField
      FieldName = 'VLR_TOT_VENDA'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_OCProdLinxVLR_TOT_COMPRA: TFMTBCDField
      FieldName = 'VLR_TOT_COMPRA'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_OCProdLinxVLR_BRUTO: TFMTBCDField
      FieldName = 'VLR_BRUTO'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_OCProdLinxVLR_DESCONTOS: TFMTBCDField
      FieldName = 'VLR_DESCONTOS'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_OCProdLinxVLR_DESPESAS: TFMTBCDField
      FieldName = 'VLR_DESPESAS'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_OCProdLinxVLR_FRETE: TFMTBCDField
      FieldName = 'VLR_FRETE'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_OCProdLinxIND_SOMA_IPI_BASE_ICMS: TStringField
      FieldName = 'IND_SOMA_IPI_BASE_ICMS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxIND_SOMA_FRETE_BASE_ICMS: TStringField
      FieldName = 'IND_SOMA_FRETE_BASE_ICMS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxIND_SOMA_DESPESA_BASE_ICMS: TStringField
      FieldName = 'IND_SOMA_DESPESA_BASE_ICMS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxIND_SOMA_IPI_BASE_ST: TStringField
      FieldName = 'IND_SOMA_IPI_BASE_ST'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxIND_SOMA_FRETE_BASE_ST: TStringField
      FieldName = 'IND_SOMA_FRETE_BASE_ST'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxIND_SOMA_DESPESA_BASE_ST: TStringField
      FieldName = 'IND_SOMA_DESPESA_BASE_ST'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxCOD_SIT_TRIBUTARIA: TStringField
      FieldName = 'COD_SIT_TRIBUTARIA'
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxCOD_IPI: TStringField
      FieldName = 'COD_IPI'
      Required = True
      FixedChar = True
      Size = 2
    end
    object CDS_OCProdLinxIND_IPI: TStringField
      FieldName = 'IND_IPI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxPER_IPI: TFMTBCDField
      FieldName = 'PER_IPI'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_OCProdLinxVLR_IPI: TFMTBCDField
      FieldName = 'VLR_IPI'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_OCProdLinxCOD_ICMS: TStringField
      FieldName = 'COD_ICMS'
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxPER_REDUCAO_ICMS: TFMTBCDField
      FieldName = 'PER_REDUCAO_ICMS'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_OCProdLinxVLR_REDUCAO_ICMS: TFMTBCDField
      FieldName = 'VLR_REDUCAO_ICMS'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_OCProdLinxVLR_BASE_ICMS: TFMTBCDField
      FieldName = 'VLR_BASE_ICMS'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_OCProdLinxPER_ICMS: TFMTBCDField
      FieldName = 'PER_ICMS'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_OCProdLinxVLR_ICMS: TFMTBCDField
      FieldName = 'VLR_ICMS'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_OCProdLinxCOD_GRUPO_ST: TStringField
      FieldName = 'COD_GRUPO_ST'
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxDES_GRUPO_ST: TStringField
      FieldName = 'DES_GRUPO_ST'
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxPER_MARGEM_ST: TFMTBCDField
      FieldName = 'PER_MARGEM_ST'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_OCProdLinxIND_ST: TStringField
      FieldName = 'IND_ST'
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxVLR_BASE_ST: TFMTBCDField
      FieldName = 'VLR_BASE_ST'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_OCProdLinxPER_ST: TFMTBCDField
      FieldName = 'PER_ST'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_OCProdLinxVLR_ST: TFMTBCDField
      FieldName = 'VLR_ST'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_OCProdLinxPER_REPASSE: TFMTBCDField
      FieldName = 'PER_REPASSE'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_OCProdLinxVLR_REPASSE: TFMTBCDField
      FieldName = 'VLR_REPASSE'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_OCProdLinxCOD_COMPROVANTE_ICMS: TStringField
      FieldName = 'COD_COMPROVANTE_ICMS'
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxCOD_REFERENCIA_FORN: TStringField
      FieldName = 'COD_REFERENCIA_FORN'
    end
    object CDS_OCProdLinxCOD_FORNECEDOR: TIntegerField
      FieldName = 'COD_FORNECEDOR'
    end
    object CDS_OCProdLinxDES_FORNECEDOR: TStringField
      FieldName = 'DES_FORNECEDOR'
      Size = 60
    end
    object CDS_OCProdLinxTIP_PESSOA: TStringField
      FieldName = 'TIP_PESSOA'
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxDES_EMAIL: TStringField
      FieldName = 'DES_EMAIL'
      Size = 50
    end
    object CDS_OCProdLinxQTD_NR_DIAS: TIntegerField
      FieldName = 'QTD_NR_DIAS'
    end
    object CDS_OCProdLinxQTD_NR_MESES: TIntegerField
      FieldName = 'QTD_NR_MESES'
      Required = True
    end
    object CDS_OCProdLinxQTD_TOT_MESES: TIntegerField
      FieldName = 'QTD_TOT_MESES'
      Required = True
    end
    object CDS_OCProdLinxCOD_COMPRADOR: TIntegerField
      FieldName = 'COD_COMPRADOR'
      Required = True
    end
    object CDS_OCProdLinxBLOB_TEXTO: TStringField
      FieldName = 'BLOB_TEXTO'
      Required = True
      FixedChar = True
      Size = 42
    end
    object CDS_OCProdLinxIND_TRANSF: TStringField
      FieldName = 'IND_TRANSF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxDTA_LIM_TRANSF: TStringField
      FieldName = 'DTA_LIM_TRANSF'
      FixedChar = True
      Size = 1
    end
    object CDS_OCProdLinxQTD_TRANSF: TIntegerField
      FieldName = 'QTD_TRANSF'
      Required = True
    end
    object CDS_OCProdLinxIND_USAR: TStringField
      FieldName = 'IND_USAR'
      Required = True
      FixedChar = True
      Size = 3
    end
    object CDS_OCProdLinxIND_QTD_ACIMA: TIntegerField
      FieldName = 'IND_QTD_ACIMA'
      Required = True
    end
    object CDS_OCProdLinxQTD_SUGERIDA_ANO: TIntegerField
      FieldName = 'QTD_SUGERIDA_ANO'
      Required = True
    end
    object CDS_OCProdLinxQTD_TRANSF_PERIODO: TIntegerField
      FieldName = 'QTD_TRANSF_PERIODO'
      Required = True
    end
    object CDS_OCProdLinxQTD_TRANSF_ANO: TIntegerField
      FieldName = 'QTD_TRANSF_ANO'
      Required = True
    end
    object CDS_OCProdLinxEST_MINIMO: TIntegerField
      FieldName = 'EST_MINIMO'
      Required = True
    end
    object CDS_OCProdLinxDIAS_ESTOCAGEM: TIntegerField
      FieldName = 'DIAS_ESTOCAGEM'
      Required = True
    end
    object CDS_OCProdLinxQTD_DEMANDA_DIA: TIntegerField
      FieldName = 'QTD_DEMANDA_DIA'
    end
    object CDS_OCProdLinxQTD_DEMANDA_ANO: TIntegerField
      FieldName = 'QTD_DEMANDA_ANO'
    end
    object CDS_OCProdLinxQTD_DIAS_ANO: TIntegerField
      FieldName = 'QTD_DIAS_ANO'
      Required = True
    end
    object CDS_OCProdLinxDATAINCLUSAO: TSQLTimeStampField
      FieldName = 'DATAINCLUSAO'
    end
    object CDS_OCProdLinxESTADO: TStringField
      FieldName = 'ESTADO'
    end
    object CDS_OCProdLinxDATAALTERACAO: TSQLTimeStampField
      FieldName = 'DATAALTERACAO'
    end
  end
  object SQLQ_OCProdLinx: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '0 NUM_SEQ,'
      '0 NUM_DOCUMENTO,'
      'CURRENT_TIMESTAMP DTA_DOCUMENTO,'
      #39'N'#39' IND_OC_GERADA,'
      'NULL DTA_OC_GERADA,'
      'NULL NUM_OC_GERADA,'
      #39'Calculado em: 17.06.2019 10:42:30 por Odir'#39' OBS_OC,'
      ''
      '--------------fi.cod_loja COD_EMPRESA,'
      '29 COD_EMPRESA,'
      ''
      '--------------TRIM(fi.nome_emp) DES_EMPRESA,'
      #39'nome da loja'#39' DES_EMPRESA,'
      ''
      'pr.cod_produto COD_ITEM,'
      'TRIM(pr.nome) DES_ITEM,'
      '0 QTD_SUGERIDA,'
      '0 QTD_ACOMPRAR,'
      'COALESCE(es.quantidade,0) QTD_SALDO,'
      '0 QTD_TRANSITO,'
      'COALESCE(es.quantidade,0) QTD_DISPONIVEL,'
      '0 QTD_MEDIA_MES,'
      'COALESCE(dm.qtd_venda_dia,0) QTD_MEDIA_DIA,'
      'COALESCE(dm.qtd_venda_m5,0)  QTD_DEM_MES1,'
      'COALESCE(dm.qtd_venda_m4,0)  QTD_DEM_MES2,'
      'COALESCE(dm.qtd_venda_m3,0)  QTD_DEM_MES3,'
      'COALESCE(dm.qtd_venda_m2,0)  QTD_DEM_MES4,'
      'COALESCE(dm.qtd_venda_m1,0)  QTD_DEM_MES5,'
      '0 QTD_DEM_MES6, 0 QTD_DEM_MES7, 0 QTD_DEM_MES8,'
      '0 UNI_COMPRA,'
      '0 UNI_VENDA,'
      'TRIM(pr.cod_barra) COD_BARRAS,'
      'pr.id_setor COD_GRUPO,'
      'TRIM(pr.desc_setor) DES_GRUPO,'
      'pr.id_linha COD_SUBGRUPO,'
      'TRIM(pr.desc_linha) DES_SUBGRUPO,'
      'NULL DES_GENERICO,'
      'pr.id_classificacao COD_APLICACAO,'
      'pr.desc_classificacao DES_APLICACAO,'
      'TRIM(pr.referencia) COD_REFERENCIA,'
      ''
      '/*------------------------'
      'TRIM( CASE'
      '        WHEN COALESCE(cl.ind_curva,'#39#39')<>'#39#39' THEN'
      '          cl.ind_curva'
      '        ELSE'
      '          '#39'C'#39
      '      END) CLA_CURVA_ABC,'
      '------------------------*/'
      #39'E'#39' CLA_CURVA_ABC, ---------------ODIR'
      ''
      'NULL COD_FAMILIA_PRECO,'
      'NULL DES_FAMILIA_PRECO,'
      'NULL DTA_ULT_COMPRA,'
      '0 COD_FOR_ULT_COMPRA,'
      'NULL DES_FOR_ULT_COMPRA,'
      '0.00 QTD_ULT_COMPRA,'
      '0.00 VLR_UNI_ULT_COMPRA,'
      '0.00 VLR_TOT_ULT_COMPRA,'
      '0.00 VLR_UNI_COMPRA,'
      '0 PER_DESCONTO,'
      'NULL DTA_ULT_VENDA,'
      'NULL COD_CLI_ULT_VENDA,'
      'NULL DES_CLI_ULT_VENDA,'
      'NULL QTD_ULT_VENDA,'
      'NULL VLR_UNI_ULT_VENDA,'
      'NULL VLR_TOT_ULT_VENDA,'
      
        'CAST(ROUND(COALESCE(es.PRECO_VENDA,0.00),2) AS NUMERIC(12,2)) VL' +
        'R_UNI_VENDA,'
      'NULL COD_LISTA_VENDA,'
      'NULL DES_LISTA_VENDA,'
      'NULL COD_LISTA_COMPRA,'
      'NULL DES_LISTA_COMPRA,'
      'COALESCE(es.CUSTO_MEDIO,0.00) VLR_CUSTO_MEDIO,'
      '0.00 VLR_TOT_VENDA,'
      '0.00 VLR_TOT_COMPRA,'
      '0.00 VLR_BRUTO,'
      '0.00 VLR_DESCONTOS,'
      '0.00 VLR_DESPESAS,'
      '0.00 VLR_FRETE,'
      #39'N'#39' IND_SOMA_IPI_BASE_ICMS,'
      #39'N'#39' IND_SOMA_FRETE_BASE_ICMS,'
      #39'N'#39' IND_SOMA_DESPESA_BASE_ICMS,'
      #39'N'#39' IND_SOMA_IPI_BASE_ST,'
      #39'N'#39' IND_SOMA_FRETE_BASE_ST,'
      #39'N'#39' IND_SOMA_DESPESA_BASE_ST,'
      'NULL COD_SIT_TRIBUTARIA,'
      #39'00'#39' COD_IPI,'
      #39'P'#39' IND_IPI,'
      '0.00 PER_IPI,'
      '0.00 VLR_IPI,'
      'null COD_ICMS,'
      '0.00 PER_REDUCAO_ICMS,'
      '0.00 VLR_REDUCAO_ICMS,'
      '0.00 VLR_BASE_ICMS,'
      '0.00 PER_ICMS,'
      '0.00 VLR_ICMS,'
      'NULL COD_GRUPO_ST,'
      'NULL DES_GRUPO_ST,'
      '0.00 PER_MARGEM_ST,'
      'NULL IND_ST,'
      '0.00 VLR_BASE_ST,'
      '0.00 PER_ST,'
      '0.00 VLR_ST,'
      '0.00 PER_REPASSE,'
      '0.00 VLR_REPASSE,'
      'NULL COD_COMPROVANTE_ICMS,'
      'TRIM(pr.referencia) COD_REFERENCIA_FORN, -----------Odir'
      'pr.cod_fornecedor COD_FORNECEDOR,'
      'TRIM(fo.nome_cliente) DES_FORNECEDOR,'
      'fo.tipo_cliente TIP_PESSOA,'
      'TRIM(fo.email_cliente) DES_EMAIL,'
      'COALESCE(dm.dias_uteis,0) QTD_NR_DIAS,'
      '5 QTD_NR_MESES,'
      '5 QTD_TOT_MESES,'
      '29000 COD_COMPRADOR,'
      #39'Calculado em: 17.06.2019 10:42:30 por Odir'#39' BLOB_TEXTO,'
      #39'N'#39' IND_TRANSF,'
      'NULL DTA_LIM_TRANSF,'
      '0 QTD_TRANSF,'
      #39'SIM'#39' IND_USAR,'
      '0 IND_QTD_ACIMA,'
      '0 QTD_SUGERIDA_ANO,'
      '0 QTD_TRANSF_PERIODO,'
      '0 QTD_TRANSF_ANO,'
      ''
      '--------------- COALESCE(cl.est_minimo, 0) EST_MINIMO,'
      '0 EST_MINIMO, ----------ODIR'
      ''
      '0 DIAS_ESTOCAGEM,'
      'COALESCE(DM.qtd_venda,0) QTD_DEMANDA_DIA,'
      ''
      'CAST(CASE'
      
        '       WHEN ( ((COALESCE(es.quantidade,0))=0) or (COALESCE(dm.qt' +
        'd_venda_dia,0)=0) ) THEN'
      '         0'
      '       ELSE'
      
        '        (COALESCE(es.quantidade,0) / COALESCE(dm.qtd_venda_dia,0' +
        '))'
      '     END'
      
        'AS INTEGER) QTD_DEMANDA_ANO, ------- Utilizado para Apresentar d' +
        'ia de estocagens'
      ''
      '0 QTD_DIAS_ANO,'
      'pr.dt_inclusao DATAINCLUSAO,'
      'TRIM(fo.uf_cliente) ESTADO,'
      'pr.dt_update DATAALTERACAO'
      ''
      'FROM LINXPRODUTOS pr'
      
        '-----------          LEFT JOIN LINXLOJAS fi              ON fi.e' +
        'mpresa=29'
      
        '          LEFT JOIN LINXPRODUTOSDETALHES es   ON es.cod_produto=' +
        'pr.cod_produto'
      
        '                                             AND es.empresa=29 -' +
        '- fi.empresa ------------ODIR'
      
        '          LEFT JOIN LINXCLIENTESFORNEC fo     ON fo.cod_cliente=' +
        'pr.cod_fornecedor'
      
        '-----------          LEFT JOIN ES_FINAN_CURVA_ABC cl     ON cl.c' +
        'od_linx=es.empresa  ------------ODIR'
      
        '-----------                                             AND cl.c' +
        'od_prod_linx=pr.cod_produto'
      
        '          LEFT JOIN ES_DEMANDAS_4MESES dm     ON dm.cod_linx=es.' +
        'empresa'
      
        '                                             AND dm.cod_prod_lin' +
        'x=pr.cod_produto'
      ''
      'WHERE pr.desativado='#39'N'#39
      'AND   NOT (COALESCE(pr.id_setor,0) in (17, 20, 25))'
      'AND   NOT (COALESCE(pr.id_linha ,0) in (33))'
      'AND   NOT (COALESCE(pr.id_colecao ,0) <> 197)'
      'AND   NOT (COALESCE(pr.id_colecao ,0) in (294, 587))'
      'AND   NOT (COALESCE(pr.cod_fornecedor,0) in (6, 1014, 260))'
      'AND   pr.cod_fornecedor IN ('#39'267'#39')'
      ''
      'ORDER BY pr.nome')
    SQLConnection = DMBelShopPedidos.SQLC
    Left = 56
    Top = 114
  end
  object DSP_PedUltCompra: TDataSetProvider
    DataSet = SQLQ_PedUltCompra
    Options = [poRetainServerOrder]
    Left = 100
    Top = 221
  end
  object CDS_PedUltCompra: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_PedUltCompra'
    Left = 148
    Top = 204
    object CDS_PedUltCompraDTA_ULT_COMPRA: TSQLTimeStampField
      FieldName = 'DTA_ULT_COMPRA'
    end
    object CDS_PedUltCompraCOD_FOR_ULT_COMPRA: TIntegerField
      FieldName = 'COD_FOR_ULT_COMPRA'
    end
    object CDS_PedUltCompraDES_FOR_ULT_COMPRA: TStringField
      FieldName = 'DES_FOR_ULT_COMPRA'
      Size = 60
    end
    object CDS_PedUltCompraQTD_ULT_COMPRA: TFMTBCDField
      FieldName = 'QTD_ULT_COMPRA'
      Precision = 15
      Size = 4
    end
    object CDS_PedUltCompraVLR_UNI_ULT_COMPRA: TFMTBCDField
      FieldName = 'VLR_UNI_ULT_COMPRA'
      Precision = 15
      Size = 4
    end
    object CDS_PedUltCompraVLR_TOT_ULT_COMPRA: TFMTBCDField
      FieldName = 'VLR_TOT_ULT_COMPRA'
      Precision = 15
      Size = 4
    end
    object CDS_PedUltCompraVLR_UNI_COMPRA: TFMTBCDField
      FieldName = 'VLR_UNI_COMPRA'
      Precision = 15
      Size = 4
    end
    object CDS_PedUltCompraPRECO_UNITARIO: TFMTBCDField
      FieldName = 'PRECO_UNITARIO'
      Precision = 15
    end
    object CDS_PedUltCompraCOD_IPI: TStringField
      FieldName = 'COD_IPI'
      Size = 5
    end
    object CDS_PedUltCompraPER_IPI: TFMTBCDField
      FieldName = 'PER_IPI'
      Precision = 15
      Size = 2
    end
    object CDS_PedUltCompraCOD_ICMS: TStringField
      FieldName = 'COD_ICMS'
      Size = 5
    end
    object CDS_PedUltCompraPER_ICMS: TFMTBCDField
      FieldName = 'PER_ICMS'
      Precision = 15
      Size = 2
    end
    object CDS_PedUltCompraPER_ST: TFMTBCDField
      FieldName = 'PER_ST'
      Precision = 15
      Size = 2
    end
  end
  object SQLQ_PedUltCompra: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      ' select FIRST 1'
      ' ml.data_lancamento DTA_ULT_COMPRA,'
      ' ml.codigo_cliente COD_FOR_ULT_COMPRA,'
      ' fo.nome_cliente DES_FOR_ULT_COMPRA,'
      ' ml.quantidade QTD_ULT_COMPRA,'
      ' ml.valor_liquido VLR_UNI_ULT_COMPRA,'
      ' ml.valor_total VLR_TOT_ULT_COMPRA,'
      ' ml.valor_liquido VLR_UNI_COMPRA,'
      ' ml.preco_unitario,'
      ' ml.cst_ipi COD_IPI,'
      ' ml.aliquota_ipi PER_IPI,'
      
        ' SUBSTRING(ml.cst_icms FROM (POSITION('#39'.'#39', ml.cst_icms))+1 for 2' +
        ') COD_ICMS,'
      ' ml.aliquota_icms PER_ICMS,'
      ' ml.aliquota_icms_st PER_ST'
      ''
      ' FROM LINXMOVIMENTO ml, LINXCLIENTESFORNEC fo'
      ' WHERE ml.codigo_cliente=fo.cod_cliente'
      ' AND   ml.operacao='#39'E'#39
      ' AND   COALESCE(ml.tipo_transacao,'#39'E'#39')='#39'E'#39
      ' AND   COALESCE(ml.id_cfop,0) not in (1910, 2910)'
      ' AND   ml.cancelado='#39'N'#39
      ' AND   ml.excluido='#39'N'#39
      ' AND   ml.data_lancamento=(SELECT MAX(ml1.data_lancamento)'
      '                           FROM LINXMOVIMENTO ml1'
      '                           WHERE ml1.cod_produto= ml.cod_produto'
      '                           AND   ml1.empresa    = ml.empresa'
      '                           AND   ml1.operacao   = ml.operacao'
      '                           AND   ml1.id_cfop    = ml.id_cfop'
      '                           AND   ml1.cancelado  = ml.cancelado'
      '                           AND   ml1.excluido   = ml.excluido'
      '                           AND   ml1.documento  = ml.documento'
      
        '                           AND   ml1.codigo_cliente  = ml.codigo' +
        '_cliente'
      
        '                           AND   COALESCE(ml1.tipo_transacao,'#39'E'#39 +
        ')='#39'E'#39')'
      ' AND   ml.cod_produto=20114'
      ' AND   ml.empresa=28')
    SQLConnection = DMBelShopPedidos.SQLC
    Left = 56
    Top = 202
  end
  object DSP_ParamCurvaABC: TDataSetProvider
    DataSet = SQLQ_ParamCurvaABC
    Options = [poRetainServerOrder]
    Left = 100
    Top = 293
  end
  object CDS_ParamCurvaABC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ParamCurvaABC'
    Left = 148
    Top = 276
    object CDS_ParamCurvaABCIND_CURVA: TIntegerField
      FieldName = 'IND_CURVA'
      Required = True
    end
    object CDS_ParamCurvaABCCURVA: TStringField
      FieldName = 'CURVA'
      FixedChar = True
      Size = 1
    end
    object CDS_ParamCurvaABCPER_CURVA: TStringField
      FieldName = 'PER_CURVA'
      Size = 50
    end
    object CDS_ParamCurvaABCQTD_DIAS: TFMTBCDField
      FieldName = 'QTD_DIAS'
      Precision = 15
      Size = 2
    end
    object CDS_ParamCurvaABCQTD_MIN: TFMTBCDField
      FieldName = 'QTD_MIN'
      Precision = 15
      Size = 2
    end
    object CDS_ParamCurvaABCPER_CORTE: TStringField
      FieldName = 'PER_CORTE'
      Size = 50
    end
  end
  object SQLQ_ParamCurvaABC: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT t.cod_aux Ind_Curva,'
      '       CASE'
      '         WHEN t.cod_aux=1 THEN'
      '           '#39'A'#39
      '         WHEN t.cod_aux=2 THEN'
      '           '#39'B'#39
      '         WHEN t.cod_aux=3 THEN'
      '           '#39'C'#39
      '         WHEN t.cod_aux=4 THEN'
      '           '#39'D'#39
      '         WHEN t.cod_aux=5 THEN'
      '           '#39'E'#39
      '       END CURVA,'
      '       Coalesce(t.des_aux,0)  Per_Curva,'
      '       Coalesce(t.vlr_aux,0)  Qtd_Dias,'
      '       Coalesce(t.vlr_aux1,0) Qtd_Min,'
      '       Coalesce(t.des_aux1,0) Per_Corte'
      'FROM TAB_AUXILIAR t'
      'WHERE t.tip_aux=2'
      'ORDER BY t.cod_aux'
      ''
      '')
    SQLConnection = DMBelShopPedidos.SQLC
    Left = 56
    Top = 274
  end
end
