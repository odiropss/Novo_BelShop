-- 01 - CADASTRO DE PRODUTOS ========================================================
-- NOME DO ARQUIVO: ACC_CADPROD_20180601.TXT ===================================

-- REGISTRO "V" VALORES ========================================================
SELECT
1 Ordem, -- 1
'V' TR, -- 2 TIPO DE REGISTRO
REPLACE(REPLACE(REPLACE(COALESCE(fo.fcnpj_cic,'99999999999999'), '/', ''),'.',''),'-','') COD_FORNECEDOR, -- 3 Codigo (CNPJ) Fornecedor
SUBSTRING(TRIM(Fo.fnome) FROM 1 FOR 60) DES_FORNECEDOR, -- 4 Nome Fornecedor
pr.codigo COD_PRODUTO,  -- 5 Codigo Produto
SUBSTRING(TRIM(pr.descricao) FROM 1 FOR 60) DES_PRODUTO,  -- 6 Descricao Produto
gr.codigo COD_GRUPO,  -- 7 Codigo grupo
SUBSTRING(TRIM(gr.descricao) FROM 1 FOR 60) DES_GRUPO, -- 8 Descricao grupo
NULL COD_FAMILIA, -- 9 Codigo Familia
NULL DES_FAMILIA, -- 10 Descricao Familia
NULL COD_SUBFAMILIA, -- 11 Codigo SubFamilia
NULL DES_SUBFAMILIA,  -- 12 Descricao SubFamilia
'E' TIPO_CODBARRAS, -- 13 Tipo do Codigo de Barras (EAN)

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

'CAIXA' TIPO_EMBALAGEM, -- 15 Tipo de Embalagem de Venda (=====>> VER)
'UN' UNI_PRODUTO, -- 16 Unidade do Produto
'1000' VOLUMA_EMB_VENDA, -- 17 Volume da Embalagem de Venda (=====>> VER)

CASE
  WHEN pr.prativo='S' THEN
    'A'
  ELSE
    'I'
END STATUS_PRODUTO, -- 18 Status do Produto

CAST(EXTRACT(YEAR FROM pr.data_inclusao) AS VARCHAR(4))||
CAST(LPAD(EXTRACT(MONTH FROM pr.data_inclusao),2,'0') AS VARCHAR(2))||
CAST(LPAD(EXTRACT(DAY FROM pr.data_inclusao),2,'0') AS VARCHAR(2)) DTA_CADASTRO -- 19 Data do Cadastro

FROM ACEC1101 pr -- Cadastro de Produto
   LEFT JOIN AUGC0501 fo ON fo.fcod=pr.cod_fornecedor -- Cadastro de Fornecedores
   LEFT JOIN ACEC1201 gr ON gr.codigo=pr.grupo -- Cadastro de Grupos de Produtos
   LEFT JOIN AUGM2101 cf ON cf.produto=pr.codigo -- Cadastro de Fornecedores e Produtos

WHERE pr.codigo<>'000001' -- Produto de Teste
AND   pr.cod_fornecedor='00246' -- Somente Loreal

UNION

-- REGISTRO "H" CABECALHO ======================================================
SELECT
0, -- 1
'H', -- 2

(SELECT CAST(REPLACE(REPLACE(REPLACE(COALESCE(d.ciccgc,'99999999999999'),
                  '/', ''),'.',''),'-','') AS VARCHAR(18))
 FROM ea d), -- 3 CNPJ da Distribuidora

CAST(EXTRACT(YEAR from current_timestamp) AS VARCHAR(4))||
CAST(LPAD(EXTRACT(MONTH FROM current_timestamp),2,'0') AS VARCHAR(2))||
CAST(LPAD(EXTRACT(DAY FROM current_timestamp),2,'0') AS VARCHAR(2)), -- 4 Data da Geração do Arquivo

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
NULL  -- 19

FROM RDB$DATABASE

UNION

-- REGISTRO "E" FIM ============================================================
SELECT
2, -- 1
'E', -- 2
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
NULL  -- 19

FROM RDB$DATABASE

ORDER BY 1,6
