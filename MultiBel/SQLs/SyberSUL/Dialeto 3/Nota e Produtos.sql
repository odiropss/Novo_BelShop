SELECT
nt.documento,
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


FROM ACEM1401 Nt, -- notas
     AUGC0301 cl, -- Clientes
     AFVC0901 op, -- Operações Fiscais e CFOPs
     ACEM14IT it, -- Produtos da Nota
     ACEC1101 pr  -- Cadastro de Produto

WHERE nt.cod_cli=cl.codigo_cliente
AND   nt.operacao_doc=op.cod_op
AND   nt.documento=it.documento
AND   nt.cod_cli=it.cod_cli
AND   nt.serie_doc=it.serie
AND   nt.operacao_doc=it.cod_op
AND   nt.cod_cli=it.cod_cli
AND   it.codigoproduto=pr.codigo

AND   nt.documento='000922'
AND   nt.entrada_saida='S'

ORDER BY it.sequencia
/*
N.mevendido='v'
N.menfeidnota=922
N.memodelo=55
N.mevalortotaldesconto
N.mevalortotalbrutoitem
N.mevalortotalbrutoservico
N.mevalortotalimpostos
*/