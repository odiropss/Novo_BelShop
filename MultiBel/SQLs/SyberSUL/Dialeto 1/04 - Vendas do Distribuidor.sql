-- 04 - CADASTRO DE VENDAS DO DISTRIBUIDOR ==========================================
-- NOME DO ARQUIVO: ACC_SELLOUT_20180601.TXT ===================================

/*
=== SQL - BUSBA CODIGO E NOME DA EMPRESA
SELECT d.codigo, d.nome FROM ea d
CODIGO    NOME
01    MULTIBEL DISTRIB. COSMETICOS LTDA
*/
SELECT
1 ORDEM, -- 1 ORDEM
'V' TR, -- 2
(SELECT CAST(REPLACE(REPLACE(REPLACE(COALESCE(d.ciccgc,'99999999999999'), '/', ''),'.',''),'-','') as VARCHAR(18))
 FROM ea d) COD_LOJA, -- 3 CNPJ da Distribuidora

CAST(REPLACE(REPLACE(REPLACE(COALESCE(fo.fcnpj_cic,'99999999999999'), '/', ''),'.',''),'-','') as VARCHAR(18)) CNPJ_FORN, -- 4 CNPJ do Fornecedor
 /*
CASE
  WHEN pr.outro_codigo=NULL THEN
    pr.codigo
  ELSE
    pr.outro_codigo
END COD_BARRAS, -- 5 Codigo de Barras
*/

CASE
  WHEN COALESCE(pr.outro_codigo,'')<>'' THEN
    pr.outro_codigo
  WHEN COALESCE(cf.ficodigo_barras,'')<>'' THEN
    cf.ficodigo_barras
  WHEN COALESCE(cf.ficodigofornecedor,'')<>'' THEN
    cf.ficodigofornecedor
  ELSE
    pr.codigo
END COD_BARRAS, -- 14 Codigo de Barras

NULL LOTE, -- 6 Lote
NULL LOTE_VALIDADE, -- 7 Lote Validade

CAST(SUM(COALESCE(it.qunatidadeproduto,0) * 1000) AS INTEGER) QUANTIDADE, -- 8 Quantidade de Venda Atendida
SUM(COALESCE(it.meitvalorbrutoitem,0) + COALESCE(it.meitfreterateado,0)) * 100  VALOR_TRANSACAO, -- 9 Valor Final da Tansação
'BRL' MOEDA, -- 10 Moeda
nt.documento DOCUMENTO, -- 11 Identificação da Transação

CAST(EXTRACT(YEAR FROM nt.data) AS VARCHAR(4))||
CAST(LPAD(EXTRACT(MONTH FROM nt.data),2,'0') AS VARCHAR(2))||
CAST(LPAD(EXTRACT(DAY FROM nt.data),2,'0') AS VARCHAR(2)) DTA_DOCUMENTO, -- 12 Data da Emissão do Documento

CASE
  WHEN UPPER(op.tipo_op)='D' THEN
    'DV'
  ELSE
    'V'
END TIPO_TRANSACAO, -- 13 Tipo de Transação

CAST(CAST(COALESCE(op.cod_natureza,0) AS INTEGER) AS VARCHAR(4)) CFOP, -- 14 CFop

CASE
   WHEN CHAR_LENGTH(TRIM(CAST(REPLACE(REPLACE(REPLACE(COALESCE(cl.cgc_cnpj,'99999999999999'),
                       '/', ''),'.',''),'-','') AS VARCHAR(18))))<12 Then
     1
   ELSE
     2
END  TIPO_IDENT_PDV, -- 15 Tipo Identificador PDV

TRIM(CAST(REPLACE(REPLACE(REPLACE(COALESCE(cl.cgc_cnpj,'99999999999999'),
                       '/', ''),'.',''),'-','') AS VARCHAR(18))) IDENTIFICADOR_PDV, -- 16 Identificador do PDV

