object FrmLeitoraCodBarras: TFrmLeitoraCodBarras
  Left = 492
  Top = 199
  AutoSize = True
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Leitora de C'#243'digo de Barras (EAN13)'
  ClientHeight = 67
  ClientWidth = 428
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 428
    Height = 67
    Align = alClient
    Color = clSilver
    TabOrder = 0
    object Bt_Processar: TJvXPButton
      Left = 238
      Top = 18
      Width = 35
      Height = 30
      Caption = 'OK'
      TabOrder = 1
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
      Left = 308
      Top = 18
      Width = 97
      Height = 30
      Caption = 'Fechar'
      TabOrder = 2
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
      Left = 23
      Top = 18
      Width = 199
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
      OnChange = EdtCodBarrasChange
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
    FormCaption = 'Leitora de C'#243'digo de Barras (EAN13)'
    FontInactiveColor = 16777170
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clCaptionText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    StartColor = 15522303
    EndColor = 8388863
    Left = 144
    Top = 24
  end
end
