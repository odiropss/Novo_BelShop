object DMMovtosEmpresas: TDMMovtosEmpresas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 458
  Top = 121
  Height = 581
  Width = 768
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
    Left = 24
    Top = 16
  end
  object SDS_Busca: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 95
    Top = 217
  end
  object CDS_Busca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Busca'
    Left = 197
    Top = 216
  end
  object DSP_Busca: TDataSetProvider
    DataSet = SDS_Busca
    Options = [poRetainServerOrder]
    Left = 148
    Top = 230
  end
  object SDS_EmpProcessa: TSQLDataSet
    CommandText = 
      'Select '#13#10'c.COD_FILIAL, c.ENDERECO_IP, c.endereco_ip_externo,'#13#10'c.' +
      'PASTA_BASE_DADOS, c.DES_BASE_DADOS, c.COD_EMP, c.RAZAO_SOCIAL, c' +
      '.TIP_EMP,'#13#10'c.IND_ATIVO,'#13#10#39'IBDB_'#39'||c.COD_FILIAL "DATABASE",'#13#10#39'IBT' +
      '_'#39'||c.COD_FILIAL  "TRANSACAO",'#13#10'c.COD_LINX'#13#10#13#10'From EMP_Conexoes ' +
      'c'#13#10'Where (c.Ind_Ativo='#39'SIM'#39' or c.cod_filial=99)'#13#10'Order by c.Cod_' +
      'Emp'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 79
    Top = 147
  end
  object CDS_EmpProcessa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_EmpProcessa'
    Left = 206
    Top = 152
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
  end
  object DSP_EmpProcessa: TDataSetProvider
    DataSet = SDS_EmpProcessa
    Options = [poRetainServerOrder]
    Left = 144
    Top = 164
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
  object SDS_Produto: TSQLDataSet
    CommandText = 'select *'#13#10'from PRODUTO'#13#10'Where CODPRODUTO<0'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 511
    Top = 51
  end
  object DSP_Produto: TDataSetProvider
    DataSet = SDS_Produto
    Options = [poRetainServerOrder]
    Left = 562
    Top = 66
  end
  object CDS_Produto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Produto'
    Left = 612
    Top = 52
  end
  object IBQ_ProdutoMPMS: TIBQuery
    Database = DMConexoes.IBDB_MPMS
    Transaction = DMConexoes.IBT_MPMS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select'
      
        #39'UPDATE OR INSERT INTO PRODUTO (CODPRODUTO, APRESENTACAO, CODBAR' +
        'RA, SITUACAOPRO, UNIDADE, UNIDADEESTOQUE, CLASSEABC, PRINCIPALFO' +
        'R, NOMEFORNECEDOR, REFERENCIA, CODGRUPOSUB, CODGRUPO, NOMEGRUPO,' +
        ' CODSUBGRUPO, NOMESUBGRUPO, CODFAMILIAPRECO, NOMEFAMILIAPRECO, N' +
        'OMEGENERICO, CODAPLICACAO, NOMEAPLICACAO, CODICMVENDA, CODICMCOM' +
        'PRA, CODIPICOMPRA, CODIPIVENDA, ISS, PESO, PESOBRUTO, CODNACIONA' +
        'LIDADE, CONTROLALOTE, DIASVENCELOTE, NAOVENDEZERADO, CODMERCOSUL' +
        'NCM, GRUPOSTMVA, CODPISCOFINS_VENDA, CODPISCOFINS_COMPRA, ECOMME' +
        'RCE_SN, PRECOCOMPRA, PRECOVENDA, MARGEM, DATAINCLUSAO, DATAALTER' +
        'ACAO, DTA_ATUALIZACAO) values ('#39'||'
      #39#39#39#39'||pr.codproduto||'#39#39#39','#39'||'
      #39#39#39#39'||replace (COALESCE(pr.apresentacao,'#39#39'),'#39#39#39#39','#39'"'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.codbarra,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.situacaopro,'#39'0'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.unidade,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.unidadeestoque,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.classeabc,'#39'E'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.principalfor,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||replace (COALESCE(fo.nomefornecedor,'#39#39'),'#39#39#39#39','#39'"'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.referencia,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.codgruposub,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(gr.codgrupo,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(gr.nomegrupo,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(sg.codsubgrupo,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||replace (COALESCE(sg.nomesubgrupo,'#39#39'),'#39#39#39#39','#39'"'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.codfamiliapreco,'#39#39')||'#39#39#39','#39'||'
      
        #39#39#39#39'||replace (COALESCE(fp.nomefamiliapreco,'#39#39'),'#39#39#39#39','#39'"'#39')||'#39#39#39','#39 +
        '||'
      #39#39#39#39'||replace (COALESCE(pr.nomegenerico,'#39#39'),'#39#39#39#39','#39'"'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.codaplicacao,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||replace (COALESCE(ap.nomeaplicacao,'#39#39'),'#39#39#39#39','#39'"'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.codicmvenda,'#39'00'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.codicmcompra,'#39'00'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.codipicompra,'#39'00'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.codipivenda,'#39'00'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.iss,0.00) ||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.peso,0.0000)||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.pesobruto,0.0000)||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.codnacionalidade,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.controlalote,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.diasvencelote,0)||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.naovendezerado,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.codmercosulncm,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.grupostmva,0)||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.codpiscofins_venda,'#39'00'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.codpiscofins_compra,'#39'00'#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(pr.ecommerce_sn,'#39#39')||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(lp.precocompra, 0.0000)||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(lp.precovenda,0.0000)||'#39#39#39','#39'||'
      #39#39#39#39'||COALESCE(lp.margem, 0.0000)||'#39#39#39','#39'||'
      #39#39#39#39'||pr.datainclusao||'#39#39#39','#39'||'
      #39#39#39#39'||pr.dataalteracao||'#39#39#39','#39'||'
      #39#39#39#39'||current_date||'#39#39#39#39'||'
      #39') MATCHING (CODPRODUTO)'#39' UPDATE_INSERT'
      ''
      'from produto pr'
      '     left join gruposub sg  on sg.codgruposub=pr.codgruposub'
      '     left join grupo    gr  on gr.codgrupo=sg.codgrupo'
      
        '     left join familiap fp  on fp.codfamiliapreco=pr.codfamiliap' +
        'reco'
      '     left join aplica   ap  on ap.codaplicacao=pr.codaplicacao'
      '     left join forneced fo  on fo.codfornecedor=pr.principalfor'
      '     left join listapre lp  on lp.codlista='#39'0006'#39
      '                           and lp.codproduto=pr.codproduto')
    Left = 424
    Top = 16
    object IBQ_ProdutoMPMSUPDATE_INSERT: TIBStringField
      FieldName = 'UPDATE_INSERT'
      Size = 1359
    end
  end
  object IBQ_ListaPrecosMPMS: TIBQuery
    Database = DMConexoes.IBDB_MPMS
    Transaction = DMConexoes.IBT_MPMS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      
        'l.CODLISTA, l.CODPRODUTO, l.PRECOCOMPRA, l.MARGEM, l.PRECOVENDA,' +
        ' l.PRECOANTERIOR,'
      
        'l.DATAALTERACAO, l.HORAALTERACAO, l.DESCONTO, l.DESCONTOMAX, l.D' +
        'ESATIVADO,'
      'l.PRECODOLAR, l.ACRECIMOLISTA, '
      'l.CUSTOSLISTA, CURRENT_DATE DTA_ATUALIZACAO'
      ''
      'FROM LISTAPRE l'
      ''
      'ORDER BY 1')
    Left = 424
    Top = 128
    object IBQ_ListaPrecosMPMSCODLISTA: TIBStringField
      FieldName = 'CODLISTA'
      Origin = 'LISTAPRE.CODLISTA'
      Required = True
      FixedChar = True
      Size = 4
    end
    object IBQ_ListaPrecosMPMSCODPRODUTO: TIBStringField
      FieldName = 'CODPRODUTO'
      Origin = 'LISTAPRE.CODPRODUTO'
      Required = True
      FixedChar = True
      Size = 6
    end
    object IBQ_ListaPrecosMPMSPRECOCOMPRA: TIBBCDField
      FieldName = 'PRECOCOMPRA'
      Origin = 'LISTAPRE.PRECOCOMPRA'
      Precision = 18
      Size = 4
    end
    object IBQ_ListaPrecosMPMSMARGEM: TIBBCDField
      FieldName = 'MARGEM'
      Origin = 'LISTAPRE.MARGEM'
      Precision = 18
      Size = 4
    end
    object IBQ_ListaPrecosMPMSPRECOVENDA: TIBBCDField
      FieldName = 'PRECOVENDA'
      Origin = 'LISTAPRE.PRECOVENDA'
      Precision = 18
      Size = 4
    end
    object IBQ_ListaPrecosMPMSPRECOANTERIOR: TIBBCDField
      FieldName = 'PRECOANTERIOR'
      Origin = 'LISTAPRE.PRECOANTERIOR'
      Precision = 18
      Size = 4
    end
    object IBQ_ListaPrecosMPMSDATAALTERACAO: TDateField
      FieldName = 'DATAALTERACAO'
      Origin = 'LISTAPRE.DATAALTERACAO'
    end
    object IBQ_ListaPrecosMPMSHORAALTERACAO: TTimeField
      FieldName = 'HORAALTERACAO'
      Origin = 'LISTAPRE.HORAALTERACAO'
    end
    object IBQ_ListaPrecosMPMSDESCONTO: TIBBCDField
      FieldName = 'DESCONTO'
      Origin = 'LISTAPRE.DESCONTO'
      Precision = 4
      Size = 2
    end
    object IBQ_ListaPrecosMPMSDESCONTOMAX: TIBBCDField
      FieldName = 'DESCONTOMAX'
      Origin = 'LISTAPRE.DESCONTOMAX'
      Precision = 4
      Size = 2
    end
    object IBQ_ListaPrecosMPMSDESATIVADO: TIBStringField
      FieldName = 'DESATIVADO'
      Origin = 'LISTAPRE.DESATIVADO'
      FixedChar = True
      Size = 1
    end
    object IBQ_ListaPrecosMPMSPRECODOLAR: TIBBCDField
      FieldName = 'PRECODOLAR'
      Origin = 'LISTAPRE.PRECODOLAR'
      Precision = 18
      Size = 4
    end
    object IBQ_ListaPrecosMPMSACRECIMOLISTA: TIBBCDField
      FieldName = 'ACRECIMOLISTA'
      Origin = 'LISTAPRE.ACRECIMOLISTA'
      Precision = 9
      Size = 2
    end
    object IBQ_ListaPrecosMPMSCUSTOSLISTA: TIBBCDField
      FieldName = 'CUSTOSLISTA'
      Origin = 'LISTAPRE.CUSTOSLISTA'
      Precision = 9
      Size = 2
    end
    object IBQ_ListaPrecosMPMSDTA_ATUALIZACAO: TDateField
      FieldName = 'DTA_ATUALIZACAO'
      Required = True
    end
  end
  object SDS_ListaPrecos: TSQLDataSet
    CommandText = 'SELECT *'#13#10'FROM LISTAPRE'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 376
    Top = 184
  end
  object DSP_ListaPrecos: TDataSetProvider
    DataSet = SDS_ListaPrecos
    Options = [poRetainServerOrder]
    Left = 436
    Top = 200
  end
  object CDS_ListaPrecos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ListaPrecos'
    Left = 495
    Top = 186
    object CDS_ListaPrecosCODLISTA: TStringField
      FieldName = 'CODLISTA'
      Required = True
      FixedChar = True
      Size = 4
    end
    object CDS_ListaPrecosCODPRODUTO: TStringField
      FieldName = 'CODPRODUTO'
      Required = True
      FixedChar = True
      Size = 6
    end
    object CDS_ListaPrecosPRECOCOMPRA: TFMTBCDField
      FieldName = 'PRECOCOMPRA'
      Precision = 15
      Size = 4
    end
    object CDS_ListaPrecosMARGEM: TFMTBCDField
      FieldName = 'MARGEM'
      Precision = 15
      Size = 4
    end
    object CDS_ListaPrecosPRECOVENDA: TFMTBCDField
      FieldName = 'PRECOVENDA'
      Precision = 15
      Size = 4
    end
    object CDS_ListaPrecosPRECOANTERIOR: TFMTBCDField
      FieldName = 'PRECOANTERIOR'
      Precision = 15
      Size = 4
    end
    object CDS_ListaPrecosDATAALTERACAO: TDateField
      FieldName = 'DATAALTERACAO'
    end
    object CDS_ListaPrecosHORAALTERACAO: TTimeField
      FieldName = 'HORAALTERACAO'
    end
    object CDS_ListaPrecosDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 15
      Size = 2
    end
    object CDS_ListaPrecosDESCONTOMAX: TFMTBCDField
      FieldName = 'DESCONTOMAX'
      Precision = 15
      Size = 2
    end
    object CDS_ListaPrecosDESATIVADO: TStringField
      FieldName = 'DESATIVADO'
      FixedChar = True
      Size = 1
    end
    object CDS_ListaPrecosPRECODOLAR: TFMTBCDField
      FieldName = 'PRECODOLAR'
      Precision = 15
      Size = 4
    end
    object CDS_ListaPrecosACRECIMOLISTA: TFMTBCDField
      FieldName = 'ACRECIMOLISTA'
      Precision = 15
      Size = 2
    end
    object CDS_ListaPrecosCUSTOSLISTA: TFMTBCDField
      FieldName = 'CUSTOSLISTA'
      Precision = 15
      Size = 2
    end
    object CDS_ListaPrecosDTA_ATUALIZACAO: TDateField
      FieldName = 'DTA_ATUALIZACAO'
    end
  end
  object IBQ_FornecedoresMPMS: TIBQuery
    Database = DMConexoes.IBDB_MPMS
    Transaction = DMConexoes.IBT_MPMS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select f.CODFORNECEDOR, f.NOMEFORNECEDOR, f.EFILIAL, f.CODTIPOFO' +
        'R, f.CIDADE,'
      
        'f.ESTADO, f.CODIGOPOSTAL, f.NUMEROCGCMF, f.NUMEROINSC, f.NUMEROI' +
        'SSQN,'
      
        'f.NUMEROCPF, f.PESSOA, f.FONE1, f.FONE2, f.FONEFAX, f.INTERNET, ' +
        'f.EMAIL,'
      
        'f.CLASSEFOR, f.CONTATO, f.OBSERVACAO, f.BAIRRO, f.SIMPLESESTADUA' +
        'L,'
      
        'f.CODCENTROCUSTO, f.LOGRADOURO, f.LOGNUMERO, f.LOGCOMPL, f.CODPA' +
        'IS, f.RAZAOSOCIAL,'
      
        'f.DATAALTERACAO, f.FORISENTOICM, f.FORISENTOIPI, f.FORISENTOSUBS' +
        'T,'
      'f.FORISENTOPISCOFINS, f.USAICMCOMPRA2_SN,'
      'CURRENT_TIMESTAMP DTA_ATUALIZACAO'
      ''
      'from forneced f'
      'order by 1')
    Left = 512
    Top = 272
    object IBQ_FornecedoresMPMSCODFORNECEDOR: TIBStringField
      FieldName = 'CODFORNECEDOR'
      Origin = 'FORNECED.CODFORNECEDOR'
      Required = True
      FixedChar = True
      Size = 6
    end
    object IBQ_FornecedoresMPMSNOMEFORNECEDOR: TIBStringField
      FieldName = 'NOMEFORNECEDOR'
      Origin = 'FORNECED.NOMEFORNECEDOR'
      Size = 40
    end
    object IBQ_FornecedoresMPMSEFILIAL: TIBStringField
      FieldName = 'EFILIAL'
      Origin = 'FORNECED.EFILIAL'
      FixedChar = True
      Size = 1
    end
    object IBQ_FornecedoresMPMSCODTIPOFOR: TIBStringField
      FieldName = 'CODTIPOFOR'
      Origin = 'FORNECED.CODTIPOFOR'
      FixedChar = True
      Size = 2
    end
    object IBQ_FornecedoresMPMSCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'FORNECED.CIDADE'
      FixedChar = True
      Size = 35
    end
    object IBQ_FornecedoresMPMSESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'FORNECED.ESTADO'
      FixedChar = True
      Size = 2
    end
    object IBQ_FornecedoresMPMSCODIGOPOSTAL: TIBStringField
      FieldName = 'CODIGOPOSTAL'
      Origin = 'FORNECED.CODIGOPOSTAL'
      FixedChar = True
      Size = 8
    end
    object IBQ_FornecedoresMPMSNUMEROCGCMF: TIBStringField
      FieldName = 'NUMEROCGCMF'
      Origin = 'FORNECED.NUMEROCGCMF'
      FixedChar = True
      Size = 16
    end
    object IBQ_FornecedoresMPMSNUMEROINSC: TIBStringField
      FieldName = 'NUMEROINSC'
      Origin = 'FORNECED.NUMEROINSC'
      FixedChar = True
      Size = 16
    end
    object IBQ_FornecedoresMPMSNUMEROISSQN: TIBStringField
      FieldName = 'NUMEROISSQN'
      Origin = 'FORNECED.NUMEROISSQN'
      FixedChar = True
      Size = 10
    end
    object IBQ_FornecedoresMPMSNUMEROCPF: TIBStringField
      FieldName = 'NUMEROCPF'
      Origin = 'FORNECED.NUMEROCPF'
      FixedChar = True
      Size = 12
    end
    object IBQ_FornecedoresMPMSPESSOA: TIBStringField
      FieldName = 'PESSOA'
      Origin = 'FORNECED.PESSOA'
      FixedChar = True
      Size = 1
    end
    object IBQ_FornecedoresMPMSFONE1: TIBStringField
      FieldName = 'FONE1'
      Origin = 'FORNECED.FONE1'
      FixedChar = True
      Size = 15
    end
    object IBQ_FornecedoresMPMSFONE2: TIBStringField
      FieldName = 'FONE2'
      Origin = 'FORNECED.FONE2'
      FixedChar = True
      Size = 15
    end
    object IBQ_FornecedoresMPMSFONEFAX: TIBStringField
      FieldName = 'FONEFAX'
      Origin = 'FORNECED.FONEFAX'
      FixedChar = True
      Size = 15
    end
    object IBQ_FornecedoresMPMSINTERNET: TIBStringField
      FieldName = 'INTERNET'
      Origin = 'FORNECED.INTERNET'
      FixedChar = True
      Size = 80
    end
    object IBQ_FornecedoresMPMSEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'FORNECED.EMAIL'
      FixedChar = True
      Size = 80
    end
    object IBQ_FornecedoresMPMSCLASSEFOR: TIBStringField
      FieldName = 'CLASSEFOR'
      Origin = 'FORNECED.CLASSEFOR'
      FixedChar = True
      Size = 1
    end
    object IBQ_FornecedoresMPMSCONTATO: TIBStringField
      FieldName = 'CONTATO'
      Origin = 'FORNECED.CONTATO'
      FixedChar = True
      Size = 30
    end
    object IBQ_FornecedoresMPMSOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'FORNECED.OBSERVACAO'
      BlobType = ftMemo
      Size = 8
    end
    object IBQ_FornecedoresMPMSBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = 'FORNECED.BAIRRO'
      FixedChar = True
      Size = 25
    end
    object IBQ_FornecedoresMPMSSIMPLESESTADUAL: TIBStringField
      FieldName = 'SIMPLESESTADUAL'
      Origin = 'FORNECED.SIMPLESESTADUAL'
      FixedChar = True
      Size = 1
    end
    object IBQ_FornecedoresMPMSCODCENTROCUSTO: TIBStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'FORNECED.CODCENTROCUSTO'
      FixedChar = True
      Size = 7
    end
    object IBQ_FornecedoresMPMSLOGRADOURO: TIBStringField
      FieldName = 'LOGRADOURO'
      Origin = 'FORNECED.LOGRADOURO'
      Required = True
      Size = 60
    end
    object IBQ_FornecedoresMPMSLOGNUMERO: TIBStringField
      FieldName = 'LOGNUMERO'
      Origin = 'FORNECED.LOGNUMERO'
      Required = True
      Size = 10
    end
    object IBQ_FornecedoresMPMSLOGCOMPL: TIBStringField
      FieldName = 'LOGCOMPL'
      Origin = 'FORNECED.LOGCOMPL'
      Required = True
      Size = 30
    end
    object IBQ_FornecedoresMPMSCODPAIS: TIBStringField
      FieldName = 'CODPAIS'
      Origin = 'FORNECED.CODPAIS'
      Required = True
      FixedChar = True
      Size = 3
    end
    object IBQ_FornecedoresMPMSRAZAOSOCIAL: TIBStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'FORNECED.RAZAOSOCIAL'
      Size = 80
    end
    object IBQ_FornecedoresMPMSDATAALTERACAO: TDateTimeField
      FieldName = 'DATAALTERACAO'
      Origin = 'FORNECED.DATAALTERACAO'
    end
    object IBQ_FornecedoresMPMSFORISENTOICM: TIBStringField
      FieldName = 'FORISENTOICM'
      Origin = 'FORNECED.FORISENTOICM'
      FixedChar = True
      Size = 1
    end
    object IBQ_FornecedoresMPMSFORISENTOIPI: TIBStringField
      FieldName = 'FORISENTOIPI'
      Origin = 'FORNECED.FORISENTOIPI'
      FixedChar = True
      Size = 1
    end
    object IBQ_FornecedoresMPMSFORISENTOSUBST: TIBStringField
      FieldName = 'FORISENTOSUBST'
      Origin = 'FORNECED.FORISENTOSUBST'
      FixedChar = True
      Size = 1
    end
    object IBQ_FornecedoresMPMSFORISENTOPISCOFINS: TIBStringField
      FieldName = 'FORISENTOPISCOFINS'
      Origin = 'FORNECED.FORISENTOPISCOFINS'
      FixedChar = True
      Size = 1
    end
    object IBQ_FornecedoresMPMSUSAICMCOMPRA2_SN: TIBStringField
      FieldName = 'USAICMCOMPRA2_SN'
      Origin = 'FORNECED.USAICMCOMPRA2_SN'
      FixedChar = True
      Size = 1
    end
    object IBQ_FornecedoresMPMSDTA_ATUALIZACAO: TDateField
      FieldName = 'DTA_ATUALIZACAO'
      Required = True
    end
  end
  object SDS_Fornecedores: TSQLDataSet
    CommandText = 'select * from FORNECEDOR'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 456
    Top = 336
  end
  object DSP_Fornecedores: TDataSetProvider
    DataSet = SDS_Fornecedores
    Options = [poRetainServerOrder]
    Left = 521
    Top = 352
  end
  object CDS_Fornecedores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Fornecedores'
    Left = 584
    Top = 336
    object CDS_FornecedoresCODFORNECEDOR: TStringField
      FieldName = 'CODFORNECEDOR'
      Required = True
      FixedChar = True
      Size = 6
    end
    object CDS_FornecedoresNOMEFORNECEDOR: TStringField
      FieldName = 'NOMEFORNECEDOR'
      Size = 40
    end
    object CDS_FornecedoresEFILIAL: TStringField
      FieldName = 'EFILIAL'
      FixedChar = True
      Size = 1
    end
    object CDS_FornecedoresCODTIPOFOR: TStringField
      FieldName = 'CODTIPOFOR'
      FixedChar = True
      Size = 2
    end
    object CDS_FornecedoresCIDADE: TStringField
      FieldName = 'CIDADE'
      FixedChar = True
      Size = 35
    end
    object CDS_FornecedoresESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object CDS_FornecedoresCODIGOPOSTAL: TStringField
      FieldName = 'CODIGOPOSTAL'
      FixedChar = True
      Size = 8
    end
    object CDS_FornecedoresNUMEROCGCMF: TStringField
      FieldName = 'NUMEROCGCMF'
      FixedChar = True
      Size = 16
    end
    object CDS_FornecedoresNUMEROINSC: TStringField
      FieldName = 'NUMEROINSC'
      FixedChar = True
      Size = 16
    end
    object CDS_FornecedoresNUMEROISSQN: TStringField
      FieldName = 'NUMEROISSQN'
      FixedChar = True
      Size = 10
    end
    object CDS_FornecedoresNUMEROCPF: TStringField
      FieldName = 'NUMEROCPF'
      FixedChar = True
      Size = 12
    end
    object CDS_FornecedoresPESSOA: TStringField
      FieldName = 'PESSOA'
      FixedChar = True
      Size = 1
    end
    object CDS_FornecedoresFONE1: TStringField
      FieldName = 'FONE1'
      FixedChar = True
      Size = 15
    end
    object CDS_FornecedoresFONE2: TStringField
      FieldName = 'FONE2'
      FixedChar = True
      Size = 15
    end
    object CDS_FornecedoresFONEFAX: TStringField
      FieldName = 'FONEFAX'
      FixedChar = True
      Size = 15
    end
    object CDS_FornecedoresINTERNET: TStringField
      FieldName = 'INTERNET'
      FixedChar = True
      Size = 80
    end
    object CDS_FornecedoresEMAIL: TStringField
      FieldName = 'EMAIL'
      FixedChar = True
      Size = 80
    end
    object CDS_FornecedoresCLASSEFOR: TStringField
      FieldName = 'CLASSEFOR'
      FixedChar = True
      Size = 1
    end
    object CDS_FornecedoresCONTATO: TStringField
      FieldName = 'CONTATO'
      FixedChar = True
      Size = 30
    end
    object CDS_FornecedoresOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object CDS_FornecedoresBAIRRO: TStringField
      FieldName = 'BAIRRO'
      FixedChar = True
      Size = 25
    end
    object CDS_FornecedoresSIMPLESESTADUAL: TStringField
      FieldName = 'SIMPLESESTADUAL'
      FixedChar = True
      Size = 1
    end
    object CDS_FornecedoresCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 7
    end
    object CDS_FornecedoresLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Required = True
      Size = 60
    end
    object CDS_FornecedoresLOGNUMERO: TStringField
      FieldName = 'LOGNUMERO'
      Required = True
      Size = 10
    end
    object CDS_FornecedoresLOGCOMPL: TStringField
      FieldName = 'LOGCOMPL'
      Required = True
      Size = 30
    end
    object CDS_FornecedoresCODPAIS: TStringField
      FieldName = 'CODPAIS'
      Required = True
      FixedChar = True
      Size = 3
    end
    object CDS_FornecedoresRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 80
    end
    object CDS_FornecedoresDATAALTERACAO: TSQLTimeStampField
      FieldName = 'DATAALTERACAO'
    end
    object CDS_FornecedoresFORISENTOICM: TStringField
      FieldName = 'FORISENTOICM'
      FixedChar = True
      Size = 1
    end
    object CDS_FornecedoresFORISENTOIPI: TStringField
      FieldName = 'FORISENTOIPI'
      FixedChar = True
      Size = 1
    end
    object CDS_FornecedoresFORISENTOSUBST: TStringField
      FieldName = 'FORISENTOSUBST'
      FixedChar = True
      Size = 1
    end
    object CDS_FornecedoresFORISENTOPISCOFINS: TStringField
      FieldName = 'FORISENTOPISCOFINS'
      FixedChar = True
      Size = 1
    end
    object CDS_FornecedoresUSAICMCOMPRA2_SN: TStringField
      FieldName = 'USAICMCOMPRA2_SN'
      FixedChar = True
      Size = 1
    end
    object CDS_FornecedoresDTA_ATUALIZACAO: TSQLTimeStampField
      FieldName = 'DTA_ATUALIZACAO'
    end
  end
  object SDS_BuscaRapida: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 95
    Top = 289
  end
  object CDS_BuscaRapida: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_BuscaRapida'
    Left = 197
    Top = 288
  end
  object DSP_BuscaRapida: TDataSetProvider
    DataSet = SDS_BuscaRapida
    Options = [poRetainServerOrder]
    Left = 148
    Top = 302
  end
  object SDS_Pesquisa: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 95
    Top = 369
  end
  object CDS_Pesquisa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Pesquisa'
    Left = 197
    Top = 368
  end
  object DSP_Pesquisa: TDataSetProvider
    DataSet = SDS_Pesquisa
    Options = [poRetainServerOrder]
    Left = 148
    Top = 382
  end
  object IBQ_EstoqueLoja: TIBQuery
    Database = DMConexoes.IBDB_01
    Transaction = DMConexoes.IBT_01
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'e.codfilial, e.codproduto, e.saldoatual, e.pedidopendente, '
      'e.zonaendereco, e.corredor, e.prateleira, e.gaveta, '
      'e.cusmedvalor, e.customedio, '
      
        'e.lastprecocompra, e.lastcustomedio, e.estoqueideal, e.estoquema' +
        'ximo, '
      
        'e.dataalteracadastro, e.dataalteraestoque, e.dataalteraestoque_p' +
        'ed, '
      'coalesce(p.principalfor,'#39'000000'#39') principalfor, '
      'current_date DTA_ATUALIZACAO, '#39'19:28:14'#39' HRA_ATUALIZACAO '
      'FROM ESTOQUE e'
      '      LEFT JOIN PRODUTO p on e.codproduto=p.codproduto '
      'WHERE e.codfilial='#39'99'#39)
    Left = 312
    Top = 424
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
  object SQLQ: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 56
    Top = 72
  end
  object SDS_UnicoBusca: TSQLDataSet
    CommandText = 
      'select current_timestamp, current_date, current_time'#13#10'from rdb$d' +
      'atabase'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 143
    Top = 91
  end
  object SimpleDS: TSimpleDataSet
    Aggregates = <>
    Connection = SQLC
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 664
    Top = 160
  end
  object SDS: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 247
    Top = 33
  end
  object SDS_LojaLinx: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 71
    Top = 457
  end
  object CDS_LojaLinx: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_LojaLinx'
    Left = 165
    Top = 456
  end
  object DSP_LojaLinx: TDataSetProvider
    DataSet = SDS_LojaLinx
    Options = [poRetainServerOrder]
    Left = 116
    Top = 470
  end
  object DS_EmpProcessa: TDataSource
    DataSet = CDS_EmpProcessa
    Left = 272
    Top = 168
  end
end
