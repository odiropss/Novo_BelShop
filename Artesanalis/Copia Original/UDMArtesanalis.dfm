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
    Left = 60
    Top = 88
  end
  object DSP_Busca: TDataSetProvider
    DataSet = SQLQ_Busca
    Options = [poFetchBlobsOnDemand, poRetainServerOrder]
    Left = 116
    Top = 101
  end
  object CDS_Busca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Busca'
    Left = 164
    Top = 88
  end
  object DS_Busca: TDataSource
    DataSet = CDS_Busca
    Left = 220
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
    Left = 60
    Top = 232
  end
  object DSP_Unidade: TDataSetProvider
    DataSet = SQLQ_Unidade
    Options = [poFetchBlobsOnDemand, poRetainServerOrder]
    Left = 116
    Top = 246
  end
  object CDS_Unidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Unidade'
    Left = 164
    Top = 232
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
    Left = 220
    Top = 246
  end
  object SQLQ_BuacaRapida: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 60
    Top = 144
  end
  object DSP_BuacaRapida: TDataSetProvider
    DataSet = SQLQ_BuacaRapida
    Options = [poFetchBlobsOnDemand, poRetainServerOrder]
    Left = 116
    Top = 159
  end
  object CDS_BuacaRapida: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_BuacaRapida'
    Left = 164
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
    Left = 60
    Top = 304
  end
  object DSP_MateriaPrima: TDataSetProvider
    DataSet = SQLQ_MateriaPrima
    Options = [poFetchBlobsOnDemand, poRetainServerOrder]
    Left = 116
    Top = 318
  end
  object CDS_MateriaPrima: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_MateriaPrima'
    Left = 164
    Top = 304
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
    Left = 220
    Top = 318
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
    Left = 60
    Top = 416
  end
  object DSP_Producao: TDataSetProvider
    DataSet = SQLQ_Producao
    Options = [poFetchBlobsOnDemand, poRetainServerOrder]
    Left = 116
    Top = 430
  end
  object CDS_Producao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Producao'
    Left = 164
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
    Left = 220
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
    Left = 60
    Top = 480
  end
  object DSP_ProducaoMatPrima: TDataSetProvider
    DataSet = SQLQ_ProducaoMatPrima
    Options = [poFetchBlobsOnDemand, poRetainServerOrder]
    Left = 116
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
    Left = 164
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
      DisplayFormat = '0.,00000'
      Precision = 18
      Size = 5
    end
    object CDS_ProducaoMatPrimaCOD_PRODUCAO: TIntegerField
      FieldName = 'COD_PRODUCAO'
    end
  end
  object Ds_ProducaoMatPrima: TDataSource
    DataSet = CDS_ProducaoMatPrima
    Left = 220
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
  object SQLQ_Produto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT pr.cod_produto, pr.des_produto,'
      'pr.cod_unidade, un.des_unidade, un.qtd_unidade,'
      'pr.cod_producao, pd.des_aux des_producao,'
      'pr.vlr_unitatio'
      'FROM produto pr, unidade un, tab_auxiliar pd'
      'WHERE pr.cod_unidade=un.cod_unidade'
      'AND   pr.cod_producao=pd.cod_aux'
      'AND   pd.tip_aux=1'
      ''
      'Order by pr.des_produto')
    SQLConnection = SQLC
    Left = 300
    Top = 224
  end
  object DSP_Produto: TDataSetProvider
    DataSet = SQLQ_Produto
    Options = [poFetchBlobsOnDemand, poRetainServerOrder]
    Left = 356
    Top = 238
  end
  object CDS_Produto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Produto'
    Left = 404
    Top = 224
    object CDS_ProdutoCOD_PRODUTO: TIntegerField
      DisplayLabel = 'C'#243'd'
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object CDS_ProdutoDES_PRODUTO: TStringField
      DisplayLabel = 'Descri'#231#227'o Produto'
      FieldName = 'DES_PRODUTO'
      Size = 60
    end
    object CDS_ProdutoCOD_UNIDADE: TIntegerField
      DisplayLabel = 'C'#243'd Unid'
      FieldName = 'COD_UNIDADE'
    end
    object CDS_ProdutoDES_UNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'DES_UNIDADE'
      Size = 6
    end
    object CDS_ProdutoQTD_UNIDADE: TIntegerField
      DisplayLabel = 'Qtd/Unid'
      FieldName = 'QTD_UNIDADE'
    end
    object CDS_ProdutoCOD_PRODUCAO: TIntegerField
      DisplayLabel = 'C'#243'd Prod'
      FieldName = 'COD_PRODUCAO'
    end
    object CDS_ProdutoDES_PRODUCAO: TStringField
      DisplayLabel = 'Produ'#231#227'o'
      FieldName = 'DES_PRODUCAO'
      Size = 50
    end
    object CDS_ProdutoVLR_UNITATIO: TFMTBCDField
      DisplayLabel = 'Vlr Unit'
      FieldName = 'VLR_UNITATIO'
      DisplayFormat = '0,.00'
      Precision = 18
      Size = 2
    end
  end
  object DS_Produto: TDataSource
    DataSet = CDS_Produto
    Left = 460
    Top = 238
  end
end
