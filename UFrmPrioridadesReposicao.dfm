object FrmPrioridadesReposicao: TFrmPrioridadesReposicao
  Left = 295
  Top = 119
  Align = alClient
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Prioridades de Reposi'#231#227'o'
  ClientHeight = 563
  ClientWidth = 912
  Color = clSilver
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    912
    563)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel38: TPanel
    Left = 0
    Top = 520
    Width = 912
    Height = 43
    Align = alBottom
    BevelInner = bvLowered
    BorderStyle = bsSingle
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Label5: TLabel
      Left = 8
      Top = 12
      Width = 55
      Height = 13
      Caption = 'Prioridades:'
    end
    object Bt_Fechar: TJvXPButton
      Tag = 99
      Left = 808
      Top = 2
      Width = 100
      Height = 37
      Caption = 'Fechar'
      TabOrder = 0
      TabStop = False
      ShowFocusRect = True
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_FecharClick
    end
    object JvRadioButton1: TJvRadioButton
      Left = 67
      Top = 12
      Width = 57
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ativas'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      TabStop = True
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      LinkedControls = <>
    end
    object JvRadioButton2: TJvRadioButton
      Left = 123
      Top = 12
      Width = 67
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Inativas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      LinkedControls = <>
    end
    object JvRadioButton3: TJvRadioButton
      Left = 195
      Top = 12
      Width = 59
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ambas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      LinkedControls = <>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 913
    Height = 520
    Anchors = [akTop, akBottom]
    TabOrder = 1
    object Pan_Produtos: TPanel
      Left = 469
      Top = 1
      Width = 443
      Height = 518
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 0
      object TPanel
        Left = 2
        Top = 2
        Width = 439
        Height = 16
        Align = alTop
        Caption = 'Produtos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Panel2: TPanel
        Left = 2
        Top = 18
        Width = 439
        Height = 84
        Align = alTop
        BevelInner = bvLowered
        Color = 13092807
        TabOrder = 1
        DesignSize = (
          439
          84)
        object Label75: TLabel
          Left = 82
          Top = 22
          Width = 24
          Height = 13
          Caption = 'Linx'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label183: TLabel
          Left = 151
          Top = 39
          Width = 29
          Height = 13
          Caption = '==>>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label74: TLabel
          Left = 179
          Top = 22
          Width = 45
          Height = 13
          Caption = 'Sidicom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EdtCodProdLinx: TCurrencyEdit
          Left = 82
          Top = 37
          Width = 66
          Height = 21
          AutoSize = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          TabOrder = 0
        end
        object EdtCodProduto: TCurrencyEdit
          Left = 179
          Top = 37
          Width = 66
          Height = 21
          AutoSize = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          TabOrder = 1
        end
        object Bt_BuscaProdtudo: TJvXPButton
          Tag = 92
          Left = 250
          Top = 34
          Width = 24
          Height = 26
          TabOrder = 2
          TabStop = False
          ShowFocusRect = True
          Anchors = [akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bt_ProdutoExcluir: TJvXPButton
          Tag = 3
          Left = 288
          Top = 30
          Width = 87
          Height = 32
          Caption = 'Excluir'
          TabOrder = 3
          ShowFocusRect = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Dbg_Produto: TDBGrid
        Left = 2
        Top = 102
        Width = 439
        Height = 414
        Align = alClient
        Color = 15004403
        Ctl3D = False
        FixedColor = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnEnter = Dbg_PrioridadesEnter
      end
    end
    object Pan_Prioridades: TPanel
      Left = 1
      Top = 1
      Width = 468
      Height = 518
      Align = alLeft
      BevelInner = bvLowered
      TabOrder = 1
      object Panel6: TPanel
        Left = 2
        Top = 2
        Width = 464
        Height = 16
        Align = alTop
        Caption = 'Prioridades'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object PanManutPrioridade: TPanel
        Left = 2
        Top = 18
        Width = 464
        Height = 84
        Align = alTop
        BevelInner = bvLowered
        Color = 13092807
        TabOrder = 1
        object Label1: TLabel
          Left = 23
          Top = 4
          Width = 58
          Height = 13
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 11
          Top = 41
          Width = 88
          Height = 13
          Caption = 'Vig'#234'ncia Inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 117
          Top = 41
          Width = 81
          Height = 13
          Caption = 'Vig'#234'ncia Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 223
          Top = 41
          Width = 30
          Height = 13
          Caption = 'Ativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EdtDesPrioridade: TEdit
          Left = 23
          Top = 19
          Width = 414
          Height = 19
          MaxLength = 60
          TabOrder = 0
        end
        object EdtDtaInicial: TJvDateEdit
          Left = 9
          Top = 56
          Width = 96
          Height = 19
          TabOrder = 1
        end
        object EdtDtaFinal: TJvDateEdit
          Left = 113
          Top = 56
          Width = 96
          Height = 19
          TabOrder = 2
        end
        object CkB_Ativo: TJvCheckBox
          Left = 221
          Top = 56
          Width = 44
          Height = 17
          Caption = 'SIM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          LinkedControls = <>
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object Bt_PrioridadeSalvar: TJvXPButton
          Tag = 4
          Left = 272
          Top = 46
          Width = 87
          Height = 32
          Caption = 'Salvar'
          TabOrder = 4
          ShowFocusRect = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bt_PrioridadeDesfazer: TJvXPButton
          Tag = 90
          Left = 361
          Top = 46
          Width = 87
          Height = 32
          Caption = 'Desfazer'
          TabOrder = 5
          ShowFocusRect = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EdtCodPrioridade: TCurrencyEdit
          Left = 114
          Top = 2
          Width = 34
          Height = 18
          AutoSize = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          TabOrder = 6
          Visible = False
        end
      end
      object Dbg_Prioridades: TDBGrid
        Left = 2
        Top = 102
        Width = 464
        Height = 414
        Align = alClient
        Color = 15004403
        Ctl3D = False
        DataSource = DMBelShop.DS_Prioridades
        FixedColor = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnEnter = Dbg_PrioridadesEnter
        Columns = <
          item
            Expanded = False
            FieldName = 'DES_PRIORIDADE'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTA_INICIAL'
            Title.Alignment = taCenter
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTA_FINAL'
            Title.Alignment = taCenter
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IND_ATIVO'
            Title.Alignment = taCenter
            Title.Caption = 'Ativo ?'
            Width = 50
            Visible = True
          end>
      end
    end
  end
  object ApplicationEvents1: TApplicationEvents
    OnMessage = ApplicationEvents1Message
    Left = 396
    Top = 279
  end
  object CorCaptionForm: TJvGradientCaption
    Active = False
    Captions = <
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
      end>
    DefaultFont = False
    FormCaption = 'Prioridades de Reposi'#231#227'o'
    FontInactiveColor = 16777170
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clCaptionText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    StartColor = 15522303
    EndColor = 8388863
    Left = 512
    Top = 288
  end
end
