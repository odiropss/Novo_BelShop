object Form1: TForm1
  Left = 242
  Top = 116
  Width = 978
  Height = 552
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 962
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object Label1: TLabel
      Left = 64
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
    object Label2: TLabel
      Left = 136
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Label2'
    end
    object Button1: TButton
      Left = 328
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 41
    Width = 962
    Height = 473
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object OpenDialog1: TOpenDialog
    Left = 304
    Top = 72
  end
end