SUBSTRING(TRIM(cl.nome) FROM 1 FOR 60) DESCRICAO_PDV, -- 17 Descrição do PDV
TRIM(REPLACE(REPLACE(REPLACE(COALESCE(cl.cep,'99999999'), '/', ''),'.',''),'-','')) CEP_PDV, -- 18 CEP do PDV

'N1' CLASSIFICACAO_PDV, -- 19 Classificaçção do PDV

CASE
    WHEN TRIM(COALESCE(vd.fnome,''))='' THEN
      'MULTIBEL DISTRIB. COSMETICOS LTDA-MULTIBEL DISTRIB. COSMETICOS LTDA' -->> SQL - BUSBA CODIGO E NOME DA EMPRESA
    ELSE
      nt.vendedor_doc||'-'||TRIM(vd.fnome)
END NOME_VENDEDOR, -- 20 Nome do Vendedor

NULL CAMPO_LIVRE_1, -- 21 Campo Livre 1
NULL CAMPO_LIVRE_2  -- 22 Campo Livre 2

FROM ACEM1401 nt -- Movimento de Notas Fiscais
    -- Produtos das Notas Fiscais ------------------------------------
    LEFT JOIN ACEM14IT it  ON it.documento=nt.documento
                          AND it.serie=nt.serie_doc
                          AND it.cod_op=nt.operacao_doc
                          AND it.cod_cli=nt.cod_cli
    -- Cadastro de Produto ----------------------------------
    LEFT JOIN ACEC1101 pr  ON pr.codigo=it.codigoproduto
    -- Cadastro de Fornecedores------------------------------
    LEFT JOIN AUGC0501 fo  ON fo.fcod=pr.cod_fornecedor
    -- Cadastro de Vendedores/Outros ------------------------
    LEFT JOIN AUGC0501 vd  ON vd.fcod=nt.vendedor_doc
    -- Cadastro de Operacoes e Cfops ------------------------
    LEFT JOIN AFVC0901 op  ON op.cod_op=it.cod_op
    -- Cadastro de Clientes ---------------------------------
    LEFT JOIN AUGC0301 cl  ON cl.codigo_cliente=nt.cod_cli
    -- Cadastro de Fornecedores e Produtos
    LEFT JOIN AUGM2101 cf ON cf.produto=pr.codigo

WHERE NOT (nt.operacao_doc='00000' AND nt.operacaop='05000') -- Pedencia Não
AND   CAST(nt.data as DATE)>=current_timestamp-31
AND   CAST(nt.data as DATE)<=current_timestamp-1
AND   (
       ((UPPER(TRIM(op.desc_op_nf)) LIKE '%VENDA%') AND (UPPER(nt.entrada_saida)='S'))
       OR
       ((UPPER(TRIM(op.desc_op_nf)) LIKE '%DEVOL%VENDA%') AND (UPPER(nt.entrada_saida)='E'))
       )
AND   fo.fcod='00246' -- Somente Loreal
AND   it.valor_unitarioproduto IS NOT NULL
--AND  nt.documento='000922'

GROUP BY 3,4,5,11,12,13,14,15,16,17,18,20

UNION

-- NOTAS FISCAIS CANCELADAS ====================================================
-- CADASTRO DE VENDAS DO DISTRIBUIDOR ==========================================
-- NOME DO ARQUIVO: ACC_SELLOUT_AAAAMMDD.TXT ===================================

SELECT
1 ORDEM, -- 1 ORDEM
'V' TR, -- 2
(SELECT CAST(REPLACE(REPLACE(REPLACE(COALESCE(d.ciccgc,'99999999999999'), '/', ''),'.',''),'-','') AS VARCHAR(18))
 FROM ea d) COD_LOJA, -- 3 CNPJ da Distribuidora

CAST(REPLACE(REPLACE(REPLACE(COALESCE(fo.fcnpj_cic,'99999999999999'), '/', ''),'.',''),'-','') AS VARCHAR(18)) CNPJ_FORN, -- 4 CNPJ do Fornecedor

