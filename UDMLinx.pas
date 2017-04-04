unit UDMLinx;

interface

uses
  SysUtils, Classes, FMTBcd, DBClient, Provider, DB, SqlExpr;

type
  TDMLinx = class(TDataModule)
    SDS_Busca: TSQLDataSet;
    DS_Busca: TDataSource;
    DSP_Busca: TDataSetProvider;
    CDS_Busca: TClientDataSet;
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
