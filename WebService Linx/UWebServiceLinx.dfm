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
        Caption = 'Panel1'
        TabOrder = 0
        object Button1: TButton
          Left = 72
          Top = 8
          Width = 75
          Height = 25
          Caption = 'POST'
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 176
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Button2'
          TabOrder = 1
        end
        object Edit1: TEdit
          Left = 272
          Top = 16
          Width = 121
          Height = 21
          TabOrder = 2
          Text = '5'
        end
        object Button4: TButton
          Left = 504
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Button4'
          TabOrder = 3
          OnClick = Button4Click
        end
        object Button5: TButton
          Left = 616
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Button5'
          TabOrder = 4
          OnClick = Button5Click
        end
      end
      object Memo1: TMemo
        Left = 0
        Top = 41
        Width = 904
        Height = 484
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          'Memo1')
        ParentFont = False
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object JvRichEdit1: TJvRichEdit
        Left = 0
        Top = 0
        Width = 904
        Height = 525
        Align = alClient
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Candara'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object Button3: TButton
        Left = 456
        Top = 24
        Width = 75
        Height = 25
        Caption = 'Button3'
        TabOrder = 1
        OnClick = Button3Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
      object JvEditor1: TJvEditor
        Left = 0
        Top = 0
        Width = 904
        Height = 525
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabStop = True
        UseDockManager = False
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'TabSheet4'
      ImageIndex = 3
      object JvHLEditor1: TJvHLEditor
        Left = 0
        Top = 0
        Width = 904
        Height = 525
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabStop = True
        UseDockManager = False
        Colors.Comment.Style = [fsItalic]
        Colors.Comment.ForeColor = clOlive
        Colors.Comment.BackColor = clWindow
        Colors.Number.ForeColor = clNavy
        Colors.Number.BackColor = clWindow
        Colors.Strings.ForeColor = clPurple
        Colors.Strings.BackColor = clWindow
        Colors.Symbol.ForeColor = clBlue
        Colors.Symbol.BackColor = clWindow
        Colors.Reserved.Style = [fsBold]
        Colors.Reserved.ForeColor = clWindowText
        Colors.Reserved.BackColor = clWindow
        Colors.Identifier.ForeColor = clWindowText
        Colors.Identifier.BackColor = clWindow
        Colors.Preproc.ForeColor = clGreen
        Colors.Preproc.BackColor = clWindow
        Colors.FunctionCall.ForeColor = clWindowText
        Colors.FunctionCall.BackColor = clWindow
        Colors.Declaration.ForeColor = clWindowText
        Colors.Declaration.BackColor = clWindow
        Colors.Statement.Style = [fsBold]
        Colors.Statement.ForeColor = clWindowText
        Colors.Statement.BackColor = clWindow
        Colors.PlainText.ForeColor = clWindowText
        Colors.PlainText.BackColor = clWindow
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'TabSheet5'
      ImageIndex = 4
      object JvWideEditor1: TJvWideEditor
        Left = 0
        Top = 0
        Width = 904
        Height = 525
        Cursor = crIBeam
        GutterWidth = 0
        RightMarginColor = clSilver
        Completion.ItemHeight = 13
        Completion.Interval = 800
        Completion.ListBoxStyle = lbStandard
        Completion.CRLF = '/n'
        Completion.Separator = '='
        TabStops = '3 5'
        BracketHighlighting.StringEscape = #39#39
        SelForeColor = clHighlightText
        SelBackColor = clHighlight
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabStop = True
        UseDockManager = False
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'TabSheet6'
      ImageIndex = 5
      object JvWideHLEditor1: TJvWideHLEditor
        Left = 0
        Top = 0
        Width = 904
        Height = 525
        Cursor = crIBeam
        GutterWidth = 0
        RightMarginColor = clSilver
        Completion.ItemHeight = 13
        Completion.Interval = 800
        Completion.ListBoxStyle = lbStandard
        Completion.CRLF = '/n'
        Completion.Separator = '='
        TabStops = '3 5'
        BracketHighlighting.StringEscape = #39#39
        SelForeColor = clHighlightText
        SelBackColor = clHighlight
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabStop = True
        UseDockManager = False
        Colors.Comment.Style = [fsItalic]
        Colors.Comment.ForeColor = clOlive
        Colors.Comment.BackColor = clWindow
        Colors.Number.ForeColor = clNavy
        Colors.Number.BackColor = clWindow
        Colors.Strings.ForeColor = clPurple
        Colors.Strings.BackColor = clWindow
        Colors.Symbol.ForeColor = clBlue
        Colors.Symbol.BackColor = clWindow
        Colors.Reserved.Style = [fsBold]
        Colors.Reserved.ForeColor = clWindowText
        Colors.Reserved.BackColor = clWindow
        Colors.Identifier.ForeColor = clWindowText
        Colors.Identifier.BackColor = clWindow
        Colors.Preproc.ForeColor = clGreen
        Colors.Preproc.BackColor = clWindow
        Colors.FunctionCall.ForeColor = clWindowText
        Colors.FunctionCall.BackColor = clWindow
        Colors.Declaration.ForeColor = clWindowText
        Colors.Declaration.BackColor = clWindow
        Colors.Statement.Style = [fsBold]
        Colors.Statement.ForeColor = clWindowText
        Colors.Statement.BackColor = clWindow
        Colors.PlainText.ForeColor = clWindowText
        Colors.PlainText.BackColor = clWindow
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'TabSheet7'
      ImageIndex = 6
      object JvMemo1: TJvMemo
        Left = 0
        Top = 0
        Width = 904
        Height = 525
        AutoSize = False
        MaxLines = 0
        HideCaret = False
        Align = alClient
        Lines.Strings = (
          'JvMemo1')
        TabOrder = 0
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'TabSheet8'
      ImageIndex = 7
      object RxRichEdit1: TRxRichEdit
        Left = 0
        Top = 0
        Width = 904
        Height = 525
        Align = alClient
        TabOrder = 0
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
