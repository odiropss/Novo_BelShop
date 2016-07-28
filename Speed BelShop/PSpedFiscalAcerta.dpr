program PSpedFiscalAcerta;

uses
  Forms,
  USpedFiscalAcerta in 'USpedFiscalAcerta.pas' {FrmSpedFiscalAcerta},
  UFrmCFopProduto in 'UFrmCFopProduto.pas' {FrmCFopProduto},
  UDM in 'UDM.pas' {DM: TDataModule},
  UFrmAlertaST in 'UFrmAlertaST.pas' {FrmAlertaST},
  DK_Procs1 in '..\..\..\Rotinas Delphi\DK_Procs1.pas' {FDK_Procs1},
  uj_002 in '..\..\..\Rotinas Delphi\Janelas\J_002 Mensagens\uj_002.pas' {J_002},
  uj_001 in '..\..\..\Rotinas Delphi\Janelas\J_001 Login\uj_001.pas' {J_001};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'BELSHOP - Correção Arquivo SpedFiscal';
  Application.CreateForm(TFrmSpedFiscalAcerta, FrmSpedFiscalAcerta);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmAlertaST, FrmAlertaST);
  Application.CreateForm(TFDK_Procs1, FDK_Procs1);
  Application.CreateForm(TJ_002, J_002);
  Application.CreateForm(TJ_001, J_001);
  // Application.CreateForm(TFrmCFopProduto, FrmCFopProduto);
  Application.Run;
end.
