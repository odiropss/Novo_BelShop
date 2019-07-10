object FrmBuscaMetodo: TFrmBuscaMetodo
  Left = 244
  Top = 118
  Width = 1002
  Height = 573
  Caption = 'Web Service Linx - Busca Metodo'
  Color = clBtnFace
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 986
    Height = 205
    Align = alTop
    TabOrder = 0
    object Lab_LojaLinx: TLabel
      Left = 280
      Top = 8
      Width = 52
      Height = 13
      Caption = 'Loja Linx'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Lab_MetodoBuca: TLabel
      Left = 280
      Top = 50
      Width = 97
      Height = 13
      Caption = 'M'#233'todo a Buscar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Lab_Periodo1: TLabel
      Left = 242
      Top = 138
      Width = 130
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Per'#237'odo de'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Lab_Periodo2: TLabel
      Left = 482
      Top = 139
      Width = 8
      Height = 13
      Caption = 'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Lab_Dias: TLabel
      Left = 608
      Top = 136
      Width = 37
      Height = 13
      Caption = 'Dias 0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Lab_CodQualquer: TLabel
      Left = 498
      Top = 90
      Width = 117
      Height = 13
      Caption = 'Um C'#243'digo Qualquer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Lab_CodProduto: TLabel
      Left = 354
      Top = 90
      Width = 106
      Height = 13
      Caption = 'C'#243'digo do Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bt_BuscaMetodo: TJvXPButton
      Left = 488
      Top = 168
      Width = 161
      Height = 31
      Caption = ' Buscar M'#233'todo '
      TabOrder = 7
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_BuscaMetodoClick
    end
    object EdtCodLoja: TCurrencyEdit
      Left = 280
      Top = 24
      Width = 41
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 0
      OnExit = EdtCodLojaExit
    end
    object EdtDesLoja: TEdit
      Left = 328
      Top = 24
      Width = 361
      Height = 21
      TabStop = False
      Color = 15263999
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object DtEdt_DtaInicio: TcxDateEdit
      Left = 376
      Top = 132
      ParentFont = False
      Properties.ReadOnly = False
      Style.Color = clWindow
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.ButtonStyle = btsDefault
      StyleFocused.BorderColor = clMoneyGreen
      StyleFocused.Color = clSilver
      TabOrder = 5
      Width = 99
    end
    object DtEdt_DtaFim: TcxDateEdit
      Left = 498
      Top = 132
      ParentFont = False
      Properties.ReadOnly = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.ButtonStyle = btsDefault
      StyleFocused.BorderColor = clMoneyGreen
      StyleFocused.Color = clSilver
      TabOrder = 6
      Width = 99
    end
    object Cbx_Metodos: TComboBox
      Left = 280
      Top = 66
      Width = 408
      Height = 22
      Style = csOwnerDrawFixed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentFont = False
      TabOrder = 2
      OnChange = Cbx_MetodosChange
      Items.Strings = (
        'LinxLojas'
        'LinxGrupoLojas'
        'LinxVendedores'
        'LinxProdutos'
        'LinxProdutosCamposAdicionais'
        'LinxProdutosDetalhes'
        'LinxProdutosCodBar'
        'LinxClientesFornec'
        'LinxClientesFornecCamposAdicionais'
        'LinxMovimento'
        'LinxMovtosAjustesEntradas'
        'LinxMovtosAjustesSaidas'
        'LinxMovimentoTrocas'
        'LinxMovimentoOrigemDevolucoes'
        'LinxMovimentoSerial'
        'LinxMovimentoPlanos'
        'LinxAcoesPromocionais'
        'LinxMovimentoAcoesPromocionais'
        'LinxPedidosVenda'
        'LinxPlanosPedidoVenda'
        'LinxPedidosCompra'
        'LinxReducoesZ'
        'LinxSangriaSuprimentos'
        'LinxFaturas'
        'LinxLancContabil'
        'LinxProdutosDepositos')
    end
    object EdtCodQualquer: TEdit
      Left = 499
      Top = 104
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object EdtCodProduto: TEdit
      Left = 355
      Top = 104
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object Bt_BuscaLojas: TJvXPButton
      Left = 320
      Top = 168
      Width = 161
      Height = 31
      Caption = ' Buscar Loja(s)'
      TabOrder = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_BuscaLojasClick
    end
  end
  object OdirPanApres: TPanel
    Left = 50
    Top = 20
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
    TabOrder = 2
    Visible = False
  end
  object Dbg_Lojas: TDBGridJul
    Left = 0
    Top = 205
    Width = 986
    Height = 330
    Align = alClient
    DataSource = DMBuscaMetodo.DS_Busca
    FixedColor = clSilver
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    CorComFoco = clWindow
    SairComEnter = False
    EditDataSetCheck = False
    CampoCheckBox = 'Conciliar?'
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
  end
end
