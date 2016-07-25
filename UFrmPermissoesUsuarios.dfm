object FrmPermissoesUsuarios: TFrmPermissoesUsuarios
  Left = 452
  Top = 172
  Width = 368
  Height = 109
  AutoSize = True
  Caption = 'Transfere Permiss'#245'es de Usu'#225'rios'
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
    Width = 352
    Height = 71
    Align = alClient
    TabOrder = 0
    object Bt_ExportaPermissoes: TJvXPButton
      Left = 105
      Top = 18
      Width = 137
      Height = 33
      Caption = 'Exporta Permiss'#245'es'
      TabOrder = 0
      OnClick = Bt_ExportaPermissoesClick
    end
  end
  object SQLQuery1: TSQLQuery
    Params = <>
    Left = 32
    Top = 16
  end
end
