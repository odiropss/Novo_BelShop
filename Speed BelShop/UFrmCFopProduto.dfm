object FrmCFopProduto: TFrmCFopProduto
  Left = 369
  Top = 119
  Width = 521
  Height = 499
  ActiveControl = EdtCFop
  BorderIcons = [biSystemMenu]
  Caption = 'CFOP do Produto'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = 'Informe o CFOP do Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object Panel2: TPanel
    Left = 0
    Top = 420
    Width = 505
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    object Bt_OK: TJvXPButton
      Left = 202
      Top = 6
      Width = 104
      Height = 32
      Caption = 'OK'
      TabOrder = 0
      Glyph.Data = {
        07544269746D61706A030000424D6A0300000000000076000000280000001C00
        00001B0000000100080000000000F40200000000000000000000100000000000
        0000000000000000800000800000008080008000000080008000808000008080
        8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00080808080808080808080808080808080808080808080808080808080807
        0707070707070707070707070707070708080808080808080808080000000000
        0000000000000000000000070707080808080808080808000808080808080808
        0808080808080007070707070808080808080800080F0F0F0700000F0F0F0F0F
        0F080007070707070707080808080800080F0F0F000E0E000F0F0F0F0F080007
        080808080808080808080800080F0F0F000E0E0E000F0F0F0F08000708080808
        0808080808080800080F0F0F000E0E0E0E000F0F0F0800070808080808080808
        08080800080F0F0F000E0E0E0E0E000F0F080007070708080808080808080800
        080F0F0F000E0E0E0E0E0E000F080007070707070808080808080800080F0F0F
        000E0E00000E0E0E00080007080707070707080808080800080F0F0F000E0E00
        0F000E0E0E000707080808070707070708080800080F0F0F000E0E000F0F000E
        0E0E0007080808080807070707070800080F0F0F000E0E000F0F0F000E0E0E00
        080808080808080707070800080F0F0F000E0E000F0F0F0F000E0E0E00080808
        0808080808080800080F0F0F0000000F0F0F0F0F0F000E0E0E00080808080808
        080808000808080808080808080808080808000E0E0E00080808080808080800
        000000000000000000000000000007000E0E0E00080808080808080808080808
        080808080808080808080808000E0E0E00080808080808080808080808080808
        080808080808080808000E0E0E00080808080808080808080808080808080808
        080808080808000E0E0E00080808080808080808080808080808080808080808
        080808000E0E0E00080808080808080808080808080808080808080808080808
        000E0E0E00080808080808080808080808080808080808080808080808000E0E
        0008080808080808080808080808080808080808080808080808000E00080808
        0808080808080808080808080808080808080808080808000008080808080808
        08080808080808080808080808080808080808080808}
      OnClick = Bt_OKClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 7
    Top = 167
    Width = 491
    Height = 57
    Caption = ' Natureza da Opera'#231#227'o '
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object EdtDesNatOper: TEdit
      Left = 66
      Top = 24
      Width = 415
      Height = 21
      Color = 15527167
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object EdtCodNatOper: TEdit
      Left = 14
      Top = 24
      Width = 49
      Height = 21
      Color = 15527167
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 10
    Top = 226
    Width = 96
    Height = 57
    Caption = ' CST ICMS '
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object EdtCST_ICMS: TEdit
      Left = 24
      Top = 23
      Width = 49
      Height = 21
      Color = 15527167
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 106
    Top = 226
    Width = 96
    Height = 57
    Caption = ' CST IPI '
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object EdtCST_IPI: TEdit
      Left = 24
      Top = 23
      Width = 49
      Height = 21
      Color = 15527167
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object GroupBox4: TGroupBox
    Left = 203
    Top = 226
    Width = 96
    Height = 57
    Caption = ' CST PIS '
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object EdtCST_PIS: TEdit
      Left = 24
      Top = 23
      Width = 49
      Height = 21
      Color = 15527167
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object GroupBox5: TGroupBox
    Left = 300
    Top = 226
    Width = 96
    Height = 57
    Caption = ' CST COFINS '
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    object EdtCST_COFINS: TEdit
      Left = 24
      Top = 23
      Width = 49
      Height = 21
      Color = 15527167
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object GroupBox6: TGroupBox
    Left = 11
    Top = 288
    Width = 358
    Height = 57
    Caption = ' Informa o CFOP (C'#243'digo Fiscal da Opera'#231#227'o e Presta'#231#227'o) '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    object Label1: TLabel
      Left = 10
      Top = 28
      Width = 70
      Height = 13
      Caption = 'UF Emitente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 120
      Top = 28
      Width = 89
      Height = 13
      Caption = 'UF Destinat'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 250
      Top = 28
      Width = 33
      Height = 13
      Caption = 'CFOP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdtCFop: TEdit
      Left = 286
      Top = 24
      Width = 64
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 4
      ParentFont = False
      TabOrder = 2
      OnKeyPress = EdtCFopKeyPress
    end
    object EdtUFEmit: TEdit
      Left = 84
      Top = 24
      Width = 31
      Height = 21
      TabStop = False
      Color = 15527167
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object EdtUFDest: TEdit
      Left = 212
      Top = 24
      Width = 31
      Height = 21
      TabStop = False
      Color = 15527167
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object GroupBox7: TGroupBox
    Left = 6
    Top = 48
    Width = 491
    Height = 57
    Caption = ' Registro '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object EdtRegistro: TEdit
      Left = 16
      Top = 24
      Width = 466
      Height = 21
      Color = 15527167
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object GroupBox8: TGroupBox
    Left = 6
    Top = 107
    Width = 491
    Height = 57
    Caption = ' Tipo de Opera'#231#227'o '
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object EdtDesOper: TEdit
      Left = 66
      Top = 24
      Width = 415
      Height = 21
      Color = 15527167
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object EdtCodOper: TEdit
      Left = 14
      Top = 24
      Width = 49
      Height = 21
      Color = 15527167
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object GroupBox9: TGroupBox
    Left = 33
    Top = 345
    Width = 433
    Height = 69
    Caption = ' Observa'#231#227'o '
    TabOrder = 10
    object Memo1: TMemo
      Left = 2
      Top = 15
      Width = 429
      Height = 52
      Align = alClient
      Color = 8454143
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        
          'CFOP com primeiro caracter = 1, 2 ou 3, quando for opera'#231#227'o de e' +
          'ntrada,'
        ''
        
          'CFOP com primeiro caracter = 5, 6 ou 7, quando for opera'#231#227'o de s' +
          'a'#237'da.')
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object GroupBox10: TGroupBox
    Left = 369
    Top = 288
    Width = 127
    Height = 57
    Caption = ' CFOP Deste Docto'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    object EdtCFopDocto: TEdit
      Left = 24
      Top = 23
      Width = 76
      Height = 21
      Color = 15527167
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object GroupBox11: TGroupBox
    Left = 396
    Top = 226
    Width = 96
    Height = 57
    Caption = 'Subst. Tribut.'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    object EdtInd_SubTrib: TEdit
      Left = 24
      Top = 23
      Width = 49
      Height = 21
      Color = 15527167
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
end
