unit UDMVirtual;

interface

uses
  SysUtils, Classes, DB, DBClient;

type
  TDMVirtual = class(TDataModule)
    CDS_V_Fornecedores: TClientDataSet;
    CDS_V_FornecedoresDes_Fornecedor: TStringField;
    CDS_V_FornecedoresCod_Fornecedor: TStringField;
    DS_V_Fornecedores: TDataSource;
    CDS_V_Produtos: TClientDataSet;
    CDS_V_ProdutosCod_Produto: TStringField;
    CDS_V_ProdutosDes_Produto: TStringField;
    CDS_V_ProdutosCod_Fornecedor: TStringField;
    DS_V_Produtos: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMVirtual: TDMVirtual;

implementation

{$R *.dfm}

end.
