object DMComissaoVendedor: TDMComissaoVendedor
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 244
  Top = 115
  Height = 572
  Width = 935
  object DS_V_UltimaAtualizacao: TDataSource
    DataSet = CDS_V_UltimaAtualizacao
    Left = 120
    Top = 56
  end
  object CDS_V_UltimaAtualizacao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 40
    object CDS_V_UltimaAtualizacaoIMP: TStringField
      Alignment = taCenter
      DisplayLabel = 'Imp'
      FieldName = 'IMP'
      Required = True
      FixedChar = True
      Size = 3
    end
    object CDS_V_UltimaAtualizacaoCODIGO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Cod'
      FieldName = 'CODIGO'
      Required = True
      Size = 6
    end
    object CDS_V_UltimaAtualizacaoLOJA: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'LOJA'
      Size = 60
    end
    object CDS_V_UltimaAtualizacaoDATA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Atualiza'#231#227'o'
      FieldName = 'DATA'
    end
  end
  object DS_V_Produtos: TDataSource
    DataSet = CDS_V_Produtos
    Left = 120
    Top = 144
  end
  object CDS_V_Produtos: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterPost = CDS_V_ProdutosAfterPost
    Left = 64
    Top = 128
    object CDS_V_ProdutosCOD_PRODUTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod'
      FieldName = 'COD_PRODUTO'
      Required = True
      FixedChar = True
      Size = 6
    end
    object CDS_V_ProdutosAPRESENTACAO: TStringField
      FieldName = 'APRESENTACAO'
      Size = 80
    end
    object CDS_V_ProdutosFAT_CONVERSAO: TFMTBCDField
      DisplayLabel = 'Vlr Convers'#227'o'
      FieldName = 'FAT_CONVERSAO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_ProdutosDTA_VALIDADE_INI: TDateField
      Alignment = taCenter
      DisplayLabel = 'Validade Inicial'
      FieldName = 'DTA_VALIDADE_INI'
    end
    object CDS_V_ProdutosDTA_VALIDADE_FIM: TDateField
      Alignment = taCenter
      DisplayLabel = 'Validade Final'
      FieldName = 'DTA_VALIDADE_FIM'
    end
  end
  object CDS_V_Aplicacao: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Des_Aplicacao'
    Params = <>
    AfterPost = CDS_V_AplicacaoAfterPost
    BeforeDelete = CDS_V_AplicacaoBeforeDelete
    Left = 64
    Top = 203
    object CDS_V_AplicacaoDES_APLICACAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_APLICACAO'
      Size = 30
    end
    object CDS_V_AplicacaoCOD_APLICACAO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd'
      FieldName = 'COD_APLICACAO'
      Size = 4
    end
  end
  object DS_V_Aplicacao: TDataSource
    DataSet = CDS_V_Aplicacao
    Left = 120
    Top = 219
  end
  object CDS_V_FamiliaPrecos: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'DES_FAMILIA'
    Params = <>
    AfterPost = CDS_V_FamiliaPrecosAfterPost
    BeforeDelete = CDS_V_FamiliaPrecosBeforeDelete
    Left = 64
    Top = 260
    object CDS_V_FamiliaPrecosDES_FAMILIA: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_FAMILIA'
      Size = 40
    end
    object CDS_V_FamiliaPrecosCOD_FAMILIA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd'
      FieldName = 'COD_FAMILIA'
      Size = 4
    end
    object CDS_V_FamiliaPrecosFAT_CONVERSAO: TFMTBCDField
      DisplayLabel = 'Vlr Convers'#227'o'
      FieldName = 'VLR_CONVERSAO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
  end
  object DS_V_FamiliaPrecos: TDataSource
    DataSet = CDS_V_FamiliaPrecos
    Left = 120
    Top = 276
  end
  object IBQ_ProdutoMPMS: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select'
      
        #39'UPDATE OR INSERT INTO PRODUTO (CODPRODUTO, APRESENTACAO, CODBAR' +
        'RA, SITUACAOPRO, UNIDADE, UNIDADEESTOQUE, CLASSEABC, PRINCIPALFO' +
        'R, NOMEFORNECEDOR, REFERENCIA, CODGRUPOSUB, CODGRUPO, NOMEGRUPO,' +
        ' CODSUBGRUPO, NOMESUBGRUPO, CODFAMILIAPRECO, NOMEFAMILIAPRECO, N' +
        'OMEGENERICO, CODAPLICACAO, NOMEAPLICACAO, CODICMVENDA, CODICMCOM' +
        'PRA, CODIPICOMPRA, CODIPIVENDA, ISS, PESO, PESOBRUTO, CODNACIONA' +
        'LIDADE, CONTROLALOTE, DIASVENCELOTE, NAOVENDEZERADO, CODMERCOSUL' +
        'NCM, GRUPOSTMVA, CODPISCOFINS_VENDA, CODPISCOFINS_COMPRA, ECOMME' +
        'RCE_SN, PRECOCOMPRA, PRECOVENDA, MARGEM, DATAINCLUSAO, DATAALTER' +
        'ACAO, DTA_ATUALIZACAO) values ('#39'||'
      #39#39#39#39'||pr.codproduto||'#39#39#39','#39'||'
      #39#39#39#39'||replace (COALESCE(pr.apresentacao,'#39#39'),'#39#39#39#39','#39'"'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.codbarra,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.situacaopro,'#39'0'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.unidade,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.unidadeestoque,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.classeabc,'#39'E'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.principalfor,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||replace (COALESCE(fo.nomefornecedor,'#39#39'),'#39#39#39#39','#39'"'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.referencia,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.codgruposub,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(gr.codgrupo,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(gr.nomegrupo,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(sg.codsubgrupo,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||replace (COALESCE(sg.nomesubgrupo,'#39#39'),'#39#39#39#39','#39'"'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.codfamiliapreco,'#39#39')||'#39#39#39','#39'||'
      
        #39#39#39#39'||replace (COALESCE(fp.nomefamiliapreco,'#39#39'),'#39#39#39#39','#39'"'#39')||'#39#39#39','#39 +
        '||'
      #39#39#39#39'||replace (COALESCE(pr.nomegenerico,'#39#39'),'#39#39#39#39','#39'"'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.codaplicacao,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||replace (COALESCE(ap.nomeaplicacao,'#39#39'),'#39#39#39#39','#39'"'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.codicmvenda,'#39'00'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.codicmcompra,'#39'00'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.codipicompra,'#39'00'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.codipivenda,'#39'00'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.iss,0.00) ||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.peso,0.0000)||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.pesobruto,0.0000)||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.codnacionalidade,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.controlalote,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.diasvencelote,0)||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.naovendezerado,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.codmercosulncm,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.grupostmva,0)||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.codpiscofins_venda,'#39'00'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.codpiscofins_compra,'#39'00'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.ecommerce_sn,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(lp.precocompra, 0.0000)||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(lp.precovenda,0.0000)||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(lp.margem, 0.0000)||'#39#39#39','#39'||'
      #39#39#39#39'||pr.datainclusao||'#39#39#39','#39'||'
      #39#39#39#39'||pr.dataalteracao||'#39#39#39','#39'||'
      #39#39#39#39'||current_date||'#39#39#39#39'||'
      #39') MATCHING (CODPRODUTO)'#39' UPDATE_INSERT'
      ''
      'from produto pr'
      '     left join gruposub sg  on sg.codgruposub=pr.codgruposub'
      '     left join grupo    gr  on gr.codgrupo=sg.codgrupo'
      
        '     left join familiap fp  on fp.codfamiliapreco=pr.codfamiliap' +
        'reco'
      '     left join aplica   ap  on ap.codaplicacao=pr.codaplicacao'
      '     left join forneced fo  on fo.codfornecedor=pr.principalfor'
      '     left join listapre lp  on lp.codlista='#39'0006'#39
      '                           and lp.codproduto=pr.codproduto')
    Left = 264
    Top = 40
    object IBQ_ProdutoMPMSUPDATE_INSERT: TIBStringField
      FieldName = 'UPDATE_INSERT'
      Size = 1359
    end
  end
  object SDS_ComisVendedores: TSQLDataSet
    CommandText = 
      '/* Apresenta J'#225' Calculado */'#13#10'select'#13#10#39'Bel_'#39'||cv.cod_loja cod_lo' +
      'ja, em.razao_social Loja,'#13#10'cv.cod_vendedor, cv.des_vendedor,'#13#10'Co' +
      'unt(distinct coalesce(cv.numero, 0)) Qtd_Notas,'#13#10'sum(Cast(coales' +
      'ce(cv.qtd_atendida, 0) as Integer)) Qtd_Venda,'#13#10'coalesce(cv.vlr_' +
      'conversao, 0.00) VLR_CONVERSAO,'#13#10'sum(Cast(coalesce(cv.qtd_atendi' +
      'da, 0) as Integer)*coalesce(cv.vlr_conversao, 0.00)) VLR_COMISSA' +
      'O'#13#10#13#10'from fin_vend_comissao_vendas cv'#13#10'      Left Join emp_conex' +
      'oes em            on em.cod_filial=cv.cod_loja'#13#10#13#10'where cv.num_d' +
      'octo=1'#13#10'group by 1,2,3,4,7'#13#10#13#10'UNION'#13#10#13#10'select'#13#10#39'Bel_'#39'||cv.cod_lo' +
      'ja cod_loja, em.razao_social Loja, --'#39'TOTAL'#39' Loja, --em.razao_so' +
      'cial Loja,'#13#10#39'TOTAL'#39' cod_vendedor, cv.des_vendedor,'#13#10'Count(distin' +
      'ct coalesce(cv.numero, 0)) Qtd_Notas,'#13#10'sum(Cast(coalesce(cv.qtd_' +
      'atendida, 0) as Integer)) Qtd_Venda,'#13#10'0.00 VLR_CONVERSAO,'#13#10'sum(C' +
      'ast(coalesce(cv.qtd_atendida, 0) as Integer)*coalesce(cv.vlr_con' +
      'versao, 0.00)) VLR_COMISSAO'#13#10#13#10'from fin_vend_comissao_vendas cv'#13 +
      #10'      Left Join emp_conexoes em            on em.cod_filial=cv.' +
      'cod_loja'#13#10#13#10'where cv.num_docto=1'#13#10'group by 1,2,3,4'#13#10#13#10'UNION'#13#10#13#10's' +
      'elect'#13#10#39'Bel_'#39'||cv.cod_loja cod_loja, em.razao_social Loja, --'#39'TO' +
      'TAL GERAL'#39' Loja, --em.razao_social Loja,'#13#10#39'TOTAL DA LOJA'#39' cod_ve' +
      'ndedor, '#39#39' des_vendedor,'#13#10'Count(distinct coalesce(cv.numero, 0))' +
      ' Qtd_Notas,'#13#10'sum(Cast(coalesce(cv.qtd_atendida, 0) as Integer)) ' +
      'Qtd_Venda,'#13#10'0.00 VLR_CONVERSAO,'#13#10'sum(Cast(coalesce(cv.qtd_atendi' +
      'da, 0) as Integer)*coalesce(cv.vlr_conversao, 0.00)) VLR_COMISSA' +
      'O'#13#10#13#10'from fin_vend_comissao_vendas cv'#13#10'      Left Join emp_conex' +
      'oes em            on em.cod_filial=cv.cod_loja'#13#10#13#10'where cv.num_d' +
      'octo=1'#13#10'group by 1,2,3,4'#13#10#13#10'UNION'#13#10#13#10'select'#13#10#39#39' cod_loja, '#39'TOTAL' +
      ' DA EMPRESA'#39' Loja, --'#39'TOTAL GERAL'#39' Loja, --em.razao_social Loja,' +
      #13#10#39#39' cod_vendedor, '#39#39' des_vendedor,'#13#10'Count(distinct coalesce(cv.' +
      'numero, 0)) Qtd_Notas,'#13#10'sum(Cast(coalesce(cv.qtd_atendida, 0) as' +
      ' Integer)) Qtd_Venda,'#13#10'0.00 VLR_CONVERSAO,'#13#10'sum(Cast(coalesce(cv' +
      '.qtd_atendida, 0) as Integer)*coalesce(cv.vlr_conversao, 0.00)) ' +
      'VLR_COMISSAO'#13#10#13#10'from fin_vend_comissao_vendas cv'#13#10'      Left Joi' +
      'n emp_conexoes em            on em.cod_filial=cv.cod_loja'#13#10#13#10'whe' +
      're cv.num_docto=1'#13#10#13#10'order by 1,4,3,2'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 56
    Top = 392
  end
  object DSP_ComisVendedores: TDataSetProvider
    DataSet = SDS_ComisVendedores
    Options = [poRetainServerOrder]
    Left = 112
    Top = 408
  end
  object CDS_ComisVendedores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ComisVendedores'
    Left = 176
    Top = 392
    object CDS_ComisVendedoresCOD_LOJA: TStringField
      Alignment = taCenter
      DisplayLabel = 'C'#243'd'
      FieldName = 'COD_LOJA'
      Size = 6
    end
    object CDS_ComisVendedoresLOJA: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'LOJA'
      Size = 60
    end
    object CDS_ComisVendedoresCOD_VENDEDOR: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd Vend'
      FieldName = 'COD_VENDEDOR'
      FixedChar = True
      Size = 6
    end
    object CDS_ComisVendedoresDES_VENDEDOR: TStringField
      DisplayLabel = 'Vendedor'
      FieldName = 'DES_VENDEDOR'
      FixedChar = True
      Size = 30
    end
    object CDS_ComisVendedoresQTD_NOTAS: TIntegerField
      DisplayLabel = 'Qtd Notas'
      FieldName = 'QTD_NOTAS'
      Required = True
    end
    object CDS_ComisVendedoresQTD_VENDA: TFMTBCDField
      DisplayLabel = 'Qtd Vd'
      FieldName = 'QTD_VENDA'
      DisplayFormat = '0,'
      Precision = 15
      Size = 0
    end
    object CDS_ComisVendedoresVLR_CONVERSAO: TFMTBCDField
      DisplayLabel = 'Vlr Conv'
      FieldName = 'VLR_CONVERSAO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_ComisVendedoresVLR_COMISSAO: TFMTBCDField
      DisplayLabel = 'Vlr Comiss'#227'o'
      FieldName = 'VLR_COMISSAO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
  end
  object DS_ComisVendedores: TDataSource
    DataSet = CDS_ComisVendedores
    Left = 240
    Top = 408
  end
  object DS_V_CampPessoas: TDataSource
    DataSet = CDS_V_CampPessoas
    Left = 398
    Top = 163
  end
  object CDS_V_CampPessoas: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CDS_V_CampPessoasAfterScroll
    Left = 320
    Top = 152
    object CDS_V_CampPessoasCOD_AUX: TIntegerField
      FieldName = 'COD_AUX'
      Required = True
    end
    object CDS_V_CampPessoasCOD_LOJA: TIntegerField
      FieldName = 'COD_LOJA'
      Required = True
    end
    object CDS_V_CampPessoasPESSOA: TStringField
      DisplayLabel = 'Nome Pessoa'
      FieldName = 'PESSOA'
      Size = 50
    end
    object CDS_V_CampPessoasCARGO: TStringField
      DisplayLabel = 'Cargo'
      FieldName = 'CARGO'
      Size = 50
    end
    object CDS_V_CampPessoasPER_FAT: TFMTBCDField
      DisplayLabel = '% / Fat'
      FieldName = 'PER_FAT'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_CampPessoasVLR_UNID: TFMTBCDField
      DisplayLabel = 'Vlr / Unid'
      FieldName = 'VLR_UNID'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
  end
  object SDS_CampCampanhas: TSQLDataSet
    CommandText = 
      'SELECT'#13#10't.cod_aux COD_CAMPANHA,'#13#10't.des_aux DES_CAMPANHA,'#13#10't.vlr_' +
      'aux PER_FAT,'#13#10't.vlr_aux1 VLR_UNID'#13#10#13#10'FROM TAB_AUXILIAR t'#13#10'WHERE ' +
      't.tip_aux=28'#13#10'ORDER BY 1,2'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 272
    Top = 224
  end
  object DSP_CampCampanhas: TDataSetProvider
    DataSet = SDS_CampCampanhas
    Left = 320
    Top = 237
  end
  object CDS_CampCampanhas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_CampCampanhas'
    Left = 368
    Top = 225
    object CDS_CampCampanhasCOD_CAMPANHA: TIntegerField
      DisplayLabel = 'C'#243'd'
      FieldName = 'COD_CAMPANHA'
      Required = True
    end
    object CDS_CampCampanhasDES_CAMPANHA: TStringField
      DisplayLabel = 'Descri'#231#227'o da Campanha'
      FieldName = 'DES_CAMPANHA'
      Size = 50
    end
    object CDS_CampCampanhasPER_FAT: TFMTBCDField
      DisplayLabel = '% / Venda $'
      FieldName = 'PER_FAT'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CampCampanhasVLR_UNID: TFMTBCDField
      DisplayLabel = 'Vlr / Unid $'
      FieldName = 'VLR_UNID'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
  end
  object DS_CampCampanhas: TDataSource
    DataSet = CDS_CampCampanhas
    Left = 416
    Top = 237
  end
  object SQLDataSet1: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'first 10 v.cod_vendedor Codigo, --1'#13#10'v.nome_vendedor Des' +
      'cricao, --2'#13#10'p.id_colecao Cod_Camp, --3'#13#10'p.desc_colecao Campanha' +
      ', --4'#13#10#13#10'CAST(ROUND(SUM(DECODE(m.operacao, '#39'S'#39', m.quantidade,  -' +
      'm.quantidade)),2) AS INTEGER) Qtd_Itens, --5'#13#10't.vlr_aux1 Pontos_' +
      'Item, --6'#13#10'(CAST(ROUND(SUM(DECODE(m.operacao, '#39'S'#39', m.quantidade,' +
      '  -m.quantidade)),2) AS INTEGER)) * t.vlr_aux1 Vlr_Comis_Itens, ' +
      '--7'#13#10#13#10'CAST(ROUND(SUM(DECODE(m.operacao, '#39'S'#39', m.valor_total, -m.' +
      'valor_total)),2) AS NUMERIC(12,2)) Vlr_Fat, --8'#13#10't.vlr_aux Per_F' +
      'at, --9'#13#10'(CAST(ROUND(((SUM(DECODE(m.operacao, '#39'S'#39', m.valor_total' +
      ', -m.valor_total)) * t.vlr_aux) / 100),2) AS NUMERIC(12,2))) Vlr' +
      '_Comis_Fat, --10'#13#10#13#10'((CAST(ROUND(SUM(DECODE(m.operacao, '#39'S'#39', m.q' +
      'uantidade,  -m.quantidade)),2) AS INTEGER)) * t.vlr_aux1) +'#13#10'   ' +
      '(CAST(ROUND(((SUM(DECODE(m.operacao, '#39'S'#39', m.valor_total, -m.valo' +
      'r_total)) * t.vlr_aux) / 100),2) AS NUMERIC(12,2))) Tot_Comissao' +
      #13#10#13#10#13#10'FROM LINXMOVIMENTO m, LINXVENDEDORES v, LINXPRODUTOS p, TA' +
      'B_AUXILIAR t'#13#10'WHERE m.cod_vendedor=v.cod_vendedor'#13#10'AND m.empresa' +
      '=v.empresa'#13#10'AND m.cod_produto=p.cod_produto'#13#10'AND p.id_colecao=t.' +
      'cod_aux'#13#10'AND t.tip_aux=28'#13#10'AND v.tipo_vendedor in ('#39'V'#39', '#39'A'#39')'#13#10'AN' +
      'D m.cancelado='#39'N'#39#13#10'AND m.excluido='#39'N'#39#13#10'AND ((m.operacao='#39'S'#39' AND ' +
      'm.tipo_transacao='#39'V'#39')'#13#10'     OR'#13#10'     (m.operacao='#39'DS'#39' AND m.tipo' +
      '_transacao IS NULL))'#13#10'AND m.data_documento BETWEEN '#39'01.05.2018'#39' ' +
      'AND '#39'31.05.2018'#39#13#10#13#10'GROUP BY 1,2,3,4,6,9'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 776
    Top = 216
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Left = 824
    Top = 229
  end
  object CDS_V_CampComissoes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 297
    object CDS_V_CampComissoesCODIGO: TIntegerField
      DisplayLabel = 'C'#243'd'
      FieldName = 'CODIGO'
    end
    object CDS_V_CampComissoesDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object CDS_V_CampComissoesCOD_CAMP: TIntegerField
      DisplayLabel = 'C'#243'd'
      FieldName = 'COD_CAMP'
    end
    object CDS_V_CampComissoesCAMPANHA: TStringField
      DisplayLabel = 'Campanha'
      FieldName = 'CAMPANHA'
      Size = 50
    end
    object CDS_V_CampComissoesQTD_ITENS: TIntegerField
      DisplayLabel = 'Itens'
      FieldName = 'QTD_ITENS'
      DisplayFormat = ',0'
    end
    object CDS_V_CampComissoesPONTOS_ITEM: TFMTBCDField
      DisplayLabel = 'Pts/Item'
      FieldName = 'PONTOS_ITEM'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_CampComissoesVLR_COMIS_ITENS: TFMTBCDField
      DisplayLabel = 'Comiss'#227'o Itens'
      FieldName = 'VLR_COMIS_ITENS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_CampComissoesVLR_FAT: TFMTBCDField
      DisplayLabel = 'Faturamento'
      FieldName = 'VLR_FAT'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_CampComissoesPER_FAT: TFMTBCDField
      DisplayLabel = '% / Fat'
      FieldName = 'PER_FAT'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_CampComissoesVLR_COMIS_FAT: TFMTBCDField
      DisplayLabel = 'Comiss'#227'o Fat'
      FieldName = 'VLR_COMIS_FAT'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_CampComissoesTOT_COMISSAO: TFMTBCDField
      DisplayLabel = 'Tot Comiss'#227'o'
      FieldName = 'TOT_COMISSAO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
  end
  object DS_V_CampComissoes: TDataSource
    DataSet = CDS_V_CampComissoes
    Left = 416
    Top = 309
  end
end
