-- 02 - CADASTRO DE CDs/LOJAS =======================================================
-- NOME DO ARQUIVO: ACC_CADSITE_20180601.TXT ===================================

-- REGISTRO "V" VALORES ========================================================
SELECT
1 ORDEM, -- 1 Ordem
'V' TR, -- 2 Tipo de Registro

CAST(CAST(REPLACE(REPLACE(REPLACE(COALESCE(l.ciccgc,'99999999999999'),
     '/', ''),'.',''),'-','') AS BIGINT) AS VARCHAR(18)) COD_LOJA, -- 3 CNPJ da Distribuidora

SUBSTRING(TRIM(l.nome) FROM 1 FOR 60) DES_LOJA, -- 4 Nome Fornecedor
TRIM(l.estado) UF_LOJA, -- 5 UF
SUBSTRING(TRIM(l.cidade) FROM 1 FOR 60) CIDADE_LOJA, -- 6 Cidade
SUBSTRING(TRIM(l.bairro) FROM 1 FOR 60) BAIRRO_LOJA, -- 7 Bairro
REPLACE(REPLACE(REPLACE(COALESCE(l.cep,'99999999'), '/', ''),'.',''),'-','') CEP_LOJA, -- 8 CEP
'A' STATUS_LOJA -- 9 Status da Loja

FROM EA l

UNION

-- REGISTRO "H" CABECALHO ======================================================
SELECT
0, -- 1 Ordem
'H', -- 2 Tipo de Registro
CAST(REPLACE(REPLACE(REPLACE(COALESCE(c.ciccgc,'99999999999999'), '/', ''),'.',''),'-','') AS BIGINT), -- 3 CNPJ da Distribuidora

CAST(EXTRACT(YEAR FROM CURRENT_DATE) AS VARCHAR(4))||
CAST(LPAD(EXTRACT(MONTH FROM CURRENT_DATE),2,'0') AS VARCHAR(2))||
CAST(LPAD(EXTRACT(DAY FROM CURRENT_DATE),2,'0') AS VARCHAR(2)), -- 4 DATA DA GERAÇÃO DO ARQUIVO
NULL, -- 5
NULL, -- 6
NULL, -- 7
NULL, -- 8
NULL -- 9
FROM EA C

UNION

-- REGISTRO "E" FIM ============================================================
SELECT
2, -- 1 Ordem
'E', -- 2 Tipo de registro
NULL, -- 3
NULL, -- 4
NULL, -- 5
NULL, -- 6
NULL, -- 7
NULL, -- 8
NULL -- 9

FROM RDB$DATABASE