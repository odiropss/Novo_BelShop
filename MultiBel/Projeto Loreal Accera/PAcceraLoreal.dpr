program PAcceraLoreal;

uses
  Forms,
  UFrmAcceraLoreal in 'UFrmAcceraLoreal.pas' {FrmAcceraLoreal},
  UDMAcceraLoreal in 'UDMAcceraLoreal.pas' {DMAcceraLoreal: TDataModule},
  DK_Procs1 in '..\..\..\..\Rotinas Delphi\DK_Procs1.pas' {FDK_Procs1},
  uj_002 in '..\..\..\..\Rotinas Delphi\Janelas\J_002 Mensagens\uj_002.pas' {J_002},
  uj_001 in '..\..\..\..\Rotinas Delphi\Janelas\J_001 Login\uj_001.pas' {J_001},
  UFrmPeriodoApropriacao in 'UFrmPeriodoApropriacao.pas' {FrmPeriodoApropriacao};

{$R *.res}

begin
  Application.Title := 'Projeto ACCERA L´ORÉAL';
  Application.Initialize;
  Application.CreateForm(TDMAcceraLoreal, DMAcceraLoreal);
  Application.CreateForm(TFrmAcceraLoreal, FrmAcceraLoreal);
  Application.CreateForm(TFDK_Procs1, FDK_Procs1);
  Application.CreateForm(TJ_002, J_002);
  Application.CreateForm(TJ_001, J_001);
  // Application.CreateForm(TFrmPeriodoApropriacao, FrmPeriodoApropriacao);
  Application.Run;
end.
