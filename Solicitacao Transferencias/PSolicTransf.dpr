program PSolicTransf;

uses
  Forms,
  UFrmSolicTransf in 'UFrmSolicTransf.pas' {FrmSolicTransf},
  UDMSolicTransf in 'UDMSolicTransf.pas' {DMSolicTransf: TDataModule},
  DK_Procs1 in '..\..\..\Rotinas Delphi\DK_Procs1.pas' {FDK_Procs1},
  uj_001 in '..\..\..\Rotinas Delphi\Janelas\J_001 Login\uj_001.pas' {J_001},
  uj_002 in '..\..\..\Rotinas Delphi\Janelas\J_002 Mensagens\uj_002.pas' {J_002},
  UPesquisa in 'UPesquisa.pas' {FrmPesquisa};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'BelShop - Solicitações de Transferências';
  Application.CreateForm(TDMSolicTransf, DMSolicTransf);
  Application.CreateForm(TFrmSolicTransf, FrmSolicTransf);
  Application.CreateForm(TFDK_Procs1, FDK_Procs1);
  Application.CreateForm(TJ_001, J_001);
  Application.CreateForm(TJ_002, J_002);
  // Application.CreateForm(TFrmPesquisa, FrmPesquisa);
  Application.Run;
end.
