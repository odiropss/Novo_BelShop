unit UDMLinx;

interface

uses
  SysUtils, Classes, FMTBcd, DBClient, Provider, DB, SqlExpr,
  ZAbstractRODataset, ZDataset, ZConnection, ADODB, ZAbstractDataset,
  IBCustomDataSet, DBLocal, DBLocalI, IBUpdateSQL;

type
  TDMLinx = class(TDataModule)
    SDS_Busca: TSQLDataSet;
    DS_Busca: TDataSource;
    DSP_Busca: TDataSetProvider;
    CDS_Busca: TClientDataSet;
    DSP_OCProdLinx: TDataSetProvider;
    CDS_OCProdLinx: TClientDataSet;
    SQLQ_OCProdLinx: TSQLQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMLinx: TDMLinx;

implementation

uses UDMBelShop;

{$R *.dfm}

end.
