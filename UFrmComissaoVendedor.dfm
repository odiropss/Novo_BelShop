object FrmComissaoVendedor: TFrmComissaoVendedor
  Left = 238
  Top = 107
  ActiveControl = EdtCodDocComissao
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Comiss'#227'o Vendedores'
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
    TabOrder = 0
    object Bt_FluFornFechar: TJvXPButton
      Tag = 99
      Left = 873
      Top = 2
      Width = 100
      Height = 29
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
    object Bt_ImportaProdutos: TJvXPButton
      Tag = 91
      Left = 2
      Top = 2
      Width = 159
      Height = 29
      Caption = 'Busca Produtos CD'
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
      Visible = False
      OnClick = Bt_ImportaProdutosClick
    end
  end
  object PC_ComissaoVendedor: TPageControl
    Left = 0
    Top = 0
    Width = 977
    Height = 543
    ActivePage = Ts_Comissoes
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnChange = PC_ComissaoVendedorChange
    object Ts_Produtos: TTabSheet
      Caption = ' Produtos/Atualiza'#231#227'o '
      Highlighted = True
      object Gb_UltimaAtualizacao: TGroupBox
        Left = 0
        Top = 0
        Width = 433
        Height = 515
        Align = alLeft
        Caption = ' '#218'ltimas Atualiza'#231#245'es '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Panel1: TPanel
          Left = 1
          Top = 479
          Width = 431
          Height = 35
          Align = alBottom
          BevelInner = bvLowered
          BorderStyle = bsSingle
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object Bt_ImportaVendas: TJvXPButton
            Tag = 91
            Left = 2
            Top = 2
            Width = 143
            Height = 29
            Caption = 'Importa Vendas'
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
            OnClick = Bt_ImportaVendasClick
          end
        end
        object Dbg_UltimaAtualizacao: TDBGrid
          Left = 1
          Top = 14
          Width = 431
          Height = 441
          Align = alClient
          Color = 15004403
          Ctl3D = False
          DataSource = DMComissaoVendedor.DS_V_UltimaAtualizacao
          FixedColor = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = Dbg_UltimaAtualizacaoDrawColumnCell
          OnDblClick = Dbg_UltimaAtualizacaoDblClick
          OnEnter = Dbg_UltimaAtualizacaoEnter
          OnKeyUp = Dbg_UltimaAtualizacaoKeyUp
          OnTitleClick = Dbg_UltimaAtualizacaoTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'IMP'
              Title.Alignment = taCenter
              Width = 30
              Visible = True
            end
            item
              Color = 15461355
              Expanded = False
              FieldName = 'CODIGO'
              Title.Alignment = taCenter
              Title.Caption = 'Loja'
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOJA'
              Width = 250
              Visible = True
            end
            item
              Color = 15461355
              Expanded = False
              FieldName = 'DATA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taCenter
              Width = 72
              Visible = True
            end>
        end
        object dxStatusBar2: TdxStatusBar
          Left = 1
          Top = 455
          Width = 431
          Height = 24
          Panels = <
            item
              PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
              PanelStyle.Alignment = taCenter
              PanelStyle.Color = clSilver
              Fixed = False
              Text = '<Duplo Click> Importa Vendas SIM/NAO'
              Width = 65
            end
            item
              PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
              PanelStyle.Alignment = taCenter
              Fixed = False
              Text = '<F5> Marca/Desmarca Todos'
            end>
          PaintStyle = stpsOffice11
          SizeGrip = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Color = clSilver
        end
      end
      object Gb_ProdutosComissao: TGroupBox
        Left = 433
        Top = 0
        Width = 536
        Height = 515
        Align = alClient
        Caption = ' Produtos/Comiss'#227'o '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Dbg_ProdutosComissao: TDBGrid
          Left = 1
          Top = 14
          Width = 534
          Height = 441
          Align = alClient
          Color = 15004403
          Ctl3D = False
          DataSource = DMComissaoVendedor.DS_V_Produtos
          FixedColor = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = Dbg_ProdutosComissaoDrawColumnCell
          OnEnter = Dbg_ProdutosComissaoEnter
          OnExit = Dbg_ProdutosComissaoExit
          OnKeyDown = Dbg_ProdutosComissaoKeyDown
          OnKeyPress = Dbg_ProdutosComissaoKeyPress
          OnTitleClick = Dbg_ProdutosComissaoTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'COD_PRODUTO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ReadOnly = True
              Title.Alignment = taRightJustify
              Title.Caption = 'C'#243'digo'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'APRESENTACAO'
              ReadOnly = True
              Title.Caption = 'Descri'#231#227'o'
              Width = 380
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FAT_CONVERSAO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taRightJustify
              Title.Caption = 'Vlr Conv'
              Width = 65
              Visible = True
            end>
        end
        object OdirPanApres: TPanel
          Left = 447
          Top = 164
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
          TabOrder = 1
          Visible = False
        end
        object dxStatusBar1: TdxStatusBar
          Left = 1
          Top = 455
          Width = 534
          Height = 24
          Panels = <
            item
              PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
              PanelStyle.Alignment = taCenter
              PanelStyle.Color = clSilver
              Fixed = False
              Text = '<F4> Localiza Produto'
              Width = 65
            end>
          PaintStyle = stpsOffice11
          SizeGrip = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Color = clSilver
        end
        object Panel2: TPanel
          Left = 1
          Top = 479
          Width = 534
          Height = 35
          Align = alBottom
          BevelInner = bvLowered
          BorderStyle = bsSingle
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 3
        end
      end
    end
    object Ts_Comissoes: TTabSheet
      Caption = ' Comiss'#245'es '
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 969
        Height = 38
        Align = alTop
        BevelInner = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label1: TLabel
          Left = 394
          Top = 13
          Width = 74
          Height = 13
          Caption = 'Busca Docto'
        end
        object Bt_BuscaDocComissao: TJvXPButton
          Tag = 92
          Left = 529
          Top = 7
          Width = 24
          Height = 26
          TabOrder = 0
          TabStop = False
          ShowFocusRect = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_BuscaDocComissaoClick
        end
        object EdtCodDocComissao: TCurrencyEdit
          Left = 475
          Top = 10
          Width = 43
          Height = 21
          AutoSize = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          TabOrder = 1
          OnChange = EdtCodDocComissaoChange
          OnExit = EdtCodDocComissaoExit
        end
        object Bt_SalvaComiisao: TJvXPButton
          Tag = 4
          Left = 188
          Top = 2
          Width = 155
          Height = 34
          Caption = 'Salvar Docto'
          Enabled = False
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
          OnClick = Bt_SalvaComiisaoClick
        end
        object Bt_CalculaComiisao: TJvXPButton
          Tag = 91
          Left = 2
          Top = 2
          Width = 186
          Height = 34
          Caption = 'Calcular Novo Per'#237'odo'
          TabOrder = 3
          TabStop = False
          ShowFocusRect = True
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_CalculaComiisaoClick
        end
      end
      object Dbg_ComisVendedores: TDBGrid
        Left = 0
        Top = 38
        Width = 969
        Height = 477
        Align = alClient
        Color = 15004403
        Ctl3D = False
        DataSource = DMComissaoVendedor.DS_ComisVendedores
        FixedColor = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = Dbg_ComisVendedoresDrawColumnCell
        OnEnter = Dbg_ComisVendedoresEnter
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_LOJA'
            Title.Alignment = taCenter
            Width = 45
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'LOJA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Width = 300
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'COD_VENDEDOR'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd'
            Width = 90
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'DES_VENDEDOR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Width = 180
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_NOTAS'
            Title.Alignment = taRightJustify
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_VENDA'
            Title.Alignment = taRightJustify
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_CONVERSAO'
            Title.Alignment = taRightJustify
            Width = 70
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'VLR_COMISSAO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Alignment = taRightJustify
            Width = 90
            Visible = True
          end>
      end
    end
    object Ts_ParametrosVendedores: TTabSheet
      Caption = ' Parametros Vendedores '
      ImageIndex = 2
      DesignSize = (
        969
        515)
      object Gb_FamiliaPrecos: TGroupBox
        Left = 433
        Top = 9
        Width = 480
        Height = 478
        Caption = ' Agrupamentos de Pre'#231'os'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object Dbg_FamiliaPrecos: TDBGridJul
          Left = 1
          Top = 47
          Width = 478
          Height = 430
          Hint = '<Delete> Exclui Item da Lista'
          Align = alClient
          DataSource = DMComissaoVendedor.DS_V_FamiliaPrecos
          FixedColor = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = [fsBold]
          OnEnter = Dbg_FamiliaPrecosEnter
          OnExit = Dbg_FamiliaPrecosExit
          OnKeyDown = Dbg_AplicacaoKeyDown
          OnKeyUp = Dbg_AplicacaoKeyUp
          SairComEnter = False
          Columns = <
            item
              Expanded = False
              FieldName = 'DES_FAMILIA'
              ReadOnly = True
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_FAMILIA'
              ReadOnly = True
              Title.Alignment = taRightJustify
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLR_CONVERSAO'
              Title.Alignment = taRightJustify
              Title.Caption = 'Vlr Conv'
              Width = 80
              Visible = True
            end>
        end
        object Pan_FamiliaPrecos: TPanel
          Left = 1
          Top = 14
          Width = 478
          Height = 33
          Align = alTop
          BevelInner = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Bt_BuscaFamiliaPreco: TJvXPButton
            Tag = 92
            Left = 81
            Top = 4
            Width = 24
            Height = 26
            TabOrder = 0
            TabStop = False
            ShowFocusRect = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = Bt_BuscaFamiliaPrecoClick
          end
          object EdtCodFamiliaPrecos: TCurrencyEdit
            Left = 11
            Top = 7
            Width = 66
            Height = 21
            AutoSize = False
            DecimalPlaces = 0
            DisplayFormat = '0'
            TabOrder = 1
            OnExit = EdtCodFamiliaPrecosExit
          end
        end
      end
      object Gb_Aplicacoes: TGroupBox
        Left = 88
        Top = 9
        Width = 338
        Height = 478
        Anchors = [akTop, akRight]
        Caption = ' Aplica'#231#245'es '
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        object Dbg_Aplicacao: TDBGridJul
          Left = 1
          Top = 47
          Width = 336
          Height = 430
          Hint = '<Delete> Exclui Item da Lista'
          Align = alClient
          DataSource = DMComissaoVendedor.DS_V_Aplicacao
          FixedColor = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = [fsBold]
          OnEnter = Dbg_AplicacaoEnter
          OnKeyDown = Dbg_AplicacaoKeyDown
          OnKeyUp = Dbg_AplicacaoKeyUp
          SairComEnter = False
          Columns = <
            item
              Expanded = False
              FieldName = 'DES_APLICACAO'
              ReadOnly = True
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_APLICACAO'
              ReadOnly = True
              Title.Alignment = taRightJustify
              Width = 50
              Visible = True
            end>
        end
        object Pan_Aplicacoes: TPanel
          Left = 1
          Top = 14
          Width = 336
          Height = 33
          Align = alTop
          BevelInner = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Bt_BuscaAplicacao: TJvXPButton
            Tag = 92
            Left = 81
            Top = 4
            Width = 24
            Height = 26
            TabOrder = 0
            TabStop = False
            ShowFocusRect = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = Bt_BuscaAplicacaoClick
          end
          object EdtCodAplicacao: TCurrencyEdit
            Left = 11
            Top = 7
            Width = 66
            Height = 21
            AutoSize = False
            DecimalPlaces = 0
            DisplayFormat = '0'
            TabOrder = 1
            OnExit = EdtCodAplicacaoExit
          end
        end
      end
      object dxStatusBar3: TdxStatusBar
        Left = 0
        Top = 491
        Width = 969
        Height = 24
        Panels = <
          item
            PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
            PanelStyle.Alignment = taCenter
            PanelStyle.Color = clSilver
            Fixed = False
            Text = '<Delete> Delete Item, Selecionado, da Lista'
            Width = 65
          end>
        PaintStyle = stpsOffice11
        SizeGrip = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Color = clSilver
      end
    end
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
    FormCaption = 'Comiss'#227'o Vendedores'
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
    Left = 685
    Top = 128
  end
end
