object DMConciliacao: TDMConciliacao
  OldCreateOrder = False
  Left = 237
  Top = 107
  Height = 604
  Width = 1121
  object SDS_Bancos: TSQLDataSet
    CommandText = 
      'select *'#13#10'from fin_bancos fb'#13#10'Order by fb.des_banco, fb.num_banc' +
      'o, fb.num_agencia, fb.num_conta'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 45
    Top = 6
  end
  object DSP_Bancos: TDataSetProvider
    DataSet = SDS_Bancos
    Options = [poRetainServerOrder]
    Left = 85
    Top = 30
  end
  object CDS_Bancos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Bancos'
    Left = 125
    Top = 14
    object CDS_BancosCOD_BANCO: TIntegerField
      FieldName = 'COD_BANCO'
      Required = True
      Visible = False
    end
    object CDS_BancosNUM_BANCO: TIntegerField
      DisplayLabel = 'N'#186' Banco'
      FieldName = 'NUM_BANCO'
    end
    object CDS_BancosDES_BANCO: TStringField
      DisplayLabel = 'Nome Banco'
      FieldName = 'DES_BANCO'
      Size = 50
    end
    object CDS_BancosNUM_AGENCIA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#186' Ag'#234'ncia'
      FieldName = 'NUM_AGENCIA'
      Size = 10
    end
    object CDS_BancosDES_AGENCIA: TStringField
      DisplayLabel = 'Nome Ag'#234'ncia'
      FieldName = 'DES_AGENCIA'
      Size = 40
    end
    object CDS_BancosNUM_CONTA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#186' Conta'
      FieldName = 'NUM_CONTA'
      Size = 60
    end
    object CDS_BancosCOD_LOJAS: TStringField
      DisplayLabel = 'Lojas'
      FieldName = 'COD_LOJAS'
      Size = 100
    end
    object CDS_BancosUSU_INCLUI: TIntegerField
      FieldName = 'USU_INCLUI'
    end
    object CDS_BancosDTA_INCLUI: TSQLTimeStampField
      FieldName = 'DTA_INCLUI'
      Required = True
    end
    object CDS_BancosUSU_ALTERA: TIntegerField
      FieldName = 'USU_ALTERA'
    end
    object CDS_BancosDTA_ALTERA: TSQLTimeStampField
      FieldName = 'DTA_ALTERA'
    end
  end
  object DS_Bancos: TDataSource
    DataSet = CDS_Bancos
    Left = 165
    Top = 30
  end
  object SDS_LojasBanco: TSQLDataSet
    CommandText = 
      'select lb.Cod_Banco, lb.cod_loja, ec.razao_social'#13#10'from fin_banc' +
      'os_lojas lb, emp_conexoes ec'#13#10'Where lb.cod_loja=ec.cod_filial'#13#10'A' +
      'nd lb.cod_banco= :CodBanco'#13#10'Order by lb.cod_loja '
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CodBanco'
        ParamType = ptInput
        Value = '1'
      end>
    SQLConnection = DMBelShop.SQLC
    Left = 45
    Top = 86
  end
  object DSP_LojasBanco: TDataSetProvider
    DataSet = SDS_LojasBanco
    Options = [poRetainServerOrder]
    Left = 85
    Top = 110
  end
  object CDS_LojasBanco: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'COD_BANCO'
    MasterFields = 'COD_BANCO'
    MasterSource = DS_Bancos
    PacketRecords = 0
    Params = <>
    ProviderName = 'DSP_LojasBanco'
    AfterScroll = CDS_LojasBancoAfterScroll
    Left = 125
    Top = 94
    object CDS_LojasBancoCOD_BANCO: TIntegerField
      FieldName = 'COD_BANCO'
    end
    object CDS_LojasBancoCOD_LOJA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_LOJA'
      Size = 2
    end
    object CDS_LojasBancoRAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAO_SOCIAL'
      Size = 60
    end
  end
  object DS_LojasBanco: TDataSource
    DataSet = CDS_LojasBanco
    Left = 165
    Top = 110
  end
  object DS_Extrato: TDataSource
    DataSet = CDS_Extrato
    Left = 165
    Top = 166
  end
  object CDS_Extrato: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Extrato'
    Left = 125
    Top = 158
    object CDS_ExtratoNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
      Visible = False
    end
    object CDS_ExtratoDTA_EXTRATO: TStringField
      FieldName = 'DTA_EXTRATO'
      Visible = False
      Size = 10
    end
    object CDS_ExtratoDATA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Dia'
      FieldName = 'DATA'
      Size = 10
    end
    object CDS_ExtratoDES_TPMOVTO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'DES_TPMOVTO'
      Size = 60
    end
    object CDS_ExtratoNUM_DOCTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Docto'
      FieldName = 'NUM_DOCTO'
      Size = 10
    end
    object CDS_ExtratoVLR_DOCTO: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VLR_DOCTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ExtratoIND_TIPO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Deb/Cre'
      FieldName = 'IND_TIPO'
      Size = 2
    end
  end
  object SDS_Extrato: TSQLDataSet
    CommandText = 
      'SELECT 1 num_seq, '#39#39' dta_extrato,'#13#10#39#39' Data,'#13#10#39'Banco: 41-BANRISUL' +
      #39' des_tpmovto,'#13#10#39#39' num_docto, 0 vlr_docto, '#39#39' ind_tipo'#13#10#13#10'FROM R' +
      'DB$DATABASE'#13#10#13#10'Union'#13#10#13#10'SELECT 2 num_seq, '#39#39' dta_extrato,'#13#10#39#39' Da' +
      'ta,'#13#10#39'Ag'#234'ncia: 0041-COLISEU'#39' des_tpmovto,'#13#10#39#39' num_docto, 0 vlr_d' +
      'octo, '#39#39' ind_tipo'#13#10#13#10'FROM RDB$DATABASE'#13#10#13#10'Union'#13#10#13#10'SELECT 3 num_' +
      'seq, '#39#39' dta_extrato,'#13#10#39#39' Data,'#13#10#39'Conta: 06.66954.1-2'#39' des_tpmovt' +
      'o,'#13#10#39#39' num_docto, 0 vlr_docto, '#39#39' ind_tipo'#13#10#13#10'FROM RDB$DATABASE'#13 +
      #10#13#10'Union'#13#10#13#10'SELECT 4 num_seq, '#39#39' dta_extrato,'#13#10#39#39' Data,'#13#10#39#39' des_' +
      'tpmovto,'#13#10#39#39' num_docto, 0 vlr_docto, '#39#39' ind_tipo'#13#10#13#10'FROM RDB$DAT' +
      'ABASE'#13#10#13#10'Union'#13#10#13#10'SELECT ex.num_seq, ex.dta_extrato,'#13#10'CASE'#13#10'  WH' +
      'EN (ex.num_seq=1 OR ex.num_seq=999999)  THEN'#13#10'    CAST(LPAD(EXTR' +
      'ACT(DAY FROM ex.dta_extrato),2,'#39'0'#39') AS VARCHAR(2))||'#39'/'#39'||'#13#10'    C' +
      'AST(LPAD(EXTRACT(MONTH FROM ex.dta_extrato),2,'#39'0'#39') AS VARCHAR(2)' +
      ')||'#39'/'#39'||'#13#10'    CAST(LPAD(EXTRACT(YEAR FROM ex.dta_extrato),4,'#39'0'#39')' +
      ' AS VARCHAR(4))'#13#10'  ELSE '#39#39#13#10'END data,'#13#10#13#10'tm.des_tpmovto,'#13#10'ex.num' +
      '_docto, ex.vlr_docto, tm.ind_tipo'#13#10#13#10'FROM FIN_BANCOS_EXTRATOS ex' +
      ', fin_bancos_tp_movtos tm'#13#10#13#10'WHERE ex.cod_banco=tm.cod_banco'#13#10'AN' +
      'D ex.cod_tpmovto=tm.cod_tpmovto'#13#10#13#10'AND ('#13#10'     (ex.dta_extrato B' +
      'ETWEEN '#39'06.01.2014'#39' AND '#39'09.01.2014'#39')'#13#10'     OR (ex.dta_extrato='#39 +
      '05.01.2014'#39' AND ex.num_seq=999999)'#13#10'    )'#13#10'and ex.cod_banco=1'#13#10'O' +
      'RDER BY 2, 1'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 45
    Top = 158
  end
  object DSP_Extrato: TDataSetProvider
    DataSet = SDS_Extrato
    Options = [poRetainServerOrder]
    Left = 85
    Top = 182
  end
  object DS_LojasBancos: TDataSource
    DataSet = CDS_LojasBancos
    Left = 165
    Top = 254
  end
  object CDS_LojasBancos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_LojasBancos'
    Left = 125
    Top = 238
  end
  object SDS_LojasBancos: TSQLDataSet
    CommandText = 
      'SELECT b.cod_banco, b.num_banco, b.des_banco,'#13#10'b.num_agencia, b.' +
      'des_agencia, b.num_conta'#13#10'FROM fin_bancos b, fin_bancos_lojas l'#13 +
      #10'WHERE b.cod_banco=l.cod_banco'#13#10'AND l.cod_loja='#39'03'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 45
    Top = 238
  end
  object DSP_LojasBancos: TDataSetProvider
    DataSet = SDS_LojasBancos
    Options = [poRetainServerOrder]
    Left = 85
    Top = 262
  end
  object DS_ConcExtratos: TDataSource
    DataSet = CDS_ConcExtratos
    Left = 422
    Top = 47
  end
  object CDS_ConcExtratos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ConcExtratos'
    Left = 368
    Top = 29
    object CDS_ConcExtratosNUM_BANCO: TIntegerField
      DisplayLabel = 'N'#186' Bco'
      FieldName = 'NUM_BANCO'
    end
    object CDS_ConcExtratosDES_BANCO: TStringField
      DisplayLabel = 'Decri'#231#227'o Banco'
      FieldName = 'DES_BANCO'
      Size = 50
    end
    object CDS_ConcExtratosNUM_AGENCIA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'NUM_AGENCIA'
      Size = 10
    end
    object CDS_ConcExtratosNUM_CONTA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#186' Conta'
      FieldName = 'NUM_CONTA'
      Size = 60
    end
    object CDS_ConcExtratosDTA_EXTRATO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dia'
      FieldName = 'DTA_EXTRATO'
    end
    object CDS_ConcExtratosCOD_TPMOVTO: TIntegerField
      FieldName = 'COD_TPMOVTO'
      Visible = False
    end
    object CDS_ConcExtratosDES_TPMOVTO: TStringField
      DisplayLabel = 'Descri'#231#227'o do Movto'
      FieldName = 'DES_TPMOVTO'
      Size = 60
    end
    object CDS_ConcExtratosNUM_DOCTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#186' Docto'
      FieldName = 'NUM_DOCTO'
      Size = 10
    end
    object CDS_ConcExtratosVLR_DOCTO: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VLR_DOCTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_ConcExtratosIND_TIPO: TStringField
      Alignment = taCenter
      DisplayLabel = 'D'#233'b/Cr'#233
      FieldName = 'IND_TIPO'
      Size = 2
    end
    object CDS_ConcExtratosConciliado: TStringField
      Alignment = taCenter
      DisplayLabel = 'Conc ?'
      FieldName = 'Conciliado'
      Required = True
      FixedChar = True
      Size = 3
    end
    object CDS_ConcExtratosCHV_EXTRATO: TStringField
      FieldName = 'CHV_EXTRATO'
      Required = True
      Visible = False
      Size = 30
    end
    object CDS_ConcExtratosCOD_BANCO: TIntegerField
      FieldName = 'COD_BANCO'
    end
    object CDS_ConcExtratosCHV_CONCILIADA: TStringField
      FieldName = 'CHV_CONCILIADA'
      Size = 30
    end
  end
  object SDS_ConcExtratos: TSQLDataSet
    CommandText = 
      'SELECT b.num_banco, b.des_banco, b.num_agencia, b.num_conta,'#13#10'e.' +
      'dta_extrato, e.cod_tpmovto, m.des_tpmovto, e.num_docto, e.vlr_do' +
      'cto, m.ind_tipo,'#13#10'CASE'#13#10'   WHEN p.chv_extrato IS NULL THEN'#13#10'    ' +
      ' '#39'NAO'#39#13#10'   ELSE'#13#10'     '#39'SIM'#39#13#10'END "Conciliado",'#13#10'e.chv_extrato, e' +
      '.cod_banco, p.chv_extrato chv_conciliada'#13#10#13#10'FROM fin_bancos_extr' +
      'atos e'#13#10'    LEFT JOIN fin_bancos_tp_movtos m    ON m.cod_tpmovto' +
      '=e.cod_tpmovto'#13#10'                                       AND m.cod' +
      '_banco=e.cod_banco'#13#10'    LEFT JOIN fin_conciliacao_pagtos p  ON p' +
      '.chv_extrato=e.chv_extrato'#13#10'    LEFT JOIN fin_bancos b          ' +
      '    ON b.cod_banco=e.cod_banco'#13#10#13#10'WHERE m.ind_tipo='#39'D'#39#13#10'AND   e.' +
      'dta_extrato between '#39'07.01.2014'#39' And '#39'09.01.2014'#39#13#10'AND   e.cod_b' +
      'anco IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, ' +
      '17, 18, 19, 20, 21, 22, 23, 24)'#13#10'AND   e.Num_Seq<>999999'#13#10#13#10'ORDE' +
      'R BY b.Des_Banco, b.num_banco, b.num_agencia, b.num_conta, e.dta' +
      '_extrato, e.num_seq'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 272
    Top = 32
  end
  object DSP_ConcExtratos: TDataSetProvider
    DataSet = SDS_ConcExtratos
    Options = [poRetainServerOrder]
    Left = 320
    Top = 48
  end
  object SDS_CMExtratos: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'  CASE'#13#10'   WHEN p.chv_extrato IS NULL THEN'#13#10'     '#39'N'#195'O'#39#13#10 +
      '   ELSE'#13#10'     '#39'SIM'#39#13#10' END "Conciliado?",'#13#10' p.ind_quem QUEM,'#13#10#13#10' ' +
      'Case'#13#10'    when p.ind_quem='#39'SIS'#39' then'#13#10'      '#39'SIM'#39#13#10'    Else'#13#10'   ' +
      '  '#39'NAO'#39#13#10' End "Conciliar?",'#13#10#13#10' b.num_banco, b.des_banco, b.num_' +
      'agencia, b.num_conta,'#13#10' e.dta_extrato,'#13#10' e.cod_tpmovto, m.des_tp' +
      'movto,'#13#10' e.num_docto, e.vlr_docto, m.ind_tipo,'#13#10' e.chv_extrato, ' +
      'p.cod_usuario, p.tip_conciliacao, e.cod_banco'#13#10#13#10' FROM fin_banco' +
      's_extratos e'#13#10'          LEFT JOIN fin_bancos_tp_movtos m    ON m' +
      '.cod_tpmovto=e.cod_tpmovto'#13#10'                                    ' +
      '         AND m.cod_banco=e.cod_banco'#13#10'          LEFT JOIN fin_co' +
      'nciliacao_pagtos p  ON p.chv_extrato=e.chv_extrato'#13#10'          LE' +
      'FT JOIN fin_bancos b              ON b.cod_banco=e.cod_banco'#13#10#13#10 +
      ' WHERE m.ind_tipo='#39'D'#39#13#10' AND   e.dta_extrato='#39'07.01.2014'#39#13#10' AND  ' +
      ' e.cod_banco IN (15, 2)'#13#10#13#10' ORDER BY b.Des_Banco, b.num_banco, b' +
      '.num_agencia, b.num_conta, e.dta_extrato, e.num_seq'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 272
    Top = 106
  end
  object DSP_CMExtratos: TDataSetProvider
    DataSet = SDS_CMExtratos
    Options = [poRetainServerOrder]
    Left = 320
    Top = 122
  end
  object CDS_CMExtratos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_CMExtratos'
    Left = 368
    Top = 103
    object CDS_CMExtratosConciliado: TStringField
      FieldName = 'Conciliado?'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object CDS_CMExtratosQUEM: TStringField
      Alignment = taCenter
      DisplayLabel = 'Quem'
      FieldName = 'QUEM'
      ReadOnly = True
      Size = 3
    end
    object CDS_CMExtratosConciliar: TStringField
      Alignment = taCenter
      FieldName = 'Conciliar?'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object CDS_CMExtratosNUM_BANCO: TIntegerField
      DisplayLabel = 'N'#186' Banco'
      FieldName = 'NUM_BANCO'
      ReadOnly = True
    end
    object CDS_CMExtratosDES_BANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'DES_BANCO'
      ReadOnly = True
      Size = 50
    end
    object CDS_CMExtratosNUM_AGENCIA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'NUM_AGENCIA'
      ReadOnly = True
      Size = 10
    end
    object CDS_CMExtratosNUM_CONTA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#186' Conta'
      FieldName = 'NUM_CONTA'
      ReadOnly = True
      Size = 60
    end
    object CDS_CMExtratosDTA_EXTRATO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dia'
      FieldName = 'DTA_EXTRATO'
      ReadOnly = True
    end
    object CDS_CMExtratosCOD_TPMOVTO: TIntegerField
      FieldName = 'COD_TPMOVTO'
      ReadOnly = True
    end
    object CDS_CMExtratosDES_TPMOVTO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'DES_TPMOVTO'
      ReadOnly = True
      Size = 60
    end
    object CDS_CMExtratosNUM_DOCTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Docto'
      FieldName = 'NUM_DOCTO'
      ReadOnly = True
      Size = 10
    end
    object CDS_CMExtratosVLR_DOCTO: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VLR_DOCTO'
      ReadOnly = True
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMExtratosIND_TIPO: TStringField
      Alignment = taCenter
      DisplayLabel = 'D/C'
      FieldName = 'IND_TIPO'
      ReadOnly = True
      Size = 2
    end
    object CDS_CMExtratosCHV_EXTRATO: TStringField
      FieldName = 'CHV_EXTRATO'
      ReadOnly = True
      Size = 30
    end
    object CDS_CMExtratosCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      ReadOnly = True
    end
    object CDS_CMExtratosTIP_CONCILIACAO: TStringField
      DisplayLabel = 'Tipo Concilia'#231#227'o'
      FieldName = 'TIP_CONCILIACAO'
      ReadOnly = True
      Size = 4
    end
    object CDS_CMExtratosCOD_BANCO: TIntegerField
      FieldName = 'COD_BANCO'
    end
  end
  object DS_CMPagtos: TDataSource
    DataSet = CDS_CMPagtos
    Left = 422
    Top = 188
  end
  object CDS_CMPagtos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_CMPagtos'
    Left = 368
    Top = 167
    object CDS_CMPagtosCOD_LOJA: TStringField
      FieldName = 'COD_LOJA'
      ReadOnly = True
      Size = 6
    end
    object CDS_CMPagtosConciliado: TStringField
      FieldName = 'Conciliado?'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object CDS_CMPagtosQUEM: TStringField
      Alignment = taCenter
      DisplayLabel = 'Quem'
      FieldName = 'QUEM'
      ReadOnly = True
      Size = 3
    end
    object CDS_CMPagtosConciliar: TStringField
      Alignment = taCenter
      FieldName = 'Conciliar?'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object CDS_CMPagtosNUM_DOCTO: TStringField
      FieldName = 'NUM_DOCTO'
      ReadOnly = True
      Size = 6
    end
    object CDS_CMPagtosDTA_VENC: TDateField
      FieldName = 'DTA_VENC'
      ReadOnly = True
    end
    object CDS_CMPagtosDTA_PAGTO: TDateField
      FieldName = 'DTA_PAGTO'
      ReadOnly = True
    end
    object CDS_CMPagtosVLR_DOCTO: TFMTBCDField
      FieldName = 'VLR_DOCTO'
      ReadOnly = True
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMPagtosVLR_DESCONTO: TFMTBCDField
      FieldName = 'VLR_DESCONTO'
      ReadOnly = True
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMPagtosVLR_ACRESCIMO: TFMTBCDField
      FieldName = 'VLR_ACRESCIMO'
      ReadOnly = True
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMPagtosVLR_PAGTO: TFMTBCDField
      FieldName = 'VLR_PAGTO'
      ReadOnly = True
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMPagtosCOD_COMPROVANTE: TStringField
      FieldName = 'COD_COMPROVANTE'
      ReadOnly = True
      Size = 3
    end
    object CDS_CMPagtosNOMECOMPROVANTE: TStringField
      FieldName = 'NOMECOMPROVANTE'
      ReadOnly = True
      FixedChar = True
    end
    object CDS_CMPagtosCOD_FORNECEDOR: TStringField
      FieldName = 'COD_FORNECEDOR'
      ReadOnly = True
      Size = 6
    end
    object CDS_CMPagtosNOMEFORNECEDOR: TStringField
      FieldName = 'NOMEFORNECEDOR'
      ReadOnly = True
      Size = 40
    end
    object CDS_CMPagtosIND_PAGTO_PARCIAL: TStringField
      FieldName = 'IND_PAGTO_PARCIAL'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object CDS_CMPagtosNUM_PRESTACAO: TStringField
      FieldName = 'NUM_PRESTACAO'
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object CDS_CMPagtosNUM_SERIE: TStringField
      FieldName = 'NUM_SERIE'
      ReadOnly = True
      Size = 4
    end
    object CDS_CMPagtosRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      ReadOnly = True
      Size = 60
    end
    object CDS_CMPagtosDTA_DOCTO: TDateField
      FieldName = 'DTA_DOCTO'
      ReadOnly = True
    end
    object CDS_CMPagtosDTA_COMPR: TDateField
      FieldName = 'DTA_COMPR'
      ReadOnly = True
    end
    object CDS_CMPagtosCOD_BANCO: TStringField
      FieldName = 'COD_BANCO'
      ReadOnly = True
      Size = 3
    end
    object CDS_CMPagtosDES_BANCO: TStringField
      FieldName = 'DES_BANCO'
      ReadOnly = True
      Size = 30
    end
    object CDS_CMPagtosCOD_COBRANCA: TStringField
      FieldName = 'COD_COBRANCA'
      ReadOnly = True
      Size = 3
    end
    object CDS_CMPagtosOBS_TEXTO: TStringField
      FieldName = 'OBS_TEXTO'
      ReadOnly = True
      Size = 80
    end
    object CDS_CMPagtosNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
      ReadOnly = True
    end
    object CDS_CMPagtosNUM_COMPL: TIntegerField
      FieldName = 'NUM_COMPL'
      ReadOnly = True
    end
    object CDS_CMPagtosCHV_PAGTO: TStringField
      FieldName = 'CHV_PAGTO'
      ReadOnly = True
      Size = 23
    end
    object CDS_CMPagtosCHV_NOTA: TStringField
      FieldName = 'CHV_NOTA'
      ReadOnly = True
      Size = 23
    end
    object CDS_CMPagtosCHV_RECIBO: TStringField
      FieldName = 'CHV_RECIBO'
      ReadOnly = True
      Size = 23
    end
    object CDS_CMPagtosTIP_CONCILIACAO: TStringField
      DisplayLabel = 'Tipo Concilia'#231#227'o'
      FieldName = 'TIP_CONCILIACAO'
      ReadOnly = True
      Size = 4
    end
    object CDS_CMPagtosCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
  end
  object SDS_CMPagtos: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#39'Bel_'#39'||m.cod_loja cod_loja,'#13#10'm.ind_conciliacao "Concili' +
      'ado?",'#13#10'p.ind_quem QUEM,'#13#10'CASE'#13#10'  WHEN p.ind_quem  IS NULL THEN'#13 +
      #10'    '#39'SIM'#39#13#10'  ELSE'#13#10'   '#39'NAO'#39#13#10'END "Conciliar?",'#13#10#13#10'm.num_docto, ' +
      'm.dta_venc, m.dta_pagto,'#13#10'm.vlr_docto, m.vlr_desconto, m.vlr_acr' +
      'escimo, m.vlr_pagto, '#13#10'm.cod_comprovante, c.nomecomprovante,'#13#10'm.' +
      'cod_fornecedor, f.nomefornecedor,'#13#10'm.ind_pagto_parcial,'#13#10'm.num_p' +
      'restacao,'#13#10'm.num_serie, '#13#10'e.razao_social,'#13#10'm.dta_docto, m.dta_co' +
      'mpr,'#13#10'm.cod_banco, m.des_banco, m.cod_cobranca,'#13#10'm.obs_texto,'#13#10'm' +
      '.num_seq, m.num_compl,'#13#10'm.chv_pagto,'#13#10'm.chv_nota, m.chv_recibo,'#13 +
      #10'p.tip_conciliacao, p.cod_usuario'#13#10#13#10'FROM fin_conciliacao_movtos' +
      ' m'#13#10'   LEFT JOIN fin_conciliacao_pagtos p  ON p.num_seq=m.num_se' +
      'q'#13#10'                                      AND p.num_compl=m.num_c' +
      'ompl'#13#10'   LEFT JOIN comprv c                  ON c.codcomprovante' +
      '=m.cod_comprovante'#13#10'                                      AND c.' +
      'codloja=m.cod_loja'#13#10'   LEFT JOIN fornecedor f              ON f.' +
      'codfornecedor=m.cod_fornecedor'#13#10'   LEFT JOIN emp_conexoes e     ' +
      '       ON e.cod_filial=m.cod_loja'#13#10#13#10#13#10'WHERE m.cod_loja IN ('#39'01'#39 +
      ')'#13#10'AND m.dta_pagto = '#39'07.01.2014'#39#13#10#13#10'ORDER BY m.cod_loja, m.cod_' +
      'fornecedor, m.dta_venc, m.cod_comprovante'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 272
    Top = 170
  end
  object DSP_CMPagtos: TDataSetProvider
    DataSet = SDS_CMPagtos
    Options = [poRetainServerOrder]
    Left = 320
    Top = 186
  end
  object DS_CMExtratos: TDataSource
    DataSet = CDS_CMExtratos
    Left = 422
    Top = 122
  end
  object SDS_TpConciliacao: TSQLDataSet
    CommandText = 
      'select *'#13#10'from tab_auxiliar t'#13#10'where t.tip_aux=3'#13#10'And t.cod_aux>' +
      '0'#13#10'order by t.des_aux'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 52
    Top = 328
  end
  object DSP_TpConciliacao: TDataSetProvider
    DataSet = SDS_TpConciliacao
    Options = [poRetainServerOrder]
    Left = 93
    Top = 344
  end
  object CDS_TpConciliacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_TpConciliacao'
    Left = 136
    Top = 328
    object CDS_TpConciliacaoTIP_AUX: TIntegerField
      FieldName = 'TIP_AUX'
      Required = True
      Visible = False
    end
    object CDS_TpConciliacaoCOD_AUX: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_AUX'
      Required = True
    end
    object CDS_TpConciliacaoDES_AUX: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_AUX'
      Size = 50
    end
  end
  object DS_TpConciliacao: TDataSource
    DataSet = CDS_TpConciliacao
    Left = 184
    Top = 344
  end
  object SDS_CMApresPagtos: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#39'Bel_'#39'||m.cod_loja Cod_loja, e.razao_social,'#13#10#13#10'CASE'#13#10'  ' +
      'WHEN h.cod_tpmovto IS NOT NULL THEN'#13#10'     '#39'*'#39'||h.cod_tpmovto'#13#10'  ' +
      'ELSE'#13#10'     m.cod_comprovante'#13#10'END Comprov,'#13#10#13#10'CASE'#13#10'  WHEN h.cod' +
      '_tpmovto IS NOT NULL THEN'#13#10'    '#39'*'#39'||h.des_tpmovto'#13#10'  ELSE'#13#10'    c' +
      '.nomecomprovante'#13#10'END Comprovante,'#13#10#13#10'CASE'#13#10'  WHEN b.cod_banco I' +
      'S NOT NULL THEN'#13#10'    '#39'*'#39'||b.cod_banco'#13#10'  ELSE'#13#10'    m.cod_fornece' +
      'dor'#13#10'END Forn,'#13#10#13#10'CASE'#13#10'  WHEN b.cod_banco IS NOT NULL THEN'#13#10'   ' +
      ' '#39'*'#39'||b.des_banco'#13#10'  ELSE'#13#10'   f.nomefornecedor'#13#10'END "Fornecedor"' +
      ','#13#10#13#10'm.num_docto,'#13#10'm.dta_pagto,'#13#10'm.vlr_docto, m.vlr_desconto, m.' +
      'vlr_acrescimo, m.vlr_pagto, m.ind_pagto_parcial Parcial,'#13#10'm.dta_' +
      'venc,'#13#10'm.num_serie, m.num_prestacao Num_Prest,'#13#10'm.chv_pagto, p.c' +
      'od_usuario, u.des_usuario,'#13#10'p.tip_conciliacao'#13#10#13#10'FROM fin_concil' +
      'iacao_movtos m'#13#10'   Left Join fin_conciliacao_pagtos p  on m.num_' +
      'seq=p.num_seq'#13#10'                                      And   m.num' +
      '_compl=p.num_compl'#13#10'   left Join emp_conexoes e            on m.' +
      'cod_loja=e.cod_filial'#13#10'   Left Join comprv c                  on' +
      ' m.cod_comprovante=c.codcomprovante'#13#10'                           ' +
      '           And m.cod_loja=c.codloja'#13#10'   Left Join fornecedor f  ' +
      '            on m.cod_fornecedor=f.codfornecedor'#13#10'   Left Join ps' +
      '_usuarios u             on p.cod_usuario=u.cod_usuario'#13#10'   LEFT ' +
      'JOIN fin_bancos_tp_movtos h    ON h.cod_tpmovto=m.cod_histo_auto' +
      #13#10'   LEFT JOIN fin_bancos b              ON b.cod_banco=m.cod_ba' +
      'nco_auto'#13#10#13#10#13#10'Where m.ind_conciliacao='#39'SIM'#39#13#10'And   p.chv_extrato' +
      '= :CHV_EXTRATO'#13#10'Order by m.cod_loja, m.cod_fornecedor, m.dta_ven' +
      'c, m.cod_comprovante'#13#10#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CHV_EXTRATO'
        ParamType = ptInput
        Value = '1'
      end>
    SQLConnection = DMBelShop.SQLC
    Left = 272
    Top = 266
  end
  object DSP_CMApresPagtos: TDataSetProvider
    DataSet = SDS_CMApresPagtos
    Options = [poRetainServerOrder]
    Left = 320
    Top = 282
  end
  object CDS_CMApresPagtos: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DSP_CMApresPagtos'
    AfterScroll = CDS_CMApresPagtosAfterScroll
    Left = 368
    Top = 263
    object CDS_CMApresPagtosCOD_LOJA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Loja'
      FieldName = 'COD_LOJA'
      Required = True
      Size = 6
    end
    object CDS_CMApresPagtosRAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAO_SOCIAL'
      Size = 60
    end
    object CDS_CMApresPagtosCOMPROV: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Compr'
      FieldName = 'COMPROV'
      Required = True
      Size = 3
    end
    object CDS_CMApresPagtosCOMPROVANTE: TStringField
      DisplayLabel = 'Comrprovante'
      FieldName = 'COMPROVANTE'
      FixedChar = True
    end
    object CDS_CMApresPagtosFORN: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Forn'
      FieldName = 'FORN'
      Size = 6
    end
    object CDS_CMApresPagtosFORNECEDOR: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORNECEDOR'
      Size = 40
    end
    object CDS_CMApresPagtosNUM_DOCTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Docto'
      FieldName = 'NUM_DOCTO'
      Size = 6
    end
    object CDS_CMApresPagtosDTA_PAGTO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dta Pagto'
      FieldName = 'DTA_PAGTO'
    end
    object CDS_CMApresPagtosVLR_DOCTO: TFMTBCDField
      DisplayLabel = 'Vlr Docto'
      FieldName = 'VLR_DOCTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMApresPagtosVLR_DESCONTO: TFMTBCDField
      DisplayLabel = 'Vlr Desc'
      FieldName = 'VLR_DESCONTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMApresPagtosVLR_ACRESCIMO: TFMTBCDField
      DisplayLabel = 'Vlr Acresc'
      FieldName = 'VLR_ACRESCIMO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMApresPagtosVLR_PAGTO: TFMTBCDField
      DisplayLabel = 'Vlr Pago'
      FieldName = 'VLR_PAGTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMApresPagtosPARCIAL: TStringField
      DisplayLabel = 'Parcial ?'
      FieldName = 'PARCIAL'
      FixedChar = True
      Size = 1
    end
    object CDS_CMApresPagtosDTA_VENC: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dta_Venc'
      FieldName = 'DTA_VENC'
    end
    object CDS_CMApresPagtosNUM_SERIE: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'S'#233'rie'
      FieldName = 'NUM_SERIE'
      Size = 4
    end
    object CDS_CMApresPagtosNUM_PREST: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Nr Prest'
      FieldName = 'NUM_PREST'
      FixedChar = True
      Size = 2
    end
    object CDS_CMApresPagtosCHV_PAGTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Chv Pagto'
      FieldName = 'CHV_PAGTO'
      Required = True
      Size = 23
    end
    object CDS_CMApresPagtosCOD_USUARIO: TIntegerField
      DisplayLabel = 'Usua'
      FieldName = 'COD_USUARIO'
    end
    object CDS_CMApresPagtosDES_USUARIO: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'DES_USUARIO'
      Size = 50
    end
    object CDS_CMApresPagtosTIP_CONCILIACAO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tipo Concilia'#231#227'o'
      FieldName = 'TIP_CONCILIACAO'
      Size = 4
    end
    object CDS_CMApresPagtosVLR_TOTAL: TAggregateField
      FieldName = 'VLR_TOTAL'
      Active = True
      DisplayFormat = '#,0.00 '
      Expression = 'SUM(VLR_DOCTO)'
    end
  end
  object DS_CMApresExtrato: TDataSource
    DataSet = CDS_CMApresExtratos
    Left = 422
    Top = 353
  end
  object SDS_CMApresExtratos: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'b.num_banco, b.des_banco, b.num_agencia, b.num_conta,'#13#10'e' +
      '.dta_extrato,'#13#10'e.cod_tpmovto, t.des_tpmovto,'#13#10'e.num_docto, e.vlr' +
      '_docto,'#13#10't.ind_tipo,'#13#10'e.chv_extrato, p.cod_usuario, u.des_usuari' +
      'o,'#13#10'p.tip_conciliacao'#13#10#13#10'FROM fin_bancos_extratos e'#13#10'          L' +
      'EFT JOIN fin_bancos_tp_movtos t    ON t.cod_tpmovto=e.cod_tpmovt' +
      'o'#13#10'                                             AND t.cod_banco=' +
      'e.cod_banco'#13#10'          LEFT JOIN fin_conciliacao_pagtos p  ON p.' +
      'chv_extrato=e.chv_extrato'#13#10'          LEFT JOIN fin_bancos b     ' +
      '         ON b.cod_banco=e.cod_banco'#13#10'          LEFT JOIN ps_usua' +
      'rios u             ON p.cod_usuario=u.cod_usuario'#13#10#13#10'WHERE  exis' +
      'ts (select 1'#13#10'               from fin_conciliacao_movtos m'#13#10'    ' +
      '           Where m.num_seq= :NUM_SEQ'#13#10'               And   m.num' +
      '_compl= :NUM_COMPL'#13#10'               And   m.num_seq=p.num_seq'#13#10'  ' +
      '             And   m.num_compl=p.num_compl)'#13#10#13#10'ORDER BY b.Des_Ba' +
      'nco, b.num_banco, b.num_agencia, b.num_conta, e.dta_extrato, e.n' +
      'um_seq'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NUM_SEQ'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'NUM_COMPL'
        ParamType = ptInput
        Value = '1'
      end>
    SQLConnection = DMBelShop.SQLC
    Left = 272
    Top = 336
  end
  object DSP_CMApresExtratos: TDataSetProvider
    DataSet = SDS_CMApresExtratos
    Options = [poRetainServerOrder]
    Left = 320
    Top = 352
  end
  object DS_CMApresPagtos: TDataSource
    DataSet = CDS_CMApresPagtos
    Left = 422
    Top = 282
  end
  object SDS_CMTotalPagtos: TSQLDataSet
    CommandText = 
      'SELECT '#13#10' '#39'Bel_'#39'||m.cod_loja cod_loja,'#13#10' m.dta_pagto,'#13#10' SUM(m.vl' +
      'r_docto) vlr_docto,'#13#10' SUM(m.vlr_desconto) vlr_desconto,'#13#10' SUM(m.' +
      'vlr_acrescimo) vlr_acrescimo,'#13#10' SUM(m.vlr_pagto) vlr_pagto,'#13#10' CO' +
      'UNT(m.cod_loja) Tot_reg'#13#10#13#10' FROM FIN_CONCILIACAO_MOVTOS m'#13#10#13#10'WHE' +
      'RE m.dta_pagto BETWEEN '#39'07.01.2014'#39' AND '#39'08.01.2014'#39#13#10'AND m.cod_' +
      'loja IN ('#39'01'#39','#39'11'#39')'#13#10'GROUP BY 1,2'#13#10#13#10'ORDER BY 2,1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 272
    Top = 408
  end
  object DSP_CMTotalPagtos: TDataSetProvider
    DataSet = SDS_CMTotalPagtos
    Options = [poRetainServerOrder]
    Left = 320
    Top = 424
  end
  object CDS_CMTotalPagtos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_CMTotalPagtos'
    Left = 368
    Top = 405
    object CDS_CMTotalPagtosCOD_LOJA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Loja'
      FieldName = 'COD_LOJA'
      Required = True
      Size = 6
    end
    object CDS_CMTotalPagtosDTA_PAGTO: TDateField
      Alignment = taRightJustify
      DisplayLabel = 'Data Pagto'
      FieldName = 'DTA_PAGTO'
    end
    object CDS_CMTotalPagtosVLR_DOCTO: TFMTBCDField
      DisplayLabel = 'Valor Docto'
      FieldName = 'VLR_DOCTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMTotalPagtosVLR_DESCONTO: TFMTBCDField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'VLR_DESCONTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMTotalPagtosVLR_ACRESCIMO: TFMTBCDField
      DisplayLabel = 'Valor Acrescimo'
      FieldName = 'VLR_ACRESCIMO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMTotalPagtosVLR_PAGTO: TFMTBCDField
      DisplayLabel = 'Valor Pago'
      FieldName = 'VLR_PAGTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMTotalPagtosTOT_REG: TIntegerField
      DisplayLabel = 'Total Registros'
      FieldName = 'TOT_REG'
      Required = True
    end
  end
  object DS_CMTotalPagtos: TDataSource
    DataSet = CDS_CMTotalPagtos
    Left = 422
    Top = 424
  end
  object SDS_HistAuto: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'h.cod_tpmovto Cod_Historico, '#13#10'h.des_tpmovto Des_Histori' +
      'co,'#13#10#39'BEL_'#39'||h.cod_conc_loja Loja,'#13#10'b.num_banco, '#13#10'b.des_banco, ' +
      #13#10'b.num_agencia, '#13#10'b.num_conta,'#13#10'h.ind_tipo "Deb/Cre"'#13#10#13#10'FROM fi' +
      'n_bancos b, fin_bancos_tp_movtos h'#13#10#13#10'WHERE h.cod_banco=b.cod_ba' +
      'nco'#13#10'AND h.ind_tipo='#39'D'#39#13#10'AND h.cod_banco IS NOT NULL'#13#10'AND h.des_' +
      'tpmovto<>'#39'SALDO NA DATA'#39#13#10#13#10'ORDER BY 2, 5, 6, 7'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 293
    Top = 486
  end
  object DSP_HistAuto: TDataSetProvider
    DataSet = SDS_HistAuto
    Options = [poRetainServerOrder]
    Left = 333
    Top = 502
  end
  object CDS_HistAuto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_HistAuto'
    Left = 373
    Top = 486
    object CDS_HistAutoCOD_HISTORICO: TIntegerField
      DisplayLabel = 'Hist'
      FieldName = 'COD_HISTORICO'
    end
    object CDS_HistAutoDES_HISTORICO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'DES_HISTORICO'
      Size = 60
    end
    object CDS_HistAutoLOJA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Loja'
      FieldName = 'LOJA'
      Size = 6
    end
    object CDS_HistAutoNUM_BANCO: TIntegerField
      DisplayLabel = 'Nr Banco'
      FieldName = 'NUM_BANCO'
    end
    object CDS_HistAutoDES_BANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'DES_BANCO'
      Size = 50
    end
    object CDS_HistAutoNUM_AGENCIA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Nr Ag'#234'ncia'
      FieldName = 'NUM_AGENCIA'
      Size = 10
    end
    object CDS_HistAutoNUM_CONTA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Nr Conta'
      FieldName = 'NUM_CONTA'
      Size = 60
    end
    object CDS_HistAutoDebCre: TStringField
      Alignment = taCenter
      FieldName = 'Deb/Cre'
      Size = 2
    end
  end
  object DS_HistAuto: TDataSource
    DataSet = CDS_HistAuto
    Left = 413
    Top = 501
  end
  object DS_ConcCaixa: TDataSource
    DataSet = CDS_ConcCaixa
    Left = 184
    Top = 424
  end
  object SDS_ConcCaixaTotais: TSQLDataSet
    CommandText = 
      'SELECT cx.cod_credito, cx.des_credito,'#13#10'cx.vlr_credito, cx.vlr_i' +
      'nformado, cx.vlr_diferenca,'#13#10'CASE'#13#10'  when cx.vlr_diferenca>0 The' +
      'n'#13#10'    '#39'Vlr D'#233'bito MENOR que Vlr Cr'#233'dito'#39#13#10'  when cx.vlr_diferen' +
      'ca<0 Then'#13#10'    '#39'Vlr D'#233'bito MAIOR que Vlr Cr'#233'dito'#39#13#10'ELSE'#13#10'    '#39'Vl' +
      'r D'#233'bitos e Cr'#233'ditos FECHADOS'#39#13#10'END obs,'#13#10'cx.IND_INFORMADO, cx.U' +
      'SU_INCLUI'#13#10#13#10'FROM FIN_CONCILIACAO_CAIXA cx'#13#10'Where cx.cod_credito' +
      '=9999'#13#10'and   cx.Cod_Loja ='#39'01'#39#13#10'and   cx.dta_caixa='#39'25.09.2012'#39#13 +
      #10#13#10'Order by cx.IND_INFORMADO desc, cx.DES_CREDITO'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 52
    Top = 496
  end
  object DS_ConcCaixaTotais: TDataSource
    DataSet = CDS_ConcCaixaTotais
    Left = 184
    Top = 504
  end
  object DSP_ConcCaixaTotais: TDataSetProvider
    DataSet = SDS_ConcCaixaTotais
    Options = [poRetainServerOrder]
    Left = 93
    Top = 508
  end
  object CDS_ConcCaixaTotais: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ConcCaixaTotais'
    Left = 136
    Top = 488
    object CDS_ConcCaixaTotaisCOD_CREDITO: TIntegerField
      DisplayLabel = 'Cod'
      FieldName = 'COD_CREDITO'
    end
    object CDS_ConcCaixaTotaisDES_CREDITO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_CREDITO'
      Size = 40
    end
    object CDS_ConcCaixaTotaisVLR_CREDITO: TFMTBCDField
      DisplayLabel = 'Vlr Cr'#233'dito'
      FieldName = 'VLR_CREDITO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_ConcCaixaTotaisVLR_INFORMADO: TFMTBCDField
      DisplayLabel = 'Vlr Informado'
      FieldName = 'VLR_INFORMADO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_ConcCaixaTotaisVLR_DIFERENCA: TFMTBCDField
      DisplayLabel = 'Vlr Diferen'#231'a'
      FieldName = 'VLR_DIFERENCA'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_ConcCaixaTotaisIND_INFORMADO: TStringField
      DisplayLabel = 'Informado ?'
      FieldName = 'IND_INFORMADO'
      Size = 3
    end
    object CDS_ConcCaixaTotaisUSU_INCLUI: TIntegerField
      FieldName = 'USU_INCLUI'
      Visible = False
    end
    object CDS_ConcCaixaTotaisOBS: TStringField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      Required = True
      FixedChar = True
      Size = 32
    end
  end
  object CDS_ConcCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSp_ConcCaixa'
    Left = 136
    Top = 440
    object CDS_ConcCaixaNUM_SEQREG: TIntegerField
      FieldName = 'NUM_SEQREG'
    end
    object CDS_ConcCaixaNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
    end
    object CDS_ConcCaixaCOD_LOJA: TStringField
      Alignment = taRightJustify
      FieldName = 'COD_LOJA'
      Size = 2
    end
    object CDS_ConcCaixaDTA_CAIXA: TDateField
      Alignment = taCenter
      FieldName = 'DTA_CAIXA'
    end
    object CDS_ConcCaixaCOD_OPERADOR: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd'
      FieldName = 'COD_OPERADOR'
      Size = 2
    end
    object CDS_ConcCaixaDES_OPERADOR: TStringField
      DisplayLabel = 'Operador'
      FieldName = 'DES_OPERADOR'
      Size = 30
    end
    object CDS_ConcCaixaCOD_CREDITO: TIntegerField
      DisplayLabel = 'C'#243'd'
      FieldName = 'COD_CREDITO'
    end
    object CDS_ConcCaixaDES_CREDITO: TStringField
      DisplayLabel = 'Cr'#233'dito'
      FieldName = 'DES_CREDITO'
      Size = 40
    end
    object CDS_ConcCaixaVLR_CREDITO: TFMTBCDField
      DisplayLabel = 'Vlr Cr'#233'dito'
      FieldName = 'VLR_CREDITO'
      DisplayFormat = '0,.00'
      Precision = 2
      Size = 15
    end
    object CDS_ConcCaixaVLR_INFORMADO: TFMTBCDField
      DisplayLabel = 'Vlr Informado'
      FieldName = 'VLR_INFORMADO'
      DisplayFormat = '0,.00'
      Precision = 2
      Size = 15
    end
    object CDS_ConcCaixaVLR_DIFERENCA: TFMTBCDField
      FieldName = 'VLR_DIFERENCA'
      DisplayFormat = '0,.00'
      Precision = 2
      Size = 15
    end
    object CDS_ConcCaixaOBS: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS'
      Size = 42
    end
    object CDS_ConcCaixaIND_INFORMADO: TStringField
      FieldName = 'IND_INFORMADO'
      Size = 3
    end
    object CDS_ConcCaixaIND_FECHADO: TStringField
      FieldName = 'IND_FECHADO'
      Size = 3
    end
    object CDS_ConcCaixaUSU_INCLUI: TIntegerField
      FieldName = 'USU_INCLUI'
    end
    object CDS_ConcCaixaDTA_INCLUI: TSQLTimeStampField
      FieldName = 'DTA_INCLUI'
    end
    object CDS_ConcCaixaUSU_ALTERA: TIntegerField
      FieldName = 'USU_ALTERA'
    end
    object CDS_ConcCaixaDTA_ALTERA: TSQLTimeStampField
      FieldName = 'DTA_ALTERA'
    end
  end
  object SDS_ConcCaixa: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 52
    Top = 436
  end
  object DSP_ConcCaixa: TDataSetProvider
    DataSet = SDS_ConcCaixa
    Options = [poRetainServerOrder]
    Left = 93
    Top = 420
  end
  object CDS_CMApresExtratos: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DSP_CMApresExtratos'
    AfterScroll = CDS_CMApresExtratosAfterScroll
    Left = 368
    Top = 333
    object CDS_CMApresExtratosNUM_BANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'NUM_BANCO'
    end
    object CDS_CMApresExtratosDES_BANCO: TStringField
      DisplayLabel = 'Nome Banco'
      FieldName = 'DES_BANCO'
      Size = 50
    end
    object CDS_CMApresExtratosNUM_AGENCIA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'NUM_AGENCIA'
      Size = 10
    end
    object CDS_CMApresExtratosNUM_CONTA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Nr Conta'
      FieldName = 'NUM_CONTA'
      Size = 60
    end
    object CDS_CMApresExtratosDTA_EXTRATO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dta Extrato'
      FieldName = 'DTA_EXTRATO'
    end
    object CDS_CMApresExtratosCOD_TPMOVTO: TIntegerField
      DisplayLabel = 'Hist'
      FieldName = 'COD_TPMOVTO'
    end
    object CDS_CMApresExtratosDES_TPMOVTO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'DES_TPMOVTO'
      Size = 60
    end
    object CDS_CMApresExtratosNUM_DOCTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Docto'
      FieldName = 'NUM_DOCTO'
      Size = 10
    end
    object CDS_CMApresExtratosVLR_DOCTO: TFMTBCDField
      DisplayLabel = 'Vlr Docto'
      FieldName = 'VLR_DOCTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMApresExtratosIND_TIPO: TStringField
      Alignment = taCenter
      DisplayLabel = 'D/C'
      FieldName = 'IND_TIPO'
      Size = 2
    end
    object CDS_CMApresExtratosCHV_EXTRATO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Chv_Extrato'
      FieldName = 'CHV_EXTRATO'
      Required = True
      Size = 30
    end
    object CDS_CMApresExtratosCOD_USUARIO: TIntegerField
      DisplayLabel = 'Usua'
      FieldName = 'COD_USUARIO'
    end
    object CDS_CMApresExtratosDES_USUARIO: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'DES_USUARIO'
      Size = 50
    end
    object CDS_CMApresExtratosTIP_CONCILIACAO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tipo Concilia'#231#227'o'
      FieldName = 'TIP_CONCILIACAO'
      Size = 4
    end
    object CDS_CMApresExtratosVLR_TOTAL: TAggregateField
      FieldName = 'VLR_TOTAL'
      Active = True
      DisplayFormat = '#,0.00 '
      Expression = 'SUM(VLR_DOCTO)'
    end
  end
  object SDS_CMExtratosDep: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'DISTINCT'#13#10'CASE'#13#10'  WHEN p.chv_extrato IS NULL THEN'#13#10'     ' +
      #39'NAO'#39#13#10'  ELSE'#13#10'     '#39'SIM'#39#13#10'END "Conciliado?",'#13#10'p.ind_quem QUEM,'#13 +
      #10'CASE'#13#10'   WHEN p.ind_quem is not null THEN'#13#10'      '#39'SIM'#39#13#10'   ELSE' +
      #13#10'      '#39'NAO'#39#13#10'END "Conciliar?",'#13#10'b.num_banco, b.des_banco, b.nu' +
      'm_agencia, b.num_conta,'#13#10'e.dta_extrato, e.num_docto, e.vlr_docto' +
      ', '#13#10'e.cod_tpmovto, m.des_tpmovto,'#13#10'm.ind_tipo, e.chv_extrato, p.' +
      'cod_usuario,'#13#10'p.tip_conciliacao, e.cod_banco'#13#10#13#10'FROM fin_bancos_' +
      'extratos e'#13#10'          LEFT JOIN fin_bancos_tp_movtos m    ON m.c' +
      'od_tpmovto=e.cod_tpmovto'#13#10'                                      ' +
      '       AND m.cod_banco=e.cod_banco'#13#10'          LEFT JOIN fin_conc' +
      'iliacao_depositos p  ON p.chv_extrato=e.chv_extrato'#13#10'          L' +
      'EFT JOIN fin_bancos b              ON b.cod_banco=e.cod_banco'#13#10#13 +
      #10'WHERE m.ind_tipo='#39'C'#39#13#10'AND   e.dta_extrato Between '#39'10.01.2017'#39' ' +
      'And '#39'10.01.2017'#39#13#10'AND   e.Num_Seq<>999999'#13#10'AND   UPPER(m.des_tpm' +
      'ovto) like '#39'DEPOS%'#39#13#10#13#10'ORDER BY e.dta_extrato, b.Des_Banco, b.nu' +
      'm_banco, b.num_agencia, b.num_conta, e.num_seq'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 560
    Top = 26
  end
  object DSP_CMExtratosDep: TDataSetProvider
    DataSet = SDS_CMExtratosDep
    Options = [poRetainServerOrder]
    Left = 608
    Top = 42
  end
  object CDS_CMExtratosDep: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_CMExtratosDep'
    Left = 656
    Top = 23
    object CDS_CMExtratosDepConciliado: TStringField
      FieldName = 'Conciliado?'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object CDS_CMExtratosDepQUEM: TStringField
      Alignment = taCenter
      DisplayLabel = 'Quem'
      FieldName = 'QUEM'
      ReadOnly = True
      Size = 3
    end
    object CDS_CMExtratosDepConciliar: TStringField
      Alignment = taCenter
      FieldName = 'Conciliar?'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object CDS_CMExtratosDepNUM_BANCO: TIntegerField
      DisplayLabel = 'N'#186' Banco'
      FieldName = 'NUM_BANCO'
      ReadOnly = True
    end
    object CDS_CMExtratosDepDES_BANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'DES_BANCO'
      ReadOnly = True
      Size = 50
    end
    object CDS_CMExtratosDepNUM_AGENCIA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'NUM_AGENCIA'
      ReadOnly = True
      Size = 10
    end
    object CDS_CMExtratosDepNUM_CONTA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#186' Conta'
      FieldName = 'NUM_CONTA'
      ReadOnly = True
      Size = 60
    end
    object CDS_CMExtratosDepDTA_EXTRATO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dia'
      FieldName = 'DTA_EXTRATO'
      ReadOnly = True
    end
    object CDS_CMExtratosDepNUM_DOCTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Docto'
      FieldName = 'NUM_DOCTO'
      ReadOnly = True
      Size = 10
    end
    object CDS_CMExtratosDepVLR_DOCTO: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VLR_DOCTO'
      ReadOnly = True
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMExtratosDepCOD_TPMOVTO: TIntegerField
      FieldName = 'COD_TPMOVTO'
      ReadOnly = True
    end
    object CDS_CMExtratosDepDES_TPMOVTO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'DES_TPMOVTO'
      ReadOnly = True
      Size = 60
    end
    object CDS_CMExtratosDepIND_TIPO: TStringField
      Alignment = taCenter
      DisplayLabel = 'D/C'
      FieldName = 'IND_TIPO'
      ReadOnly = True
      Size = 2
    end
    object CDS_CMExtratosDepCHV_EXTRATO: TStringField
      FieldName = 'CHV_EXTRATO'
      ReadOnly = True
      Size = 30
    end
    object CDS_CMExtratosDepCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      ReadOnly = True
    end
    object CDS_CMExtratosDepTIP_CONCILIACAO: TStringField
      DisplayLabel = 'Tipo Concilia'#231#227'o'
      FieldName = 'TIP_CONCILIACAO'
      ReadOnly = True
      Size = 4
    end
    object CDS_CMExtratosDepCOD_BANCO: TIntegerField
      FieldName = 'COD_BANCO'
    end
  end
  object DS_CMDepositos: TDataSource
    DataSet = CDS_CMDepositos
    Left = 710
    Top = 108
  end
  object CDS_CMDepositos: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'DTA_DOCTO; RAZAO_SOCIAL; NUM_DOCTO; VLR_DOCTO; NUM_SEQ'
    Params = <>
    ProviderName = 'DSP_CMDepositos'
    Left = 656
    Top = 87
    object CDS_CMDepositosConciliado: TStringField
      FieldName = 'Conciliado?'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object CDS_CMDepositosQUEM: TStringField
      Alignment = taCenter
      DisplayLabel = 'Quem'
      FieldName = 'QUEM'
      ReadOnly = True
      Size = 3
    end
    object CDS_CMDepositosConciliar: TStringField
      Alignment = taCenter
      FieldName = 'Conciliar?'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object CDS_CMDepositosCOD_LOJA: TStringField
      DisplayLabel = 'Cod Loja'
      FieldName = 'COD_LOJA'
      ReadOnly = True
      Size = 6
    end
    object CDS_CMDepositosRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 50
    end
    object CDS_CMDepositosUSU_LOJA: TIntegerField
      DisplayLabel = 'Usu_Loja'
      FieldName = 'USU_LOJA'
    end
    object CDS_CMDepositosOBS_TEXTO: TStringField
      FieldName = 'OBS_TEXTO'
      ReadOnly = True
      Size = 80
    end
    object CDS_CMDepositosDTA_DOCTO: TDateField
      FieldName = 'DTA_DOCTO'
      ReadOnly = True
    end
    object CDS_CMDepositosNUM_DOCTO: TIntegerField
      FieldName = 'NUM_DOCTO'
    end
    object CDS_CMDepositosVLR_DOCTO: TFMTBCDField
      FieldName = 'VLR_DOCTO'
      ReadOnly = True
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMDepositosDTA_VENC: TDateField
      FieldName = 'DTA_VENC'
      ReadOnly = True
    end
    object CDS_CMDepositosVLR_DESCONTO: TFMTBCDField
      FieldName = 'VLR_DESCONTO'
      ReadOnly = True
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMDepositosVLR_ACRESCIMO: TFMTBCDField
      FieldName = 'VLR_ACRESCIMO'
      ReadOnly = True
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMDepositosCOD_BANCO: TStringField
      FieldName = 'COD_BANCO'
      ReadOnly = True
      Size = 3
    end
    object CDS_CMDepositosDES_BANCO: TStringField
      FieldName = 'DES_BANCO'
      ReadOnly = True
      Size = 30
    end
    object CDS_CMDepositosNUM_COMPL: TIntegerField
      FieldName = 'NUM_COMPL'
      ReadOnly = True
    end
    object CDS_CMDepositosNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
      ReadOnly = True
    end
    object CDS_CMDepositosTIP_CONCILIACAO: TStringField
      FieldName = 'TIP_CONCILIACAO'
      Required = True
      FixedChar = True
      Size = 8
    end
    object CDS_CMDepositosCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object CDS_CMDepositosTXT_OBS: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'TXT_OBS'
      Size = 100
    end
    object CDS_CMDepositosDESC_HISTORICO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'DESC_HISTORICO'
      Size = 60
    end
  end
  object SDS_CMDepositos: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'm.ind_conciliacao "Conciliado?",'#13#10'p.ind_quem QUEM,'#13#10'CASE' +
      #13#10'  WHEN p.ind_quem is not null THEN'#13#10'    '#39'SIM'#39#13#10'  ELSE'#13#10'   '#39'NAO' +
      #39#13#10'END "Conciliar?",'#13#10#39'Bel_'#39'||m.cod_linx cod_loja,'#13#10'e.nome_emp r' +
      'azao_social,'#13#10'm.num_docto USU_Loja,'#13#10'm.obs_texto,'#13#10'm.dta_docto, ' +
      'm.num_docto, m.vlr_docto,'#13#10'm.dta_venc,'#13#10'm.vlr_desconto, m.vlr_ac' +
      'rescimo,'#13#10'm.cod_banco, m.des_banco,'#13#10'm.num_seq, m.num_compl,'#13#10#13#10 +
      'CASE'#13#10'  WHEN p.tip_conciliacao='#39'DESP'#39' THEN '#39'DESPESA'#39#13#10'  WHEN p.t' +
      'ip_conciliacao='#39'DINH'#39' THEN '#39'DINHEIRO'#39#13#10'  WHEN (TRIM(COALESCE(p.t' +
      'ip_conciliacao,'#39#39'))='#39#39') AND (m.ind_conciliacao='#39'SIM'#39') THEN '#39'DEPO' +
      'SITO'#39#13#10'  Else'#13#10'    '#39#39#13#10'END tip_conciliacao,'#13#10#13#10'p.cod_usuario, '#13#10 +
      'p.txt_obs,'#13#10'm.desc_historico'#13#10#13#10'FROM fin_conciliacao_mov_dep m'#13#10 +
      '   LEFT JOIN fin_conciliacao_depositos p  ON p.num_seq=m.num_seq' +
      #13#10'                                         AND p.num_compl=m.num' +
      '_compl'#13#10'   LEFT JOIN LINXLOJAS e                  ON e.empresa=m' +
      '.cod_linx'#13#10#13#10#13#10'WHERE m.dta_venc = '#39'15.11.2017'#39#13#10#13#10'ORDER BY m.cod' +
      '_loja, m.dta_docto'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 560
    Top = 90
  end
  object DSP_CMDepositos: TDataSetProvider
    DataSet = SDS_CMDepositos
    Options = [poRetainServerOrder]
    Left = 608
    Top = 106
  end
  object DS_CMExtratosDep: TDataSource
    DataSet = CDS_CMExtratosDep
    Left = 710
    Top = 42
  end
  object SDS_CMApresDepositos: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#39'Bel_'#39'||m.cod_loja Cod_loja,'#13#10'cast(rpad(e.nome_emp, 60, ' +
      #39#39') as varchar(60)) razao_social,'#13#10'/*'#13#10'CASE'#13#10'  WHEN h.cod_tpmovt' +
      'o IS NOT NULL THEN'#13#10'     '#39'*'#39'||h.cod_tpmovto'#13#10'  ELSE'#13#10'     m.cod_' +
      'comprovante'#13#10'END Comprov,'#13#10'*/'#13#10#39'000'#39' Comprov,'#13#10'/*'#13#10'CASE'#13#10'  WHEN ' +
      'h.cod_tpmovto IS NOT NULL THEN'#13#10'    '#39'*'#39'||h.des_tpmovto'#13#10'  ELSE'#13#10 +
      '    c.nomecomprovante'#13#10'END Comprovante,'#13#10'*/'#13#10#13#10'cast(rpad('#39#39', 20,' +
      ' '#39#39') as varchar(20)) Comprovante,'#13#10'/*'#13#10'CASE'#13#10'  WHEN b.cod_banco ' +
      'IS NOT NULL THEN'#13#10'    '#39'*'#39'||b.cod_banco'#13#10'  ELSE'#13#10'    m.cod_fornec' +
      'edor'#13#10'END Forn,'#13#10'*/'#13#10'cast(rpad('#39#39', 6, '#39#39') as varchar(6))  Forn,'#13 +
      #10'/*'#13#10'CASE'#13#10'  WHEN b.cod_banco IS NOT NULL THEN'#13#10'    '#39'*'#39'||b.des_b' +
      'anco'#13#10'  ELSE'#13#10'   f.nomefornecedor'#13#10'END "Fornecedor",'#13#10'*/'#13#10'cast(r' +
      'pad('#39#39', 40, '#39#39') as varchar(40)) "Fornecedor",'#13#10'Cast(lpad(m.num_d' +
      'octo, 6, '#39#39') as varchar(6)) num_docto,'#13#10#13#10'm.dta_docto dta_pagto,' +
      #13#10'm.vlr_docto, m.vlr_desconto, m.vlr_acrescimo, m.vlr_docto vlr_' +
      'pagto, '#39'NAO'#39' Parcial,'#13#10'm.dta_venc,'#13#10#39'0000'#39' num_serie, '#39'01'#39' Num_P' +
      'rest,'#13#10#13#10'cast(rpad('#39#39', 23, '#39#39') as varchar(23)) chv_pagto,'#13#10#13#10'p.c' +
      'od_usuario, u.des_usuario,'#13#10'p.tip_conciliacao, m.num_seq, m.num_' +
      'compl'#13#10#13#10'FROM fin_conciliacao_mov_dep m'#13#10'   Left Join fin_concil' +
      'iacao_depositos p  on m.num_seq=p.num_seq'#13#10'                     ' +
      '                    And m.num_compl=p.num_compl'#13#10'   left Join li' +
      'nxlojas e                  on m.cod_linx=e.empresa'#13#10'   Left Join' +
      ' ps_usuarios u                on p.cod_usuario=u.cod_usuario'#13#10#13#10 +
      'Where m.ind_conciliacao='#39'SIM'#39#13#10'And   p.chv_extrato= :CHV_EXTRATO' +
      #13#10#13#10'Order by m.dta_docto, e.nome_emp'#13#10#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'CHV_EXTRATO'
        ParamType = ptInput
      end>
    SQLConnection = DMBelShop.SQLC
    Left = 560
    Top = 186
  end
  object DSP_CMApresDepositos: TDataSetProvider
    DataSet = SDS_CMApresDepositos
    Options = [poRetainServerOrder]
    Left = 608
    Top = 202
  end
  object CDS_CMApresDepositos: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DSP_CMApresDepositos'
    AfterScroll = CDS_CMApresDepositosAfterScroll
    Left = 656
    Top = 183
    object CDS_CMApresDepositosCOD_LOJA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Loja'
      FieldName = 'COD_LOJA'
      Required = True
      Size = 6
    end
    object CDS_CMApresDepositosRAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAO_SOCIAL'
      Size = 60
    end
    object CDS_CMApresDepositosCOMPROV: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Compr'
      FieldName = 'COMPROV'
      Required = True
      Size = 3
    end
    object CDS_CMApresDepositosCOMPROVANTE: TStringField
      DisplayLabel = 'Comprovante'
      FieldName = 'COMPROVANTE'
      FixedChar = True
    end
    object CDS_CMApresDepositosFORN: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Forn'
      FieldName = 'FORN'
      Size = 6
    end
    object CDS_CMApresDepositosFORNECEDOR: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORNECEDOR'
      Size = 40
    end
    object CDS_CMApresDepositosNUM_DOCTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Docto'
      FieldName = 'NUM_DOCTO'
      Size = 6
    end
    object CDS_CMApresDepositosDTA_PAGTO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dta Pagto'
      FieldName = 'DTA_PAGTO'
    end
    object CDS_CMApresDepositosVLR_DOCTO: TFMTBCDField
      DisplayLabel = 'Vlr Docto'
      FieldName = 'VLR_DOCTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMApresDepositosVLR_DESCONTO: TFMTBCDField
      DisplayLabel = 'Vlr Desc'
      FieldName = 'VLR_DESCONTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMApresDepositosVLR_ACRESCIMO: TFMTBCDField
      DisplayLabel = 'Vlr Acresc'
      FieldName = 'VLR_ACRESCIMO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMApresDepositosVLR_PAGTO: TFMTBCDField
      DisplayLabel = 'Vlr Pago'
      FieldName = 'VLR_PAGTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMApresDepositosPARCIAL: TStringField
      DisplayLabel = 'Parcial ?'
      FieldName = 'PARCIAL'
      FixedChar = True
      Size = 1
    end
    object CDS_CMApresDepositosDTA_VENC: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dta_Venc'
      FieldName = 'DTA_VENC'
    end
    object CDS_CMApresDepositosNUM_SERIE: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'S'#233'rie'
      FieldName = 'NUM_SERIE'
      Size = 4
    end
    object CDS_CMApresDepositosNUM_PREST: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Nr Prest'
      FieldName = 'NUM_PREST'
      FixedChar = True
      Size = 2
    end
    object CDS_CMApresDepositosCHV_PAGTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Chv Pagto'
      FieldName = 'CHV_PAGTO'
      Required = True
      Size = 23
    end
    object CDS_CMApresDepositosCOD_USUARIO: TIntegerField
      DisplayLabel = 'Usua'
      FieldName = 'COD_USUARIO'
    end
    object CDS_CMApresDepositosDES_USUARIO: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'DES_USUARIO'
      Size = 50
    end
    object CDS_CMApresDepositosTIP_CONCILIACAO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tipo Concilia'#231#227'o'
      FieldName = 'TIP_CONCILIACAO'
      Size = 4
    end
    object CDS_CMApresDepositosNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
      Required = True
    end
    object CDS_CMApresDepositosNUM_COMPL: TIntegerField
      FieldName = 'NUM_COMPL'
      Required = True
    end
    object CDS_CMApresDepositosVLR_TOTAL: TAggregateField
      FieldName = 'VLR_TOTAL'
      Active = True
      DisplayFormat = '#,0.00 '
      Expression = 'SUM(VLR_DOCTO)'
    end
  end
  object DS_CMApresExtratoDep: TDataSource
    DataSet = CDS_CMApresExtratosDep
    Left = 710
    Top = 273
  end
  object SDS_CMApresExtratosDep: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'b.num_banco, b.des_banco, b.num_agencia, b.num_conta,'#13#10'e' +
      '.dta_extrato,'#13#10'e.cod_tpmovto, t.des_tpmovto,'#13#10'e.num_docto, e.vlr' +
      '_docto,'#13#10't.ind_tipo,'#13#10'e.chv_extrato, p.cod_usuario, u.des_usuari' +
      'o,'#13#10'p.tip_conciliacao'#13#10#13#10'FROM fin_bancos_extratos e'#13#10'          L' +
      'EFT JOIN fin_bancos_tp_movtos t       ON t.cod_tpmovto=e.cod_tpm' +
      'ovto'#13#10'                                                AND t.cod_' +
      'banco=e.cod_banco'#13#10'          LEFT JOIN fin_conciliacao_depositos' +
      ' p  ON p.chv_extrato=e.chv_extrato'#13#10'          LEFT JOIN fin_banc' +
      'os b                 ON b.cod_banco=e.cod_banco'#13#10'          LEFT ' +
      'JOIN ps_usuarios u                ON p.cod_usuario=u.cod_usuario' +
      #13#10#13#10'WHERE  exists (select 1'#13#10'               from fin_conciliacao' +
      '_mov_dep m'#13#10'               Where m.num_seq= :NUM_SEQ'#13#10'          ' +
      '     And   m.num_compl= :NUM_COMPL'#13#10'               And   m.num_s' +
      'eq=p.num_seq'#13#10'               And   m.num_compl=p.num_compl)'#13#10#13#10'O' +
      'RDER BY b.Des_Banco, b.num_banco, b.num_agencia, b.num_conta, e.' +
      'dta_extrato, e.num_seq'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'NUM_SEQ'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NUM_COMPL'
        ParamType = ptInput
      end>
    SQLConnection = DMBelShop.SQLC
    Left = 560
    Top = 256
  end
  object DSP_CMApresExtratosDep: TDataSetProvider
    DataSet = SDS_CMApresExtratosDep
    Options = [poRetainServerOrder]
    Left = 608
    Top = 272
  end
  object DS_CMApresDepositos: TDataSource
    DataSet = CDS_CMApresDepositos
    Left = 710
    Top = 202
  end
  object CDS_CMApresExtratosDep: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DSP_CMApresExtratosDep'
    AfterScroll = CDS_CMApresExtratosDepAfterScroll
    Left = 656
    Top = 253
    object CDS_CMApresExtratosDepNUM_BANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'NUM_BANCO'
    end
    object CDS_CMApresExtratosDepDES_BANCO: TStringField
      DisplayLabel = 'Nome Banco'
      FieldName = 'DES_BANCO'
      Size = 50
    end
    object CDS_CMApresExtratosDepNUM_AGENCIA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'NUM_AGENCIA'
      Size = 10
    end
    object CDS_CMApresExtratosDepNUM_CONTA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Nr Conta'
      FieldName = 'NUM_CONTA'
      Size = 60
    end
    object CDS_CMApresExtratosDepDTA_EXTRATO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Dta Extrato'
      FieldName = 'DTA_EXTRATO'
    end
    object CDS_CMApresExtratosDepCOD_TPMOVTO: TIntegerField
      DisplayLabel = 'Hist'
      FieldName = 'COD_TPMOVTO'
    end
    object CDS_CMApresExtratosDepDES_TPMOVTO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'DES_TPMOVTO'
      Size = 60
    end
    object CDS_CMApresExtratosDepNUM_DOCTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Docto'
      FieldName = 'NUM_DOCTO'
      Size = 10
    end
    object CDS_CMApresExtratosDepVLR_DOCTO: TFMTBCDField
      DisplayLabel = 'Vlr Docto'
      FieldName = 'VLR_DOCTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMApresExtratosDepIND_TIPO: TStringField
      Alignment = taCenter
      DisplayLabel = 'D/C'
      FieldName = 'IND_TIPO'
      Size = 2
    end
    object CDS_CMApresExtratosDepCHV_EXTRATO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Chv_Extrato'
      FieldName = 'CHV_EXTRATO'
      Required = True
      Size = 30
    end
    object CDS_CMApresExtratosDepCOD_USUARIO: TIntegerField
      DisplayLabel = 'Usua'
      FieldName = 'COD_USUARIO'
    end
    object CDS_CMApresExtratosDepDES_USUARIO: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'DES_USUARIO'
      Size = 50
    end
    object CDS_CMApresExtratosDepTIP_CONCILIACAO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tipo Concilia'#231#227'o'
      FieldName = 'TIP_CONCILIACAO'
      Size = 4
    end
    object CDS_CMApresExtratosDepVLR_TOTAL: TAggregateField
      FieldName = 'VLR_TOTAL'
      Active = True
      DisplayFormat = '#,0.00'
      Expression = 'SUM(VLR_DOCTO)'
    end
  end
  object SDS_CMDepositosAnalise: TSQLDataSet
    CommandText = 
      '-- TITULO DO RELAT'#211'RIO'#13#10'SELECT'#13#10#13#10#39'CONCILIA'#199#195'O CAIXA: Per'#237'odo de' +
      ' '#39'||'#39'26/08/2018'#39'||'#39' a '#39'||'#39'28/08/2018'#39' NOME_EMP,'#13#10'CURRENT_DATE DT' +
      'A_DOCTO,'#13#10'NULL LOJA_DINHEIRO,'#13#10'NULL SALAO_DINHEIRO,'#13#10'NULL DIA_DI' +
      'NHEIRO,'#13#10'NULL CX_MTZ,'#13#10'NULL DEPOSITO,'#13#10'NULL DESPESA,'#13#10'NULL OUTRO' +
      'S,'#13#10'NULL TOTAL,'#13#10'NULL DIF_DEPOSITO,'#13#10'NULL QUEBRA_CX,'#13#10#39'         ' +
      '                     '#39' OBSERVACOES,'#13#10'NULL OBS_FINANCEIRO,'#13#10'NULL ' +
      'COD_LOJA,'#13#10'NULL FECHA,'#13#10'NULL IND_CONCILIACAO,'#13#10'NULL NUM_RELATORI' +
      'O,'#13#10'NULL REL_ENTREGUE, --odir'#13#10'0 ORDEM,'#13#10'0 ORDEM_APRES'#13#10'FROM RDB' +
      '$DATABASE'#13#10#13#10'         -- APRESENTA VALORES CONCILIADOS'#13#10'UNION'#13#10#13 +
      #10'SELECT'#13#10'lj.nome_emp,'#13#10'md.dta_docto,'#13#10'0.00 LOJA_DINHEIRO,'#13#10'0.00 ' +
      'SALAO_DINHEIRO,'#13#10'0.00 DIA_DINHEIRO,'#13#10#13#10'COALESCE(SUM('#13#10' CASE'#13#10'   ' +
      ' WHEN (TRIM(COALESCE(dp.tip_conciliacao,'#39#39'))='#39'DINH'#39') THEN'#13#10'     ' +
      ' md.vlr_docto'#13#10'    ELSE'#13#10'      0.00'#13#10' END)'#13#10', 0.00) CX_MTZ,'#13#10#13#10'0' +
      '.00 DEPOSITO,'#13#10#13#10'COALESCE(SUM('#13#10' CASE'#13#10'    WHEN (TRIM(COALESCE(d' +
      'p.tip_conciliacao,'#39#39'))='#39'DESP'#39') THEN'#13#10'      md.vlr_docto'#13#10'    ELS' +
      'E'#13#10'     0.00'#13#10' END)'#13#10', 0.00) DESPESA,'#13#10#13#10'COALESCE(SUM('#13#10' CASE'#13#10' ' +
      '   WHEN TRIM(COALESCE(dp.tip_conciliacao,'#39#39')) Not in ('#39#39', '#39'DESP'#39 +
      ', '#39'DINH'#39') THEN'#13#10'      md.vlr_docto'#13#10'    ELSE'#13#10'      0.00'#13#10' END)'#13 +
      #10',0.00) OUTROS,'#13#10#13#10'COALESCE(SUM('#13#10' CASE'#13#10'    WHEN (TRIM(COALESCE' +
      '(dp.tip_conciliacao,'#39#39'))='#39#39') THEN'#13#10'      0.00'#13#10'    ELSE'#13#10'      m' +
      'd.vlr_docto'#13#10' END)'#13#10', 0.00) TOTAL,'#13#10#13#10'0.00 DIF_DEPOSITO,'#13#10'0.00 Q' +
      'UEBRA_CX,'#13#10'NULL OBSERVACOES,'#13#10'fo.des_aux OBS_FINANCEIRO,'#13#10'md.cod' +
      '_linx COD_LOJA,'#13#10#13#10'CASE'#13#10'  WHEN TRIM(COALESCE(fh.tip_aux,'#39#39'))<>'#39 +
      #39' THEN'#13#10'   '#39'SIM'#39#13#10'  ELSE'#13#10'   '#39'NAO'#39#13#10'END FECHA,'#13#10#13#10'md.ind_concili' +
      'acao,'#13#10'fo.des_aux1 NUM_RELATORIO,'#13#10#13#10'CASE'#13#10'  WHEN COALESCE(fo.vl' +
      'r_aux,0)=1 THEN'#13#10'    '#39'SIM'#39#13#10'  ELSE'#13#10'    '#39'N'#195'O'#39#13#10'END REL_ENTREGUE,' +
      ' -- odir'#13#10#13#10'4 ORDEM,'#13#10'2 ORDEM_APRES'#13#10#13#10'FROM FIN_CONCILIACAO_MOV_' +
      'DEP md'#13#10'        LEFT JOIN LINXLOJAS lj                          ' +
      ' ON lj.empresa=md.cod_linx'#13#10'        LEFT JOIN (SELECT DISTINCT d' +
      '.num_seq, d.num_compl, d.tip_conciliacao'#13#10'                   FRO' +
      'M FIN_CONCILIACAO_DEPOSITOS d) dp  ON dp.num_seq=md.num_seq'#13#10'   ' +
      '                                                     AND dp.num_' +
      'compl=md.num_compl'#13#10'        LEFT JOIN TAB_AUXILIAR fh  ON fh.tip' +
      '_aux=22 -- CONCILIA'#199#195'O DE DEP'#211'SITOS - DATAS FECHADAS PELO RENATO' +
      #13#10'                                  AND fh.des_aux1=md.cod_linx'#13 +
      #10'                                  AND Trim(fh.des_aux)=Cast(lpa' +
      'd(extract(day from md.dta_docto),2,'#39'0'#39') as varchar(2))||'#39'/'#39'||'#13#10' ' +
      '                                                      Cast(lpad(' +
      'extract(month from md.dta_docto),2,'#39'0'#39') as varchar(2))||'#39'/'#39'||'#13#10' ' +
      '                                                      Cast(extra' +
      'ct(Year from current_date) as varchar(4))'#13#10'        LEFT JOIN TAB' +
      '_AUXILIAR fo  ON fo.tip_aux=24 -- CONCILIA'#199#195'O DE DEP'#211'SITOS - OBS' +
      'ERVA'#199#195'O FINAL PARA LOJAS CONCILIADAS'#13#10'                          ' +
      '        AND fo.cod_aux=md.cod_linx||'#13#10'                          ' +
      '                             CAST(LPAD(EXTRACT(DAY FROM md.dta_d' +
      'octo),2,'#39'0'#39') AS VARCHAR(2))||'#13#10'                                 ' +
      '                      CAST(LPAD(EXTRACT(MONTH FROM md.dta_docto)' +
      ',2,'#39'0'#39') AS VARCHAR(2))||'#13#10'                                      ' +
      '                 SUBSTRING(CAST(EXTRACT(YEAR FROM md.dta_docto) ' +
      'AS VARCHAR(4)) FROM 3 FOR 2)'#13#10#13#10'WHERE md.ind_conciliacao='#39'SIM'#39#13#10 +
      #13#10'AND   md.dta_docto between '#39'01.09.2018'#39' and '#39'05.09.2018'#39#13#10#13#10'GR' +
      'OUP BY 1,2,13,14,15,16,17,18,19 --odir'#13#10#13#10'         -- APRESENTA ' +
      'VALORES N'#195'O CONCILIADOS'#13#10'UNION'#13#10#13#10'SELECT'#13#10'lj.nome_emp,'#13#10'md.dta_d' +
      'octo,'#13#10'NULL LOJA_DINHEIRO,'#13#10'NULL SALAO_DINHEIRO,'#13#10'NULL DIA_DINHE' +
      'IRO,'#13#10#13#10'COALESCE(SUM('#13#10' CASE'#13#10'    WHEN gr.des_aux1='#39'CX_MTZ'#39' THEN' +
      #13#10'      md.vlr_docto'#13#10'    ELSE'#13#10'      0.00'#13#10' END)'#13#10', 0.00) CX_MT' +
      'Z,'#13#10#13#10'COALESCE(SUM('#13#10' CASE'#13#10'    WHEN gr.des_aux1='#39'DEPOSITO'#39' THEN' +
      #13#10'      md.vlr_docto'#13#10'    ELSE'#13#10'      0.00'#13#10' END)'#13#10', 0.00) DEPOS' +
      'ITO,'#13#10#13#10'COALESCE(SUM('#13#10' CASE'#13#10'    WHEN gr.des_aux1='#39'DESPESA'#39' THE' +
      'N'#13#10'      md.vlr_docto'#13#10'    ELSE'#13#10'      0.00'#13#10' END)'#13#10', 0.00) DESP' +
      'ESA,'#13#10#13#10'COALESCE(SUM('#13#10' CASE'#13#10'    WHEN gr.des_aux1 Not in ('#39'CX_M' +
      'TZ'#39', '#39'DEPOSITO'#39', '#39'DESPESA'#39') THEN'#13#10'      md.vlr_docto'#13#10'    ELSE'#13#10 +
      '      0.00'#13#10' END)'#13#10',0.00) OUTROS,'#13#10#13#10'SUM(COALESCE(md.vlr_docto,0' +
      '.00)) TOTAL,'#13#10'0.00 DIF_DEPOSITO,'#13#10'0.00 QUEBRA_CX,'#13#10'NULL OBSERVAC' +
      'OES,'#13#10'TRIM(COALESCE(md.obs_nao_conc,'#39#39')) OBS_FINANCEIRO,'#13#10'md.cod' +
      '_linx COD_LOJA,'#13#10#13#10'CASE'#13#10'  WHEN TRIM(COALESCE(fh.tip_aux,'#39#39'))<>'#39 +
      #39' THEN'#13#10'    '#39'SIM'#39#13#10'  ELSE'#13#10'    '#39'NAO'#39#13#10'END FECHA,'#13#10#13#10'md.ind_conci' +
      'liacao,'#13#10'NULL NUM_RELATORIO,'#13#10'NULL REL_ENTREGUE, -- odir'#13#10'9 ORDE' +
      'M,'#13#10'2 ORDEM_APRES'#13#10#13#10'FROM FIN_CONCILIACAO_MOV_DEP md'#13#10'        LE' +
      'FT JOIN LINXLOJAS lj     ON lj.empresa=md.cod_linx'#13#10'        LEFT' +
      ' JOIN TAB_AUXILIAR gr  ON gr.cod_aux=md.cod_historico'#13#10'         ' +
      '                         AND gr.tip_aux=21 -- CADASTRO DE HIST'#211'R' +
      'ICOS SANGRIA LINX (LINXSANGRIASUPRIMENTOS)'#13#10'        LEFT JOIN TA' +
      'B_AUXILIAR fh  ON fh.tip_aux=22 -- CONCILIA'#199#195'O DE DEP'#211'SITOS - DA' +
      'TAS FECHADAS PELO RENATO'#13#10'                                  AND ' +
      'fh.des_aux1=md.cod_linx'#13#10'                                  AND T' +
      'RIM(fh.des_aux)=Cast(lpad(extract(day from md.dta_docto),2,'#39'0'#39') ' +
      'as varchar(2))||'#39'/'#39'||'#13#10'                                         ' +
      '              Cast(lpad(extract(month from md.dta_docto),2,'#39'0'#39') ' +
      'as varchar(2))||'#39'/'#39'||'#13#10'                                         ' +
      '              Cast(extract(Year from current_date) as varchar(4)' +
      ')'#13#10#13#10'WHERE md.ind_conciliacao='#39'NAO'#39#13#10#13#10'AND   md.dta_docto betwee' +
      'n '#39'01.09.2018'#39' and '#39'05.09.2018'#39#13#10#13#10'GROUP BY 1,2,13,14,15,16,17,1' +
      '8,19 -- odir'#13#10#13#10'         -- APRESENTA TOTAL DE VALORES CONCILIAD' +
      'OS'#13#10'UNION'#13#10#13#10'SELECT'#13#10#39'TOTAL DE VALORES CONCILIADOS'#39','#13#10'md.dta_doc' +
      'to DTA_DOCTO,'#13#10'0.00 LOJA_DINHEIRO,'#13#10'0.00 SALAO_DINHEIRO,'#13#10'0.00 D' +
      'IA_DINHEIRO,'#13#10#13#10'COALESCE(SUM('#13#10' CASE'#13#10'    WHEN (TRIM(COALESCE(dp' +
      '.tip_conciliacao,'#39#39'))='#39'DINH'#39') THEN'#13#10'      md.vlr_docto'#13#10'    ELSE' +
      #13#10'      0.00'#13#10'END)'#13#10', 0.00) CX_MTZ,'#13#10#13#10'0.00 DEPOSITO,'#13#10#13#10'COALESC' +
      'E(SUM('#13#10' CASE'#13#10'    WHEN (TRIM(COALESCE(dp.tip_conciliacao,'#39#39'))='#39 +
      'DESP'#39') THEN'#13#10'      md.vlr_docto'#13#10'    ELSE'#13#10'      0.00'#13#10'END)'#13#10', 0' +
      '.00) DESPESA,'#13#10#13#10'COALESCE(SUM('#13#10' CASE'#13#10'    WHEN TRIM(COALESCE(dp' +
      '.tip_conciliacao,'#39#39')) Not in ('#39#39', '#39'DESP'#39', '#39'DINH'#39') THEN'#13#10'      md' +
      '.vlr_docto'#13#10'    ELSE'#13#10'      0.00'#13#10'END),0.00) OUTROS,'#13#10#13#10'COALESCE' +
      '(SUM('#13#10' CASE'#13#10'    WHEN (TRIM(COALESCE(dp.tip_conciliacao,'#39#39'))='#39#39 +
      ') THEN'#13#10'      0.00'#13#10'    ELSE'#13#10'      md.vlr_docto'#13#10' END)'#13#10', 0.00)' +
      ' TOTAL,'#13#10#13#10'0.00 DIF_DEPOSITO,'#13#10'0.00 QUEBRA_CX,'#13#10'NULL OBSERVACOES' +
      ','#13#10'NULL OBS_FINANCEIRO,'#13#10'NULL COD_LOJA,'#13#10'NULL FECHA,'#13#10'NULL IND_C' +
      'ONCILIACAO,'#13#10'NULL NUM_RELATORIO,'#13#10'NULL REL_ENTREGUE, -- odir'#13#10'5 ' +
      'ORDEM,'#13#10'4 ORDEM_APRES'#13#10#13#10'FROM FIN_CONCILIACAO_MOV_DEP md'#13#10'      ' +
      '  LEFT JOIN  LINXLOJAS lj on lj.empresa=md.cod_linx'#13#10'        lef' +
      't JOIN  (SELECT DISTINCT d.num_seq, d.num_compl, d.tip_conciliac' +
      'ao'#13#10'                   FROM FIN_CONCILIACAO_DEPOSITOS d) dp  ON ' +
      'dp.num_seq=md.num_seq'#13#10'                                         ' +
      '               AND dp.num_compl=md.num_compl'#13#10'        LEFT JOIN ' +
      'TAB_AUXILIAR fh  ON fh.tip_aux=22 -- CONCILIA'#199#195'O DE DEP'#211'SITOS - ' +
      'DATAS FECHADAS PELO RENATO'#13#10'                                  AN' +
      'D fh.des_aux1=md.cod_linx'#13#10'                                  AND' +
      ' TRIM(fh.des_aux)=Cast(lpad(extract(day from md.dta_docto),2,'#39'0'#39 +
      ') as varchar(2))||'#39'/'#39'||'#13#10'                                       ' +
      '                Cast(lpad(extract(month from md.dta_docto),2,'#39'0'#39 +
      ') as varchar(2))||'#39'/'#39'||'#13#10'                                       ' +
      '                Cast(extract(Year from current_date) as varchar(' +
      '4))'#13#10'WHERE md.ind_conciliacao='#39'SIM'#39#13#10#13#10'AND   md.dta_docto betwee' +
      'n '#39'01.09.2018'#39' and '#39'05.09.2018'#39#13#10'GROUP BY 2'#13#10#13#10'         -- APRES' +
      'ENTA TOTAL DOS VALORES N'#195'O CONCILIADOS'#13#10'UNION'#13#10#13#10'SELECT'#13#10#39'TOTAL ' +
      'DE VALORES N'#195'O CONCILIADOS'#39','#13#10'md.dta_docto DTA_DOCTO,'#13#10'NULL LOJA' +
      '_DINHEIRO,'#13#10'NULL SALAO_DINHEIRO,'#13#10'NULL DIA_DINHEIRO,'#13#10#13#10'COALESCE' +
      '(SUM('#13#10' CASE'#13#10'    WHEN gr.des_aux1='#39'CX_MTZ'#39' THEN'#13#10'      md.vlr_d' +
      'octo'#13#10'    ELSE'#13#10'      0.00'#13#10' END)'#13#10', 0.00) CX_MTZ,'#13#10#13#10'COALESCE(S' +
      'UM('#13#10' CASE'#13#10'    WHEN gr.des_aux1='#39'DEPOSITO'#39' THEN'#13#10'      md.vlr_d' +
      'octo'#13#10'    ELSE'#13#10'      0.00'#13#10' END)'#13#10', 0.00) DEPOSITO,'#13#10#13#10'COALESCE' +
      '(SUM('#13#10' CASE'#13#10'    WHEN gr.des_aux1='#39'DESPESA'#39' THEN'#13#10'      md.vlr_' +
      'docto'#13#10'    ELSE'#13#10'      0.00'#13#10' END)'#13#10', 0.00) DESPESA,'#13#10#13#10'COALESCE' +
      '(SUM('#13#10' CASE'#13#10'    WHEN gr.des_aux1 Not in ('#39'CX_MTZ'#39', '#39'DEPOSITO'#39',' +
      ' '#39'DESPESA'#39') THEN'#13#10'      md.vlr_docto'#13#10'    ELSE'#13#10'      0.00'#13#10' END' +
      ')'#13#10',0.00) OUTROS,'#13#10#13#10'SUM(COALESCE(md.vlr_docto,0.00)) TOTAL,'#13#10'0.' +
      '00 DIF_DEPOSITO,'#13#10'0.00 QUEBRA_CX,'#13#10'NULL OBSERVACOES,'#13#10'NULL OBS_F' +
      'INANCEIRO,'#13#10'NULL COD_LOJA,'#13#10'NULL FECHA,'#13#10'NULL IND_CONCILIACAO,'#13#10 +
      'NULL NUM_RELATORIO,'#13#10'NULL REL_ENTREGUE, -- odir'#13#10'10 ORDEM,'#13#10'5 OR' +
      'DEM_APRES'#13#10#13#10'FROM FIN_CONCILIACAO_MOV_DEP md'#13#10'        LEFT JOIN ' +
      'LINXLOJAS lj     ON lj.empresa=md.cod_linx'#13#10'        LEFT JOIN TA' +
      'B_AUXILIAR gr  ON gr.cod_aux=md.cod_historico'#13#10'                 ' +
      '                 AND gr.tip_aux=21 -- CADASTRO DE HIST'#211'RICOS SAN' +
      'GRIA LINX (LINXSANGRIASUPRIMENTOS)'#13#10'        LEFT JOIN TAB_AUXILI' +
      'AR fh  ON fh.tip_aux=22 -- CONCILIA'#199#195'O DE DEP'#211'SITOS - DATAS FECH' +
      'ADAS PELO RENATO'#13#10'                                  AND fh.des_a' +
      'ux1=md.cod_linx'#13#10'                                  AND TRIM(fh.d' +
      'es_aux)=Cast(lpad(extract(day from md.dta_docto),2,'#39'0'#39') as varch' +
      'ar(2))||'#39'/'#39'||'#13#10'                                                 ' +
      '      Cast(lpad(extract(month from md.dta_docto),2,'#39'0'#39') as varch' +
      'ar(2))||'#39'/'#39'||'#13#10'                                                 ' +
      '      Cast(extract(Year from current_date) as varchar(4))'#13#10#13#10'WHE' +
      'RE md.ind_conciliacao='#39'NAO'#39#13#10#13#10'AND   md.dta_docto between '#39'01.09' +
      '.2018'#39' and '#39'05.09.2018'#39#13#10'GROUP BY 2'#13#10#13#10'         -- ORDER BY - FI' +
      'M'#13#10'ORDER BY 2 DESC,1,21,20'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 588
    Top = 414
  end
  object DSP_CMDepositosAnalise: TDataSetProvider
    DataSet = SDS_CMDepositosAnalise
    Options = [poRetainServerOrder]
    Left = 629
    Top = 430
  end
  object CDS_CMDepositosAnalise: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_CMDepositosAnalise'
    Left = 672
    Top = 416
    object CDS_CMDepositosAnaliseNOME_EMP: TStringField
      FieldName = 'NOME_EMP'
      Size = 50
    end
    object CDS_CMDepositosAnaliseDTA_DOCTO: TDateField
      FieldName = 'DTA_DOCTO'
    end
    object CDS_CMDepositosAnaliseLOJA_DINHEIRO: TFMTBCDField
      DisplayLabel = 'Fat Loja $'
      FieldName = 'LOJA_DINHEIRO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMDepositosAnaliseSALAO_DINHEIRO: TFMTBCDField
      DisplayLabel = 'Fat Sal'#227'o $'
      FieldName = 'SALAO_DINHEIRO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMDepositosAnaliseDIA_DINHEIRO: TFMTBCDField
      DisplayLabel = 'Fat Dia $'
      FieldName = 'DIA_DINHEIRO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMDepositosAnaliseCX_MTZ: TFMTBCDField
      DisplayLabel = 'Cx Matriz'
      FieldName = 'CX_MTZ'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMDepositosAnaliseDEPOSITO: TFMTBCDField
      DisplayLabel = 'Dep'#243'sitos'
      FieldName = 'DEPOSITO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMDepositosAnaliseDESPESA: TFMTBCDField
      DisplayLabel = 'Despesas'
      FieldName = 'DESPESA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMDepositosAnaliseOUTROS: TFMTBCDField
      DisplayLabel = 'Outros'
      FieldName = 'OUTROS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMDepositosAnaliseTOTAL: TFMTBCDField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMDepositosAnaliseDIF_DEPOSITO: TFMTBCDField
      DisplayLabel = 'Dif Dep'#243'sito'
      FieldName = 'DIF_DEPOSITO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMDepositosAnaliseQUEBRA_CX: TFMTBCDField
      DisplayLabel = 'Quebra/Cx'
      FieldName = 'QUEBRA_CX'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMDepositosAnaliseOBSERVACOES: TStringField
      FieldName = 'OBSERVACOES'
      FixedChar = True
      Size = 30
    end
    object CDS_CMDepositosAnaliseOBS_FINANCEIRO: TStringField
      DisplayLabel = 'OBS Financeiro'
      FieldName = 'OBS_FINANCEIRO'
      Size = 50
    end
    object CDS_CMDepositosAnaliseCOD_LOJA: TIntegerField
      FieldName = 'COD_LOJA'
    end
    object CDS_CMDepositosAnaliseFECHA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Fechado'
      FieldName = 'FECHA'
      Size = 3
    end
    object CDS_CMDepositosAnaliseIND_CONCILIACAO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Concilado ?'
      FieldName = 'IND_CONCILIACAO'
      Size = 3
    end
    object CDS_CMDepositosAnaliseNUM_RELATORIO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Doc Finan'
      FieldName = 'NUM_RELATORIO'
      Size = 50
    end
    object CDS_CMDepositosAnaliseREL_ENTREGUE: TStringField
      Alignment = taCenter
      DisplayLabel = 'Doc Entregue'
      FieldName = 'REL_ENTREGUE'
      FixedChar = True
      Size = 3
    end
    object CDS_CMDepositosAnaliseORDEM: TIntegerField
      FieldName = 'ORDEM'
      Visible = False
    end
    object CDS_CMDepositosAnaliseORDEM_APRES: TIntegerField
      FieldName = 'ORDEM_APRES'
      Visible = False
    end
  end
  object DS_CMDepositosAnalise: TDataSource
    DataSet = CDS_CMDepositosAnalise
    Left = 720
    Top = 432
  end
  object SDS_CMDepHistoricos: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'TIP_AUX,'#13#10'COD_AUX CODIGO,'#13#10'DES_AUX DESCRICAO,'#13#10'DES_AUX1 ' +
      'GRUPO,'#13#10'VLR_AUX,'#13#10'VLR_AUX1'#13#10#13#10'FROM TAB_AUXILIAR H'#13#10#13#10'WHERE H.tip' +
      '_aux=21'#13#10#13#10'ORDER BY 3'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 568
    Top = 352
  end
  object CDS_CMDepHistoricos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_CMDepHistoricos'
    Left = 672
    Top = 352
    object CDS_CMDepHistoricosTIP_AUX: TIntegerField
      FieldName = 'TIP_AUX'
      Required = True
    end
    object CDS_CMDepHistoricosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object CDS_CMDepHistoricosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object CDS_CMDepHistoricosGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 50
    end
    object CDS_CMDepHistoricosVLR_AUX: TFMTBCDField
      FieldName = 'VLR_AUX'
      Precision = 15
      Size = 2
    end
    object CDS_CMDepHistoricosVLR_AUX1: TFMTBCDField
      FieldName = 'VLR_AUX1'
      Precision = 15
      Size = 2
    end
  end
  object DSP_CMDepHistoricos: TDataSetProvider
    DataSet = SDS_CMDepHistoricos
    Left = 624
    Top = 360
  end
  object DS_CMDepHistoricos: TDataSource
    DataSet = CDS_CMDepHistoricos
    Left = 720
    Top = 360
  end
  object SDS_CMDepAnaliseDocRel: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'dc.num_docto,'#13#10'dc.usu_criacao, uc.des_usuario DES_USU_CR' +
      'IACAO, dc.dta_criacao, dc.hra_criacao,'#13#10'dc.dta_movto,'#13#10'dc.cod_li' +
      'nx,'#13#10'dc.nome_loja,'#13#10'dc.vlr_matriz,'#13#10'dc.vlr_depositos,'#13#10'dc.vlr_de' +
      'spesas,'#13#10'dc.vlr_outros,'#13#10'dc.vlr_total,'#13#10'dc.obs_financeiro,'#13#10'dc.u' +
      'su_inclusao, ui.des_usuario DES_USU_INCLUSAO, dc.dta_inclusao, d' +
      'c.hra_inclusao,'#13#10'dc.usu_impressao, ue.des_usuario DES_USU_IMPRES' +
      'SAO, dc.dta_impressao, dc.hra_impressao,'#13#10'dc.usu_recebe, ur.des_' +
      'usuario DES_USU_RECEBE, dc.dta_recebe, dc.hra_recebe,'#13#10'0 ORDEM -' +
      '-27'#13#10#13#10'FROM FIN_CONCILIACAO_DEP_REL dc'#13#10'    LEFT JOIN PS_USUARIO' +
      'S uc ON uc.cod_usuario=dc.usu_criacao   /* Usuario que Criou o D' +
      'octo */'#13#10'    LEFT JOIN PS_USUARIOS ui ON ui.cod_usuario=dc.usu_i' +
      'nclusao  /* Usuario que Incluiu o Movto */'#13#10'    LEFT JOIN PS_USU' +
      'ARIOS ue ON ue.cod_usuario=dc.usu_impressao /* Usuario que Efetu' +
      'ou a Emissao do Docto */'#13#10'    LEFT JOIN PS_USUARIOS ur ON ur.cod' +
      '_usuario=dc.usu_recebe    /* Usuario que Recebeu o Docto */'#13#10'WHE' +
      'RE dc.num_docto=:NumDoc'#13#10#13#10'UNION'#13#10#13#10'SELECT'#13#10'dc.num_docto, -- 1'#13#10 +
      'dc.usu_criacao, -- 2'#13#10'uc.des_usuario DES_USU_CRIACAO, -- 3'#13#10'dc.d' +
      'ta_criacao, -- 4'#13#10'dc.hra_criacao, -- 5'#13#10'NULL DTA_MOVTO, -- 6'#13#10'NU' +
      'LL COD_LINX, -- 7'#13#10#13#10#39'TOTAL DO DOCUMENTO'#39' NOME_LOJA, -- 8,'#13#10'SUM(' +
      'dc.vlr_matriz) VLR_MATRIZ, -- 9'#13#10'SUM(dc.vlr_depositos) VLR_DEPOS' +
      'ITOS, -- 10'#13#10'SUM(dc.vlr_despesas) VLR_DESPESAS, -- 11'#13#10'SUM(dc.vl' +
      'r_outros) VLR_OUTROS, -- 12'#13#10'SUM(dc.vlr_total) VLR_TOTAL, -- 13'#13 +
      #10#39'TOTAL DE LOJAS:'#39'||TRIM(CAST(Count(dc.cod_linx) AS VARCHAR(20))' +
      ') OBS_FINANCEIRO, -- 14'#13#10#13#10'NULL USU_INCLUSAO,  -- 15'#13#10'NULL DES_U' +
      'SU_INCLUSAO, -- 16'#13#10'NULL DTA_INCLUSAO, -- 17'#13#10'NULL HRA_INCLUSAO,' +
      ' -- 18'#13#10'dc.usu_impressao, -- 19'#13#10'ue.des_usuario DES_USU_IMPRESSA' +
      'O, -- 20'#13#10'dc.dta_impressao, -- 21'#13#10'dc.hra_impressao, -- 22'#13#10'dc.u' +
      'su_recebe, -- 23'#13#10'ur.des_usuario DES_USU_RECEBE, -- 24'#13#10'dc.dta_r' +
      'ecebe, -- 25'#13#10'dc.hra_recebe, -- 26'#13#10'1 ORDEM --27'#13#10#13#10'FROM FIN_CON' +
      'CILIACAO_DEP_REL dc'#13#10'    LEFT JOIN PS_USUARIOS uc ON uc.cod_usua' +
      'rio=dc.usu_criacao   /* Usuario que Criou o Docto */'#13#10'    LEFT J' +
      'OIN PS_USUARIOS ue ON ue.cod_usuario=dc.usu_impressao /* Usuario' +
      ' que Efetuou a Emissao do Docto */'#13#10'    LEFT JOIN PS_USUARIOS ur' +
      ' ON ur.cod_usuario=dc.usu_recebe    /* Usuario que Recebeu o Doc' +
      'to */'#13#10'WHERE dc.num_docto=:NumDoc'#13#10#13#10'GROUP BY 1,2,3,4,5,19,20,21' +
      ',22,23,24,25,26'#13#10'ORDER BY 27,8,6'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NumDoc'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'NumDoc'
        ParamType = ptInput
      end>
    SQLConnection = DMBelShop.SQLC
    Left = 580
    Top = 486
    object SDS_CMDepAnaliseDocRelNUM_DOCTO: TIntegerField
      FieldName = 'NUM_DOCTO'
      Required = True
    end
    object SDS_CMDepAnaliseDocRelUSU_CRIACAO: TIntegerField
      FieldName = 'USU_CRIACAO'
    end
    object SDS_CMDepAnaliseDocRelDES_USU_CRIACAO: TStringField
      FieldName = 'DES_USU_CRIACAO'
      Size = 50
    end
    object SDS_CMDepAnaliseDocRelDTA_CRIACAO: TDateField
      FieldName = 'DTA_CRIACAO'
    end
    object SDS_CMDepAnaliseDocRelHRA_CRIACAO: TTimeField
      FieldName = 'HRA_CRIACAO'
    end
    object SDS_CMDepAnaliseDocRelDTA_MOVTO: TDateField
      FieldName = 'DTA_MOVTO'
    end
    object SDS_CMDepAnaliseDocRelCOD_LINX: TIntegerField
      FieldName = 'COD_LINX'
    end
    object SDS_CMDepAnaliseDocRelNOME_LOJA: TStringField
      FieldName = 'NOME_LOJA'
      Size = 50
    end
    object SDS_CMDepAnaliseDocRelVLR_MATRIZ: TFMTBCDField
      FieldName = 'VLR_MATRIZ'
      Precision = 15
      Size = 2
    end
    object SDS_CMDepAnaliseDocRelVLR_DEPOSITOS: TFMTBCDField
      FieldName = 'VLR_DEPOSITOS'
      Precision = 15
      Size = 2
    end
    object SDS_CMDepAnaliseDocRelVLR_DESPESAS: TFMTBCDField
      FieldName = 'VLR_DESPESAS'
      Precision = 15
      Size = 2
    end
    object SDS_CMDepAnaliseDocRelVLR_OUTROS: TFMTBCDField
      FieldName = 'VLR_OUTROS'
      Precision = 15
      Size = 2
    end
    object SDS_CMDepAnaliseDocRelVLR_TOTAL: TFMTBCDField
      FieldName = 'VLR_TOTAL'
      Precision = 15
      Size = 2
    end
    object SDS_CMDepAnaliseDocRelOBS_FINANCEIRO: TStringField
      FieldName = 'OBS_FINANCEIRO'
      Size = 50
    end
    object SDS_CMDepAnaliseDocRelUSU_INCLUSAO: TIntegerField
      FieldName = 'USU_INCLUSAO'
    end
    object SDS_CMDepAnaliseDocRelDES_USU_INCLUSAO: TStringField
      FieldName = 'DES_USU_INCLUSAO'
      Size = 50
    end
    object SDS_CMDepAnaliseDocRelDTA_INCLUSAO: TDateField
      FieldName = 'DTA_INCLUSAO'
    end
    object SDS_CMDepAnaliseDocRelHRA_INCLUSAO: TTimeField
      FieldName = 'HRA_INCLUSAO'
    end
    object SDS_CMDepAnaliseDocRelUSU_IMPRESSAO: TIntegerField
      FieldName = 'USU_IMPRESSAO'
    end
    object SDS_CMDepAnaliseDocRelDES_USU_IMPRESSAO: TStringField
      FieldName = 'DES_USU_IMPRESSAO'
      Size = 50
    end
    object SDS_CMDepAnaliseDocRelDTA_IMPRESSAO: TDateField
      FieldName = 'DTA_IMPRESSAO'
    end
    object SDS_CMDepAnaliseDocRelHRA_IMPRESSAO: TTimeField
      FieldName = 'HRA_IMPRESSAO'
    end
    object SDS_CMDepAnaliseDocRelUSU_RECEBE: TIntegerField
      FieldName = 'USU_RECEBE'
    end
    object SDS_CMDepAnaliseDocRelDES_USU_RECEBE: TStringField
      FieldName = 'DES_USU_RECEBE'
      Size = 50
    end
    object SDS_CMDepAnaliseDocRelDTA_RECEBE: TDateField
      FieldName = 'DTA_RECEBE'
    end
    object SDS_CMDepAnaliseDocRelHRA_RECEBE: TTimeField
      FieldName = 'HRA_RECEBE'
    end
  end
  object DSP_CMDepAnaliseDocRel: TDataSetProvider
    DataSet = SDS_CMDepAnaliseDocRel
    Options = [poRetainServerOrder]
    Left = 621
    Top = 502
  end
  object CDS_CMDepAnaliseDocRel: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_CMDepAnaliseDocRel'
    AfterOpen = CDS_CMDepAnaliseDocRelAfterOpen
    Left = 664
    Top = 488
    object CDS_CMDepAnaliseDocRelNUM_DOCTO: TIntegerField
      DisplayLabel = 'N'#186' Docto'
      FieldName = 'NUM_DOCTO'
      Required = True
      DisplayFormat = ',0'
    end
    object CDS_CMDepAnaliseDocRelUSU_CRIACAO: TIntegerField
      FieldName = 'USU_CRIACAO'
    end
    object CDS_CMDepAnaliseDocRelDTA_CRIACAO: TDateField
      FieldName = 'DTA_CRIACAO'
    end
    object CDS_CMDepAnaliseDocRelDES_USU_CRIACAO: TStringField
      FieldName = 'DES_USU_CRIACAO'
      Size = 50
    end
    object CDS_CMDepAnaliseDocRelHRA_CRIACAO: TTimeField
      FieldName = 'HRA_CRIACAO'
    end
    object CDS_CMDepAnaliseDocRelDTA_MOVTO: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data '
      FieldName = 'DTA_MOVTO'
    end
    object CDS_CMDepAnaliseDocRelCOD_LINX: TIntegerField
      FieldName = 'COD_LINX'
    end
    object CDS_CMDepAnaliseDocRelNOME_LOJA: TStringField
      DisplayLabel = 'Nome da Loja'
      FieldName = 'NOME_LOJA'
      Size = 50
    end
    object CDS_CMDepAnaliseDocRelVLR_MATRIZ: TFMTBCDField
      DisplayLabel = '$ Cx Matriz'
      FieldName = 'VLR_MATRIZ'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMDepAnaliseDocRelVLR_DEPOSITOS: TFMTBCDField
      DisplayLabel = '$ Dep'#243'sitos'
      FieldName = 'VLR_DEPOSITOS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMDepAnaliseDocRelVLR_DESPESAS: TFMTBCDField
      DisplayLabel = '$ Despesas'
      FieldName = 'VLR_DESPESAS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMDepAnaliseDocRelVLR_OUTROS: TFMTBCDField
      DisplayLabel = '$ Outros'
      FieldName = 'VLR_OUTROS'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMDepAnaliseDocRelVLR_TOTAL: TFMTBCDField
      DisplayLabel = '$ Total'
      FieldName = 'VLR_TOTAL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CMDepAnaliseDocRelOBS_FINANCEIRO: TStringField
      DisplayLabel = 'OBS Financeiro'
      FieldName = 'OBS_FINANCEIRO'
      Size = 50
    end
    object CDS_CMDepAnaliseDocRelUSU_INCLUSAO: TIntegerField
      FieldName = 'USU_INCLUSAO'
    end
    object CDS_CMDepAnaliseDocRelDES_USU_INCLUSAO: TStringField
      DisplayLabel = 'Usu'#225'rio Inclus'#227'o'
      FieldName = 'DES_USU_INCLUSAO'
      Size = 50
    end
    object CDS_CMDepAnaliseDocRelDTA_INCLUSAO: TDateField
      DisplayLabel = 'Data Inclus'#227'o'
      FieldName = 'DTA_INCLUSAO'
    end
    object CDS_CMDepAnaliseDocRelHRA_INCLUSAO: TTimeField
      FieldName = 'HRA_INCLUSAO'
    end
    object CDS_CMDepAnaliseDocRelUSU_IMPRESSAO: TIntegerField
      FieldName = 'USU_IMPRESSAO'
    end
    object CDS_CMDepAnaliseDocRelDES_USU_IMPRESSAO: TStringField
      FieldName = 'DES_USU_IMPRESSAO'
      Size = 50
    end
    object CDS_CMDepAnaliseDocRelDTA_IMPRESSAO: TDateField
      FieldName = 'DTA_IMPRESSAO'
    end
    object CDS_CMDepAnaliseDocRelHRA_IMPRESSAO: TTimeField
      FieldName = 'HRA_IMPRESSAO'
    end
    object CDS_CMDepAnaliseDocRelUSU_RECEBE: TIntegerField
      FieldName = 'USU_RECEBE'
    end
    object CDS_CMDepAnaliseDocRelDES_USU_RECEBE: TStringField
      FieldName = 'DES_USU_RECEBE'
      Size = 50
    end
    object CDS_CMDepAnaliseDocRelDTA_RECEBE: TDateField
      FieldName = 'DTA_RECEBE'
    end
    object CDS_CMDepAnaliseDocRelHRA_RECEBE: TTimeField
      FieldName = 'HRA_RECEBE'
    end
  end
  object DS_CMDepAnaliseDocRel: TDataSource
    DataSet = CDS_CMDepAnaliseDocRel
    Left = 712
    Top = 504
  end
end
