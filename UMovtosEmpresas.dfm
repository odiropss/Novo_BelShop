object FrmMovtosEmpresas: TFrmMovtosEmpresas
  Left = 276
  Top = 119
  Width = 680
  Height = 416
  Caption = 'Atualiza Movimentos das Empresas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Dbg_Empresas: TDBGrid
    Left = 0
    Top = 53
    Width = 664
    Height = 325
    Align = alClient
    DataSource = DMMovtosEmpresas.DS_EmpProcessa
    FixedColor = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_FILIAL'
        Title.Alignment = taRightJustify
        Title.Caption = 'Cod Filial'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDERECO_IP'
        Title.Caption = 'Endere'#231'o IP'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_EMP'
        Title.Alignment = taRightJustify
        Title.Caption = 'Cod Emp'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAZAO_SOCIAL'
        Title.Caption = 'Raz'#227'o Social'
        Width = 350
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 664
    Height = 53
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      664
      53)
    object Bt_Atualizar: TJvXPButton
      Left = 235
      Top = 11
      Width = 129
      Height = 33
      Caption = 'Atualizar'
      TabOrder = 0
      Anchors = [akTop]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_AtualizarClick
    end
    object EdtParamStr: TEdit
      Left = 16
      Top = 8
      Width = 49
      Height = 21
      TabOrder = 1
      Visible = False
    end
    object Lbx_EmpresasProcessar: TListBox
      Left = 481
      Top = 8
      Width = 121
      Height = 41
      ItemHeight = 13
      TabOrder = 2
    end
    object Bt_Estoques: TJvXPButton
      Left = 69
      Top = 3
      Width = 76
      Height = 16
      Caption = 'Estoques'
      TabOrder = 3
      Anchors = [akTop]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_EstoquesClick
    end
  end
end
