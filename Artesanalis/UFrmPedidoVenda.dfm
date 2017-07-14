object FrmPedidoVenda: TFrmPedidoVenda
  Left = 235
  Top = 110
  Width = 867
  Height = 604
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'PEDIDO DE VENDA'
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
    Width = 851
    Height = 566
    Align = alClient
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
      Width = 847
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
        Left = 530
        Top = 62
        Width = 110
        Height = 51
        Caption = ' $ Total  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
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
          OnEnter = EdtVlrProdutosEnter
          OnExit = EdtVlrProdutosEnter
        end
      end
      object Gb_VlrDescontos: TGroupBox
        Left = 418
        Top = 62
        Width = 110
        Height = 51
        Caption = ' $ Descontos '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object EdtVlrDescontos: TCurrencyEdit
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
          OnEnter = EdtVlrProdutosEnter
          OnExit = EdtVlrProdutosEnter
        end
      end
      object Gb_NumDocto: TGroupBox
        Left = 82
        Top = 62
        Width = 86
        Height = 51
        Caption = ' N'#186' Pedido '
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
        Left = 170
        Top = 62
        Width = 134
        Height = 51
        Caption = ' Data de Emiss'#227'o '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
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
        Left = 137
        Top = 7
        Width = 575
        Height = 51
        Caption = ' Cliente '
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
          Width = 431
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
          OnKeyDown = EdtCodPessoaKeyDown
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
          Left = 539
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
        Left = 753
        Top = 6
        Width = 83
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
      object Dbe_VlrTotalCalculado: TDBEdit
        Left = 753
        Top = 24
        Width = 83
        Height = 19
        DataField = 'Vlr_TotalCalculado'
        DataSource = DMArtesanalis.DS_V_DoctoItens
        TabOrder = 8
        Visible = False
        OnChange = Dbe_VlrTotalCalculadoChange
      end
      object Gb_VlrTotalCalculado: TGroupBox
        Left = 642
        Top = 62
        Width = 124
        Height = 51
        Caption = ' $ Total Calculado '
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        object EdtVlrTotalCalculado: TCurrencyEdit
          Left = 14
          Top = 21
          Width = 99
          Height = 19
          TabStop = False
          AutoSize = False
          Color = clMoneyGreen
          DisplayFormat = ',0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
      object Gb_VlrProdutos: TGroupBox
        Left = 306
        Top = 62
        Width = 110
        Height = 51
        Caption = ' $ Produtos '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
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
          OnEnter = EdtVlrProdutosEnter
          OnExit = EdtVlrProdutosEnter
        end
      end
      object Dbe_VlrTotalDesconto: TDBEdit
        Left = 753
        Top = 42
        Width = 83
        Height = 19
        DataField = 'Vlr_TotalDesconto'
        DataSource = DMArtesanalis.DS_V_DoctoItens
        TabOrder = 9
        Visible = False
      end
    end
    object Pan_Solicitacoes: TPanel
      Left = 2
      Top = 534
      Width = 847
      Height = 30
      Align = alBottom
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = 16770250
      TabOrder = 3
      object Bt_Fechar: TJvXPButton
        Tag = 99
        Left = 747
        Top = 1
        Width = 99
        Height = 28
        Caption = 'Fechar'
        TabOrder = 2
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
        TabOrder = 0
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
        OnClick = Bt_SalvarClick
      end
      object Bt_Abandonar: TJvXPButton
        Tag = 99
        Left = 106
        Top = 1
        Width = 105
        Height = 28
        Caption = 'Abandonar'
        TabOrder = 1
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
          07544269746D617042010000424D420100000000000076000000280000001100
          0000110000000100040000000000CC000000CE0E0000C40E0000100000000000
          000000000000000080000080000000808000800000008000800080800000C0C0
          C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF0077777777777777777000000077788777777777777000000077D55877777D
          87777000000077D5558777D558777000000077D555587D55558770000000777D
          555585555587700000007777D555555558777000000077777D55555587777000
          0000777777555558777770000000777777D5555877777000000077777D555558
          7777700000007777D5558555877770000000777D55587D55587770000000777D
          558777D55587700000007777D577777D555770000000777777777777D5D77000
          0000777777777777777770000000}
        ShowFocusRect = True
        Spacing = 5
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Bt_ExcluirClick
      end
    end
    object Rb_Produtos: TRadioGroup
      Left = 2
      Top = 178
      Width = 847
      Height = 336
      Align = alClient
      Caption = ' Produtos '
      TabOrder = 2
    end
    object Pan_Produto: TPanel
      Left = 2
      Top = 135
      Width = 847
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
        Left = 40
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
        Left = 406
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
        Left = 506
        Top = 6
        Width = 56
        Height = 13
        Caption = '$ Unit'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 702
        Top = 6
        Width = 41
        Height = 13
        Caption = '$ Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 587
        Top = 6
        Width = 66
        Height = 13
        Caption = '$ Desconto'
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
        OnExit = EdtCodProdutoExit
        OnKeyDown = EdtCodProdutoKeyDown
      end
      object EdtDesProduto: TEdit
        Left = 85
        Top = 20
        Width = 298
        Height = 21
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
        OnEnter = EdtQtdProdutoEnter
        OnExit = EdtQtdProdutoEnter
      end
      object EdtVlrUnitProduto: TCurrencyEdit
        Left = 473
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
        OnEnter = EdtQtdProdutoEnter
        OnExit = EdtQtdProdutoEnter
      end
      object EdtVlrTotalProduto: TCurrencyEdit
        Left = 654
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
        TabOrder = 6
        OnEnter = EdtVlrTotalProdutoEnter
      end
      object Bt_IncluiProduto: TJvXPButton
        Tag = 92
        Left = 748
        Top = 14
        Width = 29
        Height = 26
        Caption = 'Inc'
        TabOrder = 7
        ShowFocusRect = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Bt_IncluiProdutoClick
        OnEnter = Bt_IncluiProdutoEnter
      end
      object Bt_ExcluiProduto: TJvXPButton
        Tag = 92
        Left = 779
        Top = 14
        Width = 29
        Height = 26
        Caption = 'Exc'
        TabOrder = 8
        TabStop = False
        ShowFocusRect = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Bt_ExcluiProdutoClick
        OnEnter = Bt_ExcluiProdutoEnter
      end
      object Bt_AbandonarProduto: TJvXPButton
        Tag = 92
        Left = 810
        Top = 14
        Width = 29
        Height = 26
        TabOrder = 9
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Bt_AbandonarProdutoClick
        OnEnter = Bt_AbandonarProdutoEnter
      end
      object EdtVlrDescProduto: TCurrencyEdit
        Left = 564
        Top = 20
        Width = 89
        Height = 19
        TabStop = False
        AutoSize = False
        Color = clMoneyGreen
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        OnEnter = EdtQtdProdutoEnter
        OnExit = EdtVlrDescProdutoExit
      end
    end
    object Dbg_Produtos: TDBGrid
      Left = 2
      Top = 178
      Width = 847
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
      OnDblClick = Dbg_ProdutosDblClick
      OnEnter = Dbg_ProdutosEnter
      OnExit = Dbg_ProdutosExit
      OnKeyDown = Dbg_ProdutosKeyDown
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
          FieldName = 'VLR_UNITARIO'
          Title.Alignment = taRightJustify
          Title.Caption = '$ Unit'#225'rio'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_DESCONTO'
          Title.Alignment = taRightJustify
          Title.Caption = '$ Desconto'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_TOTAL'
          Title.Alignment = taRightJustify
          Width = 90
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
      Width = 847
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taRightJustify
          PanelStyle.Color = clBtnFace
          PanelStyle.Font.Charset = DEFAULT_CHARSET
          PanelStyle.Font.Color = clBlue
          PanelStyle.Font.Height = -11
          PanelStyle.Font.Name = 'MS Sans Serif'
          PanelStyle.Font.Style = [fsBold]
          PanelStyle.ParentFont = False
          Bevel = dxpbNone
          Fixed = False
          Text = 'No Grid ==>>'
          Width = 20
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clBtnFace
          Fixed = False
          Text = '<Duplo Click> Selecina Produto'
          Width = 50
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Fixed = False
          Text = '<F4> Localiza Produto'
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Fixed = False
          Text = '<F6> Ver Produ'#231#227'o do Produto Selecionado'
          Width = 60
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
