object FrmRelatorios: TFrmRelatorios
  Left = 226
  Top = 111
  Width = 967
  Height = 609
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = ' RELAT'#211'RIOS '
  Color = 16770250
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
  object PC_Relatorios: TPageControl
    Left = 160
    Top = 0
    Width = 791
    Height = 533
    ActivePage = Ts_PedidosVendas
    Align = alClient
    TabOrder = 0
    OnChange = PC_RelatoriosChange
    object Ts_MateriaPrima: TTabSheet
      Tag = 9999
      Caption = ' Materia-Prima '
      Highlighted = True
      object Label1: TLabel
        Left = 96
        Top = 152
        Width = 564
        Height = 96
        Caption = 'Relat'#243'rios de Mat'#233'ria-Primas '#13#10'em Desenvolvimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -40
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Ts_Produtos: TTabSheet
      Tag = 9999
      Caption = ' Produtos '
      Highlighted = True
      ImageIndex = 1
      object Label2: TLabel
        Left = 136
        Top = 152
        Width = 437
        Height = 96
        Caption = 'Relat'#243'rios de Produtos'#13#10'em Desenvolvimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -40
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Ts_PessoasEntidades: TTabSheet
      Tag = 9999
      Caption = ' Pessoas/Entidades '
      Highlighted = True
      ImageIndex = 2
      object Label3: TLabel
        Left = 72
        Top = 152
        Width = 651
        Height = 96
        Caption = 'Relat'#243'rios de Pessoas/Entidades '#13#10'em Desenvolvimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -40
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Ts_Despesas: TTabSheet
      Tag = 9999
      Caption = ' Despesas '
      Highlighted = True
      ImageIndex = 3
      object Label4: TLabel
        Left = 128
        Top = 152
        Width = 474
        Height = 96
        Caption = 'Relat'#243'rios de Despesas '#13#10'em Desenvolvimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -40
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Ts_LancamentoNotas: TTabSheet
      Tag = 9999
      Caption = ' Lan'#231'amento de Notas '
      Highlighted = True
      ImageIndex = 4
      object Label5: TLabel
        Left = 40
        Top = 152
        Width = 682
        Height = 96
        Caption = 'Relat'#243'rios de Lan'#231'amento de Notas'#13#10'em Desenvolvimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -40
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Ts_PedidosVendas: TTabSheet
      Caption = ' Pedidos de Vendas'
      Highlighted = True
      ImageIndex = 5
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 783
        Height = 57
        Align = alTop
        ParentColor = True
        TabOrder = 0
        object Gb_Pessoa: TGroupBox
          Left = 1
          Top = 1
          Width = 538
          Height = 55
          Align = alClient
          Caption = ' Cliente '
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          object EdtDesPessoa: TEdit
            Left = 98
            Top = 22
            Width = 434
            Height = 19
            TabStop = False
            CharCase = ecUpperCase
            Color = clMoneyGreen
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 50
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object EdtCodPessoa: TCurrencyEdit
            Left = 9
            Top = 22
            Width = 53
            Height = 19
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
          object Bt_BuscaPessoa: TJvXPButton
            Tag = 92
            Left = 68
            Top = 19
            Width = 24
            Height = 26
            TabOrder = 2
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
          end
        end
        object Gb_Periodo: TGroupBox
          Left = 539
          Top = 1
          Width = 243
          Height = 55
          Align = alRight
          Caption = ' Per'#237'odo de Apropria'#231#227'o '
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          object Label83: TLabel
            Left = 117
            Top = 26
            Width = 8
            Height = 13
            Caption = 'a'
          end
          object DtaEdtInicio: TcxDateEdit
            Left = 9
            Top = 20
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            StyleFocused.BorderStyle = ebsOffice11
            StyleFocused.Color = clMoneyGreen
            TabOrder = 0
            Width = 106
          end
          object DtaEdtFim: TcxDateEdit
            Left = 129
            Top = 20
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            StyleFocused.BorderStyle = ebsOffice11
            StyleFocused.Color = clMoneyGreen
            TabOrder = 1
            Width = 106
          end
        end
      end
      object Dbg_Pedidos: TDBGrid
        Left = 0
        Top = 57
        Width = 783
        Height = 448
        Align = alClient
        FixedColor = 15000804
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
      end
    end
  end
  object Pan_Baixo: TPanel
    Left = 0
    Top = 533
    Width = 951
    Height = 38
    Align = alBottom
    BevelInner = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    TabOrder = 1
    object Pan_Opcoes: TPanel
      Left = 2
      Top = 2
      Width = 157
      Height = 34
      Align = alLeft
      BevelInner = bvLowered
      BevelWidth = 2
      Caption = 'Op'#231#245'es'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object Bt_Retornar: TJvXPButton
      Tag = 90
      Left = 847
      Top = 2
      Width = 102
      Height = 34
      Caption = 'Voltar'
      TabOrder = 1
      TabStop = False
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
      Spacing = 10
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_RetornarClick
    end
    object Bt_Salvar: TJvXPButton
      Tag = 4
      Left = 300
      Top = 2
      Width = 146
      Height = 34
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
    end
    object Bt_Buscar: TJvXPButton
      Tag = 4
      Left = 159
      Top = 2
      Width = 141
      Height = 34
      Caption = 'Busca Informa'#231#227'o'
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
      Spacing = 5
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bt_Imprimir: TJvXPButton
      Tag = 4
      Left = 446
      Top = 2
      Width = 146
      Height = 34
      Caption = 'Imprimir '
      TabOrder = 4
      Glyph.Data = {
        07544269746D617086050000424D860500000000000036000000280000001600
        000014000000010018000000000050050000C40E0000C40E0000000000000000
        0000BFBFBFBFBFBFBFBFBFBFBFBF000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000BFBFBFBFBFBFBFBF
        BFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBF0000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000BFBFBFBF
        BFBFBFBFBFBFBFBF0000BFBFBFBFBFBF000000000000BFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBF
        000000BFBFBFBFBFBFBFBFBF0000BFBFBF000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000BFBFBF000000000000BFBFBF0000BFBFBF0000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000BFBFBF000000000000BFBFBF0000BFBFBF000000BFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00FFFF00FFFF00FFFF00FFFF
        BFBFBFBFBFBFBFBFBF000000000000000000000000BFBFBF0000BFBFBF000000
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F7F7F7F7F
        7F7F7F7FBFBFBFBFBFBFBFBFBF000000BFBFBF000000000000BFBFBF0000BFBF
        BF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F
        7F7F7F7F7F7F7F7FBFBFBFBFBFBFBFBFBF000000BFBFBF000000000000BFBFBF
        0000BFBFBF000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000BFBFBFBFBFBFBFBF
        BF0000000000BFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBF000000BF
        BFBFBFBFBF0000000000BFBFBFBFBFBF00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000BFBFBF000000
        BFBFBF0000000000000000000000BFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        00BFBFBF000000BFBFBFBFBFBF0000000000BFBFBFBFBFBFBFBFBFBFBFBF0000
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF000000BFBFBF000000BFBFBFBFBFBF0000000000BFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBF000000FFFFFF000000000000000000000000000000000000000000
        FFFFFFFFFFFF000000000000000000000000000000BFBFBF0000BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBF0000BFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBF
        0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFF000000
        000000000000000000000000000000000000FFFFFF000000BFBFBFBFBFBFBFBF
        BFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BF
        BFBFBFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        000000BFBFBFBFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBF0000000000000000000000000000000000000000000000000000000000
        00000000000000BFBFBFBFBFBFBFBFBF0000}
      ShowFocusRect = True
      Spacing = 10
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Pan_OutLook: TPanel
    Left = 0
    Top = 0
    Width = 160
    Height = 533
    Align = alLeft
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BorderStyle = bsSingle
    Color = 16776176
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object OutLook: TJvOutlookBar
      Left = 2
      Top = 2
      Width = 154
      Height = 159
      Align = alTop
      Pages = <
        item
          Buttons = <
            item
              Caption = '&Mat'#233'rias-Primas'
              ImageIndex = 0
              Tag = 0
              AutoToggle = False
              OnClick = OutLookPages0Buttons0Click
            end
            item
              Caption = '&Produtos'
              ImageIndex = 0
              Tag = 0
              AutoToggle = False
              OnClick = OutLookPages0Buttons0Click
            end
            item
              Caption = '&Pessoas/Entidades'
              ImageIndex = 0
              Tag = 0
              AutoToggle = False
              OnClick = OutLookPages0Buttons0Click
            end
            item
              Caption = '&Despesas'
              ImageIndex = 0
              Tag = 0
              AutoToggle = False
              OnClick = OutLookPages0Buttons0Click
            end>
          ButtonSize = olbsLarge
          Caption = '&CADASTROS'
          Color = 16770250
          DownFont.Charset = DEFAULT_CHARSET
          DownFont.Color = clWindowText
          DownFont.Height = -11
          DownFont.Name = 'MS Sans Serif'
          DownFont.Style = []
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4194368
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = True
          TopButtonIndex = 0
        end
        item
          Buttons = <
            item
              Caption = '&Lan'#231'amento de Notas'
              ImageIndex = 0
              Tag = 0
              AutoToggle = False
              OnClick = OutLookPages0Buttons0Click
            end>
          ButtonSize = olbsLarge
          Caption = '&ENTRADAS/SA'#205'DAS'
          Color = 16770250
          DownFont.Charset = DEFAULT_CHARSET
          DownFont.Color = clWindowText
          DownFont.Height = -11
          DownFont.Name = 'MS Sans Serif'
          DownFont.Style = []
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4194368
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = True
          TopButtonIndex = 0
        end
        item
          Buttons = <
            item
              Caption = '&Pedidos de Vendas'
              ImageIndex = 0
              Tag = 0
              AutoToggle = False
              OnClick = OutLookPages0Buttons0Click
            end>
          ButtonSize = olbsLarge
          Caption = '&VENDAS/PEDIDOS'
          Color = 16770250
          DownFont.Charset = DEFAULT_CHARSET
          DownFont.Color = clWindowText
          DownFont.Height = -11
          DownFont.Name = 'MS Sans Serif'
          DownFont.Style = []
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4194368
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = True
          TopButtonIndex = 0
        end>
      OnButtonClick = OutLookButtonClick
      Color = 16770250
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = OutLookClick
    end
  end
end
