object frmWebServiceGeoBeauty: TfrmWebServiceGeoBeauty
  Left = 240
  Top = 123
  Width = 990
  Height = 589
  ActiveControl = Bt_MontarEstrutura
  Caption = 'Web Service GeoBeauty'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 974
    Height = 551
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Web Service'
      Highlighted = True
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 966
        Height = 55
        Align = alTop
        TabOrder = 0
        object Bt_Busca: TJvXPButton
          Left = 504
          Top = 9
          Width = 129
          Height = 36
          Caption = 'Busca Web Service'
          TabOrder = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_BuscaClick
        end
        object Gb_CurvaABCEndPeriodo: TGroupBox
          Left = 239
          Top = 1
          Width = 241
          Height = 48
          Caption = ' Per'#237'odo '
          Color = 14342874
          ParentColor = False
          TabOrder = 0
          object Label85: TLabel
            Left = 117
            Top = 23
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object DtEdtInicio: TcxDateEdit
            Left = 9
            Top = 17
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
            Width = 106
          end
          object DtEdtFim: TcxDateEdit
            Left = 127
            Top = 17
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
            TabOrder = 1
            Width = 106
          end
        end
      end
      object Memo1: TMemo
        Left = 0
        Top = 55
        Width = 966
        Height = 468
        Align = alClient
        Lines.Strings = (
          'Memo1')
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Monta Dados'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 966
        Height = 44
        Align = alTop
        TabOrder = 0
        object Bt_MontarEstrutura: TJvXPButton
          Left = 16
          Top = 4
          Width = 129
          Height = 36
          Caption = 'Montar Estrutura'
          TabOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_MontarEstruturaClick
        end
      end
      object Memo2: TMemo
        Left = 0
        Top = 44
        Width = 966
        Height = 479
        Align = alClient
        Lines.Strings = (
          'Memo2')
        TabOrder = 1
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Apresenta Dados'
      ImageIndex = 2
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 966
        Height = 44
        Align = alTop
        TabOrder = 0
        DesignSize = (
          966
          44)
        object Bt_Apresenta: TJvXPButton
          Left = 8
          Top = 4
          Width = 129
          Height = 36
          Caption = 'Apresenta'
          TabOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_ApresentaClick
        end
        object Bt_DepAnaliseSalvaClipboard: TJvXPButton
          Tag = 4
          Left = 479
          Top = 2
          Width = 167
          Height = 35
          Caption = 'Salvar em Mem'#243'ria'
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
          Anchors = [akLeft, akTop, akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_DepAnaliseSalvaClipboardClick
        end
      end
      object Dbg_ApresentaDados: TDBGrid
        Left = 0
        Top = 44
        Width = 966
        Height = 479
        Align = alClient
        DataSource = DS_GeoBeauty
        FixedColor = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DATA'
            Title.Alignment = taCenter
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJ_LOJA'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_LOJA'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_CHEQUE'
            Title.Alignment = taRightJustify
            Title.Caption = 'CHEQUE'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_CARTAO'
            Title.Alignment = taRightJustify
            Title.Caption = 'CARTAO'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_DINHEIRO'
            Title.Alignment = taRightJustify
            Title.Caption = 'DINHEIRO'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL'
            Title.Alignment = taRightJustify
            Title.Caption = 'TOTAL'
            Width = 100
            Visible = True
          end>
      end
    end
  end
  object HTTPRIO111: THTTPRIO
    WSDLLocation = 
      'http://aplicativo.geobeauty.com.br/aplicativo/webservices/ws-sal' +
      'ao/server.php?wsdl'
    Service = 'gestori'
    Port = 'gestoriPort'
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    HTTPWebNode.UseUTF8InHeader = False
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 528
    Top = 144
  end
  object CDS_GeoBeauty: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 684
    Top = 120
    object CDS_GeoBeautyDATA: TDateField
      FieldName = 'DATA'
    end
    object CDS_GeoBeautyCNPJ_LOJA: TStringField
      FieldName = 'CNPJ_LOJA'
      Size = 14
    end
    object CDS_GeoBeautyNOME_LOJA: TStringField
      FieldName = 'NOME_LOJA'
      Size = 60
    end
    object CDS_GeoBeautyVALOR_CHEQUE: TCurrencyField
      FieldName = 'VALOR_CHEQUE'
      DisplayFormat = '0,.00'
      currency = False
    end
    object CDS_GeoBeautyVALOR_CARTAO: TCurrencyField
      FieldName = 'VALOR_CARTAO'
      DisplayFormat = '0,.00'
    end
    object CDS_GeoBeautyVALOR_DINHEIRO: TCurrencyField
      FieldName = 'VALOR_DINHEIRO'
      DisplayFormat = '0,.00'
    end
    object CDS_GeoBeautyVALOR_TOTAL: TCurrencyField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '0,.00'
    end
  end
  object DS_GeoBeauty: TDataSource
    DataSet = CDS_GeoBeauty
    Left = 756
    Top = 128
  end
  object HTTPRIO1: THTTPRIO
    WSDLLocation = 
      'http://aplicativo.geobeauty.com.br/aplicativo/webservices/ws-sal' +
      'ao/server.php?wsdl'
    Service = 'gestori'
    Port = 'gestoriPort'
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    HTTPWebNode.UseUTF8InHeader = False
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 372
    Top = 256
  end
end
