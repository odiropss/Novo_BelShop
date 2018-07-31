object FrmComissaoVendedor: TFrmComissaoVendedor
  Left = 238
  Top = 107
  ActiveControl = PC_CampColecao
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Comiss'#227'o Vendedores'
  ClientHeight = 578
  ClientWidth = 977
  Color = clWindow
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
    object Bt_Clipboard: TJvXPButton
      Tag = 4
      Left = 161
      Top = 2
      Width = 143
      Height = 29
      Caption = 'Salvar em Mem'#243'ria'
      TabOrder = 2
      Glyph.Data = {
        0A544A504547496D6167655B040000FFD8FFE000104A46494600010101006000
        600000FFDB004300020101020101020202020202020203050303030303060404
        0305070607070706070708090B0908080A0807070A0D0A0A0B0C0C0C0C07090E
        0F0D0C0E0B0C0C0CFFDB004301020202030303060303060C0807080C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0CFFC00011080018001203012200021101031101
        FFC4001F0000010501010101010100000000000000000102030405060708090A
        0BFFC400B5100002010303020403050504040000017D01020300041105122131
        410613516107227114328191A1082342B1C11552D1F02433627282090A161718
        191A25262728292A3435363738393A434445464748494A535455565758595A63
        6465666768696A737475767778797A838485868788898A92939495969798999A
        A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
        D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
        01010101010101010000000000000102030405060708090A0BFFC400B5110002
        0102040403040705040400010277000102031104052131061241510761711322
        328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
        292A35363738393A434445464748494A535455565758595A636465666768696A
        737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
        A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
        E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FD78
        D7BC3BF147E2B43A95F697E26B3B9D06FF0051D4F4C9F41BAB3B58ED6382DEE6
        5B4D8D2342F24A2558D998165C16206463187F11FC51F13BE0DE9F75AC6BDE3D
        D2F448EDED67BBD37478AC21BE82FDEDE232B44C16013C706D5264915FF76A78
        2BF2D64FC41FDB0753FD913E19C9E23974483C45E1593C53AF585E4309920BBD
        3EE1B59BF2939970F1B42C008CAB08CABEDC349BF09CE787EEB57F18FEC5FF00
        15BE2878A6E2EDF5EF1D784F53BAB1B695D668F4BD38C13CB04103658AC4EAE2
        43C827E40554A167FCAF1F9AD4A943FB2303ED3DBF27B59CE52A894172A7CCA4
        A4B9B9DDE318465CB177728DA2E2FE4659A53953FAAD372F6AA1ED25772F755A
        F7BDF54DE8A29DB7BAD1A3ECFB2BCB8BBB38666B46B669503986575F32224676
        B6DDCB91D0E09191C1239A2AD515FA9462D2B377FBBFC8FAE3E11F197C788744
        D0FC71F0FF00C51F057E36788F49D435CD761B89B4EF0B4AD65A85ADCEA3752A
        34328911F063954875DA41E54E4035E77FB55FED03F117E397C18FF857DF0B3E
        0D7C56F0FA6AE89A4B9BFF000B358C115AB218FC9465631C287E442CF8458CB7
        2BC10515F92E231D8AAAE581F68E317EE5D28A972DED6E6B5F6BFDECFC4F1599
        E32ACA780F68E3197EEDB4A2A5CB7B5B9B96FB37F7B3F4B96E55867E7E7D508F
        E9451457EB87ED87FFD9}
      ShowFocusRect = True
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_ClipboardClick
    end
    object Rb_ComisVendSintetico: TJvRadioButton
      Left = 328
      Top = 9
      Width = 72
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Sint'#233'tico'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      TabStop = True
      OnClick = Rb_ComisVendSinteticoClick
      OnKeyUp = Rb_ComisVendSinteticoKeyUp
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      LinkedControls = <>
    end
    object Rb_ComisVendAnalitico: TJvRadioButton
      Left = 404
      Top = 9
      Width = 63
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Anal'#237'tico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = Rb_ComisVendSinteticoClick
      OnKeyUp = Rb_ComisVendSinteticoKeyUp
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      LinkedControls = <>
    end
  end
  object PC_ComissaoVendedor: TPageControl
    Left = 0
    Top = 0
    Width = 977
    Height = 543
    ActivePage = Ts_CampColecao
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
      Tag = 9999
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
          OnExit = Dbg_ComisVendedoresExit
          OnKeyDown = Dbg_UltimaAtualizacaoKeyDown
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
      Tag = 9999
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
        object Bt_SalvaComissao: TJvXPButton
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
          OnClick = Bt_SalvaComissaoClick
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
        OnExit = Dbg_ComisVendedoresExit
        OnKeyDown = Dbg_ComisVendedoresKeyDown
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
            Title.Alignment = taRightJustify
            Width = 90
            Visible = True
          end>
      end
    end
    object Ts_ParametrosVendedores: TTabSheet
      Tag = 9999
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
          OnExit = Dbg_ComisVendedoresExit
          OnKeyDown = Dbg_AplicacaoKeyDown
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
    object Ts_CampColecao: TTabSheet
      Tag = 9999
      Caption = 'Comiss'#227'o Campanhas'
      ImageIndex = 3
      object PC_CampColecao: TPageControl
        Left = 0
        Top = 0
        Width = 969
        Height = 515
        ActivePage = Ts_CampColecaoCadastro
        Align = alClient
        TabOrder = 0
        OnChange = PC_CampColecaoChange
        object Ts_CampColecaoCadastro: TTabSheet
          Tag = 9999
          Caption = ' Cadastros '
          Highlighted = True
          object Gb_CampColecaoCampanhas: TGroupBox
            Left = 500
            Top = 0
            Width = 461
            Height = 487
            Align = alClient
            Caption = ' Companhas a Processar '
            TabOrder = 0
            object Dbg_CampColecaoCamp: TDBGrid
              Left = 1
              Top = 89
              Width = 459
              Height = 373
              Align = alClient
              Ctl3D = False
              DataSource = DMComissaoVendedor.DS_CampCampanhas
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
              OnDrawColumnCell = Dbg_CampColecaoCampDrawColumnCell
              OnDblClick = Dbg_CampColecaoCampDblClick
              OnEnter = Dbg_CampColecaoCampEnter
              OnExit = Dbg_ComisVendedoresExit
              OnKeyDown = Dbg_CampColecaoCampKeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_CAMPANHA'
                  Title.Alignment = taRightJustify
                  Width = 38
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DES_CAMPANHA'
                  Width = 220
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PER_FAT'
                  Title.Alignment = taRightJustify
                  Width = 78
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VLR_UNID'
                  Title.Alignment = taRightJustify
                  Width = 78
                  Visible = True
                end>
            end
            object Pan_CampColecaoCamp: TPanel
              Left = 1
              Top = 14
              Width = 459
              Height = 75
              Align = alTop
              TabOrder = 1
              object Label6: TLabel
                Left = 13
                Top = 36
                Width = 139
                Height = 13
                Caption = 'Descri'#231#227'o da Campanha'
              end
              object Label7: TLabel
                Left = 278
                Top = 37
                Width = 71
                Height = 13
                Caption = '% / Venda $'
              end
              object Label8: TLabel
                Left = 370
                Top = 37
                Width = 59
                Height = 13
                Caption = '$ / Unid $'
              end
              object Bt_CampColecaoCampAban: TJvXPButton
                Left = 365
                Top = 5
                Width = 88
                Height = 25
                Caption = 'Abandonar'
                TabOrder = 3
                ShowFocusRect = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = Bt_CampColecaoCampAbanClick
              end
              object Bt_CampColecaoCampAlt: TJvXPButton
                Left = 8
                Top = 5
                Width = 68
                Height = 25
                Caption = 'Alterar'
                TabOrder = 2
                ShowFocusRect = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = Bt_CampColecaoPessoasIncClick
              end
              object EdtCampColecaoCampNome: TEdit
                Left = 14
                Top = 50
                Width = 257
                Height = 21
                TabStop = False
                CharCase = ecUpperCase
                Color = 14145495
                Ctl3D = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 20
                ParentCtl3D = False
                ParentFont = False
                ReadOnly = True
                TabOrder = 4
              end
              object EdtCampColecaoCampPerc: TCurrencyEdit
                Left = 273
                Top = 50
                Width = 77
                Height = 22
                AutoSize = False
                DisplayFormat = '0.00 %'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxValue = 100.000000000000000000
                ParentFont = False
                TabOrder = 0
              end
              object EdtCampColecaoCampVlr: TCurrencyEdit
                Left = 353
                Top = 50
                Width = 77
                Height = 22
                AutoSize = False
                DisplayFormat = ',0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
            end
            object dxStatusBar5: TdxStatusBar
              Left = 1
              Top = 462
              Width = 459
              Height = 24
              Panels = <
                item
                  PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
                  PanelStyle.Alignment = taCenter
                  PanelStyle.Color = clSilver
                  Fixed = False
                  Text = '<Duplo Click> Para Selecionar'
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
          object Gb_CampColecaoPessoas: TGroupBox
            Left = 0
            Top = 0
            Width = 500
            Height = 487
            Align = alLeft
            Caption = ' Pessoas '
            TabOrder = 1
            object Dbg_CampColecaoPessoas: TDBGrid
              Left = 1
              Top = 89
              Width = 498
              Height = 373
              Align = alClient
              Ctl3D = False
              DataSource = DMComissaoVendedor.DS_V_CampPessoas
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
              OnDrawColumnCell = Dbg_CampColecaoPessoasDrawColumnCell
              OnDblClick = Dbg_CampColecaoPessoasDblClick
              OnEnter = Dbg_CampColecaoPessoasEnter
              OnExit = Dbg_ComisVendedoresExit
              OnKeyDown = Dbg_CampColecaoPessoasKeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_AUX'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'COD_LOJA'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'PESSOA'
                  Width = 180
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CARGO'
                  Width = 128
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PER_FAT'
                  Title.Alignment = taRightJustify
                  Title.Caption = '% / Venda $'
                  Width = 78
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VLR_UNID'
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Vlr / Unid $'
                  Width = 78
                  Visible = True
                end>
            end
            object Pan_CampColecaoPessoas: TPanel
              Left = 1
              Top = 14
              Width = 498
              Height = 75
              Align = alTop
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 1
              object Label2: TLabel
                Left = 13
                Top = 36
                Width = 78
                Height = 13
                Caption = 'Nome Pessoa'
              end
              object Label3: TLabel
                Left = 194
                Top = 36
                Width = 34
                Height = 13
                Caption = 'Cargo'
              end
              object Label4: TLabel
                Left = 331
                Top = 37
                Width = 71
                Height = 13
                Caption = '% / Venda $'
              end
              object Label5: TLabel
                Left = 423
                Top = 37
                Width = 59
                Height = 13
                Caption = '$ / Unid $'
              end
              object Bt_CampColecaoPessoasAlt: TJvXPButton
                Left = 7
                Top = 5
                Width = 68
                Height = 25
                Caption = 'Alterar'
                TabOrder = 4
                ShowFocusRect = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = Bt_CampColecaoPessoasIncClick
              end
              object Bt_CampColecaoPessoasAban: TJvXPButton
                Left = 391
                Top = 5
                Width = 88
                Height = 25
                Caption = 'Abandonar'
                TabOrder = 7
                ShowFocusRect = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = Bt_CampColecaoPessoasAbanClick
              end
              object Bt_CampColecaoPessoasInc: TJvXPButton
                Left = 79
                Top = 5
                Width = 68
                Height = 25
                Caption = 'Incluir'
                TabOrder = 5
                ShowFocusRect = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = Bt_CampColecaoPessoasIncClick
              end
              object Bt_CampColecaoPessoasExc: TJvXPButton
                Left = 152
                Top = 5
                Width = 67
                Height = 25
                Caption = 'Excluir'
                TabOrder = 6
                ShowFocusRect = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = Bt_CampColecaoPessoasExcClick
              end
              object EdtCampColecaoPessNome: TEdit
                Left = 14
                Top = 50
                Width = 178
                Height = 21
                CharCase = ecUpperCase
                Ctl3D = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 20
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
              end
              object EdtCampColecaoPessPerc: TCurrencyEdit
                Left = 324
                Top = 50
                Width = 77
                Height = 22
                AutoSize = False
                DisplayFormat = '0.00 %'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxValue = 100.000000000000000000
                ParentFont = False
                TabOrder = 2
              end
              object EdtCampColecaoPessVlr: TCurrencyEdit
                Left = 403
                Top = 50
                Width = 78
                Height = 22
                AutoSize = False
                DisplayFormat = ',0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
              object EdtCampColecaoPessCod: TCurrencyEdit
                Left = 240
                Top = 8
                Width = 31
                Height = 19
                AutoSize = False
                DecimalPlaces = 0
                DisplayFormat = '0'
                TabOrder = 8
                Visible = False
              end
              object Cbx_CampColecaoPessCargo: TComboBox
                Left = 194
                Top = 50
                Width = 128
                Height = 22
                Style = csOwnerDrawFixed
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ItemHeight = 16
                ParentFont = False
                TabOrder = 1
                Items.Strings = (
                  'GERENTE'
                  'SUPERVISOR'
                  'ASSISTENTE')
              end
            end
            object dxStatusBar4: TdxStatusBar
              Left = 1
              Top = 462
              Width = 498
              Height = 24
              Panels = <
                item
                  PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
                  PanelStyle.Alignment = taCenter
                  PanelStyle.Color = clSilver
                  Fixed = False
                  Text = '<Duplo Click> Para Selecionar'
                  Width = 65
                end
                item
                  PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
                  PanelStyle.Alignment = taCenter
                  Fixed = False
                  Text = '<F4> Localiza Pessoa'
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
        object Ts_CampColecaoComissao: TTabSheet
          Tag = 9999
          Caption = ' Comiss'#245'es '
          ImageIndex = 1
        end
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
    Left = 765
    Top = 400
  end
end
