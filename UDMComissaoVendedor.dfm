object DMComissaoVendedor: TDMComissaoVendedor
  OldCreateOrder = False
  Left = 242
  Top = 116
  Height = 572
  Width = 935
  object DS_V_UltimaAtualizacao: TDataSource
    DataSet = CDS_V_UltimaAtualizacao
    Left = 120
    Top = 56
  end
  object CDS_V_UltimaAtualizacao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 40
    object CDS_V_UltimaAtualizacaoIMP: TStringField
      Alignment = taCenter
      DisplayLabel = 'Imp'
      FieldName = 'IMP'
      Required = True
      FixedChar = True
      Size = 3
    end
    object CDS_V_UltimaAtualizacaoCODIGO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Cod'
      FieldName = 'CODIGO'
      Required = True
      Size = 6
    end
    object CDS_V_UltimaAtualizacaoLOJA: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'LOJA'
      Size = 60
    end
    object CDS_V_UltimaAtualizacaoDATA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Atualiza'#231#227'o'
      FieldName = 'DATA'
    end
  end
  object DS_V_Produtos: TDataSource
    DataSet = CDS_V_Produtos
    Left = 120
    Top = 144
  end
  object CDS_V_Produtos: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterPost = CDS_V_ProdutosAfterPost
    Left = 64
    Top = 128
    object CDS_V_ProdutosCOD_PRODUTO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Cod'
      FieldName = 'COD_PRODUTO'
      Required = True
      FixedChar = True
      Size = 6
    end
    object CDS_V_ProdutosAPRESENTACAO: TStringField
      FieldName = 'APRESENTACAO'
      Size = 80
    end
    object CDS_V_ProdutosFAT_CONVERSAO: TFMTBCDField
      DisplayLabel = 'Vlr Convers'#227'o'
      FieldName = 'FAT_CONVERSAO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
    object CDS_V_ProdutosDTA_VALIDADE_INI: TDateField
      Alignment = taCenter
      DisplayLabel = 'Validade Inicial'
      FieldName = 'DTA_VALIDADE_INI'
    end
    object CDS_V_ProdutosDTA_VALIDADE_FIM: TDateField
      Alignment = taCenter
      DisplayLabel = 'Validade Final'
      FieldName = 'DTA_VALIDADE_FIM'
    end
  end
  object CDS_V_Aplicacao: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Des_Aplicacao'
    Params = <>
    Left = 64
    Top = 203
    object CDS_V_AplicacaoDES_APLICACAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_APLICACAO'
      Size = 30
    end
    object CDS_V_AplicacaoCOD_APLICACAO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd'
      FieldName = 'COD_APLICACAO'
      Size = 4
    end
  end
  object DS_V_Aplicacao: TDataSource
    DataSet = CDS_V_Aplicacao
    Left = 120
    Top = 219
  end
  object CDS_V_FamiliaPrecos: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'DES_FAMILIA'
    Params = <>
    AfterPost = CDS_V_FamiliaPrecosAfterPost
    Left = 64
    Top = 260
    object CDS_V_FamiliaPrecosDES_FAMILIA: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DES_FAMILIA'
      ReadOnly = True
      Size = 40
    end
    object CDS_V_FamiliaPrecosCOD_FAMILIA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'd'
      FieldName = 'COD_FAMILIA'
      ReadOnly = True
      Size = 4
    end
    object CDS_V_FamiliaPrecosFAT_CONVERSAO: TFMTBCDField
      DisplayLabel = 'Vlr Convers'#227'o'
      FieldName = 'VLR_CONVERSAO'
      DisplayFormat = '0.,00'
      Precision = 15
      Size = 2
    end
  end
  object DS_V_FamiliaPrecos: TDataSource
    DataSet = CDS_V_FamiliaPrecos
    Left = 120
    Top = 276
  end
end
