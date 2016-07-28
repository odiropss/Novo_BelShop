object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 247
  Top = 112
  Height = 598
  Width = 1054
  object CDS_Pessoas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 264
    Top = 40
    object CDS_PessoasCODIGO: TStringField
      FieldName = 'CODIGO'
    end
    object CDS_PessoasCODIGO_IBGE: TIntegerField
      FieldName = 'CODIGO_IBGE'
    end
    object CDS_PessoasMOVTO: TStringField
      FieldName = 'MOVTO'
      Size = 1
    end
    object CDS_PessoasINDEX: TIntegerField
      FieldName = 'INDEX'
    end
  end
  object DS_Pessoas: TDataSource
    DataSet = CDS_Pessoas
    Left = 328
    Top = 48
  end
  object CDS_Prod: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 264
    Top = 104
    object CDS_ProdCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 6
    end
  end
  object DS_Prod: TDataSource
    DataSet = CDS_Prod
    Left = 320
    Top = 112
  end
  object CDS_ST: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 360
    object CDS_STCOD_PART: TStringField
      FieldName = 'COD_PART'
    end
    object CDS_STNUM_DOC: TStringField
      FieldName = 'NUM_DOC'
      Size = 10
    end
    object CDS_STDT_DOC: TStringField
      FieldName = 'DT_DOC'
      Size = 8
    end
    object CDS_STDT_E_S: TStringField
      FieldName = 'DT_E_S'
      Size = 8
    end
    object CDS_STSERIE: TStringField
      FieldName = 'SERIE'
      Size = 6
    end
    object CDS_STVL_DOC: TStringField
      FieldName = 'VL_DOC'
    end
    object CDS_STNUM_DOC_ORIGINAL: TStringField
      FieldName = 'NUM_DOC_ORIGINAL'
      Visible = False
      Size = 10
    end
  end
  object DS_ST: TDataSource
    DataSet = CDS_ST
    Left = 320
    Top = 360
  end
  object CDS_NatOperacao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 160
    object CDS_NatOperacaoCOD_NATOPERACAO: TStringField
      FieldName = 'COD_NATOPERACAO'
      Size = 10
    end
    object CDS_NatOperacaoDES_NATOPERACAO: TStringField
      FieldName = 'DES_NATOPERACAO'
      Size = 60
    end
  end
  object DS_NatOperacao: TDataSource
    DataSet = CDS_NatOperacao
    Left = 320
    Top = 176
  end
  object CDS_CFopProd: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 872
    Top = 280
    object CDS_CFopProdUF_EMIT: TStringField
      FieldName = 'UF_EMIT'
      Size = 2
    end
    object CDS_CFopProdUF_DEST: TStringField
      FieldName = 'UF_DEST'
      Size = 2
    end
    object CDS_CFopProdCOD_CODOPER: TStringField
      FieldName = 'COD_CODOPER'
      Size = 10
    end
    object CDS_CFopProdDES_CODOPER: TStringField
      FieldName = 'DES_CODOPER'
      Size = 60
    end
    object CDS_CFopProdCOD_NATOPER: TStringField
      FieldName = 'COD_NATOPER'
      Size = 10
    end
    object CDS_CFopProdDES_NATOPER: TStringField
      FieldName = 'DES_NATOPER'
      Size = 60
    end
    object CDS_CFopProdCST_ICMS: TStringField
      FieldName = 'CST_ICMS'
      Size = 6
    end
    object CDS_CFopProdCST_ICMS_OK: TStringField
      FieldName = 'CST_ICMS_OK'
      Size = 6
    end
    object CDS_CFopProdCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Size = 6
    end
    object CDS_CFopProdCST_IPI_OK: TStringField
      FieldName = 'CST_IPI_OK'
      Size = 6
    end
    object CDS_CFopProdCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 6
    end
    object CDS_CFopProdCST_PIS_OK: TStringField
      FieldName = 'CST_PIS_OK'
      Size = 6
    end
    object CDS_CFopProdCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 6
    end
    object CDS_CFopProdCST_COFINS_OK: TStringField
      FieldName = 'CST_COFINS_OK'
      Size = 6
    end
    object CDS_CFopProdCFOP: TStringField
      FieldName = 'CFOP'
      Size = 6
    end
  end
  object DS_CFopProd: TDataSource
    DataSet = CDS_CFopProd
    Left = 928
    Top = 296
  end
  object DS_C190: TDataSource
    DataSet = CDS_C190
    Left = 312
    Top = 272
  end
  object CDS_C190: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 264
    object CDS_C190CST_ICMS: TStringField
      FieldName = 'CST_ICMS'
      Size = 3
    end
    object CDS_C190CFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object CDS_C190ALIQ_ICMS: TFloatField
      FieldName = 'ALIQ_ICMS'
      DisplayFormat = '0,.00'
    end
    object CDS_C190VL_OPR: TFloatField
      FieldName = 'VL_OPR'
      DisplayFormat = '0,.00'
    end
    object CDS_C190VL_BC_ICMS: TFloatField
      FieldName = 'VL_BC_ICMS'
      DisplayFormat = '0,.00'
    end
    object CDS_C190VL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
      DisplayFormat = '0,.00'
    end
    object CDS_C190VL_BC_ICMS_ST: TFloatField
      FieldName = 'VL_BC_ICMS_ST'
      DisplayFormat = '0,.00'
    end
    object CDS_C190VL_ICMS_ST: TFloatField
      FieldName = 'VL_ICMS_ST'
      DisplayFormat = '0,.00'
    end
    object CDS_C190VL_RED_BC: TFloatField
      FieldName = 'VL_RED_BC'
      DisplayFormat = '0,.00'
    end
    object CDS_C190VL_IPI: TFloatField
      FieldName = 'VL_IPI'
      DisplayFormat = '0,.00'
    end
  end
  object CDS_Nota_ST_Errada: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 424
    object CDS_Nota_ST_ErradaCOD_PART: TStringField
      FieldName = 'COD_PART'
    end
    object CDS_Nota_ST_ErradaNUM_DOC: TStringField
      FieldName = 'NUM_DOC'
      Size = 10
    end
    object CDS_Nota_ST_ErradaDT_DOC: TStringField
      FieldName = 'DT_DOC'
      Size = 8
    end
    object CDS_Nota_ST_ErradaDT_E_S: TStringField
      FieldName = 'DT_E_S'
      Size = 8
    end
    object CDS_Nota_ST_ErradaSERIE: TStringField
      FieldName = 'SERIE'
      Size = 6
    end
    object CDS_Nota_ST_ErradaVL_DOC: TStringField
      FieldName = 'VL_DOC'
    end
    object CDS_Nota_ST_ErradaVL_ST: TStringField
      FieldName = 'VL_ST'
    end
  end
  object DS_Nota_ST_Errada: TDataSource
    DataSet = CDS_Nota_ST_Errada
    Left = 344
    Top = 440
  end
  object CDS_CFopZerados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 552
    Top = 98
    object CDS_CFopZeradosCOD_NAT: TStringField
      FieldName = 'COD_NAT'
      Size = 10
    end
    object CDS_CFopZeradosCOD_OPER: TIntegerField
      FieldName = 'COD_OPER'
    end
    object CDS_CFopZeradosCST_ICMS: TStringField
      FieldName = 'CST_ICMS'
      Size = 3
    end
    object CDS_CFopZeradosCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Size = 3
    end
    object CDS_CFopZeradosCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 3
    end
    object CDS_CFopZeradosCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 3
    end
    object CDS_CFopZeradosOPER_ESTADO: TStringField
      FieldName = 'OPER_ESTADO'
      Size = 3
    end
    object CDS_CFopZeradosIND_ST: TStringField
      FieldName = 'IND_ST'
      Size = 3
    end
    object CDS_CFopZeradosCFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
  end
  object CDS_IBGE_UF: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 170
    object CDS_IBGE_UFUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object CDS_IBGE_UFMUN: TStringField
      FieldName = 'MUN'
      Size = 2
    end
  end
  object SQLC: TSQLConnection
    ConnectionName = 'BelShop'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=\\LOCALHOST\C:\Projetos\BelShop\Dados\BELSHOP.FDB'
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
    Left = 40
    Top = 8
  end
  object SDS_Busca: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 35
    Top = 76
  end
  object CDS_Busca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Busca'
    Left = 116
    Top = 81
  end
  object DSP_Busca: TDataSetProvider
    DataSet = SDS_Busca
    Left = 76
    Top = 93
  end
  object DS_Busca: TDataSource
    DataSet = CDS_Busca
    Left = 152
    Top = 93
  end
  object SDS_DtaHoraServidor: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 80
    Top = 176
  end
  object DS_CFopZerados: TDataSource
    DataSet = CDS_CFopZerados
    Left = 648
    Top = 104
  end
end
