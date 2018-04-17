object DMArtesanalis: TDMArtesanalis
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 228
  Top = 111
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
      '       pd.qtd_utilizacao, pd.per_utilizacao,'
      '       pd.preco_custo, pd.custo_medio,'
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
      '       0 qtd_utilizacao, 0.00000 per_utilizacao,'
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
    Left = 326
    Top = 176
  end
  object DSP_ProdutoProducao: TDataSetProvider
    DataSet = SQLQ_ProdutoProducao
    Options = [poFetchBlobsOnDemand, poRetainServerOrder]
    Left = 363
    Top = 190
  end
  object CDS_ProdutoProducao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ProdutoProducao'
    Left = 420
    Top = 176
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
    object CDS_ProdutoProducaoQTD_UTILIZACAO: TIntegerField
      DisplayLabel = 'Qtd Utilizar'
      FieldName = 'QTD_UTILIZACAO'
      DisplayFormat = '0,'
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
      DisplayFormat = '0,.0000'
      Precision = 18
      Size = 4
    end
    object CDS_ProdutoProducaoCUSTO_MEDIO: TFMTBCDField
      DisplayLabel = 'Custo M'#233'dio'
      FieldName = 'CUSTO_MEDIO'
      DisplayFormat = '0,.0000'
      Precision = 18
      Size = 4
    end
    object CDS_ProdutoProducaoPRECO_VENDA: TFMTBCDField
      DisplayLabel = 'P'#231' Venda'
      FieldName = 'PRECO_VENDA'
      DisplayFormat = '0,.0000'
      Precision = 18
      Size = 4
    end
    object CDS_ProdutoProducaoPER_MARGEM: TFMTBCDField
      DisplayLabel = '% Margem'
      FieldName = 'PER_MARGEM'
      DisplayFormat = '0,.00000'
      Precision = 18
      Size = 5
    end
    object CDS_ProdutoProducaoVLR_MARGEM: TFMTBCDField
      DisplayLabel = 'Vlr Margem'
      FieldName = 'VLR_MARGEM'
      DisplayFormat = '0,.0000'
      Precision = 18
      Size = 4
    end
  end
  object DS_ProdutoProducao: TDataSource
    DataSet = CDS_ProdutoProducao
    Left = 476
    Top = 190
  end
  object SQLQ_ProdutoMatPrima: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select *'
      'From MATERIAPRIMA ma'
      'Order By ma.des_materiaprima')
    SQLConnection = SQLC
    Left = 324
    Top = 112
  end
  object DSP_ProdutoMatPrima: TDataSetProvider
    DataSet = SQLQ_ProdutoMatPrima
    Options = [poFetchBlobsOnDemand, poRetainServerOrder]
    Left = 371
    Top = 126
  end
  object CDS_ProdutoMatPrima: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ProdutoMatPrima'
    Left = 412
    Top = 112
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
      DisplayFormat = '0,.00'
      Precision = 18
      Size = 2
    end
    object CDS_ProdutoMatPrimaCUSTO_MEDIO: TFMTBCDField
      FieldName = 'CUSTO_MEDIO'
      DisplayFormat = '0,.00'
      Precision = 18
      Size = 2
    end
    object CDS_ProdutoMatPrimaQTD_ESTOQUE: TFMTBCDField
      FieldName = 'QTD_ESTOQUE'
      DisplayFormat = '0,.00000'
      Precision = 18
      Size = 4
    end
  end
  object DS_ProdutoMatPrima: TDataSource
    DataSet = CDS_ProdutoMatPrima
    Left = 468
    Top = 126
  end
  object CDS_V_DoctoItens: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    IndexFieldNames = 'NUM_SEQ'
    Params = <>
    Left = 64
    Top = 360
    object CDS_V_DoctoItensNUM_SEQ_DOCTO: TIntegerField
      FieldName = 'NUM_SEQ_DOCTO'
    end
    object CDS_V_DoctoItensNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
    end
    object CDS_V_DoctoItensCOD_PRODUTO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PRODUTO'
    end
    object CDS_V_DoctoItensDES_PRODUTO: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'DES_PRODUTO'
      Size = 60
    end
    object CDS_V_DoctoItensQTD_MOVTO: TFMTBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTD_MOVTO'
      DisplayFormat = '0,.0000'
      Precision = 18
      Size = 2
    end
    object CDS_V_DoctoItensVLR_UNITARIO: TFMTBCDField
      DisplayLabel = '$ Unit'#225'rio'
      FieldName = 'VLR_UNITARIO'
      DisplayFormat = '0,.00'
      Precision = 18
      Size = 2
    end
    object CDS_V_DoctoItensVLR_PRODUTO: TCurrencyField
      DisplayLabel = '$ Produto'
      FieldName = 'VLR_PRODUTO'
      DisplayFormat = '0,.00'
    end
    object CDS_V_DoctoItensPER_DESCONTO: TCurrencyField
      DisplayLabel = '% Desconto'
      FieldName = 'PER_DESCONTO'
      DisplayFormat = '0.00'
    end
    object CDS_V_DoctoItensVLR_DESCONTO: TFMTBCDField
      DisplayLabel = '$ Desconto'
      FieldName = 'VLR_DESCONTO'
      DisplayFormat = '0,.00'
      Size = 2
    end
    object CDS_V_DoctoItensVLR_TOTAL: TFMTBCDField
      DisplayLabel = '$ Total  Produto'
      FieldName = 'VLR_TOTAL'
      DisplayFormat = '0,.00'
      Precision = 18
      Size = 2
    end
    object CDS_V_DoctoItensVlr_TotalCalculado: TAggregateField
      Alignment = taRightJustify
      DisplayLabel = '$ Total Calculado'
      FieldName = 'Vlr_TotalCalculado'
      Active = True
      DisplayFormat = '0,.00'
      Expression = 'SUM(VLR_TOTAL)'
    end
    object CDS_V_DoctoItensVlr_TotalProdutos: TAggregateField
      Alignment = taRightJustify
      DisplayLabel = '$ Total Produtos'
      FieldName = 'Vlr_TotalProdutos'
      Active = True
      DisplayFormat = '0,.00'
      Expression = 'SUM(QTD_MOVTO * VLR_UNITARIO)'
    end
    object CDS_V_DoctoItensVlr_TotalDesconto: TAggregateField
      Alignment = taRightJustify
      DisplayLabel = '$ Total Descontos'
      FieldName = 'Vlr_TotalDesconto'
      Active = True
      DisplayFormat = '0,.00'
      Expression = 'SUM(VLR_DESCONTO)'
    end
  end
  object DS_V_DoctoItens: TDataSource
    DataSet = CDS_V_DoctoItens
    Left = 124
    Top = 374
  end
  object SQLQ_Pessoas: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select *'
      'From PESSOAS p'
      'Where p.Cod_pessoa<0')
    SQLConnection = SQLC
    Left = 36
    Top = 448
  end
  object DSP_Pessoas: TDataSetProvider
    DataSet = SQLQ_Pessoas
    Options = [poFetchBlobsOnDemand, poRetainServerOrder]
    Left = 92
    Top = 462
  end
  object CDS_Pessoas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Pessoas'
    AfterOpen = CDS_PessoasAfterOpen
    Left = 140
    Top = 448
    object CDS_PessoasTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDS_PessoasCOD_PESSOA: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PESSOA'
      Required = True
    end
    object CDS_PessoasDES_PESSOA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'DES_PESSOA'
      Size = 60
    end
    object CDS_PessoasNUM_CNPJCPF: TStringField
      DisplayLabel = 'Cnpj/Cpf'
      FieldName = 'NUM_CNPJCPF'
      Size = 14
    end
    object CDS_PessoasENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Size = 60
    end
    object CDS_PessoasNUMERO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
    end
    object CDS_PessoasCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
    end
    object CDS_PessoasBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Size = 40
    end
    object CDS_PessoasCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object CDS_PessoasCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Size = 40
    end
    object CDS_PessoasUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object CDS_PessoasFONE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE'
    end
    object CDS_PessoasEMAIL: TStringField
      DisplayLabel = 'E-Mail'
      FieldName = 'EMAIL'
      Size = 50
    end
  end
  object DS_Pessoas: TDataSource
    DataSet = CDS_Pessoas
    Left = 196
    Top = 462
  end
  object SQLQ_VerProducao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SeqDoc'
        ParamType = ptInput
        Value = '29'
      end
      item
        DataType = ftString
        Name = 'CodProd'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'SeqItem'
        ParamType = ptInput
        Value = '1'
      end>
    SQL.Strings = (
      'select'
      'mp.cod_materiaprima, mp.des_materiaprima,'
      'mp.des_unidade, mp.preco_custo, mp.qtd_estoque Saldo_Atual,'
      
        'pd.qtd_utilizacao_mp, pd.per_utilizado_mp, pd.qtd_unid_utilizada' +
        '_mp,'
      'pd.qtd_baixa_est_mp, pd.vlr_unitario_mp, pd.vlr_total_mp'
      'from materiaprima mp, doctos_itens_mp pd'
      'where mp.cod_materiaprima=pd.cod_materiaprima'
      'and   pd.num_seq_docto=:SeqDoc'
      'and   pd.cod_produto=:CodProd'
      'And   pd.num_seq=:SeqItem'
      'order by 2')
    SQLConnection = SQLC
    Left = 324
    Top = 272
  end
  object DSP_VerProducao: TDataSetProvider
    DataSet = SQLQ_VerProducao
    Options = [poFetchBlobsOnDemand, poRetainServerOrder]
    Left = 371
    Top = 286
  end
  object CDS_VerProducao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_VerProducao'
    Left = 412
    Top = 272
    object CDS_VerProducaoCOD_MATERIAPRIMA: TIntegerField
      DisplayLabel = 'C'#243'd'
      FieldName = 'COD_MATERIAPRIMA'
      Required = True
    end
    object CDS_VerProducaoDES_MATERIAPRIMA: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_MATERIAPRIMA'
      Size = 60
    end
    object CDS_VerProducaoDES_UNIDADE: TStringField
      DisplayLabel = 'Unid'
      FieldName = 'DES_UNIDADE'
      Size = 15
    end
    object CDS_VerProducaoPRECO_CUSTO: TFMTBCDField
      DisplayLabel = '$ Custo'
      FieldName = 'PRECO_CUSTO'
      DisplayFormat = '0,.00'
      Precision = 18
      Size = 2
    end
    object CDS_VerProducaoSALDO_ATUAL: TFMTBCDField
      DisplayLabel = 'Saldo Atual'
      FieldName = 'SALDO_ATUAL'
      DisplayFormat = '0,.0000'
      Precision = 18
      Size = 4
    end
    object CDS_VerProducaoQTD_UTILIZACAO_MP: TIntegerField
      DisplayLabel = 'Qtd Total Utiliza'#231#227'o'
      FieldName = 'QTD_UTILIZACAO_MP'
      DisplayFormat = ',0'
    end
    object CDS_VerProducaoPER_UTILIZADO_MP: TFMTBCDField
      DisplayLabel = '% Total Utilizado'
      FieldName = 'PER_UTILIZADO_MP'
      DisplayFormat = '0,.00000'
      Precision = 18
      Size = 5
    end
    object CDS_VerProducaoQTD_UNID_UTILIZADA_MP: TFMTBCDField
      DisplayLabel = 'Qtd Unid Utilizada'
      FieldName = 'QTD_UNID_UTILIZADA_MP'
      DisplayFormat = '0,.00000'
      Precision = 18
      Size = 5
    end
    object CDS_VerProducaoQTD_BAIXA_EST_MP: TFMTBCDField
      DisplayLabel = 'Qtd Baixa Saldo'
      FieldName = 'QTD_BAIXA_EST_MP'
      DisplayFormat = '0,.00000'
      Precision = 18
      Size = 5
    end
    object CDS_VerProducaoVLR_UNITARIO_MP: TFMTBCDField
      DisplayLabel = '$ Unit'#225'rio'
      FieldName = 'VLR_UNITARIO_MP'
      DisplayFormat = '0,.0000'
      Precision = 18
      Size = 4
    end
    object CDS_VerProducaoVLR_TOTAL_MP: TFMTBCDField
      DisplayLabel = '$ Total'
      FieldName = 'VLR_TOTAL_MP'
      DisplayFormat = '0,.0000'
      Precision = 18
      Size = 4
    end
  end
  object Ds_VerProducao: TDataSource
    DataSet = CDS_VerProducao
    Left = 468
    Top = 286
  end
  object CDS_V_PVPedidos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 304
    Top = 336
    object CDS_V_PVPedidosCOD_CLIENTE: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_CLIENTE'
      Size = 10
    end
    object CDS_V_PVPedidosCLIENTE: TStringField
      DisplayLabel = 'Cliente'
      DisplayWidth = 32
      FieldName = 'CLIENTE'
      Size = 60
    end
    object CDS_V_PVPedidosDTA_EMISSAO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Emiss'#227'o'
      DisplayWidth = 15
      FieldName = 'DTA_EMISSAO'
    end
    object CDS_V_PVPedidosNUM_PEDIDO: TIntegerField
      DisplayLabel = 'Pedido'
      DisplayWidth = 12
      FieldName = 'NUM_PEDIDO'
      DisplayFormat = '0.'
    end
    object CDS_V_PVPedidosQTD_PRODUTO: TIntegerField
      DisplayLabel = 'Qtd Prod'
      FieldName = 'QTD_PRODUTO'
      DisplayFormat = '0,'
    end
    object CDS_V_PVPedidosVLR_UNITARIO: TFMTBCDField
      DisplayLabel = '$ Unit'#225'rio'
      DisplayWidth = 28
      FieldName = 'VLR_UNITARIO'
      DisplayFormat = '0,.00'
      Precision = 18
      Size = 2
    end
    object CDS_V_PVPedidosVLR_PRODUTOS: TFMTBCDField
      DisplayLabel = '$ Produtos'
      DisplayWidth = 28
      FieldName = 'VLR_PRODUTOS'
      DisplayFormat = '0,.00'
      Precision = 18
      Size = 2
    end
    object CDS_V_PVPedidosPER_DESCONTO: TBCDField
      DisplayLabel = '% Desc'
      DisplayWidth = 15
      FieldName = 'PER_DESCONTO'
      DisplayFormat = '0,.00'
      Precision = 9
      Size = 2
    end
    object CDS_V_PVPedidosVLR_DESCONTO: TFMTBCDField
      DisplayLabel = '$ Desconto'
      DisplayWidth = 28
      FieldName = 'VLR_DESCONTO'
      DisplayFormat = '0,.00'
      Precision = 18
      Size = 2
    end
    object CDS_V_PVPedidosVLR_TOTAL: TFMTBCDField
      DisplayLabel = 'Valor Total'
      DisplayWidth = 28
      FieldName = 'VLR_TOTAL'
      DisplayFormat = '0,.00'
      Precision = 18
      Size = 2
    end
    object CDS_V_PVPedidosPER_CONCEDIDO: TBCDField
      DisplayLabel = '% Conc'
      DisplayWidth = 15
      FieldName = 'PER_CONCEDIDO'
      DisplayFormat = '0,.00'
      Precision = 9
      Size = 2
    end
    object CDS_V_PVPedidosVLR_CONCEDIDO: TFMTBCDField
      DisplayLabel = '$ Concedido'
      DisplayWidth = 28
      FieldName = 'VLR_CONCEDIDO'
      DisplayFormat = '0,.00'
      Precision = 18
      Size = 2
    end
    object CDS_V_PVPedidosVLR_PAGAMENTO: TFMTBCDField
      DisplayLabel = '$ Pagamento'
      DisplayWidth = 28
      FieldName = 'VLR_PAGAMENTO'
      DisplayFormat = '0,.00'
      Precision = 18
      Size = 2
    end
    object CDS_V_PVPedidosSINTETICO: TStringField
      FieldName = 'SINTETICO'
      Size = 1
    end
    object CDS_V_PVPedidosORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object DS_V_PVPedidos: TDataSource
    DataSet = CDS_V_PVPedidos
    Left = 364
    Top = 358
  end
  object SQLQ_FluxoFinanceiro: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      'ff.num_seq,'
      'ff.cod_historico, pl.des_historico,'
      'ff.cod_fornecedor, fo.des_pessoa,'
      'ff.num_docto, ff.dta_emissao,'
      'ff.vlr_original, '
      'ff.num_prestacao, ff.num_prestacoes, ff.num_prazo,'
      'ff.dta_vencimento, ff.vlr_prestacao,'
      'vlr_pagamento, ff.dta_pagamento,'
      ''
      'CASE'
      '    WHEN ff.ind_desembolso='#39'A'#39' THEN'
      '      '#39'AMBAS'#39
      '    WHEN ff.ind_desembolso='#39'B'#39' THEN'
      '      '#39'BELSHOP'#39
      '    WHEN ff.ind_desembolso='#39'L'#39' THEN'
      '      '#39'LIXISSE'#39
      'END Desembolso'
      ''
      ''
      'FROM FLUXO_FINANCEIRO ff, PESSOAS fo, PLANO_CONTAS pl'
      ''
      'WHERE ff.cod_fornecedor=fo.cod_pessoa'
      'AND   ff.cod_historico=pl.cod_historico'
      'AND   ff.cod_fornecedor=1')
    SQLConnection = SQLC
    Left = 580
    Top = 32
  end
  object DSP_FluxoFinanceiro: TDataSetProvider
    DataSet = SQLQ_FluxoFinanceiro
    Options = [poFetchBlobsOnDemand, poRetainServerOrder]
    Left = 636
    Top = 46
  end
  object CDS_FluxoFinanceiro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_FluxoFinanceiro'
    Left = 684
    Top = 32
    object CDS_FluxoFinanceiroNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
      Required = True
    end
    object CDS_FluxoFinanceiroCOD_HISTORICO: TIntegerField
      DisplayLabel = 'C'#243'd Hist'
      FieldName = 'COD_HISTORICO'
    end
    object CDS_FluxoFinanceiroDES_HISTORICO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'DES_HISTORICO'
      Size = 50
    end
    object CDS_FluxoFinanceiroCOD_FORNECEDOR: TIntegerField
      DisplayLabel = 'C'#243'd Forn'
      FieldName = 'COD_FORNECEDOR'
    end
    object CDS_FluxoFinanceiroDES_PESSOA: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'DES_PESSOA'
      Size = 60
    end
    object CDS_FluxoFinanceiroNUM_DOCTO: TIntegerField
      DisplayLabel = 'N'#186' Docto'
      FieldName = 'NUM_DOCTO'
    end
    object CDS_FluxoFinanceiroDTA_EMISSAO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'DTA_EMISSAO'
    end
    object CDS_FluxoFinanceiroVLR_ORIGINAL: TFMTBCDField
      DisplayLabel = 'Vlr Original'
      FieldName = 'VLR_ORIGINAL'
      DisplayFormat = '0,.00'
      Precision = 18
      Size = 2
    end
    object CDS_FluxoFinanceiroNUM_PRESTACOES: TIntegerField
      DisplayLabel = 'Presta'#231#245'es'
      FieldName = 'NUM_PRESTACOES'
    end
    object CDS_FluxoFinanceiroNUM_PRESTACAO: TIntegerField
      DisplayLabel = 'N'#186' Prest'
      FieldName = 'NUM_PRESTACAO'
    end
    object CDS_FluxoFinanceiroNUM_PRAZO: TIntegerField
      FieldName = 'NUM_PRAZO'
    end
    object CDS_FluxoFinanceiroDTA_VENCIMENTO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Vencimento'
      FieldName = 'DTA_VENCIMENTO'
    end
    object CDS_FluxoFinanceiroVLR_PRESTACAO: TFMTBCDField
      DisplayLabel = 'Valor Docto'
      FieldName = 'VLR_PRESTACAO'
      DisplayFormat = '0,.00'
      Precision = 18
      Size = 2
    end
    object CDS_FluxoFinanceiroVLR_PAGAMENTO: TFMTBCDField
      DisplayLabel = 'Valor Pagamento'
      FieldName = 'VLR_PAGAMENTO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 1
    end
    object CDS_FluxoFinanceiroDTA_PAGAMENTO: TDateField
      DisplayLabel = 'Data Pagamento'
      FieldName = 'DTA_PAGAMENTO'
    end
    object CDS_FluxoFinanceiroDESEMBOLSO: TStringField
      DisplayLabel = 'Emp Desembolso'
      FieldName = 'DESEMBOLSO'
      FixedChar = True
      Size = 7
    end
  end
  object DS_FluxoFinanceiro: TDataSource
    DataSet = CDS_FluxoFinanceiro
    Left = 740
    Top = 46
  end
  object SDS_DtaHoraServidor: TSQLDataSet
    CommandText = 
      'select current_timestamp, current_date, current_time'#13#10'from rdb$d' +
      'atabase'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 132
    Top = 22
  end
end
