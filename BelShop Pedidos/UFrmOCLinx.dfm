object FrmOCLinx: TFrmOCLinx
  Left = 237
  Top = 115
  Align = alClient
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '  PEDIDO DE COMPRA - LINX'
  ClientHeight = 574
  ClientWidth = 1087
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
  object PC_OrdemCompra: TPageControl
    Left = 0
    Top = 0
    Width = 1087
    Height = 532
    ActivePage = Ts_OCBuscaProdutos
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnChange = PC_OrdemCompraChange
    object Ts_OCBuscaProdutos: TTabSheet
      Caption = ' Filtro Fornecedores/Produtos '
      Highlighted = True
      object Pan_OC: TPanel
        Left = 0
        Top = 0
        Width = 1079
        Height = 504
        Align = alClient
        BevelInner = bvLowered
        Color = 14342874
        TabOrder = 0
        object PC_Filtros: TPageControl
          Tag = 92
          Left = 2
          Top = 79
          Width = 1075
          Height = 423
          ActivePage = TS_FiltroFornecedor
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnChange = PC_FiltrosChange
          object TS_FiltroFornecedor: TTabSheet
            Caption = '  Fornecedores  '
            Highlighted = True
            ImageIndex = 2
            object Gb_FiltroFornecedor: TGroupBox
              Left = 0
              Top = 0
              Width = 316
              Height = 395
              Align = alLeft
              Caption = '  Fornecedores  '
              Color = 13092807
              Ctl3D = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 0
              DesignSize = (
                316
                395)
              object Label188: TLabel
                Left = 282
                Top = 29
                Width = 29
                Height = 13
                Caption = '==>>'
              end
              object EdtFiltroCodForn: TCurrencyEdit
                Left = 150
                Top = 27
                Width = 66
                Height = 21
                AutoSize = False
                DecimalPlaces = 0
                DisplayFormat = '0'
                TabOrder = 0
                OnExit = EdtFiltroCodFornExit
              end
              object Bt_FiltroBuscaForn: TJvXPButton
                Tag = 92
                Left = 221
                Top = 24
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
                Anchors = [akTop, akRight]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = Bt_FiltroBuscaFornClick
              end
              object Painel_FiltroOC: TPanel
                Left = 3
                Top = 64
                Width = 312
                Height = 167
                BevelOuter = bvNone
                Color = 13092807
                TabOrder = 2
                object Gb_CalculoCurvaABC: TGroupBox
                  Left = 1
                  Top = 4
                  Width = 308
                  Height = 46
                  Caption = ' Curva ABC '
                  Color = 13816530
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 0
                  object Ckb_CalculoCurvaTodas: TJvXPCheckbox
                    Left = 11
                    Top = 20
                    Width = 60
                    Height = 17
                    Caption = 'Todas'
                    TabOrder = 0
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Ckb_CalculoCurvaA: TJvXPCheckbox
                    Left = 75
                    Top = 20
                    Width = 62
                    Height = 17
                    Caption = 'A'
                    TabOrder = 1
                    ParentColor = False
                    Color = 15461355
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = 'Castellar'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Ckb_CalculoCurvaB: TJvXPCheckbox
                    Left = 118
                    Top = 20
                    Width = 62
                    Height = 17
                    Caption = 'B'
                    TabOrder = 2
                    ParentColor = False
                    Color = 15461355
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = 'Castellar'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Ckb_CalculoCurvaC: TJvXPCheckbox
                    Left = 162
                    Top = 20
                    Width = 64
                    Height = 17
                    Caption = 'C'
                    TabOrder = 4
                    ParentColor = False
                    Color = 15461355
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = 'Castellar'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Ckb_CalculoCurvaD: TJvXPCheckbox
                    Left = 208
                    Top = 20
                    Width = 60
                    Height = 17
                    Caption = 'D'
                    TabOrder = 3
                    ParentColor = False
                    Color = 15461355
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = 'Castellar'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Ckb_CalculoCurvaE: TJvXPCheckbox
                    Left = 251
                    Top = 20
                    Width = 43
                    Height = 17
                    Caption = 'E'
                    TabOrder = 5
                    ParentColor = False
                    Color = 15461355
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = 'Castellar'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                end
                object Gb_CalculoTpCurvaABC: TGroupBox
                  Left = 1
                  Top = 52
                  Width = 308
                  Height = 57
                  Caption = ' Tipo de Curva a Utilizar '
                  Color = 13816530
                  ParentColor = False
                  TabOrder = 1
                  object Rb_CalculoTpCurvaABCMix: TJvRadioButton
                    Left = 115
                    Top = 24
                    Width = 78
                    Height = 17
                    Alignment = taLeftJustify
                    Caption = 'Mix por Loja'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 1
                    HotTrackFont.Charset = DEFAULT_CHARSET
                    HotTrackFont.Color = clWindowText
                    HotTrackFont.Height = -11
                    HotTrackFont.Name = 'MS Sans Serif'
                    HotTrackFont.Style = []
                    LinkedControls = <>
                  end
                  object Rb_CalculoTpCurvaABCMpms: TJvRadioButton
                    Left = 206
                    Top = 24
                    Width = 84
                    Height = 17
                    Alignment = taLeftJustify
                    Caption = 'Curva MPMS'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 2
                    HotTrackFont.Charset = DEFAULT_CHARSET
                    HotTrackFont.Color = clWindowText
                    HotTrackFont.Height = -11
                    HotTrackFont.Name = 'MS Sans Serif'
                    HotTrackFont.Style = []
                    LinkedControls = <>
                  end
                  object Rb_CalculoTpCurvaABCLoja: TJvRadioButton
                    Left = 7
                    Top = 24
                    Width = 106
                    Height = 17
                    Alignment = taLeftJustify
                    Caption = 'Curva Por Loja'
                    Checked = True
                    TabOrder = 0
                    TabStop = True
                    HotTrackFont.Charset = DEFAULT_CHARSET
                    HotTrackFont.Color = clWindowText
                    HotTrackFont.Height = -11
                    HotTrackFont.Name = 'MS Sans Serif'
                    HotTrackFont.Style = []
                    LinkedControls = <>
                  end
                end
                object Gb_CalculoApresCurva: TGroupBox
                  Left = 1
                  Top = 110
                  Width = 308
                  Height = 52
                  Caption = ' Apresentar Curvas Fora da Faixa Selecionada '
                  Color = clBtnFace
                  ParentColor = False
                  TabOrder = 2
                  object Lb_CalculoApresCurva: TLabel
                    Left = 85
                    Top = 24
                    Width = 51
                    Height = 13
                    Caption = 'Estoque:'
                  end
                  object Rb_CalculoApresCurvaEstCom: TJvRadioButton
                    Left = 136
                    Top = 24
                    Width = 46
                    Height = 17
                    Alignment = taLeftJustify
                    Caption = 'Com'
                    Checked = True
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 1
                    TabStop = True
                    HotTrackFont.Charset = DEFAULT_CHARSET
                    HotTrackFont.Color = clWindowText
                    HotTrackFont.Height = -11
                    HotTrackFont.Name = 'MS Sans Serif'
                    HotTrackFont.Style = []
                    LinkedControls = <>
                  end
                  object Rb_CalculoApresCurvaEstSem: TJvRadioButton
                    Left = 187
                    Top = 24
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
                    TabOrder = 2
                    HotTrackFont.Charset = DEFAULT_CHARSET
                    HotTrackFont.Color = clWindowText
                    HotTrackFont.Height = -11
                    HotTrackFont.Name = 'MS Sans Serif'
                    HotTrackFont.Style = []
                    LinkedControls = <>
                  end
                  object Ckb_CalculoApresCurvaFora: TJvXPCheckbox
                    Left = 11
                    Top = 24
                    Width = 46
                    Height = 17
                    Caption = 'NAO'
                    TabOrder = 0
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Rb_CalculoApresCurvaEstAmbos: TJvRadioButton
                    Left = 239
                    Top = 24
                    Width = 53
                    Height = 17
                    Alignment = taLeftJustify
                    Caption = 'Ambos'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 3
                    HotTrackFont.Charset = DEFAULT_CHARSET
                    HotTrackFont.Color = clWindowText
                    HotTrackFont.Height = -11
                    HotTrackFont.Name = 'MS Sans Serif'
                    HotTrackFont.Style = []
                    LinkedControls = <>
                  end
                end
              end
              object Bt_FiltroExcluiForn: TJvXPButton
                Tag = 92
                Left = 251
                Top = 24
                Width = 24
                Height = 26
                TabOrder = 3
                TabStop = False
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
                Anchors = [akTop, akRight]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = Bt_FiltroExcluiFornClick
              end
            end
            object Dbg_FiltroFornecedores: TDBGridJul
              Left = 316
              Top = 0
              Width = 751
              Height = 395
              Hint = '<Delete> Exclui Fornecedor da Lista'
              Align = alClient
              DataSource = DMVirtual.DS_V_Fornecedores
              FixedColor = clTeal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWhite
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = [fsBold]
              OnEnter = Dbg_FiltroFornecedoresEnter
              OnKeyDown = Dbg_FiltroFornecedoresKeyDown
              SairComEnter = False
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Des_Fornecedor'
                  Title.Caption = 'Descri'#231#227'o do Fornecedor'
                  Width = 350
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Cod_Fornecedor'
                  Title.Alignment = taRightJustify
                  Title.Caption = 'C'#243'digo'
                  Width = 100
                  Visible = True
                end>
            end
            object GroupBox1: TGroupBox
              Left = 800
              Top = 184
              Width = 201
              Height = 89
              Caption = 'Meses Retirados'
              TabOrder = 2
              Visible = False
              object Label32: TLabel
                Left = 9
                Top = 24
                Width = 35
                Height = 13
                Caption = 'M'#234's 6'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label33: TLabel
                Left = 143
                Top = 21
                Width = 6
                Height = 20
                Caption = '/'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label34: TLabel
                Left = 9
                Top = 44
                Width = 35
                Height = 13
                Caption = 'M'#234's 7'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label40: TLabel
                Left = 144
                Top = 41
                Width = 6
                Height = 20
                Caption = '/'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label41: TLabel
                Left = 9
                Top = 64
                Width = 35
                Height = 13
                Caption = 'M'#234's 8'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label42: TLabel
                Left = 142
                Top = 61
                Width = 6
                Height = 20
                Caption = '/'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object CB_Mes6: TComboBox
                Left = 49
                Top = 21
                Width = 82
                Height = 19
                Style = csOwnerDrawFixed
                CharCase = ecUpperCase
                Color = 8454143
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ItemHeight = 13
                ItemIndex = 0
                ParentFont = False
                TabOrder = 0
                Text = 'NAO USAR'
                Items.Strings = (
                  'NAO USAR'
                  'JAN'
                  'FEV'
                  'MAR'
                  'ABR'
                  'MAI'
                  'JUN'
                  'JUL'
                  'AGO'
                  'SET'
                  'OUT'
                  'NOV'
                  'DEZ')
              end
              object ME_Ano6: TMaskEdit
                Left = 155
                Top = 21
                Width = 34
                Height = 19
                EditMask = '!2\000;1;_'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 4
                ParentFont = False
                TabOrder = 1
                Text = '20  '
              end
              object CB_Mes7: TComboBox
                Left = 49
                Top = 41
                Width = 82
                Height = 19
                Style = csOwnerDrawFixed
                CharCase = ecUpperCase
                Color = 8454143
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ItemHeight = 13
                ItemIndex = 0
                ParentFont = False
                TabOrder = 2
                Text = 'NAO USAR'
                Items.Strings = (
                  'NAO USAR'
                  'JAN'
                  'FEV'
                  'MAR'
                  'ABR'
                  'MAI'
                  'JUN'
                  'JUL'
                  'AGO'
                  'SET'
                  'OUT'
                  'NOV'
                  'DEZ')
              end
              object ME_Ano7: TMaskEdit
                Left = 156
                Top = 41
                Width = 34
                Height = 19
                EditMask = '!2\000;1;_'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 4
                ParentFont = False
                TabOrder = 3
                Text = '20  '
              end
              object CB_Mes8: TComboBox
                Left = 48
                Top = 61
                Width = 86
                Height = 19
                Style = csOwnerDrawFixed
                CharCase = ecUpperCase
                Color = 8454143
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ItemHeight = 13
                ItemIndex = 0
                ParentFont = False
                TabOrder = 4
                Text = 'NAO USAR'
                Items.Strings = (
                  'NAO USAR'
                  'JAN'
                  'FEV'
                  'MAR'
                  'ABR'
                  'MAI'
                  'JUN'
                  'JUL'
                  'AGO'
                  'SET'
                  'OUT'
                  'NOV'
                  'DEZ')
              end
              object ME_Ano8: TMaskEdit
                Left = 152
                Top = 61
                Width = 38
                Height = 19
                EditMask = '!2\000;1;_'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 4
                ParentFont = False
                TabOrder = 5
                Text = '20  '
              end
            end
          end
          object TS_FiltroProdutos: TTabSheet
            Caption = '  Produtos '
            ImageIndex = 5
            object Gb_FiltroProduto: TGroupBox
              Left = 0
              Top = 0
              Width = 316
              Height = 395
              Align = alLeft
              Caption = '  Produtos dos Fornecedores Selecionados   '
              Color = 13092807
              Ctl3D = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 0
              DesignSize = (
                316
                395)
              object Label3: TLabel
                Left = 282
                Top = 29
                Width = 29
                Height = 13
                Caption = '==>>'
              end
              object EdtFiltroCodProduto: TCurrencyEdit
                Left = 142
                Top = 27
                Width = 72
                Height = 21
                AutoSize = False
                DecimalPlaces = 0
                DisplayFormat = '0'
                TabOrder = 0
                OnExit = EdtFiltroCodProdutoExit
              end
              object Bt_FiltroBuscaProdtudo: TJvXPButton
                Tag = 92
                Left = 221
                Top = 24
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
                Anchors = [akTop, akRight]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = Bt_FiltroBuscaProdtudoClick
              end
              object Pan_FiltroNaoCompra: TPanel
                Left = 3
                Top = 304
                Width = 311
                Height = 57
                TabOrder = 2
                object Gb_CalculoUtilizarProdNaoCompra: TGroupBox
                  Left = 1
                  Top = 3
                  Width = 308
                  Height = 51
                  Color = 13816530
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 0
                  object Label190: TLabel
                    Left = 58
                    Top = 10
                    Width = 195
                    Height = 13
                    Caption = 'Utilizar Produtos N'#195'O COMPRA ? '
                  end
                  object Label1: TLabel
                    Left = 5
                    Top = 31
                    Width = 248
                    Height = 13
                    Caption = 'Utilizar Somente Produtos N'#195'O COMPRA ? '
                  end
                  object Ckb_FiltroProdNaoCompra: TJvXPCheckbox
                    Left = 254
                    Top = 8
                    Width = 51
                    Height = 17
                    Caption = 'NAO'
                    TabOrder = 0
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    OnClick = Ckb_FiltroProdNaoCompraClick
                    OnKeyUp = Ckb_FiltroProdNaoCompraKeyUp
                  end
                  object Ckb_FiltroProdSoNaoCompra: TJvXPCheckbox
                    Left = 254
                    Top = 29
                    Width = 51
                    Height = 17
                    Caption = 'NAO'
                    TabOrder = 1
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    OnClick = Ckb_FiltroProdNaoCompraClick
                    OnKeyUp = Ckb_FiltroProdNaoCompraKeyUp
                  end
                end
              end
              object Gb_CalculoFiltroNome: TGroupBox
                Left = 7
                Top = 99
                Width = 297
                Height = 202
                Caption = ' Seleciona Pelo Nome (4 Possibilidades) '
                TabOrder = 3
                object Label186: TLabel
                  Left = 14
                  Top = 24
                  Width = 46
                  Height = 13
                  Caption = 'Primeira'
                end
                object Label203: TLabel
                  Left = 14
                  Top = 64
                  Width = 51
                  Height = 13
                  Caption = 'Segunda'
                end
                object Label204: TLabel
                  Left = 14
                  Top = 144
                  Width = 39
                  Height = 13
                  Caption = 'Quarta'
                end
                object Label205: TLabel
                  Left = 14
                  Top = 104
                  Width = 48
                  Height = 13
                  Caption = 'Terceira'
                end
                object Label73: TLabel
                  Left = 1
                  Top = 188
                  Width = 295
                  Height = 13
                  Align = alBottom
                  Alignment = taCenter
                  Caption = ' Somente p/Calculo de Pedido SEM Efeito no Filtro '
                end
                object EdtCalculoFiltroNome1: TEdit
                  Left = 14
                  Top = 40
                  Width = 270
                  Height = 19
                  CharCase = ecUpperCase
                  TabOrder = 0
                end
                object EdtCalculoFiltroNome4: TEdit
                  Left = 14
                  Top = 160
                  Width = 270
                  Height = 19
                  CharCase = ecUpperCase
                  TabOrder = 3
                end
                object EdtCalculoFiltroNome3: TEdit
                  Left = 14
                  Top = 120
                  Width = 270
                  Height = 19
                  CharCase = ecUpperCase
                  TabOrder = 2
                end
                object EdtCalculoFiltroNome2: TEdit
                  Left = 14
                  Top = 80
                  Width = 270
                  Height = 19
                  CharCase = ecUpperCase
                  TabOrder = 1
                end
              end
              object Bt_FiltroExcluiProdtudo: TJvXPButton
                Tag = 92
                Left = 251
                Top = 24
                Width = 24
                Height = 26
                TabOrder = 4
                TabStop = False
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
                Anchors = [akTop, akRight]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = Bt_FiltroExcluiProdtudoClick
              end
              object Bt_FiltroCodBarras: TJvXPButton
                Tag = 92
                Left = 141
                Top = 51
                Width = 136
                Height = 26
                Caption = 'C'#243'digo de Barras'
                TabOrder = 5
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
                Layout = blGlyphRight
                ShowFocusRect = True
                Spacing = 1
                Anchors = [akTop, akRight]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = Bt_FiltroCodBarrasClick
              end
            end
            object Dbg_FiltroProduto: TDBGridJul
              Left = 316
              Top = 0
              Width = 751
              Height = 395
              Hint = '<Delete> Exclui Item da Lista'
              Align = alClient
              DataSource = DMVirtual.DS_V_Produtos
              FixedColor = clTeal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWhite
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = [fsBold]
              OnEnter = Dbg_FiltroProdutoEnter
              OnKeyDown = Dbg_FiltroProdutoKeyDown
              SairComEnter = False
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Des_Produto'
                  Title.Caption = 'Descri'#231#227'o do Produto'
                  Width = 450
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Cod_Produto'
                  Title.Alignment = taRightJustify
                  Title.Caption = 'C'#243'digo'
                  Width = 100
                  Visible = True
                end
                item
                  Alignment = taRightJustify
                  Color = 15138815
                  Expanded = False
                  FieldName = 'Cod_Fornecedor'
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Cod Forn'
                  Width = 60
                  Visible = True
                end>
            end
          end
        end
        object GB_CalculoMeses: TGroupBox
          Left = 2
          Top = 2
          Width = 1075
          Height = 77
          Align = alTop
          Caption = ' Meses de Demandas de Vendas '
          Color = 12303291
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 1
          DesignSize = (
            1075
            77)
          object Panel2: TPanel
            Left = 41
            Top = 16
            Width = 992
            Height = 56
            Anchors = [akTop]
            BevelInner = bvLowered
            BevelWidth = 2
            Enabled = False
            TabOrder = 0
            object Label22: TLabel
              Left = 15
              Top = 24
              Width = 35
              Height = 13
              Caption = 'M'#234's 1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label23: TLabel
              Left = 137
              Top = 21
              Width = 6
              Height = 20
              Caption = '/'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label24: TLabel
              Left = 202
              Top = 24
              Width = 35
              Height = 13
              Caption = 'M'#234's 2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label25: TLabel
              Left = 327
              Top = 21
              Width = 6
              Height = 20
              Caption = '/'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label26: TLabel
              Left = 399
              Top = 24
              Width = 35
              Height = 13
              Caption = 'M'#234's 3'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label27: TLabel
              Left = 525
              Top = 21
              Width = 6
              Height = 20
              Caption = '/'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label28: TLabel
              Left = 600
              Top = 24
              Width = 35
              Height = 13
              Caption = 'M'#234's 4'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label29: TLabel
              Left = 728
              Top = 21
              Width = 6
              Height = 20
              Caption = '/'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label30: TLabel
              Left = 801
              Top = 24
              Width = 35
              Height = 13
              Caption = 'M'#234's 5'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label31: TLabel
              Left = 929
              Top = 21
              Width = 6
              Height = 20
              Caption = '/'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel1: TBevel
              Left = 188
              Top = 2
              Width = 3
              Height = 52
              Style = bsRaised
            end
            object Bevel2: TBevel
              Left = 381
              Top = 2
              Width = 3
              Height = 52
              Style = bsRaised
            end
            object Bevel3: TBevel
              Left = 583
              Top = 2
              Width = 3
              Height = 52
              Style = bsRaised
            end
            object Bevel4: TBevel
              Left = 784
              Top = 2
              Width = 3
              Height = 52
              Style = bsRaised
            end
            object CB_Mes1: TComboBox
              Left = 54
              Top = 21
              Width = 80
              Height = 19
              Style = csOwnerDrawFixed
              CharCase = ecUpperCase
              Color = 8454143
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ItemIndex = 0
              ParentFont = False
              TabOrder = 0
              Text = 'JAN'
              Items.Strings = (
                'JAN'
                'FEV'
                'MAR'
                'ABR'
                'MAI'
                'JUN'
                'JUL'
                'AGO'
                'SET'
                'OUT'
                'NOV'
                'DEZ')
            end
            object ME_Ano1: TMaskEdit
              Left = 147
              Top = 21
              Width = 30
              Height = 19
              EditMask = '!2\000;1;_'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 4
              ParentFont = False
              TabOrder = 1
              Text = '20  '
            end
            object CB_Mes2: TComboBox
              Left = 242
              Top = 21
              Width = 82
              Height = 19
              Style = csOwnerDrawFixed
              CharCase = ecUpperCase
              Color = 8454143
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ItemIndex = 0
              ParentFont = False
              TabOrder = 2
              Text = 'NAO USAR'
              Items.Strings = (
                'NAO USAR'
                'JAN'
                'FEV'
                'MAR'
                'ABR'
                'MAI'
                'JUN'
                'JUL'
                'AGO'
                'SET'
                'OUT'
                'NOV'
                'DEZ')
            end
            object ME_Ano2: TMaskEdit
              Left = 336
              Top = 21
              Width = 32
              Height = 19
              EditMask = '!2\000;1;_'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 4
              ParentFont = False
              TabOrder = 3
              Text = '20  '
            end
            object CB_Mes3: TComboBox
              Left = 439
              Top = 21
              Width = 84
              Height = 19
              Style = csOwnerDrawFixed
              CharCase = ecUpperCase
              Color = 8454143
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ItemIndex = 0
              ParentFont = False
              TabOrder = 4
              Text = 'NAO USAR'
              Items.Strings = (
                'NAO USAR'
                'JAN'
                'FEV'
                'MAR'
                'ABR'
                'MAI'
                'JUN'
                'JUL'
                'AGO'
                'SET'
                'OUT'
                'NOV'
                'DEZ')
            end
            object ME_Ano3: TMaskEdit
              Left = 535
              Top = 21
              Width = 34
              Height = 19
              EditMask = '!2\000;1;_'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 4
              ParentFont = False
              TabOrder = 5
              Text = '20  '
            end
            object CB_Mes4: TComboBox
              Left = 639
              Top = 21
              Width = 86
              Height = 19
              Style = csOwnerDrawFixed
              CharCase = ecUpperCase
              Color = 8454143
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ItemIndex = 0
              ParentFont = False
              TabOrder = 6
              Text = 'NAO USAR'
              Items.Strings = (
                'NAO USAR'
                'JAN'
                'FEV'
                'MAR'
                'ABR'
                'MAI'
                'JUN'
                'JUL'
                'AGO'
                'SET'
                'OUT'
                'NOV'
                'DEZ')
            end
            object ME_Ano4: TMaskEdit
              Left = 737
              Top = 21
              Width = 36
              Height = 19
              EditMask = '!2\000;1;_'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 4
              ParentFont = False
              TabOrder = 7
              Text = '20  '
            end
            object CB_Mes5: TComboBox
              Left = 840
              Top = 21
              Width = 86
              Height = 19
              Style = csOwnerDrawFixed
              CharCase = ecUpperCase
              Color = 8454143
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ItemIndex = 0
              ParentFont = False
              TabOrder = 8
              Text = 'NAO USAR'
              Items.Strings = (
                'NAO USAR'
                'JAN'
                'FEV'
                'MAR'
                'ABR'
                'MAI'
                'JUN'
                'JUL'
                'AGO'
                'SET'
                'OUT'
                'NOV'
                'DEZ')
            end
            object ME_Ano5: TMaskEdit
              Left = 939
              Top = 21
              Width = 38
              Height = 19
              EditMask = '!2\000;1;_'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 4
              ParentFont = False
              TabOrder = 9
              Text = '20  '
            end
          end
        end
      end
    end
    object Ts_OCGeraOrdemCompra: TTabSheet
      Caption = 'Analisa Produtos'
      ImageIndex = 1
      object Panel33: TPanel
        Left = 0
        Top = 0
        Width = 1079
        Height = 53
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Gb_GeraOCFornecedor: TGroupBox
          Left = 239
          Top = 2
          Width = 442
          Height = 49
          Align = alLeft
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Fornecedor do Produto Selecionado '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object Dbe_GeraOCDescItem: TDBEdit
            Left = 13
            Top = 20
            Width = 406
            Height = 19
            TabStop = False
            Color = 8454143
            DataField = 'DES_FORNECEDOR'
            DataSource = DMOCLinx.DS_AComprar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Gb_GeraOCDocto: TGroupBox
          Left = 2
          Top = 2
          Width = 237
          Height = 49
          Align = alLeft
          Caption = ' N'#186' do Pedido '
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          DesignSize = (
            237
            49)
          object EdtGeraOCBuscaDocto: TCurrencyEdit
            Left = 8
            Top = 18
            Width = 56
            Height = 21
            AutoSize = False
            DecimalPlaces = 0
            DisplayFormat = '0,'
            TabOrder = 0
            OnChange = EdtGeraOCBuscaDoctoChange
            OnEnter = EdtGeraOCBuscaDoctoEnter
            OnExit = EdtGeraOCBuscaDoctoExit
          end
          object DtEdt_GeraOCDataDocto: TDateEdit
            Left = 68
            Top = 18
            Width = 96
            Height = 21
            DialogTitle = 'Selecione a Data do Docto'
            NumGlyphs = 2
            TabOrder = 1
            OnChange = EdtGeraOCBuscaDoctoChange
          end
          object Bt_GeraOCBuscaDocto: TJvXPButton
            Tag = 92
            Left = 169
            Top = 13
            Width = 28
            Height = 29
            Hint = 'Localizar Docto'
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
            Anchors = [akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = Bt_GeraOCBuscaDoctoClick
          end
          object Bt_GeraOCExcluir: TJvXPButton
            Tag = 3
            Left = 201
            Top = 13
            Width = 28
            Height = 29
            Hint = 'Excluir Docto'
            TabOrder = 3
            TabStop = False
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
            Anchors = [akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = Bt_GeraOCExcluirClick
          end
        end
        object Gb_GeraOCCalculaCompra: TGroupBox
          Left = 845
          Top = 2
          Width = 232
          Height = 49
          Align = alRight
          Caption = ' Calcular Necessidade de Compra '
          Color = 14737632
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 1
          object Label48: TLabel
            Left = 58
            Top = 23
            Width = 59
            Height = 13
            Caption = 'Dias '#218'teis'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdtGeraOCDias: TJvValidateEdit
            Left = 15
            Top = 20
            Width = 39
            Height = 19
            Color = 14737632
            CriticalPoints.MaxValueIncluded = False
            CriticalPoints.MinValueIncluded = False
            EditText = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object Bt_GeraOCCalcular: TJvXPButton
            Left = 129
            Top = 17
            Width = 88
            Height = 25
            Caption = 'Calcular'
            TabOrder = 1
            Glyph.Data = {
              07544269746D6170AA030000424DAA0300000000000036000000280000001100
              000011000000010018000000000074030000C30E0000C30E0000000000000000
              0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000
              000000BFBFBF000000000000BFBFBF00000000000000BFBFBFBFBFBFBFBFBFBF
              BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000000000BFBFBF000000000000
              BFBFBF00000000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
              BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBF
              BFBFBFBFBFBFBF7F7F7F000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
              BFBF0000007F7F7FBFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBF0000000000
              7F000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFF000000BFBFBFBF
              BFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBF00000000007F000000BFBFBFBFBF
              BFBFBFBF000000FFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBFBF
              BFBFBFBFBFBFBFBFBF00000000007F000000BFBFBF000000FFFFFF000000BFBF
              BFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
              00000000007F000000FFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
              BF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00000000007F000000
              BFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBF
              BFBFBFBFBFBFBFBF000000FFFFFF00000000007F000000BFBFBFBFBFBF000000
              007F7F000000BFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFF00
              0000BFBFBF00000000007F000000000000000000007F7F007F7F00000000BFBF
              BF000000000000000000000000FFFFFF000000BFBFBFBFBFBFBFBFBF00000000
              0000007F7F007F7F000000000000BFBFBF00BFBFBF0000000000000000000000
              00000000BFBFBFBFBFBFBFBFBFBFBFBF000000007F7F007F7F007F7F000000BF
              BFBFBFBFBF00BFBFBF0000007F7F7F7F7F7F000000000000BFBFBFBFBFBFBFBF
              BF000000000000007F7F007F7F007F7F000000BFBFBFBFBFBF00BFBFBFBFBFBF
              BFBFBF7F7F7F000000000000BFBFBF000000000000007F7F007F7F0000000000
              00000000BFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBF000000000000000000
              BFBFBFBFBFBF000000000000000000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBF
              BF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
              BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00}
            ShowFocusRect = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = Bt_GeraOCCalcularClick
          end
        end
        object Gb_GeraOCTotPedido: TGroupBox
          Left = 681
          Top = 2
          Width = 151
          Height = 49
          Align = alLeft
          Caption = ' Valor Total do Pedido '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object EdtGeraOCTotalGeral: TCurrencyEdit
            Left = 14
            Top = 18
            Width = 126
            Height = 29
            AutoSize = False
            BorderStyle = bsNone
            Color = clBtnFace
            DisplayFormat = ',0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
      object PC_GeraOCApresentacao: TPageControl
        Left = 0
        Top = 53
        Width = 1079
        Height = 451
        ActivePage = Ts_GeraOCGrid
        Align = alClient
        MultiLine = True
        TabOrder = 1
        TabStop = False
        OnChange = PC_GeraOCApresentacaoChange
        object Ts_GeraOCGrid: TTabSheet
          Caption = ' Produtos '
          Highlighted = True
          object Dbg_GeraOCGrid: TDBGridJul
            Left = 320
            Top = 0
            Width = 751
            Height = 403
            Align = alClient
            DataSource = DMOCLinx.DS_AComprar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            OnColumnMoved = Dbg_GeraOCGridColumnMoved
            OnDrawColumnCell = Dbg_GeraOCGridDrawColumnCell
            OnEnter = Dbg_GeraOCGridEnter
            OnExit = Dbg_GeraOCGridExit
            OnKeyDown = Dbg_GeraOCGridKeyDown
            CorComFoco = clWindow
            SairComEnter = False
            Columns = <
              item
                Alignment = taCenter
                Color = 14211288
                Expanded = False
                FieldName = 'UNI_COMPRA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold, fsItalic]
                ReadOnly = True
                Title.Alignment = taCenter
                Width = 24
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CLA_CURVA_ABC'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ReadOnly = True
                Title.Alignment = taCenter
                Width = 30
                Visible = True
              end
              item
                Color = clYellow
                Expanded = False
                FieldName = 'EST_MINIMO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ReadOnly = True
                Title.Alignment = taRightJustify
                Title.Caption = 'Est M'#237'n'
                Width = 52
                Visible = True
              end
              item
                Color = 15400959
                Expanded = False
                FieldName = 'QTD_SUGERIDA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ReadOnly = True
                Title.Alignment = taRightJustify
                Title.Caption = 'Sugest'#227'o'
                Width = 60
                Visible = True
              end
              item
                Color = clYellow
                Expanded = False
                FieldName = 'QTD_ACOMPRAR'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Title.Alignment = taRightJustify
                Title.Caption = 'AComprar'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlue
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 66
                Visible = True
              end
              item
                Color = 8454143
                Expanded = False
                FieldName = 'QTD_SALDO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ReadOnly = True
                Title.Alignment = taRightJustify
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTD_DIAS_ANO'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Title.Caption = 'Dias Est'
                Width = 60
                Visible = True
              end
              item
                Color = 14548957
                Expanded = False
                FieldName = 'VLR_TOT_COMPRA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ReadOnly = True
                Title.Alignment = taRightJustify
                Title.Caption = '$ Tot Ped'
                Width = 66
                Visible = True
              end
              item
                Color = 15138790
                Expanded = False
                FieldName = 'QTD_TRANSF'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'VLR_UNI_COMPRA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ReadOnly = True
                Title.Alignment = taRightJustify
                Title.Caption = '$ Unt Comp'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VLR_IPI'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Title.Caption = '$ IPI'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VLR_ST'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Title.Caption = '$ ST'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTD_ULT_COMPRA'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Title.Caption = 'Q Ult Entr'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VLR_UNI_ULT_COMPRA'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Title.Caption = 'Unt Ult Entr'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DTA_ULT_COMPRA'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = 'Ult Entrada'
                Width = 66
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COD_FOR_ULT_COMPRA'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'QTD_DEM_MES1'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTD_DEM_MES2'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTD_DEM_MES3'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTD_DEM_MES4'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTD_DEM_MES5'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTD_DEM_MES6'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTD_DEM_MES7'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTD_DEM_MES8'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTD_MEDIA_DIA'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Title.Caption = 'Qt '#215' Dia'
                Width = 58
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTD_MEDIA_MES'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Title.Caption = 'Qt '#215' M'#234's'
                Width = 58
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PER_DESCONTO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ReadOnly = True
                Title.Alignment = taRightJustify
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VLR_DESCONTOS'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Title.Caption = '$ Desc'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTD_TRANSITO'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Color = 8454143
                Expanded = False
                FieldName = 'QTD_DISPONIVEL'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'DIAS_ESTOCAGEM'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Title.Caption = 'DD Est'
                Width = 50
                Visible = True
              end
              item
                Color = 15400959
                Expanded = False
                FieldName = 'QTD_SUGERIDA_ANO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'IND_QTD_ACIMA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'QTD_DEMANDA_ANO'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Title.Caption = 'Qtd Dem ANO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'QTD_DEMANDA_DIA'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Title.Caption = 'Dem Dia'
                Width = 56
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DES_FOR_ULT_COMPRA'
                ReadOnly = True
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'VLR_TOT_ULT_COMPRA'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'UNI_VENDA'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'COD_BARRAS'
                ReadOnly = True
                Title.Alignment = taCenter
                Width = 82
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COD_GRUPO'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'DES_GRUPO'
                ReadOnly = True
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'COD_SUBGRUPO'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'DES_SUBGRUPO'
                ReadOnly = True
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'DES_GENERICO'
                ReadOnly = True
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'COD_APLICACAO'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'DES_APLICACAO'
                ReadOnly = True
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'COD_REFERENCIA'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'COD_FAMILIA_PRECO'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'DES_FAMILIA_PRECO'
                ReadOnly = True
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'DTA_ULT_VENDA'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'COD_CLI_ULT_VENDA'
                ReadOnly = True
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'DES_CLI_ULT_VENDA'
                ReadOnly = True
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'QTD_ULT_VENDA'
                ReadOnly = True
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'VLR_UNI_ULT_VENDA'
                ReadOnly = True
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'VLR_TOT_ULT_VENDA'
                ReadOnly = True
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'VLR_UNI_VENDA'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'COD_LISTA_VENDA'
                ReadOnly = True
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'DES_LISTA_VENDA'
                ReadOnly = True
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'COD_LISTA_COMPRA'
                ReadOnly = True
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'DES_LISTA_COMPRA'
                ReadOnly = True
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'VLR_CUSTO_MEDIO'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Title.Caption = '$ CM'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VLR_TOT_VENDA'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'VLR_BRUTO'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'VLR_DESPESAS'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'VLR_FRETE'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'IND_SOMA_IPI_BASE_ICMS'
                ReadOnly = True
                Title.Alignment = taCenter
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'IND_SOMA_FRETE_BASE_ICMS'
                ReadOnly = True
                Title.Alignment = taCenter
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'IND_SOMA_DESPESA_BASE_ICMS'
                ReadOnly = True
                Title.Alignment = taCenter
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'IND_SOMA_IPI_BASE_ST'
                ReadOnly = True
                Title.Alignment = taCenter
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'IND_SOMA_FRETE_BASE_ST'
                ReadOnly = True
                Title.Alignment = taCenter
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'IND_SOMA_DESPESA_BASE_ST'
                ReadOnly = True
                Title.Alignment = taCenter
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'COD_SIT_TRIBUTARIA'
                ReadOnly = True
                Title.Alignment = taCenter
                Visible = False
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'COD_IPI'
                ReadOnly = True
                Title.Alignment = taCenter
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'IND_IPI'
                ReadOnly = True
                Title.Alignment = taCenter
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PER_IPI'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'COD_ICMS'
                ReadOnly = True
                Title.Alignment = taCenter
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PER_REDUCAO_ICMS'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'VLR_REDUCAO_ICMS'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'VLR_BASE_ICMS'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PER_ICMS'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'VLR_ICMS'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'COD_GRUPO_ST'
                ReadOnly = True
                Title.Alignment = taCenter
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'DES_GRUPO_ST'
                ReadOnly = True
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PER_MARGEM_ST'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'IND_ST'
                ReadOnly = True
                Title.Alignment = taCenter
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'VLR_BASE_ST'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PER_ST'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PER_REPASSE'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'VLR_REPASSE'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'COD_COMPROVANTE_ICMS'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'COD_FORNECEDOR'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Title.Caption = 'C'#243'd Forn'
                Width = 56
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DES_FORNECEDOR'
                ReadOnly = True
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIP_PESSOA'
                ReadOnly = True
                Title.Alignment = taCenter
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'DES_EMAIL'
                ReadOnly = True
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'NUM_OC_GERADA'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Width = 48
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DTA_OC_GERADA'
                ReadOnly = True
                Title.Alignment = taCenter
                Width = 110
                Visible = True
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'QTD_NR_DIAS'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'QTD_NR_MESES'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'QTD_TOT_MESES'
                ReadOnly = True
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'OBS_OC'
                ReadOnly = True
                Visible = False
              end>
          end
          object Dbg_GeraOCGridProd: TDBGrid
            Left = 0
            Top = 0
            Width = 320
            Height = 403
            Align = alLeft
            DataSource = DMOCLinx.DS_AComprar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
            ParentFont = False
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            OnEnter = Dbg_GeraOCGridProdEnter
            OnExit = Dbg_GeraOCGridProdExit
            OnKeyDown = Dbg_GeraOCGridKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'COD_ITEM'
                Visible = True
              end
              item
                Color = 16053492
                Expanded = False
                FieldName = 'DES_ITEM'
                Width = 250
                Visible = True
              end>
          end
          object Sb_GeraOC: TdxStatusBar
            Left = 0
            Top = 403
            Width = 1071
            Height = 20
            Panels = <
              item
                PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
                PanelStyle.Alignment = taCenter
                PanelStyle.Color = 13303807
                Fixed = False
                Text = '<F4> Localiza Produto'
                Width = 100
              end>
            PaintStyle = stpsOffice11
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Color = 13303807
          end
        end
        object Ts_GeraOCOrdensCompra: TTabSheet
          Caption = ' Pedidos e OCs Geradas '
          ImageIndex = 1
          object Panel35: TPanel
            Left = 0
            Top = 0
            Width = 1071
            Height = 44
            Align = alTop
            BevelInner = bvLowered
            BevelWidth = 2
            Color = 13816530
            TabOrder = 0
            object Lab_ItensOC: TLabel
              Left = 18
              Top = 15
              Width = 84
              Height = 13
              Caption = 'Total de Produtos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Lab_Qtds_OC: TLabel
              Left = 184
              Top = 15
              Width = 64
              Height = 13
              Caption = 'Total de Qtds'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object DbeGeraOCTotalProdutos: TDBEdit
              Left = 107
              Top = 12
              Width = 68
              Height = 19
              Color = clBtnFace
              DataField = 'TOTAL_ITENS'
              DataSource = DMOCLinx.DS_AComprarOCs
              TabOrder = 0
            end
            object DbeGeraOCQtdOCs: TDBEdit
              Left = 256
              Top = 12
              Width = 76
              Height = 19
              Color = clBtnFace
              DataField = 'TOTAL_QTD'
              DataSource = DMOCLinx.DS_AComprarOCs
              TabOrder = 1
            end
            object Bt_GeraOCImpEditOC: TJvXPButton
              Tag = 4
              Left = 935
              Top = 4
              Width = 132
              Height = 36
              Caption = 'Imprimir'
              TabOrder = 2
              Glyph.Data = {
                07544269746D617046090000424D460900000000000036040000280000002100
                0000240000000100080000000000100500000000000000000000000100000000
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
                FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFEDECA39B9B9B9B9B
                9B9B9B9B9B9BFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFEDFFFFFF
                FFFFFFFFFFFFFFFFFF9BFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
                EDFFEDA4A4A4A4A4A4A4A4A4FF9BFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
                FFFFFFFFEDFFEDF6FF09E3EC09E3E2A4FF9BFFFFFFFFFFFFFFFFFF000000FFFF
                FFFFFFFFFFFFFFFFEDFFEDE3FFFFE3E3FFE209A4FF9BFFFFFFFFFFFFFFFFFF00
                0000FFFFFFFFFFFFFFFFFFFFEDFFED09ECE30909E20909A4FF9BFFFFFFFFFFFF
                FFFFFF000000FFFFFFFFA49B9B9B5252EDFFED0909090909090909A4FF9B5252
                9B9B9B9BADFFFF000000FFFFFFA4F7F7F7A45252EDFFED0909090909AF0909A4
                FFA35252A4F7F7A49BFFFF000000FFFFFFF7F7F7F7F75252F7F6F709090909A7
                F6A709A3F6A35252A4F7F7F79BFFFF000000FFFFFFA4A4A4A4A4A4A4A4A4A4A4
                A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A49BFFFF000000FFFFFFA407070707A4F7
                F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7A4070707079BFFFF000000FFFFFFA40707
                0707A4F7F7F7F7F7F7F7F7F7F7F7EBEBEBEBF7A4070707079BFFFF000000FFFF
                FFA407070707A4F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7A4070707079BFFFF00
                0000FFFFFFF7F6F6F6F6F708080808080808080808080808080808F7F6F6F6F6
                9BFFFF000000FFFFFFF7F60707F6A407070707070707070707070707070707A4
                F607F7089BFFFF000000FFFFFFF7F6F6F6F6A407070707070707070707070707
                070707A4F60808089BFFFF000000FFFFFFF7FFF6F6F6A4070707070707070707
                07070707070707A4F607F7089BFFFF000000FFFFFFF7FFF6F6F6A40707070707
                0707070707070707070707A4F6F6F6F69BFFFF000000FFFFFFF7FFFFFFFFAC08
                080808080808080808080808080808A4F607F7F69BFFFF000000FFFFFFF7FFFF
                FFFFAC08080808080808080808080808080808A4F6F6F6F69BFFFF000000FFFF
                FFB7F7F7F7F7F7F7F7F7F7F7A4A4A4A4A4A4A4A4A4A4A4A4F7A5A4A4B6FFFF00
                0000FFFFFFFFFFFFFFFFA59BEDFFFFFFFFFFFFFFFFFFFFFFFF9B9BA4FFFFFFFF
                FFFFFF000000FFFFFFFFFFFFFFFFAD5BEDFFFFFFFFFFFFFFFFFFFFFFFF9B5BA5
                FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF5BEDFFFFFFFFFFFFFFFFFFFFFF
                FF9B5BFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF9BEDFFFFFFFFFFFFFF
                FFFFFFFFFF9B9BFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFEDFFFFFF
                FFFFFFFFFFFFFFFFFF9BFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
                EDFFFFFFFFFFFFFFFFFFFFFFFF9BFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
                FFFFFFFFEDFFFFFFFFFFFFFFFFFFFFFFFFA3FFFFFFFFFFFFFFFFFF000000FFFF
                FFFFFFFFFFFFFFFFEDEDEDEDEDEDEDEDEDEDEDECECECFFFFFFFFFFFFFFFFFF00
                0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
              ShowFocusRect = True
              Align = alRight
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = Bt_GeraOCImpEditOCClick
            end
          end
          object Dbg_GeraOCTotalGeral: TDBGridJul
            Left = 0
            Top = 44
            Width = 1071
            Height = 379
            Align = alClient
            Color = 15004403
            DataSource = DMOCLinx.DS_AComprarOCs
            FixedColor = clTeal
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
            ParentFont = False
            ParentShowHint = False
            ReadOnly = True
            ShowHint = False
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWhite
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            OnDrawColumnCell = Dbg_GeraOCTotalGeralDrawColumnCell
            CorComFoco = 15004403
            SairComEnter = False
            EditDataSetCheck = False
            CampoCheckBox = 'GERAR'
            ValorCampoCheck = 'S'
            ValorCampoUnCheck = 'N'
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
                Alignment = taCenter
                Expanded = False
                FieldName = 'TIPO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Alignment = taCenter
                Width = 30
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'GERAR'
                ReadOnly = False
                Title.Alignment = taCenter
                Title.Caption = 'Gerar'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'COD_EMP_FIL'
                Title.Alignment = taCenter
                Visible = False
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'COD_LINX'
                Title.Alignment = taCenter
                Width = 40
                Visible = True
              end
              item
                Color = 14548991
                Expanded = False
                FieldName = 'DES_EMP_FIL'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ReadOnly = False
                Width = 230
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FORNECEDOR'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ReadOnly = False
                Width = 300
                Visible = True
              end
              item
                Color = 12910591
                Expanded = False
                FieldName = 'TOTAL_OC'
                ReadOnly = False
                Title.Alignment = taRightJustify
                Title.Caption = 'Vlr Total'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NUM_OC_GERADA'
                Title.Alignment = taRightJustify
                Title.Caption = 'N'#186' OC'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DTA_OC_GERADA'
                ReadOnly = False
                Title.Alignment = taCenter
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL_BRUTO'
                ReadOnly = False
                Title.Alignment = taRightJustify
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL_DESCONTOS'
                ReadOnly = False
                Title.Alignment = taRightJustify
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL_IPI'
                ReadOnly = False
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'TOTAL_DESPESAS'
                ReadOnly = False
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'TOTAL_ST'
                ReadOnly = False
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'TOTAL_FRETE'
                ReadOnly = False
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'TOTAL_ICMS'
                ReadOnly = False
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'TOTAL_REPASSE'
                ReadOnly = False
                Title.Alignment = taRightJustify
                Visible = False
              end
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'COD_COMPROVANTE_ICMS'
                ReadOnly = False
                Title.Alignment = taCenter
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'SITUACAO'
                Title.Alignment = taCenter
                Width = 120
                Visible = True
              end>
          end
        end
      end
    end
  end
  object Panel22: TPanel
    Left = 0
    Top = 532
    Width = 1087
    Height = 42
    Align = alBottom
    BevelInner = bvLowered
    BorderStyle = bsSingle
    TabOrder = 1
    object Bt_OCFechar: TJvXPButton
      Tag = 99
      Left = 983
      Top = 2
      Width = 100
      Height = 36
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
      OnClick = Bt_OCFecharClick
    end
    object Bt_OCBuscaProdutos: TJvXPButton
      Tag = 93
      Left = 2
      Top = 2
      Width = 171
      Height = 36
      Caption = ' Montar Pedido'#13#10'de Compra Linx  '
      TabOrder = 0
      Glyph.Data = {
        0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000039
        000000220806000000E50971DD000000017352474200AECE1CE9000000046741
        4D410000B18F0BFC6105000000097048597300000EBC00000EBC0195BC724900
        00029A494441545847ED973D68154110C70FACEC04C1AF424408A8043F083162
        E107BC8844C432898D10448C365ABFC628044C63F0055324606761611A8B94B1
        B2D3C6DAC2562C532429C6FDEFBBD99B9BDBBB7797B74AF6E90FA6988FCCE4CF
        ECDEDD4BE81FE0BFC84161A044AE8D3EA54FD71EA75EC6606DF2C231A22B0769
        E6CC721AE8321022216AF3668BB66F5CA485F3F36934237A91F3AD37F4637A96
        E8EAF1C2069928453E3CB564057D6BDD239A1EA79DCB27ADC8D9E1A5B4224F54
        22EF9F784D0F863A56CCC694D9DEEDA3441367ADC0CF2333695591A844DA4DAD
        9B7FF983B14707EC430677B0EC98325189C4315D9D7A42BFDE0D759FA4668BBD
        0482A84402FB1E341BC411A5BBE7E86767949E5F7F9166FD4425D26E0D1B8440
        D8E421A24E6285E2BE961195C8F6C862B64518EEE5CB7D446F135AB8F52CAD2A
        12D7719502F1646591669BF43EA1C923AB69619E2844E298AE8CCD65027D22CD
        3621F46BFB8E7D4049A210F9FDD284DD223EDB9C40DCC7F6FEBC48BC5A8CE18E
        E24B08EF54B0A745E2BD681F36E931CD89C4168DC8CD5787AD59811F33FB3237
        DEBDC306273249126765D4A90905C4E1A713046E8D9D763FA1CA3EDD2478D2B2
        815D8BACAA0B053681CFB53A5F3555341209FE96400061FD88631A89F4D5C858
        993165715095EB17D7ADCE005F8D8C5599AF565295EB17D7ADCE005D23FD5EC6
        F86240C675AE5F5CB73A03748DF439C634CD693F24AE639D21BA46FA1C639AE4
        B485C675AC3344D7685F2273BAC69763FB13B8AE7506E91AED6B645ED7E89CCE
        87C475F60DD4837D79E96B645ED66C6FED1472D242E33AFA86B1313AA67D8DCC
        738D8EF92C34B98EBE816C3AEFF33532CF35BE18288B87A0D04D0F63D3399FAF
        F1E59BD687C0DB4D0ED3037BF91A5F7DD5DFF4CAEF86B0DDF62444BF01C16021
        28EF3C44D00000000049454E44AE426082}
      ShowFocusRect = True
      Spacing = 10
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_OCBuscaProdutosClick
    end
    object Pan_TotalProdutos: TPanel
      Left = 792
      Top = 2
      Width = 137
      Height = 36
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 2
      object Label70: TLabel
        Left = 13
        Top = 13
        Width = 42
        Height = 13
        Caption = 'Produtos'
      end
      object Edt_OCTotProdutos: TCurrencyEdit
        Left = 67
        Top = 10
        Width = 58
        Height = 20
        AutoSize = False
        Color = clBtnFace
        DecimalPlaces = 0
        DisplayFormat = ',0'
        ReadOnly = True
        TabOrder = 0
      end
    end
    object Panel1: TPanel
      Left = 929
      Top = 2
      Width = 54
      Height = 36
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 3
    end
    object Bt_OCFechaPedido: TJvXPButton
      Left = 173
      Top = 2
      Width = 144
      Height = 36
      Caption = 'FECHAR Pedido'
      TabOrder = 4
      Glyph.Data = {
        07544269746D617026040000424D260400000000000036000000280000001200
        0000120000000100180000000000F0030000C30E0000C30E0000000000000000
        0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBF0000000000000000000000000000000000000000
        00000000000000000000000000BFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF000000BFBFBF0000BFBFBF000000000000BFBFBF00000000000000000000
        0000000000000000FFFFFFFFFFFF000000000000000000FFFFFF000000BFBFBF
        0000BFBFBFFFFF00000000000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBF0000BFBFBFFFFF00
        000000FFFFFF00FFFFFFFFFF00FFFF000000000000000000000000000000FFFF
        FFFFFFFF000000FFFFFF000000BFBFBF0000BFBFBFFFFF0000000000FFFFFFFF
        FF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF000000FFFFFFFFFFFFFF
        FFFF000000BFBFBF0000BFBFBFFFFF00000000FFFFFF00FFFFFFFFFF00FFFF00
        0000000000000000000000000000FFFFFFFFFFFF000000FFFFFF000000BFBFBF
        0000BFBFBFFFFF0000000000FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF
        FFFFFF00FFFF000000FFFFFFFFFFFFFFFFFF000000BFBFBF0000BFBFBFFFFF00
        000000FFFFFF00FFFF000000000000000000000000000000000000000000FFFF
        FFFFFFFF000000FFFFFF000000BFBFBF0000BFBFBF000000000000000000FFFF
        FF00FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF000000BFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBF000000000000000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBF
        0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFF000000000000
        000000FFFFFFFFFFFF000000000000000000000000BFBFBF0000BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF000000FFFFFFFFFFFF000000BFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBF000000FF0000FF0000FF0000FF0000FF0000FF0000000000FFFFFF00
        0000BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000BFBFBFBFBFBFBFBFBF
        0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000000000000000000000
        000000000000000000000000BFBFBFBFBFBFBFBFBFBFBFBF0000BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000}
      ShowFocusRect = True
      Spacing = 6
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_OCFechaPedidoClick
    end
  end
  object OdirPanApres: TPanel
    Left = 928
    Top = 364
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
    FormCaption = '  PEDIDO DE COMPRA - LINX'
    FontInactiveColor = 16777170
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clCaptionText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    StartColor = 15522303
    EndColor = 8388863
    Left = 816
    Top = 368
  end
  object ApplicationEvents1: TApplicationEvents
    OnMessage = ApplicationEvents1Message
    Left = 700
    Top = 359
  end
  object Trad_Localizer: TcxLocalizer
    Left = 784
    Top = 312
  end
end
