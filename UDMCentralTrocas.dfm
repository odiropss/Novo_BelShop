object DMCentralTrocas: TDMCentralTrocas
  OldCreateOrder = False
  Left = 242
  Top = 120
  Height = 598
  Width = 1053
  object SDS_Transf_Cd: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'CASE'#13#10'  WHEN (te.quant_tra IS NULL) AND (te.quant_ent IS' +
      ' NULL) THEN'#13#10'   '#39'A'#39#13#10'  ELSE'#13#10'   '#39'F'#39#13#10'END Sit,'#13#10'te.ind_impresso,'#13 +
      #10'te.Num_Seq,'#13#10'te.num_solicitacao, te.dta_solicitacao,'#13#10'te.codpro' +
      'duto, TRIM(pr.codbarra) codbarra, pr.apresentacao,'#13#10'pr.principal' +
      'for, fo.nomefornecedor,'#13#10'te.quant_cd, '#13#10'(COALESCE(te.quant_cd,0)' +
      '-SUM(COALESCE(te.quant_ent,0)))  Qtd_Nao'#13#10#13#10'FROM sidicom_transf_' +
      'entadas te'#13#10'    LEFT JOIN produto pr ON pr.codproduto=te.codprod' +
      'uto'#13#10'    LEFT JOIN fornecedor fo ON fo.codfornecedor= pr.princip' +
      'alfor'#13#10#13#10'WHERE te.num_solicitacao=:NUMERO'#13#10#13#10'GROUP BY 1,2,3,4,5,' +
      '6,7,8,9,10,11'#13#10#13#10'ORDER BY pr.apresentacao'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NUMERO'
        ParamType = ptInput
        Value = '1'
      end>
    SQLConnection = DMBelShop.SQLC
    Left = 48
    Top = 8
  end
  object DSP_Transf_Cd: TDataSetProvider
    DataSet = SDS_Transf_Cd
    Left = 104
    Top = 24
  end
  object CDS_Transf_Cd: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DSP_Transf_Cd'
    AfterScroll = CDS_Transf_CdAfterScroll
    Left = 165
    Top = 8
    object CDS_Transf_CdNUM_SOLICITACAO: TIntegerField
      FieldName = 'NUM_SOLICITACAO'
    end
    object CDS_Transf_CdDTA_SOLICITACAO: TDateField
      FieldName = 'DTA_SOLICITACAO'
    end
    object CDS_Transf_CdCODPRODUTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODPRODUTO'
      FixedChar = True
      Size = 6
    end
    object CDS_Transf_CdCODBARRA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'digo de Barras'
      FieldName = 'CODBARRA'
      FixedChar = True
      Size = 19
    end
    object CDS_Transf_CdAPRESENTACAO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'APRESENTACAO'
      Size = 80
    end
    object CDS_Transf_CdPRINCIPALFOR: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PRINCIPALFOR'
      FixedChar = True
      Size = 6
    end
    object CDS_Transf_CdNOMEFORNECEDOR: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOMEFORNECEDOR'
      Size = 40
    end
    object CDS_Transf_CdQUANT_CD: TFMTBCDField
      DisplayLabel = 'Quant CD'
      FieldName = 'QUANT_CD'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object CDS_Transf_CdQTD_NAO: TFMTBCDField
      DisplayLabel = 'Quant S/NFe'
      FieldName = 'QTD_NAO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object CDS_Transf_CdSIT: TStringField
      FieldName = 'SIT'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDS_Transf_CdIND_IMPRESSO: TStringField
      FieldName = 'IND_IMPRESSO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDS_Transf_CdNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
    end
    object CDS_Transf_CdTOT_PRODUTOS: TAggregateField
      FieldName = 'TOT_PRODUTOS'
      Active = True
      Expression = 'COUNT(CODPRODUTO)'
    end
    object CDS_Transf_CdTOT_QTD: TAggregateField
      FieldName = 'TOT_QTD'
      Active = True
      Expression = 'SUM(QUANT_CD)'
    end
  end
  object DS_Transf_Cd: TDataSource
    DataSet = CDS_Transf_Cd
    Left = 216
    Top = 24
  end
  object CDS_NotasEntrada: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_NotasEntrada'
    Left = 155
    Top = 80
    object CDS_NotasEntradaNUM_SOLICITACAO: TIntegerField
      FieldName = 'NUM_SOLICITACAO'
    end
    object CDS_NotasEntradaNFE_COD_LOJA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Bel_'
      FieldName = 'NFE_COD_LOJA'
      FixedChar = True
      Size = 2
    end
    object CDS_NotasEntradaNFE_COD_PRODUTO: TStringField
      FieldName = 'NFE_COD_PRODUTO'
      FixedChar = True
      Size = 6
    end
    object CDS_NotasEntradaNFE_COD_BARRAS: TStringField
      FieldName = 'NFE_COD_BARRAS'
      FixedChar = True
      Size = 19
    end
    object CDS_NotasEntradaNFE_PRODUTO: TStringField
      FieldName = 'NFE_PRODUTO'
      Size = 80
    end
    object CDS_NotasEntradaNFE_COD_FORNECEDOR: TStringField
      FieldName = 'NFE_COD_FORNECEDOR'
      FixedChar = True
      Size = 6
    end
    object CDS_NotasEntradaNFE_FORNECEDOR: TStringField
      FieldName = 'NFE_FORNECEDOR'
      Size = 40
    end
    object CDS_NotasEntradaNFE_COD_COMPROVANTE: TStringField
      FieldName = 'NFE_COD_COMPROVANTE'
      FixedChar = True
      Size = 3
    end
    object CDS_NotasEntradaNFE_NUMERO: TStringField
      FieldName = 'NFE_NUMERO'
      FixedChar = True
      Size = 6
    end
    object CDS_NotasEntradaNFE_SERIE: TStringField
      FieldName = 'NFE_SERIE'
      FixedChar = True
      Size = 4
    end
    object CDS_NotasEntradaNFE_DTA_ENTRADA: TDateField
      FieldName = 'NFE_DTA_ENTRADA'
    end
    object CDS_NotasEntradaNFE_DTA_COMPROVANTE: TDateField
      FieldName = 'NFE_DTA_COMPROVANTE'
    end
    object CDS_NotasEntradaNFE_QTD: TFMTBCDField
      FieldName = 'NFE_QTD'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object CDS_NotasEntradaNFE_QTD_DEVOLUCAO: TFMTBCDField
      FieldName = 'NFE_QTD_DEVOLUCAO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
  end
  object SDS_NotasEntrada: TSQLDataSet
    CommandText = 
      'SELECT '#13#10'te.num_solicitacao,'#13#10'en.codfilial NFE_COD_LOJA,'#13#10'en.cod' +
      'produto NFE_Cod_produto,'#13#10'pr.codbarra NFE_Cod_Barras,'#13#10'pr.aprese' +
      'ntacao NFE_Produto,'#13#10'en.codfornecedor NFE_Cod_fornecedor,'#13#10#13#10'CAS' +
      'E'#13#10'  WHEN te.quant_ent = 0 THEN'#13#10'     '#39'NOTA FISCAL DE ENTRADA N'#195 +
      'O ENCONTRADA'#39#13#10'  ELSE'#13#10'     fo.nomefornecedor'#13#10'END NFE_Fornecedo' +
      'r,'#13#10#13#10'en.codcomprovante NFE_Cod_Comprovante,'#13#10'en.numero NFE_Nume' +
      'ro,'#13#10'en.serie NFE_Serie,'#13#10'en.dataentrada NFE_Dta_Entrada,'#13#10'en.da' +
      'tacomprovante NFE_Dta_Comprovante,'#13#10'en.quant NFE_Qtd,'#13#10'SUM(te.qu' +
      'ant_ent) NFE_Qtd_Devolucao'#13#10#13#10'FROM sidicom_transf_entadas te'#13#10'  ' +
      'LEFT JOIN  sidicom_entradas en ON te.num_seq_ent=en.num_seq'#13#10'  L' +
      'EFT JOIN  fornecedor fo ON en.codfornecedor=fo.codfornecedor'#13#10'  ' +
      'LEFT JOIN   produto pr ON en.codproduto=pr.codproduto'#13#10'WHERE te.' +
      'num_solicitacao= :NUMERO'#13#10'AND te.codproduto= :PRODUTO'#13#10'AND te.qu' +
      'ant_cd= :Qtd'#13#10'AND te.num_seq= :NumSeq'#13#10#13#10'GROUP BY 1,2,3,4,5,6,7,' +
      '8,9,10,11,12,13'#13#10#13#10'ORDER BY NFE_Dta_Entrada DESC, NFE_COD_LOJA, ' +
      'NFE_Fornecedor, NFE_Numero'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Qtd'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NumSeq'
        ParamType = ptInput
      end>
    SQLConnection = DMBelShop.SQLC
    Left = 40
    Top = 80
  end
  object DSP_NotasEntrada: TDataSetProvider
    DataSet = SDS_NotasEntrada
    Left = 96
    Top = 96
  end
  object DS_NotasEntrada: TDataSource
    DataSet = CDS_NotasEntrada
    Left = 208
    Top = 96
  end
  object CDS_NotasEntr: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_NotasEntr'
    Left = 163
    Top = 304
    object CDS_NotasEntrNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
    end
    object CDS_NotasEntrCODFILIAL: TStringField
      FieldName = 'CODFILIAL'
      FixedChar = True
      Size = 2
    end
    object CDS_NotasEntrCODCOMPROVANTE: TStringField
      FieldName = 'CODCOMPROVANTE'
      FixedChar = True
      Size = 3
    end
    object CDS_NotasEntrNUMERO: TStringField
      FieldName = 'NUMERO'
      FixedChar = True
      Size = 6
    end
    object CDS_NotasEntrSERIE: TStringField
      FieldName = 'SERIE'
      FixedChar = True
      Size = 4
    end
    object CDS_NotasEntrSITUACAONF: TStringField
      FieldName = 'SITUACAONF'
      FixedChar = True
      Size = 1
    end
    object CDS_NotasEntrDATAENTRADA: TDateField
      FieldName = 'DATAENTRADA'
    end
    object CDS_NotasEntrDATACOMPROVANTE: TDateField
      FieldName = 'DATACOMPROVANTE'
    end
    object CDS_NotasEntrCODFORNECEDOR: TStringField
      FieldName = 'CODFORNECEDOR'
      FixedChar = True
      Size = 6
    end
    object CDS_NotasEntrCODPRODUTO: TStringField
      FieldName = 'CODPRODUTO'
      FixedChar = True
      Size = 6
    end
    object CDS_NotasEntrQUANT: TFMTBCDField
      FieldName = 'QUANT'
      Precision = 15
      Size = 4
    end
    object CDS_NotasEntrQUANT_INFORMADA: TFMTBCDField
      FieldName = 'QUANT_INFORMADA'
      Precision = 15
      Size = 4
    end
  end
  object SDS_NotasEntr: TSQLDataSet
    CommandText = 
      'SELECT *'#13#10'FROM sidicom_entradas e'#13#10'WHERE e.codproduto='#39'010324'#39#13#10 +
      'AND e.situacaonf=1'#13#10'AND e.codfilial='#39'09'#39#13#10'AND e.quant<>e.quant_i' +
      'nformada'#13#10'ORDER BY e.datacomprovante'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 48
    Top = 304
  end
  object DSP_NotasEntr: TDataSetProvider
    DataSet = SDS_NotasEntr
    Left = 104
    Top = 320
  end
  object CDS_RomaneioDev: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_RomaneioDev'
    Left = 171
    Top = 384
    object CDS_RomaneioDevDES_LOJA: TStringField
      FieldName = 'DES_LOJA'
      Size = 69
    end
    object CDS_RomaneioDevNUM_CNPJ: TStringField
      FieldName = 'NUM_CNPJ'
      Size = 94
    end
    object CDS_RomaneioDevENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 108
    end
    object CDS_RomaneioDevDES_BAIRRO: TStringField
      FieldName = 'DES_BAIRRO'
      Size = 30
    end
    object CDS_RomaneioDevDES_CIDADE: TStringField
      FieldName = 'DES_CIDADE'
      Size = 60
    end
    object CDS_RomaneioDevCOD_UF: TStringField
      FieldName = 'COD_UF'
      Size = 2
    end
    object CDS_RomaneioDevCOD_CEP: TStringField
      FieldName = 'COD_CEP'
      Size = 8
    end
    object CDS_RomaneioDevNOMEFORNECEDOR: TStringField
      FieldName = 'NOMEFORNECEDOR'
      Size = 49
    end
    object CDS_RomaneioDevCONTATO: TStringField
      FieldName = 'CONTATO'
      FixedChar = True
      Size = 30
    end
    object CDS_RomaneioDevTELEFONES: TStringField
      FieldName = 'TELEFONES'
      Size = 33
    end
    object CDS_RomaneioDevEMAIL: TStringField
      FieldName = 'EMAIL'
      FixedChar = True
      Size = 80
    end
    object CDS_RomaneioDevCODCOMPROVANTE: TStringField
      FieldName = 'CODCOMPROVANTE'
      FixedChar = True
      Size = 3
    end
    object CDS_RomaneioDevNUMERO: TStringField
      FieldName = 'NUMERO'
      FixedChar = True
      Size = 6
    end
    object CDS_RomaneioDevSERIE: TStringField
      FieldName = 'SERIE'
      FixedChar = True
      Size = 4
    end
    object CDS_RomaneioDevSITUACAONF: TStringField
      FieldName = 'SITUACAONF'
      Required = True
      FixedChar = True
      Size = 8
    end
    object CDS_RomaneioDevDATACOMPROVANTE: TDateField
      FieldName = 'DATACOMPROVANTE'
    end
    object CDS_RomaneioDevDATAENTRADA: TDateField
      FieldName = 'DATAENTRADA'
    end
    object CDS_RomaneioDevNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Size = 89
    end
    object CDS_RomaneioDevUNID: TStringField
      FieldName = 'UNID'
      FixedChar = True
      Size = 3
    end
    object CDS_RomaneioDevUSUARIO: TStringField
      FieldName = 'USUARIO'
      Required = True
      FixedChar = True
      Size = 4
    end
    object CDS_RomaneioDevQTD_DEVOLVER: TFMTBCDField
      FieldName = 'QTD_DEVOLVER'
      Precision = 15
      Size = 4
    end
    object CDS_RomaneioDevPRECOCOMPRA: TFMTBCDField
      FieldName = 'PRECOCOMPRA'
      Precision = 15
      Size = 4
    end
  end
  object SDS_RomaneioDev: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#39'Bel_'#39'||en.codfilial||'#39' - '#39'||em.razao_social Des_Loja,'#13#10 +
      #13#10'CASE'#13#10'  WHEN SUBSTRING(em.num_cnpj FROM 14 FOR 1)<>'#39#39' THEN'#13#10'  ' +
      '  SUBSTRING(em.num_cnpj FROM 1 FOR 2) || '#39'.'#39' ||'#13#10'    SUBSTRING(e' +
      'm.num_cnpj FROM 3 FOR 3) || '#39'.'#39' ||'#13#10'    SUBSTRING(em.num_cnpj FR' +
      'OM 6 FOR 3) || '#39'/'#39' ||'#13#10'    SUBSTRING(em.num_cnpj FROM 9 FOR 4) |' +
      '| '#39'-'#39' ||'#13#10'    SUBSTRING(em.num_cnpj FROM 13 FOR 2)'#13#10'  ELSE'#13#10'    ' +
      'SUBSTRING(em.num_cnpj FROM 1 FOR 3) || '#39'.'#39' ||'#13#10'    SUBSTRING(em.' +
      'num_cnpj FROM 4 FOR 3) || '#39'.'#39' ||'#13#10'    SUBSTRING(em.num_cnpj FROM' +
      ' 7 FOR 3) || '#39'-'#39' ||'#13#10'    SUBSTRING(em.num_cnpj FROM 10 FOR 2)'#13#10'E' +
      'ND NUM_CNPJ,'#13#10#13#10'CASE'#13#10'  WHEN TRIM(em.compl_endereco)='#39#39' THEN'#13#10'  ' +
      '  em.des_endereco||'#39', '#39'||em.num_endereco'#13#10'  ELSE'#13#10'    em.des_end' +
      'ereco||'#39', '#39'||em.num_endereco||'#39'/'#39'|| em.compl_endereco'#13#10'END Ender' +
      'eco,'#13#10'em.des_bairro,'#13#10'em.des_cidade,'#13#10'em.cod_uf,'#13#10'em.cod_cep,'#13#10#13 +
      #10'en.codfornecedor||'#39' - '#39'|| fo.nomefornecedor NomeFornecedor,'#13#10'fo' +
      '.contato,'#13#10'TRIM(fo.fone1)||'#39' - '#39'||TRIM(fo.fone2) Telefones,'#13#10'fo.' +
      'email,'#13#10'en.codcomprovante,'#13#10'en.numero,'#13#10'en.serie,'#13#10'CASE'#13#10'  WHEN ' +
      'en.situacaonf=0 THEN '#39'Pendente'#39#13#10'  ELSE '#39'Lan'#231'ada'#39#13#10'END situacaon' +
      'f,'#13#10'en.datacomprovante,'#13#10'en.dataentrada,'#13#10'te.codproduto||'#39' - '#39'||' +
      'TRIM(pr.apresentacao) NomeProduto,'#13#10'pr.unidade Unid,'#13#10#39'ODIR'#39' usu' +
      'ario,'#13#10'COALESCE(lp.precocompra,0) PrecoCompra,'#13#10'SUM(te.quant_ent' +
      ') qtd_devolver'#13#10#13#10'FROM sidicom_transf_entadas te'#13#10'   LEFT JOIN s' +
      'idicom_entradas en ON en.num_seq=te.num_seq_ent'#13#10'   LEFT JOIN pr' +
      'oduto pr          ON pr.codproduto=te.codproduto'#13#10'   LEFT JOIN e' +
      'mp_conexoes em     ON em.cod_filial=en.codfilial'#13#10'   LEFT JOIN f' +
      'ornecedor fo       ON en.codfornecedor=fo.codfornecedor'#13#10'   LEFT' +
      ' JOIN listapre         lp  ON lp.codlista=em.cod_listapre'#13#10'     ' +
      '                            AND lp.codproduto=te.codproduto'#13#10#13#10'-' +
      '-WHERE te.num_solicitacao=1'#13#10'WHERE te.dta_solicitacao='#39'03.06.201' +
      '5'#39#13#10'AND te.quant_ent IS NOT NULL'#13#10'AND en.codfilial='#39'02'#39#13#10#13#10'GROUP' +
      ' BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21'#13#10#13#10'UNI' +
      'ON'#13#10#13#10'SELECT'#13#10#39'Bel_'#39'||en1.codfilial||'#39' - '#39'||em1.razao_social Des' +
      '_Loja,'#13#10#13#10#39#39' NUM_CNPJ,'#13#10#13#10#39#39' Endereco,'#13#10#39#39' des_bairro,'#13#10#39#39' des_c' +
      'idade,'#13#10#39#39' cod_uf,'#13#10#39#39' cod_cep,'#13#10#13#10#39'00 - TRANSFER'#202'NCIAS DO CD PA' +
      'RA A LOJA'#39' NomeFornecedor,'#13#10#39#39' contato,'#13#10#39#39' Telefones,'#13#10#39#39' email' +
      ','#13#10#39#39' codcomprovante,'#13#10#39#39' numero,'#13#10#39#39' serie,'#13#10#39#39' situacaonf,'#13#10'cu' +
      'rrent_date datacomprovante,'#13#10'current_date dataentrada,'#13#10'te1.codp' +
      'roduto||'#39' - '#39'||TRIM(pr1.apresentacao) NomeProduto,'#13#10'pr1.unidade ' +
      'Unid,'#13#10#39'ODIR'#39' usuario,'#13#10'COALESCE(lp1.precocompra,0) PrecoCompra,' +
      #13#10'SUM(te1.quant_ent) qtd_devolver'#13#10#13#10'FROM sidicom_transf_entadas' +
      ' te1'#13#10'   LEFT JOIN sidicom_entradas en1 ON en1.num_seq=te1.num_s' +
      'eq_ent'#13#10'   LEFT JOIN produto pr1          ON pr1.codproduto=te1.' +
      'codproduto'#13#10'   LEFT JOIN emp_conexoes em1     ON em1.cod_filial=' +
      'en1.codfilial'#13#10'   LEFT JOIN listapre         lp1  ON lp1.codlist' +
      'a=em1.cod_listapre'#13#10'                                 AND lp1.cod' +
      'produto=te1.codproduto'#13#10#13#10'--WHERE te1.num_solicitacao=1'#13#10#13#10'WHERE' +
      ' te1.dta_solicitacao='#39'03.06.2015'#39#13#10'AND te1.quant_ent IS NOT NULL' +
      #13#10'AND en1.codfilial='#39'02'#39#13#10#13#10'GROUP BY 1,8, 18,19,20,21'#13#10#13#10'       ' +
      '  ORDER BY   1,8,13,18'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 48
    Top = 384
  end
  object DSP_RomaneioDev: TDataSetProvider
    DataSet = SDS_RomaneioDev
    Left = 104
    Top = 400
  end
  object DS_RomaneioDev: TDataSource
    DataSet = CDS_RomaneioDev
    Left = 240
    Top = 400
  end
  object CDS_V_Geral: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DSP_Transf_Cd'
    Left = 357
    Top = 24
    object CDS_V_GeralCodBarras: TStringField
      FieldName = 'CodBarras'
      Size = 13
    end
  end
  object CDS_ReposicaoDocs: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ReposicaoDocs'
    AfterScroll = CDS_ReposicaoDocsAfterScroll
    Left = 515
    Top = 96
    object CDS_ReposicaoDocsCOD_LOJA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd'
      FieldName = 'COD_LOJA'
      FixedChar = True
      Size = 2
    end
    object CDS_ReposicaoDocsRAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAO_SOCIAL'
      Size = 60
    end
    object CDS_ReposicaoDocsNUM_DOCTO: TIntegerField
      DisplayLabel = 'N'#186' Docto'
      FieldName = 'NUM_DOCTO'
      DisplayFormat = '0,'
    end
    object CDS_ReposicaoDocsNUM_PRODUTOS: TIntegerField
      DisplayLabel = 'N'#186' Itens'
      FieldName = 'NUM_PRODUTOS'
      Required = True
      DisplayFormat = '0,'
    end
    object CDS_ReposicaoDocsQTD_SUG_TRANSF: TFMTBCDField
      DisplayLabel = 'Total Sug Transf'
      FieldName = 'QTD_SUGTRANSF'
      DisplayFormat = '0,'
      Precision = 15
      Size = 2
    end
    object CDS_ReposicaoDocsQTD_A_TRANSF: TFMTBCDField
      DisplayLabel = 'Total a Transf'
      FieldName = 'QTD_ATRANSF'
      DisplayFormat = '0,'
      Precision = 15
      Size = 2
    end
    object CDS_ReposicaoDocsQTD_NTRANSF: TFMTBCDField
      DisplayLabel = 'Total '#209' Transf'
      FieldName = 'QTD_NTRANSF'
      DisplayFormat = '0,'
      Precision = 15
      Size = 2
    end
    object CDS_ReposicaoDocsQTD_TRANSF: TFMTBCDField
      DisplayLabel = 'Total Transf'
      FieldName = 'QTD_TRANSF'
      DisplayFormat = '0,'
      Precision = 15
      Size = 2
    end
  end
  object SDS_ReposicaoDocs: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'lo.cod_loja,'#13#10'em.razao_social,'#13#10'lo.num_docto,'#13#10'Count(lo.' +
      'cod_produto) Num_Produtos,'#13#10'sum(lo.qtd_transf) Qtd_SugTransf,'#13#10's' +
      'um(lo.qtd_a_transf) Qtd_ATransf,'#13#10'sum(decode(lo.num_pedido,'#39'0000' +
      '00'#39',lo.qtd_a_transf,0)) Qtd_NTransf,'#13#10'sum(decode(lo.num_pedido,'#39 +
      '000000'#39',0,lo.qtd_a_transf)) Qtd_Transf'#13#10#13#10'FROM es_estoques_lojas' +
      ' lo, emp_conexoes em'#13#10'WHERE lo.cod_loja=em.cod_filial'#13#10'AND   lo.' +
      'ind_transf='#39'SIM'#39#13#10'AND   lo.dta_movto= :sDta'#13#10#13#10'group by 1,2,3'#13#10#13 +
      #10'order by 1'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'sDta'
        ParamType = ptInput
        Value = '01.08.2016'
      end>
    SQLConnection = DMBelShop.SQLC
    Left = 392
    Top = 96
  end
  object DSP_ReposicaoDocs: TDataSetProvider
    DataSet = SDS_ReposicaoDocs
    Left = 448
    Top = 112
  end
  object DS_ReposicaoDocs: TDataSource
    DataSet = CDS_ReposicaoDocs
    Left = 584
    Top = 112
  end
  object CDS_ReposicaoTransf: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ENDERECO; DES_PRODUTO'
    Params = <>
    ProviderName = 'DSP_ReposicaoTransf'
    Left = 515
    Top = 160
    object CDS_ReposicaoTransfNUM_SEQ: TSmallintField
      DisplayLabel = 'Seq'
      FieldName = 'NUM_SEQ'
      DisplayFormat = '0,'
    end
    object CDS_ReposicaoTransfCOD_PRODUTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd'
      FieldName = 'COD_PRODUTO'
      FixedChar = True
      Size = 6
    end
    object CDS_ReposicaoTransfDES_PRODUTO: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'DES_PRODUTO'
      Size = 80
    end
    object CDS_ReposicaoTransfABC: TStringField
      FieldName = 'ABC'
      FixedChar = True
      Size = 1
    end
    object CDS_ReposicaoTransfQTD_A_TRANSF: TFMTBCDField
      DisplayLabel = 'Reposi'#231#227'o'
      FieldName = 'QTD_A_TRANSF'
      DisplayFormat = '0,'
      Precision = 15
      Size = 2
    end
    object CDS_ReposicaoTransfNUM_PEDIDO: TStringField
      DisplayLabel = 'N'#186' Ped Sidicom'
      FieldName = 'NUM_PEDIDO'
      FixedChar = True
      Size = 6
    end
    object CDS_ReposicaoTransfENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 24
    end
    object CDS_ReposicaoTransfQTD_TRANSF: TFMTBCDField
      FieldName = 'QTD_TRANSF'
      Visible = False
      DisplayFormat = '0,'
      Precision = 15
      Size = 2
    end
    object CDS_ReposicaoTransfQTD_TRANSF_OC: TFMTBCDField
      FieldName = 'QTD_TRANSF_OC'
      DisplayFormat = '0,'
      Precision = 15
      Size = 2
    end
  end
  object SDS_ReposicaoTransf: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'lo.Num_Seq,'#13#10'lo.cod_produto,'#13#10'pr.apresentacao Des_produt' +
      'o,'#13#10'lo.ind_curva ABC,'#13#10'lo.qtd_a_transf,'#13#10'lo.num_pedido,'#13#10'cd.end_' +
      'zona||'#39'.'#39'||cd.end_corredor||'#39'.'#39'||cd.end_prateleira||'#39'.'#39'||cd.end_' +
      'gaveta Endereco,'#13#10'lo.qtd_transf,'#13#10'lo.qtd_transf_oc'#13#10#13#10'FROM es_es' +
      'toques_lojas lo, es_estoques_cd cd, produto pr'#13#10'WHERE lo.cod_pro' +
      'duto=pr.codproduto'#13#10'AND   lo.cod_produto=cd.cod_produto'#13#10'AND   l' +
      'o.dta_movto=cd.dta_movto'#13#10'AND   lo.ind_transf='#39'SIM'#39#13#10#13#10'AND   lo.' +
      'dta_movto= :sDta'#13#10'AND   lo.num_docto= :Doc'#13#10'AND   lo.qtd_a_trans' +
      'f> :QtdInicio'#13#10'AND   lo.qtd_a_transf< :QtdFim'#13#10#13#10'ORDER BY 7,3'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'sDta'
        ParamType = ptInput
        Value = '01.08.2016'
      end
      item
        DataType = ftString
        Name = 'Doc'
        ParamType = ptInput
        Value = '3180'
      end
      item
        DataType = ftString
        Name = 'QtdInicio'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'QtdFim'
        ParamType = ptInput
        Value = '0'
      end>
    SQLConnection = DMBelShop.SQLC
    Left = 392
    Top = 160
  end
  object DSP_ReposicaoTransf: TDataSetProvider
    DataSet = SDS_ReposicaoTransf
    Left = 448
    Top = 176
  end
  object DS_ReposicaoTransf: TDataSource
    DataSet = CDS_ReposicaoTransf
    Left = 584
    Top = 176
  end
  object SDS_Ajustes: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#13#10#39'Bel_'#39'||aj.cod_loja||'#39' - '#39'||em.razao_social Loja,'#13#10'aj.' +
      'num_docto,'#13#10'aj.dta_docto,'#13#10'CASE aj.tip_docto'#13#10'  WHEN 0 THEN '#39'Sa'#237 +
      'da'#39#13#10'  WHEN 1 THEN '#39'Entrada'#39#13#10'  ELSE '#39'Erro'#39#13#10'END Tipo_Docto,'#13#10'aj' +
      '.cod_comprovante,'#13#10'cp.nomecomprovante,'#13#10#13#10'aj.num_seq,'#13#10'aj.cod_pr' +
      'oduto,'#13#10'pr.apresentacao Des_produto,'#13#10'aj.cod_barras,'#13#10'pr.unidade' +
      ','#13#10'aj.qtd_ajuste,'#13#10'aj.doc_sidicom,'#13#10'ui.des_usuario Doc_Por,'#13#10'us.' +
      'des_usuario SIDICOM_Por'#13#10#13#10'FROM sidicom_ajustes aj'#13#10'  LEFT JOIN ' +
      'emp_conexoes em  ON aj.cod_loja=em.cod_filial'#13#10'  LEFT JOIN compr' +
      'v cp        ON cp.codloja='#39'99'#39#13#10'                            AND ' +
      'aj.cod_comprovante=cp.codcomprovante'#13#10'  LEFT JOIN produto pr    ' +
      '   on aj.cod_produto=pr.codproduto'#13#10'  LEFT JOIN ps_usuarios ui  ' +
      'on aj.usu_inclui=ui.cod_usuario'#13#10'  LEFT JOIN ps_usuarios us  on ' +
      'aj.usu_sidicom=us.cod_usuario'#13#10#13#10'WHERE aj.cod_loja=:Loja'#13#10'AND   ' +
      'aj.num_docto= :Docto'#13#10#13#10'Order by aj.num_seq'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'Loja'
        ParamType = ptInput
        Value = '50'
      end
      item
        DataType = ftString
        Name = 'Docto'
        ParamType = ptInput
        Value = '1'
      end>
    SQLConnection = DMBelShop.SQLC
    Left = 400
    Top = 344
  end
  object DSP_Ajustes: TDataSetProvider
    DataSet = SDS_Ajustes
    Left = 451
    Top = 360
  end
  object CDS_Ajustes: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DSP_Ajustes'
    AfterScroll = CDS_Transf_CdAfterScroll
    Left = 502
    Top = 344
    object CDS_AjustesLOJA: TStringField
      FieldName = 'LOJA'
      Size = 69
    end
    object CDS_AjustesNUM_DOCTO: TIntegerField
      FieldName = 'NUM_DOCTO'
      DisplayFormat = '0,'
    end
    object CDS_AjustesDTA_DOCTO: TDateField
      Alignment = taCenter
      FieldName = 'DTA_DOCTO'
    end
    object CDS_AjustesTIPO_DOCTO: TStringField
      Alignment = taCenter
      FieldName = 'TIPO_DOCTO'
      Required = True
      FixedChar = True
      Size = 7
    end
    object CDS_AjustesCOD_COMPROVANTE: TStringField
      Alignment = taRightJustify
      FieldName = 'COD_COMPROVANTE'
      FixedChar = True
      Size = 3
    end
    object CDS_AjustesNOMECOMPROVANTE: TStringField
      FieldName = 'NOMECOMPROVANTE'
      FixedChar = True
    end
    object CDS_AjustesNUM_SEQ: TIntegerField
      DisplayLabel = 'Seq'
      FieldName = 'NUM_SEQ'
      DisplayFormat = '0,'
    end
    object CDS_AjustesCOD_PRODUTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PRODUTO'
      FixedChar = True
      Size = 6
    end
    object CDS_AjustesDES_PRODUTO: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'DES_PRODUTO'
      Size = 80
    end
    object CDS_AjustesCOD_BARRAS: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'digo Barras'
      FieldName = 'COD_BARRAS'
      Size = 19
    end
    object CDS_AjustesUNIDADE: TStringField
      DisplayLabel = 'Unid'
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 3
    end
    object CDS_AjustesQTD_AJUSTE: TFMTBCDField
      DisplayLabel = 'Qtd Ajuste'
      FieldName = 'QTD_AJUSTE'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object CDS_AjustesDOC_SIDICOM: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Docto SIDICOM'
      FieldName = 'DOC_SIDICOM'
      FixedChar = True
      Size = 6
    end
    object CDS_AjustesDOC_POR: TStringField
      DisplayLabel = 'Gerado por...'
      FieldName = 'DOC_POR'
      Size = 50
    end
    object CDS_AjustesSIDICOM_POR: TStringField
      DisplayLabel = 'SIDICOM por...'
      FieldName = 'SIDICOM_POR'
      Size = 50
    end
    object AggregateField1: TAggregateField
      Alignment = taRightJustify
      FieldName = 'TOT_PRODUTOS'
      Active = True
      DisplayFormat = '0,.00'
      Expression = 'COUNT(COD_PRODUTO)'
    end
    object AggregateField2: TAggregateField
      Alignment = taRightJustify
      FieldName = 'TOT_QTD'
      Active = True
      DisplayFormat = '0,.00'
      Expression = 'SUM(QTD_AJUSTE)'
    end
  end
  object DS_Ajustes: TDataSource
    DataSet = CDS_Ajustes
    Left = 552
    Top = 360
  end
  object SDS_RelReposicao: TSQLDataSet
    CommandText = 
      'SELECT '#39'Bel_'#39'||lo.cod_loja||'#39' - '#39'||em.razao_social loja,'#13#10#13#10'SUBS' +
      'TRING(em.num_cnpj FROM 1 FOR 2) || '#39'.'#39' ||SUBSTRING(em.num_cnpj F' +
      'ROM 3 FOR 3) || '#39'.'#39' ||'#13#10'SUBSTRING(em.num_cnpj FROM 6 FOR 3) || '#39 +
      '/'#39' ||SUBSTRING(em.num_cnpj FROM 9 FOR 4) || '#39'-'#39' ||'#13#10'SUBSTRING(em' +
      '.num_cnpj FROM 13 FOR 2) CNPJ,'#13#10#13#10'lo.num_docto, lo.dta_movto, lo' +
      '.num_seq Seq,'#13#10'cd.end_zona||'#39'.'#39'||cd.end_corredor||'#39'.'#39'||cd.end_pr' +
      'ateleira||'#39'.'#39'||cd.end_gaveta Enderecamento,'#13#10'lo.qtd_a_transf,'#13#10#39 +
      '_____'#39' qtd_disponivel,'#13#10'lo.cod_produto, TRIM(pr.codbarra) codbar' +
      'ra, TRIM(pr.apresentacao) Des_produto, '#13#10#39'ODIR'#39' Usuario,'#13#10'lo.obs' +
      '_docto'#13#10#13#10'FROM ES_ESTOQUES_LOJAS lo, ES_ESTOQUES_CD cd,'#13#10'     PR' +
      'ODUTO pr, EMP_CONEXOES em'#13#10#13#10'WHERE lo.cod_produto=pr.codproduto'#13 +
      #10'AND   lo.cod_produto=cd.cod_produto'#13#10'AND   lo.dta_movto=cd.dta_' +
      'movto'#13#10'AND   lo.cod_loja=em.cod_filial'#13#10'--AND   lo.dta_movto=cur' +
      'rent_date'#13#10'AND   lo.ind_transf='#39'SIM'#39#13#10#13#10'AND   lo.num_docto>1057'#13 +
      #10'and    lo.cod_loja='#39'08'#39#13#10#13#10'--AND   lo.qtd_a_transf>IntToStr(iQt' +
      'dI)+'#13#10'--AND   lo.qtd_a_transf<IntToStr(iQtdF)+'#13#10'AND   CAST(TRIM(' +
      'COALESCE(lo.num_pedido,'#39'0'#39')) AS INTEGER)=0'#13#10#13#10'ORDER BY 6, 11'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 400
    Top = 232
  end
  object DSP_RelReposicao: TDataSetProvider
    DataSet = SDS_RelReposicao
    Left = 459
    Top = 248
  end
  object CDS_RelReposicao: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DSP_RelReposicao'
    AfterScroll = CDS_Transf_CdAfterScroll
    Left = 510
    Top = 232
    object CDS_RelReposicaoLOJA: TStringField
      FieldName = 'LOJA'
      Size = 69
    end
    object CDS_RelReposicaoCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 94
    end
    object CDS_RelReposicaoNUM_DOCTO: TIntegerField
      FieldName = 'NUM_DOCTO'
    end
    object CDS_RelReposicaoDTA_MOVTO: TDateField
      FieldName = 'DTA_MOVTO'
    end
    object CDS_RelReposicaoSEQ: TIntegerField
      FieldName = 'SEQ'
    end
    object CDS_RelReposicaoENDERECAMENTO: TStringField
      FieldName = 'ENDERECAMENTO'
      Size = 24
    end
    object CDS_RelReposicaoQTD_A_TRANSF: TFMTBCDField
      FieldName = 'QTD_A_TRANSF'
      Precision = 15
      Size = 2
    end
    object CDS_RelReposicaoQTD_DISPONIVEL: TStringField
      FieldName = 'QTD_DISPONIVEL'
      Required = True
      FixedChar = True
      Size = 5
    end
    object CDS_RelReposicaoCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      FixedChar = True
      Size = 6
    end
    object CDS_RelReposicaoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 19
    end
    object CDS_RelReposicaoDES_PRODUTO: TStringField
      FieldName = 'DES_PRODUTO'
      Size = 80
    end
    object CDS_RelReposicaoUSUARIO: TStringField
      FieldName = 'USUARIO'
      Required = True
      FixedChar = True
      Size = 4
    end
    object CDS_RelReposicaoOBS_DOCTO: TStringField
      FieldName = 'OBS_DOCTO'
      Size = 2000
    end
  end
  object DS_AnaliseReposicao: TDataSource
    DataSet = CDS_V_AnaliseReposicao
    Left = 864
    Top = 40
  end
  object CDS_V_AnaliseReposicao: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CDS_Transf_CdAfterScroll
    Left = 790
    Top = 48
  end
end
