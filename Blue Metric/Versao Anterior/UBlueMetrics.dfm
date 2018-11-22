object FrmBlueMetrics: TFrmBlueMetrics
  Left = 316
  Top = 111
  Width = 733
  Height = 561
  AutoSize = True
  Caption = 'FrmBlueMetrics'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 717
    Height = 61
    Align = alTop
    TabOrder = 0
    DesignSize = (
      717
      61)
    object Lb_Tabela: TLabel
      Left = 416
      Top = 24
      Width = 61
      Height = 13
      Caption = 'Lb_Tabela'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Lb_Reg: TLabel
      Left = 492
      Top = 24
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Lb_Reg'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Gb_ConsultaNFePeriodo: TGroupBox
      Left = 3
      Top = 5
      Width = 227
      Height = 53
      Caption = ' Per'#237'odo '
      Color = 15004403
      ParentColor = False
      TabOrder = 0
      object Label181: TLabel
        Left = 109
        Top = 26
        Width = 6
        Height = 13
        Caption = 'a'
      end
      object DtEdt_DataFim: TcxDateEdit
        Left = 123
        Top = 20
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        StyleFocused.BorderStyle = ebsOffice11
        TabOrder = 1
        Width = 94
      end
      object DtEdt_DataInicio: TcxDateEdit
        Left = 9
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
        Width = 94
      end
    end
    object Bt_ExportaDados: TJvXPButton
      Tag = 91
      Left = 242
      Top = 10
      Width = 139
      Height = 45
      Caption = 'Exporta Dados'
      TabOrder = 1
      Glyph.Data = {
        0A544A504547496D61676574080000FFD8FFE000104A46494600010101006000
        600000FFE1003A4578696600004D4D002A000000080003511000010000000101
        00000051110004000000010000000051120004000000010000000000000000FF
        DB00430002010102010102020202020202020305030303030306040403050706
        07070706070708090B0908080A0807070A0D0A0A0B0C0C0C0C07090E0F0D0C0E
        0B0C0C0CFFDB004301020202030303060303060C0807080C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0CFFC00011080027002803012200021101031101FFC4001F
        0000010501010101010100000000000000000102030405060708090A0BFFC400
        B5100002010303020403050504040000017D0102030004110512213141061351
        6107227114328191A1082342B1C11552D1F02433627282090A161718191A2526
        2728292A3435363738393A434445464748494A535455565758595A6364656667
        68696A737475767778797A838485868788898A92939495969798999AA2A3A4A5
        A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DA
        E1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F0100030101010101
        010101010000000000000102030405060708090A0BFFC400B511000201020404
        0304070504040001027700010203110405213106124151076171132232810814
        4291A1B1C109233352F0156272D10A162434E125F11718191A262728292A3536
        3738393A434445464748494A535455565758595A636465666768696A73747576
        7778797A82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2
        B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7
        E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FD53FDAD3FE0
        A5917ECD9E32D5B4DB8F0C5FE99E19D1E74D26EFC71AA44D26971EAB2597DB23
        D3EDAD21CDD5E4FE4BC326E3F67B4C79C8D791CD1189BC47E057FC16D97C5BE1
        9F155E6A9AD785B56B8F0DC09A84C6F7C2B7FE14B3B7B26BBB6B6329960BBD66
        491C35C2058C42BE63BAAEE4CE6BE62FF82C8F817C69E17D534D975893CCD08E
        AFACB0DAE76ACB71E21D7AEAD8107F8859CB0F3FD2BC9FF669F817E0DF1E7ECB
        9AA6A1E2AF174DE0B8B5CF883A4787E4D585AA5CC76B08B0D466C48AF2C2A90B
        4AD13BBB4981F6743B495AFB8CBF87B0553011C4D794AF26B6E9AF6B3D6DEBE8
        7C7E3B3CC5C31AF0F452B24F7EBA77BAD2FE87D8567FF05CDBCD4BC7F369EFF1
        33C2BA7E8B7568D0DBEA527C19BD68EC2E58616794AF891A59224272D1A40198
        0C061D4F2FE0BFF82B27C68F84FF001774AFF8591F163C1B7BE0BF1418B54D26
        FADFE1589ECB50D30DE4B0B4D1C96DAEFDA2CF22290149E09EE212A43C05C796
        DF04FC6BF84307C25BFD05AC3C47A778AB47F13E95FDB1A6DFDA412405E11757
        368CB246F928E26B498603302BB1B20B155FA53E187EC9FE03F197EC2DE35975
        6F1B6B979E28F05DB5BF8B6DB4EB7B15B6B4D225BED145E4710958BF9CB751A5
        B24A42A10FA6903E50AF27A75F86F2BA508D4F7ACF4EB75ADAFB69AB57BE9D2D
        73CFA39F663524E0B96EB5E96EF6DF5D2F6B7DF63F5E7F647FDAB6D7F6A4F05B
        5EC9A4FF00C23BAC470C5A87D80DFC778B77A6DC3CCB63A940EA15FECD74B04A
        504F1433AB452A490C6F1B282BE71FF8223FECBB27C22F8609E349F5386EAE3C
        51E0CD134A96CD09DD62D1EA1ADEB099E07DFB6D7AD4F7E54FE257E798CA31A5
        5E74A0EEA2DA4FBA4CFB8C2D5954A30A93566D26D766D1E6DFF05A2FD9CFC597
        7E1FF175D49E2DD32DFC1BE23D5D3C65A5D85DAA8B8BAD62C743686E74F89B39
        58D74AD3AF6FB71E19E278C2E58357C2FF0001F43D53F685FD9375FF00857E15
        D3219FC536BE2FB2F1407BBD46DEC6DEFADCD9DCDA790B2DC3C71ACEB232B2C6
        5F74AB24A547EE1B3FBE5F187E11E8FF001B7C0EFA1EB56F14D0C77769A9DA48
        F124A6CAF6D2E23BAB4B9557054BC3710C5200C0A9280104120FC4B17FC1297E
        2D7C2DF0C490F807C7FF000E74796E350BBBCFB1687E1FBAF0EAE9925CC8C24B
        AB1BAB8B8D55AD676B731C0E162398ADE18E07B41E7B4FF4194F107D570AF0D2
        5AF32716F65DEF6D5FFC1E96478B99649F58C4FB74F4E56A496EFB5AFA2FF81D
        6E7E6EFF00C1427F6751FB257C58F0CFC374BAD5B5487C27E188A08755BED3CD
        87F6C24D7F7F79E7C703333246AF72F0724E5ED9DBA3003E90FD8E6EEFBF688F
        D87BE2A6A575E19D7BC59A87867C3569A0DFE99A069816FF0053B4D3ACB52FB2
        CF664022EB505B6B94B45B75504F916CCEE0CC33F29FED6BE17BEF857E2693E1
        E5F697E0BD3DBE1BEBD7DA3C771E1AD3AF2C60D4967D3344D4FCE992EAF6F653
        303A898B719C8290C4005C62BEE4FF00821B7C1FF06FED3BFB3778CBC2DE25D3
        F4EBAD43C27E239354B496E748D3F507B68AFED2DE159105E5BCC14F99A749D0
        6D629860DB401F5398E314F27862AEEEDEF657BF36F6BDB56AF64ECBE47CDE03
        08E19A4B0C92B25B5DDBE15A5ED7D13B5DABBF99F60FFC137FC61F0CF42F0ADD
        780BC2769AF787FC5C34FB4F196B9A06B5A36ADA7DD69F05F192DAD111B51B5B
        69268208F4FF00B146FE5AB797611EF5563C95E9FF00B337ECC3A7FECCBA16B5
        6F6FE23F1578BF50F106A2DA85E6ABE219EDE4BA0A116386D214B786182DED20
        8D02C56F0C491A65DB05E47662BF2F949B7767E8B1565647A6514514867C13FF
        00053EFF008257EB1FB4D6B2DAC780FC3DE17D4752D675C8757D464BBF12CBE1
        DBBB794D8C16372FE78B1BF8E78E5B7B1D2D4466DD1A26B22C1E412B463DDBF6
        0DFD84B47FD8BB42D59AD2DF4A8F52D62D2C74FF00F43F3E46B6B2B6F3E74B79
        A795FF00D2E517D7FAA4DF69586D832DDA46208D21450515D52C657950586949
        F245DD2E97FEAFF7BEE73C70946359E214573BD1BEBFD68BEE47D0145145729D
        07FFD9}
      ShowFocusRect = True
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_ExportaDadosClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 61
    Width = 519
    Height = 462
    Align = alLeft
    Caption = 'Lojas'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 515
      Height = 445
      Align = alClient
      DataSource = DMBlueMetrics.DS_Lojas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnKeyDown = DBGrid1KeyDown
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'COD_FILIAL'
          Title.Alignment = taRightJustify
          Title.Caption = 'Sidicom'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_LINX'
          Title.Alignment = taRightJustify
          Title.Caption = 'Linx'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RAZAO_SOCIAL'
          Title.Caption = 'Nome da Loja'
          Width = 200
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DTA_INICIO_LINX'
          Title.Alignment = taCenter
          Title.Caption = 'Dta In'#237'cio Linx'
          Width = 90
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'IND_DOMINGO'
          Title.Alignment = taCenter
          Title.Caption = 'Aberto Domingo'
          Width = 96
          Visible = True
        end>
    end
  end
  object GroupBox2: TGroupBox
    Left = 519
    Top = 61
    Width = 198
    Height = 462
    Align = alClient
    Caption = 'Tabelas'
    TabOrder = 2
    object Ckb_Clientes: TJvCheckBox
      Left = 48
      Top = 48
      Width = 67
      Height = 17
      Caption = 'Clientes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      LinkedControls = <>
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object Ckb_Empresas: TJvCheckBox
      Left = 48
      Top = 72
      Width = 76
      Height = 17
      Caption = 'Empresas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      LinkedControls = <>
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object Ckb_Produtos: TJvCheckBox
      Left = 48
      Top = 120
      Width = 72
      Height = 17
      Caption = 'Produtos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      LinkedControls = <>
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object Ckb_Fornecedores: TJvCheckBox
      Left = 48
      Top = 96
      Width = 99
      Height = 17
      Caption = 'Fornecedores'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      LinkedControls = <>
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object Ckb_ItensVendas: TJvCheckBox
      Left = 48
      Top = 216
      Width = 96
      Height = 17
      Caption = 'Itens Vendas'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      LinkedControls = <>
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object Ckb_Vendas: TJvCheckBox
      Left = 48
      Top = 192
      Width = 64
      Height = 17
      Caption = 'Vendas'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      LinkedControls = <>
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object Ckb_Vendedores: TJvCheckBox
      Left = 48
      Top = 144
      Width = 89
      Height = 17
      Caption = 'Vendedores'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      LinkedControls = <>
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object Ckb_Estoques: TJvCheckBox
      Left = 48
      Top = 168
      Width = 74
      Height = 17
      Caption = 'Estoques'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      LinkedControls = <>
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object Ckb_ItensTrocas: TJvCheckBox
      Left = 48
      Top = 240
      Width = 93
      Height = 17
      Caption = 'Itens Trocas'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      LinkedControls = <>
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object Ckb_Pagamentos: TJvCheckBox
      Left = 48
      Top = 264
      Width = 91
      Height = 17
      Caption = 'Pagamentos'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      LinkedControls = <>
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
  end
end
