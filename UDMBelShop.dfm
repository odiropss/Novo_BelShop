object DMBelShop: TDMBelShop
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 47
  Height = 726
  Width = 1305
  object SQLC: TSQLConnection
    ConnectionName = 'BelShop'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=\\LOCALHOST\C:\Projetos\BelShop\Dados\BELSHOP.FDB'
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
    Left = 32
    Top = 16
  end
  object SDS_Busca: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 35
    Top = 308
  end
  object DSP_Usuario: TDataSetProvider
    DataSet = SDS_Usuario
    Left = 73
    Top = 564
  end
  object CDS_Usuario: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'COD_USUARIO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DES_USUARIO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DES_LOGIN'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DES_SENHA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IND_ADMIN'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'IND_ATIVO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'USU_INCLUI'
        DataType = ftInteger
      end
      item
        Name = 'DTA_INCLUI'
        Attributes = [faRequired]
        DataType = ftTimeStamp
      end
      item
        Name = 'USU_ALTERA'
        DataType = ftInteger
      end
      item
        Name = 'DTA_ALTERA'
        DataType = ftTimeStamp
      end>
    IndexDefs = <>
    ObjectView = False
    Params = <>
    ProviderName = 'DSP_Usuario'
    StoreDefs = True
    Left = 113
    Top = 553
  end
  object DS_Usuario: TDataSource
    DataSet = CDS_Usuario
    Left = 149
    Top = 566
  end
  object SDS_Usuario: TSQLDataSet
    ObjectView = True
    CommandText = 'select *'#13#10' from PS_USUARIOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 32
    Top = 551
  end
  object SDS_Pesquisa: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 32
    Top = 475
  end
  object CDS_Pesquisa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Pesquisa'
    Left = 113
    Top = 488
  end
  object DSP_Pesquisa: TDataSetProvider
    DataSet = SDS_Pesquisa
    Left = 73
    Top = 500
  end
  object DS_Pesquisa: TDataSource
    DataSet = CDS_Pesquisa
    Left = 149
    Top = 500
  end
  object DSP_Empresa: TDataSetProvider
    DataSet = SDS_Empresa
    Left = 73
    Top = 622
  end
  object CDS_Empresa: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'COD_FILIAL'
        Attributes = [faRequired]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ENDERECO_IP'
        Attributes = [faRequired]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ENDERECO_IP_EXTERNO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'PASTA_BASE_DADOS'
        Attributes = [faRequired]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DES_BASE_DADOS'
        Attributes = [faRequired]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'COD_EMP'
        Attributes = [faRequired]
        DataType = ftString
        Size = 6
      end
      item
        Name = 'RAZAO_SOCIAL'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TIP_EMP'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DES_BAIRRO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DES_CIDADE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'COD_UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'COD_CEP'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'NUM_CNPJ'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'INSCR_ESTADUAL'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'DES_ENDERECO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NUM_ENDERECO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'COMPL_ENDERECO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DTA_LIM_TRANSF'
        DataType = ftDate
      end
      item
        Name = 'QTD_TRANSF_DIA'
        DataType = ftInteger
      end
      item
        Name = 'COD_LISTAPRE'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'IND_ATIVO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'USU_INCLUI'
        DataType = ftInteger
      end
      item
        Name = 'DTA_INCLUI'
        Attributes = [faRequired]
        DataType = ftTimeStamp
      end
      item
        Name = 'USU_ALTERA'
        DataType = ftInteger
      end
      item
        Name = 'DTA_ALTERA'
        DataType = ftTimeStamp
      end
      item
        Name = 'NUM_SINDICATO'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NUM_ALVARA_MUN'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'COD_CONTABIL'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    IndexFieldNames = 'RAZAO_SOCIAL'
    ObjectView = False
    Params = <>
    ProviderName = 'DSP_Empresa'
    StoreDefs = True
    AfterScroll = CDS_EmpresaAfterScroll
    Left = 113
    Top = 610
    object CDS_EmpresaCOD_FILIAL: TStringField
      Alignment = taRightJustify
      FieldName = 'COD_FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object CDS_EmpresaENDERECO_IP: TStringField
      FieldName = 'ENDERECO_IP'
      Required = True
      Size = 30
    end
    object CDS_EmpresaENDERECO_IP_EXTERNO: TStringField
      FieldName = 'ENDERECO_IP_EXTERNO'
      Size = 30
    end
    object CDS_EmpresaPASTA_BASE_DADOS: TStringField
      FieldName = 'PASTA_BASE_DADOS'
      Required = True
      Size = 100
    end
    object CDS_EmpresaDES_BASE_DADOS: TStringField
      FieldName = 'DES_BASE_DADOS'
      Required = True
      Size = 100
    end
    object CDS_EmpresaCOD_EMP: TStringField
      Alignment = taRightJustify
      FieldName = 'COD_EMP'
      Required = True
      Size = 6
    end
    object CDS_EmpresaRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 60
    end
    object CDS_EmpresaTIP_EMP: TStringField
      FieldName = 'TIP_EMP'
      Size = 1
    end
    object CDS_EmpresaDES_BAIRRO: TStringField
      FieldName = 'DES_BAIRRO'
      Size = 30
    end
    object CDS_EmpresaDES_CIDADE: TStringField
      FieldName = 'DES_CIDADE'
      Size = 60
    end
    object CDS_EmpresaCOD_UF: TStringField
      FieldName = 'COD_UF'
      Size = 2
    end
    object CDS_EmpresaCOD_CEP: TStringField
      Alignment = taRightJustify
      FieldName = 'COD_CEP'
      Size = 8
    end
    object CDS_EmpresaNUM_CNPJ: TStringField
      Alignment = taRightJustify
      FieldName = 'NUM_CNPJ'
      Size = 18
    end
    object CDS_EmpresaINSCR_ESTADUAL: TStringField
      FieldName = 'INSCR_ESTADUAL'
      Size = 18
    end
    object CDS_EmpresaNUM_ENDERECO: TStringField
      Alignment = taRightJustify
      FieldName = 'NUM_ENDERECO'
      Size = 15
    end
    object CDS_EmpresaDES_ENDERECO: TStringField
      FieldName = 'DES_ENDERECO'
      Size = 60
    end
    object CDS_EmpresaCOMPL_ENDERECO: TStringField
      FieldName = 'COMPL_ENDERECO'
      Size = 30
    end
    object CDS_EmpresaIND_ATIVO: TStringField
      FieldName = 'IND_ATIVO'
      Size = 3
    end
    object CDS_EmpresaUSU_INCLUI: TIntegerField
      FieldName = 'USU_INCLUI'
    end
    object CDS_EmpresaDTA_INCLUI: TSQLTimeStampField
      FieldName = 'DTA_INCLUI'
      Required = True
    end
    object CDS_EmpresaUSU_ALTERA: TIntegerField
      FieldName = 'USU_ALTERA'
    end
    object CDS_EmpresaDTA_ALTERA: TSQLTimeStampField
      FieldName = 'DTA_ALTERA'
    end
    object CDS_EmpresaDTA_LIM_TRANSF: TDateField
      FieldName = 'DTA_LIM_TRANSF'
    end
    object CDS_EmpresaQTD_TRANSF_DIA: TIntegerField
      FieldName = 'QTD_TRANSF_DIA'
    end
    object CDS_EmpresaCOD_LISTAPRE: TStringField
      FieldName = 'COD_LISTAPRE'
      Size = 4
    end
    object CDS_EmpresaNUM_SINDICATO: TStringField
      FieldName = 'NUM_SINDICATO'
      Size = 25
    end
    object CDS_EmpresaNUM_ALVARA_MUN: TStringField
      FieldName = 'NUM_ALVARA_MUN'
      Size = 25
    end
    object CDS_EmpresaCOD_CONTABIL: TStringField
      FieldName = 'COD_CONTABIL'
      Size = 10
    end
  end
  object DS_Empresa: TDataSource
    DataSet = CDS_Empresa
    Left = 149
    Top = 624
  end
  object SDS_Empresa: TSQLDataSet
    ObjectView = True
    CommandText = 'select * '#13#10'from EMP_CONEXOES'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 32
    Top = 602
  end
  object DS_AComprar: TDataSource
    DataSet = IBQ_AComprar
    Left = 1218
    Top = 229
  end
  object SDS_AComprarItens: TSQLDataSet
    CommandText = 
      'Select distinct oc.cod_item, oc.des_item,'#13#10'oc.num_documento, oc.' +
      'dta_documento,'#13#10'oc.cod_comprador, us.des_usuario'#13#10#13#10'From oc_comp' +
      'rar oc'#13#10'   Left Join ps_usuarios us on us.cod_usuario=oc.cod_com' +
      'prador'#13#10#13#10'Where oc.num_documento= :NumDocto'#13#10#13#10'Order By oc.des_i' +
      'tem'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'NumDocto'
        ParamType = ptInput
      end>
    SQLConnection = SQLC
    Left = 256
    Top = 409
  end
  object CDS_AComprarItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_AComprarItens'
    BeforeScroll = CDS_AComprarItensBeforeScroll
    AfterScroll = CDS_AComprarItensAfterScroll
    Left = 335
    Top = 407
    object CDS_AComprarItensCOD_ITEM: TStringField
      FieldName = 'COD_ITEM'
      Size = 6
    end
    object CDS_AComprarItensDES_ITEM: TStringField
      FieldName = 'DES_ITEM'
      Size = 80
    end
    object CDS_AComprarItensNUM_DOCUMENTO: TIntegerField
      FieldName = 'NUM_DOCUMENTO'
      Required = True
    end
    object CDS_AComprarItensDTA_DOCUMENTO: TSQLTimeStampField
      FieldName = 'DTA_DOCUMENTO'
    end
    object CDS_AComprarItensCOD_COMPRADOR: TIntegerField
      FieldName = 'COD_COMPRADOR'
    end
    object CDS_AComprarItensDES_USUARIO: TStringField
      FieldName = 'DES_USUARIO'
      Size = 50
    end
  end
  object DSP_AComprarItens: TDataSetProvider
    DataSet = SDS_AComprarItens
    Left = 298
    Top = 425
  end
  object DS_AComprarItens: TDataSource
    DataSet = CDS_AComprarItens
    Left = 373
    Top = 425
  end
  object DSP_AComprarOCs: TDataSetProvider
    DataSet = SDS_AComprarOCs
    Left = 298
    Top = 490
  end
  object CDS_AComprarOCs: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'GERAR'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TIPO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'COD_EMP_FIL'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'DES_EMP_FIL'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'IND_OC_GERADA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'COD_FORNECEDOR'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'FORNECEDOR'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TOTAL_BRUTO'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_DESCONTOS'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_IPI'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_DESPESAS'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_ST'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_FRETE'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_REPASSE'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_OCS'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_OC'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_VENDA'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'NUM_DOCUMENTO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NUM_OC_GERADA'
        DataType = ftInteger
      end
      item
        Name = 'DTA_OC_GERADA'
        DataType = ftDate
      end
      item
        Name = 'COD_COMPROVANTE_ICMS'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'TOTAL_ITENS'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'TOTAL_QTD'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_QTD_TRANSF'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_ITENS_ACOMPRAR'
        DataType = ftFMTBcd
        Precision = 15
      end>
    IndexDefs = <>
    ObjectView = False
    Params = <>
    ProviderName = 'DSP_AComprarOCs'
    StoreDefs = True
    AfterScroll = CDS_AComprarOCsAfterScroll
    Left = 335
    Top = 478
    object CDS_AComprarOCsGERAR: TStringField
      FieldName = 'GERAR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDS_AComprarOCsTIPO: TStringField
      DisplayLabel = 'Tp'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object CDS_AComprarOCsCOD_EMP_FIL: TStringField
      Alignment = taCenter
      DisplayLabel = 'C'#243'd Loja'
      FieldName = 'COD_EMP_FIL'
      Size = 6
    end
    object CDS_AComprarOCsDES_EMP_FIL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'DES_EMP_FIL'
      Size = 60
    end
    object CDS_AComprarOCsNUM_DOCUMENTO: TIntegerField
      FieldName = 'NUM_DOCUMENTO'
      Required = True
    end
    object CDS_AComprarOCsIND_OC_GERADA: TStringField
      FieldName = 'IND_OC_GERADA'
      Size = 1
    end
    object CDS_AComprarOCsCOD_FORNECEDOR: TStringField
      FieldName = 'COD_FORNECEDOR'
      Size = 6
    end
    object CDS_AComprarOCsFORNECEDOR: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORNECEDOR'
      Size = 40
    end
    object CDS_AComprarOCsTOTAL_OCS: TFMTBCDField
      FieldName = 'TOTAL_OCS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_OC: TFMTBCDField
      DisplayLabel = 'Total OC'
      FieldName = 'TOTAL_OC'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsNUM_OC_GERADA: TIntegerField
      DisplayLabel = 'OC Gerada'
      FieldName = 'NUM_OC_GERADA'
      DisplayFormat = '0,'
    end
    object CDS_AComprarOCsDTA_OC_GERADA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'DTA_OC_GERADA'
    end
    object CDS_AComprarOCsTOTAL_BRUTO: TFMTBCDField
      DisplayLabel = 'Total Bruto'
      FieldName = 'TOTAL_BRUTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_DESCONTOS: TFMTBCDField
      DisplayLabel = 'Total Descontos'
      FieldName = 'TOTAL_DESCONTOS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_IPI: TFMTBCDField
      DisplayLabel = 'Total IPI'
      FieldName = 'TOTAL_IPI'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_DESPESAS: TFMTBCDField
      DisplayLabel = 'Total Despesas'
      FieldName = 'TOTAL_DESPESAS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_FRETE: TFMTBCDField
      DisplayLabel = 'Total Frete'
      FieldName = 'TOTAL_FRETE'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_ST: TFMTBCDField
      DisplayLabel = 'Total ST'
      FieldName = 'TOTAL_ST'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_ICMS: TFMTBCDField
      DisplayLabel = 'Total ICMS'
      FieldName = 'TOTAL_ICMS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_REPASSE: TFMTBCDField
      DisplayLabel = 'Total Repasse'
      FieldName = 'TOTAL_REPASSE'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsCOD_COMPROVANTE_ICMS: TStringField
      Alignment = taCenter
      DisplayLabel = 'Comprov ICMS'
      FieldName = 'COD_COMPROVANTE_ICMS'
      Size = 3
    end
    object CDS_AComprarOCsTOTAL_ITENS: TIntegerField
      DisplayLabel = 'Total Itens'
      FieldName = 'TOTAL_ITENS'
      Required = True
      DisplayFormat = '0,'
    end
    object CDS_AComprarOCsTOTAL_QTD: TFMTBCDField
      DisplayLabel = 'Total Qtd'
      FieldName = 'TOTAL_QTD'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_VENDA: TFMTBCDField
      DisplayLabel = 'Total Vendas'
      FieldName = 'TOTAL_VENDA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_ITENS_ACOMPRAR: TFMTBCDField
      DisplayLabel = 'Total Itens a Comprar'
      FieldName = 'TOTAL_ITENS_ACOMPRAR'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 0
    end
    object CDS_AComprarOCsTOTAL_QTD_TRANSF: TFMTBCDField
      FieldName = 'TOTAL_QTD_TRANSF'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTALGERAL: TAggregateField
      Alignment = taRightJustify
      FieldName = 'TOTALGERAL'
      Active = True
      DisplayFormat = '0.,00'
      Expression = 'Sum(TOTAL_OCS)'
    end
    object CDS_AComprarOCsTOTALITENS: TAggregateField
      Alignment = taRightJustify
      FieldName = 'TOTALITENS'
      Active = True
      DisplayFormat = '0,'
      Expression = 'SUM(Total_Itens)'
    end
  end
  object DS_AComprarOCs: TDataSource
    DataSet = CDS_AComprarOCs
    Left = 373
    Top = 491
  end
  object SDS_AComprarOCs: TSQLDataSet
    ObjectView = True
    CommandText = 
      'select '#39'N'#39' Gerar,'#13#10'case'#13#10'  when Coalesce(oc.qtd_transf,0)>0 Then' +
      #13#10'    '#39'TR'#39#13#10'  Else'#13#10'    '#39'OC'#39#13#10'end Tipo,'#13#10#13#10'oc.cod_empresa Cod_Em' +
      'p_Fil, oc.des_empresa des_emp_fil, oc.ind_oc_gerada,'#13#10'oc.cod_for' +
      'necedor,  oc.des_fornecedor Fornecedor,'#13#10'sum(Coalesce(oc.vlr_bru' +
      'to,0)) Total_Bruto,'#13#10'sum(Coalesce(oc.vlr_descontos,0)) Total_Des' +
      'contos,'#13#10'sum(Coalesce(oc.vlr_ipi,0)) Total_IPI,'#13#10'sum(Coalesce(oc' +
      '.vlr_despesas,0)) Total_Despesas,'#13#10'sum(Coalesce(oc.vlr_st,0)) To' +
      'tal_ST,'#13#10'sum(Coalesce(oc.vlr_frete,0)) Total_Frete,'#13#10'sum(Coalesc' +
      'e(oc.vlr_icms,0)) Total_ICMS,'#13#10'sum(Coalesce(oc.vlr_repasse,0)) T' +
      'otal_Repasse,'#13#10#13#10'sum(case'#13#10'      when oc.qtd_transf=0 Then'#13#10'    ' +
      '    Coalesce(oc.vlr_tot_compra,0)'#13#10'      Else'#13#10'       0'#13#10'end) To' +
      'tal_OCs,'#13#10#13#10'sum(Coalesce(oc.vlr_tot_compra,0)) Total_OC,'#13#10#13#10'sum(' +
      'Coalesce(oc.vlr_tot_venda,0)) Total_Venda,'#13#10'oc.num_documento,'#13#10'o' +
      'c.num_oc_gerada, '#13#10'cast(oc.dta_oc_gerada as Date) dta_oc_gerada,' +
      #13#10'oc.cod_comprovante_icms,'#13#10'Count(oc.cod_item) Total_Itens,'#13#10'Sum' +
      '(Coalesce(oc.qtd_acomprar,0)) Total_Qtd,'#13#10'Sum(Coalesce(oc.qtd_tr' +
      'ansf,0)) Total_Qtd_Transf,'#13#10#13#10'SUM('#13#10'Case'#13#10'   When oc.QTD_ACOMPRA' +
      'R>0 Then'#13#10'   1'#13#10'   Else'#13#10'   0'#13#10'End) Total_Itens_Acomprar'#13#10#13#10'from' +
      ' oc_comprar oc'#13#10#13#10'Where oc.num_documento=:NrDocto'#13#10#13#10'group by Ti' +
      'po, Cod_Emp_Fil, oc.des_empresa, oc.ind_oc_gerada,'#13#10'oc.cod_forne' +
      'cedor, Fornecedor,'#13#10'oc.num_documento, oc.num_oc_gerada, '#13#10'cast(o' +
      'c.dta_oc_gerada as Date),'#13#10'oc.cod_comprovante_icms'#13#10#13#10'Order by C' +
      'od_Emp_Fil, Fornecedor, oc.num_oc_gerada'#13#10#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NrDocto'
        ParamType = ptInput
        Value = '10178'
      end>
    SQLConnection = SQLC
    Left = 256
    Top = 477
  end
  object CDS_Sugestao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Sugestao'
    Left = 1209
    Top = 425
    object CDS_SugestaoNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
      Required = True
    end
    object CDS_SugestaoNUM_DOCUMENTO: TIntegerField
      FieldName = 'NUM_DOCUMENTO'
      Required = True
    end
    object CDS_SugestaoDTA_DOCUMENTO: TSQLTimeStampField
      FieldName = 'DTA_DOCUMENTO'
    end
    object CDS_SugestaoIND_OC_GERADA: TStringField
      FieldName = 'IND_OC_GERADA'
      Size = 1
    end
    object CDS_SugestaoDTA_OC_GERADA: TSQLTimeStampField
      FieldName = 'DTA_OC_GERADA'
    end
    object CDS_SugestaoNUM_OC_GERADA: TIntegerField
      FieldName = 'NUM_OC_GERADA'
    end
    object CDS_SugestaoOBS_OC: TStringField
      FieldName = 'OBS_OC'
      Size = 2000
    end
    object CDS_SugestaoCOD_EMPRESA: TStringField
      FieldName = 'COD_EMPRESA'
      Size = 6
    end
    object CDS_SugestaoDES_EMPRESA: TStringField
      FieldName = 'DES_EMPRESA'
      Size = 60
    end
    object CDS_SugestaoCOD_ITEM: TStringField
      FieldName = 'COD_ITEM'
      Size = 6
    end
    object CDS_SugestaoDES_ITEM: TStringField
      FieldName = 'DES_ITEM'
      Size = 80
    end
    object CDS_SugestaoQTD_SUGERIDA: TFMTBCDField
      FieldName = 'QTD_SUGERIDA'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_ACOMPRAR: TFMTBCDField
      FieldName = 'QTD_ACOMPRAR'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_SALDO: TFMTBCDField
      FieldName = 'QTD_SALDO'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_TRANSITO: TFMTBCDField
      FieldName = 'QTD_TRANSITO'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_DISPONIVEL: TFMTBCDField
      FieldName = 'QTD_DISPONIVEL'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_MEDIA_MES: TFMTBCDField
      FieldName = 'QTD_MEDIA_MES'
      Precision = 15
      Size = 4
    end
    object CDS_SugestaoQTD_MEDIA_DIA: TFMTBCDField
      FieldName = 'QTD_MEDIA_DIA'
      Precision = 15
      Size = 4
    end
    object CDS_SugestaoQTD_DEM_MES1: TFMTBCDField
      FieldName = 'QTD_DEM_MES1'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_DEM_MES2: TFMTBCDField
      FieldName = 'QTD_DEM_MES2'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_DEM_MES3: TFMTBCDField
      FieldName = 'QTD_DEM_MES3'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_DEM_MES4: TFMTBCDField
      FieldName = 'QTD_DEM_MES4'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_DEM_MES5: TFMTBCDField
      FieldName = 'QTD_DEM_MES5'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_DEM_MES6: TFMTBCDField
      FieldName = 'QTD_DEM_MES6'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_DEM_MES7: TFMTBCDField
      FieldName = 'QTD_DEM_MES7'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_DEM_MES8: TFMTBCDField
      FieldName = 'QTD_DEM_MES8'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoUNI_COMPRA: TIntegerField
      FieldName = 'UNI_COMPRA'
    end
    object CDS_SugestaoUNI_VENDA: TIntegerField
      FieldName = 'UNI_VENDA'
    end
    object CDS_SugestaoCOD_BARRAS: TStringField
      FieldName = 'COD_BARRAS'
      Size = 19
    end
    object CDS_SugestaoCOD_GRUPO: TStringField
      FieldName = 'COD_GRUPO'
      Size = 3
    end
    object CDS_SugestaoDES_GRUPO: TStringField
      FieldName = 'DES_GRUPO'
      Size = 30
    end
    object CDS_SugestaoCOD_SUBGRUPO: TStringField
      FieldName = 'COD_SUBGRUPO'
      Size = 7
    end
    object CDS_SugestaoDES_SUBGRUPO: TStringField
      FieldName = 'DES_SUBGRUPO'
      Size = 30
    end
    object CDS_SugestaoDES_GENERICO: TStringField
      FieldName = 'DES_GENERICO'
      Size = 80
    end
    object CDS_SugestaoCOD_APLICACAO: TStringField
      FieldName = 'COD_APLICACAO'
      Size = 4
    end
    object CDS_SugestaoDES_APLICACAO: TStringField
      FieldName = 'DES_APLICACAO'
      Size = 30
    end
    object CDS_SugestaoCOD_REFERENCIA: TStringField
      FieldName = 'COD_REFERENCIA'
      Size = 30
    end
    object CDS_SugestaoCLA_CURVA_ABC: TStringField
      FieldName = 'CLA_CURVA_ABC'
      Size = 1
    end
    object CDS_SugestaoCOD_FAMILIA_PRECO: TStringField
      FieldName = 'COD_FAMILIA_PRECO'
      Size = 4
    end
    object CDS_SugestaoDES_FAMILIA_PRECO: TStringField
      FieldName = 'DES_FAMILIA_PRECO'
      Size = 40
    end
    object CDS_SugestaoDTA_ULT_COMPRA: TDateField
      FieldName = 'DTA_ULT_COMPRA'
    end
    object CDS_SugestaoCOD_FOR_ULT_COMPRA: TStringField
      FieldName = 'COD_FOR_ULT_COMPRA'
      Size = 6
    end
    object CDS_SugestaoDES_FOR_ULT_COMPRA: TStringField
      FieldName = 'DES_FOR_ULT_COMPRA'
      Size = 40
    end
    object CDS_SugestaoQTD_ULT_COMPRA: TFMTBCDField
      FieldName = 'QTD_ULT_COMPRA'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_UNI_ULT_COMPRA: TFMTBCDField
      FieldName = 'VLR_UNI_ULT_COMPRA'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_TOT_ULT_COMPRA: TFMTBCDField
      FieldName = 'VLR_TOT_ULT_COMPRA'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_UNI_COMPRA: TFMTBCDField
      FieldName = 'VLR_UNI_COMPRA'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoDTA_ULT_VENDA: TDateField
      FieldName = 'DTA_ULT_VENDA'
    end
    object CDS_SugestaoCOD_CLI_ULT_VENDA: TStringField
      FieldName = 'COD_CLI_ULT_VENDA'
      Size = 6
    end
    object CDS_SugestaoDES_CLI_ULT_VENDA: TStringField
      FieldName = 'DES_CLI_ULT_VENDA'
      Size = 40
    end
    object CDS_SugestaoQTD_ULT_VENDA: TFMTBCDField
      FieldName = 'QTD_ULT_VENDA'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_UNI_ULT_VENDA: TFMTBCDField
      FieldName = 'VLR_UNI_ULT_VENDA'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_TOT_ULT_VENDA: TFMTBCDField
      FieldName = 'VLR_TOT_ULT_VENDA'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_UNI_VENDA: TFMTBCDField
      FieldName = 'VLR_UNI_VENDA'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoCOD_LISTA_VENDA: TStringField
      FieldName = 'COD_LISTA_VENDA'
      Size = 4
    end
    object CDS_SugestaoDES_LISTA_VENDA: TStringField
      FieldName = 'DES_LISTA_VENDA'
      Size = 30
    end
    object CDS_SugestaoCOD_LISTA_COMPRA: TStringField
      FieldName = 'COD_LISTA_COMPRA'
      Size = 4
    end
    object CDS_SugestaoDES_LISTA_COMPRA: TStringField
      FieldName = 'DES_LISTA_COMPRA'
      Size = 30
    end
    object CDS_SugestaoVLR_CUSTO_MEDIO: TFMTBCDField
      FieldName = 'VLR_CUSTO_MEDIO'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_TOT_VENDA: TFMTBCDField
      FieldName = 'VLR_TOT_VENDA'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_TOT_COMPRA: TFMTBCDField
      FieldName = 'VLR_TOT_COMPRA'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_BRUTO: TFMTBCDField
      FieldName = 'VLR_BRUTO'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_DESCONTOS: TFMTBCDField
      FieldName = 'VLR_DESCONTOS'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_DESPESAS: TFMTBCDField
      FieldName = 'VLR_DESPESAS'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_FRETE: TFMTBCDField
      FieldName = 'VLR_FRETE'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoIND_SOMA_IPI_BASE_ICMS: TStringField
      FieldName = 'IND_SOMA_IPI_BASE_ICMS'
      Size = 1
    end
    object CDS_SugestaoIND_SOMA_FRETE_BASE_ICMS: TStringField
      FieldName = 'IND_SOMA_FRETE_BASE_ICMS'
      Size = 1
    end
    object CDS_SugestaoIND_SOMA_DESPESA_BASE_ICMS: TStringField
      FieldName = 'IND_SOMA_DESPESA_BASE_ICMS'
      Size = 1
    end
    object CDS_SugestaoIND_SOMA_IPI_BASE_ST: TStringField
      FieldName = 'IND_SOMA_IPI_BASE_ST'
      Size = 1
    end
    object CDS_SugestaoIND_SOMA_FRETE_BASE_ST: TStringField
      FieldName = 'IND_SOMA_FRETE_BASE_ST'
      Size = 1
    end
    object CDS_SugestaoIND_SOMA_DESPESA_BASE_ST: TStringField
      FieldName = 'IND_SOMA_DESPESA_BASE_ST'
      Size = 1
    end
    object CDS_SugestaoCOD_SIT_TRIBUTARIA: TStringField
      FieldName = 'COD_SIT_TRIBUTARIA'
      Size = 2
    end
    object CDS_SugestaoCOD_IPI: TStringField
      FieldName = 'COD_IPI'
      Size = 2
    end
    object CDS_SugestaoIND_IPI: TStringField
      FieldName = 'IND_IPI'
      Size = 1
    end
    object CDS_SugestaoPER_IPI: TFMTBCDField
      FieldName = 'PER_IPI'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_IPI: TFMTBCDField
      FieldName = 'VLR_IPI'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoCOD_ICMS: TStringField
      FieldName = 'COD_ICMS'
      Size = 2
    end
    object CDS_SugestaoPER_REDUCAO_ICMS: TFMTBCDField
      FieldName = 'PER_REDUCAO_ICMS'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_REDUCAO_ICMS: TFMTBCDField
      FieldName = 'VLR_REDUCAO_ICMS'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_BASE_ICMS: TFMTBCDField
      FieldName = 'VLR_BASE_ICMS'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoPER_ICMS: TFMTBCDField
      FieldName = 'PER_ICMS'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_ICMS: TFMTBCDField
      FieldName = 'VLR_ICMS'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoCOD_GRUPO_ST: TIntegerField
      FieldName = 'COD_GRUPO_ST'
    end
    object CDS_SugestaoDES_GRUPO_ST: TStringField
      FieldName = 'DES_GRUPO_ST'
      Size = 30
    end
    object CDS_SugestaoPER_MARGEM_ST: TFMTBCDField
      FieldName = 'PER_MARGEM_ST'
      Precision = 15
      Size = 4
    end
    object CDS_SugestaoIND_ST: TStringField
      FieldName = 'IND_ST'
      Size = 1
    end
    object CDS_SugestaoVLR_BASE_ST: TFMTBCDField
      FieldName = 'VLR_BASE_ST'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoPER_ST: TFMTBCDField
      FieldName = 'PER_ST'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_ST: TFMTBCDField
      FieldName = 'VLR_ST'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoPER_REPASSE: TFMTBCDField
      FieldName = 'PER_REPASSE'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoVLR_REPASSE: TFMTBCDField
      FieldName = 'VLR_REPASSE'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoCOD_COMPROVANTE_ICMS: TStringField
      FieldName = 'COD_COMPROVANTE_ICMS'
      Size = 3
    end
    object CDS_SugestaoCOD_FORNECEDOR: TStringField
      FieldName = 'COD_FORNECEDOR'
      Size = 6
    end
    object CDS_SugestaoDES_FORNECEDOR: TStringField
      FieldName = 'DES_FORNECEDOR'
      Size = 40
    end
    object CDS_SugestaoTIP_PESSOA: TStringField
      FieldName = 'TIP_PESSOA'
      Size = 1
    end
    object CDS_SugestaoDES_EMAIL: TStringField
      FieldName = 'DES_EMAIL'
      Size = 80
    end
    object CDS_SugestaoQTD_NR_DIAS: TIntegerField
      FieldName = 'QTD_NR_DIAS'
    end
    object CDS_SugestaoQTD_NR_MESES: TIntegerField
      FieldName = 'QTD_NR_MESES'
    end
    object CDS_SugestaoQTD_TOT_MESES: TIntegerField
      FieldName = 'QTD_TOT_MESES'
    end
    object CDS_SugestaoCOD_REFERENCIA_FORN: TStringField
      FieldName = 'COD_REFERENCIA_FORN'
      Size = 30
    end
    object CDS_SugestaoCOD_COMPRADOR: TIntegerField
      FieldName = 'COD_COMPRADOR'
    end
    object CDS_SugestaoPER_DESCONTO: TFMTBCDField
      FieldName = 'PER_DESCONTO'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoBLOB_TEXTO: TMemoField
      FieldName = 'BLOB_TEXTO'
      BlobType = ftMemo
      Size = 1
    end
    object CDS_SugestaoIND_TRANSF: TStringField
      FieldName = 'IND_TRANSF'
      Size = 1
    end
    object CDS_SugestaoDTA_LIM_TRANSF: TDateField
      FieldName = 'DTA_LIM_TRANSF'
    end
    object CDS_SugestaoIND_USAR: TStringField
      FieldName = 'IND_USAR'
      Size = 3
    end
    object CDS_SugestaoIND_QTD_ACIMA: TFMTBCDField
      FieldName = 'IND_QTD_ACIMA'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_TRANSF: TFMTBCDField
      FieldName = 'QTD_TRANSF'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_SUGERIDA_ANO: TFMTBCDField
      FieldName = 'QTD_SUGERIDA_ANO'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_TRANSF_PERIODO: TFMTBCDField
      FieldName = 'QTD_TRANSF_PERIODO'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_TRANSF_ANO: TFMTBCDField
      FieldName = 'QTD_TRANSF_ANO'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoEST_MINIMO: TFMTBCDField
      FieldName = 'EST_MINIMO'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoDIAS_ESTOCAGEM: TIntegerField
      FieldName = 'DIAS_ESTOCAGEM'
    end
    object CDS_SugestaoQTD_DEMANDA_DIA: TFMTBCDField
      FieldName = 'QTD_DEMANDA_DIA'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_DEMANDA_ANO: TFMTBCDField
      FieldName = 'QTD_DEMANDA_ANO'
      Precision = 15
      Size = 2
    end
    object CDS_SugestaoQTD_DIAS_ANO: TIntegerField
      FieldName = 'QTD_DIAS_ANO'
    end
    object CDS_SugestaoDATAINCLUSAO: TDateField
      FieldName = 'DATAINCLUSAO'
    end
    object CDS_SugestaoESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object CDS_SugestaoDATAALTERACAO: TDateField
      FieldName = 'DATAALTERACAO'
    end
    object CDS_SugestaoIND_TRANSF_CD: TStringField
      FieldName = 'IND_TRANSF_CD'
      FixedChar = True
      Size = 1
    end
    object CDS_SugestaoDOC_TRANSF_CD: TIntegerField
      FieldName = 'DOC_TRANSF_CD'
    end
  end
  object SDS_Sugestao: TSQLDataSet
    CommandText = 
      'Select *'#13#10'From oc_comprar oc'#13#10'Where oc.num_documento= :NumDocto'#13 +
      #10#13#10'Order By oc.cod_item'#13#10#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NumDocto'
        ParamType = ptInput
        Value = '5'
      end>
    SQLConnection = SQLC
    Left = 1128
    Top = 425
  end
  object DSP_Sugestao: TDataSetProvider
    DataSet = SDS_Sugestao
    Left = 1170
    Top = 441
  end
  object IBDB_BelShop: TIBDatabase
    DatabaseName = 'localhost:C:\Projetos\BelShop\Dados\BelShop.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_BelShop
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 1138
    Top = 21
  end
  object IBT_BelShop: TIBTransaction
    Active = False
    DefaultDatabase = IBDB_BelShop
    AutoStopAction = saNone
    Left = 1178
    Top = 34
  end
  object IBQ_AComprar: TIBQuery
    Database = IBDB_BelShop
    Transaction = IBT_BelShop
    AfterOpen = IBQ_AComprarAfterOpen
    AfterPost = IBQ_AComprarAfterPost
    AfterScroll = IBQ_AComprarAfterScroll
    BeforePost = IBQ_AComprarBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DS_AComprarItens
    SQL.Strings = (
      'Select *'
      'From oc_comprar oc'
      'Where oc.num_documento= :Num_Documento'
      'and oc.cod_item = :Cod_Item'
      'ORDER BY oc.cod_empresa, oc.qtd_transf desc'
      '')
    UpdateObject = IBU_AComprar
    Left = 1130
    Top = 229
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUM_DOCUMENTO'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftString
        Name = 'COD_ITEM'
        ParamType = ptUnknown
        Size = 7
      end>
    object IBQ_AComprarNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
      Origin = 'OC_COMPRAR.NUM_SEQ'
      Required = True
    end
    object IBQ_AComprarNUM_DOCUMENTO: TIntegerField
      FieldName = 'NUM_DOCUMENTO'
      Origin = 'OC_COMPRAR.NUM_DOCUMENTO'
      Required = True
    end
    object IBQ_AComprarDTA_DOCUMENTO: TDateTimeField
      Alignment = taCenter
      FieldName = 'DTA_DOCUMENTO'
      Origin = 'OC_COMPRAR.DTA_DOCUMENTO'
    end
    object IBQ_AComprarIND_OC_GERADA: TIBStringField
      Alignment = taCenter
      FieldName = 'IND_OC_GERADA'
      Origin = 'OC_COMPRAR.IND_OC_GERADA'
      Size = 1
    end
    object IBQ_AComprarDTA_OC_GERADA: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data OC'
      FieldName = 'DTA_OC_GERADA'
      Origin = 'OC_COMPRAR.DTA_OC_GERADA'
    end
    object IBQ_AComprarNUM_OC_GERADA: TIntegerField
      DisplayLabel = 'N'#186' OC'
      FieldName = 'NUM_OC_GERADA'
      Origin = 'OC_COMPRAR.NUM_OC_GERADA'
    end
    object IBQ_AComprarOBS_OC: TIBStringField
      DisplayLabel = 'Obs OC'
      FieldName = 'OBS_OC'
      Origin = 'OC_COMPRAR.OBS_OC'
      Size = 2000
    end
    object IBQ_AComprarCOD_EMPRESA: TIBStringField
      Alignment = taRightJustify
      FieldName = 'COD_EMPRESA'
      Origin = 'OC_COMPRAR.COD_EMPRESA'
      Size = 6
    end
    object IBQ_AComprarDES_EMPRESA: TIBStringField
      FieldName = 'DES_EMPRESA'
      Origin = 'OC_COMPRAR.DES_EMPRESA'
      Size = 60
    end
    object IBQ_AComprarCOD_ITEM: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd Produto'
      FieldName = 'COD_ITEM'
      Origin = 'OC_COMPRAR.COD_ITEM'
      Size = 6
    end
    object IBQ_AComprarDES_ITEM: TIBStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'DES_ITEM'
      Origin = 'OC_COMPRAR.DES_ITEM'
      Size = 80
    end
    object IBQ_AComprarQTD_SUGERIDA: TIBBCDField
      DisplayLabel = 'Sug. MESES'
      FieldName = 'QTD_SUGERIDA'
      Origin = 'OC_COMPRAR.QTD_SUGERIDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_ACOMPRAR: TIBBCDField
      DisplayLabel = 'A Comprar'
      FieldName = 'QTD_ACOMPRAR'
      Origin = 'OC_COMPRAR.QTD_ACOMPRAR'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_SALDO: TIBBCDField
      DisplayLabel = 'Saldo'
      FieldName = 'QTD_SALDO'
      Origin = 'OC_COMPRAR.QTD_SALDO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_TRANSITO: TIBBCDField
      DisplayLabel = 'Tr'#226'nsito'
      FieldName = 'QTD_TRANSITO'
      Origin = 'OC_COMPRAR.QTD_TRANSITO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_DISPONIVEL: TIBBCDField
      DisplayLabel = 'Previsto'
      FieldName = 'QTD_DISPONIVEL'
      Origin = 'OC_COMPRAR.QTD_DISPONIVEL'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_MEDIA_MES: TIBBCDField
      DisplayLabel = 'M'#233'dia M'#234's'
      FieldName = 'QTD_MEDIA_MES'
      Origin = 'OC_COMPRAR.QTD_MEDIA_MES'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 4
    end
    object IBQ_AComprarQTD_MEDIA_DIA: TIBBCDField
      DisplayLabel = 'M'#233'dia Dia'
      FieldName = 'QTD_MEDIA_DIA'
      Origin = 'OC_COMPRAR.QTD_MEDIA_DIA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 4
    end
    object IBQ_AComprarQTD_DEM_MES1: TIBBCDField
      FieldName = 'QTD_DEM_MES1'
      Origin = 'OC_COMPRAR.QTD_DEM_MES1'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_DEM_MES2: TIBBCDField
      FieldName = 'QTD_DEM_MES2'
      Origin = 'OC_COMPRAR.QTD_DEM_MES2'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_DEM_MES3: TIBBCDField
      FieldName = 'QTD_DEM_MES3'
      Origin = 'OC_COMPRAR.QTD_DEM_MES3'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_DEM_MES4: TIBBCDField
      FieldName = 'QTD_DEM_MES4'
      Origin = 'OC_COMPRAR.QTD_DEM_MES4'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_DEM_MES5: TIBBCDField
      FieldName = 'QTD_DEM_MES5'
      Origin = 'OC_COMPRAR.QTD_DEM_MES5'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_DEM_MES6: TIBBCDField
      FieldName = 'QTD_DEM_MES6'
      Origin = 'OC_COMPRAR.QTD_DEM_MES6'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_DEM_MES7: TIBBCDField
      FieldName = 'QTD_DEM_MES7'
      Origin = 'OC_COMPRAR.QTD_DEM_MES7'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_DEM_MES8: TIBBCDField
      FieldName = 'QTD_DEM_MES8'
      Origin = 'OC_COMPRAR.QTD_DEM_MES8'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarUNI_COMPRA: TIntegerField
      DisplayLabel = 'CxE'
      FieldName = 'UNI_COMPRA'
      Origin = 'OC_COMPRAR.UNI_COMPRA'
    end
    object IBQ_AComprarUNI_VENDA: TIntegerField
      DisplayLabel = 'Uni Venda'
      FieldName = 'UNI_VENDA'
      Origin = 'OC_COMPRAR.UNI_VENDA'
    end
    object IBQ_AComprarCOD_BARRAS: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'EAN'
      FieldName = 'COD_BARRAS'
      Origin = 'OC_COMPRAR.COD_BARRAS'
      Size = 19
    end
    object IBQ_AComprarCOD_GRUPO: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Grupo'
      FieldName = 'COD_GRUPO'
      Origin = 'OC_COMPRAR.COD_GRUPO'
      Size = 3
    end
    object IBQ_AComprarDES_GRUPO: TIBStringField
      DisplayLabel = 'Grupo'
      FieldName = 'DES_GRUPO'
      Origin = 'OC_COMPRAR.DES_GRUPO'
      Size = 30
    end
    object IBQ_AComprarCOD_SUBGRUPO: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod SubGrupo'
      FieldName = 'COD_SUBGRUPO'
      Origin = 'OC_COMPRAR.COD_SUBGRUPO'
      Size = 7
    end
    object IBQ_AComprarDES_SUBGRUPO: TIBStringField
      DisplayLabel = 'SubGrupo'
      FieldName = 'DES_SUBGRUPO'
      Origin = 'OC_COMPRAR.DES_SUBGRUPO'
      Size = 30
    end
    object IBQ_AComprarDES_GENERICO: TIBStringField
      DisplayLabel = 'Gen'#233'rico'
      FieldName = 'DES_GENERICO'
      Origin = 'OC_COMPRAR.DES_GENERICO'
      Size = 80
    end
    object IBQ_AComprarCOD_APLICACAO: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Aplic'
      FieldName = 'COD_APLICACAO'
      Origin = 'OC_COMPRAR.COD_APLICACAO'
      Size = 4
    end
    object IBQ_AComprarDES_APLICACAO: TIBStringField
      DisplayLabel = 'Aplica'#231#227'o'
      FieldName = 'DES_APLICACAO'
      Origin = 'OC_COMPRAR.DES_APLICACAO'
      Size = 30
    end
    object IBQ_AComprarCOD_REFERENCIA: TIBStringField
      FieldName = 'COD_REFERENCIA'
      Origin = 'OC_COMPRAR.COD_REFERENCIA'
      Size = 30
    end
    object IBQ_AComprarCLA_CURVA_ABC: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'ABC'
      FieldName = 'CLA_CURVA_ABC'
      Origin = 'OC_COMPRAR.CLA_CURVA_ABC'
      Size = 1
    end
    object IBQ_AComprarCOD_FAMILIA_PRECO: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Fam Pre'#231'o'
      FieldName = 'COD_FAMILIA_PRECO'
      Origin = 'OC_COMPRAR.COD_FAMILIA_PRECO'
      Size = 4
    end
    object IBQ_AComprarDES_FAMILIA_PRECO: TIBStringField
      DisplayLabel = 'Fam'#237'lia Pre'#231'o'
      FieldName = 'DES_FAMILIA_PRECO'
      Origin = 'OC_COMPRAR.DES_FAMILIA_PRECO'
      Size = 40
    end
    object IBQ_AComprarDTA_ULT_COMPRA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Ult Compra'
      FieldName = 'DTA_ULT_COMPRA'
      Origin = 'OC_COMPRAR.DTA_ULT_COMPRA'
    end
    object IBQ_AComprarCOD_FOR_ULT_COMPRA: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Forn Ult Compra'
      FieldName = 'COD_FOR_ULT_COMPRA'
      Origin = 'OC_COMPRAR.COD_FOR_ULT_COMPRA'
      Size = 6
    end
    object IBQ_AComprarDES_FOR_ULT_COMPRA: TIBStringField
      DisplayLabel = 'Fornecedor Ult Compra'
      FieldName = 'DES_FOR_ULT_COMPRA'
      Origin = 'OC_COMPRAR.DES_FOR_ULT_COMPRA'
      Size = 40
    end
    object IBQ_AComprarQTD_ULT_COMPRA: TIBBCDField
      DisplayLabel = 'Qtd Ult Comp'
      FieldName = 'QTD_ULT_COMPRA'
      Origin = 'OC_COMPRAR.QTD_ULT_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_UNI_ULT_COMPRA: TIBBCDField
      DisplayLabel = 'Vr Un Ult Comp'
      FieldName = 'VLR_UNI_ULT_COMPRA'
      Origin = 'OC_COMPRAR.VLR_UNI_ULT_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_TOT_ULT_COMPRA: TIBBCDField
      DisplayLabel = 'Vr Tot Ult Comp'
      FieldName = 'VLR_TOT_ULT_COMPRA'
      Origin = 'OC_COMPRAR.VLR_TOT_ULT_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_UNI_COMPRA: TIBBCDField
      DisplayLabel = 'Vr Un Compra'
      FieldName = 'VLR_UNI_COMPRA'
      Origin = 'OC_COMPRAR.VLR_UNI_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarPER_DESCONTO: TIBBCDField
      DisplayLabel = '% Desc'
      FieldName = 'PER_DESCONTO'
      Origin = 'OC_COMPRAR.PER_DESCONTO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarDTA_ULT_VENDA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dta Ult Venda'
      FieldName = 'DTA_ULT_VENDA'
      Origin = 'OC_COMPRAR.DTA_ULT_VENDA'
    end
    object IBQ_AComprarCOD_CLI_ULT_VENDA: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Cli Ult Venda'
      FieldName = 'COD_CLI_ULT_VENDA'
      Origin = 'OC_COMPRAR.COD_CLI_ULT_VENDA'
      Size = 6
    end
    object IBQ_AComprarDES_CLI_ULT_VENDA: TIBStringField
      DisplayLabel = 'Cliente Ult Venda'
      FieldName = 'DES_CLI_ULT_VENDA'
      Origin = 'OC_COMPRAR.DES_CLI_ULT_VENDA'
      Size = 40
    end
    object IBQ_AComprarQTD_ULT_VENDA: TIBBCDField
      DisplayLabel = 'Qtd Ult Venda'
      FieldName = 'QTD_ULT_VENDA'
      Origin = 'OC_COMPRAR.QTD_ULT_VENDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_UNI_ULT_VENDA: TIBBCDField
      DisplayLabel = 'Vlr Unit Ult Venda'
      FieldName = 'VLR_UNI_ULT_VENDA'
      Origin = 'OC_COMPRAR.VLR_UNI_ULT_VENDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_TOT_ULT_VENDA: TIBBCDField
      DisplayLabel = 'Vlr Tot Ult Venda'
      FieldName = 'VLR_TOT_ULT_VENDA'
      Origin = 'OC_COMPRAR.VLR_TOT_ULT_VENDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_UNI_VENDA: TIBBCDField
      DisplayLabel = 'Vl Un Venda'
      FieldName = 'VLR_UNI_VENDA'
      Origin = 'OC_COMPRAR.VLR_UNI_VENDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarCOD_LISTA_VENDA: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Lista Venda'
      FieldName = 'COD_LISTA_VENDA'
      Origin = 'OC_COMPRAR.COD_LISTA_VENDA'
      Size = 4
    end
    object IBQ_AComprarDES_LISTA_VENDA: TIBStringField
      DisplayLabel = 'Lista Venda'
      FieldName = 'DES_LISTA_VENDA'
      Origin = 'OC_COMPRAR.DES_LISTA_VENDA'
      Size = 30
    end
    object IBQ_AComprarCOD_LISTA_COMPRA: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Lista Compra'
      FieldName = 'COD_LISTA_COMPRA'
      Origin = 'OC_COMPRAR.COD_LISTA_COMPRA'
      Size = 4
    end
    object IBQ_AComprarDES_LISTA_COMPRA: TIBStringField
      DisplayLabel = 'Lista Compra'
      FieldName = 'DES_LISTA_COMPRA'
      Origin = 'OC_COMPRAR.DES_LISTA_COMPRA'
      Size = 30
    end
    object IBQ_AComprarVLR_CUSTO_MEDIO: TIBBCDField
      DisplayLabel = 'Custo M'#233'dio'
      FieldName = 'VLR_CUSTO_MEDIO'
      Origin = 'OC_COMPRAR.VLR_CUSTO_MEDIO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_TOT_VENDA: TIBBCDField
      DisplayLabel = 'Vlr Tot Venda'
      FieldName = 'VLR_TOT_VENDA'
      Origin = 'OC_COMPRAR.VLR_TOT_VENDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_TOT_COMPRA: TIBBCDField
      DisplayLabel = 'Vr Tot Compra'
      FieldName = 'VLR_TOT_COMPRA'
      Origin = 'OC_COMPRAR.VLR_TOT_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_BRUTO: TIBBCDField
      DisplayLabel = 'Vlr Bruto'
      FieldName = 'VLR_BRUTO'
      Origin = 'OC_COMPRAR.VLR_BRUTO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_DESCONTOS: TIBBCDField
      DisplayLabel = 'Vlr Desc'
      FieldName = 'VLR_DESCONTOS'
      Origin = 'OC_COMPRAR.VLR_DESCONTOS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_DESPESAS: TIBBCDField
      DisplayLabel = 'Vlr Desp'
      FieldName = 'VLR_DESPESAS'
      Origin = 'OC_COMPRAR.VLR_DESPESAS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_FRETE: TIBBCDField
      DisplayLabel = 'Vlr Frete'
      FieldName = 'VLR_FRETE'
      Origin = 'OC_COMPRAR.VLR_FRETE'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarIND_SOMA_IPI_BASE_ICMS: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Soma IPI BICMS'
      FieldName = 'IND_SOMA_IPI_BASE_ICMS'
      Origin = 'OC_COMPRAR.IND_SOMA_IPI_BASE_ICMS'
      Size = 1
    end
    object IBQ_AComprarIND_SOMA_FRETE_BASE_ICMS: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Soma Frete BICMS'
      FieldName = 'IND_SOMA_FRETE_BASE_ICMS'
      Origin = 'OC_COMPRAR.IND_SOMA_FRETE_BASE_ICMS'
      Size = 1
    end
    object IBQ_AComprarIND_SOMA_DESPESA_BASE_ICMS: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Soma Desp BICMS'
      FieldName = 'IND_SOMA_DESPESA_BASE_ICMS'
      Origin = 'OC_COMPRAR.IND_SOMA_DESPESA_BASE_ICMS'
      Size = 1
    end
    object IBQ_AComprarIND_SOMA_IPI_BASE_ST: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Soma IPI BST'
      FieldName = 'IND_SOMA_IPI_BASE_ST'
      Origin = 'OC_COMPRAR.IND_SOMA_IPI_BASE_ST'
      Size = 1
    end
    object IBQ_AComprarIND_SOMA_FRETE_BASE_ST: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Soma Frete BST'
      FieldName = 'IND_SOMA_FRETE_BASE_ST'
      Origin = 'OC_COMPRAR.IND_SOMA_FRETE_BASE_ST'
      Size = 1
    end
    object IBQ_AComprarIND_SOMA_DESPESA_BASE_ST: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Soma Desp BST'
      FieldName = 'IND_SOMA_DESPESA_BASE_ST'
      Origin = 'OC_COMPRAR.IND_SOMA_DESPESA_BASE_ST'
      Size = 1
    end
    object IBQ_AComprarCOD_SIT_TRIBUTARIA: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Sit Trib'
      FieldName = 'COD_SIT_TRIBUTARIA'
      Origin = 'OC_COMPRAR.COD_SIT_TRIBUTARIA'
      Size = 2
    end
    object IBQ_AComprarCOD_IPI: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod IPI'
      FieldName = 'COD_IPI'
      Origin = 'OC_COMPRAR.COD_IPI'
      Size = 2
    end
    object IBQ_AComprarIND_IPI: TIBStringField
      DisplayLabel = 'Ind IPI'
      FieldName = 'IND_IPI'
      Origin = 'OC_COMPRAR.IND_IPI'
      Size = 1
    end
    object IBQ_AComprarPER_IPI: TIBBCDField
      DisplayLabel = 'Per IPI'
      FieldName = 'PER_IPI'
      Origin = 'OC_COMPRAR.PER_IPI'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBQ_AComprarVLR_IPI: TIBBCDField
      DisplayLabel = 'Vlr IPI'
      FieldName = 'VLR_IPI'
      Origin = 'OC_COMPRAR.VLR_IPI'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarCOD_ICMS: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod ICMS'
      FieldName = 'COD_ICMS'
      Origin = 'OC_COMPRAR.COD_ICMS'
      Size = 2
    end
    object IBQ_AComprarPER_REDUCAO_ICMS: TIBBCDField
      DisplayLabel = 'Per Red ICMS'
      FieldName = 'PER_REDUCAO_ICMS'
      Origin = 'OC_COMPRAR.PER_REDUCAO_ICMS'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBQ_AComprarVLR_REDUCAO_ICMS: TIBBCDField
      DisplayLabel = 'Vlr Red ICMS'
      FieldName = 'VLR_REDUCAO_ICMS'
      Origin = 'OC_COMPRAR.VLR_REDUCAO_ICMS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarVLR_BASE_ICMS: TIBBCDField
      DisplayLabel = 'Vlr Base ICMS'
      FieldName = 'VLR_BASE_ICMS'
      Origin = 'OC_COMPRAR.VLR_BASE_ICMS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarPER_ICMS: TIBBCDField
      DisplayLabel = 'Per ICMS'
      FieldName = 'PER_ICMS'
      Origin = 'OC_COMPRAR.PER_ICMS'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBQ_AComprarVLR_ICMS: TIBBCDField
      DisplayLabel = 'Vlr ICMS'
      FieldName = 'VLR_ICMS'
      Origin = 'OC_COMPRAR.VLR_ICMS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarCOD_GRUPO_ST: TIntegerField
      DisplayLabel = 'Cod Gr ST'
      FieldName = 'COD_GRUPO_ST'
      Origin = 'OC_COMPRAR.COD_GRUPO_ST'
    end
    object IBQ_AComprarDES_GRUPO_ST: TIBStringField
      DisplayLabel = 'Grupo ST'
      FieldName = 'DES_GRUPO_ST'
      Origin = 'OC_COMPRAR.DES_GRUPO_ST'
      Size = 30
    end
    object IBQ_AComprarPER_MARGEM_ST: TIBBCDField
      DisplayLabel = 'Per Margem ST'
      FieldName = 'PER_MARGEM_ST'
      Origin = 'OC_COMPRAR.PER_MARGEM_ST'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 4
    end
    object IBQ_AComprarIND_ST: TIBStringField
      DisplayLabel = 'Ind ST'
      FieldName = 'IND_ST'
      Origin = 'OC_COMPRAR.IND_ST'
      Size = 1
    end
    object IBQ_AComprarVLR_BASE_ST: TIBBCDField
      DisplayLabel = 'Vlr Base ST'
      FieldName = 'VLR_BASE_ST'
      Origin = 'OC_COMPRAR.VLR_BASE_ST'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarPER_ST: TIBBCDField
      DisplayLabel = 'Per ST'
      FieldName = 'PER_ST'
      Origin = 'OC_COMPRAR.PER_ST'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBQ_AComprarVLR_ST: TIBBCDField
      DisplayLabel = 'Vlr ST'
      FieldName = 'VLR_ST'
      Origin = 'OC_COMPRAR.VLR_ST'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarPER_REPASSE: TIBBCDField
      DisplayLabel = 'Per Repasse'
      FieldName = 'PER_REPASSE'
      Origin = 'OC_COMPRAR.PER_REPASSE'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBQ_AComprarVLR_REPASSE: TIBBCDField
      DisplayLabel = 'Vlr Repasse'
      FieldName = 'VLR_REPASSE'
      Origin = 'OC_COMPRAR.VLR_REPASSE'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarCOD_COMPROVANTE_ICMS: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Comprovante ICMS'
      FieldName = 'COD_COMPROVANTE_ICMS'
      Origin = 'OC_COMPRAR.COD_COMPROVANTE_ICMS'
      Size = 3
    end
    object IBQ_AComprarCOD_REFERENCIA_FORN: TIBStringField
      FieldName = 'COD_REFERENCIA_FORN'
      Origin = 'OC_COMPRAR.COD_REFERENCIA_FORN'
      Size = 30
    end
    object IBQ_AComprarCOD_FORNECEDOR: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Forn'
      FieldName = 'COD_FORNECEDOR'
      Origin = 'OC_COMPRAR.COD_FORNECEDOR'
      Size = 6
    end
    object IBQ_AComprarDES_FORNECEDOR: TIBStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'DES_FORNECEDOR'
      Origin = 'OC_COMPRAR.DES_FORNECEDOR'
      Size = 40
    end
    object IBQ_AComprarTIP_PESSOA: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Tp Pessoa'
      FieldName = 'TIP_PESSOA'
      Origin = 'OC_COMPRAR.TIP_PESSOA'
      Size = 1
    end
    object IBQ_AComprarDES_EMAIL: TIBStringField
      DisplayLabel = 'E-Mail'
      FieldName = 'DES_EMAIL'
      Origin = 'OC_COMPRAR.DES_EMAIL'
      Size = 80
    end
    object IBQ_AComprarQTD_NR_DIAS: TIntegerField
      DisplayLabel = 'Nr Dias'
      FieldName = 'QTD_NR_DIAS'
      Origin = 'OC_COMPRAR.QTD_NR_DIAS'
    end
    object IBQ_AComprarQTD_NR_MESES: TIntegerField
      DisplayLabel = 'Nr Meses'
      FieldName = 'QTD_NR_MESES'
      Origin = 'OC_COMPRAR.QTD_NR_MESES'
    end
    object IBQ_AComprarQTD_TOT_MESES: TIntegerField
      DisplayLabel = 'Total Meses'
      FieldName = 'QTD_TOT_MESES'
      Origin = 'OC_COMPRAR.QTD_TOT_MESES'
    end
    object IBQ_AComprarCOD_COMPRADOR: TIntegerField
      FieldName = 'COD_COMPRADOR'
      Origin = 'OC_COMPRAR.COD_COMPRADOR'
    end
    object IBQ_AComprarBLOB_TEXTO: TMemoField
      FieldName = 'BLOB_TEXTO'
      Origin = 'OC_COMPRAR.BLOB_TEXTO'
      BlobType = ftMemo
      Size = 8
    end
    object IBQ_AComprarIND_TRANSF: TIBStringField
      FieldName = 'IND_TRANSF'
      Origin = 'OC_COMPRAR.IND_TRANSF'
      Size = 1
    end
    object IBQ_AComprarDTA_LIM_TRANSF: TDateField
      FieldName = 'DTA_LIM_TRANSF'
      Origin = 'OC_COMPRAR.DTA_LIM_TRANSF'
    end
    object IBQ_AComprarQTD_TRANSF: TIBBCDField
      DisplayLabel = 'Qtd Transf'
      FieldName = 'QTD_TRANSF'
      Origin = 'OC_COMPRAR.QTD_TRANSF'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarIND_USAR: TIBStringField
      FieldName = 'IND_USAR'
      Origin = 'OC_COMPRAR.IND_USAR'
      Size = 3
    end
    object IBQ_AComprarIND_QTD_ACIMA: TIBBCDField
      DisplayLabel = 'Excedente'
      FieldName = 'IND_QTD_ACIMA'
      Origin = 'OC_COMPRAR.IND_QTD_ACIMA'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_SUGERIDA_ANO: TIBBCDField
      DisplayLabel = 'Sug. ANO'
      FieldName = 'QTD_SUGERIDA_ANO'
      Origin = 'OC_COMPRAR.QTD_SUGERIDA_ANO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_TRANSF_PERIODO: TIBBCDField
      DisplayLabel = 'Transf Per'#237'odo'
      FieldName = 'QTD_TRANSF_PERIODO'
      Origin = 'OC_COMPRAR.QTD_TRANSF_PERIODO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_TRANSF_ANO: TIBBCDField
      DisplayLabel = 'Transf Ano'
      FieldName = 'QTD_TRANSF_ANO'
      Origin = 'OC_COMPRAR.QTD_TRANSF_ANO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEST_MINIMO: TIBBCDField
      DisplayLabel = 'Est. M'#237'n.'
      FieldName = 'EST_MINIMO'
      Origin = 'OC_COMPRAR.EST_MINIMO'
      DisplayFormat = '0,'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarDIAS_ESTOCAGEM: TIntegerField
      DisplayLabel = 'Dias Est.'
      FieldName = 'DIAS_ESTOCAGEM'
      Origin = 'OC_COMPRAR.DIAS_ESTOCAGEM'
      DisplayFormat = '0,'
    end
    object IBQ_AComprarQTD_DEMANDA_DIA: TIBBCDField
      DisplayLabel = 'Dem. Dia'
      FieldName = 'QTD_DEMANDA_DIA'
      Origin = 'OC_COMPRAR.QTD_DEMANDA_DIA'
      DisplayFormat = '0,.00'
      Precision = 18
      Size = 4
    end
    object IBQ_AComprarQTD_DEMANDA_ANO: TIBBCDField
      DisplayLabel = 'Qtd Dem.'
      FieldName = 'QTD_DEMANDA_ANO'
      Origin = 'OC_COMPRAR.QTD_DEMANDA_ANO'
      DisplayFormat = '0,.00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarQTD_DIAS_ANO: TIntegerField
      DisplayLabel = 'Dias Uteis'
      FieldName = 'QTD_DIAS_ANO'
      Origin = 'OC_COMPRAR.QTD_DIAS_ANO'
      DisplayFormat = '0,'
    end
    object IBQ_AComprarDATAINCLUSAO: TDateField
      DisplayLabel = 'Inclus'#227'o'
      FieldName = 'DATAINCLUSAO'
      Origin = 'OC_COMPRAR.DATAINCLUSAO'
    end
    object IBQ_AComprarESTADO: TIBStringField
      DisplayLabel = 'UF'
      FieldName = 'ESTADO'
      Origin = 'OC_COMPRAR.ESTADO'
      FixedChar = True
      Size = 2
    end
    object IBQ_AComprarDATAALTERACAO: TDateField
      FieldName = 'DATAALTERACAO'
      Origin = 'OC_COMPRAR.DATAALTERACAO'
    end
    object IBQ_AComprarIND_TRANSF_CD: TIBStringField
      FieldName = 'IND_TRANSF_CD'
      Origin = 'OC_COMPRAR.IND_TRANSF_CD'
      FixedChar = True
      Size = 1
    end
    object IBQ_AComprarDOC_TRANSF_CD: TIntegerField
      FieldName = 'DOC_TRANSF_CD'
      Origin = 'OC_COMPRAR.DOC_TRANSF_CD'
    end
  end
  object IBU_AComprar: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from oc_comprar '
      'where'
      '  NUM_SEQ = :NUM_SEQ'
      ' and  NUM_DOCUMENTO = :NUM_DOCUMENTO')
    ModifySQL.Strings = (
      'update oc_comprar'
      'set'
      '  QTD_ACOMPRAR = :QTD_ACOMPRAR,'
      '  QTD_TRANSF = :QTD_TRANSF,'
      '  VLR_UNI_COMPRA = :VLR_UNI_COMPRA,'
      '  PER_DESCONTO = :PER_DESCONTO,'
      
        '  VLR_DESCONTOS=((QTD_ACOMPRAR*VLR_UNI_COMPRA)*(PER_DESCONTO/100' +
        ')),'
      '  VLR_BRUTO=(QTD_ACOMPRAR*VLR_UNI_COMPRA)-VLR_DESCONTOS,'
      '  VLR_BASE_ICMS=VLR_BRUTO,'
      
        '  VLR_ICMS=Cast(((VLR_BASE_ICMS*PER_ICMS)/100) as Numeric(12,2))' +
        ','
      '  VLR_IPI=Cast(((VLR_BRUTO*PER_IPI)/100) as Numeric(12,2)),'
      
        '  VLR_BASE_ST=VLR_BRUTO+(Cast(((VLR_BRUTO*PER_MARGEM_ST)/100) as' +
        ' Numeric(12,2))),'
      
        '  VLR_ST=(Cast(((VLR_BASE_ST*PER_ST)/100) as Numeric(12,2))-VLR_' +
        'ICMS),'
      '  VLR_TOT_COMPRA=VLR_BRUTO+VLR_ST+VLR_IPI,'
      '  VLR_TOT_ULT_VENDA=QTD_ACOMPRAR*VLR_UNI_VENDA,'
      '  BLOB_TEXTO = :BLOB_TEXTO'
      'where'
      '  NUM_SEQ = :NUM_SEQ'
      '  and NUM_DOCUMENTO = :NUM_DOCUMENTO')
    InsertSQL.Strings = (
      'insert into oc_comprar'
      
        '  (NUM_SEQ, NUM_DOCUMENTO, DTA_DOCUMENTO, IND_OC_GERADA, DTA_OC_' +
        'GERADA, '
      
        '   NUM_OC_GERADA, OBS_OC, COD_EMPRESA, DES_EMPRESA, COD_ITEM, DE' +
        'S_ITEM, '
      
        '   QTD_SUGERIDA, QTD_ACOMPRAR, QTD_SALDO, QTD_TRANSITO, QTD_DISP' +
        'ONIVEL, '
      
        '   QTD_MEDIA_MES, QTD_MEDIA_DIA, QTD_DEM_MES1, QTD_DEM_MES2, QTD' +
        '_DEM_MES3, '
      
        '   QTD_DEM_MES4, QTD_DEM_MES5, QTD_DEM_MES6, QTD_DEM_MES7, QTD_D' +
        'EM_MES8, '
      
        '   UNI_COMPRA, UNI_VENDA, COD_BARRAS, COD_GRUPO, DES_GRUPO, COD_' +
        'SUBGRUPO, '
      
        '   DES_SUBGRUPO, DES_GENERICO, COD_APLICACAO, DES_APLICACAO, COD' +
        '_REFERENCIA, '
      
        '   CLA_CURVA_ABC, COD_FAMILIA_PRECO, DES_FAMILIA_PRECO, DTA_ULT_' +
        'COMPRA, '
      
        '   COD_FOR_ULT_COMPRA, DES_FOR_ULT_COMPRA, QTD_ULT_COMPRA, VLR_U' +
        'NI_ULT_COMPRA, '
      
        '   VLR_TOT_ULT_COMPRA, VLR_UNI_COMPRA, PER_DESCONTO, DTA_ULT_VEN' +
        'DA, COD_CLI_ULT_VENDA, '
      
        '   DES_CLI_ULT_VENDA, QTD_ULT_VENDA, VLR_UNI_ULT_VENDA, VLR_TOT_' +
        'ULT_VENDA, '
      
        '   VLR_UNI_VENDA, COD_LISTA_VENDA, DES_LISTA_VENDA, COD_LISTA_CO' +
        'MPRA, DES_LISTA_COMPRA, '
      
        '   VLR_CUSTO_MEDIO, VLR_TOT_VENDA, VLR_TOT_COMPRA, VLR_BRUTO, VL' +
        'R_DESCONTOS, '
      
        '   VLR_DESPESAS, VLR_FRETE, IND_SOMA_IPI_BASE_ICMS, IND_SOMA_FRE' +
        'TE_BASE_ICMS, '
      
        '   IND_SOMA_DESPESA_BASE_ICMS, IND_SOMA_IPI_BASE_ST, IND_SOMA_FR' +
        'ETE_BASE_ST, '
      
        '   IND_SOMA_DESPESA_BASE_ST, COD_SIT_TRIBUTARIA, COD_IPI, IND_IP' +
        'I, PER_IPI, '
      
        '   VLR_IPI, COD_ICMS, PER_REDUCAO_ICMS, VLR_REDUCAO_ICMS, VLR_BA' +
        'SE_ICMS, '
      
        '   PER_ICMS, VLR_ICMS, COD_GRUPO_ST, DES_GRUPO_ST, PER_MARGEM_ST' +
        ', IND_ST, '
      
        '   VLR_BASE_ST, PER_ST, VLR_ST, PER_REPASSE, VLR_REPASSE, COD_CO' +
        'MPROVANTE_ICMS, '
      
        '   COD_REFERENCIA_FORN, COD_FORNECEDOR, DES_FORNECEDOR, TIP_PESS' +
        'OA, DES_EMAIL, '
      
        '   QTD_NR_DIAS, QTD_NR_MESES, QTD_TOT_MESES, COD_COMPRADOR, BLOB' +
        '_TEXTO, '
      
        '   IND_TRANSF, DTA_LIM_TRANSF, QTD_TRANSF, IND_USAR, IND_QTD_ACI' +
        'MA,'
      
        '  QTD_SUGERIDA_ANO, QTD_TRANSF_PERIODO, QTD_TRANSF_ANO, EST_MINI' +
        'MO, '
      
        '  DIAS_ESTOCAGEM, QTD_DEMANDA_DIA, QTD_DEMANDA_ANO, QTD_DIAS_ANO' +
        ','
      '  DATAINCLUSAO, ESTADO, DATAALTERACAO)'
      'values'
      
        '  (:NUM_SEQ, :NUM_DOCUMENTO, :DTA_DOCUMENTO, :IND_OC_GERADA, :DT' +
        'A_OC_GERADA, '
      
        '   :NUM_OC_GERADA, :OBS_OC, :COD_EMPRESA, :DES_EMPRESA, :COD_ITE' +
        'M, :DES_ITEM, '
      
        '   :QTD_SUGERIDA, :QTD_ACOMPRAR, :QTD_SALDO, :QTD_TRANSITO, :QTD' +
        '_DISPONIVEL, '
      
        '   :QTD_MEDIA_MES, :QTD_MEDIA_DIA, :QTD_DEM_MES1, :QTD_DEM_MES2,' +
        ' :QTD_DEM_MES3, '
      
        '   :QTD_DEM_MES4, :QTD_DEM_MES5, :QTD_DEM_MES6, :QTD_DEM_MES7, :' +
        'QTD_DEM_MES8, '
      
        '   :UNI_COMPRA, :UNI_VENDA, :COD_BARRAS, :COD_GRUPO, :DES_GRUPO,' +
        ' :COD_SUBGRUPO, '
      
        '   :DES_SUBGRUPO, :DES_GENERICO, :COD_APLICACAO, :DES_APLICACAO,' +
        ' :COD_REFERENCIA, '
      
        '   :CLA_CURVA_ABC, :COD_FAMILIA_PRECO, :DES_FAMILIA_PRECO, :DTA_' +
        'ULT_COMPRA, '
      
        '   :COD_FOR_ULT_COMPRA, :DES_FOR_ULT_COMPRA, :QTD_ULT_COMPRA, :V' +
        'LR_UNI_ULT_COMPRA, '
      
        '   :VLR_TOT_ULT_COMPRA, :VLR_UNI_COMPRA, :PER_DESCONTO, :DTA_ULT' +
        '_VENDA, '
      
        '   :COD_CLI_ULT_VENDA, :DES_CLI_ULT_VENDA, :QTD_ULT_VENDA, :VLR_' +
        'UNI_ULT_VENDA, '
      
        '   :VLR_TOT_ULT_VENDA, :VLR_UNI_VENDA, :COD_LISTA_VENDA, :DES_LI' +
        'STA_VENDA, '
      
        '   :COD_LISTA_COMPRA, :DES_LISTA_COMPRA, :VLR_CUSTO_MEDIO, :VLR_' +
        'TOT_VENDA, '
      
        '   :VLR_TOT_COMPRA, :VLR_BRUTO, :VLR_DESCONTOS, :VLR_DESPESAS, :' +
        'VLR_FRETE, '
      
        '   :IND_SOMA_IPI_BASE_ICMS, :IND_SOMA_FRETE_BASE_ICMS, :IND_SOMA' +
        '_DESPESA_BASE_ICMS, '
      
        '   :IND_SOMA_IPI_BASE_ST, :IND_SOMA_FRETE_BASE_ST, :IND_SOMA_DES' +
        'PESA_BASE_ST, '
      
        '   :COD_SIT_TRIBUTARIA, :COD_IPI, :IND_IPI, :PER_IPI, :VLR_IPI, ' +
        ':COD_ICMS, :PER_REDUCAO_ICMS, '
      
        '   :VLR_REDUCAO_ICMS, :VLR_BASE_ICMS, :PER_ICMS, :VLR_ICMS, :COD' +
        '_GRUPO_ST, '
      
        '   :DES_GRUPO_ST, :PER_MARGEM_ST, :IND_ST, :VLR_BASE_ST,    :PER' +
        '_ST, :VLR_ST,'
      
        '   :PER_REPASSE, :VLR_REPASSE, :COD_COMPROVANTE_ICMS, :COD_REFER' +
        'ENCIA_FORN, '
      '   :COD_FORNECEDOR, :DES_FORNECEDOR, :TIP_PESSOA, :DES_EMAIL, '
      
        '   :QTD_NR_DIAS, :QTD_NR_MESES, :QTD_TOT_MESES, :COD_COMPRADOR, ' +
        ':BLOB_TEXTO, '
      
        '   :IND_TRANSF, :DTA_LIM_TRANSF, :QTD_TRANSF, :IND_USAR, :IND_QT' +
        'D_ACIMA,'
      
        '   :QTD_SUGERIDA_ANO, :QTD_TRANSF_PERIODO, :QTD_TRANSF_ANO, :EST' +
        '_MINIMO, '
      
        '   :DIAS_ESTOCAGEM, :QTD_DEMANDA_DIA, :QTD_DEMANDA_ANO, :QTD_DIA' +
        'S_ANO,'
      '   :DATAINCLUSAO, :ESTADO, :DATAALTERACAO)'
      '')
    DeleteSQL.Strings = (
      'delete from oc_comprar'
      'where'
      '  NUM_SEQ = :NUM_SEQ'
      '  and NUM_DOCUMENTO = :NUM_DOCUMENTO')
    Left = 1178
    Top = 243
  end
  object IBQ_Executa: TIBQuery
    Database = IBDB_BelShop
    Transaction = IBT_BelShop
    BufferChunks = 1000
    CachedUpdates = False
    Left = 1138
    Top = 152
  end
  object IBQ_Busca: TIBQuery
    Database = IBDB_BelShop
    Transaction = IBT_BelShop
    BufferChunks = 1000
    CachedUpdates = False
    Left = 1138
    Top = 88
  end
  object DS_OrdemCompra: TDataSource
    DataSet = IBQ_OrdemCompra
    Left = 1178
    Top = 520
  end
  object IBQ_OrdemCompra: TIBQuery
    Database = IBDB_BelShop
    Transaction = IBT_BelShop
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select'
      #39'Bel_'#39'||oc.cod_empresa||'#39' - '#39'||oc.des_empresa des_empresa,'
      'oc.num_oc_gerada,'
      'Case co.compl_endereco'
      '  when '#39#39' Then co.des_endereco ||'#39', '#39'|| co.num_endereco'
      
        '  Else co.des_endereco ||'#39', '#39'|| co.num_endereco ||'#39' - '#39'|| co.com' +
        'pl_endereco'
      'End Endereco,'
      'co.des_bairro, co.des_cidade, co.cod_uf,'
      ''
      
        '(substring(co.cod_cep from 1 for 5) ||'#39'-'#39'|| substring(co.cod_cep' +
        ' from 6 for 3)) cod_cep,'
      ''
      '(substring(co.num_cnpj from 1 for 2) ||'#39'.'#39'||'
      ' substring(co.num_cnpj from 3 for 3) ||'#39'.'#39'||'
      ' substring(co.num_cnpj from 6 for 3) ||'#39'/'#39'||'
      ' substring(co.num_cnpj from 9 for 4) ||'#39'-'#39'||'
      ' substring(co.num_cnpj from 13 for 2)) num_cnpj,'
      ''
      'co.inscr_estadual,'
      ''
      'case oc.ind_oc_gerada'
      '  When '#39'N'#39' Then '#39'ABERTA'#39
      '  Else '#39'ABERTA - PENDENTE FORNECEDOR'#39
      'End Situacao,'
      'Cast(oc.dta_oc_gerada as Date) Dta_Pedido,'
      'Cast(oc.dta_oc_gerada as Date) Dta_Entrega,'
      ''
      'oc.cod_fornecedor, oc.des_fornecedor,'
      ''
      'oc.cod_item, oc.cod_referencia_forn,'
      'oc.des_item,'
      'oc.cod_barras,'
      'oc.uni_compra, oc.uni_venda,'
      'oc.qtd_acomprar, oc.vlr_uni_compra,'
      'oc.per_desconto,'
      'oc.vlr_tot_compra,'
      ''
      'oc.obs_oc,'
      ''
      'oc.cod_comprador, us.des_usuario,'
      ''
      'COALESCE(pe.zonaendereco,'#39'0'#39')||'#39'.'#39'||'
      'COALESCE(pe.corredor,'#39'0'#39')||'#39'.'#39'||'
      'COALESCE(pe.prateleira,'#39'0'#39')||'#39'.'#39'||'
      'COALESCE(pe.gaveta,'#39'0'#39') Enderecamento'
      ''
      'FROM OC_COMPRAR oc'
      '    LEFT JOIN EMP_CONEXOES  co  ON co.cod_filial=oc.cod_empresa'
      
        '    LEFT JOIN PS_USUARIOS   us  ON us.cod_usuario=oc.cod_comprad' +
        'or'
      '    LEFT JOIN prod_endereco pe  ON pe.cod_loja='#39'99'#39
      '                               AND pe.cod_item=oc.cod_item'
      ''
      'WHERE oc.num_documento='#39'9858'#39
      'AND   oc.cod_empresa='#39'01'#39
      'AND   oc.num_oc_gerada=1000043'
      ''
      'ORDER BY Enderecamento,oc.des_item')
    Left = 1130
    Top = 509
    object IBQ_OrdemCompraDES_EMPRESA: TIBStringField
      FieldName = 'DES_EMPRESA'
      Origin = 'OC_COMPRAR.DES_EMPRESA'
      Size = 60
    end
    object IBQ_OrdemCompraNUM_OC_GERADA: TIntegerField
      FieldName = 'NUM_OC_GERADA'
      Origin = 'OC_COMPRAR.NUM_OC_GERADA'
    end
    object IBQ_OrdemCompraENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Size = 110
    end
    object IBQ_OrdemCompraDES_BAIRRO: TIBStringField
      FieldName = 'DES_BAIRRO'
      Origin = 'EMP_CONEXOES.DES_BAIRRO'
      Size = 30
    end
    object IBQ_OrdemCompraDES_CIDADE: TIBStringField
      FieldName = 'DES_CIDADE'
      Origin = 'EMP_CONEXOES.DES_CIDADE'
      Size = 60
    end
    object IBQ_OrdemCompraCOD_UF: TIBStringField
      FieldName = 'COD_UF'
      Origin = 'EMP_CONEXOES.COD_UF'
      Size = 2
    end
    object IBQ_OrdemCompraCOD_CEP: TIBStringField
      FieldName = 'COD_CEP'
      Size = 17
    end
    object IBQ_OrdemCompraNUM_CNPJ: TIBStringField
      FieldName = 'NUM_CNPJ'
      Size = 94
    end
    object IBQ_OrdemCompraINSCR_ESTADUAL: TIBStringField
      FieldName = 'INSCR_ESTADUAL'
      Origin = 'EMP_CONEXOES.INSCR_ESTADUAL'
      Size = 18
    end
    object IBQ_OrdemCompraSITUACAO: TIBStringField
      FieldName = 'SITUACAO'
      Required = True
      FixedChar = True
      Size = 28
    end
    object IBQ_OrdemCompraDTA_PEDIDO: TDateField
      FieldName = 'DTA_PEDIDO'
    end
    object IBQ_OrdemCompraDTA_ENTREGA: TDateField
      FieldName = 'DTA_ENTREGA'
    end
    object IBQ_OrdemCompraCOD_FORNECEDOR: TIBStringField
      FieldName = 'COD_FORNECEDOR'
      Origin = 'OC_COMPRAR.COD_FORNECEDOR'
      Size = 6
    end
    object IBQ_OrdemCompraDES_FORNECEDOR: TIBStringField
      FieldName = 'DES_FORNECEDOR'
      Origin = 'OC_COMPRAR.DES_FORNECEDOR'
      Size = 40
    end
    object IBQ_OrdemCompraCOD_ITEM: TIBStringField
      FieldName = 'COD_ITEM'
      Origin = 'OC_COMPRAR.COD_ITEM'
      Size = 6
    end
    object IBQ_OrdemCompraCOD_BARRAS: TIBStringField
      FieldName = 'COD_BARRAS'
      Origin = 'OC_COMPRAR.COD_BARRAS'
      Size = 19
    end
    object IBQ_OrdemCompraCOD_REFERENCIA_FORN: TIBStringField
      FieldName = 'COD_REFERENCIA_FORN'
      Origin = 'OC_COMPRAR.COD_REFERENCIA_FORN'
      Size = 30
    end
    object IBQ_OrdemCompraDES_ITEM: TIBStringField
      FieldName = 'DES_ITEM'
      Origin = 'OC_COMPRAR.DES_ITEM'
      Size = 80
    end
    object IBQ_OrdemCompraUNI_COMPRA: TIntegerField
      FieldName = 'UNI_COMPRA'
      Origin = 'OC_COMPRAR.UNI_COMPRA'
    end
    object IBQ_OrdemCompraUNI_VENDA: TIntegerField
      FieldName = 'UNI_VENDA'
      Origin = 'OC_COMPRAR.UNI_VENDA'
    end
    object IBQ_OrdemCompraQTD_ACOMPRAR: TIBBCDField
      FieldName = 'QTD_ACOMPRAR'
      Origin = 'OC_COMPRAR.QTD_ACOMPRAR'
      Precision = 18
      Size = 2
    end
    object IBQ_OrdemCompraVLR_UNI_COMPRA: TIBBCDField
      FieldName = 'VLR_UNI_COMPRA'
      Origin = 'OC_COMPRAR.VLR_UNI_COMPRA'
      Precision = 18
      Size = 2
    end
    object IBQ_OrdemCompraPER_DESCONTO: TIBBCDField
      FieldName = 'PER_DESCONTO'
      Origin = 'OC_COMPRAR.PER_DESCONTO'
      Precision = 18
      Size = 2
    end
    object IBQ_OrdemCompraVLR_TOT_COMPRA: TIBBCDField
      FieldName = 'VLR_TOT_COMPRA'
      Origin = 'OC_COMPRAR.VLR_TOT_COMPRA'
      Precision = 18
      Size = 2
    end
    object IBQ_OrdemCompraOBS_OC: TIBStringField
      FieldName = 'OBS_OC'
      Origin = 'OC_COMPRAR.OBS_OC'
      Size = 2000
    end
    object IBQ_OrdemCompraCOD_COMPRADOR: TIntegerField
      FieldName = 'COD_COMPRADOR'
      Origin = 'OC_COMPRAR.COD_COMPRADOR'
    end
    object IBQ_OrdemCompraDES_USUARIO: TIBStringField
      FieldName = 'DES_USUARIO'
      Origin = 'PS_USUARIOS.DES_USUARIO'
      Size = 50
    end
    object IBQ_OrdemCompraENDERECAMENTO: TIBStringField
      FieldName = 'ENDERECAMENTO'
      Size = 16
    end
  end
  object DS_Busca: TDataSource
    DataSet = CDS_Busca
    Left = 152
    Top = 325
  end
  object SDS_DtaHoraServidor: TSQLDataSet
    CommandText = 
      'select current_timestamp, current_date, current_time'#13#10'from rdb$d' +
      'atabase'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 265
    Top = 19
  end
  object SDS_FluxoFornecedor: TSQLDataSet
    CommandText = 
      'select '#13#10#13#10'Case ff.NUM_SEQ'#13#10'   When 0 Then   ff.DTA_CAIXA'#13#10'End D' +
      'ATA,'#13#10#13#10'ff.COD_HISTORICO, fc.des_historico,'#13#10'ff.NUM_DOCUMENTO, f' +
      'f.NUM_SERIE, '#13#10#13#10'Case ff.TIP_DEBCRE'#13#10'    When '#39'C'#39' Then   ff.VLR_' +
      'CAIXA'#13#10'   Else 0'#13#10'End Vlr_Credito,'#13#10#13#10'Case ff.TIP_DEBCRE'#13#10'    Wh' +
      'en '#39'D'#39' Then   ff.VLR_CAIXA'#13#10'   Else 0'#13#10'End Vlr_Debito,'#13#10#13#10'Case f' +
      'f.NUM_SEQ'#13#10'   When 0 Then ff.VLR_SALDO'#13#10'   When 999999 Then ff.V' +
      'LR_SALDO'#13#10'End vlr_Saldo,'#13#10#13#10'ff.TXT_OBS,'#13#10#13#10'ff.COD_EMPRESA, emp.r' +
      'azao_social,'#13#10#13#10'ff.COD_FORNECEDOR, ff.DES_FORNECEDOR, ff.DTA_CAI' +
      'XA,'#13#10'ff.NUM_SEQ, ff.NUM_CHAVENF,'#13#10'ff.TIP_DEBCRE'#13#10#13#10'from  FL_CAIX' +
      'A_FORNECEDORES ff'#13#10'      left join fl_caixa_historicos fc on ff.' +
      'cod_historico=fc.cod_historico'#13#10'      left join  emp_conexoes em' +
      'p on ff.cod_empresa=emp.cod_filial'#13#10#13#10'Where ff.cod_fornecedor= :' +
      'CodForn'#13#10#13#10'order by ff.DTA_CAIXA, ff.NUM_SEQ'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CodForn'
        ParamType = ptInput
        Value = '0'
      end>
    SQLConnection = SQLC
    Left = 912
    Top = 88
  end
  object CDS_FluxoFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_FluxoFornecedor'
    Left = 991
    Top = 87
    object CDS_FluxoFornecedorDATA: TDateField
      FieldName = 'DATA'
    end
    object CDS_FluxoFornecedorCOD_EMPRESA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Emp'
      FieldName = 'COD_EMPRESA'
      Size = 2
    end
    object CDS_FluxoFornecedorRAZAO_SOCIAL: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'RAZAO_SOCIAL'
      Size = 60
    end
    object CDS_FluxoFornecedorCOD_HISTORICO: TIntegerField
      DisplayLabel = 'Cod Hist'
      FieldName = 'COD_HISTORICO'
    end
    object CDS_FluxoFornecedorDES_HISTORICO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'DES_HISTORICO'
      Size = 50
    end
    object CDS_FluxoFornecedorNUM_DOCUMENTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#186' Docto'
      FieldName = 'NUM_DOCUMENTO'
      Size = 6
    end
    object CDS_FluxoFornecedorNUM_SERIE: TStringField
      DisplayLabel = 'N'#186' S'#233'rie'
      FieldName = 'NUM_SERIE'
      Size = 4
    end
    object CDS_FluxoFornecedorVLR_CREDITO: TFMTBCDField
      DisplayLabel = 'Valor Cr'#233'dito'
      FieldName = 'VLR_CREDITO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_FluxoFornecedorVLR_DEBITO: TFMTBCDField
      DisplayLabel = 'Valor D'#233'bito'
      FieldName = 'VLR_DEBITO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_FluxoFornecedorVLR_SALDO: TFMTBCDField
      DisplayLabel = 'Valor Saldo'
      FieldName = 'VLR_SALDO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_FluxoFornecedorTXT_OBS: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'TXT_OBS'
      Size = 200
    end
    object CDS_FluxoFornecedorCOD_FORNECEDOR: TStringField
      FieldName = 'COD_FORNECEDOR'
      Required = True
      Size = 6
    end
    object CDS_FluxoFornecedorDES_FORNECEDOR: TStringField
      FieldName = 'DES_FORNECEDOR'
      Size = 40
    end
    object CDS_FluxoFornecedorDTA_CAIXA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data'
      FieldName = 'DTA_CAIXA'
    end
    object CDS_FluxoFornecedorNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
      Required = True
    end
    object CDS_FluxoFornecedorNUM_CHAVENF: TStringField
      FieldName = 'NUM_CHAVENF'
      Size = 21
    end
    object CDS_FluxoFornecedorTIP_DEBCRE: TStringField
      FieldName = 'TIP_DEBCRE'
      Size = 1
    end
  end
  object DSP_FluxoFornecedor: TDataSetProvider
    DataSet = SDS_FluxoFornecedor
    Left = 954
    Top = 104
  end
  object DS_FluxoFornecedor: TDataSource
    DataSet = CDS_FluxoFornecedor
    Left = 1029
    Top = 104
  end
  object SDS_While: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 35
    Top = 252
  end
  object CDS_While: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_While'
    Left = 116
    Top = 257
  end
  object DSP_While: TDataSetProvider
    DataSet = SDS_While
    Left = 76
    Top = 269
  end
  object SDS_EmpProcessa: TSQLDataSet
    CommandText = 
      'Select '#13#10'Case TIP_EMP'#13#10'  When '#39'M'#39' Then '#39'SIM'#39#13#10'  Else '#39'N'#227'o'#39#13#10'End ' +
      ' PROC, '#13#10'COD_FILIAL, ENDERECO_IP, PASTA_BASE_DADOS, DES_BASE_DAD' +
      'OS, COD_EMP, RAZAO_SOCIAL, TIP_EMP, '#13#10'DES_BAIRRO, DES_CIDADE, CO' +
      'D_UF, COD_CEP, NUM_CNPJ, INSCR_ESTADUAL, DES_ENDERECO, NUM_ENDER' +
      'ECO, '#13#10'COMPL_ENDERECO, IND_ATIVO, USU_INCLUI, DTA_INCLUI, USU_AL' +
      'TERA, DTA_ALTERA, COD_LISTAPRE'#13#10#13#10'From EMP_Conexoes'#13#10'Where Ind_A' +
      'tivo='#39'SIM'#39#13#10'Order by Cod_Emp'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 256
    Top = 139
  end
  object CDS_EmpProcessa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_EmpProcessa'
    Left = 335
    Top = 140
    object CDS_EmpProcessaPROC: TStringField
      DisplayLabel = 'Processar ?'
      FieldName = 'PROC'
      Required = True
      FixedChar = True
      Size = 3
    end
    object CDS_EmpProcessaCOD_FILIAL: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_FILIAL'
      Required = True
      Size = 2
    end
    object CDS_EmpProcessaENDERECO_IP: TStringField
      DisplayLabel = 'Endere'#231'o IP'
      FieldName = 'ENDERECO_IP'
      Required = True
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
      DisplayLabel = 'Empresa'
      FieldName = 'COD_EMP'
      Required = True
      Size = 6
    end
    object CDS_EmpProcessaRAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAO_SOCIAL'
      Size = 60
    end
    object CDS_EmpProcessaTIP_EMP: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIP_EMP'
      Size = 1
    end
    object CDS_EmpProcessaDES_BAIRRO: TStringField
      FieldName = 'DES_BAIRRO'
      Size = 30
    end
    object CDS_EmpProcessaDES_CIDADE: TStringField
      FieldName = 'DES_CIDADE'
      Size = 60
    end
    object CDS_EmpProcessaCOD_UF: TStringField
      FieldName = 'COD_UF'
      Size = 2
    end
    object CDS_EmpProcessaCOD_CEP: TStringField
      FieldName = 'COD_CEP'
      Size = 8
    end
    object CDS_EmpProcessaNUM_CNPJ: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'NUM_CNPJ'
      Size = 18
    end
    object CDS_EmpProcessaINSCR_ESTADUAL: TStringField
      FieldName = 'INSCR_ESTADUAL'
      Size = 18
    end
    object CDS_EmpProcessaDES_ENDERECO: TStringField
      FieldName = 'DES_ENDERECO'
      Size = 60
    end
    object CDS_EmpProcessaNUM_ENDERECO: TStringField
      FieldName = 'NUM_ENDERECO'
      Size = 15
    end
    object CDS_EmpProcessaCOMPL_ENDERECO: TStringField
      FieldName = 'COMPL_ENDERECO'
      Size = 30
    end
    object CDS_EmpProcessaIND_ATIVO: TStringField
      FieldName = 'IND_ATIVO'
      Size = 3
    end
    object CDS_EmpProcessaUSU_INCLUI: TIntegerField
      FieldName = 'USU_INCLUI'
    end
    object CDS_EmpProcessaDTA_INCLUI: TSQLTimeStampField
      FieldName = 'DTA_INCLUI'
      Required = True
    end
    object CDS_EmpProcessaUSU_ALTERA: TIntegerField
      FieldName = 'USU_ALTERA'
    end
    object CDS_EmpProcessaDTA_ALTERA: TSQLTimeStampField
      FieldName = 'DTA_ALTERA'
    end
    object CDS_EmpProcessaCOD_LISTAPRE: TStringField
      FieldName = 'COD_LISTAPRE'
      Size = 4
    end
  end
  object DSP_EmpProcessa: TDataSetProvider
    DataSet = SDS_EmpProcessa
    Left = 298
    Top = 156
  end
  object DS_EmpProcessa: TDataSource
    DataSet = CDS_EmpProcessa
    Left = 373
    Top = 156
  end
  object DS_AComprarEdita: TDataSource
    DataSet = IBQ_AComprarEdita
    Left = 1218
    Top = 286
  end
  object IBQ_AComprarEdita: TIBQuery
    Database = IBDB_BelShop
    Transaction = IBT_BelShop
    AfterPost = IBQ_AComprarEditaAfterPost
    AfterScroll = IBQ_AComprarEditaAfterScroll
    BeforePost = IBQ_AComprarEditaBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *'
      'from oc_comprar o'
      'where o.num_seq<14')
    UpdateObject = IBU_AComprarEdita
    Left = 1130
    Top = 293
    object IBQ_AComprarEditaNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
      Origin = 'OC_COMPRAR.NUM_SEQ'
      Required = True
    end
    object IBQ_AComprarEditaNUM_DOCUMENTO: TIntegerField
      FieldName = 'NUM_DOCUMENTO'
      Origin = 'OC_COMPRAR.NUM_DOCUMENTO'
      Required = True
    end
    object IBQ_AComprarEditaDTA_DOCUMENTO: TDateTimeField
      Alignment = taCenter
      FieldName = 'DTA_DOCUMENTO'
      Origin = 'OC_COMPRAR.DTA_DOCUMENTO'
    end
    object IBQ_AComprarEditaIND_OC_GERADA: TIBStringField
      FieldName = 'IND_OC_GERADA'
      Origin = 'OC_COMPRAR.IND_OC_GERADA'
      Size = 1
    end
    object IBQ_AComprarEditaDTA_OC_GERADA: TDateTimeField
      Alignment = taCenter
      FieldName = 'DTA_OC_GERADA'
      Origin = 'OC_COMPRAR.DTA_OC_GERADA'
    end
    object IBQ_AComprarEditaNUM_OC_GERADA: TIntegerField
      FieldName = 'NUM_OC_GERADA'
      Origin = 'OC_COMPRAR.NUM_OC_GERADA'
    end
    object IBQ_AComprarEditaOBS_OC: TIBStringField
      FieldName = 'OBS_OC'
      Origin = 'OC_COMPRAR.OBS_OC'
      Size = 2000
    end
    object IBQ_AComprarEditaCOD_EMPRESA: TIBStringField
      Alignment = taRightJustify
      FieldName = 'COD_EMPRESA'
      Origin = 'OC_COMPRAR.COD_EMPRESA'
      Size = 6
    end
    object IBQ_AComprarEditaDES_EMPRESA: TIBStringField
      FieldName = 'DES_EMPRESA'
      Origin = 'OC_COMPRAR.DES_EMPRESA'
      Size = 60
    end
    object IBQ_AComprarEditaCOD_ITEM: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd Produto'
      FieldName = 'COD_ITEM'
      Origin = 'OC_COMPRAR.COD_ITEM'
      Size = 6
    end
    object IBQ_AComprarEditaDES_ITEM: TIBStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'DES_ITEM'
      Origin = 'OC_COMPRAR.DES_ITEM'
      Size = 80
    end
    object IBQ_AComprarEditaQTD_SUGERIDA: TIBBCDField
      DisplayLabel = 'Sugest'#227'o'
      FieldName = 'QTD_SUGERIDA'
      Origin = 'OC_COMPRAR.QTD_SUGERIDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_ACOMPRAR: TIBBCDField
      DisplayLabel = 'A Comprar'
      FieldName = 'QTD_ACOMPRAR'
      Origin = 'OC_COMPRAR.QTD_ACOMPRAR'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_SALDO: TIBBCDField
      DisplayLabel = 'Saldo'
      FieldName = 'QTD_SALDO'
      Origin = 'OC_COMPRAR.QTD_SALDO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_TRANSITO: TIBBCDField
      DisplayLabel = 'Tr'#226'nsito'
      FieldName = 'QTD_TRANSITO'
      Origin = 'OC_COMPRAR.QTD_TRANSITO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_TRANSF: TIBBCDField
      DisplayLabel = 'Transf'
      FieldName = 'QTD_TRANSF'
      Origin = 'OC_COMPRAR.QTD_TRANSF'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_DISPONIVEL: TIBBCDField
      DisplayLabel = 'Previsto'
      FieldName = 'QTD_DISPONIVEL'
      Origin = 'OC_COMPRAR.QTD_DISPONIVEL'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_MEDIA_MES: TIBBCDField
      DisplayLabel = 'M'#233'dia M'#234's'
      FieldName = 'QTD_MEDIA_MES'
      Origin = 'OC_COMPRAR.QTD_MEDIA_MES'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 4
    end
    object IBQ_AComprarEditaQTD_MEDIA_DIA: TIBBCDField
      DisplayLabel = 'M'#233'dia Dia'
      FieldName = 'QTD_MEDIA_DIA'
      Origin = 'OC_COMPRAR.QTD_MEDIA_DIA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 4
    end
    object IBQ_AComprarEditaQTD_DEM_MES1: TIBBCDField
      FieldName = 'QTD_DEM_MES1'
      Origin = 'OC_COMPRAR.QTD_DEM_MES1'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_DEM_MES2: TIBBCDField
      FieldName = 'QTD_DEM_MES2'
      Origin = 'OC_COMPRAR.QTD_DEM_MES2'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_DEM_MES3: TIBBCDField
      FieldName = 'QTD_DEM_MES3'
      Origin = 'OC_COMPRAR.QTD_DEM_MES3'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_DEM_MES4: TIBBCDField
      FieldName = 'QTD_DEM_MES4'
      Origin = 'OC_COMPRAR.QTD_DEM_MES4'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_DEM_MES5: TIBBCDField
      FieldName = 'QTD_DEM_MES5'
      Origin = 'OC_COMPRAR.QTD_DEM_MES5'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_DEM_MES6: TIBBCDField
      FieldName = 'QTD_DEM_MES6'
      Origin = 'OC_COMPRAR.QTD_DEM_MES6'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_DEM_MES7: TIBBCDField
      FieldName = 'QTD_DEM_MES7'
      Origin = 'OC_COMPRAR.QTD_DEM_MES7'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_DEM_MES8: TIBBCDField
      FieldName = 'QTD_DEM_MES8'
      Origin = 'OC_COMPRAR.QTD_DEM_MES8'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaUNI_COMPRA: TIntegerField
      DisplayLabel = 'Uni Compra'
      FieldName = 'UNI_COMPRA'
      Origin = 'OC_COMPRAR.UNI_COMPRA'
    end
    object IBQ_AComprarEditaUNI_VENDA: TIntegerField
      DisplayLabel = 'Uni Venda'
      FieldName = 'UNI_VENDA'
      Origin = 'OC_COMPRAR.UNI_VENDA'
    end
    object IBQ_AComprarEditaCOD_BARRAS: TIBStringField
      DisplayLabel = 'EAN'
      FieldName = 'COD_BARRAS'
      Origin = 'OC_COMPRAR.COD_BARRAS'
      Size = 19
    end
    object IBQ_AComprarEditaCOD_GRUPO: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Grupo'
      FieldName = 'COD_GRUPO'
      Origin = 'OC_COMPRAR.COD_GRUPO'
      Size = 3
    end
    object IBQ_AComprarEditaDES_GRUPO: TIBStringField
      DisplayLabel = 'Grupo'
      FieldName = 'DES_GRUPO'
      Origin = 'OC_COMPRAR.DES_GRUPO'
      Size = 30
    end
    object IBQ_AComprarEditaCOD_SUBGRUPO: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod SubGrupo'
      FieldName = 'COD_SUBGRUPO'
      Origin = 'OC_COMPRAR.COD_SUBGRUPO'
      Size = 7
    end
    object IBQ_AComprarEditaDES_SUBGRUPO: TIBStringField
      DisplayLabel = 'SubGrupo'
      FieldName = 'DES_SUBGRUPO'
      Origin = 'OC_COMPRAR.DES_SUBGRUPO'
      Size = 30
    end
    object IBQ_AComprarEditaDES_GENERICO: TIBStringField
      DisplayLabel = 'Gen'#233'rico'
      FieldName = 'DES_GENERICO'
      Origin = 'OC_COMPRAR.DES_GENERICO'
      Size = 80
    end
    object IBQ_AComprarEditaCOD_APLICACAO: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Aplic'
      FieldName = 'COD_APLICACAO'
      Origin = 'OC_COMPRAR.COD_APLICACAO'
      Size = 4
    end
    object IBQ_AComprarEditaDES_APLICACAO: TIBStringField
      DisplayLabel = 'Aplica'#231#227'o'
      FieldName = 'DES_APLICACAO'
      Origin = 'OC_COMPRAR.DES_APLICACAO'
      Size = 30
    end
    object IBQ_AComprarEditaCOD_REFERENCIA: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Refer'#234'ncia'
      FieldName = 'COD_REFERENCIA'
      Origin = 'OC_COMPRAR.COD_REFERENCIA'
      Size = 15
    end
    object IBQ_AComprarEditaCLA_CURVA_ABC: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Curva ABC'
      FieldName = 'CLA_CURVA_ABC'
      Origin = 'OC_COMPRAR.CLA_CURVA_ABC'
      Size = 1
    end
    object IBQ_AComprarEditaCOD_FAMILIA_PRECO: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Fam Pre'#231'o'
      FieldName = 'COD_FAMILIA_PRECO'
      Origin = 'OC_COMPRAR.COD_FAMILIA_PRECO'
      Size = 4
    end
    object IBQ_AComprarEditaDES_FAMILIA_PRECO: TIBStringField
      DisplayLabel = 'Fam'#237'lia Pre'#231'o'
      FieldName = 'DES_FAMILIA_PRECO'
      Origin = 'OC_COMPRAR.DES_FAMILIA_PRECO'
      Size = 40
    end
    object IBQ_AComprarEditaDTA_ULT_COMPRA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dta Ult Compra'
      FieldName = 'DTA_ULT_COMPRA'
      Origin = 'OC_COMPRAR.DTA_ULT_COMPRA'
    end
    object IBQ_AComprarEditaCOD_FOR_ULT_COMPRA: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Forn Ult Compra'
      FieldName = 'COD_FOR_ULT_COMPRA'
      Origin = 'OC_COMPRAR.COD_FOR_ULT_COMPRA'
      Size = 6
    end
    object IBQ_AComprarEditaDES_FOR_ULT_COMPRA: TIBStringField
      DisplayLabel = 'Fornecedor Ult Compra'
      FieldName = 'DES_FOR_ULT_COMPRA'
      Origin = 'OC_COMPRAR.DES_FOR_ULT_COMPRA'
      Size = 40
    end
    object IBQ_AComprarEditaQTD_ULT_COMPRA: TIBBCDField
      DisplayLabel = 'Qtd Ult Compra'
      FieldName = 'QTD_ULT_COMPRA'
      Origin = 'OC_COMPRAR.QTD_ULT_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_UNI_ULT_COMPRA: TIBBCDField
      DisplayLabel = 'Vlr Unit Ult Compra'
      FieldName = 'VLR_UNI_ULT_COMPRA'
      Origin = 'OC_COMPRAR.VLR_UNI_ULT_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_TOT_ULT_COMPRA: TIBBCDField
      DisplayLabel = 'Vlr Tot Ult Compra'
      FieldName = 'VLR_TOT_ULT_COMPRA'
      Origin = 'OC_COMPRAR.VLR_TOT_ULT_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_UNI_COMPRA: TIBBCDField
      DisplayLabel = 'Vlr Unit Compra'
      FieldName = 'VLR_UNI_COMPRA'
      Origin = 'OC_COMPRAR.VLR_UNI_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaPER_DESCONTO: TIBBCDField
      DisplayLabel = 'Per Desc'
      FieldName = 'PER_DESCONTO'
      Origin = 'OC_COMPRAR.PER_DESCONTO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaDTA_ULT_VENDA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dta Ult Venda'
      FieldName = 'DTA_ULT_VENDA'
      Origin = 'OC_COMPRAR.DTA_ULT_VENDA'
    end
    object IBQ_AComprarEditaDES_CLI_ULT_VENDA: TIBStringField
      DisplayLabel = 'Cliente Ult Venda'
      FieldName = 'DES_CLI_ULT_VENDA'
      Origin = 'OC_COMPRAR.DES_CLI_ULT_VENDA'
      Size = 40
    end
    object IBQ_AComprarEditaCOD_CLI_ULT_VENDA: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Cli Ult Venda'
      FieldName = 'COD_CLI_ULT_VENDA'
      Origin = 'OC_COMPRAR.COD_CLI_ULT_VENDA'
      Size = 6
    end
    object IBQ_AComprarEditaQTD_ULT_VENDA: TIBBCDField
      DisplayLabel = 'Qtd Ult Venda'
      FieldName = 'QTD_ULT_VENDA'
      Origin = 'OC_COMPRAR.QTD_ULT_VENDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_UNI_ULT_VENDA: TIBBCDField
      DisplayLabel = 'Vlr Unit Ult Venda'
      FieldName = 'VLR_UNI_ULT_VENDA'
      Origin = 'OC_COMPRAR.VLR_UNI_ULT_VENDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_TOT_ULT_VENDA: TIBBCDField
      DisplayLabel = 'Vlr Tot Ult Venda'
      FieldName = 'VLR_TOT_ULT_VENDA'
      Origin = 'OC_COMPRAR.VLR_TOT_ULT_VENDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_UNI_VENDA: TIBBCDField
      DisplayLabel = 'Vlr Unit Venda'
      FieldName = 'VLR_UNI_VENDA'
      Origin = 'OC_COMPRAR.VLR_UNI_VENDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaCOD_LISTA_VENDA: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Lista Venda'
      FieldName = 'COD_LISTA_VENDA'
      Origin = 'OC_COMPRAR.COD_LISTA_VENDA'
      Size = 4
    end
    object IBQ_AComprarEditaDES_LISTA_VENDA: TIBStringField
      DisplayLabel = 'Lista Venda'
      FieldName = 'DES_LISTA_VENDA'
      Origin = 'OC_COMPRAR.DES_LISTA_VENDA'
      Size = 30
    end
    object IBQ_AComprarEditaCOD_LISTA_COMPRA: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Lista Compra'
      FieldName = 'COD_LISTA_COMPRA'
      Origin = 'OC_COMPRAR.COD_LISTA_COMPRA'
      Size = 4
    end
    object IBQ_AComprarEditaDES_LISTA_COMPRA: TIBStringField
      DisplayLabel = 'Lista Compra'
      FieldName = 'DES_LISTA_COMPRA'
      Origin = 'OC_COMPRAR.DES_LISTA_COMPRA'
      Size = 30
    end
    object IBQ_AComprarEditaVLR_CUSTO_MEDIO: TIBBCDField
      DisplayLabel = 'Vlr Custo M'#233'dio'
      FieldName = 'VLR_CUSTO_MEDIO'
      Origin = 'OC_COMPRAR.VLR_CUSTO_MEDIO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_TOT_VENDA: TIBBCDField
      DisplayLabel = 'Vlr Tot Venda'
      FieldName = 'VLR_TOT_VENDA'
      Origin = 'OC_COMPRAR.VLR_TOT_VENDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_TOT_COMPRA: TIBBCDField
      DisplayLabel = 'Vlr Tot Compra'
      FieldName = 'VLR_TOT_COMPRA'
      Origin = 'OC_COMPRAR.VLR_TOT_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_BRUTO: TIBBCDField
      FieldName = 'VLR_BRUTO'
      Origin = 'OC_COMPRAR.VLR_BRUTO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_DESCONTOS: TIBBCDField
      DisplayLabel = 'Vlr Desc'
      FieldName = 'VLR_DESCONTOS'
      Origin = 'OC_COMPRAR.VLR_DESCONTOS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_DESPESAS: TIBBCDField
      DisplayLabel = 'Vlr Desp'
      FieldName = 'VLR_DESPESAS'
      Origin = 'OC_COMPRAR.VLR_DESPESAS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_FRETE: TIBBCDField
      DisplayLabel = 'Vlr Frete'
      FieldName = 'VLR_FRETE'
      Origin = 'OC_COMPRAR.VLR_FRETE'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaIND_SOMA_IPI_BASE_ICMS: TIBStringField
      Alignment = taCenter
      FieldName = 'IND_SOMA_IPI_BASE_ICMS'
      Origin = 'OC_COMPRAR.IND_SOMA_IPI_BASE_ICMS'
      Size = 1
    end
    object IBQ_AComprarEditaIND_SOMA_FRETE_BASE_ICMS: TIBStringField
      Alignment = taCenter
      FieldName = 'IND_SOMA_FRETE_BASE_ICMS'
      Origin = 'OC_COMPRAR.IND_SOMA_FRETE_BASE_ICMS'
      Size = 1
    end
    object IBQ_AComprarEditaIND_SOMA_DESPESA_BASE_ICMS: TIBStringField
      Alignment = taCenter
      FieldName = 'IND_SOMA_DESPESA_BASE_ICMS'
      Origin = 'OC_COMPRAR.IND_SOMA_DESPESA_BASE_ICMS'
      Size = 1
    end
    object IBQ_AComprarEditaIND_SOMA_IPI_BASE_ST: TIBStringField
      Alignment = taCenter
      FieldName = 'IND_SOMA_IPI_BASE_ST'
      Origin = 'OC_COMPRAR.IND_SOMA_IPI_BASE_ST'
      Size = 1
    end
    object IBQ_AComprarEditaIND_SOMA_FRETE_BASE_ST: TIBStringField
      Alignment = taCenter
      FieldName = 'IND_SOMA_FRETE_BASE_ST'
      Origin = 'OC_COMPRAR.IND_SOMA_FRETE_BASE_ST'
      Size = 1
    end
    object IBQ_AComprarEditaIND_SOMA_DESPESA_BASE_ST: TIBStringField
      Alignment = taCenter
      FieldName = 'IND_SOMA_DESPESA_BASE_ST'
      Origin = 'OC_COMPRAR.IND_SOMA_DESPESA_BASE_ST'
      Size = 1
    end
    object IBQ_AComprarEditaCOD_SIT_TRIBUTARIA: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Sit Trib'
      FieldName = 'COD_SIT_TRIBUTARIA'
      Origin = 'OC_COMPRAR.COD_SIT_TRIBUTARIA'
      Size = 2
    end
    object IBQ_AComprarEditaCOD_IPI: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod IPI'
      FieldName = 'COD_IPI'
      Origin = 'OC_COMPRAR.COD_IPI'
      Size = 2
    end
    object IBQ_AComprarEditaIND_IPI: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Ind IPI'
      FieldName = 'IND_IPI'
      Origin = 'OC_COMPRAR.IND_IPI'
      Size = 1
    end
    object IBQ_AComprarEditaPER_IPI: TIBBCDField
      DisplayLabel = 'Per IPI'
      FieldName = 'PER_IPI'
      Origin = 'OC_COMPRAR.PER_IPI'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBQ_AComprarEditaVLR_IPI: TIBBCDField
      DisplayLabel = 'Vlr IPI'
      FieldName = 'VLR_IPI'
      Origin = 'OC_COMPRAR.VLR_IPI'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaCOD_ICMS: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod ICMS'
      FieldName = 'COD_ICMS'
      Origin = 'OC_COMPRAR.COD_ICMS'
      Size = 2
    end
    object IBQ_AComprarEditaPER_REDUCAO_ICMS: TIBBCDField
      DisplayLabel = 'Per Red ICMS'
      FieldName = 'PER_REDUCAO_ICMS'
      Origin = 'OC_COMPRAR.PER_REDUCAO_ICMS'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBQ_AComprarEditaVLR_REDUCAO_ICMS: TIBBCDField
      DisplayLabel = 'Vlr Red ICMS'
      FieldName = 'VLR_REDUCAO_ICMS'
      Origin = 'OC_COMPRAR.VLR_REDUCAO_ICMS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaVLR_BASE_ICMS: TIBBCDField
      DisplayLabel = 'Vlr Base ICMS'
      FieldName = 'VLR_BASE_ICMS'
      Origin = 'OC_COMPRAR.VLR_BASE_ICMS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaPER_ICMS: TIBBCDField
      DisplayLabel = 'Per ICMS'
      FieldName = 'PER_ICMS'
      Origin = 'OC_COMPRAR.PER_ICMS'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBQ_AComprarEditaVLR_ICMS: TIBBCDField
      DisplayLabel = 'Vlr ICMS'
      FieldName = 'VLR_ICMS'
      Origin = 'OC_COMPRAR.VLR_ICMS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaCOD_GRUPO_ST: TIntegerField
      DisplayLabel = 'Cod Gr ST'
      FieldName = 'COD_GRUPO_ST'
      Origin = 'OC_COMPRAR.COD_GRUPO_ST'
    end
    object IBQ_AComprarEditaDES_GRUPO_ST: TIBStringField
      DisplayLabel = 'Grupo ST'
      FieldName = 'DES_GRUPO_ST'
      Origin = 'OC_COMPRAR.DES_GRUPO_ST'
      Size = 30
    end
    object IBQ_AComprarEditaPER_MARGEM_ST: TIBBCDField
      DisplayLabel = 'Per Margem ST'
      FieldName = 'PER_MARGEM_ST'
      Origin = 'OC_COMPRAR.PER_MARGEM_ST'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 4
    end
    object IBQ_AComprarEditaIND_ST: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Ind ST'
      FieldName = 'IND_ST'
      Origin = 'OC_COMPRAR.IND_ST'
      Size = 1
    end
    object IBQ_AComprarEditaVLR_BASE_ST: TIBBCDField
      DisplayLabel = 'Vlr Base ST'
      FieldName = 'VLR_BASE_ST'
      Origin = 'OC_COMPRAR.VLR_BASE_ST'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaPER_ST: TIBBCDField
      DisplayLabel = 'Per ST'
      FieldName = 'PER_ST'
      Origin = 'OC_COMPRAR.PER_ST'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBQ_AComprarEditaVLR_ST: TIBBCDField
      DisplayLabel = 'Vlr ST'
      FieldName = 'VLR_ST'
      Origin = 'OC_COMPRAR.VLR_ST'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaPER_REPASSE: TIBBCDField
      DisplayLabel = 'Per Repasse'
      FieldName = 'PER_REPASSE'
      Origin = 'OC_COMPRAR.PER_REPASSE'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBQ_AComprarEditaVLR_REPASSE: TIBBCDField
      DisplayLabel = 'Vlr Repasse'
      FieldName = 'VLR_REPASSE'
      Origin = 'OC_COMPRAR.VLR_REPASSE'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaCOD_COMPROVANTE_ICMS: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Comprovante ICMS'
      FieldName = 'COD_COMPROVANTE_ICMS'
      Origin = 'OC_COMPRAR.COD_COMPROVANTE_ICMS'
      Size = 3
    end
    object IBQ_AComprarEditaCOD_REFERENCIA_FORN: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Referencia Forn'
      FieldName = 'COD_REFERENCIA_FORN'
      Origin = 'OC_COMPRAR.COD_REFERENCIA_FORN'
      Size = 14
    end
    object IBQ_AComprarEditaCOD_FORNECEDOR: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Forn'
      FieldName = 'COD_FORNECEDOR'
      Origin = 'OC_COMPRAR.COD_FORNECEDOR'
      Size = 6
    end
    object IBQ_AComprarEditaDES_FORNECEDOR: TIBStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'DES_FORNECEDOR'
      Origin = 'OC_COMPRAR.DES_FORNECEDOR'
      Size = 40
    end
    object IBQ_AComprarEditaTIP_PESSOA: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Tipo Pessoa'
      FieldName = 'TIP_PESSOA'
      Origin = 'OC_COMPRAR.TIP_PESSOA'
      Size = 1
    end
    object IBQ_AComprarEditaDES_EMAIL: TIBStringField
      DisplayLabel = 'E-Mail'
      FieldName = 'DES_EMAIL'
      Origin = 'OC_COMPRAR.DES_EMAIL'
      Size = 80
    end
    object IBQ_AComprarEditaQTD_NR_DIAS: TIntegerField
      DisplayLabel = 'Nr Dias'
      FieldName = 'QTD_NR_DIAS'
      Origin = 'OC_COMPRAR.QTD_NR_DIAS'
    end
    object IBQ_AComprarEditaQTD_NR_MESES: TIntegerField
      DisplayLabel = 'Nr Meses'
      FieldName = 'QTD_NR_MESES'
      Origin = 'OC_COMPRAR.QTD_NR_MESES'
    end
    object IBQ_AComprarEditaQTD_TOT_MESES: TIntegerField
      DisplayLabel = 'Total Meses'
      FieldName = 'QTD_TOT_MESES'
      Origin = 'OC_COMPRAR.QTD_TOT_MESES'
    end
    object IBQ_AComprarEditaCOD_COMPRADOR: TIntegerField
      FieldName = 'COD_COMPRADOR'
      Origin = 'OC_COMPRAR.COD_COMPRADOR'
    end
    object IBQ_AComprarEditaBLOB_TEXTO: TMemoField
      FieldName = 'BLOB_TEXTO'
      Origin = 'OC_COMPRAR.BLOB_TEXTO'
      BlobType = ftMemo
      Size = 8
    end
    object IBQ_AComprarEditaIND_TRANSF: TIBStringField
      FieldName = 'IND_TRANSF'
      Origin = 'OC_COMPRAR.IND_TRANSF'
      Size = 1
    end
    object IBQ_AComprarEditaDTA_LIM_TRANSF: TDateField
      FieldName = 'DTA_LIM_TRANSF'
      Origin = 'OC_COMPRAR.DTA_LIM_TRANSF'
    end
    object IBQ_AComprarEditaIND_USAR: TIBStringField
      FieldName = 'IND_USAR'
      Origin = 'OC_COMPRAR.IND_USAR'
      Size = 3
    end
    object IBQ_AComprarEditaIND_QTD_ACIMA: TIBBCDField
      FieldName = 'IND_QTD_ACIMA'
      Origin = 'OC_COMPRAR.IND_QTD_ACIMA'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_SUGERIDA_ANO: TIBBCDField
      DisplayLabel = 'Sug. ANO'
      FieldName = 'QTD_SUGERIDA_ANO'
      Origin = 'OC_COMPRAR.QTD_SUGERIDA_ANO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_TRANSF_PERIODO: TIBBCDField
      DisplayLabel = 'Transf Per'#237'odo'
      FieldName = 'QTD_TRANSF_PERIODO'
      Origin = 'OC_COMPRAR.QTD_TRANSF_PERIODO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_TRANSF_ANO: TIBBCDField
      DisplayLabel = 'Transf Ano'
      FieldName = 'QTD_TRANSF_ANO'
      Origin = 'OC_COMPRAR.QTD_TRANSF_ANO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaEST_MINIMO: TIBBCDField
      DisplayLabel = 'Est. M'#237'nimo'
      FieldName = 'EST_MINIMO'
      Origin = 'OC_COMPRAR.EST_MINIMO'
      DisplayFormat = '0,'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaDIAS_ESTOCAGEM: TIntegerField
      DisplayLabel = 'Dias Estocagem'
      FieldName = 'DIAS_ESTOCAGEM'
      Origin = 'OC_COMPRAR.DIAS_ESTOCAGEM'
      DisplayFormat = '0,'
    end
    object IBQ_AComprarEditaQTD_DEMANDA_DIA: TIBBCDField
      FieldName = 'QTD_DEMANDA_DIA'
      Origin = 'OC_COMPRAR.QTD_DEMANDA_DIA'
      Precision = 18
      Size = 4
    end
    object IBQ_AComprarEditaQTD_DEMANDA_ANO: TIBBCDField
      FieldName = 'QTD_DEMANDA_ANO'
      Origin = 'OC_COMPRAR.QTD_DEMANDA_ANO'
      Precision = 18
      Size = 2
    end
    object IBQ_AComprarEditaQTD_DIAS_ANO: TIntegerField
      FieldName = 'QTD_DIAS_ANO'
      Origin = 'OC_COMPRAR.QTD_DIAS_ANO'
    end
    object IBQ_AComprarEditaDATAINCLUSAO: TDateField
      DisplayLabel = 'Inclus'#227'o'
      FieldName = 'DATAINCLUSAO'
      Origin = 'OC_COMPRAR.DATAINCLUSAO'
    end
    object IBQ_AComprarEditaESTADO: TIBStringField
      DisplayLabel = 'UF'
      FieldName = 'ESTADO'
      Origin = 'OC_COMPRAR.ESTADO'
      FixedChar = True
      Size = 2
    end
    object IBQ_AComprarEditaDATAALTERACAO: TDateField
      FieldName = 'DATAALTERACAO'
      Origin = 'OC_COMPRAR.DATAALTERACAO'
    end
    object IBQ_AComprarEditaIND_TRANSF_CD: TIBStringField
      FieldName = 'IND_TRANSF_CD'
      Origin = 'OC_COMPRAR.IND_TRANSF_CD'
      FixedChar = True
      Size = 1
    end
    object IBQ_AComprarEditaDOC_TRANSF_CD: TIntegerField
      FieldName = 'DOC_TRANSF_CD'
      Origin = 'OC_COMPRAR.DOC_TRANSF_CD'
    end
  end
  object IBU_AComprarEdita: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from oc_comprar '
      'where'
      '  NUM_SEQ = :NUM_SEQ'
      ' and  NUM_DOCUMENTO = :NUM_DOCUMENTO')
    ModifySQL.Strings = (
      'update oc_comprar'
      'set'
      '  QTD_ACOMPRAR = :QTD_ACOMPRAR,'
      '  QTD_TRANSF = :QTD_TRANSF,'
      '  VLR_UNI_COMPRA = :VLR_UNI_COMPRA,'
      '  PER_DESCONTO = :PER_DESCONTO,'
      
        '  VLR_DESCONTOS=((QTD_ACOMPRAR*VLR_UNI_COMPRA)*(PER_DESCONTO/100' +
        ')),'
      '  VLR_BRUTO=(QTD_ACOMPRAR*VLR_UNI_COMPRA)-VLR_DESCONTOS,'
      '  VLR_BASE_ICMS=VLR_BRUTO,'
      
        '  VLR_ICMS=Cast(((VLR_BASE_ICMS*PER_ICMS)/100) as Numeric(12,2))' +
        ','
      '  VLR_IPI=Cast(((VLR_BRUTO*PER_IPI)/100) as Numeric(12,2)),'
      
        '  VLR_BASE_ST=VLR_BRUTO+(Cast(((VLR_BRUTO*PER_MARGEM_ST)/100) as' +
        ' Numeric(12,2))),'
      
        '  VLR_ST=(Cast(((VLR_BASE_ST*PER_ST)/100) as Numeric(12,2))-VLR_' +
        'ICMS),'
      '  VLR_TOT_COMPRA=VLR_BRUTO+VLR_ST+VLR_IPI,'
      '  VLR_TOT_ULT_VENDA=QTD_ACOMPRAR*VLR_UNI_VENDA,'
      '  BLOB_TEXTO = :BLOB_TEXTO'
      'where'
      '  NUM_SEQ = :NUM_SEQ'
      '  and NUM_DOCUMENTO = :NUM_DOCUMENTO')
    InsertSQL.Strings = (
      'insert into oc_comprar'
      
        '  (NUM_SEQ, NUM_DOCUMENTO, DTA_DOCUMENTO, IND_OC_GERADA, DTA_OC_' +
        'GERADA, '
      
        '   NUM_OC_GERADA, OBS_OC, COD_EMPRESA, DES_EMPRESA, COD_ITEM, DE' +
        'S_ITEM, '
      
        '   QTD_SUGERIDA, QTD_ACOMPRAR, QTD_SALDO, QTD_TRANSITO, QTD_DISP' +
        'ONIVEL, '
      
        '   QTD_MEDIA_MES, QTD_MEDIA_DIA, QTD_DEM_MES1, QTD_DEM_MES2, QTD' +
        '_DEM_MES3, '
      
        '   QTD_DEM_MES4, QTD_DEM_MES5, QTD_DEM_MES6, QTD_DEM_MES7, QTD_D' +
        'EM_MES8, '
      
        '   UNI_COMPRA, UNI_VENDA, COD_BARRAS, COD_GRUPO, DES_GRUPO, COD_' +
        'SUBGRUPO, '
      
        '   DES_SUBGRUPO, DES_GENERICO, COD_APLICACAO, DES_APLICACAO, COD' +
        '_REFERENCIA, '
      
        '   CLA_CURVA_ABC, COD_FAMILIA_PRECO, DES_FAMILIA_PRECO, DTA_ULT_' +
        'COMPRA, '
      
        '   COD_FOR_ULT_COMPRA, DES_FOR_ULT_COMPRA, QTD_ULT_COMPRA, VLR_U' +
        'NI_ULT_COMPRA, '
      
        '   VLR_TOT_ULT_COMPRA, VLR_UNI_COMPRA, PER_DESCONTO, DTA_ULT_VEN' +
        'DA, COD_CLI_ULT_VENDA, '
      
        '   DES_CLI_ULT_VENDA, QTD_ULT_VENDA, VLR_UNI_ULT_VENDA, VLR_TOT_' +
        'ULT_VENDA, '
      
        '   VLR_UNI_VENDA, COD_LISTA_VENDA, DES_LISTA_VENDA, COD_LISTA_CO' +
        'MPRA, DES_LISTA_COMPRA, '
      
        '   VLR_CUSTO_MEDIO, VLR_TOT_VENDA, VLR_TOT_COMPRA, VLR_BRUTO, VL' +
        'R_DESCONTOS, '
      
        '   VLR_DESPESAS, VLR_FRETE, IND_SOMA_IPI_BASE_ICMS, IND_SOMA_FRE' +
        'TE_BASE_ICMS, '
      
        '   IND_SOMA_DESPESA_BASE_ICMS, IND_SOMA_IPI_BASE_ST, IND_SOMA_FR' +
        'ETE_BASE_ST, '
      
        '   IND_SOMA_DESPESA_BASE_ST, COD_SIT_TRIBUTARIA, COD_IPI, IND_IP' +
        'I, PER_IPI, '
      
        '   VLR_IPI, COD_ICMS, PER_REDUCAO_ICMS, VLR_REDUCAO_ICMS, VLR_BA' +
        'SE_ICMS, '
      
        '   PER_ICMS, VLR_ICMS, COD_GRUPO_ST, DES_GRUPO_ST, PER_MARGEM_ST' +
        ', IND_ST, '
      
        '   VLR_BASE_ST, PER_ST, VLR_ST, PER_REPASSE, VLR_REPASSE, COD_CO' +
        'MPROVANTE_ICMS, '
      
        '   COD_REFERENCIA_FORN, COD_FORNECEDOR, DES_FORNECEDOR, TIP_PESS' +
        'OA, DES_EMAIL, '
      
        '   QTD_NR_DIAS, QTD_NR_MESES, QTD_TOT_MESES, COD_COMPRADOR, BLOB' +
        '_TEXTO, '
      
        '   IND_TRANSF, DTA_LIM_TRANSF, QTD_TRANSF, IND_USAR, IND_QTD_ACI' +
        'MA,'
      
        '  QTD_SUGERIDA_ANO, QTD_TRANSF_PERIODO, QTD_TRANSF_ANO, EST_MINI' +
        'MO, '
      
        '  DIAS_ESTOCAGEM, QTD_DEMANDA_DIA, QTD_DEMANDA_ANO, QTD_DIAS_ANO' +
        ','
      '  DATAINCLUSAO, ESTADO, DATAALTERACAO)'
      'values'
      
        '  (:NUM_SEQ, :NUM_DOCUMENTO, :DTA_DOCUMENTO, :IND_OC_GERADA, :DT' +
        'A_OC_GERADA, '
      
        '   :NUM_OC_GERADA, :OBS_OC, :COD_EMPRESA, :DES_EMPRESA, :COD_ITE' +
        'M, :DES_ITEM, '
      
        '   :QTD_SUGERIDA, :QTD_ACOMPRAR, :QTD_SALDO, :QTD_TRANSITO, :QTD' +
        '_DISPONIVEL, '
      
        '   :QTD_MEDIA_MES, :QTD_MEDIA_DIA, :QTD_DEM_MES1, :QTD_DEM_MES2,' +
        ' :QTD_DEM_MES3, '
      
        '   :QTD_DEM_MES4, :QTD_DEM_MES5, :QTD_DEM_MES6, :QTD_DEM_MES7, :' +
        'QTD_DEM_MES8, '
      
        '   :UNI_COMPRA, :UNI_VENDA, :COD_BARRAS, :COD_GRUPO, :DES_GRUPO,' +
        ' :COD_SUBGRUPO, '
      
        '   :DES_SUBGRUPO, :DES_GENERICO, :COD_APLICACAO, :DES_APLICACAO,' +
        ' :COD_REFERENCIA, '
      
        '   :CLA_CURVA_ABC, :COD_FAMILIA_PRECO, :DES_FAMILIA_PRECO, :DTA_' +
        'ULT_COMPRA, '
      
        '   :COD_FOR_ULT_COMPRA, :DES_FOR_ULT_COMPRA, :QTD_ULT_COMPRA, :V' +
        'LR_UNI_ULT_COMPRA, '
      
        '   :VLR_TOT_ULT_COMPRA, :VLR_UNI_COMPRA, :PER_DESCONTO, :DTA_ULT' +
        '_VENDA, '
      
        '   :COD_CLI_ULT_VENDA, :DES_CLI_ULT_VENDA, :QTD_ULT_VENDA, :VLR_' +
        'UNI_ULT_VENDA, '
      
        '   :VLR_TOT_ULT_VENDA, :VLR_UNI_VENDA, :COD_LISTA_VENDA, :DES_LI' +
        'STA_VENDA, '
      
        '   :COD_LISTA_COMPRA, :DES_LISTA_COMPRA, :VLR_CUSTO_MEDIO, :VLR_' +
        'TOT_VENDA, '
      
        '   :VLR_TOT_COMPRA, :VLR_BRUTO, :VLR_DESCONTOS, :VLR_DESPESAS, :' +
        'VLR_FRETE, '
      
        '   :IND_SOMA_IPI_BASE_ICMS, :IND_SOMA_FRETE_BASE_ICMS, :IND_SOMA' +
        '_DESPESA_BASE_ICMS, '
      
        '   :IND_SOMA_IPI_BASE_ST, :IND_SOMA_FRETE_BASE_ST, :IND_SOMA_DES' +
        'PESA_BASE_ST, '
      
        '   :COD_SIT_TRIBUTARIA, :COD_IPI, :IND_IPI, :PER_IPI, :VLR_IPI, ' +
        ':COD_ICMS, :PER_REDUCAO_ICMS, '
      
        '   :VLR_REDUCAO_ICMS, :VLR_BASE_ICMS, :PER_ICMS, :VLR_ICMS, :COD' +
        '_GRUPO_ST, '
      
        '   :DES_GRUPO_ST, :PER_MARGEM_ST, :IND_ST, :VLR_BASE_ST,    :PER' +
        '_ST, :VLR_ST,'
      
        '   :PER_REPASSE, :VLR_REPASSE, :COD_COMPROVANTE_ICMS, :COD_REFER' +
        'ENCIA_FORN, '
      '   :COD_FORNECEDOR, :DES_FORNECEDOR, :TIP_PESSOA, :DES_EMAIL, '
      
        '   :QTD_NR_DIAS, :QTD_NR_MESES, :QTD_TOT_MESES, :COD_COMPRADOR, ' +
        ':BLOB_TEXTO, '
      
        '   :IND_TRANSF, :DTA_LIM_TRANSF, :QTD_TRANSF, :IND_USAR, :IND_QT' +
        'D_ACIMA,'
      
        '   :QTD_SUGERIDA_ANO, :QTD_TRANSF_PERIODO, :QTD_TRANSF_ANO, :EST' +
        '_MINIMO, '
      
        '   :DIAS_ESTOCAGEM, :QTD_DEMANDA_DIA, :QTD_DEMANDA_ANO, :QTD_DIA' +
        'S_ANO,'
      '   :DATAINCLUSAO, :ESTADO, :DATAALTERACAO)'
      ''
      ''
      '')
    DeleteSQL.Strings = (
      'delete from oc_comprar'
      'where'
      '  NUM_SEQ = :NUM_SEQ'
      '  and NUM_DOCUMENTO = :NUM_DOCUMENTO')
    Left = 1178
    Top = 299
  end
  object DSP_OCs: TDataSetProvider
    DataSet = SDS_OCs
    Left = 298
    Top = 615
  end
  object CDS_OCs: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'NUM_DOCUMENTO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'COD_EMP_FIL'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'DES_EMP_FIL'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'COD_FORNECEDOR'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'NUM_OC_GERADA'
        DataType = ftInteger
      end
      item
        Name = 'DTA_OC_GERADA'
        DataType = ftDate
      end
      item
        Name = 'TOTAL_BRUTO'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_DESCONTOS'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_IPI'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_DESPESAS'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_ST'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_FRETE'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_REPASSE'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_OC'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'COD_COMPROVANTE_ICMS'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'TOTAL_ITENS'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'TOTAL_QTD'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end>
    IndexDefs = <>
    ObjectView = False
    Params = <>
    ProviderName = 'DSP_OCs'
    StoreDefs = True
    Left = 335
    Top = 599
    object CDS_OCsNUM_DOCUMENTO: TIntegerField
      FieldName = 'NUM_DOCUMENTO'
      Required = True
    end
    object CDS_OCsCOD_EMP_FIL: TStringField
      Alignment = taCenter
      DisplayLabel = 'Emp / Filial'
      FieldName = 'COD_EMP_FIL'
      Size = 6
    end
    object CDS_OCsDES_EMP_FIL: TStringField
      FieldName = 'DES_EMP_FIL'
      Size = 60
    end
    object CDS_OCsNUM_OC_GERADA: TIntegerField
      DisplayLabel = 'OC Gerada'
      FieldName = 'NUM_OC_GERADA'
    end
    object CDS_OCsDTA_OC_GERADA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'DTA_OC_GERADA'
    end
    object CDS_OCsTOTAL_OC: TFMTBCDField
      DisplayLabel = 'Total OC'
      FieldName = 'TOTAL_OC'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object CDS_OCsTOTAL_BRUTO: TFMTBCDField
      DisplayLabel = 'Total Bruto'
      FieldName = 'TOTAL_BRUTO'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object CDS_OCsTOTAL_DESCONTOS: TFMTBCDField
      DisplayLabel = 'Total Descontos'
      FieldName = 'TOTAL_DESCONTOS'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object CDS_OCsTOTAL_IPI: TFMTBCDField
      DisplayLabel = 'Total IPI'
      FieldName = 'TOTAL_IPI'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object CDS_OCsTOTAL_DESPESAS: TFMTBCDField
      DisplayLabel = 'Total Despesas'
      FieldName = 'TOTAL_DESPESAS'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object CDS_OCsTOTAL_FRETE: TFMTBCDField
      DisplayLabel = 'Total Frete'
      FieldName = 'TOTAL_FRETE'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object CDS_OCsTOTAL_ST: TFMTBCDField
      DisplayLabel = 'Total ST'
      FieldName = 'TOTAL_ST'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object CDS_OCsTOTAL_ICMS: TFMTBCDField
      DisplayLabel = 'Total ICMS'
      FieldName = 'TOTAL_ICMS'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object CDS_OCsTOTAL_REPASSE: TFMTBCDField
      DisplayLabel = 'Total Repasse'
      FieldName = 'TOTAL_REPASSE'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object CDS_OCsCOD_COMPROVANTE_ICMS: TStringField
      Alignment = taCenter
      DisplayLabel = 'Comprov ICMS'
      FieldName = 'COD_COMPROVANTE_ICMS'
      Size = 3
    end
    object CDS_OCsTOTAL_ITENS: TIntegerField
      DisplayLabel = 'Total Itens'
      FieldName = 'TOTAL_ITENS'
      Required = True
    end
    object CDS_OCsTOTAL_QTD: TFMTBCDField
      DisplayLabel = 'Total Qtd'
      FieldName = 'TOTAL_QTD'
      Precision = 15
      Size = 2
    end
    object CDS_OCsCOD_FORNECEDOR: TStringField
      FieldName = 'COD_FORNECEDOR'
      Size = 6
    end
    object CDS_OCsTOTALGERAL: TAggregateField
      Alignment = taRightJustify
      FieldName = 'TOTALGERAL'
      Expression = 'Sum(Total_OC)'
    end
  end
  object DS_OCs: TDataSource
    DataSet = CDS_OCs
    Left = 373
    Top = 616
  end
  object SDS_OCs: TSQLDataSet
    ObjectView = True
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 256
    Top = 602
  end
  object CDS_VerTransito: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_VerTransito'
    Left = 558
    Top = 278
    object CDS_VerTransitoCODFILIAL: TStringField
      FieldName = 'CODFILIAL'
      Size = 2
    end
    object CDS_VerTransitoIND_TIPO: TStringField
      FieldName = 'IND_TIPO'
      Size = 2
    end
    object CDS_VerTransitoCODPRODUTO: TStringField
      Alignment = taRightJustify
      FieldName = 'CODPRODUTO'
      Size = 6
    end
    object CDS_VerTransitoCODFORNECEDOR: TStringField
      Alignment = taRightJustify
      FieldName = 'CODFORNECEDOR'
      Size = 6
    end
    object CDS_VerTransitoNOMEFORNECEDOR: TStringField
      FieldName = 'NOMEFORNECEDOR'
      Size = 40
    end
    object CDS_VerTransitoDTA_REF: TDateField
      FieldName = 'DTA_REF'
    end
    object CDS_VerTransitoQUANT_REF: TFMTBCDField
      FieldName = 'QUANT_REF'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_VerTransitoPRECO: TFMTBCDField
      FieldName = 'PRECO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_VerTransitoNUM_REF: TIntegerField
      FieldName = 'NUM_REF'
    end
    object CDS_VerTransitoCOD_SITUACAO: TStringField
      Alignment = taRightJustify
      FieldName = 'COD_SITUACAO'
      Size = 2
    end
    object CDS_VerTransitoDES_SITUACAO: TStringField
      FieldName = 'DES_SITUACAO'
      Size = 35
    end
    object CDS_VerTransitoVALBRUTO: TFMTBCDField
      FieldName = 'VALBRUTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_VerTransitoVALDESCONTO: TFMTBCDField
      FieldName = 'VALDESCONTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_VerTransitoVLR_TOTAL_REF: TFMTBCDField
      FieldName = 'VLR_TOTAL_REF'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_VerTransitoVALSUBSTITUICAO: TFMTBCDField
      FieldName = 'VALSUBSTITUICAO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_VerTransitoDTA_ATUALIZACAO: TSQLTimeStampField
      FieldName = 'DTA_ATUALIZACAO'
    end
  end
  object DSP_VerTransito: TDataSetProvider
    DataSet = SDS_VerTransito
    Left = 525
    Top = 294
  end
  object DS_VerTransito: TDataSource
    DataSet = CDS_VerTransito
    Left = 595
    Top = 294
  end
  object SDS_VerTransito: TSQLDataSet
    CommandText = 
      'select *'#13#10'from movtos_empresas m'#13#10'where m.ind_tipo='#39'TR'#39#13#10'and m.c' +
      'odfilial= :CodEmp'#13#10'and m.codproduto= :CodProduto'#13#10#13#10'Order by m.n' +
      'um_ref'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CodEmp'
        ParamType = ptInput
        Value = '06'
      end
      item
        DataType = ftString
        Name = 'CodProduto'
        ParamType = ptInput
        Value = '004977'
      end>
    SQLConnection = SQLC
    Left = 488
    Top = 278
  end
  object SDS_BuscaRapida: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 35
    Top = 372
  end
  object CDS_BuscaRapida: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_BuscaRapida'
    Left = 116
    Top = 377
  end
  object DSP_BuscaRapida: TDataSetProvider
    DataSet = SDS_BuscaRapida
    Left = 76
    Top = 389
  end
  object DS_BuscaRapida: TDataSource
    DataSet = CDS_BuscaRapida
    Left = 152
    Top = 389
  end
  object CDS_Comprovantes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Comprovantes'
    Left = 558
    Top = 349
    object CDS_ComprovantesCOD_COMPROV: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Comp'
      FieldName = 'COD_COMPROV'
      Required = True
      Size = 4
    end
    object CDS_ComprovantesDES_COMPROV: TStringField
      DisplayLabel = 'Comprovante'
      FieldName = 'DES_COMPROV'
    end
    object CDS_ComprovantesCOD_GR_FINAN: TIntegerField
      DisplayLabel = 'Cod Gr Finan'
      FieldName = 'COD_GR_FINAN'
    end
    object CDS_ComprovantesDES_GR_FINAN: TStringField
      DisplayLabel = 'Grupo Financeiro'
      FieldName = 'DES_GR_FINAN'
    end
    object CDS_ComprovantesIND_PLANILHA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Planilha ?'
      FieldName = 'IND_PLANILHA'
      Size = 3
    end
    object CDS_ComprovantesIND_SOMA_GRUPO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Soma Grupo Financeiro ?'
      FieldName = 'IND_SOMA_GRUPO'
      Size = 3
    end
    object CDS_ComprovantesDES_FORMULA: TStringField
      DisplayLabel = 'F'#243'rmula de Calculo'
      FieldName = 'DES_FORMULA'
      Size = 200
    end
    object CDS_ComprovantesNUM_DECIMAIS: TIntegerField
      DisplayLabel = 'N'#186' Decimais'
      FieldName = 'NUM_DECIMAIS'
    end
    object CDS_ComprovantesSOMAR_EM: TStringField
      DisplayLabel = 'Somar no(s) Comprovante(s)'
      FieldName = 'SOMAR_EM'
      Size = 200
    end
    object CDS_ComprovantesSUBTRAIR_DE: TStringField
      DisplayLabel = 'Subtrair do(s) Comprovante(s)'
      FieldName = 'SUBTRAIR_DE'
      Size = 200
    end
    object CDS_ComprovantesIND_ATIVO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Ativo ?'
      FieldName = 'IND_ATIVO'
      Size = 3
    end
  end
  object DSP_Comprovantes: TDataSetProvider
    DataSet = SDS_Comprovantes
    Left = 525
    Top = 365
  end
  object DS_Comprovantes: TDataSource
    DataSet = CDS_Comprovantes
    Left = 595
    Top = 365
  end
  object SDS_Comprovantes: TSQLDataSet
    CommandText = 
      'select fc.cod_comprov, fc.des_comprov,'#13#10'fc.cod_gr_finan, fg.des_' +
      'gr_finan,'#13#10'fc.ind_planilha, fc.des_formula, fc.num_decimais,'#13#10'fc' +
      '.ind_soma_grupo, fc.somar_em, fc.subtrair_de, '#13#10'fc.ind_ativo'#13#10#13#10 +
      'from fin_comprovantes fc, fin_gr_financeiro fg'#13#10#13#10'Where fc.cod_g' +
      'r_finan=fg.cod_gr_finan'#13#10#13#10'order by fc.des_comprov'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 488
    Top = 349
  end
  object CDS_Comprovante: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Comprovante'
    Left = 558
    Top = 414
    object CDS_ComprovanteCOD_COMPROV: TStringField
      FieldName = 'COD_COMPROV'
      Required = True
      Size = 4
    end
    object CDS_ComprovanteDES_COMPROV: TStringField
      FieldName = 'DES_COMPROV'
    end
    object CDS_ComprovanteCOD_GR_FINAN: TIntegerField
      FieldName = 'COD_GR_FINAN'
    end
    object CDS_ComprovanteIND_PLANILHA: TStringField
      FieldName = 'IND_PLANILHA'
      Size = 3
    end
    object CDS_ComprovanteIND_SOMA_GRUPO: TStringField
      FieldName = 'IND_SOMA_GRUPO'
      Size = 3
    end
    object CDS_ComprovanteDES_FORMULA: TStringField
      FieldName = 'DES_FORMULA'
      Size = 200
    end
    object CDS_ComprovanteNUM_DECIMAIS: TIntegerField
      FieldName = 'NUM_DECIMAIS'
    end
    object CDS_ComprovanteSOMAR_EM: TStringField
      FieldName = 'SOMAR_EM'
      Size = 200
    end
    object CDS_ComprovanteSUBTRAIR_DE: TStringField
      FieldName = 'SUBTRAIR_DE'
      Size = 200
    end
    object CDS_ComprovanteIND_ATIVO: TStringField
      FieldName = 'IND_ATIVO'
      Size = 3
    end
    object CDS_ComprovanteUSU_INCLUI: TIntegerField
      FieldName = 'USU_INCLUI'
    end
    object CDS_ComprovanteDTA_INCLUI: TSQLTimeStampField
      FieldName = 'DTA_INCLUI'
      Required = True
    end
    object CDS_ComprovanteUSU_ALTERA: TIntegerField
      FieldName = 'USU_ALTERA'
    end
    object CDS_ComprovanteDTA_ALTERA: TSQLTimeStampField
      FieldName = 'DTA_ALTERA'
    end
  end
  object DSP_Comprovante: TDataSetProvider
    DataSet = SDS_Comprovante
    Left = 525
    Top = 429
  end
  object DS_Comprovante: TDataSource
    DataSet = CDS_Comprovante
    Left = 595
    Top = 430
  end
  object SDS_Comprovante: TSQLDataSet
    CommandText = 'select *'#13#10'from fin_comprovantes'#13#10'Where cod_gr_finan<0'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 488
    Top = 414
  end
  object CDS_Gr_Financeiro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Gr_Financeiro'
    AfterScroll = CDS_Gr_FinanceiroAfterScroll
    Left = 558
    Top = 478
    object CDS_Gr_FinanceiroCOD_GR_FINAN: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_GR_FINAN'
      Required = True
    end
    object CDS_Gr_FinanceiroDES_GR_FINAN: TStringField
      DisplayLabel = 'Grupo Financeiro'
      FieldName = 'DES_GR_FINAN'
    end
    object CDS_Gr_FinanceiroDES_PESQUISA: TStringField
      DisplayLabel = 'Abrev Pesquisa'
      FieldName = 'DES_PESQUISA'
      Size = 10
    end
    object CDS_Gr_FinanceiroNUM_ORDEM: TIntegerField
      DisplayLabel = 'Ordem'
      FieldName = 'NUM_ORDEM'
    end
    object CDS_Gr_FinanceiroIND_ATIVO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Ativo ?'
      FieldName = 'IND_ATIVO'
      Size = 3
    end
    object CDS_Gr_FinanceiroUSU_INCLUI: TIntegerField
      FieldName = 'USU_INCLUI'
    end
    object CDS_Gr_FinanceiroDTA_INCLUI: TSQLTimeStampField
      FieldName = 'DTA_INCLUI'
      Required = True
    end
    object CDS_Gr_FinanceiroUSU_ALTERA: TIntegerField
      FieldName = 'USU_ALTERA'
    end
    object CDS_Gr_FinanceiroDTA_ALTERA: TSQLTimeStampField
      FieldName = 'DTA_ALTERA'
    end
  end
  object DSP_Gr_Financeiro: TDataSetProvider
    DataSet = SDS_Gr_Financeiro
    Left = 525
    Top = 494
  end
  object DS_Gr_Financeiro: TDataSource
    DataSet = CDS_Gr_Financeiro
    Left = 595
    Top = 494
  end
  object SDS_Gr_Financeiro: TSQLDataSet
    CommandText = 'select *'#13#10'from fin_gr_financeiro'#13#10'order by DES_GR_FINAN'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 488
    Top = 478
  end
  object CDS_DemonsResultado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_DemonsResultado'
    Left = 558
    Top = 550
    object CDS_DemonsResultadoCOD_VISAO: TIntegerField
      DisplayLabel = 'Cod_Visao'
      FieldName = 'COD_VISAO'
      Required = True
    end
    object CDS_DemonsResultadoCOD_DEMONSTRATIVO: TIntegerField
      DisplayLabel = 'Cod'
      FieldName = 'COD_DEMONSTRATIVO'
      Required = True
    end
    object CDS_DemonsResultadoDES_DEMONSTRATIVO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_DEMONSTRATIVO'
      Size = 60
    end
    object CDS_DemonsResultadoDES_FORMULA: TStringField
      DisplayLabel = 'Formula'
      FieldName = 'DES_FORMULA'
      Size = 200
    end
    object CDS_DemonsResultadoNUM_DECIMAIS: TIntegerField
      DisplayLabel = 'Decimais'
      FieldName = 'NUM_DECIMAIS'
    end
    object CDS_DemonsResultadoNUM_ORDEM: TIntegerField
      DisplayLabel = 'Ordem'
      FieldName = 'NUM_ORDEM'
    end
    object CDS_DemonsResultadoUSU_INCLUI: TIntegerField
      FieldName = 'USU_INCLUI'
    end
    object CDS_DemonsResultadoDTA_INCLUI: TSQLTimeStampField
      FieldName = 'DTA_INCLUI'
      Required = True
    end
    object CDS_DemonsResultadoUSU_ALTERA: TIntegerField
      FieldName = 'USU_ALTERA'
    end
    object CDS_DemonsResultadoDTA_ALTERA: TSQLTimeStampField
      FieldName = 'DTA_ALTERA'
    end
  end
  object DSP_DemonsResultado: TDataSetProvider
    DataSet = SDS_DemonsResultado
    Left = 525
    Top = 566
  end
  object DS_DemonsResultado: TDataSource
    DataSet = CDS_DemonsResultado
    Left = 595
    Top = 566
  end
  object SDS_DemonsResultado: TSQLDataSet
    CommandText = 
      'select *'#13#10'from FIN_DEMONS_RESULTADO'#13#10'order by DES_DEMONSTRATIVO'#13 +
      #10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 488
    Top = 550
  end
  object SDS_Demandas: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 256
    Top = 200
  end
  object DSP_Demandas: TDataSetProvider
    DataSet = SDS_Demandas
    Left = 298
    Top = 216
  end
  object CDS_Demandas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Demandas'
    Left = 335
    Top = 197
  end
  object CDS_VisualObjetos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_VisualObjetos'
    Left = 550
    Top = 211
    object CDS_VisualObjetosCOD_USUARIO: TIntegerField
      DisplayLabel = 'Cod'
      FieldName = 'COD_USUARIO'
    end
    object CDS_VisualObjetosDES_USUARIO: TStringField
      DisplayLabel = 'Nome Usu'#225'rio'
      FieldName = 'DES_USUARIO'
      Size = 50
    end
  end
  object DSP_VisualObjetos: TDataSetProvider
    DataSet = SDS_VisualObjetos
    Left = 517
    Top = 227
  end
  object DS_VisualObjetos: TDataSource
    DataSet = CDS_VisualObjetos
    Left = 587
    Top = 227
  end
  object SDS_VisualObjetos: TSQLDataSet
    CommandText = 
      'select vo.cod_usuario, us.des_usuario'#13#10'from ps_visual_objetos vo' +
      ', ps_usuarios us'#13#10'where vo.cod_usuario=us.cod_usuario'#13#10'and vo.de' +
      's_tabela= :Tabela'#13#10'and vo.cod_tabela= :CodTabela'#13#10'Order by us.de' +
      's_usuario'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'Tabela'
        ParamType = ptInput
        Value = 'FIN_GR_FINANCEIRO'
      end
      item
        DataType = ftString
        Name = 'CodTabela'
        ParamType = ptInput
        Value = '1'
      end>
    SQLConnection = SQLC
    Left = 480
    Top = 211
  end
  object CDS_Objetivos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Objetivos'
    AfterScroll = CDS_ObjetivosAfterScroll
    Left = 774
    Top = 87
    object CDS_ObjetivosPROC: TStringField
      DisplayLabel = 'Proc?'
      FieldName = 'PROC'
      Required = True
      FixedChar = True
      Size = 3
    end
    object CDS_ObjetivosCOD_OBJETIVO: TIntegerField
      DisplayLabel = 'Cod'
      FieldName = 'COD_OBJETIVO'
      Required = True
    end
    object CDS_ObjetivosDES_OBJETIVO: TStringField
      DisplayLabel = 'Descri'#231#227'o Objetivo'
      FieldName = 'DES_OBJETIVO'
      Size = 60
    end
    object CDS_ObjetivosIND_OPERACAO: TIntegerField
      FieldName = 'IND_OPERACAO'
    end
    object CDS_ObjetivosIND_FIXO: TStringField
      FieldName = 'IND_FIXO'
      Size = 3
    end
    object CDS_ObjetivosIND_NAOCOMPRA: TStringField
      FieldName = 'IND_NAOCOMPRA'
      Size = 3
    end
    object CDS_ObjetivosDES_FORMULA: TStringField
      DisplayLabel = 'F'#243'rmula'
      FieldName = 'DES_FORMULA'
      Size = 200
    end
    object CDS_ObjetivosNUM_DECIMAIS: TIntegerField
      FieldName = 'NUM_DECIMAIS'
    end
    object CDS_ObjetivosNUM_ORDEM: TIntegerField
      DisplayLabel = 'Odem'
      FieldName = 'NUM_ORDEM'
    end
    object CDS_ObjetivosIND_ATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'IND_ATIVO'
      Size = 3
    end
    object CDS_ObjetivosULT_12_MESES: TStringField
      DisplayLabel = 'Ult 121 Meses'
      FieldName = 'ULT_12_MESES'
      Size = 3
    end
    object CDS_ObjetivosUSU_INCLUI: TIntegerField
      FieldName = 'USU_INCLUI'
    end
    object CDS_ObjetivosDTA_INCLUI: TSQLTimeStampField
      FieldName = 'DTA_INCLUI'
      Required = True
    end
    object CDS_ObjetivosUSU_ALTERA: TIntegerField
      FieldName = 'USU_ALTERA'
    end
    object CDS_ObjetivosDTA_ALTERA: TSQLTimeStampField
      FieldName = 'DTA_ALTERA'
    end
  end
  object DSP_Objetivos: TDataSetProvider
    DataSet = SDS_Objetivos
    Left = 739
    Top = 103
  end
  object DS_Objetivos: TDataSource
    DataSet = CDS_Objetivos
    Left = 814
    Top = 103
  end
  object SDS_Objetivos: TSQLDataSet
    CommandText = 
      'select '#39'NAO'#39' Proc, o.*'#13#10'from FIN_OBJETIVOS o'#13#10'order by o.NUM_ORD' +
      'EM'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 704
    Top = 87
  end
  object DSP_ObjetivosEmpresas: TDataSetProvider
    DataSet = SDS_ObjetivosEmpresas
    Left = 739
    Top = 166
  end
  object CDS_ObjetivosEmpresas: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'COD_FILIAL'
        Attributes = [faRequired]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ENDERECO_IP'
        Attributes = [faRequired]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'PASTA_BASE_DADOS'
        Attributes = [faRequired]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DES_BASE_DADOS'
        Attributes = [faRequired]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'COD_EMP'
        Attributes = [faRequired]
        DataType = ftString
        Size = 6
      end
      item
        Name = 'RAZAO_SOCIAL'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TIP_EMP'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DES_BAIRRO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DES_CIDADE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'COD_UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'COD_CEP'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'NUM_CNPJ'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'INSCR_ESTADUAL'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'DES_ENDERECO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NUM_ENDERECO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'COMPL_ENDERECO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IND_ATIVO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'USU_INCLUI'
        DataType = ftInteger
      end
      item
        Name = 'DTA_INCLUI'
        Attributes = [faRequired]
        DataType = ftTimeStamp
      end
      item
        Name = 'USU_ALTERA'
        DataType = ftInteger
      end
      item
        Name = 'DTA_ALTERA'
        DataType = ftTimeStamp
      end>
    IndexDefs = <>
    ObjectView = False
    Params = <>
    ProviderName = 'DSP_ObjetivosEmpresas'
    StoreDefs = True
    AfterScroll = CDS_ObjetivosEmpresasAfterScroll
    Left = 774
    Top = 146
  end
  object DS_ObjetivosEmpresas: TDataSource
    DataSet = CDS_ObjetivosEmpresas
    Left = 814
    Top = 168
  end
  object SDS_ObjetivosEmpresas: TSQLDataSet
    ObjectView = True
    CommandText = 
      'select *'#13#10'from emp_conexoes e'#13#10'where e.ind_ativo='#39'SIM'#39#13#10'order by' +
      ' e.cod_filial'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 704
    Top = 154
  end
  object CDS_ObjetivosMetas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ObjetivosMetas'
    Left = 774
    Top = 223
    object CDS_ObjetivosMetasCOD_FILIAL: TStringField
      FieldName = 'COD_FILIAL'
      Size = 2
    end
    object CDS_ObjetivosMetasCOD_OBJETIVO: TIntegerField
      FieldName = 'COD_OBJETIVO'
    end
    object CDS_ObjetivosMetasDES_ANO: TIntegerField
      FieldName = 'DES_ANO'
    end
    object CDS_ObjetivosMetasOBJ_MES01: TFMTBCDField
      FieldName = 'OBJ_MES01'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ObjetivosMetasOBJ_MES02: TFMTBCDField
      FieldName = 'OBJ_MES02'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ObjetivosMetasOBJ_MES03: TFMTBCDField
      FieldName = 'OBJ_MES03'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ObjetivosMetasOBJ_MES04: TFMTBCDField
      FieldName = 'OBJ_MES04'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ObjetivosMetasOBJ_MES05: TFMTBCDField
      FieldName = 'OBJ_MES05'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ObjetivosMetasOBJ_MES06: TFMTBCDField
      FieldName = 'OBJ_MES06'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ObjetivosMetasOBJ_MES07: TFMTBCDField
      FieldName = 'OBJ_MES07'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ObjetivosMetasOBJ_MES08: TFMTBCDField
      FieldName = 'OBJ_MES08'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ObjetivosMetasOBJ_MES09: TFMTBCDField
      FieldName = 'OBJ_MES09'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ObjetivosMetasOBJ_MES10: TFMTBCDField
      FieldName = 'OBJ_MES10'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ObjetivosMetasOBJ_MES11: TFMTBCDField
      FieldName = 'OBJ_MES11'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ObjetivosMetasOBJ_MES12: TFMTBCDField
      FieldName = 'OBJ_MES12'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ObjetivosMetasUSU_INCLUI: TIntegerField
      FieldName = 'USU_INCLUI'
    end
    object CDS_ObjetivosMetasDTA_INCLUI: TSQLTimeStampField
      FieldName = 'DTA_INCLUI'
    end
    object CDS_ObjetivosMetasUSU_ALTERA: TIntegerField
      FieldName = 'USU_ALTERA'
    end
    object CDS_ObjetivosMetasDTA_ALTERA: TSQLTimeStampField
      FieldName = 'DTA_ALTERA'
    end
  end
  object DSP_ObjetivosMetas: TDataSetProvider
    DataSet = SDS_ObjetivosMetas
    Left = 739
    Top = 239
  end
  object DS_ObjetivosMetas: TDataSource
    DataSet = CDS_ObjetivosMetas
    Left = 814
    Top = 239
  end
  object SDS_ObjetivosMetas: TSQLDataSet
    CommandText = 'Select *'#13#10'From fin_objetivos_metas e'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 704
    Top = 223
  end
  object CDS_FeriadosAno: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_FeriadosAno'
    Left = 774
    Top = 16
    object CDS_FeriadosAnoDTA_FERIADO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dia'
      FieldName = 'DTA_FERIADO'
      Required = True
    end
    object CDS_FeriadosAnoDES_FERIADO: TStringField
      DisplayLabel = 'Descri'#231#227'o do Feriado'
      FieldName = 'DES_FERIADO'
      Size = 50
    end
    object CDS_FeriadosAnoIND_CALCULADO: TStringField
      FieldName = 'IND_CALCULADO'
      Size = 3
    end
    object CDS_FeriadosAnoIND_ATIVO: TStringField
      FieldName = 'IND_ATIVO'
      Size = 3
    end
  end
  object DSP_FeriadosAno: TDataSetProvider
    DataSet = SDS_FeriadosAno
    Left = 741
    Top = 32
  end
  object DS_FeriadosAno: TDataSource
    DataSet = CDS_FeriadosAno
    Left = 811
    Top = 32
  end
  object SDS_FeriadosAno: TSQLDataSet
    CommandText = 'Select *'#13#10'From FIN_FERIADOS_ANO'#13#10'Order by DTA_FERIADO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 704
    Top = 16
  end
  object SDS_Enderecamento: TSQLDataSet
    CommandText = 
      'select e.cod_zona, z.des_zona,'#13#10'e.cod_corredor, c.des_corredor,'#13 +
      #10'e.cod_prateleira, p.des_prateleira,'#13#10'e.cod_gaveta, g.des_gaveta' +
      ','#13#10'e.tip_curvaabc,'#13#10'e.cod_produto, e.des_produto, e.cod_forneced' +
      'or, e.des_fornecedor'#13#10'from CE_ENDERECAMENTOS e,'#13#10'ce_zona_enderec' +
      'os z, ce_corredores c, ce_prateleiras p, ce_gavetas g'#13#10#13#10'where e' +
      '.cod_zona=z.cod_zona'#13#10'and e.cod_corredor=c.cod_corredor'#13#10'and e.c' +
      'od_prateleira=p.cod_prateleira'#13#10'and e.cod_gaveta=g.cod_gaveta'#13#10'-' +
      '-and e.cod_zona=1'#13#10'order by e.COD_ZONA, e.COD_CORREDOR, e.COD_PR' +
      'ATELEIRA, e.COD_GAVETA'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 704
    Top = 304
  end
  object DSP_Enderecamento: TDataSetProvider
    DataSet = SDS_Enderecamento
    Left = 739
    Top = 318
  end
  object CDS_Enderecamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Enderecamento'
    Left = 774
    Top = 296
    object CDS_EnderecamentoCOD_ZONA: TIntegerField
      FieldName = 'COD_ZONA'
    end
    object CDS_EnderecamentoDES_ZONA: TStringField
      FieldName = 'DES_ZONA'
      Size = 30
    end
    object CDS_EnderecamentoCOD_CORREDOR: TStringField
      FieldName = 'COD_CORREDOR'
      Size = 3
    end
    object CDS_EnderecamentoDES_CORREDOR: TStringField
      FieldName = 'DES_CORREDOR'
      Size = 30
    end
    object CDS_EnderecamentoCOD_PRATELEIRA: TStringField
      FieldName = 'COD_PRATELEIRA'
      Size = 3
    end
    object CDS_EnderecamentoDES_PRATELEIRA: TStringField
      FieldName = 'DES_PRATELEIRA'
      Size = 30
    end
    object CDS_EnderecamentoCOD_GAVETA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Gaveta'
      FieldName = 'COD_GAVETA'
      Size = 4
    end
    object CDS_EnderecamentoDES_GAVETA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Descri'#231#227'o da Gaveta'
      FieldName = 'DES_GAVETA'
      Size = 30
    end
    object CDS_EnderecamentoTIP_CURVAABC: TStringField
      Alignment = taCenter
      DisplayLabel = 'Curva ABC'
      FieldName = 'TIP_CURVAABC'
      Size = 1
    end
    object CDS_EnderecamentoCOD_PRODUTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Produto'
      FieldName = 'COD_PRODUTO'
      Size = 6
    end
    object CDS_EnderecamentoDES_PRODUTO: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'DES_PRODUTO'
      Size = 80
    end
    object CDS_EnderecamentoCOD_FORNECEDOR: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Fornec'
      FieldName = 'COD_FORNECEDOR'
      Size = 6
    end
    object CDS_EnderecamentoDES_FORNECEDOR: TStringField
      DisplayLabel = 'Descri'#231#227'o do Fornecedor'
      FieldName = 'DES_FORNECEDOR'
      Size = 60
    end
  end
  object DS_Enderecamento: TDataSource
    DataSet = CDS_Enderecamento
    Left = 814
    Top = 320
  end
  object SDS_ConectaEmpresa: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 35
    Top = 188
  end
  object CDS_ConectaEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ConectaEmpresa'
    Left = 116
    Top = 193
  end
  object DSP_ConectaEmpresa: TDataSetProvider
    DataSet = SDS_ConectaEmpresa
    Left = 76
    Top = 205
  end
  object CDS_Auditorias: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Auditorias'
    Left = 774
    Top = 379
    object CDS_AuditoriasCOD_LOJA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Loja'
      FieldName = 'COD_LOJA'
      Required = True
      Size = 6
    end
    object CDS_AuditoriasDTA_AUDITORIA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Aidutoria'
      FieldName = 'DTA_AUDITORIA'
      Required = True
    end
    object CDS_AuditoriasQTD_EST_INICIAL: TFMTBCDField
      DisplayLabel = 'Quantidade Estoque Inicial'
      FieldName = 'QTD_EST_INICIAL'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriasVLR_EST_NEG_REAL: TFMTBCDField
      DisplayLabel = 'Valor do Estoque Negativo Realizado'
      FieldName = 'VLR_EST_NEG_REAL'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriasVLR_EST_LOJA: TFMTBCDField
      DisplayLabel = 'Valor do Estoque da Loja'
      FieldName = 'VLR_EST_LOJA'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriasVLR_EST_INICIAL: TFMTBCDField
      DisplayLabel = 'Valor do Estoque Inicial'
      FieldName = 'VLR_EST_INICIAL'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriasQTD_COD_CONTADOS: TIntegerField
      DisplayLabel = 'Quantidade de C'#243'digos Contados'
      FieldName = 'QTD_COD_CONTADOS'
      DisplayFormat = '0.,'
    end
    object CDS_AuditoriasQTD_COD_OK: TIntegerField
      DisplayLabel = 'Quantidade de C'#243'digos OK'
      FieldName = 'QTD_COD_OK'
      DisplayFormat = '0.,'
    end
    object CDS_AuditoriasQTD_COD_ENTRADAS: TIntegerField
      DisplayLabel = 'Quantidade de C'#243'digos de Entradas'
      FieldName = 'QTD_COD_ENTRADAS'
      DisplayFormat = '0.,'
    end
    object CDS_AuditoriasVLR_COD_ENTRADAS: TFMTBCDField
      DisplayLabel = 'Valor dos C'#243'digos de Entradas'
      FieldName = 'VLR_COD_ENTRADAS'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriasPER_COD_ENTRADAS: TFMTBCDField
      DisplayLabel = 'Percentual dos C'#243'digos de Entradas'
      FieldName = 'PER_COD_ENTRADAS'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriasQTD_COD_SAIDAS: TIntegerField
      DisplayLabel = 'Quantidade de C'#243'digos de Sa'#237'da'
      FieldName = 'QTD_COD_SAIDAS'
      DisplayFormat = '0.,'
    end
    object CDS_AuditoriasVLR_COD_SAIDAS: TFMTBCDField
      DisplayLabel = 'Valor dos C'#243'digos de Sa'#237'das'
      FieldName = 'VLR_COD_SAIDAS'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriasPER_COD_SAIDAS: TFMTBCDField
      DisplayLabel = 'Percentual dos C'#243'digos de Sa'#237'das'
      FieldName = 'PER_COD_SAIDAS'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriasQTD_COD_NAO_CONTADOS: TIntegerField
      DisplayLabel = 'Quantidade de C'#243'digos N'#227'o Contados'
      FieldName = 'QTD_COD_NAO_CONTADOS'
      DisplayFormat = '0.,'
    end
    object CDS_AuditoriasVLR_COD_NAO_CONTADOS: TFMTBCDField
      DisplayLabel = 'Valor dos C'#243'digos N'#227'o Contados'
      FieldName = 'VLR_COD_NAO_CONTADOS'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriasPER_COD_NAO_CONTADOS: TFMTBCDField
      DisplayLabel = 'Percentual dos C'#243'digos N'#227'o Contados'
      FieldName = 'PER_COD_NAO_CONTADOS'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriasVLR_EST_FINAL: TFMTBCDField
      DisplayLabel = 'Valor do Estoque Final'
      FieldName = 'VLR_EST_FINAL'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriasPER_ADMISSIVEL: TFMTBCDField
      DisplayLabel = 'Percentual Admiss'#237'vel'
      FieldName = 'PER_ADMISSIVEL'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriasVLR_ADMISS_EQUIVALENTE: TFMTBCDField
      DisplayLabel = 'Valor Admiss'#237'vel Equivalente'
      FieldName = 'VLR_ADMISS_EQUIVALENTE'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriasPER_PERDA_FINAL: TFMTBCDField
      DisplayLabel = 'Percentua da Perda Final'
      FieldName = 'PER_PERDA_FINAL'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriasVLR_PERDA_EQUIVALENTE: TFMTBCDField
      DisplayLabel = 'Valor da Perda Equivalente'
      FieldName = 'VLR_PERDA_EQUIVALENTE'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriasPER_PROD_NAO_CONTADOS: TFMTBCDField
      DisplayLabel = 'Percentual de Produtos N'#227'o Encontrados'
      FieldName = 'PER_PROD_NAO_CONTADOS'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriasPER_PROD_FECHADOS: TFMTBCDField
      DisplayLabel = 'Percentual de Produtos com Quantidades Fechadas'
      FieldName = 'PER_PROD_FECHADOS'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriasPER_PROD_FECHADOS_ENCONT: TFMTBCDField
      DisplayLabel = 'Percentual de Produtos com Quantidades Fechadas Encontrados'
      FieldName = 'PER_PROD_FECHADOS_ENCONT'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriasQTD_PROD_NAO_FECHADOS: TIntegerField
      DisplayLabel = 'Quantidade de Produtos com Quantidades N'#195'O Fechadas'
      FieldName = 'QTD_PROD_NAO_FECHADOS'
      DisplayFormat = '0.,'
    end
    object CDS_AuditoriasPER_PROD_NAO_FECHADOS: TFMTBCDField
      DisplayLabel = 'Percentual de Produtos com Quantidades N'#195'O Fechadas'
      FieldName = 'PER_PROD_NAO_FECHADOS'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriasPER_PROD_NAO_FECHADOS_ENCONT: TFMTBCDField
      DisplayLabel = 'Percentual de Produtos com Quantidades N'#195'O Fechadas Encontrados'
      FieldName = 'PER_PROD_NAO_FECHADOS_ENCONT'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriasQTD_PROD_NAO_RESOLVIDOS: TIntegerField
      DisplayLabel = 'Quantidade de Produtos N'#227'o Resolvidos'
      FieldName = 'QTD_PROD_NAO_RESOLVIDOS'
      DisplayFormat = '0.,'
    end
    object CDS_AuditoriasPER_PROD_NAO_RESOLVIDOS: TFMTBCDField
      DisplayLabel = 'Percentual de Produtos n'#227'o Resolvidos'
      FieldName = 'PER_PROD_NAO_RESOLVIDOS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriasPER_PROD_NAO_RESOLVIDOS_ENCONT: TFMTBCDField
      DisplayLabel = 'Percentual de Produtos n'#227'o Resolvidos Encontrados'
      FieldName = 'PER_PROD_NAO_RESOLVIDOS_ENCONT'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriasPER_OBJ_PER_ADMISSIVEL: TFMTBCDField
      DisplayLabel = 'Percentual do Objetivo Sobre o Percentual Admiss'#237'vel'
      FieldName = 'PER_OBJ_PER_ADMISSIVEL'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriasPER_OBJ_VLR_ADMISSIVEL: TFMTBCDField
      DisplayLabel = 'Percentual do Objetivo Sobre o Valor Admiss'#237'vel'
      FieldName = 'PER_OBJ_VLR_ADMISSIVEL'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriasUSU_INCLUI: TIntegerField
      FieldName = 'USU_INCLUI'
    end
    object CDS_AuditoriasDTA_INCLUI: TSQLTimeStampField
      FieldName = 'DTA_INCLUI'
      Required = True
    end
    object CDS_AuditoriasUSU_ALTERA: TIntegerField
      FieldName = 'USU_ALTERA'
    end
    object CDS_AuditoriasDTA_ALTERA: TSQLTimeStampField
      FieldName = 'DTA_ALTERA'
    end
  end
  object DSP_Auditorias: TDataSetProvider
    DataSet = SDS_Auditorias
    Left = 739
    Top = 394
  end
  object DS_Auditorias: TDataSource
    DataSet = CDS_Auditorias
    Left = 814
    Top = 395
  end
  object SDS_Auditorias: TSQLDataSet
    CommandText = 'Select *'#13#10'From AUDITORIAS'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 704
    Top = 379
  end
  object CDS_AuditoriaDatas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_AuditoriaDatas'
    Left = 774
    Top = 443
    object CDS_AuditoriaDatasDTA_AUDITORIA: TDateField
      FieldName = 'DTA_AUDITORIA'
      Required = True
    end
  end
  object DSP_AuditoriaDatas: TDataSetProvider
    DataSet = SDS_AuditoriaDatas
    Left = 739
    Top = 459
  end
  object DS_AuditoriaDatas: TDataSource
    DataSet = CDS_AuditoriaDatas
    Left = 814
    Top = 459
  end
  object SDS_AuditoriaDatas: TSQLDataSet
    CommandText = 
      'Select au.dta_auditoria'#13#10'From AUDITORIAS au'#13#10'Where  au.Cod_Loja=' +
      #39'01'#39#13#10'Order by au.Dta_Auditoria'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 704
    Top = 443
  end
  object CDS_AuditoriaAnalise: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'COD_LOJA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 6
      end
      item
        Name = 'RAZAO_SOCIAL'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DTA_AUDITORIA'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'PER_ADMISSIVEL'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'VLR_ADMISS_EQUIVALENTE'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'PER_PERDA_FINAL'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'VLR_PERDA_EQUIVALENTE'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'PER_OBJ_PER_ADMISSIVEL'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'PER_OBJ_VLR_ADMISSIVEL'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'CORPER'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DSP_AuditoriaAnalise'
    StoreDefs = True
    Left = 774
    Top = 515
    object CDS_AuditoriaAnaliseCOD_LOJA: TStringField
      Alignment = taCenter
      DisplayLabel = 'C'#243'd Loja'
      FieldName = 'COD_LOJA'
      Required = True
      Size = 6
    end
    object CDS_AuditoriaAnaliseRAZAO_SOCIAL: TStringField
      DisplayLabel = 'Descri'#231#227'o da Loja'
      FieldName = 'RAZAO_SOCIAL'
      Size = 60
    end
    object CDS_AuditoriaAnaliseDTA_AUDITORIA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Auditoria'
      FieldName = 'DTA_AUDITORIA'
      Required = True
    end
    object CDS_AuditoriaAnalisePER_ADMISSIVEL: TFMTBCDField
      DisplayLabel = '% Admiss'
      FieldName = 'PER_ADMISSIVEL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriaAnalisePER_PERDA_FINAL: TFMTBCDField
      DisplayLabel = '% Final'
      FieldName = 'PER_PERDA_FINAL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriaAnaliseVLR_ADMISS_EQUIVALENTE: TFMTBCDField
      DisplayLabel = 'Vlr Admiss Equiv'
      FieldName = 'VLR_ADMISS_EQUIVALENTE'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriaAnaliseVLR_PERDA_EQUIVALENTE: TFMTBCDField
      DisplayLabel = 'Vlr Final Equiv'
      FieldName = 'VLR_PERDA_EQUIVALENTE'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriaAnalisePER_OBJ_PER_ADMISSIVEL: TFMTBCDField
      DisplayLabel = '%  Obj Perc Final Admiss'
      FieldName = 'PER_OBJ_PER_ADMISSIVEL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriaAnalisePER_OBJ_VLR_ADMISSIVEL: TFMTBCDField
      DisplayLabel = '%  Obj Vlr Final Admiss'
      FieldName = 'PER_OBJ_VLR_ADMISSIVEL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_AuditoriaAnaliseCORPER: TStringField
      FieldName = 'CORPER'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object DSP_AuditoriaAnalise: TDataSetProvider
    DataSet = SDS_AuditoriaAnalise
    Left = 739
    Top = 531
  end
  object DS_AuditoriaAnalise: TDataSource
    DataSet = CDS_AuditoriaAnalise
    Left = 814
    Top = 531
  end
  object SDS_AuditoriaAnalise: TSQLDataSet
    CommandText = 
      'select au.cod_loja, em.razao_social, au.dta_auditoria,'#13#10'au.per_a' +
      'dmissivel, au.vlr_admiss_equivalente,'#13#10'au.per_perda_final, au.vl' +
      'r_perda_equivalente,'#13#10'au.per_obj_per_admissivel,'#13#10'au.per_obj_vlr' +
      '_admissivel,'#13#10'Case'#13#10'  When (au.per_perda_final<-0.80) or (au.per' +
      '_perda_final>0.80) Then'#13#10'  '#39'V'#39#13#10'  Else'#13#10'  '#39'A'#39#13#10'end CorPer'#13#10#13#10'fro' +
      'm auditorias au, emp_conexoes em'#13#10#13#10'where au.cod_loja=em.cod_fil' +
      'ial'#13#10'and au.cod_loja='#39'01'#39#13#10'and au.dta_auditoria= '#39'14.02.2012'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 704
    Top = 515
  end
  object SDS_Join: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 32
    Top = 128
  end
  object DSP_Join: TDataSetProvider
    DataSet = SDS_Join
    Left = 74
    Top = 144
  end
  object CDS_Join: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Join'
    Left = 111
    Top = 128
  end
  object DS_Join: TDataSource
    DataSet = CDS_Join
    Left = 149
    Top = 144
  end
  object SDS_FechaCaixa: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 912
    Top = 204
  end
  object DS_FechaCaixa: TDataSource
    DataSet = CDS_FechaCaixa
    Left = 1039
    Top = 220
  end
  object DSP_FechaCaixa: TDataSetProvider
    DataSet = SDS_FechaCaixa
    Left = 953
    Top = 220
  end
  object CDS_FechaCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_FechaCaixa'
    Left = 993
    Top = 208
    object CDS_FechaCaixaCOD_CREDITO: TIntegerField
      DisplayLabel = 'Cod'
      FieldName = 'COD_CREDITO'
    end
    object CDS_FechaCaixaDES_CREDITO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_CREDITO'
      Size = 40
    end
    object CDS_FechaCaixaNUM_DOCTO: TStringField
      DisplayLabel = 'N'#186' Docto'
      FieldName = 'NUM_DOCTO'
      Size = 6
    end
    object CDS_FechaCaixaVLR_CREDITO: TFMTBCDField
      DisplayLabel = 'Vlr Cr'#233'dito'
      FieldName = 'VLR_CREDITO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_FechaCaixaVLR_INFORMADO: TFMTBCDField
      DisplayLabel = 'Vlr Informado'
      FieldName = 'VLR_INFORMADO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_FechaCaixaVLR_DIFERENCA: TFMTBCDField
      DisplayLabel = 'Vlr Diferen'#231'a'
      FieldName = 'VLR_DIFERENCA'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_FechaCaixaOBS: TStringField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      Size = 42
    end
    object CDS_FechaCaixaIND_INFORMADO: TStringField
      DisplayLabel = 'Informado ?'
      FieldName = 'IND_INFORMADO'
      Size = 3
    end
    object CDS_FechaCaixaUSU_INCLUI: TIntegerField
      FieldName = 'USU_INCLUI'
      Visible = False
    end
  end
  object SDS_FechaCaixaTotais: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 912
    Top = 268
  end
  object DS_FechaCaixaTotais: TDataSource
    DataSet = CDS_FechaCaixaTotais
    Left = 1039
    Top = 284
  end
  object DSP_FechaCaixaTotais: TDataSetProvider
    DataSet = SDS_FechaCaixaTotais
    Left = 953
    Top = 284
  end
  object CDS_FechaCaixaTotais: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_FechaCaixaTotais'
    Left = 993
    Top = 272
    object CDS_FechaCaixaTotaisCOD_CREDITO: TIntegerField
      DisplayLabel = 'Cod'
      FieldName = 'COD_CREDITO'
    end
    object CDS_FechaCaixaTotaisDES_CREDITO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_CREDITO'
      Size = 40
    end
    object CDS_FechaCaixaTotaisNUM_DOCTO: TStringField
      DisplayLabel = 'N'#186' Docto'
      FieldName = 'NUM_DOCTO'
      Size = 6
    end
    object CDS_FechaCaixaTotaisVLR_CREDITO: TFMTBCDField
      DisplayLabel = 'Vlr Cr'#233'dito'
      FieldName = 'VLR_CREDITO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_FechaCaixaTotaisVLR_INFORMADO: TFMTBCDField
      DisplayLabel = 'Vlr Informado'
      FieldName = 'VLR_INFORMADO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_FechaCaixaTotaisVLR_DIFERENCA: TFMTBCDField
      DisplayLabel = 'Vlr Diferen'#231'a'
      FieldName = 'VLR_DIFERENCA'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_FechaCaixaTotaisIND_INFORMADO: TStringField
      DisplayLabel = 'Informado ?'
      FieldName = 'IND_INFORMADO'
      Size = 3
    end
    object CDS_FechaCaixaTotaisUSU_INCLUI: TIntegerField
      FieldName = 'USU_INCLUI'
      Visible = False
    end
    object CDS_FechaCaixaTotaisOBS: TStringField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      Size = 32
    end
  end
  object SDS_FechaDiarioMov: TSQLDataSet
    CommandText = 
      'select d.num_seq, d.tip_docto,'#13#10'Case'#13#10'  When d.tip_docto=1  Then' +
      ' '#39'Pagamento'#39#13#10'  When d.tip_docto=2  Then '#39'Dep'#243'sito'#39#13#10'  When d.ti' +
      'p_docto=3  Then '#39'Valor Recebido'#39#13#10'  When d.tip_docto=90 Then '#39'To' +
      'tal Realizado'#39#13#10'  When d.tip_docto=95 Then '#39'Valor Plano de Conta' +
      's'#39#13#10'  When d.tip_docto=99 Then '#39'Fechamento Di'#225'rio'#39#13#10'End Des_Tipo' +
      ','#13#10'd.num_docto, d.des_docto, d.num_nota, d.dta_vencimento, d.vlr' +
      '_docto,'#13#10'd.ind_realizado, d.vlr_realizado, d.vlr_diferenca'#13#10#13#10'fr' +
      'om fin_fechamento_diario d'#13#10'where d.tip_docto<90'#13#10'and d.cod_loja' +
      '= :CodLoja'#13#10'and d.dta_dia= :Dia'#13#10'Order by d.tip_docto'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CodLoja'
        ParamType = ptInput
        Value = '01'
      end
      item
        DataType = ftString
        Name = 'Dia'
        ParamType = ptInput
        Value = '16.05.2013'
      end>
    SQLConnection = SQLC
    Left = 896
    Top = 412
  end
  object DSP_FechaDiarioMov: TDataSetProvider
    DataSet = SDS_FechaDiarioMov
    Left = 937
    Top = 428
  end
  object CDS_FechaDiarioMov: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_FechaDiarioMov'
    Left = 977
    Top = 416
    object CDS_FechaDiarioMovNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
      Required = True
    end
    object CDS_FechaDiarioMovTIP_DOCTO: TIntegerField
      FieldName = 'TIP_DOCTO'
    end
    object CDS_FechaDiarioMovDES_TIPO: TStringField
      DisplayLabel = 'Tipo do Movto'
      FieldName = 'DES_TIPO'
      FixedChar = True
      Size = 21
    end
    object CDS_FechaDiarioMovNUM_DOCTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#186' Docto'
      FieldName = 'NUM_DOCTO'
      Size = 6
    end
    object CDS_FechaDiarioMovDES_DOCTO: TStringField
      DisplayLabel = 'Descri'#231#227'o do Docto'
      FieldName = 'DES_DOCTO'
      Size = 40
    end
    object CDS_FechaDiarioMovNUM_NOTA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#186' Nota'
      FieldName = 'NUM_NOTA'
      Size = 6
    end
    object CDS_FechaDiarioMovDTA_VENCIMENTO: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'DTA_VENCIMENTO'
    end
    object CDS_FechaDiarioMovVLR_DOCTO: TFMTBCDField
      DisplayLabel = 'Vlr Docto'
      FieldName = 'VLR_DOCTO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_FechaDiarioMovIND_REALIZADO: TStringField
      DisplayLabel = 'Realizado ?'
      FieldName = 'IND_REALIZADO'
      Size = 3
    end
    object CDS_FechaDiarioMovVLR_REALIZADO: TFMTBCDField
      DisplayLabel = 'Vlr Realizado'
      FieldName = 'VLR_REALIZADO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_FechaDiarioMovVLR_DIFERENCA: TFMTBCDField
      DisplayLabel = 'Vlr Diferen'#231'a'
      FieldName = 'VLR_DIFERENCA'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
  end
  object DS_FechaDiarioMov: TDataSource
    DataSet = CDS_FechaDiarioMov
    Left = 1023
    Top = 428
  end
  object SDS_FechaDiarioTot: TSQLDataSet
    CommandText = 
      'select d.num_seq, d.tip_docto,'#13#10'd.num_docto, d.des_docto, d.vlr_' +
      'docto'#13#10#13#10'from fin_fechamento_diario d'#13#10'where d.tip_docto>=90'#13#10'an' +
      'd d.cod_loja= :CodLoja'#13#10'and d.dta_dia= :Dia'#13#10'Order by d.tip_doct' +
      'o'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CodLoja'
        ParamType = ptInput
        Value = '01'
      end
      item
        DataType = ftString
        Name = 'Dia'
        ParamType = ptInput
        Value = '16.05.2013'
      end>
    SQLConnection = SQLC
    Left = 896
    Top = 476
  end
  object DSP_FechaDiarioTot: TDataSetProvider
    DataSet = SDS_FechaDiarioTot
    Left = 937
    Top = 492
  end
  object CDS_FechaDiarioTot: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_FechaDiarioTot'
    Left = 977
    Top = 480
    object CDS_FechaDiarioTotNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
      Required = True
    end
    object CDS_FechaDiarioTotTIP_DOCTO: TIntegerField
      FieldName = 'TIP_DOCTO'
    end
    object CDS_FechaDiarioTotNUM_DOCTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#186' Docto'
      FieldName = 'NUM_DOCTO'
      Size = 6
    end
    object CDS_FechaDiarioTotDES_DOCTO: TStringField
      DisplayLabel = 'Descri'#231#227'o do Docto'
      FieldName = 'DES_DOCTO'
      Size = 40
    end
    object CDS_FechaDiarioTotVLR_DOCTO: TFMTBCDField
      DisplayLabel = 'Vlr Docto'
      FieldName = 'VLR_DOCTO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
  end
  object DS_FechaDiarioTot: TDataSource
    DataSet = CDS_FechaDiarioTot
    Left = 1023
    Top = 492
  end
  object DS_Geral: TDataSource
    Left = 136
    Top = 8
  end
  object SDS_Seguranca: TSQLDataSet
    CommandText = 
      'SELECT s.* '#13#10'FROM SEGURANCA s'#13#10'WHERE s.USUARIO = :USUARIO'#13#10'ORDER' +
      ' BY s.TAG'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'USUARIO'
        ParamType = ptInput
      end>
    SQLConnection = SQLC
    Left = 912
    Top = 144
  end
  object DSP_Seguranca: TDataSetProvider
    DataSet = SDS_Seguranca
    Left = 952
    Top = 160
  end
  object CDS_Seguranca: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'USUARIO'
        ParamType = ptUnknown
      end>
    ProviderName = 'DSP_Seguranca'
    Left = 992
    Top = 152
    object CDS_SegurancaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Required = True
      Size = 30
    end
    object CDS_SegurancaTAG: TIntegerField
      FieldName = 'TAG'
      Required = True
    end
    object CDS_SegurancaACESSO: TIntegerField
      FieldName = 'ACESSO'
    end
    object CDS_SegurancaINCLUSAO: TIntegerField
      FieldName = 'INCLUSAO'
    end
    object CDS_SegurancaALTERACAO: TIntegerField
      FieldName = 'ALTERACAO'
    end
    object CDS_SegurancaEXCLUSAO: TIntegerField
      FieldName = 'EXCLUSAO'
    end
    object CDS_SegurancaRELATORIO: TIntegerField
      FieldName = 'RELATORIO'
    end
  end
  object DS_Seguranca: TDataSource
    DataSet = CDS_Seguranca
    Left = 1040
    Top = 160
  end
  object SQLSP: TSQLStoredProc
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 192
    Top = 16
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 80
    Top = 8
  end
  object IBQ_Contar: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 368
    Top = 16
  end
  object SDS_ParametrosSis: TSQLDataSet
    CommandText = 'Select *'#13#10'from PARAMETROS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 909
    Top = 21
  end
  object CDS_ParametrosSis: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ParametrosSIS'
    Left = 998
    Top = 26
    object CDS_ParametrosSisNUM_DIAS_CONCILIA: TIntegerField
      FieldName = 'NUM_DIAS_CONCILIA'
    end
    object CDS_ParametrosSisIND_CONSISTE_NFE: TStringField
      FieldName = 'IND_CONSISTE_NFE'
      FixedChar = True
      Size = 3
    end
    object CDS_ParametrosSisHR_IN_CONS_NFE_OC: TStringField
      FieldName = 'HR_IN_CONS_NFE_OC'
      Size = 2
    end
    object CDS_ParametrosSisDIA_INI_COMISSAO_PROF: TStringField
      FieldName = 'DIA_INI_COMISSAO_PROF'
      Size = 7
    end
    object CDS_ParametrosSisDIA_FIM_COMISSAO_PROF: TStringField
      FieldName = 'DIA_FIM_COMISSAO_PROF'
      Size = 7
    end
    object CDS_ParametrosSisCOMPUTER_MASTER: TStringField
      FieldName = 'COMPUTER_MASTER'
    end
    object CDS_ParametrosSisCOMPUTER_SERVER: TStringField
      FieldName = 'COMPUTER_SERVER'
    end
    object CDS_ParametrosSisIP_SERVER: TStringField
      FieldName = 'IP_SERVER'
      Size = 50
    end
    object CDS_ParametrosSisIP_INTERNET_SERVER: TStringField
      FieldName = 'IP_INTERNET_SERVER'
      Size = 50
    end
    object CDS_ParametrosSisFTP_USER: TStringField
      FieldName = 'FTP_USER'
    end
    object CDS_ParametrosSisFTP_PASSWORD: TStringField
      FieldName = 'FTP_PASSWORD'
    end
    object CDS_ParametrosSisMES_COBRANCA_SINDICATO: TStringField
      FieldName = 'MES_COBRANCA_SINDICATO'
      Size = 15
    end
    object CDS_ParametrosSisPOS_COBRANCA_SINDICATO: TStringField
      FieldName = 'POS_COBRANCA_SINDICATO'
      Size = 15
    end
    object CDS_ParametrosSisDIA_COBRANCA_SINDICATO: TStringField
      FieldName = 'DIA_COBRANCA_SINDICATO'
      Size = 15
    end
    object CDS_ParametrosSisVLR_TAXASINDICATO: TFMTBCDField
      FieldName = 'VLR_TAXASINDICATO'
      Precision = 15
      Size = 2
    end
    object CDS_ParametrosSisFTP_USAR: TStringField
      FieldName = 'FTP_USAR'
      Size = 3
    end
  end
  object DSP_ParametrosSis: TDataSetProvider
    DataSet = SDS_ParametrosSis
    Left = 950
    Top = 38
  end
  object DS_ParametrosSis: TDataSource
    DataSet = CDS_ParametrosSis
    Left = 1048
    Top = 38
  end
  object SDS_Consistencias: TSQLDataSet
    CommandText = 
      'SELECT *'#13#10'FROM consistencias_liberar c'#13#10'WHERE c.codigo= :Codigo'#13 +
      #10'ORDER BY 3,4'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'Codigo'
        ParamType = ptInput
        Value = '1'
      end>
    SQLConnection = SQLC
    Left = 704
    Top = 584
  end
  object DSP_Consistencias: TDataSetProvider
    DataSet = SDS_Consistencias
    Left = 746
    Top = 600
  end
  object CDS_Consistencias: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Consistencias'
    Left = 783
    Top = 584
    object CDS_ConsistenciasNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
      Visible = False
    end
    object CDS_ConsistenciasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
      Visible = False
    end
    object CDS_ConsistenciasDES_MODULO: TStringField
      DisplayLabel = 'M'#243'dulo'
      FieldName = 'DES_MODULO'
      Size = 60
    end
    object CDS_ConsistenciasDES_LABEL: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_LABEL'
      Required = True
      Size = 60
    end
    object CDS_ConsistenciasDES_COMPONENTE: TStringField
      FieldName = 'DES_COMPONENTE'
      Visible = False
      Size = 60
    end
    object CDS_ConsistenciasIND_LIBERADO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Consistir ?'
      FieldName = 'IND_LIBERADO'
      FixedChar = True
      Size = 3
    end
    object CDS_ConsistenciasUSU_ALTERA: TIntegerField
      FieldName = 'USU_ALTERA'
      Visible = False
    end
    object CDS_ConsistenciasDTA_ALTERA: TSQLTimeStampField
      FieldName = 'DTA_ALTERA'
      Visible = False
    end
  end
  object DS_Consistencias: TDataSource
    DataSet = CDS_Consistencias
    Left = 821
    Top = 600
  end
  object SDS_EmpBusca: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 477
    Top = 148
  end
  object CDS_EmpBusca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_EmpBusca'
    Left = 566
    Top = 153
  end
  object DSP_EmpBusca: TDataSetProvider
    DataSet = SDS_EmpBusca
    Left = 518
    Top = 165
  end
  object DS_EmpBusca: TDataSource
    DataSet = CDS_EmpBusca
    Left = 616
    Top = 165
  end
  object SQLQuery2: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 89
    Top = 72
  end
  object SQLQuery3: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 153
    Top = 72
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'COD_LOJA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 6
      end
      item
        Name = 'RAZAO_SOCIAL'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DTA_AUDITORIA'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'PER_ADMISSIVEL'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'VLR_ADMISS_EQUIVALENTE'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'PER_PERDA_FINAL'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'VLR_PERDA_EQUIVALENTE'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'PER_OBJ_PER_ADMISSIVEL'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'PER_OBJ_VLR_ADMISSIVEL'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'CORPER'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DSP_AuditoriaAnalise'
    StoreDefs = True
    Left = 990
    Top = 547
    object StringField1: TStringField
      Alignment = taCenter
      DisplayLabel = 'C'#243'd Loja'
      FieldName = 'COD_LOJA'
      Required = True
      Size = 6
    end
    object StringField2: TStringField
      DisplayLabel = 'Descri'#231#227'o da Loja'
      FieldName = 'RAZAO_SOCIAL'
      Size = 60
    end
    object DateField1: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Auditoria'
      FieldName = 'DTA_AUDITORIA'
      Required = True
    end
    object FMTBCDField1: TFMTBCDField
      DisplayLabel = '% Admiss'
      FieldName = 'PER_ADMISSIVEL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField2: TFMTBCDField
      DisplayLabel = '% Final'
      FieldName = 'PER_PERDA_FINAL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField3: TFMTBCDField
      DisplayLabel = 'Vlr Admiss Equiv'
      FieldName = 'VLR_ADMISS_EQUIVALENTE'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField4: TFMTBCDField
      DisplayLabel = 'Vlr Final Equiv'
      FieldName = 'VLR_PERDA_EQUIVALENTE'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField5: TFMTBCDField
      DisplayLabel = '%  Obj Perc Final Admiss'
      FieldName = 'PER_OBJ_PER_ADMISSIVEL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object FMTBCDField6: TFMTBCDField
      DisplayLabel = '%  Obj Vlr Final Admiss'
      FieldName = 'PER_OBJ_VLR_ADMISSIVEL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object StringField3: TStringField
      FieldName = 'CORPER'
      Required = True
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SDS_SidicomPermissoes
    Left = 955
    Top = 563
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet1
    Left = 1030
    Top = 563
  end
  object SDS_SidicomPermissoes: TSQLDataSet
    CommandText = 
      'select au.cod_loja, em.razao_social, au.dta_auditoria,'#13#10'au.per_a' +
      'dmissivel, au.vlr_admiss_equivalente,'#13#10'au.per_perda_final, au.vl' +
      'r_perda_equivalente,'#13#10'au.per_obj_per_admissivel,'#13#10'au.per_obj_vlr' +
      '_admissivel,'#13#10'Case'#13#10'  When (au.per_perda_final<-0.80) or (au.per' +
      '_perda_final>0.80) Then'#13#10'  '#39'V'#39#13#10'  Else'#13#10'  '#39'A'#39#13#10'end CorPer'#13#10#13#10'fro' +
      'm auditorias au, emp_conexoes em'#13#10#13#10'where au.cod_loja=em.cod_fil' +
      'ial'#13#10'and au.cod_loja='#39'01'#39#13#10'and au.dta_auditoria= '#39'14.02.2012'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 920
    Top = 547
  end
  object SDS_CurvaFinanceira: TSQLDataSet
    CommandText = 'SELECT *'#13#10'FROM es_finan_curva_abc c'#13#10'WHERE c.cod_loja=999'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 904
    Top = 340
  end
  object DS_CurvaFinanceira: TDataSource
    DataSet = CDS_CurvaFinanceira
    Left = 1031
    Top = 356
  end
  object DSP_CurvaFinanceira: TDataSetProvider
    DataSet = SDS_CurvaFinanceira
    Left = 945
    Top = 356
  end
  object CDS_CurvaFinanceira: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_CurvaFinanceira'
    Left = 985
    Top = 344
    object CDS_CurvaFinanceiraCOD_LOJA: TStringField
      FieldName = 'COD_LOJA'
      Required = True
      Size = 2
    end
    object CDS_CurvaFinanceiraCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      Required = True
      FixedChar = True
      Size = 6
    end
    object CDS_CurvaFinanceiraIND_CURVA: TStringField
      FieldName = 'IND_CURVA'
      Size = 1
    end
    object CDS_CurvaFinanceiraEST_MINIMO: TIntegerField
      FieldName = 'EST_MINIMO'
    end
    object CDS_CurvaFinanceiraUSU_ALTERA: TIntegerField
      FieldName = 'USU_ALTERA'
    end
    object CDS_CurvaFinanceiraDTA_ALTERA: TSQLTimeStampField
      FieldName = 'DTA_ALTERA'
      Required = True
    end
  end
  object IBQ_OC_ComprarAdd: TIBQuery
    Database = IBDB_BelShop
    Transaction = IBT_BelShop
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select *'
      'From oc_comprar oc'
      'Where oc.num_documento<1')
    UpdateObject = IBUP_OC_ComprarAdd
    Left = 1130
    Top = 349
    object IntegerField1: TIntegerField
      FieldName = 'NUM_SEQ'
      Origin = 'OC_COMPRAR.NUM_SEQ'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'NUM_DOCUMENTO'
      Origin = 'OC_COMPRAR.NUM_DOCUMENTO'
      Required = True
    end
    object DateTimeField1: TDateTimeField
      Alignment = taCenter
      FieldName = 'DTA_DOCUMENTO'
      Origin = 'OC_COMPRAR.DTA_DOCUMENTO'
    end
    object IBStringField1: TIBStringField
      Alignment = taCenter
      FieldName = 'IND_OC_GERADA'
      Origin = 'OC_COMPRAR.IND_OC_GERADA'
      Size = 1
    end
    object DateTimeField2: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data OC'
      FieldName = 'DTA_OC_GERADA'
      Origin = 'OC_COMPRAR.DTA_OC_GERADA'
    end
    object IntegerField3: TIntegerField
      DisplayLabel = 'N'#186' OC'
      FieldName = 'NUM_OC_GERADA'
      Origin = 'OC_COMPRAR.NUM_OC_GERADA'
    end
    object IBStringField2: TIBStringField
      DisplayLabel = 'Obs OC'
      FieldName = 'OBS_OC'
      Origin = 'OC_COMPRAR.OBS_OC'
      Size = 2000
    end
    object IBStringField3: TIBStringField
      Alignment = taRightJustify
      FieldName = 'COD_EMPRESA'
      Origin = 'OC_COMPRAR.COD_EMPRESA'
      Size = 6
    end
    object IBStringField4: TIBStringField
      FieldName = 'DES_EMPRESA'
      Origin = 'OC_COMPRAR.DES_EMPRESA'
      Size = 60
    end
    object IBStringField5: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd Produto'
      FieldName = 'COD_ITEM'
      Origin = 'OC_COMPRAR.COD_ITEM'
      Size = 6
    end
    object IBStringField6: TIBStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'DES_ITEM'
      Origin = 'OC_COMPRAR.DES_ITEM'
      Size = 80
    end
    object IBBCDField1: TIBBCDField
      DisplayLabel = 'Sugest'#227'o'
      FieldName = 'QTD_SUGERIDA'
      Origin = 'OC_COMPRAR.QTD_SUGERIDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField2: TIBBCDField
      DisplayLabel = 'A Comprar'
      FieldName = 'QTD_ACOMPRAR'
      Origin = 'OC_COMPRAR.QTD_ACOMPRAR'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField3: TIBBCDField
      DisplayLabel = 'Saldo'
      FieldName = 'QTD_SALDO'
      Origin = 'OC_COMPRAR.QTD_SALDO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField4: TIBBCDField
      DisplayLabel = 'Tr'#226'nsito'
      FieldName = 'QTD_TRANSITO'
      Origin = 'OC_COMPRAR.QTD_TRANSITO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField5: TIBBCDField
      DisplayLabel = 'Previsto'
      FieldName = 'QTD_DISPONIVEL'
      Origin = 'OC_COMPRAR.QTD_DISPONIVEL'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField6: TIBBCDField
      DisplayLabel = 'M'#233'dia M'#234's'
      FieldName = 'QTD_MEDIA_MES'
      Origin = 'OC_COMPRAR.QTD_MEDIA_MES'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 4
    end
    object IBBCDField7: TIBBCDField
      DisplayLabel = 'M'#233'dia Dia'
      FieldName = 'QTD_MEDIA_DIA'
      Origin = 'OC_COMPRAR.QTD_MEDIA_DIA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 4
    end
    object IBBCDField8: TIBBCDField
      FieldName = 'QTD_DEM_MES1'
      Origin = 'OC_COMPRAR.QTD_DEM_MES1'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField9: TIBBCDField
      FieldName = 'QTD_DEM_MES2'
      Origin = 'OC_COMPRAR.QTD_DEM_MES2'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField10: TIBBCDField
      FieldName = 'QTD_DEM_MES3'
      Origin = 'OC_COMPRAR.QTD_DEM_MES3'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField11: TIBBCDField
      FieldName = 'QTD_DEM_MES4'
      Origin = 'OC_COMPRAR.QTD_DEM_MES4'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField12: TIBBCDField
      FieldName = 'QTD_DEM_MES5'
      Origin = 'OC_COMPRAR.QTD_DEM_MES5'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField13: TIBBCDField
      FieldName = 'QTD_DEM_MES6'
      Origin = 'OC_COMPRAR.QTD_DEM_MES6'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField14: TIBBCDField
      FieldName = 'QTD_DEM_MES7'
      Origin = 'OC_COMPRAR.QTD_DEM_MES7'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField15: TIBBCDField
      FieldName = 'QTD_DEM_MES8'
      Origin = 'OC_COMPRAR.QTD_DEM_MES8'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IntegerField4: TIntegerField
      DisplayLabel = 'CxE'
      FieldName = 'UNI_COMPRA'
      Origin = 'OC_COMPRAR.UNI_COMPRA'
    end
    object IntegerField5: TIntegerField
      DisplayLabel = 'Uni Venda'
      FieldName = 'UNI_VENDA'
      Origin = 'OC_COMPRAR.UNI_VENDA'
    end
    object IBStringField7: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'EAN'
      FieldName = 'COD_BARRAS'
      Origin = 'OC_COMPRAR.COD_BARRAS'
      Size = 19
    end
    object IBStringField8: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Grupo'
      FieldName = 'COD_GRUPO'
      Origin = 'OC_COMPRAR.COD_GRUPO'
      Size = 3
    end
    object IBStringField9: TIBStringField
      DisplayLabel = 'Grupo'
      FieldName = 'DES_GRUPO'
      Origin = 'OC_COMPRAR.DES_GRUPO'
      Size = 30
    end
    object IBStringField10: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod SubGrupo'
      FieldName = 'COD_SUBGRUPO'
      Origin = 'OC_COMPRAR.COD_SUBGRUPO'
      Size = 7
    end
    object IBStringField11: TIBStringField
      DisplayLabel = 'SubGrupo'
      FieldName = 'DES_SUBGRUPO'
      Origin = 'OC_COMPRAR.DES_SUBGRUPO'
      Size = 30
    end
    object IBStringField12: TIBStringField
      DisplayLabel = 'Gen'#233'rico'
      FieldName = 'DES_GENERICO'
      Origin = 'OC_COMPRAR.DES_GENERICO'
      Size = 80
    end
    object IBStringField13: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Aplic'
      FieldName = 'COD_APLICACAO'
      Origin = 'OC_COMPRAR.COD_APLICACAO'
      Size = 4
    end
    object IBStringField14: TIBStringField
      DisplayLabel = 'Aplica'#231#227'o'
      FieldName = 'DES_APLICACAO'
      Origin = 'OC_COMPRAR.DES_APLICACAO'
      Size = 30
    end
    object IBStringField15: TIBStringField
      FieldName = 'COD_REFERENCIA'
      Origin = 'OC_COMPRAR.COD_REFERENCIA'
      Size = 30
    end
    object IBStringField16: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'ABC'
      FieldName = 'CLA_CURVA_ABC'
      Origin = 'OC_COMPRAR.CLA_CURVA_ABC'
      Size = 1
    end
    object IBStringField17: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Fam Pre'#231'o'
      FieldName = 'COD_FAMILIA_PRECO'
      Origin = 'OC_COMPRAR.COD_FAMILIA_PRECO'
      Size = 4
    end
    object IBStringField18: TIBStringField
      DisplayLabel = 'Fam'#237'lia Pre'#231'o'
      FieldName = 'DES_FAMILIA_PRECO'
      Origin = 'OC_COMPRAR.DES_FAMILIA_PRECO'
      Size = 40
    end
    object DateField2: TDateField
      Alignment = taCenter
      DisplayLabel = 'Ult Compra'
      FieldName = 'DTA_ULT_COMPRA'
      Origin = 'OC_COMPRAR.DTA_ULT_COMPRA'
    end
    object IBStringField19: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Forn Ult Compra'
      FieldName = 'COD_FOR_ULT_COMPRA'
      Origin = 'OC_COMPRAR.COD_FOR_ULT_COMPRA'
      Size = 6
    end
    object IBStringField20: TIBStringField
      DisplayLabel = 'Fornecedor Ult Compra'
      FieldName = 'DES_FOR_ULT_COMPRA'
      Origin = 'OC_COMPRAR.DES_FOR_ULT_COMPRA'
      Size = 40
    end
    object IBBCDField16: TIBBCDField
      DisplayLabel = 'Qtd Ult Comp'
      FieldName = 'QTD_ULT_COMPRA'
      Origin = 'OC_COMPRAR.QTD_ULT_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField17: TIBBCDField
      DisplayLabel = 'Vr Un Ult Comp'
      FieldName = 'VLR_UNI_ULT_COMPRA'
      Origin = 'OC_COMPRAR.VLR_UNI_ULT_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField18: TIBBCDField
      DisplayLabel = 'Vr Tot Ult Comp'
      FieldName = 'VLR_TOT_ULT_COMPRA'
      Origin = 'OC_COMPRAR.VLR_TOT_ULT_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField19: TIBBCDField
      DisplayLabel = 'Vr Un Compra'
      FieldName = 'VLR_UNI_COMPRA'
      Origin = 'OC_COMPRAR.VLR_UNI_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField20: TIBBCDField
      DisplayLabel = '% Desc'
      FieldName = 'PER_DESCONTO'
      Origin = 'OC_COMPRAR.PER_DESCONTO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object DateField3: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dta Ult Venda'
      FieldName = 'DTA_ULT_VENDA'
      Origin = 'OC_COMPRAR.DTA_ULT_VENDA'
    end
    object IBStringField21: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Cli Ult Venda'
      FieldName = 'COD_CLI_ULT_VENDA'
      Origin = 'OC_COMPRAR.COD_CLI_ULT_VENDA'
      Size = 6
    end
    object IBStringField22: TIBStringField
      DisplayLabel = 'Cliente Ult Venda'
      FieldName = 'DES_CLI_ULT_VENDA'
      Origin = 'OC_COMPRAR.DES_CLI_ULT_VENDA'
      Size = 40
    end
    object IBBCDField21: TIBBCDField
      DisplayLabel = 'Qtd Ult Venda'
      FieldName = 'QTD_ULT_VENDA'
      Origin = 'OC_COMPRAR.QTD_ULT_VENDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField22: TIBBCDField
      DisplayLabel = 'Vlr Unit Ult Venda'
      FieldName = 'VLR_UNI_ULT_VENDA'
      Origin = 'OC_COMPRAR.VLR_UNI_ULT_VENDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField23: TIBBCDField
      DisplayLabel = 'Vlr Tot Ult Venda'
      FieldName = 'VLR_TOT_ULT_VENDA'
      Origin = 'OC_COMPRAR.VLR_TOT_ULT_VENDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField24: TIBBCDField
      DisplayLabel = 'Vl Un Venda'
      FieldName = 'VLR_UNI_VENDA'
      Origin = 'OC_COMPRAR.VLR_UNI_VENDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBStringField23: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Lista Venda'
      FieldName = 'COD_LISTA_VENDA'
      Origin = 'OC_COMPRAR.COD_LISTA_VENDA'
      Size = 4
    end
    object IBStringField24: TIBStringField
      DisplayLabel = 'Lista Venda'
      FieldName = 'DES_LISTA_VENDA'
      Origin = 'OC_COMPRAR.DES_LISTA_VENDA'
      Size = 30
    end
    object IBStringField25: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Lista Compra'
      FieldName = 'COD_LISTA_COMPRA'
      Origin = 'OC_COMPRAR.COD_LISTA_COMPRA'
      Size = 4
    end
    object IBStringField26: TIBStringField
      DisplayLabel = 'Lista Compra'
      FieldName = 'DES_LISTA_COMPRA'
      Origin = 'OC_COMPRAR.DES_LISTA_COMPRA'
      Size = 30
    end
    object IBBCDField25: TIBBCDField
      DisplayLabel = 'Custo M'#233'dio'
      FieldName = 'VLR_CUSTO_MEDIO'
      Origin = 'OC_COMPRAR.VLR_CUSTO_MEDIO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField26: TIBBCDField
      DisplayLabel = 'Vlr Tot Venda'
      FieldName = 'VLR_TOT_VENDA'
      Origin = 'OC_COMPRAR.VLR_TOT_VENDA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField27: TIBBCDField
      DisplayLabel = 'Vr Tot Compra'
      FieldName = 'VLR_TOT_COMPRA'
      Origin = 'OC_COMPRAR.VLR_TOT_COMPRA'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField28: TIBBCDField
      DisplayLabel = 'Vlr Bruto'
      FieldName = 'VLR_BRUTO'
      Origin = 'OC_COMPRAR.VLR_BRUTO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField29: TIBBCDField
      DisplayLabel = 'Vlr Desc'
      FieldName = 'VLR_DESCONTOS'
      Origin = 'OC_COMPRAR.VLR_DESCONTOS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField30: TIBBCDField
      DisplayLabel = 'Vlr Desp'
      FieldName = 'VLR_DESPESAS'
      Origin = 'OC_COMPRAR.VLR_DESPESAS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField31: TIBBCDField
      DisplayLabel = 'Vlr Frete'
      FieldName = 'VLR_FRETE'
      Origin = 'OC_COMPRAR.VLR_FRETE'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBStringField27: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Soma IPI BICMS'
      FieldName = 'IND_SOMA_IPI_BASE_ICMS'
      Origin = 'OC_COMPRAR.IND_SOMA_IPI_BASE_ICMS'
      Size = 1
    end
    object IBStringField28: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Soma Frete BICMS'
      FieldName = 'IND_SOMA_FRETE_BASE_ICMS'
      Origin = 'OC_COMPRAR.IND_SOMA_FRETE_BASE_ICMS'
      Size = 1
    end
    object IBStringField29: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Soma Desp BICMS'
      FieldName = 'IND_SOMA_DESPESA_BASE_ICMS'
      Origin = 'OC_COMPRAR.IND_SOMA_DESPESA_BASE_ICMS'
      Size = 1
    end
    object IBStringField30: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Soma IPI BST'
      FieldName = 'IND_SOMA_IPI_BASE_ST'
      Origin = 'OC_COMPRAR.IND_SOMA_IPI_BASE_ST'
      Size = 1
    end
    object IBStringField31: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Soma Frete BST'
      FieldName = 'IND_SOMA_FRETE_BASE_ST'
      Origin = 'OC_COMPRAR.IND_SOMA_FRETE_BASE_ST'
      Size = 1
    end
    object IBStringField32: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Soma Desp BST'
      FieldName = 'IND_SOMA_DESPESA_BASE_ST'
      Origin = 'OC_COMPRAR.IND_SOMA_DESPESA_BASE_ST'
      Size = 1
    end
    object IBStringField33: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Sit Trib'
      FieldName = 'COD_SIT_TRIBUTARIA'
      Origin = 'OC_COMPRAR.COD_SIT_TRIBUTARIA'
      Size = 2
    end
    object IBStringField34: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod IPI'
      FieldName = 'COD_IPI'
      Origin = 'OC_COMPRAR.COD_IPI'
      Size = 2
    end
    object IBStringField35: TIBStringField
      DisplayLabel = 'Ind IPI'
      FieldName = 'IND_IPI'
      Origin = 'OC_COMPRAR.IND_IPI'
      Size = 1
    end
    object IBBCDField32: TIBBCDField
      DisplayLabel = 'Per IPI'
      FieldName = 'PER_IPI'
      Origin = 'OC_COMPRAR.PER_IPI'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBBCDField33: TIBBCDField
      DisplayLabel = 'Vlr IPI'
      FieldName = 'VLR_IPI'
      Origin = 'OC_COMPRAR.VLR_IPI'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBStringField36: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod ICMS'
      FieldName = 'COD_ICMS'
      Origin = 'OC_COMPRAR.COD_ICMS'
      Size = 2
    end
    object IBBCDField34: TIBBCDField
      DisplayLabel = 'Per Red ICMS'
      FieldName = 'PER_REDUCAO_ICMS'
      Origin = 'OC_COMPRAR.PER_REDUCAO_ICMS'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBBCDField35: TIBBCDField
      DisplayLabel = 'Vlr Red ICMS'
      FieldName = 'VLR_REDUCAO_ICMS'
      Origin = 'OC_COMPRAR.VLR_REDUCAO_ICMS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField36: TIBBCDField
      DisplayLabel = 'Vlr Base ICMS'
      FieldName = 'VLR_BASE_ICMS'
      Origin = 'OC_COMPRAR.VLR_BASE_ICMS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField37: TIBBCDField
      DisplayLabel = 'Per ICMS'
      FieldName = 'PER_ICMS'
      Origin = 'OC_COMPRAR.PER_ICMS'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBBCDField38: TIBBCDField
      DisplayLabel = 'Vlr ICMS'
      FieldName = 'VLR_ICMS'
      Origin = 'OC_COMPRAR.VLR_ICMS'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IntegerField6: TIntegerField
      DisplayLabel = 'Cod Gr ST'
      FieldName = 'COD_GRUPO_ST'
      Origin = 'OC_COMPRAR.COD_GRUPO_ST'
    end
    object IBStringField37: TIBStringField
      DisplayLabel = 'Grupo ST'
      FieldName = 'DES_GRUPO_ST'
      Origin = 'OC_COMPRAR.DES_GRUPO_ST'
      Size = 30
    end
    object IBBCDField39: TIBBCDField
      DisplayLabel = 'Per Margem ST'
      FieldName = 'PER_MARGEM_ST'
      Origin = 'OC_COMPRAR.PER_MARGEM_ST'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 4
    end
    object IBStringField38: TIBStringField
      DisplayLabel = 'Ind ST'
      FieldName = 'IND_ST'
      Origin = 'OC_COMPRAR.IND_ST'
      Size = 1
    end
    object IBBCDField40: TIBBCDField
      DisplayLabel = 'Vlr Base ST'
      FieldName = 'VLR_BASE_ST'
      Origin = 'OC_COMPRAR.VLR_BASE_ST'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField41: TIBBCDField
      DisplayLabel = 'Per ST'
      FieldName = 'PER_ST'
      Origin = 'OC_COMPRAR.PER_ST'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBBCDField42: TIBBCDField
      DisplayLabel = 'Vlr ST'
      FieldName = 'VLR_ST'
      Origin = 'OC_COMPRAR.VLR_ST'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField43: TIBBCDField
      DisplayLabel = 'Per Repasse'
      FieldName = 'PER_REPASSE'
      Origin = 'OC_COMPRAR.PER_REPASSE'
      DisplayFormat = '0.,00'
      Precision = 9
      Size = 2
    end
    object IBBCDField44: TIBBCDField
      DisplayLabel = 'Vlr Repasse'
      FieldName = 'VLR_REPASSE'
      Origin = 'OC_COMPRAR.VLR_REPASSE'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBStringField39: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Comprovante ICMS'
      FieldName = 'COD_COMPROVANTE_ICMS'
      Origin = 'OC_COMPRAR.COD_COMPROVANTE_ICMS'
      Size = 3
    end
    object IBStringField40: TIBStringField
      FieldName = 'COD_REFERENCIA_FORN'
      Origin = 'OC_COMPRAR.COD_REFERENCIA_FORN'
      Size = 30
    end
    object IBStringField41: TIBStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Forn'
      FieldName = 'COD_FORNECEDOR'
      Origin = 'OC_COMPRAR.COD_FORNECEDOR'
      Size = 6
    end
    object IBStringField42: TIBStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'DES_FORNECEDOR'
      Origin = 'OC_COMPRAR.DES_FORNECEDOR'
      Size = 40
    end
    object IBStringField43: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Tp Pessoa'
      FieldName = 'TIP_PESSOA'
      Origin = 'OC_COMPRAR.TIP_PESSOA'
      Size = 1
    end
    object IBStringField44: TIBStringField
      DisplayLabel = 'E-Mail'
      FieldName = 'DES_EMAIL'
      Origin = 'OC_COMPRAR.DES_EMAIL'
      Size = 80
    end
    object IntegerField7: TIntegerField
      DisplayLabel = 'Nr Dias'
      FieldName = 'QTD_NR_DIAS'
      Origin = 'OC_COMPRAR.QTD_NR_DIAS'
    end
    object IntegerField8: TIntegerField
      DisplayLabel = 'Nr Meses'
      FieldName = 'QTD_NR_MESES'
      Origin = 'OC_COMPRAR.QTD_NR_MESES'
    end
    object IntegerField9: TIntegerField
      DisplayLabel = 'Total Meses'
      FieldName = 'QTD_TOT_MESES'
      Origin = 'OC_COMPRAR.QTD_TOT_MESES'
    end
    object IntegerField10: TIntegerField
      FieldName = 'COD_COMPRADOR'
      Origin = 'OC_COMPRAR.COD_COMPRADOR'
    end
    object MemoField1: TMemoField
      FieldName = 'BLOB_TEXTO'
      Origin = 'OC_COMPRAR.BLOB_TEXTO'
      BlobType = ftMemo
      Size = 8
    end
    object IBStringField45: TIBStringField
      FieldName = 'IND_TRANSF'
      Origin = 'OC_COMPRAR.IND_TRANSF'
      Size = 1
    end
    object DateField4: TDateField
      FieldName = 'DTA_LIM_TRANSF'
      Origin = 'OC_COMPRAR.DTA_LIM_TRANSF'
    end
    object IBBCDField45: TIBBCDField
      DisplayLabel = 'Qtd Transf'
      FieldName = 'QTD_TRANSF'
      Origin = 'OC_COMPRAR.QTD_TRANSF'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBStringField46: TIBStringField
      FieldName = 'IND_USAR'
      Origin = 'OC_COMPRAR.IND_USAR'
      Size = 3
    end
    object IBBCDField46: TIBBCDField
      FieldName = 'IND_QTD_ACIMA'
      Origin = 'OC_COMPRAR.IND_QTD_ACIMA'
      Precision = 18
      Size = 2
    end
    object IBBCDField47: TIBBCDField
      DisplayLabel = 'Sug. ANO'
      FieldName = 'QTD_SUGERIDA_ANO'
      Origin = 'OC_COMPRAR.QTD_SUGERIDA_ANO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField48: TIBBCDField
      DisplayLabel = 'Transf Per'#237'odo'
      FieldName = 'QTD_TRANSF_PERIODO'
      Origin = 'OC_COMPRAR.QTD_TRANSF_PERIODO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField49: TIBBCDField
      DisplayLabel = 'Transf Ano'
      FieldName = 'QTD_TRANSF_ANO'
      Origin = 'OC_COMPRAR.QTD_TRANSF_ANO'
      DisplayFormat = '0.,00'
      Precision = 18
      Size = 2
    end
    object IBBCDField50: TIBBCDField
      DisplayLabel = 'Est. M'#237'nimo'
      FieldName = 'EST_MINIMO'
      Origin = 'OC_COMPRAR.EST_MINIMO'
      DisplayFormat = '0,'
      Precision = 18
      Size = 2
    end
    object IntegerField11: TIntegerField
      DisplayLabel = 'Dias Estocagem'
      FieldName = 'DIAS_ESTOCAGEM'
      Origin = 'OC_COMPRAR.DIAS_ESTOCAGEM'
      DisplayFormat = '0,'
    end
    object IBQ_OC_ComprarAddQTD_DEMANDA_DIA: TIBBCDField
      FieldName = 'QTD_DEMANDA_DIA'
      Origin = 'OC_COMPRAR.QTD_DEMANDA_DIA'
      Precision = 18
      Size = 4
    end
    object IBQ_OC_ComprarAddQTD_DEMANDA_ANO: TIBBCDField
      FieldName = 'QTD_DEMANDA_ANO'
      Origin = 'OC_COMPRAR.QTD_DEMANDA_ANO'
      Precision = 18
      Size = 2
    end
    object IBQ_OC_ComprarAddQTD_DIAS_ANO: TIntegerField
      FieldName = 'QTD_DIAS_ANO'
      Origin = 'OC_COMPRAR.QTD_DIAS_ANO'
    end
    object IBQ_OC_ComprarAddDATAINCLUSAO: TDateField
      DisplayLabel = 'Inclus'#227'o'
      FieldName = 'DATAINCLUSAO'
      Origin = 'OC_COMPRAR.DATAINCLUSAO'
    end
    object IBQ_OC_ComprarAddESTADO: TIBStringField
      DisplayLabel = 'UF'
      FieldName = 'ESTADO'
      Origin = 'OC_COMPRAR.ESTADO'
      FixedChar = True
      Size = 2
    end
    object IBQ_OC_ComprarAddDATAALTERACAO: TDateField
      FieldName = 'DATAALTERACAO'
      Origin = 'OC_COMPRAR.DATAALTERACAO'
    end
    object IBQ_OC_ComprarAddIND_TRANSF_CD: TIBStringField
      FieldName = 'IND_TRANSF_CD'
      Origin = 'OC_COMPRAR.IND_TRANSF_CD'
      FixedChar = True
      Size = 1
    end
    object IBQ_OC_ComprarAddDOC_TRANSF_CD: TIntegerField
      FieldName = 'DOC_TRANSF_CD'
      Origin = 'OC_COMPRAR.DOC_TRANSF_CD'
    end
  end
  object IBUP_OC_ComprarAdd: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from oc_comprar '
      'where'
      '  NUM_SEQ = :NUM_SEQ'
      ' and  NUM_DOCUMENTO = :NUM_DOCUMENTO')
    ModifySQL.Strings = (
      'update oc_comprar'
      'set'
      '  DTA_DOCUMENTO = :DTA_DOCUMENTO,'
      '  IND_OC_GERADA = :IND_OC_GERADA,'
      '  DTA_OC_GERADA = :DTA_OC_GERADA,'
      '  NUM_OC_GERADA = :NUM_OC_GERADA,'
      '  OBS_OC = :OBS_OC,'
      '  COD_EMPRESA = :COD_EMPRESA,'
      '  DES_EMPRESA = :DES_EMPRESA,'
      '  COD_ITEM = :COD_ITEM,'
      '  DES_ITEM = :DES_ITEM,'
      '  QTD_SUGERIDA = :QTD_SUGERIDA,'
      '  QTD_ACOMPRAR = :QTD_ACOMPRAR,'
      '  QTD_SALDO = :QTD_SALDO,'
      '  QTD_TRANSITO = :QTD_TRANSITO,'
      '  QTD_DISPONIVEL = :QTD_DISPONIVEL,'
      '  QTD_MEDIA_MES = :QTD_MEDIA_MES,'
      '  QTD_MEDIA_DIA = :QTD_MEDIA_DIA,'
      '  QTD_DEM_MES1 = :QTD_DEM_MES1,'
      '  QTD_DEM_MES2 = :QTD_DEM_MES2,'
      '  QTD_DEM_MES3 = :QTD_DEM_MES3,'
      '  QTD_DEM_MES4 = :QTD_DEM_MES4,'
      '  QTD_DEM_MES5 = :QTD_DEM_MES5,'
      '  QTD_DEM_MES6 = :QTD_DEM_MES6,'
      '  QTD_DEM_MES7 = :QTD_DEM_MES7,'
      '  QTD_DEM_MES8 = :QTD_DEM_MES8,'
      '  UNI_COMPRA = :UNI_COMPRA,'
      '  UNI_VENDA = :UNI_VENDA,'
      '  COD_BARRAS = :COD_BARRAS,'
      '  COD_GRUPO = :COD_GRUPO,'
      '  DES_GRUPO = :DES_GRUPO,'
      '  COD_SUBGRUPO = :COD_SUBGRUPO,'
      '  DES_SUBGRUPO = :DES_SUBGRUPO,'
      '  DES_GENERICO = :DES_GENERICO,'
      '  COD_APLICACAO = :COD_APLICACAO,'
      '  DES_APLICACAO = :DES_APLICACAO,'
      '  COD_REFERENCIA = :COD_REFERENCIA,'
      '  CLA_CURVA_ABC = :CLA_CURVA_ABC,'
      '  COD_FAMILIA_PRECO = :COD_FAMILIA_PRECO,'
      '  DES_FAMILIA_PRECO = :DES_FAMILIA_PRECO,'
      '  DTA_ULT_COMPRA = :DTA_ULT_COMPRA,'
      '  COD_FOR_ULT_COMPRA = :COD_FOR_ULT_COMPRA,'
      '  DES_FOR_ULT_COMPRA = :DES_FOR_ULT_COMPRA,'
      '  QTD_ULT_COMPRA = :QTD_ULT_COMPRA,'
      '  VLR_UNI_ULT_COMPRA = :VLR_UNI_ULT_COMPRA,'
      '  VLR_TOT_ULT_COMPRA = :VLR_TOT_ULT_COMPRA,'
      '  VLR_UNI_COMPRA = :VLR_UNI_COMPRA,'
      '  PER_DESCONTO = :PER_DESCONTO,'
      '  DTA_ULT_VENDA = :DTA_ULT_VENDA,'
      '  COD_CLI_ULT_VENDA = :COD_CLI_ULT_VENDA,'
      '  DES_CLI_ULT_VENDA = :DES_CLI_ULT_VENDA,'
      '  QTD_ULT_VENDA = :QTD_ULT_VENDA,'
      '  VLR_UNI_ULT_VENDA = :VLR_UNI_ULT_VENDA,'
      '  VLR_TOT_ULT_VENDA = :VLR_TOT_ULT_VENDA,'
      '  VLR_UNI_VENDA = :VLR_UNI_VENDA,'
      '  COD_LISTA_VENDA = :COD_LISTA_VENDA,'
      '  DES_LISTA_VENDA = :DES_LISTA_VENDA,'
      '  COD_LISTA_COMPRA = :COD_LISTA_COMPRA,'
      '  DES_LISTA_COMPRA = :DES_LISTA_COMPRA,'
      '  VLR_CUSTO_MEDIO = :VLR_CUSTO_MEDIO,'
      '  VLR_TOT_VENDA = :VLR_TOT_VENDA,'
      '  VLR_TOT_COMPRA = :VLR_TOT_COMPRA,'
      '  VLR_BRUTO = :VLR_BRUTO,'
      '  VLR_DESCONTOS = :VLR_DESCONTOS,'
      '  VLR_DESPESAS = :VLR_DESPESAS,'
      '  VLR_FRETE = :VLR_FRETE,'
      '  IND_SOMA_IPI_BASE_ICMS = :IND_SOMA_IPI_BASE_ICMS,'
      '  IND_SOMA_FRETE_BASE_ICMS = :IND_SOMA_FRETE_BASE_ICMS,'
      '  IND_SOMA_DESPESA_BASE_ICMS = :IND_SOMA_DESPESA_BASE_ICMS,'
      '  IND_SOMA_IPI_BASE_ST = :IND_SOMA_IPI_BASE_ST,'
      '  IND_SOMA_FRETE_BASE_ST = :IND_SOMA_FRETE_BASE_ST,'
      '  IND_SOMA_DESPESA_BASE_ST = :IND_SOMA_DESPESA_BASE_ST,'
      '  COD_SIT_TRIBUTARIA = :COD_SIT_TRIBUTARIA,'
      '  COD_IPI = :COD_IPI,'
      '  IND_IPI = :IND_IPI,'
      '  PER_IPI = :PER_IPI,'
      '  VLR_IPI = :VLR_IPI,'
      '  COD_ICMS = :COD_ICMS,'
      '  PER_REDUCAO_ICMS = :PER_REDUCAO_ICMS,'
      '  VLR_REDUCAO_ICMS = :VLR_REDUCAO_ICMS,'
      '  VLR_BASE_ICMS = :VLR_BASE_ICMS,'
      '  PER_ICMS = :PER_ICMS,'
      '  VLR_ICMS = :VLR_ICMS,'
      '  COD_GRUPO_ST = :COD_GRUPO_ST,'
      '  DES_GRUPO_ST = :DES_GRUPO_ST,'
      '  PER_MARGEM_ST = :PER_MARGEM_ST,'
      '  IND_ST = :IND_ST,'
      '  VLR_BASE_ST = :VLR_BASE_ST,'
      '  PER_ST = :PER_ST,'
      '  VLR_ST = :VLR_ST,'
      '  PER_REPASSE = :PER_REPASSE,'
      '  VLR_REPASSE = :VLR_REPASSE,'
      '  COD_COMPROVANTE_ICMS = :COD_COMPROVANTE_ICMS,'
      '  COD_REFERENCIA_FORN = :COD_REFERENCIA_FORN,'
      '  COD_FORNECEDOR = :COD_FORNECEDOR,'
      '  DES_FORNECEDOR = :DES_FORNECEDOR,'
      '  TIP_PESSOA = :TIP_PESSOA,'
      '  DES_EMAIL = :DES_EMAIL,'
      '  QTD_NR_DIAS = :QTD_NR_DIAS,'
      '  QTD_NR_MESES = :QTD_NR_MESES,'
      '  QTD_TOT_MESES = :QTD_TOT_MESES,'
      '  COD_COMPRADOR = :COD_COMPRADOR,'
      '  BLOB_TEXTO = :BLOB_TEXTO,'
      '  IND_TRANSF = :IND_TRANSF,'
      '  DTA_LIM_TRANSF = :DTA_LIM_TRANSF,'
      '  QTD_TRANSF = :QTD_TRANSF,'
      '  IND_USAR = :IND_USAR,'
      '  IND_QTD_ACIMA = :IND_QTD_ACIMA,'
      '  QTD_SUGERIDA_ANO = :QTD_SUGERIDA_ANO,'
      '  QTD_TRANSF_PERIODO = :QTD_TRANSF_PERIODO,'
      '  QTD_TRANSF_ANO = :QTD_TRANSF_ANO,'
      '  EST_MINIMO = :EST_MINIMO,'
      '  DIAS_ESTOCAGEM = :DIAS_ESTOCAGEM,'
      '  QTD_DEMANDA_DIA = :QTD_DEMANDA_DIA,'
      '  QTD_DEMANDA_ANO = :QTD_DEMANDA_ANO,'
      '  QTD_DIAS_ANO = :QTD_DIAS_ANO,'
      '  DATAINCLUSAO = :DATAINCLUSAO,'
      '  ESTADO = :ESTADO,'
      '  DATAALTERACAO = :DATAALTERACAO'
      'where'
      '  NUM_SEQ = :NUM_SEQ'
      '  and NUM_DOCUMENTO = :NUM_DOCUMENTO'
      '')
    InsertSQL.Strings = (
      'insert into oc_comprar'
      '  (NUM_SEQ, NUM_DOCUMENTO, DTA_DOCUMENTO, IND_OC_GERADA, '
      'DTA_OC_GERADA, '
      '   NUM_OC_GERADA, OBS_OC, COD_EMPRESA, DES_EMPRESA, COD_ITEM, '
      'DES_ITEM, '
      '   QTD_SUGERIDA, QTD_ACOMPRAR, QTD_SALDO, QTD_TRANSITO, '
      'QTD_DISPONIVEL, '
      '   QTD_MEDIA_MES, QTD_MEDIA_DIA, QTD_DEM_MES1, QTD_DEM_MES2, '
      'QTD_DEM_MES3, '
      '   QTD_DEM_MES4, QTD_DEM_MES5, QTD_DEM_MES6, QTD_DEM_MES7, '
      'QTD_DEM_MES8, '
      '   UNI_COMPRA, UNI_VENDA, COD_BARRAS, COD_GRUPO, DES_GRUPO, '
      'COD_SUBGRUPO, '
      '   DES_SUBGRUPO, DES_GENERICO, COD_APLICACAO, DES_APLICACAO, '
      'COD_REFERENCIA, '
      '   CLA_CURVA_ABC, COD_FAMILIA_PRECO, DES_FAMILIA_PRECO, '
      'DTA_ULT_COMPRA, '
      '   COD_FOR_ULT_COMPRA, DES_FOR_ULT_COMPRA, QTD_ULT_COMPRA, '
      'VLR_UNI_ULT_COMPRA, '
      '   VLR_TOT_ULT_COMPRA, VLR_UNI_COMPRA, PER_DESCONTO, '
      'DTA_ULT_VENDA, COD_CLI_ULT_VENDA, '
      '   DES_CLI_ULT_VENDA, QTD_ULT_VENDA, VLR_UNI_ULT_VENDA, '
      'VLR_TOT_ULT_VENDA, '
      '   VLR_UNI_VENDA, COD_LISTA_VENDA, DES_LISTA_VENDA, '
      'COD_LISTA_COMPRA, DES_LISTA_COMPRA, '
      '   VLR_CUSTO_MEDIO, VLR_TOT_VENDA, VLR_TOT_COMPRA, VLR_BRUTO, '
      'VLR_DESCONTOS, '
      '   VLR_DESPESAS, VLR_FRETE, IND_SOMA_IPI_BASE_ICMS, '
      'IND_SOMA_FRETE_BASE_ICMS, '
      '   IND_SOMA_DESPESA_BASE_ICMS, IND_SOMA_IPI_BASE_ST, '
      'IND_SOMA_FRETE_BASE_ST, '
      
        '   IND_SOMA_DESPESA_BASE_ST, COD_SIT_TRIBUTARIA, COD_IPI, IND_IP' +
        'I, '
      'PER_IPI, '
      '   VLR_IPI, COD_ICMS, PER_REDUCAO_ICMS, VLR_REDUCAO_ICMS, '
      'VLR_BASE_ICMS, '
      '   PER_ICMS, VLR_ICMS, COD_GRUPO_ST, DES_GRUPO_ST, '
      'PER_MARGEM_ST, IND_ST, '
      '   VLR_BASE_ST, PER_ST, VLR_ST, PER_REPASSE, VLR_REPASSE, '
      'COD_COMPROVANTE_ICMS, '
      '   COD_REFERENCIA_FORN, COD_FORNECEDOR, DES_FORNECEDOR, '
      'TIP_PESSOA, DES_EMAIL, '
      '   QTD_NR_DIAS, QTD_NR_MESES, QTD_TOT_MESES, COD_COMPRADOR, '
      'BLOB_TEXTO, '
      '   IND_TRANSF, DTA_LIM_TRANSF, QTD_TRANSF, IND_USAR, '
      'IND_QTD_ACIMA,'
      '  QTD_SUGERIDA_ANO, QTD_TRANSF_PERIODO, QTD_TRANSF_ANO, '
      'EST_MINIMO, '
      '  DIAS_ESTOCAGEM, QTD_DEMANDA_DIA, QTD_DEMANDA_ANO, '
      'QTD_DIAS_ANO,'
      '  DATAINCLUSAO, ESTADO, DATAALTERACAO)'
      'values'
      '  (:NUM_SEQ, :NUM_DOCUMENTO, :DTA_DOCUMENTO, :IND_OC_GERADA, '
      ':DTA_OC_GERADA, '
      
        '   :NUM_OC_GERADA, :OBS_OC, :COD_EMPRESA, :DES_EMPRESA, :COD_ITE' +
        'M, '
      ':DES_ITEM, '
      '   :QTD_SUGERIDA, :QTD_ACOMPRAR, :QTD_SALDO, :QTD_TRANSITO, '
      ':QTD_DISPONIVEL, '
      
        '   :QTD_MEDIA_MES, :QTD_MEDIA_DIA, :QTD_DEM_MES1, :QTD_DEM_MES2,' +
        ' '
      ':QTD_DEM_MES3, '
      '   :QTD_DEM_MES4, :QTD_DEM_MES5, :QTD_DEM_MES6, :QTD_DEM_MES7, '
      ':QTD_DEM_MES8, '
      
        '   :UNI_COMPRA, :UNI_VENDA, :COD_BARRAS, :COD_GRUPO, :DES_GRUPO,' +
        ' '
      ':COD_SUBGRUPO, '
      
        '   :DES_SUBGRUPO, :DES_GENERICO, :COD_APLICACAO, :DES_APLICACAO,' +
        ' '
      ':COD_REFERENCIA, '
      '   :CLA_CURVA_ABC, :COD_FAMILIA_PRECO, :DES_FAMILIA_PRECO, '
      ':DTA_ULT_COMPRA, '
      '   :COD_FOR_ULT_COMPRA, :DES_FOR_ULT_COMPRA, :QTD_ULT_COMPRA, '
      ':VLR_UNI_ULT_COMPRA, '
      '   :VLR_TOT_ULT_COMPRA, :VLR_UNI_COMPRA, :PER_DESCONTO, '
      ':DTA_ULT_VENDA, '
      '   :COD_CLI_ULT_VENDA, :DES_CLI_ULT_VENDA, :QTD_ULT_VENDA, '
      ':VLR_UNI_ULT_VENDA, '
      '   :VLR_TOT_ULT_VENDA, :VLR_UNI_VENDA, :COD_LISTA_VENDA, '
      ':DES_LISTA_VENDA, '
      '   :COD_LISTA_COMPRA, :DES_LISTA_COMPRA, :VLR_CUSTO_MEDIO, '
      ':VLR_TOT_VENDA, '
      '   :VLR_TOT_COMPRA, :VLR_BRUTO, :VLR_DESCONTOS, :VLR_DESPESAS, '
      ':VLR_FRETE, '
      '   :IND_SOMA_IPI_BASE_ICMS, :IND_SOMA_FRETE_BASE_ICMS, '
      ':IND_SOMA_DESPESA_BASE_ICMS, '
      '   :IND_SOMA_IPI_BASE_ST, :IND_SOMA_FRETE_BASE_ST, '
      ':IND_SOMA_DESPESA_BASE_ST, '
      
        '   :COD_SIT_TRIBUTARIA, :COD_IPI, :IND_IPI, :PER_IPI, :VLR_IPI, ' +
        ':COD_ICMS, '
      ':PER_REDUCAO_ICMS, '
      '   :VLR_REDUCAO_ICMS, :VLR_BASE_ICMS, :PER_ICMS, :VLR_ICMS, '
      ':COD_GRUPO_ST, '
      
        '   :DES_GRUPO_ST, :PER_MARGEM_ST, :IND_ST, :VLR_BASE_ST,    :PER' +
        '_ST, '
      ':VLR_ST,'
      '   :PER_REPASSE, :VLR_REPASSE, :COD_COMPROVANTE_ICMS, '
      ':COD_REFERENCIA_FORN, '
      '   :COD_FORNECEDOR, :DES_FORNECEDOR, :TIP_PESSOA, :DES_EMAIL, '
      '   :QTD_NR_DIAS, :QTD_NR_MESES, :QTD_TOT_MESES, :COD_COMPRADOR, '
      ':BLOB_TEXTO, '
      '   :IND_TRANSF, :DTA_LIM_TRANSF, :QTD_TRANSF, :IND_USAR, '
      ':IND_QTD_ACIMA,'
      '   :QTD_SUGERIDA_ANO, :QTD_TRANSF_PERIODO, :QTD_TRANSF_ANO, '
      ':EST_MINIMO, '
      '   :DIAS_ESTOCAGEM, :QTD_DEMANDA_DIA, :QTD_DEMANDA_ANO, '
      ':QTD_DIAS_ANO,'
      '   :DATAINCLUSAO, :ESTADO, :DATAALTERACAO)'
      '')
    DeleteSQL.Strings = (
      'delete from oc_comprar'
      'where'
      '  NUM_SEQ = :NUM_SEQ'
      '  and NUM_DOCUMENTO = :NUM_DOCUMENTO')
    Left = 1178
    Top = 363
  end
  object SDS_DemandasNovo: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'SELECT pr.codproduto, dem.dta_ref,'#13#10'CASE  WHEN dem.dta_ref = '#39'01' +
      '.04.2016'#39' THEN '#39'Dem1'#39' WHEN dem.dta_ref = '#39'01.03.2016'#39' THEN '#39'Dem2' +
      #39#13#10'      WHEN dem.dta_ref = '#39'01.02.2016'#39' THEN '#39'Dem3'#39' WHEN dem.dt' +
      'a_ref = '#39'01.01.2016'#39' THEN '#39'Dem4'#39#13#10'END Demanda,'#13#10'CASE  WHEN (CAST' +
      '(LPAD(EXTRACT(MONTH FROM dem.dta_ref),2,'#39'0'#39') AS VARCHAR(2))||'#39'/'#39 +
      '||'#13#10'             CAST(LPAD(EXTRACT(YEAR FROM dem.dta_ref),4,'#39'0'#39')' +
      ' AS VARCHAR(4)))='#13#10'             (CAST(LPAD(EXTRACT(MONTH FROM CU' +
      'RRENT_DATE),2,'#39'0'#39') AS VARCHAR(2))||'#39'/'#39'||'#13#10'             CAST(LPAD' +
      '(EXTRACT(YEAR FROM CURRENT_DATE),4,'#39'0'#39') AS VARCHAR(4))) THEN'#13#10'  ' +
      '      22'#13#10'      WHEN dem.dta_ref = '#39'01.04.2016'#39' THEN'#13#10'        25' +
      #13#10'      WHEN dem.dta_ref = '#39'01.03.2016'#39' THEN'#13#10'        26'#13#10'      ' +
      'WHEN dem.dta_ref = '#39'01.02.2016'#39' THEN'#13#10'        23'#13#10'      WHEN dem' +
      '.dta_ref = '#39'01.01.2016'#39' THEN'#13#10'        25'#13#10'END Num_Dias,'#13#10'SUM(COA' +
      'LESCE(Dem.quant_ref,0)) dem'#13#10#13#10'FROM MOVTOS_EMPRESAS Dem, PRODUTO' +
      ' pr'#13#10'WHERE dem.codproduto=pr.codproduto'#13#10'AND   Dem.ind_tipo='#39'DM'#39 +
      #13#10'AND   Dem.dta_ref IN ('#39'01.04.2016'#39', '#39'01.03.2016'#39', '#39'01.02.2016'#39 +
      ', '#39'01.01.2016'#39')'#13#10'AND COALESCE(pr.situacaopro,0)=0'#13#10'AND pr.princi' +
      'palfor IN ('#39'000636'#39')'#13#10'GROUP BY pr.codproduto, dem.dta_ref'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 256
    Top = 272
  end
  object DSP_DemandasNovo: TDataSetProvider
    DataSet = SDS_DemandasNovo
    Left = 298
    Top = 288
  end
  object CDS_DemandasNovo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_DemandasNovo'
    Left = 335
    Top = 269
    object CDS_DemandasNovoCODPRODUTO: TStringField
      FieldName = 'CODPRODUTO'
      Required = True
      FixedChar = True
      Size = 6
    end
    object CDS_DemandasNovoDTA_REF: TDateField
      FieldName = 'DTA_REF'
    end
    object CDS_DemandasNovoDEMANDA: TStringField
      FieldName = 'DEMANDA'
      FixedChar = True
      Size = 4
    end
    object CDS_DemandasNovoNUM_DIAS: TIntegerField
      FieldName = 'NUM_DIAS'
    end
    object CDS_DemandasNovoDEM: TFMTBCDField
      FieldName = 'DEM'
      Precision = 15
      Size = 2
    end
  end
  object SDS_UltCompraTransito: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 256
    Top = 344
  end
  object DSP_UltCompraTransito: TDataSetProvider
    DataSet = SDS_UltCompraTransito
    Left = 298
    Top = 360
  end
  object CDS_UltCompraTransito: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_UltCompraTransito'
    Left = 335
    Top = 341
  end
  object DSP_OCComparaPedidos: TDataSetProvider
    DataSet = SDS_OCComparaPedidos
    Left = 298
    Top = 555
  end
  object CDS_OCComparaPedidos: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'COD_LOJA'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'DES_LOJA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'PEDIDOS'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 9
      end
      item
        Name = 'COD_FORN'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'DES_FORNECEDOR'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TOTAL_PEDIDO'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_VENDA'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_BRUTO'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_DESCONTOS'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_IPI'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_DESPESAS'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_ST'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_FRETE'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_REPASSE'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'NUM_DOCTO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'TOTAL_ITENS'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'TOTAL_QTDS'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'TOTAL_ITENS_COMPRAR'
        DataType = ftFMTBcd
        Precision = 15
      end>
    IndexDefs = <>
    ObjectView = False
    Params = <>
    ProviderName = 'DSP_OCComparaPedidos'
    StoreDefs = True
    Left = 335
    Top = 539
    object CDS_OCComparaPedidosCOD_LOJA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Loja'
      FieldName = 'COD_LOJA'
      Size = 6
    end
    object CDS_OCComparaPedidosDES_LOJA: TStringField
      DisplayLabel = 'Raz'#227'o Social da Loja'
      FieldName = 'DES_LOJA'
      Size = 60
    end
    object CDS_OCComparaPedidosPEDIDOS: TStringField
      DisplayLabel = 'Pedidos'
      FieldName = 'PEDIDOS'
      Required = True
      FixedChar = True
      Size = 9
    end
    object CDS_OCComparaPedidosCOD_FORN: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Forn'
      FieldName = 'COD_FORN'
      Size = 6
    end
    object CDS_OCComparaPedidosDES_FORNECEDOR: TStringField
      DisplayLabel = 'Raz'#227'o Social Fornecedor'
      FieldName = 'DES_FORNECEDOR'
      Size = 40
    end
    object CDS_OCComparaPedidosTOTAL_PEDIDO: TFMTBCDField
      DisplayLabel = 'Vlr Tot Pedido'
      FieldName = 'TOTAL_PEDIDO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_OCComparaPedidosTOTAL_VENDA: TFMTBCDField
      DisplayLabel = 'Vlr Tot P'#231' Venda'
      FieldName = 'TOTAL_VENDA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_OCComparaPedidosTOTAL_BRUTO: TFMTBCDField
      DisplayLabel = 'Vlr Tot P'#231' Bruto'
      FieldName = 'TOTAL_BRUTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_OCComparaPedidosTOTAL_DESCONTOS: TFMTBCDField
      DisplayLabel = 'Vlr Tot Desc'
      FieldName = 'TOTAL_DESCONTOS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_OCComparaPedidosTOTAL_IPI: TFMTBCDField
      DisplayLabel = 'Vlr Tot IPI'
      FieldName = 'TOTAL_IPI'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_OCComparaPedidosTOTAL_DESPESAS: TFMTBCDField
      DisplayLabel = 'Vlr Tot Desp'
      FieldName = 'TOTAL_DESPESAS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_OCComparaPedidosTOTAL_ST: TFMTBCDField
      DisplayLabel = 'Vlr Tot ST'
      FieldName = 'TOTAL_ST'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_OCComparaPedidosTOTAL_FRETE: TFMTBCDField
      DisplayLabel = 'Vlr Tot Frete'
      FieldName = 'TOTAL_FRETE'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_OCComparaPedidosTOTAL_ICMS: TFMTBCDField
      DisplayLabel = 'Vlr Tot ICMS'
      FieldName = 'TOTAL_ICMS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_OCComparaPedidosTOTAL_REPASSE: TFMTBCDField
      DisplayLabel = 'Vlr Tot Repasse'
      FieldName = 'TOTAL_REPASSE'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_OCComparaPedidosNUM_DOCTO: TIntegerField
      DisplayLabel = 'N'#186' Docto'
      FieldName = 'NUM_DOCTO'
      Required = True
      DisplayFormat = '0,'
    end
    object CDS_OCComparaPedidosTOTAL_ITENS: TIntegerField
      DisplayLabel = 'Total de Itens'
      FieldName = 'TOTAL_ITENS'
      Required = True
      DisplayFormat = '0,.00'
    end
    object CDS_OCComparaPedidosTOTAL_QTDS: TFMTBCDField
      DisplayLabel = 'Total Qtds'
      FieldName = 'TOTAL_QTDS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_OCComparaPedidosTOTAL_ITENS_COMPRAR: TFMTBCDField
      DisplayLabel = 'Total Itens a Comprar'
      FieldName = 'TOTAL_ITENS_COMPRAR'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 0
    end
  end
  object DS_OCComparaPedidos: TDataSource
    DataSet = CDS_OCComparaPedidos
    Left = 373
    Top = 556
  end
  object SDS_OCComparaPedidos: TSQLDataSet
    ObjectView = True
    CommandText = 
      'SELECT '#13#10'oc.cod_empresa Cod_Loja,'#13#10'oc.des_empresa Des_Loja,'#13#10#39'A ' +
      'COMPRAR'#39' Pedidos,'#13#10'oc.cod_fornecedor Cod_Forn,'#13#10'oc.des_fornecedo' +
      'r Des_Fornecedor,'#13#10#13#10'ROUND(CAST(SUM(COALESCE(oc.vlr_tot_compra,0' +
      ')) AS NUMERIC(12,2)),2) Total_Pedido,'#13#10'ROUND(CAST(SUM(COALESCE(o' +
      'c.vlr_tot_venda,0)) AS NUMERIC(12,2)),2) Total_Venda,'#13#10#13#10'ROUND(C' +
      'AST(SUM(COALESCE(oc.vlr_bruto,0)) AS NUMERIC(12,2)),2) Total_Bru' +
      'to,'#13#10'ROUND(CAST(SUM(COALESCE(oc.vlr_descontos,0)) AS NUMERIC(12,' +
      '2)),2) Total_Descontos,'#13#10'ROUND(CAST(SUM(COALESCE(oc.vlr_ipi,0)) ' +
      'AS NUMERIC(12,2)),2) Total_IPI,'#13#10'ROUND(CAST(SUM(COALESCE(oc.vlr_' +
      'despesas,0)) AS NUMERIC(12,2)),2) Total_Despesas,'#13#10'ROUND(CAST(SU' +
      'M(COALESCE(oc.vlr_st,0)) AS NUMERIC(12,2)),2) Total_ST,'#13#10'ROUND(C' +
      'AST(SUM(COALESCE(oc.vlr_frete,0)) AS NUMERIC(12,2)),2) Total_Fre' +
      'te,'#13#10'ROUND(CAST(SUM(COALESCE(oc.vlr_icms,0)) AS NUMERIC(12,2)),2' +
      ') Total_ICMS,'#13#10'ROUND(CAST(SUM(COALESCE(oc.vlr_repasse,0)) AS NUM' +
      'ERIC(12,2)),2) Total_Repasse,'#13#10#13#10'oc.num_documento Num_Docto,'#13#10#13#10 +
      'COUNT(oc.cod_item) Total_Itens,'#13#10'ROUND(CAST(SUM(COALESCE(oc.qtd_' +
      'acomprar,0)) AS NUMERIC(12,2)),2) Total_Qtds,'#13#10#13#10'SUM('#13#10'CASE'#13#10'   ' +
      'WHEN oc.QTD_ACOMPRAR>0 THEN'#13#10'   1'#13#10'   ELSE'#13#10'   0'#13#10'END) Total_Ite' +
      'ns_Comprar'#13#10#13#10'FROM oc_comprar oc'#13#10#13#10'WHERE oc.num_documento=:NumD' +
      'oc'#13#10'AND   oc.qtd_transf=0'#13#10'AND   oc.ind_oc_gerada='#39'N'#39#13#10'GROUP BY ' +
      '1, 2, 4,  5, 16'#13#10#13#10'UNION -----------------------'#13#10#13#10'SELECT'#13#10'mc.c' +
      'od_empresa Cod_Loja,'#13#10'mc.des_empresa Des_Loja,'#13#10#39'MESES'#39' Pedidos,' +
      #13#10'mc.cod_fornecedor Cod_Forn,'#13#10'mc.des_fornecedor Des_Fornecedor,' +
      #13#10#13#10'ROUND(CAST(SUM('#13#10'(COALESCE(mc.qtd_sugerida,0)*COALESCE(mc.vl' +
      'r_uni_compra,0))-((COALESCE(mc.qtd_sugerida,0)*COALESCE(mc.vlr_u' +
      'ni_compra,0))*(COALESCE(mc.per_desconto,0)/100))'#13#10'              ' +
      '      +'#13#10'                    (CAST((((COALESCE(mc.qtd_sugerida,0' +
      ')*COALESCE(mc.vlr_uni_compra,0))-((COALESCE(mc.qtd_sugerida,0)*C' +
      'OALESCE(mc.vlr_uni_compra,0))*(COALESCE(mc.per_desconto,0)/100))' +
      #13#10'                    +'#13#10'                    (CAST((((COALESCE(m' +
      'c.qtd_sugerida,0)*COALESCE(mc.vlr_uni_compra,0))-((COALESCE(mc.q' +
      'td_sugerida,0)*COALESCE(mc.vlr_uni_compra,0))*(COALESCE(mc.per_d' +
      'esconto,0)/100))'#13#10'                    *'#13#10'                    COA' +
      'LESCE(mc.PER_MARGEM_ST,0))/100) AS NUMERIC(12,2)))'#13#10'            ' +
      '        *'#13#10'                    COALESCE(PER_ST,0))/100) AS NUMER' +
      'IC(12,2))'#13#10'                    -'#13#10'                    CAST((((CO' +
      'ALESCE(mc.qtd_sugerida,0)*COALESCE(mc.vlr_uni_compra,0))-((COALE' +
      'SCE(mc.qtd_sugerida,0)*COALESCE(mc.vlr_uni_compra,0))*(COALESCE(' +
      'mc.per_desconto,0)/100))'#13#10'                    *'#13#10'               ' +
      '     COALESCE(mc.per_icms,0))/100) AS NUMERIC(12,2)))'#13#10'         ' +
      '           +'#13#10'                    (CAST((((COALESCE(mc.qtd_suger' +
      'ida,0)*COALESCE(mc.vlr_uni_compra,0))-((COALESCE(mc.qtd_sugerida' +
      ',0)*COALESCE(mc.vlr_uni_compra,0))*(COALESCE(mc.per_desconto,0)/' +
      '100))'#13#10'                    *'#13#10'                    COALESCE(mc.pe' +
      'r_ipi, 0))/100) AS NUMERIC(12,2)))'#13#10') AS NUMERIC(12,2)),2) Total' +
      '_Pedido,'#13#10#13#10'ROUND(CAST(SUM('#13#10'(COALESCE(mc.qtd_sugerida,0)'#13#10'     ' +
      '               *'#13#10'                    COALESCE(mc.VLR_UNI_VENDA,' +
      '0))'#13#10') AS NUMERIC(12,2)),2) Total_Venda,'#13#10#13#10'ROUND(CAST(SUM('#13#10'(CO' +
      'ALESCE(mc.qtd_sugerida,0)*COALESCE(mc.vlr_uni_compra,0))-((COALE' +
      'SCE(mc.qtd_sugerida,0)*COALESCE(mc.vlr_uni_compra,0))*(COALESCE(' +
      'mc.per_desconto,0)/100))'#13#10') AS NUMERIC(12,2)),2) Total_Bruto,'#13#10#13 +
      #10'ROUND(CAST(SUM('#13#10'((COALESCE(mc.qtd_sugerida,0)*COALESCE(mc.vlr_' +
      'uni_compra,0))*(COALESCE(mc.per_desconto,0)/100))'#13#10') AS NUMERIC(' +
      '12,2)),2) Total_Descontos,'#13#10#13#10'ROUND(CAST(SUM('#13#10'(CAST((((COALESCE' +
      '(mc.qtd_sugerida,0)*COALESCE(mc.vlr_uni_compra,0))-((COALESCE(mc' +
      '.qtd_sugerida,0)*COALESCE(mc.vlr_uni_compra,0))*(COALESCE(mc.per' +
      '_desconto,0)/100))'#13#10'                    *'#13#10'                    C' +
      'OALESCE(mc.per_ipi, 0))/100) AS NUMERIC(12,2)))'#13#10') AS NUMERIC(12' +
      ',2)),2) Total_IPI,'#13#10#13#10'ROUND(CAST(SUM('#13#10'COALESCE(mc.vlr_despesas,' +
      '0)'#13#10') AS NUMERIC(12,2)),2) Total_Despesas,'#13#10#13#10'ROUND(CAST(SUM('#13#10'(' +
      'CAST((((COALESCE(mc.qtd_sugerida,0)*COALESCE(mc.vlr_uni_compra,0' +
      '))-((COALESCE(mc.qtd_sugerida,0)*COALESCE(mc.vlr_uni_compra,0))*' +
      '(COALESCE(mc.per_desconto,0)/100))'#13#10'                    +'#13#10'     ' +
      '               (CAST((((COALESCE(mc.qtd_sugerida,0)*COALESCE(mc.' +
      'vlr_uni_compra,0))-((COALESCE(mc.qtd_sugerida,0)*COALESCE(mc.vlr' +
      '_uni_compra,0))*(COALESCE(mc.per_desconto,0)/100))'#13#10'            ' +
      '        *'#13#10'                    COALESCE(mc.PER_MARGEM_ST,0))/100' +
      ') AS NUMERIC(12,2)))'#13#10'                    *'#13#10'                   ' +
      ' COALESCE(PER_ST,0))/100) AS NUMERIC(12,2))'#13#10'                   ' +
      ' -'#13#10'                    CAST((((COALESCE(mc.qtd_sugerida,0)*COAL' +
      'ESCE(mc.vlr_uni_compra,0))-((COALESCE(mc.qtd_sugerida,0)*COALESC' +
      'E(mc.vlr_uni_compra,0))*(COALESCE(mc.per_desconto,0)/100))'#13#10'    ' +
      '                *'#13#10'                    COALESCE(mc.per_icms,0))/' +
      '100) AS NUMERIC(12,2)))'#13#10') AS NUMERIC(12,2)),2) Total_ST,'#13#10#13#10'ROU' +
      'ND(CAST(SUM('#13#10'COALESCE(mc.vlr_frete,0)'#13#10') AS NUMERIC(12,2)),2) T' +
      'otal_Frete,'#13#10#13#10'ROUND(CAST(SUM('#13#10'CAST((((COALESCE(mc.qtd_sugerida' +
      ',0)*COALESCE(mc.vlr_uni_compra,0))-((COALESCE(mc.qtd_sugerida,0)' +
      '*COALESCE(mc.vlr_uni_compra,0))*(COALESCE(mc.per_desconto,0)/100' +
      '))'#13#10'                    *'#13#10'                    COALESCE(mc.per_i' +
      'cms,0))/100) AS NUMERIC(12,2))'#13#10') AS NUMERIC(12,2)),2) Total_ICM' +
      'S,'#13#10#13#10'ROUND(CAST(SUM('#13#10'COALESCE(mc.vlr_repasse,0)'#13#10') AS NUMERIC(' +
      '12,2)),2) Total_Repasse,'#13#10#13#10'mc.num_documento Num_Docto,'#13#10#13#10'COUNT' +
      '(mc.cod_item) Total_Itens,'#13#10#13#10'ROUND(CAST(SUM('#13#10'COALESCE(mc.qtd_s' +
      'ugerida,0)'#13#10') AS NUMERIC(12,2)),2) Total_Qtds,'#13#10#13#10'SUM('#13#10'CASE'#13#10'  ' +
      ' WHEN COALESCE(mc.qtd_sugerida,0)>0 THEN'#13#10'   1'#13#10'   ELSE'#13#10'   0'#13#10'E' +
      'ND) Total_Itens_Comprar'#13#10#13#10'FROM oc_comprar mc'#13#10#13#10'WHERE mc.num_do' +
      'cumento=:NumDoc'#13#10'AND   mc.qtd_transf=0'#13#10'AND   mc.ind_oc_gerada='#39 +
      'N'#39#13#10'GROUP BY 1, 2, 4,  5, 16'#13#10#13#10'UNION -------------------------'#13 +
      #10#13#10'SELECT'#13#10'ac.cod_empresa Cod_Loja,'#13#10'ac.des_empresa Des_Loja,'#13#10#39 +
      'ANO'#39' Pedidos,'#13#10'ac.cod_fornecedor Cod_Forn,'#13#10'ac.des_fornecedor De' +
      's_Fornecedor,'#13#10#13#10'ROUND(CAST(SUM('#13#10'(COALESCE(ac.qtd_sugerida_ano,' +
      '0)*COALESCE(ac.vlr_uni_compra,0))-((COALESCE(ac.qtd_sugerida_ano' +
      ',0)*COALESCE(ac.vlr_uni_compra,0))*(COALESCE(ac.per_desconto,0)/' +
      '100))'#13#10'                    +'#13#10'                    (CAST((((COALE' +
      'SCE(ac.qtd_sugerida_ano,0)*COALESCE(ac.vlr_uni_compra,0))-((COAL' +
      'ESCE(ac.qtd_sugerida_ano,0)*COALESCE(ac.vlr_uni_compra,0))*(COAL' +
      'ESCE(ac.per_desconto,0)/100))'#13#10'                    +'#13#10'          ' +
      '          (CAST((((COALESCE(ac.qtd_sugerida_ano,0)*COALESCE(ac.v' +
      'lr_uni_compra,0))-((COALESCE(ac.qtd_sugerida_ano,0)*COALESCE(ac.' +
      'vlr_uni_compra,0))*(COALESCE(ac.per_desconto,0)/100))'#13#10'         ' +
      '           *'#13#10'                    COALESCE(ac.PER_MARGEM_ST,0))/' +
      '100) AS NUMERIC(12,2)))'#13#10'                    *'#13#10'                ' +
      '    COALESCE(PER_ST,0))/100) AS NUMERIC(12,2))'#13#10'                ' +
      '    -'#13#10'                    CAST((((COALESCE(ac.qtd_sugerida_ano,' +
      '0)*COALESCE(ac.vlr_uni_compra,0))-((COALESCE(ac.qtd_sugerida_ano' +
      ',0)*COALESCE(ac.vlr_uni_compra,0))*(COALESCE(ac.per_desconto,0)/' +
      '100))'#13#10'                    *'#13#10'                    COALESCE(ac.pe' +
      'r_icms,0))/100) AS NUMERIC(12,2)))'#13#10'                    +'#13#10'     ' +
      '               (CAST((((COALESCE(ac.qtd_sugerida_ano,0)*COALESCE' +
      '(ac.vlr_uni_compra,0))-((COALESCE(ac.qtd_sugerida_ano,0)*COALESC' +
      'E(ac.vlr_uni_compra,0))*(COALESCE(ac.per_desconto,0)/100))'#13#10'    ' +
      '                *'#13#10'                    COALESCE(ac.per_ipi, 0))/' +
      '100) AS NUMERIC(12,2)))'#13#10') AS NUMERIC(12,2)),2) Total_Pedido,'#13#10#13 +
      #10'ROUND(CAST(SUM('#13#10'(COALESCE(ac.qtd_sugerida_ano,0)'#13#10'            ' +
      '        *'#13#10'                    COALESCE(ac.VLR_UNI_VENDA,0))'#13#10') ' +
      'AS NUMERIC(12,2)),2) Total_Venda,'#13#10#13#10'ROUND(CAST(SUM('#13#10'(COALESCE(' +
      'ac.qtd_sugerida_ano,0)*COALESCE(ac.vlr_uni_compra,0))-((COALESCE' +
      '(ac.qtd_sugerida_ano,0)*COALESCE(ac.vlr_uni_compra,0))*(COALESCE' +
      '(ac.per_desconto,0)/100))'#13#10') AS NUMERIC(12,2)),2) Total_Bruto,'#13#10 +
      #13#10'ROUND(CAST(SUM('#13#10'((COALESCE(ac.qtd_sugerida_ano,0)*COALESCE(ac' +
      '.vlr_uni_compra,0))*(COALESCE(ac.per_desconto,0)/100))'#13#10') AS NUM' +
      'ERIC(12,2)),2) Total_Descontos,'#13#10#13#10'ROUND(CAST(SUM('#13#10'(CAST((((COA' +
      'LESCE(ac.qtd_sugerida_ano,0)*COALESCE(ac.vlr_uni_compra,0))-((CO' +
      'ALESCE(ac.qtd_sugerida_ano,0)*COALESCE(ac.vlr_uni_compra,0))*(CO' +
      'ALESCE(ac.per_desconto,0)/100))'#13#10'                    *'#13#10'        ' +
      '            COALESCE(ac.per_ipi, 0))/100) AS NUMERIC(12,2)))'#13#10') ' +
      'AS NUMERIC(12,2)),2) Total_IPI,'#13#10#13#10'ROUND(CAST(SUM('#13#10'COALESCE(ac.' +
      'vlr_despesas,0)'#13#10') AS NUMERIC(12,2)),2) Total_Despesas,'#13#10#13#10'ROUND' +
      '(CAST(SUM('#13#10'(CAST((((COALESCE(ac.qtd_sugerida_ano,0)*COALESCE(ac' +
      '.vlr_uni_compra,0))-((COALESCE(ac.qtd_sugerida_ano,0)*COALESCE(a' +
      'c.vlr_uni_compra,0))*(COALESCE(ac.per_desconto,0)/100))'#13#10'       ' +
      '             +'#13#10'                    (CAST((((COALESCE(ac.qtd_sug' +
      'erida_ano,0)*COALESCE(ac.vlr_uni_compra,0))-((COALESCE(ac.qtd_su' +
      'gerida_ano,0)*COALESCE(ac.vlr_uni_compra,0))*(COALESCE(ac.per_de' +
      'sconto,0)/100))'#13#10'                    *'#13#10'                    COAL' +
      'ESCE(ac.PER_MARGEM_ST,0))/100) AS NUMERIC(12,2)))'#13#10'             ' +
      '       *'#13#10'                    COALESCE(PER_ST,0))/100) AS NUMERI' +
      'C(12,2))'#13#10'                    -'#13#10'                    CAST((((COA' +
      'LESCE(ac.qtd_sugerida_ano,0)*COALESCE(ac.vlr_uni_compra,0))-((CO' +
      'ALESCE(ac.qtd_sugerida_ano,0)*COALESCE(ac.vlr_uni_compra,0))*(CO' +
      'ALESCE(ac.per_desconto,0)/100))'#13#10'                    *'#13#10'        ' +
      '            COALESCE(ac.per_icms,0))/100) AS NUMERIC(12,2)))'#13#10') ' +
      'AS NUMERIC(12,2)),2) Total_ST,'#13#10#13#10'ROUND(CAST(SUM('#13#10'COALESCE(ac.v' +
      'lr_frete,0)'#13#10') AS NUMERIC(12,2)),2) Total_Frete,'#13#10#13#10'ROUND(CAST(S' +
      'UM('#13#10'CAST((((COALESCE(ac.qtd_sugerida_ano,0)*COALESCE(ac.vlr_uni' +
      '_compra,0))-((COALESCE(ac.qtd_sugerida_ano,0)*COALESCE(ac.vlr_un' +
      'i_compra,0))*(COALESCE(ac.per_desconto,0)/100))'#13#10'               ' +
      '     *'#13#10'                    COALESCE(ac.per_icms,0))/100) AS NUM' +
      'ERIC(12,2))'#13#10') AS NUMERIC(12,2)),2) Total_ICMS,'#13#10#13#10'ROUND(CAST(SU' +
      'M('#13#10'COALESCE(ac.vlr_repasse,0)'#13#10') AS NUMERIC(12,2)),2) Total_Rep' +
      'asse,'#13#10#13#10'ac.num_documento Num_Docto,'#13#10#13#10'COUNT(ac.cod_item) Total' +
      '_Itens,'#13#10#13#10'ROUND(CAST(SUM(                                      ' +
      '      '#13#10'COALESCE(ac.qtd_sugerida_ano,0)'#13#10') AS NUMERIC(12,2)),2) ' +
      'Total_Qtds,'#13#10#13#10'SUM('#13#10'CASE'#13#10'   WHEN COALESCE(ac.qtd_sugerida_ano,' +
      '0)>0 THEN'#13#10'   1'#13#10'   ELSE'#13#10'   0'#13#10'END) Total_Itens_Comprar'#13#10#13#10'FROM' +
      ' oc_comprar ac'#13#10#13#10'WHERE ac.num_documento=:NumDoc'#13#10'AND   ac.qtd_t' +
      'ransf=0'#13#10'AND   ac.ind_oc_gerada='#39'N'#39#13#10'GROUP BY 1, 2, 4,  5, 16'#13#10#13 +
      #10'UNION -------------------------'#13#10#13#10'SELECT '#13#10#39'XX'#39' Cod_Loja,'#13#10#39'TO' +
      'TAL GERAL'#39' Des_Loja,'#13#10#39'A COMPRAR'#39' Pedidos,'#13#10#39#39' Cod_Forn,'#13#10#39#39' Des' +
      '_Fornecedor,'#13#10#13#10'ROUND(CAST(SUM(COALESCE(oc.vlr_tot_compra,0)) AS' +
      ' NUMERIC(12,2)),2) Total_Pedido,'#13#10'ROUND(CAST(SUM(COALESCE(oc.vlr' +
      '_tot_venda,0)) AS NUMERIC(12,2)),2) Total_Venda,'#13#10#13#10'ROUND(CAST(S' +
      'UM(COALESCE(oc.vlr_bruto,0)) AS NUMERIC(12,2)),2) Total_Bruto,'#13#10 +
      'ROUND(CAST(SUM(COALESCE(oc.vlr_descontos,0)) AS NUMERIC(12,2)),2' +
      ') Total_Descontos,'#13#10'ROUND(CAST(SUM(COALESCE(oc.vlr_ipi,0)) AS NU' +
      'MERIC(12,2)),2) Total_IPI,'#13#10'ROUND(CAST(SUM(COALESCE(oc.vlr_despe' +
      'sas,0)) AS NUMERIC(12,2)),2) Total_Despesas,'#13#10'ROUND(CAST(SUM(COA' +
      'LESCE(oc.vlr_st,0)) AS NUMERIC(12,2)),2) Total_ST,'#13#10'ROUND(CAST(S' +
      'UM(COALESCE(oc.vlr_frete,0)) AS NUMERIC(12,2)),2) Total_Frete,'#13#10 +
      'ROUND(CAST(SUM(COALESCE(oc.vlr_icms,0)) AS NUMERIC(12,2)),2) Tot' +
      'al_ICMS,'#13#10'ROUND(CAST(SUM(COALESCE(oc.vlr_repasse,0)) AS NUMERIC(' +
      '12,2)),2) Total_Repasse,'#13#10#13#10'oc.num_documento Num_Docto,'#13#10#13#10'COUNT' +
      '(oc.cod_item) Total_Itens,'#13#10'ROUND(CAST(SUM(COALESCE(oc.qtd_acomp' +
      'rar,0)) AS NUMERIC(12,2)),2) Total_Qtds,'#13#10#13#10'SUM('#13#10'CASE'#13#10'   WHEN ' +
      'oc.QTD_ACOMPRAR>0 THEN'#13#10'   1'#13#10'   ELSE'#13#10'   0'#13#10'END) Total_Itens_Co' +
      'mprar'#13#10#13#10'FROM oc_comprar oc'#13#10#13#10'WHERE oc.num_documento=:NumDoc'#13#10'A' +
      'ND   oc.qtd_transf=0'#13#10'AND   oc.ind_oc_gerada='#39'N'#39#13#10'GROUP BY 16'#13#10#13 +
      #10'UNION -----------------------'#13#10#13#10'SELECT'#13#10#39'XX'#39' Cod_Loja,'#13#10#39'TOTAL' +
      ' GERAL'#39' Des_Loja,'#13#10#39'MESES'#39' Pedidos,'#13#10#39#39' Cod_Forn,'#13#10#39#39' Des_Fornec' +
      'edor,'#13#10#13#10'ROUND(CAST(SUM('#13#10'(COALESCE(mc.qtd_sugerida,0)*COALESCE(' +
      'mc.vlr_uni_compra,0))-((COALESCE(mc.qtd_sugerida,0)*COALESCE(mc.' +
      'vlr_uni_compra,0))*(COALESCE(mc.per_desconto,0)/100))'#13#10'         ' +
      '           +'#13#10'                    (CAST((((COALESCE(mc.qtd_suger' +
      'ida,0)*COALESCE(mc.vlr_uni_compra,0))-((COALESCE(mc.qtd_sugerida' +
      ',0)*COALESCE(mc.vlr_uni_compra,0))*(COALESCE(mc.per_desconto,0)/' +
      '100))'#13#10'                    +'#13#10'                    (CAST((((COALE' +
      'SCE(mc.qtd_sugerida,0)*COALESCE(mc.vlr_uni_compra,0))-((COALESCE' +
      '(mc.qtd_sugerida,0)*COALESCE(mc.vlr_uni_compra,0))*(COALESCE(mc.' +
      'per_desconto,0)/100))'#13#10'                    *'#13#10'                  ' +
      '  COALESCE(mc.PER_MARGEM_ST,0))/100) AS NUMERIC(12,2)))'#13#10'       ' +
      '             *'#13#10'                    COALESCE(PER_ST,0))/100) AS ' +
      'NUMERIC(12,2))'#13#10'                    -'#13#10'                    CAST(' +
      '(((COALESCE(mc.qtd_sugerida,0)*COALESCE(mc.vlr_uni_compra,0))-((' +
      'COALESCE(mc.qtd_sugerida,0)*COALESCE(mc.vlr_uni_compra,0))*(COAL' +
      'ESCE(mc.per_desconto,0)/100))'#13#10'                    *'#13#10'          ' +
      '          COALESCE(mc.per_icms,0))/100) AS NUMERIC(12,2)))'#13#10'    ' +
      '                +'#13#10'                    (CAST((((COALESCE(mc.qtd_' +
      'sugerida,0)*COALESCE(mc.vlr_uni_compra,0))-((COALESCE(mc.qtd_sug' +
      'erida,0)*COALESCE(mc.vlr_uni_compra,0))*(COALESCE(mc.per_descont' +
      'o,0)/100))'#13#10'                    *'#13#10'                    COALESCE(' +
      'mc.per_ipi, 0))/100) AS NUMERIC(12,2)))'#13#10') AS NUMERIC(12,2)),2) ' +
      'Total_Pedido,'#13#10#13#10'ROUND(CAST(SUM('#13#10'(COALESCE(mc.qtd_sugerida,0)'#13#10 +
      '                    *'#13#10'                    COALESCE(mc.VLR_UNI_V' +
      'ENDA,0))'#13#10') AS NUMERIC(12,2)),2) Total_Venda,'#13#10#13#10'ROUND(CAST(SUM(' +
      #13#10'(COALESCE(mc.qtd_sugerida,0)*COALESCE(mc.vlr_uni_compra,0))-((' +
      'COALESCE(mc.qtd_sugerida,0)*COALESCE(mc.vlr_uni_compra,0))*(COAL' +
      'ESCE(mc.per_desconto,0)/100))'#13#10') AS NUMERIC(12,2)),2) Total_Brut' +
      'o,'#13#10#13#10'ROUND(CAST(SUM('#13#10'((COALESCE(mc.qtd_sugerida,0)*COALESCE(mc' +
      '.vlr_uni_compra,0))*(COALESCE(mc.per_desconto,0)/100))'#13#10') AS NUM' +
      'ERIC(12,2)),2) Total_Descontos,'#13#10#13#10'ROUND(CAST(SUM('#13#10'(CAST((((COA' +
      'LESCE(mc.qtd_sugerida,0)*COALESCE(mc.vlr_uni_compra,0))-((COALES' +
      'CE(mc.qtd_sugerida,0)*COALESCE(mc.vlr_uni_compra,0))*(COALESCE(m' +
      'c.per_desconto,0)/100))'#13#10'                    *'#13#10'                ' +
      '    COALESCE(mc.per_ipi, 0))/100) AS NUMERIC(12,2)))'#13#10') AS NUMER' +
      'IC(12,2)),2) Total_IPI,'#13#10#13#10'ROUND(CAST(SUM('#13#10'COALESCE(mc.vlr_desp' +
      'esas,0)'#13#10') AS NUMERIC(12,2)),2) Total_Despesas,'#13#10#13#10'ROUND(CAST(SU' +
      'M('#13#10'(CAST((((COALESCE(mc.qtd_sugerida,0)*COALESCE(mc.vlr_uni_com' +
      'pra,0))-((COALESCE(mc.qtd_sugerida,0)*COALESCE(mc.vlr_uni_compra' +
      ',0))*(COALESCE(mc.per_desconto,0)/100))'#13#10'                    +'#13#10 +
      '                    (CAST((((COALESCE(mc.qtd_sugerida,0)*COALESC' +
      'E(mc.vlr_uni_compra,0))-((COALESCE(mc.qtd_sugerida,0)*COALESCE(m' +
      'c.vlr_uni_compra,0))*(COALESCE(mc.per_desconto,0)/100))'#13#10'       ' +
      '             *'#13#10'                    COALESCE(mc.PER_MARGEM_ST,0)' +
      ')/100) AS NUMERIC(12,2)))'#13#10'                    *'#13#10'              ' +
      '      COALESCE(PER_ST,0))/100) AS NUMERIC(12,2))'#13#10'              ' +
      '      -'#13#10'                    CAST((((COALESCE(mc.qtd_sugerida,0)' +
      '*COALESCE(mc.vlr_uni_compra,0))-((COALESCE(mc.qtd_sugerida,0)*CO' +
      'ALESCE(mc.vlr_uni_compra,0))*(COALESCE(mc.per_desconto,0)/100))'#13 +
      #10'                    *'#13#10'                    COALESCE(mc.per_icms' +
      ',0))/100) AS NUMERIC(12,2)))'#13#10') AS NUMERIC(12,2)),2) Total_ST,'#13#10 +
      #13#10'ROUND(CAST(SUM('#13#10'COALESCE(mc.vlr_frete,0)'#13#10') AS NUMERIC(12,2))' +
      ',2) Total_Frete,'#13#10#13#10'ROUND(CAST(SUM('#13#10'CAST((((COALESCE(mc.qtd_sug' +
      'erida,0)*COALESCE(mc.vlr_uni_compra,0))-((COALESCE(mc.qtd_sugeri' +
      'da,0)*COALESCE(mc.vlr_uni_compra,0))*(COALESCE(mc.per_desconto,0' +
      ')/100))'#13#10'                    *'#13#10'                    COALESCE(mc.' +
      'per_icms,0))/100) AS NUMERIC(12,2))'#13#10') AS NUMERIC(12,2)),2) Tota' +
      'l_ICMS,'#13#10#13#10'ROUND(CAST(SUM('#13#10'COALESCE(mc.vlr_repasse,0)'#13#10') AS NUM' +
      'ERIC(12,2)),2) Total_Repasse,'#13#10#13#10'mc.num_documento Num_Docto,'#13#10#13#10 +
      'COUNT(mc.cod_item) Total_Itens,'#13#10#13#10'ROUND(CAST(SUM('#13#10'COALESCE(mc.' +
      'qtd_sugerida,0)'#13#10') AS NUMERIC(12,2)),2) Total_Qtds,'#13#10#13#10'SUM('#13#10'CAS' +
      'E'#13#10'   WHEN COALESCE(mc.qtd_sugerida,0)>0 THEN'#13#10'   1'#13#10'   ELSE'#13#10'  ' +
      ' 0'#13#10'END) Total_Itens_Comprar'#13#10#13#10'FROM oc_comprar mc'#13#10#13#10'WHERE mc.n' +
      'um_documento=:NumDoc'#13#10'AND   mc.qtd_transf=0'#13#10'AND   mc.ind_oc_ger' +
      'ada='#39'N'#39#13#10'GROUP BY 16'#13#10#13#10'UNION -------------------------'#13#10#13#10'SELEC' +
      'T'#13#10#39'XX'#39' Cod_Loja,'#13#10#39'TOTAL GERAL'#39' Des_Loja,'#13#10#39'ANO'#39' Pedidos,'#13#10#39#39' C' +
      'od_Forn,'#13#10#39#39' Des_Fornecedor,'#13#10#13#10'ROUND(CAST(SUM('#13#10'(COALESCE(ac.qt' +
      'd_sugerida_ano,0)*COALESCE(ac.vlr_uni_compra,0))-((COALESCE(ac.q' +
      'td_sugerida_ano,0)*COALESCE(ac.vlr_uni_compra,0))*(COALESCE(ac.p' +
      'er_desconto,0)/100))'#13#10'                    +'#13#10'                   ' +
      ' (CAST((((COALESCE(ac.qtd_sugerida_ano,0)*COALESCE(ac.vlr_uni_co' +
      'mpra,0))-((COALESCE(ac.qtd_sugerida_ano,0)*COALESCE(ac.vlr_uni_c' +
      'ompra,0))*(COALESCE(ac.per_desconto,0)/100))'#13#10'                  ' +
      '  +'#13#10'                    (CAST((((COALESCE(ac.qtd_sugerida_ano,0' +
      ')*COALESCE(ac.vlr_uni_compra,0))-((COALESCE(ac.qtd_sugerida_ano,' +
      '0)*COALESCE(ac.vlr_uni_compra,0))*(COALESCE(ac.per_desconto,0)/1' +
      '00))'#13#10'                    *'#13#10'                    COALESCE(ac.PER' +
      '_MARGEM_ST,0))/100) AS NUMERIC(12,2)))'#13#10'                    *'#13#10' ' +
      '                   COALESCE(PER_ST,0))/100) AS NUMERIC(12,2))'#13#10' ' +
      '                   -'#13#10'                    CAST((((COALESCE(ac.qt' +
      'd_sugerida_ano,0)*COALESCE(ac.vlr_uni_compra,0))-((COALESCE(ac.q' +
      'td_sugerida_ano,0)*COALESCE(ac.vlr_uni_compra,0))*(COALESCE(ac.p' +
      'er_desconto,0)/100))'#13#10'                    *'#13#10'                   ' +
      ' COALESCE(ac.per_icms,0))/100) AS NUMERIC(12,2)))'#13#10'             ' +
      '       +'#13#10'                    (CAST((((COALESCE(ac.qtd_sugerida_' +
      'ano,0)*COALESCE(ac.vlr_uni_compra,0))-((COALESCE(ac.qtd_sugerida' +
      '_ano,0)*COALESCE(ac.vlr_uni_compra,0))*(COALESCE(ac.per_desconto' +
      ',0)/100))'#13#10'                    *'#13#10'                    COALESCE(a' +
      'c.per_ipi, 0))/100) AS NUMERIC(12,2)))'#13#10') AS NUMERIC(12,2)),2) T' +
      'otal_Pedido,'#13#10#13#10'ROUND(CAST(SUM('#13#10'(COALESCE(ac.qtd_sugerida_ano,0' +
      ')'#13#10'                    *'#13#10'                    COALESCE(ac.VLR_UN' +
      'I_VENDA,0))'#13#10') AS NUMERIC(12,2)),2) Total_Venda,'#13#10#13#10'ROUND(CAST(S' +
      'UM('#13#10'(COALESCE(ac.qtd_sugerida_ano,0)*COALESCE(ac.vlr_uni_compra' +
      ',0))-((COALESCE(ac.qtd_sugerida_ano,0)*COALESCE(ac.vlr_uni_compr' +
      'a,0))*(COALESCE(ac.per_desconto,0)/100))'#13#10') AS NUMERIC(12,2)),2)' +
      ' Total_Bruto,'#13#10#13#10'ROUND(CAST(SUM('#13#10'((COALESCE(ac.qtd_sugerida_ano' +
      ',0)*COALESCE(ac.vlr_uni_compra,0))*(COALESCE(ac.per_desconto,0)/' +
      '100))'#13#10') AS NUMERIC(12,2)),2) Total_Descontos,'#13#10#13#10'ROUND(CAST(SUM' +
      '('#13#10'(CAST((((COALESCE(ac.qtd_sugerida_ano,0)*COALESCE(ac.vlr_uni_' +
      'compra,0))-((COALESCE(ac.qtd_sugerida_ano,0)*COALESCE(ac.vlr_uni' +
      '_compra,0))*(COALESCE(ac.per_desconto,0)/100))'#13#10'                ' +
      '    *'#13#10'                    COALESCE(ac.per_ipi, 0))/100) AS NUME' +
      'RIC(12,2)))'#13#10') AS NUMERIC(12,2)),2) Total_IPI,'#13#10#13#10'ROUND(CAST(SUM' +
      '('#13#10'COALESCE(ac.vlr_despesas,0)'#13#10') AS NUMERIC(12,2)),2) Total_Des' +
      'pesas,'#13#10#13#10'ROUND(CAST(SUM('#13#10'(CAST((((COALESCE(ac.qtd_sugerida_ano' +
      ',0)*COALESCE(ac.vlr_uni_compra,0))-((COALESCE(ac.qtd_sugerida_an' +
      'o,0)*COALESCE(ac.vlr_uni_compra,0))*(COALESCE(ac.per_desconto,0)' +
      '/100))'#13#10'                    +'#13#10'                    (CAST((((COAL' +
      'ESCE(ac.qtd_sugerida_ano,0)*COALESCE(ac.vlr_uni_compra,0))-((COA' +
      'LESCE(ac.qtd_sugerida_ano,0)*COALESCE(ac.vlr_uni_compra,0))*(COA' +
      'LESCE(ac.per_desconto,0)/100))'#13#10'                    *'#13#10'         ' +
      '           COALESCE(ac.PER_MARGEM_ST,0))/100) AS NUMERIC(12,2)))' +
      #13#10'                    *'#13#10'                    COALESCE(PER_ST,0))' +
      '/100) AS NUMERIC(12,2))'#13#10'                    -'#13#10'                ' +
      '    CAST((((COALESCE(ac.qtd_sugerida_ano,0)*COALESCE(ac.vlr_uni_' +
      'compra,0))-((COALESCE(ac.qtd_sugerida_ano,0)*COALESCE(ac.vlr_uni' +
      '_compra,0))*(COALESCE(ac.per_desconto,0)/100))'#13#10'                ' +
      '    *'#13#10'                    COALESCE(ac.per_icms,0))/100) AS NUME' +
      'RIC(12,2)))'#13#10') AS NUMERIC(12,2)),2) Total_ST,'#13#10#13#10'ROUND(CAST(SUM(' +
      #13#10'COALESCE(ac.vlr_frete,0)'#13#10') AS NUMERIC(12,2)),2) Total_Frete,'#13 +
      #10#13#10'ROUND(CAST(SUM('#13#10'CAST((((COALESCE(ac.qtd_sugerida_ano,0)*COAL' +
      'ESCE(ac.vlr_uni_compra,0))-((COALESCE(ac.qtd_sugerida_ano,0)*COA' +
      'LESCE(ac.vlr_uni_compra,0))*(COALESCE(ac.per_desconto,0)/100))'#13#10 +
      '                    *'#13#10'                    COALESCE(ac.per_icms,' +
      '0))/100) AS NUMERIC(12,2))'#13#10') AS NUMERIC(12,2)),2) Total_ICMS,'#13#10 +
      #13#10'ROUND(CAST(SUM('#13#10'COALESCE(ac.vlr_repasse,0)'#13#10') AS NUMERIC(12,2' +
      ')),2) Total_Repasse,'#13#10#13#10'ac.num_documento Num_Docto,'#13#10#13#10'COUNT(ac.' +
      'cod_item) Total_Itens,'#13#10#13#10'ROUND(CAST(SUM(                       ' +
      '                     '#13#10'COALESCE(ac.qtd_sugerida_ano,0)'#13#10') AS NUM' +
      'ERIC(12,2)),2) Total_Qtds,'#13#10#13#10'SUM('#13#10'CASE'#13#10'   WHEN COALESCE(ac.qt' +
      'd_sugerida_ano,0)>0 THEN'#13#10'   1'#13#10'   ELSE'#13#10'   0'#13#10'END) Total_Itens_' +
      'Comprar'#13#10#13#10'FROM oc_comprar ac'#13#10#13#10'WHERE ac.num_documento=:NumDoc'#13 +
      #10'AND   ac.qtd_transf=0'#13#10'AND   ac.ind_oc_gerada='#39'N'#39#13#10'GROUP BY 16'#13 +
      #10#13#10'ORDER BY 1, 4, 3'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NumDoc'
        ParamType = ptInput
        Value = '12238'
      end
      item
        DataType = ftString
        Name = 'NumDoc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NumDoc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NumDoc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NumDoc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NumDoc'
        ParamType = ptInput
      end>
    SQLConnection = SQLC
    Left = 256
    Top = 542
  end
  object SDS_Busca1: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 35
    Top = 420
  end
  object CDS_Busca1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Busca1'
    Left = 116
    Top = 425
  end
  object DSP_Busca1: TDataSetProvider
    DataSet = SDS_Busca1
    Left = 76
    Top = 437
  end
  object DS_Busca1: TDataSource
    DataSet = CDS_Busca1
    Left = 152
    Top = 437
  end
  object IBQ_ConsultaFilial: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 449
    Top = 24
  end
  object IBQ_BuscaRapida: TIBQuery
    Database = IBDB_BelShop
    Transaction = IBT_BelShop
    BufferChunks = 1000
    CachedUpdates = False
    Left = 1202
    Top = 104
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 25
    Top = 64
  end
  object SQLQ_Busca: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 353
    Top = 72
  end
  object SDS_BuscaCurva: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CodLoja'
        ParamType = ptInput
        Value = '01'
      end
      item
        DataType = ftString
        Name = 'CodProd'
        ParamType = ptInput
        Value = '031322'
      end>
    SQL.Strings = (
      
        'SELECT TRIM(c.IND_CURVA_QTD) IND_CURVA_QTD, TRIM(c.IND_CURVA) IN' +
        'D_CURVA_VLR'
      'FROM ES_FINAN_CURVA_ABC c'
      'WHERE c.COD_LOJA = :CodLoja'
      'AND c.cod_produto = :CodProd')
    SQLConnection = SQLC
    Left = 577
    Top = 24
    object SDS_BuscaCurvaIND_CURVA_QTD: TStringField
      FieldName = 'IND_CURVA_QTD'
      Size = 1
    end
    object SDS_BuscaCurvaIND_CURVA_VLR: TStringField
      FieldName = 'IND_CURVA_VLR'
      Size = 1
    end
  end
  object DSP_Busca: TDataSetProvider
    DataSet = SDS_Busca
    Left = 84
    Top = 325
  end
  object CDS_Busca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Busca'
    Left = 124
    Top = 313
  end
  object DSP_SQLQ_Busca: TDataSetProvider
    DataSet = SQLQ_Busca
    Left = 404
    Top = 93
  end
  object CDS_SQLQ_Busca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_SQLQ_Busca'
    Left = 460
    Top = 73
  end
  object SDS_FaltasCDLojas: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 477
    Top = 620
  end
  object CDS_FaltasCDLojas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_FaltasCDLojas'
    Left = 566
    Top = 625
  end
  object DSP_FaltasCDLojas: TDataSetProvider
    DataSet = SDS_FaltasCDLojas
    Left = 518
    Top = 637
  end
  object DS_FaltasCDLojas: TDataSource
    DataSet = CDS_FaltasCDLojas
    Left = 616
    Top = 637
  end
end
