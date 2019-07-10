program PBelShopPedidos;

uses
  Forms,
  UFrmBelShopPedidos in 'UFrmBelShopPedidos.pas' {FrmBelShopPedidos},
  UDMBelShopPedidos in 'UDMBelShopPedidos.pas' {DMBelShopPedidos: TDataModule},
  UFrmProdutoCodBarras in 'UFrmProdutoCodBarras.pas' {FrmProdutoCodBarras},
  DK_Procs1 in '..\..\..\Rotinas Delphi\DK_Procs1.pas' {FDK_Procs1},
  uj_002 in '..\..\..\Rotinas Delphi\Janelas\J_002 Mensagens\uj_002.pas' {J_002},
  uj_001 in '..\..\..\Rotinas Delphi\Janelas\J_001 Login\uj_001.pas' {J_001},
  UPesquisa in 'UPesquisa.pas' {FrmPesquisa},
  UFrmOCLinx in 'UFrmOCLinx.pas' {FrmOCLinx},
  UDMVirtual in 'UDMVirtual.pas' {DMVirtual: TDataModule},
  UFrmLeitoraCodBarras in 'UFrmLeitoraCodBarras.pas' {FrmLeitoraCodBarras},
  UDMOCLinx in 'UDMOCLinx.pas' {DMOCLinx: TDataModule},
  UDMRelatorio in 'UDMRelatorio.pas' {DMRelatorio: TDataModule},
  UEntrada in 'UEntrada.pas' {FrmEntrada},
  UPermissao in 'UPermissao.pas' {FrmLogin};

{$R *.res}

begin
  FrmEntrada:=TFrmEntrada.Create(FrmEntrada);
  FrmEntrada.Label1.caption:= 'BelShop - Pedidos';

  FrmEntrada.Show;

  Application.Initialize;
  Application.Title := 'BelShop - Pedidos';
  Application.ProcessMessages;

  FrmEntrada.Refresh;

  // Form Principal ============================================================
  Application.CreateForm(TFrmBelShopPedidos, FrmBelShopPedidos);
  // DataModules ===============================================================
  Application.CreateForm(TDMVirtual, DMVirtual);
  Application.CreateForm(TDMBelShopPedidos, DMBelShopPedidos);
  Application.CreateForm(TDMOCLinx, DMOCLinx);
  Application.CreateForm(TDMRelatorio, DMRelatorio);

  Application.CreateForm(TFDK_Procs1, FDK_Procs1);
  Application.CreateForm(TJ_002, J_002);
  Application.CreateForm(TJ_001, J_001);

  // Forms =====================================================================
  // Application.CreateForm(TFrmLogin, FrmLogin);
  // Application.CreateForm(TFrmLeitoraCodBarras, FrmLeitoraCodBarras);
  // Application.CreateForm(TFrmPesquisa, FrmPesquisa);
  Application.CreateForm(TFrmOCLinx, FrmOCLinx);
  // Application.CreateForm(TFrmProdutoCodBarras, FrmProdutoCodBarras);

  //============================================================================
  // Formulario Modelo ==>>: Application.CreateForm(TFrmModelo, FrmModelo);
  //============================================================================
   Application.Run;
end.
