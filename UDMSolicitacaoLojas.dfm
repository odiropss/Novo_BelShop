object DMSolicitacaoLojas: TDMSolicitacaoLojas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 466
  Top = 217
  Height = 378
  Width = 351
  object SQLC: TSQLConnection
    ConnectionName = 'BelShop'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=\\localhost\C:\Projetos\BelShop\Dados\BelShop.FDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'gds32.dll'
    Left = 48
    Top = 16
  end
  object SDS_Busca: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 55
    Top = 97
  end
  object DSP_Busca: TDataSetProvider
    DataSet = SDS_Busca
    Left = 108
    Top = 110
  end
  object CDS_Busca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Busca'
    Left = 157
    Top = 96
  end
  object SDS_DtaHoraServidor: TSQLDataSet
    CommandText = 
      'select current_timestamp, current_date, current_time'#13#10'from rdb$d' +
      'atabase'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 167
    Top = 35
  end
  object SDS_AcomprarLoja: TSQLDataSet
    CommandText = 'SELECT *'#13#10'FROM OC_COMPRAR_LOJAS o'#13#10'WHERE o.num_seq<1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 55
    Top = 177
  end
  object DSP_AcomprarLoja: TDataSetProvider
    DataSet = SDS_AcomprarLoja
    Left = 108
    Top = 190
  end
  object CDS_AcomprarLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_AcomprarLoja'
    Left = 157
    Top = 176
    object CDS_AcomprarLojaNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
      Required = True
    end
    object CDS_AcomprarLojaNUM_DOCUMENTO: TIntegerField
      FieldName = 'NUM_DOCUMENTO'
      Required = True
    end
    object CDS_AcomprarLojaDTA_DOCUMENTO: TSQLTimeStampField
      FieldName = 'DTA_DOCUMENTO'
    end
    object CDS_AcomprarLojaIND_OC_GERADA: TStringField
      FieldName = 'IND_OC_GERADA'
      Size = 1
    end
    object CDS_AcomprarLojaDTA_OC_GERADA: TSQLTimeStampField
      FieldName = 'DTA_OC_GERADA'
    end
    object CDS_AcomprarLojaNUM_OC_GERADA: TIntegerField
      FieldName = 'NUM_OC_GERADA'
    end
    object CDS_AcomprarLojaOBS_OC: TStringField
      FieldName = 'OBS_OC'
      Size = 2000
    end
    object CDS_AcomprarLojaCOD_EMPRESA: TStringField
      FieldName = 'COD_EMPRESA'
      Size = 6
    end
    object CDS_AcomprarLojaDES_EMPRESA: TStringField
      FieldName = 'DES_EMPRESA'
      Size = 60
    end
    object CDS_AcomprarLojaCOD_ITEM: TStringField
      FieldName = 'COD_ITEM'
      Size = 6
    end
    object CDS_AcomprarLojaDES_ITEM: TStringField
      FieldName = 'DES_ITEM'
      Size = 80
    end
    object CDS_AcomprarLojaQTD_SUGERIDA: TFMTBCDField
      FieldName = 'QTD_SUGERIDA'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaQTD_ACOMPRAR: TFMTBCDField
      FieldName = 'QTD_ACOMPRAR'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaQTD_SALDO: TFMTBCDField
      FieldName = 'QTD_SALDO'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaQTD_TRANSITO: TFMTBCDField
      FieldName = 'QTD_TRANSITO'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaQTD_DISPONIVEL: TFMTBCDField
      FieldName = 'QTD_DISPONIVEL'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaQTD_MEDIA_MES: TFMTBCDField
      FieldName = 'QTD_MEDIA_MES'
      Precision = 15
      Size = 4
    end
    object CDS_AcomprarLojaQTD_MEDIA_DIA: TFMTBCDField
      FieldName = 'QTD_MEDIA_DIA'
      Precision = 15
      Size = 4
    end
    object CDS_AcomprarLojaQTD_DEM_MES1: TFMTBCDField
      FieldName = 'QTD_DEM_MES1'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaQTD_DEM_MES2: TFMTBCDField
      FieldName = 'QTD_DEM_MES2'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaQTD_DEM_MES3: TFMTBCDField
      FieldName = 'QTD_DEM_MES3'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaQTD_DEM_MES4: TFMTBCDField
      FieldName = 'QTD_DEM_MES4'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaQTD_DEM_MES5: TFMTBCDField
      FieldName = 'QTD_DEM_MES5'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaQTD_DEM_MES6: TFMTBCDField
      FieldName = 'QTD_DEM_MES6'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaQTD_DEM_MES7: TFMTBCDField
      FieldName = 'QTD_DEM_MES7'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaQTD_DEM_MES8: TFMTBCDField
      FieldName = 'QTD_DEM_MES8'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaUNI_COMPRA: TIntegerField
      FieldName = 'UNI_COMPRA'
    end
    object CDS_AcomprarLojaUNI_VENDA: TIntegerField
      FieldName = 'UNI_VENDA'
    end
    object CDS_AcomprarLojaCOD_BARRAS: TStringField
      FieldName = 'COD_BARRAS'
      Size = 19
    end
    object CDS_AcomprarLojaCOD_GRUPO: TStringField
      FieldName = 'COD_GRUPO'
      Size = 3
    end
    object CDS_AcomprarLojaDES_GRUPO: TStringField
      FieldName = 'DES_GRUPO'
      Size = 30
    end
    object CDS_AcomprarLojaCOD_SUBGRUPO: TStringField
      FieldName = 'COD_SUBGRUPO'
      Size = 7
    end
    object CDS_AcomprarLojaDES_SUBGRUPO: TStringField
      FieldName = 'DES_SUBGRUPO'
      Size = 30
    end
    object CDS_AcomprarLojaDES_GENERICO: TStringField
      FieldName = 'DES_GENERICO'
      Size = 80
    end
    object CDS_AcomprarLojaCOD_APLICACAO: TStringField
      FieldName = 'COD_APLICACAO'
      Size = 4
    end
    object CDS_AcomprarLojaDES_APLICACAO: TStringField
      FieldName = 'DES_APLICACAO'
      Size = 30
    end
    object CDS_AcomprarLojaCOD_REFERENCIA: TStringField
      FieldName = 'COD_REFERENCIA'
      Size = 30
    end
    object CDS_AcomprarLojaCLA_CURVA_ABC: TStringField
      FieldName = 'CLA_CURVA_ABC'
      Size = 1
    end
    object CDS_AcomprarLojaCOD_FAMILIA_PRECO: TStringField
      FieldName = 'COD_FAMILIA_PRECO'
      Size = 4
    end
    object CDS_AcomprarLojaDES_FAMILIA_PRECO: TStringField
      FieldName = 'DES_FAMILIA_PRECO'
      Size = 40
    end
    object CDS_AcomprarLojaDTA_ULT_COMPRA: TDateField
      FieldName = 'DTA_ULT_COMPRA'
    end
    object CDS_AcomprarLojaCOD_FOR_ULT_COMPRA: TStringField
      FieldName = 'COD_FOR_ULT_COMPRA'
      Size = 6
    end
    object CDS_AcomprarLojaDES_FOR_ULT_COMPRA: TStringField
      FieldName = 'DES_FOR_ULT_COMPRA'
      Size = 40
    end
    object CDS_AcomprarLojaQTD_ULT_COMPRA: TFMTBCDField
      FieldName = 'QTD_ULT_COMPRA'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaVLR_UNI_ULT_COMPRA: TFMTBCDField
      FieldName = 'VLR_UNI_ULT_COMPRA'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaVLR_TOT_ULT_COMPRA: TFMTBCDField
      FieldName = 'VLR_TOT_ULT_COMPRA'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaVLR_UNI_COMPRA: TFMTBCDField
      FieldName = 'VLR_UNI_COMPRA'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaPER_DESCONTO: TFMTBCDField
      FieldName = 'PER_DESCONTO'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaDTA_ULT_VENDA: TDateField
      FieldName = 'DTA_ULT_VENDA'
    end
    object CDS_AcomprarLojaCOD_CLI_ULT_VENDA: TStringField
      FieldName = 'COD_CLI_ULT_VENDA'
      Size = 6
    end
    object CDS_AcomprarLojaDES_CLI_ULT_VENDA: TStringField
      FieldName = 'DES_CLI_ULT_VENDA'
      Size = 40
    end
    object CDS_AcomprarLojaQTD_ULT_VENDA: TFMTBCDField
      FieldName = 'QTD_ULT_VENDA'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaVLR_UNI_ULT_VENDA: TFMTBCDField
      FieldName = 'VLR_UNI_ULT_VENDA'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaVLR_TOT_ULT_VENDA: TFMTBCDField
      FieldName = 'VLR_TOT_ULT_VENDA'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaVLR_UNI_VENDA: TFMTBCDField
      FieldName = 'VLR_UNI_VENDA'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaCOD_LISTA_VENDA: TStringField
      FieldName = 'COD_LISTA_VENDA'
      Size = 4
    end
    object CDS_AcomprarLojaDES_LISTA_VENDA: TStringField
      FieldName = 'DES_LISTA_VENDA'
      Size = 30
    end
    object CDS_AcomprarLojaCOD_LISTA_COMPRA: TStringField
      FieldName = 'COD_LISTA_COMPRA'
      Size = 4
    end
    object CDS_AcomprarLojaDES_LISTA_COMPRA: TStringField
      FieldName = 'DES_LISTA_COMPRA'
      Size = 30
    end
    object CDS_AcomprarLojaVLR_CUSTO_MEDIO: TFMTBCDField
      FieldName = 'VLR_CUSTO_MEDIO'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaVLR_TOT_VENDA: TFMTBCDField
      FieldName = 'VLR_TOT_VENDA'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaVLR_TOT_COMPRA: TFMTBCDField
      FieldName = 'VLR_TOT_COMPRA'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaVLR_BRUTO: TFMTBCDField
      FieldName = 'VLR_BRUTO'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaVLR_DESCONTOS: TFMTBCDField
      FieldName = 'VLR_DESCONTOS'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaVLR_DESPESAS: TFMTBCDField
      FieldName = 'VLR_DESPESAS'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaVLR_FRETE: TFMTBCDField
      FieldName = 'VLR_FRETE'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaIND_SOMA_IPI_BASE_ICMS: TStringField
      FieldName = 'IND_SOMA_IPI_BASE_ICMS'
      Size = 1
    end
    object CDS_AcomprarLojaIND_SOMA_FRETE_BASE_ICMS: TStringField
      FieldName = 'IND_SOMA_FRETE_BASE_ICMS'
      Size = 1
    end
    object CDS_AcomprarLojaIND_SOMA_DESPESA_BASE_ICMS: TStringField
      FieldName = 'IND_SOMA_DESPESA_BASE_ICMS'
      Size = 1
    end
    object CDS_AcomprarLojaIND_SOMA_IPI_BASE_ST: TStringField
      FieldName = 'IND_SOMA_IPI_BASE_ST'
      Size = 1
    end
    object CDS_AcomprarLojaIND_SOMA_FRETE_BASE_ST: TStringField
      FieldName = 'IND_SOMA_FRETE_BASE_ST'
      Size = 1
    end
    object CDS_AcomprarLojaIND_SOMA_DESPESA_BASE_ST: TStringField
      FieldName = 'IND_SOMA_DESPESA_BASE_ST'
      Size = 1
    end
    object CDS_AcomprarLojaCOD_SIT_TRIBUTARIA: TStringField
      FieldName = 'COD_SIT_TRIBUTARIA'
      Size = 2
    end
    object CDS_AcomprarLojaCOD_IPI: TStringField
      FieldName = 'COD_IPI'
      Size = 2
    end
    object CDS_AcomprarLojaIND_IPI: TStringField
      FieldName = 'IND_IPI'
      Size = 1
    end
    object CDS_AcomprarLojaPER_IPI: TFMTBCDField
      FieldName = 'PER_IPI'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaVLR_IPI: TFMTBCDField
      FieldName = 'VLR_IPI'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaCOD_ICMS: TStringField
      FieldName = 'COD_ICMS'
      Size = 2
    end
    object CDS_AcomprarLojaPER_REDUCAO_ICMS: TFMTBCDField
      FieldName = 'PER_REDUCAO_ICMS'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaVLR_REDUCAO_ICMS: TFMTBCDField
      FieldName = 'VLR_REDUCAO_ICMS'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaVLR_BASE_ICMS: TFMTBCDField
      FieldName = 'VLR_BASE_ICMS'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaPER_ICMS: TFMTBCDField
      FieldName = 'PER_ICMS'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaVLR_ICMS: TFMTBCDField
      FieldName = 'VLR_ICMS'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaCOD_GRUPO_ST: TIntegerField
      FieldName = 'COD_GRUPO_ST'
    end
    object CDS_AcomprarLojaDES_GRUPO_ST: TStringField
      FieldName = 'DES_GRUPO_ST'
      Size = 30
    end
    object CDS_AcomprarLojaPER_MARGEM_ST: TFMTBCDField
      FieldName = 'PER_MARGEM_ST'
      Precision = 15
      Size = 4
    end
    object CDS_AcomprarLojaIND_ST: TStringField
      FieldName = 'IND_ST'
      Size = 1
    end
    object CDS_AcomprarLojaVLR_BASE_ST: TFMTBCDField
      FieldName = 'VLR_BASE_ST'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaPER_ST: TFMTBCDField
      FieldName = 'PER_ST'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaVLR_ST: TFMTBCDField
      FieldName = 'VLR_ST'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaPER_REPASSE: TFMTBCDField
      FieldName = 'PER_REPASSE'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaVLR_REPASSE: TFMTBCDField
      FieldName = 'VLR_REPASSE'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaCOD_COMPROVANTE_ICMS: TStringField
      FieldName = 'COD_COMPROVANTE_ICMS'
      Size = 3
    end
    object CDS_AcomprarLojaCOD_REFERENCIA_FORN: TStringField
      FieldName = 'COD_REFERENCIA_FORN'
      Size = 14
    end
    object CDS_AcomprarLojaCOD_FORNECEDOR: TStringField
      FieldName = 'COD_FORNECEDOR'
      Size = 6
    end
    object CDS_AcomprarLojaDES_FORNECEDOR: TStringField
      FieldName = 'DES_FORNECEDOR'
      Size = 40
    end
    object CDS_AcomprarLojaTIP_PESSOA: TStringField
      FieldName = 'TIP_PESSOA'
      Size = 1
    end
    object CDS_AcomprarLojaDES_EMAIL: TStringField
      FieldName = 'DES_EMAIL'
      Size = 80
    end
    object CDS_AcomprarLojaQTD_NR_DIAS: TIntegerField
      FieldName = 'QTD_NR_DIAS'
    end
    object CDS_AcomprarLojaQTD_NR_MESES: TIntegerField
      FieldName = 'QTD_NR_MESES'
    end
    object CDS_AcomprarLojaQTD_TOT_MESES: TIntegerField
      FieldName = 'QTD_TOT_MESES'
    end
    object CDS_AcomprarLojaCOD_COMPRADOR: TIntegerField
      FieldName = 'COD_COMPRADOR'
    end
    object CDS_AcomprarLojaBLOB_TEXTO: TMemoField
      FieldName = 'BLOB_TEXTO'
      BlobType = ftMemo
      Size = 1
    end
    object CDS_AcomprarLojaIND_TRANSF: TStringField
      FieldName = 'IND_TRANSF'
      Size = 1
    end
    object CDS_AcomprarLojaDTA_LIM_TRANSF: TDateField
      FieldName = 'DTA_LIM_TRANSF'
    end
    object CDS_AcomprarLojaQTD_TRANSF: TFMTBCDField
      FieldName = 'QTD_TRANSF'
      Precision = 15
      Size = 2
    end
    object CDS_AcomprarLojaIND_USAR: TStringField
      FieldName = 'IND_USAR'
      Size = 3
    end
    object CDS_AcomprarLojaIND_QTD_ACIMA: TFMTBCDField
      FieldName = 'IND_QTD_ACIMA'
      Precision = 15
      Size = 2
    end
  end
end
