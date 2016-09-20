object FrmFluxoFornecedor: TFrmFluxoFornecedor
  Left = 243
  Top = 111
  Align = alClient
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Conta Correte de Fornecedores'
  ClientHeight = 578
  ClientWidth = 977
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
  PixelsPerInch = 96
  TextHeight = 13
  object Gb_FluFornFornecedor: TGroupBox
    Left = 0
    Top = 0
    Width = 977
    Height = 56
    Align = alTop
    Caption = ' Fornecedor '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      977
      56)
    object Bt_FluFornBuscaFornecedor: TJvXPButton
      Tag = 92
      Left = 86
      Top = 21
      Width = 23
      Height = 25
      TabOrder = 1
      TabStop = False
      ShowFocusRect = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_FluFornBuscaFornecedorClick
    end
    object EdtFluFornFornecedor: TEdit
      Left = 115
      Top = 24
      Width = 846
      Height = 19
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = 12171775
      ReadOnly = True
      TabOrder = 2
    end
    object EdtFluFornCodFornecedor: TCurrencyEdit
      Left = 13
      Top = 23
      Width = 68
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnChange = EdtFluFornCodFornecedorChange
      OnExit = EdtFluFornCodFornecedorExit
    end
  end
  object PC_Principal: TPageControl
    Left = 0
    Top = 56
    Width = 977
    Height = 487
    ActivePage = Ts_FluxFornApres
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnChange = PC_PrincipalChange
    object Ts_FluxFornApres: TTabSheet
      Caption = ' Apresenta'#231#227'o '
      Highlighted = True
      object Gb_FluxFornComprov: TGroupBox
        Left = 571
        Top = 0
        Width = 398
        Height = 459
        Align = alRight
        Caption = ' Comprovantes '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Dbg_FluFornComprov: TDBGrid
          Left = 1
          Top = 81
          Width = 396
          Height = 357
          Hint = 'Tecle <Dekete> Para Excluir'
          Align = alClient
          Color = 15004403
          Ctl3D = False
          DataSource = DMBelShop.DS_FluxoFornHistorico
          FixedColor = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = Dbg_FluFornComprovDrawColumnCell
          OnEnter = Dbg_FluFornComprovEnter
          OnKeyDown = Dbg_FluFornFornecKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'DES_HISTORICO'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEB_CRE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taCenter
              Width = 55
              Visible = True
            end>
        end
        object Panel1: TPanel
          Left = 1
          Top = 14
          Width = 396
          Height = 67
          Align = alTop
          TabOrder = 1
          DesignSize = (
            396
            67)
          object Bt_FluFornComprovante: TJvXPButton
            Tag = 1
            Left = 8
            Top = 13
            Width = 23
            Height = 25
            TabOrder = 0
            TabStop = False
            ShowFocusRect = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = Bt_FluFornComprovanteClick
          end
          object EdtFluFornComprovante: TEdit
            Left = 36
            Top = 16
            Width = 350
            Height = 19
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            Color = 12171775
            ReadOnly = True
            TabOrder = 1
          end
          object Rb_FluFornDebito: TJvRadioButton
            Left = 120
            Top = 43
            Width = 52
            Height = 17
            Alignment = taLeftJustify
            Caption = 'D'#233'bito'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = Rb_FluFornDebitoClick
            OnKeyUp = Rb_FluFornDebitoKeyUp
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
            LinkedControls = <>
          end
          object Rb_FluFornCredito: TJvRadioButton
            Left = 40
            Top = 43
            Width = 62
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Cr'#233'dito'
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            TabStop = True
            OnClick = Rb_FluFornDebitoClick
            OnKeyUp = Rb_FluFornDebitoKeyUp
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
            LinkedControls = <>
          end
        end
        object dxStatusBar1: TdxStatusBar
          Left = 1
          Top = 438
          Width = 396
          Height = 20
          Panels = <
            item
              PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
              PanelStyle.Alignment = taCenter
              BiDiMode = bdLeftToRight
              ParentBiDiMode = False
              Text = '<Delete> Exclui Comprovante'
              Width = 300
            end>
          PaintStyle = stpsOffice11
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
      end
      object Gb_FluxFornFornec: TGroupBox
        Left = 0
        Top = 0
        Width = 571
        Height = 459
        Align = alClient
        Caption = ' Fornecedores '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Dbg_FluFornFornec: TDBGrid
          Left = 1
          Top = 14
          Width = 569
          Height = 424
          Align = alClient
          Color = 15004403
          Ctl3D = False
          DataSource = DMBelShop.DS_FluxoFornecedores
          FixedColor = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ParentFont = False
          PopupMenu = PopM_Forn
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = Dbg_FluFornFornecDrawColumnCell
          OnDblClick = Dbg_FluFornFornecDblClick
          OnEnter = Dbg_FluFornFornecEnter
          OnKeyDown = Dbg_FluFornFornecKeyDown
          OnKeyUp = Dbg_FluFornFornecKeyUp
          OnTitleClick = Dbg_FluFornFornecTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'COD_FORNECEDOR'
              Title.Alignment = taRightJustify
              Width = 50
              Visible = True
            end
            item
              Color = clSilver
              Expanded = False
              FieldName = 'NOMEFORNECEDOR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTA_INICIAL'
              Title.Alignment = taCenter
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTA_FINAL'
              Title.Alignment = taCenter
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLR_SALDO'
              Title.Alignment = taRightJustify
              Width = 120
              Visible = True
            end
            item
              Color = clSilver
              Expanded = False
              FieldName = 'DTA_CC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taCenter
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LIMITE'
              Title.Alignment = taCenter
              Width = 50
              Visible = True
            end
            item
              Color = 15724527
              Expanded = False
              FieldName = 'COMPRADOR'
              Width = 150
              Visible = True
            end>
        end
        object Stb_FluForn: TdxStatusBar
          Left = 1
          Top = 438
          Width = 569
          Height = 20
          Panels = <
            item
              PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
              PanelStyle.Alignment = taCenter
              BiDiMode = bdLeftToRight
              ParentBiDiMode = False
              Text = '<F2> Altera Data CC'
              Width = 150
            end
            item
              PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
              PanelStyle.Alignment = taCenter
              Text = '<Bot'#227'o Direto> Usar Data CC ?'
              Width = 200
            end
            item
              PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
              PanelStyle.Alignment = taCenter
              PanelStyle.Color = clSilver
              BiDiMode = bdLeftToRight
              ParentBiDiMode = False
              Text = '<F4> Localiza Fornecedor'
              Width = 180
            end
            item
              PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
              PanelStyle.Alignment = taCenter
              BiDiMode = bdLeftToRight
              MinWidth = 20
              ParentBiDiMode = False
              Text = '<Duplo Clique> Apresenta Conta Corrente'
              Width = 250
            end>
          PaintStyle = stpsOffice11
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
      end
    end
    object Ts_FluxFornCaixa: TTabSheet
      Caption = 'Fluxo de Caixa'
      ImageIndex = 1
      object Dbg_FluFornCaixa: TDBGrid
        Left = 0
        Top = 0
        Width = 969
        Height = 459
        Align = alClient
        Color = 15004403
        Ctl3D = False
        DataSource = DMBelShop.DS_FluxoFornecedor
        FixedColor = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = Dbg_FluFornCaixaDrawColumnCell
        OnEnter = Dbg_FluFornCaixaEnter
        OnKeyUp = Dbg_FluFornCaixaKeyUp
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DATA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Width = 75
            Visible = True
          end
          item
            Alignment = taCenter
            Color = clSilver
            Expanded = False
            FieldName = 'LOJA'
            Title.Alignment = taCenter
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_HISTORICO'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DES_HISTORICO'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_DOCUMENTO'
            Title.Alignment = taRightJustify
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_SERIE'
            Width = 60
            Visible = True
          end
          item
            Color = 14024661
            Expanded = False
            FieldName = 'VLR_CREDITO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taRightJustify
            Width = 80
            Visible = True
          end
          item
            Color = 14671871
            Expanded = False
            FieldName = 'VLR_DEBITO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taRightJustify
            Width = 80
            Visible = True
          end
          item
            Color = 16769734
            Expanded = False
            FieldName = 'VLR_SALDO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taRightJustify
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TXT_OBS'
            Visible = True
          end
          item
            Color = 14286847
            Expanded = False
            FieldName = 'COD_EMPRESA'
            Title.Alignment = taRightJustify
            Width = 60
            Visible = True
          end
          item
            Color = 14286847
            Expanded = False
            FieldName = 'RAZAO_SOCIAL'
            Width = 300
            Visible = True
          end>
      end
    end
  end
  object Panel38: TPanel
    Left = 0
    Top = 543
    Width = 977
    Height = 35
    Align = alBottom
    BevelInner = bvLowered
    BorderStyle = bsSingle
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object Bt_FluFornAtualizar: TJvXPButton
      Tag = 11
      Left = 757
      Top = 2
      Width = 116
      Height = 29
      Caption = 'Atualizar (Odir)'
      TabOrder = 0
      ShowFocusRect = True
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_FluFornAtualizarClick
    end
    object Bt_FluFornSalvaExcel: TJvXPButton
      Tag = 9
      Left = 171
      Top = 2
      Width = 118
      Height = 29
      Caption = 'Salvar Excel'
      TabOrder = 2
      TabStop = False
      ShowFocusRect = True
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_FluFornSalvaExcelClick
    end
    object Bt_FluFornAcertaSaldos: TJvXPButton
      Tag = 11
      Left = 633
      Top = 2
      Width = 124
      Height = 29
      Caption = 'Acerta Saldo (Odir)'
      TabOrder = 1
      ShowFocusRect = True
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_FluFornAcertaSaldosClick
    end
    object EdtFluFornCodFornAcertar: TEdit
      Left = 480
      Top = 8
      Width = 76
      Height = 19
      TabOrder = 3
      Text = 'C'#243'd a Acertar'
    end
    object Bt_FluFornFechar: TJvXPButton
      Tag = 99
      Left = 873
      Top = 2
      Width = 100
      Height = 29
      Caption = 'Fechar'
      TabOrder = 4
      TabStop = False
      ShowFocusRect = True
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_FluFornFecharClick
    end
    object MaskEdit1: TMaskEdit
      Left = 560
      Top = 8
      Width = 71
      Height = 19
      EditMask = '!99.99.2\000;1;_'
      MaxLength = 10
      TabOrder = 5
      Text = '  .  .20  '
    end
    object Bt_FluFornFiltroComprador: TJvXPButton
      Tag = 92
      Left = 2
      Top = 2
      Width = 169
      Height = 29
      Caption = 'Seleciona Comprador'
      TabOrder = 6
      ShowFocusRect = True
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_FluFornFiltroCompradorClick
    end
  end
  object OdirPanApres: TPanel
    Left = 928
    Top = 4
    Width = 89
    Height = 33
    BevelInner = bvLowered
    BevelWidth = 2
    Caption = 'OdirPanApres'
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Visible = False
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
    FormCaption = 'Conta Correte de Fornecedores'
    FontInactiveColor = 16777170
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clCaptionText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    StartColor = 15522303
    EndColor = 8388863
    Left = 888
    Top = 352
  end
  object ApplicationEvents1: TApplicationEvents
    OnMessage = ApplicationEvents1Message
    Left = 820
    Top = 407
  end
  object PopM_Forn: TPopupMenu
    Left = 903
    Top = 448
    object PopM_FluFornSIM: TMenuItem
      Bitmap.Data = {
        B6030000424DB603000000000000360000002800000012000000100000000100
        1800000000008003000000000000000000000000000000000000C0C0C0000000
        000000000000000000000000000000000000000000000000000000000000C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C00000C0C0C0000000FFFFFFFFFFFFFFFFFF00000000000000
        0000000000000000FFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0800000C0C0C0
        0000C0C0C0000000FFFFFF000000808000000000FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000C0C0C0C0C0C0C0C0C0800000800000C0C0C00000C0C0C0000000
        FFFFFF000000808000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0
        C0C0C0C0800000800000800000C0C0C00000C0C0C0000000FFFFFFFFFFFFFFFF
        FF0000FF0000FF0000FF0000FF0000FFFFFFFF000000C0C0C080000080000080
        0000800000C0C0C00000C0C0C0000000FFFFFF0000008080000000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0800000800000800000C0C0C0
        0000C0C0C0000000FFFFFF000000808000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000C0C0C0C0C0C0C0C0C0800000800000C0C0C00000C0C0C0000000
        FFFFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFF000000C0C0
        C0C0C0C0C0C0C0C0C0C0800000C0C0C00000C0C0C0000000FFFFFF0000008080
        00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C00000C0C0C0000000FFFFFF000000808000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        0000C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0800000
        800000800000800000800000800000800000800000800000800000800000C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0800000FFFFFFFFFFFF8000
        00800000800000800000800000800000800000800000C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C00000C0C0C080000080000080000080000080000080000080
        0000800000800000800000800000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000}
      Caption = ' SIM  - Usar Data CC'
      OnClick = PopM_FluFornSIMClick
    end
    object PopM_FluFornNAO: TMenuItem
      Bitmap.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700000007777777777177777700000007777777771177777100000007777
        7777711177717000000077777777771177117000000070000000000011577000
        0000707777777775117770000000707007007071511770000000707777777711
        771150000000704444445144447510000000774FFFFF15FFF47770000000774F
        00F00F00F47770000000774FFFFFFFFFF4777000000077444444444444777000
        0000774744744744747770000000774444444444447770000000777777777777
        777770000000}
      Caption = 'NAO - Usar Data CC'
      OnClick = PopM_FluFornSIMClick
    end
  end
end
