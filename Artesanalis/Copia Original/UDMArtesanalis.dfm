object DMArtesanalis: TDMArtesanalis
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 242
  Top = 116
  Height = 602
  Width = 1104
  object SQLC: TSQLConnection
    ConnectionName = 'Artesanalis'
    DriverName = 'UIB FireBird15'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpUIBfire15.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=UIB FireBird15'
      'Database=localhost:C:\Projetos\BelShop\Dados\ARTESANALIS.FDB'
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
    VendorLib = 'fbclient.dll'
    Left = 44
    Top = 16
  end
  object SQLQ_Busca: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 44
    Top = 88
  end
  object DSP_Busca: TDataSetProvider
    DataSet = SQLQ_Busca
    Options = [poFetchBlobsOnDemand, poRetainServerOrder]
    Left = 92
    Top = 101
  end
  object CDS_Busca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Busca'
    Left = 148
    Top = 88
  end
  object DS_Busca: TDataSource
    DataSet = CDS_Busca
    Left = 196
    Top = 101
  end
  object SQLQ_Unidade: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      'FROM UNIDADE un'
      'ORDER BY un.des_unidade')
    SQLConnection = SQLC
    Left = 44
    Top = 248
  end
  object DSP_Unidade: TDataSetProvider
    DataSet = SQLQ_Unidade
    Options = [poFetchBlobsOnDemand, poRetainServerOrder]
    Left = 93
    Top = 262
  end
  object CDS_Unidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Unidade'
    Left = 148
    Top = 248
    object CDS_UnidadeCOD_UNIDADE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_UNIDADE'
      Required = True
    end
    object CDS_UnidadeDES_UNIDADE: TStringField
      DisplayLabel = 'Abrev. Unidade'
      FieldName = 'DES_UNIDADE'
      Size = 6
    end
    object CDS_UnidadeQTD_UNIDADE: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTD_UNIDADE'
    end
  end
  object DS_Unidade: TDataSource
    DataSet = CDS_Unidade
    Left = 196
    Top = 262
  end
  object SQLQ_BuacaRapida: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 44
    Top = 144
  end
  object DSP_BuacaRapida: TDataSetProvider
    DataSet = SQLQ_BuacaRapida
    Options = [poFetchBlobsOnDemand, poRetainServerOrder]
    Left = 92
    Top = 159
  end
  object CDS_BuacaRapida: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_BuacaRapida'
    Left = 148
    Top = 144
  end
  object SQLQ_MateriaPrima: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'select MA.COD_MATERIAPRIMA, MA.DES_MATERIAPRIMA, MA.QTD_CONVERSA' +
        'O, MA.VLR_UNITATIO'
      'from MATERIAPRIMA MA'
      'order by 2  ')
    SQLConnection = SQLC
    Left = 44
    Top = 320
  end
  object DSP_MateriaPrima: TDataSetProvider
    DataSet = SQLQ_MateriaPrima
    Options = [poFetchBlobsOnDemand, poRetainServerOrder]
    Left = 93
    Top = 334
  end
  object CDS_MateriaPrima: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_MateriaPrima'
    Left = 148
    Top = 320
    object CDS_MateriaPrimaCOD_MATERIAPRIMA: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_MATERIAPRIMA'
      Required = True
    end
    object CDS_MateriaPrimaDES_MATERIAPRIMA: TStringField
      DisplayLabel = 'Mat'#233'ria-Prima'
      FieldName = 'DES_MATERIAPRIMA'
      Size = 60
    end
    object CDS_MateriaPrimaQTD_CONVERSAO: TIntegerField
      DisplayLabel = 'Qtd Convers'#227'o'
      FieldName = 'QTD_CONVERSAO'
    end
    object CDS_MateriaPrimaVLR_UNITATIO: TFMTBCDField
      DisplayLabel = '$ Unit'#225'rio'
      FieldName = 'VLR_UNITATIO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
  end
  object DS_MateriaPrima: TDataSource
    DataSet = CDS_MateriaPrima
    Left = 196
    Top = 334
  end
end
