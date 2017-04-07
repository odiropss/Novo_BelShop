object FrmAtualizaEstoques: TFrmAtualizaEstoques
  Left = 441
  Top = 194
  Width = 273
  Height = 84
  Caption = 'Atualiza Estoques Lojas'
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
    Height = 46
    Caption = 'Atualiza Estoques Empresa'
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
