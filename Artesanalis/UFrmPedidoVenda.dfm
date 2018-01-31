object FrmPedidoVenda: TFrmPedidoVenda
  Left = 239
  Top = 81
  Width = 1036
  Height = 611
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
  object Gb_Produtos: TGroupBox
    Left = 0
    Top = 106
    Width = 1020
    Height = 368
    Align = alClient
    Caption = ' Produtos '
    Color = 16770250
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    object Dbg_Produtos: TDBGrid
      Left = 1
      Top = 14
      Width = 1018
      Height = 353
      Align = alClient
      DataSource = DMArtesanalis.DS_V_DoctoItens
      FixedColor = 15000804
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
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
          Title.Alignment = taCenter
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DES_PRODUTO'
          Width = 298
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTD_MOVTO'
          Title.Alignment = taRightJustify
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_UNITARIO'
          Title.Alignment = taRightJustify
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_PRODUTO'
          Title.Alignment = taRightJustify
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PER_DESCONTO'
          Title.Alignment = taRightJustify
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_DESCONTO'
          Title.Alignment = taRightJustify
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_TOTAL'
          Title.Alignment = taRightJustify
          Width = 100
          Visible = True
        end>
    end
  end
  object Pan_Docto: TPanel
    Left = 0
    Top = 0
    Width = 1020
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
    object Gb_NumDocto: TGroupBox
      Left = 678
      Top = 7
      Width = 86
      Height = 51
      Caption = ' N'#186' Pedido '
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
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
      Left = 766
      Top = 7
      Width = 134
      Height = 51
      Caption = ' Data de Emiss'#227'o '
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
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
      Left = 101
      Top = 7
      Width = 575
      Height = 51
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
  end
  object Pan_Produto: TPanel
    Left = 0
    Top = 64
    Width = 1020
    Height = 42
    Align = alTop
    BevelInner = bvLowered
    ParentColor = True
    TabOrder = 1
    object Label1: TLabel
      Left = 7
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
      Left = 399
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
      Left = 488
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
      Left = 806
      Top = 6
      Width = 93
      Height = 13
      Caption = '$ Total  Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 731
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
    object Label7: TLabel
      Left = 649
      Top = 6
      Width = 68
      Height = 13
      Caption = '% Desconto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 580
      Top = 6
      Width = 56
      Height = 13
      Caption = '$ Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdtSeqProduto: TCurrencyEdit
      Left = 1
      Top = 20
      Width = 32
      Height = 19
      AutoSize = False
      Color = clMoneyGreen
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0,'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object EdtCodProduto: TCurrencyEdit
      Left = 33
      Top = 20
      Width = 52
      Height = 19
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0,'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnDblClick = EdtCodProdutoDblClick
      OnEnter = EdtCodProdutoEnter
      OnExit = EdtCodProdutoExit
      OnKeyDown = EdtCodProdutoKeyDown
    end
    object EdtDesProduto: TEdit
      Left = 85
      Top = 20
      Width = 299
      Height = 19
      TabStop = False
      CharCase = ecUpperCase
      Color = clMoneyGreen
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 50
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object EdtQtdProduto: TCurrencyEdit
      Left = 384
      Top = 20
      Width = 81
      Height = 19
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 4
      DisplayFormat = ',0.0000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      OnEnter = EdtQtdProdutoEnter
      OnExit = EdtQtdProdutoEnter
    end
    object EdtVlrUnitProduto: TCurrencyEdit
      Left = 465
      Top = 20
      Width = 81
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
      TabOrder = 4
      OnEnter = EdtQtdProdutoEnter
      OnExit = EdtQtdProdutoEnter
    end
    object EdtVlrTotalProduto: TCurrencyEdit
      Left = 799
      Top = 20
      Width = 103
      Height = 19
      TabStop = False
      AutoSize = False
      Color = clMoneyGreen
      Ctl3D = False
      DisplayFormat = ',0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
      OnEnter = EdtVlrTotalProdutoEnter
    end
    object Bt_IncluiProduto: TJvXPButton
      Tag = 92
      Left = 907
      Top = 14
      Width = 29
      Height = 26
      Caption = 'Inc'
      TabOrder = 9
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
      Left = 938
      Top = 14
      Width = 29
      Height = 26
      Caption = 'Exc'
      TabOrder = 10
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
      Left = 969
      Top = 14
      Width = 29
      Height = 26
      TabOrder = 11
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
      Left = 718
      Top = 20
      Width = 81
      Height = 19
      TabStop = False
      AutoSize = False
      Color = clMoneyGreen
      Ctl3D = False
      DisplayFormat = ',0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      OnEnter = EdtQtdProdutoEnter
      OnExit = EdtVlrDescProdutoExit
    end
    object EdtPercDescProduto: TCurrencyEdit
      Left = 638
      Top = 20
      Width = 80
      Height = 19
      TabStop = False
      AutoSize = False
      Color = clMoneyGreen
      Ctl3D = False
      DisplayFormat = ',0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      OnEnter = EdtQtdProdutoEnter
      OnExit = EdtVlrDescProdutoExit
    end
    object EdtVlrProduto: TCurrencyEdit
      Left = 546
      Top = 20
      Width = 92
      Height = 19
      TabStop = False
      AutoSize = False
      Color = clMoneyGreen
      Ctl3D = False
      DisplayFormat = ',0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      OnEnter = EdtQtdProdutoEnter
      OnExit = EdtVlrDescProdutoExit
    end
  end
  object Pan_Solicitacoes: TPanel
    Left = 0
    Top = 543
    Width = 1020
    Height = 30
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    Color = 16770250
    TabOrder = 4
    object Bt_Fechar: TJvXPButton
      Tag = 99
      Left = 920
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
  object Panel1: TPanel
    Left = 0
    Top = 494
    Width = 1020
    Height = 49
    Align = alBottom
    Color = 16770250
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 3
    object Gb_VlrProdutos: TGroupBox
      Left = 47
      Top = 3
      Width = 110
      Height = 42
      Caption = ' Vlr Produtos '
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      object EdtVlrProdutos: TCurrencyEdit
        Left = 12
        Top = 17
        Width = 84
        Height = 19
        TabStop = False
        AutoSize = False
        Color = clMoneyGreen
        Ctl3D = False
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnEnter = EdtVlrProdutosEnter
        OnExit = EdtVlrProdutosEnter
      end
    end
    object Gb_VlrDescontos: TGroupBox
      Left = 259
      Top = 3
      Width = 110
      Height = 42
      Caption = ' Vlr Descontos '
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      object EdtVlrDescontos: TCurrencyEdit
        Left = 12
        Top = 17
        Width = 84
        Height = 19
        TabStop = False
        AutoSize = False
        Color = clMoneyGreen
        Ctl3D = False
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnEnter = EdtVlrProdutosEnter
        OnExit = EdtVlrProdutosEnter
      end
    end
    object Gb_VlrTotalPerdido: TGroupBox
      Left = 371
      Top = 3
      Width = 116
      Height = 42
      Caption = ' Vlr Total Pedido '
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      object EdtVlrTotal: TCurrencyEdit
        Left = 12
        Top = 17
        Width = 92
        Height = 19
        TabStop = False
        AutoSize = False
        Color = clMoneyGreen
        Ctl3D = False
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnChange = EdtVlrTotalChange
        OnEnter = EdtVlrProdutosEnter
        OnExit = EdtVlrProdutosEnter
      end
    end
    object Gb_PercDesconto: TGroupBox
      Left = 159
      Top = 3
      Width = 98
      Height = 42
      Caption = ' % Descontos '
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      object EdtPercDesconto: TCurrencyEdit
        Left = 25
        Top = 17
        Width = 50
        Height = 19
        AutoSize = False
        Ctl3D = False
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxValue = 100.000000000000000000
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnExit = EdtPercDescontoExit
      end
    end
    object Gb_PercDescConcedido: TGroupBox
      Left = 531
      Top = 3
      Width = 131
      Height = 42
      Caption = ' % Desc Concedido '
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
      object EdtPercDescConcedido: TCurrencyEdit
        Left = 41
        Top = 17
        Width = 52
        Height = 19
        AutoSize = False
        Ctl3D = False
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxValue = 100.000000000000000000
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnExit = EdtPercDescConcedidoExit
      end
    end
    object Gb_VlrDescConcedido: TGroupBox
      Left = 664
      Top = 3
      Width = 137
      Height = 42
      Caption = ' Vlr Desc Concedido '
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
      object EdtVlrDescConcedido: TCurrencyEdit
        Left = 26
        Top = 17
        Width = 84
        Height = 19
        AutoSize = False
        Ctl3D = False
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnExit = EdtVlrDescConcedidoExit
      end
    end
    object Gb_VlrPagto: TGroupBox
      Left = 841
      Top = 3
      Width = 116
      Height = 42
      Caption = ' Vlr Pagamento '
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 6
      object EdtVlrPagto: TCurrencyEdit
        Left = 12
        Top = 17
        Width = 92
        Height = 19
        TabStop = False
        AutoSize = False
        Color = clMoneyGreen
        Ctl3D = False
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnEnter = EdtVlrProdutosEnter
        OnExit = EdtVlrProdutosEnter
      end
    end
  end
  object StB_Movtos: TdxStatusBar
    Left = 0
    Top = 474
    Width = 1020
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
  object EdtNumSeqDocto: TCurrencyEdit
    Left = 494
    Top = 237
    Width = 40
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
    TabOrder = 6
    Visible = False
  end
  object Dbe_VlrTotalCalculado: TDBEdit
    Left = 493
    Top = 255
    Width = 122
    Height = 21
    DataField = 'Vlr_TotalCalculado'
    DataSource = DMArtesanalis.DS_V_DoctoItens
    TabOrder = 7
    Visible = False
    OnChange = Dbe_VlrTotalCalculadoChange
  end
  object Dbe_VlrTotalDesconto: TDBEdit
    Left = 493
    Top = 273
    Width = 122
    Height = 21
    DataField = 'Vlr_TotalDesconto'
    DataSource = DMArtesanalis.DS_V_DoctoItens
    TabOrder = 8
    Visible = False
    OnChange = Dbe_VlrTotalDescontoChange
  end
  object Dbe_VlrTotalProdutos: TDBEdit
    Left = 493
    Top = 289
    Width = 123
    Height = 21
    DataField = 'Vlr_TotalProdutos'
    DataSource = DMArtesanalis.DS_V_DoctoItens
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    Visible = False
    OnChange = Dbe_VlrTotalProdutosChange
  end
  object OdirPanApres: TPanel
    Left = 16
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
    TabOrder = 10
    Visible = False
  end
end