/*
CASE
  WHEN pr.outro_codigo=NULL THEN
    pr.codigo
  ELSE
    pr.outro_codigo
END COD_BARRAS, -- 5 Codigo de Barras
*/

CASE
  WHEN COALESCE(pr.outro_codigo,'')<>'' THEN
    pr.outro_codigo
  WHEN COALESCE(cf.ficodigo_barras,'')<>'' THEN
    cf.ficodigo_barras
  WHEN COALESCE(cf.ficodigofornecedor,'')<>'' THEN
    cf.ficodigofornecedor
  ELSE
    pr.codigo
END COD_BARRAS, -- 14 Codigo de Barras

NULL LOTE, -- 6 Lote
NULL LOTE_VALIDADE, -- 7 Lote Validade

CAST(SUM(COALESCE(it.qunatidadeproduto,0) * 1000) AS INTEGER) QUANTIDADE, -- 8 Quantidade de Venda Atendida
SUM(COALESCE(it.meitvalorbrutoitem,0) + COALESCE(it.meitfreterateado,0)) * 100  VALOR_TRANSACAO, -- 9 Valor Final da Tansação
'BRL' MOEDA, -- 10 Moeda
nt.documento DOCUMENTO, -- 11 Identificação da Transação

CAST(EXTRACT(YEAR FROM nt.data) AS VARCHAR(4))||
CAST(LPAD(EXTRACT(MONTH FROM nt.data),2,'0') AS VARCHAR(2))||
CAST(LPAD(EXTRACT(DAY FROM nt.data),2,'0') AS VARCHAR(2)) DTA_DOCUMENTO, -- 12 Data da Emissão do Documento

'C', -- 13 Tipo de Transação

CAST(CAST(COALESCE(op.cod_natureza,0) AS INTEGER) AS VARCHAR(4)) CFOP, -- 14 CFop

CASE
   WHEN CHAR_LENGTH(TRIM(CAST(REPLACE(REPLACE(REPLACE(COALESCE(cl.cgc_cnpj,'99999999999999'),
                       '/', ''),'.',''),'-','') AS VARCHAR(18))))<12 Then
     1
   ELSE
     2
END  TIPO_IDENT_PDV, -- 15 Tipo Identificador PDV

TRIM(CAST(REPLACE(REPLACE(REPLACE(COALESCE(cl.cgc_cnpj,'99999999999999'),
                       '/', ''),'.',''),'-','') AS VARCHAR(18))) IDENTIFICADOR_PDV, -- 16 Identificador do PDV

SUBSTRING(TRIM(cl.nome) FROM 1 FOR 60) DESCRICAO_PDV, -- 17 Descrição do PDV
TRIM(REPLACE(REPLACE(REPLACE(COALESCE(cl.cep,'99999999'), '/', ''),'.',''),'-','')) CEP_PDV, -- 18 CEP do PDV

'N1' CLASSIFICACAO_PDV, -- 19 Classificaçção do PDV

CASE
    WHEN TRIM(COALESCE(vd.fnome,''))='' THEN
      'MULTIBEL DISTRIB. COSMETICOS LTDA-MULTIBEL DISTRIB. COSMETICOS LTDA' -->> BUSCAR ANTERIORMENTE
    ELSE
      nt.vendedor_doc||'-'||TRIM(vd.fnome)
END NOME_VENDEDOR, -- 20 Nome do Vendedor

NULL CAMPO_LIVRE_1, -- 21 Campo Livre 1
NULL CAMPO_LIVRE_2  -- 22 Campo Livre 2

