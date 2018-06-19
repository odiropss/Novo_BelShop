-- OPERAÇOES
select
op.cod_op,
op.cod_natureza, cf.codigo_operacao,
op.desc_op_nf, op.desc_natureza, cf.descricao,
op.tipo_op, cf.entrada_saida

from AFVC0901 op, -- Operacoes e Cfops
     ALFC2101 cf  -- CFops

where op.cod_natureza=cf.codigo_operacao
and   upper(op.desc_op_nf) like upper('%sa%%da%')  -- saida - 3 
--and   upper(op.desc_op_nf) like upper('%venda%')  -- venda - 3
--and   upper(op.desc_op_nf) like upper('%retor%')  -- retorno - 1
--and   op.desc_op_nf like upper('%remes%')  -- remessa - 2
--and   op.desc_op_nf like upper('%entra%')  -- entrada - 4
--and   op.desc_op_nf like upper('%devol%')  -- devolucao - 2
--and   op.desc_op_nf like upper('%compr%')  -- compra - 24
--and   op.desc_op_nf like upper('%bonif%')  -- Amostra - 5
--and   op.desc_op_nf like upper('%amos%')  -- Amostra - 1
--and   op.desc_op_nf like upper('%pend%')  -- Pedencia - 1


/*
AFVC0901 op -- Operacoes e Cfops - 46
ALFC2101 cf  -- CFops   - 37
     */
