object FrmExecutar: TFrmExecutar
  Left = 299
  Top = 197
  Width = 349
  Height = 209
  Caption = 'Executa Aplicativo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 333
    Height = 171
    Align = alClient
    BevelInner = bvLowered
    BevelWidth = 2
    TabOrder = 0
    Visible = False
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 100
      Height = 13
      Caption = 'Diret'#243'rio de ORIGEM'
    end
    object Label2: TLabel
      Left = 11
      Top = 55
      Width = 105
      Height = 13
      Caption = 'Diret'#243'rio de DESTINO'
    end
    object Label3: TLabel
      Left = 54
      Top = 83
      Width = 62
      Height = 13
      Caption = 'APLICATIVO'
    end
    object BitBtn1: TBitBtn
      Left = 16
      Top = 120
      Width = 307
      Height = 28
      Caption = 'Sem Leitura do Arquivo "ExecutarRede????.ini"'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object EdtOrigem: TEdit
      Left = 120
      Top = 23
      Width = 200
      Height = 21
      TabOrder = 1
    end
    object EdtDestino: TEdit
      Left = 120
      Top = 50
      Width = 200
      Height = 21
      TabOrder = 2
    end
    object EdtAplicativo: TEdit
      Left = 120
      Top = 79
      Width = 200
      Height = 21
      TabOrder = 3
    end
  end
end
