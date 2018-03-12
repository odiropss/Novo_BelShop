object frmWebServiceGeoBeauty: TfrmWebServiceGeoBeauty
  Left = 240
  Top = 123
  Width = 928
  Height = 589
  Caption = 'Web Service GeoBeauty'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 65
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object JvXPButton1: TJvXPButton
      Left = 128
      Top = 4
      Width = 129
      Height = 36
      Caption = 'Busca'
      TabOrder = 0
      OnClick = JvXPButton1Click
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 65
    Width = 912
    Height = 486
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
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
    Left = 528
    Top = 144
  end
end
