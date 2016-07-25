object DMPermissoes: TDMPermissoes
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
    Top = 217
  end
  object DSP_Busca: TDataSetProvider
    DataSet = SDS_Busca
    Left = 92
    Top = 230
  end
  object CDS_Busca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Busca'
    Left = 141
    Top = 216
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
  object SDS_Permissoes: TSQLDataSet
    CommandText = 
      'SELECT ul.cod_loja, ul.cod_usuario,'#13#10'us.des_usuario, us.ind_alte' +
      'rasenha, us.ind_excluir'#13#10'FROM usuarios_sidicom_lojas ul, usuario' +
      's_sidicom us'#13#10'WHERE ul.cod_usuario=us.cod_usuario'#13#10'AND   ((ul.in' +
      'd_enviar='#39'SIM'#39') OR (ul.ind_pendente='#39'SIM'#39'))'#13#10'ORDER BY 1,2'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 40
    Top = 120
  end
  object CDS_Permissoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Permissoes'
    Left = 168
    Top = 120
    object CDS_PermissoesCOD_LOJA: TStringField
      FieldName = 'COD_LOJA'
      FixedChar = True
      Size = 2
    end
    object CDS_PermissoesCOD_USUARIO: TStringField
      FieldName = 'COD_USUARIO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object CDS_PermissoesDES_USUARIO: TStringField
      FieldName = 'DES_USUARIO'
      FixedChar = True
    end
    object CDS_PermissoesIND_ALTERASENHA: TStringField
      FieldName = 'IND_ALTERASENHA'
      FixedChar = True
      Size = 3
    end
    object CDS_PermissoesIND_EXCLUIR: TStringField
      FieldName = 'IND_EXCLUIR'
      FixedChar = True
      Size = 3
    end
  end
  object DSP_Permissoes: TDataSetProvider
    DataSet = SDS_Permissoes
    Left = 104
    Top = 136
  end
end
