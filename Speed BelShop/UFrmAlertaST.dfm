object FrmAlertaST: TFrmAlertaST
  Left = 278
  Top = 112
  Width = 599
  Height = 530
  AutoSize = True
  Caption = 'ALERTA'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Pan_Notas_ST_Erradas: TPanel
    Left = 0
    Top = 0
    Width = 583
    Height = 492
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 2
      Top = 2
      Width = 579
      Height = 81
      Align = alTop
      Alignment = taCenter
      Caption = 
        'Itens de Notas com problema de CST ICMS e CFOP'#13#10#13#10'Sempre que a n' +
        'ota fiscal tiver ST (SERIE=DES) destacado dever'#225' ser utilizado o' +
        ' '#13#10'Cfop'#180's'#160' 1403 no estado ou 2403 interestadual.'#13#10'Verifica se na' +
        ' nota fiscal consta realmente CST_ICMS  igual a 40 ou se foi dig' +
        'itado errado, por'#233'm,'#13#10'se tiver pode ser alterado para 010 ou 060' +
        '.'
      Color = 12189695
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object DBGrid7: TDBGrid
      Left = 2
      Top = 83
      Width = 579
      Height = 366
      Align = alClient
      Color = 12189695
      DataSource = DM.DS_Nota_ST_Errada
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'COD_PART'
          Title.Alignment = taRightJustify
          Width = 80
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'NUM_DOC'
          Title.Alignment = taRightJustify
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'SERIE'
          Title.Alignment = taCenter
          Width = 45
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'DT_DOC'
          Title.Alignment = taRightJustify
          Width = 70
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'DT_E_S'
          Title.Alignment = taRightJustify
          Width = 70
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'VL_DOC'
          Title.Alignment = taRightJustify
          Width = 100
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 2
      Top = 449
      Width = 579
      Height = 41
      Align = alBottom
      BevelInner = bvLowered
      Color = 14737632
      TabOrder = 1
      object Bt_Parar: TJvXPButton
        Tag = 1
        Left = 381
        Top = 2
        Width = 196
        Height = 37
        Caption = 'Continuar assim mesmo...'
        TabOrder = 0
        Glyph.Data = {
          07544269746D617002030000424D020300000000000036010000280000001300
          0000170000000100080000000000CC010000C30E0000C30E0000400000000000
          00001C34040024341C00242424001C3C0400243C0C00244404002C5C04003C5C
          240044543C005C5C54005C5C5C00646464006C6C6C0054743C00747474004484
          0400747C74007C7C7C0084848400449404006C8C540054AC0400000000008C8C
          8C008C948C00949494009C9C9C00A4A4A400ACACAC00B4B4B4006CD404006CDC
          040074F404007CFC040084FC0C0084FC14007CDC24008CFC1C008CFC240094FC
          240094EC3C0094FC2C009CFC3C0094D45C009CF44C009CFC4400A4FC4C00A4FC
          5400ACFC6400B4FC6C00B4F47400BCF48400BCFC7C00B4C4A400ACCC9400BCCC
          AC00BCC4B400BCCCB400B4E48C00BCE49400BCDCA400C4F49400C4FC8C00C0C0
          C0003F3F3F3F3F3F191717193F3F3F3F3F3F3F3F3F003F3F3F3F3F1712111112
          193F3F3F3F3F3F3F3F003F3F3F3F19120E0C0C0E123F3F3F3F3F3F3F3F003F3F
          3F3F120E0C0B0B0C11173F3F3F3F3F3F3F003F3F3F17110C0B0A0A0B0E123F3F
          3F3F3F3F3F003F3F3F12140702010B0B0C11173F3F3F3F3F3F003F3F3F181E1E
          0F03100C0C0E12193F3F3F3F3F003F3F3F2422231F06080C0C0C11173F3F3F3F
          3F003F3F2B212223221305170C0C0E11173F3F3F3F003F3521222323231E0609
          0E0C0C0E12193F3F3F003F2B2223272726221304180E0C0C0E123F3F3F003F29
          26252A2F2F261F0608110E0C0E11173F3F0038302D232C39332E23150311110E
          0C0E11173F003F392E28383F37312A220F0117110E0E0E1219003F3F373F3F3F
          3F3A30261E060917110E0E1117003F3F3F3F3F3F3F3F322E2315030C17121112
          17003F3F3F3F3F3F3F3F37342D2313001819171719003F3F3F3F3F3F3F3F3F3B
          342E231300193F3F3F003F3F3F3F3F3F3F3F3F3F3C3330230F011D3F3F003F3F
          3F3F3F3F3F3F3F3F3F393E31250F0D3F3F003F3F3F3F3F3F3F3F3F3F3F3F383D
          312320353F003F3F3F3F3F3F3F3F3F3F3F3F3F3F3C2A23363F003F3F3F3F3F3F
          3F3F3F3F3F3F3F3F3F3F373F3F00}
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Bt_PararClick
      end
      object JvXPButton2: TJvXPButton
        Tag = 1
        Left = 186
        Top = 2
        Width = 175
        Height = 37
        Caption = 'Encerrar a Corre'#231#227'o e Corrigir no SIDICOM'
        TabOrder = 1
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
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = JvXPButton2Click
      end
      object Bt_KitSalvaExcel: TJvXPButton
        Tag = 4
        Left = 2
        Top = 2
        Width = 164
        Height = 37
        Caption = 'Salvar em Excel'
        TabOrder = 2
        TabStop = False
        Glyph.Data = {
          0A544A504547496D616765B0040000FFD8FFE000104A46494600010101006000
          600000FFDB004300020101020101020202020202020203050303030303060404
          0305070607070706070708090B0908080A0807070A0D0A0A0B0C0C0C0C07090E
          0F0D0C0E0B0C0C0CFFDB004301020202030303060303060C0807080C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0CFFC00011080017001503012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FD4E
          F8BBFB47787F53B0BBD77C5971A48F0AC9AA26836B6FAD2793A6C32BEE9544B1
          DD471AFDA36C2AF2199736FCA210A6492687FE104F036A1ADDF696BE05F84771
          A969D1493DEDA0B3D19A6B48D3024791319455DCB92C001B867AD79EF8D7E06F
          883F6A8FD917E2E783F4DBCF0BC7378EBE217881F4D7D4A79639618EC6F1ADC3
          C48A016956EECCF048431F5387E3CA3FE0985E24F895F0EBF658F8AFE0DF8A9F
          B39F8BAD3C69E1B88597882F6E26B896E3E204774C52DD2CE686178E6486DDE6
          490DB4F22C6EA24FBF73218FE3B0F5EB49F34D2E571E67269DEEEFA6CFCADD96
          896C7874EA49FBCD696BB767FE4FFE1B447E82EB9FB457C29F817E19D16DF55F
          1AF813C23A3DC44D6FA44773AA5B58DB49140114A5B866552B1864184E14151C
          64515F9CFE23FD99B43FDB03F620F81B75E0F6D6AFBC3FA29F100B59751B986E
          EE9FCCD436B9792DE38A3605E16DA56351B7039209257D4E16A39D18CDF547AD
          87A9CF4A33EE933EB8F1D7EC43AB691AED8EA1A3E81E17F1E7F60F88EF7C4DA0
          C5ABF8A753F0DC9A4DC5E5FB6A73F986D62B886EFF00D3083197863D91011B79
          987793C5F52FD97AF3E0C69DE2AD53FB1FE387C3DB8D774F6B53E224F10E91A9
          E87E0FDF7105C9304705DC37F3C4AF6F1A6E68CCCD1961952C4D14563FD99866
          92E55A69E7B5B7F433960E8C959C576FC2DF91E95FF04C4F8E9E19F8F5E3BF18
          7FC223F10356F891A2F85BC27E1BD1EF353BF8AF6169B55171ACCB77379777FB
          C5322CB6E782C02AC6818F97C14515D54E9A841423B23A231514A2BA1FFFD9}
        ShowFocusRect = True
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Bt_KitSalvaExcelClick
      end
      object Panel2: TPanel
        Left = 361
        Top = 2
        Width = 20
        Height = 37
        Align = alLeft
        Color = 14737632
        TabOrder = 3
      end
      object Panel3: TPanel
        Left = 166
        Top = 2
        Width = 20
        Height = 37
        Align = alLeft
        Color = 14737632
        TabOrder = 4
      end
    end
  end
end
