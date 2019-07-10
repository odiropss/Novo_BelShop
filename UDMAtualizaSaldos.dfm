object DMAtualizaSaldos: TDMAtualizaSaldos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 240
  Top = 116
  Height = 349
  Width = 716
  object SQLC: TSQLConnection
    ConnectionName = 'BelShop'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=C:\Projetos\BelShop\Dados\BELSHOP_11.FDB'
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
    Left = 24
    Top = 16
  end
  object SQLQ_Empresas: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 56
    Top = 96
  end
  object DSP_Empresas: TDataSetProvider
    DataSet = SQLQ_Empresas
    Options = [poRetainServerOrder]
    Left = 108
    Top = 110
  end
  object CDS_Empresas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Empresas'
    Left = 157
    Top = 96
  end
  object SDS_DtaHoraServidor: TSQLDataSet
    CommandText = 
      'select current_timestamp, current_date, current_time'#13#10'from rdb$d' +
      'atabase'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 143
    Top = 35
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 48
    Top = 192
  end
end
