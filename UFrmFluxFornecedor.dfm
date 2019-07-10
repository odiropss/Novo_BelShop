object FrmFluxoFornecedor: TFrmFluxoFornecedor
  Left = 234
  Top = 114
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
    object EdtFluFornFornecedor: TEdit
      Left = 195
      Top = 24
      Width = 764
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
      Left = 576
      Top = 20
      Width = 75
      Height = 19
      TabOrder = 3
      Text = 'C'#243'd a Acertar'
    end
    object MEdt_DtaAtualizacao: TMaskEdit
      Left = 654
      Top = 20
      Width = 71
      Height = 19
      EditMask = '!99.99.2\000;1;_'
      MaxLength = 10
      TabOrder = 4
      Text = '  .  .20  '
    end
    object Bt_FluFornAcertaSaldos: TJvXPButton
      Left = 730
      Top = 15
      Width = 85
      Height = 29
      Caption = 'Acerta Saldo'#13#10'     (Odir)'
      TabOrder = 5
      ShowFocusRect = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_FluFornAcertaSaldosClick
    end
    object Bt_FluFornBuscaFornecedor: TJvXPButton
      Left = 86
      Top = 17
      Width = 103
      Height = 32
      Caption = ' Pesquisa'#13#10'pelo Nome'
      TabOrder = 1
      TabStop = False
      Glyph.Data = {
        07544269746D61705E060000424D5E0600000000000036040000280000001600
        000017000000010008000000000028020000C30E0000C30E0000000100000000
        000000FF0000FFFFFF0080808000C0C0C00000000000FF000000FFFF00000000
        FF0000FFFF0045CABF004B737F00D0B4B400CC625700FF31310000CEFF000079
        FF000029FF005E5EFF00BDBDFF00502B2D000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000010101010101010101010101010101010101010101010000010101010101
        0101010101010101010101040404030100000101010101010101010101010101
        0101040701070401000001010101010101010101010101010104070101070401
        0000010101010101010101010101010104070101070704010000010101010101
        0101010101010104070101070704010100000101010101010101010101010407
        0101070704010101000001010101010101010101010407010107070401010101
        0000010101010101010101010407010107070401010101010000010101010101
        0101010404040307070401010101010100000101010101010404040404040407
        0401010101010101000001010101040406010601010404040101010101010101
        0000010101040106010601010101040101010101010101010000010101040601
        0601060106010401010101010101010100000101040601060101010601060104
        0101010101010101000001010401060106010601060101040101010101010101
        0000010104060106010601060106010401010101010101010000010104010601
        0601060106010104010101010101010100000101010401060101010601060401
        0101010101010101000001010104060106010601060104010101010101010101
        0000010101010404010101060404010101010101010101010000010101010101
        0404040401010101010101010101010100000101010101010101010101010101
        01010101010101010000}
      ShowFocusRect = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_FluFornBuscaFornecedorClick
    end
    object Bt_AvariasCentralTrocas: TButton
      Left = 824
      Top = 18
      Width = 133
      Height = 25
      Caption = 'Avarias Central Trocas'
      TabOrder = 6
      Visible = False
      OnClick = Bt_AvariasCentralTrocasClick
    end
  end
  object PC_Principal: TPageControl
    Left = 0
    Top = 56
    Width = 977
    Height = 479
    ActivePage = Ts_FluxFornCaixa
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Style = tsButtons
    TabOrder = 1
    OnChange = PC_PrincipalChange
    object Ts_FluxFornApres: TTabSheet
      Caption = ' Apresenta'#231#227'o '
      Highlighted = True
      object Gb_FluxFornFornec: TGroupBox
        Left = 0
        Top = 0
        Width = 969
        Height = 448
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
          Height = 413
          Align = alRight
          Color = clRed
          ParentColor = False
        end
        object Dbg_FluFornFornec: TDBGrid
          Left = 1
          Top = 14
          Width = 565
          Height = 413
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
          Top = 427
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
              Visible = False
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
          Height = 413
          ActivePage = Ts_FluxFornParamComprv
          Align = alRight
          TabOrder = 1
          OnChange = PC_FluxFornParametrosChange
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
            Caption = ' Manuten'#231#227'o  % Redu'#231#227'o  '
            ImageIndex = 2
            OnExit = Ts_FluxFornManutReducaoExit
            DesignSize = (
              390
              385)
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
              Visible = False
              DesignSize = (
                390
                46)
              object Label14: TLabel
                Left = 184
                Top = -2
                Width = 124
                Height = 24
                Caption = 'N'#227'o Utilizado'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -19
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
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
              Height = 319
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
              Top = 365
              Width = 390
              Height = 20
              Panels = <
                item
                  PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
                  PanelStyle.Alignment = taCenter
                  BiDiMode = bdLeftToRight
                  ParentBiDiMode = False
                  Text = 'N'#195'O UTILIZADO - <Delete> Exclui Comprovante'
                  Width = 300
                end>
              PaintStyle = stpsOffice11
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Visible = False
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
        Height = 428
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
        OnDblClick = Dbg_FluFornCaixaDblClick
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
            Width = 400
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_VINCULADO'
            Title.Alignment = taRightJustify
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DES_VINCULADO'
            Width = 300
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
      object dxStatusBar1: TdxStatusBar
        Left = 0
        Top = 428
        Width = 969
        Height = 20
        Panels = <
          item
            PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
            PanelStyle.Alignment = taCenter
            BiDiMode = bdLeftToRight
            Fixed = False
            ParentBiDiMode = False
            Width = 50
          end
          item
            PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
            PanelStyle.Alignment = taCenter
            BiDiMode = bdLeftToRight
            Fixed = False
            MinWidth = 20
            ParentBiDiMode = False
            Text = '<Duplo Clique> Apresenta Observa'#231#227'o'
            Width = 410
          end
          item
            PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
            Fixed = False
          end>
        PaintStyle = stpsOffice11
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
      end
    end
    object Ts_FluxFornLanctos: TTabSheet
      Caption = ' Lan'#231'amentos '
      ImageIndex = 2
      DesignSize = (
        969
        448)
      object Pan_Lanctos: TPanel
        Left = 132
        Top = 47
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
          Top = 59
          Width = 68
          Height = 13
          Caption = 'S'#233'rie Docto'
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
          Top = 56
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
          TabOrder = 3
          OnKeyDown = EdtValorDocKeyDown
        end
        object EdtCodLojaDoc: TCurrencyEdit
          Left = 124
          Top = 169
          Width = 41
          Height = 21
          AutoSize = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          TabOrder = 4
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
          TabOrder = 5
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
          TabOrder = 6
        end
        object EdtBuscaLojaDoc: TJvXPButton
          Tag = 92
          Left = 171
          Top = 168
          Width = 23
          Height = 25
          TabOrder = 7
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
          TabOrder = 8
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
          TabOrder = 9
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
          TabOrder = 10
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
          TabOrder = 11
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
        object Gb_FornVinculado: TGroupBox
          Left = 240
          Top = 30
          Width = 425
          Height = 49
          Caption = ' Fornecedor Vinculado '
          TabOrder = 12
          object Cbx_FornVinculado: TComboBox
            Left = 13
            Top = 18
            Width = 401
            Height = 22
            Style = csOwnerDrawFixed
            ItemHeight = 16
            TabOrder = 0
          end
        end
        object Pan_Datas: TPanel
          Left = 25
          Top = 79
          Width = 203
          Height = 58
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Enabled = False
          TabOrder = 2
          object Label5: TLabel
            Left = 7
            Top = 9
            Width = 89
            Height = 13
            Caption = 'Data da Origem'
          end
          object Label4: TLabel
            Left = 15
            Top = 35
            Width = 81
            Height = 13
            Caption = 'Data do Caixa'
          end
          object EdtDtCaixaDoc: TcxDateEdit
            Left = 100
            Top = 32
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
            TabOrder = 1
            Width = 95
          end
          object EdtDtOrigemDoc: TcxDateEdit
            Left = 100
            Top = 5
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
            TabOrder = 0
            Width = 95
          end
        end
      end
    end
    object Ts_FluxFornVinculos: TTabSheet
      Caption = ' Vinculos de Fornecedores '
      ImageIndex = 3
      DesignSize = (
        969
        448)
      object Panel5: TPanel
        Left = 1
        Top = 5
        Width = 967
        Height = 443
        Anchors = [akTop, akBottom]
        TabOrder = 0
        object Gb_FornVinculados: TGroupBox
          Left = 484
          Top = 1
          Width = 482
          Height = 441
          Align = alRight
          Caption = ' Fornecedores Vinculados '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Dbg_FornVinculados: TDBGrid
            Left = 1
            Top = 61
            Width = 480
            Height = 379
            Align = alClient
            Color = 16053492
            Ctl3D = False
            DataSource = DMBelShop.DS_FluxoFornVinculados
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
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWhite
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            OnDrawColumnCell = Dbg_FornVinculadosDrawColumnCell
            OnEnter = Dbg_FornVinculadosEnter
            OnExit = Dbg_FornVinculoExit
            OnKeyDown = Dbg_FornVinculoKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'COD_VINCULADO'
                Title.Alignment = taRightJustify
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DES_VINCULADO'
                Width = 390
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IND_SITUACAO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IND_SIT_ORIGEM'
                Visible = True
              end>
          end
          object Panel7: TPanel
            Left = 1
            Top = 14
            Width = 480
            Height = 47
            Align = alTop
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = True
            ParentFont = False
            TabOrder = 0
            DesignSize = (
              480
              47)
            object Label13: TLabel
              Left = 44
              Top = 18
              Width = 61
              Height = 13
              Caption = 'Selecionar'
            end
            object Bt_FluxoVinculadoExcluir: TJvXPButton
              Left = 225
              Top = 3
              Width = 203
              Height = 39
              Caption = '      Retirar Vinculo'#13#10'Fornecedor Selecionado'
              TabOrder = 1
              Glyph.Data = {
                07544269746D617036080000424D360800000000000036040000280000002000
                000020000000010008000000000000040000C30E0000C30E0000000100000000
                000000000000400000006000000080000000A0000000C0000000E0000000FF00
                000000800000408000006080000080800000A0800000C0800000E0800000FF80
                000000C0000040C0000060C0000080C00000A0C00000C0C00000E0C00000FFC0
                000000FF000040FF000060FF000080FF0000A0FF0000C0FF0000E0FF0000FFFF
                000000004000400040006000400080004000A0004000C0004000E0004000FF00
                400000804000408040006080400080804000A0804000C0804000E0804000FF80
                400000C0400040C0400060C0400080C04000A0C04000C0C04000E0C04000FFC0
                400000FF400040FF400060FF400080FF4000A0FF4000C0FF4000E0FF4000FFFF
                400000006000400060006000600080006000A0006000C0006000E0006000FF00
                600000806000408060006080600080806000A0806000C0806000E0806000FF80
                600000C0600040C0600060C0600080C06000A0C06000C0C06000E0C06000FFC0
                600000FF600040FF600060FF600080FF6000A0FF6000C0FF6000E0FF6000FFFF
                600000008000400080006000800080008000A0008000C0008000E0008000FF00
                800000808000408080006080800080808000A0808000C0808000E0808000FF80
                800000C0800040C0800060C0800080C08000A0C08000C0C08000E0C08000FFC0
                800000FF800040FF800060FF800080FF8000A0FF8000C0FF8000E0FF8000FFFF
                80000000A0004000A0006000A0008000A000A000A000C000A000E000A000FF00
                A0000080A0004080A0006080A0008080A000A080A000C080A000E080A000FF80
                A00000C0A00040C0A00060C0A00080C0A000A0C0A000C0C0A000E0C0A000FFC0
                A00000FFA00040FFA00060FFA00080FFA000A0FFA000C0FFA000E0FFA000FFFF
                A0000000C0004000C0006000C0008000C000A000C000C000C000E000C000FF00
                C0000080C0004080C0006080C0008080C000A080C000C080C000E080C000FF80
                C00000C0C00040C0C00060C0C00080C0C000A0C0C000C0C0C000E0C0C000FFC0
                C00000FFC00040FFC00060FFC00080FFC000A0FFC000C0FFC000E0FFC000FFFF
                C0000000E0004000E0006000E0008000E000A000E000C000E000E000E000FF00
                E0000080E0004080E0006080E0008080E000A080E000C080E000E080E000FF80
                E00000C0E00040C0E00060C0E00080C0E000A0C0E000C0C0E000E0C0E000FFC0
                E00000FFE00040FFE00060FFE00080FFE000A0FFE000C0FFE000E0FFE000FFFF
                E0000000FF004000FF006000FF008000FF00A000FF00C000FF00E000FF00FF00
                FF000080FF004080FF006080FF008080FF00A080FF00C080FF00E080FF00FF80
                FF0000C0FF0040C0FF0060C0FF0080C0FF00A0C0FF00C0C0FF00E0C0FF00FFC0
                FF0000FFFF0040FFFF0060FFFF0080FFFF00A0FFFF00C0FFFF00E0FFFF00FFFF
                FF00B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5949494949494949494949494B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B50000000000000000000000949494B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B500808080808080808080008400949494B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B50080808080808080808000840094949494B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5008080808080808080800000848400949494B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5008080808080808080800084848400B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B50080808080808080808000000000848400B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B50080808080808080808000F8F80084848400B5B5B5B5
                B5B5B5B5B5B5B5B5B50080808080808080808000F8F8F80000000000B5B5B5B5
                B5B5B5B5B5B5B5B5B500000000000000000000000707F800B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B500F8F8F8F8F8F8F8F8F8F8F8F800B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B500F807070707070707070707F800B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B500F8F8F8F8F8F8F8F8F8F8F8F800B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B500F8070707F80000000000000000B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B500F8F8F800B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5000000B5B51F04040494B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B51F04040494B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B51F1F1F04040494949494B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B504040404040404040494B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B50404040404040494B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5040404040494B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B504040494B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B504B5B5B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
                B5B5}
              ShowFocusRect = True
              Spacing = 10
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = Bt_FluxoVinculadoExcluirClick
            end
            object EdtFornVinculadoCodForn: TCurrencyEdit
              Left = 110
              Top = 15
              Width = 55
              Height = 21
              AutoSize = False
              DecimalPlaces = 0
              DisplayFormat = '0'
              TabOrder = 0
              OnExit = EdtFornVinculadoCodFornExit
            end
            object Bt_FluxoVinculadoBuscaForn: TJvXPButton
              Tag = 92
              Left = 171
              Top = 12
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
              OnClick = Bt_FluxoVinculadoBuscaFornClick
            end
          end
        end
        object Gb_FornVinculo: TGroupBox
          Left = 1
          Top = 1
          Width = 482
          Height = 441
          Align = alLeft
          Caption = ' Fornecedores de V'#237'nculo '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Panel6: TPanel
            Left = 1
            Top = 14
            Width = 480
            Height = 47
            Align = alTop
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = True
            ParentFont = False
            TabOrder = 0
            DesignSize = (
              480
              47)
            object Label12: TLabel
              Left = 44
              Top = 18
              Width = 61
              Height = 13
              Caption = 'Selecionar'
            end
            object Bt_FluxoVinculoExcluir: TJvXPButton
              Left = 225
              Top = 3
              Width = 203
              Height = 39
              Caption = '      Retirar Vinculo'#13#10'Fornecedor Selecionado'
              TabOrder = 1
              Glyph.Data = {
                07544269746D617036080000424D360800000000000036040000280000002000
                000020000000010008000000000000040000C30E0000C30E0000000100000000
                000000000000400000006000000080000000A0000000C0000000E0000000FF00
                000000800000408000006080000080800000A0800000C0800000E0800000FF80
                000000C0000040C0000060C0000080C00000A0C00000C0C00000E0C00000FFC0
                000000FF000040FF000060FF000080FF0000A0FF0000C0FF0000E0FF0000FFFF
                000000004000400040006000400080004000A0004000C0004000E0004000FF00
                400000804000408040006080400080804000A0804000C0804000E0804000FF80
                400000C0400040C0400060C0400080C04000A0C04000C0C04000E0C04000FFC0
                400000FF400040FF400060FF400080FF4000A0FF4000C0FF4000E0FF4000FFFF
                400000006000400060006000600080006000A0006000C0006000E0006000FF00
                600000806000408060006080600080806000A0806000C0806000E0806000FF80
                600000C0600040C0600060C0600080C06000A0C06000C0C06000E0C06000FFC0
                600000FF600040FF600060FF600080FF6000A0FF6000C0FF6000E0FF6000FFFF
                600000008000400080006000800080008000A0008000C0008000E0008000FF00
                800000808000408080006080800080808000A0808000C0808000E0808000FF80
                800000C0800040C0800060C0800080C08000A0C08000C0C08000E0C08000FFC0
                800000FF800040FF800060FF800080FF8000A0FF8000C0FF8000E0FF8000FFFF
                80000000A0004000A0006000A0008000A000A000A000C000A000E000A000FF00
                A0000080A0004080A0006080A0008080A000A080A000C080A000E080A000FF80
                A00000C0A00040C0A00060C0A00080C0A000A0C0A000C0C0A000E0C0A000FFC0
                A00000FFA00040FFA00060FFA00080FFA000A0FFA000C0FFA000E0FFA000FFFF
                A0000000C0004000C0006000C0008000C000A000C000C000C000E000C000FF00
                C0000080C0004080C0006080C0008080C000A080C000C080C000E080C000FF80
                C00000C0C00040C0C00060C0C00080C0C000A0C0C000C0C0C000E0C0C000FFC0
                C00000FFC00040FFC00060FFC00080FFC000A0FFC000C0FFC000E0FFC000FFFF
                C0000000E0004000E0006000E0008000E000A000E000C000E000E000E000FF00
                E0000080E0004080E0006080E0008080E000A080E000C080E000E080E000FF80
                E00000C0E00040C0E00060C0E00080C0E000A0C0E000C0C0E000E0C0E000FFC0
                E00000FFE00040FFE00060FFE00080FFE000A0FFE000C0FFE000E0FFE000FFFF
                E0000000FF004000FF006000FF008000FF00A000FF00C000FF00E000FF00FF00
                FF000080FF004080FF006080FF008080FF00A080FF00C080FF00E080FF00FF80
                FF0000C0FF0040C0FF0060C0FF0080C0FF00A0C0FF00C0C0FF00E0C0FF00FFC0
                FF0000FFFF0040FFFF0060FFFF0080FFFF00A0FFFF00C0FFFF00E0FFFF00FFFF
                FF00B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5949494949494949494949494B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B50000000000000000000000949494B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B500808080808080808080008400949494B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B50080808080808080808000840094949494B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5008080808080808080800000848400949494B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5008080808080808080800084848400B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B50080808080808080808000000000848400B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B50080808080808080808000F8F80084848400B5B5B5B5
                B5B5B5B5B5B5B5B5B50080808080808080808000F8F8F80000000000B5B5B5B5
                B5B5B5B5B5B5B5B5B500000000000000000000000707F800B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B500F8F8F8F8F8F8F8F8F8F8F8F800B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B500F807070707070707070707F800B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B500F8F8F8F8F8F8F8F8F8F8F8F800B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B500F8070707F80000000000000000B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B500F8F8F800B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5000000B5B51F04040494B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B51F04040494B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B51F1F1F04040494949494B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B504040404040404040494B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B50404040404040494B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5040404040494B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B504040494B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B504B5B5B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
                B5B5}
              ShowFocusRect = True
              Spacing = 10
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = Bt_FluxoVinculoExcluirClick
            end
            object EdtFornVinculoCodForn: TCurrencyEdit
              Left = 110
              Top = 15
              Width = 55
              Height = 21
              AutoSize = False
              DecimalPlaces = 0
              DisplayFormat = '0'
              TabOrder = 0
              OnExit = EdtFornVinculoCodFornExit
            end
            object Bt_FluxoVinculoBuscaForn: TJvXPButton
              Tag = 92
              Left = 171
              Top = 12
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
              OnClick = Bt_FluxoVinculoBuscaFornClick
            end
          end
          object Dbg_FornVinculo: TDBGrid
            Left = 1
            Top = 61
            Width = 480
            Height = 379
            Align = alClient
            Color = 16053492
            Ctl3D = False
            DataSource = DMBelShop.DS_FluxoFornVinculo
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
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWhite
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            OnDrawColumnCell = Dbg_FornVinculoDrawColumnCell
            OnEnter = Dbg_FornVinculoEnter
            OnExit = Dbg_FornVinculoExit
            OnKeyDown = Dbg_FornVinculoKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'COD_FORNECEDOR'
                Title.Alignment = taRightJustify
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DES_FORNECEDOR'
                Width = 390
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IND_SITUACAO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IND_SIT_ORIGEM'
                Visible = True
              end>
          end
        end
      end
    end
    object Ts_FluxFornPercCampanhas: TTabSheet
      Caption = '% Acrescimentos Campanhas <COLE'#199#195'O>'
      ImageIndex = 4
      DesignSize = (
        969
        448)
      object Gb_FornAcrescCampanhas: TGroupBox
        Left = 69
        Top = 1
        Width = 832
        Height = 447
        Anchors = [akTop, akBottom]
        Caption = ' Percentuais de Acrescimos'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object Pan_FornAcrescCampanhas: TPanel
          Left = 1
          Top = 14
          Width = 830
          Height = 77
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = True
          ParentFont = False
          TabOrder = 0
          object Label15: TLabel
            Left = 16
            Top = 8
            Width = 76
            Height = 13
            Caption = 'Fornecedor Linx'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label16: TLabel
            Left = 118
            Top = 8
            Width = 51
            Height = 13
            Caption = 'Percentual'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label17: TLabel
            Left = 111
            Top = 52
            Width = 58
            Height = 13
            Caption = 'Observa'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object EdtFornAcrescCampCodForn: TCurrencyEdit
            Left = 16
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
            OnChange = EdtFornAcrescCampCodFornChange
            OnExit = EdtFornAcrescCampCodFornExit
          end
          object Bt_FornAcrescCampBuscaFornec: TJvXPButton
            Tag = 92
            Left = 90
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
            OnClick = Bt_FornAcrescCampBuscaFornecClick
          end
          object EdtFornAcrescCampDescForn: TEdit
            Left = 176
            Top = 24
            Width = 464
            Height = 19
            TabStop = False
            Color = 12171775
            ReadOnly = True
            TabOrder = 3
          end
          object EdtFornAcrescCampPercentual: TCurrencyEdit
            Left = 118
            Top = 23
            Width = 53
            Height = 21
            AutoSize = False
            DisplayFormat = '0.00'
            MaxValue = 100.000000000000000000
            TabOrder = 2
          end
          object Bt_FornAcrescCampSalvar: TJvXPButton
            Tag = 1
            Left = 544
            Top = 45
            Width = 96
            Height = 27
            Caption = 'Salvar'
            TabOrder = 5
            Glyph.Data = {
              07544269746D617066010000424D660100000000000076000000280000001400
              0000140000000100040000000000F00000000000000000000000100000001000
              0000000000000000BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0
              C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00333333333333333333330000333333000000000000030000333333078888
              8888880300003333330F77777777780300003333330F99777777780300003333
              330FFFFFFFFFF703000033333300000000000003000033333333333333333333
              0000333333333333330033330000333333333333300003330000300000000333
              00000033000030FFFFFF033333003333000030F4444F033333003333000030FF
              FFFF033338003333000030F4444F030000083333000030FFFFFF030000833333
              000030F44F00033333333333000030FFFF003333333333330000300000033333
              333333330000333333333333333333330000}
            ShowFocusRect = True
            Spacing = 10
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = Bt_FornAcrescCampSalvarClick
          end
          object EdtFornAcrescCampOBS: TEdit
            Left = 176
            Top = 49
            Width = 360
            Height = 19
            TabOrder = 4
          end
        end
        object Dbg_FornAcrescCampanhas: TDBGrid
          Left = 1
          Top = 91
          Width = 830
          Height = 335
          Align = alClient
          Color = 16053492
          Ctl3D = False
          DataSource = DMBelShop.DS_Join
          FixedColor = clTeal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWhite
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnDblClick = Dbg_FornAcrescCampanhasDblClick
          OnEnter = Dbg_FornAcrescCampanhasEnter
          OnKeyDown = Dbg_FornAcrescCampanhasKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'COD_FORNECEDOR'
              Title.Alignment = taRightJustify
              Title.Caption = 'C'#243'd'
              Width = 45
              Visible = True
            end
            item
              Color = 15532031
              Expanded = False
              FieldName = 'NOME_FORNECEDOR'
              Title.Caption = 'Fornecedor'
              Width = 310
              Visible = True
            end
            item
              Color = 14286809
              Expanded = False
              FieldName = 'PERC_ACRESCIMOS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taRightJustify
              Title.Caption = '% Acresc'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_USUARIO'
              Title.Caption = 'Comprador'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TXT_OBS'
              Title.Caption = 'Observa'#231#227'o'
              Width = 250
              Visible = True
            end>
        end
        object Stb_FornAcrescCampanhas: TdxStatusBar
          Left = 1
          Top = 426
          Width = 830
          Height = 20
          Panels = <
            item
              PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
              Bevel = dxpbRaised
              Width = 20
            end
            item
              PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
              PanelStyle.Alignment = taCenter
              Bevel = dxpbNone
              Fixed = False
              Text = '<Delete> Exclui Fornecedor'
              Width = 180
            end
            item
              PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
              PanelStyle.Alignment = taCenter
              Fixed = False
              Text = 
                'Procedimentos: Exclus'#227'o/Substitui'#231#227'o N'#227'o Alteram Valores Anterio' +
                'res'
              Width = 430
            end
            item
              PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
              Bevel = dxpbNone
              Width = 20
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
      Width = 823
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
        Left = 566
        Top = 1
        Width = 110
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
        Left = 231
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
        Left = 346
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
      object Bt_FluFornVinculos: TJvXPButton
        Left = 112
        Top = 1
        Width = 118
        Height = 35
        Caption = ' Vinculos de Fornecedores'
        TabOrder = 1
        TabStop = False
        Glyph.Data = {
          07544269746D617066010000424D660100000000000076000000280000001400
          0000140000000100040000000000F00000000000000000000000100000001000
          0000000000000000800000800000008080008000000080008000808000008080
          8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00888888888888888888880000888888888888888888880000888888888888
          8888888800008888888888887777777800008888888888800000007800008888
          88888840FBFBF078000088888888848000000088000088888888488888888888
          000088777774888877777778000080000007777000000078000080FFFF044440
          FBFBF07800008000000878800000008800008888888487888888888800008888
          88884878777777780000888888888480000000780000888888888840FBFBF078
          0000888888888880000000880000888888888888888888880000888888888888
          888888880000888888888888888888880000}
        ShowFocusRect = True
        Spacing = 6
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Bt_FluFornVinculosClick
      end
      object Bt_FluFornImprimir: TJvXPButton
        Tag = 5
        Left = 461
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
      object Bt_FluFornAcrescCampanhas: TJvXPButton
        Left = 677
        Top = 1
        Width = 113
        Height = 35
        Caption = 'Acrescimos'#13#10'Campanhas'
        TabOrder = 6
        TabStop = False
        Glyph.Data = {
          0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000016
          00000011080200000056D3CBD4000000017352474200AECE1CE9000000046741
          4D410000B18F0BFC6105000000097048597300000EBC00000EBC0195BC724900
          00009B49444154384FA591D101802008449BCB819AA7695CC661AC10912351AB
          F749F0E468CBBFA98A7484ADB1472E0BFC3D1C890B0D52C49D0601B4948E9E80
          14B240E9A83ED53F1290C2CC18A3149EE198A962269807196720C6E75C10B0E2
          425621CADA90019E0169553CD10277CD1B57A132C88634654EE72AF8D9EE0C1A
          1D85CEF049C12DED6438638D1D45EF47BE3AA73E02001678C039E73A399F4DA0
          F4214165B44A0000000049454E44AE426082}
        ShowFocusRect = True
        Spacing = 5
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Bt_FluFornAcrescCampanhasClick
      end
    end
  end
  object OdirPanApres: TPanel
    Left = 864
    Top = 52
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
    Left = 912
    Top = 224
  end
  object ApplicationEvents1: TApplicationEvents
    OnMessage = ApplicationEvents1Message
    Left = 908
    Top = 159
  end
  object PopM_Forn_DtaCCDesaticado: TPopupMenu
    Left = 759
    Top = 248
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