FROM ACEM1401 nt -- notas
    -- Produtos da Nota ------------------------------------
    LEFT JOIN ACEM14IT it  ON it.documento=nt.documento
                          AND it.serie=nt.serie_doc
                          AND it.cod_op=nt.operacao_doc
                          AND it.cod_cli=nt.cod_cli
    -- Cadastro de Produto ----------------------------------
    LEFT JOIN ACEC1101 pr  ON pr.codigo=it.codigoproduto
    -- Cadastro de Fornecedores -----------------------------
    LEFT JOIN AUGC0501 fo  ON fo.fcod=pr.cod_fornecedor
    -- Cadastro de vendedores------------------------------
    LEFT JOIN AUGC0501 vd  ON vd.fcod=nt.vendedor_doc
    -- Operacoes e Cfops ------------------------------------
    LEFT JOIN AFVC0901 op  ON op.cod_op=it.cod_op
    -- Cadstro de Clientes ----------------------------------
    LEFT JOIN AUGC0301 cl  ON cl.codigo_cliente=nt.cod_cli
    -- Cadastro de Fornecedores e Produtos
    LEFT JOIN AUGM2101 cf ON cf.produto=pr.codigo

WHERE NOT (nt.operacao_doc='00000' AND nt.operacaop='05000') -- Pedencia Não
AND   CAST(nt.data as DATE)>=current_timestamp-31
AND   CAST(nt.data as DATE)<=current_timestamp-1
AND   ((UPPER(TRIM(op.desc_op_nf)) LIKE '%VENDA%') AND (UPPER(nt.entrada_saida)='S'))
AND   ((nt.menfemotivocancelamento IS NOT NULL) OR (UPPER(COALESCE(nt.operacaop, ''))='CA'))
AND   fo.fcod='00246' -- Somente Loreal
AND   it.valor_unitarioproduto IS NOT NULL
--AND  nt.documento='000922'

GROUP BY 3,4,5,11,12,13,14,15,16,17,18,20

UNION

-- REGISTRO "H" CABECALHO ======================================================
SELECT
0, -- 1 ORDEM
'H', -- 2 Tipo de registro
CAST(REPLACE(REPLACE(REPLACE(COALESCE(c.ciccgc,'99999999999999'),
     '/', ''),'.',''),'-','') AS VARCHAR(18)), -- 3 CNPJ da Distribuidora

CAST(EXTRACT(YEAR FROM current_timestamp) AS VARCHAR(4))||
CAST(LPAD(EXTRACT(MONTH FROM current_timestamp),2,'0') AS VARCHAR(2))||
CAST(LPAD(EXTRACT(DAY FROM current_timestamp),2,'0') AS VARCHAR(2)),  -- 4 Data Inicial dos Registro Apresentados

CAST(EXTRACT(YEAR FROM current_timestamp) AS VARCHAR(4))||
CAST(LPAD(EXTRACT(MONTH FROM current_timestamp),2,'0') AS VARCHAR(2))||
CAST(LPAD(EXTRACT(DAY FROM current_timestamp),2,'0') AS VARCHAR(2)),  -- 5 Data Final dos Registro Apresentados

NULL, -- 6
NULL, -- 7
NULL, -- 8
NULL, -- 9
NULL, -- 10
NULL, -- 11
NULL, -- 12
NULL, -- 13
NULL, -- 14
NULL, -- 15
NULL, -- 16
NULL, -- 17
NULL, -- 18
NULL, -- 19
NULL, -- 20
NULL, -- 21
NULL --  22

FROM EA c

UNION

-- REGISTRO "E" FIM ============================================================
SELECT
2, -- 1 ORDEM
'E', -- 2 Tipo de registro
NULL, -- 3
NULL, -- 4
NULL, -- 5
NULL, -- 6
NULL, -- 7
NULL, -- 8
NULL, -- 9
NULL, -- 10
NULL, -- 11
NULL, -- 12
NULL, -- 13
NULL, -- 14
NULL, -- 15
NULL, -- 16
NULL, -- 17
NULL, -- 18
NULL, -- 19
NULL, -- 20
NULL, -- 21
NULL --  22

FROM RDB$DATABASE


ORDER BY 1,2,3,11,10
