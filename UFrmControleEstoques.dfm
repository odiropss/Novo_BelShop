object FrmControleEstoques: TFrmControleEstoques
  Left = 253
  Top = 112
  Align = alClient
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'CONTROLE DE ESTOQUES'
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
  object Panel10: TPanel
    Left = 0
    Top = 539
    Width = 977
    Height = 39
    Align = alBottom
    BevelInner = bvLowered
    BorderStyle = bsSingle
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Bt_ContEstFechaVoltar: TJvXPButton
      Tag = 99
      Left = 873
      Top = 2
      Width = 100
      Height = 33
      Caption = 'Fechar'
      TabOrder = 5
      TabStop = False
      ShowFocusRect = True
      Spacing = 10
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_ContEstFechaVoltarClick
    end
    object Bt_ContEstSimulador: TJvXPButton
      Left = 2
      Top = 2
      Width = 120
      Height = 33
      Caption = 'Simular Estoques'
      TabOrder = 0
      Glyph.Data = {
        07544269746D617042010000424D420100000000000076000000280000001100
        0000110000000100040000000000CC0000000000000000000000100000001000
        0000000000000000BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0
        C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00777777777777777770000000777007777087878700000000777777777077
        7777000000007770077770000000000000007770077770FFFFFF000000007770
        007770FFFFFF000000007777700770FFFFFF0000000070077007700000000000
        00007000000770FFFFFF000000007700007770FFFFFF000000007777777770FF
        FFFF000000007777747770000000000000007777744770FFFFFF000000007744
        444470FFFFFF000000007777744770FFFFFF0000000077777477700000000000
        0000777777777777777770000000}
      ShowFocusRect = True
      Spacing = 12
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_ContEstSimuladorClick
    end
    object Bt_ContEstSalvaExcel: TJvXPButton
      Tag = 4
      Left = 559
      Top = 2
      Width = 152
      Height = 33
      Caption = 'Salvar em Excel'
      TabOrder = 3
      TabStop = False
      Glyph.Data = {
        0A544A504547496D616765B0040000FFD8FFE000104A46494600010101006000
        600000FFDB004300020101020101020202020202020203050303030303060404
        0305070607070706070708090B0908080A0807070A0D0A0A0B0C0C0C0C07090E
        0F0D0C0E0B0C0C0CFFDB004301020202030303060303060C0807080C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0CFFC00011080017001503012200021101031101
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
        E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FD4E
        F8BBFB47787F53B0BBD77C5971A48F0AC9AA26836B6FAD2793A6C32BEE9544B1
        DD471AFDA36C2AF2199736FCA210A6492687FE104F036A1ADDF696BE05F84771
        A969D1493DEDA0B3D19A6B48D3024791319455DCB92C001B867AD79EF8D7E06F
        883F6A8FD917E2E783F4DBCF0BC7378EBE217881F4D7D4A79639618EC6F1ADC3
        C48A016956EECCF048431F5387E3CA3FE0985E24F895F0EBF658F8AFE0DF8A9F
        B39F8BAD3C69E1B88597882F6E26B896E3E204774C52DD2CE686178E6486DDE6
        490DB4F22C6EA24FBF73218FE3B0F5EB49F34D2E571E67269DEEEFA6CFCADD96
        896C7874EA49FBCD696BB767FE4FFE1B447E82EB9FB457C29F817E19D16DF55F
        1AF813C23A3DC44D6FA44773AA5B58DB49140114A5B866552B1864184E14151C
        64515F9CFE23FD99B43FDB03F620F81B75E0F6D6AFBC3FA29F100B59751B986E
        EE9FCCD436B9792DE38A3605E16DA56351B7039209257D4E16A39D18CDF547AD
        87A9CF4A33EE933EB8F1D7EC43AB691AED8EA1A3E81E17F1E7F60F88EF7C4DA0
        C5ABF8A753F0DC9A4DC5E5FB6A73F986D62B886EFF00D3083197863D91011B79
        987793C5F52FD97AF3E0C69DE2AD53FB1FE387C3DB8D774F6B53E224F10E91A9
        E87E0FDF7105C9304705DC37F3C4AF6F1A6E68CCCD1961952C4D14563FD99866
        92E55A69E7B5B7F433960E8C959C576FC2DF91E95FF04C4F8E9E19F8F5E3BF18
        7FC223F10356F891A2F85BC27E1BD1EF353BF8AF6169B55171ACCB77379777FB
        C5322CB6E782C02AC6818F97C14515D54E9A841423B23A231514A2BA1FFFD9}
      ShowFocusRect = True
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_ContEstSalvaExcelClick
    end
    object Bt_ContEstClipboard: TJvXPButton
      Tag = 4
      Left = 711
      Top = 2
      Width = 162
      Height = 33
      Caption = 'Salvar em Mem'#243'ria'
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
      OnClick = Bt_ContEstClipboardClick
    end
    object Bt_ContEstProdutos: TJvXPButton
      Tag = 4
      Left = 122
      Top = 2
      Width = 120
      Height = 33
      Caption = 'Simular Produtos'
      TabOrder = 1
      TabStop = False
      Glyph.Data = {
        07544269746D617042010000424D420100000000000076000000280000001100
        0000110000000100040000000000CC0000000000000000000000100000001000
        0000000000000000BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0
        C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00777777777777777770000000777007777087878700000000777777777077
        7777000000007770077770000000000000007770077770FFFFFF000000007770
        007770FFFFFF000000007777700770FFFFFF0000000070077007700000000000
        00007000000770FFFFFF000000007700007770FFFFFF000000007777777770FF
        FFFF000000007777747770000000000000007777744770FFFFFF000000007744
        444470FFFFFF000000007777744770FFFFFF0000000077777477700000000000
        0000777777777777777770000000}
      ShowFocusRect = True
      Spacing = 12
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_ContEstProdutosClick
    end
    object Bt_ContEstFornecedores: TJvXPButton
      Tag = 4
      Left = 242
      Top = 2
      Width = 120
      Height = 33
      Caption = 'Simular Fornecedores'
      TabOrder = 2
      Glyph.Data = {
        07544269746D617042010000424D420100000000000076000000280000001100
        0000110000000100040000000000CC0000000000000000000000100000001000
        0000000000000000BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0
        C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00777777777777777770000000777007777087878700000000777777777077
        7777000000007770077770000000000000007770077770FFFFFF000000007770
        007770FFFFFF000000007777700770FFFFFF0000000070077007700000000000
        00007000000770FFFFFF000000007700007770FFFFFF000000007777777770FF
        FFFF000000007777747770000000000000007777744770FFFFFF000000007744
        444470FFFFFF000000007777744770FFFFFF0000000077777477700000000000
        0000777777777777777770000000}
      ShowFocusRect = True
      Spacing = 12
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_ContEstProdutosClick
    end
  end
  object PC_ContEstPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 977
    Height = 539
    ActivePage = Ts_ContEstSolic
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnChange = PC_ContEstPrincipalChange
    object Ts_ContEstSolic: TTabSheet
      Tag = 9999
      Caption = ' Filtros  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Highlighted = True
      ParentFont = False
      object Pan_ContEstParametros: TPanel
        Left = 0
        Top = 0
        Width = 969
        Height = 127
        Align = alTop
        TabOrder = 0
        DesignSize = (
          969
          127)
        object Gb_ContEstParametros: TGroupBox
          Left = 0
          Top = 0
          Width = 969
          Height = 127
          Anchors = [akTop, akBottom]
          Caption = ' PARAMETROS DE ESTOQUES/CURVAS '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Lab_ParamCurvaE: TLabel
            Left = 34
            Top = 101
            Width = 286
            Height = 13
            Caption = 
              'Curva E ........................................................' +
              '...'
            Color = 8454143
            ParentColor = False
          end
          object Lab_ParamCurvaD: TLabel
            Left = 426
            Top = 72
            Width = 287
            Height = 13
            Caption = 
              'Curva D ........................................................' +
              '...'
            Color = 8454143
            ParentColor = False
          end
          object Lab_ParamCurvaC: TLabel
            Left = 34
            Top = 72
            Width = 286
            Height = 13
            Caption = 
              'Curva C ........................................................' +
              '...'
            Color = 8454143
            ParentColor = False
          end
          object Lab_ParamCurvaB: TLabel
            Left = 426
            Top = 43
            Width = 286
            Height = 13
            Caption = 
              'Curva B ........................................................' +
              '...'
            Color = 8454143
            ParentColor = False
          end
          object Lab_ParamCurvaA: TLabel
            Left = 34
            Top = 43
            Width = 286
            Height = 13
            Caption = 
              'Curva A ........................................................' +
              '...'
            Color = clYellow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label64: TLabel
            Left = 68
            Top = 24
            Width = 62
            Height = 13
            Caption = 'Percentual'
          end
          object Label189: TLabel
            Left = 139
            Top = 97
            Width = 16
            Height = 20
            Caption = '%'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object Label187: TLabel
            Left = 531
            Top = 68
            Width = 16
            Height = 20
            Caption = '%'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label83: TLabel
            Left = 139
            Top = 68
            Width = 16
            Height = 20
            Caption = '%'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object Label82: TLabel
            Left = 531
            Top = 39
            Width = 16
            Height = 20
            Caption = '%'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label81: TLabel
            Left = 139
            Top = 39
            Width = 16
            Height = 20
            Caption = '%'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object Label46: TLabel
            Left = 179
            Top = 24
            Width = 63
            Height = 13
            Caption = 'Estocagem'
          end
          object Label53: TLabel
            Left = 248
            Top = 101
            Width = 26
            Height = 13
            Caption = 'Dias'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object Label49: TLabel
            Left = 640
            Top = 72
            Width = 26
            Height = 13
            Caption = 'Dias'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label51: TLabel
            Left = 248
            Top = 72
            Width = 26
            Height = 13
            Caption = 'Dias'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object Label47: TLabel
            Left = 640
            Top = 43
            Width = 26
            Height = 13
            Caption = 'Dias'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label45: TLabel
            Left = 248
            Top = 43
            Width = 26
            Height = 13
            Caption = 'Dias'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object Label44: TLabel
            Left = 304
            Top = 24
            Width = 68
            Height = 13
            Caption = 'Est. M'#237'nimo'
          end
          object Label1: TLabel
            Left = 460
            Top = 24
            Width = 62
            Height = 13
            Caption = 'Percentual'
          end
          object Label2: TLabel
            Left = 571
            Top = 24
            Width = 63
            Height = 13
            Caption = 'Estocagem'
          end
          object Label3: TLabel
            Left = 696
            Top = 24
            Width = 68
            Height = 13
            Caption = 'Est. M'#237'nimo'
          end
          object Label4: TLabel
            Left = 35
            Top = 43
            Width = 52
            Height = 13
            AutoSize = False
            Caption = 'Curva A'
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = False
          end
          object Label5: TLabel
            Left = 35
            Top = 72
            Width = 52
            Height = 13
            AutoSize = False
            Caption = 'Curva C'
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = False
          end
          object Label6: TLabel
            Left = 35
            Top = 101
            Width = 52
            Height = 13
            AutoSize = False
            Caption = 'Curva E'
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = False
          end
          object Label7: TLabel
            Left = 427
            Top = 43
            Width = 52
            Height = 13
            AutoSize = False
            Caption = 'Curva B'
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label8: TLabel
            Left = 427
            Top = 72
            Width = 52
            Height = 13
            AutoSize = False
            Caption = 'Curva D'
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Ckb_ParamCurvaSelectA: TJvCheckBox
            Left = 14
            Top = 41
            Width = 13
            Height = 17
            TabStop = False
            BiDiMode = bdRightToLeft
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
            State = cbChecked
            TabOrder = 15
            OnClick = Ckb_ParamCurvaSelectAClick
            OnKeyUp = Ckb_ParamCurvaSelectAKeyUp
            LinkedControls = <>
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
          end
          object Ckb_ParamCurvaSelectB: TJvCheckBox
            Left = 406
            Top = 41
            Width = 13
            Height = 17
            TabStop = False
            BiDiMode = bdRightToLeft
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
            State = cbChecked
            TabOrder = 16
            OnClick = Ckb_ParamCurvaSelectAClick
            OnKeyUp = Ckb_ParamCurvaSelectAKeyUp
            LinkedControls = <>
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
          end
          object Ckb_ParamCurvaSelectC: TJvCheckBox
            Left = 14
            Top = 70
            Width = 13
            Height = 17
            TabStop = False
            BiDiMode = bdRightToLeft
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
            State = cbChecked
            TabOrder = 17
            OnClick = Ckb_ParamCurvaSelectAClick
            OnKeyUp = Ckb_ParamCurvaSelectAKeyUp
            LinkedControls = <>
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
          end
          object Ckb_ParamCurvaSelectD: TJvCheckBox
            Left = 406
            Top = 70
            Width = 13
            Height = 17
            TabStop = False
            BiDiMode = bdRightToLeft
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
            State = cbChecked
            TabOrder = 18
            OnClick = Ckb_ParamCurvaSelectAClick
            OnKeyUp = Ckb_ParamCurvaSelectAKeyUp
            LinkedControls = <>
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
          end
          object Ckb_ParamCurvaSelectE: TJvCheckBox
            Left = 14
            Top = 99
            Width = 13
            Height = 17
            TabStop = False
            BiDiMode = bdRightToLeft
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
            State = cbChecked
            TabOrder = 19
            OnClick = Ckb_ParamCurvaSelectAClick
            OnKeyUp = Ckb_ParamCurvaSelectAKeyUp
            LinkedControls = <>
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
          end
          object EdtParamCurvaALimite: TCurrencyEdit
            Left = 98
            Top = 39
            Width = 40
            Height = 21
            AutoSize = False
            DecimalPlaces = 0
            DisplayFormat = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 2
            ParentFont = False
            TabOrder = 0
          end
          object EdtParamCurvaBLimite: TCurrencyEdit
            Left = 490
            Top = 39
            Width = 40
            Height = 21
            AutoSize = False
            DecimalPlaces = 0
            DisplayFormat = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 2
            ParentFont = False
            TabOrder = 3
          end
          object EdtParamCurvaCLimite: TCurrencyEdit
            Left = 98
            Top = 68
            Width = 40
            Height = 21
            AutoSize = False
            DecimalPlaces = 0
            DisplayFormat = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 2
            ParentFont = False
            TabOrder = 6
          end
          object EdtParamCurvaDLimite: TCurrencyEdit
            Left = 490
            Top = 68
            Width = 40
            Height = 21
            AutoSize = False
            DecimalPlaces = 0
            DisplayFormat = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 2
            ParentFont = False
            TabOrder = 9
          end
          object EdtParamCurvaELimite: TCurrencyEdit
            Left = 98
            Top = 97
            Width = 40
            Height = 21
            AutoSize = False
            DecimalPlaces = 0
            DisplayFormat = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 2
            ParentFont = False
            TabOrder = 12
          end
          object EdtParamCurvaADiasEst: TCurrencyEdit
            Left = 199
            Top = 39
            Width = 48
            Height = 21
            AutoSize = False
            DecimalPlaces = 0
            DisplayFormat = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 3
            ParentFont = False
            TabOrder = 1
          end
          object EdtParamCurvaBDiasEst: TCurrencyEdit
            Left = 591
            Top = 39
            Width = 48
            Height = 21
            AutoSize = False
            DecimalPlaces = 0
            DisplayFormat = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 3
            ParentFont = False
            TabOrder = 4
          end
          object EdtParamCurvaCDiasEst: TCurrencyEdit
            Left = 199
            Top = 68
            Width = 48
            Height = 21
            AutoSize = False
            DecimalPlaces = 0
            DisplayFormat = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 3
            ParentFont = False
            TabOrder = 7
          end
          object EdtParamCurvaDDiasEst: TCurrencyEdit
            Left = 591
            Top = 68
            Width = 48
            Height = 21
            AutoSize = False
            DecimalPlaces = 0
            DisplayFormat = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 3
            ParentFont = False
            TabOrder = 10
          end
          object EdtParamCurvaEDiasEst: TCurrencyEdit
            Left = 199
            Top = 97
            Width = 48
            Height = 21
            AutoSize = False
            DecimalPlaces = 0
            DisplayFormat = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 3
            ParentFont = False
            TabOrder = 13
          end
          object EdtParamCurvaAEstMinino: TCurrencyEdit
            Left = 321
            Top = 39
            Width = 52
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
            TabOrder = 2
          end
          object EdtParamCurvaBEstMinino: TCurrencyEdit
            Left = 713
            Top = 39
            Width = 52
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
            TabOrder = 5
          end
          object EdtParamCurvaCEstMinino: TCurrencyEdit
            Left = 321
            Top = 68
            Width = 52
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
            TabOrder = 8
          end
          object EdtParamCurvaDEstMinino: TCurrencyEdit
            Left = 713
            Top = 68
            Width = 52
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
            TabOrder = 11
          end
          object EdtParamCurvaEEstMinino: TCurrencyEdit
            Left = 321
            Top = 97
            Width = 52
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
            TabOrder = 14
          end
          object Bt_ContEstParametrosSalvar: TJvXPButton
            Tag = 91
            Left = 406
            Top = 94
            Width = 141
            Height = 27
            Caption = 'Salvar Parametros'
            TabOrder = 20
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
            OnClick = Bt_ContEstParametrosSalvarClick
          end
          object Gb_ContEstTipoEstoques: TGroupBox
            Left = 796
            Top = 31
            Width = 161
            Height = 57
            Caption = ' Tipo de Estoque '
            TabOrder = 21
            object Cbx_ContEstEstTipo: TComboBox
              Left = 14
              Top = 22
              Width = 139
              Height = 22
              Style = csOwnerDrawFixed
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 16
              ItemIndex = 0
              ParentFont = False
              TabOrder = 0
              Text = 'Todos os Estoques '
              Items.Strings = (
                'Todos os Estoques '
                'Somento COM Estoque'
                'Somento SEM Estoque')
            end
          end
        end
      end
    end
    object Ts_ContEstSimulador: TTabSheet
      Tag = 9999
      Caption = 'Simulador de Estoques'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object Dbg_ContEstSimulador: TDBGridJul
        Left = 0
        Top = 55
        Width = 969
        Height = 456
        Align = alClient
        Color = 15004403
        DataSource = DMVirtual.DS_V_EstoqueLojas
        FixedColor = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = Dbg_ContEstSimuladorDrawColumnCell
        OnTitleClick = Dbg_ContEstSimuladorTitleClick
        CorComFoco = 15004403
        SairComEnter = False
        EditDataSetCheck = False
        ValorCampoCheck = 'SIM'
        ValorCampoUnCheck = 'NAO'
        ImageChecked.Data = {
          3E020000424D3E0200000000000036000000280000000D0000000D0000000100
          180000000000080200000000000000000000000000000000000080511C80511C
          80511C80511C80511C80511C80511C80511C80511C80511C80511C80511C8051
          1C0080511CF1F3F3F3F5F5F6F7F7F8F9F9F9FAFAFBFCFCFDFDFDFEFEFEFFFFFF
          FFFFFFFFFFFF80511C0080511CEFF1F1F1F3F3F3F5F5F6F7F7F8F9F9F9FAFAFB
          FCFCFDFDFDFEFEFEFFFFFFFFFFFF80511C0080511CECEFEFEFF1F1F1F3F3F3F5
          F521A121F8F9F9F9FAFAFBFCFCFDFDFDFEFEFEFFFFFF80511C0080511CE9ECEC
          ECEFEFEFF1F121A12121A12121A121F8F9F9F9FAFAFBFCFCFDFDFDFEFEFE8051
          1C0080511CE6EAEAE9ECEC21A12121A12121A12121A12121A121F8F9F9F9FAFA
          FBFCFCFDFDFD80511C0080511CE3E7E7E6EAEA21A12121A121EFF1F121A12121
          A12121A121F8F9F9F9FAFAFBFCFC80511C0080511CE1E5E5E3E7E721A121E9EC
          ECECEFEFEFF1F121A12121A12121A121F8F9F9F9FAFA80511C0080511CDFE3E3
          E1E5E5E3E7E7E6EAEAE9ECECECEFEFEFF1F121A12121A121F6F7F7F8F9F98051
          1C0080511CDDE2E2DFE3E3E1E5E5E3E7E7E6EAEAE9ECECECEFEFEFF1F121A121
          F3F5F5F6F7F780511C0080511CDDE2E2DDE2E2DFE3E3E1E5E5E3E7E7E6EAEAE9
          ECECECEFEFEFF1F1F1F3F3F3F5F580511C0080511CDDE2E2DDE2E2DDE2E2DFE3
          E3E1E5E5E3E7E7E6EAEAE9ECECECEFEFEFF1F1F1F3F380511C0080511C80511C
          80511C80511C80511C80511C80511C80511C80511C80511C80511C80511C8051
          1C00}
        ImageUnChecked.Data = {
          3E020000424D3E0200000000000036000000280000000D0000000D0000000100
          180000000000080200000000000000000000000000000000000080511C80511C
          80511C80511C80511C80511C80511C80511C80511C80511C80511C80511C8051
          1C0080511CEFF1F1F1F3F3F4F5F5F6F7F7F8F9F9FAFBFBFCFDFDFEFEFEFFFFFF
          FFFFFFFFFFFF80511C0080511CECEFEFEFF1F1F1F3F3F4F5F5F6F7F7F8F9F9FA
          FBFBFCFDFDFEFEFEFFFFFFFFFFFF80511C0080511CE9ECECECEFEFEFF1F1F1F3
          F3F4F5F5F6F7F7F8F9F9FAFBFBFCFDFDFEFEFEFFFFFF80511C0080511CE5E8E8
          E9ECECECEFEFEFF1F1F1F3F3F4F5F5F6F7F7F8F9F9FAFBFBFCFDFDFEFEFE8051
          1C0080511CE2E5E5E5E8E8E9ECECECEFEFEFF1F1F1F3F3F4F5F5F6F7F7F8F9F9
          FAFBFBFCFDFD80511C0080511CDEE2E2E2E5E5E5E8E8E9ECECECEFEFEFF1F1F1
          F3F3F4F5F5F6F7F7F8F9F9FAFBFB80511C0080511CDBE0E0DEE2E2E2E5E5E5E8
          E8E9ECECECEFEFEFF1F1F1F3F3F4F5F5F6F7F7F8F9F980511C0080511CD9DEDE
          DBE0E0DEE2E2E2E5E5E5E8E8E9ECECECEFEFEFF1F1F1F3F3F4F5F5F6F7F78051
          1C0080511CD7DCDCD9DEDEDBE0E0DEE2E2E2E5E5E5E8E8E9ECECECEFEFEFF1F1
          F1F3F3F4F5F580511C0080511CD7DCDCD7DCDCD9DEDEDBE0E0DEE2E2E2E5E5E5
          E8E8E9ECECECEFEFEFF1F1F1F3F380511C0080511CD7DCDCD7DCDCD7DCDCD9DE
          DEDBE0E0DEE2E2E2E5E5E5E8E8E9ECECECEFEFEFF1F180511C0080511C80511C
          80511C80511C80511C80511C80511C80511C80511C80511C80511C80511C8051
          1C00}
        Columns = <
          item
            Color = clYellow
            Expanded = False
            FieldName = 'COD_LOJA'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Width = 50
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'QTD_ESTOQUE'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taRightJustify
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_ESTOQUE'
            Title.Alignment = taRightJustify
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_VENDAS'
            Title.Alignment = taRightJustify
            Width = 100
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'EST_SIMULADO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taRightJustify
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_SIMULADO'
            Title.Alignment = taRightJustify
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PER_SIMULADOR'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taRightJustify
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DIA_UTEIS'
            Title.Alignment = taRightJustify
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTA_INICIO'
            Title.Alignment = taCenter
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTA_FIM'
            Title.Alignment = taCenter
            Width = 70
            Visible = True
          end>
      end
      object Pan_ContEstSimulador: TPanel
        Left = 0
        Top = 0
        Width = 969
        Height = 55
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object Lab_Lojas: TLabel
          Left = 12
          Top = 30
          Width = 26
          Height = 13
          Caption = 'OBS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Lab_Titulo: TLabel
          Left = 12
          Top = 8
          Width = 26
          Height = 13
          Caption = 'OBS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object Ts_ContEstProdutos: TTabSheet
      Caption = 'Simulador Produtos'
      ImageIndex = 2
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 969
        Height = 55
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label9: TLabel
          Left = 12
          Top = 30
          Width = 26
          Height = 13
          Caption = 'OBS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 12
          Top = 8
          Width = 26
          Height = 13
          Caption = 'OBS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Dbg_ContEstProdutos: TDBGridJul
        Left = 0
        Top = 55
        Width = 969
        Height = 456
        Align = alClient
        Color = 15004403
        DataSource = DMVirtual.DS_V_EstoqueLojas
        FixedColor = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        CorComFoco = 15004403
        SairComEnter = False
        EditDataSetCheck = False
        ValorCampoCheck = 'SIM'
        ValorCampoUnCheck = 'NAO'
        ImageChecked.Data = {
          3E020000424D3E0200000000000036000000280000000D0000000D0000000100
          180000000000080200000000000000000000000000000000000080511C80511C
          80511C80511C80511C80511C80511C80511C80511C80511C80511C80511C8051
          1C0080511CF1F3F3F3F5F5F6F7F7F8F9F9F9FAFAFBFCFCFDFDFDFEFEFEFFFFFF
          FFFFFFFFFFFF80511C0080511CEFF1F1F1F3F3F3F5F5F6F7F7F8F9F9F9FAFAFB
          FCFCFDFDFDFEFEFEFFFFFFFFFFFF80511C0080511CECEFEFEFF1F1F1F3F3F3F5
          F521A121F8F9F9F9FAFAFBFCFCFDFDFDFEFEFEFFFFFF80511C0080511CE9ECEC
          ECEFEFEFF1F121A12121A12121A121F8F9F9F9FAFAFBFCFCFDFDFDFEFEFE8051
          1C0080511CE6EAEAE9ECEC21A12121A12121A12121A12121A121F8F9F9F9FAFA
          FBFCFCFDFDFD80511C0080511CE3E7E7E6EAEA21A12121A121EFF1F121A12121
          A12121A121F8F9F9F9FAFAFBFCFC80511C0080511CE1E5E5E3E7E721A121E9EC
          ECECEFEFEFF1F121A12121A12121A121F8F9F9F9FAFA80511C0080511CDFE3E3
          E1E5E5E3E7E7E6EAEAE9ECECECEFEFEFF1F121A12121A121F6F7F7F8F9F98051
          1C0080511CDDE2E2DFE3E3E1E5E5E3E7E7E6EAEAE9ECECECEFEFEFF1F121A121
          F3F5F5F6F7F780511C0080511CDDE2E2DDE2E2DFE3E3E1E5E5E3E7E7E6EAEAE9
          ECECECEFEFEFF1F1F1F3F3F3F5F580511C0080511CDDE2E2DDE2E2DDE2E2DFE3
          E3E1E5E5E3E7E7E6EAEAE9ECECECEFEFEFF1F1F1F3F380511C0080511C80511C
          80511C80511C80511C80511C80511C80511C80511C80511C80511C80511C8051
          1C00}
        ImageUnChecked.Data = {
          3E020000424D3E0200000000000036000000280000000D0000000D0000000100
          180000000000080200000000000000000000000000000000000080511C80511C
          80511C80511C80511C80511C80511C80511C80511C80511C80511C80511C8051
          1C0080511CEFF1F1F1F3F3F4F5F5F6F7F7F8F9F9FAFBFBFCFDFDFEFEFEFFFFFF
          FFFFFFFFFFFF80511C0080511CECEFEFEFF1F1F1F3F3F4F5F5F6F7F7F8F9F9FA
          FBFBFCFDFDFEFEFEFFFFFFFFFFFF80511C0080511CE9ECECECEFEFEFF1F1F1F3
          F3F4F5F5F6F7F7F8F9F9FAFBFBFCFDFDFEFEFEFFFFFF80511C0080511CE5E8E8
          E9ECECECEFEFEFF1F1F1F3F3F4F5F5F6F7F7F8F9F9FAFBFBFCFDFDFEFEFE8051
          1C0080511CE2E5E5E5E8E8E9ECECECEFEFEFF1F1F1F3F3F4F5F5F6F7F7F8F9F9
          FAFBFBFCFDFD80511C0080511CDEE2E2E2E5E5E5E8E8E9ECECECEFEFEFF1F1F1
          F3F3F4F5F5F6F7F7F8F9F9FAFBFB80511C0080511CDBE0E0DEE2E2E2E5E5E5E8
          E8E9ECECECEFEFEFF1F1F1F3F3F4F5F5F6F7F7F8F9F980511C0080511CD9DEDE
          DBE0E0DEE2E2E2E5E5E5E8E8E9ECECECEFEFEFF1F1F1F3F3F4F5F5F6F7F78051
          1C0080511CD7DCDCD9DEDEDBE0E0DEE2E2E2E5E5E5E8E8E9ECECECEFEFEFF1F1
          F1F3F3F4F5F580511C0080511CD7DCDCD7DCDCD9DEDEDBE0E0DEE2E2E2E5E5E5
          E8E8E9ECECECEFEFEFF1F1F1F3F380511C0080511CD7DCDCD7DCDCD7DCDCD9DE
          DEDBE0E0DEE2E2E2E5E5E5E8E8E9ECECECEFEFEFF1F180511C0080511C80511C
          80511C80511C80511C80511C80511C80511C80511C80511C80511C80511C8051
          1C00}
        Columns = <
          item
            Color = clYellow
            Expanded = False
            FieldName = 'COD_LOJA'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Width = 50
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'QTD_ESTOQUE'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taRightJustify
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_ESTOQUE'
            Title.Alignment = taRightJustify
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_VENDAS'
            Title.Alignment = taRightJustify
            Width = 100
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'EST_SIMULADO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taRightJustify
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_SIMULADO'
            Title.Alignment = taRightJustify
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PER_SIMULADOR'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taRightJustify
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DIA_UTEIS'
            Title.Alignment = taRightJustify
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTA_INICIO'
            Title.Alignment = taCenter
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTA_FIM'
            Title.Alignment = taCenter
            Width = 70
            Visible = True
          end>
      end
    end
    object Ts_ContEstFornecedores: TTabSheet
      Caption = 'Simulador Fornecedores'
      ImageIndex = 3
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 969
        Height = 55
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label11: TLabel
          Left = 12
          Top = 30
          Width = 26
          Height = 13
          Caption = 'OBS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 12
          Top = 8
          Width = 26
          Height = 13
          Caption = 'OBS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Dbg_ContEstFornecedores: TDBGridJul
        Left = 0
        Top = 55
        Width = 969
        Height = 456
        Align = alClient
        Color = 15004403
        DataSource = DMVirtual.DS_V_EstoqueLojas
        FixedColor = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = Dbg_ContEstSimuladorDrawColumnCell
        OnTitleClick = Dbg_ContEstSimuladorTitleClick
        CorComFoco = 15004403
        SairComEnter = False
        EditDataSetCheck = False
        ValorCampoCheck = 'SIM'
        ValorCampoUnCheck = 'NAO'
        ImageChecked.Data = {
          3E020000424D3E0200000000000036000000280000000D0000000D0000000100
          180000000000080200000000000000000000000000000000000080511C80511C
          80511C80511C80511C80511C80511C80511C80511C80511C80511C80511C8051
          1C0080511CF1F3F3F3F5F5F6F7F7F8F9F9F9FAFAFBFCFCFDFDFDFEFEFEFFFFFF
          FFFFFFFFFFFF80511C0080511CEFF1F1F1F3F3F3F5F5F6F7F7F8F9F9F9FAFAFB
          FCFCFDFDFDFEFEFEFFFFFFFFFFFF80511C0080511CECEFEFEFF1F1F1F3F3F3F5
          F521A121F8F9F9F9FAFAFBFCFCFDFDFDFEFEFEFFFFFF80511C0080511CE9ECEC
          ECEFEFEFF1F121A12121A12121A121F8F9F9F9FAFAFBFCFCFDFDFDFEFEFE8051
          1C0080511CE6EAEAE9ECEC21A12121A12121A12121A12121A121F8F9F9F9FAFA
          FBFCFCFDFDFD80511C0080511CE3E7E7E6EAEA21A12121A121EFF1F121A12121
          A12121A121F8F9F9F9FAFAFBFCFC80511C0080511CE1E5E5E3E7E721A121E9EC
          ECECEFEFEFF1F121A12121A12121A121F8F9F9F9FAFA80511C0080511CDFE3E3
          E1E5E5E3E7E7E6EAEAE9ECECECEFEFEFF1F121A12121A121F6F7F7F8F9F98051
          1C0080511CDDE2E2DFE3E3E1E5E5E3E7E7E6EAEAE9ECECECEFEFEFF1F121A121
          F3F5F5F6F7F780511C0080511CDDE2E2DDE2E2DFE3E3E1E5E5E3E7E7E6EAEAE9
          ECECECEFEFEFF1F1F1F3F3F3F5F580511C0080511CDDE2E2DDE2E2DDE2E2DFE3
          E3E1E5E5E3E7E7E6EAEAE9ECECECEFEFEFF1F1F1F3F380511C0080511C80511C
          80511C80511C80511C80511C80511C80511C80511C80511C80511C80511C8051
          1C00}
        ImageUnChecked.Data = {
          3E020000424D3E0200000000000036000000280000000D0000000D0000000100
          180000000000080200000000000000000000000000000000000080511C80511C
          80511C80511C80511C80511C80511C80511C80511C80511C80511C80511C8051
          1C0080511CEFF1F1F1F3F3F4F5F5F6F7F7F8F9F9FAFBFBFCFDFDFEFEFEFFFFFF
          FFFFFFFFFFFF80511C0080511CECEFEFEFF1F1F1F3F3F4F5F5F6F7F7F8F9F9FA
          FBFBFCFDFDFEFEFEFFFFFFFFFFFF80511C0080511CE9ECECECEFEFEFF1F1F1F3
          F3F4F5F5F6F7F7F8F9F9FAFBFBFCFDFDFEFEFEFFFFFF80511C0080511CE5E8E8
          E9ECECECEFEFEFF1F1F1F3F3F4F5F5F6F7F7F8F9F9FAFBFBFCFDFDFEFEFE8051
          1C0080511CE2E5E5E5E8E8E9ECECECEFEFEFF1F1F1F3F3F4F5F5F6F7F7F8F9F9
          FAFBFBFCFDFD80511C0080511CDEE2E2E2E5E5E5E8E8E9ECECECEFEFEFF1F1F1
          F3F3F4F5F5F6F7F7F8F9F9FAFBFB80511C0080511CDBE0E0DEE2E2E2E5E5E5E8
          E8E9ECECECEFEFEFF1F1F1F3F3F4F5F5F6F7F7F8F9F980511C0080511CD9DEDE
          DBE0E0DEE2E2E2E5E5E5E8E8E9ECECECEFEFEFF1F1F1F3F3F4F5F5F6F7F78051
          1C0080511CD7DCDCD9DEDEDBE0E0DEE2E2E2E5E5E5E8E8E9ECECECEFEFEFF1F1
          F1F3F3F4F5F580511C0080511CD7DCDCD7DCDCD9DEDEDBE0E0DEE2E2E2E5E5E5
          E8E8E9ECECECEFEFEFF1F1F1F3F380511C0080511CD7DCDCD7DCDCD7DCDCD9DE
          DEDBE0E0DEE2E2E2E5E5E5E8E8E9ECECECEFEFEFF1F180511C0080511C80511C
          80511C80511C80511C80511C80511C80511C80511C80511C80511C80511C8051
          1C00}
        Columns = <
          item
            Color = clYellow
            Expanded = False
            FieldName = 'COD_LOJA'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Width = 50
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'QTD_ESTOQUE'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taRightJustify
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_ESTOQUE'
            Title.Alignment = taRightJustify
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_VENDAS'
            Title.Alignment = taRightJustify
            Width = 100
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'EST_SIMULADO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taRightJustify
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_SIMULADO'
            Title.Alignment = taRightJustify
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PER_SIMULADOR'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taRightJustify
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DIA_UTEIS'
            Title.Alignment = taRightJustify
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTA_INICIO'
            Title.Alignment = taCenter
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTA_FIM'
            Title.Alignment = taCenter
            Width = 70
            Visible = True
          end>
      end
    end
  end
  object OdirPanApres: TPanel
    Left = 886
    Top = 0
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
    FormCaption = 'CONTROLE DE ESTOQUES'
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
