-- 03 - CADASTRO DE ESTOQUES ========================================================
-- NOME DO ARQUIVO: ACC_POSESTQ_20180601.TXT ===================================

-- REGISTRO "V" VALORES ========================================================
SELECT
1 ORDEM, -- 1 Ordem
'V' TR, -- 2 Tipo de Registro
(SELECT CAST(REPLACE(REPLACE(REPLACE(COALESCE(d.ciccgc,'99999999999999'), '/', ''),'.',''),'-','') as VARCHAR(18))
 FROM ea d) COD_CDLOJA, -- 3 CNPJ da Distribuidora

CAST(REPLACE(REPLACE(REPLACE(COALESCE(fo.fcnpj_cic,'99999999999999'),
     '/', ''),'.',''),'-','') AS VARCHAR(18)) COD_FORNECEDOR, -- 4 Codigo (CNPJ) Fornecedor

CASE
  WHEN COALESCE(pr.outro_codigo,'')<>'' THEN
    pr.outro_codigo
  WHEN COALESCE(cf.ficodigo_barras,'')<>'' THEN
    cf.ficodigo_barras
  WHEN COALESCE(cf.ficodigofornecedor,'')<>'' THEN
    cf.ficodigofornecedor
  ELSE
    pr.codigo
END COD_BARRAS, -- 5 Codigo de Barras

NULL LOTE, --6 Numero do Lote
NULL LOTE_VALIDADE, -- 7 Validadedo Lote

(CAST(CASE
      WHEN pr.estoque<0.000 THEN
        0
      ELSE
        pr.estoque
    END
AS INTEGER) * 1000) QUANTIDADE,  -- 8 Estoque (Estoque Negativo Aparesentar com estoque 0 <Zero>)

'H' TIPO_ESTOQUE, -- 9 Tipo do Estoque

CAST(EXTRACT(YEAR FROM CURRENT_DATE) AS VARCHAR(4))||
CAST(LPAD(EXTRACT(MONTH FROM CURRENT_DATE),2,'0') AS VARCHAR(2))||
CAST(LPAD(EXTRACT(DAY FROM CURRENT_DATE),2,'0') AS VARCHAR(2)) DTA_ESTOQUE -- 10 Data da Posicao de Estoque

FROM ACEC1101 pr -- Cadastro de Produto
   LEFT JOIN AUGC0501 fo ON fo.fcod=pr.cod_fornecedor -- Cadastro de Fornecedores
   LEFT JOIN AUGM2101 cf ON cf.produto=pr.codigo -- Cadastro de Fornecedores e Produtos


WHERE pr.codigo<>'000001' -- Produto de Teste
AND   ((pr.prativo='S') OR (pr.prativo='N' AND pr.estoque>0)) -- Inativos Somente com Estoque
AND   pr.cod_fornecedor='00246' -- Somente Loreal

UNION

-- REGISTRO "H" CABECALHO ======================================================
SELECT
0, -- 1 ORDEM
'H', -- 2 Tipo de registro
CAST(REPLACE(REPLACE(REPLACE(COALESCE(C.CICCGC,'99999999999999'),
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
NULL -- 10

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
NULL -- 10

FROM RDB$DATABASE
