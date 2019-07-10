object DMDebCredST: TDMDebCredST
  OldCreateOrder = False
  Left = 238
  Top = 114
  Height = 532
  Width = 965
  object SQLQ_VlrBcICMSST: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      '-- 01- FORNECEDOR COM VLR_BASE_ICMS_ST = 0'
      '------ Cabe'#231'alho'
      'SELECT'
      'NULL COD_FORNECEDOR,'
      #39'D'#233'bito/Cr'#233'dito ST - FORNECEDORES BASE ST'#39' NOME_FORNECDOR,'
      'NULL TOT_DEBITO_ICMS_ST,'
      'NULL BC_ICMS_ST,'
      '0 ORDEM'
      'FROM RDB$DATABASE'
      ''
      'UNION ALL'
      ''
      '------ Linha em Branco'
      'SELECT'
      'NULL COD_FORNECEDOR,'
      'NULL NOME_FORNECDOR,'
      'NULL TOT_DEBITO_ICMS_ST,'
      'NULL BC_ICMS_ST,'
      '1 ORDEM'
      'FROM RDB$DATABASE'
      ''
      'UNION ALL'
      ''
      '------ Fornecdores'
      'SELECT'
      'dc.cod_fornecedor COD_FORNECEDOR,'
      'fo.nome_cliente NOME_FORNECDOR,'
      '--SUM(dc.vlr_debito_icms_st) TOT_DEBITO_ICMS_ST,'
      '0.00 TOT_DEBITO_ICMS_ST,'
      ''
      'CASE'
      '  WHEN (SUM(DC.vlr_base_icms_st)=0.00) THEN'
      '     '#39'SEM'#39
      '  ELSE'
      '     '#39'COM'#39
      'END BC_ICMS_ST,'
      '2 ORDEM'
      ''
      'FROM DEB_CRED_ICMS_ST dc, LINXCLIENTESFORNEC fo'
      'WHERE dc.cod_fornecedor=fo.cod_cliente'
      'AND   dc.modalidade='#39'COMPRAS'#39
      'GROUP BY 1,2'
      ''
      'ORDER BY 5,2')
    SQLConnection = DMBelShop.SQLC
    Left = 46
    Top = 92
  end
  object DSP_VlrBcICMSST: TDataSetProvider
    DataSet = SQLQ_VlrBcICMSST
    Options = [poRetainServerOrder]
    Left = 94
    Top = 105
  end
  object CDS_VlrBcICMSST: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_VlrBcICMSST'
    Left = 146
    Top = 92
    object CDS_VlrBcICMSSTCOD_FORNECEDOR: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_FORNECEDOR'
    end
    object CDS_VlrBcICMSSTNOME_FORNECDOR: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOME_FORNECDOR'
      Size = 60
    end
    object CDS_VlrBcICMSSTTOT_DEBITO_ICMS_ST: TFMTBCDField
      DisplayLabel = '$ Total D'#233'bito ICMS ST'
      FieldName = 'TOT_DEBITO_ICMS_ST'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_VlrBcICMSSTBC_ICMS_ST: TStringField
      Alignment = taCenter
      DisplayLabel = 'Base Calculo ICMS ST'
      FieldName = 'BC_ICMS_ST'
      FixedChar = True
      Size = 3
    end
    object CDS_VlrBcICMSSTORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object DS_VlrBcICMSST: TDataSource
    DataSet = CDS_VlrBcICMSST
    Left = 200
    Top = 104
  end
  object SQLQ_TotaisForn: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'Dta1'
        ParamType = ptInput
        Value = '01.03.2017'
      end
      item
        DataType = ftString
        Name = 'Dta1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Dta1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Dta2'
        ParamType = ptInput
        Value = '31.03.2017'
      end
      item
        DataType = ftString
        Name = 'Dta2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Dta2'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'Vlr1'
        ParamType = ptInput
        Value = 10000c
      end
      item
        DataType = ftCurrency
        Name = 'Vlr2'
        ParamType = ptInput
        Value = 9999999990000c
      end
      item
        DataType = ftString
        Name = 'Dta1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Dta2'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'Vlr1'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'Vlr2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Dta1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Dta2'
        ParamType = ptInput
      end>
    SQL.Strings = (
      '------ Cabe'#231'alho'
      'SELECT'
      'NULL SELECAO,'
      'NULL COD_FORNECEDOR,'
      #39'D'#233'bito/Cr'#233'dito ST - FORNECEDORES'#39' NOME_FORNECDOR,'
      'NULL TOT_ICMS_ST_VENDA,'
      'NULL TOT_ICMS_ST_COMPRA,'
      'NULL TOT_DEB_CRED_ICMS_ST,'
      '0 ORDEM'
      'FROM RDB$DATABASE'
      ''
      'UNION ALL'
      ''
      '------ Per'#237'odo'
      'SELECT'
      'NULL SELECAO,'
      'NULL COD_FORNECEDOR,'
      
        #39'Per'#237'odo de: '#39'||CAST(LPAD(EXTRACT(DAY FROM CAST(:Dta1 AS DATE)),' +
        '2,'#39'0'#39') AS VARCHAR(2))||'#39'/'#39'||'
      
        '                CAST(LPAD(EXTRACT(MONTH FROM CAST(:Dta1 AS DATE)' +
        '),2,'#39'0'#39') AS VARCHAR(2))||'#39'/'#39'||'
      
        '                CAST(EXTRACT(YEAR FROM CAST(:Dta1 AS DATE)) AS V' +
        'ARCHAR(4))||'
      '                '#39' A '#39'||'
      
        '                CAST(LPAD(EXTRACT(DAY FROM CAST(:Dta2 AS DATE)),' +
        '2,'#39'0'#39') AS VARCHAR(2))||'#39'/'#39'||'
      
        '                CAST(LPAD(EXTRACT(MONTH FROM CAST(:Dta2 AS DATE)' +
        '),2,'#39'0'#39') AS VARCHAR(2))||'#39'/'#39'||'
      
        '                CAST(EXTRACT(YEAR FROM CAST(:Dta2 AS DATE)) AS V' +
        'ARCHAR(4))'
      '                NOME_FORNECDOR,'
      'NULL TOT_ICMS_ST_VENDA,'
      'NULL TOT_ICMS_ST_COMPRA,'
      'NULL TOT_DEB_CRED_ICMS_ST,'
      '1 ORDEM'
      'FROM RDB$DATABASE'
      ''
      'UNION ALL'
      ''
      '------ Linha em Branco'
      'SELECT'
      'NULL SELECAO,'
      'NULL COD_FORNECEDOR,'
      'NULL NOME_FORNECDOR,'
      'NULL TOT_ICMS_ST_VENDA,'
      'NULL TOT_ICMS_ST_COMPRA,'
      'NULL TOT_DEB_CRED_ICMS_ST,'
      '2 ORDEM'
      'FROM RDB$DATABASE'
      ''
      'UNION ALL'
      ''
      '------ Totais'
      'SELECT'
      'NULL SELECAO,'
      'NULL COD_FORNECEDOR,'
      #39'TOTAIS D'#233'bito/Cr'#233'dito'#39' NOME_FORNECDOR,'
      
        'CAST(SUM(dc.vlr_icms_efetivo) AS NUMERIC(18,2)) TOT_ICMS_ST_VEND' +
        'A,'
      
        'CAST(SUM(dc.qtd_item * dc.vlr_icms_efetivo_c) AS NUMERIC(18,2)) ' +
        'TOT_ICMS_ST_COMPRA,'
      
        'CAST(SUM(dc.vlr_icms_efetivo - (dc.qtd_item * dc.vlr_icms_efetiv' +
        'o_c)) AS NUMERIC(18,2)) TOT_DEB_CRED_ICMS_ST,'
      '3 ORDEM'
      ''
      'FROM DEB_CRED_ICMS_ST dc, LINXCLIENTESFORNEC fo'
      'WHERE dc.cod_fornecedor=fo.cod_cliente'
      'AND   dc.modalidade='#39'VENDAS'#39
      'AND   dc.vlr_icms_efetivo_c between :Vlr1 and :Vlr2'
      'AND   dc.data_lancamento BETWEEN :Dta1 AND :Dta2 -- Alterar'
      ''
      'UNION ALL'
      ''
      '------ Linha em Branco'
      'SELECT'
      'NULL SELECAO,'
      'NULL COD_FORNECEDOR,'
      'NULL NOME_FORNECDOR,'
      'NULL TOT_ICMS_ST_VENDA,'
      'NULL TOT_ICMS_ST_COMPRA,'
      'NULL TOT_DEB_CRED_ICMS_ST,'
      '4 ORDEM'
      'FROM RDB$DATABASE'
      ''
      'UNION ALL'
      ''
      '------ Fornecedores'
      'SELECT'
      #39'NAO'#39' SELECAO,'
      'dc.cod_fornecedor COD_FORNECEDOR,'
      'fo.nome_cliente NOME_FORNECDOR,'
      
        'CAST(SUM(dc.vlr_icms_efetivo) AS NUMERIC(18,2)) TOT_ICMS_ST_VEND' +
        'A,'
      
        'CAST(SUM(dc.qtd_item * dc.vlr_icms_efetivo_c) AS NUMERIC(18,2)) ' +
        'TOT_ICMS_ST_COMPRA,'
      
        'CAST(SUM(dc.vlr_icms_efetivo - (dc.qtd_item * dc.vlr_icms_efetiv' +
        'o_c)) AS NUMERIC(18,2)) TOT_DEB_CRED_ICMS_ST,'
      '5 ORDEM'
      ''
      'FROM DEB_CRED_ICMS_ST dc, LINXCLIENTESFORNEC fo'
      'WHERE dc.cod_fornecedor=fo.cod_cliente'
      'AND   dc.modalidade='#39'VENDAS'#39
      'AND   dc.vlr_icms_efetivo_c between :Vlr1 and :Vlr2'
      'AND   dc.data_lancamento BETWEEN :Dta1 AND :Dta2 -- Alterar'
      'GROUP BY 7, 2,3'
      ''
      'ORDER BY 7,3')
    SQLConnection = DMBelShop.SQLC
    Left = 46
    Top = 164
  end
  object DSP_TotaisForn: TDataSetProvider
    DataSet = SQLQ_TotaisForn
    Options = [poRetainServerOrder]
    Left = 94
    Top = 177
  end
  object CDS_TotaisForn: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_TotaisForn'
    Left = 146
    Top = 164
    object CDS_TotaisFornSELECAO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Sele'#231#227'o'
      FieldName = 'SELECAO'
      FixedChar = True
      Size = 3
    end
    object CDS_TotaisFornCOD_FORNECEDOR: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_FORNECEDOR'
    end
    object CDS_TotaisFornNOME_FORNECDOR: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOME_FORNECDOR'
      Size = 60
    end
    object CDS_TotaisFornTOT_ICMS_ST_VENDA: TFMTBCDField
      DisplayLabel = '$ ICMS ST Venda'
      FieldName = 'TOT_ICMS_ST_VENDA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_TotaisFornTOT_ICMS_ST_COMPRA: TFMTBCDField
      DisplayLabel = '$ ICMS ST Compra'
      FieldName = 'TOT_ICMS_ST_COMPRA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_TotaisFornTOT_DEB_CRED_ICMS_ST: TFMTBCDField
      DisplayLabel = '$ Total D'#233'bito/Cr'#233'dito'
      FieldName = 'TOT_DEB_CRED_ICMS_ST'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_TotaisFornORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object DS_TotaisForn: TDataSource
    DataSet = CDS_TotaisForn
    Left = 200
    Top = 176
  end
  object SQLQ_ProdutoForn: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftCurrency
        Name = 'Vlr1'
        ParamType = ptInput
        Value = 10000c
      end
      item
        DataType = ftCurrency
        Name = 'Vlr2'
        ParamType = ptInput
        Value = '9999999.99'
      end
      item
        DataType = ftString
        Name = 'Dta1'
        ParamType = ptInput
        Value = '01.04.2017'
      end
      item
        DataType = ftString
        Name = 'Dta2'
        ParamType = ptInput
        Value = '30.04.2017'
      end
      item
        DataType = ftCurrency
        Name = 'Vlr1'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'Vlr2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Dta1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Dta2'
        ParamType = ptInput
      end>
    SQL.Strings = (
      '-- 03 - PRODUTOS DE FORNECEDOR (POR FORNECEDOR SE SELECIONADO)'
      '------ Cabe'#231'alho'
      'SELECT'
      'NULL COD_PRODUTO,'
      #39'D'#233'bito/Cr'#233'dito ST - PRODUTOS'#39' NOME_PRODUTO,'
      'NULL VLR_ICMS_ST_VENDA,'
      'NULL VLR_ICMS_ST_COMPRA,'
      'NULL VLR_DEB_CRED_ICMS_ST,'
      'NULL DATA_DOCUMENTO,'
      'NULL DATA_LANCAMENTO,'
      'NULL DOCUMENTO,'
      'NULL SERIE,'
      'NULL MODELO_NF,'
      'NULL ID_CFOP,'
      'NULL CST_ICMS,'
      'NULL PER_ALIQ_ICMS,'
      'NULL VLR_ICMS,'
      'NULL PER_ALIQ_ICMS_ST,'
      'NULL VLR_ICMS_ST,'
      'NULL VLR_BASE_ICMS_ST,'
      'NULL VLR_OPERACAO,'
      'NULL MODALIDADE,'
      'NULL TIPO,'
      'NULL DES_NCM,'
      'NULL PER_ICMS,'
      'NULL PER_FCP,'
      'NULL PER_ICMS_EFETIVO,'
      'NULL UTILIZADO,'
      'NULL COD_FORNECEDOR,'
      'NULL NOME_FORNECDOR,'
      '0 ORDEM'
      'FROM RDB$DATABASE'
      ''
      'UNION ALL'
      ''
      '------ Per'#237'odo'
      'SELECT'
      'NULL COD_PRODUTO,'
      
        #39'Per'#237'odo de: '#39'||CAST(LPAD(EXTRACT(DAY FROM CAST('#39'01.11.2018'#39' AS ' +
        'DATE)),2,'#39'0'#39') AS VARCHAR(2))||'#39'/'#39'||'
      
        '                CAST(LPAD(EXTRACT(MONTH FROM CAST('#39'01.11.2018'#39' A' +
        'S DATE)),2,'#39'0'#39') AS VARCHAR(2))||'#39'/'#39'||'
      
        '                CAST(EXTRACT(YEAR FROM CAST('#39'01.11.2018'#39' AS DATE' +
        ')) AS VARCHAR(4))||'
      '                '#39' A '#39'||'
      
        '                CAST(LPAD(EXTRACT(DAY FROM CAST('#39'10.11.2018'#39' AS ' +
        'DATE)),2,'#39'0'#39') AS VARCHAR(2))||'#39'/'#39'||'
      
        '                CAST(LPAD(EXTRACT(MONTH FROM CAST('#39'10.11.2018'#39' A' +
        'S DATE)),2,'#39'0'#39') AS VARCHAR(2))||'#39'/'#39'||'
      
        '                CAST(EXTRACT(YEAR FROM CAST('#39'10.11.2018'#39' AS DATE' +
        ')) AS VARCHAR(4))'
      '                NOME_PRODUTO,'
      'NULL VLR_ICMS_ST_VENDA,'
      'NULL VLR_ICMS_ST_COMPRA,'
      'NULL VLR_DEB_CRED_ICMS_ST,'
      'NULL DATA_DOCUMENTO,'
      'NULL DATA_LANCAMENTO,'
      'NULL DOCUMENTO,'
      'NULL SERIE,'
      'NULL MODELO_NF,'
      'NULL ID_CFOP,'
      'NULL CST_ICMS,'
      'NULL PER_ALIQ_ICMS,'
      'NULL VLR_ICMS,'
      'NULL PER_ALIQ_ICMS_ST,'
      'NULL VLR_ICMS_ST,'
      'NULL VLR_BASE_ICMS_ST,'
      'NULL VLR_OPERACAO,'
      'NULL MODALIDADE,'
      'NULL TIPO,'
      'NULL DES_NCM,'
      'NULL PER_ICMS,'
      'NULL PER_FCP,'
      'NULL PER_ICMS_EFETIVO,'
      'NULL UTILIZADO,'
      'NULL COD_FORNECEDOR,'
      'NULL NOME_FORNECDOR,'
      '1 ORDEM'
      'FROM RDB$DATABASE'
      ''
      'UNION ALL'
      ''
      '------ Linha em Branco'
      'SELECT'
      'NULL COD_PRODUTO,'
      'NULL NOME_PRODUTO,'
      'NULL VLR_ICMS_ST_VENDA,'
      'NULL VLR_ICMS_ST_COMPRA,'
      'NULL VLR_DEB_CRED_ICMS_ST,'
      'NULL DATA_DOCUMENTO,'
      'NULL DATA_LANCAMENTO,'
      'NULL DOCUMENTO,'
      'NULL SERIE,'
      'NULL MODELO_NF,'
      'NULL ID_CFOP,'
      'NULL CST_ICMS,'
      'NULL PER_ALIQ_ICMS,'
      'NULL VLR_ICMS,'
      'NULL PER_ALIQ_ICMS_ST,'
      'NULL VLR_ICMS_ST,'
      'NULL VLR_BASE_ICMS_ST,'
      'NULL VLR_OPERACAO,'
      'NULL MODALIDADE,'
      'NULL TIPO,'
      'NULL DES_NCM,'
      'NULL PER_ICMS,'
      'NULL PER_FCP,'
      'NULL PER_ICMS_EFETIVO,'
      'NULL UTILIZADO,'
      'NULL COD_FORNECEDOR,'
      'NULL NOME_FORNECDOR,'
      '2 ORDEM'
      'FROM RDB$DATABASE'
      ''
      'UNION ALL'
      ''
      '------ Totais'
      'SELECT'
      'NULL COD_PRODUTO,'
      #39'TOTAIS'#39' NOME_PRODUTO,'
      
        'CAST(SUM(dc.vlr_icms_efetivo) AS NUMERIC(18,2)) TOT_ICMS_ST_VEND' +
        'A,'
      
        'CAST(SUM(dc.qtd_item * dc.vlr_icms_efetivo_c) AS NUMERIC(18,2)) ' +
        'TOT_ICMS_ST_COMPRA,'
      
        'CAST(SUM(dc.vlr_icms_efetivo - (dc.qtd_item * dc.vlr_icms_efetiv' +
        'o_c)) AS NUMERIC(18,2)) TOT_DEB_CRED_ICMS_ST,'
      'NULL DATA_DOCUMENTO,'
      'NULL DATA_LANCAMENTO,'
      'NULL DOCUMENTO,'
      'NULL SERIE,'
      'NULL MODELO_NF,'
      'NULL ID_CFOP,'
      'NULL CST_ICMS,'
      'NULL PER_ALIQ_ICMS,'
      'SUM(dc.vlr_icms) VLR_ICMS,'
      'NULL PER_ALIQ_ICMS_ST,'
      'SUM(dc.vlr_icms_st) VLR_ICMS_ST,'
      'NULL VLR_BASE_ICMS_ST,'
      'NULL VLR_OPERACAO,'
      'NULL MODALIDADE,'
      'NULL TIPO,'
      'NULL DES_NCM,'
      'NULL PER_ICMS,'
      'NULL PER_FCP,'
      'NULL PER_ICMS_EFETIVO,'
      'NULL UTILIZADO,'
      'NULL COD_FORNECEDOR,'
      'NULL NOME_FORNECDOR,'
      '3 ORDEM'
      ''
      'FROM DEB_CRED_ICMS_ST dc'
      'WHERE dc.modalidade='#39'VENDAS'#39
      'AND   dc.vlr_icms_efetivo_c between :Vlr1 and :Vlr2 -- Alterar'
      'AND   dc.data_lancamento BETWEEN :Dta1 AND :Dta2 -- Alterar'
      'AND   dc.cod_fornecedor IN (17190) -- Alterar'
      ''
      'UNION ALL'
      ''
      '------ Linha em Branco'
      'SELECT'
      'NULL COD_PRODUTO,'
      'NULL NOME_PRODUTO,'
      'NULL VLR_ICMS_ST_VENDA,'
      'NULL VLR_ICMS_ST_COMPRA,'
      'NULL VLR_DEB_CRED_ICMS_ST,'
      'NULL DATA_DOCUMENTO,'
      'NULL DATA_LANCAMENTO,'
      'NULL DOCUMENTO,'
      'NULL SERIE,'
      'NULL MODELO_NF,'
      'NULL ID_CFOP,'
      'NULL CST_ICMS,'
      'NULL PER_ALIQ_ICMS,'
      'NULL VLR_ICMS,'
      'NULL PER_ALIQ_ICMS_ST,'
      'NULL VLR_ICMS_ST,'
      'NULL VLR_BASE_ICMS_ST,'
      'NULL VLR_OPERACAO,'
      'NULL MODALIDADE,'
      'NULL TIPO,'
      'NULL DES_NCM,'
      'NULL PER_ICMS,'
      'NULL PER_FCP,'
      'NULL PER_ICMS_EFETIVO,'
      'NULL UTILIZADO,'
      'NULL COD_FORNECEDOR,'
      'NULL NOME_FORNECDOR,'
      '5 ORDEM'
      'FROM RDB$DATABASE'
      ''
      'UNION ALL'
      ''
      '------ Produtos'
      'SELECT'
      'dc.cod_produto COD_PRODUTO,'
      'pr.nome NOME_PRODUTO,'
      'CAST(dc.vlr_icms_efetivo AS NUMERIC(18,2)) TOT_ICMS_ST_VENDA,'
      
        'CAST((dc.qtd_item * dc.vlr_icms_efetivo_c) AS NUMERIC(18,2)) TOT' +
        '_ICMS_ST_COMPRA,'
      
        'CAST((dc.vlr_icms_efetivo - (dc.qtd_item * dc.vlr_icms_efetivo_c' +
        ')) AS NUMERIC(18,2)) TOT_DEB_CRED_ICMS_ST,'
      'dc.data_documento,'
      'dc.data_lancamento,'
      'dc.documento,'
      'dc.serie,'
      'dc.modelo_nf,'
      'dc.id_cfop,'
      'dc.cst_icms,'
      'dc.per_aliq_icms,'
      'dc.vlr_icms,'
      'dc.per_aliq_icms_st,'
      'dc.vlr_icms_st,'
      'dc.vlr_base_icms_st,'
      'dc.vlr_operacao,'
      'dc.modalidade,'
      'dc.tipo,'
      'dc.des_ncm,'
      'dc.per_icms,'
      'dc.per_fcp,'
      'dc.per_icms_efetivo,'
      'dc.utilizado,'
      'dc.cod_fornecedor COD_FORNECEDOR,'
      'fo.nome_cliente NOME_FORNECDOR,'
      '6 ORDEM'
      ''
      'FROM DEB_CRED_ICMS_ST dc, LINXPRODUTOS pr, LINXCLIENTESFORNEC fo'
      'WHERE dc.cod_produto=pr.cod_produto'
      'AND   dc.cod_fornecedor=fo.cod_cliente'
      'AND   dc.modalidade='#39'VENDAS'#39
      'AND   dc.vlr_icms_efetivo_c between :Vlr1 and :Vlr2 -- Alterar'
      'AND   dc.data_lancamento BETWEEN :Dta1 AND :Dta2 -- Alterar'
      'AND   dc.cod_fornecedor IN (17190) -- Alterar'
      ''
      'ORDER BY 28,2')
    SQLConnection = DMBelShop.SQLC
    Left = 46
    Top = 236
  end
  object DSP_ProdutoForn: TDataSetProvider
    DataSet = SQLQ_ProdutoForn
    Options = [poRetainServerOrder]
    Left = 94
    Top = 249
  end
  object CDS_ProdutoForn: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ProdutoForn'
    Left = 146
    Top = 236
    object CDS_ProdutoFornCOD_PRODUTO: TFMTBCDField
      DisplayLabel = 'C'#243'd Prod'
      FieldName = 'COD_PRODUTO'
      Precision = 15
      Size = 0
    end
    object CDS_ProdutoFornNOME_PRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'NOME_PRODUTO'
      Size = 250
    end
    object CDS_ProdutoFornVLR_ICMS_ST_VENDA: TFMTBCDField
      DisplayLabel = '$ ICMS ST Venda'
      FieldName = 'VLR_ICMS_ST_VENDA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ProdutoFornVLR_ICMS_ST_COMPRA: TFMTBCDField
      DisplayLabel = '$ ICMS ST Compra'
      FieldName = 'VLR_ICMS_ST_COMPRA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ProdutoFornVLR_DEB_CRED_ICMS_ST: TFMTBCDField
      DisplayLabel = '$ D'#233'b/Cr'#233'd ICMS ST'
      FieldName = 'VLR_DEB_CRED_ICMS_ST'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ProdutoFornDATA_DOCUMENTO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Dcto'
      FieldName = 'DATA_DOCUMENTO'
    end
    object CDS_ProdutoFornDATA_LANCAMENTO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Lan'#231'mto'
      FieldName = 'DATA_LANCAMENTO'
    end
    object CDS_ProdutoFornDOCUMENTO: TIntegerField
      DisplayLabel = 'N'#186' Docto'
      FieldName = 'DOCUMENTO'
    end
    object CDS_ProdutoFornSERIE: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE'
      Size = 10
    end
    object CDS_ProdutoFornMODELO_NF: TStringField
      Alignment = taCenter
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO_NF'
      Size = 3
    end
    object CDS_ProdutoFornID_CFOP: TStringField
      DisplayLabel = 'CFop'
      FieldName = 'ID_CFOP'
      Size = 5
    end
    object CDS_ProdutoFornCST_ICMS: TStringField
      DisplayLabel = 'CST'
      FieldName = 'CST_ICMS'
      Size = 5
    end
    object CDS_ProdutoFornPER_ALIQ_ICMS: TFMTBCDField
      DisplayLabel = '% Aliq ICMS'
      FieldName = 'PER_ALIQ_ICMS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ProdutoFornVLR_ICMS: TFMTBCDField
      DisplayLabel = '$ ICMS'
      FieldName = 'VLR_ICMS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ProdutoFornPER_ALIQ_ICMS_ST: TFMTBCDField
      DisplayLabel = '% Aliq ICMS ST'
      FieldName = 'PER_ALIQ_ICMS_ST'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ProdutoFornVLR_ICMS_ST: TFMTBCDField
      DisplayLabel = '$ ICMS ST'
      FieldName = 'VLR_ICMS_ST'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ProdutoFornVLR_BASE_ICMS_ST: TFMTBCDField
      DisplayLabel = '$ BC ICMS ST'
      FieldName = 'VLR_BASE_ICMS_ST'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ProdutoFornVLR_OPERACAO: TFMTBCDField
      DisplayLabel = '$ Opera'#231#227'o'
      FieldName = 'VLR_OPERACAO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ProdutoFornMODALIDADE: TStringField
      DisplayLabel = 'Modalidade'
      FieldName = 'MODALIDADE'
      Size = 15
    end
    object CDS_ProdutoFornTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 15
    end
    object CDS_ProdutoFornDES_NCM: TStringField
      DisplayLabel = 'NCM'
      FieldName = 'DES_NCM'
    end
    object CDS_ProdutoFornPER_ICMS: TFMTBCDField
      DisplayLabel = '% ICMS NCM'
      FieldName = 'PER_ICMS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ProdutoFornPER_FCP: TFMTBCDField
      DisplayLabel = '% FCP NCM'
      FieldName = 'PER_FCP'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ProdutoFornPER_ICMS_EFETIVO: TFMTBCDField
      DisplayLabel = '% ICMS EFETIVO'
      FieldName = 'PER_ICMS_EFETIVO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ProdutoFornUTILIZADO: TStringField
      DisplayLabel = 'Utilizado'
      FieldName = 'UTILIZADO'
      Size = 35
    end
    object CDS_ProdutoFornCOD_FORNECEDOR: TIntegerField
      DisplayLabel = 'C'#243'd Forn'
      FieldName = 'COD_FORNECEDOR'
    end
    object CDS_ProdutoFornNOME_FORNECDOR: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOME_FORNECDOR'
      Size = 60
    end
    object CDS_ProdutoFornORDEM: TIntegerField
      FieldName = 'ORDEM'
      Required = True
    end
  end
  object DS_ProdutoForn: TDataSource
    DataSet = CDS_ProdutoForn
    Left = 200
    Top = 248
  end
  object DS_V_XMLsAnalisa: TDataSource
    DataSet = CDS_V_XMLsAnalisa
    Left = 152
    Top = 368
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 112
    Top = 24
  end
  object CDS_V_XMLsAnalisa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 352
    object CDS_V_XMLsAnalisaCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object CDS_V_XMLsAnalisaNOME: TStringField
      DisplayLabel = 'Nome Fornecedor'
      FieldName = 'NOME'
      Size = 60
    end
    object CDS_V_XMLsAnalisaFONE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE'
    end
    object CDS_V_XMLsAnalisaUF_EMIT: TStringField
      DisplayLabel = 'UF Emit'
      FieldName = 'UF_EMIT'
    end
    object CDS_V_XMLsAnalisaUF_DEST: TStringField
      DisplayLabel = 'UF Dest'
      FieldName = 'UF_DEST'
    end
    object CDS_V_XMLsAnalisaCST: TStringField
      FieldName = 'CST'
      Required = True
      FixedChar = True
      Size = 9
    end
    object CDS_V_XMLsAnalisaTAG_VST: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Tag vST'
      FieldName = 'TAG_VST'
      Required = True
      FixedChar = True
      Size = 3
    end
    object CDS_V_XMLsAnalisaVALOR_ST: TStringField
      Alignment = taRightJustify
      DisplayLabel = '$ vST'
      FieldName = 'VALOR_ST'
      Required = True
      FixedChar = True
      Size = 3
    end
    object CDS_V_XMLsAnalisaTAG_VFCPSTRET: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Tag vFCPSTRet'
      FieldName = 'TAG_VFCPSTRET'
      Required = True
      FixedChar = True
      Size = 3
    end
    object CDS_V_XMLsAnalisaVALOR_VFCPSTRET: TStringField
      Alignment = taRightJustify
      DisplayLabel = '$ vFCPSTRet'
      FieldName = 'VALOR_VFCPSTRET'
      Required = True
      FixedChar = True
      Size = 3
    end
  end
end
