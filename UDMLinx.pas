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
    DSP_OCProdLinx: TDataSetProvider;
    CDS_OCProdLinx: TClientDataSet;
    SQLQ_OCProdLinx: TSQLQuery;
    SDS_AnaliseForn: TSQLDataSet;
    DSP_AnaliseForn: TDataSetProvider;
    CDS_AnaliseForn: TClientDataSet;
    CDS_AnaliseFornCOD_AUXILIAR: TStringField;
    CDS_AnaliseFornCOD_PRODUTO: TFMTBCDField;
    CDS_AnaliseFornNOME: TStringField;
    CDS_AnaliseFornDESC_SETOR: TStringField;
    CDS_AnaliseFornDESC_COLECAO: TStringField;
    CDS_AnaliseFornABC: TStringField;
    CDS_AnaliseFornFAT_PERIODO: TFMTBCDField;
    CDS_AnaliseFornLOJA1: TIntegerField;
    CDS_AnaliseFornLOJA2: TIntegerField;
    CDS_AnaliseFornLOJA3: TIntegerField;
    CDS_AnaliseFornLOJA4: TIntegerField;
    CDS_AnaliseFornLOJA5: TIntegerField;
    CDS_AnaliseFornLOJA6: TIntegerField;
    CDS_AnaliseFornLOJA7: TIntegerField;
    CDS_AnaliseFornLOJA8: TIntegerField;
    CDS_AnaliseFornLOJA9: TIntegerField;
    CDS_AnaliseFornLOJA10: TIntegerField;
    CDS_AnaliseFornLOJA11: TIntegerField;
    CDS_AnaliseFornLOJA12: TIntegerField;
    CDS_AnaliseFornLOJA13: TIntegerField;
    CDS_AnaliseFornLOJA14: TIntegerField;
    CDS_AnaliseFornLOJA15: TIntegerField;
    CDS_AnaliseFornLOJA16: TIntegerField;
    CDS_AnaliseFornLOJA17: TIntegerField;
    CDS_AnaliseFornLOJA18: TIntegerField;
    CDS_AnaliseFornLOJA19: TIntegerField;
    CDS_AnaliseFornLOJA20: TIntegerField;
    CDS_AnaliseFornLOJA21: TIntegerField;
    CDS_AnaliseFornLOJA22: TIntegerField;
    CDS_AnaliseFornLOJA23: TIntegerField;
    CDS_AnaliseFornLOJA24: TIntegerField;
    CDS_AnaliseFornLOJA25: TIntegerField;
    CDS_AnaliseFornLOJA26: TIntegerField;
    CDS_AnaliseFornLOJA27: TIntegerField;
    CDS_AnaliseFornLOJA28: TIntegerField;
    CDS_AnaliseFornLOJA29: TIntegerField;
    CDS_AnaliseFornLOJA30: TIntegerField;
    CDS_AnaliseFornLOJA31: TIntegerField;
    CDS_AnaliseFornLOJA32: TIntegerField;
    CDS_AnaliseFornLOJA33: TIntegerField;
    CDS_AnaliseFornLOJA34: TIntegerField;
    CDS_AnaliseFornLOJA35: TIntegerField;
    CDS_AnaliseFornCOD_FORNECEDOR: TIntegerField;
    CDS_AnaliseFornFORN: TStringField;
    DS_AnaliseForn: TDataSource;
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
