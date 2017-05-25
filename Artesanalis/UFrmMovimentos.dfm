object FrmMovimentos: TFrmMovimentos
  Left = 248
  Top = 104
  Width = 746
  Height = 604
  AutoSize = True
  Caption = 'MOVIMENTOS'
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
    Width = 730
    Height = 566
    Align = alClient
    Caption = ' MAT'#201'RIA-PRIMA - Movimenta'#231#245'es'
    Color = 16770250
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object Pan_Docto: TPanel
      Left = 2
      Top = 15
      Width = 726
      Height = 120
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
      object Gb_VlrTotal: TGroupBox
        Left = 592
        Top = 61
        Width = 110
        Height = 51
        Caption = ' Valor Total  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        object EdtVlrTotal: TCurrencyEdit
          Left = 13
          Top = 22
          Width = 84
          Height = 19
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
      object Gb_SerieDocto: TGroupBox
        Left = 267
        Top = 61
        Width = 75
        Height = 51
        Caption = ' S'#233'rie '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object EdtSerieDocto: TEdit
          Left = 13
          Top = 22
          Width = 50
          Height = 19
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object Gb_VlrProdutos: TGroupBox
        Left = 480
        Top = 61
        Width = 110
        Height = 51
        Caption = ' Valor Produtos '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        object EdtVlrProdutos: TCurrencyEdit
          Left = 13
          Top = 22
          Width = 84
          Height = 19
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
      object Gb_NumDocto: TGroupBox
        Left = 15
        Top = 61
        Width = 86
        Height = 51
        Caption = ' N'#186' Docto '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object EdtNumDocto: TCurrencyEdit
          Left = 13
          Top = 22
          Width = 61
          Height = 19
          AutoSize = False
          DecimalPlaces = 0
          DisplayFormat = '0,'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnExit = EdtNumDoctoExit
        end
      end
      object Gb_DtaDocto: TGroupBox
        Left = 344
        Top = 61
        Width = 134
        Height = 51
        Caption = ' Data Emiss'#227'o '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object DtEdt_DtaDocto: TcxDateEdit
          Left = 13
          Top = 19
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          StyleFocused.BorderStyle = ebsOffice11
          TabOrder = 0
          Width = 106
        end
      end
      object Gb_Pessoa: TGroupBox
        Left = 48
        Top = 7
        Width = 634
        Height = 51
        Caption = ' Cliente / Fornecedor '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object EdtDesPessoa: TEdit
          Left = 101
          Top = 22
          Width = 492
          Height = 19
          TabStop = False
          CharCase = ecUpperCase
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 50
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object EdtCodPessoa: TCurrencyEdit
          Left = 12
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
          OnChange = EdtCodPessoaChange
          OnExit = EdtCodPessoaExit
        end
        object Bt_BuscaPessoa: TJvXPButton
          Tag = 92
          Left = 71
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
          OnClick = Bt_BuscaPessoaClick
        end
        object Bt_NovaPessoa: TJvXPButton
          Tag = 92
          Left = 598
          Top = 19
          Width = 24
          Height = 26
          TabOrder = 3
          TabStop = False
          Glyph.Data = {
            07544269746D6170EE000000424DEE0000000000000076000000280000001000
            00000F000000010004000000000078000000130B0000130B0000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00888888800000000088888880FFFFFFF088888880F00F00F088888880FFFF
            FFF088888880F00F00F088888880FFFFFFF08888888444444444880000844444
            4444880BB08888888888000BB000888888880BBBBBB0888888880BBBBBB08888
            8888000BB00088888888880BB088888888888800008888888888}
          ShowFocusRect = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_NovaPessoaClick
        end
      end
      object EdtNumSeqDocto: TCurrencyEdit
        Left = 13
        Top = 22
        Width = 17
        Height = 19
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0,'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        Visible = False
      end
      object GroupBox1: TGroupBox
        Left = 103
        Top = 61
        Width = 162
        Height = 51
        Caption = ' Tipo do Documento '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object CBx_TipoDocto: TComboBox
          Left = 8
          Top = 20
          Width = 143
          Height = 22
          Style = csOwnerDrawFixed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 16
          ParentFont = False
          TabOrder = 0
          Items.Strings = (
            'Documento de Entrada - E'
            'Devolu'#231#227'o  de Entrada - DE'
            'Bonifica'#231#227'o de Entrada - BE')
        end
      end
      object Button1: TButton
        Left = 16
        Top = 48
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 8
        OnClick = Button1Click
      end
    end
    object Pan_Solicitacoes: TPanel
      Left = 2
      Top = 534
      Width = 726
      Height = 30
      Align = alBottom
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = 16770250
      TabOrder = 3
      object Bt_Fechar: TJvXPButton
        Tag = 99
        Left = 626
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
      object Bt_Salvar: TJvXPButton
        Tag = 99
        Left = 1
        Top = 1
        Width = 105
        Height = 28
        Caption = 'Salvar'
        TabOrder = 1
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
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bt_Abandonar: TJvXPButton
        Tag = 99
        Left = 106
        Top = 1
        Width = 105
        Height = 28
        Caption = 'Abandonar'
        TabOrder = 2
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
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Bt_AbandonarClick
      end
      object Bt_Excluir: TJvXPButton
        Tag = 99
        Left = 211
        Top = 1
        Width = 105
        Height = 28
        Caption = 'Excluir'
        TabOrder = 3
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
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Rb_Produtos: TRadioGroup
      Left = 2
      Top = 178
      Width = 726
      Height = 336
      Align = alClient
      Caption = ' Produtos '
      TabOrder = 2
    end
    object Pan_Produto: TPanel
      Left = 2
      Top = 135
      Width = 726
      Height = 43
      Align = alTop
      BevelInner = bvLowered
      ParentColor = True
      TabOrder = 1
      object Label1: TLabel
        Left = 6
        Top = 6
        Width = 23
        Height = 13
        Caption = 'Seq'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 41
        Top = 6
        Width = 40
        Height = 13
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 88
        Top = 6
        Width = 124
        Height = 13
        Caption = 'Descri'#231#227'o do Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 404
        Top = 6
        Width = 66
        Height = 13
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 486
        Top = 6
        Width = 78
        Height = 13
        Caption = 'Valor Unit'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 590
        Top = 6
        Width = 63
        Height = 13
        Caption = 'Valor Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdtSeqProduto: TCurrencyEdit
        Left = 4
        Top = 20
        Width = 27
        Height = 19
        AutoSize = False
        Color = clMoneyGreen
        DecimalPlaces = 0
        DisplayFormat = '0,'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object EdtCodProduto: TCurrencyEdit
        Left = 34
        Top = 20
        Width = 49
        Height = 19
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0,'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnEnter = EdtCodProdutoEnter
      end
      object EdtDesProduto: TEdit
        Left = 85
        Top = 20
        Width = 298
        Height = 21
        CharCase = ecUpperCase
        Color = clMoneyGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 50
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object EdtQtdProduto: TCurrencyEdit
        Left = 385
        Top = 20
        Width = 87
        Height = 19
        AutoSize = False
        DecimalPlaces = 4
        DisplayFormat = ',0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object EdtVltUnitProduto: TCurrencyEdit
        Left = 474
        Top = 20
        Width = 89
        Height = 19
        AutoSize = False
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object EdtVlrTotalProduto: TCurrencyEdit
        Left = 565
        Top = 20
        Width = 89
        Height = 19
        AutoSize = False
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object Bt_IncluiProduto: TJvXPButton
        Tag = 92
        Left = 660
        Top = 14
        Width = 29
        Height = 26
        Caption = 'Inc'
        TabOrder = 6
        ShowFocusRect = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bt_ExcluiProduto: TJvXPButton
        Tag = 92
        Left = 692
        Top = 14
        Width = 29
        Height = 26
        Caption = 'Exc'
        TabOrder = 7
        TabStop = False
        ShowFocusRect = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Dbg_Produtos: TDBGrid
      Left = 2
      Top = 178
      Width = 726
      Height = 336
      Align = alClient
      DataSource = DMArtesanalis.DS_V_DoctoItens
      FixedColor = 15000804
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnEnter = Dbg_ProdutosEnter
      OnExit = Dbg_ProdutosExit
      Columns = <
        item
          Color = clMoneyGreen
          Expanded = False
          FieldName = 'NUM_SEQ'
          Title.Alignment = taRightJustify
          Title.Caption = 'Seq'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_PRODUTO'
          Title.Alignment = taRightJustify
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DES_PRODUTO'
          Title.Caption = 'Descri'#231#227'o do Produto'
          Width = 298
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTD_MOVTO'
          Title.Alignment = taRightJustify
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_UNITATIO'
          Title.Alignment = taRightJustify
          Title.Caption = '$ Unit'#225'rio'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_TOTAL'
          Title.Alignment = taRightJustify
          Width = 89
          Visible = True
        end>
    end
    object OdirPanApres: TPanel
      Left = 568
      Top = 458
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
      TabOrder = 4
      Visible = False
    end
    object StB_Movtos: TdxStatusBar
      Left = 2
      Top = 514
      Width = 726
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clSilver
          BiDiMode = bdRightToLeft
          Fixed = False
          ParentBiDiMode = False
          Text = '<Duplo Click no Grid> Selecina Produto'
          Width = 200
        end>
      PaintStyle = stpsOffice11
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
  end
  object ACBrValidador: TACBrValidador
    IgnorarChar = './-'
    Left = 264
    Top = 344
  end
end
