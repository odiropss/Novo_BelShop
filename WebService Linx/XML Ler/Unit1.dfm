object Form1: TForm1
  Left = 234
  Top = 111
  Width = 1156
  Height = 480
  Caption = 'Form1'
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
  object ListBox1: TListBox
    Left = 0
    Top = 57
    Width = 225
    Height = 385
    Align = alLeft
    ItemHeight = 13
    TabOrder = 0
    OnClick = ListBox1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1140
    Height = 57
    Align = alTop
    TabOrder = 1
    object Button1: TButton
      Left = 280
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Ler'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 64
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Nome.Name'
      TabOrder = 1
      OnClick = Button2Click
    end
    object EdtNode: TEdit
      Left = 152
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object Button3: TButton
      Left = 688
      Top = 8
      Width = 75
      Height = 33
      Caption = 'OK'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = Button3Click
    end
  end
  object ListBox2: TListBox
    Left = 225
    Top = 57
    Width = 225
    Height = 385
    Align = alLeft
    ItemHeight = 13
    TabOrder = 2
  end
  object ListBox3: TListBox
    Left = 450
    Top = 57
    Width = 225
    Height = 385
    Align = alLeft
    ItemHeight = 13
    TabOrder = 3
  end
  object ListBox4: TListBox
    Left = 675
    Top = 57
    Width = 225
    Height = 385
    Align = alLeft
    ItemHeight = 13
    TabOrder = 4
  end
  object ListBox5: TListBox
    Left = 900
    Top = 57
    Width = 225
    Height = 385
    Align = alLeft
    ItemHeight = 13
    TabOrder = 5
  end
  object XMLDocument1: TXMLDocument
    Left = 560
    Top = 8
    DOMVendorDesc = 'MSXML'
  end
end
