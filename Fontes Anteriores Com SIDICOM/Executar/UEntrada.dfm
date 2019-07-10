object FrmEntrada: TFrmEntrada
  Left = 373
  Top = 143
  BorderStyle = bsSingle
  Caption = 'Inicializa'#231#227'o'
  ClientHeight = 229
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 5
    Top = 5
    Width = 369
    Height = 218
    BevelInner = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    Color = 12698049
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 96
      Width = 353
      Height = 21
      Alignment = taCenter
      AutoSize = False
      Caption = 'LABEL1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 88
      Top = 152
      Width = 193
      Height = 16
      Caption = 'Aguarde Inicializa'#231#227'o Sistema ...'
    end
    object Animate1: TAnimate
      Left = 144
      Top = 24
      Width = 80
      Height = 50
      Active = True
      CommonAVI = aviFindFolder
      StopFrame = 29
    end
    object Panel2: TPanel
      Left = 267
      Top = 189
      Width = 95
      Height = 22
      BevelInner = bvLowered
      BevelWidth = 2
      Caption = 'V - 061011'
      Color = clSilver
      TabOrder = 1
    end
  end
end
