object FrmWebServiceLinx: TFrmWebServiceLinx
  Left = 242
  Top = 116
  Width = 928
  Height = 74
  Caption = 'FrmWebServiceLinx'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bt_LinxLojas: TJvXPButton
    Left = 0
    Top = 0
    Width = 76
    Height = 36
    Caption = 'LinxLojas'
    TabOrder = 0
    Align = alLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Bt_LinxLojasClick
  end
  object Bt_LinxVendedores: TJvXPButton
    Left = 76
    Top = 0
    Width = 105
    Height = 36
    Caption = 'LinxVendedores'
    TabOrder = 1
    Align = alLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Bt_LinxVendedoresClick
  end
  object Bt_LinxClientesFornec: TJvXPButton
    Left = 181
    Top = 0
    Width = 123
    Height = 36
    Caption = 'LinxClientesFornec'
    TabOrder = 2
    Align = alLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Bt_LinxClientesFornecClick
  end
  object Bt_LinxProdutos: TJvXPButton
    Left = 304
    Top = 0
    Width = 100
    Height = 36
    Caption = 'LinxProdutos'
    TabOrder = 3
    Align = alLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Bt_LinxProdutosClick
  end
  object Bt_LinxProdutosDetalhes: TJvXPButton
    Left = 404
    Top = 0
    Width = 142
    Height = 36
    Caption = 'LinxProdutosDetalhes'
    TabOrder = 4
    Align = alLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Bt_LinxProdutosDetalhesClick
  end
  object Bt_LinxMovimento: TJvXPButton
    Left = 546
    Top = 0
    Width = 102
    Height = 36
    Caption = 'LinxMovimento'
    TabOrder = 5
    Align = alLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Bt_LinxMovimentoClick
  end
  object Bt_LinxFaturas: TJvXPButton
    Left = 648
    Top = 0
    Width = 102
    Height = 36
    Caption = 'LinxFaturas'
    TabOrder = 6
    Align = alLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Bt_LinxFaturasClick
  end
  object Bt_AtualizaBancosDados: TJvXPButton
    Left = 750
    Top = 0
    Width = 162
    Height = 36
    Caption = 'Atualiza Bancos Dados'
    TabOrder = 7
    Align = alLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Bt_AtualizaBancosDadosClick
  end
  object IdHTTP: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 344
    Top = 160
  end
  object XMLDocument1: TXMLDocument
    Left = 448
    Top = 280
    DOMVendorDesc = 'MSXML'
  end
end
