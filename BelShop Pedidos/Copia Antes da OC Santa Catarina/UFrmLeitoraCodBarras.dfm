object FrmLeitoraCodBarras: TFrmLeitoraCodBarras
  Left = 270
  Top = 133
  ActiveControl = EdtCodBarras
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Checkout - Leitora de C'#243'digo de Barras (EAN13)'
  ClientHeight = 111
  ClientWidth = 398
  Color = clBtnFace
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
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
    Left = 127
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
  object EdtQtdEmbalagem: TCurrencyEdit
    Left = 23
    Top = 31
    Width = 91
    Height = 30
    TabStop = False
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
  object EdtCodBarras: TJvEdit
    Left = 125
    Top = 31
    Width = 200
    Height = 32
    Alignment = taRightJustify
    Modified = False
    CharCase = ecUpperCase
    Color = 8454143
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Text = '0'
    OnChange = EdtCodBarrasChange
    OnKeyDown = EdtCodBarrasKeyDown
  end
  object Bt_Processar: TJvXPButton
    Left = 336
    Top = 31
    Width = 33
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
  object Panel1: TPanel
    Left = 0
    Top = 79
    Width = 398
    Height = 32
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object Bt_Retornar: TJvXPButton
      Left = 287
      Top = 2
      Width = 109
      Height = 28
      Caption = 'Retornar'
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
      Spacing = 10
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_RetornarClick
    end
  end
  object Ckb_Referencia: TJvCheckBox
    Left = 230
    Top = 13
    Width = 98
    Height = 17
    Caption = 'Usar Refer'#234'ncia'
    TabOrder = 4
    OnClick = Ckb_ReferenciaClick
    OnKeyUp = Ckb_ReferenciaKeyUp
    LinkedControls = <>
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
end
