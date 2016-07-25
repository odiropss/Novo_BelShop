object FrmSolicitacaoLojas: TFrmSolicitacaoLojas
  Left = 441
  Top = 206
  Width = 324
  Height = 95
  AutoSize = True
  Caption = 'Transfere Solicita'#231#245'es das Lojas'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 308
    Height = 57
    Align = alClient
    TabOrder = 0
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 136
    Top = 8
  end
end
