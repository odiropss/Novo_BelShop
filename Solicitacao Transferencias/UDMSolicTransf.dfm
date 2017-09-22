object DMSolicTransf: TDMSolicTransf
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 242
  Top = 123
  Height = 490
  Width = 848
  object SQLC: TSQLConnection
    DriverName = 'UIB FireBird15'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpUIBfire15.dll'
    LoginPrompt = False
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
  object DSP_Pesquisa: TDataSetProvider
    DataSet = SQLQ_Pesquisa
    Options = [poRetainServerOrder]
    Left = 97
    Top = 211
  end
  object CDS_Pesquisa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Pesquisa'
    Left = 137
    Top = 191
  end
  object DS_Pesquisa: TDataSource
    DataSet = CDS_Pesquisa
    Left = 181
    Top = 211
  end
  object SQLQ_Pesquisa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 60
    Top = 184
  end
  object DSP_Solicitacao: TDataSetProvider
    DataSet = SQLQ_Solicitacao
    Options = [poRetainServerOrder]
    Left = 89
    Top = 307
  end
  object CDS_Solicitacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Solicitacao'
    Left = 129
    Top = 287
    object CDS_SolicitacaoDTA_SOLICITACAO: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DTA_SOLICITACAO'
    end
    object CDS_SolicitacaoNUM_SOLICITACAO: TIntegerField
      DisplayLabel = 'N'#186' Solicita'#231#227'o'
      FieldName = 'NUM_SOLICITACAO'
    end
    object CDS_SolicitacaoCOD_PROD_LINX: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PROD_LINX'
    end
    object CDS_SolicitacaoNOME: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'NOME'
      Size = 250
    end
    object CDS_SolicitacaoQTD_ESTOQUE: TFMTBCDField
      DisplayLabel = 'Estoque'
      FieldName = 'QTD_ESTOQUE'
      Precision = 15
      Size = 2
    end
    object CDS_SolicitacaoQTD_TRANSF: TFMTBCDField
      DisplayLabel = 'Transfer'#234'ncia'
      FieldName = 'QTD_TRANSF'
      Precision = 15
      Size = 2
    end
  end
  object DS_Solicitacao: TDataSource
    DataSet = CDS_Solicitacao
    Left = 173
    Top = 307
  end
  object SQLQ_Solicitacao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      'tr.dta_solicitacao, tr.num_solicitacao,'
      'tr.cod_prod_linx, TRIM(pr.nome) nome,'
      'tr.qtd_estoque, tr.qtd_transf'
      'FROM SOL_TRANSFERENCIA_CD tr, LINXPRODUTOS pr'
      'WHERE tr.cod_prod_linx=pr.cod_produto'
      'AND  tr.dta_solicitacao=CURRENT_DATE'
      'AND  tr.cod_loja_linx=5'
      'ORDER BY pr.nome')
    SQLConnection = SQLC
    Left = 52
    Top = 280
  end
  object Timer1: TTimer
    Interval = 1800000
    OnTimer = Timer1Timer
    Left = 360
    Top = 64
  end
end
