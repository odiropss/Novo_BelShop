object FrmAtualizaSaldos: TFrmAtualizaSaldos
  Left = 366
  Top = 192
  Width = 273
  Height = 82
  Caption = 'Atualiza Saldo Diarios'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bt_Atualizar: TJvXPButton
    Left = 0
    Top = 0
    Width = 257
    Height = 44
    Caption = 'Atualiza Saldos Lojas'
    TabOrder = 0
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Bt_AtualizarClick
  end
end
