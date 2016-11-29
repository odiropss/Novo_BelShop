object FrmControleKits: TFrmControleKits
  Left = 236
  Top = 110
  Align = alClient
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Controle de Kits'
  ClientHeight = 562
  ClientWidth = 956
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    956
    562)
  PixelsPerInch = 96
  TextHeight = 13
  object Gb_KitFiltroLoja: TGroupBox
    Left = 0
    Top = 0
    Width = 956
    Height = 52
    Align = alTop
    Caption = ' Loja '
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      956
      52)
    object EdtKitCodLoja: TCurrencyEdit
      Left = 12
      Top = 21
      Width = 36
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnChange = EdtKitCodLojaChange
      OnExit = EdtKitCodLojaExit
    end
    object Bt_KitBuscaLoja: TJvXPButton
      Tag = 92
      Left = 53
      Top = 19
      Width = 26
      Height = 25
      TabOrder = 1
      TabStop = False
      Glyph.Data = {
        07544269746D617066010000424D660100000000000076000000280000001400
        0000140000000100040000000000F00000000000000000000000100000001000
        0000000000000000BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0
        C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00333333333333333333330000300000000000003333330000307888888888
        80333333000030F77777777780333333000030F99777777780333333000030FF
        FFFFFFFF70333333000030000000000000333333000033333333333333333333
        0000333003333333333333330000333003333333333333330000333003333330
        000000030000333003303330FFFFFF030000333008300330F4444F0300003338
        00000030FFFFFF030000333380000030F4444F030000333333300330FFFFFF03
        0000333333303330F44F00030000333333333330FFFF00330000333333333330
        000003330000333333333333333333330000}
      ShowFocusRect = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      OnClick = Bt_KitBuscaLojaClick
    end
    object EdtKitDesLoja: TEdit
      Left = 85
      Top = 22
      Width = 852
      Height = 19
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = 14737632
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
  end
  object Panel10: TPanel
    Left = 0
    Top = 527
    Width = 956
    Height = 35
    Align = alBottom
    BevelInner = bvLowered
    BorderStyle = bsSingle
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object Bt_KitFechar: TJvXPButton
      Tag = 99
      Left = 852
      Top = 2
      Width = 100
      Height = 29
      Caption = 'Fechar'
      TabOrder = 2
      TabStop = False
      ShowFocusRect = True
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_KitFecharClick
    end
    object Bt_KitClipboard: TJvXPButton
      Tag = 8
      Left = 339
      Top = 2
      Width = 162
      Height = 29
      Caption = 'Salvar em Mem'#243'ria'
      TabOrder = 1
      ShowFocusRect = True
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_KitClipboardClick
    end
    object Bt_KitBuscaKits: TJvXPButton
      Tag = 91
      Left = 2
      Top = 2
      Width = 110
      Height = 29
      Caption = 'Buscar Kits'
      TabOrder = 0
      ShowFocusRect = True
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_KitBuscaKitsClick
    end
    object Pan_KitsApresentacao: TPanel
      Left = 112
      Top = 2
      Width = 227
      Height = 29
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 3
      object Rb_KitAnalitico: TJvRadioButton
        Left = 36
        Top = 8
        Width = 73
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Anal'#237'tico'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = Rb_KitAnaliticoClick
        OnKeyUp = Rb_KitAnaliticoKeyUp
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        LinkedControls = <>
      end
      object Rb_KitSintetico: TJvRadioButton
        Left = 125
        Top = 9
        Width = 62
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Sint'#233'tico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Rb_KitAnaliticoClick
        OnKeyUp = Rb_KitAnaliticoKeyUp
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        LinkedControls = <>
      end
    end
  end
  object PC_Kit: TPageControl
    Tag = 9999
    Left = 0
    Top = 52
    Width = 956
    Height = 475
    ActivePage = Ts_KitKits
    Align = alClient
    TabOrder = 2
    OnChange = PC_KitChange
    object Ts_KitKits: TTabSheet
      Caption = ' Rela'#231#227'o de Kits '
      Highlighted = True
      object Dbg_KitKits: TDBGridJul
        Left = 0
        Top = 0
        Width = 948
        Height = 447
        Align = alClient
        Color = 15004403
        DataSource = DMVirtual.DS_V_Kits
        FixedColor = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = Dbg_KitKitsDrawColumnCell
        CorComFoco = 15004403
        SairComEnter = False
        EditDataSetCheck = False
        ValorCampoCheck = 'SIM'
        ValorCampoUnCheck = 'NAO'
        ImageChecked.Data = {
          3E020000424D3E0200000000000036000000280000000D0000000D0000000100
          180000000000080200000000000000000000000000000000000080511C80511C
          80511C80511C80511C80511C80511C80511C80511C80511C80511C80511C8051
          1C0080511CF1F3F3F3F5F5F6F7F7F8F9F9F9FAFAFBFCFCFDFDFDFEFEFEFFFFFF
          FFFFFFFFFFFF80511C0080511CEFF1F1F1F3F3F3F5F5F6F7F7F8F9F9F9FAFAFB
          FCFCFDFDFDFEFEFEFFFFFFFFFFFF80511C0080511CECEFEFEFF1F1F1F3F3F3F5
          F521A121F8F9F9F9FAFAFBFCFCFDFDFDFEFEFEFFFFFF80511C0080511CE9ECEC
          ECEFEFEFF1F121A12121A12121A121F8F9F9F9FAFAFBFCFCFDFDFDFEFEFE8051
          1C0080511CE6EAEAE9ECEC21A12121A12121A12121A12121A121F8F9F9F9FAFA
          FBFCFCFDFDFD80511C0080511CE3E7E7E6EAEA21A12121A121EFF1F121A12121
          A12121A121F8F9F9F9FAFAFBFCFC80511C0080511CE1E5E5E3E7E721A121E9EC
          ECECEFEFEFF1F121A12121A12121A121F8F9F9F9FAFA80511C0080511CDFE3E3
          E1E5E5E3E7E7E6EAEAE9ECECECEFEFEFF1F121A12121A121F6F7F7F8F9F98051
          1C0080511CDDE2E2DFE3E3E1E5E5E3E7E7E6EAEAE9ECECECEFEFEFF1F121A121
          F3F5F5F6F7F780511C0080511CDDE2E2DDE2E2DFE3E3E1E5E5E3E7E7E6EAEAE9
          ECECECEFEFEFF1F1F1F3F3F3F5F580511C0080511CDDE2E2DDE2E2DDE2E2DFE3
          E3E1E5E5E3E7E7E6EAEAE9ECECECEFEFEFF1F1F1F3F380511C0080511C80511C
          80511C80511C80511C80511C80511C80511C80511C80511C80511C80511C8051
          1C00}
        ImageUnChecked.Data = {
          3E020000424D3E0200000000000036000000280000000D0000000D0000000100
          180000000000080200000000000000000000000000000000000080511C80511C
          80511C80511C80511C80511C80511C80511C80511C80511C80511C80511C8051
          1C0080511CEFF1F1F1F3F3F4F5F5F6F7F7F8F9F9FAFBFBFCFDFDFEFEFEFFFFFF
          FFFFFFFFFFFF80511C0080511CECEFEFEFF1F1F1F3F3F4F5F5F6F7F7F8F9F9FA
          FBFBFCFDFDFEFEFEFFFFFFFFFFFF80511C0080511CE9ECECECEFEFEFF1F1F1F3
          F3F4F5F5F6F7F7F8F9F9FAFBFBFCFDFDFEFEFEFFFFFF80511C0080511CE5E8E8
          E9ECECECEFEFEFF1F1F1F3F3F4F5F5F6F7F7F8F9F9FAFBFBFCFDFDFEFEFE8051
          1C0080511CE2E5E5E5E8E8E9ECECECEFEFEFF1F1F1F3F3F4F5F5F6F7F7F8F9F9
          FAFBFBFCFDFD80511C0080511CDEE2E2E2E5E5E5E8E8E9ECECECEFEFEFF1F1F1
          F3F3F4F5F5F6F7F7F8F9F9FAFBFB80511C0080511CDBE0E0DEE2E2E2E5E5E5E8
          E8E9ECECECEFEFEFF1F1F1F3F3F4F5F5F6F7F7F8F9F980511C0080511CD9DEDE
          DBE0E0DEE2E2E2E5E5E5E8E8E9ECECECEFEFEFF1F1F1F3F3F4F5F5F6F7F78051
          1C0080511CD7DCDCD9DEDEDBE0E0DEE2E2E2E5E5E5E8E8E9ECECECEFEFEFF1F1
          F1F3F3F4F5F580511C0080511CD7DCDCD7DCDCD9DEDEDBE0E0DEE2E2E2E5E5E5
          E8E8E9ECECECEFEFEFF1F1F1F3F380511C0080511CD7DCDCD7DCDCD7DCDCD9DE
          DEDBE0E0DEE2E2E2E5E5E5E8E8E9ECECECEFEFEFF1F180511C0080511C80511C
          80511C80511C80511C80511C80511C80511C80511C80511C80511C80511C8051
          1C00}
        Columns = <
          item
            Expanded = False
            FieldName = 'Tipo'
            Width = 60
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'Codigo'
            Title.Alignment = taRightJustify
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quant'
            Title.Alignment = taRightJustify
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Vlr_Desc'
            Title.Alignment = taRightJustify
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Vlr_Total'
            Title.Alignment = taRightJustify
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Dta_Validade_Ini'
            Title.Alignment = taCenter
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Dta_Validade_Fim'
            Width = 90
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'Cod_Barras'
            Title.Alignment = taRightJustify
            Width = 150
            Visible = True
          end>
      end
    end
    object Ts_KitNotas: TTabSheet
      Tag = 9999
      Caption = ' Rela'#231#227'o de Notas '
      ImageIndex = 1
      object Dbg_KitNotas: TDBGridJul
        Left = 0
        Top = 0
        Width = 948
        Height = 447
        Align = alClient
        Color = 15004403
        DataSource = DMVirtual.DS_V_KitsNotas
        FixedColor = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = Dbg_KitNotasDrawColumnCell
        CorComFoco = 15004403
        SairComEnter = False
        EditDataSetCheck = False
        ValorCampoCheck = 'SIM'
        ValorCampoUnCheck = 'NAO'
        ImageChecked.Data = {
          3E020000424D3E0200000000000036000000280000000D0000000D0000000100
          180000000000080200000000000000000000000000000000000080511C80511C
          80511C80511C80511C80511C80511C80511C80511C80511C80511C80511C8051
          1C0080511CF1F3F3F3F5F5F6F7F7F8F9F9F9FAFAFBFCFCFDFDFDFEFEFEFFFFFF
          FFFFFFFFFFFF80511C0080511CEFF1F1F1F3F3F3F5F5F6F7F7F8F9F9F9FAFAFB
          FCFCFDFDFDFEFEFEFFFFFFFFFFFF80511C0080511CECEFEFEFF1F1F1F3F3F3F5
          F521A121F8F9F9F9FAFAFBFCFCFDFDFDFEFEFEFFFFFF80511C0080511CE9ECEC
          ECEFEFEFF1F121A12121A12121A121F8F9F9F9FAFAFBFCFCFDFDFDFEFEFE8051
          1C0080511CE6EAEAE9ECEC21A12121A12121A12121A12121A121F8F9F9F9FAFA
          FBFCFCFDFDFD80511C0080511CE3E7E7E6EAEA21A12121A121EFF1F121A12121
          A12121A121F8F9F9F9FAFAFBFCFC80511C0080511CE1E5E5E3E7E721A121E9EC
          ECECEFEFEFF1F121A12121A12121A121F8F9F9F9FAFA80511C0080511CDFE3E3
          E1E5E5E3E7E7E6EAEAE9ECECECEFEFEFF1F121A12121A121F6F7F7F8F9F98051
          1C0080511CDDE2E2DFE3E3E1E5E5E3E7E7E6EAEAE9ECECECEFEFEFF1F121A121
          F3F5F5F6F7F780511C0080511CDDE2E2DDE2E2DFE3E3E1E5E5E3E7E7E6EAEAE9
          ECECECEFEFEFF1F1F1F3F3F3F5F580511C0080511CDDE2E2DDE2E2DDE2E2DFE3
          E3E1E5E5E3E7E7E6EAEAE9ECECECEFEFEFF1F1F1F3F380511C0080511C80511C
          80511C80511C80511C80511C80511C80511C80511C80511C80511C80511C8051
          1C00}
        ImageUnChecked.Data = {
          3E020000424D3E0200000000000036000000280000000D0000000D0000000100
          180000000000080200000000000000000000000000000000000080511C80511C
          80511C80511C80511C80511C80511C80511C80511C80511C80511C80511C8051
          1C0080511CEFF1F1F1F3F3F4F5F5F6F7F7F8F9F9FAFBFBFCFDFDFEFEFEFFFFFF
          FFFFFFFFFFFF80511C0080511CECEFEFEFF1F1F1F3F3F4F5F5F6F7F7F8F9F9FA
          FBFBFCFDFDFEFEFEFFFFFFFFFFFF80511C0080511CE9ECECECEFEFEFF1F1F1F3
          F3F4F5F5F6F7F7F8F9F9FAFBFBFCFDFDFEFEFEFFFFFF80511C0080511CE5E8E8
          E9ECECECEFEFEFF1F1F1F3F3F4F5F5F6F7F7F8F9F9FAFBFBFCFDFDFEFEFE8051
          1C0080511CE2E5E5E5E8E8E9ECECECEFEFEFF1F1F1F3F3F4F5F5F6F7F7F8F9F9
          FAFBFBFCFDFD80511C0080511CDEE2E2E2E5E5E5E8E8E9ECECECEFEFEFF1F1F1
          F3F3F4F5F5F6F7F7F8F9F9FAFBFB80511C0080511CDBE0E0DEE2E2E2E5E5E5E8
          E8E9ECECECEFEFEFF1F1F1F3F3F4F5F5F6F7F7F8F9F980511C0080511CD9DEDE
          DBE0E0DEE2E2E2E5E5E5E8E8E9ECECECEFEFEFF1F1F1F3F3F4F5F5F6F7F78051
          1C0080511CD7DCDCD9DEDEDBE0E0DEE2E2E2E5E5E5E8E8E9ECECECEFEFEFF1F1
          F1F3F3F4F5F580511C0080511CD7DCDCD7DCDCD9DEDEDBE0E0DEE2E2E2E5E5E5
          E8E8E9ECECECEFEFEFF1F1F1F3F380511C0080511CD7DCDCD7DCDCD7DCDCD9DE
          DEDBE0E0DEE2E2E2E5E5E5E8E8E9ECECECEFEFEFF1F180511C0080511C80511C
          80511C80511C80511C80511C80511C80511C80511C80511C80511C80511C8051
          1C00}
        Columns = <
          item
            Expanded = False
            FieldName = 'Tipo'
            Width = 60
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'Num_Codigo'
            Title.Alignment = taRightJustify
            Width = 100
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'Codigo'
            Title.Alignment = taRightJustify
            Width = 135
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Width = 250
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Data1'
            Title.Alignment = taCenter
            Width = 190
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Data2'
            Title.Alignment = taCenter
            Width = 140
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'Numero'
            Title.Alignment = taRightJustify
            Width = 110
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'Cod_Produto'
            Title.Alignment = taRightJustify
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Des_Prod'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quant'
            Title.Alignment = taRightJustify
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Vlr_Bruto'
            Title.Alignment = taRightJustify
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Per_Desc'
            Title.Alignment = taRightJustify
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Vlr_Desc'
            Title.Alignment = taRightJustify
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Vlr_Total'
            Title.Alignment = taRightJustify
            Width = 90
            Visible = True
          end>
      end
    end
  end
  object OdirPanApres: TPanel
    Left = 859
    Top = 4
    Width = 89
    Height = 33
    BevelInner = bvLowered
    BevelWidth = 2
    Caption = 'OdirPanApres'
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Visible = False
  end
  object Memo2: TMemo
    Left = 763
    Top = 534
    Width = 48
    Height = 20
    Anchors = [akBottom]
    Color = 8454143
    Lines.Strings = (
      'Memo2')
    TabOrder = 4
    Visible = False
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
    FormCaption = 'Controle de Kits'
    FontInactiveColor = 16777170
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clCaptionText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    StartColor = 15522303
    EndColor = 8388863
    Left = 560
    Top = 280
  end
end
