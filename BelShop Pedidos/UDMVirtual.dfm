object DMVirtual: TDMVirtual
  OldCreateOrder = False
  Left = 240
  Top = 123
  Height = 461
  Width = 853
  object CDS_V_Fornecedores: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Des_Fornecedor'
    Params = <>
    Left = 49
    Top = 74
    object CDS_V_FornecedoresDes_Fornecedor: TStringField
      FieldName = 'Des_Fornecedor'
      Size = 50
    end
    object CDS_V_FornecedoresCod_Fornecedor: TStringField
      Alignment = taRightJustify
      FieldName = 'Cod_Fornecedor'
      Size = 6
    end
  end
  object DS_V_Fornecedores: TDataSource
    DataSet = CDS_V_Fornecedores
    Left = 101
    Top = 90
  end
  object CDS_V_Produtos: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Cod_Produto'
    Params = <>
    Left = 41
    Top = 7
    object CDS_V_ProdutosCod_Produto: TStringField
      FieldName = 'Cod_Produto'
      Size = 6
    end
    object CDS_V_ProdutosDes_Produto: TStringField
      FieldName = 'Des_Produto'
      Size = 80
    end
    object CDS_V_ProdutosCod_Fornecedor: TStringField
      FieldName = 'Cod_Fornecedor'
      Size = 6
    end
  end
  object DS_V_Produtos: TDataSource
    DataSet = CDS_V_Produtos
    Left = 93
    Top = 23
  end
end
