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
  object SQLQ_BuscaRapida: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 60
    Top = 144
  end
  object DSP_BuscaRapida: TDataSetProvider
    DataSet = SQLQ_BuscaRapida
    Options = [poFetchBlobsOnDemand, poRetainServerOrder]
    Left = 116
    Top = 159
  end
  object CDS_BuscaRapida: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_BuscaRapida'
    Left = 164
    Top = 144
  end
  object SQLQ_MateriaPrima: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select *'
      'From MATERIAPRIMA ma'
      'Order By ma.des_materiaprima')
    SQLConnection = SQLC
    Left = 44
    Top = 248
  end
  object DSP_MateriaPrima: TDataSetProvider
    DataSet = SQLQ_MateriaPrima
    Options = [poFetchBlobsOnDemand, poRetainServerOrder]
    Left = 100
    Top = 262
  end
  object CDS_MateriaPrima: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_MateriaPrima'
    Left = 148
    Top = 248
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
    object CDS_MateriaPrimaDES_UNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'DES_UNIDADE'
      Size = 15
    end
    object CDS_MateriaPrimaPRECO_CUSTO: TFMTBCDField
      DisplayLabel = 'P'#231' Custo'
      FieldName = 'PRECO_CUSTO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object CDS_MateriaPrimaCUSTO_MEDIO: TFMTBCDField
      DisplayLabel = 'Custo M'#233'dio'
      FieldName = 'CUSTO_MEDIO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object CDS_MateriaPrimaQTD_ESTOQUE: TFMTBCDField
      DisplayLabel = 'Saldo'
      FieldName = 'QTD_ESTOQUE'
      DisplayFormat = '0.0000'
      Precision = 18
      Size = 4
    end
  end
  object DS_MateriaPrima: TDataSource
    DataSet = CDS_MateriaPrima
    Left = 204
    Top = 262
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
  object SQLQ_ProdutoProducao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CodProd'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'CodProd'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT pd.cod_materiaprima, mp.des_materiaprima,'
      '       pd.per_utilizacao, pd.preco_custo, pd.custo_medio,'
      '       pd.preco_venda, pd.per_margem, pd.vlr_margem'
      'FROM PRODUCAO pd, MATERIAPRIMA mp'
      ''
      'WHERE pd.cod_materiaprima=mp.cod_materiaprima'
      ''
      'AND   pd.cod_produto=:CodProd'
      ''
      'union'
      ''
      'SELECT 999999 cod_materiaprima, '#39'TOTAIS'#39' des_materiaprima,'
      '       0.00000 per_utilizacao,'
      '       Sum(pd1.preco_custo) preco_custo,'
      '       SUM(pd1.custo_medio) custo_medio,'
      '       SUM(pd1.preco_venda) preco_venda,'
      '       SUM(pd1.per_margem) per_margem,'
      '       SUM(pd1.vlr_margem) vlr_margem'
      'FROM PRODUCAO pd1'
      ''
      'WHERE pd1.cod_produto=:CodProd'
      ''
      'Group by 1,2'
      ''
      ''
      'ORDER BY 2')
    SQLConnection = SQLC
    Left = 54
    Top = 432
  end
  object DSP_ProdutoProducao: TDataSetProvider
    DataSet = SQLQ_ProdutoProducao
    Options = [poFetchBlobsOnDemand, poRetainServerOrder]
    Left = 91
    Top = 446
  end
  object CDS_ProdutoProducao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ProdutoProducao'
    Left = 148
    Top = 432
    object CDS_ProdutoProducaoCOD_MATERIAPRIMA: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_MATERIAPRIMA'
      Required = True
    end
    object CDS_ProdutoProducaoDES_MATERIAPRIMA: TStringField
      DisplayLabel = 'Mat'#233'ria-Prima'
      FieldName = 'DES_MATERIAPRIMA'
      Size = 60
    end
    object CDS_ProdutoProducaoPER_UTILIZACAO: TFMTBCDField
      DisplayLabel = '% Utiliza'#231#227'o'
      FieldName = 'PER_UTILIZACAO'
      DisplayFormat = '0,.00000'
      Precision = 18
      Size = 5
    end
    object CDS_ProdutoProducaoPRECO_CUSTO: TFMTBCDField
      DisplayLabel = 'P'#231' Custo'
      FieldName = 'PRECO_CUSTO'
      DisplayFormat = '0,.00'
      Precision = 18
      Size = 2
    end
    object CDS_ProdutoProducaoCUSTO_MEDIO: TFMTBCDField
      DisplayLabel = 'Custo M'#233'dio'
      FieldName = 'CUSTO_MEDIO'
      DisplayFormat = '0,.00'
      Precision = 18
      Size = 2
    end
    object CDS_ProdutoProducaoPRECO_VENDA: TFMTBCDField
      DisplayLabel = 'P'#231' Venda'
      FieldName = 'PRECO_VENDA'
      DisplayFormat = '0,.00'
      Precision = 18
      Size = 2
    end
    object CDS_ProdutoProducaoPER_MARGEM: TFMTBCDField
      DisplayLabel = '% Margem'
      FieldName = 'PER_MARGEM'
      DisplayFormat = '0,.00'
      Precision = 18
      Size = 2
    end
    object CDS_ProdutoProducaoVLR_MARGEM: TFMTBCDField
      DisplayLabel = 'Vlr Margem'
      FieldName = 'VLR_MARGEM'
      DisplayFormat = '0,.00'
      Precision = 18
      Size = 2
    end
  end
  object DS_ProdutoProducao: TDataSource
    DataSet = CDS_ProdutoProducao
    Left = 220
    Top = 446
  end
  object SQLQ_ProdutoMatPrima: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select *'
      'From MATERIAPRIMA ma'
      'Order By ma.des_materiaprima')
    SQLConnection = SQLC
    Left = 52
    Top = 352
  end
  object DSP_ProdutoMatPrima: TDataSetProvider
    DataSet = SQLQ_ProdutoMatPrima
    Options = [poFetchBlobsOnDemand, poRetainServerOrder]
    Left = 99
    Top = 366
  end
  object CDS_ProdutoMatPrima: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ProdutoMatPrima'
    Left = 140
    Top = 352
    object CDS_ProdutoMatPrimaCOD_MATERIAPRIMA: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_MATERIAPRIMA'
      Required = True
    end
    object CDS_ProdutoMatPrimaDES_MATERIAPRIMA: TStringField
      DisplayLabel = 'Mat'#233'ria-Prima'
      FieldName = 'DES_MATERIAPRIMA'
      Size = 60
    end
    object CDS_ProdutoMatPrimaDES_UNIDADE: TStringField
      DisplayLabel = 'Unid'
      FieldName = 'DES_UNIDADE'
      Size = 15
    end
    object CDS_ProdutoMatPrimaPRECO_CUSTO: TFMTBCDField
      FieldName = 'PRECO_CUSTO'
      Precision = 18
      Size = 2
    end
    object CDS_ProdutoMatPrimaCUSTO_MEDIO: TFMTBCDField
      FieldName = 'CUSTO_MEDIO'
      Precision = 18
      Size = 2
    end
    object CDS_ProdutoMatPrimaQTD_ESTOQUE: TFMTBCDField
      FieldName = 'QTD_ESTOQUE'
      Precision = 18
      Size = 4
    end
  end
  object DS_ProdutoMatPrima: TDataSource
    DataSet = CDS_ProdutoMatPrima
    Left = 196
    Top = 366
  end
end
