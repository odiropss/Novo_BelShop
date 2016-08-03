unit UDMConexoes;
//\\LOCALHOST\C:\PROJETOS\BELSHOP\DADOS\MPMS.FDB
interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery;

type
  TDMConexoes = class(TDataModule)
    IBDB_06: TIBDatabase;
    IBDB_01: TIBDatabase;
    IBDB_02: TIBDatabase;
    IBDB_04: TIBDatabase;
    IBDB_03: TIBDatabase;
    IBDB_05: TIBDatabase;
    IBT_01: TIBTransaction;
    IBT_06: TIBTransaction;
    IBT_02: TIBTransaction;
    IBT_04: TIBTransaction;
    IBT_03: TIBTransaction;
    IBT_05: TIBTransaction;
    IBDB_10: TIBDatabase;
    IBDB_08: TIBDatabase;
    IBDB_07: TIBDatabase;
    IBDB_09: TIBDatabase;
    IBT_10: TIBTransaction;
    IBT_08: TIBTransaction;
    IBT_07: TIBTransaction;
    IBT_09: TIBTransaction;
    IBDB_16: TIBDatabase;
    IBDB_11: TIBDatabase;
    IBDB_12: TIBDatabase;
    IBDB_14: TIBDatabase;
    IBDB_13: TIBDatabase;
    IBDB_15: TIBDatabase;
    IBT_11: TIBTransaction;
    IBT_16: TIBTransaction;
    IBT_12: TIBTransaction;
    IBT_14: TIBTransaction;
    IBT_13: TIBTransaction;
    IBT_15: TIBTransaction;
    IBDB_20: TIBDatabase;
    IBDB_18: TIBDatabase;
    IBDB_17: TIBDatabase;
    IBDB_19: TIBDatabase;
    IBT_20: TIBTransaction;
    IBT_18: TIBTransaction;
    IBT_17: TIBTransaction;
    IBT_19: TIBTransaction;
    IBDB_26: TIBDatabase;
    IBDB_21: TIBDatabase;
    IBDB_22: TIBDatabase;
    IBDB_24: TIBDatabase;
    IBDB_23: TIBDatabase;
    IBDB_25: TIBDatabase;
    IBT_21: TIBTransaction;
    IBT_26: TIBTransaction;
    IBT_22: TIBTransaction;
    IBT_24: TIBTransaction;
    IBT_23: TIBTransaction;
    IBT_25: TIBTransaction;
    IBDB_30: TIBDatabase;
    IBDB_28: TIBDatabase;
    IBDB_27: TIBDatabase;
    IBDB_29: TIBDatabase;
    IBT_30: TIBTransaction;
    IBT_28: TIBTransaction;
    IBT_27: TIBTransaction;
    IBT_29: TIBTransaction;
    IBDB_MPMS: TIBDatabase;
    IBT_MPMS: TIBTransaction;
    IBDB_50: TIBDatabase;
    IBT_50: TIBTransaction;
    IBDB_99: TIBDatabase;
    IBT_99: TIBTransaction;
    IBDB_98: TIBDatabase;
    IBT_98: TIBTransaction;
    IBDB_97: TIBDatabase;
    IBT_97: TIBTransaction;
    IBDB_96: TIBDatabase;
    IBT_96: TIBTransaction;
    IBDB_95: TIBDatabase;
    IBT_95: TIBTransaction;
    IBDB_94: TIBDatabase;
    IBT_94: TIBTransaction;
    IBDB_93: TIBDatabase;
    IBT_93: TIBTransaction;
    IBDB_92: TIBDatabase;
    IBT_92: TIBTransaction;
    IBDB_91: TIBDatabase;
    IBT_91: TIBTransaction;
    IBDB_90: TIBDatabase;
    IBT_90: TIBTransaction;
    IBDB_89: TIBDatabase;
    IBT_89: TIBTransaction;
    IBDB_88: TIBDatabase;
    IBT_88: TIBTransaction;
    IBDB_87: TIBDatabase;
    IBT_87: TIBTransaction;
    IBDB_86: TIBDatabase;
    IBT_86: TIBTransaction;
    IBDB_85: TIBDatabase;
    IBT_85: TIBTransaction;
    IBDB_84: TIBDatabase;
    IBT_84: TIBTransaction;
    IBTransaction1: TIBTransaction;
    IBDatabase1: TIBDatabase;
    IBTransaction2: TIBTransaction;
    IBDB_BelShop: TIBDatabase;
    IBT_BelShop: TIBTransaction;

    // Odir ====================================================================
    Procedure FechaTudoIBDataBases; // Diversos - Fecha Todos os IBDataBase's
    // Odir ====================================================================

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConexoes: TDMConexoes;

implementation

{$R *.dfm}

// Diversos - Fecha Todos os IBDataBase's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMConexoes.FechaTudoIBDataBases;
Var
  i: Integer;
Begin

  For i:=0 to DMConexoes.ComponentCount-1 do
  Begin
    If DMConexoes.Components[i] is TIBDatabase Then
     If (DMConexoes.Components[i] as TIBDatabase).Connected Then
      (DMConexoes.Components[i] as TIBDatabase).Close;
  End; // For i:=0 to DMConexoes.ComponentCount-1 do

end; // // Diversos - Fecha Todos os IBDataBase's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

end.
