program PBelShop;

uses
  Forms,
  UFrmBelShop in 'UFrmBelShop.pas' {FrmBelShop},
  UEntrada in 'UEntrada.pas' {FrmEntrada},
  UPermissao in 'UPermissao.pas' {FrmLogin},
  UDMBelShop in 'UDMBelShop.pas' {DMBelShop: TDataModule},
  UPesquisa in 'UPesquisa.pas' {FrmPesquisa},
  UDMConexoes in 'UDMConexoes.pas' {DMConexoes: TDataModule},
  UPesquisaIB in 'UPesquisaIB.pas' {FrmPesquisaIB},
  UDMVirtual in 'UDMVirtual.pas' {DMVirtual: TDataModule},
  UDMRelatorio in 'UDMRelatorio.pas' {DMRelatorio: TDataModule},
  UFrmAuditoria in 'UFrmAuditoria.pas' {FrmAuditoria},
  UFrmSelectEmpProcessamento in 'UFrmSelectEmpProcessamento.pas' {FrmSelectEmpProcessamento},
  UFrmOCObservacao in 'UFrmOCObservacao.pas' {FrmOCObservacao},
  UVerTransito in 'UVerTransito.pas' {FrmVerTransito},
  UFrmPlanFinanApresComrprovantes in 'UFrmPlanFinanApresComrprovantes.pas' {FrmPlanFinanApresComrprovantes},
  UFrmPeriodoApropriacao in 'UFrmPeriodoApropriacao.pas' {FrmPeriodoApropriacao},
  UFrmObjetivosFormula in 'UFrmObjetivosFormula.pas' {FrmObjetivosFormula},
  UFrmFinanObjetivosMovtos in 'UFrmFinanObjetivosMovtos.pas' {FrmFinanObjetivosMovtos},
  UFrmSolicitacoes in 'UFrmSolicitacoes.pas' {FrmSolicitacoes},
  UFrmGrafico in 'UFrmGrafico.pas' {FrmGrafico},
  UFrmAcessosUsuario in 'UFrmAcessosUsuario.pas' {FrmAcessosUsuario},
  UFrmBancoExtratos in 'UFrmBancoExtratos.pas' {FrmBancoExtratos},
  UDMBancosConciliacao in 'UDMBancosConciliacao.pas' {DMConciliacao: TDataModule},
  UFrmTiposConciliacao in 'UFrmTiposConciliacao.pas' {FrmTiposConciliacao},
  UFrmApresConciliacao in 'UFrmApresConciliacao.pas' {FrmApresConciliacao},
  UDMSalao in 'UDMSalao.pas' {DMSalao: TDataModule},
  UFrmSalao in 'UFrmSalao.pas' {FrmSalao},
  UFrmGeraPedidosComprasLojas in 'UFrmGeraPedidosComprasLojas.pas' {FrmGeraPedidosComprasLojas},
  UDMLojaUnica in 'UDMLojaUnica.pas' {DMLojaUnica: TDataModule},
  UWindowsFirewall in 'UWindowsFirewall.pas',
  UFrmSalaoPercServico in 'UFrmSalaoPercServico.pas' {FrmSalaoPercServico},
  UFrmConciliacaoCaixa in 'UFrmConciliacaoCaixa.pas' {FrmConciliacaoCaixa},
  UDMSidicom in 'UDMSidicom.pas' {DMSidicom: TDataModule},
  UDMCentralTrocas in 'UDMCentralTrocas.pas' {DMCentralTrocas: TDataModule},
  UFrmCentralTrocas in 'UFrmCentralTrocas.pas' {FrmCentralTrocas},
  UFrmEstoques in 'UFrmEstoques.pas' {FrmEstoques},
  UFrmFaltasCDLojas in 'UFrmFaltasCDLojas.pas' {FrmFaltasCDLojas},
  UFrmControleKits in 'UFrmControleKits.pas' {FrmControleKits},
  UFrmControleEstoques in 'UFrmControleEstoques.pas' {FrmControleEstoques},
  DK_Procs1 in '..\..\Rotinas Delphi\DK_Procs1.pas' {FDK_Procs1},
  uj_001 in '..\..\Rotinas Delphi\Janelas\J_001 Login\uj_001.pas' {J_001},
  uj_002 in '..\..\Rotinas Delphi\Janelas\J_002 Mensagens\uj_002.pas' {J_002},
  UFrmFluxFornecedor in 'UFrmFluxFornecedor.pas' {FrmFluxoFornecedor},
  UFrmComissaoVendedor in 'UFrmComissaoVendedor.pas' {FrmComissaoVendedor},
  UDMComissaoVendedor in 'UDMComissaoVendedor.pas' {DMComissaoVendedor: TDataModule};

{$R *.res}

begin
  FrmEntrada:=TFrmEntrada.Create(FrmEntrada);
  FrmEntrada.Label1.caption:= 'Gerenciador BelShop';

  FrmEntrada.Show;

  Application.Initialize;
  Application.ProcessMessages;

  FrmEntrada.Refresh;
  Application.Title := 'Gerenciador BelShop';
  Application.CreateForm(TFrmBelShop, FrmBelShop);
  Application.CreateForm(TDMVirtual, DMVirtual);
  Application.CreateForm(TDMConexoes, DMConexoes);
  Application.CreateForm(TDMBelShop, DMBelShop);
  Application.CreateForm(TDMSalao, DMSalao);
  Application.CreateForm(TDMConciliacao, DMConciliacao);
  Application.CreateForm(TDMLojaUnica, DMLojaUnica);
  Application.CreateForm(TDMRelatorio, DMRelatorio);
  Application.CreateForm(TDMSidicom, DMSidicom);
  Application.CreateForm(TDMCentralTrocas, DMCentralTrocas);
  Application.CreateForm(TFrmBancoExtratos, FrmBancoExtratos);
  Application.CreateForm(TFrmGeraPedidosComprasLojas, FrmGeraPedidosComprasLojas);
  Application.CreateForm(TFDK_Procs1, FDK_Procs1);
  Application.CreateForm(TJ_001, J_001);
  Application.CreateForm(TJ_002, J_002);
  Application.CreateForm(TFrmFluxoFornecedor, FrmFluxoFornecedor);
  Application.CreateForm(TDMComissaoVendedor, DMComissaoVendedor);
  // Application.CreateForm(TFrmComissaoVendedor, FrmComissaoVendedor);
  // Application.CreateForm(TFrmControleEstoques, FrmControleEstoques);
  // Application.CreateForm(TFrmCentralTrocas, FrmCentralTrocas);
  // Application.CreateForm(TDMCentralTrocas, DMCentralTrocas);

  // Application.CreateForm(TFrmControleKits, FrmControleKits);
  // Application.CreateForm(TFrmFaltasCDLojas, FrmFaltasCDLojas);
  // Application.CreateForm(TFrmEstoques, FrmEstoques);
  // Formulario Modelo ==>>: Application.CreateForm(TFrmModelo, FrmModelo);
  Application.Run;
end.
