object FrmLeitoraCodBarras: TFrmLeitoraCodBarras
  Left = 361
  Top = 215
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Checkout - Leitora de C'#243'digo de Barras (EAN13)'
  ClientHeight = 174
  ClientWidth = 524
  Color = clSilver
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 524
    Height = 174
    Align = alClient
    Color = clSilver
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 13
      Width = 91
      Height = 13
      Caption = 'Qdt/Embalagem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 120
      Top = 13
      Width = 98
      Height = 13
      Caption = 'C'#243'digo de Barras'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bt_Processar: TJvXPButton
      Left = 326
      Top = 31
      Width = 35
      Height = 30
      Caption = 'OK'
      TabOrder = 2
      TabStop = False
      ShowFocusRect = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_ProcessarClick
    end
    object Bt_Fechar: TJvXPButton
      Tag = 99
      Left = 388
      Top = 25
      Width = 119
      Height = 38
      Caption = '    Fechar'#13#10'Diverg'#234'ncias'
      TabOrder = 3
      TabStop = False
      ShowFocusRect = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_FecharClick
    end
    object EdtCodBarras: TCurrencyEdit
      Left = 119
      Top = 31
      Width = 199
      Height = 30
      AutoSize = False
      Color = 8454143
      DecimalPlaces = 0
      DisplayFormat = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnChange = EdtCodBarrasChange
    end
    object EdtQtdEmbalagem: TCurrencyEdit
      Left = 15
      Top = 31
      Width = 91
      Height = 30
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Value = 1.000000000000000000
      OnEnter = EdtQtdEmbalagemEnter
      OnExit = EdtQtdEmbalagemExit
    end
    object Gb_CheckOut_Erro: TGroupBox
      Left = 1
      Top = 125
      Width = 522
      Height = 48
      Align = alBottom
      Caption = ' CheckOut Erros '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object PBar_CheckOut_Erro: TJvGradientProgressBar
        Left = 1
        Top = 14
        Width = 520
        Height = 33
        BarColorFrom = 14671871
        BarColorTo = clRed
        Position = 80
        Smooth = True
        Align = alClient
        ParentColor = True
      end
      object Lab_CheckOut_Erro: TLabel
        Left = 125
        Top = 1
        Width = 53
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = ' 0 % '
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
    object Gb_CheckOut_OK: TGroupBox
      Left = 1
      Top = 77
      Width = 522
      Height = 48
      Align = alBottom
      Caption = ' CheckOut OK '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object PBar_CheckOut_OK: TJvGradientProgressBar
        Left = 1
        Top = 14
        Width = 520
        Height = 33
        BarColorFrom = 16755370
        BarColorTo = 16744448
        Position = 80
        Smooth = True
        Align = alClient
        ParentColor = True
      end
      object Lab_CheckOut_OK: TLabel
        Left = 125
        Top = -1
        Width = 53
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = ' 0 % '
        Color = 16744448
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
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
    FormCaption = 'Checkout - Leitora de C'#243'digo de Barras (EAN13)'
    FontInactiveColor = 16777170
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clCaptionText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    StartColor = 15522303
    EndColor = 8388863
    Left = 269
    Top = 65519
  end
end
