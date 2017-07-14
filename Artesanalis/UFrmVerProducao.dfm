object FrmVerProducao: TFrmVerProducao
  Left = 224
  Top = 187
  Width = 897
  Height = 369
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'PRODU'#199#195'O DE PRODUTO'
  Color = 16770250
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Gb_Produto: TGroupBox
    Left = 0
    Top = 0
    Width = 881
    Height = 76
    Align = alTop
    Color = 16770250
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object Gb_CodProduto: TGroupBox
      Left = 36
      Top = 14
      Width = 86
      Height = 51
      Caption = ' C'#243'digo '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object EdtCodProduto: TCurrencyEdit
        Left = 13
        Top = 22
        Width = 61
        Height = 19
        AutoSize = False
        Color = clMoneyGreen
        DecimalPlaces = 0
        DisplayFormat = '0,'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object Gb_DescProduto: TGroupBox
      Left = 124
      Top = 14
      Width = 341
      Height = 51
      Caption = ' Descri'#231#227'o '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object EdtDescProduto: TEdit
        Left = 13
        Top = 20
        Width = 312
        Height = 21
        CharCase = ecUpperCase
        Color = clMoneyGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 50
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object Gb_QtdProduto: TGroupBox
      Left = 467
      Top = 14
      Width = 118
      Height = 51
      Caption = ' Quantidade '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object EdtQtdProduto: TCurrencyEdit
        Left = 16
        Top = 20
        Width = 87
        Height = 19
        AutoSize = False
        Color = clMoneyGreen
        DecimalPlaces = 4
        DisplayFormat = ',0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object Gb_NumDocto: TGroupBox
      Left = 626
      Top = 15
      Width = 86
      Height = 51
      Caption = ' N'#186' Pedido '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object EdtNumDocto: TCurrencyEdit
        Left = 13
        Top = 22
        Width = 61
        Height = 19
        AutoSize = False
        Color = clMoneyGreen
        DecimalPlaces = 0
        DisplayFormat = '0,'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object Gb_DtaDocto: TGroupBox
      Left = 714
      Top = 15
      Width = 134
      Height = 51
      Caption = ' Data de Emiss'#227'o '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object DtEdt_DtaDocto: TcxDateEdit
        Left = 13
        Top = 19
        ParentFont = False
        Properties.ReadOnly = True
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        StyleFocused.BorderStyle = ebsOffice11
        TabOrder = 0
        Width = 106
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 76
    Width = 881
    Height = 255
    Align = alClient
    Caption = ' Mat'#233'rias-Primas da produ'#231#227'o do Produto '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Dbg_Producao: TDBGrid
      Left = 2
      Top = 15
      Width = 877
      Height = 238
      Align = alClient
      DataSource = DMArtesanalis.Ds_VerProducao
      FixedColor = 15000804
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnEnter = Dbg_ProducaoEnter
      OnExit = Dbg_ProducaoExit
      OnKeyDown = Dbg_ProducaoKeyDown
      Columns = <
        item
          Color = 8454143
          Expanded = False
          FieldName = 'COD_MATERIAPRIMA'
          Title.Alignment = taRightJustify
          Width = 40
          Visible = True
        end
        item
          Color = 8454143
          Expanded = False
          FieldName = 'DES_MATERIAPRIMA'
          Width = 200
          Visible = True
        end
        item
          Color = 8454143
          Expanded = False
          FieldName = 'DES_UNIDADE'
          Width = 50
          Visible = True
        end
        item
          Color = 8454143
          Expanded = False
          FieldName = 'PRECO_CUSTO'
          Title.Alignment = taRightJustify
          Width = 60
          Visible = True
        end
        item
          Color = 8454143
          Expanded = False
          FieldName = 'SALDO_ATUAL'
          Title.Alignment = taRightJustify
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTD_UTILIZACAO_MP'
          Title.Alignment = taRightJustify
          Title.Caption = 'Qtd Utiliza'#231#227'o'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PER_UTILIZADO_MP'
          Title.Alignment = taRightJustify
          Title.Caption = '% Utilizado'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTD_UNID_UTILIZADA_MP'
          Title.Alignment = taRightJustify
          Title.Caption = 'Qtd Utilizada'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'QTD_BAIXA_EST_MP'
          Title.Alignment = taRightJustify
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_UNITARIO_MP'
          Title.Alignment = taRightJustify
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_TOTAL_MP'
          Title.Alignment = taRightJustify
          Width = 80
          Visible = True
        end>
    end
  end
end
