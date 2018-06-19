-- 07 - CADASTRO DE VENDEDORES ======================================================
-- NOME DO ARQUIVO: ACC_CADVEND_20180601.TXT ===================================

SELECT
1 ORDEM, -- 1 ORDEM
'V' TR, -- 2
v.fcod COD_VENDEDOR, -- 3 Codigo do Usuarios

v.fnome NOME_VENDEDOR, -- 4 Nome do Vendedor

(SELECT CAST(REPLACE(REPLACE(REPLACE(COALESCE(d.ciccgc,'99999999999999'), '/', ''),'.',''),'-','') as VARCHAR(18))
 FROM ea d) CPF_CNPJ, -- 5 CNPJ da Distribuidora

1 STATUS, -- 6 - Status Vendedor 0-Inativo 1-Ativo

(select e.fcod from AUGC0501 e WHERE e.fcod='00009') EQUIPE, -- 7 Equipe do Vendedor (MultiBel)

NULL REGIAO, -- 8 Regiao do Vendedor

CASE
    When UPPER(TRIM(v.fcod))='00009' Then
      'G'
    Else
      'V'
END CARGO_VENDEDOR -- 9 Cargo do Vendedor

from AUGC0501 v
WHERE v.ftipo='V'

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
NULL -- 9

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
NULL -- 9

FROM RDB$DATABASE
