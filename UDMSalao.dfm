object DMSalao: TDMSalao
  OldCreateOrder = False
  Left = 199
  Top = 108
  Height = 609
  Width = 1105
  object SDS_Profissionais: TSQLDataSet
    CommandText = 'SELECT *'#13#10'FROM sal_profissionais p'#13#10'ORDER BY p.des_profissional'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 40
    Top = 24
  end
  object DSP_Profissionais: TDataSetProvider
    DataSet = SDS_Profissionais
    Options = [poRetainServerOrder]
    Left = 80
    Top = 40
  end
  object CDS_Profissionais: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Profissionais'
    Left = 120
    Top = 24
    object CDS_ProfissionaisCOD_LOJA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Loja'
      FieldName = 'COD_LOJA'
      Required = True
      Size = 2
    end
    object CDS_ProfissionaisCOD_PROFISSIONAL: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod Prof'
      FieldName = 'COD_PROFISSIONAL'
      Required = True
      FixedChar = True
      Size = 6
    end
    object CDS_ProfissionaisDES_PROFISSIONAL: TStringField
      DisplayLabel = 'Profissional'
      FieldName = 'DES_PROFISSIONAL'
      Size = 60
    end
    object CDS_ProfissionaisDES_APELIDO: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'DES_APELIDO'
      Size = 60
    end
    object CDS_ProfissionaisNUM_CPF: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'CPF'
      FieldName = 'NUM_CPF'
      EditMask = '999.999.999-99;1;_'
      FixedChar = True
      Size = 12
    end
    object CDS_ProfissionaisDTA_NASCIMENTO: TDateField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'DTA_NASCIMENTO'
    end
    object CDS_ProfissionaisNUM_RG: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Identidade'
      FieldName = 'NUM_RG'
      FixedChar = True
      Size = 10
    end
    object CDS_ProfissionaisBLOB_FOTO: TBlobField
      DisplayLabel = 'Foto'
      FieldName = 'BLOB_FOTO'
      Size = 1
    end
    object CDS_ProfissionaisNUM_CEP: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'NUM_CEP'
      EditMask = '99999-999;1;_'
      FixedChar = True
      Size = 8
    end
    object CDS_ProfissionaisDES_ENDERECO: TStringField
      FieldName = 'DES_ENDERECO'
      Size = 60
    end
    object CDS_ProfissionaisNUM_ENDERECO: TStringField
      FieldName = 'NUM_ENDERECO'
      Size = 15
    end
    object CDS_ProfissionaisCPL_ENDERECO: TStringField
      FieldName = 'CPL_ENDERECO'
      Size = 30
    end
    object CDS_ProfissionaisDES_BAIRRO: TStringField
      FieldName = 'DES_BAIRRO'
      Size = 30
    end
    object CDS_ProfissionaisCOD_MUNICIPIO_IBGE: TIntegerField
      FieldName = 'COD_MUNICIPIO_IBGE'
    end
    object CDS_ProfissionaisDES_MUNICIPIO: TStringField
      FieldName = 'DES_MUNICIPIO'
      Size = 60
    end
    object CDS_ProfissionaisDES_ESTADO: TStringField
      FieldName = 'DES_ESTADO'
      Size = 60
    end
    object CDS_ProfissionaisCOD_ESTADO_IBGE: TIntegerField
      FieldName = 'COD_ESTADO_IBGE'
    end
    object CDS_ProfissionaisDES_UF: TStringField
      FieldName = 'DES_UF'
      FixedChar = True
      Size = 2
    end
    object CDS_ProfissionaisBLOB_LOCALIZACOES: TMemoField
      FieldName = 'BLOB_LOCALIZACOES'
      BlobType = ftMemo
      Size = 1
    end
    object CDS_ProfissionaisBLOB_OBS: TMemoField
      FieldName = 'BLOB_OBS'
      BlobType = ftMemo
      Size = 1
    end
    object CDS_ProfissionaisNUM_ALVARA_LOCAL: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#186' Alvar'#225' Localiza'#231#227'o'
      FieldName = 'NUM_ALVARA_LOCAL'
      Size = 30
    end
    object CDS_ProfissionaisNUM_SINDICATO: TStringField
      Alignment = taRightJustify
      FieldName = 'NUM_SINDICATO'
      Size = 30
    end
    object CDS_ProfissionaisIND_TAXA_SINDICATO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Taxa Sindicato'
      FieldName = 'IND_TAXA_SINDICATO'
      FixedChar = True
      Size = 3
    end
    object CDS_ProfissionaisVLR_TAXA_SINDICATO: TFMTBCDField
      FieldName = 'VLR_TAXA_SINDICATO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ProfissionaisCOD_COMPRV_SINDICATO: TStringField
      Alignment = taRightJustify
      FieldName = 'COD_COMPRV_SINDICATO'
      FixedChar = True
      Size = 3
    end
    object CDS_ProfissionaisIND_TAXA_NAOSOCIO: TStringField
      Alignment = taCenter
      FieldName = 'IND_TAXA_NAOSOCIO'
      FixedChar = True
      Size = 3
    end
    object CDS_ProfissionaisVLR_TAXA_NAOSOCIO: TFMTBCDField
      FieldName = 'VLR_TAXA_NAOSOCIO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ProfissionaisCOD_COMPRV_NAOSOCIO: TStringField
      Alignment = taRightJustify
      FieldName = 'COD_COMPRV_NAOSOCIO'
      FixedChar = True
      Size = 3
    end
    object CDS_ProfissionaisNUM_INSS: TStringField
      Alignment = taRightJustify
      FieldName = 'NUM_INSS'
      Size = 30
    end
    object CDS_ProfissionaisPER_INSS: TFMTBCDField
      FieldName = 'PER_INSS'
      DisplayFormat = '0,.00'
      MaxValue = '100'
      MinValue = '0'
      Precision = 15
      Size = 2
    end
    object CDS_ProfissionaisIND_COBRA_INSS: TStringField
      FieldName = 'IND_COBRA_INSS'
      Size = 3
    end
    object CDS_ProfissionaisCOD_COMPRV_INSS: TStringField
      Alignment = taRightJustify
      FieldName = 'COD_COMPRV_INSS'
      FixedChar = True
      Size = 3
    end
    object CDS_ProfissionaisNUM_TECBIZ: TStringField
      Alignment = taRightJustify
      FieldName = 'NUM_TECBIZ'
      EditMask = '9999-9999-9999-9999;0;_'
      Size = 30
    end
    object CDS_ProfissionaisNUM_MATRICULA_TECBIZ: TStringField
      Alignment = taRightJustify
      FieldName = 'NUM_MATRICULA_TECBIZ'
      Size = 30
    end
    object CDS_ProfissionaisCOD_COMPRV_TECBIZ: TStringField
      Alignment = taRightJustify
      FieldName = 'COD_COMPRV_TECBIZ'
      FixedChar = True
      Size = 3
    end
    object CDS_ProfissionaisCOD_PLANO_SAUDE: TIntegerField
      FieldName = 'COD_PLANO_SAUDE'
    end
    object CDS_ProfissionaisVLR_PLANO_SAUDE: TFMTBCDField
      FieldName = 'VLR_PLANO_SAUDE'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ProfissionaisCOD_COMPRV_PL_SAUDE: TStringField
      Alignment = taRightJustify
      FieldName = 'COD_COMPRV_PL_SAUDE'
      FixedChar = True
      Size = 3
    end
    object CDS_ProfissionaisNUM_BANCO: TIntegerField
      FieldName = 'NUM_BANCO'
    end
    object CDS_ProfissionaisDES_BANCO: TStringField
      FieldName = 'DES_BANCO'
      Size = 50
    end
    object CDS_ProfissionaisNUM_AGENCIA: TStringField
      Alignment = taRightJustify
      FieldName = 'NUM_AGENCIA'
    end
    object CDS_ProfissionaisDES_AGENCIA: TStringField
      FieldName = 'DES_AGENCIA'
      Size = 50
    end
    object CDS_ProfissionaisNUM_CONTA: TStringField
      Alignment = taRightJustify
      FieldName = 'NUM_CONTA'
      Size = 60
    end
    object CDS_ProfissionaisNUM_CONTRATO: TIntegerField
      FieldName = 'NUM_CONTRATO'
    end
    object CDS_ProfissionaisNUM_MESES_CONTRATO: TIntegerField
      FieldName = 'NUM_MESES_CONTRATO'
    end
    object CDS_ProfissionaisDTA_INI_CONTRATO: TDateField
      Alignment = taCenter
      FieldName = 'DTA_INI_CONTRATO'
    end
    object CDS_ProfissionaisDTA_FIM_CONTRATO: TDateField
      Alignment = taCenter
      FieldName = 'DTA_FIM_CONTRATO'
    end
    object CDS_ProfissionaisDTA_INI_RENOVACAO: TDateField
      FieldName = 'DTA_INI_RENOVACAO'
    end
    object CDS_ProfissionaisDTA_FIM_RENOVACAO: TDateField
      FieldName = 'DTA_FIM_RENOVACAO'
    end
    object CDS_ProfissionaisBLOB_CONTRATO_MOVEIS: TMemoField
      FieldName = 'BLOB_CONTRATO_MOVEIS'
      BlobType = ftMemo
      Size = 1
    end
    object CDS_ProfissionaisIND_LIBERADO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Cad Liberado ?'
      FieldName = 'IND_LIBERADO'
      FixedChar = True
      Size = 3
    end
    object CDS_ProfissionaisBLOB_RENOVACOES: TMemoField
      FieldName = 'BLOB_RENOVACOES'
      BlobType = ftMemo
      Size = 1
    end
    object CDS_ProfissionaisNUM_CONTRATO_BENS: TIntegerField
      FieldName = 'NUM_CONTRATO_BENS'
    end
    object CDS_ProfissionaisLOC_W_CONTRATO: TStringField
      FieldName = 'LOC_W_CONTRATO'
      Size = 200
    end
    object CDS_ProfissionaisLOC_W_ALTER_CONTRATUAL: TStringField
      FieldName = 'LOC_W_ALTER_CONTRATUAL'
      Size = 200
    end
    object CDS_ProfissionaisLOC_W_LOC_BENS: TStringField
      FieldName = 'LOC_W_LOC_BENS'
      Size = 200
    end
    object CDS_ProfissionaisVLR_PAGTO_MINIMO: TFMTBCDField
      FieldName = 'VLR_PAGTO_MINIMO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ProfissionaisVLR_CAUCAO: TFMTBCDField
      FieldName = 'VLR_CAUCAO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ProfissionaisPER_LOCADOR: TFMTBCDField
      FieldName = 'PER_LOCADOR'
      DisplayFormat = '0,.00'
      MaxValue = '100'
      MinValue = '0'
      Precision = 15
      Size = 2
    end
    object CDS_ProfissionaisPER_COMISSAO_SUPERVISOR: TFMTBCDField
      FieldName = 'PER_COMISSAO_SUPERVISOR'
      DisplayFormat = '0,.00'
      MaxValue = '100'
      MinValue = '0'
      Precision = 15
      Size = 2
    end
    object CDS_ProfissionaisPER_COMISSAO: TFMTBCDField
      FieldName = 'PER_COMISSAO'
      DisplayFormat = '0,.00'
      MaxValue = '100'
      MinValue = '0'
      Precision = 15
      Size = 2
    end
    object CDS_ProfissionaisPER_EXTRA_ANO: TFMTBCDField
      FieldName = 'PER_EXTRA_ANO'
      DisplayFormat = '0,.00'
      MaxValue = '100'
      MinValue = '0'
      Precision = 15
      Size = 2
    end
    object CDS_ProfissionaisDIA_PERIODO_INI_COM: TStringField
      FieldName = 'DIA_PERIODO_INI_COM'
      FixedChar = True
      Size = 7
    end
    object CDS_ProfissionaisDIA_PERIODO_FIM_COM: TStringField
      FieldName = 'DIA_PERIODO_FIM_COM'
      FixedChar = True
      Size = 7
    end
    object CDS_ProfissionaisDTA_PERIODO_INI_CAL: TDateField
      Alignment = taCenter
      FieldName = 'DTA_PERIODO_INI_CAL'
    end
    object CDS_ProfissionaisDTA_PERIODO_FIM_CAL: TDateField
      Alignment = taCenter
      FieldName = 'DTA_PERIODO_FIM_CAL'
    end
    object CDS_ProfissionaisTIP_PESSOA: TStringField
      FieldName = 'TIP_PESSOA'
      FixedChar = True
      Size = 1
    end
    object CDS_ProfissionaisIND_ATIVO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Ativo ?'
      FieldName = 'IND_ATIVO'
      FixedChar = True
      Size = 3
    end
    object CDS_ProfissionaisIND_CAD_SIDICOM: TStringField
      FieldName = 'IND_CAD_SIDICOM'
      FixedChar = True
      Size = 3
    end
    object CDS_ProfissionaisIND_SID_NIVELTABELA: TSmallintField
      FieldName = 'IND_SID_NIVELTABELA'
    end
    object CDS_ProfissionaisTIP_SID_COMISSAO: TStringField
      FieldName = 'TIP_SID_COMISSAO'
      FixedChar = True
      Size = 1
    end
    object CDS_ProfissionaisIND_SID_TABELAPROC: TStringField
      FieldName = 'IND_SID_TABELAPROC'
      FixedChar = True
      Size = 1
    end
    object CDS_ProfissionaisVLR_SID_QUOTA: TFMTBCDField
      FieldName = 'VLR_SID_QUOTA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ProfissionaisUSU_INCLUI: TIntegerField
      FieldName = 'USU_INCLUI'
    end
    object CDS_ProfissionaisDTA_INCLUI: TSQLTimeStampField
      FieldName = 'DTA_INCLUI'
      Required = True
    end
    object CDS_ProfissionaisUSU_ALTERA: TIntegerField
      FieldName = 'USU_ALTERA'
    end
    object CDS_ProfissionaisDTA_ALTERA: TSQLTimeStampField
      FieldName = 'DTA_ALTERA'
    end
    object CDS_ProfissionaisSIT_PREVIDENCIARIA: TIntegerField
      FieldName = 'SIT_PREVIDENCIARIA'
    end
    object CDS_ProfissionaisDES_SIT_PREVIDENCIARIA: TStringField
      FieldName = 'DES_SIT_PREVIDENCIARIA'
      Size = 30
    end
  end
  object DS_Profissionais: TDataSource
    DataSet = CDS_Profissionais
    Left = 168
    Top = 40
  end
  object SDS_Habilidades: TSQLDataSet
    CommandText = 
      'SELECT h.cod_habserv Cod_Hab, h.des_habserv Des_Habilidade, '#13#10'h.' +
      'des_abreviatura,'#13#10'h.vlr_habserv, h.cod_sidicom, h.ind_ativo'#13#10'FRO' +
      'M sal_hab_serv h'#13#10'WHERE h.tip_habserv='#39'H'#39#13#10'ORDER BY h.des_habser' +
      'v'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 40
    Top = 120
  end
  object DSP_Habilidades: TDataSetProvider
    DataSet = SDS_Habilidades
    Options = [poRetainServerOrder]
    Left = 80
    Top = 136
  end
  object CDS_Habilidades: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Habilidades'
    AfterScroll = CDS_HabilidadesAfterScroll
    Left = 120
    Top = 120
    object CDS_HabilidadesCOD_HAB: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_HAB'
      Required = True
    end
    object CDS_HabilidadesDES_HABILIDADE: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_HABILIDADE'
      Size = 80
    end
    object CDS_HabilidadesDES_ABREVIATURA: TStringField
      DisplayLabel = 'Abreviatura'
      FieldName = 'DES_ABREVIATURA'
      Size = 50
    end
    object CDS_HabilidadesCOD_SIDICOM: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd SIDICOM'
      FieldName = 'COD_SIDICOM'
      FixedChar = True
      Size = 6
    end
    object CDS_HabilidadesVLR_HABSERV: TFMTBCDField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'VLR_HABSERV'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_HabilidadesIND_ATIVO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Ativo'
      FieldName = 'IND_ATIVO'
      FixedChar = True
      Size = 3
    end
  end
  object DS_Habilidades: TDataSource
    DataSet = CDS_Habilidades
    Left = 168
    Top = 136
  end
  object SDS_Servicos: TSQLDataSet
    CommandText = 
      'SELECT s.cod_habserv Cod_Servico, '#13#10's.des_habserv Des_Servico, '#13 +
      #10's.vlr_habserv, s.cod_sidicom, s.ind_ativo'#13#10'FROM sal_hab_serv_li' +
      'nk L, sal_hab_serv s'#13#10'WHERE l.cod_servico=s.cod_habserv'#13#10'and s.t' +
      'ip_habserv='#39'S'#39#13#10'and l.cod_habilidade= :Cod_Hab'#13#10#13#10#13#10'ORDER BY s.d' +
      'es_habserv'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'Cod_Hab'
        ParamType = ptInput
      end>
    SQLConnection = DMBelShop.SQLC
    Left = 40
    Top = 192
  end
  object DSP_Servicos: TDataSetProvider
    DataSet = SDS_Servicos
    Options = [poRetainServerOrder]
    Left = 80
    Top = 208
  end
  object CDS_Servicos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Servicos'
    Left = 120
    Top = 192
    object CDS_ServicosCOD_SERVICO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object CDS_ServicosDES_SERVICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_SERVICO'
      Size = 80
    end
    object CDS_ServicosCOD_SIDICOM: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd SIDICOM'
      FieldName = 'COD_SIDICOM'
      FixedChar = True
      Size = 6
    end
    object CDS_ServicosVLR_HABSERV: TFMTBCDField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'VLR_HABSERV'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ServicosIND_ATIVO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Ativo'
      FieldName = 'IND_ATIVO'
      FixedChar = True
      Size = 3
    end
  end
  object DS_Servicos: TDataSource
    DataSet = CDS_Servicos
    Left = 168
    Top = 208
  end
  object CDS_V_RetornoIBGE: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 904
    Top = 8
    object CDS_V_RetornoIBGECEP: TStringField
      FieldName = 'CEP'
      EditMask = '99999-999;1;_'
      Size = 9
    end
    object CDS_V_RetornoIBGEEndereco: TStringField
      FieldName = 'Endereco'
      Size = 100
    end
    object CDS_V_RetornoIBGEBairro: TStringField
      FieldName = 'Bairro'
      Size = 60
    end
    object CDS_V_RetornoIBGEMunicipio: TStringField
      FieldName = 'Municipio'
      Size = 60
    end
    object CDS_V_RetornoIBGEMunicipio_IBGE: TIntegerField
      FieldName = 'Municipio_IBGE'
    end
    object CDS_V_RetornoIBGEUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object CDS_V_RetornoIBGEUF_IBGE: TIntegerField
      FieldName = 'UF_IBGE'
    end
  end
  object DS_V_RetornoIBGE: TDataSource
    DataSet = CDS_V_RetornoIBGE
    Left = 992
    Top = 16
  end
  object CDS_V_ProfFones: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 904
    Top = 58
    object CDS_V_ProfFonesDes_Localizacao: TStringField
      DisplayLabel = 'Localiza'#231#227'o'
      FieldName = 'Des_Localizacao'
      Size = 30
    end
    object CDS_V_ProfFonesDes_DDD: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'DDD'
      FieldName = 'Des_DDD'
      Size = 4
    end
    object CDS_V_ProfFonesDes_Fone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'Des_Fone'
    end
  end
  object DS_V_ProfFones: TDataSource
    DataSet = CDS_V_ProfFones
    Left = 992
    Top = 66
  end
  object CDS_V_ProfEmail: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 904
    Top = 114
    object CDS_V_ProfEmailDes_Localizacao: TStringField
      DisplayLabel = 'Localiza'#231#227'o'
      FieldName = 'Des_Localizacao'
      Size = 30
    end
    object CDS_V_ProfEmailDes_Email: TStringField
      DisplayLabel = 'E-Mail'
      FieldName = 'Des_Email'
      Size = 50
    end
  end
  object DS_V_ProfEmail: TDataSource
    DataSet = CDS_V_ProfEmail
    Left = 992
    Top = 122
  end
  object CDS_V_Dependentes: TClientDataSet
    Aggregates = <>
    Filter = 'Ind_Exc='#39#39' or Ind_Exc is null '
    Filtered = True
    IndexFieldNames = 'Des_Dependente'
    Params = <>
    Left = 904
    Top = 170
    object CDS_V_DependentesDes_Dependente: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'Des_Dependente'
      Size = 60
    end
    object CDS_V_DependentesDes_Parentesco: TStringField
      DisplayLabel = 'Parentesco'
      FieldName = 'Des_Parentesco'
      Size = 30
    end
    object CDS_V_DependentesDta_Nascimento: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dta Nasc'
      FieldName = 'Dta_Nascimento'
    end
    object CDS_V_DependentesVlr_PlanoSaude: TCurrencyField
      DisplayLabel = 'Valor'
      FieldName = 'Vlr_PlanoSaude'
      DisplayFormat = '0.,00'
    end
    object CDS_V_DependentesNum_Seq: TIntegerField
      FieldName = 'Num_Seq'
    end
    object CDS_V_DependentesInd_Exc: TStringField
      FieldName = 'Ind_Exc'
      Size = 1
    end
  end
  object DS_V_Dependentes: TDataSource
    DataSet = CDS_V_Dependentes
    Left = 992
    Top = 178
  end
  object SDS_HabilidadesProf: TSQLDataSet
    CommandText = 
      'SELECT Distinct'#13#10'hs.cod_loja, hs.cod_profissional,'#13#10'ha.des_habse' +
      'rv Habilidade,'#13#10#13#10'Case'#13#10'  When (ha.vlr_habserv=0) and (hs.vlr_ha' +
      'bilidade<>0) Then'#13#10'   hs.vlr_habilidade'#13#10'  When (ha.vlr_habserv<' +
      '>0) and (hs.vlr_habilidade=0) Then'#13#10'   ha.vlr_habserv'#13#10'  When (h' +
      'a.vlr_habserv<>0) and (hs.vlr_habilidade<>0) Then'#13#10'    hs.vlr_ha' +
      'bilidade'#13#10'  Else'#13#10'    0'#13#10'End Preco,'#13#10#13#10'hs.per_comissao_hab Per_c' +
      'omissao,'#13#10'hs.ind_ativo Ativo, hs.cod_habilidade'#13#10#13#10'FROM sal_prof' +
      '_habilidades hs, sal_hab_serv ha'#13#10#13#10'WHERE hs.cod_habilidade=ha.c' +
      'od_habserv'#13#10'AND   ha.tip_habserv='#39'H'#39#13#10'AND   hs.cod_servico IS NU' +
      'LL'#13#10'AND   hs.cod_loja= :CodLoja'#13#10'AND   hs.cod_profissional= :Cod' +
      'Prof'#13#10#13#10'Order By  hs.cod_loja, hs.cod_profissional, ha.des_habse' +
      'rv'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'CodLoja'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CodProf'
        ParamType = ptInput
      end>
    SQLConnection = DMBelShop.SQLC
    Left = 40
    Top = 272
  end
  object DSP_HabilidadesProf: TDataSetProvider
    DataSet = SDS_HabilidadesProf
    Options = [poRetainServerOrder]
    Left = 80
    Top = 288
  end
  object CDS_HabilidadesProf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_HabilidadesProf'
    AfterScroll = CDS_HabilidadesProfAfterScroll
    Left = 120
    Top = 272
    object CDS_HabilidadesProfHABILIDADE: TStringField
      DisplayLabel = 'Habilidade'
      FieldName = 'HABILIDADE'
      Size = 80
    end
    object CDS_HabilidadesProfPRECO: TFMTBCDField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'PRECO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_HabilidadesProfPER_COMISSAO: TFMTBCDField
      DisplayLabel = '% Comiss'#227'o'
      FieldName = 'PER_COMISSAO'
      DisplayFormat = '0,.00'
      MaxValue = '100'
      MinValue = '0'
      Precision = 15
      Size = 2
    end
    object CDS_HabilidadesProfATIVO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Ativo?'
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 3
    end
    object CDS_HabilidadesProfCOD_HABILIDADE: TIntegerField
      FieldName = 'COD_HABILIDADE'
      Required = True
      Visible = False
    end
    object CDS_HabilidadesProfCOD_LOJA: TStringField
      FieldName = 'COD_LOJA'
      Required = True
      Visible = False
      FixedChar = True
      Size = 2
    end
    object CDS_HabilidadesProfCOD_PROFISSIONAL: TStringField
      FieldName = 'COD_PROFISSIONAL'
      Required = True
      Visible = False
      FixedChar = True
      Size = 6
    end
  end
  object DS_HabilidadesProf: TDataSource
    DataSet = CDS_HabilidadesProf
    Left = 168
    Top = 288
  end
  object SDS_ServicosProf: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'se.des_habserv Servico,'#13#10#13#10#13#10'Case'#13#10'  When (se.vlr_habser' +
      'v=0) and (hs.vlr_servico<>0) Then'#13#10'   hs.vlr_servico'#13#10'  When (se' +
      '.vlr_habserv<>0) and (hs.vlr_servico=0) Then'#13#10'   se.vlr_habserv'#13 +
      #10'  When (se.vlr_habserv<>0) and (hs.vlr_servico<>0) Then'#13#10'    hs' +
      '.vlr_servico'#13#10'  Else'#13#10'    0'#13#10'End Preco,'#13#10#13#10'hs.per_comissao_serv ' +
      'Per_comissao,'#13#10'hs.Ind_Ativo,'#13#10'hs.cod_servico'#13#10#13#10'FROM sal_prof_ha' +
      'bilidades hs, sal_hab_serv se'#13#10#13#10'WHERE hs.cod_servico=se.cod_hab' +
      'serv'#13#10'AND   se.tip_habserv='#39'S'#39#13#10'AND   hs.cod_loja= :CodLoja'#13#10'AND' +
      '   hs.cod_profissional= :CodProf'#13#10'AND   hs.cod_habilidade= :CodH' +
      'ab'#13#10#13#10'Order by 1'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'CodLoja'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CodProf'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CodHab'
        ParamType = ptInput
      end>
    SQLConnection = DMBelShop.SQLC
    Left = 40
    Top = 344
  end
  object DSP_ServicosProf: TDataSetProvider
    DataSet = SDS_ServicosProf
    Options = [poRetainServerOrder]
    Left = 80
    Top = 360
  end
  object CDS_ServicosProf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ServicosProf'
    Left = 120
    Top = 344
    object CDS_ServicosProfSERVICO: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'SERVICO'
      Size = 80
    end
    object CDS_ServicosProfPRECO: TFMTBCDField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'PRECO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ServicosProfPER_COMISSAO: TFMTBCDField
      DisplayLabel = '% Comiss'#227'o'
      FieldName = 'PER_COMISSAO'
      DisplayFormat = '0,.00'
      MaxValue = '100'
      MinValue = '0'
      Precision = 15
      Size = 2
    end
    object CDS_ServicosProfCOD_SERVICO: TIntegerField
      FieldName = 'COD_SERVICO'
      Visible = False
    end
    object CDS_ServicosProfIND_ATIVO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Atvio?'
      FieldName = 'IND_ATIVO'
      FixedChar = True
      Size = 3
    end
  end
  object DS_ServicosProf: TDataSource
    DataSet = CDS_ServicosProf
    Left = 168
    Top = 360
  end
  object CDS_SID_Supervisor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_SID_Supervisor'
    Left = 112
    Top = 426
    object CDS_SID_SupervisorCODIGO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Required = True
      FixedChar = True
      Size = 6
    end
    object CDS_SID_SupervisorSUPERVIDOR: TStringField
      FieldName = 'SUPERVIDOR'
      Size = 60
    end
  end
  object DS_SID_Supervisor: TDataSource
    DataSet = CDS_SID_Supervisor
    Left = 161
    Top = 442
  end
  object CDS_SID_Vendedores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_SID_Vendedores'
    Left = 112
    Top = 490
    object CDS_SID_VendedoresCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Required = True
      FixedChar = True
      Size = 6
    end
    object CDS_SID_VendedoresVENDEDOR: TStringField
      DisplayLabel = 'Vendedor'
      FieldName = 'VENDEDOR'
      Size = 60
    end
  end
  object DS_SID_Vendedores: TDataSource
    DataSet = CDS_SID_Vendedores
    Left = 161
    Top = 513
  end
  object SDS_SID_Supervisor: TSQLDataSet
    CommandText = 
      'SELECT p.cod_profissional Codigo, p.des_profissional Supervidor'#13 +
      #10'FROM sal_prof_supervisor s, sal_profissionais p'#13#10'WHERE s.cod_su' +
      'pervisor=p.cod_profissional'#13#10'AND   s.cod_loja=p.cod_loja'#13#10'AND   ' +
      's.cod_loja= :CodLoja'#13#10'AND   s.cod_profissional= :CodProf'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'CodLoja'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CodProf'
        ParamType = ptInput
      end>
    SQLConnection = DMBelShop.SQLC
    Left = 48
    Top = 424
  end
  object DSP_SID_Supervisor: TDataSetProvider
    DataSet = SDS_SID_Supervisor
    Options = [poRetainServerOrder]
    Left = 80
    Top = 440
  end
  object SDS_SID_Vendedores: TSQLDataSet
    CommandText = 
      'SELECT p.cod_profissional Codigo, p.des_profissional Vendedor'#13#10'F' +
      'ROM sal_prof_supervisor s, sal_profissionais p'#13#10'WHERE s.cod_prof' +
      'issional=p.cod_profissional'#13#10'AND   s.cod_loja=p.cod_loja'#13#10'AND   ' +
      's.cod_loja= :CodLoja'#13#10'AND   s.cod_supervisor= :CodProf'#13#10'ORDER BY' +
      ' p.des_profissional'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'CodLoja'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CodProf'
        ParamType = ptInput
      end>
    SQLConnection = DMBelShop.SQLC
    Left = 48
    Top = 496
  end
  object DSP_SID_Vendedores: TDataSetProvider
    DataSet = SDS_SID_Vendedores
    Options = [poRetainServerOrder]
    Left = 80
    Top = 512
  end
  object CDS_ValesProfissionais: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ValesProfissionais'
    AfterScroll = CDS_ValesProfissionaisAfterScroll
    Left = 352
    Top = 26
    object CDS_ValesProfissionaisCOD_LOJA: TStringField
      DisplayLabel = 'Loja'
      FieldName = 'COD_LOJA'
      Required = True
      FixedChar = True
      Size = 2
    end
    object CDS_ValesProfissionaisCOD_PROFISSIONAL: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PROFISSIONAL'
      Required = True
      FixedChar = True
      Size = 6
    end
    object CDS_ValesProfissionaisDES_PROFISSIONAL: TStringField
      DisplayLabel = 'Profissional'
      FieldName = 'DES_PROFISSIONAL'
      Size = 60
    end
    object CDS_ValesProfissionaisNUM_DOCTO: TIntegerField
      DisplayLabel = 'N'#186' Docto'
      FieldName = 'NUM_DOCTO'
    end
    object CDS_ValesProfissionaisVLR_ORIGINAL: TFMTBCDField
      DisplayLabel = 'Vlr Docto'
      FieldName = 'VLR_ORIGINAL'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_ValesProfissionaisTOT_PRESTACAO: TIntegerField
      DisplayLabel = 'N'#186' Parc'
      FieldName = 'TOT_PRESTACAO'
    end
    object CDS_ValesProfissionaisNUM_PRAZO: TIntegerField
      FieldName = 'NUM_PRAZO'
    end
    object CDS_ValesProfissionaisDTA_PRIM_VENC: TDateField
      FieldName = 'DTA_PRIM_VENC'
    end
    object CDS_ValesProfissionaisIND_ATIVO: TStringField
      FieldName = 'IND_ATIVO'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object CDS_ValesProfissionaisCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 73
    end
  end
  object DS_ValesProfissionais: TDataSource
    DataSet = CDS_ValesProfissionais
    Left = 401
    Top = 45
  end
  object SDS_ValesProfissionais: TSQLDataSet
    CommandText = 
      'SELECT distinct p.Cod_loja, p.cod_profissional, p.des_profission' +
      'al,'#13#10'v.num_docto, v.vlr_original, v.tot_prestacao, v.num_prazo, ' +
      'v.dta_prim_venc, p.ind_ativo,'#13#10'(p.Cod_loja||p.cod_profissional||' +
      'v.num_docto||v.vlr_original||v.tot_prestacao||v.num_prazo||v.dta' +
      '_prim_venc) Chave'#13#10#13#10'FROM ps_vales_pessoas v, sal_profissionais ' +
      'p'#13#10'WHERE v.cod_loja=p.cod_loja'#13#10'And   v.cod_pessoa=p.cod_profiss' +
      'ional'#13#10'AND   v.tp_pessoa=1'#13#10'AND   v.cod_loja='#39'06'#39#13#10'AND   v.cod_p' +
      'essoa='#39'000020'#39#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 272
    Top = 32
  end
  object DSP_ValesProfissionais: TDataSetProvider
    DataSet = SDS_ValesProfissionais
    Options = [poRetainServerOrder]
    Left = 312
    Top = 48
  end
  object CDS_Vales: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Vales'
    Left = 352
    Top = 98
    object CDS_ValesNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
    end
    object CDS_ValesTP_PESSOA: TIntegerField
      FieldName = 'TP_PESSOA'
      Required = True
    end
    object CDS_ValesCOD_LOJA: TStringField
      FieldName = 'COD_LOJA'
      Required = True
      FixedChar = True
      Size = 2
    end
    object CDS_ValesCOD_PESSOA: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PESSOA'
      Required = True
    end
    object CDS_ValesNUM_DOCTO: TIntegerField
      DisplayLabel = 'N'#186' Docto'
      FieldName = 'NUM_DOCTO'
    end
    object CDS_ValesIND_DEBCRED: TStringField
      FieldName = 'IND_DEBCRED'
      Size = 1
    end
    object CDS_ValesVLR_ORIGINAL: TFMTBCDField
      DisplayLabel = 'Valor Docto'
      FieldName = 'VLR_ORIGINAL'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_ValesTOT_PRESTACAO: TIntegerField
      DisplayLabel = 'Total Parc'
      FieldName = 'TOT_PRESTACAO'
    end
    object CDS_ValesNUM_PRAZO: TIntegerField
      FieldName = 'NUM_PRAZO'
    end
    object CDS_ValesDTA_PRIM_VENC: TDateField
      FieldName = 'DTA_PRIM_VENC'
    end
    object CDS_ValesNUM_PRESTACAO: TIntegerField
      DisplayLabel = 'N'#186' Parc'
      FieldName = 'NUM_PRESTACAO'
    end
    object CDS_ValesDTA_VENCIMENTO: TDateField
      DisplayLabel = 'Dta Vencto'
      FieldName = 'DTA_VENCIMENTO'
    end
    object CDS_ValesVLR_PRESTACAO: TFMTBCDField
      DisplayLabel = 'Vlr Parcela'
      FieldName = 'VLR_PRESTACAO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_ValesVLR_DESCONTO: TFMTBCDField
      DisplayLabel = 'Vlr Descontos'
      FieldName = 'VLR_DESCONTO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_ValesVLR_ACRESCIMOS: TFMTBCDField
      DisplayLabel = 'Vlr Acrescimos'
      FieldName = 'VLR_ACRESCIMOS'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_ValesVLR_APAGAR: TFMTBCDField
      DisplayLabel = 'Vlr A Pagar'
      FieldName = 'VLR_APAGAR'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_ValesVLR_PAGO: TFMTBCDField
      DisplayLabel = 'Vlr Pago'
      FieldName = 'VLR_PAGO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_ValesNUM_DOCTO_PAGTO: TIntegerField
      DisplayLabel = 'N'#186' Docto Pagto'
      FieldName = 'NUM_DOCTO_PAGTO'
    end
    object CDS_ValesDTA_PAGAMENTO: TDateField
      DisplayLabel = 'Dta Pagto'
      FieldName = 'DTA_PAGAMENTO'
    end
    object CDS_ValesUSU_INCLUI: TIntegerField
      FieldName = 'USU_INCLUI'
    end
    object CDS_ValesDTA_INCLUI: TSQLTimeStampField
      FieldName = 'DTA_INCLUI'
      Required = True
    end
    object CDS_ValesUSU_ALTERA: TIntegerField
      FieldName = 'USU_ALTERA'
    end
    object CDS_ValesDTA_ALTERA: TSQLTimeStampField
      FieldName = 'DTA_ALTERA'
    end
  end
  object DS_Vales: TDataSource
    DataSet = CDS_Vales
    Left = 401
    Top = 121
  end
  object SDS_Vales: TSQLDataSet
    CommandText = 
      'SELECT v.*'#13#10'FROM ps_vales_pessoas v'#13#10'WHERE v.tp_pessoa=1'#13#10'AND   ' +
      'v.cod_loja='#39'06'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 272
    Top = 104
  end
  object DSP_Vales: TDataSetProvider
    DataSet = SDS_Vales
    Options = [poRetainServerOrder]
    Left = 312
    Top = 120
  end
  object CDS_MetasProfissionais: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_MetasProfissionais'
    AfterScroll = CDS_MetasProfissionaisAfterScroll
    Left = 352
    Top = 186
    object CDS_MetasProfissionaisCOD_LOJA: TStringField
      FieldName = 'COD_LOJA'
      Required = True
      FixedChar = True
      Size = 2
    end
    object CDS_MetasProfissionaisCOD_PROFISSIONAL: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PROFISSIONAL'
      Required = True
      FixedChar = True
      Size = 6
    end
    object CDS_MetasProfissionaisDES_PROFISSIONAL: TStringField
      DisplayLabel = 'Profissional'
      FieldName = 'DES_PROFISSIONAL'
      Size = 60
    end
  end
  object DS_MetasProfissionais: TDataSource
    DataSet = CDS_MetasProfissionais
    Left = 401
    Top = 209
  end
  object SDS_MetasProfissionais: TSQLDataSet
    CommandText = 
      'SELECT P.Cod_Loja, p.cod_profissional, p.des_profissional'#13#10'FROM ' +
      'SAL_PROFISSIONAIS p'#13#10'WHERE p.tip_pessoa='#39'P'#39#13#10'AND   p.cod_loja='#39'0' +
      '6'#39#13#10'AND   p.ind_ativo='#39'SIM'#39#13#10'ORDER BY p.des_profissional'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 272
    Top = 192
  end
  object DSP_MetasProfissionais: TDataSetProvider
    DataSet = SDS_MetasProfissionais
    Options = [poRetainServerOrder]
    Left = 312
    Top = 208
  end
  object CDS_MetasHabilidades: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_MetasHabilidades'
    Left = 352
    Top = 258
    object CDS_MetasHabilidadesCOD_HABILIDADE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_HABILIDADE'
      Required = True
    end
    object CDS_MetasHabilidadesDES_HABSERV: TStringField
      DisplayLabel = 'Habilidade'
      FieldName = 'DES_HABSERV'
      Size = 80
    end
  end
  object DS_MetasHabilidades: TDataSource
    DataSet = CDS_MetasHabilidades
    Left = 401
    Top = 281
  end
  object SDS_MetasHabilidades: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'hs.cod_habilidade,'#13#10'ha.des_habserv'#13#10'FROM sal_prof_habili' +
      'dades hs, sal_hab_serv ha'#13#10#13#10'Where hs.cod_loja=hs.cod_loja'#13#10'AND ' +
      'hs.cod_habilidade=ha.cod_habserv'#13#10'AND ha.tip_habserv='#39'H'#39#13#10'AND  h' +
      's.cod_servico IS NULL'#13#10'AND  hs.cod_loja='#39'06'#39#13#10'AND  hs.cod_profis' +
      'sional='#39'000031'#39#13#10#13#10'ORDER BY 2'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 272
    Top = 264
  end
  object DSP_MetasHabilidades: TDataSetProvider
    DataSet = SDS_MetasHabilidades
    Options = [poRetainServerOrder]
    Left = 312
    Top = 280
  end
  object CDS_MetasProf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_MetasProf'
    Left = 352
    Top = 332
    object CDS_MetasProfCOD_LOJA: TStringField
      FieldName = 'COD_LOJA'
      Required = True
      Size = 2
    end
    object CDS_MetasProfCOD_PROFISSIONAL: TStringField
      FieldName = 'COD_PROFISSIONAL'
      Required = True
      FixedChar = True
      Size = 6
    end
    object CDS_MetasProfCOD_HABILIDADE: TIntegerField
      FieldName = 'COD_HABILIDADE'
      Required = True
    end
    object CDS_MetasProfDES_ANO: TIntegerField
      FieldName = 'DES_ANO'
      Required = True
    end
    object CDS_MetasProfPER_META_ANO: TFMTBCDField
      FieldName = 'PER_META_ANO'
      DisplayFormat = '0,.00'
      MaxValue = '100'
      MinValue = '0'
      Precision = 15
      Size = 2
    end
    object CDS_MetasProfOBJ_MES01: TFMTBCDField
      FieldName = 'OBJ_MES01'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_MetasProfPER_OBJ_MES01: TFMTBCDField
      FieldName = 'PER_OBJ_MES01'
      DisplayFormat = '0,.00'
      MaxValue = '100'
      MinValue = '0'
      Precision = 15
      Size = 2
    end
    object CDS_MetasProfOBJ_MES02: TFMTBCDField
      FieldName = 'OBJ_MES02'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_MetasProfPER_OBJ_MES02: TFMTBCDField
      FieldName = 'PER_OBJ_MES02'
      DisplayFormat = '0,.00'
      MaxValue = '100'
      MinValue = '0'
      Precision = 15
      Size = 2
    end
    object CDS_MetasProfOBJ_MES03: TFMTBCDField
      FieldName = 'OBJ_MES03'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_MetasProfPER_OBJ_MES03: TFMTBCDField
      FieldName = 'PER_OBJ_MES03'
      DisplayFormat = '0,.00'
      MaxValue = '100'
      MinValue = '0'
      Precision = 15
      Size = 2
    end
    object CDS_MetasProfOBJ_MES04: TFMTBCDField
      FieldName = 'OBJ_MES04'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_MetasProfPER_OBJ_MES04: TFMTBCDField
      FieldName = 'PER_OBJ_MES04'
      DisplayFormat = '0,.00'
      MaxValue = '100'
      MinValue = '0'
      Precision = 15
      Size = 2
    end
    object CDS_MetasProfOBJ_MES05: TFMTBCDField
      FieldName = 'OBJ_MES05'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_MetasProfPER_OBJ_MES05: TFMTBCDField
      FieldName = 'PER_OBJ_MES05'
      DisplayFormat = '0,.00'
      MaxValue = '100'
      MinValue = '0'
      Precision = 15
      Size = 2
    end
    object CDS_MetasProfOBJ_MES06: TFMTBCDField
      FieldName = 'OBJ_MES06'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_MetasProfPER_OBJ_MES06: TFMTBCDField
      FieldName = 'PER_OBJ_MES06'
      DisplayFormat = '0,.00'
      MaxValue = '100'
      MinValue = '0'
      Precision = 15
      Size = 2
    end
    object CDS_MetasProfOBJ_MES07: TFMTBCDField
      FieldName = 'OBJ_MES07'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_MetasProfPER_OBJ_MES07: TFMTBCDField
      FieldName = 'PER_OBJ_MES07'
      DisplayFormat = '0,.00'
      MaxValue = '100'
      MinValue = '0'
      Precision = 15
      Size = 2
    end
    object CDS_MetasProfOBJ_MES08: TFMTBCDField
      FieldName = 'OBJ_MES08'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_MetasProfPER_OBJ_MES08: TFMTBCDField
      FieldName = 'PER_OBJ_MES08'
      DisplayFormat = '0,.00'
      MaxValue = '100'
      MinValue = '0'
      Precision = 15
      Size = 2
    end
    object CDS_MetasProfOBJ_MES09: TFMTBCDField
      FieldName = 'OBJ_MES09'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_MetasProfPER_OBJ_MES09: TFMTBCDField
      FieldName = 'PER_OBJ_MES09'
      DisplayFormat = '0,.00'
      MaxValue = '100'
      MinValue = '0'
      Precision = 15
      Size = 2
    end
    object CDS_MetasProfOBJ_MES10: TFMTBCDField
      FieldName = 'OBJ_MES10'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_MetasProfPER_OBJ_MES10: TFMTBCDField
      FieldName = 'PER_OBJ_MES10'
      DisplayFormat = '0,.00'
      MaxValue = '100'
      MinValue = '0'
      Precision = 15
      Size = 2
    end
    object CDS_MetasProfOBJ_MES11: TFMTBCDField
      FieldName = 'OBJ_MES11'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_MetasProfPER_OBJ_MES11: TFMTBCDField
      FieldName = 'PER_OBJ_MES11'
      DisplayFormat = '0,.00'
      MaxValue = '100'
      MinValue = '0'
      Precision = 15
      Size = 2
    end
    object CDS_MetasProfOBJ_MES12: TFMTBCDField
      FieldName = 'OBJ_MES12'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_MetasProfPER_OBJ_MES12: TFMTBCDField
      FieldName = 'PER_OBJ_MES12'
      DisplayFormat = '0,.00'
      MaxValue = '100'
      MinValue = '0'
      Precision = 15
      Size = 2
    end
    object CDS_MetasProfUSU_INCLUI: TIntegerField
      FieldName = 'USU_INCLUI'
    end
    object CDS_MetasProfDTA_INCLUI: TSQLTimeStampField
      FieldName = 'DTA_INCLUI'
      Required = True
    end
    object CDS_MetasProfUSU_ALTERA: TIntegerField
      FieldName = 'USU_ALTERA'
    end
    object CDS_MetasProfDTA_ALTERA: TSQLTimeStampField
      FieldName = 'DTA_ALTERA'
    end
  end
  object DS_MetasProf: TDataSource
    DataSet = CDS_MetasProf
    Left = 401
    Top = 355
  end
  object SDS_MetasProf: TSQLDataSet
    CommandText = 
      'SELECT *'#13#10'from sal_metas m'#13#10'where m.cod_loja='#39'06'#39#13#10'and m.cod_pro' +
      'fissional='#39'000031'#39#13#10'and m.cod_habilidade=271'#13#10'AND m.des_ano=2014'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 272
    Top = 338
  end
  object DSP_MetasProf: TDataSetProvider
    DataSet = SDS_MetasProf
    Options = [poRetainServerOrder]
    Left = 312
    Top = 354
  end
  object CDS_V_PagtoProf: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 712
    Top = 8
    object CDS_V_PagtoProfCALCULAR: TStringField
      Alignment = taCenter
      DisplayLabel = 'Calcular?'
      FieldName = 'CALCULAR'
      Size = 3
    end
    object CDS_V_PagtoProfLOJA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Loja'
      FieldName = 'LOJA'
      Size = 6
    end
    object CDS_V_PagtoProfCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 6
    end
    object CDS_V_PagtoProfNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 60
    end
    object CDS_V_PagtoProfAPELIDO: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'APELIDO'
      Size = 60
    end
    object CDS_V_PagtoProfDIA_INICIO: TStringField
      DisplayLabel = 'Dia Inicial'
      FieldName = 'DIA_INICIO'
      Size = 7
    end
    object CDS_V_PagtoProfDIA_FINAL: TStringField
      DisplayLabel = 'Dia Final'
      FieldName = 'DIA_FINAL'
      Size = 7
    end
    object CDS_V_PagtoProfINI_ULT_CALCULO: TDateField
      Alignment = taCenter
      DisplayLabel = 'In'#237'cio Ult Calculo'
      FieldName = 'INI_ULT_CALCULO'
    end
    object CDS_V_PagtoProfFIM_ULT_CALCULO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Fim Ult Calculo'
      FieldName = 'FIM_ULT_CALCULO'
    end
    object CDS_V_PagtoProfDTA_INI_CALCULO: TStringField
      Alignment = taCenter
      DisplayLabel = 'In'#237'cio do Caluclo'
      FieldName = 'DTA_INI_CALCULO'
      FixedChar = True
      Size = 10
    end
    object CDS_V_PagtoProfDTA_FIM_CALCULO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Fim do Calculo'
      FieldName = 'DTA_FIM_CALCULO'
      FixedChar = True
      Size = 10
    end
    object CDS_V_PagtoProfPER_COMIS_SUPER: TFMTBCDField
      FieldName = 'PER_COMIS_SUPER'
      Visible = False
    end
    object CDS_V_PagtoProfSUPERVISOR: TStringField
      Alignment = taCenter
      DisplayLabel = 'Supervisor?'
      FieldName = 'SUPERVISOR'
      Size = 3
    end
    object CDS_V_PagtoProfVLR_SAL_MINIMO: TFMTBCDField
      DisplayLabel = 'Valor Sal M'#237'nimo'
      FieldName = 'VLR_SAL_MINIMO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_PagtoProfNUM_TECBIZ: TStringField
      FieldName = 'NUM_TECBIZ'
      Visible = False
      Size = 30
    end
    object CDS_V_PagtoProfNUM_INSS: TStringField
      FieldName = 'NUM_INSS'
      Visible = False
      Size = 30
    end
    object CDS_V_PagtoProfPER_INSS: TFMTBCDField
      FieldName = 'PER_INSS'
      Visible = False
      Size = 2
    end
    object CDS_V_PagtoProfNUM_BANCO: TIntegerField
      FieldName = 'NUM_BANCO'
      Visible = False
    end
    object CDS_V_PagtoProfDES_BANCO: TStringField
      FieldName = 'DES_BANCO'
      Visible = False
      Size = 50
    end
    object CDS_V_PagtoProfNUM_AGENCIA: TStringField
      FieldName = 'NUM_AGENCIA'
      Visible = False
    end
    object CDS_V_PagtoProfDES_AGENCIA: TStringField
      FieldName = 'DES_AGENCIA'
      Visible = False
      Size = 50
    end
    object CDS_V_PagtoProfNUM_CONTA: TStringField
      FieldName = 'NUM_CONTA'
      Visible = False
      Size = 60
    end
    object CDS_V_PagtoProfFIM_CONTRATO: TDateField
      FieldName = 'FIM_CONTRATO'
      Visible = False
    end
  end
  object DS_V_PagtoProf: TDataSource
    DataSet = CDS_V_PagtoProf
    Left = 768
    Top = 24
  end
  object CDS_V_PagtosVendas: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldNames = 'INDEX'
    Params = <>
    StoreDefs = True
    Left = 712
    Top = 72
    object CDS_V_PagtosVendasCOD_PROF: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd Prof'
      FieldName = 'COD_PROF'
      FixedChar = True
      Size = 6
    end
    object CDS_V_PagtosVendasDES_PROFISSIONAL: TStringField
      DisplayLabel = 'Nome Profissional'
      FieldName = 'DES_PROFISSIONAL'
      Size = 60
    end
    object CDS_V_PagtosVendasQTD_SERVICO: TFMTBCDField
      DisplayLabel = 'Qtd Servi'#231'o'
      FieldName = 'QTD_SERVICO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 4
    end
    object CDS_V_PagtosVendasVLR_TOTALITEM: TFMTBCDField
      DisplayLabel = 'Valor Prod'
      FieldName = 'VLR_TOTALITEM'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_PagtosVendasVLR_TOT_COMISSAO: TFMTBCDField
      DisplayLabel = 'Valor Comiss'#227'o'
      FieldName = 'VLR_TOT_COMISSAO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_PagtosVendasVLR_TOT_COMISSAO_SID: TFMTBCDField
      DisplayLabel = 'Valor Comiss'#227'o SIDICOM'
      FieldName = 'VLR_TOT_COMISSAO_SID'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_PagtosVendasPER_COMIS_SERV: TFMTBCDField
      DisplayLabel = '% Comiss'#227'o Serv'
      FieldName = 'PER_COMIS_SERV'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_PagtosVendasPER_COMIS_HAB: TFMTBCDField
      DisplayLabel = '% Comiss'#227'o Hab'
      FieldName = 'PER_COMIS_HAB'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_PagtosVendasPER_COMIS_GERAL: TFMTBCDField
      DisplayLabel = '% Comiss'#227'o Geral'
      FieldName = 'PER_COMIS_GERAL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_PagtosVendasPER_COMIS_SID: TFMTBCDField
      DisplayLabel = '% Comiss'#227'o SIDICOM'
      FieldName = 'PER_COMIS_SID'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_PagtosVendasNUM_DOCTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#186' Docto'
      FieldName = 'NUM_DOCTO'
      FixedChar = True
      Size = 6
    end
    object CDS_V_PagtosVendasDTA_COMPROV: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Comprov'
      FieldName = 'DTA_COMPROV'
    end
    object CDS_V_PagtosVendasCOD_COMPROV: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Comprov'
      FieldName = 'COD_COMPROV'
      FixedChar = True
      Size = 3
    end
    object CDS_V_PagtosVendasTIP_DOCTO: TStringField
      DisplayLabel = 'Tipo Documento'
      FieldName = 'TIP_DOCTO'
      FixedChar = True
    end
    object CDS_V_PagtosVendasCOD_PRODUTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd Produto'
      FieldName = 'COD_PRODUTO'
      FixedChar = True
      Size = 6
    end
    object CDS_V_PagtosVendasCOD_HABILIDADE: TIntegerField
      FieldName = 'COD_HABILIDADE'
      Visible = False
    end
    object CDS_V_PagtosVendasDES_HABILIDADE: TStringField
      DisplayLabel = 'Habilidade'
      FieldName = 'DES_HABILIDADE'
      Size = 80
    end
    object CDS_V_PagtosVendasCOD_SERVICO: TIntegerField
      FieldName = 'COD_SERVICO'
      Visible = False
    end
    object CDS_V_PagtosVendasDES_SERVICO: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'DES_SERVICO'
      Size = 80
    end
    object CDS_V_PagtosVendasSINTETICO: TStringField
      FieldName = 'SINTETICO'
      Visible = False
      Size = 1
    end
    object CDS_V_PagtosVendasINDEX: TIntegerField
      FieldName = 'INDEX'
      Visible = False
    end
  end
  object DS_V_PagtosVendas: TDataSource
    DataSet = CDS_V_PagtosVendas
    Left = 768
    Top = 88
  end
  object CDS_V_PagtosDebCred: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldNames = 'INDEX'
    Params = <>
    StoreDefs = True
    Left = 712
    Top = 144
    object CDS_V_PagtosDebCredCOD_PROF: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd Prof'
      FieldName = 'COD_PROF'
      FixedChar = True
      Size = 6
    end
    object CDS_V_PagtosDebCredDES_PROFISSIONAL: TStringField
      DisplayLabel = 'Descri'#231#227'o Profissional/Documento'
      FieldName = 'DES_PROFISSIONAL'
      Size = 60
    end
    object CDS_V_PagtosDebCredVLR_CREDITO: TFMTBCDField
      DisplayLabel = 'Valor Cr'#233'dito'
      FieldName = 'VLR_CREDITO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_PagtosDebCredVLR_DEBITO: TFMTBCDField
      DisplayLabel = 'Valor D'#233'bito'
      FieldName = 'VLR_DEBITO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_PagtosDebCredVLR_SALDO: TFMTBCDField
      DisplayLabel = 'Valor Saldo'
      FieldName = 'VLR_SALDO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_PagtosDebCredNUM_DOCTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#186' Docto'
      FieldName = 'NUM_DOCTO'
      FixedChar = True
      Size = 6
    end
    object CDS_V_PagtosDebCredVLR_ORIGINAL: TFMTBCDField
      DisplayLabel = 'Valor Original'
      FieldName = 'VLR_ORIGINAL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_PagtosDebCredNUM_PRESTACOES: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#186' Presta'#231#245'es'
      FieldName = 'NUM_PRESTACOES'
      Size = 6
    end
    object CDS_V_PagtosDebCredDTA_PRIM_VENC: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data 1'#186' Venc'
      FieldName = 'DTA_PRIM_VENC'
    end
    object CDS_V_PagtosDebCredNUM_PRESTACAO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#186' da Presta'#231#227'o'
      FieldName = 'NUM_PRESTACAO'
      Size = 6
    end
    object CDS_V_PagtosDebCredDTA_VENCIMENTO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DTA_VENCIMENTO'
    end
    object CDS_V_PagtosDebCredVLR_PRESTACAO: TFMTBCDField
      DisplayLabel = 'Valor Presta'#231#227'o'
      FieldName = 'VLR_PRESTACAO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_PagtosDebCredVLR_DESCONTO: TFMTBCDField
      DisplayLabel = 'Valor Descontos'
      FieldName = 'VLR_DESCONTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_PagtosDebCredVLR_ACRESCIMO: TFMTBCDField
      DisplayLabel = 'Valor Acrescimentos'
      FieldName = 'VLR_ACRESCIMO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_PagtosDebCredNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
    end
    object CDS_V_PagtosDebCredSINTETICO: TStringField
      FieldName = 'SINTETICO'
      Visible = False
      Size = 1
    end
    object CDS_V_PagtosDebCredINDEX: TIntegerField
      FieldName = 'INDEX'
      Visible = False
    end
    object CDS_V_PagtosDebCredTP_DOC: TIntegerField
      FieldName = 'TP_DOC'
    end
    object CDS_V_PagtosDebCredCODPROF: TStringField
      FieldName = 'CODPROF'
      Size = 6
    end
  end
  object DS_V_PagtosDebCred: TDataSource
    DataSet = CDS_V_PagtosDebCred
    Left = 768
    Top = 160
  end
  object CDS_V_Inss: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 304
    Top = 416
    object CDS_V_InssLOJA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Loja'
      FieldName = 'LOJA'
      Size = 6
    end
    object CDS_V_InssCODIGO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 6
    end
    object CDS_V_InssNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 60
    end
    object CDS_V_InssAPELIDO: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'APELIDO'
      Size = 60
    end
    object CDS_V_InssNUM_INSS: TStringField
      DisplayLabel = 'N'#186' Inscri'#231#227'o INSS'
      FieldName = 'NUM_INSS'
      Size = 60
    end
    object CDS_V_InssPER_INSS: TFMTBCDField
      DisplayLabel = '% Contribui'#231#227'o'
      FieldName = 'PER_INSS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_InssVLR_APAGAR: TFMTBCDField
      DisplayLabel = 'Valor de Contribui'#231#227'o'
      FieldName = 'VLR_APAGAR'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_InssDTA_VENCIMENTO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Venc'
      FieldName = 'DTA_VENCIMENTO'
    end
    object CDS_V_InssPAGO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Pago ?'
      FieldName = 'PAGO'
      Size = 3
    end
    object CDS_V_InssSIT_PREVIDENCIARIA: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SIT_PREVIDENCIARIA'
      Size = 30
    end
    object CDS_V_InssNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
      Visible = False
    end
  end
  object DS_V_Inss: TDataSource
    DataSet = CDS_V_Inss
    Left = 352
    Top = 432
  end
  object SDS_PagtosPlan: TSQLDataSet
    CommandText = 
      'SELECT -10 num_planilha, '#39'PLAN_'#39'||'#39'94'#39'||'#39' - Pagamento de Profiss' +
      'ionais de Sal'#227'o'#39' des_profissional,'#13#10' CAST('#39'03.06.2014'#39' AS DATE) ' +
      'Fim_Contrato,'#13#10' 0 vlr_comissao, 0 vlr_beneficios, 0 vlr_plano_sa' +
      'ude,'#13#10' '#39'CABECALHO1'#39' num_tecbiz, 0 Vlr_Tecbiz, 0 Vlr_Taxas, 0 vlr' +
      '_vales, 0 vlr_inss,'#13#10' '#39'CABECALHO1'#39' num_inss, 0 per_inss, 0 Vlr_A' +
      'rredonda, 0 Vlr_Deposito,'#13#10' 0 num_banco, '#39#39' des_banco, '#39#39' num_ag' +
      'encia, '#39#39' num_conta, 0 ordem, '#39'S'#39' Com_Saldo'#13#10' FROM RDB$DATABASE'#13 +
      #10#13#10' UNION'#13#10#13#10' SELECT -9 num_planilha, '#39#39','#13#10' CAST('#39'03.06.2014'#39' AS' +
      ' DATE) Fim_Contrato,'#13#10' 0 vlr_comissao, 0 vlr_beneficios, 0 vlr_p' +
      'lano_saude,'#13#10' '#39'LINHA BRANCO'#39' num_tecbiz, 0 Vlr_Tecbiz, 0 Vlr_Tax' +
      'as, 0 vlr_vales, 0 vlr_inss,'#13#10' '#39'LINHA BRANCO'#39' num_inss, 0 per_in' +
      'ss, 0 Vlr_Arredonda, 0 Vlr_Deposito,'#13#10' 0 num_banco, '#39#39' des_banco' +
      ', '#39#39' num_agencia, '#39#39' num_conta, 0 ordem, '#39'S'#39' Com_Saldo'#13#10' FROM RD' +
      'B$DATABASE'#13#10#13#10' UNION'#13#10#13#10' SELECT -8 num_planilha, '#39'Per'#237'odo de: '#39'|' +
      '|'#39'28.03.2014'#39'||'#39' a '#39'||'#39'03.06.2014'#39' des_profissional,'#13#10' CAST('#39'03.' +
      '06.2014'#39' AS DATE) Fim_Contrato,'#13#10' 0 vlr_comissao, 0 vlr_benefici' +
      'os, 0 vlr_plano_saude,'#13#10' '#39'CABECALHO1'#39' num_tecbiz, 0 Vlr_Tecbiz, ' +
      '0 Vlr_Taxas, 0 vlr_vales, 0 vlr_inss,'#13#10' '#39'CABECALHO1'#39' num_inss, 0' +
      ' per_inss, 0 Vlr_Arredonda, 0 Vlr_Deposito,'#13#10' 0 num_banco, '#39#39' de' +
      's_banco, '#39#39' num_agencia, '#39#39' num_conta, 0 ordem, '#39'S'#39' Com_Saldo'#13#10' ' +
      'FROM RDB$DATABASE'#13#10#13#10' UNION'#13#10#13#10' SELECT -7 num_planilha, '#39#39','#13#10' CA' +
      'ST('#39'03.06.2014'#39' AS DATE) Fim_Contrato,'#13#10' 0 vlr_comissao, 0 vlr_b' +
      'eneficios, 0 vlr_plano_saude,'#13#10' '#39'LINHA BRANCO'#39' num_tecbiz, 0 Vlr' +
      '_Tecbiz, 0 Vlr_Taxas, 0 vlr_vales, 0 vlr_inss,'#13#10' '#39'LINHA BRANCO'#39' ' +
      'num_inss, 0 per_inss, 0 Vlr_Arredonda, 0 Vlr_Deposito,'#13#10' 0 num_b' +
      'anco, '#39#39' des_banco, '#39#39' num_agencia, '#39#39' num_conta, 0 ordem, '#39'S'#39' C' +
      'om_Saldo'#13#10' FROM RDB$DATABASE'#13#10#13#10' UNION'#13#10#13#10' SELECT -6 num_planilh' +
      'a, '#39'BEL_'#39'||'#39'02'#39'||'#39' - '#39'||'#39'COL BELSHOP-PERFUMARIA E COSMETICA LTDA' +
      #39' des_profissional,'#13#10' CAST('#39'03.06.2014'#39' AS DATE) Fim_Contrato,'#13#10 +
      ' SUM(pp.vlr_comissao) vlr_comissao, SUM(pp.vlr_beneficios) vlr_b' +
      'eneficios, '#13#10' SUM(pp.vlr_plano_saude) vlr_plano_saude,'#13#10' '#39'CABECA' +
      'LHO2'#39' num_tecbiz, SUM(pp.vlr_tecbiz) vlr_tecbiz, SUM(pp.vlr_taxa' +
      's) vlr_taxas, SUM(pp.vlr_vales) vlr_vales, SUM(pp.vlr_inss) vlr_' +
      'inss,'#13#10' '#39'CABECALHO2'#39' num_inss, 0 per_inss, SUM(pp.vlr_Arredonda)' +
      ' vlr_Arredonda, SUM(pp.vlr_saldo) Vlr_Deposito,'#13#10' 0 num_banco, '#39 +
      #39' des_banco, '#39#39' num_agencia, '#39#39' num_conta, 0 ordem, '#39'S'#39' Com_Sald' +
      'o'#13#10' FROM SAL_PLAN_PAGTO pp'#13#10' WHERE pp.num_planilha=96'#13#10' AND   pp' +
      '.cod_loja='#39'02'#39#13#10'/*'#13#10' FROM SAL_PLAN_PAGTO pp, sal_profissionais p' +
      'f'#13#10' WHERE pp.cod_loja=pf.cod_loja'#13#10' AND   pp.cod_profissional=pf' +
      '.cod_profissional'#13#10' AND   pp.num_planilha=96'#13#10' AND   pp.cod_loja' +
      '='#39'02'#39#13#10'*/'#13#10#13#10' UNION'#13#10#13#10' SELECT -5 num_planilha, '#39#39','#13#10' CAST('#39'03.0' +
      '6.2014'#39' AS DATE) Fim_Contrato,'#13#10' 0 vlr_comissao, 0 vlr_beneficio' +
      's, 0 vlr_plano_saude,'#13#10' '#39'LINHA BRANCO'#39' num_tecbiz, 0 Vlr_Tecbiz,' +
      ' 0 Vlr_Taxas, 0 vlr_vales, 0 vlr_inss,'#13#10' '#39'LINHA BRANCO'#39' num_inss' +
      ', 0 per_inss, 0 Vlr_Arredonda, 0 Vlr_Deposito,'#13#10' 0 num_banco, '#39#39 +
      ' des_banco, '#39#39' num_agencia, '#39#39' num_conta, 0 ordem, '#39'S'#39' com_saldo' +
      #13#10' FROM RDB$DATABASE'#13#10' '#13#10' UNION'#13#10#13#10' SELECT 95 num_planilha, '#39'DEP' +
      'OSITOS '#39'||'#39'SANTANDER'#39','#13#10' CAST('#39'03.06.2014'#39' AS DATE) Fim_Contrato' +
      ','#13#10' 0 vlr_comissao, 0 vlr_beneficios, 0 vlr_plano_saude,'#13#10' '#39'CABE' +
      'CALHO BANCO'#39' num_tecbiz, 0 Vlr_Tecbiz, 0 Vlr_Taxas, 0 vlr_vales,' +
      ' 0 vlr_inss,'#13#10' '#39'CABECALHO BANCO'#39' num_inss, 0 per_inss, 0 Vlr_Arr' +
      'edonda, 0 Vlr_Deposito,'#13#10' 0 num_banco, '#39'SANTANDER'#39' des_banco, '#39#39 +
      ' num_agencia, '#39#39' num_conta, 0 ordem, '#39'S'#39' com_saldo'#13#10' FROM RDB$DA' +
      'TABASE'#13#10#13#10' UNION'#13#10#13#10' SELECT pp.num_planilha,'#13#10' pp.des_profission' +
      'al,'#13#10' CASE'#13#10'   WHEN ((pf.dta_fim_renovacao IS NULL) OR (TRIM(pf.' +
      'dta_fim_renovacao)='#39#39')) THEN'#13#10'     pf.dta_fim_contrato'#13#10'   ELSE'#13 +
      #10'     pf.dta_fim_renovacao'#13#10' END Fim_Contrato,'#13#10' pp.vlr_comissao' +
      ', pp.vlr_beneficios, pp.vlr_plano_saude, pp.num_tecbiz, pp.vlr_t' +
      'ecbiz,'#13#10' pp.Vlr_Taxas, pp.vlr_vales, pp.vlr_inss,'#13#10' pp.num_inss,' +
      ' pp.per_inss, pp.Vlr_Arredonda, pp.vlr_saldo Vlr_Deposito,'#13#10' pp.' +
      'num_banco, pp.des_banco, pp.num_agencia, pp.num_conta, 0 ordem,'#13 +
      #10' CASE'#13#10'   WHEN pp.vlr_saldo>0 Then '#39'S'#39#13#10'   ELSE'#13#10'   '#39#39#13#10' END Co' +
      'm_Saldo'#13#10#13#10' FROM SAL_PLAN_PAGTO pp, sal_profissionais pf'#13#10' WHERE' +
      ' pp.cod_loja=pf.cod_loja'#13#10' AND   pp.cod_profissional=pf.cod_prof' +
      'issional'#13#10' AND   pp.num_planilha=96'#13#10' AND   pp.cod_loja='#39'02'#39#13#10' A' +
      'ND   pp.num_banco=33'#13#10#13#10' UNION'#13#10#13#10' SELECT 961 num_planilha, '#39'{ T' +
      'OTAL: '#39'||pp.des_banco||'#39' }'#39','#13#10' CAST('#39'03.06.2014'#39' AS DATE) Fim_Co' +
      'ntrato,'#13#10' SUM(pp.vlr_comissao) vlr_comissao,'#13#10' SUM(pp.vlr_benefi' +
      'cios) vlr_beneficios,'#13#10' SUM(pp.vlr_plano_saude) vlr_plano_saude,' +
      #13#10' '#39'TOTAL BANCO'#39' num_tecbiz, SUM(pp.vlr_Tecbiz) vlr_Tecbiz, SUM(' +
      'pp.vlr_Taxas) vlr_Taxas, SUM(pp.vlr_vales) vlr_vales, SUM(pp.vlr' +
      '_inss) vlr_inss,'#13#10' '#39'TOTAL BANCO'#39' num_inss, 0 per_inss, SUM(pp.vl' +
      'r_Arredonda) Vlr_Arredonda, SUM(pp.vlr_saldo) Vlr_Deposito,'#13#10' 0 ' +
      'num_banco, pp.des_banco||'#39' TOTAL'#39', '#39#39' num_agencia, '#39#39' num_conta,' +
      ' 0 ordem, '#39'S'#39' com_saldo'#13#10' FROM SAL_PLAN_PAGTO pp'#13#10' WHERE pp.num_' +
      'planilha=96'#13#10' AND   pp.cod_loja='#39'02'#39#13#10' AND   pp.num_banco=33'#13#10' G' +
      'ROUP BY 17,2'#13#10#13#10' UNION'#13#10' '#13#10' SELECT 961 num_planilha,'#13#10' '#39'{ZZZZZZ}' +
      #39', CAST('#39'03.06.2014'#39' AS DATE) Fim_Contrato,'#13#10' 0 vlr_comissao, 0 ' +
      'vlr_beneficios, 0 vlr_plano_saude,'#13#10' '#39'LINHA BRANCO'#39' num_tecbiz, ' +
      '0 Vlr_Tecbiz, 0 Vlr_Taxas, 0 vlr_vales, 0 vlr_inss,'#13#10' '#39'LINHA BRA' +
      'NCO'#39' num_inss, 0 per_inss, 0 Vlr_Arredonda, 0 Vlr_Deposito, 0 nu' +
      'm_banco, '#39'SANTANDER'#39'||'#39' TOTAL'#39', '#39#39' num_agencia, '#39#39' num_conta, 0 ' +
      'ordem, '#39'S'#39' com_saldo'#13#10' FROM RDB$DATABASE'#13#10#13#10' UNION'#13#10#13#10' SELECT 95' +
      ' num_planilha, '#39'DEPOSITOS '#39'||'#39'BANRISUL'#39','#13#10' CAST('#39'03.06.2014'#39' AS ' +
      'DATE) Fim_Contrato,'#13#10' 0 vlr_comissao, 0 vlr_beneficios, 0 vlr_pl' +
      'ano_saude,'#13#10' '#39'CABECALHO BANCO'#39' num_tecbiz, 0 Vlr_Tecbiz, 0 Vlr_T' +
      'axas, 0 vlr_vales, 0 vlr_inss,'#13#10' '#39'CABECALHO BANCO'#39' num_inss, 0 p' +
      'er_inss, 0 Vlr_Arredonda, 0 Vlr_Deposito,  0 num_banco,'#13#10' '#39'BANRI' +
      'SUL'#39' des_banco, '#39#39' num_agencia, '#39#39' num_conta, 0 ordem, '#39'S'#39' com_s' +
      'aldo'#13#10' FROM RDB$DATABASE'#13#10#13#10' UNION'#13#10#13#10' SELECT pp.num_planilha, p' +
      'p.des_profissional,'#13#10' CASE'#13#10'   WHEN ((pf.dta_fim_renovacao IS NU' +
      'LL) OR (TRIM(pf.dta_fim_renovacao)='#39#39')) THEN'#13#10'     pf.dta_fim_co' +
      'ntrato'#13#10'   ELSE'#13#10'     pf.dta_fim_renovacao'#13#10' END Fim_Contrato,'#13#10 +
      ' pp.vlr_comissao, 0 vlr_beneficios, pp.vlr_plano_saude, pp.num_t' +
      'ecbiz, pp.vlr_tecbiz,'#13#10' pp.Vlr_Taxas, pp.vlr_vales, pp.vlr_inss,' +
      #13#10' pp.num_inss, pp.per_inss, pp.Vlr_Arredonda, pp.vlr_saldo Vlr_' +
      'Deposito, pp.num_banco,'#13#10' pp.des_banco, pp.num_agencia, pp.num_c' +
      'onta, 0 ordem,'#13#10' CASE'#13#10'   WHEN pp.vlr_saldo>0 Then'#13#10'     '#39'S'#39#13#10'  ' +
      ' ELSE'#13#10'     '#39#39#13#10' END Com_Saldo'#13#10' FROM SAL_PLAN_PAGTO pp, sal_pro' +
      'fissionais pf'#13#10' WHERE pp.cod_loja=pf.cod_loja'#13#10' AND   pp.cod_pro' +
      'fissional=pf.cod_profissional'#13#10' AND   pp.num_planilha=96'#13#10' AND  ' +
      ' pp.cod_loja='#39'02'#39#13#10' AND   pp.num_banco=41'#13#10#13#10' UNION'#13#10#13#10' SELECT 9' +
      '61 num_planilha,'#13#10' '#39'{ TOTAL: '#39'||pp.des_banco||'#39' }'#39', CAST('#39'03.06.' +
      '2014'#39' AS DATE) Fim_Contrato,'#13#10' SUM(pp.vlr_comissao) vlr_comissao' +
      ','#13#10' SUM(pp.vlr_beneficios) vlr_beneficios,'#13#10' SUM(pp.vlr_plano_sa' +
      'ude) vlr_plano_saude,'#13#10' '#39'TOTAL BANCO'#39' num_tecbiz, SUM(pp.vlr_Tec' +
      'biz) vlr_Tecbiz, SUM(pp.vlr_Taxas) vlr_Taxas, SUM(pp.vlr_vales) ' +
      'vlr_vales, SUM(pp.vlr_inss) vlr_inss,'#13#10' '#39'TOTAL BANCO'#39' num_inss, ' +
      '0 per_inss, SUM(pp.vlr_Arredonda) Vlr_Arredonda, SUM(pp.vlr_sald' +
      'o) Vlr_Deposito, 0 num_banco,'#13#10' pp.des_banco||'#39' TOTAL'#39', '#39#39' num_a' +
      'gencia, '#39#39' num_conta, 0 ordem, '#39'S'#39' com_saldo'#13#10' FROM SAL_PLAN_PAG' +
      'TO pp'#13#10' WHERE pp.num_planilha=96'#13#10' AND   pp.cod_loja='#39'02'#39#13#10' AND ' +
      '  pp.num_banco=41'#13#10' GROUP BY 17,2'#13#10#13#10' UNION'#13#10' '#13#10' SELECT 961 num_' +
      'planilha,'#13#10' '#39'{ZZZZZZ}'#39', CAST('#39'03.06.2014'#39' AS DATE) Fim_Contrato,' +
      #13#10' 0 vlr_comissao, 0 vlr_beneficios, 0 vlr_plano_saude,'#13#10' '#39'LINHA' +
      ' BRANCO'#39' num_tecbiz, 0 Vlr_Tecbiz, 0 Vlr_Taxas, 0 vlr_vales, 0 v' +
      'lr_inss,'#13#10' '#39'LINHA BRANCO'#39' num_inss, 0 per_inss, 0 Vlr_Arredonda,' +
      ' 0 Vlr_Deposito, 0 num_banco,'#13#10' '#39'BANRISUL'#39'||'#39' TOTAL'#39', '#39#39' num_age' +
      'ncia, '#39#39' num_conta, 0 ordem, '#39'S'#39' com_saldo'#13#10' FROM RDB$DATABASE'#13#10 +
      ' '#13#10' '#13#10' ORDER BY 16,1,2'#13#10' '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 672
    Top = 216
  end
  object DSP_PagtosPlan: TDataSetProvider
    DataSet = SDS_PagtosPlan
    Options = [poRetainServerOrder]
    Left = 712
    Top = 232
  end
  object CDS_PagtosPlan: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_PagtosPlan'
    Left = 752
    Top = 216
    object CDS_PagtosPlanDES_PROFISSIONAL: TStringField
      DisplayLabel = 'Profissional'
      FieldName = 'DES_PROFISSIONAL'
      Size = 60
    end
    object CDS_PagtosPlanFIM_CONTRATO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Fim Contrato'
      FieldName = 'FIM_CONTRATO'
    end
    object CDS_PagtosPlanVLR_COMISSAO: TFMTBCDField
      DisplayLabel = 'Vlr Comiss'#227'o'
      FieldName = 'VLR_COMISSAO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_PagtosPlanVLR_BENEFICIOS: TFMTBCDField
      DisplayLabel = 'Vlr Benef'#237'cios'
      FieldName = 'VLR_BENEFICIOS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_PagtosPlanVLR_PLANO_SAUDE: TFMTBCDField
      DisplayLabel = 'Vlr Plano Sa'#250'de'
      FieldName = 'VLR_PLANO_SAUDE'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_PagtosPlanNUM_TECBIZ: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#186' TecBiz'
      FieldName = 'NUM_TECBIZ'
      Size = 30
    end
    object CDS_PagtosPlanVLR_TECBIZ: TFMTBCDField
      DisplayLabel = 'Vlr TecBiz'
      FieldName = 'VLR_TECBIZ'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_PagtosPlanVLR_TAXAS: TFMTBCDField
      DisplayLabel = 'Vlr Taxas'
      FieldName = 'VLR_TAXAS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_PagtosPlanVLR_VALES: TFMTBCDField
      DisplayLabel = 'Vlr Vales'
      FieldName = 'VLR_VALES'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_PagtosPlanVLR_INSS: TFMTBCDField
      DisplayLabel = 'Vlr INSS'
      FieldName = 'VLR_INSS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_PagtosPlanNUM_INSS: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#186' INSS'
      FieldName = 'NUM_INSS'
      Size = 30
    end
    object CDS_PagtosPlanPER_INSS: TFMTBCDField
      DisplayLabel = '% INSS'
      FieldName = 'PER_INSS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_PagtosPlanVLR_ARREDONDA: TFMTBCDField
      DisplayLabel = 'Vlr Arrendonda'
      FieldName = 'VLR_ARREDONDA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_PagtosPlanVLR_DEPOSITO: TFMTBCDField
      DisplayLabel = 'Vlr Dep'#243'sito'
      FieldName = 'VLR_DEPOSITO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_PagtosPlanNUM_BANCO: TIntegerField
      DisplayLabel = 'N'#186' Banco'
      FieldName = 'NUM_BANCO'
    end
    object CDS_PagtosPlanDES_BANCO: TStringField
      DisplayLabel = 'Descri'#231#227'o Banco'
      FieldName = 'DES_BANCO'
      Size = 50
    end
    object CDS_PagtosPlanNUM_AGENCIA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#186' Ag'#234'ncia'
      FieldName = 'NUM_AGENCIA'
    end
    object CDS_PagtosPlanNUM_CONTA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#186' Conta'
      FieldName = 'NUM_CONTA'
      Size = 60
    end
    object CDS_PagtosPlanNUM_PLANILHA: TIntegerField
      FieldName = 'NUM_PLANILHA'
    end
    object CDS_PagtosPlanORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
    object CDS_PagtosPlanCOM_SALDO: TStringField
      FieldName = 'COM_SALDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object DS_PagtosPlan: TDataSource
    DataSet = CDS_PagtosPlan
    Left = 800
    Top = 232
  end
  object SDS_PagtosDebCred: TSQLDataSet
    CommandText = 'SELECT *'#13#10'FROM SAL_PLAN_DEBCRED'#13#10'WHERE NUM_PLANILHA<1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 672
    Top = 281
  end
  object DSP_PagtosDebCred: TDataSetProvider
    DataSet = SDS_PagtosDebCred
    Options = [poRetainServerOrder]
    Left = 712
    Top = 297
  end
  object CDS_PagtosDebCred: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_PagtosDebCred'
    Left = 752
    Top = 281
    object CDS_PagtosDebCredNUM_PLANILHA: TIntegerField
      FieldName = 'NUM_PLANILHA'
    end
    object CDS_PagtosDebCredCOD_LOJA: TStringField
      FieldName = 'COD_LOJA'
      FixedChar = True
      Size = 2
    end
    object CDS_PagtosDebCredCOD_PROFISSIONAL: TStringField
      FieldName = 'COD_PROFISSIONAL'
      FixedChar = True
      Size = 6
    end
    object CDS_PagtosDebCredDES_PROFISSIONAL: TStringField
      FieldName = 'DES_PROFISSIONAL'
      Size = 60
    end
    object CDS_PagtosDebCredVLR_CREDITOS: TFMTBCDField
      FieldName = 'VLR_CREDITOS'
      Precision = 15
      Size = 2
    end
    object CDS_PagtosDebCredVLR_DEBITOS: TFMTBCDField
      FieldName = 'VLR_DEBITOS'
      Precision = 15
      Size = 2
    end
    object CDS_PagtosDebCredVLR_SALDO: TFMTBCDField
      FieldName = 'VLR_SALDO'
      Precision = 15
      Size = 2
    end
    object CDS_PagtosDebCredNUM_DOCTO: TStringField
      FieldName = 'NUM_DOCTO'
    end
    object CDS_PagtosDebCredVLR_ORIGINAL: TFMTBCDField
      FieldName = 'VLR_ORIGINAL'
      Precision = 15
      Size = 2
    end
    object CDS_PagtosDebCredNUM_PRESTACOES: TStringField
      FieldName = 'NUM_PRESTACOES'
      Size = 10
    end
    object CDS_PagtosDebCredDTA_PRIM_VENC: TDateField
      FieldName = 'DTA_PRIM_VENC'
    end
    object CDS_PagtosDebCredNUM_PRESTACAO: TStringField
      FieldName = 'NUM_PRESTACAO'
      Size = 10
    end
    object CDS_PagtosDebCredDTA_VENCIMENTO: TDateField
      FieldName = 'DTA_VENCIMENTO'
    end
    object CDS_PagtosDebCredVLR_PRESTACAO: TFMTBCDField
      FieldName = 'VLR_PRESTACAO'
      Precision = 15
      Size = 2
    end
    object CDS_PagtosDebCredVLR_DESCONTO: TFMTBCDField
      FieldName = 'VLR_DESCONTO'
      Precision = 15
      Size = 2
    end
    object CDS_PagtosDebCredVLR_ACRESCIMOS: TFMTBCDField
      FieldName = 'VLR_ACRESCIMOS'
      Precision = 15
      Size = 2
    end
    object CDS_PagtosDebCredNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
    end
    object CDS_PagtosDebCredSINTETICO: TStringField
      FieldName = 'SINTETICO'
      Size = 1
    end
    object CDS_PagtosDebCredIDX_INDEX: TIntegerField
      FieldName = 'IDX_INDEX'
    end
    object CDS_PagtosDebCredTP_DOC: TIntegerField
      FieldName = 'TP_DOC'
    end
    object CDS_PagtosDebCredCODPROF: TStringField
      FieldName = 'CODPROF'
      Size = 6
    end
  end
  object DS_PagtosDebCred: TDataSource
    DataSet = CDS_PagtosDebCred
    Left = 800
    Top = 297
  end
  object SDS_PagtosVendas: TSQLDataSet
    CommandText = 'SELECT *'#13#10'FROM SAL_PLAN_VENDAS'#13#10'WHERE NUM_PLANILHA<1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 672
    Top = 345
  end
  object DSP_PagtosVendas: TDataSetProvider
    DataSet = SDS_PagtosVendas
    Options = [poRetainServerOrder]
    Left = 712
    Top = 361
  end
  object CDS_PagtosVendas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_PagtosVendas'
    Left = 752
    Top = 345
    object CDS_PagtosVendasNUM_PLANILHA: TIntegerField
      FieldName = 'NUM_PLANILHA'
    end
    object CDS_PagtosVendasCOD_LOJA: TStringField
      FieldName = 'COD_LOJA'
      FixedChar = True
      Size = 2
    end
    object CDS_PagtosVendasCOD_PROFISSIONAL: TStringField
      FieldName = 'COD_PROFISSIONAL'
      FixedChar = True
      Size = 6
    end
    object CDS_PagtosVendasDES_PROFISSIONAL: TStringField
      FieldName = 'DES_PROFISSIONAL'
      FixedChar = True
      Size = 60
    end
    object CDS_PagtosVendasQTD_SERVICO: TFMTBCDField
      FieldName = 'QTD_SERVICO'
      Precision = 15
      Size = 2
    end
    object CDS_PagtosVendasVLR_TOTALITEM: TFMTBCDField
      FieldName = 'VLR_TOTALITEM'
      Precision = 15
      Size = 2
    end
    object CDS_PagtosVendasVLR_TOT_COMISSAO: TFMTBCDField
      FieldName = 'VLR_TOT_COMISSAO'
      Precision = 15
      Size = 2
    end
    object CDS_PagtosVendasVLR_TOT_COMISSAO_SID: TFMTBCDField
      FieldName = 'VLR_TOT_COMISSAO_SID'
      Precision = 15
      Size = 2
    end
    object CDS_PagtosVendasPER_COMIS_SERV: TFMTBCDField
      FieldName = 'PER_COMIS_SERV'
      Precision = 15
      Size = 2
    end
    object CDS_PagtosVendasPER_COMIS_HAB: TFMTBCDField
      FieldName = 'PER_COMIS_HAB'
      Precision = 15
      Size = 2
    end
    object CDS_PagtosVendasPER_COMIS_GERAL: TFMTBCDField
      FieldName = 'PER_COMIS_GERAL'
      Precision = 15
      Size = 2
    end
    object CDS_PagtosVendasPER_COMIS_SID: TFMTBCDField
      FieldName = 'PER_COMIS_SID'
      Precision = 15
      Size = 2
    end
    object CDS_PagtosVendasNUM_DOCTO: TStringField
      FieldName = 'NUM_DOCTO'
      Size = 6
    end
    object CDS_PagtosVendasDTA_COMPROV: TDateField
      FieldName = 'DTA_COMPROV'
    end
    object CDS_PagtosVendasCOD_COMPROV: TStringField
      FieldName = 'COD_COMPROV'
      Size = 3
    end
    object CDS_PagtosVendasTIP_DOCTO: TStringField
      FieldName = 'TIP_DOCTO'
    end
    object CDS_PagtosVendasCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      Size = 6
    end
    object CDS_PagtosVendasCOD_HABILIDADE: TIntegerField
      FieldName = 'COD_HABILIDADE'
    end
    object CDS_PagtosVendasDES_HABILIDADE: TStringField
      FieldName = 'DES_HABILIDADE'
      Size = 80
    end
    object CDS_PagtosVendasCOD_SERVICO: TIntegerField
      FieldName = 'COD_SERVICO'
    end
    object CDS_PagtosVendasDES_SERVICO: TStringField
      FieldName = 'DES_SERVICO'
      Size = 80
    end
    object CDS_PagtosVendasSINTETICO: TStringField
      FieldName = 'SINTETICO'
      Size = 1
    end
    object CDS_PagtosVendasINDEX: TIntegerField
      FieldName = 'INDEX'
    end
  end
  object DS_PagtosVendas: TDataSource
    DataSet = CDS_PagtosVendas
    Left = 800
    Top = 361
  end
  object CDS_V_ManutPlSaude: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Des_Plano'
    Params = <>
    Left = 904
    Top = 242
    object CDS_V_ManutPlSaudeCod_Plano: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Cod_Plano'
    end
    object CDS_V_ManutPlSaudeDes_Plano: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Des_Plano'
      Size = 50
    end
    object CDS_V_ManutPlSaudeVlr_Titular: TCurrencyField
      DisplayLabel = 'Valor Titular'
      FieldName = 'Vlr_Titular'
      DisplayFormat = '0,.00'
    end
    object CDS_V_ManutPlSaudeVlr_Dependente: TCurrencyField
      DisplayLabel = 'Valor Depend'
      FieldName = 'Vlr_Dependente'
      DisplayFormat = '0,.00'
    end
    object CDS_V_ManutPlSaudeAlterar: TStringField
      FieldName = 'Alterar'
      Size = 3
    end
  end
  object DS_V_ManutPlSaude: TDataSource
    DataSet = CDS_V_ManutPlSaude
    Left = 992
    Top = 250
  end
  object CDS_V_TaxaSindicato: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 296
    Top = 496
    object CDS_V_TaxaSindicatoLOJA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Loja'
      FieldName = 'LOJA'
      Size = 6
    end
    object CDS_V_TaxaSindicatoCODIGO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 6
    end
    object CDS_V_TaxaSindicatoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 60
    end
    object CDS_V_TaxaSindicatoAPELIDO: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'APELIDO'
      Size = 60
    end
    object CDS_V_TaxaSindicatoNUM_DOCTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#186' Docto'
      FieldName = 'NUM_DOCTO'
      Size = 10
    end
    object CDS_V_TaxaSindicatoDES_DOCTO: TStringField
      DisplayLabel = 'Inscri'#231#227'o Sindicato'
      FieldName = 'DES_DOCTO'
      Size = 60
    end
    object CDS_V_TaxaSindicatoDTA_VENCIMENTO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Venc'
      FieldName = 'DTA_VENCIMENTO'
    end
    object CDS_V_TaxaSindicatoVLR_APAGAR: TFMTBCDField
      DisplayLabel = 'Valor Taxa'
      FieldName = 'VLR_APAGAR'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_V_TaxaSindicatoVLR_PAGO: TFMTBCDField
      DisplayLabel = 'Vlr Pago'
      FieldName = 'VLR_PAGO'
      DisplayFormat = '0,.00'
      Size = 2
    end
    object CDS_V_TaxaSindicatoDTA_PAGAMENTO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Pagto'
      FieldName = 'DTA_PAGAMENTO'
    end
    object CDS_V_TaxaSindicatoNUM_DOCTO_PAGTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#186' Doc Pagto'
      FieldName = 'NUM_DOCTO_PAGTO'
      Size = 10
    end
    object CDS_V_TaxaSindicatoNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
      Visible = False
    end
  end
  object DS_V_TaxaSindicato: TDataSource
    DataSet = CDS_V_TaxaSindicato
    Left = 352
    Top = 512
  end
  object CDS_V_ProfSeleciona: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 704
    Top = 416
    object CDS_V_ProfSelecionaPROC: TStringField
      FieldName = 'PROC'
      Size = 3
    end
    object CDS_V_ProfSelecionaCOD_LOJA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Loja'
      FieldName = 'COD_LOJA'
      Size = 2
    end
    object CDS_V_ProfSelecionaDES_PROFISSIONAL: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'DES_PROFISSIONAL'
      Size = 50
    end
    object CDS_V_ProfSelecionaDES_APELIDO: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'DES_APELIDO'
      Size = 40
    end
    object CDS_V_ProfSelecionaCOD_PROFISSIONAL: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PROFISSIONAL'
      Size = 6
    end
    object CDS_V_ProfSelecionaNUM_CPF: TStringField
      DisplayLabel = 'CPF_CNPJ'
      FieldName = 'NUM_CPF'
      Size = 14
    end
    object CDS_V_ProfSelecionaIND_ATIVO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Ativo'
      FieldName = 'IND_ATIVO'
      Size = 3
    end
  end
  object DS_V_ProfSeleciona: TDataSource
    DataSet = CDS_V_ProfSeleciona
    Left = 776
    Top = 432
  end
  object CDS_ApresGrid: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ApresGrid'
    Left = 960
    Top = 328
  end
  object DS_ApresGrid: TDataSource
    DataSet = CDS_ApresGrid
    Left = 1008
    Top = 344
  end
  object SDS_ApresGrid: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 880
    Top = 329
  end
  object DSP_ApresGrid: TDataSetProvider
    DataSet = SDS_ApresGrid
    Options = [poRetainServerOrder]
    Left = 920
    Top = 353
  end
  object CDS_TecBizApres: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_TecBizApres'
    Left = 960
    Top = 416
    object CDS_TecBizApresDTA_INI_PERIODO: TDateField
      Alignment = taCenter
      DisplayLabel = 'In'#237'cio'
      FieldName = 'DTA_INI_PERIODO'
    end
    object CDS_TecBizApresDTA_FIM_PERIODO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Fim'
      FieldName = 'DTA_FIM_PERIODO'
    end
    object CDS_TecBizApresCOD_TECBIZ: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd TecBiz'
      FieldName = 'COD_TECBIZ'
      Size = 6
    end
    object CDS_TecBizApresDES_PESSOA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'DES_PESSOA'
      Size = 60
    end
    object CDS_TecBizApresVLR_TECBIZ: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VLR_TECBIZ'
      Precision = 15
      Size = 2
    end
    object CDS_TecBizApresIND_PAGO: TStringField
      DisplayLabel = 'Pago ?'
      FieldName = 'IND_PAGO'
      Size = 3
    end
    object CDS_TecBizApresDES_ARQUIVO: TStringField
      DisplayLabel = 'Arquivo de Origem'
      FieldName = 'DES_ARQUIVO'
      Size = 50
    end
  end
  object DS_TecBizApres: TDataSource
    DataSet = CDS_TecBizApres
    Left = 1008
    Top = 432
  end
  object SDS_TecBizApres: TSQLDataSet
    CommandText = 
      'SELECT'#13#10't.dta_ini_periodo, t.dta_fim_periodo,'#13#10't.cod_tecbiz, t.d' +
      'es_pessoa,'#13#10't.vlr_tecbiz, t.ind_pago, t.des_arquivo'#13#10'FROM ps_tec' +
      'biz t'#13#10'WHERE t.dta_ini_periodo BETWEEN '#39'03.12.2014'#39' AND '#39'09.12.2' +
      '014'#39#13#10'AND t.dta_fim_periodo BETWEEN '#39'03.12.2014'#39' AND '#39'09.12.2014' +
      #39#13#10'ORDER BY t.des_arquivo,t.num_seq'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 880
    Top = 417
  end
  object DSP_TecBizApres: TDataSetProvider
    DataSet = SDS_TecBizApres
    Options = [poRetainServerOrder]
    Left = 920
    Top = 441
  end
  object CDS_V_RelPlanPagto: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'TP_DEPOSITO;DES_PROFISSIONAL'
    Params = <>
    Left = 792
    Top = 488
    object CDS_V_RelPlanPagtoTP_DEPOSITO: TStringField
      FieldName = 'TP_DEPOSITO'
      Size = 60
    end
    object CDS_V_RelPlanPagtoDES_PROFISSIONAL: TStringField
      FieldName = 'DES_PROFISSIONAL'
      Size = 60
    end
    object CDS_V_RelPlanPagtoDTA_FIM_CONTRATO: TDateField
      FieldName = 'DTA_FIM_CONTRATO'
    end
    object CDS_V_RelPlanPagtoVLR_VENDA: TFloatField
      FieldName = 'VLR_VENDA'
      DisplayFormat = '#,##0.00'
    end
    object CDS_V_RelPlanPagtoVLR_COMISSAO: TFloatField
      FieldName = 'VLR_COMISSAO'
      DisplayFormat = '#,##0.00'
    end
    object CDS_V_RelPlanPagtoVLR_BENEFICIO: TFloatField
      FieldName = 'VLR_BENEFICIO'
      DisplayFormat = '#,##0.00'
    end
    object CDS_V_RelPlanPagtoVLR_PLANOSAUDE: TFloatField
      FieldName = 'VLR_PLANOSAUDE'
      DisplayFormat = '#,##0.00'
    end
    object CDS_V_RelPlanPagtoNUM_TECBIZ: TStringField
      FieldName = 'NUM_TECBIZ'
      Size = 30
    end
    object CDS_V_RelPlanPagtoVLR_TECBIZ: TFloatField
      FieldName = 'VLR_TECBIZ'
      DisplayFormat = '#,##0.00'
    end
    object CDS_V_RelPlanPagtoVLR_TAXAS: TFloatField
      FieldName = 'VLR_TAXAS'
      DisplayFormat = '#,##0.00'
    end
    object CDS_V_RelPlanPagtoVLR_VALES: TFloatField
      FieldName = 'VLR_VALES'
      DisplayFormat = '#,##0.00'
    end
    object CDS_V_RelPlanPagtoVLR_INSS: TFloatField
      FieldName = 'VLR_INSS'
      DisplayFormat = '#,##0.00'
    end
    object CDS_V_RelPlanPagtoNUM_INSS: TStringField
      FieldName = 'NUM_INSS'
      Size = 30
    end
    object CDS_V_RelPlanPagtoPER_INSS: TFloatField
      FieldName = 'PER_INSS'
      DisplayFormat = '#,##0.00'
    end
    object CDS_V_RelPlanPagtoVLR_ARREDONDA: TFloatField
      FieldName = 'VLR_ARREDONDA'
      DisplayFormat = '#,##0.00'
    end
    object CDS_V_RelPlanPagtoVLR_DEPOSITO: TFloatField
      FieldName = 'VLR_DEPOSITO'
      DisplayFormat = '#,##0.00'
    end
    object CDS_V_RelPlanPagtoNUM_BANCO: TStringField
      FieldName = 'NUM_BANCO'
      Size = 10
    end
    object CDS_V_RelPlanPagtoDES_BANCO: TStringField
      FieldName = 'DES_BANCO'
      Size = 50
    end
    object CDS_V_RelPlanPagtoNUM_AGENCIA: TStringField
      FieldName = 'NUM_AGENCIA'
    end
    object CDS_V_RelPlanPagtoNUM_CONTA: TStringField
      FieldName = 'NUM_CONTA'
      Size = 60
    end
    object CDS_V_RelPlanPagtoCOD_PROF: TStringField
      FieldName = 'COD_PROF'
      Size = 6
    end
  end
  object CDS_PlanoSaudeApres: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_PlanoSaudeApres'
    Left = 952
    Top = 488
    object CDS_PlanoSaudeApresCOD_PESSOA: TIntegerField
      DisplayLabel = 'C'#243'd Prof'
      FieldName = 'COD_PESSOA'
      Required = True
    end
    object CDS_PlanoSaudeApresDES_PROFISSIONAL: TStringField
      DisplayLabel = 'Profissional'
      FieldName = 'DES_PROFISSIONAL'
      Size = 60
    end
    object CDS_PlanoSaudeApresDES_DOCTO: TStringField
      DisplayLabel = 'Plano Sa'#250'de - Descri'#231#227'o Movto'
      FieldName = 'DES_DOCTO'
      Size = 60
    end
    object CDS_PlanoSaudeApresDTA_VENCIMENTO: TDateField
      DisplayLabel = 'Vencto'
      FieldName = 'DTA_VENCIMENTO'
    end
    object CDS_PlanoSaudeApresVLR_APAGAR: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VLR_APAGAR'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_PlanoSaudeApresPAGTO: TStringField
      DisplayLabel = 'Pago ?'
      FieldName = 'PAGTO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object CDS_PlanoSaudeApresDES_ARQUIVO: TStringField
      DisplayLabel = 'Arquivo de Origem'
      FieldName = 'DES_ARQUIVO'
      Size = 50
    end
  end
  object DS_PlanoSaudeApres: TDataSource
    DataSet = CDS_PlanoSaudeApres
    Left = 1000
    Top = 504
  end
  object SDS_PlanoSaudeApres: TSQLDataSet
    CommandText = 
      'SELECT '#13#10'pl.cod_pessoa, pf.des_profissional,'#13#10'pl.des_docto,'#13#10'pl.' +
      'dta_vencimento,'#13#10'pl.vlr_apagar,'#13#10'case pl.vlr_pago'#13#10'  When 0 Then' +
      ' '#39'NAO'#39#13#10'  Else '#39'SIM'#39#13#10'END Pagto,'#13#10'pl.des_arquivo'#13#10#13#10'FROM ps_vale' +
      's_pessoas pl, sal_profissionais pf'#13#10'WHERE pl.cod_loja=pf.cod_loj' +
      'a'#13#10'AND   pl.cod_pessoa=pf.cod_profissional'#13#10'AND   pl.tp_pessoa=1' +
      #13#10'AND   pl.ind_debcred='#39'P'#39#13#10'AND   pl.dta_vencimento BETWEEN '#39'01.' +
      '04.2015'#39' AND '#39'30.04.2015'#39#13#10'ORDER BY pf.des_profissional, pl.dta_' +
      'vencimento, pl.des_arquivo, pl.num_seq'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 872
    Top = 489
  end
  object DSP_PlanoSaudeApres: TDataSetProvider
    DataSet = SDS_PlanoSaudeApres
    Options = [poRetainServerOrder]
    Left = 912
    Top = 513
  end
  object SDS_Beneficios: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#39'Bel_'#39'||b.cod_loja cod_loja,'#13#10'p.cod_profissional cod_pro' +
      'f, p.des_profissional profissional, p.ind_ativo Prof_Ativo,'#13#10'b.n' +
      'um_docto, b.des_docto, b.vlr_docto,'#13#10'b.dta_ini_beneficio, b.dta_' +
      'fim_beneficio, b.dta_ult_geracao, b.dta_ult_pagto,'#13#10'CASE'#13#10'  WHEN' +
      ' b.ind_uma_vez='#39'SIM'#39' THEN '#39'Unico'#39#13#10'  WHEN b.ind_diariamente='#39'SIM' +
      #39' THEN '#39'Diariamente'#39#13#10'  WHEN b.ind_semanamente='#39'SIM'#39' THEN '#39'Seman' +
      'almente'#39#13#10'  WHEN b.ind_mensalmente='#39'SIM'#39' THEN '#39'Mensalmente'#39#13#10'END' +
      ' Tipo_Pagto,'#13#10#13#10'Cast('#13#10'CASE'#13#10'  WHEN b.ind_uma_vez='#39'SIM'#39' THEN '#39'So' +
      'mente Uma Vez'#39#13#10'  WHEN b.ind_diariamente='#39'SIM'#39' THEN '#39'Todos os Di' +
      'as'#39#13#10'  WHEN b.ind_semanamente='#39'SIM'#39' THEN'#13#10'  CASE'#13#10'    WHEN (b.in' +
      'd_dia_seg='#39'SIM'#39') AND (b.tip_vlr_apagar=0) THEN '#39'Toda a Segunda -' +
      ' Valor Integral'#39#13#10'    WHEN (b.ind_dia_seg='#39'SIM'#39') AND (b.tip_vlr_' +
      'apagar=1) THEN '#39'Toda a Segunda - Valor Dia/M'#234's'#39#13#10#13#10'    WHEN (b.i' +
      'nd_dia_ter='#39'SIM'#39') AND (b.tip_vlr_apagar=0) THEN '#39'Toda a Ter'#231'a - ' +
      'Valor Integral'#39#13#10'    WHEN (b.ind_dia_ter='#39'SIM'#39') AND (b.tip_vlr_a' +
      'pagar=1) THEN '#39'Toda a Ter'#231'a - Valor Dia/M'#234's'#39#13#10#13#10'    WHEN (b.ind_' +
      'dia_qua='#39'SIM'#39') AND (b.tip_vlr_apagar=0) THEN '#39'Toda a Quarta - Va' +
      'lor Integral'#39#13#10'    WHEN (b.ind_dia_qua='#39'SIM'#39') AND (b.tip_vlr_apa' +
      'gar=1) THEN '#39'Toda a Quarta - Valor Dia/M'#234's'#39#13#10#13#10'    WHEN (b.ind_d' +
      'ia_qui='#39'SIM'#39') AND (b.tip_vlr_apagar=0) THEN '#39'Toda a Quinta - Val' +
      'or Integral'#39#13#10'    WHEN (b.ind_dia_qui='#39'SIM'#39') AND (b.tip_vlr_apag' +
      'ar=1) THEN '#39'Toda a Quinta - Valor Dia/M'#234's'#39#13#10#13#10'    WHEN (b.ind_di' +
      'a_sex='#39'SIM'#39') AND (b.tip_vlr_apagar=0) THEN '#39'Toda a Sexta - Valor' +
      ' Integral'#39#13#10'    WHEN (b.ind_dia_sex='#39'SIM'#39') AND (b.tip_vlr_apagar' +
      '=1) THEN '#39'Toda a Sexta - Valor Dia/M'#234's'#39#13#10'  END'#13#10#13#10'  WHEN b.ind_m' +
      'ensalmente='#39'SIM'#39' THEN'#13#10'  CASE'#13#10'    WHEN b.ind_dia_seg='#39'SIM'#39'  THE' +
      'N '#39'Toda '#39'||b.des_posicao_dia||'#39' Segunda do M'#234's'#39#13#10'    WHEN b.ind_' +
      'dia_ter='#39'SIM'#39'  THEN '#39'Toda '#39'||b.des_posicao_dia||'#39' Ter'#231'a do M'#234's'#39#13 +
      #10'    WHEN b.ind_dia_qua='#39'SIM'#39'  THEN '#39'Toda '#39'||b.des_posicao_dia||' +
      #39' Quarta do M'#234's'#39#13#10'    WHEN b.ind_dia_qui='#39'SIM'#39'  THEN '#39'Toda '#39'||b.' +
      'des_posicao_dia||'#39' Quinta do M'#234's'#39#13#10'    WHEN b.ind_dia_sex='#39'SIM'#39' ' +
      ' THEN '#39'Toda '#39'||b.des_posicao_dia||'#39' Sexta do M'#234's'#39#13#10'  END'#13#10#13#10'END ' +
      'as varchar(60)) Situacao_Pagto,'#13#10#13#10'CASE b.ind_ativo'#13#10'  WHEN '#39'S'#39' ' +
      'THEN '#39'SIM'#39#13#10'  ELSE '#39'NAO'#39#13#10'END ativo'#13#10'FROM ps_beneficios_pessoas ' +
      'b, sal_profissionais p'#13#10#13#10'WHERE b.cod_pessoa=p.cod_profissional'#13 +
      #10'AND b.cod_loja=p.cod_loja'#13#10'AND b.tp_pessoa=1'#13#10'AND b.ind_ativo='#39 +
      'S'#39#13#10#13#10'ORDER BY p.des_profissional, b.cod_loja'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 504
    Top = 33
  end
  object DSP_Beneficios: TDataSetProvider
    DataSet = SDS_Beneficios
    Options = [poRetainServerOrder]
    Left = 544
    Top = 49
  end
  object CDS_Beneficios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Beneficios'
    Left = 584
    Top = 33
    object CDS_BeneficiosCOD_LOJA: TStringField
      DisplayLabel = 'Loja'
      FieldName = 'COD_LOJA'
      Required = True
      Size = 6
    end
    object CDS_BeneficiosCOD_PROF: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PROF'
      Required = True
      FixedChar = True
      Size = 6
    end
    object CDS_BeneficiosPROFISSIONAL: TStringField
      DisplayLabel = 'Profissional'
      FieldName = 'PROFISSIONAL'
      Size = 60
    end
    object CDS_BeneficiosPROF_ATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'PROF_ATIVO'
      FixedChar = True
      Size = 3
    end
    object CDS_BeneficiosNUM_DOCTO: TIntegerField
      DisplayLabel = 'Docto'
      FieldName = 'NUM_DOCTO'
      DisplayFormat = '0.,'
    end
    object CDS_BeneficiosDES_DOCTO: TStringField
      DisplayLabel = 'Descri'#231#227'o Docto'
      FieldName = 'DES_DOCTO'
      Size = 60
    end
    object CDS_BeneficiosVLR_DOCTO: TFMTBCDField
      DisplayLabel = 'Vlr Docto'
      FieldName = 'VLR_DOCTO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_BeneficiosDTA_INI_BENEFICIO: TDateField
      DisplayLabel = 'Data Incial'
      FieldName = 'DTA_INI_BENEFICIO'
    end
    object CDS_BeneficiosDTA_FIM_BENEFICIO: TDateField
      DisplayLabel = 'Data Final'
      FieldName = 'DTA_FIM_BENEFICIO'
    end
    object CDS_BeneficiosDTA_ULT_GERACAO: TDateField
      Alignment = taCenter
      DisplayLabel = #218'lt Gera'#231#227'o'
      FieldName = 'DTA_ULT_GERACAO'
    end
    object CDS_BeneficiosDTA_ULT_PAGTO: TDateField
      Alignment = taCenter
      DisplayLabel = #218'lt Pagto'
      FieldName = 'DTA_ULT_PAGTO'
    end
    object CDS_BeneficiosTIPO_PAGTO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_PAGTO'
      FixedChar = True
      Size = 12
    end
    object CDS_BeneficiosSITUACAO_PAGTO: TStringField
      DisplayLabel = 'Situa'#231#227'o do Pagto'
      DisplayWidth = 60
      FieldName = 'SITUACAO_PAGTO'
      Size = 60
    end
    object CDS_BeneficiosATIVO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 3
    end
  end
  object DS_Beneficios: TDataSource
    DataSet = CDS_Beneficios
    Left = 632
    Top = 49
  end
  object CDS_V_ComissoesLojas: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CDS_V_ComissoesLojasAfterScroll
    Left = 520
    Top = 256
    object CDS_V_ComissoesLojasCOD_HABSERV: TIntegerField
      DisplayLabel = 'C'#243'd'
      FieldName = 'COD_HABSERV'
      ReadOnly = True
      Required = True
    end
    object CDS_V_ComissoesLojasDES_HABSERV: TStringField
      DisplayLabel = 'Desc Habilidade'
      FieldName = 'DES_HABSERV'
      ReadOnly = True
      Size = 80
    end
    object CDS_V_ComissoesLojasPORTOALEGRE: TFMTBCDField
      DisplayLabel = '% Porto Alegre'
      FieldName = 'PORTOALEGRE'
      DisplayFormat = '0,.00'
      MaxValue = '100'
      MinValue = '0'
      Precision = 15
      Size = 2
    end
    object CDS_V_ComissoesLojasCANOAS: TFMTBCDField
      DisplayLabel = '% Canoas'
      FieldName = 'CANOAS'
      DisplayFormat = '0,.00'
      MaxValue = '100'
      MinValue = '0'
      Precision = 15
      Size = 2
    end
    object CDS_V_ComissoesLojasGRAVATAI: TFMTBCDField
      DisplayLabel = '% Gravata'#237
      FieldName = 'GRAVATAI'
      DisplayFormat = '0,.00'
      MaxValue = '100'
      MinValue = '0'
      Precision = 15
      Size = 2
    end
    object CDS_V_ComissoesLojasVIAMAO: TFMTBCDField
      DisplayLabel = '% Viam'#227'o'
      FieldName = 'VIAMAO'
      DisplayFormat = '0,.00'
      MaxValue = '100'
      MinValue = '0'
      Precision = 15
      Size = 2
    end
  end
  object DS_V_ComissoesLojas: TDataSource
    DataSet = CDS_V_ComissoesLojas
    Left = 576
    Top = 272
  end
  object DS_PagtoMovtos: TDataSource
    Left = 536
    Top = 424
  end
end
