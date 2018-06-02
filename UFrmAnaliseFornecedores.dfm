object FrmAnaliseFornecedores: TFrmAnaliseFornecedores
  Left = 246
  Top = 117
  Align = alClient
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'ANALISE FORNECEDORES/PRODUTOS'
  ClientHeight = 573
  ClientWidth = 1084
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel10: TPanel
    Left = 0
    Top = 533
    Width = 1084
    Height = 40
    Align = alBottom
    BevelInner = bvLowered
    BorderStyle = bsSingle
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Bt_Fechar: TJvXPButton
      Tag = 99
      Left = 980
      Top = 2
      Width = 100
      Height = 34
      Caption = 'Sair'
      TabOrder = 1
      TabStop = False
      Glyph.Data = {
        07544269746D6170D6060000424DD60600000000000036040000280000001900
        0000180000000100080000000000A0020000C30E0000C30E0000000100000000
        0000000000007B000000FF000000007B00007B7B000000FF0000FFFF0000007B
        7B007B7B7B00BDBDBD0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00090909090909090909090909090909080909090909090909090000000909
        0909090909090909090909090808080909090909090909000000090909090909
        0909090909090909080404080909090909090900000009090909090909090909
        0909090908060604080909090909090000000909090909090909090909090909
        0806060404080909090909000000090909090909090909090909090908060604
        0404080909090900000000000000000000000000090909090806060404040000
        0000080000000909090909090909090008080808000606040404000809090900
        0000090909090909090808000A0A0A0A07060604040400080909090000000909
        09090909080004000A0A0A0A0706060404040008090909000000090909090909
        080004000A0A0A0A070606040404000809090900000009090908080808040404
        070A0A0A07060404000400080909090000000909080808080804060404070A0A
        0706040800040008090909000000090400000000000406060404070A07060604
        0404000809090900000008040606060606060606060404070706060404040008
        0909090000000804060B0B0B0B0B0B0B06060407070606040404000809090900
        0000090404040404040406060604070A07060604040400080909090000000909
        080808080804060604070A0A0706060404040008090909000000090909090909
        08040604070A0A0A070606040404000809090900000009090909090908040400
        0A0A0A0A0704060404040008090909000000090909090909080000000A0A0A0A
        0A070406040400080909090000000909090909090909080A0A0A0A0A0A0A0A04
        0604000809090900000009090909090909090807070707070707070004040008
        0909090000000909090909090909090808080808080808080808080909090900
        0000}
      ShowFocusRect = True
      Spacing = 10
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Bt_FecharClick
    end
    object Panel1: TPanel
      Left = 2
      Top = 2
      Width = 296
      Height = 34
      Align = alLeft
      BevelInner = bvLowered
      Color = clSilver
      TabOrder = 0
      object Label85: TLabel
        Left = 169
        Top = 10
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
      object Label1: TLabel
        Left = 8
        Top = 10
        Width = 46
        Height = 13
        Caption = 'Per'#237'odo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DtEdt_DtaInicio: TcxDateEdit
        Left = 59
        Top = 4
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        StyleFocused.BorderStyle = ebsOffice11
        StyleFocused.TextStyle = [fsBold]
        StyleHot.BorderStyle = ebsUltraFlat
        TabOrder = 0
        OnExit = DtEdt_DtaInicioExit
        Width = 106
      end
      object DtEdt_DtaFim: TcxDateEdit
        Left = 181
        Top = 4
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        StyleFocused.BorderStyle = ebsOffice11
        StyleFocused.TextStyle = [fsBold]
        StyleHot.BorderStyle = ebsUltraFlat
        TabOrder = 1
        OnExit = DtEdt_DtaInicioExit
        Width = 106
      end
    end
    object Button1: TButton
      Left = 504
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object Dbg_Produtos: TDBGridJul
    Left = 0
    Top = 312
    Width = 1084
    Height = 221
    Align = alClient
    DataSource = DMVirtual.DS_V_AnaliseForn
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = Dbg_ProdutosDrawColumnCell
    OnDblClick = Dbg_ProdutosDblClick
    SairComEnter = False
    CampoCheckBox = 'LOJA1;LOJA2'
    ValorCampoCheck = 'SIM'
    ValorCampoUnCheck = 'N'#195'O'
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_AUXILIAR'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_PRODUTO'
        Title.Alignment = taRightJustify
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_SETOR'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_COLECAO'
        Width = 160
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ABC'
        Title.Alignment = taCenter
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAT_PERIODO'
        Title.Alignment = taRightJustify
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA1'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA2'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA3'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA4'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA5'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA6'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA7'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA8'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA9'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA10'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA11'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA12'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA13'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA14'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA15'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA16'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA17'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA18'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA19'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA20'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA21'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA22'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA23'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA24'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA25'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA26'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA27'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA28'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA29'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA30'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA31'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA32'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA33'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA34'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOJA35'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end>
  end
  object Pan_Solicitacoes: TPanel
    Left = 0
    Top = 0
    Width = 1084
    Height = 312
    Align = alTop
    TabOrder = 1
    DesignSize = (
      1084
      312)
    object DbGrafico_Lojas: TDBChart
      Left = 1
      Top = 51
      Width = 357
      Height = 257
      BackImageMode = pbmCenter
      BackWall.Brush.Color = clWhite
      BackWall.Color = 16777088
      BackWall.Pen.Color = clAqua
      BottomWall.Brush.Color = clWhite
      BottomWall.Color = 8454143
      BottomWall.Pen.Width = 3
      BottomWall.Size = 6
      Foot.Alignment = taLeftJustify
      Foot.Font.Charset = DEFAULT_CHARSET
      Foot.Font.Color = clBlue
      Foot.Font.Height = -15
      Foot.Font.Name = 'Arial'
      Foot.Font.Style = []
      Foot.Frame.Color = clScrollBar
      Foot.Visible = False
      Gradient.Visible = True
      LeftWall.Brush.Color = clWhite
      LeftWall.Pen.Width = 3
      LeftWall.Size = 6
      MarginBottom = 3
      MarginTop = 3
      Title.AdjustFrame = False
      Title.Brush.Color = clWhite
      Title.Color = clWhite
      Title.Font.Charset = DEFAULT_CHARSET
      Title.Font.Color = clBlack
      Title.Font.Height = -16
      Title.Font.Name = 'Arial'
      Title.Font.Style = [fsBold]
      Title.Frame.Color = clBlue
      Title.Frame.Width = 2
      Title.Frame.Visible = True
      Title.Text.Strings = (
        '')
      BackColor = 16777088
      BottomAxis.MinorTickCount = 0
      BottomAxis.MinorTickLength = 1
      BottomAxis.MinorTicks.Width = 2
      Chart3DPercent = 35
      Frame.Color = clAqua
      LeftAxis.ExactDateTime = False
      LeftAxis.MinorTickCount = 0
      LeftAxis.MinorTickLength = 3
      LeftAxis.MinorTicks.Width = 3
      LeftAxis.TickLength = 7
      LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
      LeftAxis.Title.Font.Color = clBlack
      LeftAxis.Title.Font.Height = -11
      LeftAxis.Title.Font.Name = 'Arial'
      LeftAxis.Title.Font.Style = [fsBold]
      Legend.Alignment = laTop
      Legend.ColorWidth = 45
      Legend.Frame.Width = 4
      Legend.ShadowSize = 6
      Legend.TextStyle = ltsRightValue
      Legend.TopPos = 0
      Legend.Visible = False
      RightAxis.LabelsFont.Charset = DEFAULT_CHARSET
      RightAxis.LabelsFont.Color = clRed
      RightAxis.LabelsFont.Height = -11
      RightAxis.LabelsFont.Name = 'Arial'
      RightAxis.LabelsFont.Style = []
      RightAxis.Ticks.Width = 2
      View3DOptions.Elevation = 315
      View3DOptions.Orthogonal = False
      View3DOptions.Perspective = 0
      View3DOptions.Rotation = 360
      BevelInner = bvLowered
      BevelWidth = 2
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = 16777088
      TabOrder = 0
      Anchors = [akTop]
      DesignSize = (
        355
        255)
      object Bt_MinimizarGraficoLojas: TJvXPButton
        Tag = 91
        Left = 330
        Top = 230
        Width = 25
        Height = 22
        Hint = 'Maximizar / Minimizar'
        TabOrder = 0
        Glyph.Data = {
          07544269746D61706E040000424D6E0400000000000036000000280000001300
          0000120000000100180000000000380400000000000000000000000000000000
          0000DF4F13DF551BDF4F13DF551BE25A21E15C25E05D26E15C24E25E23E25E21
          E25E1EE55F1BE55E16E65D13E55B0EE65809E65404E24E01D34500000000EF5B
          1CF06328EF5B1CF06328F0682FF16B33F16C34F26C31F26D31F26F2EF2702AF3
          7025F36F1FF46D19F46A13F4660DF36007F05A02E24D00000000F46225F46B31
          F46225F46B31F47139F5743DF6743DF5753BF57639F57737F67832F7782CF777
          25F7761FF77219F86E11F7680BF46005E65302000000F4682EF4713AF4682EF4
          713AF57742FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF87C2AF87A24
          F8771DF87315F86C0EF46309E75605000000F46E36F57642F46E36F57642F57B
          49FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF77D2DF87A25F8771EF8
          7317F76D11F4660DE7590B000000F4733DF57B48F4733DF57B48F6804EFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF77C2DF87926F77720F77319F76F
          16F46913E85D10000000F57844F67F4EF57844F67F4EF68252F68353F68251F7
          814DF67F48F67F43F67E3DF67C35F77A2DF77726F77421F7711BF76E18F46A18
          E75F16000000F57D4BF68354F57D4BF68354F78456F78355F68252F6804DF67D
          48F67C42F67A3CF67834F6762DF77326F77121F66F1CF66D1CF46A1CE6611C00
          0000F68151F78557F68151F78557F78659F78557F68152F67E4DF67B47F67941
          F5773BF57434F6722CF66F26F66D22F66B1EF66A1FF36A21E66221000000F687
          59F78A5DF68759F78A5DF7895DF78659F68153F67E4EF57A47F57841F5743AF5
          7234F56F2CF56C27F66A23F66920F56822F26925E66225000000F78C60F88D62
          F78C60F88D62F78B60F7875BF78254F67C4EF67847F57441F5713AF46E34F56B
          2DF56928F56724F56622F56725F26829E46329000000F89268F8936AF89268F8
          936AF88F65F7895EF78357F67E50F6794AF57543F5713DF46E36F56B2FF5692B
          F56728F56627F5682AF2692CE4622A000000F8976EF89970F8976EF89970F893
          6AF88C62F7865BF78054F67B4DF67747F57240F56F3AF46D34F46B30F4692DF5
          692CF5692DF2692EE5632C000000F89F79F8A17CF89F79F8A17CF89971F89167
          F78B60F78559F68153F67B4DF57746F57341F46F3AF46E38F46C34F46C32F46B
          31F16930E4622C000000F9AA89F9AD8DF9AA89F9AD8DF8A37FF89971F8936AF7
          8E64F78A5EF78659F68254F68051F57C4BF57C4AF57844F5753FF4723AF26C34
          E3612A000000F9B497FAB79AF9B497FAB79AF9AA89F8A07AF89A72F8956DF892
          68F78F65F78E62F78D61F78A5DF68759F68352F67E4CF57743F26E37E35F2800
          0000F9AF90F9B294F9AF90F9B294F8A785F89C75F8976EF79268F79066F78E62
          F78C5FF78B5EF68859F68556F68250F57C49F5753FF26B32E35C23000000F9AF
          90F9B294F89A73F78C60F68455F67E4DF57A48F57642F57844F5733EF5733EF5
          713BF5713BF46C33F46C33F46A30F46428EF5D1FE06734000000}
        ShowFocusRect = True
        Anchors = [akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        OnClick = Bt_MinimizarGraficoLojasClick
      end
    end
    object DbGrafico_Fornecedores: TDBChart
      Left = 362
      Top = 51
      Width = 357
      Height = 257
      BackImageMode = pbmCenter
      BackWall.Brush.Color = clWhite
      BackWall.Color = 16777088
      BackWall.Pen.Color = clAqua
      BottomWall.Brush.Color = clWhite
      BottomWall.Color = 8454143
      BottomWall.Pen.Width = 3
      BottomWall.Size = 6
      Foot.Alignment = taLeftJustify
      Foot.Font.Charset = DEFAULT_CHARSET
      Foot.Font.Color = clBlue
      Foot.Font.Height = -15
      Foot.Font.Name = 'Arial'
      Foot.Font.Style = []
      Foot.Frame.Color = clScrollBar
      Foot.Visible = False
      Gradient.Visible = True
      LeftWall.Brush.Color = clWhite
      LeftWall.Pen.Width = 3
      LeftWall.Size = 6
      MarginBottom = 3
      MarginTop = 3
      Title.AdjustFrame = False
      Title.Brush.Color = clWhite
      Title.Color = clWhite
      Title.Font.Charset = DEFAULT_CHARSET
      Title.Font.Color = clBlack
      Title.Font.Height = -16
      Title.Font.Name = 'Arial'
      Title.Font.Style = [fsBold]
      Title.Frame.Color = clBlue
      Title.Frame.Width = 2
      Title.Frame.Visible = True
      Title.Text.Strings = (
        '')
      BackColor = 16777088
      BottomAxis.MinorTickCount = 0
      BottomAxis.MinorTickLength = 1
      BottomAxis.MinorTicks.Width = 2
      Chart3DPercent = 35
      Frame.Color = clAqua
      LeftAxis.ExactDateTime = False
      LeftAxis.MinorTickCount = 0
      LeftAxis.MinorTickLength = 3
      LeftAxis.MinorTicks.Width = 3
      LeftAxis.TickLength = 7
      LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
      LeftAxis.Title.Font.Color = clBlack
      LeftAxis.Title.Font.Height = -11
      LeftAxis.Title.Font.Name = 'Arial'
      LeftAxis.Title.Font.Style = [fsBold]
      Legend.Alignment = laTop
      Legend.ColorWidth = 45
      Legend.Frame.Width = 4
      Legend.ShadowSize = 6
      Legend.TextStyle = ltsRightValue
      Legend.TopPos = 0
      Legend.Visible = False
      RightAxis.LabelsFont.Charset = DEFAULT_CHARSET
      RightAxis.LabelsFont.Color = clRed
      RightAxis.LabelsFont.Height = -11
      RightAxis.LabelsFont.Name = 'Arial'
      RightAxis.LabelsFont.Style = []
      RightAxis.Ticks.Width = 2
      View3DOptions.Elevation = 315
      View3DOptions.Orthogonal = False
      View3DOptions.Perspective = 0
      View3DOptions.Rotation = 360
      BevelInner = bvLowered
      BevelWidth = 2
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = 16777088
      TabOrder = 1
      Anchors = [akTop]
      DesignSize = (
        355
        255)
      object Bt_MinimizarGraficoForn: TJvXPButton
        Tag = 91
        Left = 330
        Top = 230
        Width = 25
        Height = 22
        Hint = 'Maximizar / Minimizar'
        TabOrder = 0
        Glyph.Data = {
          07544269746D61706E040000424D6E0400000000000036000000280000001300
          0000120000000100180000000000380400000000000000000000000000000000
          0000DF4F13DF551BDF4F13DF551BE25A21E15C25E05D26E15C24E25E23E25E21
          E25E1EE55F1BE55E16E65D13E55B0EE65809E65404E24E01D34500000000EF5B
          1CF06328EF5B1CF06328F0682FF16B33F16C34F26C31F26D31F26F2EF2702AF3
          7025F36F1FF46D19F46A13F4660DF36007F05A02E24D00000000F46225F46B31
          F46225F46B31F47139F5743DF6743DF5753BF57639F57737F67832F7782CF777
          25F7761FF77219F86E11F7680BF46005E65302000000F4682EF4713AF4682EF4
          713AF57742FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF87C2AF87A24
          F8771DF87315F86C0EF46309E75605000000F46E36F57642F46E36F57642F57B
          49FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF77D2DF87A25F8771EF8
          7317F76D11F4660DE7590B000000F4733DF57B48F4733DF57B48F6804EFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF77C2DF87926F77720F77319F76F
          16F46913E85D10000000F57844F67F4EF57844F67F4EF68252F68353F68251F7
          814DF67F48F67F43F67E3DF67C35F77A2DF77726F77421F7711BF76E18F46A18
          E75F16000000F57D4BF68354F57D4BF68354F78456F78355F68252F6804DF67D
          48F67C42F67A3CF67834F6762DF77326F77121F66F1CF66D1CF46A1CE6611C00
          0000F68151F78557F68151F78557F78659F78557F68152F67E4DF67B47F67941
          F5773BF57434F6722CF66F26F66D22F66B1EF66A1FF36A21E66221000000F687
          59F78A5DF68759F78A5DF7895DF78659F68153F67E4EF57A47F57841F5743AF5
          7234F56F2CF56C27F66A23F66920F56822F26925E66225000000F78C60F88D62
          F78C60F88D62F78B60F7875BF78254F67C4EF67847F57441F5713AF46E34F56B
          2DF56928F56724F56622F56725F26829E46329000000F89268F8936AF89268F8
          936AF88F65F7895EF78357F67E50F6794AF57543F5713DF46E36F56B2FF5692B
          F56728F56627F5682AF2692CE4622A000000F8976EF89970F8976EF89970F893
          6AF88C62F7865BF78054F67B4DF67747F57240F56F3AF46D34F46B30F4692DF5
          692CF5692DF2692EE5632C000000F89F79F8A17CF89F79F8A17CF89971F89167
          F78B60F78559F68153F67B4DF57746F57341F46F3AF46E38F46C34F46C32F46B
          31F16930E4622C000000F9AA89F9AD8DF9AA89F9AD8DF8A37FF89971F8936AF7
          8E64F78A5EF78659F68254F68051F57C4BF57C4AF57844F5753FF4723AF26C34
          E3612A000000F9B497FAB79AF9B497FAB79AF9AA89F8A07AF89A72F8956DF892
          68F78F65F78E62F78D61F78A5DF68759F68352F67E4CF57743F26E37E35F2800
          0000F9AF90F9B294F9AF90F9B294F8A785F89C75F8976EF79268F79066F78E62
          F78C5FF78B5EF68859F68556F68250F57C49F5753FF26B32E35C23000000F9AF
          90F9B294F89A73F78C60F68455F67E4DF57A48F57642F57844F5733EF5733EF5
          713BF5713BF46C33F46C33F46A30F46428EF5D1FE06734000000}
        ShowFocusRect = True
        Anchors = [akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        OnClick = Bt_MinimizarGraficoLojasClick
      end
    end
    object DbGrafico_Setores: TDBChart
      Left = 723
      Top = 51
      Width = 357
      Height = 257
      BackImageMode = pbmCenter
      BackWall.Brush.Color = clWhite
      BackWall.Color = 16777088
      BackWall.Pen.Color = clAqua
      BottomWall.Brush.Color = clWhite
      BottomWall.Color = 8454143
      BottomWall.Pen.Width = 3
      BottomWall.Size = 6
      Foot.Alignment = taLeftJustify
      Foot.Font.Charset = DEFAULT_CHARSET
      Foot.Font.Color = clBlue
      Foot.Font.Height = -15
      Foot.Font.Name = 'Arial'
      Foot.Font.Style = []
      Foot.Frame.Color = clScrollBar
      Foot.Visible = False
      Gradient.Visible = True
      LeftWall.Brush.Color = clWhite
      LeftWall.Pen.Width = 3
      LeftWall.Size = 6
      MarginBottom = 3
      MarginTop = 3
      Title.AdjustFrame = False
      Title.Brush.Color = clWhite
      Title.Color = clWhite
      Title.Font.Charset = DEFAULT_CHARSET
      Title.Font.Color = clBlack
      Title.Font.Height = -16
      Title.Font.Name = 'Arial'
      Title.Font.Style = [fsBold]
      Title.Frame.Color = clBlue
      Title.Frame.Width = 2
      Title.Frame.Visible = True
      Title.Text.Strings = (
        '')
      BackColor = 16777088
      BottomAxis.MinorTickCount = 0
      BottomAxis.MinorTickLength = 1
      BottomAxis.MinorTicks.Width = 2
      Chart3DPercent = 35
      Frame.Color = clAqua
      LeftAxis.ExactDateTime = False
      LeftAxis.MinorTickCount = 0
      LeftAxis.MinorTickLength = 3
      LeftAxis.MinorTicks.Width = 3
      LeftAxis.TickLength = 7
      LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
      LeftAxis.Title.Font.Color = clBlack
      LeftAxis.Title.Font.Height = -11
      LeftAxis.Title.Font.Name = 'Arial'
      LeftAxis.Title.Font.Style = [fsBold]
      Legend.Alignment = laTop
      Legend.ColorWidth = 45
      Legend.Frame.Width = 4
      Legend.ShadowSize = 6
      Legend.TextStyle = ltsRightValue
      Legend.TopPos = 0
      Legend.Visible = False
      RightAxis.LabelsFont.Charset = DEFAULT_CHARSET
      RightAxis.LabelsFont.Color = clRed
      RightAxis.LabelsFont.Height = -11
      RightAxis.LabelsFont.Name = 'Arial'
      RightAxis.LabelsFont.Style = []
      RightAxis.Ticks.Width = 2
      View3DOptions.Elevation = 315
      View3DOptions.Orthogonal = False
      View3DOptions.Perspective = 0
      View3DOptions.Rotation = 360
      BevelInner = bvLowered
      BevelWidth = 2
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = 16777088
      TabOrder = 2
      Anchors = [akTop]
      DesignSize = (
        355
        255)
      object Bt_MinimizarGraficoSetores: TJvXPButton
        Tag = 91
        Left = 330
        Top = 230
        Width = 25
        Height = 22
        Hint = 'Maximizar / Minimizar'
        TabOrder = 0
        Glyph.Data = {
          07544269746D61706E040000424D6E0400000000000036000000280000001300
          0000120000000100180000000000380400000000000000000000000000000000
          0000DF4F13DF551BDF4F13DF551BE25A21E15C25E05D26E15C24E25E23E25E21
          E25E1EE55F1BE55E16E65D13E55B0EE65809E65404E24E01D34500000000EF5B
          1CF06328EF5B1CF06328F0682FF16B33F16C34F26C31F26D31F26F2EF2702AF3
          7025F36F1FF46D19F46A13F4660DF36007F05A02E24D00000000F46225F46B31
          F46225F46B31F47139F5743DF6743DF5753BF57639F57737F67832F7782CF777
          25F7761FF77219F86E11F7680BF46005E65302000000F4682EF4713AF4682EF4
          713AF57742FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF87C2AF87A24
          F8771DF87315F86C0EF46309E75605000000F46E36F57642F46E36F57642F57B
          49FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF77D2DF87A25F8771EF8
          7317F76D11F4660DE7590B000000F4733DF57B48F4733DF57B48F6804EFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF77C2DF87926F77720F77319F76F
          16F46913E85D10000000F57844F67F4EF57844F67F4EF68252F68353F68251F7
          814DF67F48F67F43F67E3DF67C35F77A2DF77726F77421F7711BF76E18F46A18
          E75F16000000F57D4BF68354F57D4BF68354F78456F78355F68252F6804DF67D
          48F67C42F67A3CF67834F6762DF77326F77121F66F1CF66D1CF46A1CE6611C00
          0000F68151F78557F68151F78557F78659F78557F68152F67E4DF67B47F67941
          F5773BF57434F6722CF66F26F66D22F66B1EF66A1FF36A21E66221000000F687
          59F78A5DF68759F78A5DF7895DF78659F68153F67E4EF57A47F57841F5743AF5
          7234F56F2CF56C27F66A23F66920F56822F26925E66225000000F78C60F88D62
          F78C60F88D62F78B60F7875BF78254F67C4EF67847F57441F5713AF46E34F56B
          2DF56928F56724F56622F56725F26829E46329000000F89268F8936AF89268F8
          936AF88F65F7895EF78357F67E50F6794AF57543F5713DF46E36F56B2FF5692B
          F56728F56627F5682AF2692CE4622A000000F8976EF89970F8976EF89970F893
          6AF88C62F7865BF78054F67B4DF67747F57240F56F3AF46D34F46B30F4692DF5
          692CF5692DF2692EE5632C000000F89F79F8A17CF89F79F8A17CF89971F89167
          F78B60F78559F68153F67B4DF57746F57341F46F3AF46E38F46C34F46C32F46B
          31F16930E4622C000000F9AA89F9AD8DF9AA89F9AD8DF8A37FF89971F8936AF7
          8E64F78A5EF78659F68254F68051F57C4BF57C4AF57844F5753FF4723AF26C34
          E3612A000000F9B497FAB79AF9B497FAB79AF9AA89F8A07AF89A72F8956DF892
          68F78F65F78E62F78D61F78A5DF68759F68352F67E4CF57743F26E37E35F2800
          0000F9AF90F9B294F9AF90F9B294F8A785F89C75F8976EF79268F79066F78E62
          F78C5FF78B5EF68859F68556F68250F57C49F5753FF26B32E35C23000000F9AF
          90F9B294F89A73F78C60F68455F67E4DF57A48F57642F57844F5733EF5733EF5
          713BF5713BF46C33F46C33F46A30F46428EF5D1FE06734000000}
        ShowFocusRect = True
        Anchors = [akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        OnClick = Bt_MinimizarGraficoLojasClick
      end
    end
    object Gb_Lojas: TGroupBox
      Left = 1
      Top = 1
      Width = 356
      Height = 46
      Anchors = [akTop]
      Caption = ' Lojas '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object Cbx_Lojas: TJvHTComboBox
        Left = 11
        Top = 17
        Width = 330
        Height = 22
        HideSel = False
        DropWidth = 145
        ColorHighlight = clHighlight
        ColorHighlightText = clHighlightText
        ColorDisabledText = clGrayText
        Color = clBtnFace
        Items.Strings = (
          'SADas'
          'sADasdAS'
          'asdAD')
        TabOrder = 0
        OnChange = Cbx_LojasChange
      end
    end
    object Gb_Fornecedores: TGroupBox
      Left = 362
      Top = 1
      Width = 356
      Height = 46
      Anchors = [akTop]
      Caption = ' Fornecedores '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object EdtDesFornecedor: TEdit
        Left = 44
        Top = 20
        Width = 303
        Height = 19
        TabStop = False
        Color = 14737632
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object Bt_BuscaFornecedor: TJvXPButton
        Left = 13
        Top = 16
        Width = 26
        Height = 25
        TabOrder = 1
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
        ShowFocusRect = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Bt_BuscaFornecedorClick
      end
      object EdtCodFornecedor: TCurrencyEdit
        Left = 323
        Top = 17
        Width = 29
        Height = 21
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Visible = False
      end
    end
    object Gb_Setores: TGroupBox
      Left = 723
      Top = 1
      Width = 356
      Height = 46
      Anchors = [akTop]
      Caption = ' Setores '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object EdtDesSetor: TEdit
        Left = 44
        Top = 20
        Width = 303
        Height = 19
        TabStop = False
        Color = 14737632
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object Bt_BuscaSetor: TJvXPButton
        Left = 13
        Top = 16
        Width = 26
        Height = 25
        TabOrder = 1
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
        ShowFocusRect = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Bt_BuscaSetorClick
      end
      object EdtCodSetor: TCurrencyEdit
        Left = 295
        Top = 9
        Width = 29
        Height = 21
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Visible = False
      end
    end
    object Bt_MinimizarGraficos: TJvXPButton
      Tag = 91
      Left = 1058
      Top = 6
      Width = 25
      Height = 22
      Hint = 'Maximizar / Minimizar'
      TabOrder = 6
      Glyph.Data = {
        07544269746D61706E040000424D6E0400000000000036000000280000001300
        0000120000000100180000000000380400000000000000000000000000000000
        0000DF4F13DF551BDF4F13DF551BE25A21E15C25E05D26E15C24E25E23E25E21
        E25E1EE55F1BE55E16E65D13E55B0EE65809E65404E24E01D34500000000EF5B
        1CF06328EF5B1CF06328F0682FF16B33F16C34F26C31F26D31F26F2EF2702AF3
        7025F36F1FF46D19F46A13F4660DF36007F05A02E24D00000000F46225F46B31
        F46225F46B31F47139F5743DF6743DF5753BF57639F57737F67832F7782CF777
        25F7761FF77219F86E11F7680BF46005E65302000000F4682EF4713AF4682EF4
        713AF57742FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF87C2AF87A24
        F8771DF87315F86C0EF46309E75605000000F46E36F57642F46E36F57642F57B
        49FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF77D2DF87A25F8771EF8
        7317F76D11F4660DE7590B000000F4733DF57B48F4733DF57B48F6804EFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF77C2DF87926F77720F77319F76F
        16F46913E85D10000000F57844F67F4EF57844F67F4EF68252F68353F68251F7
        814DF67F48F67F43F67E3DF67C35F77A2DF77726F77421F7711BF76E18F46A18
        E75F16000000F57D4BF68354F57D4BF68354F78456F78355F68252F6804DF67D
        48F67C42F67A3CF67834F6762DF77326F77121F66F1CF66D1CF46A1CE6611C00
        0000F68151F78557F68151F78557F78659F78557F68152F67E4DF67B47F67941
        F5773BF57434F6722CF66F26F66D22F66B1EF66A1FF36A21E66221000000F687
        59F78A5DF68759F78A5DF7895DF78659F68153F67E4EF57A47F57841F5743AF5
        7234F56F2CF56C27F66A23F66920F56822F26925E66225000000F78C60F88D62
        F78C60F88D62F78B60F7875BF78254F67C4EF67847F57441F5713AF46E34F56B
        2DF56928F56724F56622F56725F26829E46329000000F89268F8936AF89268F8
        936AF88F65F7895EF78357F67E50F6794AF57543F5713DF46E36F56B2FF5692B
        F56728F56627F5682AF2692CE4622A000000F8976EF89970F8976EF89970F893
        6AF88C62F7865BF78054F67B4DF67747F57240F56F3AF46D34F46B30F4692DF5
        692CF5692DF2692EE5632C000000F89F79F8A17CF89F79F8A17CF89971F89167
        F78B60F78559F68153F67B4DF57746F57341F46F3AF46E38F46C34F46C32F46B
        31F16930E4622C000000F9AA89F9AD8DF9AA89F9AD8DF8A37FF89971F8936AF7
        8E64F78A5EF78659F68254F68051F57C4BF57C4AF57844F5753FF4723AF26C34
        E3612A000000F9B497FAB79AF9B497FAB79AF9AA89F8A07AF89A72F8956DF892
        68F78F65F78E62F78D61F78A5DF68759F68352F67E4CF57743F26E37E35F2800
        0000F9AF90F9B294F9AF90F9B294F8A785F89C75F8976EF79268F79066F78E62
        F78C5FF78B5EF68859F68556F68250F57C49F5753FF26B32E35C23000000F9AF
        90F9B294F89A73F78C60F68455F67E4DF57A48F57642F57844F5733EF5733EF5
        713BF5713BF46C33F46C33F46A30F46428EF5D1FE06734000000}
      ShowFocusRect = True
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      OnClick = Bt_MinimizarGraficosClick
    end
  end
  object OdirPanApres: TPanel
    Left = 784
    Top = 534
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
    FormCaption = 'ANALISE FORNECEDORES/PRODUTOS'
    FontInactiveColor = 16777170
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clCaptionText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    StartColor = 15522303
    EndColor = 8388863
    Left = 888
    Top = 352
  end
end
