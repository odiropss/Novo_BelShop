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
      'SELECT'#13#10'TRIM(pr.cod_auxiliar) COD_AUXILIAR,'#13#10'pr.cod_produto,'#13#10'TR' +
      'IM(pr.nome) NOME,'#13#10'TRIM(pr.desc_setor) DESC_SETOR,'#13#10'TRIM(pr.desc' +
      '_colecao) DESC_COLECAO, -- pr.desc_linha, pr.desc_marca'#13#10#13#10'-- SE' +
      ' EMPRESA'#13#10'/* 1'#13#10'(SELECT mx.ind_curva FROM ES_PRODUTOS_MIX mx WHE' +
      'RE mx.cod_produto=pr.cod_produto AND mx.empresa=2) ABC, -- ABC_E' +
      'mpresa,'#13#10'CAST(COALESCE((SELECT SUM(COALESCE(fa.vlr_fat,0.00))'#13#10' ' +
      '              FROM w_fat_periodo fa'#13#10'               WHERE fa.cod' +
      '_produto=pr.cod_produto)'#13#10', 0.00) AS NUMERIC(12,2)) Fat_Periodo,' +
      #13#10'1 */'#13#10'-- SE EMPRESA'#13#10'--select e.cod_linx, e.cod_filial, a.nome' +
      '_abrev from emp_conexoes e, linxlojas_abreviaturas a where e.cod' +
      '_linx=a.empresa'#13#10'-- SE LOJA                                     ' +
      '                                                  /* SIDICOM */'#13 +
      #10'--/* 2'#13#10'(SELECT mx.ind_curva FROM ES_PRODUTOS_MIX mx WHERE mx.c' +
      'od_produto=pr.cod_produto AND mx.empresa=23) ABC, -- ABC_Empresa' +
      ','#13#10'CAST(COALESCE((SELECT SUM(COALESCE(fa.vlr_fat,0.00))'#13#10'       ' +
      '        FROM w_fat_periodo fa'#13#10'               WHERE fa.cod_produ' +
      'to=pr.cod_produto'#13#10'               AND   fa.empresa=23)'#13#10', 0.00) ' +
      'AS NUMERIC(12,2)) Fat_Periodo,'#13#10#13#10'--2 */'#13#10'-- SE LOJA'#13#10#13#10'(SELECT ' +
      'mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto=pr.cod_p' +
      'roduto AND mx.empresa= 1) LOJA1,  -- 02-Andradas'#13#10'--(SELECT mx.i' +
      'nd_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto=pr.cod_produ' +
      'to AND mx.empresa= 2) LOJA2,  -- 99-CD'#13#10'(SELECT mx.ind_mix FROM ' +
      'ES_PRODUTOS_MIX mx WHERE mx.cod_produto=pr.cod_produto AND mx.em' +
      'presa= 3) LOJA3,  -- 11-F Milanez'#13#10'(SELECT mx.ind_mix FROM ES_PR' +
      'ODUTOS_MIX mx WHERE mx.cod_produto=pr.cod_produto AND mx.empresa' +
      '= 4) LOJA4,  -- 12-Viam'#227'o'#13#10'(SELECT mx.ind_mix FROM ES_PRODUTOS_M' +
      'IX mx WHERE mx.cod_produto=pr.cod_produto AND mx.empresa= 5) LOJ' +
      'A5,  -- 15-Mostardeiro (Fechada)'#13#10'(SELECT mx.ind_mix FROM ES_PRO' +
      'DUTOS_MIX mx WHERE mx.cod_produto=pr.cod_produto AND mx.empresa=' +
      ' 6) LOJA6,  -- 16-Uruguai'#13#10'(SELECT mx.ind_mix FROM ES_PRODUTOS_M' +
      'IX mx WHERE mx.cod_produto=pr.cod_produto AND mx.empresa= 7) LOJ' +
      'A7,  -- 07-M Floriano'#13#10'(SELECT mx.ind_mix FROM ES_PRODUTOS_MIX m' +
      'x WHERE mx.cod_produto=pr.cod_produto AND mx.empresa= 8) LOJA8, ' +
      ' -- 01-D Feliciano'#13#10'(SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx W' +
      'HERE mx.cod_produto=pr.cod_produto AND mx.empresa= 9) LOJA9,  --' +
      ' 09-O Aranha'#13#10'(SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE m' +
      'x.cod_produto=pr.cod_produto AND mx.empresa=10) LOJA10, -- 10-Gr' +
      'avata'#237#13#10'(SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_' +
      'produto=pr.cod_produto AND mx.empresa=11) LOJA11, -- 05-S Filho'#13 +
      #10'(SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto' +
      '=pr.cod_produto AND mx.empresa=12) LOJA12, -- 13-Cachoeirinha'#13#10'(' +
      'SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto=p' +
      'r.cod_produto AND mx.empresa=13) LOJA13, -- 06-O Rocha'#13#10'(SELECT ' +
      'mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto=pr.cod_p' +
      'roduto AND mx.empresa=14) LOJA14, -- 03-A Brasil'#13#10'(SELECT mx.ind' +
      '_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto=pr.cod_produto' +
      ' AND mx.empresa=15) LOJA15, -- 04-Riachuelo'#13#10'(SELECT mx.ind_mix ' +
      'FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto=pr.cod_produto AND ' +
      'mx.empresa=16) LOJA16, -- 14-L Abreu'#13#10'(SELECT mx.ind_mix FROM ES' +
      '_PRODUTOS_MIX mx WHERE mx.cod_produto=pr.cod_produto AND mx.empr' +
      'esa=17) LOJA17, -- 17-P Alves'#13#10'(SELECT mx.ind_mix FROM ES_PRODUT' +
      'OS_MIX mx WHERE mx.cod_produto=pr.cod_produto AND mx.empresa=18)' +
      ' LOJA18, -- 18-Total'#13#10'(SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx' +
      ' WHERE mx.cod_produto=pr.cod_produto AND mx.empresa=19) LOJA19, ' +
      '-- 19-P Belas'#13#10'(SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE ' +
      'mx.cod_produto=pr.cod_produto AND mx.empresa=20) LOJA20, -- 20-T' +
      'iradentes'#13#10'(SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.c' +
      'od_produto=pr.cod_produto AND mx.empresa=21) LOJA21, -- 21-Azenh' +
      'a'#13#10'(SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produ' +
      'to=pr.cod_produto AND mx.empresa=22) LOJA22, -- 22-P Canoas'#13#10'(SE' +
      'LECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto=pr.' +
      'cod_produto AND mx.empresa=23) LOJA23, -- 08-W Escobar'#13#10'(SELECT ' +
      'mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto=pr.cod_p' +
      'roduto AND mx.empresa=24) LOJA24, -- 24-Iguatemi'#13#10#13#10'0 LOJA25,'#13#10'0' +
      ' LOJA26,'#13#10'0 LOJA27,'#13#10'0 LOJA28,'#13#10'0 LOJA29,'#13#10'0 LOJA30,'#13#10'0 LOJA31,'#13 +
      #10'0 LOJA32,'#13#10'0 LOJA33,'#13#10'0 LOJA34,'#13#10'0 LOJA35,'#13#10#13#10'pr.cod_fornecedor' +
      ','#13#10'(SELECT fo.nome_cliente FROM LINXCLIENTESFORNEC fo WHERE fo.c' +
      'od_cliente=pr.cod_fornecedor) Forn'#13#10#13#10#13#10'FROM linxprodutos pr'#13#10#13#10 +
      'WHERE pr.id_linha<>33 -- Brindes'#13#10'AND   id_colecao<>294 -- Brind' +
      'es'#13#10'AND   pr.desativado='#39'N'#39#13#10'AND   pr.cod_auxiliar IS NOT NULL'#13#10 +
      '--AND   pr.cod_fornecedor=54'#13#10'And   pr.id_setor=1'#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 45
    Top = 237
  end
  object DSP_AnaliseForn: TDataSetProvider
    DataSet = SDS_AnaliseForn
    Options = [poRetainServerOrder]
    Left = 90
    Top = 254
  end
  object CDS_AnaliseForn: TClientDataSet
    Aggregates = <>
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
end
