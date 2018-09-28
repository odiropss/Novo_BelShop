object DMSeparacaoDoctos: TDMSeparacaoDoctos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 243
  Top = 119
  Height = 362
  Width = 551
  object SQLC: TSQLConnection
    ConnectionName = 'BelShop'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=C:\Projetos\BelShop\Dados\BELSHOP.FDB'
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
  object SQLQ_Romaneio: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      ' SELECT'
      ' l.num_relatorio, l.dta_relatorio, l.hra_relatorio,'
      ' l.end_zona_corredor,'
      ' l.ind_prioridades,'
      ' l.cod_forn||'#39' - '#39'||f.nomefornecedor NOME_FORNECEDOR,'
      ' l.cod_separador||'#39' - '#39'||u.des_aux NOME_SEPARADOR,'
      ' l.num_docto, l.dta_docto,'
      ' (SELECT e.cod_cli_linx ||'#39' - '#39'|| e.razao_social ||'#39';'#39'||'
      '         COUNT(s.num_seq) ||'#39';'#39'||'
      '         SUM(CASE'
      
        '               WHEN ((s.qtd_transf>0) AND (s.qtd_a_transf>0)) OR' +
        ' ((s.qtd_transf_oc>0) AND (s.qtd_a_transf>0)) THEN'
      '                 1'
      '               ELSE'
      '                 0'
      '         END) ||'#39';'#39'||'
      '         SUM(CASE'
      
        '              WHEN ((s.qtd_transf>0) AND (s.qtd_a_transf=0))  OR' +
        ' ((s.qtd_transf_oc>0) AND (s.qtd_a_transf=0)) THEN'
      '                1'
      '              ELSE'
      '                0'
      '         End) ||'#39';'#39
      '  FROM ES_ESTOQUES_LOJAS s, EMP_CONEXOES e'
      '  WHERE s.cod_loja=e.cod_filial'
      '  AND   s.ind_transf='#39'SIM'#39
      '  AND   s.num_docto=l.num_docto'
      '  AND   s.dta_movto=l.dta_docto'
      '  AND   s.rel_separacao=l.num_relatorio'
      '  GROUP BY  e.cod_cli_linx, e.razao_social) LINHA,'
      'l.dta_inicio, l.dta_fim, l.sep_dias, l.sep_horas'
      ''
      'FROM LG_REL_SEPARACAO l'
      '     LEFT JOIN TAB_AUXILIAR u       ON u.cod_aux=l.cod_separador'
      '                                   AND u.tip_aux=29'
      
        '     LEFT JOIN FORNECEDOR f         ON f.codfornecedor=l.cod_for' +
        'n'
      ''
      'WHERE l.num_relatorio=12'
      'AND   l.num_docto=11759')
    SQLConnection = SQLC
    Left = 88
    Top = 184
    object SQLQ_RomaneioNUM_RELATORIO: TIntegerField
      FieldName = 'NUM_RELATORIO'
      Required = True
    end
    object SQLQ_RomaneioDTA_RELATORIO: TDateField
      FieldName = 'DTA_RELATORIO'
    end
    object SQLQ_RomaneioHRA_RELATORIO: TTimeField
      FieldName = 'HRA_RELATORIO'
    end
    object SQLQ_RomaneioEND_ZONA_CORREDOR: TStringField
      FieldName = 'END_ZONA_CORREDOR'
      Size = 8
    end
    object SQLQ_RomaneioIND_PRIORIDADES: TStringField
      FieldName = 'IND_PRIORIDADES'
      Size = 10
    end
    object SQLQ_RomaneioNOME_FORNECEDOR: TStringField
      FieldName = 'NOME_FORNECEDOR'
      Size = 54
    end
    object SQLQ_RomaneioNOME_SEPARADOR: TStringField
      FieldName = 'NOME_SEPARADOR'
      Size = 64
    end
    object SQLQ_RomaneioNUM_DOCTO: TIntegerField
      FieldName = 'NUM_DOCTO'
    end
    object SQLQ_RomaneioDTA_DOCTO: TDateField
      FieldName = 'DTA_DOCTO'
    end
    object SQLQ_RomaneioLINHA: TStringField
      FieldName = 'LINHA'
      Size = 131
    end
    object SQLQ_RomaneioDTA_INICIO: TSQLTimeStampField
      FieldName = 'DTA_INICIO'
    end
    object SQLQ_RomaneioDTA_FIM: TSQLTimeStampField
      FieldName = 'DTA_FIM'
    end
    object SQLQ_RomaneioSEP_DIAS: TIntegerField
      FieldName = 'SEP_DIAS'
    end
    object SQLQ_RomaneioSEP_HORAS: TTimeField
      FieldName = 'SEP_HORAS'
    end
  end
  object SDS_Pesquisa: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 237
    Top = 187
  end
  object CDS_Pesquisa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Pesquisa'
    Left = 318
    Top = 183
  end
  object DSP_Pesquisa: TDataSetProvider
    DataSet = SDS_Pesquisa
    Options = [poRetainServerOrder]
    Left = 278
    Top = 195
  end
  object DS_Pesquisa: TDataSource
    DataSet = CDS_Pesquisa
    Left = 354
    Top = 195
  end
end
