object FrmSolicitacoes: TFrmSolicitacoes
  Left = 347
  Top = 126
  Width = 716
  Height = 502
  BorderIcons = []
  Caption = 'Solicita'#231#245'es'
  Color = 16770250
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PC_Principal: TPageControl
    Left = 0
    Top = 0
    Width = 700
    Height = 464
    ActivePage = Ts_CP_Pagamento
    Align = alClient
    TabOrder = 0
    OnChange = PC_PrincipalChange
    object Ts_CP_Pagamento: TTabSheet
      Caption = ' Pagamento '
      Highlighted = True
      object Pan_Principal: TPanel
        Left = 0
        Top = 399
        Width = 692
        Height = 37
        Align = alBottom
        Color = 16770250
        TabOrder = 2
        object Bt_OK: TJvXPButton
          Tag = 99
          Left = 1
          Top = 1
          Width = 105
          Height = 35
          Caption = 'OK'
          TabOrder = 0
          Glyph.Data = {
            07544269746D61706A030000424D6A0300000000000076000000280000001C00
            00001B0000000100080000000000F40200000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00080808080808080808080808080808080808080808080808080808080807
            0707070707070707070707070707070708080808080808080808080000000000
            0000000000000000000000070707080808080808080808000808080808080808
            0808080808080007070707070808080808080800080F0F0F0700000F0F0F0F0F
            0F080007070707070707080808080800080F0F0F000E0E000F0F0F0F0F080007
            080808080808080808080800080F0F0F000E0E0E000F0F0F0F08000708080808
            0808080808080800080F0F0F000E0E0E0E000F0F0F0800070808080808080808
            08080800080F0F0F000E0E0E0E0E000F0F080007070708080808080808080800
            080F0F0F000E0E0E0E0E0E000F080007070707070808080808080800080F0F0F
            000E0E00000E0E0E00080007080707070707080808080800080F0F0F000E0E00
            0F000E0E0E000707080808070707070708080800080F0F0F000E0E000F0F000E
            0E0E0007080808080807070707070800080F0F0F000E0E000F0F0F000E0E0E00
            080808080808080707070800080F0F0F000E0E000F0F0F0F000E0E0E00080808
            0808080808080800080F0F0F0000000F0F0F0F0F0F000E0E0E00080808080808
            080808000808080808080808080808080808000E0E0E00080808080808080800
            000000000000000000000000000007000E0E0E00080808080808080808080808
            080808080808080808080808000E0E0E00080808080808080808080808080808
            080808080808080808000E0E0E00080808080808080808080808080808080808
            080808080808000E0E0E00080808080808080808080808080808080808080808
            080808000E0E0E00080808080808080808080808080808080808080808080808
            000E0E0E00080808080808080808080808080808080808080808080808000E0E
            0008080808080808080808080808080808080808080808080808000E00080808
            0808080808080808080808080808080808080808080808000008080808080808
            08080808080808080808080808080808080808080808}
          ShowFocusRect = True
          Spacing = 10
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_OKClick
        end
        object Bt_Retornar: TJvXPButton
          Tag = 99
          Left = 592
          Top = 1
          Width = 99
          Height = 35
          Caption = 'Fechar'
          TabOrder = 1
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
          OnClick = Bt_RetornarClick
        end
      end
      object Gb_DtaPagto: TGroupBox
        Left = 42
        Top = 10
        Width = 128
        Height = 51
        Caption = ' Data Pagamento '
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        object DtEdt_DtaPagto: TcxDateEdit
          Left = 12
          Top = 20
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
      object Gb_VlrPagto: TGroupBox
        Left = 179
        Top = 10
        Width = 123
        Height = 51
        Caption = ' Valor Pagamento '
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        object EdtVlrPagto: TCurrencyEdit
          Left = 12
          Top = 23
          Width = 98
          Height = 19
          AutoSize = False
          Ctl3D = False
          DisplayFormat = ',0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
      end
      object Gb_Desembolso: TGroupBox
        Left = 77
        Top = 67
        Width = 197
        Height = 56
        Caption = ' Empresa a Desembolsar Pagto '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object Rb_DesembolsoLixissse: TRadioButton
          Left = 16
          Top = 24
          Width = 69
          Height = 17
          Caption = 'L'#237'xisse'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = Rb_DesembolsoLixissseClick
          OnKeyUp = Rb_DesembolsoLixissseKeyUp
        end
        object Rb_DesembolsoBelshop: TRadioButton
          Left = 112
          Top = 24
          Width = 69
          Height = 17
          Caption = 'BelShop'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = Rb_DesembolsoLixissseClick
          OnKeyUp = Rb_DesembolsoLixissseKeyUp
        end
      end
    end
    object Ts_CP_CadastroHistoticos: TTabSheet
      Caption = ' Cadastro de Histoticos '
      Highlighted = True
      ImageIndex = 1
      object GroupBox1: TGroupBox
        Left = 104
        Top = 112
        Width = 507
        Height = 55
        Caption = ' Descri'#231#227'o do Hist'#243'rico '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object EdtDesHistorico: TEdit
          Left = 13
          Top = 20
          Width = 481
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object GroupBox2: TGroupBox
        Left = 104
        Top = 176
        Width = 507
        Height = 55
        Caption = ' Centro de Custo '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object EdtDesCentroCusto: TEdit
          Left = 13
          Top = 20
          Width = 451
          Height = 21
          CharCase = ecUpperCase
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object Bt_BuscaCentrosCusto: TJvXPButton
          Tag = 92
          Left = 472
          Top = 16
          Width = 24
          Height = 26
          TabOrder = 1
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
          OnClick = Bt_BuscaCentrosCustoClick
        end
      end
      object EdtCodCentroCusto: TEdit
        Left = 48
        Top = 195
        Width = 47
        Height = 21
        TabOrder = 2
        Visible = False
      end
      object EdtCodHistorico: TEdit
        Left = 48
        Top = 132
        Width = 47
        Height = 21
        TabOrder = 3
        Visible = False
      end
    end
    object Ts_CP_Relatorio: TTabSheet
      Caption = ' Relatorio Contas a Pagar '
      Highlighted = True
      ImageIndex = 2
      object Gb_Relatorio: TGroupBox
        Left = 4
        Top = 1
        Width = 455
        Height = 168
        Caption = ' Relat'#243'rio '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Gb_TipoConta: TGroupBox
          Left = 10
          Top = 21
          Width = 241
          Height = 78
          Caption = ' Tipo de Conta '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Rb_APagar: TJvRadioButton
            Left = 12
            Top = 30
            Width = 67
            Height = 17
            Alignment = taLeftJustify
            Caption = 'A Pagar'
            Checked = True
            TabOrder = 0
            TabStop = True
            OnClick = Rb_APagarClick
            OnKeyUp = Rb_APagarKeyUp
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
            LinkedControls = <>
          end
          object Rb_Pagas: TJvRadioButton
            Left = 12
            Top = 55
            Width = 51
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Pagas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = Rb_APagarClick
            OnKeyUp = Rb_APagarKeyUp
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
            LinkedControls = <>
          end
          object Pan_TipoPesquisa: TPanel
            Left = 112
            Top = 15
            Width = 127
            Height = 61
            Align = alRight
            BevelOuter = bvNone
            Color = 16770250
            TabOrder = 2
            Visible = False
            object Label7: TLabel
              Left = 0
              Top = 0
              Width = 127
              Height = 13
              Align = alTop
              Alignment = taCenter
              Caption = 'Pesquisar/Classificar'
              Color = clBtnFace
              ParentColor = False
            end
            object Rb_PesqDtaVencto: TJvRadioButton
              Left = 6
              Top = 20
              Width = 119
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Data Vencimento'
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = Rb_PesqDtaVenctoClick
              OnKeyUp = Rb_PesqDtaVenctoKeyUp
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
              LinkedControls = <>
            end
            object Rb_PesqDtaPagto: TJvRadioButton
              Left = 6
              Top = 43
              Width = 101
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Data Pagamento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = Rb_PesqDtaVenctoClick
              OnKeyUp = Rb_PesqDtaVenctoKeyUp
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'MS Sans Serif'
              HotTrackFont.Style = []
              LinkedControls = <>
            end
          end
        end
        object Bt_Imprimir: TJvXPButton
          Tag = 99
          Left = 288
          Top = 115
          Width = 115
          Height = 32
          Caption = 'Imprimir'
          TabOrder = 3
          Glyph.Data = {
            07544269746D6170BE060000424DBE0600000000000036040000280000001600
            00001B0000000100080000000000880200000000000000000000000100000000
            000000000000000080000080000000808000800000008000800080800000C0C0
            C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
            E00000400000004020000040400000406000004080000040A0000040C0000040
            E00000600000006020000060400000606000006080000060A0000060C0000060
            E00000800000008020000080400000806000008080000080A0000080C0000080
            E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
            E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
            E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
            E00040000000400020004000400040006000400080004000A0004000C0004000
            E00040200000402020004020400040206000402080004020A0004020C0004020
            E00040400000404020004040400040406000404080004040A0004040C0004040
            E00040600000406020004060400040606000406080004060A0004060C0004060
            E00040800000408020004080400040806000408080004080A0004080C0004080
            E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
            E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
            E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
            E00080000000800020008000400080006000800080008000A0008000C0008000
            E00080200000802020008020400080206000802080008020A0008020C0008020
            E00080400000804020008040400080406000804080008040A0008040C0008040
            E00080600000806020008060400080606000806080008060A0008060C0008060
            E00080800000808020008080400080806000808080008080A0008080C0008080
            E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
            E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
            E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
            E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
            E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
            E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
            E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
            E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
            E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
            E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
            A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
            EDEC9B9B9B9B9B9B9B9BFFFFFFFFFFFF0000FFFFFFFFFFFFEDFFFFFFFFFFFFFF
            FF9BFFFFFFFFFFFF0000FFFFFFFFFFFFEDFFA4A4A4A4A4A4FF9BFFFFFFFFFFFF
            0000FFFFFFFFFFFFEDFFF6FFE3ECE3E2FF9BFFFFFFFFFFFF0000FFFFFFFFFFFF
            EDFFE3FFE3E3E209FF9BFFFFFFFFFFFF0000FFFFA49B9B52EDFF090909090909
            FF9B529B9B9BADFF0000FFA4F7F7A452EDFF090909090909FFA352A4F7A49BFF
            0000FFF7F7F7F752F7F6090909A7A709F6A352A4F7F79BFF0000FFA4A4A4A4A4
            A4A4A4A4A4A4A4A4A4A4A4A4A4A49BFF0000FFA4070707F7F7F7F7F7F7F7F7F7
            F7F7A40707079BFF0000FFA4070707F7F7F7F7F7F7F7F7F7F7F7A40707079BFF
            0000FFF7F6F6F60808080808080808080808F7F6F6F69BFF0000FFF7F607F607
            07070707070707070707A4F607089BFF0000FFF7F6F6F6070707070707070707
            0707A4F608089BFF0000FFF7FFF6F60707070707070707070707A4F607089BFF
            0000FFF7FFFFFF0808080808080808080808A4F607F69BFF0000FFF7FFFFFF08
            08080808080808080808A4F6F6F69BFF0000FFB7F7F7F7F7F7F7F7A4A4A4A4A4
            A4A4A4F7A5A4B6FF0000FFFFFFFFFF9BEDFFFFFFFFFFFFFFFF9BA4FFFFFFFFFF
            0000FFFFFFFFFF5BEDFFFFFFFFFFFFFFFF9BA5FFFFFFFFFF0000FFFFFFFFFF9B
            EDFFFFFFFFFFFFFFFF9BFFFFFFFFFFFF0000FFFFFFFFFFFFEDFFFFFFFFFFFFFF
            FF9BFFFFFFFFFFFF0000FFFFFFFFFFFFEDFFFFFFFFFFFFFFFF9BFFFFFFFFFFFF
            0000FFFFFFFFFFFFEDFFFFFFFFFFFFFFFFA3FFFFFFFFFFFF0000FFFFFFFFFFFF
            EDEDEDEDEDEDEDEDECECFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF0000}
          ShowFocusRect = True
          Spacing = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_ImprimirClick
        end
        object Gb_Periodo: TGroupBox
          Left = 10
          Top = 104
          Width = 241
          Height = 53
          Caption = ' Per'#237'odo de '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Label6: TLabel
            Left = 117
            Top = 23
            Width = 8
            Height = 13
            Caption = 'a'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DtEdt_DtaFim: TcxDateEdit
            Left = 128
            Top = 18
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            StyleFocused.BorderStyle = ebsOffice11
            TabOrder = 1
            Width = 106
          end
          object DtEdt_DtaInicio: TcxDateEdit
            Left = 8
            Top = 18
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
        object Pan_Desembolso: TPanel
          Left = 256
          Top = 24
          Width = 193
          Height = 74
          ParentColor = True
          TabOrder = 2
          object Lab_Desembolso: TLabel
            Left = 1
            Top = 1
            Width = 191
            Height = 16
            Align = alTop
            Alignment = taCenter
            Caption = 'Empresa de Desembolso'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Ckb_Desembolso: TRxCheckListBox
            Left = 1
            Top = 17
            Width = 191
            Height = 56
            TabStop = False
            CheckKind = ckCheckMarks
            Align = alClient
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 16
            ParentColor = True
            ParentFont = False
            Style = lbOwnerDrawFixed
            TabOrder = 0
            OnClick = Ckb_DesembolsoClick
            OnKeyUp = Ckb_DesembolsoKeyUp
            InternalVersion = 202
            Strings = (
              'SELECIONE PARA IMPRESS'#195'O '
              1
              False
              'LIXISSE'
              0
              True
              'BELSHOP'
              0
              True)
          end
        end
      end
      object v1: TJvValidateEdit
        Left = 480
        Top = 56
        Width = 73
        Height = 19
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        EditText = '180'
        TabOrder = 1
        Visible = False
      end
      object v2: TJvValidateEdit
        Left = 480
        Top = 80
        Width = 73
        Height = 19
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        EditText = '600'
        TabOrder = 2
        Visible = False
      end
      object a3: TEdit
        Left = 568
        Top = 104
        Width = 52
        Height = 19
        TabOrder = 3
        Text = 'D'
        Visible = False
      end
      object a2: TEdit
        Left = 568
        Top = 80
        Width = 52
        Height = 19
        TabOrder = 4
        Text = 'E'
        Visible = False
      end
      object a1: TEdit
        Left = 568
        Top = 56
        Width = 52
        Height = 19
        TabOrder = 5
        Text = 'E'
        Visible = False
      end
      object v3: TJvValidateEdit
        Left = 480
        Top = 104
        Width = 73
        Height = 19
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        EditText = '10'
        TabOrder = 6
        Visible = False
      end
      object v4: TJvValidateEdit
        Left = 480
        Top = 128
        Width = 73
        Height = 19
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        EditText = '50'
        TabOrder = 7
        Visible = False
      end
      object a4: TEdit
        Left = 568
        Top = 128
        Width = 52
        Height = 19
        TabOrder = 8
        Text = 'E'
        Visible = False
      end
      object a5: TEdit
        Left = 568
        Top = 152
        Width = 52
        Height = 19
        TabOrder = 9
        Text = 'D'
        Visible = False
      end
      object v5: TJvValidateEdit
        Left = 480
        Top = 152
        Width = 73
        Height = 19
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        EditText = '18'
        TabOrder = 10
        Visible = False
      end
      object v6: TJvValidateEdit
        Left = 480
        Top = 176
        Width = 73
        Height = 19
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        EditText = '10'
        TabOrder = 11
        Visible = False
      end
      object a6: TEdit
        Left = 568
        Top = 176
        Width = 52
        Height = 19
        TabOrder = 12
        Text = 'C'
        Visible = False
      end
      object a7: TEdit
        Left = 568
        Top = 200
        Width = 52
        Height = 19
        TabOrder = 13
        Text = 'C'
        Visible = False
      end
      object v7: TJvValidateEdit
        Left = 480
        Top = 200
        Width = 73
        Height = 19
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        EditText = '9'
        TabOrder = 14
        Visible = False
      end
      object v8: TJvValidateEdit
        Left = 480
        Top = 224
        Width = 73
        Height = 19
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        EditText = '16'
        TabOrder = 15
        Visible = False
      end
      object a8: TEdit
        Left = 568
        Top = 224
        Width = 52
        Height = 19
        TabOrder = 16
        Text = 'D'
        Visible = False
      end
      object a9: TEdit
        Left = 568
        Top = 248
        Width = 52
        Height = 19
        TabOrder = 17
        Text = 'D'
        Visible = False
      end
      object v9: TJvValidateEdit
        Left = 480
        Top = 248
        Width = 73
        Height = 19
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        EditText = '16'
        TabOrder = 18
        Visible = False
      end
      object a11: TEdit
        Left = 568
        Top = 296
        Width = 52
        Height = 19
        TabOrder = 19
        Text = 'E'
        Visible = False
      end
      object v11: TJvValidateEdit
        Left = 480
        Top = 296
        Width = 73
        Height = 19
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        EditText = '20'
        TabOrder = 20
        Visible = False
      end
    end
  end
  object OdirPanApres: TPanel
    Left = 603
    Top = 2
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
