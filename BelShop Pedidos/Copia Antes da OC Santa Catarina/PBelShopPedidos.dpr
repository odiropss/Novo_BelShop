program PBelShopPedidos;

uses
  Forms,
  UFrmBelShopPedidos in 'UFrmBelShopPedidos.pas' {FrmBelShopPedidos},
  UDMBelShopPedidos in 'UDMBelShopPedidos.pas' {DMBelShopPedidos: TDataModule},
  UFrmLeitoraCodBarras in 'UFrmLeitoraCodBarras.pas' {FrmLeitoraCodBarras},
  DK_Procs1 in '..\..\..\Rotinas Delphi\DK_Procs1.pas' {FDK_Procs1},
  uj_002 in '..\..\..\Rotinas Delphi\Janelas\J_002 Mensagens\uj_002.pas' {J_002},
  uj_001 in '..\..\..\Rotinas Delphi\Janelas\J_001 Login\uj_001.pas' {J_001},
  UPesquisa in 'UPesquisa.pas' {FrmPesquisa};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'BelShop - Pedidos';

  // Form Principal ============================================================
  Application.CreateForm(TFrmBelShopPedidos, FrmBelShopPedidos);
  // DataModules ===============================================================
  Application.CreateForm(TDMBelShopPedidos, DMBelShopPedidos);

  Application.CreateForm(TFDK_Procs1, FDK_Procs1);
  Application.CreateForm(TJ_002, J_002);
  Application.CreateForm(TJ_001, J_001);

  // Forms =====================================================================
  Application.CreateForm(TFrmPesquisa, FrmPesquisa);
  // Application.CreateForm(TFrmLeitoraCodBarras, FrmLeitoraCodBarras);
  // Application.CreateForm(TFrmPesquisa, FrmPesquisa);

  //============================================================================
  // Formulario Modelo ==>>: Application.CreateForm(TFrmModelo, FrmModelo);
  //============================================================================
  Application.Run;
end.
