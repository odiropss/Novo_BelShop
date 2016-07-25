object DMSidicom: TDMSidicom
  OldCreateOrder = False
  Left = 243
  Top = 108
  Height = 585
  Width = 987
  object IBQ_CDBusca: TIBQuery
    Database = DMConexoes.IBDB_MPMS
    Transaction = DMConexoes.IBT_MPMS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      '')
    Left = 40
    Top = 32
  end
  object CDS_Verifica: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 36
    Top = 112
    object CDS_VerificaNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object CDS_VerificaBel_01: TStringField
      FieldName = 'Bel_01'
      Size = 30
    end
    object CDS_VerificaBel_02: TStringField
      FieldName = 'Bel_02'
      Size = 30
    end
    object CDS_VerificaBel_03: TStringField
      FieldName = 'Bel_03'
      Size = 30
    end
    object CDS_VerificaBel_04: TStringField
      FieldName = 'Bel_04'
      Size = 30
    end
    object CDS_VerificaBel_05: TStringField
      FieldName = 'Bel_05'
      Size = 30
    end
    object CDS_VerificaBel_06: TStringField
      FieldName = 'Bel_06'
      Size = 30
    end
    object CDS_VerificaBel_07: TStringField
      FieldName = 'Bel_07'
      Size = 30
    end
    object CDS_VerificaBel_08: TStringField
      FieldName = 'Bel_08'
      Size = 30
    end
    object CDS_VerificaBel_09: TStringField
      FieldName = 'Bel_09'
      Size = 30
    end
    object CDS_VerificaBel_10: TStringField
      FieldName = 'Bel_10'
      Size = 30
    end
    object CDS_VerificaBel_11: TStringField
      FieldName = 'Bel_11'
      Size = 30
    end
    object CDS_VerificaBel_12: TStringField
      FieldName = 'Bel_12'
      Size = 30
    end
    object CDS_VerificaBel_13: TStringField
      FieldName = 'Bel_13'
      Size = 30
    end
    object CDS_VerificaBel_14: TStringField
      FieldName = 'Bel_14'
      Size = 30
    end
    object CDS_VerificaBel_15: TStringField
      FieldName = 'Bel_15'
      Size = 30
    end
    object CDS_VerificaBel_16: TStringField
      FieldName = 'Bel_16'
      Size = 30
    end
    object CDS_VerificaBel_98: TStringField
      FieldName = 'Bel_98'
      Size = 30
    end
    object CDS_VerificaBel_99: TStringField
      FieldName = 'Bel_99'
      Size = 30
    end
  end
  object DS_CDS_Verifica: TDataSource
    DataSet = CDS_Verifica
    Left = 116
    Top = 112
  end
  object CDS_UsuaSidicom: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_UsuaSidicom'
    Left = 160
    Top = 192
    object CDS_UsuaSidicomCOD_USUARIO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_USUARIO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object CDS_UsuaSidicomDES_USUARIO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'DES_USUARIO'
      FixedChar = True
    end
    object CDS_UsuaSidicomIND_ATIVO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Ativo'
      FieldName = 'IND_ATIVO'
      FixedChar = True
      Size = 3
    end
    object CDS_UsuaSidicomIND_ALTERASENHA: TStringField
      Alignment = taCenter
      DisplayLabel = 'Altera Senha'
      FieldName = 'IND_ALTERASENHA'
      FixedChar = True
      Size = 3
    end
    object CDS_UsuaSidicomIND_EXCLUIR: TStringField
      Alignment = taCenter
      DisplayLabel = 'Excluir'
      FieldName = 'IND_EXCLUIR'
      FixedChar = True
      Size = 3
    end
    object CDS_UsuaSidicomIND_EXCLUIDO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Exclu'#237'do'
      FieldName = 'IND_EXCLUIDO'
      FixedChar = True
      Size = 3
    end
    object CDS_UsuaSidicomIND_ENVIAR: TStringField
      Alignment = taCenter
      DisplayLabel = 'Enviar'
      FieldName = 'IND_ENVIAR'
      FixedChar = True
      Size = 3
    end
    object CDS_UsuaSidicomIND_PENDENTE: TStringField
      Alignment = taCenter
      DisplayLabel = 'Pendente'
      FieldName = 'IND_PENDENTE'
      FixedChar = True
      Size = 3
    end
    object CDS_UsuaSidicomUSU_INCLUI: TIntegerField
      DisplayLabel = 'C'#243'd Executor'
      FieldName = 'USU_INCLUI'
      Visible = False
    end
    object CDS_UsuaSidicomEXECUTOR: TStringField
      DisplayLabel = 'Executor'
      FieldName = 'EXECUTOR'
      Size = 50
    end
    object CDS_UsuaSidicomDTA_INCLUI: TSQLTimeStampField
      DisplayLabel = 'Data Execu'#231#227'o'
      FieldName = 'DTA_INCLUI'
      Required = True
      Visible = False
    end
  end
  object DSP_UsuaSidicom: TDataSetProvider
    DataSet = SDS_UsuaSidicom
    Left = 96
    Top = 208
  end
  object DS_UsuaSidicom: TDataSource
    DataSet = CDS_UsuaSidicom
    Left = 216
    Top = 208
  end
  object SDS_UsuaSidicom: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'us.COD_USUARIO,'#13#10'us.DES_USUARIO,'#13#10'us.IND_ATIVO,'#13#10'us.IND_' +
      'ALTERASENHA,'#13#10'us.IND_EXCLUIR,'#13#10'us.IND_EXCLUIDO,'#13#10'us.IND_ENVIAR,'#13 +
      #10'us.IND_PENDENTE,'#13#10'us.USU_INCLUI,'#13#10'ub.DES_USUARIO  EXECUTOR,'#13#10'us' +
      '.DTA_INCLUI'#13#10#13#10'FROM usuarios_sidicom us'#13#10'      LEFT JOIN ps_usua' +
      'rios ub ON us.usu_inclui=ub.cod_usuario'#13#10#13#10'ORDER BY us.IND_EXCLU' +
      'IDO, us.DES_USUARIO'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBelShop.SQLC
    Left = 38
    Top = 192
  end
  object CDS_LojasSidicom: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'COD_USUARIO'
    MasterFields = 'COD_USUARIO'
    MasterSource = DS_UsuaSidicom
    PacketRecords = 0
    Params = <>
    ProviderName = 'DSp_LojasSidicom'
    Left = 160
    Top = 272
    object CDS_LojasSidicomCOD_USUARIO: TStringField
      Alignment = taRightJustify
      FieldName = 'COD_USUARIO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object CDS_LojasSidicomCOD_LOJA: TStringField
      DisplayLabel = 'C'#243'd'
      FieldName = 'COD_LOJA'
      FixedChar = True
      Size = 2
    end
    object CDS_LojasSidicomRAZAO_SOCIAL: TStringField
      DisplayLabel = 'Loja'
      FieldName = 'RAZAO_SOCIAL'
      Size = 60
    end
    object CDS_LojasSidicomIND_ENVIADO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Enviado'
      FieldName = 'IND_ENVIADO'
      FixedChar = True
      Size = 3
    end
    object CDS_LojasSidicomDTA_ENVIO: TSQLTimeStampField
      Alignment = taCenter
      DisplayLabel = 'Data Envio'
      FieldName = 'DTA_ENVIO'
    end
    object CDS_LojasSidicomIND_ENVIAR: TStringField
      Alignment = taCenter
      DisplayLabel = 'Enviar'
      FieldName = 'IND_ENVIAR'
      FixedChar = True
      Size = 3
    end
    object CDS_LojasSidicomIND_PENDENTE: TStringField
      FieldName = 'IND_PENDENTE'
      FixedChar = True
      Size = 3
    end
    object CDS_LojasSidicomUSU_INCLUI: TIntegerField
      FieldName = 'USU_INCLUI'
    end
    object CDS_LojasSidicomDTA_INCLUI: TSQLTimeStampField
      FieldName = 'DTA_INCLUI'
      Required = True
    end
  end
  object DSp_LojasSidicom: TDataSetProvider
    DataSet = SDS_LojasSidicom
    Left = 96
    Top = 288
  end
  object Ds_LojasSidicom: TDataSource
    DataSet = CDS_LojasSidicom
    Left = 216
    Top = 288
  end
  object SDS_LojasSidicom: TSQLDataSet
    CommandText = 
      'select'#13#10'lu.COD_USUARIO,'#13#10'lu.COD_LOJA,'#13#10'em.RAZAO_SOCIAL,'#13#10'lu.IND_' +
      'ENVIADO,'#13#10'lu.DTA_ENVIO,'#13#10'lu.IND_ENVIAR,'#13#10'lu.IND_PENDENTE,'#13#10'lu.US' +
      'U_INCLUI,'#13#10'lu.DTA_INCLUI'#13#10#13#10'from usuarios_sidicom_lojas lu, emp_' +
      'conexoes em'#13#10#13#10'where lu.cod_loja=em.cod_filial'#13#10'and lu.cod_usuar' +
      'io= :CodUsuario'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CodUsuario'
        ParamType = ptInput
        Value = '1'
      end>
    SQLConnection = DMBelShop.SQLC
    Left = 38
    Top = 272
  end
end
