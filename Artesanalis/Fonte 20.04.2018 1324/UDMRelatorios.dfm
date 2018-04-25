object DMRelatorios: TDMRelatorios
  OldCreateOrder = False
  Left = 404
  Top = 168
  Height = 394
  Width = 746
  object RelVisual: TRelVisualJul
    Cabecalho1Direita = '#Pag'
    Cabecalho2Direita = '#Data'
    Cabecalho3Esquerda = '#Titulo'
    Cabecalho3Direita = '#Hora'
    TextoRodape = 'Total Geral:'
    TextoRodapeGrupo = 'Sub-Total:'
    Destino = toTela
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
    Zoom = 150
    TXTCharSeparador = ';'
    Left = 96
    Top = 40
  end
  object FontDialog: TFontDialog
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Left = 188
    Top = 40
  end
  object frReport1: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 272
    Top = 120
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    Left = 344
    Top = 128
  end
  object frTextExport1: TfrTextExport
    ScaleX = 1.000000000000000000
    ScaleY = 1.000000000000000000
    Left = 72
    Top = 216
  end
  object frRTFExport1: TfrRTFExport
    ScaleX = 1.300000000000000000
    ScaleY = 1.000000000000000000
    Left = 136
    Top = 208
  end
  object frCSVExport1: TfrCSVExport
    ScaleX = 1.000000000000000000
    ScaleY = 1.000000000000000000
    Delimiter = ';'
    Left = 200
    Top = 216
  end
  object frHTMExport1: TfrHTMExport
    ScaleX = 1.000000000000000000
    ScaleY = 1.000000000000000000
    Left = 264
    Top = 208
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
    Left = 328
    Top = 224
  end
  object frOLEExcelExport1: TfrOLEExcelExport
    Left = 392
    Top = 208
  end
  object frBMPExport1: TfrBMPExport
    Left = 472
    Top = 224
  end
  object frJPEGExport1: TfrJPEGExport
    Left = 528
    Top = 208
  end
  object frTIFFExport1: TfrTIFFExport
    Left = 592
    Top = 224
  end
  object frRtfAdvExport1: TfrRtfAdvExport
    Left = 656
    Top = 208
  end
end
