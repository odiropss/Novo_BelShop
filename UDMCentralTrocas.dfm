object DMCentralTrocas: TDMCentralTrocas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 235
  Top = 124
  Height = 612
  Width = 1123
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
    Left = 62
    Top = 64
  end
  object DSP_Transf_Cd: TDataSetProvider
    DataSet = SDS_Transf_Cd
    Options = [poRetainServerOrder]
    Left = 118
    Top = 80
  end
  object CDS_Transf_Cd: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DSP_Transf_Cd'
    AfterScroll = CDS_Transf_CdAfterScroll
    Left = 179
    Top = 64
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
    Left = 230
    Top = 80
  end
  object CDS_NotasEntrada: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_NotasEntrada'
    Left = 169
    Top = 128
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
    Left = 54
    Top = 128
  end
  object DSP_NotasEntrada: TDataSetProvider
    DataSet = SDS_NotasEntrada
    Options = [poRetainServerOrder]
    Left = 110
    Top = 144
  end
  object DS_NotasEntrada: TDataSource
    DataSet = CDS_NotasEntrada
    Left = 222
    Top = 144
  end
  object CDS_NotasEntr: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_NotasEntr'
    Left = 169
    Top = 194
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
    Left = 54
    Top = 194
  end
  object DSP_NotasEntr: TDataSetProvider
    DataSet = SDS_NotasEntr
    Options = [poRetainServerOrder]
    Left = 110
    Top = 210
  end
  object CDS_RomaneioDev: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_RomaneioDev'
    Left = 177
    Top = 258
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
    Left = 54
    Top = 258
  end
  object DSP_RomaneioDev: TDataSetProvider
    DataSet = SDS_RomaneioDev
    Options = [poRetainServerOrder]
    Left = 110
    Top = 274
  end
  object DS_RomaneioDev: TDataSource
    DataSet = CDS_RomaneioDev
    Left = 232
    Top = 274
  end
  object CDS_V_Geral: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DSP_Transf_Cd'
    Left = 29
    Top = 8
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
    Left = 448
    Top = 24
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
    object CDS_ReposicaoDocsCOD_LINX: TIntegerField
      FieldName = 'COD_LINX'
    end
    object CDS_ReposicaoDocsSEP_ORDEM: TIntegerField
      FieldName = 'SEP_ORDEM'
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
      'select'#13#10'em.cod_linx,'#13#10'lo.cod_loja,'#13#10#13#10'--em.razao_social,'#13#10'REPLAC' +
      'E(SUBSTRING(em.razao_social FROM POSITION('#39' | '#39', em.razao_social' +
      ')+3 FOR CHAR_LENGTH(em.razao_social)),'#13#10#39'Bourbon'#39', '#39'B.'#39') razao_s' +
      'ocial,'#13#10#13#10'lo.num_docto,'#13#10'count(lo.cod_produto) Num_Produtos,'#13#10'su' +
      'm(lo.qtd_transf) Qtd_SugTransf,'#13#10'sum(lo.qtd_a_transf) Qtd_ATrans' +
      'f,'#13#10'sum(decode(lo.num_pedido,'#39'000000'#39',lo.qtd_a_transf,0)) Qtd_NT' +
      'ransf,'#13#10'sum(decode(lo.num_pedido,'#39'000000'#39',0,lo.qtd_a_transf)) Qt' +
      'd_Transf,'#13#10'em.sep_ordem'#13#10#13#10'from es_estoques_lojas lo, emp_conexo' +
      'es em'#13#10'where lo.cod_loja=em.cod_filial'#13#10'and   lo.ind_transf='#39'SIM' +
      #39#13#10'and   lo.dta_movto = :sDta'#13#10#13#10'group by 1,2,3,4,10'#13#10#13#10'order by' +
      ' 10'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'sDta'
        ParamType = ptInput
      end>
    SQLConnection = DMBelShop.SQLC
    Left = 352
    Top = 16
  end
  object DSP_ReposicaoDocs: TDataSetProvider
    DataSet = SDS_ReposicaoDocs
    Options = [poRetainServerOrder]
    Left = 400
    Top = 32
  end
  object DS_ReposicaoDocs: TDataSource
    DataSet = CDS_ReposicaoDocs
    Left = 504
    Top = 32
  end
  object CDS_ReposicaoTransf: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    IndexFieldNames = 'ENDERECO; DES_PRODUTO'
    Params = <>
    ProviderName = 'DSP_ReposicaoTransf'
    AfterOpen = CDS_ReposicaoTransfAfterOpen
    Left = 448
    Top = 80
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
    object CDS_ReposicaoTransfPRINCIPALFOR: TIntegerField
      FieldName = 'PRINCIPALFOR'
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
      'SELECT'#13#10'lo.Num_Seq,'#13#10'lo.cod_produto,'#13#10'SUBSTRING(TRIM(pr.nome) FR' +
      'OM 1 FOR 80) Des_produto,'#13#10'lo.ind_curva ABC,'#13#10'lo.qtd_a_transf,'#13#10 +
      'lo.num_pedido,'#13#10'cd.end_zona||'#39'.'#39'||cd.end_corredor||'#39'.'#39'||cd.end_p' +
      'rateleira||'#39'.'#39'||cd.end_gaveta Endereco,'#13#10'lo.qtd_transf,'#13#10'lo.qtd_' +
      'transf_oc,'#13#10'0.00 PrecoCompra,'#13#10#13#10'lo.ind_prioridade, lo.ind_leito' +
      'ra, lo.qtd_checkout,'#13#10'Trim(pr.cod_barra) codbarra,'#13#10'fo.cod_clien' +
      'te principalfor'#13#10#13#10'FROM ES_ESTOQUES_LOJAS lo, ES_ESTOQUES_CD cd,' +
      #13#10'     LINXPRODUTOS pr,'#13#10'     LINXCLIENTESFORNEC fo'#13#10#13#10'WHERE lo.' +
      'cod_produto=cd.cod_produto'#13#10'AND   lo.dta_movto=cd.dta_movto'#13#10'AND' +
      '   lo.cod_produto=pr.cod_auxiliar'#13#10'AND   pr.cod_fornecedor=fo.co' +
      'd_cliente'#13#10'AND   lo.ind_transf='#39'SIM'#39#13#10'AND   lo.dta_movto= :sDta'#13 +
      #10'AND   lo.num_docto= :Doc'#13#10'AND   lo.cod_loja= :CodLoja'#13#10#13#10'ORDER ' +
      'BY 3'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'sDta'
        ParamType = ptInput
        Value = '13.05.2019'
      end
      item
        DataType = ftString
        Name = 'Doc'
        ParamType = ptInput
        Value = '1700'
      end
      item
        DataType = ftString
        Name = 'CodLoja'
        ParamType = ptInput
        Value = '1'
      end>
    SQLConnection = DMBelShop.SQLC
    Left = 352
    Top = 80
  end
  object DSP_ReposicaoTransf: TDataSetProvider
    DataSet = SDS_ReposicaoTransf
    Options = [poRetainServerOrder]
    Left = 400
    Top = 96
  end
  object DS_ReposicaoTransf: TDataSource
    DataSet = CDS_ReposicaoTransf
    Left = 504
    Top = 96
  end
  object SDS_RelReposicao: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'em.cod_cli_linx||'#39' - '#39'||REPLACE(SUBSTRING(em.razao_socia' +
      'l FROM POSITION('#39' | '#39', em.razao_social)+3'#13#10'                     ' +
      '                                                     FOR CHAR_LE' +
      'NGTH(em.razao_social)),'#13#10'                                       ' +
      '                                   '#39'Bourbon'#39', '#39'B.'#39') LOJA,'#13#10'SUBST' +
      'RING(em.num_cnpj FROM 1 FOR 2) || '#39'.'#39' ||'#13#10'SUBSTRING(em.num_cnpj ' +
      'FROM 3 FOR 3) || '#39'.'#39' ||'#13#10'SUBSTRING(em.num_cnpj FROM 6 FOR 3) || ' +
      #39'/'#39' ||'#13#10'SUBSTRING(em.num_cnpj FROM 9 FOR 4) || '#39'-'#39' ||'#13#10'SUBSTRING' +
      '(em.num_cnpj FROM 13 FOR 2) CNPJ,'#13#10#13#10'lo.num_docto,'#13#10'lo.dta_movto' +
      ','#13#10'lo.num_seq Seq,'#13#10#13#10'cd.end_prateleira||'#39'.'#39'||cd.end_gaveta ENDE' +
      'RECAMENTO, ---------------'#13#10'lo.qtd_a_transf,'#13#10#39'_____'#39' qtd_dispon' +
      'ivel,'#13#10'cd.qtd_estoque Saldo_CD,'#13#10'CAST(lp.cod_produto AS VARCHAR(' +
      '6)) cod_produto,'#13#10'CAST(lo.cod_produto AS VARCHAR(6)) codproduto,' +
      #13#10'TRIM(lp.cod_barra) codbarra,'#13#10'Trim(CAST(lp.referencia AS VARCH' +
      'AR(40))) referencia,'#13#10#13#10'TRIM(lp.nome) Des_produto, '#13#10#39'odir'#39' Usua' +
      'rio,'#13#10'lo.obs_docto,'#13#10'fo.nome_cliente FORNEC'#13#10#13#10'FROM ES_ESTOQUES_' +
      'LOJAS lo'#13#10'      LEFT JOIN ES_ESTOQUES_CD cd      ON cd.cod_produ' +
      'to=lo.cod_produto'#13#10'                                      AND cd.' +
      'dta_movto=lo.dta_movto'#13#10'      LEFT JOIN EMP_CONEXOES em        O' +
      'N em.cod_filial=lo.cod_loja'#13#10'      LEFT JOIN LINXPRODUTOS lp    ' +
      '    ON lp.cod_auxiliar=lo.cod_produto'#13#10'      LEFT JOIN LINXCLIEN' +
      'TESFORNEC fo  ON fo.cod_cliente=lp.cod_fornecedor'#13#10#13#10'WHERE CAST(' +
      'TRIM(COALESCE(lo.num_pedido,'#39'0'#39')) AS INTEGER)=0'#13#10'AND   lo.dta_mo' +
      'vto=current_date-1'#13#10'AND   lo.ind_transf='#39'SIM'#39#13#10'--AND   lo.num_do' +
      'cto=DMCentralTrocas.CDS_ReposicaoDocsNUM_DOCTO.AsString+'#13#10'AND   ' +
      'lo.cod_loja='#39'08'#39#13#10#13#10'--AND   lp.cod_fornecedor=DMBelShop.CDS_Busc' +
      'a.FieldByName('#39'principalfor'#39').AsString;'#13#10'AND lo.ind_prioridade i' +
      'n (1)'#13#10#13#10'ORDER BY 6, 12'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 352
    Top = 152
  end
  object DSP_RelReposicao: TDataSetProvider
    DataSet = SDS_RelReposicao
    Options = [poRetainServerOrder]
    Left = 395
    Top = 168
  end
  object CDS_RelReposicao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_RelReposicao'
    Left = 448
    Top = 152
    object CDS_RelReposicaoLOJA: TStringField
      FieldName = 'LOJA'
      FixedChar = True
      Size = 73
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
    object CDS_RelReposicaoCODPRODUTO: TStringField
      FieldName = 'CODPRODUTO'
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
    object CDS_RelReposicaoFORNEC: TStringField
      FieldName = 'FORNEC'
      Size = 40
    end
  end
  object CDS_V_ReposDivergencias: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CDS_V_ReposDivergenciasAfterScroll
    Left = 448
    Top = 216
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
    object CDS_V_ReposDivergenciasQTD_ORIG_CHECK: TFMTBCDField
      DisplayLabel = 'Qtd Orig Check'
      FieldName = 'QTD_ORIG_CHECK'
      Precision = 15
      Size = 2
    end
  end
  object DS_V_ReposDivergencias: TDataSource
    DataSet = CDS_V_ReposDivergencias
    Left = 504
    Top = 232
  end
  object CDS_ParamTransf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ParamTransf'
    Left = 718
    Top = 48
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
    Left = 624
    Top = 48
  end
  object DSP_ParamTransf: TDataSetProvider
    DataSet = SDS_ParamTransf
    Options = [poRetainServerOrder]
    Left = 672
    Top = 64
  end
  object DS_ParamTransf: TDataSource
    DataSet = CDS_ParamTransf
    Left = 768
    Top = 64
  end
  object DS_QtdCxCDProdutos: TDataSource
    DataSet = CDS_QtdCxCDProdutos
    Left = 504
    Top = 408
  end
  object CDS_QtdCxCDProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_QtdCxCDProdutos'
    Left = 448
    Top = 400
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
    Left = 400
    Top = 414
  end
  object SDS_QtdCxCDProdutos: TSQLDataSet
    CommandText = 
      'select'#13#10'c.cod_produto Codigo,'#13#10'Trim(p.apresentacao) Descricao,'#13#10 +
      'c.qtd_caixa,'#13#10'c.per_corte'#13#10#13#10'from prod_caixa_cd c, produto p'#13#10'wh' +
      'ere p.codproduto=c.cod_produto'#13#10'order by 2'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 352
    Top = 400
  end
  object DS_QtdCxCDGrupos: TDataSource
    DataSet = CDS_QtdCxCDGrupos
    Left = 504
    Top = 472
  end
  object CDS_QtdCxCDGrupos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_QtdCxCDGrupos'
    Left = 448
    Top = 464
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
    Left = 400
    Top = 478
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
    Left = 352
    Top = 464
  end
  object CDS_AnalRepDiaria: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_AnalRepDiaria'
    Left = 718
    Top = 136
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
    Left = 624
    Top = 136
  end
  object DSP_AnalRepDiaria: TDataSetProvider
    DataSet = SDS_AnalRepDiaria
    Options = [poRetainServerOrder]
    Left = 672
    Top = 152
  end
  object DS_AnalRepDiaria: TDataSource
    DataSet = CDS_AnalRepDiaria
    Left = 768
    Top = 152
  end
  object CDS_NFeAvarias: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_NFeAvarias'
    AfterScroll = CDS_NFeAvariasAfterScroll
    Left = 718
    Top = 248
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
    Left = 624
    Top = 248
  end
  object DSP_NFeAvarias: TDataSetProvider
    DataSet = SDS_NFeAvarias
    Options = [poRetainServerOrder]
    Left = 672
    Top = 264
  end
  object DS_NFeAvarias: TDataSource
    DataSet = CDS_NFeAvarias
    Left = 768
    Top = 264
  end
  object CDS_NFeAvariasForneEnd: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'TROCAR;NOME_FORN'
    Params = <>
    ProviderName = 'DSP_NFeAvariasForneEnd'
    Left = 718
    Top = 312
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
    Left = 624
    Top = 312
  end
  object DSP_NFeAvariasForneEnd: TDataSetProvider
    DataSet = SDS_NFeAvariasForneEnd
    Options = [poRetainServerOrder]
    Left = 672
    Top = 328
  end
  object DS_NFeAvariasForneEnd: TDataSource
    DataSet = CDS_NFeAvariasForneEnd
    Left = 768
    Top = 328
  end
  object CDS_RelRomaneio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_RelRomaneio'
    Left = 153
    Top = 326
  end
  object SDS_RelRomaneio: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 54
    Top = 326
  end
  object DSP_RelRomaneio: TDataSetProvider
    DataSet = SDS_RelRomaneio
    Options = [poRetainServerOrder]
    Left = 102
    Top = 341
  end
  object DS_RelRomaneio: TDataSource
    DataSet = CDS_RelRomaneio
    Left = 198
    Top = 341
  end
  object CDS_V_NfePerdas: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    Left = 718
    Top = 384
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
    Left = 768
    Top = 400
  end
  object SDS_RelDivergManuais: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' dv.cod_loja, lj.empresa,'#13#10' lj.nome_emp, dv.num_pedido,'#13 +
      #10' dv.dta_movto,'#13#10' dv.num_docto,'#13#10' dv.num_seq,'#13#10' dv.cod_produto C' +
      'OD_SIDICOM,'#13#10' pr.cod_produto COD_LINX,'#13#10' pr.nome,'#13#10' CAST(dv.qtd_' +
      'original AS INTEGER) qtd_original,'#13#10' CAST(dv.qtd_orig_check AS I' +
      'NTEGER) qtd_orig_check,'#13#10' CAST(dv.qtd_a_transf AS INTEGER) qtd_a' +
      '_transf,'#13#10' CAST(dv.dta_altera AS DATE) DTA_ALTERA,'#13#10' CAST(SUBSTR' +
      'ING(CAST(dv.hra_altera AS TIME) FROM 1 FOR 8)AS VARCHAR(8)) HRA_' +
      'ALTERA,'#13#10' dv.usu_altera,'#13#10' us.des_usuario'#13#10#13#10' FROM ES_ESTOQUES_L' +
      'OJAS_DIV dv'#13#10'       LEFT JOIN LINXLOJAS lj    on lj.cod_loja=dv.' +
      'cod_loja'#13#10'       LEFT JOIN LINXPRODUTOS pr on pr.cod_auxiliar=dv' +
      '.cod_produto'#13#10'       LEFT JOIN PS_USUARIOS us  on us.cod_usuario' +
      '=dv.usu_altera'#13#10#13#10'WHERE dv.num_pedido='#39'000000'#39#13#10'AND dv.cod_loja=' +
      #39'18'#39#13#10'AND dv.dta_movto='#39'19.07.2018'#39#13#10'AND EXISTS (SELECT 1'#13#10'     ' +
      '       FROM ES_ESTOQUES_LOJAS lo, ES_ESTOQUES_CD cd, PRODUTO pr'#13 +
      #10'            WHERE lo.cod_produto=pr.codproduto'#13#10'            AND' +
      '   lo.cod_produto=cd.cod_produto'#13#10'            AND   lo.dta_movto' +
      '=cd.dta_movto'#13#10'            AND   lo.ind_transf='#39'SIM'#39#13#10'          ' +
      '  AND   lo.dta_movto=dv.dta_movto'#13#10'            AND   lo.cod_loja' +
      '=dv.cod_loja'#13#10'            AND   lo.cod_produto=dv.cod_produto'#13#10' ' +
      '           AND   lo.num_docto= dv.num_docto'#13#10'            AND   l' +
      'o.num_pedido=dv.num_pedido'#13#10'            AND   (lo.ind_prioridade' +
      '=0))'#13#10#13#10'ORDER BY pr.nome, dv.dta_altera, dv.hra_altera'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 352
    Top = 304
  end
  object DSP_RelDivergManuais: TDataSetProvider
    DataSet = SDS_RelDivergManuais
    Options = [poRetainServerOrder]
    Left = 400
    Top = 320
  end
  object CDS_RelDivergManuais: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_RelDivergManuais'
    Left = 448
    Top = 304
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
    object CDS_RelDivergManuaisQTD_ORIGINAL: TIntegerField
      DisplayLabel = 'Qtd Resp Orig'
      FieldName = 'QTD_ORIGINAL'
      DisplayFormat = ',0'
    end
    object CDS_RelDivergManuaisQTD_ORIG_CHECK: TIntegerField
      DisplayLabel = 'Qtd Check Orig'
      FieldName = 'QTD_ORIG_CHECK'
      DisplayFormat = ',0'
    end
    object CDS_RelDivergManuaisQTD_A_TRANSF: TIntegerField
      DisplayLabel = 'Qrtd Alterada'
      FieldName = 'QTD_A_TRANSF'
      DisplayFormat = ',0'
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
  object CDS_ContProdSeparacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ContProdSeparacao'
    Left = 961
    Top = 171
    object CDS_ContProdSeparacaoNOME_SEPARDOR: TStringField
      DisplayLabel = 'Separador'
      FieldName = 'NOME_SEPARDOR'
      Size = 50
    end
    object CDS_ContProdSeparacaoLINHAS_SEPARADAS: TFMTBCDField
      DisplayLabel = 'Linhas Separadas'
      FieldName = 'LINHAS_SEPARADAS'
      DisplayFormat = ',0'
      Precision = 15
      Size = 0
    end
    object CDS_ContProdSeparacaoLINHAS_NSEPARADAS: TFMTBCDField
      DisplayLabel = 'Linhas '#209' Separadas '
      FieldName = 'LINHAS_NSEPARADAS'
      DisplayFormat = ',0'
      Precision = 15
      Size = 0
    end
    object CDS_ContProdSeparacaoLINHAS_TOTAL: TIntegerField
      DisplayLabel = 'Linha Total'
      FieldName = 'LINHAS_TOTAL'
      DisplayFormat = ',0'
    end
    object CDS_ContProdSeparacaoLINHAS_PERCENTUAL: TFMTBCDField
      DisplayLabel = 'Linhas %'
      FieldName = 'LINHAS_PERCENTUAL'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_ContProdSeparacaoQTD_SEPARADAS: TIntegerField
      DisplayLabel = 'Qtd Separadas'
      FieldName = 'QTD_SEPARADAS'
      DisplayFormat = ',0'
    end
    object CDS_ContProdSeparacaoQTD_NSEPARADAS: TIntegerField
      DisplayLabel = 'Qtd '#209' Separadas'
      FieldName = 'QTD_NSEPARADAS'
      DisplayFormat = ',0'
    end
    object CDS_ContProdSeparacaoQTD_TOTAL: TIntegerField
      DisplayLabel = 'Qtd Total'
      FieldName = 'QTD_TOTAL'
      DisplayFormat = ',0'
    end
    object CDS_ContProdSeparacaoQTD_PERCENTUAL: TFMTBCDField
      DisplayLabel = 'Qtd %'
      FieldName = 'QTD_PERCENTUAL'
      DisplayFormat = '0.,000'
      Precision = 15
      Size = 2
    end
    object CDS_ContProdSeparacaoORDEM: TIntegerField
      FieldName = 'ORDEM'
      Visible = False
    end
  end
  object SDS_ContProdSeparacao: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 862
    Top = 171
  end
  object DSP_ContProdSeparacao: TDataSetProvider
    DataSet = SDS_ContProdSeparacao
    Options = [poRetainServerOrder]
    Left = 910
    Top = 186
  end
  object DS_ContProdSeparacao: TDataSource
    DataSet = CDS_ContProdSeparacao
    Left = 1006
    Top = 186
  end
  object CDS_ContProdEstatisticas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ContProdEstatisticas'
    Left = 961
    Top = 307
    object CDS_ContProdEstatisticasDES_USUARIO: TStringField
      DisplayLabel = 'Conferente'
      FieldName = 'DES_USUARIO'
      Size = 50
    end
    object CDS_ContProdEstatisticasLINHAS_TOTAL: TIntegerField
      DisplayLabel = 'Linhas Total'
      FieldName = 'LINHAS_TOTAL'
      DisplayFormat = ',0'
    end
    object CDS_ContProdEstatisticasLINHAS_NAO_ALTERADAS: TIntegerField
      DisplayLabel = 'Linhas '#209' Alt'
      FieldName = 'LINHAS_NAO_ALTERADAS'
      DisplayFormat = ',0'
    end
    object CDS_ContProdEstatisticasLINHAS_ALTERADAS: TIntegerField
      DisplayLabel = 'Linhas Alt'
      FieldName = 'LINHAS_ALTERADAS'
      DisplayFormat = ',0'
    end
    object CDS_ContProdEstatisticasLINHAS_ALTERADAS_DIF_ZERO: TIntegerField
      DisplayLabel = 'Linhas Alt <> Zero'
      FieldName = 'LINHAS_ALTERADAS_DIF_ZERO'
      DisplayFormat = ',0'
    end
    object CDS_ContProdEstatisticasLINHAS_ALTERADAS_ZERO: TIntegerField
      DisplayLabel = 'Linhas Alt = Zero'
      FieldName = 'LINHAS_ALTERADAS_ZERO'
      DisplayFormat = ',0'
    end
    object CDS_ContProdEstatisticasQTD_TOTAL_ORIGINAL: TFMTBCDField
      DisplayLabel = 'Qtd Total Orig'
      FieldName = 'QTD_TOTAL_ORIGINAL'
      DisplayFormat = ',0'
      Precision = 15
      Size = 2
    end
    object CDS_ContProdEstatisticasQTD_NAO_ALTERADAS: TFMTBCDField
      DisplayLabel = 'Qtd '#209' Alt'
      FieldName = 'QTD_NAO_ALTERADAS'
      DisplayFormat = ',0'
      Precision = 15
      Size = 2
    end
    object CDS_ContProdEstatisticasQTD_ALTERADAS_ORIGINAL: TFMTBCDField
      DisplayLabel = 'Qtd Alt Orig'
      FieldName = 'QTD_ALTERADAS_ORIGINAL'
      DisplayFormat = ',0'
      Precision = 15
      Size = 2
    end
    object CDS_ContProdEstatisticasQTD_ALTERADAS: TFMTBCDField
      DisplayLabel = 'Qtd Alt'
      FieldName = 'QTD_ALTERADAS'
      DisplayFormat = ',0'
      Precision = 15
      Size = 2
    end
    object CDS_ContProdEstatisticasLINHAS_NFE: TFMTBCDField
      DisplayLabel = 'Linhas NFe'
      FieldName = 'LINHAS_NFE'
      DisplayFormat = ',0'
      Precision = 15
      Size = 0
    end
    object CDS_ContProdEstatisticasLINHAS_SEM_NFE: TFMTBCDField
      DisplayLabel = 'Linhas '#209' NFe'
      FieldName = 'LINHAS_SEM_NFE'
      DisplayFormat = ',0'
      Precision = 15
      Size = 0
    end
    object CDS_ContProdEstatisticasQTD_NFE: TFMTBCDField
      DisplayLabel = 'Qtd NFe'
      FieldName = 'QTD_NFE'
      DisplayFormat = ',0'
      Precision = 15
      Size = 2
    end
    object CDS_ContProdEstatisticasQTD_SEM_NFE: TFMTBCDField
      DisplayLabel = 'Qtd '#209' NFe'
      FieldName = 'QTD_SEM_NFE'
      DisplayFormat = ',0'
      Precision = 15
      Size = 2
    end
    object CDS_ContProdEstatisticasORDEM: TIntegerField
      FieldName = 'ORDEM'
      Required = True
    end
  end
  object SDS_ContProdEstatisticas: TSQLDataSet
    CommandText = 
      '-- ======== Produ'#231#227'o / Confer'#234'ncia'#13#10'SELECT'#13#10'TRIM(CASE'#13#10'  WHEN l.' +
      'usu_altera=0 THEN'#13#10'    '#39'@ N'#195'O EXECUTADO @'#39#13#10'  ELSE'#13#10'    u.des_us' +
      'uario'#13#10'END) DES_USUARIO, -- 1'#13#10#13#10'COUNT(l.num_seq) LINHAS_TOTAL, ' +
      '-- 2'#13#10#13#10'-- Linhas N'#194'O Alteradaso ===============================' +
      '=================================='#13#10'CAST(SUM('#13#10'  CASE'#13#10'    WHEN ' +
      '((l.qtd_transf + l.qtd_transf_oc)=l.qtd_a_transf)  THEN'#13#10'      1' +
      #13#10'    ELSE'#13#10'      0'#13#10'  END'#13#10') AS INTEGER) LINHAS_NAO_ALTERADAS, ' +
      '-- 3'#13#10#13#10'-- Linahs Alteradas ====================================' +
      '============================'#13#10'CAST(SUM('#13#10'  CASE'#13#10'    WHEN ((l.qt' +
      'd_transf + l.qtd_transf_oc)<>l.qtd_a_transf) THEN'#13#10'      1'#13#10'    ' +
      'ELSE'#13#10'      0'#13#10'  END'#13#10') AS INTEGER) LINHAS_ALTERADAS, -- 4'#13#10#13#10'--' +
      ' Linahs Alteradas Diferente de Zero ============================' +
      '===================================='#13#10'CAST(SUM('#13#10'  CASE'#13#10'    WHE' +
      'N ((l.qtd_transf + l.qtd_transf_oc)<>l.qtd_a_transf) AND (l.qtd_' +
      'a_transf<>0) THEN'#13#10'      1'#13#10'    ELSE'#13#10'      0'#13#10'  END'#13#10') AS INTEG' +
      'ER) LINHAS_ALTERADAS_DIF_ZERO, -- 5'#13#10#13#10'-- Linahs Alteradas para ' +
      'Zero ===========================================================' +
      '======'#13#10'CAST(SUM('#13#10'  CASE'#13#10'    WHEN ((l.qtd_transf + l.qtd_trans' +
      'f_oc)<>l.qtd_a_transf) AND (l.qtd_a_transf=0) THEN'#13#10'      1'#13#10'   ' +
      ' ELSE'#13#10'      0'#13#10'  END'#13#10') AS INTEGER) LINHAS_ALTERADAS_ZERO, -- 6' +
      #13#10#13#10'--==========================================================' +
      '======'#13#10'SUM((l.qtd_transf + l.qtd_transf_oc)) QTD_TOTAL_ORIGINAL' +
      ', -- 7'#13#10#13#10#13#10'SUM('#13#10'  CASE'#13#10'    WHEN ((l.qtd_transf + l.qtd_transf' +
      '_oc)=l.qtd_a_transf)  THEN'#13#10'      l.qtd_a_transf'#13#10'    ELSE'#13#10'    ' +
      '  0'#13#10'  END'#13#10') QTD_NAO_ALTERADAS, -- 8'#13#10#13#10#13#10'SUM('#13#10'  CASE'#13#10'    WHE' +
      'N ((l.qtd_transf + l.qtd_transf_oc)<>l.qtd_a_transf)  THEN'#13#10'    ' +
      '  (l.qtd_transf + l.qtd_transf_oc)'#13#10'    ELSE'#13#10'      0'#13#10'  END'#13#10') ' +
      'QTD_ALTERADAS_ORIGINAL, -- 9'#13#10#13#10'SUM('#13#10'  CASE'#13#10'    WHEN ((l.qtd_t' +
      'ransf + l.qtd_transf_oc)<>l.qtd_a_transf)  THEN'#13#10'      l.qtd_a_t' +
      'ransf'#13#10'    ELSE'#13#10'      0'#13#10'  END'#13#10') QTD_ALTERADAS, -- 10'#13#10#13#10'-- Em' +
      'iss'#227'o NFE ======================================================' +
      '==========='#13#10'SUM('#13#10'  CASE'#13#10'    WHEN l.num_pedido<>'#39'000000'#39' THEN'#13 +
      #10'      1'#13#10'    ELSE'#13#10'      0'#13#10'  END'#13#10') LINHAS_NFE, -- 11'#13#10#13#10'SUM('#13 +
      #10'  CASE'#13#10'    WHEN l.num_pedido='#39'000000'#39' THEN'#13#10'      1'#13#10'    ELSE'#13 +
      #10'      0'#13#10'  END'#13#10') LINHAS_SEM_NFE, -- 12'#13#10#13#10'SUM('#13#10'  CASE'#13#10'    WH' +
      'EN l.num_pedido<>'#39'000000'#39' THEN'#13#10'      l.qtd_a_transf'#13#10'    ELSE'#13#10 +
      '      0'#13#10'  END'#13#10') QTD_NFE, -- 13'#13#10#13#10'SUM('#13#10'  CASE'#13#10'    WHEN l.num' +
      '_pedido='#39'000000'#39' THEN'#13#10'      l.qtd_a_transf'#13#10'    ELSE'#13#10'      0'#13#10 +
      '  END'#13#10') QTD_SEM_NFE, -- 14'#13#10#13#10'3 ORDEM -- 15'#13#10#13#10'FROM ES_ESTOQUES' +
      '_LOJAS l'#13#10'          LEFT JOIN PS_USUARIOS u ON u.cod_usuario=l.u' +
      'su_altera'#13#10'WHERE l.ind_transf='#39'SIM'#39#13#10'AND   l.num_pedido<>'#39'999999' +
      #39#13#10'AND   l.num_pedido<>'#39'999998'#39#13#10'AND   l.dta_movto BETWEEN :DtaI' +
      ' AND :DtaF'#13#10#13#10'GROUP BY 1'#13#10#13#10'UNION ------------------------------' +
      '---'#13#10#13#10'-- ======== Produ'#231#227'o / Confer'#234'ncia - Totais'#13#10'SELECT'#13#10#39'TOT' +
      'AL DO PER'#205'ODO'#39' DES_USUARIO,'#13#10#13#10'COUNT(l.num_seq) LINHAS_TOTAL, --' +
      ' 2'#13#10#13#10'-- Linhas N'#194'O Alteradaso =================================' +
      '================================'#13#10'CAST(SUM('#13#10'  CASE'#13#10'    WHEN ((' +
      'l.qtd_transf + l.qtd_transf_oc)=l.qtd_a_transf)  THEN'#13#10'      1'#13#10 +
      '    ELSE'#13#10'      0'#13#10'  END'#13#10') AS INTEGER) LINHAS_NAO_ALTERADAS, --' +
      ' 3'#13#10#13#10'-- Linahs Alteradas ======================================' +
      '=========================='#13#10'CAST(SUM('#13#10'  CASE'#13#10'    WHEN ((l.qtd_' +
      'transf + l.qtd_transf_oc)<>l.qtd_a_transf) THEN'#13#10'      1'#13#10'    EL' +
      'SE'#13#10'      0'#13#10'  END'#13#10') AS INTEGER) LINHAS_ALTERADAS, -- 4'#13#10#13#10'-- L' +
      'inahs Alteradas Diferente de Zero===============================' +
      '=================================='#13#10'CAST(SUM('#13#10'  CASE'#13#10'    WHEN ' +
      '((l.qtd_transf + l.qtd_transf_oc)<>l.qtd_a_transf) AND (l.qtd_a_' +
      'transf<>0) THEN'#13#10'      1'#13#10'    ELSE'#13#10'      0'#13#10'  END'#13#10') AS INTEGER' +
      ') LINHAS_ALTERADAS_DIF_ZERO, -- 5'#13#10#13#10'-- Linahs Alteradas para Ze' +
      'ro =============================================================' +
      '===='#13#10'CAST(SUM('#13#10'  CASE'#13#10'    WHEN ((l.qtd_transf + l.qtd_transf_' +
      'oc)<>l.qtd_a_transf) AND (l.qtd_a_transf=0) THEN'#13#10'      1'#13#10'    E' +
      'LSE'#13#10'      0'#13#10'  END'#13#10') AS INTEGER) LINHAS_ALTERADAS_ZERO, -- 6'#13#10 +
      #13#10#13#10'--==========================================================' +
      '======'#13#10'SUM((l.qtd_transf + l.qtd_transf_oc)) QTD_TOTAL_ORIGINAL' +
      ', -- 7'#13#10#13#10#13#10'SUM('#13#10'  CASE'#13#10'    WHEN ((l.qtd_transf + l.qtd_transf' +
      '_oc)=l.qtd_a_transf)  THEN'#13#10'      l.qtd_a_transf'#13#10'    ELSE'#13#10'    ' +
      '  0'#13#10'  END'#13#10') QTD_NAO_ALTERADAS, -- 8'#13#10#13#10#13#10'SUM('#13#10'  CASE'#13#10'    WHE' +
      'N ((l.qtd_transf + l.qtd_transf_oc)<>l.qtd_a_transf)  THEN'#13#10'    ' +
      '  (l.qtd_transf + l.qtd_transf_oc)'#13#10'    ELSE'#13#10'      0'#13#10'  END'#13#10') ' +
      'QTD_ALTERADAS_ORIGINAL, -- 9'#13#10#13#10'SUM('#13#10'  CASE'#13#10'    WHEN ((l.qtd_t' +
      'ransf + l.qtd_transf_oc)<>l.qtd_a_transf)  THEN'#13#10'      l.qtd_a_t' +
      'ransf'#13#10'    ELSE'#13#10'      0'#13#10'  END'#13#10') QTD_ALTERADAS, -- 10'#13#10#13#10'-- Em' +
      'iss'#227'o NFE ======================================================' +
      '==========='#13#10'SUM('#13#10'  CASE'#13#10'    WHEN l.num_pedido<>'#39'000000'#39' THEN'#13 +
      #10'      1'#13#10'    ELSE'#13#10'      0'#13#10'  END'#13#10') LINHAS_NFE, -- 11'#13#10#13#10'SUM('#13 +
      #10'  CASE'#13#10'    WHEN l.num_pedido='#39'000000'#39' THEN'#13#10'      1'#13#10'    ELSE'#13 +
      #10'      0'#13#10'  END'#13#10') LINHAS_SEM_NFE, -- 12'#13#10#13#10'SUM('#13#10'  CASE'#13#10'    WH' +
      'EN l.num_pedido<>'#39'000000'#39' THEN'#13#10'      l.qtd_a_transf'#13#10'    ELSE'#13#10 +
      '      0'#13#10'  END'#13#10') QTD_NFE, -- 13'#13#10#13#10'SUM('#13#10'  CASE'#13#10'    WHEN l.num' +
      '_pedido='#39'000000'#39' THEN'#13#10'      l.qtd_a_transf'#13#10'    ELSE'#13#10'      0'#13#10 +
      '  END'#13#10') QTD_SEM_NFE, -- 14'#13#10#13#10'4 ORDEM -- 15'#13#10#13#10'FROM ES_ESTOQUES' +
      '_LOJAS l'#13#10'          LEFT JOIN PS_USUARIOS u ON u.cod_usuario=l.u' +
      'su_altera'#13#10'WHERE l.ind_transf='#39'SIM'#39#13#10'AND   l.num_pedido<>'#39'999999' +
      #39#13#10'AND   l.num_pedido<>'#39'999998'#39#13#10'AND   l.dta_movto BETWEEN :DtaI' +
      ' AND :DtaF'#13#10#13#10'UNION'#13#10#13#10'-- ======== Produ'#231#227'o / Confer'#234'ncia - Cabe' +
      #231'alho'#13#10'SELECT'#13#10#39'LOGISTICA CONFER'#202'NCIA / ESTATISTICA'#39' des_usuario' +
      ', -- 1'#13#10#13#10'NULL LINHAS_TOTAL, -- 2'#13#10'NULL LINHAS_NAO_ALTERADAS, --' +
      ' 3'#13#10'NULL LINHAS_ALTERADAS, -- 4'#13#10'NULL LINHAS_ALTERADAS_DIF_ZERO,' +
      ' -- 5'#13#10'NULL LINHAS_ALTERADAS_ZERO, -- 6'#13#10'NULL QTD_TOTAL_ORIGINAL' +
      ', -- 7'#13#10'NULL QTD_NAO_ALTERADAS, -- 8'#13#10'NULL QTD_ALTERADAS_ORIGINA' +
      'L, -- 9'#13#10'NULL QTD_ALTERADAS, -- 10'#13#10'NULL LINHAS_NFE, -- 11'#13#10'NULL' +
      ' LINHAS_SEM_NFE, -- 12'#13#10'NULL QTD_NFE, -- 13'#13#10'NULL QTD_SEM_NFE, -' +
      '- 14'#13#10#13#10'0 ORDEM -- 15'#13#10'FROM RDB$DATABASE'#13#10#13#10'UNION'#13#10#13#10'-- ========' +
      ' Produ'#231#227'o / Confer'#234'ncia - Periodo'#13#10'SELECT'#13#10#39'PER'#205'ODO DE '#39'||REPLAC' +
      'E(CAST(:DtaI AS VARCHAR(10)) ||'#39' A '#39'||CAST(:DtaF AS VARCHAR(10))' +
      ', '#39'.'#39', '#39'/'#39') NOME_SEPARDOR,'#13#10#13#10'NULL LINHAS_TOTAL, -- 2'#13#10'NULL LINH' +
      'AS_NAO_ALTERADAS, -- 3'#13#10'NULL LINHAS_ALTERADAS, -- 4'#13#10'NULL LINHAS' +
      '_ALTERADAS_DIF_ZERO, -- 5'#13#10'NULL LINHAS_ALTERADAS_ZERO, -- 6'#13#10'NUL' +
      'L QTD_TOTAL_ORIGINAL, -- 7'#13#10'NULL QTD_NAO_ALTERADAS, -- 8'#13#10'NULL Q' +
      'TD_ALTERADAS_ORIGINAL, -- 9'#13#10'NULL QTD_ALTERADAS, -- 10'#13#10'NULL LIN' +
      'HAS_NFE, -- 11'#13#10'NULL LINHAS_SEM_NFE, -- 12'#13#10'NULL QTD_NFE, -- 13'#13 +
      #10'NULL QTD_SEM_NFE, -- 14'#13#10#13#10'1 ORDEM -- 14'#13#10'FROM RDB$DATABASE'#13#10#13#10 +
      'ORDER BY 15,1'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'DtaI'
        ParamType = ptInput
        Value = '01.10.2018'
      end
      item
        DataType = ftString
        Name = 'DtaF'
        ParamType = ptInput
        Value = '10.10.2018'
      end
      item
        DataType = ftString
        Name = 'DtaI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DtaF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DtaI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DtaF'
        ParamType = ptInput
      end>
    SQLConnection = DMBelShop.SQLC
    Left = 862
    Top = 307
  end
  object DSP_ContProdEstatisticas: TDataSetProvider
    DataSet = SDS_ContProdEstatisticas
    Options = [poRetainServerOrder]
    Left = 910
    Top = 322
  end
  object DS_ContProdEstatisticas: TDataSource
    DataSet = CDS_ContProdEstatisticas
    Left = 1006
    Top = 322
  end
  object CDS_Depositos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Depositos'
    Left = 926
    Top = 24
    object CDS_DepositosSELECAO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Sele'#231#227'o'
      FieldName = 'SELECAO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object CDS_DepositosCOD_DEPOSITO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_DEPOSITO'
    end
    object CDS_DepositosNOME_DEPOSITO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME_DEPOSITO'
      Size = 50
    end
    object CDS_DepositosDISP_VENDA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Dispon'#237'vel Venda'
      FieldName = 'DISP_VENDA'
      Required = True
      FixedChar = True
      Size = 3
    end
    object CDS_DepositosDISP_TRANSF: TStringField
      Alignment = taCenter
      DisplayLabel = 'Dispon'#237'vel  Transf Filiais'
      FieldName = 'DISP_TRANSF'
      Required = True
      FixedChar = True
      Size = 3
    end
  end
  object SDS_Depositos: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#39'NAO'#39' Selecao,'#13#10'd.cod_deposito, d.nome_deposito,'#13#10#13#10'CASE' +
      ' d.disponivel'#13#10'  When 0 Then'#13#10'   '#39'N'#195'O'#39#13#10'  ELSE'#13#10'   '#39'SIM'#39#13#10'END Di' +
      'sp_Venda,'#13#10#13#10'CASE d.disponivel_transferencia'#13#10'  When 0 Then'#13#10'   ' +
      #39'N'#195'O'#39#13#10'  ELSE'#13#10'   '#39'SIM'#39#13#10'END  Disp_Transf'#13#10#13#10'FROM LINXPRODUTOSDE' +
      'POSITOS d'#13#10#13#10'ORDER BY 2'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 832
    Top = 24
  end
  object DSP_Depositos: TDataSetProvider
    DataSet = SDS_Depositos
    Options = [poRetainServerOrder]
    Left = 880
    Top = 40
  end
  object DS_Depositos: TDataSource
    DataSet = CDS_Depositos
    Left = 976
    Top = 40
  end
  object CDS_ContProdConferencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ContProdConferencia'
    Left = 961
    Top = 243
    object CDS_ContProdConferenciaNOME_CONFERENTE: TStringField
      DisplayLabel = 'Conferente'
      FieldName = 'NOME_CONFERENTE'
      Size = 50
    end
    object CDS_ContProdConferenciaQTD_ENVIADAS: TIntegerField
      DisplayLabel = 'Qtd Enviadas'
      FieldName = 'QTD_ENVIADAS'
      DisplayFormat = ',0'
    end
    object CDS_ContProdConferenciaQTD_NENVIADAS: TIntegerField
      DisplayLabel = 'Qtd  '#209' Enviadas'
      FieldName = 'QTD_NENVIADAS'
      DisplayFormat = ',0'
    end
    object CDS_ContProdConferenciaQTD_TOTAL: TIntegerField
      DisplayLabel = 'Qtd Total'
      FieldName = 'QTD_TOTAL'
      DisplayFormat = ',0'
    end
    object CDS_ContProdConferenciaQTD_PERCENTUAL: TFMTBCDField
      DisplayLabel = 'Qtd %'
      FieldName = 'QTD_PERCENTUAL'
      DisplayFormat = '0.,000'
      Precision = 15
      Size = 3
    end
    object CDS_ContProdConferenciaORDEM: TIntegerField
      FieldName = 'ORDEM'
      Visible = False
    end
  end
  object SDS_ContProdConferencia: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 862
    Top = 243
  end
  object DSP_ContProdConferencia: TDataSetProvider
    DataSet = SDS_ContProdConferencia
    Options = [poRetainServerOrder]
    Left = 910
    Top = 258
  end
  object DS_ContProdConferencia: TDataSource
    DataSet = CDS_ContProdConferencia
    Left = 1006
    Top = 258
  end
  object CDS_EnderecoProd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_EnderecoProd'
    AfterScroll = CDS_EnderecoProdAfterScroll
    Left = 153
    Top = 422
    object CDS_EnderecoProdCOD_LOJA: TStringField
      FieldName = 'COD_LOJA'
      Required = True
      FixedChar = True
      Size = 2
    end
    object CDS_EnderecoProdCOD_LINX: TIntegerField
      FieldName = 'COD_LINX'
      Required = True
    end
    object CDS_EnderecoProdREFERENCIA: TStringField
      DisplayLabel = 'Refer'#234'ncia'
      FieldName = 'REFERENCIA'
    end
    object CDS_EnderecoProdCOD_ITEM: TStringField
      FieldName = 'COD_ITEM'
      Size = 6
    end
    object CDS_EnderecoProdCOD_PRODUTO: TFMTBCDField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PRODUTO'
      Required = True
      Precision = 15
      Size = 0
    end
    object CDS_EnderecoProdNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'NOME'
      Size = 250
    end
    object CDS_EnderecoProdZONAENDERECO: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Zona'
      FieldName = 'ZONAENDERECO'
    end
    object CDS_EnderecoProdCORREDOR: TStringField
      Alignment = taCenter
      DisplayLabel = 'Corredor'
      FieldName = 'CORREDOR'
      FixedChar = True
      Size = 3
    end
    object CDS_EnderecoProdPRATELEIRA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Prateleira'
      FieldName = 'PRATELEIRA'
      FixedChar = True
      Size = 3
    end
    object CDS_EnderecoProdGAVETA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Gaveta'
      FieldName = 'GAVETA'
      FixedChar = True
      Size = 4
    end
    object CDS_EnderecoProdCOD_BARRA: TStringField
      DisplayLabel = 'C'#243'digo Barras'
      FieldName = 'COD_BARRA'
    end
    object CDS_EnderecoProdSALDO: TIntegerField
      FieldName = 'SALDO'
      DisplayFormat = ',0'
    end
    object CDS_EnderecoProdATIVO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Ativo ?'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object CDS_EnderecoProdCOD_FORNECEDOR: TIntegerField
      FieldName = 'COD_FORNECEDOR'
    end
    object CDS_EnderecoProdNOMEFORNECEDOR: TStringField
      FieldName = 'NOMEFORNECEDOR'
      Size = 60
    end
  end
  object DSP_EnderecoProd: TDataSetProvider
    DataSet = SQLQ_EnderecoProd
    Options = [poRetainServerOrder]
    Left = 102
    Top = 437
  end
  object DS_EnderecoProd: TDataSource
    DataSet = CDS_EnderecoProd
    Left = 198
    Top = 437
  end
  object SQLQ_EnderecoProd: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CodLoja'
        ParamType = ptInput
        Value = '2'
      end
      item
        DataType = ftString
        Name = 'CodLoja'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      'en.cod_loja,'
      'en.cod_linx,'
      'pr.referencia,'
      'en.cod_produto,'
      'en.cod_item,'
      'pr.nome,'
      'en.zonaendereco, en.corredor, en.prateleira, en.gaveta,'
      'pr.cod_barra,'
      'CAST(COALESCE(sa.quantidade,0) AS INTEGER) Saldo,'
      'CASE'
      '  WHEN pr.desativado='#39'N'#39' THEN'
      '    '#39'Sim'#39
      '  ELSE'
      '    '#39'N'#227'o'#39
      'END ATIVO,'
      'pr.cod_fornecedor,'
      'fo.nome_cliente nomefornecedor'
      ''
      'FROM PROD_ENDERECO en'
      
        '    LEFT JOIN LINXPRODUTOS pr          ON pr.cod_produto=en.cod_' +
        'produto'
      
        '    LEFT JOIN LINXPRODUTOSDETALHES sa  ON sa.cod_produto=en.cod_' +
        'produto'
      '                                      AND sa.empresa=:CodLoja'
      
        '    LEFT JOIN LINXCLIENTESFORNEC fo    ON fo.cod_cliente=pr.cod_' +
        'fornecedor'
      ''
      'WHERE en.cod_linx=:CodLoja'
      ''
      ''
      '')
    SQLConnection = DMBelShop.SQLC
    Left = 40
    Top = 424
  end
end
