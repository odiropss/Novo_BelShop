unit UDMDebCredST;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TDMDebCredST = class(TDataModule)
    SQLQ_VlrBcICMSST: TSQLQuery;
    DSP_VlrBcICMSST: TDataSetProvider;
    CDS_VlrBcICMSST: TClientDataSet;
    DS_VlrBcICMSST: TDataSource;
    CDS_VlrBcICMSSTCOD_FORNECEDOR: TIntegerField;
    CDS_VlrBcICMSSTNOME_FORNECDOR: TStringField;
    CDS_VlrBcICMSSTTOT_DEBITO_ICMS_ST: TFMTBCDField;
    CDS_VlrBcICMSSTBC_ICMS_ST: TStringField;
    CDS_VlrBcICMSSTORDEM: TIntegerField;
    SQLQ_TotaisForn: TSQLQuery;
    DSP_TotaisForn: TDataSetProvider;
    CDS_TotaisForn: TClientDataSet;
    DS_TotaisForn: TDataSource;
    CDS_TotaisFornSELECAO: TStringField;
    CDS_TotaisFornCOD_FORNECEDOR: TIntegerField;
    CDS_TotaisFornNOME_FORNECDOR: TStringField;
    CDS_TotaisFornTOT_CRETIDO_ICMS_ST: TFMTBCDField;
    CDS_TotaisFornTOT_DEBITO_ICMS_ST: TFMTBCDField;
    CDS_TotaisFornTOT_DEB_CRED_ICMS_ST: TFMTBCDField;
    CDS_TotaisFornORDEM: TIntegerField;
    SQLQ_ProdutoForn: TSQLQuery;
    DSP_ProdutoForn: TDataSetProvider;
    CDS_ProdutoForn: TClientDataSet;
    DS_ProdutoForn: TDataSource;
    CDS_ProdutoFornCOD_PRODUTO: TFMTBCDField;
    CDS_ProdutoFornNOME_PRODUTO: TStringField;
    CDS_ProdutoFornVLR_CRETIDO_ICMS_ST: TFMTBCDField;
    CDS_ProdutoFornVLR_DEBITO_ICMS_ST: TFMTBCDField;
    CDS_ProdutoFornDATA_DOCUMENTO: TDateField;
    CDS_ProdutoFornDATA_LANCAMENTO: TDateField;
    CDS_ProdutoFornDOCUMENTO: TIntegerField;
    CDS_ProdutoFornSERIE: TStringField;
    CDS_ProdutoFornMODELO_NF: TStringField;
    CDS_ProdutoFornID_CFOP: TStringField;
    CDS_ProdutoFornCST_ICMS: TStringField;
    CDS_ProdutoFornPER_ALIQ_ICMS: TFMTBCDField;
    CDS_ProdutoFornVLR_ICMS: TFMTBCDField;
    CDS_ProdutoFornPER_ALIQ_ICMS_ST: TFMTBCDField;
    CDS_ProdutoFornVLR_ICMS_ST: TFMTBCDField;
    CDS_ProdutoFornVLR_BASE_ICMS_ST: TFMTBCDField;
    CDS_ProdutoFornVLR_OPERACAO: TFMTBCDField;
    CDS_ProdutoFornMODALIDADE: TStringField;
    CDS_ProdutoFornTIPO: TStringField;
    CDS_ProdutoFornDES_NCM: TStringField;
    CDS_ProdutoFornPER_ICMS: TFMTBCDField;
    CDS_ProdutoFornPER_FCP: TFMTBCDField;
    CDS_ProdutoFornPER_ICMS_EFETIVO: TFMTBCDField;
    CDS_ProdutoFornUTILIZADO: TStringField;
    CDS_ProdutoFornCOD_FORNECEDOR: TIntegerField;
    CDS_ProdutoFornNOME_FORNECDOR: TStringField;
    CDS_ProdutoFornORDEM: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMDebCredST: TDMDebCredST;

implementation

uses UDMBelShop;

{$R *.dfm}

end.
