object FrmFluxoFornecedor: TFrmFluxoFornecedor
  Left = 244
  Top = 110
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
      object Gb_FluxFornFornec: TGroupBox
        Left = 0
        Top = 0
        Width = 969
        Height = 459
        Align = alClient
        Caption = ' Fornecedores '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Splitter2: TSplitter
          Left = 566
          Top = 14
          Width = 4
          Height = 424
          Align = alRight
          Color = clRed
          ParentColor = False
        end
        object Dbg_FluFornFornec: TDBGrid
          Left = 1
          Top = 14
          Width = 565
          Height = 424
          Align = alClient
          Color = 15004403
          Ctl3D = False
          DataSource = DMBelShop.DS_FluxoFornecedores
          FixedColor = clTeal
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
          TitleFont.Color = clWhite
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
              Title.Caption = 'C'#243'd'
              Width = 35
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
              Title.Caption = 'Dt Inicial'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTA_FINAL'
              Title.Alignment = taCenter
              Title.Caption = 'Dt Final'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLR_SALDO'
              Title.Alignment = taRightJustify
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
              Alignment = taCenter
              Color = 14548957
              Expanded = False
              FieldName = 'DTA_HIST900'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taCenter
              Title.Caption = '1'#170' Negocia'#231#227'o'
              Width = 90
              Visible = True
            end
            item
              Color = 15724527
              Expanded = False
              FieldName = 'COMPRADOR'
              Width = 130
              Visible = True
            end>
        end
        object Stb_FluForn: TdxStatusBar
          Left = 1
          Top = 438
          Width = 967
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
              Width = 410
            end
            item
              PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
            end>
          PaintStyle = stpsOffice11
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
        object PC_FluxFornParametros: TPageControl
          Left = 570
          Top = 14
          Width = 398
          Height = 424
          ActivePage = Ts_FluxFornParamComprv
          Align = alRight
          TabOrder = 2
          OnChange = PC_FluxFornParametrosChange
          object Ts_FluxFornParamComprv: TTabSheet
            Caption = ' Hist'#243'ricos '
            Highlighted = True
            object Pan_FluFornComprov: TPanel
              Left = 0
              Top = 0
              Width = 390
              Height = 46
              Align = alTop
              TabOrder = 0
              DesignSize = (
                390
                46)
              object Bt_FluFornComprovante: TJvXPButton
                Tag = 1
                Left = 10
                Top = 15
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
                Top = 18
                Width = 350
                Height = 19
                TabStop = False
                Anchors = [akLeft, akTop, akRight]
                Color = 12171775
                ReadOnly = True
                TabOrder = 1
              end
              object Rb_FluFornDebito: TJvRadioButton
                Left = 101
                Top = 1
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
                Left = 36
                Top = 1
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
            object Dbg_FluFornComprov: TDBGrid
              Left = 0
              Top = 46
              Width = 390
              Height = 330
              Hint = 'Tecle <Dekete> Para Excluir'
              Align = alClient
              Color = 15004403
              Ctl3D = False
              DataSource = DMBelShop.DS_FluxoFornHistorico
              FixedColor = clTeal
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
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWhite
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              OnDrawColumnCell = Dbg_FluFornComprovDrawColumnCell
              OnEnter = Dbg_FluFornComprovEnter
              OnKeyDown = Dbg_FluFornComprovKeyDown
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
                  Title.Alignment = taCenter
                  Width = 55
                  Visible = True
                end>
            end
            object Stb_FluFornComprv: TdxStatusBar
              Left = 0
              Top = 376
              Width = 390
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
          object Ts_FluxFornParamReducao: TTabSheet
            Caption = ' % Redu'#231#227'o '
            ImageIndex = 1
            object Splitter1: TSplitter
              Left = 0
              Top = 233
              Width = 390
              Height = 4
              Cursor = crVSplit
              Align = alBottom
              Color = clRed
              ParentColor = False
            end
            object Pan_FluFornReducao: TPanel
              Left = 0
              Top = 0
              Width = 390
              Height = 27
              Align = alTop
              TabOrder = 0
              object Bt_FluxFornManutReducaoExcluir: TJvXPButton
                Left = 291
                Top = 1
                Width = 75
                Height = 25
                Caption = 'Excluir'
                TabOrder = 0
                ShowFocusRect = True
                Align = alLeft
                OnClick = Bt_FluxFornManutReducaoExcluirClick
              end
              object Bt_FluxFornManutReducaoIncluir: TJvXPButton
                Left = 1
                Top = 1
                Width = 75
                Height = 25
                Caption = 'Incluir'
                TabOrder = 1
                ShowFocusRect = True
                Align = alLeft
                OnClick = Bt_FluxFornManutReducaoIncluirClick
              end
              object Bt_FluxFornManutReducaoAlterar: TJvXPButton
                Left = 216
                Top = 1
                Width = 75
                Height = 25
                Caption = 'Alterar'
                TabOrder = 2
                ShowFocusRect = True
                Align = alLeft
                OnClick = Bt_FluxFornManutReducaoAlterarClick
              end
              object Panel1: TPanel
                Left = 76
                Top = 1
                Width = 140
                Height = 25
                Align = alLeft
                BevelOuter = bvNone
                Caption = '     Selecionar para ==>>'
                TabOrder = 3
              end
            end
            object Dbg_FluFornPercReducao: TDBGrid
              Left = 0
              Top = 237
              Width = 390
              Height = 159
              Hint = 'Tecle <Dekete> Para Excluir'
              Align = alBottom
              Color = 15004403
              Ctl3D = False
              DataSource = DMBelShop.DS_FluxoPercReducao
              FixedColor = clTeal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentCtl3D = False
              ParentFont = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWhite
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              OnKeyDown = Dbg_FluFornPercReducaoKeyDown
              Columns = <
                item
                  Alignment = taRightJustify
                  Expanded = False
                  FieldName = 'COD_COMPRV'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  Title.Caption = 'C'#243'digo'
                  Width = 44
                  Visible = True
                end
                item
                  Color = clSilver
                  Expanded = False
                  FieldName = 'NOMECOMPROVANTE'
                  Width = 140
                  Visible = True
                end
                item
                  Color = 14145495
                  Expanded = False
                  FieldName = 'PER_REDUCAO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  Title.Alignment = taRightJustify
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTA_INCIO'
                  Title.Alignment = taCenter
                  Width = 62
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTA_FIM'
                  Title.Alignment = taCenter
                  Width = 62
                  Visible = True
                end>
            end
            object Dbg_FluFornFornReducao: TDBGrid
              Left = 0
              Top = 27
              Width = 390
              Height = 206
              Hint = 'Tecle <Dekete> Para Excluir'
              Align = alClient
              Color = 15004403
              Ctl3D = False
              DataSource = DMBelShop.DS_FluxoFornReducao
              FixedColor = clTeal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentCtl3D = False
              ParentFont = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 2
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWhite
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              OnKeyDown = Dbg_FluFornFornReducaoKeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_FORNECEDOR'
                  Title.Alignment = taRightJustify
                  Title.Caption = 'C'#243'digo'
                  Width = 42
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOMEFORNECEDOR'
                  Width = 315
                  Visible = True
                end>
            end
          end
          object Ts_FluxFornManutReducao: TTabSheet
            Caption = ' Manuten'#231#227'o '
            ImageIndex = 2
            OnExit = Ts_FluxFornManutReducaoExit
            DesignSize = (
              390
              396)
            object Gb_FluxFornManutReducao: TGroupBox
              Left = 3
              Top = 16
              Width = 385
              Height = 358
              Anchors = [akTop]
              Caption = ' Percentual de Redu'#231#227'o '
              TabOrder = 0
              object Gb_FluxFornManutForn: TGroupBox
                Left = 3
                Top = 28
                Width = 378
                Height = 75
                Caption = ' Fornecedor '
                Ctl3D = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                DesignSize = (
                  378
                  75)
                object Bt_FluxFornManutBuscaForn: TJvXPButton
                  Tag = 92
                  Left = 78
                  Top = 20
                  Width = 24
                  Height = 26
                  TabOrder = 1
                  TabStop = False
                  ShowFocusRect = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  OnClick = Bt_FluxFornManutBuscaFornClick
                end
                object EdtFluxFornManutDesForn: TEdit
                  Left = 8
                  Top = 49
                  Width = 361
                  Height = 21
                  TabStop = False
                  Anchors = [akLeft, akTop, akRight]
                  Color = 12171775
                  ReadOnly = True
                  TabOrder = 2
                end
                object EdtFluxFornManutCodForn: TCurrencyEdit
                  Left = 8
                  Top = 22
                  Width = 66
                  Height = 21
                  AutoSize = False
                  DecimalPlaces = 0
                  DisplayFormat = '0'
                  TabOrder = 0
                  OnExit = EdtFluxFornManutCodFornExit
                end
              end
              object Panel2: TPanel
                Left = 1
                Top = 327
                Width = 383
                Height = 30
                Align = alBottom
                BevelOuter = bvNone
                Color = clSilver
                TabOrder = 4
                object Bt_FluxFornManutReducaoVoltar: TJvXPButton
                  Tag = 90
                  Left = 283
                  Top = 0
                  Width = 100
                  Height = 30
                  Caption = 'Voltar'
                  TabOrder = 1
                  ShowFocusRect = True
                  Align = alRight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  OnClick = Bt_FluxFornManutReducaoVoltarClick
                end
                object Bt_FluxFornManutReducaoSalvar: TJvXPButton
                  Tag = 4
                  Left = 0
                  Top = 0
                  Width = 100
                  Height = 30
                  Caption = 'Salvar'
                  TabOrder = 0
                  ShowFocusRect = True
                  Align = alLeft
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  OnClick = Bt_FluxFornManutReducaoSalvarClick
                end
              end
              object Gb_FluxFornManutValidade: TGroupBox
                Left = 51
                Top = 196
                Width = 281
                Height = 57
                Caption = ' Per'#237'odo de Validade '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                object Label1: TLabel
                  Left = 13
                  Top = 26
                  Width = 17
                  Height = 13
                  Caption = 'De'
                end
                object Label2: TLabel
                  Left = 146
                  Top = 26
                  Width = 8
                  Height = 13
                  Caption = 'a'
                end
                object DtEdt_FluxFornManutDtaInicial: TcxDateEdit
                  Left = 34
                  Top = 20
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -13
                  Style.Font.Name = 'MS Sans Serif'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  StyleFocused.BorderStyle = ebsOffice11
                  TabOrder = 0
                  Width = 103
                end
                object DtEdt_FluxFornManutDtaFinal: TcxDateEdit
                  Left = 159
                  Top = 20
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -13
                  Style.Font.Name = 'MS Sans Serif'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  StyleFocused.BorderStyle = ebsOffice11
                  TabOrder = 1
                  Width = 103
                end
              end
              object Gb_FluxFornManutPercent: TGroupBox
                Left = 138
                Top = 260
                Width = 108
                Height = 57
                Caption = ' % de Redu'#231#227'o '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
                object EdtFluxFornManutPercentual: TCurrencyEdit
                  Left = 20
                  Top = 24
                  Width = 65
                  Height = 20
                  AutoSize = False
                  DisplayFormat = ',0.00 %'
                  MaxValue = 100.000000000000000000
                  TabOrder = 0
                end
              end
              object Gb_FluxFornManutComprv: TGroupBox
                Left = 3
                Top = 112
                Width = 378
                Height = 75
                Caption = ' Comprovante '
                Ctl3D = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 1
                DesignSize = (
                  378
                  75)
                object Bt_FluxFornManutBuscaComprv: TJvXPButton
                  Tag = 92
                  Left = 78
                  Top = 20
                  Width = 24
                  Height = 26
                  TabOrder = 1
                  TabStop = False
                  ShowFocusRect = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  OnClick = Bt_FluxFornManutBuscaComprvClick
                end
                object EdtFluxFornManutDesComprv: TEdit
                  Left = 8
                  Top = 49
                  Width = 361
                  Height = 21
                  TabStop = False
                  Anchors = [akLeft, akTop, akRight]
                  Color = 12171775
                  ReadOnly = True
                  TabOrder = 2
                end
                object EdtFluxFornManutCodComprv: TCurrencyEdit
                  Left = 8
                  Top = 22
                  Width = 66
                  Height = 21
                  AutoSize = False
                  DecimalPlaces = 0
                  DisplayFormat = '0'
                  TabOrder = 0
                  OnExit = EdtFluxFornManutCodComprvExit
                end
              end
            end
          end
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
        FixedColor = clTeal
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
        TitleFont.Color = clWhite
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
            Color = 12968676
            Expanded = False
            FieldName = 'NUM_DOCUMENTO'
            Title.Alignment = taRightJustify
            Width = 80
            Visible = True
          end
          item
            Color = 12968676
            Expanded = False
            FieldName = 'NUM_SERIE'
            Width = 60
            Visible = True
          end
          item
            Alignment = taCenter
            Color = 12968676
            Expanded = False
            FieldName = 'DTA_ORIGEM'
            Title.Alignment = taCenter
            Width = 65
            Visible = True
          end
          item
            Color = 12968676
            Expanded = False
            FieldName = 'VLR_ORIGEM'
            Title.Alignment = taRightJustify
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PER_REDUCAO'
            Title.Alignment = taRightJustify
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
    object Bt_FluFornSalvaMemoria: TJvXPButton
      Tag = 4
      Left = 177
      Top = 2
      Width = 154
      Height = 29
      Caption = 'Salvar em  Mem'#243'ria'
      TabOrder = 1
      TabStop = False
      ShowFocusRect = True
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_FluFornSalvaMemoriaClick
    end
    object EdtFluFornCodFornAcertar: TEdit
      Left = 424
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
      TabOrder = 5
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
      Left = 504
      Top = 8
      Width = 71
      Height = 19
      EditMask = '!99.99.2\000;1;_'
      MaxLength = 10
      TabOrder = 4
      Text = '  .  .20  '
    end
    object Bt_FluFornFiltroComprador: TJvXPButton
      Tag = 92
      Left = 2
      Top = 2
      Width = 175
      Height = 29
      Caption = 'Seleciona Comprador'
      TabOrder = 0
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
    object Bt_FluFornAcertaSaldos: TJvXPButton
      Tag = 11
      Left = 577
      Top = 2
      Width = 150
      Height = 29
      Caption = 'Acerta Saldo (Odir)'
      TabOrder = 2
      ShowFocusRect = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_FluFornAcertaSaldosClick
    end
    object Button1: TButton
      Left = 752
      Top = 7
      Width = 105
      Height = 25
      Caption = 'Busca Cod Linx'
      TabOrder = 6
      Visible = False
      OnClick = Button1Click
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
    Left = 416
    Top = 336
  end
  object ApplicationEvents1: TApplicationEvents
    OnMessage = ApplicationEvents1Message
    Left = 412
    Top = 423
  end
  object PopM_Forn: TPopupMenu
    Left = 255
    Top = 368
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
