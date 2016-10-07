object FrmComissaoVendedor: TFrmComissaoVendedor
  Left = 238
  Top = 107
  ActiveControl = Dbg_UltimaAtualizacao
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
  end
  object PC_ComissaoVendedor: TPageControl
    Left = 0
    Top = 0
    Width = 977
    Height = 543
    ActivePage = Ts_Produtos
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
        Caption = ' '#218'ltima Atualiza'#231'c'#227'o '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
            Tag = 90
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
        Caption = ' Produtos/Comiss'#227'o (Aplica'#231#227'o: 0006 - CAMPANHA DE VENDAS) '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Dbg_ProdutosComissao: TDBGrid
          Left = 1
          Top = 14
          Width = 534
          Height = 476
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
          Top = 490
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
      end
    end
    object Ts_Comissoes: TTabSheet
      Caption = ' Comiss'#245'es '
      ImageIndex = 1
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
end
