object DMLinx: TDMLinx
  OldCreateOrder = False
  Left = 242
  Top = 116
  Height = 589
  Width = 991
  object SDS_Busca: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 41
    Top = 31
  end
  object DS_Busca: TDataSource
    DataSet = CDS_Busca
    Left = 168
    Top = 48
  end
  object DSP_Busca: TDataSetProvider
    DataSet = SDS_Busca
    Options = [poRetainServerOrder]
    Left = 84
    Top = 48
  end
  object CDS_Busca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Busca'
    Left = 124
    Top = 36
  end
  object DSP_OCProdLinx: TDataSetProvider
    DataSet = SQLQ_OCProdLinx
    Options = [poRetainServerOrder]
    Left = 84
    Top = 125
  end
  object CDS_OCProdLinx: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_OCProdLinx'
    Left = 132
    Top = 108
  end
  object SQLQ_OCProdLinx: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 40
    Top = 106
  end
  object SDS_AnaliseForn: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' TRIM(pr.cod_auxiliar) COD_AUXILIAR,'#13#10' pr.cod_produto,'#13#10 +
      ' TRIM(pr.nome) NOME,'#13#10#13#10' (SELECT mx.ind_curva FROM ES_PRODUTOS_M' +
      'IX mx  WHERE mx.cod_produto=pr.cod_produto AND mx.empresa=2) ABC' +
      ','#13#10' CAST(COALESCE((SELECT SUM(COALESCE(fa.vlr_fat,0.00))'#13#10'      ' +
      'FROM ES_FAT_PERIODO fa'#13#10'      WHERE fa.cod_produto=pr.cod_produt' +
      'o) , 0.00)'#13#10' AS NUMERIC(12,2)) Fat_Periodo,'#13#10#13#10' TRIM(pr.desc_set' +
      'or) DESC_SETOR,'#13#10' TRIM(pr.desc_colecao) DESC_COLECAO,'#13#10' (SELECT ' +
      'mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto=pr.cod_p' +
      'roduto AND mx.empresa=1)  LOJA1,'#13#10' 0 LOJA2,'#13#10' (SELECT mx.ind_mix' +
      ' FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto=pr.cod_produto AND' +
      ' mx.empresa=3)  LOJA3,'#13#10' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX' +
      ' mx WHERE mx.cod_produto=pr.cod_produto AND mx.empresa=4)  LOJA4' +
      ','#13#10' 0 LOJA5,'#13#10' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE ' +
      'mx.cod_produto=pr.cod_produto AND mx.empresa=6)  LOJA6,'#13#10' (SELEC' +
      'T mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto=pr.cod' +
      '_produto AND mx.empresa=7)  LOJA7,'#13#10' (SELECT mx.ind_mix FROM ES_' +
      'PRODUTOS_MIX mx WHERE mx.cod_produto=pr.cod_produto AND mx.empre' +
      'sa=8)  LOJA8,'#13#10' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE' +
      ' mx.cod_produto=pr.cod_produto AND mx.empresa=9)  LOJA9,'#13#10' (SELE' +
      'CT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto=pr.co' +
      'd_produto AND mx.empresa=10)  LOJA10,'#13#10' (SELECT mx.ind_mix FROM ' +
      'ES_PRODUTOS_MIX mx WHERE mx.cod_produto=pr.cod_produto AND mx.em' +
      'presa=11)  LOJA11,'#13#10' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx ' +
      'WHERE mx.cod_produto=pr.cod_produto AND mx.empresa=12)  LOJA12,'#13 +
      #10' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produt' +
      'o=pr.cod_produto AND mx.empresa=13)  LOJA13,'#13#10' (SELECT mx.ind_mi' +
      'x FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto=pr.cod_produto AN' +
      'D mx.empresa=14)  LOJA14,'#13#10' (SELECT mx.ind_mix FROM ES_PRODUTOS_' +
      'MIX mx WHERE mx.cod_produto=pr.cod_produto AND mx.empresa=15)  L' +
      'OJA15,'#13#10' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod' +
      '_produto=pr.cod_produto AND mx.empresa=16)  LOJA16,'#13#10' (SELECT mx' +
      '.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto=pr.cod_pro' +
      'duto AND mx.empresa=17)  LOJA17,'#13#10' (SELECT mx.ind_mix FROM ES_PR' +
      'ODUTOS_MIX mx WHERE mx.cod_produto=pr.cod_produto AND mx.empresa' +
      '=18)  LOJA18,'#13#10' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE' +
      ' mx.cod_produto=pr.cod_produto AND mx.empresa=19)  LOJA19,'#13#10' (SE' +
      'LECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto=pr.' +
      'cod_produto AND mx.empresa=20)  LOJA20,'#13#10' (SELECT mx.ind_mix FRO' +
      'M ES_PRODUTOS_MIX mx WHERE mx.cod_produto=pr.cod_produto AND mx.' +
      'empresa=21)  LOJA21,'#13#10' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX m' +
      'x WHERE mx.cod_produto=pr.cod_produto AND mx.empresa=22)  LOJA22' +
      ','#13#10' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_prod' +
      'uto=pr.cod_produto AND mx.empresa=23)  LOJA23,'#13#10' (SELECT mx.ind_' +
      'mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto=pr.cod_produto ' +
      'AND mx.empresa=24)  LOJA24,'#13#10#13#10' 0 LOJA25,'#13#10' 0 LOJA26, 0 LOJA27, ' +
      '0 LOJA28, 0 LOJA29, 0 LOJA30, 0 LOJA31, 0 LOJA32, 0 LOJA33, 0 LO' +
      'JA34,'#13#10' 0 LOJA35, pr.cod_fornecedor,'#13#10' (SELECT fo.nome_cliente F' +
      'ROM LINXCLIENTESFORNEC fo WHERE fo.cod_cliente=pr.cod_fornecedor' +
      ') Forn'#13#10#13#10' FROM lINXPRODUTOS pr'#13#10' WHERE pr.id_linha<>33'#13#10' AND   ' +
      'id_colecao<>294'#13#10' AND   pr.desativado='#39'N'#39#13#10' AND   pr.cod_auxilia' +
      'r IS NOT NULL'#13#10' AND   pr.cod_fornecedor=56'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 45
    Top = 237
  end
  object DSP_AnaliseForn: TDataSetProvider
    DataSet = SDS_AnaliseForn
    Options = [poRetainServerOrder]
    UpdateMode = upWhereChanged
    Left = 90
    Top = 254
  end
  object CDS_AnaliseForn: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    IndexFieldNames = 'ABC;NOME'
    Params = <>
    ProviderName = 'DSP_AnaliseForn'
    Left = 135
    Top = 235
    object CDS_AnaliseFornCOD_AUXILIAR: TStringField
      FieldName = 'COD_AUXILIAR'
      Size = 40
    end
    object CDS_AnaliseFornCOD_PRODUTO: TFMTBCDField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PRODUTO'
      Precision = 15
      Size = 0
    end
    object CDS_AnaliseFornNOME: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'NOME'
      Size = 250
    end
    object CDS_AnaliseFornABC: TStringField
      FieldName = 'ABC'
      Size = 1
    end
    object CDS_AnaliseFornFAT_PERIODO: TFMTBCDField
      DisplayLabel = 'Fat Per'#237'odo'
      FieldName = 'FAT_PERIODO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object CDS_AnaliseFornDESC_SETOR: TStringField
      DisplayLabel = 'Setor'
      FieldName = 'DESC_SETOR'
      Size = 30
    end
    object CDS_AnaliseFornDESC_COLECAO: TStringField
      DisplayLabel = 'Cole'#231#227'o'
      FieldName = 'DESC_COLECAO'
      Size = 50
    end
    object CDS_AnaliseFornLOJA1: TIntegerField
      FieldName = 'LOJA1'
    end
    object CDS_AnaliseFornLOJA2: TIntegerField
      FieldName = 'LOJA2'
    end
    object CDS_AnaliseFornLOJA3: TIntegerField
      FieldName = 'LOJA3'
    end
    object CDS_AnaliseFornLOJA4: TIntegerField
      FieldName = 'LOJA4'
    end
    object CDS_AnaliseFornLOJA5: TIntegerField
      FieldName = 'LOJA5'
    end
    object CDS_AnaliseFornLOJA6: TIntegerField
      FieldName = 'LOJA6'
    end
    object CDS_AnaliseFornLOJA7: TIntegerField
      FieldName = 'LOJA7'
    end
    object CDS_AnaliseFornLOJA8: TIntegerField
      FieldName = 'LOJA8'
    end
    object CDS_AnaliseFornLOJA9: TIntegerField
      FieldName = 'LOJA9'
    end
    object CDS_AnaliseFornLOJA10: TIntegerField
      FieldName = 'LOJA10'
    end
    object CDS_AnaliseFornLOJA11: TIntegerField
      FieldName = 'LOJA11'
    end
    object CDS_AnaliseFornLOJA12: TIntegerField
      FieldName = 'LOJA12'
    end
    object CDS_AnaliseFornLOJA13: TIntegerField
      FieldName = 'LOJA13'
    end
    object CDS_AnaliseFornLOJA14: TIntegerField
      FieldName = 'LOJA14'
    end
    object CDS_AnaliseFornLOJA15: TIntegerField
      FieldName = 'LOJA15'
      Required = True
    end
    object CDS_AnaliseFornLOJA16: TIntegerField
      FieldName = 'LOJA16'
    end
    object CDS_AnaliseFornLOJA17: TIntegerField
      FieldName = 'LOJA17'
    end
    object CDS_AnaliseFornLOJA18: TIntegerField
      FieldName = 'LOJA18'
    end
    object CDS_AnaliseFornLOJA19: TIntegerField
      FieldName = 'LOJA19'
    end
    object CDS_AnaliseFornLOJA20: TIntegerField
      FieldName = 'LOJA20'
    end
    object CDS_AnaliseFornLOJA21: TIntegerField
      FieldName = 'LOJA21'
    end
    object CDS_AnaliseFornLOJA22: TIntegerField
      FieldName = 'LOJA22'
    end
    object CDS_AnaliseFornLOJA23: TIntegerField
      FieldName = 'LOJA23'
      Required = True
    end
    object CDS_AnaliseFornLOJA24: TIntegerField
      FieldName = 'LOJA24'
    end
    object CDS_AnaliseFornLOJA25: TIntegerField
      FieldName = 'LOJA25'
      Required = True
    end
    object CDS_AnaliseFornLOJA26: TIntegerField
      FieldName = 'LOJA26'
      Required = True
    end
    object CDS_AnaliseFornLOJA27: TIntegerField
      FieldName = 'LOJA27'
      Required = True
    end
    object CDS_AnaliseFornLOJA28: TIntegerField
      FieldName = 'LOJA28'
      Required = True
    end
    object CDS_AnaliseFornLOJA29: TIntegerField
      FieldName = 'LOJA29'
      Required = True
    end
    object CDS_AnaliseFornLOJA30: TIntegerField
      FieldName = 'LOJA30'
      Required = True
    end
    object CDS_AnaliseFornLOJA31: TIntegerField
      FieldName = 'LOJA31'
      Required = True
    end
    object CDS_AnaliseFornLOJA32: TIntegerField
      FieldName = 'LOJA32'
      Required = True
    end
    object CDS_AnaliseFornLOJA33: TIntegerField
      FieldName = 'LOJA33'
      Required = True
    end
    object CDS_AnaliseFornLOJA34: TIntegerField
      FieldName = 'LOJA34'
      Required = True
    end
    object CDS_AnaliseFornLOJA35: TIntegerField
      FieldName = 'LOJA35'
      Required = True
    end
    object CDS_AnaliseFornCOD_FORNECEDOR: TIntegerField
      DisplayLabel = 'C'#243'd Forn'
      FieldName = 'COD_FORNECEDOR'
    end
    object CDS_AnaliseFornFORN: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORN'
      Size = 60
    end
  end
  object DS_AnaliseForn: TDataSource
    DataSet = CDS_AnaliseForn
    Left = 177
    Top = 249
  end
  object ADOConnection1: TADOConnection
    Left = 328
    Top = 152
  end
  object DS_IBQuery: TDataSource
    DataSet = IBDataSet1
    Left = 385
    Top = 201
  end
  object IBDataSet1: TIBDataSet
    Database = DMBelShop.IBDB_BelShop
    Transaction = DMBelShop.IBT_BelShop
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      ' SELECT'
      ' TRIM(pr.cod_auxiliar) COD_AUXILIAR,'
      ' pr.cod_produto,'
      ' TRIM(pr.nome) NOME,'
      ''
      
        ' (SELECT mx.ind_curva FROM ES_PRODUTOS_MIX mx  WHERE mx.cod_prod' +
        'uto=pr.cod_produto AND mx.empresa=2) ABC,'
      ' CAST(COALESCE((SELECT SUM(COALESCE(fa.vlr_fat,0.00))'
      '      FROM ES_FAT_PERIODO fa'
      '      WHERE fa.cod_produto=pr.cod_produto) , 0.00)'
      ' AS NUMERIC(12,2)) Fat_Periodo,'
      ''
      ' TRIM(pr.desc_setor) DESC_SETOR,'
      ' TRIM(pr.desc_colecao) DESC_COLECAO,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=1)  LOJA1,'
      ' 0 LOJA2,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=3)  LOJA3,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=4)  LOJA4,'
      ' 0 LOJA5,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=6)  LOJA6,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=7)  LOJA7,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=8)  LOJA8,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=9)  LOJA9,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=10)  LOJA10,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=11)  LOJA11,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=12)  LOJA12,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=13)  LOJA13,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=14)  LOJA14,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=15)  LOJA15,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=16)  LOJA16,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=17)  LOJA17,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=18)  LOJA18,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=19)  LOJA19,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=20)  LOJA20,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=21)  LOJA21,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=22)  LOJA22,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=23)  LOJA23,'
      
        ' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
        '=pr.cod_produto AND mx.empresa=24)  LOJA24,'
      ''
      ' 0 LOJA25,'
      
        ' 0 LOJA26, 0 LOJA27, 0 LOJA28, 0 LOJA29, 0 LOJA30, 0 LOJA31, 0 L' +
        'OJA32, 0 LOJA33, 0 LOJA34,'
      ' 0 LOJA35, pr.cod_fornecedor,'
      
        ' (SELECT fo.nome_cliente FROM LINXCLIENTESFORNEC fo WHERE fo.cod' +
        '_cliente=pr.cod_fornecedor) Forn'
      ''
      ' FROM lINXPRODUTOS pr'
      ' WHERE pr.id_linha<>33'
      ' AND   id_colecao<>294'
      ' AND   pr.desativado='#39'N'#39
      ' AND   pr.cod_auxiliar IS NOT NULL'
      ' AND   pr.cod_fornecedor=56')
    Left = 336
    Top = 248
    object IBDataSet1COD_AUXILIAR: TIBStringField
      FieldName = 'COD_AUXILIAR'
      Size = 40
    end
    object IBDataSet1COD_PRODUTO: TLargeintField
      FieldName = 'COD_PRODUTO'
      Origin = 'LINXPRODUTOS.COD_PRODUTO'
    end
    object IBDataSet1NOME: TIBStringField
      FieldName = 'NOME'
      Size = 250
    end
    object IBDataSet1ABC: TIBStringField
      FieldName = 'ABC'
      Size = 1
    end
    object IBDataSet1FAT_PERIODO: TIBBCDField
      FieldName = 'FAT_PERIODO'
      Precision = 18
      Size = 2
    end
    object IBDataSet1DESC_SETOR: TIBStringField
      FieldName = 'DESC_SETOR'
      Size = 30
    end
    object IBDataSet1DESC_COLECAO: TIBStringField
      FieldName = 'DESC_COLECAO'
      Size = 50
    end
    object IBDataSet1LOJA1: TIntegerField
      FieldName = 'LOJA1'
    end
    object IBDataSet1LOJA2: TIntegerField
      FieldName = 'LOJA2'
      Required = True
    end
    object IBDataSet1LOJA3: TIntegerField
      FieldName = 'LOJA3'
    end
    object IBDataSet1LOJA4: TIntegerField
      FieldName = 'LOJA4'
    end
    object IBDataSet1LOJA5: TIntegerField
      FieldName = 'LOJA5'
      Required = True
    end
    object IBDataSet1LOJA6: TIntegerField
      FieldName = 'LOJA6'
    end
    object IBDataSet1LOJA7: TIntegerField
      FieldName = 'LOJA7'
    end
    object IBDataSet1LOJA8: TIntegerField
      FieldName = 'LOJA8'
    end
    object IBDataSet1LOJA9: TIntegerField
      FieldName = 'LOJA9'
    end
    object IBDataSet1LOJA10: TIntegerField
      FieldName = 'LOJA10'
    end
    object IBDataSet1LOJA11: TIntegerField
      FieldName = 'LOJA11'
    end
    object IBDataSet1LOJA12: TIntegerField
      FieldName = 'LOJA12'
    end
    object IBDataSet1LOJA13: TIntegerField
      FieldName = 'LOJA13'
    end
    object IBDataSet1LOJA14: TIntegerField
      FieldName = 'LOJA14'
    end
    object IBDataSet1LOJA15: TIntegerField
      FieldName = 'LOJA15'
    end
    object IBDataSet1LOJA16: TIntegerField
      FieldName = 'LOJA16'
    end
    object IBDataSet1LOJA17: TIntegerField
      FieldName = 'LOJA17'
    end
    object IBDataSet1LOJA18: TIntegerField
      FieldName = 'LOJA18'
    end
    object IBDataSet1LOJA19: TIntegerField
      FieldName = 'LOJA19'
    end
    object IBDataSet1LOJA20: TIntegerField
      FieldName = 'LOJA20'
    end
    object IBDataSet1LOJA21: TIntegerField
      FieldName = 'LOJA21'
    end
    object IBDataSet1LOJA22: TIntegerField
      FieldName = 'LOJA22'
    end
    object IBDataSet1LOJA23: TIntegerField
      FieldName = 'LOJA23'
    end
    object IBDataSet1LOJA24: TIntegerField
      FieldName = 'LOJA24'
    end
    object IBDataSet1LOJA25: TIntegerField
      FieldName = 'LOJA25'
      Required = True
    end
    object IBDataSet1LOJA26: TIntegerField
      FieldName = 'LOJA26'
      Required = True
    end
    object IBDataSet1LOJA27: TIntegerField
      FieldName = 'LOJA27'
      Required = True
    end
    object IBDataSet1LOJA28: TIntegerField
      FieldName = 'LOJA28'
      Required = True
    end
    object IBDataSet1LOJA29: TIntegerField
      FieldName = 'LOJA29'
      Required = True
    end
    object IBDataSet1LOJA30: TIntegerField
      FieldName = 'LOJA30'
      Required = True
    end
    object IBDataSet1LOJA31: TIntegerField
      FieldName = 'LOJA31'
      Required = True
    end
    object IBDataSet1LOJA32: TIntegerField
      FieldName = 'LOJA32'
      Required = True
    end
    object IBDataSet1LOJA33: TIntegerField
      FieldName = 'LOJA33'
      Required = True
    end
    object IBDataSet1LOJA34: TIntegerField
      FieldName = 'LOJA34'
      Required = True
    end
    object IBDataSet1LOJA35: TIntegerField
      FieldName = 'LOJA35'
      Required = True
    end
    object IBDataSet1COD_FORNECEDOR: TIntegerField
      FieldName = 'COD_FORNECEDOR'
      Origin = 'LINXPRODUTOS.COD_FORNECEDOR'
    end
    object IBDataSet1FORN: TIBStringField
      FieldName = 'FORN'
      Size = 60
    end
  end
end
