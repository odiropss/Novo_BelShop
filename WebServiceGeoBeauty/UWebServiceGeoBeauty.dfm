object frmWebServiceGeoBeauty: TfrmWebServiceGeoBeauty
  Left = 240
  Top = 123
  Width = 1070
  Height = 589
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
    Width = 1054
    Height = 551
    ActivePage = TabSheet3
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Web Service'
      Highlighted = True
      DesignSize = (
        1046
        523)
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1046
        Height = 55
        Align = alTop
        TabOrder = 0
        object Bt_Busca: TJvXPButton
          Left = 242
          Top = 1
          Width = 129
          Height = 53
          Caption = 'Busca Web Service'
          TabOrder = 1
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_BuscaClick
        end
        object Gb_CurvaABCEndPeriodo: TGroupBox
          Left = 1
          Top = 1
          Width = 241
          Height = 53
          Align = alLeft
          Caption = ' Per'#237'odo '
          Color = 14342874
          ParentColor = False
          TabOrder = 0
          object Label85: TLabel
            Left = 116
            Top = 24
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object DtEdtInicio: TcxDateEdit
            Left = 7
            Top = 18
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
            Left = 125
            Top = 18
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
        Width = 5000
        Height = 468
        Anchors = [akLeft, akTop, akRight, akBottom]
        Lines.Strings = (
          'Memo1')
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Monta Dados'
      ImageIndex = 1
      DesignSize = (
        1046
        523)
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1046
        Height = 44
        Align = alTop
        TabOrder = 0
        object Bt_MontarEstrutura: TJvXPButton
          Left = 1
          Top = 1
          Width = 129
          Height = 42
          Caption = 'Montar Estrutura'
          TabOrder = 0
          Align = alLeft
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
        Width = 5000
        Height = 479
        Anchors = [akLeft, akTop, akRight, akBottom]
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
        Width = 1046
        Height = 44
        Align = alTop
        TabOrder = 0
        object Bt_Apresenta: TJvXPButton
          Left = 1
          Top = 1
          Width = 129
          Height = 42
          Caption = 'Apresenta'
          TabOrder = 0
          Align = alLeft
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
          Left = 130
          Top = 1
          Width = 167
          Height = 42
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
          Align = alLeft
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
        Width = 1046
        Height = 479
        Align = alClient
        DataSource = DS_GeoBeautyPagtos
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
      end
    end
  end
  object CDS_GeoBeautyPagtos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 684
    Top = 120
    object CDS_GeoBeautyPagtosDATA: TDateField
      FieldName = 'DATA'
    end
    object CDS_GeoBeautyPagtosCNPJ_LOJA: TStringField
      FieldName = 'CNPJ_LOJA'
      Size = 14
    end
    object CDS_GeoBeautyPagtosNOME_LOJA: TStringField
      FieldName = 'NOME_LOJA'
      Size = 60
    end
    object CDS_GeoBeautyPagtosVALOR_CHEQUE: TCurrencyField
      FieldName = 'VALOR_CHEQUE'
      DisplayFormat = '0,.00'
      currency = False
    end
    object CDS_GeoBeautyPagtosVALOR_CARTAO: TCurrencyField
      FieldName = 'VALOR_CARTAO'
      DisplayFormat = '0,.00'
    end
    object CDS_GeoBeautyPagtosVALOR_DINHEIRO: TCurrencyField
      FieldName = 'VALOR_DINHEIRO'
      DisplayFormat = '0,.00'
    end
    object CDS_GeoBeautyPagtosVALOR_TOTAL: TCurrencyField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '0,.00'
    end
  end
  object DS_GeoBeautyPagtos: TDataSource
    DataSet = CDS_GeoBeautyPagtos
    Left = 772
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
  object DS_GeoBeautyFechamento: TDataSource
    DataSet = CDS_GeoBeautyFechamento
    Left = 796
    Top = 208
  end
  object CDS_GeoBeautyFechamento: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 684
    Top = 200
    object CDS_GeoBeautyFechamentoEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object CDS_GeoBeautyFechamentoCNPJ_LOJA: TStringField
      FieldName = 'CNPJ_LOJA'
      Size = 14
    end
    object CDS_GeoBeautyFechamentoNOME_LOJA: TStringField
      FieldName = 'NOME_LOJA'
      Size = 60
    end
    object CDS_GeoBeautyFechamentoNOME_CAIXA: TStringField
      FieldName = 'NOME_CAIXA'
      Size = 50
    end
    object CDS_GeoBeautyFechamentoNOME_USUARIO: TStringField
      FieldName = 'NOME_USUARIO'
      Size = 50
    end
    object CDS_GeoBeautyFechamentoDATA_ABERTURA: TSQLTimeStampField
      FieldName = 'DATA_ABERTURA'
    end
    object CDS_GeoBeautyFechamentoDATA_FECHAMENTO: TSQLTimeStampField
      FieldName = 'DATA_FECHAMENTO'
    end
    object CDS_GeoBeautyFechamentoVALOR_CHEQUE_ATUAL: TCurrencyField
      FieldName = 'VALOR_CHEQUE_ATUAL'
      DisplayFormat = '0,.00'
      currency = False
    end
    object CDS_GeoBeautyFechamentoVALOR_CARTAO_ATUAL: TCurrencyField
      FieldName = 'VALOR_CARTAO_ATUAL'
      DisplayFormat = '0,.00'
    end
    object CDS_GeoBeautyFechamentoVALOR_DINHEIRO_ATUAL: TCurrencyField
      FieldName = 'VALOR_DINHEIRO_ATUAL'
      DisplayFormat = '0,.00'
    end
    object CDS_GeoBeautyFechamentoVALOR_CHEQUE_PREVISTO: TCurrencyField
      FieldName = 'VALOR_CHEQUE_PREVISTO'
      DisplayFormat = '0,.00'
      currency = False
    end
    object CDS_GeoBeautyFechamentoVALOR_CARTAO_PREVISTO: TCurrencyField
      FieldName = 'VALOR_CARTAO_PREVISTO'
      DisplayFormat = '0,.00'
    end
    object CDS_GeoBeautyFechamentoVALOR_DINHEIRO_PREVISTO: TCurrencyField
      FieldName = 'VALOR_DINHEIRO_PREVISTO'
      DisplayFormat = '0,.00'
    end
    object CDS_GeoBeautyFechamentoVALORTOTAL: TCurrencyField
      FieldName = 'VALORTOTAL'
      DisplayFormat = '0,.00'
    end
    object CDS_GeoBeautyFechamentoVALOR_TOTAL_PREVISTO: TCurrencyField
      FieldName = 'VALOR_TOTAL_PREVISTO'
      DisplayFormat = '0,.00'
    end
    object CDS_GeoBeautyFechamentoCOD_LOJA: TStringField
      FieldName = 'COD_LOJA'
      Size = 2
    end
  end
end
