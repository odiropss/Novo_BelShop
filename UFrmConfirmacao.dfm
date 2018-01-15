object FrmConfirmacao: TFrmConfirmacao
  Left = 459
  Top = 240
  ActiveControl = Bt_ConfirmarBotaoUm
  BorderStyle = bsNone
  Caption = 'Confirma'#231#227'o de Consilia'#231#227'o'
  ClientHeight = 91
  ClientWidth = 417
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 417
    Height = 91
    Align = alClient
    BevelInner = bvLowered
    BevelWidth = 4
    Color = clSilver
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 401
      Height = 16
      Align = alTop
      Alignment = taCenter
      Caption = 'Confirma'#231#227'o de Concilia'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bt_ConfirmarBotaoUm: TJvXPButton
      Left = 20
      Top = 36
      Width = 122
      Height = 36
      Caption = 'Como Dinheiro'
      TabOrder = 0
      ShowFocusRect = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_ConfirmarBotaoUmClick
    end
    object Bt_ConfirmarBotaoDois: TJvXPButton
      Left = 148
      Top = 36
      Width = 122
      Height = 36
      Caption = 'Como Despesa'
      TabOrder = 1
      ShowFocusRect = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_ConfirmarBotaoUmClick
    end
    object Bt_Abandonar: TJvXPButton
      Left = 275
      Top = 36
      Width = 122
      Height = 36
      Caption = 'Abandonar'
      TabOrder = 2
      ShowFocusRect = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_ConfirmarBotaoUmClick
    end
  end
end
