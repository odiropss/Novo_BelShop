object DMLinx: TDMLinx
  OldCreateOrder = False
  Left = 242
  Top = 116
  Height = 589
  Width = 991
  object SDS_Busca: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 41
    Top = 31
  end
  object DS_Busca: TDataSource
    DataSet = CDS_Busca
    Left = 168
    Top = 48
  end
  object DSP_Busca: TDataSetProvider
    DataSet = SDS_Busca
    Left = 84
    Top = 48
  end
  object CDS_Busca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Busca'
    Left = 124
    Top = 36
  end
  object DSP_OCProdLinx: TDataSetProvider
    DataSet = SQLQ_OCProdLinx
    Left = 84
    Top = 125
  end
  object CDS_OCProdLinx: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_OCProdLinx'
    Left = 124
    Top = 108
  end
  object SQLQ_OCProdLinx: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 40
    Top = 106
  end
end
