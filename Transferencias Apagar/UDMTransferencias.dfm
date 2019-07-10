object DMTransferencias: TDMTransferencias
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 251
  Top = 115
  Height = 584
  Width = 766
  object SQLC: TSQLConnection
    ConnectionName = 'BelShop'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=\\localhost\C:\Projetos\BelShop\Dados\BelShop.FDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'fbclient.dll'
    Left = 48
    Top = 16
  end
  object SDS_Busca: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 48
    Top = 81
  end
  object DSP_Busca: TDataSetProvider
    DataSet = SDS_Busca
    Options = [poRetainServerOrder]
    Left = 98
    Top = 94
  end
  object CDS_Busca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Busca'
    Left = 149
    Top = 80
  end
  object SDS_DtaHoraServidor: TSQLDataSet
    CommandText = 
      'select current_timestamp, current_date, current_time'#13#10'from rdb$d' +
      'atabase'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 207
    Top = 11
  end
  object SDS_EstoqueCD: TSQLDataSet
    CommandText = 'select *'#13#10' from ES_ESTOQUES_CD cd'#13#10'where cd.Cod_Produto<'#39#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 368
    Top = 80
  end
  object CDS_EstoqueCD: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_EstoqueCD'
    Left = 496
    Top = 80
    object CDS_EstoqueCDDTA_MOVTO: TDateField
      FieldName = 'DTA_MOVTO'
    end
    object CDS_EstoqueCDCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      FixedChar = True
      Size = 6
    end
    object CDS_EstoqueCDQTD_ESTOQUE: TFMTBCDField
      FieldName = 'QTD_ESTOQUE'
      Precision = 15
      Size = 2
    end
    object CDS_EstoqueCDQTD_SAIDAS: TFMTBCDField
      FieldName = 'QTD_SAIDAS'
      Precision = 15
      Size = 2
    end
    object CDS_EstoqueCDQTD_SALDO: TFMTBCDField
      FieldName = 'QTD_SALDO'
      Precision = 15
      Size = 2
    end
    object CDS_EstoqueCDEND_ZONA: TIntegerField
      FieldName = 'END_ZONA'
    end
    object CDS_EstoqueCDEND_CORREDOR: TStringField
      FieldName = 'END_CORREDOR'
      FixedChar = True
      Size = 3
    end
    object CDS_EstoqueCDEND_PRATELEIRA: TStringField
      FieldName = 'END_PRATELEIRA'
      FixedChar = True
      Size = 3
    end
    object CDS_EstoqueCDEND_GAVETA: TStringField
      FieldName = 'END_GAVETA'
      FixedChar = True
      Size = 4
    end
  end
  object DSP_EstoqueCD: TDataSetProvider
    DataSet = SDS_EstoqueCD
    Options = [poRetainServerOrder]
    Left = 432
    Top = 96
  end
  object SDS_BuscaRapida: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 56
    Top = 233
  end
  object DSP_BuscaRapida: TDataSetProvider
    DataSet = SDS_BuscaRapida
    Options = [poRetainServerOrder]
    Left = 106
    Top = 246
  end
  object CDS_BuscaRapida: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_BuscaRapida'
    Left = 157
    Top = 232
  end
  object SDS_CurvasLoja: TSQLDataSet
    CommandText = 
      'SELECT First 1'#13#10'c.cod_produto cod_produto,'#13#10'p.cod_produto cod_pr' +
      'od_linx,'#13#10'CASE'#13#10#13#10'-- If bCurvaC Then'#13#10'   WHEN ((CAST(p.dt_inclus' +
      'ao AS DATE)>='#39'15.03.2019'#39') AND (c.ind_curva in ('#39'D'#39','#39'E'#39')))'#13#10'    ' +
      '     OR'#13#10'        ((p.cod_fornecedor=594) AND (c.ind_curva in ('#39'D' +
      #39','#39'E'#39')) AND (UPPER(p.nome) like '#39'%YELLOW%'#39'))'#13#10#13#10'         OR'#13#10'   ' +
      '     ((p.cod_fornecedor=479) AND (c.ind_curva in ('#39'D'#39','#39'E'#39')) AND ' +
      '(UPPER(p.nome) like '#39'NG %'#39'))'#13#10'         OR'#13#10'        ((p.cod_produ' +
      'to=844) AND (c.ind_curva in ('#39'D'#39','#39'E'#39'))) THEN'#13#10'/*'#13#10'-- Else'#13#10'   WH' +
      'EN (CAST(p.dt_inclusao AS DATE)>='#39'15.03.2019'#39') AND (c.ind_curva ' +
      'in ('#39'D'#39','#39'E'#39')) THEN'#13#10'*/'#13#10'    '#39'C'#39#13#10'   ELSE'#13#10'    c.ind_curva'#13#10#13#10'END' +
      ' ind_curva,'#13#10#13#10'CAST(COALESCE(c.est_minimo,0) AS INTEGER) est_min' +
      'imo,'#13#10'CAST(COALESCE(c.est_maximo,0) AS INTEGER) est_maximo,'#13#10#13#10'C' +
      'AST(COALESCE(t.vlr_aux,0) AS INTEGER) Dias_Estocagem,'#13#10'CAST(COAL' +
      'ESCE(e.quantidade,0.00) AS INTEGER) saldoatual,'#13#10#13#10'CAST(p.dt_inc' +
      'lusao AS DATE) datainclusao,'#13#10'CAST(p.dt_update AS DATE) dataalte' +
      'racao'#13#10#13#10'FROM ES_FINAN_CURVA_ABC c'#13#10'       LEFT JOIN LINXPRODUTO' +
      'S p          ON p.cod_produto=c.cod_prod_linx'#13#10'       LEFT JOIN ' +
      'LINXPRODUTOSDETALHES e  ON e.cod_loja=c.cod_loja'#13#10'              ' +
      '                          AND e.cod_produto=c.cod_prod_linx'#13#10'   ' +
      '    LEFT JOIN TAB_AUXILIAR t  ON CASE'#13#10'                         ' +
      '            -- If bCurvaC Then'#13#10'                                ' +
      '         WHEN ((CAST(p.dt_inclusao AS DATE)>'#39'15.03.2019'#39') AND (c' +
      '.ind_curva in ('#39'D'#39','#39'E'#39')))'#13#10'                                     ' +
      '          OR'#13#10'                                              ((p.' +
      'cod_fornecedor=594) AND (c.ind_curva in ('#39'D'#39','#39'E'#39')) AND (UPPER(p.' +
      'nome) like '#39'%YELLOW%'#39'))'#13#10'                                       ' +
      '        OR'#13#10'                                              ((p.co' +
      'd_fornecedor=479) AND (c.ind_curva in ('#39'D'#39','#39'E'#39')) AND (UPPER(p.no' +
      'me) like '#39'NG %'#39'))'#13#10'                                             ' +
      '  OR'#13#10'                                              ((p.cod_forn' +
      'ecedor=844) AND (c.ind_curva in ('#39'D'#39','#39'E'#39'))) THEN'#13#10'              ' +
      '                              3'#13#10'                               ' +
      '      /*'#13#10'                                     -- Else'#13#10'        ' +
      '                                  WHEN (CAST(p.dt_inclusao AS DA' +
      'TE)>'#39'15.03.2019'#39') AND (c.ind_curva in ('#39'D'#39','#39'E'#39')) THEN'#13#10'         ' +
      '                                   3'#13#10'                          ' +
      '            */'#13#10'                                      WHEN c.ind' +
      '_curva='#39'A'#39' THEN 1'#13#10'                                      WHEN c.' +
      'ind_curva='#39'B'#39' THEN 2'#13#10'                                      WHEN' +
      ' c.ind_curva='#39'C'#39' THEN 3'#13#10'                                      W' +
      'HEN c.ind_curva='#39'D'#39' THEN 4'#13#10'                                    ' +
      '  WHEN c.ind_curva='#39'E'#39' THEN 5'#13#10'                                 ' +
      '   END=t.cod_aux'#13#10'                                AND t.tip_aux=' +
      '2'#13#10#13#10'WHERE CAST(COALESCE(c.est_minimo,0) AS INTEGER)>0'#13#10'AND   e.' +
      'quantidade>=0'#13#10'AND   c.cod_loja='#39'01'#39#13#10#13#10'-- If bCurvaC Then'#13#10'AND ' +
      '   ((c.ind_curva in ('#39'A'#39')) OR (CAST(p.dt_inclusao AS DATE)>='#39'15.' +
      '03.2019'#39') --// '#39' AND c.ind_curva='#39'E'#39')'#13#10'       OR --// Manuela'#13#10' ' +
      '     ((p.cod_fornecedor=594) AND (c.ind_curva in ('#39'D'#39','#39'E'#39')) AND ' +
      '(UPPER(p.nome) like '#39'%YELLOW%'#39'))'#13#10'       OR'#13#10'      ((p.cod_forne' +
      'cedor=844) AND (c.ind_curva in ('#39'D'#39','#39'E'#39')))'#13#10'       OR'#13#10'      ((p' +
      '.cod_fornecedor=479) AND (c.ind_curva in ('#39'D'#39','#39'E'#39')) AND (UPPER(p' +
      '.nome) like '#39'NG %'#39')))'#13#10'/*'#13#10'-- Else'#13#10'AND     ((c.ind_curva in ('#39'A' +
      #39')) OR (CAST(p.dt_inclusao AS DATE)>='#39'15.03.2019'#39')) --// '#39' AND c' +
      '.ind_curva='#39'E'#39'))'#13#10'AND NOT (((p.cod_fornecedor=594) AND (c.ind_cu' +
      'rva in ('#39'D'#39','#39'E'#39')) AND (UPPER(p.nome) like '#39'%YELLOW%'#39'))'#13#10'        ' +
      ' OR'#13#10'        ((p.cod_fornecedor=844) AND (c.ind_curva in ('#39'D'#39','#39'E' +
      #39')))'#13#10'         OR'#13#10'        ((p.cod_fornecedor=479) AND (c.ind_cu' +
      'rva in ('#39'D'#39','#39'E'#39')) AND (UPPER(p.nome) like '#39'NG %'#39')))'#13#10'*/'#13#10#13#10'--AND' +
      '   p.id_setor NOT IN (17, 20, 25)  -- 17-IMOBILIZADOS 20-MOVEIS ' +
      'SAL'#195'O 25-USO E CONSUMO'#13#10'AND   p.id_linha NOT IN (33) -- 33-Brind' +
      'es'#13#10'AND   p.id_colecao NOT IN (197, 294, 587) -- 197-DESCONTINUA' +
      'DO-CAMPANHA DE R$0,50 (Antigo N'#227'o Compra) 294-BRINDE 587-KIDS'#13#10'-' +
      '-AND   p.cod_fornecedor NOT IN (6, 1014, 260)'#13#10'AND   p.desativad' +
      'o='#39'N'#39#13#10#13#10'ORDER BY c.cod_produto'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 248
    Top = 312
  end
  object CDS_CurvasLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_CurvasLoja'
    Left = 349
    Top = 312
    object CDS_CurvasLojaCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      Required = True
      FixedChar = True
      Size = 6
    end
    object CDS_CurvasLojaCOD_PROD_LINX: TFMTBCDField
      FieldName = 'COD_PROD_LINX'
      Precision = 15
      Size = 0
    end
    object CDS_CurvasLojaIND_CURVA: TStringField
      FieldName = 'IND_CURVA'
      Size = 1
    end
    object CDS_CurvasLojaEST_MINIMO: TIntegerField
      FieldName = 'EST_MINIMO'
    end
    object CDS_CurvasLojaEST_MAXIMO: TIntegerField
      FieldName = 'EST_MAXIMO'
    end
    object CDS_CurvasLojaDIAS_ESTOCAGEM: TIntegerField
      FieldName = 'DIAS_ESTOCAGEM'
    end
    object CDS_CurvasLojaSALDOATUAL: TIntegerField
      FieldName = 'SALDOATUAL'
    end
    object CDS_CurvasLojaDATAINCLUSAO: TDateField
      FieldName = 'DATAINCLUSAO'
    end
    object CDS_CurvasLojaDATAALTERACAO: TDateField
      FieldName = 'DATAALTERACAO'
    end
  end
  object DSP_CurvasLoja: TDataSetProvider
    DataSet = SDS_CurvasLoja
    Options = [poRetainServerOrder]
    Left = 298
    Top = 328
  end
  object SDS_ProdutoDemanda: TSQLDataSet
    CommandText = 
      'SELECT'#13#10' CAST(GEN_ID(GEN_ODIR,1) AS INTEGER) Num_Seq,'#13#10' CURRENT_' +
      'DATE Dta_Movto,'#13#10' 1320 Num_Docto,'#13#10' '#39'01'#39' Cod_Loja,'#13#10' pr.codprodu' +
      'to Cod_produto,'#13#10' 8 Est_Minimo,'#13#10' 8 Est_Maximo,'#13#10' 3 qtd_estoque,' +
      #13#10' SUM(COALESCE(dm.quant_ref,0.00)) Qtd_Vendas,'#13#10' '#39'C'#39' ind_curva,' +
      #13#10' 60 dias_estocagem,'#13#10' 101 qtd_dias,'#13#10' ((SUM(COALESCE(dm.quant_' +
      'ref,0.00)))/101) qtd_venda_dia,'#13#10' CAST(((((SUM(COALESCE(dm.quant' +
      '_ref,0.00)))/101)) * 60) AS INTEGER) qtd_demanda,'#13#10#13#10' CAST(CASE'#13 +
      #10'        WHEN (CAST(((((SUM(COALESCE(dm.quant_ref,0)))/101)) * 6' +
      '0) AS INTEGER))>=8 Then'#13#10'          (CAST((((((SUM(COALESCE(dm.qu' +
      'ant_ref,0)))/101)) * 60) - 3) AS INTEGER))'#13#10'        ELSE'#13#10'      ' +
      '    8 - 3'#13#10'      END'#13#10' AS INTEGER) qtd_reposicao,'#13#10#13#10' 0.00 qtd_t' +
      'ransf,'#13#10' 0.00 qtd_a_transf,'#13#10' '#39'000000'#39' num_pedido,'#13#10' '#39'CAL'#39' IND_T' +
      'RANSF,'#13#10' 0 usu_altera,'#13#10' CURRENT_TIMESTAMP dta_altera,'#13#10' 0 NUM_T' +
      'R_GERADA,'#13#10' 0.00 QTD_TRANSF_OC,'#13#10' '#39' '#39' OBS_DOCTO,'#13#10' pr.codgruposu' +
      'b'#13#10#13#10' FROM PRODUTO pr'#13#10'       LEFT JOIN MOVTOS_EMPRESAS dm  ON d' +
      'm.ind_tipo='#39'DM'#39#13#10'                                    AND dm.codp' +
      'roduto=pr.codproduto'#13#10'                                    AND dm' +
      '.dta_ref>='#39'14.02.2016'#39#13#10'                                    AND ' +
      'dm.dta_ref<='#39'14.06.2016'#39#13#10'                                    AN' +
      'D dm.codfilial='#39'01'#39#13#10#13#10'WHERE pr.codproduto='#39'000020'#39#13#10#13#10'GROUP BY ' +
      ' 5, 25'#13#10#13#10'HAVING CAST((CASE'#13#10'                WHEN (CAST(((((SUM(' +
      'COALESCE(dm.quant_ref,0)))/101)) * 60) AS INTEGER))>=8 Then'#13#10'   ' +
      '               (CAST((((((SUM(COALESCE(dm.quant_ref,0)))/101)) *' +
      ' 60) - 3) AS INTEGER))'#13#10'                ELSE'#13#10'                  ' +
      '8 - 3'#13#10'             END)'#13#10'       AS INTEGER)>0'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 248
    Top = 368
  end
  object CDS_ProdutoDemanda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ProdutoDemanda'
    Left = 349
    Top = 368
    object CDS_ProdutoDemandaNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
      Required = True
    end
    object CDS_ProdutoDemandaDTA_MOVTO: TDateField
      FieldName = 'DTA_MOVTO'
      Required = True
    end
    object CDS_ProdutoDemandaNUM_DOCTO: TIntegerField
      FieldName = 'NUM_DOCTO'
      Required = True
    end
    object CDS_ProdutoDemandaCOD_LOJA: TStringField
      FieldName = 'COD_LOJA'
      Required = True
      FixedChar = True
      Size = 2
    end
    object CDS_ProdutoDemandaCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      Required = True
      FixedChar = True
      Size = 6
    end
    object CDS_ProdutoDemandaEST_MINIMO: TIntegerField
      FieldName = 'EST_MINIMO'
      Required = True
    end
    object CDS_ProdutoDemandaEST_MAXIMO: TIntegerField
      FieldName = 'EST_MAXIMO'
      Required = True
    end
    object CDS_ProdutoDemandaQTD_ESTOQUE: TIntegerField
      FieldName = 'QTD_ESTOQUE'
      Required = True
    end
    object CDS_ProdutoDemandaQTD_VENDAS: TFMTBCDField
      FieldName = 'QTD_VENDAS'
      Precision = 15
      Size = 2
    end
    object CDS_ProdutoDemandaIND_CURVA: TStringField
      FieldName = 'IND_CURVA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDS_ProdutoDemandaDIAS_ESTOCAGEM: TIntegerField
      FieldName = 'DIAS_ESTOCAGEM'
      Required = True
    end
    object CDS_ProdutoDemandaQTD_DIAS: TIntegerField
      FieldName = 'QTD_DIAS'
      Required = True
    end
    object CDS_ProdutoDemandaQTD_VENDA_DIA: TFMTBCDField
      FieldName = 'QTD_VENDA_DIA'
      Precision = 15
      Size = 2
    end
    object CDS_ProdutoDemandaQTD_DEMANDA: TIntegerField
      FieldName = 'QTD_DEMANDA'
    end
    object CDS_ProdutoDemandaQTD_REPOSICAO: TIntegerField
      FieldName = 'QTD_REPOSICAO'
    end
    object CDS_ProdutoDemandaQTD_TRANSF: TFMTBCDField
      FieldName = 'QTD_TRANSF'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_ProdutoDemandaQTD_A_TRANSF: TFMTBCDField
      FieldName = 'QTD_A_TRANSF'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_ProdutoDemandaNUM_PEDIDO: TStringField
      FieldName = 'NUM_PEDIDO'
      Required = True
      FixedChar = True
      Size = 6
    end
    object CDS_ProdutoDemandaIND_TRANSF: TStringField
      FieldName = 'IND_TRANSF'
      Required = True
      FixedChar = True
      Size = 3
    end
    object CDS_ProdutoDemandaUSU_ALTERA: TIntegerField
      FieldName = 'USU_ALTERA'
      Required = True
    end
    object CDS_ProdutoDemandaDTA_ALTERA: TSQLTimeStampField
      FieldName = 'DTA_ALTERA'
      Required = True
    end
    object CDS_ProdutoDemandaNUM_TR_GERADA: TIntegerField
      FieldName = 'NUM_TR_GERADA'
      Required = True
    end
    object CDS_ProdutoDemandaQTD_TRANSF_OC: TFMTBCDField
      FieldName = 'QTD_TRANSF_OC'
      Required = True
      Precision = 15
      Size = 2
    end
    object CDS_ProdutoDemandaOBS_DOCTO: TStringField
      FieldName = 'OBS_DOCTO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDS_ProdutoDemandaCODGRUPOSUB: TStringField
      FieldName = 'CODGRUPOSUB'
      FixedChar = True
      Size = 7
    end
  end
  object DSP_ProdutoDemanda: TDataSetProvider
    DataSet = SDS_ProdutoDemanda
    Options = [poRetainServerOrder]
    Left = 298
    Top = 384
  end
  object SDS_EstoqueLoja: TSQLDataSet
    CommandText = 'select *'#13#10'from ES_ESTOQUES_LOJAS el'#13#10'where el.Cod_Produto<'#39#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 368
    Top = 136
  end
  object CDS_EstoqueLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_EstoqueLoja'
    Left = 496
    Top = 136
    object CDS_EstoqueLojaNUM_SEQ: TSmallintField
      DisplayLabel = 'Seq'
      FieldName = 'NUM_SEQ'
      DisplayFormat = '0,'
    end
    object CDS_EstoqueLojaDTA_MOVTO: TDateField
      FieldName = 'DTA_MOVTO'
    end
    object CDS_EstoqueLojaNUM_DOCTO: TIntegerField
      FieldName = 'NUM_DOCTO'
    end
    object CDS_EstoqueLojaCOD_LOJA: TStringField
      FieldName = 'COD_LOJA'
      FixedChar = True
      Size = 2
    end
    object CDS_EstoqueLojaCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      FixedChar = True
      Size = 6
    end
    object CDS_EstoqueLojaEST_MINIMO: TIntegerField
      FieldName = 'EST_MINIMO'
    end
    object CDS_EstoqueLojaEST_MAXIMO: TIntegerField
      FieldName = 'EST_MAXIMO'
    end
    object CDS_EstoqueLojaQTD_ESTOQUE: TFMTBCDField
      FieldName = 'QTD_ESTOQUE'
      Precision = 15
      Size = 2
    end
    object CDS_EstoqueLojaQTD_VENDAS: TFMTBCDField
      FieldName = 'QTD_VENDAS'
      Precision = 15
      Size = 2
    end
    object CDS_EstoqueLojaIND_CURVA: TStringField
      FieldName = 'IND_CURVA'
      FixedChar = True
      Size = 1
    end
    object CDS_EstoqueLojaDIAS_ESTOCAGEM: TIntegerField
      FieldName = 'DIAS_ESTOCAGEM'
    end
    object CDS_EstoqueLojaQTD_DIAS: TIntegerField
      FieldName = 'QTD_DIAS'
    end
    object CDS_EstoqueLojaQTD_VENDA_DIA: TFMTBCDField
      FieldName = 'QTD_VENDA_DIA'
      Precision = 15
      Size = 2
    end
    object CDS_EstoqueLojaQTD_DEMANDA: TFMTBCDField
      FieldName = 'QTD_DEMANDA'
      Precision = 15
      Size = 2
    end
    object CDS_EstoqueLojaQTD_REPOSICAO: TFMTBCDField
      FieldName = 'QTD_REPOSICAO'
      Precision = 15
      Size = 2
    end
    object CDS_EstoqueLojaQTD_TRANSF: TFMTBCDField
      FieldName = 'QTD_TRANSF'
      Precision = 15
      Size = 2
    end
    object CDS_EstoqueLojaQTD_A_TRANSF: TFMTBCDField
      FieldName = 'QTD_A_TRANSF'
      Precision = 15
      Size = 2
    end
    object CDS_EstoqueLojaNUM_PEDIDO: TStringField
      FieldName = 'NUM_PEDIDO'
      FixedChar = True
      Size = 6
    end
    object CDS_EstoqueLojaIND_TRANSF: TStringField
      FieldName = 'IND_TRANSF'
      FixedChar = True
      Size = 3
    end
    object CDS_EstoqueLojaUSU_ALTERA: TIntegerField
      FieldName = 'USU_ALTERA'
    end
    object CDS_EstoqueLojaDTA_ALTERA: TSQLTimeStampField
      FieldName = 'DTA_ALTERA'
    end
    object CDS_EstoqueLojaNUM_TR_GERADA: TIntegerField
      FieldName = 'NUM_TR_GERADA'
    end
    object CDS_EstoqueLojaQTD_TRANSF_OC: TFMTBCDField
      FieldName = 'QTD_TRANSF_OC'
      Precision = 15
      Size = 2
    end
    object CDS_EstoqueLojaOBS_DOCTO: TStringField
      FieldName = 'OBS_DOCTO'
      Size = 2000
    end
  end
  object DSP_EstoqueLoja: TDataSetProvider
    DataSet = SDS_EstoqueLoja
    Options = [poRetainServerOrder]
    Left = 432
    Top = 152
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      'c.cod_produto,'
      'CASE'
      
        '    WHEN (p.datainclusao>='#39'18.01.2016'#39') AND (c.ind_curva='#39'E'#39') TH' +
        'EN'
      '      '#39'C'#39
      '    ELSE'
      '      c.ind_curva'
      'END ind_curva,'
      'CASE'
      
        '   WHEN (p.datainclusao>='#39'18.01.2016'#39') AND (c.ind_curva='#39'E'#39') AND' +
        ' (t.vlr_aux1>c.est_minimo) THEN'
      '     CAST(t.vlr_aux1 AS INTEGER)'
      '   ELSE'
      '     CAST(c.est_minimo AS INTEGER)'
      'END est_minimo,'
      ''
      'CAST(COALESCE(t.vlr_aux,0) AS INTEGER) Dias_Estocagem,'
      ''
      'CAST((CASE'
      '        WHEN COALESCE(e.pedidopendente,0)<0 THEN'
      '          COALESCE(e.saldoatual,0)'
      
        '        WHEN COALESCE(e.pedidopendente,0)>COALESCE(e.saldoatual,' +
        '0) THEN'
      '          0'
      '        ELSE'
      '          COALESCE(e.saldoatual,0)-COALESCE(e.pedidopendente,0)'
      '      END)'
      'AS INTEGER) saldoatual,'
      'p.datainclusao,'
      'p.dataalteracao'
      ''
      'FROM ES_FINAN_CURVA_ABC c'
      '        LEFT JOIN PRODUTO      p  ON p.codproduto=c.cod_produto'
      '        LEFT JOIN ESTOQUE      e  ON e.codfilial=c.cod_loja'
      '                                 AND e.codproduto=c.cod_produto'
      '        LEFT JOIN TAB_AUXILIAR t  ON CASE'
      
        '                                       WHEN (p.datainclusao>'#39'18.' +
        '01.2016'#39') AND (c.ind_curva='#39'E'#39') THEN 3'
      
        '                                       WHEN c.ind_curva='#39'A'#39' THEN' +
        ' 1'
      
        '                                       WHEN c.ind_curva='#39'B'#39' THEN' +
        ' 2'
      
        '                                       WHEN c.ind_curva='#39'C'#39' THEN' +
        ' 3'
      
        '                                       WHEN c.ind_curva='#39'D'#39' THEN' +
        ' 4'
      
        '                                       WHEN c.ind_curva='#39'E'#39' THEN' +
        ' 5'
      '                                       END=t.cod_aux'
      '                                  AND t.tip_aux=2'
      ''
      'WHERE c.est_minimo>0'
      'AND   p.situacaopro in (0,3)'
      
        'AND   p.principalfor Not in ('#39'000050'#39', '#39'000453'#39', '#39'000504'#39', '#39'0007' +
        '97'#39', '#39'000048'#39', '#39'000251'#39', '#39'000338'#39','
      
        '                             '#39'000300'#39', '#39'000500'#39', '#39'000883'#39', '#39'0100' +
        '00'#39', '#39'001072'#39')'
      ''
      
        'AND   ((c.ind_curva in ('#39'A'#39', '#39'B'#39', '#39'C'#39', '#39'D'#39')) OR (p.datainclusao>' +
        '='#39'18.01.2016'#39' AND c.ind_curva='#39'E'#39'))'
      'AND   c.cod_loja='#39'06'#39
      ''
      '')
    SQLConnection = SQLC
    Left = 248
    Top = 256
    object SQLQuery1COD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      Required = True
      FixedChar = True
      Size = 6
    end
    object SQLQuery1IND_CURVA: TStringField
      FieldName = 'IND_CURVA'
      Size = 1
    end
    object SQLQuery1EST_MINIMO: TIntegerField
      FieldName = 'EST_MINIMO'
    end
    object SQLQuery1DIAS_ESTOCAGEM: TIntegerField
      FieldName = 'DIAS_ESTOCAGEM'
    end
    object SQLQuery1SALDOATUAL: TIntegerField
      FieldName = 'SALDOATUAL'
    end
    object SQLQuery1DATAINCLUSAO: TDateField
      FieldName = 'DATAINCLUSAO'
    end
    object SQLQuery1DATAALTERACAO: TDateField
      FieldName = 'DATAALTERACAO'
    end
  end
  object SDS_Busca1: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 48
    Top = 153
  end
  object DSP_Busca1: TDataSetProvider
    DataSet = SDS_Busca1
    Options = [poRetainServerOrder]
    Left = 98
    Top = 166
  end
  object CDS_Busca1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Busca1'
    Left = 149
    Top = 152
  end
  object SQLQ_Busca: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 320
    Top = 16
  end
  object SQLQuery2: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 264
    Top = 120
  end
end
