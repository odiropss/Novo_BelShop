object DMLojaUnica: TDMLojaUnica
  OldCreateOrder = False
  Left = 243
  Top = 116
  Height = 581
  Width = 1026
  object CDS_ParamLjFornDia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ParamLjFornDia'
    Left = 175
    Top = 56
    object CDS_ParamLjFornDiaPROC: TStringField
      FieldName = 'PROC'
      Required = True
      FixedChar = True
      Size = 3
    end
    object CDS_ParamLjFornDiaCOD_LOJA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Loja'
      FieldName = 'COD_LOJA'
      Size = 2
    end
    object CDS_ParamLjFornDiaCODFORNECEDOR: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd Forn'
      FieldName = 'CODFORNECEDOR'
      Required = True
      FixedChar = True
      Size = 6
    end
    object CDS_ParamLjFornDiaNOMEFORNECEDOR: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOMEFORNECEDOR'
      Size = 40
    end
    object CDS_ParamLjFornDiaTIPO_CALCULO: TStringField
      DisplayLabel = 'Tipo Calculo'
      FieldName = 'TIPO_CALCULO'
      FixedChar = True
      Size = 12
    end
    object CDS_ParamLjFornDiaSITUACAO_CALCULO: TStringField
      DisplayLabel = 'Situa'#231#227'o do Calculo'
      FieldName = 'SITUACAO_CALCULO'
      Size = 41
    end
    object CDS_ParamLjFornDiaDIAS_MESES: TStringField
      DisplayLabel = 'Dias ou Meses para Calculo'
      FieldName = 'DIAS_MESES'
      Size = 126
    end
    object CDS_ParamLjFornDiaFORN: TStringField
      FieldName = 'FORN'
      Required = True
      FixedChar = True
      Size = 3
    end
  end
  object DSP_ParamLjFornDia: TDataSetProvider
    DataSet = SDS_ParamLjFornDia
    Options = [poRetainServerOrder]
    Left = 126
    Top = 76
  end
  object DS_ParamLjFornDia: TDataSource
    DataSet = CDS_ParamLjFornDia
    Left = 239
    Top = 76
  end
  object CDS_ParamLojasFTP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ParamLojasFTP'
    Left = 175
    Top = 196
    object CDS_ParamLojasFTPIND_ORDEM: TStringField
      FieldName = 'IND_ORDEM'
      FixedChar = True
      Size = 3
    end
    object CDS_ParamLojasFTPIND_TIPO: TIntegerField
      FieldName = 'IND_TIPO'
    end
    object CDS_ParamLojasFTPIND_DML: TStringField
      FieldName = 'IND_DML'
      Size = 3
    end
    object CDS_ParamLojasFTPNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
    end
    object CDS_ParamLojasFTPCOD_LOJA: TStringField
      FieldName = 'COD_LOJA'
      Size = 2
    end
    object CDS_ParamLojasFTPDML_EXC: TStringField
      FieldName = 'DML_EXC'
      Size = 67
    end
    object CDS_ParamLojasFTPDML_INC: TStringField
      FieldName = 'DML_INC'
      Size = 467
    end
  end
  object DSP_ParamLojasFTP: TDataSetProvider
    DataSet = SDS_ParamLojasFTP
    Options = [poRetainServerOrder]
    Left = 126
    Top = 210
  end
  object DS_ParamLojasFTP: TDataSource
    DataSet = CDS_ParamLojasFTP
    Left = 239
    Top = 210
  end
  object CDS_ParametrosLoja: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ParametrosLoja'
    Left = 175
    Top = 135
    object CDS_ParametrosLojaNUM_SEQ: TIntegerField
      FieldName = 'NUM_SEQ'
    end
    object CDS_ParametrosLojaIND_TIPO: TIntegerField
      FieldName = 'IND_TIPO'
    end
    object CDS_ParametrosLojaCOD_LOJA: TStringField
      FieldName = 'COD_LOJA'
      Size = 2
    end
    object CDS_ParametrosLojaIND_SIM_NAO: TStringField
      FieldName = 'IND_SIM_NAO'
      FixedChar = True
      Size = 3
    end
    object CDS_ParametrosLojaNUM_DIA_CALCULO: TIntegerField
      FieldName = 'NUM_DIA_CALCULO'
    end
    object CDS_ParametrosLojaCOD_FORNECEDOR: TStringField
      FieldName = 'COD_FORNECEDOR'
      FixedChar = True
      Size = 6
    end
    object CDS_ParametrosLojaPER_ACEITO: TFMTBCDField
      FieldName = 'PER_ACEITO'
      Precision = 15
      Size = 2
    end
    object CDS_ParametrosLojaDTA_ULT_CALCULO: TDateField
      FieldName = 'DTA_ULT_CALCULO'
    end
    object CDS_ParametrosLojaDTA_PROX_CALCULO: TDateField
      FieldName = 'DTA_PROX_CALCULO'
    end
    object CDS_ParametrosLojaIND_DIARIAMENTE: TStringField
      FieldName = 'IND_DIARIAMENTE'
      FixedChar = True
      Size = 3
    end
    object CDS_ParametrosLojaIND_TODOS_DIAS: TStringField
      FieldName = 'IND_TODOS_DIAS'
      FixedChar = True
      Size = 3
    end
    object CDS_ParametrosLojaCADA_NUM_DIAS: TIntegerField
      FieldName = 'CADA_NUM_DIAS'
    end
    object CDS_ParametrosLojaIND_SEMANAMENTE: TStringField
      FieldName = 'IND_SEMANAMENTE'
      FixedChar = True
      Size = 3
    end
    object CDS_ParametrosLojaCADA_NUM_SEMANA: TIntegerField
      FieldName = 'CADA_NUM_SEMANA'
    end
    object CDS_ParametrosLojaDIA_SEG: TStringField
      FieldName = 'DIA_SEG'
      FixedChar = True
      Size = 3
    end
    object CDS_ParametrosLojaDIA_TER: TStringField
      FieldName = 'DIA_TER'
      FixedChar = True
      Size = 3
    end
    object CDS_ParametrosLojaDIA_QUA: TStringField
      FieldName = 'DIA_QUA'
      FixedChar = True
      Size = 3
    end
    object CDS_ParametrosLojaDIA_QUI: TStringField
      FieldName = 'DIA_QUI'
      FixedChar = True
      Size = 3
    end
    object CDS_ParametrosLojaDIA_SEX: TStringField
      FieldName = 'DIA_SEX'
      FixedChar = True
      Size = 3
    end
    object CDS_ParametrosLojaIND_MENSALMENTE: TStringField
      FieldName = 'IND_MENSALMENTE'
      FixedChar = True
      Size = 3
    end
    object CDS_ParametrosLojaDES_POSICAO: TStringField
      FieldName = 'DES_POSICAO'
      Size = 12
    end
    object CDS_ParametrosLojaDIA_DIAS: TStringField
      FieldName = 'DIA_DIAS'
      FixedChar = True
      Size = 3
    end
    object CDS_ParametrosLojaMES_JAN: TStringField
      FieldName = 'MES_JAN'
      FixedChar = True
      Size = 3
    end
    object CDS_ParametrosLojaMES_FEV: TStringField
      FieldName = 'MES_FEV'
      FixedChar = True
      Size = 3
    end
    object CDS_ParametrosLojaMES_MAR: TStringField
      FieldName = 'MES_MAR'
      FixedChar = True
      Size = 3
    end
    object CDS_ParametrosLojaMES_ABR: TStringField
      FieldName = 'MES_ABR'
      FixedChar = True
      Size = 3
    end
    object CDS_ParametrosLojaMES_MAI: TStringField
      FieldName = 'MES_MAI'
      FixedChar = True
      Size = 3
    end
    object CDS_ParametrosLojaMES_JUN: TStringField
      FieldName = 'MES_JUN'
      FixedChar = True
      Size = 3
    end
    object CDS_ParametrosLojaMES_JUL: TStringField
      FieldName = 'MES_JUL'
      FixedChar = True
      Size = 3
    end
    object CDS_ParametrosLojaMES_AGO: TStringField
      FieldName = 'MES_AGO'
      FixedChar = True
      Size = 3
    end
    object CDS_ParametrosLojaMES_SET: TStringField
      FieldName = 'MES_SET'
      FixedChar = True
      Size = 3
    end
    object CDS_ParametrosLojaMES_OUT: TStringField
      FieldName = 'MES_OUT'
      FixedChar = True
      Size = 3
    end
    object CDS_ParametrosLojaMES_NOV: TStringField
      FieldName = 'MES_NOV'
      FixedChar = True
      Size = 3
    end
    object CDS_ParametrosLojaMES_DEZ: TStringField
      FieldName = 'MES_DEZ'
      FixedChar = True
      Size = 3
    end
    object CDS_ParametrosLojaIND_DML: TStringField
      FieldName = 'IND_DML'
      Size = 3
    end
  end
  object DSP_ParametrosLoja: TDataSetProvider
    DataSet = SDS_ParametrosLoja
    Options = [poRetainServerOrder]
    Left = 126
    Top = 149
  end
  object DS_ParametrosLoja: TDataSource
    DataSet = CDS_ParametrosLoja
    Left = 239
    Top = 149
  end
  object SDS_ParamLjFornDia: TSQLDataSet
    CommandText = 
      'select '#39'NAO'#39' PROC, pl.cod_loja,'#13#10'fr.codfornecedor, fr.nomefornec' +
      'edor,'#13#10'Case'#13#10'  When pl.ind_diariamente='#39'SIM'#39' Then '#39'Diariamente'#39#13 +
      #10'  When pl.ind_semanamente='#39'SIM'#39' Then '#39'Semanalmente'#39#13#10'  When pl.' +
      'ind_mensalmente='#39'SIM'#39' Then '#39'Mensalmente'#39#13#10'End Tipo_Calculo,'#13#10'Cas' +
      'e'#13#10'  When (pl.ind_diariamente='#39'SIM'#39') and (pl.ind_todos_dias='#39'SIM' +
      #39') Then '#39'Todos os Dias'#39#13#10'  When (pl.ind_diariamente='#39'SIM'#39') and (' +
      'pl.ind_todos_dias='#39'NAO'#39') Then '#39'A Cada '#39'||pl.cada_num_dias||'#39' Dia' +
      '(s)'#39#13#10#13#10'  When pl.ind_semanamente='#39'SIM'#39' Then '#39'A Cada '#39'||pl.cada_' +
      'num_semana||'#39' Semana(s)'#39#13#10#13#10'  When pl.ind_mensalmente='#39'SIM'#39' Then' +
      #13#10'  Case'#13#10'    When pl.dia_dias='#39'SIM'#39' then '#39'Posi'#231#227'o: '#39'||pl.des_po' +
      'sicao||'#39' Dias de Cada M'#234's'#39#13#10'    When pl.dia_seg='#39'SIM'#39'  then '#39'Pos' +
      'i'#231#227'o: '#39'||pl.des_posicao||'#39' Segunda de Cada M'#234's'#39#13#10'    When pl.dia' +
      '_ter='#39'SIM'#39'  then '#39'Posi'#231#227'o: '#39'||pl.des_posicao||'#39' Ter'#231'a de Cada M'#234 +
      's'#39#13#10'    When pl.dia_qua='#39'SIM'#39'  then '#39'Posi'#231#227'o: '#39'||pl.des_posicao|' +
      '|'#39' Quarta de Cada M'#234's'#39#13#10'    When pl.dia_qui='#39'SIM'#39'  then '#39'Posi'#231#227'o' +
      ': '#39'||pl.des_posicao||'#39' Quinta de Cada M'#234's'#39#13#10'    When pl.dia_sex=' +
      #39'SIM'#39'  then '#39'Posi'#231#227'o: '#39'||pl.des_posicao||'#39' Sexta de Cada M'#234's'#39#13#10' ' +
      ' End'#13#10'End Situacao_Calculo,'#13#10#13#10'Case'#13#10'  When pl.ind_semanamente='#39 +
      'SIM'#39' Then '#39' Dias: (Seg='#39'||pl.dia_seg||'#39') ( Ter='#39'||pl.dia_ter||'#39')' +
      #39'||'#13#10'                                           '#39' (Qua='#39'||pl.dia' +
      '_qua||'#39') ( Qui='#39'||pl.dia_qui||'#39')'#39'||'#13#10'                           ' +
      '                '#39' (Sex='#39'||pl.dia_sex||'#39')'#39#13#10#13#10'  When pl.ind_mensa' +
      'lmente='#39'SIM'#39' Then '#39'Meses: (Jan='#39'||pl.mes_jan||'#39') (Fev='#39'||pl.mes_' +
      'fev||'#39')'#39'||'#13#10'                                           '#39' (Mar='#39'|' +
      '|pl.mes_mar||'#39') (Abr='#39'||pl.mes_abr||'#39')'#39'||'#13#10'                     ' +
      '                      '#39' (Mai='#39'||pl.mes_mai||'#39') (Jun='#39'||pl.mes_ju' +
      'n||'#39')'#39'||'#13#10'                                           '#39' (Jul='#39'||p' +
      'l.mes_jul||'#39') (Ago='#39'||pl.mes_ago||'#39')'#39'||'#13#10'                       ' +
      '                    '#39' (Set='#39'||pl.mes_set||'#39') (Out='#39'||pl.mes_out|' +
      '|'#39')'#39'||'#13#10'                                           '#39' (Nov='#39'||pl.' +
      'mes_nov||'#39') (Dez='#39'||pl.mes_dez||'#39')'#39#13#10'end Dias_Meses,'#13#10#39'NAO'#39' Forn' +
      #13#10#13#10'from fornecedor fr'#13#10'   Left Join PARAMETROS_LOJAS pl  on fr.' +
      'codfornecedor=pl.cod_fornecedor'#13#10'                               ' +
      '  And pl.ind_tipo=7'#13#10'                                 And (pl.in' +
      'd_dml is null or pl.ind_dml<>'#39'EXC'#39')'#13#10#13#10'where exists(select 1'#13#10'fr' +
      'om produto p'#13#10'where p.principalfor=fr.codfornecedor'#13#10'AND p.situa' +
      'caopro in (0,3))'#13#10#13#10'ORDER BY 4, 2'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 72
    Top = 56
  end
  object SDS_ParametrosLoja: TSQLDataSet
    CommandText = 'SELECT *'#13#10'FROM PARAMETROS_LOJAS pl'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 72
    Top = 135
  end
  object SDS_ParamLojasFTP: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'CASE'#13#10'  WHEN pl.IND_DML='#39'EXC'#39' THEN '#39'1-E'#39#13#10'  WHEN pl.IND_' +
      'DML='#39'ALT'#39' THEN '#39'2-A'#39#13#10'  WHEN pl.IND_DML='#39'INC'#39' THEN '#39'3-I'#39#13#10'END IN' +
      'D_ORDEM,'#13#10'pl.IND_TIPO,'#13#10'pl.ind_dml,'#13#10'pl.num_seq,'#13#10'pl.cod_loja,'#13#10 +
      #13#10'CASE'#13#10'  WHEN (pl.IND_TIPO=7) THEN'#13#10'       '#39'UPDATE PARAMETROS_L' +
      'OJAS'#39'||'#13#10'       '#39' SET IND_DML='#39#39'EXC'#39#39#39'||'#13#10'       '#39', NUM_DIA_CALC' +
      'ULO='#39'||pl.num_seq||'#13#10'       '#39', NUM_SEQ=0'#39'||'#13#10'       '#39' WHERE NUM_' +
      'SEQ='#39'||pl.num_seq'#13#10'  Else'#13#10'       '#39'DELETE FROM PARAMETROS_LOJAS'#39 +
      '||'#13#10'       '#39' WHERE NUM_SEQ='#39'||pl.num_seq'#13#10'END DML_EXC,'#13#10#13#10'CASE'#13#10 +
      '  WHEN (pl.IND_DML<>'#39'EXC'#39') and (pl.IND_TIPO=0) THEN'#13#10'       '#39'INS' +
      'ERT INTO PARAMETROS_LOJAS'#39'||'#13#10'       '#39' (NUM_SEQ, IND_TIPO, COD_L' +
      'OJA, PER_ACEITO)'#39'||'#13#10'       '#39' VALUES ('#39'||'#13#10'       pl.num_seq||'#39',' +
      ' '#39'||'#13#10'       pl.ind_tipo||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl.cod_loja||'#39#39#39#39 +
      '||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl.per_aceito||'#39#39#39#39'||'#13#10'       '#39')'#39#13#10#13#10'  WH' +
      'EN ((pl.IND_DML<>'#39'EXC'#39') and ((pl.IND_TIPO=1) or (pl.IND_TIPO=2) ' +
      'or (pl.IND_TIPO=5))) THEN'#13#10'       '#39'INSERT INTO PARAMETROS_LOJAS'#39 +
      '||'#13#10'       '#39' (NUM_SEQ, IND_TIPO, IND_SIM_NAO)'#39'||'#13#10'       '#39' VALUE' +
      'S ('#39'||'#13#10'       pl.num_seq||'#39', '#39'||'#13#10'       pl.ind_tipo||'#39', '#39'||'#13#10' ' +
      '      '#39#39#39#39'||pl.ind_sim_nao||'#39#39#39#39'||'#13#10'       '#39')'#39#13#10#13#10'  WHEN (pl.IND' +
      '_DML<>'#39'EXC'#39') and (pl.IND_TIPO=3) THEN'#13#10'       '#39'INSERT INTO PARAM' +
      'ETROS_LOJAS'#39'||'#13#10'       '#39' (NUM_SEQ, IND_TIPO, COD_LOJA, NUM_DIA_C' +
      'ALCULO)'#39'||'#13#10'       '#39' VALUES ('#39'||'#13#10'       pl.num_seq||'#39', '#39'||'#13#10'   ' +
      '    pl.ind_tipo||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl.cod_loja||'#39#39#39#39'||'#39', '#39'||'#13 +
      #10'       '#39#39#39#39'||pl.num_dia_calculo||'#39#39#39#39'||'#13#10'       '#39')'#39#13#10#13#10'  WHEN (' +
      'pl.IND_DML<>'#39'EXC'#39') and (pl.IND_TIPO=4) THEN'#13#10'       '#39'INSERT INTO' +
      ' PARAMETROS_LOJAS'#39'||'#13#10'       '#39' (NUM_SEQ,IND_TIPO, COD_LOJA, COD_' +
      'FORNECEDOR, PER_ACEITO)'#39'||'#13#10'       '#39' VALUES ('#39'||'#13#10'       pl.num_' +
      'seq||'#39', '#39'||'#13#10'       pl.ind_tipo||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl.cod_loj' +
      'a||'#39#39#39#39'||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl.cod_fornecedor||'#39#39#39#39'||'#39', '#39'||'#13#10' ' +
      '      '#39#39#39#39'||pl.per_aceito||'#39#39#39#39'||'#13#10'       '#39')'#39#13#10#13#10'  WHEN (pl.IND_' +
      'DML<>'#39'EXC'#39') and (pl.IND_TIPO=6) THEN'#13#10'       '#39'INSERT INTO PARAME' +
      'TROS_LOJAS'#39'||'#13#10'       '#39' (NUM_SEQ, IND_TIPO, IND_SIM_NAO, PER_ACE' +
      'ITO)'#39'||'#13#10'       '#39' VALUES ('#39'||'#13#10'       pl.num_seq||'#39', '#39'||'#13#10'      ' +
      ' pl.ind_tipo||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl.ind_sim_nao||'#39#39#39#39'||'#39', '#39'||'#13 +
      #10'       '#39#39#39#39'||pl.per_aceito||'#39#39#39#39'||'#13#10'       '#39')'#39#13#10#13#10'  WHEN (pl.IN' +
      'D_DML<>'#39'EXC'#39') and (pl.IND_TIPO=7) and (pl.ind_diariamente='#39'SIM'#39')' +
      'THEN'#13#10'       '#39'INSERT INTO PARAMETROS_LOJAS'#39'||'#13#10'       '#39' (NUM_SEQ' +
      ', IND_TIPO, COD_LOJA,  COD_FORNECEDOR,'#39'||'#13#10'       '#39' IND_DIARIAME' +
      'NTE, IND_TODOS_DIAS, CADA_NUM_DIAS)'#39'||'#13#10'       '#39' VALUES ('#39'||'#13#10'  ' +
      '     pl.num_seq||'#39', '#39'||'#13#10'       pl.ind_tipo||'#39', '#39'||'#13#10'       '#39#39#39#39 +
      '||pl.cod_loja||'#39#39#39#39'||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl.cod_fornecedor||'#39#39#39 +
      #39'||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl.ind_diariamente||'#39#39#39#39'||'#39', '#39'||'#13#10'      ' +
      ' '#39#39#39#39'||pl.ind_todos_dias||'#39#39#39#39'||'#39', '#39'||'#13#10'       '#39#39#39#39'||Coalesce(pl' +
      '.cada_num_dias,0)||'#39#39#39#39'||'#13#10'       '#39')'#39#13#10#13#10'  WHEN (pl.IND_DML<>'#39'EX' +
      'C'#39') and (pl.IND_TIPO=7) and (pl.ind_semanamente='#39'SIM'#39')THEN'#13#10'    ' +
      '   '#39'INSERT INTO PARAMETROS_LOJAS'#39'||'#13#10'       '#39' (NUM_SEQ, IND_TIPO' +
      ', COD_LOJA,  COD_FORNECEDOR,'#39'||'#13#10'       '#39' IND_SEMANAMENTE, CADA_' +
      'NUM_SEMANA,'#39'||'#13#10'       '#39' DIA_SEG, DIA_TER, DIA_QUA, DIA_QUI, DIA' +
      '_SEX)'#39'||'#13#10'       '#39' VALUES ('#39'||'#13#10'       pl.num_seq||'#39', '#39'||'#13#10'     ' +
      '  pl.ind_tipo||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl.cod_loja||'#39#39#39#39'||'#39', '#39'||'#13#10' ' +
      '      '#39#39#39#39'||pl.cod_fornecedor||'#39#39#39#39'||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl.ind' +
      '_semanamente||'#39#39#39#39'||'#39', '#39'||'#13#10'       '#39#39#39#39'||coalesce(pl.cada_num_se' +
      'mana,0)||'#39#39#39#39'||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl.dia_seg||'#39#39#39#39'||'#39', '#39'||'#13#10'  ' +
      '     '#39#39#39#39'||pl.dia_ter||'#39#39#39#39'||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl.dia_qua||'#39#39 +
      #39#39'||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl.dia_qui||'#39#39#39#39'||'#39', '#39'||'#13#10'       '#39#39#39#39'||' +
      'pl.dia_sex||'#39#39#39#39'||'#13#10'       '#39')'#39#13#10#13#10'  WHEN (pl.IND_DML<>'#39'EXC'#39') and' +
      ' (pl.IND_TIPO=7) and (pl.ind_mensalmente='#39'SIM'#39')THEN'#13#10'       '#39'INS' +
      'ERT INTO PARAMETROS_LOJAS'#39'||'#13#10'       '#39' (NUM_SEQ, IND_TIPO, COD_L' +
      'OJA,  COD_FORNECEDOR,'#39'||'#13#10'       '#39' DIA_SEG, DIA_TER, DIA_QUA, DI' +
      'A_QUI, DIA_SEX,'#39'||'#13#10'       '#39' IND_MENSALMENTE, DES_POSICAO, DIA_D' +
      'IAS,'#39'||'#13#10'       '#39' MES_JAN, MES_FEV, MES_MAR, MES_ABR, MES_MAI, M' +
      'ES_JUN,'#39'||'#13#10'       '#39' MES_JUL, MES_AGO, MES_SET, MES_OUT, MES_NOV' +
      ', MES_DEZ)'#39'||'#13#10'       '#39' VALUES ('#39'||'#13#10'       pl.num_seq||'#39', '#39'||'#13#10 +
      '       pl.ind_tipo||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl.cod_loja||'#39#39#39#39'||'#39', '#39 +
      '||'#13#10'       '#39#39#39#39'||pl.cod_fornecedor||'#39#39#39#39'||'#39', '#39'||'#13#10'       '#39#39#39#39'||p' +
      'l.dia_seg||'#39#39#39#39'||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl.dia_ter||'#39#39#39#39'||'#39', '#39'||'#13#10 +
      '       '#39#39#39#39'||pl.dia_qua||'#39#39#39#39'||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl.dia_qui||' +
      #39#39#39#39'||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl.dia_sex||'#39#39#39#39'||'#39', '#39'||'#13#10'       '#39#39#39#39 +
      '||pl.ind_mensalmente||'#39#39#39#39'||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl.des_posicao|' +
      '|'#39#39#39#39'||'#39', '#39'||'#13#10'       '#39#39#39#39'||coalesce(pl.dia_dias,'#39'NAO'#39')||'#39#39#39#39'||'#39 +
      ', '#39'||'#13#10'       '#39#39#39#39'||pl.mes_jan||'#39#39#39#39'||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl.me' +
      's_fev||'#39#39#39#39'||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl.mes_mar||'#39#39#39#39'||'#39', '#39'||'#13#10'    ' +
      '   '#39#39#39#39'||pl.mes_abr||'#39#39#39#39'||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl.mes_mai||'#39#39#39#39 +
      '||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl.mes_jun||'#39#39#39#39'||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl' +
      '.mes_jul||'#39#39#39#39'||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl.mes_ago||'#39#39#39#39'||'#39', '#39'||'#13#10' ' +
      '      '#39#39#39#39'||pl.mes_set||'#39#39#39#39'||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl.mes_out||'#39 +
      #39#39#39'||'#39', '#39'||'#13#10'       '#39#39#39#39'||pl.mes_nov||'#39#39#39#39'||'#39', '#39'||'#13#10'       '#39#39#39#39'|' +
      '|pl.mes_dez||'#39#39#39#39'||'#13#10'       '#39')'#39#13#10#13#10'END DML_INC'#13#10#13#10'FROM PARAMETRO' +
      'S_LOJAS pl'#13#10'WHERE pl.ind_dml IS NOT NULL'#13#10#13#10'ORDER BY 1, 2'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 72
    Top = 196
  end
  object CDS_V_OCTotForn: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ParamLojasFTP'
    Left = 103
    Top = 372
    object CDS_V_OCTotFornPROC: TStringField
      DisplayLabel = 'Selecionar'
      FieldName = 'PROC'
      Size = 3
    end
    object CDS_V_OCTotFornCOD_FORN: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd Forn'
      FieldName = 'COD_FORN'
      Required = True
      FixedChar = True
      Size = 6
    end
    object CDS_V_OCTotFornDES_FORNECEDOR: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'DES_FORNECEDOR'
      Size = 40
    end
    object CDS_V_OCTotFornVLR_VENDAS: TCurrencyField
      DisplayLabel = 'Valor Total Vendas'
      FieldName = 'VLR_VENDAS'
      DisplayFormat = '0.,00'
    end
    object CDS_V_OCTotFornVLR_COMPRAS: TCurrencyField
      DisplayLabel = 'Valor Total Compras'
      FieldName = 'VLR_COMPRAS'
      DisplayFormat = '0.,00'
    end
    object CDS_V_OCTotFornTOT_ITENS: TIntegerField
      DisplayLabel = 'Total de Itens'
      FieldName = 'TOT_ITENS'
    end
    object CDS_V_OCTotFornQTD_TOTAL: TCurrencyField
      DisplayLabel = 'Quant Total'
      FieldName = 'QTD_TOTAL'
      DisplayFormat = '0.,00'
    end
    object CDS_V_OCTotFornTOT_ITENS_ACOMPRAR: TIntegerField
      FieldName = 'TOT_ITENS_ACOMPRAR'
    end
    object CDS_V_OCTotFornIND_TRANSF: TStringField
      Alignment = taCenter
      DisplayLabel = 'Sol. Fechada ?'
      FieldName = 'IND_TRANSF'
      Size = 3
    end
  end
  object DS_V_OCTotForn: TDataSource
    DataSet = CDS_V_OCTotForn
    Left = 167
    Top = 386
  end
  object CDS_V_SolicitFornLojas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 87
    Top = 452
    object CDS_V_SolicitFornLojasPROC: TStringField
      Alignment = taCenter
      DisplayLabel = 'Importar ?'
      FieldName = 'PROC'
      Required = True
      FixedChar = True
      Size = 3
    end
    object CDS_V_SolicitFornLojasCOD_FORNECEDOR: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_FORNECEDOR'
      Size = 6
    end
    object CDS_V_SolicitFornLojasNOMEFORNECEDOR: TStringField
      DisplayLabel = 'Nome do Fornecedor'
      FieldName = 'NOMEFORNECEDOR'
      Size = 40
    end
    object CDS_V_SolicitFornLojasCOD_LOJA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Loja'
      FieldName = 'COD_LOJA'
      Visible = False
      Size = 10
    end
    object CDS_V_SolicitFornLojasDTA_SOLICITACAO: TDateField
      DisplayLabel = 'Data Solictita'#231#227'o'
      FieldName = 'DTA_SOLICITACAO'
    end
    object CDS_V_SolicitFornLojasDEM_MES1: TStringField
      Alignment = taCenter
      DisplayLabel = 'Dem 1'#186' M'#234's'
      FieldName = 'DEM_MES1'
      Size = 8
    end
    object CDS_V_SolicitFornLojasDEM_MES2: TStringField
      Alignment = taCenter
      DisplayLabel = 'Dem 2'#186' M'#234's'
      FieldName = 'DEM_MES2'
      Size = 8
    end
    object CDS_V_SolicitFornLojasDEM_MES3: TStringField
      Alignment = taCenter
      DisplayLabel = 'Dem 3'#186' M'#234's'
      FieldName = 'DEM_MES3'
      Size = 8
    end
    object CDS_V_SolicitFornLojasDEM_MES4: TStringField
      Alignment = taCenter
      DisplayLabel = 'Dem 4'#186' M'#234's'
      FieldName = 'DEM_MES4'
      Size = 8
    end
    object CDS_V_SolicitFornLojasDEM_MES5: TStringField
      Alignment = taCenter
      DisplayLabel = 'Dem 5'#186' M'#234's'
      FieldName = 'DEM_MES5'
      Size = 8
    end
    object CDS_V_SolicitFornLojasDEM_MES6: TStringField
      Alignment = taCenter
      DisplayLabel = 'Dem 6'#186' M'#234's'
      FieldName = 'DEM_MES6'
      Size = 8
    end
    object CDS_V_SolicitFornLojasDEM_MES7: TStringField
      Alignment = taCenter
      DisplayLabel = 'Dem 7'#186' M'#234's'
      FieldName = 'DEM_MES7'
      Size = 8
    end
    object CDS_V_SolicitFornLojasDEM_MES8: TStringField
      Alignment = taCenter
      DisplayLabel = 'Dem 8'#186' M'#234's'
      FieldName = 'DEM_MES8'
      Size = 8
    end
    object CDS_V_SolicitFornLojasESTE: TStringField
      FieldName = 'ESTE'
      Visible = False
      Size = 1
    end
  end
  object DS_V_SolicitFornLojas: TDataSource
    DataSet = CDS_V_SolicitFornLojas
    Left = 151
    Top = 466
  end
  object SDS_AComprarOCs: TSQLDataSet
    ObjectView = True
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 72
    Top = 293
  end
  object DSP_AComprarOCs: TDataSetProvider
    DataSet = SDS_AComprarOCs
    Options = [poRetainServerOrder]
    Left = 114
    Top = 306
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
        Name = 'TOTAL_ITENS_ACOMPRAR'
        DataType = ftFMTBcd
        Precision = 15
      end>
    IndexDefs = <>
    ObjectView = False
    Params = <>
    ProviderName = 'DSP_AComprarOCs'
    StoreDefs = True
    Left = 151
    Top = 289
    object CDS_AComprarOCsGERAR: TStringField
      FieldName = 'GERAR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDS_AComprarOCsCOD_EMP_FIL: TStringField
      Alignment = taCenter
      DisplayLabel = 'Emp / Filial'
      FieldName = 'COD_EMP_FIL'
      Size = 6
    end
    object CDS_AComprarOCsDES_EMP_FIL: TStringField
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
    object CDS_AComprarOCsTOTAL_OC: TFMTBCDField
      DisplayLabel = 'Total OC'
      FieldName = 'TOTAL_OC'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsNUM_OC_GERADA: TIntegerField
      DisplayLabel = 'OC Gerada'
      FieldName = 'NUM_OC_GERADA'
    end
    object CDS_AComprarOCsDTA_OC_GERADA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'DTA_OC_GERADA'
    end
    object CDS_AComprarOCsTOTAL_BRUTO: TFMTBCDField
      DisplayLabel = 'Total Bruto'
      FieldName = 'TOTAL_BRUTO'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_DESCONTOS: TFMTBCDField
      DisplayLabel = 'Total Descontos'
      FieldName = 'TOTAL_DESCONTOS'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_IPI: TFMTBCDField
      DisplayLabel = 'Total IPI'
      FieldName = 'TOTAL_IPI'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_DESPESAS: TFMTBCDField
      DisplayLabel = 'Total Despesas'
      FieldName = 'TOTAL_DESPESAS'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_FRETE: TFMTBCDField
      DisplayLabel = 'Total Frete'
      FieldName = 'TOTAL_FRETE'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_ST: TFMTBCDField
      DisplayLabel = 'Total ST'
      FieldName = 'TOTAL_ST'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_ICMS: TFMTBCDField
      DisplayLabel = 'Total ICMS'
      FieldName = 'TOTAL_ICMS'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_REPASSE: TFMTBCDField
      DisplayLabel = 'Total Repasse'
      FieldName = 'TOTAL_REPASSE'
      DisplayFormat = '0.00'
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
    end
    object CDS_AComprarOCsTOTAL_QTD: TFMTBCDField
      DisplayLabel = 'Total Qtd'
      FieldName = 'TOTAL_QTD'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_VENDA: TFMTBCDField
      DisplayLabel = 'Total Vendas'
      FieldName = 'TOTAL_VENDA'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object CDS_AComprarOCsTOTAL_ITENS_ACOMPRAR: TFMTBCDField
      DisplayLabel = 'Total Itens a Comprar'
      FieldName = 'TOTAL_ITENS_ACOMPRAR'
      Precision = 15
      Size = 0
    end
    object CDS_AComprarOCsTOTALGERAL: TAggregateField
      Alignment = taRightJustify
      FieldName = 'TOTALGERAL'
      Active = True
      DisplayFormat = '0.,00'
      Expression = 'Sum(Total_OC)'
    end
    object CDS_AComprarOCsTOTALITENS: TAggregateField
      Alignment = taRightJustify
      FieldName = 'TOTALITENS'
      Active = True
      Expression = 'SUM(Total_Itens)'
    end
  end
  object DS_AComprarOCs: TDataSource
    DataSet = CDS_AComprarOCs
    Left = 189
    Top = 307
  end
  object SDS_ImpListaPreco: TSQLDataSet
    CommandText = 'SELECT *'#13#10#13#10'FROM LISTAPRE l'#13#10#13#10'Where l.CODLISTA<0'#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 415
    Top = 41
  end
  object CDS_ImpListaPreco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ImpListaPreco'
    Left = 517
    Top = 40
    object CDS_ImpListaPrecoCODLISTA: TStringField
      FieldName = 'CODLISTA'
      Required = True
      FixedChar = True
      Size = 4
    end
    object CDS_ImpListaPrecoCODPRODUTO: TStringField
      FieldName = 'CODPRODUTO'
      Required = True
      FixedChar = True
      Size = 6
    end
    object CDS_ImpListaPrecoPRECOCOMPRA: TFMTBCDField
      FieldName = 'PRECOCOMPRA'
      Precision = 15
      Size = 4
    end
    object CDS_ImpListaPrecoMARGEM: TFMTBCDField
      FieldName = 'MARGEM'
      Precision = 15
      Size = 4
    end
    object CDS_ImpListaPrecoPRECOVENDA: TFMTBCDField
      FieldName = 'PRECOVENDA'
      Precision = 15
      Size = 4
    end
    object CDS_ImpListaPrecoPRECOANTERIOR: TFMTBCDField
      FieldName = 'PRECOANTERIOR'
      Precision = 15
      Size = 4
    end
    object CDS_ImpListaPrecoDATAALTERACAO: TDateField
      FieldName = 'DATAALTERACAO'
    end
    object CDS_ImpListaPrecoHORAALTERACAO: TTimeField
      FieldName = 'HORAALTERACAO'
    end
    object CDS_ImpListaPrecoDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 15
      Size = 2
    end
    object CDS_ImpListaPrecoDESCONTOMAX: TFMTBCDField
      FieldName = 'DESCONTOMAX'
      Precision = 15
      Size = 2
    end
    object CDS_ImpListaPrecoDESATIVADO: TStringField
      FieldName = 'DESATIVADO'
      FixedChar = True
      Size = 1
    end
    object CDS_ImpListaPrecoPRECODOLAR: TFMTBCDField
      FieldName = 'PRECODOLAR'
      Precision = 15
      Size = 4
    end
    object CDS_ImpListaPrecoACRECIMOLISTA: TFMTBCDField
      FieldName = 'ACRECIMOLISTA'
      Precision = 15
      Size = 2
    end
    object CDS_ImpListaPrecoCUSTOSLISTA: TFMTBCDField
      FieldName = 'CUSTOSLISTA'
      Precision = 15
      Size = 2
    end
    object CDS_ImpListaPrecoDTA_ATUALIZACAO: TDateField
      FieldName = 'DTA_ATUALIZACAO'
    end
  end
  object DSP_ImpListaPreco: TDataSetProvider
    DataSet = SDS_ImpListaPreco
    Options = [poRetainServerOrder]
    Left = 468
    Top = 54
  end
  object SDS_ImpFornecedor: TSQLDataSet
    CommandText = 'SELECT *'#13#10#13#10'FROM FORNECEDOR f'#13#10#13#10'Where f.CODFORNECEDOR<0'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 407
    Top = 121
  end
  object CDS_ImpFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ImpFornecedor'
    Left = 509
    Top = 120
    object CDS_ImpFornecedorCODFORNECEDOR: TStringField
      FieldName = 'CODFORNECEDOR'
      Required = True
      FixedChar = True
      Size = 6
    end
    object CDS_ImpFornecedorNOMEFORNECEDOR: TStringField
      FieldName = 'NOMEFORNECEDOR'
      Size = 40
    end
    object CDS_ImpFornecedorEFILIAL: TStringField
      FieldName = 'EFILIAL'
      FixedChar = True
      Size = 1
    end
    object CDS_ImpFornecedorCODTIPOFOR: TStringField
      FieldName = 'CODTIPOFOR'
      FixedChar = True
      Size = 2
    end
    object CDS_ImpFornecedorCIDADE: TStringField
      FieldName = 'CIDADE'
      FixedChar = True
      Size = 35
    end
    object CDS_ImpFornecedorESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object CDS_ImpFornecedorCODIGOPOSTAL: TStringField
      FieldName = 'CODIGOPOSTAL'
      FixedChar = True
      Size = 8
    end
    object CDS_ImpFornecedorNUMEROCGCMF: TStringField
      FieldName = 'NUMEROCGCMF'
      FixedChar = True
      Size = 16
    end
    object CDS_ImpFornecedorNUMEROINSC: TStringField
      FieldName = 'NUMEROINSC'
      FixedChar = True
      Size = 16
    end
    object CDS_ImpFornecedorNUMEROISSQN: TStringField
      FieldName = 'NUMEROISSQN'
      FixedChar = True
      Size = 10
    end
    object CDS_ImpFornecedorNUMEROCPF: TStringField
      FieldName = 'NUMEROCPF'
      FixedChar = True
      Size = 12
    end
    object CDS_ImpFornecedorPESSOA: TStringField
      FieldName = 'PESSOA'
      FixedChar = True
      Size = 1
    end
    object CDS_ImpFornecedorFONE1: TStringField
      FieldName = 'FONE1'
      FixedChar = True
      Size = 15
    end
    object CDS_ImpFornecedorFONE2: TStringField
      FieldName = 'FONE2'
      FixedChar = True
      Size = 15
    end
    object CDS_ImpFornecedorFONEFAX: TStringField
      FieldName = 'FONEFAX'
      FixedChar = True
      Size = 15
    end
    object CDS_ImpFornecedorINTERNET: TStringField
      FieldName = 'INTERNET'
      FixedChar = True
      Size = 80
    end
    object CDS_ImpFornecedorEMAIL: TStringField
      FieldName = 'EMAIL'
      FixedChar = True
      Size = 80
    end
    object CDS_ImpFornecedorCLASSEFOR: TStringField
      FieldName = 'CLASSEFOR'
      FixedChar = True
      Size = 1
    end
    object CDS_ImpFornecedorCONTATO: TStringField
      FieldName = 'CONTATO'
      FixedChar = True
      Size = 30
    end
    object CDS_ImpFornecedorOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object CDS_ImpFornecedorBAIRRO: TStringField
      FieldName = 'BAIRRO'
      FixedChar = True
      Size = 25
    end
    object CDS_ImpFornecedorSIMPLESESTADUAL: TStringField
      FieldName = 'SIMPLESESTADUAL'
      FixedChar = True
      Size = 1
    end
    object CDS_ImpFornecedorCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 7
    end
    object CDS_ImpFornecedorLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object CDS_ImpFornecedorLOGNUMERO: TStringField
      FieldName = 'LOGNUMERO'
      Size = 10
    end
    object CDS_ImpFornecedorLOGCOMPL: TStringField
      FieldName = 'LOGCOMPL'
      Size = 30
    end
    object CDS_ImpFornecedorCODPAIS: TStringField
      FieldName = 'CODPAIS'
      FixedChar = True
      Size = 3
    end
    object CDS_ImpFornecedorRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 80
    end
    object CDS_ImpFornecedorDATAALTERACAO: TSQLTimeStampField
      FieldName = 'DATAALTERACAO'
    end
    object CDS_ImpFornecedorFORISENTOICM: TStringField
      FieldName = 'FORISENTOICM'
      FixedChar = True
      Size = 1
    end
    object CDS_ImpFornecedorFORISENTOIPI: TStringField
      FieldName = 'FORISENTOIPI'
      FixedChar = True
      Size = 1
    end
    object CDS_ImpFornecedorFORISENTOSUBST: TStringField
      FieldName = 'FORISENTOSUBST'
      FixedChar = True
      Size = 1
    end
    object CDS_ImpFornecedorFORISENTOPISCOFINS: TStringField
      FieldName = 'FORISENTOPISCOFINS'
      FixedChar = True
      Size = 1
    end
    object CDS_ImpFornecedorUSAICMCOMPRA2_SN: TStringField
      FieldName = 'USAICMCOMPRA2_SN'
      FixedChar = True
      Size = 1
    end
    object CDS_ImpFornecedorDTA_ATUALIZACAO: TSQLTimeStampField
      FieldName = 'DTA_ATUALIZACAO'
    end
  end
  object DSP_ImpFornecedor: TDataSetProvider
    DataSet = SDS_ImpFornecedor
    Options = [poRetainServerOrder]
    Left = 460
    Top = 134
  end
  object SDS_ImpProdutos: TSQLDataSet
    CommandText = 'SELECT *'#13#10#13#10'FROM PRODUTO p'#13#10#13#10'WHERE p.codproduto<0'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 407
    Top = 193
  end
  object CDS_ImpProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ImpProdutos'
    Left = 509
    Top = 192
    object CDS_ImpProdutosCODPRODUTO: TStringField
      FieldName = 'CODPRODUTO'
      Required = True
      FixedChar = True
      Size = 6
    end
    object CDS_ImpProdutosAPRESENTACAO: TStringField
      FieldName = 'APRESENTACAO'
      Size = 80
    end
    object CDS_ImpProdutosCODBARRA: TStringField
      FieldName = 'CODBARRA'
      FixedChar = True
      Size = 19
    end
    object CDS_ImpProdutosSITUACAOPRO: TStringField
      FieldName = 'SITUACAOPRO'
      FixedChar = True
      Size = 1
    end
    object CDS_ImpProdutosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 3
    end
    object CDS_ImpProdutosUNIDADEESTOQUE: TIntegerField
      FieldName = 'UNIDADEESTOQUE'
    end
    object CDS_ImpProdutosCLASSEABC: TStringField
      FieldName = 'CLASSEABC'
      FixedChar = True
      Size = 1
    end
    object CDS_ImpProdutosPRINCIPALFOR: TStringField
      FieldName = 'PRINCIPALFOR'
      FixedChar = True
      Size = 6
    end
    object CDS_ImpProdutosNOMEFORNECEDOR: TStringField
      FieldName = 'NOMEFORNECEDOR'
      Size = 40
    end
    object CDS_ImpProdutosREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      FixedChar = True
      Size = 15
    end
    object CDS_ImpProdutosCODGRUPOSUB: TStringField
      FieldName = 'CODGRUPOSUB'
      FixedChar = True
      Size = 7
    end
    object CDS_ImpProdutosCODGRUPO: TStringField
      FieldName = 'CODGRUPO'
      FixedChar = True
      Size = 3
    end
    object CDS_ImpProdutosNOMEGRUPO: TStringField
      FieldName = 'NOMEGRUPO'
      FixedChar = True
      Size = 30
    end
    object CDS_ImpProdutosCODSUBGRUPO: TStringField
      FieldName = 'CODSUBGRUPO'
      FixedChar = True
      Size = 4
    end
    object CDS_ImpProdutosNOMESUBGRUPO: TStringField
      FieldName = 'NOMESUBGRUPO'
      FixedChar = True
      Size = 30
    end
    object CDS_ImpProdutosCODFAMILIAPRECO: TStringField
      FieldName = 'CODFAMILIAPRECO'
      FixedChar = True
      Size = 4
    end
    object CDS_ImpProdutosNOMEFAMILIAPRECO: TStringField
      FieldName = 'NOMEFAMILIAPRECO'
      FixedChar = True
      Size = 40
    end
    object CDS_ImpProdutosNOMEGENERICO: TStringField
      FieldName = 'NOMEGENERICO'
      Size = 80
    end
    object CDS_ImpProdutosCODAPLICACAO: TStringField
      FieldName = 'CODAPLICACAO'
      FixedChar = True
      Size = 4
    end
    object CDS_ImpProdutosNOMEAPLICACAO: TStringField
      FieldName = 'NOMEAPLICACAO'
      FixedChar = True
      Size = 30
    end
    object CDS_ImpProdutosCODICMVENDA: TStringField
      FieldName = 'CODICMVENDA'
      FixedChar = True
      Size = 2
    end
    object CDS_ImpProdutosCODICMCOMPRA: TStringField
      FieldName = 'CODICMCOMPRA'
      FixedChar = True
      Size = 2
    end
    object CDS_ImpProdutosCODIPICOMPRA: TStringField
      FieldName = 'CODIPICOMPRA'
      FixedChar = True
      Size = 2
    end
    object CDS_ImpProdutosCODIPIVENDA: TStringField
      FieldName = 'CODIPIVENDA'
      FixedChar = True
      Size = 2
    end
    object CDS_ImpProdutosISS: TFMTBCDField
      FieldName = 'ISS'
      Precision = 15
      Size = 2
    end
    object CDS_ImpProdutosPESO: TFMTBCDField
      FieldName = 'PESO'
      Precision = 15
      Size = 4
    end
    object CDS_ImpProdutosPESOBRUTO: TFMTBCDField
      FieldName = 'PESOBRUTO'
      Precision = 15
      Size = 4
    end
    object CDS_ImpProdutosCODNACIONALIDADE: TStringField
      FieldName = 'CODNACIONALIDADE'
      FixedChar = True
      Size = 1
    end
    object CDS_ImpProdutosCONTROLALOTE: TStringField
      FieldName = 'CONTROLALOTE'
      FixedChar = True
      Size = 1
    end
    object CDS_ImpProdutosDIASVENCELOTE: TIntegerField
      FieldName = 'DIASVENCELOTE'
    end
    object CDS_ImpProdutosNAOVENDEZERADO: TStringField
      FieldName = 'NAOVENDEZERADO'
      FixedChar = True
      Size = 1
    end
    object CDS_ImpProdutosCODMERCOSULNCM: TStringField
      FieldName = 'CODMERCOSULNCM'
      FixedChar = True
      Size = 8
    end
    object CDS_ImpProdutosGRUPOSTMVA: TIntegerField
      FieldName = 'GRUPOSTMVA'
    end
    object CDS_ImpProdutosCODPISCOFINS_VENDA: TStringField
      FieldName = 'CODPISCOFINS_VENDA'
      FixedChar = True
      Size = 2
    end
    object CDS_ImpProdutosCODPISCOFINS_COMPRA: TStringField
      FieldName = 'CODPISCOFINS_COMPRA'
      FixedChar = True
      Size = 2
    end
    object CDS_ImpProdutosECOMMERCE_SN: TStringField
      FieldName = 'ECOMMERCE_SN'
      FixedChar = True
      Size = 1
    end
    object CDS_ImpProdutosDATAINCLUSAO: TDateField
      FieldName = 'DATAINCLUSAO'
    end
    object CDS_ImpProdutosDATAALTERACAO: TDateField
      FieldName = 'DATAALTERACAO'
    end
    object CDS_ImpProdutosDTA_ATUALIZACAO: TDateField
      FieldName = 'DTA_ATUALIZACAO'
    end
  end
  object DSP_ImpProdutos: TDataSetProvider
    DataSet = SDS_ImpProdutos
    Options = [poRetainServerOrder]
    Left = 460
    Top = 206
  end
end
