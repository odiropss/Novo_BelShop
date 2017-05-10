object FrmMateriaPrimaCadastro: TFrmMateriaPrimaCadastro
  Left = 273
  Top = 74
  Width = 928
  Height = 592
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'CADASTRO'
  Color = clBtnFace
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
  object Gb_Principal: TGroupBox
    Left = 0
    Top = 0
    Width = 912
    Height = 554
    Align = alClient
    Caption = ' MAT'#201'RIA - PRIMA '
    Color = 16770250
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object Pan_MateriaPrimaSolic: TPanel
      Left = 2
      Top = 15
      Width = 908
      Height = 64
      Align = alTop
      BevelInner = bvLowered
      Color = 16770250
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      object Gb_MateriaPrimaCod: TGroupBox
        Left = 11
        Top = 5
        Width = 76
        Height = 51
        Caption = ' C'#243'digo '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object EdtMateriaPrimaCod: TCurrencyEdit
          Left = 12
          Top = 19
          Width = 52
          Height = 21
          AutoSize = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnEnter = EdtMateriaPrimaCodEnter
          OnExit = EdtMateriaPrimaCodExit
        end
      end
      object Gb_MateriaPrimaDesc: TGroupBox
        Left = 88
        Top = 5
        Width = 262
        Height = 51
        Caption = ' Descri'#231#227'o '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object EdtMateriaPrimaDesc: TEdit
          Left = 13
          Top = 19
          Width = 237
          Height = 19
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 60
          ParentFont = False
          TabOrder = 0
        end
      end
      object Gb_MateriaPrimaQtdConv: TGroupBox
        Left = 352
        Top = 5
        Width = 107
        Height = 51
        Caption = ' Qtd Convers'#227'o '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object EdtMateriaPrimaQtdConv: TCurrencyEdit
          Left = 28
          Top = 19
          Width = 52
          Height = 21
          AutoSize = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object Bt_MateriaPrimaSalvar: TJvXPButton
        Tag = 99
        Left = 569
        Top = 18
        Width = 105
        Height = 28
        Caption = 'Salvar'
        TabOrder = 4
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
        Spacing = 5
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Bt_MateriaPrimaSalvarClick
      end
      object Bt_MateriaPrimaAbandonar: TJvXPButton
        Tag = 99
        Left = 677
        Top = 18
        Width = 105
        Height = 28
        Caption = 'Abandonar'
        TabOrder = 5
        Glyph.Data = {
          07544269746D6170F6000000424DF60000000000000076000000280000001000
          0000100000000100040000000000800000000000000000000000100000001000
          0000000000000000BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0
          C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF0077777700000087777777770AAAAA00877777770AAAAAA2077777770AAAAA
          2A20777777000000A22077777777777700207777777777777700777707777777
          77007770077777770020770A00000000A22070AAAAAAAAAA2A200AAAAAAAAAAA
          A20770AAAAAAAAAA0077770A0000000087777770077777777777777707777777
          7777}
        ShowFocusRect = True
        Spacing = 5
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Bt_MateriaPrimaAbandonarClick
      end
      object Bt_MateriaPrimaExcluir: TJvXPButton
        Tag = 99
        Left = 786
        Top = 18
        Width = 105
        Height = 28
        Caption = 'Excluir'
        TabOrder = 6
        Glyph.Data = {
          07544269746D6170B2050000424DB20500000000000036040000280000001200
          00001300000001000800000000007C010000C30E0000C30E0000000100000000
          0000000000007B000000BD000000FF0000007B7B000000FF0000FFFF00000031
          5A0008427300084A730000007B007B007B00084A7B0008527B0021527B00007B
          7B007B7B7B00004A840008528400105284002963840008528C00085A8C00185A
          8C0018638C0029638C0008529400185A9400296B9400316B9400297394003173
          9400085A9C0018639C0018739C0029739C0031739C0031849C00005AA5002173
          A5003973A500297BA500186BAD00106BB500317BB5002984B5004A8CB500086B
          BD000073BD001073BD001873BD00217BBD004284BD00318CBD004A8CBD005294
          BD005A9CBD00BDBDBD001073C600007BC600217BC600428CC6004A8CC6005A9C
          C6000084CE000884CE00398CCE005A9CCE00639CCE001884D6002184D600088C
          D600108CD6004294D600399CD6004A9CD600529CD6005A9CD6005AA5D60063AD
          D6001884DE002184DE00188CDE001094DE001894DE003194DE00299CDE004AA5
          DE005AA5DE004AB5DE00189CE700219CE700429CE7005AA5E7005AADE70063AD
          E7006BB5E70021A5EF0029A5EF0031A5EF0063B5EF006BBDEF0029ADF70031AD
          F7006BBDF7000000FF00FF00FF0031B5FF0039B5FF0042B5FF0039BDFF0042BD
          FF0042C6FF004AC6FF006BC6FF004ACEFF0052CEFF0052D6FF005ADEFF0063E7
          FF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
          FF00393939393939393939393939393939393969000039693939393939393939
          3939393939396939000039696939391010101010101010101069393900003969
          6969000000000000000000006969393900003939696900787979797879797969
          6939393900003939396969790303030303037969103939390000393939696969
          7978797979786969103939390000393939396969690303036969690010393939
          0000393939390069696979786969790010393939000039393939007903696969
          6903790010393939000039393939007979696969697879001039393900003939
          3939007903696969690000001039393900003939393900786969790069697900
          1039393900003939393900696969790069696969393939390000393939696969
          7978790079003969693939390000396969696900000000000039393969693939
          0000396969693939393939393939393939396939000039393939393939393939
          393939393939396900003939393939393939393939393939393939390000}
        ShowFocusRect = True
        Spacing = 5
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Bt_MateriaPrimaExcluirClick
      end
      object Gb_MateriaPrimaVlrUnit: TGroupBox
        Left = 461
        Top = 5
        Width = 100
        Height = 51
        Caption = ' Valor Unit'#225'rio '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object EdtMateriaPrimaVlrUnit: TCurrencyEdit
          Left = 13
          Top = 19
          Width = 72
          Height = 21
          AutoSize = False
          DisplayFormat = ',0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object Pan_MateriaPrima: TPanel
      Left = 223
      Top = 87
      Width = 466
      Height = 431
      TabOrder = 1
      object Dbg_MateriaPrima: TDBGrid
        Left = 1
        Top = 1
        Width = 464
        Height = 409
        Align = alClient
        DataSource = DMArtesanalis.DS_MateriaPrima
        FixedColor = 15000804
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnDblClick = Dbg_MateriaPrimaDblClick
        OnEnter = Dbg_MateriaPrimaEnter
        OnExit = Dbg_MateriaPrimaExit
        OnKeyDown = Dbg_MateriaPrimaKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_MATERIAPRIMA'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DES_MATERIAPRIMA'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_CONVERSAO'
            Title.Alignment = taRightJustify
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_UNITATIO'
            Title.Alignment = taRightJustify
            Width = 80
            Visible = True
          end>
      end
      object StB_MateriaPrima: TdxStatusBar
        Left = 1
        Top = 410
        Width = 464
        Height = 20
        Panels = <
          item
            PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
            PanelStyle.Alignment = taCenter
            Fixed = False
            Text = '<C'#243'digo = 0> Novo'
            Width = 130
          end
          item
            PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
            PanelStyle.Alignment = taCenter
            PanelStyle.Color = clSilver
            BiDiMode = bdRightToLeft
            Fixed = False
            ParentBiDiMode = False
            Text = '<Duplo Click no Grid> Selecina'
            Width = 200
          end
          item
            PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
            PanelStyle.Alignment = taCenter
            Text = '<F4 no Grid> Procura'
            Width = 140
          end>
        PaintStyle = stpsOffice11
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
      end
    end
    object Pan_Solicitacoes: TPanel
      Left = 2
      Top = 522
      Width = 908
      Height = 30
      Align = alBottom
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = 16770250
      TabOrder = 2
      object Bt_Fechar: TJvXPButton
        Tag = 99
        Left = 808
        Top = 1
        Width = 99
        Height = 28
        Caption = 'Fechar'
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
        OnClick = Bt_FecharClick
      end
    end
    object OdirPanApres: TPanel
      Left = 736
      Top = 176
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
  end
end
