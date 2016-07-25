object DMConciliacao: TDMConciliacao
  OldCreateOrder = False
  Left = 290
  Top = 129
  Height = 599
  Width = 1076
  object SDS_Bancos: TSQLDataSet
    CommandText = 
      'select *'#13#10'from fin_bancos fb'#13#10'Order by fb.des_banco, fb.num_banc' +
      'o, fb.num_agencia, fb.num_conta'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 40
    Top = 8
  end
  object DSP_Bancos: TDataSetProvider
    DataSet = SDS_Bancos
    Left = 80
    Top = 32
  end
  object CDS_Bancos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Bancos'
    Left = 120
    Top = 16
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
    Left = 160
    Top = 32
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
    Left = 40
    Top = 88
  end
  object DSP_LojasBanco: TDataSetProvider
    DataSet = SDS_LojasBanco
    Left = 80
    Top = 112
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
    Left = 120
    Top = 96
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
    Left = 160
    Top = 112
  end
  object DS_Extrato: TDataSource
    DataSet = CDS_Extrato
    Left = 160
    Top = 168
  end
  object CDS_Extrato: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Extrato'
    Left = 120
    Top = 160
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
    Left = 40
    Top = 160
  end
  object DSP_Extrato: TDataSetProvider
    DataSet = SDS_Extrato
    Left = 80
    Top = 184
  end
  object DS_LojasBancos: TDataSource
    DataSet = CDS_LojasBancos
    Left = 160
    Top = 256
  end
  object CDS_LojasBancos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_LojasBancos'
    Left = 120
    Top = 240
  end
  object SDS_LojasBancos: TSQLDataSet
    CommandText = 
      'SELECT b.cod_banco, b.num_banco, b.des_banco,'#13#10'b.num_agencia, b.' +
      'des_agencia, b.num_conta'#13#10'FROM fin_bancos b, fin_bancos_lojas l'#13 +
      #10'WHERE b.cod_banco=l.cod_banco'#13#10'AND l.cod_loja='#39'03'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 40
    Top = 240
  end
  object DSP_LojasBancos: TDataSetProvider
    DataSet = SDS_LojasBancos
    Left = 80
    Top = 264
  end
  object DS_ConcExtratos: TDataSource
    DataSet = CDS_ConcExtratos
    Left = 422
    Top = 31
  end
  object CDS_ConcExtratos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ConcExtratos'
    Left = 368
    Top = 13
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
    Top = 16
  end
  object DSP_ConcExtratos: TDataSetProvider
    DataSet = SDS_ConcExtratos
    Left = 320
    Top = 32
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
    Top = 138
  end
  object DSP_CMExtratos: TDataSetProvider
    DataSet = SDS_CMExtratos
    Left = 320
    Top = 154
  end
  object CDS_CMExtratos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_CMExtratos'
    Left = 368
    Top = 135
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
    Top = 234
  end
  object CDS_CMPagtos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_CMPagtos'
    Left = 368
    Top = 213
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
    Top = 216
  end
  object DSP_CMPagtos: TDataSetProvider
    DataSet = SDS_CMPagtos
    Left = 320
    Top = 232
  end
  object DS_CMExtratos: TDataSource
    DataSet = CDS_CMExtratos
    Left = 422
    Top = 154
  end
  object SDS_TpConciliacao: TSQLDataSet
    CommandText = 
      'select *'#13#10'from tab_auxiliar t'#13#10'where t.tip_aux=3'#13#10'And t.cod_aux>' +
      '0'#13#10'order by t.des_aux'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 544
    Top = 24
  end
  object DSP_TpConciliacao: TDataSetProvider
    DataSet = SDS_TpConciliacao
    Left = 608
    Top = 40
  end
  object CDS_TpConciliacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_TpConciliacao'
    Left = 672
    Top = 24
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
    Left = 736
    Top = 39
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
    Top = 290
  end
  object DSP_CMApresPagtos: TDataSetProvider
    DataSet = SDS_CMApresPagtos
    Left = 320
    Top = 306
  end
  object CDS_CMApresPagtos: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DSP_CMApresPagtos'
    AfterScroll = CDS_CMApresPagtosAfterScroll
    Left = 368
    Top = 287
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
      DisplayFormat = '0,.00'
      Expression = 'SUM(VLR_DOCTO)'
    end
  end
  object DS_CMApresExtrato: TDataSource
    DataSet = CDS_CMApresExtratos
    Left = 422
    Top = 385
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
    Top = 368
  end
  object DSP_CMApresExtratos: TDataSetProvider
    DataSet = SDS_CMApresExtratos
    Left = 320
    Top = 384
  end
  object DS_CMApresPagtos: TDataSource
    DataSet = CDS_CMApresPagtos
    Left = 422
    Top = 306
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
    Top = 440
  end
  object DSP_CMTotalPagtos: TDataSetProvider
    DataSet = SDS_CMTotalPagtos
    Left = 320
    Top = 456
  end
  object CDS_CMTotalPagtos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_CMTotalPagtos'
    Left = 368
    Top = 437
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
    Top = 456
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
    Left = 40
    Top = 368
  end
  object DSP_HistAuto: TDataSetProvider
    DataSet = SDS_HistAuto
    Left = 80
    Top = 384
  end
  object CDS_HistAuto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_HistAuto'
    Left = 120
    Top = 368
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
    Left = 160
    Top = 383
  end
  object DS_ConcCaixa: TDataSource
    DataSet = CDS_ConcCaixa
    Left = 727
    Top = 116
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
    Left = 560
    Top = 192
  end
  object DS_ConcCaixaTotais: TDataSource
    DataSet = CDS_ConcCaixaTotais
    Left = 751
    Top = 196
  end
  object DSP_ConcCaixaTotais: TDataSetProvider
    DataSet = SDS_ConcCaixaTotais
    Left = 617
    Top = 204
  end
  object CDS_ConcCaixaTotais: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ConcCaixaTotais'
    Left = 689
    Top = 184
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
      Size = 32
    end
  end
  object CDS_ConcCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSp_ConcCaixa'
    Left = 672
    Top = 136
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
    Left = 560
    Top = 132
  end
  object DSP_ConcCaixa: TDataSetProvider
    DataSet = SDS_ConcCaixa
    Left = 617
    Top = 116
  end
  object CDS_CMApresExtratos: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DSP_CMApresExtratos'
    AfterScroll = CDS_CMApresExtratosAfterScroll
    Left = 368
    Top = 365
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
      DisplayFormat = '0,.00'
      Expression = 'SUM(VLR_DOCTO)'
    end
  end
end
