object DMSolicTransf: TDMSolicTransf
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 242
  Top = 123
  Height = 571
  Width = 848
  object SQLC: TSQLConnection
    ConnectionName = 'BelShop'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=\\LocalHost\c:\Projetos\BelShop\Dados\BELSHOP.FDB'
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
    Left = 44
    Top = 16
  end
  object SQLQ_Busca: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 36
    Top = 120
  end
  object DSP_Busca: TDataSetProvider
    DataSet = SQLQ_Busca
    Options = [poFetchBlobsOnDemand, poRetainServerOrder]
    Left = 92
    Top = 133
  end
  object CDS_Busca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Busca'
    Left = 140
    Top = 120
  end
  object DS_Busca: TDataSource
    DataSet = CDS_Busca
    Left = 196
    Top = 133
  end
  object DSP_Pesquisa: TDataSetProvider
    DataSet = SQLQ_Pesquisa
    Options = [poRetainServerOrder]
    Left = 81
    Top = 275
  end
  object CDS_Pesquisa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Pesquisa'
    Left = 121
    Top = 255
  end
  object DS_Pesquisa: TDataSource
    DataSet = CDS_Pesquisa
    Left = 165
    Top = 275
  end
  object SQLQ_Pesquisa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 44
    Top = 248
  end
  object DSP_Solicitacao: TDataSetProvider
    DataSet = SQLQ_Solicitacao
    Options = [poRetainServerOrder]
    Left = 89
    Top = 355
  end
  object CDS_Solicitacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Solicitacao'
    Left = 129
    Top = 335
    object CDS_SolicitacaoDTA_SOLICITACAO: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DTA_SOLICITACAO'
    end
    object CDS_SolicitacaoNUM_SOLICITACAO: TIntegerField
      DisplayLabel = 'N'#186' Solicita'#231#227'o'
      FieldName = 'NUM_SOLICITACAO'
    end
    object CDS_SolicitacaoCOD_PROD_LINX: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PROD_LINX'
    end
    object CDS_SolicitacaoNOME: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'NOME'
      Size = 250
    end
    object CDS_SolicitacaoQTD_ESTOQUE: TFMTBCDField
      DisplayLabel = 'Estoque'
      FieldName = 'QTD_ESTOQUE'
      Precision = 15
      Size = 2
    end
    object CDS_SolicitacaoQTD_TRANSF: TFMTBCDField
      DisplayLabel = 'Transfer'#234'ncia'
      FieldName = 'QTD_TRANSF'
      Precision = 15
      Size = 2
    end
  end
  object DS_Solicitacao: TDataSource
    DataSet = CDS_Solicitacao
    Left = 173
    Top = 355
  end
  object SQLQ_Solicitacao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      'tr.dta_solicitacao, tr.num_solicitacao,'
      'tr.cod_prod_linx, TRIM(pr.nome) nome,'
      'tr.qtd_estoque, tr.qtd_transf'
      'FROM SOL_TRANSFERENCIA_CD tr, LINXPRODUTOS pr'
      'WHERE tr.cod_prod_linx=pr.cod_produto'
      'AND  tr.dta_solicitacao=CURRENT_DATE'
      'AND  tr.cod_loja_linx=5'
      'ORDER BY pr.nome')
    SQLConnection = SQLC
    Left = 52
    Top = 328
  end
  object Timer1: TTimer
    Interval = 1800000
    OnTimer = Timer1Timer
    Left = 432
    Top = 64
  end
  object SDS_DtaHoraServidor: TSQLDataSet
    CommandText = 
      'select current_timestamp, current_date, current_time'#13#10'from rdb$d' +
      'atabase'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 308
    Top = 22
  end
  object DSP_Verifica: TDataSetProvider
    DataSet = SQLQ_Verifica
    Options = [poRetainServerOrder]
    Left = 89
    Top = 435
  end
  object CDS_Verifica: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Verifica'
    Left = 129
    Top = 415
    object CDS_VerificaDTA_SOLICITACAO: TDateField
      DisplayLabel = 'Dta Solicita'#231#227'o'
      FieldName = 'DTA_SOLICITACAO'
    end
    object CDS_VerificaCOD_PROD_SIDI: TStringField
      DisplayLabel = 'C'#243'd Sidicom'
      FieldName = 'COD_PROD_SIDI'
      FixedChar = True
      Size = 6
    end
    object CDS_VerificaCOD_PROD_LINX: TIntegerField
      DisplayLabel = 'C'#243'd Linx'
      FieldName = 'COD_PROD_LINX'
    end
    object CDS_VerificaNOME: TStringField
      DisplayLabel = 'Nome do Produto'
      FieldName = 'NOME'
      Size = 250
    end
    object CDS_VerificaENVIADO_CD: TStringField
      Alignment = taCenter
      DisplayLabel = 'Enviado CD?'
      FieldName = 'ENVIADO_CD'
      Required = True
      FixedChar = True
      Size = 3
    end
    object CDS_VerificaTRANSF_LOJA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Transf Loja ?'
      FieldName = 'TRANSF_LOJA'
      Required = True
      FixedChar = True
      Size = 3
    end
    object CDS_VerificaQTD_SOLICITADA: TFMTBCDField
      DisplayLabel = 'Qtd Solicitada'
      FieldName = 'QTD_SOLICITADA'
      Precision = 15
      Size = 2
    end
    object CDS_VerificaQTD_DE_TRANSF: TFMTBCDField
      DisplayLabel = 'Qtd a Transferir'
      FieldName = 'QTD_DE_TRANSF'
      Precision = 15
      Size = 2
    end
    object CDS_VerificaQTD_A_TRANSF: TFMTBCDField
      DisplayLabel = 'Qtd Transferida'
      FieldName = 'QTD_A_TRANSF'
      Precision = 15
      Size = 2
    end
    object CDS_VerificaOBS_DOCTO: TStringField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS_DOCTO'
      Size = 2000
    end
    object CDS_VerificaDTA_PROCESSAMENTO: TDateField
      DisplayLabel = 'Dta Envio p/CD'
      FieldName = 'DTA_PROCESSAMENTO'
    end
    object CDS_VerificaDOC_GERADO: TIntegerField
      DisplayLabel = 'Docto Gerado CD'
      FieldName = 'DOC_GERADO'
    end
    object CDS_VerificaNUM_SOLICITACAO: TIntegerField
      DisplayLabel = 'N'#186' Socitita'#231#227'o'
      FieldName = 'NUM_SOLICITACAO'
    end
  end
  object DS_Verifica: TDataSource
    DataSet = CDS_Verifica
    Left = 173
    Top = 435
  end
  object SQLQ_Verifica: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      'so.num_solicitacao,'
      'so.dta_solicitacao,'
      'so.cod_prod_sidi, so.cod_prod_linx, pl.nome,'
      ''
      'CASE'
      '  WHEN so.doc_gerado=0 THEN'
      '    '#39'N'#195'O'#39
      '  ELSE'
      '    '#39'SIM'#39
      'END enviado_cd,'
      'CASE'
      '  WHEN COALESCE(el.num_pedido,'#39'000000'#39')<>'#39'000000'#39' THEN'
      '    '#39'SIM'#39
      '  ELSE'
      '    '#39'N'#195'O'#39
      'END transf_loja,'
      ''
      'so.qtd_transf Qtd_Solicitada,'
      'el.qtd_transf Qtd_De_Transf,'
      'el.qtd_a_transf,'
      ''
      'el.obs_docto,'
      'so.dta_processamento,'
      'so.doc_gerado'
      ''
      'FROM SOL_TRANSFERENCIA_CD so'
      
        '   LEFT JOIN LINXPRODUTOS      pl  ON pl.cod_produto=so.cod_prod' +
        '_linx'
      
        '   LEFT JOIN ES_ESTOQUES_LOJAS el  ON el.dta_movto  =so.dta_proc' +
        'essamento'
      
        '                                  AND el.num_docto  =so.doc_gera' +
        'do'
      
        '                                  AND el.cod_produto=so.cod_prod' +
        '_sidi'
      
        '                                  AND el.cod_loja   =so.cod_loja' +
        '_sidi'
      ''
      'WHERE so.dta_solicitacao BETWEEN '#39'20.09.2017'#39' AND '#39'28.09.2017'#39
      'ORDER BY 4'
      ''
      '')
    SQLConnection = SQLC
    Left = 52
    Top = 408
  end
  object SQLQ_BuscaRapida: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 60
    Top = 192
  end
  object DSP_BuscaRapida: TDataSetProvider
    DataSet = SQLQ_BuscaRapida
    Options = [poFetchBlobsOnDemand, poRetainServerOrder]
    Left = 116
    Top = 205
  end
  object CDS_BuscaRapida: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_BuscaRapida'
    Left = 164
    Top = 192
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 132
    Top = 56
  end
  object DSP_OCItensCheck: TDataSetProvider
    DataSet = SQLQ_OCItensCheck
    Options = [poRetainServerOrder]
    Left = 321
    Top = 195
  end
  object CDS_OCItensCheck: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_OCItensCheck'
    Left = 361
    Top = 175
    object CDS_OCItensCheckNUM_SEQ_OC: TIntegerField
      FieldName = 'NUM_SEQ_OC'
    end
    object CDS_OCItensCheckNUM_SEQ_ITEM: TIntegerField
      FieldName = 'NUM_SEQ_ITEM'
    end
    object CDS_OCItensCheckNUM_OC: TIntegerField
      DisplayLabel = 'N'#186' OC'
      FieldName = 'NUM_OC'
      DisplayFormat = ',0'
    end
    object CDS_OCItensCheckCOD_PRODUTO_LINX: TFMTBCDField
      DisplayLabel = 'C'#243'd Prod Linx'
      FieldName = 'COD_PRODUTO_LINX'
      Precision = 15
      Size = 0
    end
    object CDS_OCItensCheckDES_PRODUTO: TStringField
      DisplayLabel = 'Produto Linx'
      FieldName = 'DES_PRODUTO'
      Size = 250
    end
    object CDS_OCItensCheckQTD_PRODUTO: TIntegerField
      DisplayLabel = 'Quant OC'
      FieldName = 'QTD_PRODUTO'
      DisplayFormat = ',0'
    end
    object CDS_OCItensCheckQTD_CHECKOUT: TIntegerField
      DisplayLabel = 'Quant CheckOut'
      FieldName = 'QTD_CHECKOUT'
      DisplayFormat = ',0'
    end
    object CDS_OCItensCheckDTA_CHECKOUT: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data CheckOut'
      FieldName = 'DTA_CHECKOUT'
    end
    object CDS_OCItensCheckHRA_CHECKOUT: TTimeField
      Alignment = taCenter
      DisplayLabel = 'Hora CheckOut'
      FieldName = 'HRA_CHECKOUT'
    end
    object CDS_OCItensCheckIND_OC: TStringField
      Alignment = taCenter
      DisplayLabel = 'OC ?'
      FieldName = 'IND_OC'
      FixedChar = True
      Size = 1
    end
  end
  object DS_OCItensCheck: TDataSource
    DataSet = CDS_OCItensCheck
    Left = 405
    Top = 195
  end
  object SQLQ_OCItensCheck: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT oi.num_seq_oc, oi.num_seq_item, oc.num_oc, oi.cod_produto' +
        '_linx, oi.des_produto,'
      
        'oi.qtd_produto, oi.qtd_checkout, oi.dta_checkout, oi.hra_checkou' +
        't,'
      'CASE'
      '  WHEN ni.ind_oc IS NULL THEN'
      '    '#39'S'#39
      '  ELSE'
      '    ni.ind_oc'
      'END IND_OC'
      'FROM OC_LOJAS_ITENS oi'
      
        '    LEFT JOIN OC_LOJAS_NFE oc        ON oc.num_seq_oc=oi.num_seq' +
        '_oc'
      
        '    LEFT JOIN OC_LOJAS_ITENS_NFE ni  ON ni.num_seq_oc=oi.num_seq' +
        '_oc'
      
        '                                    AND ni.num_seq_item=oi.num_s' +
        'eq_item'
      'WHERE oi.num_seq_oc in (23,27)'
      'ORDER BY oi.des_produto')
    SQLConnection = SQLC
    Left = 284
    Top = 168
  end
  object SQLQuery2: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 196
    Top = 56
  end
end
