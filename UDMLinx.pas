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
    ADOConnection1: TADOConnection;
    DS_IBQuery: TDataSource;
    IBDataSet1: TIBDataSet;
    IBDataSet1COD_AUXILIAR: TIBStringField;
    IBDataSet1COD_PRODUTO: TLargeintField;
    IBDataSet1NOME: TIBStringField;
    IBDataSet1ABC: TIBStringField;
    IBDataSet1FAT_PERIODO: TIBBCDField;
    IBDataSet1DESC_SETOR: TIBStringField;
    IBDataSet1DESC_COLECAO: TIBStringField;
    IBDataSet1LOJA1: TIntegerField;
    IBDataSet1LOJA2: TIntegerField;
    IBDataSet1LOJA3: TIntegerField;
    IBDataSet1LOJA4: TIntegerField;
    IBDataSet1LOJA5: TIntegerField;
    IBDataSet1LOJA6: TIntegerField;
    IBDataSet1LOJA7: TIntegerField;
    IBDataSet1LOJA8: TIntegerField;
    IBDataSet1LOJA9: TIntegerField;
    IBDataSet1LOJA10: TIntegerField;
    IBDataSet1LOJA11: TIntegerField;
    IBDataSet1LOJA12: TIntegerField;
    IBDataSet1LOJA13: TIntegerField;
    IBDataSet1LOJA14: TIntegerField;
    IBDataSet1LOJA15: TIntegerField;
    IBDataSet1LOJA16: TIntegerField;
    IBDataSet1LOJA17: TIntegerField;
    IBDataSet1LOJA18: TIntegerField;
    IBDataSet1LOJA19: TIntegerField;
    IBDataSet1LOJA20: TIntegerField;
    IBDataSet1LOJA21: TIntegerField;
    IBDataSet1LOJA22: TIntegerField;
    IBDataSet1LOJA23: TIntegerField;
    IBDataSet1LOJA24: TIntegerField;
    IBDataSet1LOJA25: TIntegerField;
    IBDataSet1LOJA26: TIntegerField;
    IBDataSet1LOJA27: TIntegerField;
    IBDataSet1LOJA28: TIntegerField;
    IBDataSet1LOJA29: TIntegerField;
    IBDataSet1LOJA30: TIntegerField;
    IBDataSet1LOJA31: TIntegerField;
    IBDataSet1LOJA32: TIntegerField;
    IBDataSet1LOJA33: TIntegerField;
    IBDataSet1LOJA34: TIntegerField;
    IBDataSet1LOJA35: TIntegerField;
    IBDataSet1COD_FORNECEDOR: TIntegerField;
    IBDataSet1FORN: TIBStringField;
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
