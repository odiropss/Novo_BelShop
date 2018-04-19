object FrmFluxoFornecedor: TFrmFluxoFornecedor
  Left = 303
  Top = 104
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
    Caption = ' Fornecedor (LINX)'
    Color = 15263976
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      977
      56)
    object Bt_FluFornBuscaFornecedor: TJvXPButton
      Tag = 92
      Left = 86
      Top = 22
      Width = 23
      Height = 22
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
    object EdtFluFornCodFornAcertar: TEdit
      Left = 624
      Top = 20
      Width = 75
      Height = 19
      TabStop = False
      TabOrder = 3
      Text = 'C'#243'd a Acertar'
    end
    object MEdt_DtaAtualizacao: TMaskEdit
      Left = 702
      Top = 20
      Width = 71
      Height = 19
      TabStop = False
      EditMask = '!99.99.2\000;1;_'
      MaxLength = 10
      TabOrder = 4
      Text = '  .  .20  '
    end
    object Bt_FluFornAcertaSaldos: TJvXPButton
      Left = 778
      Top = 15
      Width = 85
      Height = 29
      Caption = 'Acerta Saldo'#13#10'     (Odir)'
      TabOrder = 5
      TabStop = False
      ShowFocusRect = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_FluFornAcertaSaldosClick
    end
  end
  object PC_Principal: TPageControl
    Left = 0
    Top = 56
    Width = 977
    Height = 479
    ActivePage = Ts_FluxFornLanctos
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
        Height = 451
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
          Height = 416
          Align = alRight
          Color = clRed
          ParentColor = False
        end
        object Dbg_FluFornFornec: TDBGrid
          Left = 1
          Top = 14
          Width = 565
          Height = 416
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
          Top = 430
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
          Height = 416
          ActivePage = Ts_FluxFornManutReducao
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
              Enabled = False
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
              Height = 322
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
              Top = 368
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
              Top = 225
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
              Top = 229
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
              Height = 198
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
              388)
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
      Caption = ' Conta Corrente '
      ImageIndex = 1
      object Dbg_FluFornCaixa: TDBGrid
        Left = 0
        Top = 0
        Width = 969
        Height = 451
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
        OnTitleClick = Dbg_FluFornCaixaTitleClick
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
    object Ts_FluxFornLanctos: TTabSheet
      Caption = ' Lan'#231'amentos '
      ImageIndex = 2
      DesignSize = (
        969
        451)
      object Pan_Lanctos: TPanel
        Left = 132
        Top = 48
        Width = 705
        Height = 348
        Anchors = []
        BevelInner = bvRaised
        BevelWidth = 3
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnEnter = Pan_LanctosEnter
        DesignSize = (
          705
          348)
        object Label9: TLabel
          Left = 67
          Top = 35
          Width = 53
          Height = 13
          Caption = 'N'#186' Docto'
        end
        object Label10: TLabel
          Left = 52
          Top = 62
          Width = 68
          Height = 13
          Caption = 'S'#233'rie Docto'
        end
        object Label5: TLabel
          Left = 31
          Top = 89
          Width = 89
          Height = 13
          Caption = 'Data da Origem'
        end
        object Label4: TLabel
          Left = 39
          Top = 115
          Width = 81
          Height = 13
          Caption = 'Data do Caixa'
        end
        object Label3: TLabel
          Left = 90
          Top = 143
          Width = 30
          Height = 13
          Caption = 'Valor'
        end
        object Label11: TLabel
          Left = 92
          Top = 228
          Width = 26
          Height = 13
          Caption = 'Tipo'
        end
        object Label7: TLabel
          Left = 69
          Top = 202
          Width = 51
          Height = 13
          Caption = 'Hist'#243'rico'
        end
        object Label6: TLabel
          Left = 60
          Top = 173
          Width = 60
          Height = 13
          Caption = 'Loja (Linx)'
        end
        object Label8: TLabel
          Left = 22
          Top = 257
          Width = 69
          Height = 13
          Caption = 'Observa'#231#227'o'
        end
        object Lab_Lanctos: TLabel
          Left = 6
          Top = 6
          Width = 693
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = 'Lab_Lanctos'
          Color = 12171775
          ParentColor = False
        end
        object EdtNumDoc: TEdit
          Left = 124
          Top = 32
          Width = 69
          Height = 19
          TabStop = False
          Color = 12171775
          ReadOnly = True
          TabOrder = 0
        end
        object EdtSerieDoc: TEdit
          Left = 124
          Top = 59
          Width = 68
          Height = 19
          TabStop = False
          Color = 12171775
          ReadOnly = True
          TabOrder = 1
        end
        object EdtValorDoc: TCurrencyEdit
          Left = 124
          Top = 140
          Width = 97
          Height = 21
          AutoSize = False
          DisplayFormat = ',0.00'
          TabOrder = 4
        end
        object EdtCodLojaDoc: TCurrencyEdit
          Left = 124
          Top = 169
          Width = 41
          Height = 21
          AutoSize = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          TabOrder = 5
          OnChange = EdtCodLojaDocChange
          OnExit = EdtCodLojaDocExit
        end
        object EdtCodHistDoc: TCurrencyEdit
          Left = 124
          Top = 198
          Width = 41
          Height = 21
          AutoSize = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          TabOrder = 6
          OnChange = EdtCodHistDocChange
          OnExit = EdtCodHistDocExit
        end
        object EdtObsDoc: TEdit
          Left = 20
          Top = 272
          Width = 667
          Height = 19
          Ctl3D = False
          MaxLength = 200
          ParentCtl3D = False
          TabOrder = 7
        end
        object EdtBuscaLojaDoc: TJvXPButton
          Tag = 92
          Left = 171
          Top = 168
          Width = 23
          Height = 25
          TabOrder = 8
          TabStop = False
          ShowFocusRect = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = EdtBuscaLojaDocClick
        end
        object EdtBuscaHistDoc: TJvXPButton
          Tag = 92
          Left = 171
          Top = 197
          Width = 23
          Height = 25
          TabOrder = 9
          TabStop = False
          ShowFocusRect = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = EdtBuscaHistDocClick
        end
        object EdtLojaDoc: TEdit
          Left = 200
          Top = 171
          Width = 472
          Height = 19
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = 12171775
          ReadOnly = True
          TabOrder = 10
        end
        object EdtHistDoc: TEdit
          Left = 200
          Top = 201
          Width = 472
          Height = 19
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = 12171775
          ReadOnly = True
          TabOrder = 11
        end
        object EdtDebCreDoc: TEdit
          Left = 124
          Top = 227
          Width = 67
          Height = 19
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = 12171775
          ReadOnly = True
          TabOrder = 12
        end
        object EdtDtOrigemDoc: TcxDateEdit
          Left = 124
          Top = 85
          Anchors = [akTop, akRight]
          EditValue = 0d
          ParentFont = False
          Properties.DateButtons = [btnClear]
          Properties.ReadOnly = False
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          StyleDisabled.ButtonStyle = btsDefault
          StyleFocused.Color = clSilver
          TabOrder = 2
          Width = 95
        end
        object EdtDtCaixaDoc: TcxDateEdit
          Left = 124
          Top = 112
          Anchors = [akTop, akRight]
          EditValue = 0d
          ParentFont = False
          Properties.DateButtons = [btnClear]
          Properties.ReadOnly = False
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          StyleDisabled.ButtonStyle = btsDefault
          StyleFocused.Color = clSilver
          TabOrder = 3
          Width = 95
        end
        object Panel4: TPanel
          Left = 6
          Top = 306
          Width = 693
          Height = 36
          Align = alBottom
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 13
          object Bt_LanctosSalvar: TJvXPButton
            Tag = 1
            Left = 2
            Top = 2
            Width = 103
            Height = 32
            Caption = 'Salvar'
            TabOrder = 0
            TabStop = False
            ShowFocusRect = True
            Align = alLeft
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = Bt_LanctosSalvarClick
          end
          object Bt_LanctosAbandonar: TJvXPButton
            Tag = 1
            Left = 587
            Top = 2
            Width = 104
            Height = 32
            Caption = 'Abandonar'
            TabOrder = 1
            TabStop = False
            Glyph.Data = {
              07544269746D617066010000424D660100000000000076000000280000001400
              0000140000000100040000000000F00000000000000000000000100000001000
              0000000000000000800000800000008080008000000080008000808000008080
              8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00888888888888888888880000888888888888888888980000889888888888
              8888898800008899887777777777988800008899900000000009988800008889
              90BFFFBFFF9988880000888899FCCCCCCF97888800008888999FBFFFB9978888
              000088888999CCC9990788880000888880999FB99F0788880000888880FC9999
              CF0788880000888880FF9999BF0788880000888880FC99990007888800008888
              80B99F099F0788880000888880999F099998888800008888999FBF0F08998888
              0000889999000000888998880000889998888888888889880000888888888888
              888888980000888888888888888888880000}
            ShowFocusRect = True
            Align = alRight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = Bt_LanctosAbandonarClick
          end
        end
      end
    end
    object Ts_FluxFornGraficos: TTabSheet
      Caption = ' Graficos '
      ImageIndex = 3
      object Edit2: TEdit
        Left = 568
        Top = 304
        Width = 121
        Height = 19
        TabOrder = 0
        Text = 'Edit2'
      end
    end
  end
  object Panel38: TPanel
    Left = 0
    Top = 535
    Width = 977
    Height = 43
    Align = alBottom
    BevelInner = bvLowered
    BorderStyle = bsSingle
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object Bt_FluFornFechar: TJvXPButton
      Tag = 99
      Left = 873
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
      OnClick = Bt_FluFornFecharClick
    end
    object Panel3: TPanel
      Left = 2
      Top = 2
      Width = 666
      Height = 37
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object Bt_FluFornFiltroComprador: TJvXPButton
        Tag = 92
        Left = 1
        Top = 1
        Width = 110
        Height = 35
        Caption = 'Seleciona Comprador'
        TabOrder = 0
        ShowFocusRect = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Bt_FluFornFiltroCompradorClick
      end
      object Bt_FluFornSalvaMemoria: TJvXPButton
        Tag = 4
        Left = 548
        Top = 1
        Width = 104
        Height = 35
        Caption = 'Salva em'#13#10' Mem'#243'ria'
        TabOrder = 4
        TabStop = False
        ShowFocusRect = True
        Spacing = 5
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Bt_FluFornSalvaMemoriaClick
      end
      object Bt_FluFornIncluir: TJvXPButton
        Tag = 1
        Left = 213
        Top = 1
        Width = 114
        Height = 35
        Caption = '    Incluir'#13#10'Fornecedor'
        TabOrder = 2
        TabStop = False
        ShowFocusRect = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Bt_FluFornIncluirClick
      end
      object Bt_FluFornAlterar: TJvXPButton
        Tag = 2
        Left = 328
        Top = 1
        Width = 114
        Height = 35
        Caption = '   Alterar'#13#10'Lan'#231'amento'
        TabOrder = 3
        TabStop = False
        ShowFocusRect = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Bt_FluFornIncluirClick
      end
      object Bt_FluFornGraficos: TJvXPButton
        Left = 112
        Top = 1
        Width = 100
        Height = 35
        Caption = 'Graficos'
        TabOrder = 1
        TabStop = False
        Glyph.Data = {
          07544269746D6170F6030000424DF60300000000000076000000280000001F00
          00001C0000000100080000000000800300000000000000000000100000000000
          0000000000000000800000800000008080008000000080008000808000008080
          8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00080800080800080800080800080800080800080800080800080800080800
          0805080808080808080808080808080808080808080808080808080808080808
          0805070000000000000000000000000000000000000000000000000000000000
          0705000F080F080F080F080F080F080F080F080F080F080F080F080F080F080F
          000500080F080F080F080F080F080F080F080F080F080F080F080F080F080F08
          0005000808000000000008080000000000080800000000000808000000000008
          0005000800000E0E06000808000E0E06000808000E0E06000808000E0E060008
          000500080B000E0E06000808000E0E06000808000E0E06000808000E0E060008
          000500080B0B000E06000808000E0E06000808000E0E06000808000E0E060008
          00050008080B0B0006000800000E0E06000808000E0E06000808000E0E060008
          0005000808000B0B0000000B000E0E06000808000E0E06000808000E0E060008
          0005000808000E0B0B000B0B0B000E06000808000E0E06000808000E0E060008
          0005000808000E0E0B0B0B080B0B0006000808000E0E06000808000E0E060008
          0005000808000E0E060B0808000B0B00000808000E0E06000800000E0E060008
          0005000808000E0E06000808000E0B0B000808000E0E0600000B000E0E060008
          0005000808000E0E06000808000E0E0B0B0008000E0E06000B0B0B000E060008
          0005000808000E0E06000808000E0E060B0B00000E0E000B0B080B0B00060008
          0005000808000E0E06000808000E0E06000B0B000E000B0B0808000B0B000008
          0005000808000E0E06000808000E0E0600080B0B000B0B000808000F0B0B0008
          0005000808000E0E06000808000E0E060008080B0B0B060008080800000B0B00
          0005000808000E0E06000808000F0F0E000808000B0E06000808080808080B0B
          0005000808000E0E0600080808000000080808000E0E0600080808080808080B
          0005000808000E0E0600080808080808080808000E0E06000808080808080808
          0005000808000E0E0600080808080808080808000F0F0E000808080808080808
          0005000F08000F0F0E00080F080F080F080F080F0000000F080F080F080F080F
          000500080F08000000080F080F080F080F080F080F080F080F080F080F080F08
          0005000F080F080F080F080F080F080F080F080F080F080F080F080F080F080F
          0005070000000000000000000000000000000000000000000000000000000000
          0705}
        ShowFocusRect = True
        Spacing = 6
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Bt_FluFornGraficosClick
      end
      object Bt_FluFornImprimir: TJvXPButton
        Tag = 5
        Left = 443
        Top = 1
        Width = 104
        Height = 35
        Caption = 'Imprimir'
        TabOrder = 5
        TabStop = False
        ShowFocusRect = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
        OnClick = Bt_FluFornIncluirClick
      end
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
    Left = 856
    Top = 88
  end
  object ApplicationEvents1: TApplicationEvents
    OnMessage = ApplicationEvents1Message
    Left = 924
    Top = 103
  end
  object PopM_Forn: TPopupMenu
    Left = 815
    Top = 48
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
