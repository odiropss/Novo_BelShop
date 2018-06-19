-- NOTAS

SELECT
CAST(nt.data as Date) Dta_Documento, -- 1
nt.documento, -- 2
nt.serie_doc, -- 3
nt.cod_cli Codigo_destinatario, -- 4
cl.nome Nome_destinatario, -- 5
cl.cgc_cnpj Docto_Destinatario, -- 6

Case
  When UPPER(nt.operacaop)='CA' Then
    'SIM'
   Else
    'NAO'
End Nota_Cancelada, -- 7
nt.menfemotivocancelamento Motivo_Cancelamento, -- 8
op.cod_natureza, -- 9
op.desc_op_nf, -- 10
nt.memodelo,
nt.total_doc --

FROM ACEM1401 Nt -- Notas
    -- Cadastro de Clientes -------------------------
    Left Join AUGC0301 cl  on cl.codigo_cliente=nt.cod_cli

    -- Operações Fiscais e CFOPs -------------------
    Left Join AFVC0901 op  on op.cod_op=nt.operacao_doc

WHERE not (nt.operacao_doc='00000' and nt.operacaop='05000') -- Pedencia Não
AND   CAST(nt.data as DATE)>=current_date-30
AND   nt.entrada_saida='S'

--AND  nt.documento='000922'

--GROUP BY 1,2,3,4,5,6,7

order by 1,2

-- 145

--ALFM20IT
--ALFM20NF
----------------------------------------------------------------
/*
(SELECT CAST(CAST(REPLACE(REPLACE(REPLACE(COALESCE(d.ciccgc,'99999999999999'), '/', ''),'.',''),'-','')
        AS BIGINT) as VARCHAR(18))
 FROM ea d) COD_CDLOJA, --2


Case
  When pr.outro_codigo=NULL Then
    pr.codigo
  Else
    pr.outro_codigo
End COD_BARRAS, --4

NULL LOTE, --5
NULL VALIDADE_LOTE, --6

CAST(sum(it.qunatidadeproduto * 1000) AS INTEGER) QUANTIDADE, --7
SUM(IT.meitvalorbrutoitem * 100) VALOR_TRANSACAO,
'BRL' moeda,
 */

--it.codigoproduto, nt.documento, pr.descricao

--Cast(nt.data as Date) Data, nt.mevendido
--, nt.entrada_saida
--nt.operacao_doc, nt.operacaop, op.desc_op_nf, NT.cod_cli
--NT.entrada_saida, NT.*
/*
op.cod_op, op.cod_natureza,  op.desc_op_nf, op.desc_natureza, op.tipo_op, 
cf.codigo_operacao,
cf.descricao,
cf.entrada_saida,
*/
--it.codigoproduto,
--NT.entrada_saida, nt.operacao_doc, nt.operacaop,
--nt.documento, nt.cod_cli
/*
,
nt.cod_cli, cl.nome,
nt.serie_doc,
nt.operacao_doc, nt.operacaop, op.desc_op_nf,
nt.local_doc,
nt.data,
nt.vendedor_doc,
nt.total_doc,
nt.cod_pedido, ---<<<<<
nt.entrada_saida,
nt.transportadora, ---<<<<
nt.tab_venc, ---<<<<
nt.desconto_geral,
nt.despesas,
it.codigoproduto,
pr.descricao,
it.qunatidadeproduto
*/
--cOUNT(IT.codigoproduto) TOT_PRU
/*
FROM ACEM1401 Nt -- notas
    -- Produtos da Nota ------------------------------------
    Left Join ACEM14IT it  ON it.documento=nt.documento
                          AND it.serie=nt.serie_doc
                          AND it.cod_op=nt.operacao_doc
                          AND it.cod_cli=nt.cod_cli
    -- Cadastro de Clientes -------------------------
    Left Join AUGC0301 cl  on cl.codigo_cliente=nt.cod_cli

/*
    -- Cadastro de Fornecedores ---------------------
    Left Join AUGC0501 cl  on cl.fcod=nt.cod_cli

    -- Cadastro de Produto ----------------------------------
    Left Join ACEC1101 pr  on pr.codigo=it.codigoproduto
*/
--     AUGC0301 fo -- Clientes
--     AUGC0301 cl -- Clientes
--     AFVC0901 op -- Operações Fiscais e CFOPs
--     ACEC1101 pr  -- Cadastro de Produto
--     ALFC2101 cf  -- CFops

--where CAST(nt.data as DATE)>=current_date-30
--AND   nt.entrada_saida='S'
--where nt.documento='915342'
--WHERE ((NT.cod_cli IS NULL) or (NT.cod_cli='00000')) --=
--AND nt.cod_cli=cl.codigo_cliente
--AND   nt.operacao_doc=op.cod_op
--AND
--AND   nt.cod_cli=it.cod_cli
--AND   nt.serie_doc=it.serie
--AND   nt.operacao_doc=it.cod_op
--AND   nt.cod_cli=it.cod_cli
--AND   it.codigoproduto=pr.codigo
--AND   op.cod_natureza=cf.codigo_operacao

/*
WHERE nt.cod_cli=cl.codigo_cliente
AND   nt.operacao_doc=op.cod_op
AND   nt.documento=it.documento
AND   nt.serie_doc=it.serie
AND   nt.operacao_doc=it.cod_op
AND   nt.cod_cli=it.cod_cli
AND   it.codigoproduto=pr.codigo
*/

--AND   nt.documento='000590'
--AND   nt.entrada_saida='E' -- ENTRADA ou SAIDA

--ORDER BY it.sequencia
/*
N.mevendido='v'
N.menfeidnota=922
N.memodelo=55
N.mevalortotaldesconto
N.mevalortotalbrutoitem
N.mevalortotalbrutoservico
N.mevalortotalimpostos
*/


-- 176 - 561