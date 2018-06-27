object DMRelatorio: TDMRelatorio
  OldCreateOrder = False
  Left = 376
  Top = 121
  Height = 436
  Width = 678
  object frTextExport1: TfrTextExport
    ScaleX = 1.000000000000000000
    ScaleY = 1.000000000000000000
    Left = 53
    Top = 216
  end
  object frRTFExport1: TfrRTFExport
    ScaleX = 1.300000000000000000
    ScaleY = 1.000000000000000000
    Left = 109
    Top = 200
  end
  object frCSVExport1: TfrCSVExport
    ScaleX = 1.000000000000000000
    ScaleY = 1.000000000000000000
    Delimiter = ';'
    Left = 158
    Top = 216
  end
  object frHTMExport1: TfrHTMExport
    ScaleX = 1.000000000000000000
    ScaleY = 1.000000000000000000
    Left = 213
    Top = 200
  end
  object frHTML2Export1: TfrHTML2Export
    Scale = 1.000000000000000000
    Navigator.Position = []
    Navigator.Font.Charset = DEFAULT_CHARSET
    Navigator.Font.Color = clWindowText
    Navigator.Font.Height = -11
    Navigator.Font.Name = 'MS Sans Serif'
    Navigator.Font.Style = []
    Navigator.InFrame = False
    Navigator.WideInFrame = False
    Left = 269
    Top = 216
  end
  object frRtfAdvExport1: TfrRtfAdvExport
    Left = 381
    Top = 216
  end
  object frTIFFExport1: TfrTIFFExport
    Left = 437
    Top = 202
  end
  object frJPEGExport1: TfrJPEGExport
    Left = 492
    Top = 223
  end
  object frOLEExcelExport1: TfrOLEExcelExport
    Left = 558
    Top = 208
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = DMCentralTrocas.CDS_RelReposicao
    Left = 328
    Top = 128
  end
  object frBMPExport1: TfrBMPExport
    Left = 325
    Top = 200
  end
  object FontDialog: TFontDialog
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Left = 116
    Top = 64
  end
  object RelVisual: TRelVisualJul
    Cabecalho1Direita = '#Pag'
    Cabecalho2Direita = '#Data'
    Cabecalho3Esquerda = '#Titulo'
    Cabecalho3Direita = '#Hora'
    TextoRodape = 'Total Geral:'
    TextoRodapeGrupo = 'Sub-Total:'
    ClientDataSet = DMBelShop.CDS_Busca
    Orientacao = toPaisagem
    CabecalhoGrupo = True
    RodapeGrupo = True
    LinhaGrupo = True
    LinhaRodapeGrupo = True
    MarginLeft = 5.000000000000000000
    MarginTop = 10.000000000000000000
    MarginRight = 5.000000000000000000
    MarginBottom = 10.000000000000000000
    Fonte.Charset = DEFAULT_CHARSET
    Fonte.Color = clWindowText
    Fonte.Height = -11
    Fonte.Name = 'MS Sans Serif'
    Fonte.Style = []
    TXTCharSeparador = ';'
    Left = 64
    Top = 48
  end
  object frReport1: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 280
    Top = 112
    ReportForm = {19000000}
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    Left = 528
    Top = 40
  end
  object frxReport1: TfrxReport
    Version = '5.2.16'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43276.481407210650000000
    ReportOptions.LastChange = 43276.481407210650000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 472
    Top = 24
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
  end
end
