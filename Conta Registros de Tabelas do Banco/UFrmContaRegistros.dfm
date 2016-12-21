object FrmContaRegistros: TFrmContaRegistros
  Left = 242
  Top = 116
  Width = 928
  Height = 570
  Caption = 'Conta Registros de Tabelas do Banco'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Mem_Contagens: TMemo
    Left = 423
    Top = 0
    Width = 489
    Height = 532
    Align = alClient
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 423
    Height = 532
    Align = alLeft
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 46
      Width = 421
      Height = 485
      Align = alBottom
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = ds_Tab
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'TABELA'
          Width = 400
          Visible = True
        end>
    end
    object Button1: TButton
      Left = 155
      Top = 11
      Width = 113
      Height = 25
      Caption = 'Contar Registros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object SQLC: TSQLConnection
    ConnectionName = 'BelShop'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=C:\Projetos\BelShop\Dados\BELSHOP.FDB'
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
    Left = 448
    Top = 16
  end
  object SDS_: TSQLDataSet
    CommandText = 'SELECT '#39'+QuotedStr(sTab)+'#39' Tabela, COUNT(*) TotReg'#13#10'FROM odir'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 504
    Top = 88
  end
  object CDS_: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_'
    AfterOpen = CDS_AfterOpen
    Left = 624
    Top = 88
  end
  object DSP_: TDataSetProvider
    DataSet = SDS_
    Left = 560
    Top = 88
  end
  object SDS_Tab: TSQLDataSet
    CommandText = 
      'SELECT TABELAS.RDB$RELATION_NAME  tabela'#13#10'FROM RDB$RELATIONS TAB' +
      'ELAS'#13#10'WHERE TABELAS.RDB$SYSTEM_FLAG = 0'#13#10'ORDER BY 1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 504
    Top = 40
  end
  object CDS_Tab: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Tab'
    Left = 624
    Top = 40
    object CDS_TabTABELA: TStringField
      FieldName = 'TABELA'
      FixedChar = True
      Size = 93
    end
  end
  object DSP_Tab: TDataSetProvider
    DataSet = SDS_Tab
    Left = 560
    Top = 40
  end
  object ds_Tab: TDataSource
    DataSet = CDS_Tab
    Left = 680
    Top = 40
  end
end
