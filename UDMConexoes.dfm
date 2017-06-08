object DMConexoes: TDMConexoes
  OldCreateOrder = False
  Left = 175
  Top = 113
  Height = 607
  Width = 1116
  object IBDB_06: TIBDatabase
    DatabaseName = '\\LOCALHOST\C:\PROJETOS\BELSHOP\DADOS\BANCO_MATRIZ.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_06
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 176
    Top = 34
  end
  object IBDB_01: TIBDatabase
    DatabaseName = '\\LOCALHOST\C:\sidicom.new\BIGNEW.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_01
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 40
    Top = 34
  end
  object IBDB_02: TIBDatabase
    DatabaseName = 'C:\Projetos\BelShop\Dados\BANCO_Loja_01.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_02
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 40
    Top = 87
  end
  object IBDB_04: TIBDatabase
    DatabaseName = '\\187.7.111.228\C:\SIDICOM.NEW\BANCO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_04
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 40
    Top = 196
  end
  object IBDB_03: TIBDatabase
    DatabaseName = '\\201.86.212.9\C:\sidicom.new\BIGNEW.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_03
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 40
    Top = 142
  end
  object IBDB_05: TIBDatabase
    DatabaseName = '187.7.111.228:C:\SIDICOM.NEW\BANCO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_05
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 40
    Top = 250
  end
  object IBT_01: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_01
    AutoStopAction = saNone
    Left = 89
    Top = 34
  end
  object IBT_06: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_06
    AutoStopAction = saNone
    Left = 225
    Top = 34
  end
  object IBT_02: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_02
    AutoStopAction = saNone
    Left = 89
    Top = 87
  end
  object IBT_04: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_04
    AutoStopAction = saNone
    Left = 89
    Top = 196
  end
  object IBT_03: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_03
    AutoStopAction = saNone
    Left = 89
    Top = 142
  end
  object IBT_05: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_05
    AutoStopAction = saNone
    Left = 89
    Top = 250
  end
  object IBDB_10: TIBDatabase
    DatabaseName = '\\187.7.111.96\C:\SIDICOM.NEW\BANCO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_10
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 176
    Top = 254
  end
  object IBDB_08: TIBDatabase
    DatabaseName = '\\187.7.111.228\C:\SIDICOM.NEW\BANCO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_08
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 176
    Top = 144
  end
  object IBDB_07: TIBDatabase
    DatabaseName = '\\201.86.212.9\C:\sidicom.new\BIGNEW.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_07
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 176
    Top = 90
  end
  object IBDB_09: TIBDatabase
    DatabaseName = '\\187.5.214.83\C:\SIDICOM.NEW\BANCO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_09
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 176
    Top = 198
  end
  object IBT_10: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_10
    AutoStopAction = saNone
    Left = 225
    Top = 254
  end
  object IBT_08: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_08
    AutoStopAction = saNone
    Left = 225
    Top = 144
  end
  object IBT_07: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_07
    AutoStopAction = saNone
    Left = 225
    Top = 90
  end
  object IBT_09: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_09
    AutoStopAction = saNone
    Left = 225
    Top = 198
  end
  object IBDB_16: TIBDatabase
    DatabaseName = '\\187.7.111.96\C:\SIDICOM.NEW\BANCO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_16
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 448
    Top = 34
  end
  object IBDB_11: TIBDatabase
    DatabaseName = '\\201.86.212.10\C:\SIDICOM.NEW\BANCO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_11
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 312
    Top = 34
  end
  object IBDB_12: TIBDatabase
    DatabaseName = '\\187.7.111.115\C:\SIDICOM.NEW\BANCO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_12
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 312
    Top = 87
  end
  object IBDB_14: TIBDatabase
    DatabaseName = '\\187.7.111.228\C:\SIDICOM.NEW\BANCO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_14
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 312
    Top = 196
  end
  object IBDB_13: TIBDatabase
    DatabaseName = '\\201.86.212.9\C:\sidicom.new\BIGNEW.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_13
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 312
    Top = 142
  end
  object IBDB_15: TIBDatabase
    DatabaseName = '\\187.5.214.83\C:\SIDICOM.NEW\BANCO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_15
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 312
    Top = 250
  end
  object IBT_11: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_11
    AutoStopAction = saNone
    Left = 361
    Top = 34
  end
  object IBT_16: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_16
    AutoStopAction = saNone
    Left = 497
    Top = 34
  end
  object IBT_12: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_12
    AutoStopAction = saNone
    Left = 361
    Top = 87
  end
  object IBT_14: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_14
    AutoStopAction = saNone
    Left = 361
    Top = 196
  end
  object IBT_13: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_13
    AutoStopAction = saNone
    Left = 361
    Top = 142
  end
  object IBT_15: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_15
    AutoStopAction = saNone
    Left = 361
    Top = 250
  end
  object IBDB_20: TIBDatabase
    DatabaseName = '\\187.7.111.96\C:\SIDICOM.NEW\BANCO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_20
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 448
    Top = 254
  end
  object IBDB_18: TIBDatabase
    DatabaseName = '\\187.7.111.228\C:\SIDICOM.NEW\BANCO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_18
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 448
    Top = 144
  end
  object IBDB_17: TIBDatabase
    DatabaseName = '\\201.86.212.9\C:\sidicom.new\BIGNEW.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_17
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 448
    Top = 90
  end
  object IBDB_19: TIBDatabase
    DatabaseName = '\\LocalHost\C:\Projetos\BelShop\Dados\BELSHOP.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_19
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    AllowStreamedConnected = False
    Left = 448
    Top = 198
  end
  object IBT_20: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_20
    AutoStopAction = saNone
    Left = 497
    Top = 254
  end
  object IBT_18: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_18
    AutoStopAction = saNone
    Left = 497
    Top = 144
  end
  object IBT_17: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_17
    AutoStopAction = saNone
    Left = 497
    Top = 90
  end
  object IBT_19: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_19
    AutoStopAction = saNone
    Left = 497
    Top = 198
  end
  object IBDB_26: TIBDatabase
    DatabaseName = '\\187.7.111.96\C:\SIDICOM.NEW\BANCO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_26
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 728
    Top = 34
  end
  object IBDB_21: TIBDatabase
    DatabaseName = '\\201.86.212.10\C:\SIDICOM.NEW\BANCO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_21
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 592
    Top = 34
  end
  object IBDB_22: TIBDatabase
    DatabaseName = '\\187.7.111.115\C:\SIDICOM.NEW\BANCO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_22
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 592
    Top = 87
  end
  object IBDB_24: TIBDatabase
    DatabaseName = '\\187.7.111.228\C:\SIDICOM.NEW\BANCO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_24
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 592
    Top = 196
  end
  object IBDB_23: TIBDatabase
    DatabaseName = '\\201.86.212.9\C:\sidicom.new\BIGNEW.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_23
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 592
    Top = 142
  end
  object IBDB_25: TIBDatabase
    DatabaseName = '\\187.5.214.83\C:\SIDICOM.NEW\BANCO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_25
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 592
    Top = 250
  end
  object IBT_21: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_21
    AutoStopAction = saNone
    Left = 641
    Top = 34
  end
  object IBT_26: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_26
    AutoStopAction = saNone
    Left = 777
    Top = 34
  end
  object IBT_22: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_22
    AutoStopAction = saNone
    Left = 641
    Top = 87
  end
  object IBT_24: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_24
    AutoStopAction = saNone
    Left = 641
    Top = 196
  end
  object IBT_23: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_23
    AutoStopAction = saNone
    Left = 641
    Top = 142
  end
  object IBT_25: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_25
    AutoStopAction = saNone
    Left = 641
    Top = 250
  end
  object IBDB_30: TIBDatabase
    DatabaseName = '\\187.7.111.96\C:\SIDICOM.NEW\BANCO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_30
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 728
    Top = 254
  end
  object IBDB_28: TIBDatabase
    DatabaseName = '\\187.7.111.228\C:\SIDICOM.NEW\BANCO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_28
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 728
    Top = 144
  end
  object IBDB_27: TIBDatabase
    DatabaseName = '\\201.86.212.9\C:\sidicom.new\BIGNEW.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_27
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 728
    Top = 90
  end
  object IBDB_29: TIBDatabase
    DatabaseName = '\\187.5.214.83\C:\SIDICOM.NEW\BANCO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_29
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 728
    Top = 198
  end
  object IBT_30: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_30
    AutoStopAction = saNone
    Left = 777
    Top = 254
  end
  object IBT_28: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_28
    AutoStopAction = saNone
    Left = 777
    Top = 144
  end
  object IBT_27: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_27
    AutoStopAction = saNone
    Left = 777
    Top = 90
  end
  object IBT_29: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_29
    AutoStopAction = saNone
    Left = 777
    Top = 198
  end
  object IBDB_MPMS: TIBDatabase
    DatabaseName = '\\LOCALHOST\C:\sidicom.new\BelShop_CD.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_MPMS
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 736
    Top = 362
  end
  object IBT_MPMS: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_MPMS
    AutoStopAction = saNone
    Left = 800
    Top = 362
  end
  object IBDB_50: TIBDatabase
    DatabaseName = '\\LOCALHOST\C:\Projetos\BelShop\Dados\centraltrocas.fdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_50
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 872
    Top = 258
  end
  object IBT_50: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_50
    AutoStopAction = saNone
    Left = 937
    Top = 258
  end
  object IBDB_99: TIBDatabase
    DatabaseName = '\\LOCALHOST\C:\sidicom.new\MPMS.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_99
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 448
    Top = 498
  end
  object IBT_99: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_99
    AutoStopAction = saNone
    Left = 497
    Top = 498
  end
  object IBDB_98: TIBDatabase
    DatabaseName = '\\LOCALHOST\C:\PROJETOS\BELSHOP\DADOS\MPMS.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_98
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 448
    Top = 442
  end
  object IBT_98: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_98
    AutoStopAction = saNone
    Left = 497
    Top = 442
  end
  object IBDB_97: TIBDatabase
    DatabaseName = '\\LOCALHOST\C:\PROJETOS\BELSHOP\DADOS\MPMS.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_97
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 448
    Top = 386
  end
  object IBT_97: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_97
    AutoStopAction = saNone
    Left = 497
    Top = 386
  end
  object IBDB_96: TIBDatabase
    DatabaseName = '\\LOCALHOST\C:\PROJETOS\BELSHOP\DADOS\MPMS.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_96
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 448
    Top = 330
  end
  object IBT_96: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_96
    AutoStopAction = saNone
    Left = 497
    Top = 330
  end
  object IBDB_95: TIBDatabase
    DatabaseName = '\\LOCALHOST\C:\PROJETOS\BELSHOP\DADOS\MPMS.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_95
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 312
    Top = 498
  end
  object IBT_95: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_95
    AutoStopAction = saNone
    Left = 361
    Top = 498
  end
  object IBDB_94: TIBDatabase
    DatabaseName = '\\LOCALHOST\C:\PROJETOS\BELSHOP\DADOS\MPMS.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_94
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 312
    Top = 442
  end
  object IBT_94: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_94
    AutoStopAction = saNone
    Left = 361
    Top = 442
  end
  object IBDB_93: TIBDatabase
    DatabaseName = '\\LOCALHOST\C:\PROJETOS\BELSHOP\DADOS\MPMS.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_93
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 312
    Top = 386
  end
  object IBT_93: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_93
    AutoStopAction = saNone
    Left = 361
    Top = 386
  end
  object IBDB_92: TIBDatabase
    DatabaseName = '\\LOCALHOST\C:\PROJETOS\BELSHOP\DADOS\MPMS.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_92
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 312
    Top = 330
  end
  object IBT_92: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_92
    AutoStopAction = saNone
    Left = 361
    Top = 330
  end
  object IBDB_91: TIBDatabase
    DatabaseName = '\\LOCALHOST\C:\PROJETOS\BELSHOP\DADOS\MPMS.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_91
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 176
    Top = 498
  end
  object IBT_91: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_91
    AutoStopAction = saNone
    Left = 225
    Top = 498
  end
  object IBDB_90: TIBDatabase
    DatabaseName = '\\LOCALHOST\C:\PROJETOS\BELSHOP\DADOS\MPMS.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_90
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 176
    Top = 442
  end
  object IBT_90: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_90
    AutoStopAction = saNone
    Left = 225
    Top = 442
  end
  object IBDB_89: TIBDatabase
    DatabaseName = '\\LOCALHOST\C:\PROJETOS\BELSHOP\DADOS\MPMS.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_89
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 176
    Top = 386
  end
  object IBT_89: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_89
    AutoStopAction = saNone
    Left = 225
    Top = 386
  end
  object IBDB_88: TIBDatabase
    DatabaseName = '\\LOCALHOST\C:\PROJETOS\BELSHOP\DADOS\MPMS.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_88
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 176
    Top = 330
  end
  object IBT_88: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_88
    AutoStopAction = saNone
    Left = 225
    Top = 330
  end
  object IBDB_87: TIBDatabase
    DatabaseName = '\\LOCALHOST\C:\PROJETOS\BELSHOP\DADOS\MPMS.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_87
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 40
    Top = 498
  end
  object IBT_87: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_87
    AutoStopAction = saNone
    Left = 89
    Top = 498
  end
  object IBDB_86: TIBDatabase
    DatabaseName = '\\LOCALHOST\C:\PROJETOS\BELSHOP\DADOS\MPMS.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_86
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 40
    Top = 442
  end
  object IBT_86: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_86
    AutoStopAction = saNone
    Left = 89
    Top = 442
  end
  object IBDB_85: TIBDatabase
    DatabaseName = '\\LOCALHOST\C:\PROJETOS\BELSHOP\DADOS\MPMS.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_85
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 40
    Top = 386
  end
  object IBT_85: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_85
    AutoStopAction = saNone
    Left = 89
    Top = 386
  end
  object IBDB_84: TIBDatabase
    DatabaseName = '\\LOCALHOST\C:\PROJETOS\BELSHOP\DADOS\MPMS.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_84
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 40
    Top = 330
  end
  object IBT_84: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_84
    AutoStopAction = saNone
    Left = 89
    Top = 330
  end
  object IBTransaction1: TIBTransaction
    Active = False
    AutoStopAction = saNone
    Left = 608
    Top = 344
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = '\\sw-sistema\e:\sidicom.new\MPMS.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction2
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 728
    Top = 474
  end
  object IBTransaction2: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 792
    Top = 474
  end
  object IBDB_BelShop: TIBDatabase
    DatabaseName = 'localhost:C:\Projetos\BelShop\Dados\BelShop.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_BelShop
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 890
    Top = 21
  end
  object IBT_BelShop: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_BelShop
    AutoStopAction = saNone
    Left = 930
    Top = 34
  end
end
