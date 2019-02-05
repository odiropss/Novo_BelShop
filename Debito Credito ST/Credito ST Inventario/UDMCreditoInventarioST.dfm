object DMCreditoInventarioST: TDMCreditoInventarioST
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 240
  Top = 123
  Height = 496
  Width = 863
  object SQLC: TSQLConnection
    ConnectionName = 'BelShop'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=\\localhost\C:\Projetos\BelShop\Dados\BelShop.FDB'
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
    Top = 8
  end
  object SQLQ_Busca: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 112
    Top = 39
  end
  object CDS_CreditoST: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 53
    Top = 192
    object CDS_CreditoSTCOD_PRODUTO: TFMTBCDField
      FieldName = 'COD_PRODUTO'
      Precision = 15
      Size = 0
    end
    object CDS_CreditoSTDES_NCM: TStringField
      FieldName = 'DES_NCM'
    end
    object CDS_CreditoSTDES_PRODUTO: TStringField
      FieldName = 'DES_PRODUTO'
      Size = 250
    end
    object CDS_CreditoSTVLR_CUSTO: TFMTBCDField
      FieldName = 'VLR_CUSTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CreditoSTQTD_ESTOQUE: TIntegerField
      FieldName = 'QTD_ESTOQUE'
      DisplayFormat = '0,'
    end
    object CDS_CreditoSTVLR_CUSTO_TOTAL: TFMTBCDField
      FieldName = 'VLR_CUSTO_TOTAL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CreditoSTVLR_BC_ST_ENTRADA: TFMTBCDField
      FieldName = 'VLR_BC_ST_ENTRADA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CreditoSTVLR_BC_ST_TOTAL: TFMTBCDField
      FieldName = 'VLR_BC_ST_TOTAL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CreditoSTVLR_CRED_PRES_ST: TFMTBCDField
      FieldName = 'VLR_CRED_PRES_ST'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CreditoSTLOCALIZACAO: TStringField
      DisplayLabel = 'LOCALIZA'#199#195'O'
      FieldName = 'LOCALIZACAO'
      Size = 15
    end
  end
  object DS_CreditoST: TDataSource
    DataSet = CDS_CreditoST
    Left = 112
    Top = 208
  end
  object SDS_Busca: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC
    Left = 56
    Top = 105
  end
  object DSP_Busca: TDataSetProvider
    DataSet = SDS_Busca
    Options = [poRetainServerOrder]
    Left = 106
    Top = 118
  end
  object CDS_Busca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Busca'
    Left = 157
    Top = 104
  end
  object DS_Busca: TDataSource
    DataSet = CDS_Busca
    Left = 208
    Top = 120
  end
  object SDS_CreditoST_CM: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'p.cod_produto COD_PRODUTO,'#13#10'p.ncm DES_NCM,'#13#10'p.nome DES_P' +
      'RODUTO,'#13#10'CAST(COALESCE(d.custo_medio, 0.00) as Numeric(12,2)) VL' +
      'R_CUSTO,'#13#10'i.qtd_estoque QTD_ESTOQUE,'#13#10'CAST((COALESCE(d.custo_med' +
      'io, 0.00) * i.qtd_estoque) as Numeric(12,2)) VLR_CUSTO_TOTAL,'#13#10'C' +
      'AST(COALESCE(d.custo_medio, 0.00) as Numeric(12,2)) VLR_BC_ST_EN' +
      'TRADA,'#13#10'CAST((COALESCE(d.custo_medio, 0.00) * i.qtd_estoque) as ' +
      'Numeric(12,2)) VLR_BC_ST_TOTAL,'#13#10#13#10'CAST('#13#10'(((COALESCE(d.custo_me' +
      'dio, 0.00) * i.qtd_estoque)  *'#13#10'                           n.per' +
      '_icms_efetivo)/100) as Numeric(12,2)) VLR_CRED_PRES_ST,'#13#10#13#10'CASE'#13 +
      #10'  WHEN COALESCE(d.custo_medio, 0.0000)<>0.0000 Then'#13#10'    '#39'Custo' +
      ' M'#233'dio'#39#13#10'  ELSE'#13#10'    '#39'N'#227'o Encontrado'#39#13#10'END LOCALIZACAO'#13#10#13#10' FROM ' +
      'ODIR_INVENTARIO_DEZ i'#13#10'     LEFT JOIN LINXPRODUTOS p          on' +
      ' p.cod_produto=i.cod_produto'#13#10'     LEFT JOIN LINXPRODUTOSDETALHE' +
      'S d  on d.cod_produto=p.cod_produto'#13#10'                           ' +
      '           AND d.empresa=i.empresa'#13#10'     LEFT JOIN DEB_CRED_ICMS' +
      '_NCM n     on n.des_ncm=p.ncm'#13#10#13#10' WHERE n.per_icms_efetivo=27'#13#10' ' +
      'AND   COALESCE(i.qtd_estoque,0)>0'#13#10' AND   i.empresa= :Loja'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'Loja'
        ParamType = ptInput
        Value = '2'
      end>
    SQLConnection = SQLC
    Left = 48
    Top = 273
  end
  object DSP_CreditoST_CM: TDataSetProvider
    DataSet = SDS_CreditoST_CM
    Options = [poRetainServerOrder]
    Left = 98
    Top = 286
  end
  object CDS_CreditoST_CM: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_CreditoST_CM'
    Left = 149
    Top = 272
    object CDS_CreditoST_CMCOD_PRODUTO: TFMTBCDField
      FieldName = 'COD_PRODUTO'
      Precision = 15
      Size = 0
    end
    object CDS_CreditoST_CMDES_NCM: TStringField
      FieldName = 'DES_NCM'
    end
    object CDS_CreditoST_CMDES_PRODUTO: TStringField
      FieldName = 'DES_PRODUTO'
      Size = 250
    end
    object CDS_CreditoST_CMVLR_CUSTO: TFMTBCDField
      FieldName = 'VLR_CUSTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CreditoST_CMQTD_ESTOQUE: TIntegerField
      FieldName = 'QTD_ESTOQUE'
      DisplayFormat = '0,'
    end
    object CDS_CreditoST_CMVLR_CUSTO_TOTAL: TFMTBCDField
      FieldName = 'VLR_CUSTO_TOTAL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CreditoST_CMVLR_BC_ST_ENTRADA: TFMTBCDField
      FieldName = 'VLR_BC_ST_ENTRADA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CreditoST_CMVLR_BC_ST_TOTAL: TFMTBCDField
      FieldName = 'VLR_BC_ST_TOTAL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CreditoST_CMVLR_CRED_PRES_ST: TFMTBCDField
      FieldName = 'VLR_CRED_PRES_ST'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CreditoST_CMLOCALIZACAO: TStringField
      FieldName = 'LOCALIZACAO'
      Required = True
      FixedChar = True
      Size = 14
    end
  end
  object DS_CreditoST_CM: TDataSource
    DataSet = CDS_CreditoST_CM
    Left = 200
    Top = 288
  end
  object SDS_CreditoST_CI: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'p.cod_produto COD_PRODUTO,'#13#10'p.ncm DES_NCM,'#13#10'p.nome DES_P' +
      'RODUTO,'#13#10'CAST(COALESCE(d.preco_custo, 0.00) as Numeric(12,2)) VL' +
      'R_CUSTO,'#13#10'i.qtd_estoque QTD_ESTOQUE,'#13#10'CAST((COALESCE(d.preco_cus' +
      'to, 0.00) * i.qtd_estoque) as Numeric(12,2)) VLR_CUSTO_TOTAL,'#13#10'C' +
      'AST(COALESCE(d.preco_custo, 0.00) as Numeric(12,2)) VLR_BC_ST_EN' +
      'TRADA,'#13#10'CAST((COALESCE(d.preco_custo, 0.00) * i.qtd_estoque) as ' +
      'Numeric(12,2)) VLR_BC_ST_TOTAL,'#13#10#13#10'CAST('#13#10'(((COALESCE(d.preco_cu' +
      'sto, 0.00) * i.qtd_estoque)  *'#13#10'                           n.per' +
      '_icms_efetivo)/100) as Numeric(12,2)) VLR_CRED_PRES_ST,'#13#10#13#10'CASE'#13 +
      #10'  WHEN COALESCE(d.preco_custo, 0.0000)<>0.0000 Then'#13#10'    '#39'Custo' +
      ' ICMS'#39#13#10'  ELSE'#13#10'    '#39'N'#227'o Encontrado'#39#13#10'END LOCALIZACAO'#13#10#13#10' FROM O' +
      'DIR_INVENTARIO_DEZ i'#13#10'     LEFT JOIN LINXPRODUTOS p          on ' +
      'p.cod_produto=i.cod_produto'#13#10'     LEFT JOIN LINXPRODUTOSDETALHES' +
      ' d  on d.cod_produto=p.cod_produto'#13#10'                            ' +
      '          AND d.empresa=i.empresa'#13#10'     LEFT JOIN DEB_CRED_ICMS_' +
      'NCM n     on n.des_ncm=p.ncm'#13#10#13#10' WHERE n.per_icms_efetivo=27'#13#10' A' +
      'ND   COALESCE(i.qtd_estoque,0)>0'#13#10' AND   i.empresa= :Loja'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'Loja'
        ParamType = ptInput
        Value = '2'
      end>
    SQLConnection = SQLC
    Left = 48
    Top = 345
  end
  object DSP_CreditoST_CI: TDataSetProvider
    DataSet = SDS_CreditoST_CI
    Options = [poRetainServerOrder]
    Left = 98
    Top = 358
  end
  object CDS_CreditoST_CI: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_CreditoST_CI'
    Left = 149
    Top = 344
    object CDS_CreditoST_CICOD_PRODUTO: TFMTBCDField
      FieldName = 'COD_PRODUTO'
      Precision = 15
      Size = 0
    end
    object CDS_CreditoST_CIDES_NCM: TStringField
      FieldName = 'DES_NCM'
    end
    object CDS_CreditoST_CIDES_PRODUTO: TStringField
      FieldName = 'DES_PRODUTO'
      Size = 250
    end
    object CDS_CreditoST_CIVLR_CUSTO: TFMTBCDField
      FieldName = 'VLR_CUSTO'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CreditoST_CIQTD_ESTOQUE: TIntegerField
      FieldName = 'QTD_ESTOQUE'
      DisplayFormat = '0,'
    end
    object CDS_CreditoST_CIVLR_CUSTO_TOTAL: TFMTBCDField
      FieldName = 'VLR_CUSTO_TOTAL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CreditoST_CIVLR_BC_ST_ENTRADA: TFMTBCDField
      FieldName = 'VLR_BC_ST_ENTRADA'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CreditoST_CIVLR_BC_ST_TOTAL: TFMTBCDField
      FieldName = 'VLR_BC_ST_TOTAL'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CreditoST_CIVLR_CRED_PRES_ST: TFMTBCDField
      FieldName = 'VLR_CRED_PRES_ST'
      DisplayFormat = '0,.00'
      Precision = 15
      Size = 2
    end
    object CDS_CreditoST_CILOCALIZACAO: TStringField
      FieldName = 'LOCALIZACAO'
      Required = True
      FixedChar = True
      Size = 14
    end
  end
  object DS_CreditoST_CI: TDataSource
    DataSet = CDS_CreditoST_CI
    Left = 200
    Top = 360
  end
end
