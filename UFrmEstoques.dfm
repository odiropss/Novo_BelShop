object FrmEstoques: TFrmEstoques
  Left = 238
  Top = 104
  Align = alClient
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Controle de Estoques'
  ClientHeight = 577
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
  object PC_EstoquesPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 977
    Height = 577
    ActivePage = Ts_Estoques
    Align = alClient
    TabOrder = 0
    OnChange = PC_EstoquesPrincipalChange
    object Ts_Estoques: TTabSheet
      Caption = ' Estoques '
      Highlighted = True
      object Dbg_Estoques: TDBGrid
        Left = 0
        Top = 55
        Width = 969
        Height = 439
        Align = alClient
        Color = 15004403
        Ctl3D = False
        DataSource = DMVirtual.DS_V_Estoques
        FixedColor = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        PopupMenu = PopM_Estoques
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnColEnter = Dbg_EstoquesColEnter
        OnColumnMoved = Dbg_EstoquesColumnMoved
        OnDrawDataCell = Dbg_EstoquesDrawDataCell
        OnDrawColumnCell = Dbg_EstoquesDrawColumnCell
        OnEnter = Dbg_EstoquesEnter
        OnExit = Dbg_EstoquesExit
        OnKeyDown = Dbg_EstoquesKeyDown
        OnKeyPress = Dbg_EstoquesKeyPress
        OnKeyUp = Dbg_EstoquesKeyUp
        OnTitleClick = Dbg_EstoquesTitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'NUM_LINHA'
            Title.Alignment = taCenter
            Width = 50
            Visible = True
          end
          item
            Alignment = taRightJustify
            Color = 14024703
            Expanded = False
            FieldName = 'COD_PRODUTO'
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
            Color = 14024703
            Expanded = False
            FieldName = 'DES_PRODUTO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ReadOnly = True
            Width = 350
            Visible = True
          end
          item
            Color = 14876633
            Expanded = False
            FieldName = 'IND_CURVA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ReadOnly = True
            Title.Alignment = taCenter
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_DEMANDAS'
            ReadOnly = True
            Title.Alignment = taRightJustify
            Title.Caption = 'Vendas Per'#237'odo'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_VENDAS_ACUM'
            ReadOnly = True
            Title.Alignment = taRightJustify
            Width = 125
            Visible = True
          end
          item
            Color = 15395562
            Expanded = False
            FieldName = 'QTD_DEMANDA'
            ReadOnly = True
            Title.Alignment = taRightJustify
            Title.Caption = 'Qtd Venda/Dias Est'
            Width = 125
            Visible = True
          end
          item
            Color = 15395562
            Expanded = False
            FieldName = 'PER_PARTICIPACAO'
            ReadOnly = True
            Title.Alignment = taRightJustify
            Width = 92
            Visible = True
          end
          item
            Color = 15400917
            Expanded = False
            FieldName = 'QTD_ESTOQUE'
            ReadOnly = True
            Title.Alignment = taRightJustify
            Width = 60
            Visible = True
          end
          item
            Color = 13434828
            Expanded = False
            FieldName = 'QTD_TRANSITO'
            ReadOnly = True
            Title.Alignment = taRightJustify
            Width = 60
            Visible = True
          end
          item
            Color = 15400917
            Expanded = False
            FieldName = 'QTD_DISPONIVEL'
            ReadOnly = True
            Title.Alignment = taRightJustify
            Width = 80
            Visible = True
          end
          item
            Color = 15269887
            Expanded = False
            FieldName = 'EST_IDEAL'
            ReadOnly = True
            Title.Alignment = taRightJustify
            Width = 80
            Visible = True
          end
          item
            Color = 15269887
            Expanded = False
            FieldName = 'EST_MAXIMO'
            ReadOnly = True
            Title.Alignment = taRightJustify
            Width = 90
            Visible = True
          end
          item
            Color = 15395541
            Expanded = False
            FieldName = 'VLR_PC_VENDA'
            ReadOnly = True
            Title.Alignment = taRightJustify
            Width = 80
            Visible = True
          end
          item
            Color = 15395541
            Expanded = False
            FieldName = 'VLR_TOTAL_VENDA'
            ReadOnly = True
            Title.Alignment = taRightJustify
            Width = 130
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DTA_INCLUSAO'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Inclus'#227'o'
            Width = 80
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'CODGRUPO'
            ReadOnly = True
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMEGRUPO'
            ReadOnly = True
            Width = 180
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODSUBGRUPO'
            ReadOnly = True
            Title.Alignment = taRightJustify
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMESUBGRUPO'
            ReadOnly = True
            Width = 180
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'IND_SITUACAO'
            ReadOnly = True
            Title.Alignment = taCenter
            Width = 100
            Visible = True
          end
          item
            Color = 14024703
            Expanded = False
            FieldName = 'COD_FORNECEDOR'
            ReadOnly = True
            Title.Alignment = taRightJustify
            Width = 60
            Visible = True
          end
          item
            Color = 14024703
            Expanded = False
            FieldName = 'DES_FORNECEDOR'
            ReadOnly = True
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_DIASUTEIS'
            Title.Alignment = taRightJustify
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SEQ'
            ReadOnly = True
            Title.Alignment = taRightJustify
            Title.Caption = 'Sequencia'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ORDENAR'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NUM_LINHA'
            Title.Caption = 'num_linha'
            Visible = False
          end>
      end
      object Pan_Estoques: TPanel
        Left = 0
        Top = 0
        Width = 969
        Height = 55
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Gb_EstoquesLimiteCurvaA: TGroupBox
          Left = 5
          Top = 4
          Width = 78
          Height = 48
          Caption = ' Curva  A '
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          object Label81: TLabel
            Left = 56
            Top = 19
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
          object EdtEstoquesLimiteCurvaA: TCurrencyEdit
            Left = 12
            Top = 19
            Width = 40
            Height = 21
            AutoSize = False
            Color = 14737632
            DecimalPlaces = 0
            DisplayFormat = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 2
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Gb_EstoquesLimiteCurvaB: TGroupBox
          Left = 84
          Top = 4
          Width = 78
          Height = 48
          Caption = ' Curva  B '
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 1
          object Label82: TLabel
            Left = 56
            Top = 19
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
          object EdtEstoquesLimiteCurvaB: TCurrencyEdit
            Left = 12
            Top = 19
            Width = 40
            Height = 21
            AutoSize = False
            Color = 14737632
            DecimalPlaces = 0
            DisplayFormat = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 2
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Gb_EstoquesLimiteCurvaC: TGroupBox
          Left = 163
          Top = 4
          Width = 78
          Height = 48
          Caption = 'Curva  C '
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 2
          object Label83: TLabel
            Left = 56
            Top = 19
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
          object EdtEstoquesLimiteCurvaC: TCurrencyEdit
            Left = 12
            Top = 19
            Width = 40
            Height = 21
            AutoSize = False
            Color = 14737632
            DecimalPlaces = 0
            DisplayFormat = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 2
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Gb_EstoquesTransito: TGroupBox
          Left = 555
          Top = 4
          Width = 168
          Height = 48
          Caption = ' Transito - Data Limite '
          Color = 14342874
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 6
          Visible = False
          object DtEdt_EstoquesTransito: TcxDateEdit
            Left = 57
            Top = 16
            ParentFont = False
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
            Width = 100
          end
          object CkB_EstoquesTransito: TJvCheckBox
            Left = 8
            Top = 21
            Width = 44
            Height = 17
            Caption = 'SIM'
            Checked = True
            State = cbChecked
            TabOrder = 1
            OnClick = CkB_EstoquesTransitoClick
            OnMouseUp = CkB_EstoquesTransitoMouseUp
            LinkedControls = <>
            HotTrackFont.Charset = DEFAULT_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'MS Sans Serif'
            HotTrackFont.Style = []
          end
        end
        object Gb_EstoquesPeriodo: TGroupBox
          Left = 724
          Top = 4
          Width = 241
          Height = 48
          Caption = ' Per'#237'odo de Analise '
          Color = 14342874
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 7
          Visible = False
          object Label85: TLabel
            Left = 114
            Top = 23
            Width = 8
            Height = 13
            Caption = 'a'
          end
          object DtEdt_EstoquesInicio: TcxDateEdit
            Left = 9
            Top = 17
            ParentFont = False
            Style.Color = 14737632
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlue
            Style.Font.Height = -13
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            StyleFocused.BorderStyle = ebsOffice11
            StyleFocused.TextStyle = [fsBold]
            StyleHot.BorderStyle = ebsUltraFlat
            TabOrder = 0
            Width = 100
          end
          object DtEdt_EstoquesFim: TcxDateEdit
            Left = 130
            Top = 17
            ParentFont = False
            Style.Color = 14737632
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlue
            Style.Font.Height = -13
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            StyleFocused.BorderStyle = ebsOffice11
            StyleFocused.TextStyle = [fsBold]
            StyleHot.BorderStyle = ebsUltraFlat
            TabOrder = 1
            Width = 100
          end
        end
        object Gb_EstoquesLimiteCurvaD: TGroupBox
          Left = 242
          Top = 4
          Width = 78
          Height = 48
          Caption = 'Curva  D '
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 3
          object Label187: TLabel
            Left = 56
            Top = 19
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
          object EdtEstoquesLimiteCurvaD: TCurrencyEdit
            Left = 12
            Top = 19
            Width = 40
            Height = 21
            AutoSize = False
            Color = 14737632
            DecimalPlaces = 0
            DisplayFormat = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 2
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Gb_EstoquesLimiteCurvaE: TGroupBox
          Left = 321
          Top = 4
          Width = 78
          Height = 48
          Caption = ' Curva E '
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 4
          object Label189: TLabel
            Left = 56
            Top = 19
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
          object EdtEstoquesLimiteCurvaE: TCurrencyEdit
            Left = 12
            Top = 19
            Width = 40
            Height = 21
            AutoSize = False
            Color = 14737632
            DecimalPlaces = 0
            DisplayFormat = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 2
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Gb_EstoquesSituacaoProd: TGroupBox
          Left = 400
          Top = 4
          Width = 154
          Height = 48
          Caption = ' Situa'#231#227'o Produto '
          Color = 14342874
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 5
          Visible = False
          object Cbx_EstoquesSituacaoProd: TComboBox
            Left = 9
            Top = 18
            Width = 134
            Height = 22
            Style = csOwnerDrawFixed
            Color = 14737632
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemHeight = 16
            ItemIndex = 0
            ParentFont = False
            TabOrder = 0
            Text = 'Ativo'
            Items.Strings = (
              'Ativo'
              'N'#227'o Compra'
              'Ativo/N'#227'o Compra')
          end
        end
      end
      object Panel66: TPanel
        Left = 0
        Top = 514
        Width = 969
        Height = 35
        Align = alBottom
        BevelInner = bvLowered
        BorderStyle = bsSingle
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        object Bt_EstoquesFechar: TJvXPButton
          Left = 878
          Top = 2
          Width = 87
          Height = 29
          Caption = 'Fechar'
          TabOrder = 0
          TabStop = False
          Glyph.Data = {
            07544269746D61700E060000424D0E0600000000000036000000280000001600
            0000160000000100180000000000D8050000C30E0000C30E0000000000000000
            0000FFFFFFF2F2F2F2F2F2D3D3D3E8E8E8F5F5F5DBDBDBDDDDDDECECECEEEEEE
            D3D3D3EBEBEBF7F7F723230F4F4F00B2B2A8E9E9E9D6D6D6EBEBEBFAFAFAFFFF
            FFFFFFFF0000FFFFFFF0F0F0D8D8D8EDEDEDEAEAEADFDFDFDCDCDCF4F4F4E6E6
            E6D7D7D7F2F2F2E7E7E7DDDDDD4C4C0CFFFF006868119B9B9BF4F4F4E7E7E7DB
            DBDBE6E6E6FFFFFF0000D3D3D3E4E4E4EFEFEFE4E4E4D8D8D8EDEDEDF3F3F3D3
            D3D3E7E7E7F1F1F1DFDFDFDBDBDBECECEC4D4D0DFFFF008D8D00515105878781
            DFDFDFEDEDEDECECECD3D3D30000E6E6E6EDEDEDE1E1E1DBDBDBF5F5F5E3E3E3
            DCDCDCEAEAEAEAEAEAE0E0E0DBDBDBF6F6F6E3E3E34D4D0DFFFF008F8F007F7F
            0056560DA1A1A1E2E2E2DBDBDBF3F3F300004B4B4B5050504E4E4E4848484F4F
            4F5050504A4A4A4C4C4C444444F0F0F0F3F3F3D3D3D3E7E7E74E4E0EFFFF008F
            8F007F7F007D7D004C4C0D3232324848484E4E4E0000BFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBF4A4A4ADFDFDFDFDFDFE9E9E9EBEBEB4D4D0D
            FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFB0B0B0BFBFBF4040403F3F3F3737373737373F3F
            3F434303FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF3D3D3D8F8F8F3E3E3E7F7F7F7F7F7F7F
            7F7F7F7F7F474707FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBF
            0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF3C3C304D4D141515137F7F7F
            7F7F7F7F7F7F7F7F7F474707FFFF008D8D007777007D7D00474700636363BFBF
            BFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF4646309A9A004545
            046161617F7F7F7F7F7F7F7F7F474707FFFF005F5F0817171767670047470063
            6363BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF474727ED
            ED0092920045450E6363637F7F7F7F7F7F474707FFFF004747276B6B6B676700
            474700636363BFBFBFBFBFBF0000AEAEAE57574531310A272700272700272700
            424200FFFF00F9F9009898004242006363637F7F7F474707FFFF007E7E002727
            006E6E00474700636363BFBFBFBFBFBF00008989898C8C13CFCF01CFCF00CFCF
            00CFCF00D5D500FFFF00FFFF00EDED0098980045450E616161474707FFFF008F
            8F007F7F007F7F00474700636363BFBFBFBFBFBF0000898989A1A113FEFE2CFF
            FFAFFFFFAFFFFFAFFFFFAFFFFFAFFFFFDBFFFF6DE3E3004B4B095B5B5B474707
            FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBF0000A7A7A76F6F48
            79790C7A7A0A7A7A0A7A7A0A8A8A09FFFF3EFFFF70E4E4005F5F005858587F7F
            7F474707FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBF
            BFB1B1B1A9A9A9A9A9A9A9A9A9A9A9A94C4C2CFFFF0DE6E6075959085858537F
            7F7F7F7F7F474707FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBF
            0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF505030E3E3005F5F03575757
            7F7F7F7F7F7F7F7F7F474707FFFF008F8F007F7F007F7F00474700636363BFBF
            BFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF4242356E6E252121
            1B7F7F7F7F7F7F7F7F7F7F7F7F5E5E52999906D5D5008787007F7F0047470063
            6363BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF70707088
            88884444447F7F7F7F7F7F7F7F7F7F7F7F7F7F7F565656999906DBDB00898900
            474700636363BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBF4444447F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F5E5E529B9B
            03D7D7004C4C00767676BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBF41414156565656565656565656565656565656565656
            56562E2E2E88880765650C888888BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBF969696898989898989898989898989898989
            898989898989898989898989898989B1B1B1BFBFBFBFBFBF0000}
          ShowFocusRect = True
          Align = alRight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_EstoquesFecharClick
        end
        object Bt_EstoquesDemonstrativo: TJvXPButton
          Tag = 1
          Left = 2
          Top = 2
          Width = 164
          Height = 29
          Caption = 'Abrir Demonstrativo'
          TabOrder = 1
          TabStop = False
          Glyph.Data = {
            07544269746D6170AA040000424DAA0400000000000036000000280000001400
            000013000000010018000000000074040000C30E0000C30E0000000000000000
            0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00000000000000000000
            0000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000
            000000000000000000000000BFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBF7F7F
            7F000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F00007F00007F
            00007F0000000000000000BFBFBFFFFFFFFFFFFF000000000000000000000000
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F00007F00007F00007F00
            00000000BFBFBFFFFFFFFFFFFF000000BFBFBF00000000000000000000000000
            0000000000000000000000BFBFBFBFBFBF7F00007F00007F00007F0000000000
            BFBFBFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF000000BFBFBFBFBFBFFF0000FF0000FF0000FF00000000007F7F7F7F
            7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            000000BFBFBFBFBFBF7F00007F00007F00007F0000BFBFBFBFBFBFBFBFBF7F7F
            7FFFFFFF7F00007F00007F00007F00007F00007F0000FFFFFFFFFFFF000000BF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F00007F00007F
            00007F00007F00007F00007F00007F00007F0000000000BFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F00007F0000FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF7F00007F0000000000BFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F00007F00007F00007F00007F0000
            7F00007F00007F00007F0000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBF7F7F7FFFFFFF7F00007F00007F00007F0000FFFFFFFFFFFFFFFF
            FFFFFFFF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F
            7FFFFFFF7F00007F00007F00007F00007F0000FFFFFFFFFFFFFFFFFF000000BF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF}
          ShowFocusRect = True
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_EstoquesDemonstrativoClick
        end
        object Bt_EstoquesFiltros: TJvXPButton
          Tag = 92
          Left = 166
          Top = 2
          Width = 82
          Height = 29
          Caption = 'Filtros'
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
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_EstoquesFiltrosClick
        end
        object Pan_EstoquesProdNovo: TPanel
          Left = 787
          Top = 2
          Width = 91
          Height = 29
          Align = alRight
          BevelInner = bvLowered
          BevelWidth = 2
          Caption = 'Produto Novo'
          Color = clLime
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
      object Dbg_EstoquesDemFinan: TDBGrid
        Left = 221
        Top = 175
        Width = 500
        Height = 137
        DataSource = DMVirtual.DS_V_EstoquesFinan
        FixedColor = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Visible = False
        OnDrawColumnCell = Dbg_EstoquesDemFinanDrawColumnCell
        Columns = <
          item
            Color = clYellow
            Expanded = False
            FieldName = 'IND_CURVA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_ITENS'
            Title.Alignment = taRightJustify
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_ESTOQUE_PV'
            Title.Alignment = taRightJustify
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_DEMANDA_PV'
            Title.Alignment = taRightJustify
            Width = 120
            Visible = True
          end
          item
            Color = clYellow
            Expanded = False
            FieldName = 'PER_NIVELSERVICO'
            Title.Alignment = taRightJustify
            Width = 90
            Visible = True
          end>
      end
      object Stb_Estoques: TdxStatusBar
        Left = 0
        Top = 494
        Width = 969
        Height = 20
        Panels = <
          item
            PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
            PanelStyle.Color = clSilver
            PanelStyle.EllipsisType = dxetTruncate
            PanelStyle.Font.Charset = DEFAULT_CHARSET
            PanelStyle.Font.Color = clWindowText
            PanelStyle.Font.Height = -11
            PanelStyle.Font.Name = 'MS Sans Serif'
            PanelStyle.Font.Style = [fsBold]
            PanelStyle.ParentFont = False
            BiDiMode = bdRightToLeft
            ParentBiDiMode = False
            Text = 'LOJA: '
            Width = 500
          end
          item
            PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
            PanelStyle.Alignment = taCenter
            PanelStyle.Color = clSilver
            PanelStyle.Font.Charset = DEFAULT_CHARSET
            PanelStyle.Font.Color = clWindowText
            PanelStyle.Font.Height = -11
            PanelStyle.Font.Name = 'MS Sans Serif'
            PanelStyle.Font.Style = [fsBold]
            PanelStyle.ParentFont = False
            BiDiMode = bdRightToLeft
            ParentBiDiMode = False
            Text = '<F4> Localiza Produto'
            Width = 180
          end
          item
            PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
            PanelStyle.Alignment = taCenter
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            Text = 'OP'#199#213'ES: No Grid Bot'#227'o Direito do Mouse'
          end>
        PaintStyle = stpsOffice11
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
      end
    end
    object Ts_EstoquesFiltros: TTabSheet
      Caption = ' Filtros '
      Highlighted = True
      ImageIndex = 1
      object Bt_Filtros: TPanel
        Left = 0
        Top = 514
        Width = 969
        Height = 35
        Align = alBottom
        BevelInner = bvLowered
        BorderStyle = bsSingle
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object Bt_FiltrosVoltar: TJvXPButton
          Left = 865
          Top = 2
          Width = 100
          Height = 29
          Caption = 'Voltar'
          TabOrder = 0
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
          Align = alRight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_FiltrosVoltarClick
        end
        object Bt_FiltrosOK: TJvXPButton
          Tag = 2
          Left = 2
          Top = 2
          Width = 100
          Height = 29
          Caption = 'OK'
          TabOrder = 1
          Glyph.Data = {
            07544269746D617002030000424D020300000000000036010000280000001300
            0000170000000100080000000000CC010000C30E0000C30E0000400000000000
            00001C34040024341C00242424001C3C0400243C0C00244404002C5C04003C5C
            240044543C005C5C54005C5C5C00646464006C6C6C0054743C00747474004484
            0400747C74007C7C7C0084848400449404006C8C540054AC0400000000008C8C
            8C008C948C00949494009C9C9C00A4A4A400ACACAC00B4B4B4006CD404006CDC
            040074F404007CFC040084FC0C0084FC14007CDC24008CFC1C008CFC240094FC
            240094EC3C0094FC2C009CFC3C0094D45C009CF44C009CFC4400A4FC4C00A4FC
            5400ACFC6400B4FC6C00B4F47400BCF48400BCFC7C00B4C4A400ACCC9400BCCC
            AC00BCC4B400BCCCB400B4E48C00BCE49400BCDCA400C4F49400C4FC8C00C0C0
            C0003F3F3F3F3F3F191717193F3F3F3F3F3F3F3F3F003F3F3F3F3F1712111112
            193F3F3F3F3F3F3F3F003F3F3F3F19120E0C0C0E123F3F3F3F3F3F3F3F003F3F
            3F3F120E0C0B0B0C11173F3F3F3F3F3F3F003F3F3F17110C0B0A0A0B0E123F3F
            3F3F3F3F3F003F3F3F12140702010B0B0C11173F3F3F3F3F3F003F3F3F181E1E
            0F03100C0C0E12193F3F3F3F3F003F3F3F2422231F06080C0C0C11173F3F3F3F
            3F003F3F2B212223221305170C0C0E11173F3F3F3F003F3521222323231E0609
            0E0C0C0E12193F3F3F003F2B2223272726221304180E0C0C0E123F3F3F003F29
            26252A2F2F261F0608110E0C0E11173F3F0038302D232C39332E23150311110E
            0C0E11173F003F392E28383F37312A220F0117110E0E0E1219003F3F373F3F3F
            3F3A30261E060917110E0E1117003F3F3F3F3F3F3F3F322E2315030C17121112
            17003F3F3F3F3F3F3F3F37342D2313001819171719003F3F3F3F3F3F3F3F3F3B
            342E231300193F3F3F003F3F3F3F3F3F3F3F3F3F3C3330230F011D3F3F003F3F
            3F3F3F3F3F3F3F3F3F393E31250F0D3F3F003F3F3F3F3F3F3F3F3F3F3F3F383D
            312320353F003F3F3F3F3F3F3F3F3F3F3F3F3F3F3C2A23363F003F3F3F3F3F3F
            3F3F3F3F3F3F3F3F3F3F373F3F00}
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_FiltrosOKClick
        end
      end
    end
  end
  object OdirPanApres: TPanel
    Left = 880
    Top = -4
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
    FormCaption = 'Controle de Estoques'
    FontInactiveColor = 16777170
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clCaptionText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    StartColor = 15522303
    EndColor = 8388863
    Left = 904
    Top = 272
  end
  object PopM_Estoques: TPopupMenu
    Left = 846
    Top = 197
    object PopM_InformarLojaTrabalhar: TMenuItem
      Tag = 2
      Bitmap.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555500005577777777777777777500005000000000000000007500005088
        80FFFFFF0FFFF0750000508180F4444F0F44F0750000508880FFFFFF0FFFF075
        0000508180F4444F0F44F0750000508880FFFFFF0FFFF0750000508180F4444F
        0F44F0750000508880FF0078088880750000508180F400007844807500005088
        80FF7008007880750000508180F4408FF80080750000508880FFF70FFF800075
        0000500000000008FF803007000050EEEEEEEE70880B43000000500000000000
        00FBB43000005555555555550BFFBB43000055555555555550BFFBB400005555
        55555555550BFFBB0000}
      Caption = 'Informar Loja a Trabalhar'
      OnClick = PopM_InformarLojaTrabalharClick
    end
    object N29: TMenuItem
      Caption = '-'
    end
    object PopM_EstoquesParametros: TMenuItem
      Tag = 2
      Bitmap.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDD0000000DDDDDDDDDDDDDDDDD0000000DD0000000000000DD0000000D0FF
        FFFFFFFFFFF0D0000000D0FFFF000000FFF0D0000000D0FFFFFFFFFFFFF0D000
        0000D0FFFF00000FFFF0D0000000D0FFFFFFFFFFFFF0D0000000D0FF4F0000FF
        4FF0D0000000D0F44FFFFFFF44F0D0000000D04444F000F44440D0000000D0F4
        4FFFFFFF44F0D0000000D0FF4F00000F4FF0D0000000D0FFFFFFFFFFFFF0D000
        0000DD0000000000000DD0000000DDDDDDDDDDDDDDDDD0000000DDDDDDDDDDDD
        DDDDD0000000}
      Caption = 'Parametros de Estoque'
      OnClick = PopM_EstoquesParametrosClick
    end
    object N28: TMenuItem
      Caption = '-'
    end
    object PopM_EstoquesAlterarTodosEstMnimos: TMenuItem
      Tag = 2
      Bitmap.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700000007777777777777777700000007444444444444777700000007488
        8888888847777000000074777777770747777000000074700700700047777000
        000074777777770007777000000074700700700B80777000000074777777770B
        707770000000744444444440B8077000000074F44F44F440B707700000007444
        444444440B80700000007777777777770B807000000077777777777770050000
        0000777777777777705500000000777777777777770070000000777777777777
        777770000000}
      Caption = 'Alterar Todos os Estoques M'#237'nimos'
      OnClick = PopM_EstoquesAlterarTodosEstMnimosClick
    end
    object PopM_EstoquesReplicarEstMinLojas: TMenuItem
      Bitmap.Data = {
        9E020000424D9E0200000000000036000000280000000E0000000E0000000100
        18000000000068020000C30E0000C30E00000000000000000000BFBFBFBFBFBF
        BFBFBFBFBFBF0000000000000000000000000000000000000000000000000000
        000000000000BFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF0000000000BFBFBFBFBFBFBFBFBFBFBFBF0000
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000BFBF
        BFBFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF00000000007F0000BFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000007F00007F0000BFBFBFBF
        BFBF000000FFFFFF00007F00007F00007F00007F00007F00007FFFFFFF000000
        00007F00007F00007F0000BFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00000000007F00007F0000BFBFBFBFBFBF000000FFFFFF
        00007F00007F00007F00007F00007F00007FFFFFFF00000000007F0000BFBFBF
        BFBFBFBFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF0000000000BFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFFFFFFFFFFFF
        FF0000000000000000000000000000000000BFBFBFBFBFBFBFBFBFBFBFBF0000
        00FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000BFBFBF0000BFBF
        BFBFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF00
        0000BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFFFF
        FFFFFFFFFF000000000000BFBFBFBFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBF
        BFBF000000000000000000000000000000000000BFBFBFBFBFBFBFBFBFBFBFBF
        0000}
      Caption = 'Replicar Estoques M'#237'nimos para Lojas...'
      OnClick = PopM_EstoquesReplicarEstMinLojasClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
  end
end
