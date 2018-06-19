-- 05 - CADASTRO DE CLIENTES ========================================================
-- NOME DO ARQUIVO: ACC_PDVS_20180601.TXT ======================================

SELECT
1 ORDEM, -- 1 ORDEM
'V' TR, -- 2
TRIM(CAST(REPLACE(REPLACE(REPLACE(COALESCE(cl.cgc_cnpj,'99999999999999'),
                       '/', ''),'.',''),'-','') as VARCHAR(18))) CNPJ_CPF, -- 3 CNPJ / CPF do PDV
substring(TRIM(cl.nome) from 1 for 60) RAZAO_NOME, -- 4 Razao Social ou Nome do Cliente
substring(TRIM(cl.nome_fantasia) from 1 for 60) NOME_FANTASIA, -- 5 Nome Fantasia do Cliente
'BRA' PAIS, -- 6 Descrião do País
cl.regiao REGIAO, -- 7 Região do Cliente
cl.estado ESTADO, -- 8 Estado do Cliente
cl.cidade CIDADE, -- 9 Cidade do Cliente
cl.bairro BAIRRO, -- 10 Bairro do Cliente
TRIM(CAST(REPLACE(cl.endereco,';', ':' ) AS VARCHAR(120))) ENDERECO, -- 11 Endeço do Cliente
NULL GRUPO_REDE, -- 12 Grupo/Rede
'N1' CLASSIFICACAO_PDV, -- 13 Classificaçção do PDV

CASE
    When TRIM(coalesce(vd.fnome,''))='' Then
      'MULTIBEL DISTRIB. COSMETICOS LTDA-MULTIBEL DISTRIB. COSMETICOS LTDA' -->> BUSCAR ANTERIORMENTE
    Else
      cl.codigo_representacao||'-'||TRIM(vd.fnome)
END NOME_VENDEDOR, -- 14 Nome do Vendedor ou Nome da Distribudora

Cast(extract(Year from CAST(REPLACE(cl.data_cadastro,'/','.') as DATE)) as varchar(4))||
Cast(lpad(extract(month from CAST(REPLACE(cl.data_cadastro,'/','.') as DATE)),2,'0') as varchar(2))||
Cast(lpad(extract(day from CAST(REPLACE(cl.data_cadastro,'/','.') as DATE)),2,'0') as varchar(2)) DTA_CADASTRO, -- 15 Data do Cadastro

TRIM(replace(replace(replace(COALESCE(cl.cep,'99999999'), '/', ''),'.',''),'-','')) CEP_PDV, -- 16 CEP do PDV
substring(TRIM(cl.email) from 1 for 60) CONTATO, -- 17 E-Mail do Cliente
'A' Status -- 18 Status do Cliente

-- Cadstro de Clientes ----------------------------------
FROM AUGC0301 cl
    -- Cadastro de vendedores------------------------------
    Left Join AUGC0501 vd  on vd.fcod=cl.codigo_representacao

WHERE EXISTS (SELECT 1
              FROM ACEM1401 Nt -- -- Notas lOREAL
                  -- Produtos da Nota ------------------------------------
                  Left Join ACEM14IT it  ON it.documento=nt.documento
                                        AND it.serie=nt.serie_doc
                                        AND it.cod_op=nt.operacao_doc
                                        AND it.cod_cli=nt.cod_cli
                  -- Cadastro de Produto ----------------------------------
                  Left Join ACEC1101 pr  on pr.codigo=it.codigoproduto
                  -- Cadastro de Fornecedores -----------------------------
                  Left Join AUGC0501 fo  on fo.fcod=pr.cod_fornecedor
                  -- Operacoes e Cfops ------------------------------------
                  Left Join AFVC0901 op  on op.cod_op=it.cod_op

              WHERE not (nt.operacao_doc='00000' and nt.operacaop='05000') -- Pedencia Não
              AND   CAST(nt.data as DATE)>=current_timestamp-30
              AND   (
                     ((UPPER(TRIM(op.desc_op_nf)) like '%VENDA%') and (UPPER(nt.entrada_saida)='S'))
                     Or
                     ((UPPER(TRIM(op.desc_op_nf)) like '%DEVOL%VENDA%') and (UPPER(nt.entrada_saida)='E'))
                     )
              AND   fo.fcod='00246' -- Somente Loreal
              AND   it.valor_unitarioproduto is not null
              AND   nt.cod_cli=cl.codigo_cliente)


UNION

-- REGISTRO "H" CABECALHO ======================================================
select
0, -- 1 ORDEM
'H', -- 2 Tipo de registro
CAST(replace(replace(replace(COALESCE(c.ciccgc,'99999999999999'),
     '/', ''),'.',''),'-','') AS VARCHAR(18)), -- 3 CNPJ da Distribuidora

Cast(extract(Year from current_timestamp) as varchar(4))||
Cast(lpad(extract(month from current_timestamp),2,'0') as varchar(2))||
Cast(lpad(extract(day from current_timestamp),2,'0') as varchar(2)),  -- 4 Data do Arquivo

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
NULL -- 18

from ea c

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
NULL -- 18

FROM RDB$DATABASE
