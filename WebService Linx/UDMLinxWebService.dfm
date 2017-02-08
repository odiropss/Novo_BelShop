object DMLinxWebService: TDMLinxWebService
  OldCreateOrder = False
  Left = 414
  Top = 100
  Height = 368
  Width = 598
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
  object SDS_Busca: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 40
    Top = 88
  end
  object DSP_Busca: TDataSetProvider
    DataSet = SDS_Busca
    Options = [poRetainServerOrder]
    Left = 89
    Top = 102
  end
  object CDS_Busca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Busca'
    Left = 136
    Top = 89
  end
  object SDS_Lojas: TSQLDataSet
    CommandText = 
      'SELECT em.cod_filial, em.num_cnpj, em.cod_linx, em.dta_inicio_li' +
      'nx'#13#10'FROM EMP_CONEXOES em'#13#10'WHERE em.cod_linx<>0'#13#10'ORDER BY 1'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 40
    Top = 152
  end
  object DSP_Lojas: TDataSetProvider
    DataSet = SDS_Lojas
    Options = [poRetainServerOrder]
    Left = 89
    Top = 166
  end
  object CDS_Lojas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Lojas'
    Left = 136
    Top = 153
    object CDS_LojasCOD_FILIAL: TStringField
      FieldName = 'COD_FILIAL'
      Required = True
      Size = 2
    end
    object CDS_LojasNUM_CNPJ: TStringField
      FieldName = 'NUM_CNPJ'
      Size = 18
    end
    object CDS_LojasCOD_LINX: TIntegerField
      FieldName = 'COD_LINX'
    end
    object CDS_LojasDTA_INICIO_LINX: TDateField
      FieldName = 'DTA_INICIO_LINX'
    end
  end
end
