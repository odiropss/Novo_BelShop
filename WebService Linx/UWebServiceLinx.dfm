object FrmWebServiceLinx: TFrmWebServiceLinx
  Left = 242
  Top = 116
  Width = 928
  Height = 591
  Caption = 'FrmWebServiceLinx'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 912
    Height = 553
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 904
        Height = 41
        Align = alTop
        TabOrder = 0
        object Button1: TButton
          Left = 776
          Top = 0
          Width = 75
          Height = 25
          Caption = 'POST'
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button4: TButton
          Left = 832
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Button4'
          TabOrder = 1
          OnClick = Button4Click
        end
        object Button5: TButton
          Left = 856
          Top = 0
          Width = 75
          Height = 25
          Caption = 'Button5'
          TabOrder = 2
          OnClick = Button5Click
        end
        object Bt_LinxLojas: TJvXPButton
          Left = 1
          Top = 1
          Width = 76
          Height = 39
          Caption = 'LinxLojas '
          TabOrder = 3
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_LinxLojasClick
        end
        object Bt_LinxClientesFornec: TJvXPButton
          Left = 182
          Top = 1
          Width = 123
          Height = 39
          Caption = 'LinxClientesFornec'
          TabOrder = 4
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_LinxClientesFornecClick
        end
        object Bt_LinxMovimento: TJvXPButton
          Left = 547
          Top = 1
          Width = 102
          Height = 39
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
        object Bt_LinxVendedores: TJvXPButton
          Left = 77
          Top = 1
          Width = 105
          Height = 39
          Caption = 'LinxVendedores'
          TabOrder = 6
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_LinxVendedoresClick
        end
        object Bt_LinxProdutosDetalhes: TJvXPButton
          Left = 405
          Top = 1
          Width = 142
          Height = 39
          Caption = 'LinxProdutosDetalhes'
          TabOrder = 7
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_LinxProdutosDetalhesClick
        end
        object Bt_LinxProdutos: TJvXPButton
          Left = 305
          Top = 1
          Width = 100
          Height = 39
          Caption = 'LinxProdutos'
          TabOrder = 8
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_LinxProdutosClick
        end
        object Bt_LinxFaturas: TJvXPButton
          Left = 649
          Top = 1
          Width = 102
          Height = 39
          Caption = 'LinxFaturas'
          TabOrder = 9
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_LinxFaturasClick
        end
      end
      object JvEditor1: TJvEditor
        Left = 0
        Top = 41
        Width = 904
        Height = 484
        Cursor = crIBeam
        GutterWidth = 0
        RightMarginColor = clSilver
        Completion.ItemHeight = 13
        Completion.Interval = 800
        Completion.ListBoxStyle = lbStandard
        Completion.CaretChar = '|'
        Completion.CRLF = '/n'
        Completion.Separator = '='
        TabStops = '3 5'
        BracketHighlighting.StringEscape = #39#39
        SelForeColor = clHighlightText
        SelBackColor = clHighlight
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabStop = True
        UseDockManager = False
      end
    end
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
