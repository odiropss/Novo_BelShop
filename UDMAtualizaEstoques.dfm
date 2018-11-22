object DMAtualizaEstoques: TDMAtualizaEstoques
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 292
  Top = 104
  Height = 604
  Width = 631
  object SQLC: TSQLConnection
    ConnectionName = 'BelShop'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=C:\Projetos\BelShop\Dados\BelShop.FDB'
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
    VendorLib = 'gds32.dll'
    Left = 16
    Top = 16
  end
  object SDS_DtaHoraServidor: TSQLDataSet
    CommandText = 
      'select current_timestamp, current_date, current_time'#13#10'from rdb$d' +
      'atabase'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 143
    Top = 35
  end
  object IBQ_EstoqueLoja: TIBQuery
    Database = DMConexoes.IBDB_01
    Transaction = DMConexoes.IBT_01
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT e.codfilial, e.codproduto, e.saldoatual, e.pedidopendente' +
        ', e.zonaendereco, e.corredor, e.prateleira, e.gaveta, e.cusmedva' +
        'lor, e.customedio, e.lastprecocompra, e.lastcustomedio, e.estoqu' +
        'eideal, e.estoquemaximo, e.dataalteracadastro, e.dataalteraestoq' +
        'ue, e.dataalteraestoque_ped, coalesce(p.principalfor,'#39'000000'#39') p' +
        'rincipalfor, current_date DTA_ATUALIZACAO, '#39'19:28:14'#39' HRA_ATUALI' +
        'ZACAO FROM ESTOQUE e'
      '      LEFT JOIN PRODUTO p on e.codproduto=p.codproduto '
      'WHERE e.codfilial='#39'99'#39)
    Left = 80
    Top = 288
    object IBQ_EstoqueLojaCODFILIAL: TIBStringField
      FieldName = 'CODFILIAL'
      Origin = 'ESTOQUE.CODFILIAL'
      Required = True
      FixedChar = True
      Size = 2
    end
    object IBQ_EstoqueLojaCODPRODUTO: TIBStringField
      FieldName = 'CODPRODUTO'
      Origin = 'ESTOQUE.CODPRODUTO'
      Required = True
      FixedChar = True
      Size = 6
    end
    object IBQ_EstoqueLojaSALDOATUAL: TIBBCDField
      FieldName = 'SALDOATUAL'
      Origin = 'ESTOQUE.SALDOATUAL'
      Precision = 18
      Size = 4
    end
    object IBQ_EstoqueLojaPEDIDOPENDENTE: TIBBCDField
      FieldName = 'PEDIDOPENDENTE'
      Origin = 'ESTOQUE.PEDIDOPENDENTE'
      Precision = 18
      Size = 4
    end
    object IBQ_EstoqueLojaZONAENDERECO: TIntegerField
      FieldName = 'ZONAENDERECO'
      Origin = 'ESTOQUE.ZONAENDERECO'
    end
    object IBQ_EstoqueLojaCORREDOR: TIBStringField
      FieldName = 'CORREDOR'
      Origin = 'ESTOQUE.CORREDOR'
      FixedChar = True
      Size = 3
    end
    object IBQ_EstoqueLojaPRATELEIRA: TIBStringField
      FieldName = 'PRATELEIRA'
      Origin = 'ESTOQUE.PRATELEIRA'
      FixedChar = True
      Size = 3
    end
    object IBQ_EstoqueLojaGAVETA: TIBStringField
      FieldName = 'GAVETA'
      Origin = 'ESTOQUE.GAVETA'
      FixedChar = True
      Size = 4
    end
    object IBQ_EstoqueLojaCUSMEDVALOR: TIBBCDField
      FieldName = 'CUSMEDVALOR'
      Origin = 'ESTOQUE.CUSMEDVALOR'
      Precision = 18
      Size = 2
    end
    object IBQ_EstoqueLojaCUSTOMEDIO: TIBBCDField
      FieldName = 'CUSTOMEDIO'
      Origin = 'ESTOQUE.CUSTOMEDIO'
      Precision = 18
      Size = 4
    end
    object IBQ_EstoqueLojaLASTPRECOCOMPRA: TIBBCDField
      FieldName = 'LASTPRECOCOMPRA'
      Origin = 'ESTOQUE.LASTPRECOCOMPRA'
      Precision = 18
      Size = 4
    end
    object IBQ_EstoqueLojaLASTCUSTOMEDIO: TIBBCDField
      FieldName = 'LASTCUSTOMEDIO'
      Origin = 'ESTOQUE.LASTCUSTOMEDIO'
      Precision = 18
      Size = 4
    end
    object IBQ_EstoqueLojaESTOQUEIDEAL: TIBBCDField
      FieldName = 'ESTOQUEIDEAL'
      Origin = 'ESTOQUE.ESTOQUEIDEAL'
      Precision = 18
      Size = 4
    end
    object IBQ_EstoqueLojaESTOQUEMAXIMO: TIBBCDField
      FieldName = 'ESTOQUEMAXIMO'
      Origin = 'ESTOQUE.ESTOQUEMAXIMO'
      Precision = 18
      Size = 4
    end
    object IBQ_EstoqueLojaDATAALTERACADASTRO: TDateTimeField
      FieldName = 'DATAALTERACADASTRO'
      Origin = 'ESTOQUE.DATAALTERACADASTRO'
    end
    object IBQ_EstoqueLojaDATAALTERAESTOQUE: TDateTimeField
      FieldName = 'DATAALTERAESTOQUE'
      Origin = 'ESTOQUE.DATAALTERAESTOQUE'
    end
    object IBQ_EstoqueLojaDATAALTERAESTOQUE_PED: TDateTimeField
      FieldName = 'DATAALTERAESTOQUE_PED'
      Origin = 'ESTOQUE.DATAALTERAESTOQUE_PED'
    end
    object IBQ_EstoqueLojaPRINCIPALFOR: TIBStringField
      FieldName = 'PRINCIPALFOR'
      FixedChar = True
      Size = 6
    end
    object IBQ_EstoqueLojaSALDO_FINAL_SIDICOM: TIBBCDField
      FieldName = 'SALDO_FINAL_SIDICOM'
      Origin = 'ESTOQUE.SALDO_FINAL_SIDICOM'
      Precision = 18
      Size = 4
    end
    object IBQ_EstoqueLojaDTA_ATUALIZACAO: TDateField
      FieldName = 'DTA_ATUALIZACAO'
      Required = True
    end
    object IBQ_EstoqueLojaHRA_ATUALIZACAO: TIBStringField
      FieldName = 'HRA_ATUALIZACAO'
      Required = True
      FixedChar = True
      Size = 8
    end
  end
  object SDS_EmpProcessa: TSQLDataSet
    CommandText = 
      'SELECT c.cod_filial, c.cod_linx,'#13#10'       c.endereco_ip, c.endere' +
      'co_ip_externo,'#13#10'       c.pasta_base_dados, c.des_base_dados,'#13#10'  ' +
      '     c.cod_emp, c.razao_social, c.tip_emp,'#13#10'       c.ind_ativo, ' +
      'c.dta_inicio_linx, c.dta_inventario_linx,'#13#10'       '#39'IBDB_'#39'||c.cod' +
      '_filial "DATABASE",'#13#10'       '#39'IBT_'#39'||c.cod_filial  "TRANSACAO",'#13#10 +
      '       c.ind_domingo'#13#10#13#10'FROM EMP_CONEXOES c'#13#10'--//Where c.cod_fil' +
      'ial='#39'99'#39#39';'#13#10#13#10'WHERE ((c.dta_inicio_linx IS NOT NULL AND c.ind_at' +
      'ivo='#39'SIM'#39')'#13#10'       OR'#13#10'       (c.cod_filial='#39'99'#39')'#13#10'       OR'#13#10'  ' +
      '     (c.cod_filial='#39'50'#39'))'#13#10#13#10'ORDER BY c.ind_domingo, c.dta_inici' +
      'o_linx, c.cod_filial'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 55
    Top = 163
  end
  object DSP_EmpProcessa: TDataSetProvider
    DataSet = SDS_EmpProcessa
    Left = 128
    Top = 180
  end
  object CDS_EmpProcessa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_EmpProcessa'
    Left = 190
    Top = 168
    object CDS_EmpProcessaCOD_FILIAL: TStringField
      FieldName = 'COD_FILIAL'
      Required = True
      Size = 2
    end
    object CDS_EmpProcessaENDERECO_IP: TStringField
      FieldName = 'ENDERECO_IP'
      Required = True
      Size = 30
    end
    object CDS_EmpProcessaENDERECO_IP_EXTERNO: TStringField
      FieldName = 'ENDERECO_IP_EXTERNO'
      Size = 30
    end
    object CDS_EmpProcessaPASTA_BASE_DADOS: TStringField
      FieldName = 'PASTA_BASE_DADOS'
      Required = True
      Size = 100
    end
    object CDS_EmpProcessaDES_BASE_DADOS: TStringField
      FieldName = 'DES_BASE_DADOS'
      Required = True
      Size = 100
    end
    object CDS_EmpProcessaCOD_EMP: TStringField
      FieldName = 'COD_EMP'
      Required = True
      Size = 6
    end
    object CDS_EmpProcessaRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 60
    end
    object CDS_EmpProcessaTIP_EMP: TStringField
      FieldName = 'TIP_EMP'
      Size = 1
    end
    object CDS_EmpProcessaIND_ATIVO: TStringField
      FieldName = 'IND_ATIVO'
      Size = 3
    end
    object CDS_EmpProcessaDATABASE: TStringField
      FieldName = 'DATABASE'
      Required = True
      Size = 7
    end
    object CDS_EmpProcessaTRANSACAO: TStringField
      FieldName = 'TRANSACAO'
      Required = True
      Size = 6
    end
    object CDS_EmpProcessaCOD_LINX: TIntegerField
      FieldName = 'COD_LINX'
    end
    object CDS_EmpProcessaDTA_INICIO_LINX: TDateField
      FieldName = 'DTA_INICIO_LINX'
    end
    object CDS_EmpProcessaDTA_INVENTARIO_LINX: TDateField
      FieldName = 'DTA_INVENTARIO_LINX'
    end
    object CDS_EmpProcessaIND_DOMINGO: TStringField
      FieldName = 'IND_DOMINGO'
      FixedChar = True
      Size = 1
    end
  end
  object SDS_LojaLinx: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 239
    Top = 289
  end
  object CDS_LojaLinx: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_LojaLinx'
    Left = 333
    Top = 288
  end
  object DSP_LojaLinx: TDataSetProvider
    DataSet = SDS_LojaLinx
    Options = [poRetainServerOrder]
    Left = 284
    Top = 302
  end
  object CDS_BuscaRapida: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_BuscaRapida'
    Left = 157
    Top = 96
  end
  object DSP_BuscaRapida: TDataSetProvider
    DataSet = SQLQ_BuscaRapida
    Options = [poRetainServerOrder]
    Left = 108
    Top = 110
  end
  object SQLQ_BuscaRapida: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 56
    Top = 96
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 296
    Top = 40
  end
end
