object DMNFeAnaliza: TDMNFeAnaliza
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 240
  Top = 123
  Height = 430
  Width = 756
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
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 40
    Top = 80
  end
end
