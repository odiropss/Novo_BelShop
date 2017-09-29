object Form1: TForm1
  Left = 370
  Top = 113
  Width = 420
  Height = 231
  Caption = 'Cliente'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 40
    Height = 13
    Caption = 'IP/Host:'
  end
  object Label2: TLabel
    Left = 8
    Top = 120
    Width = 50
    Height = 13
    Caption = 'Progresso:'
  end
  object Label3: TLabel
    Left = 32
    Top = 48
    Width = 25
    Height = 13
    Caption = 'Porta'
  end
  object Edit1: TEdit
    Left = 64
    Top = 16
    Width = 129
    Height = 21
    TabOrder = 0
    Text = '201.21.193.78'
  end
  object Button1: TButton
    Left = 16
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Conectar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 120
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Pedir Arquivo'
    TabOrder = 2
    OnClick = Button2Click
  end
  object ProgressBar1: TProgressBar
    Left = 64
    Top = 120
    Width = 321
    Height = 17
    TabOrder = 3
  end
  object Button3: TButton
    Left = 112
    Top = 144
    Width = 75
    Height = 25
    Caption = 'DesConectar'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Edit2: TEdit
    Left = 64
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 5
    Text = '3051'
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 588
    OnConnect = ClientSocket1Connect
    OnDisconnect = ClientSocket1Disconnect
    OnRead = ClientSocket1Read
    OnError = ClientSocket1Error
    Left = 64
    Top = 152
  end
  object SaveDialog1: TSaveDialog
    Left = 16
    Top = 144
  end
end
