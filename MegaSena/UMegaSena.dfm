object FrmMegaSenha: TFrmMegaSenha
  Left = 237
  Top = 116
  AutoScroll = False
  Caption = 'Confer'#234'ncia MegaSenha'
  ClientHeight = 564
  ClientWidth = 1000
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1000
    Height = 564
    Align = alClient
    BevelInner = bvLowered
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    DesignSize = (
      1000
      564)
    object GroupBox1: TGroupBox
      Left = 317
      Top = 9
      Width = 359
      Height = 80
      Anchors = [akTop]
      Caption = ' Digite os N'#250'meros Sorteados '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Num1: TCurrencyEdit
        Left = 14
        Top = 32
        Width = 38
        Height = 28
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 2
        ParentFont = False
        TabOrder = 0
        OnExit = Num1Exit
      end
      object Num2: TCurrencyEdit
        Left = 71
        Top = 32
        Width = 38
        Height = 28
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 2
        ParentFont = False
        TabOrder = 1
        OnExit = Num2Exit
      end
      object Num4: TCurrencyEdit
        Left = 187
        Top = 32
        Width = 38
        Height = 28
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 2
        ParentFont = False
        TabOrder = 3
        OnExit = Num4Exit
      end
      object Num3: TCurrencyEdit
        Left = 130
        Top = 32
        Width = 38
        Height = 28
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 2
        ParentFont = False
        TabOrder = 2
        OnExit = Num3Exit
      end
      object Num5: TCurrencyEdit
        Left = 243
        Top = 32
        Width = 38
        Height = 28
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 2
        ParentFont = False
        TabOrder = 4
        OnExit = Num5Exit
      end
      object Num6: TCurrencyEdit
        Left = 299
        Top = 32
        Width = 38
        Height = 28
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 2
        ParentFont = False
        TabOrder = 5
        OnExit = Num6Exit
      end
    end
    object GroupBox2: TGroupBox
      Left = 2
      Top = 139
      Width = 996
      Height = 423
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = '  Resultado dos Jogos '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Memo1: TMemo
        Left = 1
        Top = 14
        Width = 994
        Height = 408
        TabStop = False
        Align = alClient
        Color = 15794145
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 913
        Top = 382
        Width = 994
        Height = 408
        TabStop = False
        DataSource = DS_Jogos
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Visible = False
        Columns = <
          item
            Color = 13303807
            Expanded = False
            FieldName = 'Cartao'
            Width = 70
            Visible = True
          end
          item
            Color = 14155694
            Expanded = False
            FieldName = 'Dez1'
            Title.Caption = '1'#170' Dez'
            Width = 50
            Visible = True
          end
          item
            Color = 14155694
            Expanded = False
            FieldName = 'Sorteado1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Caption = 'Acerto'
            Visible = True
          end
          item
            Color = 12698111
            Expanded = False
            FieldName = 'Dez2'
            Title.Caption = '2'#170' Dez'
            Width = 50
            Visible = True
          end
          item
            Color = 12698111
            Expanded = False
            FieldName = 'Sorteado2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Caption = 'Acerto'
            Visible = True
          end
          item
            Color = 16777164
            Expanded = False
            FieldName = 'Dez3'
            Title.Caption = '3'#170' Dez'
            Width = 50
            Visible = True
          end
          item
            Color = 16777164
            Expanded = False
            FieldName = 'Sorteado3'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Caption = 'Acerto'
            Visible = True
          end
          item
            Color = 16759295
            Expanded = False
            FieldName = 'Dez4'
            Title.Caption = '4'#170' Dez'
            Width = 50
            Visible = True
          end
          item
            Color = 16759295
            Expanded = False
            FieldName = 'Sorteado4'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Caption = 'Acerto'
            Visible = True
          end
          item
            Color = 14408667
            Expanded = False
            FieldName = 'Dez5'
            Title.Caption = '5'#170' Dez'
            Width = 50
            Visible = True
          end
          item
            Color = 14408667
            Expanded = False
            FieldName = 'Sorteado5'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Caption = 'Acerto'
            Visible = True
          end
          item
            Color = 16760767
            Expanded = False
            FieldName = 'Dez6'
            Title.Caption = '6'#170' Dez'
            Width = 50
            Visible = True
          end
          item
            Color = 16760767
            Expanded = False
            FieldName = 'Sorteado6'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Caption = 'Acerto'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Situa'#231#227'o'
            Width = 400
            Visible = True
          end>
      end
    end
    object JvXPButton1: TJvXPButton
      Left = 440
      Top = 99
      Width = 113
      Height = 33
      Caption = 'Conferir ...'
      TabOrder = 2
      TabStop = False
      Glyph.Data = {
        07544269746D61705E060000424D5E0600000000000036040000280000001600
        000017000000010008000000000028020000C30E0000C30E0000000100000000
        000000FF0000FFFFFF0080808000C0C0C00000000000FF000000FFFF00000000
        FF0000FFFF0045CABF004B737F00D0B4B400CC625700FF31310000CEFF000079
        FF000029FF005E5EFF00BDBDFF00502B2D000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000010101010101010101010101010101010101010101010000010101010101
        0101010101010101010101040404030100000101010101010101010101010101
        0101040701070401000001010101010101010101010101010104070101070401
        0000010101010101010101010101010104070101070704010000010101010101
        0101010101010104070101070704010100000101010101010101010101010407
        0101070704010101000001010101010101010101010407010107070401010101
        0000010101010101010101010407010107070401010101010000010101010101
        0101010404040307070401010101010100000101010101010404040404040407
        0401010101010101000001010101040406010601010404040101010101010101
        0000010101040106010601010101040101010101010101010000010101040601
        0601060106010401010101010101010100000101040601060101010601060104
        0101010101010101000001010401060106010601060101040101010101010101
        0000010104060106010601060106010401010101010101010000010104010601
        0601060106010104010101010101010100000101010401060101010601060401
        0101010101010101000001010104060106010601060104010101010101010101
        0000010101010404010101060404010101010101010101010000010101010101
        0404040401010101010101010101010100000101010101010101010101010101
        01010101010101010000}
      Anchors = [akTop]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = JvXPButton1Click
    end
  end
  object CDS_Jogos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 720
    Top = 64
    object CDS_JogosCartao: TStringField
      DisplayLabel = 'Cart'#227'o'
      FieldName = 'Cartao'
      Size = 10
    end
    object CDS_JogosDez1: TIntegerField
      DisplayLabel = '1'#170' Dezena'
      FieldName = 'Dez1'
    end
    object CDS_JogosSorteado1: TStringField
      Alignment = taCenter
      DisplayLabel = 'Sorteado'
      FieldName = 'Sorteado1'
      Size = 1
    end
    object CDS_JogosDez2: TIntegerField
      DisplayLabel = '2'#170' Dezena'
      FieldName = 'Dez2'
    end
    object CDS_JogosSorteado2: TStringField
      Alignment = taCenter
      DisplayLabel = 'Sorteado'
      FieldName = 'Sorteado2'
      Size = 1
    end
    object CDS_JogosDez3: TIntegerField
      DisplayLabel = '3'#170' Dezena'
      FieldName = 'Dez3'
    end
    object CDS_JogosSorteado3: TStringField
      Alignment = taCenter
      DisplayLabel = 'Sorteado'
      FieldName = 'Sorteado3'
      Size = 1
    end
    object CDS_JogosDez4: TIntegerField
      DisplayLabel = '4'#170' Dezena'
      FieldName = 'Dez4'
    end
    object CDS_JogosSorteado4: TStringField
      Alignment = taCenter
      DisplayLabel = 'Sorteado'
      FieldName = 'Sorteado4'
      Size = 1
    end
    object CDS_JogosDez5: TIntegerField
      DisplayLabel = '5'#170' Dezena'
      FieldName = 'Dez5'
    end
    object CDS_JogosSorteado5: TStringField
      Alignment = taCenter
      DisplayLabel = 'Sorteado'
      FieldName = 'Sorteado5'
      Size = 1
    end
    object CDS_JogosDez6: TIntegerField
      DisplayLabel = '6'#170' Dezena'
      FieldName = 'Dez6'
    end
    object CDS_JogosSorteado6: TStringField
      Alignment = taCenter
      DisplayLabel = 'Sorteado'
      FieldName = 'Sorteado6'
      Size = 1
    end
    object CDS_JogosSituao: TStringField
      FieldName = 'Situa'#231#227'o'
      Size = 30
    end
  end
  object DS_Jogos: TDataSource
    DataSet = CDS_Jogos
    Left = 800
    Top = 80
  end
end
