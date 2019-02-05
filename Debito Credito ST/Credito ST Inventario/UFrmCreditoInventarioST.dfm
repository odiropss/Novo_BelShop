object FrmCreditoInventarioST: TFrmCreditoInventarioST
  Left = 240
  Top = 123
  Width = 1095
  Height = 586
  ActiveControl = PageControl1
  Caption = 'FrmCreditoInventarioST'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1079
    Height = 548
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Credito ST Desembro/2018'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1071
        Height = 65
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 933
          Top = 24
          Width = 32
          Height = 13
          Caption = 'Label1'
        end
        object Label2: TLabel
          Left = 989
          Top = 24
          Width = 32
          Height = 13
          Caption = 'Label2'
        end
        object Label5: TLabel
          Left = 16
          Top = 24
          Width = 25
          Height = 13
          Caption = 'Loja'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bt_BuscaProdutos: TJvXPButton
          Tag = 91
          Left = 146
          Top = 18
          Width = 136
          Height = 32
          Caption = 'Busca Produtos'
          TabOrder = 0
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_BuscaProdutosClick
        end
        object Bt_AtualizaUltCompra: TJvXPButton
          Tag = 91
          Left = 284
          Top = 18
          Width = 155
          Height = 32
          Caption = 'Atualiza Ult Entrada'
          TabOrder = 1
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_AtualizaUltCompraClick
        end
        object Bt_SalvaMemoria: TJvXPButton
          Tag = 91
          Left = 762
          Top = 18
          Width = 144
          Height = 32
          Caption = 'Salva em Mem'#243'ia'
          TabOrder = 2
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_SalvaMemoriaClick
        end
        object Bt_AtualizaUltCustoMedio: TJvXPButton
          Tag = 91
          Left = 441
          Top = 18
          Width = 159
          Height = 32
          Caption = 'Atualiza Custo M'#233'dio'
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_AtualizaUltCustoMedioClick
        end
        object Bt_AtualizaCustoICMS: TJvXPButton
          Tag = 91
          Left = 602
          Top = 18
          Width = 158
          Height = 32
          Caption = 'Atualiza Custo ICMS'
          TabOrder = 4
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_AtualizaCustoICMSClick
        end
        object EdtCod_Loja: TCurrencyEdit
          Left = 47
          Top = 22
          Width = 39
          Height = 21
          AutoSize = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          TabOrder = 5
        end
      end
      object Dbg_CreditoST: TDBGrid
        Left = 0
        Top = 65
        Width = 1071
        Height = 455
        Align = alClient
        DataSource = DMCreditoInventarioST.DS_CreditoST
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_PRODUTO'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DES_NCM'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DES_PRODUTO'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_CUSTO'
            Title.Alignment = taRightJustify
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_ESTOQUE'
            Title.Alignment = taRightJustify
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_CUSTO_TOTAL'
            Title.Alignment = taRightJustify
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_BC_ST_ENTRADA'
            Title.Alignment = taRightJustify
            Width = 130
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_BC_ST_TOTAL'
            Title.Alignment = taRightJustify
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_CRED_PRES_ST'
            Title.Alignment = taRightJustify
            Title.Caption = 'VLR_CRED_PRES_ST - 27%'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LOCALIZACAO'
            Width = 120
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'LinxProdutosDetalhes'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1071
        Height = 65
        Align = alTop
        TabOrder = 0
        object Label3: TLabel
          Left = 736
          Top = 24
          Width = 32
          Height = 13
          Caption = 'Label3'
        end
        object Label4: TLabel
          Left = 792
          Top = 24
          Width = 32
          Height = 13
          Caption = 'Label4'
        end
        object Bt_LinxProdDetBusca: TJvXPButton
          Tag = 91
          Left = 42
          Top = 10
          Width = 223
          Height = 32
          Caption = 'Acerta LinxProdutosDetalhes'
          TabOrder = 0
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
          Spacing = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_LinxProdDetBuscaClick
        end
      end
      object Dbg_LinxProdDet: TDBGrid
        Left = 0
        Top = 65
        Width = 1071
        Height = 455
        Align = alClient
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  object OdirPanApres: TPanel
    Left = 426
    Top = -3
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
end
