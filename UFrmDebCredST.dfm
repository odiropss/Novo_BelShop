object FrmDebCredST: TFrmDebCredST
  Left = 237
  Top = 110
  Align = alClient
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'BelShop - D'#233'bito / Cr'#233'dito ICMS ST'
  ClientHeight = 576
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
  object PC_DebCredICMSST: TPageControl
    Left = 0
    Top = 0
    Width = 977
    Height = 498
    ActivePage = Ts_FornBcICMSST
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnChange = PC_DebCredICMSSTChange
    object Ts_FornBcICMSST: TTabSheet
      Tag = 9999
      Caption = 'Fornecedores Base Calculo ICMS ST'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Highlighted = True
      ParentFont = False
      DesignSize = (
        969
        470)
      object Dbg_VlrBcICMSST: TDBGrid
        Left = 205
        Top = 0
        Width = 561
        Height = 470
        Anchors = [akTop, akBottom]
        DataSource = DMDebCredST.DS_VlrBcICMSST
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnColEnter = Dbg_VlrBcICMSSTColEnter
        OnDrawColumnCell = Dbg_VlrBcICMSSTDrawColumnCell
        OnKeyDown = Dbg_VlrBcICMSSTKeyDown
        OnTitleClick = Dbg_VlrBcICMSSTTitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_FORNECEDOR'
            Title.Alignment = taRightJustify
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_FORNECDOR'
            Width = 320
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOT_DEBITO_ICMS_ST'
            Title.Alignment = taRightJustify
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'BC_ICMS_ST'
            Title.Alignment = taCenter
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ORDEM'
            Visible = False
          end>
      end
    end
    object Ts_FornTotais: TTabSheet
      Tag = 9999
      Caption = ' Fornecedores Totais '
      ImageIndex = 1
      DesignSize = (
        969
        470)
      object Dbg_TotaisForn: TDBGrid
        Left = 73
        Top = 0
        Width = 826
        Height = 470
        Anchors = [akTop, akBottom]
        DataSource = DMDebCredST.DS_TotaisForn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnColEnter = Dbg_TotaisFornColEnter
        OnDrawColumnCell = Dbg_TotaisFornDrawColumnCell
        OnDblClick = Dbg_TotaisFornDblClick
        OnKeyDown = Dbg_VlrBcICMSSTKeyDown
        OnTitleClick = Dbg_TotaisFornTitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'SELECAO'
            Title.Alignment = taCenter
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_FORNECEDOR'
            Title.Alignment = taRightJustify
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_FORNECDOR'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOT_ICMS_ST_VENDA'
            Title.Alignment = taRightJustify
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOT_ICMS_ST_COMPRA'
            Title.Alignment = taRightJustify
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOT_DEB_CRED_ICMS_ST'
            Title.Alignment = taRightJustify
            Width = 140
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ORDEM'
            Visible = False
          end>
      end
    end
    object Ts_FornProdutos: TTabSheet
      Tag = 9999
      Caption = ' Produtos/Fornecedores '
      ImageIndex = 2
      object Dbg_ProdutosForn: TDBGrid
        Left = 0
        Top = 0
        Width = 969
        Height = 470
        Align = alClient
        DataSource = DMDebCredST.DS_ProdutoForn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgMultiSelect]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnColEnter = Dbg_ProdutosFornColEnter
        OnDrawColumnCell = Dbg_ProdutosFornDrawColumnCell
        OnKeyDown = Dbg_VlrBcICMSSTKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_PRODUTO'
            Title.Alignment = taRightJustify
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_PRODUTO'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_ICMS_ST_VENDA'
            Title.Alignment = taRightJustify
            Width = 128
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_ICMS_ST_COMPRA'
            Title.Alignment = taRightJustify
            Width = 128
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_DEB_CRED_ICMS_ST'
            Title.Alignment = taRightJustify
            Width = 128
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_DOCUMENTO'
            Title.Alignment = taCenter
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_LANCAMENTO'
            Title.Alignment = taCenter
            Title.Caption = 'Data Lan'#231'to'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DOCUMENTO'
            Title.Alignment = taRightJustify
            Width = 60
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'SERIE'
            Title.Alignment = taRightJustify
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MODELO_NF'
            Title.Alignment = taCenter
            Width = 48
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'ID_CFOP'
            Title.Alignment = taRightJustify
            Title.Caption = 'CFOP'
            Width = 40
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'CST_ICMS'
            Title.Alignment = taRightJustify
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PER_ALIQ_ICMS'
            Title.Alignment = taRightJustify
            Title.Caption = '% ICMS'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_ICMS'
            Title.Alignment = taRightJustify
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PER_ALIQ_ICMS_ST'
            Title.Alignment = taRightJustify
            Title.Caption = '% ICMS ST'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_ICMS_ST'
            Title.Alignment = taRightJustify
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_BASE_ICMS_ST'
            Title.Alignment = taRightJustify
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_OPERACAO'
            Title.Alignment = taRightJustify
            Width = 76
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'MODALIDADE'
            Title.Alignment = taCenter
            Width = 80
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TIPO'
            Title.Alignment = taCenter
            Width = 80
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DES_NCM'
            Title.Alignment = taCenter
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PER_ICMS'
            Title.Alignment = taRightJustify
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PER_FCP'
            Title.Alignment = taRightJustify
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PER_ICMS_EFETIVO'
            Title.Alignment = taRightJustify
            Width = 108
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UTILIZADO'
            Width = 158
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_FORNECEDOR'
            Title.Alignment = taRightJustify
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_FORNECDOR'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ORDEM'
            Visible = False
          end>
      end
    end
    object Ts_XMLsAnalisa: TTabSheet
      Tag = 9999
      Caption = ' Analisa XML'#39's '
      Highlighted = True
      ImageIndex = 3
      DesignSize = (
        969
        470)
      object Pan_XMLslBottom: TPanel
        Left = 0
        Top = 431
        Width = 969
        Height = 39
        Align = alBottom
        BevelInner = bvLowered
        BorderStyle = bsSingle
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
        DesignSize = (
          967
          37)
        object Label2: TLabel
          Left = 270
          Top = 12
          Width = 110
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'XML'#39's: Encontados'
        end
        object Label3: TLabel
          Left = 475
          Top = 12
          Width = 73
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Processados'
        end
        object Label11: TLabel
          Left = 659
          Top = 12
          Width = 77
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Selecionados'
        end
        object Bt_XMLsSair: TJvXPButton
          Tag = 99
          Left = 872
          Top = 2
          Width = 93
          Height = 33
          Caption = 'Sair'
          TabOrder = 0
          TabStop = False
          Glyph.Data = {
            07544269746D6170D6060000424DD60600000000000036040000280000001900
            0000180000000100080000000000A0020000C30E0000C30E0000000100000000
            0000000000007B000000FF000000007B00007B7B000000FF0000FFFF0000007B
            7B007B7B7B00BDBDBD0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00090909090909090909090909090909080909090909090909090000000909
            0909090909090909090909090808080909090909090909000000090909090909
            0909090909090909080404080909090909090900000009090909090909090909
            0909090908060604080909090909090000000909090909090909090909090909
            0806060404080909090909000000090909090909090909090909090908060604
            0404080909090900000000000000000000000000090909090806060404040000
            0000080000000909090909090909090008080808000606040404000809090900
            0000090909090909090808000A0A0A0A07060604040400080909090000000909
            09090909080004000A0A0A0A0706060404040008090909000000090909090909
            080004000A0A0A0A070606040404000809090900000009090908080808040404
            070A0A0A07060404000400080909090000000909080808080804060404070A0A
            0706040800040008090909000000090400000000000406060404070A07060604
            0404000809090900000008040606060606060606060404070706060404040008
            0909090000000804060B0B0B0B0B0B0B06060407070606040404000809090900
            0000090404040404040406060604070A07060604040400080909090000000909
            080808080804060604070A0A0706060404040008090909000000090909090909
            08040604070A0A0A070606040404000809090900000009090909090908040400
            0A0A0A0A0704060404040008090909000000090909090909080000000A0A0A0A
            0A070406040400080909090000000909090909090909080A0A0A0A0A0A0A0A04
            0604000809090900000009090909090909090807070707070707070004040008
            0909090000000909090909090909090808080808080808080808080909090900
            0000}
          ShowFocusRect = True
          Spacing = 10
          Align = alRight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_SairClick
        end
        object EdtXMLsEncontrados: TCurrencyEdit
          Left = 383
          Top = 9
          Width = 82
          Height = 21
          AutoSize = False
          Color = 16119285
          DecimalPlaces = 0
          DisplayFormat = ',0'
          Enabled = False
          Anchors = [akTop, akRight]
          TabOrder = 1
        end
        object EdtXMLsProcessados: TCurrencyEdit
          Left = 551
          Top = 8
          Width = 82
          Height = 21
          AutoSize = False
          Color = 16119285
          DecimalPlaces = 0
          DisplayFormat = ',0'
          Enabled = False
          Anchors = [akTop, akRight]
          TabOrder = 2
        end
        object Bt_XMLsSalvar: TJvXPButton
          Tag = 1
          Left = 2
          Top = 2
          Width = 119
          Height = 33
          Caption = 'Salvar em'#13#10' Mem'#243'ria'
          TabOrder = 3
          Glyph.Data = {
            07544269746D617066090000424D660900000000000036000000280000001B00
            00001C0000000100180000000000300900000000000000000000000000000000
            0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0A0C0C0A0C0C0A0C0C0A0C0C0A0C0C0A0C0C0A0C0C0A0C0C0A0
            C0C0A0C0C0A0C0C0A0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000000000000000000
            0000000000000000000000000000000000000000000000C0C0A0C0C0A0C0C0A0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C00000000020A00020A00020A00020A00020A00020A00020A000
            20A00020A0000000C000A0000000C0C0A0C0C0A0C0C0A0C0C0C0C0C0C0C0C0C0
            C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000020
            A00020A00020A00020A00020A00020A00020A00020A00020A0000000C000A000
            0000C0C0A0C0C0A0C0C0A0C0C0A0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C00000000020A00020A00020A00020A00020A00020
            A00020A00020A00020A0000000000000C000A0C000A0000000C0C0A0C0C0A0C0
            C0A0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            0000000020A00020A00020A00020A00020A00020A00020A00020A00020A00000
            00C000A0C000A0C000A0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
            0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000020A00020A00020A00020A0
            0020A00020A00020A00020A00020A0000000000000000000000000C000A0C000
            A0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C00000000020A00020A00020A00020A00020A00020A00020A00020A0
            0020A000000000FFFF00FFFF000000C000A0C000A0C000A0000000C0C0C0C0C0
            C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C00000000020A00020A000
            20A00020A00020A00020A00020A00020A00020A000000000FFFF00FFFF00FFFF
            000000000000000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0
            C0C0C0C0C0C0C0C0C0C000000000000000000000000000000000000000000000
            0000000000000000000000FF0000FF000000FFFF000000C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C000000000FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000000FFFFFF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000FFFF000000C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C000000000FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000
            00FFFFFF0000FF0000FF000000FFFF0000000000000000000000000000000000
            00000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
            0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000000FFFF00FFFF00FFFF
            000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0
            C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0A0C00000C00000C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0A0C00000C00000C00000C00000C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0A0C00000C00000C00000C00000C0
            0000C00000C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C00000C00000C00000C00000C00000C00000C00000C00000C00000C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0A0C0C0A0C0C0
            A0C00000C00000C00000FFFF00FFFF00FFFF00C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0A0C00000C00000C00000FFFF
            00C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
            0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0A0C00000C00000C00000FFFF00C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000}
          Align = alLeft
          OnClick = Bt_ClipboardClick
        end
        object EdtXMLsSelecionados: TCurrencyEdit
          Left = 741
          Top = 8
          Width = 82
          Height = 21
          AutoSize = False
          Color = 16119285
          DecimalPlaces = 0
          DisplayFormat = ',0'
          Enabled = False
          Anchors = [akTop, akRight]
          TabOrder = 4
        end
      end
      object Gb_XMLsSolicitacao: TGroupBox
        Left = 87
        Top = 1
        Width = 793
        Height = 57
        Anchors = [akTop]
        Caption = ' Informe a Pasta que Cont'#233'm os XML'#39's de Entrada '
        TabOrder = 0
        object Label1: TLabel
          Left = 664
          Top = 0
          Width = 118
          Height = 13
          Caption = ' Data do Download  '
        end
        object Shape1: TShape
          Left = 654
          Top = 6
          Width = 1
          Height = 50
        end
        object Bt_XMLsPasta: TJvXPButton
          Left = 13
          Top = 21
          Width = 26
          Height = 25
          TabOrder = 0
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
          OnClick = Bt_XMLsPastaClick
        end
        object EdtXMLsPasta: TEdit
          Left = 48
          Top = 24
          Width = 593
          Height = 19
          TabStop = False
          ReadOnly = True
          TabOrder = 1
        end
        object DtEdtXMLsDownLoad: TcxDateEdit
          Left = 670
          Top = 22
          ParentFont = False
          Properties.OnChange = DtEdtXMLsDownLoadPropertiesChange
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          StyleFocused.BorderStyle = ebsOffice11
          StyleFocused.TextStyle = [fsBold]
          StyleHot.BorderStyle = ebsUltraFlat
          TabOrder = 2
          Width = 106
        end
      end
      object Bt_XMLsAnaliza: TJvXPButton
        Tag = 1
        Left = 417
        Top = 62
        Width = 136
        Height = 34
        Caption = 'Analisar XML'#39's'
        TabOrder = 1
        Glyph.Data = {
          07544269746D617066090000424D660900000000000036000000280000001B00
          00001C0000000100180000000000300900000000000000000000000000000000
          0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0A0C0C0A0C0C0A0C0C0A0C0C0A0C0C0A0C0C0A0C0C0A0C0C0A0
          C0C0A0C0C0A0C0C0A0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000000000000000000
          0000000000000000000000000000000000000000000000C0C0A0C0C0A0C0C0A0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C00000000020A00020A00020A00020A00020A00020A00020A000
          20A00020A0000000C000A0000000C0C0A0C0C0A0C0C0A0C0C0C0C0C0C0C0C0C0
          C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000020
          A00020A00020A00020A00020A00020A00020A00020A00020A0000000C000A000
          0000C0C0A0C0C0A0C0C0A0C0C0A0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C00000000020A00020A00020A00020A00020A00020
          A00020A00020A00020A0000000000000C000A0C000A0000000C0C0A0C0C0A0C0
          C0A0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          0000000020A00020A00020A00020A00020A00020A00020A00020A00020A00000
          00C000A0C000A0C000A0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
          0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000020A00020A00020A00020A0
          0020A00020A00020A00020A00020A0000000000000000000000000C000A0C000
          A0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C00000000020A00020A00020A00020A00020A00020A00020A00020A0
          0020A000000000FFFF00FFFF000000C000A0C000A0C000A0000000C0C0C0C0C0
          C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C00000000020A00020A000
          20A00020A00020A00020A00020A00020A00020A000000000FFFF00FFFF00FFFF
          000000000000000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0
          C0C0C0C0C0C0C0C0C0C000000000000000000000000000000000000000000000
          0000000000000000000000FF0000FF000000FFFF000000C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C000000000FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000000FFFFFF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000FFFF000000C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C000000000FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000
          00FFFFFF0000FF0000FF000000FFFF0000000000000000000000000000000000
          00000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
          0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000000FFFF00FFFF00FFFF
          000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0
          C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0A0C00000C00000C00000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0A0C00000C00000C00000C00000C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0A0C00000C00000C00000C00000C0
          0000C00000C00000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C00000C00000C00000C00000C00000C00000C00000C00000C00000C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0A0C0C0A0C0C0
          A0C00000C00000C00000FFFF00FFFF00FFFF00C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0A0C00000C00000C00000FFFF
          00C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
          0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0A0C00000C00000C00000FFFF00C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000}
        Anchors = [akTop]
        OnClick = Bt_XMLsAnalizaClick
      end
      object Dbg_XMLs: TDBGrid
        Left = 0
        Top = 146
        Width = 969
        Height = 281
        Anchors = [akTop, akBottom]
        DataSource = DMDebCredST.DS_V_XMLsAnalisa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnColEnter = Dbg_XMLsColEnter
        OnDrawColumnCell = Dbg_XMLsDrawColumnCell
        OnKeyDown = Dbg_XMLsKeyDown
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CNPJ'
            Title.Alignment = taCenter
            Width = 100
            Visible = True
          end
          item
            Color = 8454143
            Expanded = False
            FieldName = 'NOME'
            Width = 300
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'FONE'
            Title.Alignment = taCenter
            Width = 76
            Visible = True
          end
          item
            Alignment = taCenter
            Color = 8454143
            Expanded = False
            FieldName = 'UF_EMIT'
            Title.Alignment = taCenter
            Width = 52
            Visible = True
          end
          item
            Alignment = taCenter
            Color = 8454143
            Expanded = False
            FieldName = 'UF_DEST'
            Title.Alignment = taCenter
            Width = 52
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CST'
            Title.Alignment = taCenter
            Width = 70
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TAG_VST'
            Title.Alignment = taCenter
            Width = 56
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VALOR_ST'
            Title.Alignment = taCenter
            Width = 40
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TAG_VFCPSTRET'
            Title.Alignment = taCenter
            Width = 100
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VALOR_VFCPSTRET'
            Title.Alignment = taCenter
            Width = 90
            Visible = True
          end>
      end
      object Gb_XMLsFiltros: TGroupBox
        Left = 20
        Top = 96
        Width = 929
        Height = 48
        Anchors = [akTop]
        Caption = ' Filtros '
        TabOrder = 2
        object Label6: TLabel
          Left = 230
          Top = 21
          Width = 21
          Height = 13
          Caption = 'CST'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 360
          Top = 21
          Width = 42
          Height = 13
          Caption = 'Tag vST'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 480
          Top = 21
          Width = 47
          Height = 13
          Caption = 'Valor vST'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 605
          Top = 21
          Width = 79
          Height = 13
          Caption = 'Tag vFCPSTRet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 760
          Top = 21
          Width = 84
          Height = 13
          Caption = 'Valor vFCPSTRet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 12
          Top = 21
          Width = 37
          Height = 13
          Caption = 'UF Emit'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 121
          Top = 21
          Width = 39
          Height = 13
          Caption = 'UF Dest'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Cbx_XMLsCST: TComboBox
          Left = 254
          Top = 18
          Width = 97
          Height = 19
          Style = csOwnerDrawFixed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 2
          OnChange = Cbx_XMLsUFEmitChange
        end
        object Cbx_XMLsvST: TComboBox
          Left = 405
          Top = 18
          Width = 66
          Height = 22
          Style = csOwnerDrawFixed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 16
          ParentFont = False
          TabOrder = 3
          OnChange = Cbx_XMLsUFEmitChange
          Items.Strings = (
            'SIM'
            'NAO'
            'Ambos')
        end
        object Cbx_XMLsVlrvST: TComboBox
          Left = 530
          Top = 18
          Width = 66
          Height = 19
          Style = csOwnerDrawFixed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 4
          OnChange = Cbx_XMLsUFEmitChange
          Items.Strings = (
            'SIM'
            'NAO'
            'Ambos')
        end
        object Cbx_XMLsvFCPSTRet: TComboBox
          Left = 687
          Top = 18
          Width = 66
          Height = 19
          Style = csOwnerDrawFixed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 5
          OnChange = Cbx_XMLsUFEmitChange
          Items.Strings = (
            'SIM'
            'NAO'
            'Ambos')
        end
        object Cbx_XMLsVlrvFCPSTRet: TComboBox
          Left = 847
          Top = 18
          Width = 66
          Height = 19
          Style = csOwnerDrawFixed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 6
          OnChange = Cbx_XMLsUFEmitChange
          Items.Strings = (
            'SIM'
            'NAO'
            'Ambos')
        end
        object Cbx_XMLsUFEmit: TComboBox
          Left = 52
          Top = 18
          Width = 61
          Height = 19
          Style = csOwnerDrawFixed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
          OnChange = Cbx_XMLsUFEmitChange
        end
        object Cbx_XMLsUFDest: TComboBox
          Left = 163
          Top = 18
          Width = 61
          Height = 19
          Style = csOwnerDrawFixed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 1
          OnChange = Cbx_XMLsUFEmitChange
        end
      end
    end
  end
  object Pan_Solicitacoes: TPanel
    Left = 0
    Top = 498
    Width = 977
    Height = 78
    Align = alBottom
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 26
      Width = 975
      Height = 51
      Align = alBottom
      BevelInner = bvLowered
      BorderStyle = bsSingle
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object Bt_Sair: TJvXPButton
        Tag = 99
        Left = 889
        Top = 2
        Width = 82
        Height = 45
        Caption = 'Sair'
        TabOrder = 6
        TabStop = False
        Glyph.Data = {
          07544269746D6170D6060000424DD60600000000000036040000280000001900
          0000180000000100080000000000A0020000C30E0000C30E0000000100000000
          0000000000007B000000FF000000007B00007B7B000000FF0000FFFF0000007B
          7B007B7B7B00BDBDBD0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00090909090909090909090909090909080909090909090909090000000909
          0909090909090909090909090808080909090909090909000000090909090909
          0909090909090909080404080909090909090900000009090909090909090909
          0909090908060604080909090909090000000909090909090909090909090909
          0806060404080909090909000000090909090909090909090909090908060604
          0404080909090900000000000000000000000000090909090806060404040000
          0000080000000909090909090909090008080808000606040404000809090900
          0000090909090909090808000A0A0A0A07060604040400080909090000000909
          09090909080004000A0A0A0A0706060404040008090909000000090909090909
          080004000A0A0A0A070606040404000809090900000009090908080808040404
          070A0A0A07060404000400080909090000000909080808080804060404070A0A
          0706040800040008090909000000090400000000000406060404070A07060604
          0404000809090900000008040606060606060606060404070706060404040008
          0909090000000804060B0B0B0B0B0B0B06060407070606040404000809090900
          0000090404040404040406060604070A07060604040400080909090000000909
          080808080804060604070A0A0706060404040008090909000000090909090909
          08040604070A0A0A070606040404000809090900000009090909090908040400
          0A0A0A0A0704060404040008090909000000090909090909080000000A0A0A0A
          0A070406040400080909090000000909090909090909080A0A0A0A0A0A0A0A04
          0604000809090900000009090909090909090807070707070707070004040008
          0909090000000909090909090909090808080808080808080808080909090900
          0000}
        ShowFocusRect = True
        Spacing = 10
        Align = alRight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Bt_SairClick
      end
      object Bt_VlrBcICMSST: TJvXPButton
        Left = 2
        Top = 2
        Width = 128
        Height = 45
        Caption = ' Fornecedores '#13#10'Vlr BC ICMS ST'
        TabOrder = 0
        TabStop = False
        Glyph.Data = {
          07544269746D617066010000424D660100000000000076000000280000001400
          0000140000000100040000000000F00000000000000000000000100000001000
          0000000000000000BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0
          C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00333333333333333333330000300000000000003333330000307888888888
          80333333000030F77777777780333333000030F99777777780333333000030FF
          FFFFFFFF70333333000030000000000000333333000033333333333333333333
          0000333003333333333333330000333003333333333333330000333003333330
          000000030000333003303330FFFFFF030000333008300330F4444F0300003338
          00000030FFFFFF030000333380000030F4444F030000333333300330FFFFFF03
          0000333333303330F44F00030000333333333330FFFF00330000333333333330
          000003330000333333333333333333330000}
        ShowFocusRect = True
        Spacing = 8
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Bt_VlrBcICMSSTClick
      end
      object Bt_Clipboard: TJvXPButton
        Tag = 4
        Left = 781
        Top = 2
        Width = 98
        Height = 45
        Caption = 'Salvar em'#13#10' Mem'#243'ria'
        TabOrder = 4
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
        Align = alRight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Bt_ClipboardClick
      end
      object Bt_ProdutosForn: TJvXPButton
        Left = 657
        Top = 2
        Width = 118
        Height = 45
        Caption = 'Produtos  por'#13#10'Fornecedores'
        TabOrder = 3
        Glyph.Data = {
          07544269746D617066010000424D660100000000000076000000280000001400
          0000140000000100040000000000F00000000000000000000000100000001000
          0000000000000000BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0
          C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00333333333333333333330000300000000000003333330000307888888888
          80333333000030F77777777780333333000030F99777777780333333000030FF
          FFFFFFFF70333333000030000000000000333333000033333333333333333333
          0000333003333333333333330000333003333333333333330000333003333330
          000000030000333003303330FFFFFF030000333008300330F4444F0300003338
          00000030FFFFFF030000333380000030F4444F030000333333300330FFFFFF03
          0000333333303330F44F00030000333333333330FFFF00330000333333333330
          000003330000333333333333333333330000}
        ShowFocusRect = True
        Spacing = 8
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Bt_ProdutosFornClick
      end
      object Bt_TotaisForn: TJvXPButton
        Tag = 4
        Left = 538
        Top = 2
        Width = 119
        Height = 45
        Caption = '  Totais por'#13#10'Fornecedores'
        TabOrder = 2
        Glyph.Data = {
          07544269746D617066010000424D660100000000000076000000280000001400
          0000140000000100040000000000F00000000000000000000000100000001000
          0000000000000000BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0
          C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00333333333333333333330000300000000000003333330000307888888888
          80333333000030F77777777780333333000030F99777777780333333000030FF
          FFFFFFFF70333333000030000000000000333333000033333333333333333333
          0000333003333333333333330000333003333333333333330000333003333330
          000000030000333003303330FFFFFF030000333008300330F4444F0300003338
          00000030FFFFFF030000333380000030F4444F030000333333300330FFFFFF03
          0000333333303330F44F00030000333333333330FFFF00330000333333333330
          000003330000333333333333333333330000}
        ShowFocusRect = True
        Spacing = 8
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Bt_TotaisFornClick
      end
      object Panel2: TPanel
        Left = 879
        Top = 2
        Width = 10
        Height = 45
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 5
      end
      object Gb_Periodo: TGroupBox
        Left = 130
        Top = 2
        Width = 241
        Height = 45
        Align = alLeft
        Caption = ' Per'#237'odo a Selecionar  '
        Color = 14342874
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        object Label85: TLabel
          Left = 116
          Top = 22
          Width = 8
          Height = 13
          Caption = 'a'
        end
        object DtEdtDtaInicio: TcxDateEdit
          Left = 9
          Top = 16
          ParentFont = False
          Properties.OnEditValueChanged = DtEdtDtaInicioPropertiesEditValueChanged
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          StyleFocused.BorderStyle = ebsOffice11
          StyleFocused.TextStyle = [fsBold]
          StyleHot.BorderStyle = ebsUltraFlat
          TabOrder = 0
          Width = 106
        end
        object DtEdtDtaFim: TcxDateEdit
          Left = 127
          Top = 16
          ParentFont = False
          Properties.OnEditValueChanged = DtEdtDtaInicioPropertiesEditValueChanged
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          StyleFocused.BorderStyle = ebsOffice11
          StyleFocused.TextStyle = [fsBold]
          StyleHot.BorderStyle = ebsUltraFlat
          TabOrder = 1
          Width = 106
        end
      end
      object Gb_NFeCompras: TGroupBox
        Left = 371
        Top = 2
        Width = 167
        Height = 45
        Align = alLeft
        Caption = ' NFe Compras '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        object Rb_NFeAmbas: TJvRadioButton
          Left = 103
          Top = 20
          Width = 59
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Ambas'
          Checked = True
          TabOrder = 2
          TabStop = True
          OnClick = Rb_NFeSemClick
          OnKeyUp = Rb_NFeSemKeyUp
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          LinkedControls = <>
        end
        object Rb_NFeSem: TJvRadioButton
          Left = 55
          Top = 20
          Width = 42
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Sem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = Rb_NFeSemClick
          OnKeyUp = Rb_NFeSemKeyUp
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          LinkedControls = <>
        end
        object Rb_NFeCom: TJvRadioButton
          Left = 9
          Top = 20
          Width = 42
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Com'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = Rb_NFeSemClick
          OnKeyUp = Rb_NFeSemKeyUp
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          LinkedControls = <>
        end
      end
    end
    object dxStatusBar2: TdxStatusBar
      Left = 1
      Top = 2
      Width = 975
      Height = 24
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Fixed = False
          Text = 'Localizar: Tecle no T'#237'tulo da Coluna'
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Fixed = False
          Text = '<DiploClique> Para Selecionar'
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
  object OdirPanApres: TPanel
    Left = 832
    Top = 220
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
    TabOrder = 2
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
    FormCaption = 'BelShop - D'#233'bito / Cr'#233'dito ICMS ST'
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
