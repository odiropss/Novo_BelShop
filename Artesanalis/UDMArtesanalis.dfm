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
    Connected = True
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
  object SQLQ_Producao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select pd.cod_aux cod_producao, pd.des_aux des_producao'
      'from tab_auxiliar pd'
      'where pd.tip_aux = 1'
      'order by 2  ')
    SQLConnection = SQLC
    Left = 44
    Top = 416
  end
  object DSP_Producao: TDataSetProvider
    DataSet = SQLQ_Producao
    Options = [poFetchBlobsOnDemand, poRetainServerOrder]
    Left = 93
    Top = 430
  end
  object CDS_Producao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Producao'
    Left = 148
    Top = 416
    object CDS_ProducaoCOD_PRODUCAO: TIntegerField
      DisplayLabel = 'C'#243'd'
      FieldName = 'COD_PRODUCAO'
      Required = True
    end
    object CDS_ProducaoDES_PRODUCAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_PRODUCAO'
      Size = 50
    end
  end
  object DS_Producao: TDataSource
    DataSet = CDS_Producao
    Left = 196
    Top = 430
  end
  object SQLQ_ProducaoMatPrima: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'Cod_Producao'
        ParamType = ptInput
        Value = '1'
      end>
    SQL.Strings = (
      
        'SELECT pd.cod_materiaprima, mp.des_materiaprima, pd.per_utilizac' +
        'ao, pd.cod_producao'
      'FROM producao pd, materiaprima mp'
      'WHERE pd.cod_materiaprima = mp.cod_materiaprima AND'
      '      pd.cod_producao = :Cod_Producao'
      'ORDER BY 2  '
      '')
    SQLConnection = SQLC
    Left = 44
    Top = 480
  end
  object DSP_ProducaoMatPrima: TDataSetProvider
    DataSet = SQLQ_ProducaoMatPrima
    Options = [poFetchBlobsOnDemand, poRetainServerOrder]
    Left = 93
    Top = 494
  end
  object CDS_ProducaoMatPrima: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'COD_PRODUCAO'
    MasterFields = 'COD_PRODUCAO'
    MasterSource = DS_Producao
    PacketRecords = 0
    Params = <>
    ProviderName = 'DSP_ProducaoMatPrima'
    Left = 148
    Top = 480
    object CDS_ProducaoMatPrimaCOD_MATERIAPRIMA: TIntegerField
      DisplayLabel = 'C'#243'd'
      FieldName = 'COD_MATERIAPRIMA'
      Required = True
    end
    object CDS_ProducaoMatPrimaDES_MATERIAPRIMA: TStringField
      DisplayLabel = 'Descri'#231#227'o Mat'#233'ria-Prima'
      FieldName = 'DES_MATERIAPRIMA'
      Size = 60
    end
    object CDS_ProducaoMatPrimaPER_UTILIZACAO: TFMTBCDField
      DisplayLabel = '% Utiliza'#231#227'o'
      FieldName = 'PER_UTILIZACAO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 5
    end
    object CDS_ProducaoMatPrimaCOD_PRODUCAO: TIntegerField
      FieldName = 'COD_PRODUCAO'
    end
  end
  object Ds_ProducaoMatPrima: TDataSource
    DataSet = CDS_ProducaoMatPrima
    Left = 196
    Top = 494
  end
  object SDS_Pesquisa: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 256
    Top = 10
  end
  object DSP_Pesquisa: TDataSetProvider
    DataSet = SDS_Pesquisa
    Options = [poRetainServerOrder]
    Left = 297
    Top = 27
  end
  object CDS_Pesquisa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Pesquisa'
    Left = 337
    Top = 7
  end
  object DS_Pesquisa: TDataSource
    DataSet = CDS_Pesquisa
    Left = 381
    Top = 27
  end
end
