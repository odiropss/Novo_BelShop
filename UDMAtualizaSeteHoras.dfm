object DMAtualizaSeteHoras: TDMAtualizaSeteHoras
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 321
  Top = 117
  Height = 539
  Width = 699
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
    Left = 48
    Top = 81
  end
  object DSP_Busca: TDataSetProvider
    DataSet = SDS_Busca
    Options = [poRetainServerOrder]
    Left = 98
    Top = 94
  end
  object CDS_Busca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Busca'
    Left = 149
    Top = 80
  end
  object SDS_DtaHoraServidor: TSQLDataSet
    CommandText = 
      'select current_timestamp, current_date, current_time'#13#10'from rdb$d' +
      'atabase'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 207
    Top = 11
  end
  object SDS_BuscaRapida: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 48
    Top = 153
  end
  object DSP_BuscaRapida: TDataSetProvider
    DataSet = SDS_BuscaRapida
    Options = [poRetainServerOrder]
    Left = 98
    Top = 166
  end
  object CDS_BuscaRapida: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_BuscaRapida'
    Left = 149
    Top = 152
  end
  object SDS_Lojas: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 48
    Top = 225
  end
  object DSP_Lojas: TDataSetProvider
    DataSet = SDS_Lojas
    Options = [poRetainServerOrder]
    Left = 98
    Top = 238
  end
  object CDS_Lojas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Lojas'
    Left = 149
    Top = 224
  end
  object SDS_While: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 272
    Top = 89
  end
  object DSP_While: TDataSetProvider
    DataSet = SDS_While
    Options = [poRetainServerOrder]
    Left = 322
    Top = 102
  end
  object CDS_While: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_While'
    Left = 365
    Top = 88
  end
  object SDS_Pesquisa: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 272
    Top = 161
  end
  object DSP_Pesquisa: TDataSetProvider
    DataSet = SDS_Pesquisa
    Options = [poRetainServerOrder]
    Left = 322
    Top = 174
  end
  object CDS_Pesquisa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Pesquisa'
    Left = 365
    Top = 160
  end
  object SDS_MovtoLinx: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 272
    Top = 233
  end
  object DSP_MovtoLinx: TDataSetProvider
    DataSet = SDS_MovtoLinx
    Options = [poRetainServerOrder]
    Left = 322
    Top = 246
  end
  object CDS_MovtoLinx: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_MovtoLinx'
    Left = 365
    Top = 232
  end
end
