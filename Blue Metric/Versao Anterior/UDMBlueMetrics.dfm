object DMBlueMetrics: TDMBlueMetrics
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 240
  Top = 116
  Height = 595
  Width = 868
  object ADOC: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=Postg' +
      'reSQL35W'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 432
    Top = 40
  end
  object SQLC: TSQLConnection
    ConnectionName = 'BelShop'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=\\localhost\C:\Projetos\BelShop\Dados\BelShop.FDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'fbclient.dll'
    Left = 32
    Top = 24
  end
  object SQLQ_Clientes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        '----------------------------------------------------------------' +
        '----------------'
      '-- CLIENTES'
      
        '----------------------------------------------------------------' +
        '----------------'
      'SELECT'
      'NULL CELULAR,'
      'CASE'
      '   WHEN POSITION('#39'-'#39', TRIM(c.cep_cliente))=0 THEN'
      
        '     SUBSTRING(TRIM(TRIM(c.cep_cliente)) FROM 1 FOR 5)||'#39'-'#39'||SUB' +
        'STRING(TRIM(TRIM(c.cep_cliente)) FROM 6 FOR 3)'
      '   ELSE'
      '     TRIM(TRIM(c.cep_cliente))'
      'END CEP,'
      ''
      'TRIM(c.cidade_cliente) CIDADE,'
      'c.cod_cliente CODIGO,'
      ''
      'CASE'
      
        '  WHEN CHARACTER_LENGTH(REPLACE(REPLACE(REPLACE(c.doc_cliente, '#39 +
        '/'#39', '#39#39'),'#39'.'#39','#39#39'),'#39'-'#39','#39#39'))<14 THEN'
      '    '#39'F'#39
      '  ELSE'
      '    '#39'J'#39
      'END CODIGO_TIPO,'
      ''
      'c.data_cadastro DATA_CADASTRO,'
      'c.data_nascimento DATA_NASCIMENTO,'
      'NULL DDD_FIXO,'
      'NULL DDD_CELULAR,'
      'TRIM(c.email_cliente) EMAIL,'
      'NULL FILIAL_CADASTRO,'
      'c.fone_cliente FONE,'
      ''
      'UPPER(CASE'
      '   WHEN (COALESCE(c.razao_cliente,'#39#39')<>'#39#39') THEN'
      '     TRIM(c.razao_cliente)'
      '   WHEN (COALESCE(c.nome_cliente,'#39#39')<>'#39#39') THEN'
      '     TRIM(c.nome_cliente)'
      '   ELSE'
      '     '#39'CLIENTE SEM NOME'#39
      'END) NOME,'
      ''
      'case COALESCE(c.pais,'#39#39')'
      '   WHEN '#39#39' THEN'
      '    '#39'BRASIL'#39
      '   ELSE'
      '    UPPER(TRIM(c.pais))'
      'END PAIS,'
      ''
      'CASE'
      
        '  WHEN CHARACTER_LENGTH(REPLACE(REPLACE(REPLACE(c.doc_cliente, '#39 +
        '/'#39', '#39#39'),'#39'.'#39','#39#39'),'#39'-'#39','#39#39'))<14 THEN'
      '    c.sexo'
      '  ELSE'
      '    NULL'
      'END SEXO,'
      ''
      'c.uf_cliente UF'
      ''
      'FROM LINXCLIENTESFORNEC c'
      ''
      
        'WHERE ((c.tipo_cadastro='#39'C'#39') OR (c.tipo_cadastro IS NULL) OR(c.t' +
        'ipo_cadastro='#39'A'#39'))')
    SQLConnection = SQLC
    Left = 72
    Top = 168
    object SQLQ_ClientesCELULAR: TStringField
      FieldName = 'CELULAR'
      FixedChar = True
      Size = 1
    end
    object SQLQ_ClientesCEP: TStringField
      FieldName = 'CEP'
      Size = 19
    end
    object SQLQ_ClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object SQLQ_ClientesCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object SQLQ_ClientesCODIGO_TIPO: TStringField
      FieldName = 'CODIGO_TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object SQLQ_ClientesDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object SQLQ_ClientesDATA_NASCIMENTO: TSQLTimeStampField
      FieldName = 'DATA_NASCIMENTO'
    end
    object SQLQ_ClientesDDD_FIXO: TStringField
      FieldName = 'DDD_FIXO'
      FixedChar = True
      Size = 1
    end
    object SQLQ_ClientesDDD_CELULAR: TStringField
      FieldName = 'DDD_CELULAR'
      FixedChar = True
      Size = 1
    end
    object SQLQ_ClientesEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object SQLQ_ClientesFILIAL_CADASTRO: TStringField
      FieldName = 'FILIAL_CADASTRO'
      FixedChar = True
      Size = 1
    end
    object SQLQ_ClientesFONE: TStringField
      FieldName = 'FONE'
    end
    object SQLQ_ClientesNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object SQLQ_ClientesPAIS: TStringField
      FieldName = 'PAIS'
      Size = 80
    end
    object SQLQ_ClientesSEXO: TStringField
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object SQLQ_ClientesUF: TStringField
      FieldName = 'UF'
    end
  end
  object SDS_Lojas: TSQLDataSet
    CommandText = 
      'SELECT em.cod_filial, em.cod_linx, em.razao_social,'#13#10'       em.d' +
      'ta_inicio_linx, em.ind_domingo'#13#10'FROM EMP_CONEXOES em'#13#10'WHERE em.d' +
      'ta_inicio_linx IS NOT NULL'#13#10'AND em.cod_linx<>0'#13#10'ORDER BY 5,4'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 80
    Top = 97
  end
  object DSP_Lojas: TDataSetProvider
    DataSet = SDS_Lojas
    Options = [poRetainServerOrder]
    Left = 130
    Top = 110
  end
  object CDS_Lojas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Lojas'
    Left = 181
    Top = 96
    object CDS_LojasCOD_FILIAL: TStringField
      FieldName = 'COD_FILIAL'
      Required = True
      Size = 2
    end
    object CDS_LojasCOD_LINX: TIntegerField
      FieldName = 'COD_LINX'
    end
    object CDS_LojasRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 60
    end
    object CDS_LojasDTA_INICIO_LINX: TDateField
      FieldName = 'DTA_INICIO_LINX'
    end
    object CDS_LojasIND_DOMINGO: TStringField
      FieldName = 'IND_DOMINGO'
      FixedChar = True
      Size = 1
    end
  end
  object DS_Lojas: TDataSource
    DataSet = CDS_Lojas
    Left = 232
    Top = 112
  end
  object SQLQ_Empresas: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        '----------------------------------------------------------------' +
        '----------------'
      '-- EMPRESAS'
      
        '----------------------------------------------------------------' +
        '----------------'
      'SELECT'
      'CASE'
      '  WHEN COALESCE(l.area_empresa,'#39#39')<>'#39#39' Then'
      '    CAST(l.area_empresa as Integer)'
      '  ELSE'
      '    0'
      'END AREA_LOJA,'
      ''
      #39'SIM'#39' ATIVA,'
      'UPPER(TRIM(l.bairro_emp)) BAIRRO,'
      #39'VAREJO, FRANQUIAS, ATACADO, E-COMMERCE'#39' CANAL,'
      ''
      'CASE'
      '   WHEN POSITION('#39'-'#39', l.cep_emp)=0 THEN'
      
        '     SUBSTRING(TRIM(l.cep_emp) FROM 1 FOR 5)||'#39'-'#39'||SUBSTRING(TRI' +
        'M(l.cep_emp) FROM 6 FOR 3)'
      '   ELSE'
      '     TRIM(l.cep_emp)'
      'END CEP,'
      ''
      'TRIM(l.cidade_emp) CIDADE,'
      'l.empresa CODIGO_FILIAL,'
      'TRIM(l.complement_emp) COMPLEMENTO,'
      'l.data_criacao_emp DATA_ABERTURA,'
      'NULL DATA_FECHAMENTO,'
      'NULL DDD1,'
      'NULL DDD2,'
      'TRIM(l.email_emp) EMAIL,'
      'TRIM(L.endereco_emp) ENDERECO,'
      ''
      'l.estado_emp ESTADO,'
      '0 LATITUDE,'
      '0 LONGITUDE,'
      'TRIM(l.nome_emp) NOME,'
      'TRIM(l.nome_emp) NOME_REDUZIDO,'
      'TRIM(l.num_emp) NUMERO,'
      #39'BRASIL'#39' PAIS,'
      'TRIM(l.razao_emp) RAZAO_SOCIAL,'
      'NULL REDE_LOJA,'
      ''
      'CASE'
      '   WHEN UPPER(TRIM(l.cidade_emp))='#39'PORTO ALEGRE'#39' THEN'
      '      CASE'
      '        WHEN ((UPPER(TRIM(l.bairro_emp))='#39'PASSO DAREIA'#39')'
      '              OR'
      '              (UPPER(TRIM(l.bairro_emp))='#39'PASSO DA AREIA'#39')) THEN'
      '            '#39'Regi'#227'o 2 | Zona Norte de Porto Alegre'#39
      '        ELSE'
      '            '#39'Regi'#227'o 1 | Regi'#227'o Central de Porto Alegre'#39
      '      END'
      '   ELSE'
      '      UPPER(TRIM(l.cidade_emp))'
      'END REGIAO,'
      ''
      'NULL TELEFONE_1,'
      'NULL TELEFONE_2,'
      ''
      'CASE'
      '   WHEN POSITION('#39'Shopping'#39', l.nome_emp)<>0 Then'
      '     '#39'SHOPPING'#39
      '   ELSE'
      '    '#39'RUA'#39
      'END TIPO_LOJA'
      ''
      'FROM LINXLOJAS l')
    SQLConnection = SQLC
    Left = 72
    Top = 216
    object SQLQ_EmpresasAREA_LOJA: TIntegerField
      FieldName = 'AREA_LOJA'
    end
    object SQLQ_EmpresasATIVA: TStringField
      FieldName = 'ATIVA'
      Required = True
      FixedChar = True
      Size = 3
    end
    object SQLQ_EmpresasBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 50
    end
    object SQLQ_EmpresasCANAL: TStringField
      FieldName = 'CANAL'
      Required = True
      FixedChar = True
      Size = 38
    end
    object SQLQ_EmpresasCEP: TStringField
      FieldName = 'CEP'
      Size = 19
    end
    object SQLQ_EmpresasCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object SQLQ_EmpresasCODIGO_FILIAL: TIntegerField
      FieldName = 'CODIGO_FILIAL'
    end
    object SQLQ_EmpresasCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 60
    end
    object SQLQ_EmpresasDATA_ABERTURA: TSQLTimeStampField
      FieldName = 'DATA_ABERTURA'
    end
    object SQLQ_EmpresasDATA_FECHAMENTO: TStringField
      FieldName = 'DATA_FECHAMENTO'
      FixedChar = True
      Size = 1
    end
    object SQLQ_EmpresasDDD1: TStringField
      FieldName = 'DDD1'
      FixedChar = True
      Size = 1
    end
    object SQLQ_EmpresasDDD2: TStringField
      FieldName = 'DDD2'
      FixedChar = True
      Size = 1
    end
    object SQLQ_EmpresasEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object SQLQ_EmpresasENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 250
    end
    object SQLQ_EmpresasESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object SQLQ_EmpresasLATITUDE: TIntegerField
      FieldName = 'LATITUDE'
      Required = True
    end
    object SQLQ_EmpresasLONGITUDE: TIntegerField
      FieldName = 'LONGITUDE'
      Required = True
    end
    object SQLQ_EmpresasNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object SQLQ_EmpresasNOME_REDUZIDO: TStringField
      FieldName = 'NOME_REDUZIDO'
      Size = 50
    end
    object SQLQ_EmpresasNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 11
    end
    object SQLQ_EmpresasPAIS: TStringField
      FieldName = 'PAIS'
      Required = True
      FixedChar = True
      Size = 6
    end
    object SQLQ_EmpresasRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 50
    end
    object SQLQ_EmpresasREDE_LOJA: TStringField
      FieldName = 'REDE_LOJA'
      FixedChar = True
      Size = 1
    end
    object SQLQ_EmpresasREGIAO: TStringField
      FieldName = 'REGIAO'
      Size = 50
    end
    object SQLQ_EmpresasTELEFONE_1: TStringField
      FieldName = 'TELEFONE_1'
      FixedChar = True
      Size = 1
    end
    object SQLQ_EmpresasTELEFONE_2: TStringField
      FieldName = 'TELEFONE_2'
      FixedChar = True
      Size = 1
    end
    object SQLQ_EmpresasTIPO_LOJA: TStringField
      FieldName = 'TIPO_LOJA'
      Required = True
      FixedChar = True
      Size = 8
    end
  end
  object SQLQ_Fornecedores: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        '----------------------------------------------------------------' +
        '----------------'
      '-- FORNECEDORES'
      
        '----------------------------------------------------------------' +
        '----------------'
      'SELECT'
      'TRIM(fo.cidade_cliente) CIDADE,'
      'fo.cod_cliente CODIGO,'
      'fo.data_cadastro DATA_CADASTRO,'
      ''
      'UPPER(CASE'
      '   WHEN (COALESCE(fo.razao_cliente,'#39#39')<>'#39#39') THEN'
      '     TRIM(fo.razao_cliente)'
      '   WHEN (COALESCE(fo.nome_cliente,'#39#39')<>'#39#39') THEN'
      '     TRIM(fo.nome_cliente)'
      '   ELSE'
      '     '#39'FORNECEDOR SEM NOME'#39
      'END) NOME,'
      ''
      'CASE'
      '  WHEN UPPER(TRIM(COALESCE(fo.ativo,'#39'N'#39')))='#39'S'#39' Then'
      '    '#39'A'#39
      '  ELSE'
      '    '#39'N'#39
      'END STATUS,'
      ''
      'fo.uf_cliente UF'
      ''
      'FROM LINXCLIENTESFORNEC fo'
      ''
      'WHERE ((fo.tipo_cadastro='#39'F'#39') OR (fo.tipo_cadastro='#39'A'#39'))')
    SQLConnection = SQLC
    Left = 72
    Top = 265
    object SQLQ_FornecedoresCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object SQLQ_FornecedoresCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object SQLQ_FornecedoresDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object SQLQ_FornecedoresNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object SQLQ_FornecedoresSTATUS: TStringField
      FieldName = 'STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object SQLQ_FornecedoresUF: TStringField
      FieldName = 'UF'
    end
  end
  object SQLQ_Produtos: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        '----------------------------------------------------------------' +
        '----------------'
      '-- PRODUTOS'
      
        '----------------------------------------------------------------' +
        '----------------'
      'SELECT '
      'pr.cod_produto CODIGO,'
      'pr.desc_colecao COLECAO,'
      'pr.cod_fornecedor FORNECEDOR,'
      ''
      'pr.desc_classificacao GRADE,'
      'NULL GRIFE,'
      'pr.desc_setor GRUPO,'
      'pr.desc_linha LINHA,'
      'pr.desc_marca MARCA,'
      'pr.nome NOME,'
      'NULL SEXO,'
      'NULL SUBGRUPO,'
      '0.00 ULTIMO_CUSTO,'
      'NULL URL_IMAGEM'
      ''
      'FROM LINXPRODUTOS pr'
      ''
      '')
    SQLConnection = SQLC
    Left = 72
    Top = 319
    object SQLQ_ProdutosCODIGO: TFMTBCDField
      FieldName = 'CODIGO'
      Precision = 15
      Size = 0
    end
    object SQLQ_ProdutosCOLECAO: TStringField
      FieldName = 'COLECAO'
      Size = 50
    end
    object SQLQ_ProdutosFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
    end
    object SQLQ_ProdutosGRADE: TStringField
      FieldName = 'GRADE'
      Size = 50
    end
    object SQLQ_ProdutosGRIFE: TStringField
      FieldName = 'GRIFE'
      FixedChar = True
      Size = 1
    end
    object SQLQ_ProdutosGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 30
    end
    object SQLQ_ProdutosLINHA: TStringField
      FieldName = 'LINHA'
      Size = 30
    end
    object SQLQ_ProdutosMARCA: TStringField
      FieldName = 'MARCA'
      Size = 30
    end
    object SQLQ_ProdutosNOME: TStringField
      FieldName = 'NOME'
      Size = 250
    end
    object SQLQ_ProdutosSEXO: TStringField
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object SQLQ_ProdutosSUBGRUPO: TStringField
      FieldName = 'SUBGRUPO'
      FixedChar = True
      Size = 1
    end
    object SQLQ_ProdutosULTIMO_CUSTO: TFMTBCDField
      FieldName = 'ULTIMO_CUSTO'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLQ_ProdutosURL_IMAGEM: TStringField
      FieldName = 'URL_IMAGEM'
      FixedChar = True
      Size = 1
    end
  end
  object SQLQ_Vendedores: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        '----------------------------------------------------------------' +
        '----------------'
      '-- VENDEDORES'
      
        '----------------------------------------------------------------' +
        '----------------'
      'SELECT'
      'v.end_vend_cidade CIDADE,'
      'v.cod_vendedor CODIGO,'
      'v.empresa CODIGO_EMPRESA,'
      'v.data_admissao DATA_CADASTRO,'
      'v.nome_vendedor NOME,'
      ''
      'CASE'
      '  WHEN TRIM(v.ativo)='#39'S'#39' THEN'
      '    '#39'A'#39
      '  WHEN TRIM(v.ativo)='#39'N'#39' THEN'
      '    '#39'I'#39
      '  ELSE'
      '    NULL'
      'END STATUS,'
      ''
      'v.end_vend_uf UF'
      ''
      'FROM LINXVENDEDORES v'
      'WHERE v.tipo_vendedor in ('#39'V'#39','#39'A'#39')')
    SQLConnection = SQLC
    Left = 72
    Top = 375
    object SQLQ_VendedoresCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object SQLQ_VendedoresCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object SQLQ_VendedoresCODIGO_EMPRESA: TIntegerField
      FieldName = 'CODIGO_EMPRESA'
    end
    object SQLQ_VendedoresDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
    end
    object SQLQ_VendedoresNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object SQLQ_VendedoresSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object SQLQ_VendedoresUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
  end
  object SQLQ_Estoques: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        '----------------------------------------------------------------' +
        '----------------'
      '-- ESTOQUES'
      
        '----------------------------------------------------------------' +
        '----------------'
      'select'
      'd.empresa CODIGO_EMPRESA,'
      'd.cod_produto CODIGO_PRODUTO,'
      
        'current_timestamp DATA_PRIMEIRA_ENTRADA, /* Busca DATA_PRIMEIRA_' +
        'ENTRADA */'
      
        'current_timestamp DATA_ULTIMA_ENTRADA,  /* Busca DATA_ULTIMA_ENT' +
        'RADA */'
      
        'current_timestamp DATA_ULTIMA_SAIDA,  /* Busca DATA_ULTIMA_SAIDA' +
        ' */'
      'CAST(d.quantidade AS INTEGER) QUANTIDADE,'
      'd.custo_medio ULTIMO_CUSTO'
      ''
      'FROM LINXPRODUTOSDETALHES d')
    SQLConnection = SQLC
    Left = 72
    Top = 431
    object SQLQ_EstoquesCODIGO_EMPRESA: TIntegerField
      FieldName = 'CODIGO_EMPRESA'
    end
    object SQLQ_EstoquesCODIGO_PRODUTO: TFMTBCDField
      FieldName = 'CODIGO_PRODUTO'
      Precision = 15
      Size = 0
    end
    object SQLQ_EstoquesDATA_PRIMEIRA_ENTRADA: TSQLTimeStampField
      FieldName = 'DATA_PRIMEIRA_ENTRADA'
      Required = True
    end
    object SQLQ_EstoquesDATA_ULTIMA_ENTRADA: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_ENTRADA'
      Required = True
    end
    object SQLQ_EstoquesDATA_ULTIMA_SAIDA: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_SAIDA'
      Required = True
    end
    object SQLQ_EstoquesQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
    object SQLQ_EstoquesULTIMO_CUSTO: TFMTBCDField
      FieldName = 'ULTIMO_CUSTO'
      Precision = 15
      Size = 4
    end
  end
  object SQLQ_Busca: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 128
    Top = 31
  end
  object SQLQ_ProdEntrada: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        '----------------------------------------------------------------' +
        '----------------'
      '-- PRODUTOS - Entradas'
      
        '----------------------------------------------------------------' +
        '----------------'
      'SELECT'
      'me.empresa, me.cod_produto,'
      
        'MIN(me.data_lancamento) Primeria, MAX(me.data_lancamento) Ultima' +
        '--, '#39'E'#39' Tipo'
      'FROM LINXMOVIMENTO me'
      'WHERE me.operacao='#39'E'#39
      
        'AND ((COALESCE(me.tipo_transacao,'#39#39')='#39#39') OR (me.tipo_transacao='#39 +
        'E'#39')) -- Entradas de Mercadorias'
      'AND   me.cancelado='#39'N'#39
      'AND   me.excluido='#39'N'#39
      'GROUP BY 1,2')
    SQLConnection = SQLC
    Left = 176
    Top = 431
    object SQLQ_ProdEntradaEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object SQLQ_ProdEntradaCOD_PRODUTO: TFMTBCDField
      FieldName = 'COD_PRODUTO'
      Precision = 15
      Size = 0
    end
    object SQLQ_ProdEntradaPRIMERIA: TSQLTimeStampField
      FieldName = 'PRIMERIA'
    end
    object SQLQ_ProdEntradaULTIMA: TSQLTimeStampField
      FieldName = 'ULTIMA'
    end
  end
  object SQLQ_ProdVendas: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        '----------------------------------------------------------------' +
        '----------------'
      '-- PRODUTOS - Vendas'
      
        '----------------------------------------------------------------' +
        '----------------'
      'SELECT'
      'mv.empresa, mv.cod_produto,'
      
        'MIN(mv.data_lancamento) Primeria, MAX(mv.data_lancamento) Ultima' +
        '--, '#39'V'#39' Tipo'
      'FROM LINXMOVIMENTO mv'
      'WHERE mv.operacao='#39'S'#39
      
        'AND (((mv.tipo_transacao='#39'V'#39') OR (COALESCE(mv.tipo_transacao,'#39#39')' +
        '='#39#39'))) -- Vendas'
      'AND   mv.cancelado='#39'N'#39
      'AND   mv.excluido='#39'N'#39
      'AND   mv.cod_produto=1'
      ''
      'GROUP BY 1,2'
      ''
      '')
    SQLConnection = SQLC
    Left = 288
    Top = 431
    object SQLQ_ProdVendasEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object SQLQ_ProdVendasCOD_PRODUTO: TFMTBCDField
      FieldName = 'COD_PRODUTO'
      Precision = 15
      Size = 0
    end
    object SQLQ_ProdVendasPRIMERIA: TSQLTimeStampField
      FieldName = 'PRIMERIA'
    end
    object SQLQ_ProdVendasULTIMA: TSQLTimeStampField
      FieldName = 'ULTIMA'
    end
  end
end
