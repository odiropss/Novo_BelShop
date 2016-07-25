object DMGraficos: TDMGraficos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 314
  Top = 151
  Height = 468
  Width = 846
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
    Left = 39
    Top = 105
  end
  object DSP_Busca: TDataSetProvider
    DataSet = SDS_Busca
    Left = 92
    Top = 118
  end
  object CDS_Busca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Busca'
    Left = 141
    Top = 104
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
  object SDS_BuscaRapida: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 39
    Top = 193
  end
  object DSP_BuscaRapida: TDataSetProvider
    DataSet = SDS_BuscaRapida
    Left = 92
    Top = 206
  end
  object CDS_BuscaRapida: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_BuscaRapida'
    Left = 141
    Top = 192
  end
  object DataSource1: TDataSource
    DataSet = CDS_V_Grafico
    Left = 336
    Top = 96
  end
  object CDS_V_Grafico: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 24
    object CDS_V_GraficoCOD_LOJA: TStringField
      FieldName = 'COD_LOJA'
      Size = 6
    end
    object CDS_V_GraficoVLR_TOTAL: TCurrencyField
      FieldName = 'VLR_TOTAL'
      DisplayFormat = '0,.00'
      currency = False
    end
    object CDS_V_GraficoVLR_OBJETIVO: TCurrencyField
      FieldName = 'VLR_OBJETIVO'
      DisplayFormat = '0,.00'
      currency = False
    end
    object CDS_V_GraficoPER_ALCANCADO: TCurrencyField
      FieldName = 'PER_ALCANCADO'
      DisplayFormat = '0,.00'
      currency = False
    end
    object CDS_V_GraficoVLR_SALAO: TCurrencyField
      FieldName = 'VLR_SALAO'
      DisplayFormat = '0,.00'
    end
    object CDS_V_GraficoVLR_SALAO_OBJETIVO: TCurrencyField
      FieldName = 'VLR_SALAO_OBJETIVO'
      DisplayFormat = '0,.00'
    end
    object CDS_V_GraficoPER_SALAO: TCurrencyField
      FieldName = 'PER_SALAO'
      DisplayFormat = '0,.00'
    end
    object CDS_V_GraficoCONECTADO: TStringField
      FieldName = 'CONECTADO'
      Size = 1
    end
  end
end
