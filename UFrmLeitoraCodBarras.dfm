object FrmLeitoraCodBarras: TFrmLeitoraCodBarras
  Left = 414
  Top = 134
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Checkout - Leitora de C'#243'digo de Barras (EAN13)'
  ClientHeight = 214
  ClientWidth = 541
  Color = clSilver
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PC_Principal: TPageControl
    Left = 0
    Top = 0
    Width = 541
    Height = 214
    ActivePage = Ts_LeitoraSimples
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MultiLine = True
    ParentFont = False
    TabOrder = 0
    object Ts_LeitoraCheckOut: TTabSheet
      Tag = 9999
      Caption = 'CheckOut'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Highlighted = True
      ParentFont = False
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 533
        Height = 186
        Align = alClient
        Color = clSilver
        TabOrder = 0
        object Label1: TLabel
          Left = 24
          Top = 13
          Width = 91
          Height = 13
          Caption = 'Qdt/Embalagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 127
          Top = 13
          Width = 98
          Height = 13
          Caption = 'C'#243'digo de Barras'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bt_Processar: TJvXPButton
          Left = 334
          Top = 31
          Width = 35
          Height = 30
          Caption = 'OK'
          TabOrder = 2
          TabStop = False
          ShowFocusRect = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_ProcessarClick
        end
        object Bt_Fechar: TJvXPButton
          Tag = 99
          Left = 396
          Top = 25
          Width = 119
          Height = 38
          Caption = '    Fechar'#13#10'Diverg'#234'ncias'
          TabOrder = 3
          TabStop = False
          ShowFocusRect = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_FecharClick
        end
        object EdtQtdEmbalagem: TCurrencyEdit
          Left = 23
          Top = 31
          Width = 91
          Height = 30
          TabStop = False
          AutoSize = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Value = 1.000000000000000000
          OnEnter = EdtQtdEmbalagemEnter
          OnExit = EdtQtdEmbalagemExit
        end
        object Gb_CheckOut_Erro: TGroupBox
          Left = 1
          Top = 132
          Width = 531
          Height = 53
          Align = alBottom
          Caption = ' CheckOut Erros '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object PBar_CheckOut_Erro: TJvGradientProgressBar
            Left = 1
            Top = 14
            Width = 529
            Height = 38
            BarColorFrom = 14671871
            BarColorTo = clRed
            Position = 80
            Smooth = True
            Align = alClient
            ParentColor = True
          end
          object Lab_CheckOut_Erro: TLabel
            Left = 125
            Top = 1
            Width = 53
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = ' 0 % '
            Color = clRed
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
        end
        object Gb_CheckOut_OK: TGroupBox
          Left = 1
          Top = 79
          Width = 531
          Height = 53
          Align = alBottom
          Caption = ' CheckOut OK '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          object PBar_CheckOut_OK: TJvGradientProgressBar
            Left = 1
            Top = 14
            Width = 529
            Height = 38
            BarColorFrom = 16755370
            BarColorTo = 16744448
            Position = 80
            Smooth = True
            Align = alClient
            ParentColor = True
          end
          object Lab_CheckOut_OK: TLabel
            Left = 125
            Top = -1
            Width = 53
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = ' 0 % '
            Color = 16744448
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
        end
        object EdtCodBarras: TJvEdit
          Left = 125
          Top = 31
          Width = 200
          Height = 30
          Alignment = taRightJustify
          Modified = False
          Color = 8454143
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          Text = '0'
          OnChange = EdtCodBarrasChange
          OnKeyDown = EdtCodBarrasKeyDown
        end
      end
    end
    object Ts_LeitoraSimples: TTabSheet
      Tag = 9999
      Caption = 'Leitora de C'#243'digo de Barras'
      Highlighted = True
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 533
        Height = 186
        Align = alClient
        TabOrder = 0
        object Label3: TLabel
          Left = 46
          Top = 12
          Width = 163
          Height = 24
          Caption = 'C'#243'digo de Barras'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Panel3: TPanel
          Left = 1
          Top = 48
          Width = 531
          Height = 137
          Align = alBottom
          TabOrder = 3
          object Label4: TLabel
            Left = 8
            Top = 10
            Width = 45
            Height = 13
            Caption = 'Produto'
          end
          object Label5: TLabel
            Left = 8
            Top = 36
            Width = 65
            Height = 13
            Caption = 'Fornecedor'
          end
          object Label6: TLabel
            Left = 328
            Top = 64
            Width = 89
            Height = 13
            Caption = 'Endere'#231'amento'
          end
          object Label7: TLabel
            Left = 8
            Top = 90
            Width = 69
            Height = 13
            Caption = 'Observa'#231#227'o'
          end
          object Label8: TLabel
            Left = 10
            Top = 64
            Width = 98
            Height = 13
            Caption = 'C'#243'digo de Barras'
          end
          object EdtCBSProduto: TEdit
            Left = 57
            Top = 8
            Width = 464
            Height = 19
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object EdtCBSForn: TEdit
            Left = 76
            Top = 34
            Width = 445
            Height = 19
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object EdtCBSEndereco: TEdit
            Left = 421
            Top = 60
            Width = 100
            Height = 22
            Color = 8454143
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object MemCBSObs: TMemo
            Left = 80
            Top = 91
            Width = 353
            Height = 40
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              'dfafdsa')
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object EdtCBSCodBarras: TEdit
            Left = 111
            Top = 61
            Width = 202
            Height = 19
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
        end
        object EdtCodBarrasSimples: TJvEdit
          Left = 214
          Top = 7
          Width = 200
          Height = 35
          Alignment = taRightJustify
          Modified = False
          Color = 8454143
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          Text = '0'
          OnChange = EdtCodBarrasSimplesChange
          OnKeyDown = EdtCodBarrasSimplesKeyDown
        end
        object Bt_CodBarrasSimples: TJvXPButton
          Left = 421
          Top = 7
          Width = 42
          Height = 36
          Caption = 'OK'
          TabOrder = 1
          TabStop = False
          ShowFocusRect = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_CodBarrasSimplesClick
        end
        object Bt_CodBarrasSimplesRetornar: TJvXPButton
          Left = 437
          Top = 146
          Width = 90
          Height = 32
          Caption = 'Retornar'
          TabOrder = 2
          TabStop = False
          Glyph.Data = {
            07544269746D6170F6000000424DF60000000000000076000000280000001000
            0000100000000100040000000000800000000000000000000000100000001000
            0000000000000000BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0
            C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF0077777700000087777777770AAAAA00877777770AAAAAA2077777770AAAAA
            2A20777777000000A22077777777777700207777777777777700777707777777
            77007770077777770020770A00000000A22070AAAAAAAAAA2A200AAAAAAAAAAA
            A20770AAAAAAAAAA0077770A0000000087777770077777777777777707777777
            7777}
          ShowFocusRect = True
          Spacing = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_CodBarrasSimplesRetornarClick
        end
      end
    end
  end
  object CorCaptionForm: TJvGradientCaption
    Active = False
    Captions = <
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
      end>
    DefaultFont = False
    FormCaption = 'Checkout - Leitora de C'#243'digo de Barras (EAN13)'
    FontInactiveColor = 16777170
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clCaptionText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    StartColor = 15522303
    EndColor = 8388863
    Left = 357
    Top = 65519
  end
end
