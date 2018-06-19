-- 06 - NOTAS FISCAIS RECEBITAS =====================================================
-- NOME DO ARQUIVO: ACC_NFS_20180601.TXT =======================================

SELECT
1 ORDEM, -- 1 ORDEM
'V' TR, -- 2

TRIM(CAST(CAST(REPLACE(REPLACE(REPLACE(COALESCE(fo.fcnpj_cic,'99999999999999'),
                       '/', ''),'.',''),'-','') AS BIGINT) AS VARCHAR(18))) COD_FORNECEDOR, -- 3 CNPJ - Codigo do Fornecedor
TRIM(CAST(CAST(nt.documento AS INTEGER) AS VARCHAR(50))) NUMERO_NF, -- 4 Numero da NF
'E' ACAO, -- 5 Ação R=Retorno E=Entregue
CAST((CAST(nt.total_doc AS NUMERIC(12,2)) * 100) AS INTEGER) VALOR,  -- 6 Valor da NF

CAST(SUM(COALESCE(it.qunatidadeproduto,0) * 1000) AS INTEGER) QUANTIDADE, -- 7 Total das Quantidade

CAST(EXTRACT(YEAR FROM nt.data) AS VARCHAR(4))||
CAST(LPAD(EXTRACT(MONTH FROM nt.data),2,'0') AS VARCHAR(2))||
CAST(LPAD(EXTRACT(DAY FROM nt.data),2,'0') AS VARCHAR(2)) DTA_ACAO, -- 8 Data da Ação Data da Entrega

CAST(EXTRACT(YEAR FROM nt.data) AS VARCHAR(4))||
CAST(LPAD(EXTRACT(MONTH FROM nt.data),2,'0') AS VARCHAR(2))||
CAST(LPAD(EXTRACT(DAY FROM nt.data),2,'0') AS VARCHAR(2)) DTA_ENTRADA -- 9 Data da Entrada no Estoque


FROM ACEM1401 nt -- Notas
    -- Produtos da Nota ------------------------------------
    LEFT JOIN ACEM14IT it  ON it.documento=nt.documento
                          AND it.serie=nt.serie_doc
                          AND it.cod_op=nt.operacao_doc
                          AND it.cod_cli=nt.cod_cli
    -- Cadastro de Produto ----------------------------------
    LEFT JOIN ACEC1101 pr  ON pr.codigo=it.codigoproduto
    -- Cadastro de Fornecedores -----------------------------
    LEFT JOIN AUGC0501 fo  ON fo.fcod=pr.cod_fornecedor
    -- Operacoes e Cfops ------------------------------------
    LEFT JOIN AFVC0901 op  ON op.cod_op=it.cod_op

WHERE NOT (nt.operacao_doc='00000' AND nt.operacaop='05000') -- Pedencia Não
AND   CAST(nt.data as DATE)>=CURRENT_DATE-31
AND   CAST(nt.data as DATE)<=CURRENT_DATE-1
AND   ((UPPER(TRIM(op.desc_op_nf)) LIKE '%COMPRA%') AND (UPPER(nt.entrada_saida)='E'))
AND   fo.fcod='00246' -- Somente Loreal
AND   it.valor_unitarioproduto IS NOT NULL

GROUP BY 3,4,5,6,8

UNION

-- REGISTRO "H" CABECALHO ======================================================
SELECT
0, -- 1 ORDEM
'H', -- 2 Tipo de registro
CAST(CAST(REPLACE(REPLACE(REPLACE(COALESCE(c.ciccgc,'99999999999999'),
     '/', ''),'.',''),'-','') AS BIGINT) AS VARCHAR(18)), -- 3 CNPJ da Distribuidora

CAST(EXTRACT(YEAR FROM CURRENT_DATE) AS VARCHAR(4))||
CAST(LPAD(EXTRACT(MONTH FROM CURRENT_DATE),2,'0') AS VARCHAR(2))||
CAST(LPAD(EXTRACT(DAY FROM CURRENT_DATE),2,'0') AS VARCHAR(2)),  -- 4 Data Inicial dos Registro Apresentados

CAST(EXTRACT(YEAR FROM CURRENT_DATE) AS VARCHAR(4))||
CAST(LPAD(EXTRACT(MONTH FROM CURRENT_DATE),2,'0') AS VARCHAR(2))||
CAST(LPAD(EXTRACT(DAY FROM CURRENT_DATE),2,'0') AS VARCHAR(2)),  -- 5 Data Final dos Registro Apresentados

NULL, -- 6
NULL, -- 7
NULL, -- 8
NULL -- 9

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
NULL -- 9

FROM RDB$DATABASE