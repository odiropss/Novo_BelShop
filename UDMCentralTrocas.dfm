object DMCentralTrocas: TDMCentralTrocas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 238
  Top = 115
  Height = 607
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
    Top = 40
  end
  object DSP_Transf_Cd: TDataSetProvider
    DataSet = SDS_Transf_Cd
    Options = [poRetainServerOrder]
    Left = 104
    Top = 56
  end
  object CDS_Transf_Cd: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DSP_Transf_Cd'
    AfterScroll = CDS_Transf_CdAfterScroll
    Left = 165
    Top = 40
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
    Top = 56
  end
  object CDS_NotasEntrada: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_NotasEntrada'
    Left = 155
    Top = 112
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
    Top = 112
  end
  object DSP_NotasEntrada: TDataSetProvider
    DataSet = SDS_NotasEntrada
    Options = [poRetainServerOrder]
    Left = 96
    Top = 128
  end
  object DS_NotasEntrada: TDataSource
    DataSet = CDS_NotasEntrada
    Left = 208
    Top = 128
  end
  object CDS_NotasEntr: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_NotasEntr'
    Left = 171
    Top = 224
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
    Left = 56
    Top = 224
  end
  object DSP_NotasEntr: TDataSetProvider
    DataSet = SDS_NotasEntr
    Options = [poRetainServerOrder]
    Left = 112
    Top = 240
  end
  object CDS_RomaneioDev: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_RomaneioDev'
    Left = 179
    Top = 288
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
    Left = 56
    Top = 288
  end
  object DSP_RomaneioDev: TDataSetProvider
    DataSet = SDS_RomaneioDev
    Options = [poRetainServerOrder]
    Left = 112
    Top = 304
  end
  object DS_RomaneioDev: TDataSource
    DataSet = CDS_RomaneioDev
    Left = 248
    Top = 304
  end
  object CDS_V_Geral: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DSP_Transf_Cd'
    Left = 309
    Top = 24
    object CDS_V_GeralCodBarras: TStringField
      FieldName = 'CodBarras'
      Size = 13
    end
  end
  object CDS_ReposicaoDocs: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DSP_ReposicaoDocs'
    AfterOpen = CDS_ReposicaoDocsAfterOpen
    AfterScroll = CDS_ReposicaoDocsAfterScroll
    Left = 499
    Top = 48
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
    object CDS_ReposicaoDocsTot_Itens: TAggregateField
      Alignment = taRightJustify
      FieldName = 'Tot_Itens'
      Active = True
      DisplayFormat = ',0'
      Expression = 'SUM(NUM_PRODUTOS)'
    end
    object CDS_ReposicaoDocsTot_Qtds: TAggregateField
      Alignment = taRightJustify
      FieldName = 'Tot_Qtds'
      Active = True
      DisplayFormat = ',0'
      Expression = 'SUM(QTD_ATRANSF)'
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
    Top = 40
  end
  object DSP_ReposicaoDocs: TDataSetProvider
    DataSet = SDS_ReposicaoDocs
    Options = [poRetainServerOrder]
    Left = 448
    Top = 56
  end
  object DS_ReposicaoDocs: TDataSource
    DataSet = CDS_ReposicaoDocs
    Left = 576
    Top = 56
  end
  object CDS_ReposicaoTransf: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    IndexFieldNames = 'ENDERECO; DES_PRODUTO'
    Params = <>
    ProviderName = 'DSP_ReposicaoTransf'
    AfterOpen = CDS_ReposicaoTransfAfterOpen
    Left = 507
    Top = 104
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
    object CDS_ReposicaoTransfPRECOCOMPRA: TFMTBCDField
      FieldName = 'PRECOCOMPRA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ReposicaoTransfIND_PRIORIDADE: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Prioridade'
      FieldName = 'IND_PRIORIDADE'
    end
    object CDS_ReposicaoTransfIND_LEITORA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Leitora'
      FieldName = 'IND_LEITORA'
      FixedChar = True
      Size = 3
    end
    object CDS_ReposicaoTransfQTD_CHECKOUT: TFMTBCDField
      FieldName = 'QTD_CHECKOUT'
      Precision = 15
      Size = 2
    end
    object CDS_ReposicaoTransfCODBARRA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'digo Barras'
      FieldName = 'CODBARRA'
      FixedChar = True
      Size = 19
    end
    object CDS_ReposicaoTransfPRINCIPALFOR: TStringField
      FieldName = 'PRINCIPALFOR'
      FixedChar = True
      Size = 6
    end
    object CDS_ReposicaoTransfTot_Qtds: TAggregateField
      Alignment = taRightJustify
      FieldName = 'Tot_Qtds'
      Active = True
      DisplayFormat = ',0'
      Expression = 'SUM(QTD_A_TRANSF)'
    end
  end
  object SDS_ReposicaoTransf: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'lo.Num_Seq,'#13#10'lo.cod_produto,'#13#10'pr.apresentacao Des_produt' +
      'o,'#13#10'lo.ind_curva ABC,'#13#10'lo.qtd_a_transf,'#13#10'lo.num_pedido,'#13#10'cd.end_' +
      'zona||'#39'.'#39'||cd.end_corredor||'#39'.'#39'||cd.end_prateleira||'#39'.'#39'||cd.end_' +
      'gaveta Endereco,'#13#10'lo.qtd_transf,'#13#10'lo.qtd_transf_oc,'#13#10#13#10'CAST(COAL' +
      'ESCE((SELECT'#13#10'               CASE'#13#10'                  WHEN COALES' +
      'CE(TRIM(lp.PrecoCompra),1.00)<=0.00 THEN'#13#10'                     1' +
      '.00'#13#10'                  ELSE'#13#10'                     COALESCE(TRIM(' +
      'lp.PrecoCompra),1.00)'#13#10'               END'#13#10'               FROM L' +
      'ISTAPRE lp'#13#10'               WHERE lp.codlista='#39'0006'#39#13#10'           ' +
      '    AND   lp.codproduto=pr.codproduto),1.00)'#13#10'as NUMERIC(12,2)) ' +
      'PrecoCompra,'#13#10#13#10'lo.ind_prioridade, lo.ind_leitora, lo.qtd_checko' +
      'ut,'#13#10'Trim(pr.codbarra) codbarra,'#13#10'pr.principalfor'#13#10#13#10'FROM ES_EST' +
      'OQUES_LOJAS lo, ES_ESTOQUES_CD cd, PRODUTO pr'#13#10'WHERE lo.cod_prod' +
      'uto=pr.codproduto'#13#10'AND   lo.cod_produto=cd.cod_produto'#13#10'AND   lo' +
      '.dta_movto=cd.dta_movto'#13#10'AND   lo.ind_transf='#39'SIM'#39#13#10#13#10'AND   lo.d' +
      'ta_movto= :sDta'#13#10'AND   lo.num_docto= :Doc'#13#10'AND   lo.cod_loja= :C' +
      'odLoja'#13#10#13#10'ORDER BY 3'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'sDta'
        ParamType = ptInput
        Value = '24.10.217'
      end
      item
        DataType = ftString
        Name = 'Doc'
        ParamType = ptInput
        Value = '7704'
      end
      item
        DataType = ftString
        Name = 'CodLoja'
        ParamType = ptInput
        Value = '1'
      end>
    SQLConnection = DMBelShop.SQLC
    Left = 392
    Top = 104
  end
  object DSP_ReposicaoTransf: TDataSetProvider
    DataSet = SDS_ReposicaoTransf
    Options = [poRetainServerOrder]
    Left = 448
    Top = 120
  end
  object DS_ReposicaoTransf: TDataSource
    DataSet = CDS_ReposicaoTransf
    Left = 576
    Top = 120
  end
  object SDS_RelReposicao: TSQLDataSet
    CommandText = 
      'SELECT '#13#10'-------------------- '#39'Bel_'#39'||lo.cod_loja||'#39' - '#39'||em.raz' +
      'ao_social loja,'#13#10'em.cod_cli_linx||'#39' - '#39'||em.razao_social loja,'#13#10 +
      #13#10'SUBSTRING(em.num_cnpj FROM 1 FOR 2) || '#39'.'#39' ||SUBSTRING(em.num_' +
      'cnpj FROM 3 FOR 3) || '#39'.'#39' ||'#13#10'SUBSTRING(em.num_cnpj FROM 6 FOR 3' +
      ') || '#39'/'#39' ||SUBSTRING(em.num_cnpj FROM 9 FOR 4) || '#39'-'#39' ||'#13#10'SUBSTR' +
      'ING(em.num_cnpj FROM 13 FOR 2) CNPJ,'#13#10#13#10'lo.num_docto, lo.dta_mov' +
      'to, lo.num_seq Seq,'#13#10#13#10'-------------------- cd.end_zona||'#39'.'#39'||cd' +
      '.end_corredor||'#39'.'#39'||cd.end_prateleira||'#39'.'#39'||cd.end_gaveta Endere' +
      'camento,'#13#10'cd.end_prateleira||'#39'.'#39'||cd.end_gaveta Enderecamento,'#13#10 +
      #13#10'lo.qtd_a_transf,'#13#10#39'_____'#39' qtd_disponivel,'#13#10'cd.qtd_estoque Sald' +
      'o_CD,'#13#10'lo.cod_produto, '#13#10'TRIM(pr.codbarra) codbarra, '#13#10'Trim(pr.r' +
      'eferencia) referencia, '#13#10'TRIM(pr.apresentacao) Des_produto, '#13#10#39'O' +
      'DIR'#39' Usuario,'#13#10'lo.obs_docto'#13#10#13#10'FROM ES_ESTOQUES_LOJAS lo, ES_EST' +
      'OQUES_CD cd,'#13#10'     PRODUTO pr, EMP_CONEXOES em'#13#10#13#10'WHERE lo.cod_p' +
      'roduto=pr.codproduto'#13#10'AND   lo.cod_produto=cd.cod_produto'#13#10'AND  ' +
      ' lo.dta_movto=cd.dta_movto'#13#10'AND   lo.cod_loja=em.cod_filial'#13#10'---' +
      '----------------- AND   lo.dta_movto=current_date'#13#10'AND   lo.ind_' +
      'transf='#39'SIM'#39#13#10#13#10'AND   lo.num_docto = 2970'#13#10'and    lo.cod_loja='#39'0' +
      '8'#39#13#10#13#10'-------------------- AND   lo.qtd_a_transf>IntToStr(iQtdI)' +
      '+'#13#10'-------------------- AND   lo.qtd_a_transf<IntToStr(iQtdF)+'#13#10 +
      'AND   CAST(TRIM(COALESCE(lo.num_pedido,'#39'0'#39')) AS INTEGER)=0'#13#10#13#10'OR' +
      'DER BY 6, 11'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 400
    Top = 176
  end
  object DSP_RelReposicao: TDataSetProvider
    DataSet = SDS_RelReposicao
    Options = [poRetainServerOrder]
    Left = 459
    Top = 192
  end
  object CDS_RelReposicao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_RelReposicao'
    Left = 507
    Top = 176
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
      Size = 8
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
    object CDS_RelReposicaoSALDO_CD: TFMTBCDField
      FieldName = 'SALDO_CD'
      Precision = 15
      Size = 2
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
    object CDS_RelReposicaoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 40
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
    Top = 8
  end
  object CDS_V_AnaliseReposicao: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CDS_Transf_CdAfterScroll
    Left = 790
    Top = 16
  end
  object CDS_V_ReposDivergencias: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CDS_V_ReposDivergenciasAfterScroll
    Left = 472
    Top = 240
    object CDS_V_ReposDivergenciasCOD_PRODUTO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PRODUTO'
      FixedChar = True
      Size = 6
    end
    object CDS_V_ReposDivergenciasNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      Size = 80
    end
    object CDS_V_ReposDivergenciasQTD_A_TRANSF: TFMTBCDField
      DisplayLabel = 'Qtd a Transf'
      FieldName = 'QTD_A_TRANSF'
      Precision = 15
      Size = 2
    end
    object CDS_V_ReposDivergenciasQTD_CHECKOUT: TFMTBCDField
      DisplayLabel = 'Qtd CheckOut'
      FieldName = 'QTD_CHECKOUT'
      Precision = 15
      Size = 2
    end
    object CDS_V_ReposDivergenciasIND_CORRIGIDO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Corrigido'
      FieldName = 'IND_CORRIGIDO'
      Size = 3
    end
    object CDS_V_ReposDivergenciasENDERECAMENTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Endere'#231'amento'
      FieldName = 'ENDERECAMENTO'
      Size = 24
    end
    object CDS_V_ReposDivergenciasCODBARRA: TStringField
      DisplayLabel = 'C'#243'digo Barras'
      FieldName = 'CODBARRA'
      Size = 19
    end
    object CDS_V_ReposDivergenciasNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
      Visible = False
    end
    object CDS_V_ReposDivergenciasQTD_ORIGINAL: TFMTBCDField
      DisplayLabel = 'Qtd Original'
      FieldName = 'QTD_ORIGINAL'
      Precision = 15
      Size = 2
    end
  end
  object DS_V_ReposDivergencias: TDataSource
    DataSet = CDS_V_ReposDivergencias
    Left = 520
    Top = 256
  end
  object CDS_ParamTransf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ParamTransf'
    Left = 848
    Top = 96
    object CDS_ParamTransfRAZAO_SOCIAL: TStringField
      DisplayLabel = 'Descri'#231#227'o Loja'
      FieldName = 'RAZAO_SOCIAL'
      Size = 50
    end
    object CDS_ParamTransfNUM_PROD_DIA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#186' Prod/Dia'
      FieldName = 'NUM_PROD_DIA'
      Size = 50
    end
    object CDS_ParamTransfQTD_MAX_PROD: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Qtd Max/Prod'
      FieldName = 'QTD_MAX_PROD'
      Size = 50
    end
    object CDS_ParamTransfCOD_LOJA: TIntegerField
      DisplayLabel = 'C'#243'd Loja'
      FieldName = 'COD_LOJA'
      Required = True
    end
  end
  object SDS_ParamTransf: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'lo.nome_emp razao_social,'#13#10'so.des_aux Num_Prod_Dia,'#13#10'so.' +
      'des_aux1 Qtd_max_Prod,'#13#10'so.cod_aux Cod_Loja'#13#10#13#10'FROM TAB_AUXILIAR' +
      ' so, linxlojas lo'#13#10#13#10'WHERE so.cod_aux=lo.empresa'#13#10'AND   so.tip_a' +
      'ux=19'#13#10'ORDER BY lo.nome_emp'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 736
    Top = 96
  end
  object DSP_ParamTransf: TDataSetProvider
    DataSet = SDS_ParamTransf
    Options = [poRetainServerOrder]
    Left = 792
    Top = 112
  end
  object DS_ParamTransf: TDataSource
    DataSet = CDS_ParamTransf
    Left = 909
    Top = 112
  end
  object DS_QtdCxCDProdutos: TDataSource
    DataSet = CDS_QtdCxCDProdutos
    Left = 560
    Top = 432
  end
  object CDS_QtdCxCDProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_QtdCxCDProdutos'
    Left = 512
    Top = 424
    object CDS_QtdCxCDProdutosCODIGO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd'
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 6
    end
    object CDS_QtdCxCDProdutosDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object CDS_QtdCxCDProdutosQTD_CAIXA: TIntegerField
      DisplayLabel = 'Qt Caixa'
      FieldName = 'QTD_CAIXA'
      DisplayFormat = '0,'
    end
    object CDS_QtdCxCDProdutosPER_CORTE: TIntegerField
      DisplayLabel = '% Corte Cx'
      FieldName = 'PER_CORTE'
      DisplayFormat = '0, %'
    end
  end
  object DSP_QtdCxCDProdutos: TDataSetProvider
    DataSet = SDS_QtdCxCDProdutos
    Left = 472
    Top = 438
  end
  object SDS_QtdCxCDProdutos: TSQLDataSet
    CommandText = 
      'select'#13#10'c.cod_produto Codigo,'#13#10'Trim(p.apresentacao) Descricao,'#13#10 +
      'c.qtd_caixa,'#13#10'c.per_corte'#13#10#13#10'from prod_caixa_cd c, produto p'#13#10'wh' +
      'ere p.codproduto=c.cod_produto'#13#10'order by 2'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 416
    Top = 424
  end
  object DS_QtdCxCDGrupos: TDataSource
    DataSet = CDS_QtdCxCDGrupos
    Left = 560
    Top = 496
  end
  object CDS_QtdCxCDGrupos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_QtdCxCDGrupos'
    Left = 512
    Top = 488
    object CDS_QtdCxCDGruposCODIGO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod'
      FieldName = 'CODIGO'
      Size = 7
    end
    object CDS_QtdCxCDGruposDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 63
    end
    object CDS_QtdCxCDGruposQTD_CAIXA: TIntegerField
      DisplayLabel = 'Qt Caixa'
      FieldName = 'QTD_CAIXA'
      DisplayFormat = '0,'
    end
    object CDS_QtdCxCDGruposPER_CORTE: TIntegerField
      DisplayLabel = '% Corte Cx'
      FieldName = 'PER_CORTE'
      DisplayFormat = '0, %'
    end
  end
  object DSP_QtdCxCDGrupos: TDataSetProvider
    DataSet = SDS_QtdCxCDGrupos
    Left = 472
    Top = 502
  end
  object SDS_QtdCxCDGrupos: TSQLDataSet
    CommandText = 
      'select'#13#10'c.cod_grupo||coalesce(c.cod_subgrupo,'#39#39') Codigo,'#13#10'Case'#13#10 +
      '  when coalesce(Trim(c.des_subgrupo),'#39#39')='#39#39' Then'#13#10'    Trim(c.des' +
      '_grupo)'#13#10'  Else'#13#10'    Trim(c.des_grupo)||'#39' - '#39'||coalesce(Trim(c.d' +
      'es_subgrupo),'#39#39')'#13#10'end Descricao,'#13#10'c.qtd_caixa,'#13#10'c.per_corte'#13#10#13#10'f' +
      'rom prod_caixa_cd c'#13#10'Where c.cod_produto is null'#13#10'order by 2'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 416
    Top = 488
  end
  object CDS_AnalRepDiaria: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_AnalRepDiaria'
    Left = 848
    Top = 184
    object CDS_AnalRepDiariaORDEM: TIntegerField
      FieldName = 'ORDEM'
      Required = True
    end
    object CDS_AnalRepDiariaCODIGO_CLIENTE: TIntegerField
      FieldName = 'CODIGO_CLIENTE'
    end
    object CDS_AnalRepDiariaRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 60
    end
    object CDS_AnalRepDiariaDOCS_L: TFMTBCDField
      FieldName = 'DOCS_L'
      DisplayFormat = ',0'
      Precision = 15
      Size = 0
    end
    object CDS_AnalRepDiariaDOCS_G: TFMTBCDField
      FieldName = 'DOCS_G'
      DisplayFormat = ',0'
      Precision = 15
      Size = 0
    end
    object CDS_AnalRepDiariaDOCS_DIF: TFMTBCDField
      FieldName = 'DOCS_DIF'
      DisplayFormat = ',0'
      Precision = 15
      Size = 0
    end
    object CDS_AnalRepDiariaLINHAS_L: TFMTBCDField
      FieldName = 'LINHAS_L'
      DisplayFormat = ',0'
      Precision = 15
      Size = 0
    end
    object CDS_AnalRepDiariaLINHAS_G: TFMTBCDField
      FieldName = 'LINHAS_G'
      DisplayFormat = ',0'
      Precision = 15
      Size = 0
    end
    object CDS_AnalRepDiariaLINHAS_DIF: TFMTBCDField
      FieldName = 'LINHAS_DIF'
      DisplayFormat = ',0'
      Precision = 15
      Size = 0
    end
    object CDS_AnalRepDiariaQTDS_L: TFMTBCDField
      FieldName = 'QTDS_L'
      DisplayFormat = ',0'
      Precision = 15
      Size = 0
    end
    object CDS_AnalRepDiariaQTDS_G: TFMTBCDField
      FieldName = 'QTDS_G'
      DisplayFormat = ',0'
      Precision = 15
      Size = 0
    end
    object CDS_AnalRepDiariaQTDS_DIF: TFMTBCDField
      FieldName = 'QTDS_DIF'
      DisplayFormat = ',0'
      Precision = 15
      Size = 0
    end
  end
  object SDS_AnalRepDiaria: TSQLDataSet
    CommandText = 
      '--=================== TITULO ===================================' +
      '================'#13#10'SELECT'#13#10'0 ORDEM,'#13#10'NULL CODIGO_CLIENTE,'#13#10#39'ANALI' +
      'SE DE REPOSICAO DO DIA 25/01/2018'#39' RAZAO_SOCIAL,  --<<==========' +
      '= ALTERAR'#13#10'NULL DOCS_L,'#13#10'NULL DOCS_G,'#13#10'NULL DOCS_DIF,'#13#10'NULL LINH' +
      'AS_L,'#13#10'NULL LINHAS_G,'#13#10'NULL LINHAS_DIF,'#13#10'NULL QTDS_L,'#13#10'NULL QTDS' +
      '_G,'#13#10'NULL QTDS_DIF'#13#10'FROM RDB$DATABASE'#13#10#13#10'--=================== L' +
      'INHA EM BRANCO =========================================='#13#10'UNION' +
      #13#10#13#10'SELECT'#13#10'1 ORDEM,'#13#10'NULL CODIGO_CLIENTE,'#13#10'NULL RAZAO_SOCIAL,'#13#10 +
      'NULL DOCS_L,'#13#10'NULL DOCS_G,'#13#10'NULL DOCS_DIF,'#13#10'NULL LINHAS_L,'#13#10'NULL' +
      ' LINHAS_G,'#13#10'NULL LINHAS_DIF,'#13#10'NULL QTDS_L,'#13#10'NULL QTDS_G,'#13#10'NULL Q' +
      'TDS_DIF'#13#10'FROM RDB$DATABASE'#13#10#13#10'--=================== TOTAIS POR L' +
      'OJA =========================================='#13#10#13#10'UNION'#13#10#13#10'SELEC' +
      'T'#13#10'2 ORDEM,'#13#10'linx.codigo_cliente,'#13#10'linx.razao_social,'#13#10'Linx.DOCS' +
      '_L,'#13#10'Geren.DOCS_G,'#13#10'(Linx.docs_l-Geren.docs_g) DOCS_DIF,'#13#10'linx.L' +
      'INHAS_L,'#13#10'geren.LINHAS_G,'#13#10'(linx.linhas_l-geren.linhas_g) LINHAS' +
      '_DIF,'#13#10'Linx.QTDS_L,'#13#10'Geren.QTDS_G,'#13#10'(Linx.qtds_l-Geren.qtds_g) Q' +
      'TDS_DIF'#13#10#13#10'FROM'#13#10'(SELECT'#13#10' e.cod_cli_linx codigo_cliente, e.raza' +
      'o_social,'#13#10' COUNT(Distinct mv.documento) DOCS_L,'#13#10' COUNT(mv.empr' +
      'esa) LINHAS_L,'#13#10' Cast(SUM(COALESCE(mv.quantidade,0)) as Integer)' +
      ' QTDS_L'#13#10#13#10' FROM emp_conexoes e'#13#10'      Left Join linxmovimento m' +
      'v  on mv.codigo_cliente=e.cod_cli_linx'#13#10'                        ' +
      '         AND   ((mv.operacao='#39'S'#39' and  mv.tipo_transacao='#39'T'#39')'#13#10'  ' +
      '                                      OR'#13#10'                      ' +
      '                  (mv.operacao='#39'S'#39' and  mv.tipo_transacao IS NUL' +
      'L AND mv.codigo_cliente=347)) -- Belcenter | Wenceslau Escobar |' +
      ' RS'#13#10'                                 AND   mv.empresa=2'#13#10'      ' +
      '                           AND   mv.cancelado='#39'N'#39#13#10'             ' +
      '                    AND   mv.excluido='#39'N'#39#13#10'                     ' +
      '            AND   Cast(mv.data_lancamento as Date)='#39'05.01.2018'#39#13 +
      #10' where e.cod_cli_linx<>0'#13#10#13#10' GROUP BY 1,2) Linx,'#13#10' '#13#10'(select'#13#10' ' +
      'e.cod_cli_linx codigo_cliente, e.razao_social,'#13#10' COUNT(Distinct ' +
      'l.num_pedido) DOCS_G,'#13#10' COUNT(l.num_seq) linhas_G,'#13#10' CAST(SUM(CO' +
      'ALESCE(l.qtd_a_transf,0))  as Integer) QTDS_G'#13#10' '#13#10' from emp_cone' +
      'xoes e'#13#10'     Left Join es_estoques_lojas l on l.cod_loja=e.cod_f' +
      'ilial'#13#10' and   l.dta_movto='#39'05.01.2018'#39#13#10' and   l.ind_transf='#39'SIM' +
      #39#13#10' and   l.num_pedido between 1 and 900000'#13#10#13#10' where e.cod_cli_' +
      'linx<>0'#13#10' group by 1,2) Geren'#13#10#13#10'where linx.codigo_cliente=Geren' +
      '.codigo_cliente'#13#10'and   (linx.LINHAS_L>0'#13#10'       OR'#13#10'      geren.' +
      'linhas_G>0'#13#10'       OR'#13#10'      Linx.QTDS_L>0'#13#10'       OR'#13#10'      Ger' +
      'en.QTDS_G>0)'#13#10#13#10'--=================== TOTAIS GERAL =============' +
      '================================'#13#10'UNION'#13#10#13#10'SELECT'#13#10'3 ORDEM,'#13#10'NUL' +
      'L codigo_cliente,'#13#10#39'TOTAL GERAL'#39' razao_social,'#13#10'SUM(Linx.DOCS_L)' +
      ' DOCS_L,'#13#10'SUM(Geren.Docs_G) DOCS_G,'#13#10'SUM((Linx.DOCS_L-Geren.docs' +
      '_g)) DOCS_DIF,'#13#10'SUM(linx.LINHAS_L) LINHAS_L,'#13#10'SUM(geren.linhas_G' +
      ') LINHAS_G,'#13#10'SUM((linx.linhas_l-geren.linhas_g)) LINHAS_DIF,'#13#10'SU' +
      'M(Linx.QTDS_L) QTDS_L,'#13#10'SUM(Geren.QTDS_G) QTDS_G,'#13#10'SUM((Linx.QTD' +
      'S_L-Geren.QTDS_G)) QTDS_DIF'#13#10#13#10'FROM'#13#10'(SELECT'#13#10' e.cod_cli_linx co' +
      'digo_cliente, e.razao_social,'#13#10' COUNT(Distinct mv.documento) DOC' +
      'S_L,'#13#10' COUNT(mv.empresa) LINHAS_L,'#13#10' Cast(SUM(COALESCE(mv.quanti' +
      'dade,0)) as Integer) QTDS_L'#13#10#13#10' FROM emp_conexoes e'#13#10'      Left ' +
      'Join linxmovimento mv  on mv.codigo_cliente=e.cod_cli_linx'#13#10'    ' +
      '                             AND   ((mv.operacao='#39'S'#39' and  mv.tip' +
      'o_transacao='#39'T'#39')'#13#10'                                        OR'#13#10'  ' +
      '                                      (mv.operacao='#39'S'#39' and  mv.t' +
      'ipo_transacao IS NULL AND mv.codigo_cliente=347)) -- Belcenter |' +
      ' Wenceslau Escobar | RS'#13#10'                                 AND   ' +
      'mv.empresa=2'#13#10'                                 AND   mv.cancelad' +
      'o='#39'N'#39#13#10'                                 AND   mv.excluido='#39'N'#39#13#10' ' +
      '                                AND   Cast(mv.data_lancamento as' +
      ' Date)='#39'05.01.2018'#39#13#10' where e.cod_cli_linx<>0'#13#10#13#10' GROUP BY 1,2) ' +
      'Linx,'#13#10' '#13#10'(select'#13#10' e.cod_cli_linx codigo_cliente, e.razao_socia' +
      'l,'#13#10' COUNT(Distinct l.num_pedido) DOCS_G,'#13#10' COUNT(l.num_seq) lin' +
      'has_G,'#13#10' CAST(SUM(COALESCE(l.qtd_a_transf,0))  as Integer) QTDS_' +
      'G'#13#10' '#13#10' from emp_conexoes e'#13#10'     Left Join es_estoques_lojas l o' +
      'n l.cod_loja=e.cod_filial'#13#10' and   l.dta_movto='#39'05.01.2018'#39#13#10' and' +
      '   l.ind_transf='#39'SIM'#39#13#10' and   l.num_pedido between 1 and 900000'#13 +
      #10#13#10' where e.cod_cli_linx<>0'#13#10' group by 1,2) Geren'#13#10#13#10'where linx.' +
      'codigo_cliente=Geren.codigo_cliente'#13#10'and   (linx.LINHAS_L>0'#13#10'   ' +
      '    OR'#13#10'      geren.linhas_G>0'#13#10'       OR'#13#10'      Linx.QTDS_L>0'#13#10 +
      '       OR'#13#10'      Geren.QTDS_G>0)'#13#10#13#10'--==========================' +
      '===================================================='#13#10'order by 1' +
      ',3'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 736
    Top = 184
  end
  object DSP_AnalRepDiaria: TDataSetProvider
    DataSet = SDS_AnalRepDiaria
    Options = [poRetainServerOrder]
    Left = 792
    Top = 200
  end
  object DS_AnalRepDiaria: TDataSource
    DataSet = CDS_AnalRepDiaria
    Left = 909
    Top = 200
  end
  object CDS_NFeAvarias: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_NFeAvarias'
    AfterScroll = CDS_NFeAvariasAfterScroll
    Left = 848
    Top = 296
    object CDS_NFeAvariasCOD_PRODUTO: TFMTBCDField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PRODUTO'
      Precision = 15
      Size = 0
    end
    object CDS_NFeAvariasNOME_PRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'NOME_PRODUTO'
      Size = 250
    end
    object CDS_NFeAvariasCOD_FORNECEDOR: TIntegerField
      DisplayLabel = 'C'#243'd Forn'
      FieldName = 'COD_FORNECEDOR'
    end
    object CDS_NFeAvariasNOME_FORNECEDOR: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOME_FORNECEDOR'
      Size = 60
    end
    object CDS_NFeAvariasENDERECAMENTO: TStringField
      DisplayLabel = 'Endere'#231'amento'
      FieldName = 'ENDERECAMENTO'
      Size = 50
    end
    object CDS_NFeAvariasCHECKOUT: TIntegerField
      DisplayLabel = 'CheckOut'
      FieldName = 'CHECKOUT'
      DisplayFormat = '0,'
    end
    object CDS_NFeAvariasQUANTIDADE: TFMTBCDField
      DisplayLabel = 'Quant'
      FieldName = 'QUANTIDADE'
      DisplayFormat = '0,'
      Precision = 15
      Size = 4
    end
  end
  object SDS_NFeAvarias: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'm.cod_produto, p.nome Nome_produto,'#13#10'm.quantidade, 0 Che' +
      'ckOut,'#13#10'p.cod_fornecedor, f.nome_cliente Nome_Fornecedor,'#13#10'e.des' +
      '_aux Enderecamento'#13#10#13#10'FROM linxmovimento m'#13#10'  LEFT JOIN linxprod' +
      'utos p        ON m.cod_produto=p.cod_produto'#13#10'  LEFT JOIN linxcl' +
      'ientesfornec f  ON p.cod_fornecedor=f.cod_cliente'#13#10'  LEFT JOIN t' +
      'ab_auxiliar e        ON e.tip_aux=23'#13#10'                          ' +
      '       AND e.cod_aux=p.cod_fornecedor'#13#10#13#10'WHERE m.documento=5146'#13 +
      #10'AND   m.serie=2'#13#10'AND   m.data_documento='#39'01.02.2018'#39#13#10'AND   m.e' +
      'mpresa=8'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 736
    Top = 296
  end
  object DSP_NFeAvarias: TDataSetProvider
    DataSet = SDS_NFeAvarias
    Options = [poRetainServerOrder]
    Left = 792
    Top = 312
  end
  object DS_NFeAvarias: TDataSource
    DataSet = CDS_NFeAvarias
    Left = 909
    Top = 312
  end
  object CDS_NFeAvariasForneEnd: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'TROCAR;NOME_FORN'
    Params = <>
    ProviderName = 'DSP_NFeAvariasForneEnd'
    Left = 848
    Top = 360
    object CDS_NFeAvariasForneEndCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object CDS_NFeAvariasForneEndNOME_FORN: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOME_FORN'
      Size = 60
    end
    object CDS_NFeAvariasForneEndENDERECO: TStringField
      DisplayLabel = 'Endere'#231'amento'
      FieldName = 'ENDERECO'
      Size = 50
    end
    object CDS_NFeAvariasForneEndTROCAR: TStringField
      Alignment = taCenter
      DisplayLabel = 'Trocar Endere'#231'o'
      FieldName = 'TROCAR'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object SDS_NFeAvariasForneEnd: TSQLDataSet
    CommandText = 
      'SELECT '#39'N'#39' Trocar, f.cod_cliente CODIGO, f.nome_cliente NOME_FOR' +
      'N, t.des_aux ENDERECO'#13#10#13#10'FROM TAB_AUXILIAR t, LINXCLIENTESFORNEC' +
      ' f'#13#10#13#10'WHERE t.cod_aux=f.cod_cliente'#13#10'AND   t.tip_aux=23'#13#10#13#10'ORDER' +
      ' BY 1,3'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 736
    Top = 360
  end
  object DSP_NFeAvariasForneEnd: TDataSetProvider
    DataSet = SDS_NFeAvariasForneEnd
    Options = [poRetainServerOrder]
    Left = 792
    Top = 376
  end
  object DS_NFeAvariasForneEnd: TDataSource
    DataSet = CDS_NFeAvariasForneEnd
    Left = 909
    Top = 376
  end
  object CDS_RelRomaneio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_RelRomaneio'
    Left = 163
    Top = 481
  end
  object SDS_RelRomaneio: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 64
    Top = 481
  end
  object DSP_RelRomaneio: TDataSetProvider
    DataSet = SDS_RelRomaneio
    Options = [poRetainServerOrder]
    Left = 112
    Top = 496
  end
  object DS_RelRomaneio: TDataSource
    DataSet = CDS_RelRomaneio
    Left = 208
    Top = 496
  end
  object CDS_V_NfePerdas: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    Left = 816
    Top = 432
    object CDS_V_NfePerdasCOD_BARRA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'digo Barras'
      FieldName = 'COD_BARRA'
    end
    object CDS_V_NfePerdasREFERENCIA: TStringField
      DisplayLabel = 'Refer'#234'ncia'
      FieldName = 'REFERENCIA'
    end
    object CDS_V_NfePerdasCOD_PRODUTO: TFMTBCDField
      DisplayLabel = 'C'#243'd Produto'
      FieldName = 'COD_PRODUTO'
      Precision = 15
      Size = 0
    end
    object CDS_V_NfePerdasNOME: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'NOME'
      Size = 250
    end
    object CDS_V_NfePerdasQUANTIDADE: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      Required = True
    end
    object CDS_V_NfePerdasCOD_FORNECEDOR: TIntegerField
      DisplayLabel = 'C'#243'd Forn'
      FieldName = 'COD_FORNECEDOR'
    end
    object CDS_V_NfePerdasNOME_CLIENTE: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
  end
  object DS_V_NfePerdas: TDataSource
    DataSet = CDS_V_NfePerdas
    Left = 880
    Top = 448
  end
  object SDS_RelDivergManuais: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'dv.cod_loja, '#13#10'lj.empresa,'#13#10'lj.nome_emp,'#13#10'dv.num_pedido,' +
      #13#10'dv.dta_movto,'#13#10'dv.num_docto,'#13#10'dv.num_seq,'#13#10'dv.cod_produto COD_' +
      'SIDICOM,'#13#10'pr.cod_produto COD_LINX,'#13#10'pr.nome,'#13#10'dv.qtd_original,'#13#10 +
      'dv.qtd_a_transf,'#13#10'CAST(dv.dta_altera AS DATE) DTA_ALTERA,'#13#10'CAST(' +
      'CAST(dv.hra_altera AS TIME) AS VARCHAR(8)) HRA_ALTERA,'#13#10'dv.usu_a' +
      'ltera,'#13#10'us.des_usuario'#13#10#13#10'FROM ES_ESTOQUES_LOJAS_DIV dv'#13#10'     LE' +
      'FT JOIN linxlojas lj    on lj.cod_loja=dv.cod_loja'#13#10'     LEFT JO' +
      'IN linxprodutos pr on pr.cod_auxiliar=dv.cod_produto'#13#10'     LEFT ' +
      'JOIN ps_usuarios us  on us.cod_usuario=dv.usu_altera'#13#10#13#10'WHERE dv' +
      '.num_pedido='#39'003111'#39#13#10#13#10'ORDER BY pr.nome, dv.dta_altera, dv.hra_' +
      'altera'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 400
    Top = 328
  end
  object DSP_RelDivergManuais: TDataSetProvider
    DataSet = SDS_RelDivergManuais
    Options = [poRetainServerOrder]
    Left = 459
    Top = 344
  end
  object CDS_RelDivergManuais: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_RelDivergManuais'
    Left = 507
    Top = 328
    object CDS_RelDivergManuaisCOD_LOJA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Loja'
      FieldName = 'COD_LOJA'
      FixedChar = True
      Size = 2
    end
    object CDS_RelDivergManuaisEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object CDS_RelDivergManuaisNOME_EMP: TStringField
      DisplayLabel = 'Nome Loja'
      FieldName = 'NOME_EMP'
      Size = 50
    end
    object CDS_RelDivergManuaisNUM_PEDIDO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#186' Pedido'
      FieldName = 'NUM_PEDIDO'
      FixedChar = True
      Size = 6
    end
    object CDS_RelDivergManuaisDTA_MOVTO: TDateField
      Alignment = taRightJustify
      DisplayLabel = 'Dta Docto'
      FieldName = 'DTA_MOVTO'
    end
    object CDS_RelDivergManuaisNUM_DOCTO: TIntegerField
      DisplayLabel = 'N'#186' Docto'
      FieldName = 'NUM_DOCTO'
      DisplayFormat = ',0'
    end
    object CDS_RelDivergManuaisNUM_SEQ: TIntegerField
      DisplayLabel = 'Seq Item'
      FieldName = 'NUM_SEQ'
      DisplayFormat = ',0'
    end
    object CDS_RelDivergManuaisCOD_SIDICOM: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Prod SIDICOM'
      FieldName = 'COD_SIDICOM'
      FixedChar = True
      Size = 6
    end
    object CDS_RelDivergManuaisCOD_LINX: TFMTBCDField
      DisplayLabel = 'Cod Prod LINX'
      FieldName = 'COD_LINX'
      Precision = 15
      Size = 0
    end
    object CDS_RelDivergManuaisNOME: TStringField
      DisplayLabel = 'Nome Produto'
      FieldName = 'NOME'
      Size = 250
    end
    object CDS_RelDivergManuaisQTD_ORIGINAL: TFMTBCDField
      DisplayLabel = 'Qtd Original'
      FieldName = 'QTD_ORIGINAL'
      DisplayFormat = ',0'
      Precision = 15
      Size = 2
    end
    object CDS_RelDivergManuaisQTD_A_TRANSF: TFMTBCDField
      DisplayLabel = 'Qtd Alterada'
      FieldName = 'QTD_A_TRANSF'
      DisplayFormat = ',0'
      Precision = 15
      Size = 2
    end
    object CDS_RelDivergManuaisDTA_ALTERA: TDateField
      FieldName = 'DTA_ALTERA'
    end
    object CDS_RelDivergManuaisHRA_ALTERA: TStringField
      FieldName = 'HRA_ALTERA'
      Size = 8
    end
    object CDS_RelDivergManuaisUSU_ALTERA: TIntegerField
      DisplayLabel = 'Cod Usu'#225'rio'
      FieldName = 'USU_ALTERA'
    end
    object CDS_RelDivergManuaisDES_USUARIO: TStringField
      DisplayLabel = 'Nome Usu'#225'rio'
      FieldName = 'DES_USUARIO'
      Size = 50
    end
  end
end
