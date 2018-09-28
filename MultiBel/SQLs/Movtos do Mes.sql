SELECT
CAST(LPAD(EXTRACT(MONTH FROM nt.data),2,'0') AS VARCHAR(2)) Mes,

CASE
  WHEN COALESCE(pr.outro_codigo,'')<>'' THEN
    pr.outro_codigo
  ELSE
    pr.codigo
END COD_BARRAS, -- 1

pr.codigo COD_PRODUTO, -- 2

CAST(SUM(COALESCE(it.qunatidadeproduto,0)) AS INTEGER) QUANTIDADE, -- 3 Quantidade de Venda Atendida

SUM(COALESCE(it.valor_total_unit,0))  VALOR_TRANSACAO, -- 4 Valor Final da Tansação

nt.documento DOCUMENTO, -- 5

CAST(EXTRACT(YEAR FROM nt.data) AS VARCHAR(4))||
CAST(LPAD(EXTRACT(MONTH FROM nt.data),2,'0') AS VARCHAR(2))||
CAST(LPAD(EXTRACT(DAY FROM nt.data),2,'0') AS VARCHAR(2)) DTA_DOCUMENTO, -- 6

CASE
  WHEN UPPER(op.tipo_op)='D' THEN
    'DV'
  WHEN ((nt.menfemotivocancelamento IS NOT NULL) OR (UPPER(COALESCE(nt.operacaop, ''))='CA')) Then
    'C'
  ELSE
    'V'
END TIPO_TRANSACAO, -- 7

CAST(CAST(COALESCE(op.cod_natureza,0) AS INTEGER) AS VARCHAR(4)) CFOP -- 8

FROM ACEM1401 nt -- Movimento de Notas Fiscais
    LEFT JOIN ACEM14IT it  ON it.documento=nt.documento -- Produtos das Notas Fiscais
                          AND it.serie=nt.serie_doc
                          AND it.cod_op=nt.operacao_doc
                          AND it.cod_cli=nt.cod_cli
    LEFT JOIN ACEC1101 pr  ON pr.codigo=it.codigoproduto -- Cadastro de Produto
    LEFT JOIN AUGC0501 fo  ON fo.fcod=pr.cod_fornecedor -- Cadastro de Fornecedores
    LEFT JOIN AUGC0501 vd  ON vd.fcod=nt.vendedor_doc -- Cadastro de Vendedores/Outros
    LEFT JOIN AFVC0901 op  ON op.cod_op=it.cod_op -- Cadastro de Operacoes e Cfops
    LEFT JOIN AUGC0301 cl  ON cl.codigo_cliente=nt.cod_cli -- Cadastro de Clientes

WHERE NOT (nt.operacao_doc='00000' AND nt.operacaop='05000') -- Pedencia Não

AND   CAST(nt.data as DATE)>='01.05.2018'
AND   CAST(nt.data as DATE)<='31.05.2018'


AND   (((UPPER(TRIM(op.desc_op_nf)) LIKE '%VENDA%') AND (UPPER(nt.entrada_saida)='S'))
       OR
       ((UPPER(TRIM(op.desc_op_nf)) LIKE '%DEVOL%VENDA%') AND (UPPER(nt.entrada_saida)='E')))



AND   pr.cod_fornecedor='00246' -- Somente Loreal
AND   it.valor_unitarioproduto IS NOT NULL
--AND   PR.codigo='E0243705'
--and nt.documento=1068

GROUP BY 1,2,3,6,7,8,9
