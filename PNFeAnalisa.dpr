program PNFeAnalisa;

uses
  Forms,
  UFrmNFeAnalisa in 'UFrmNFeAnalisa.pas' {FrmNFeAnalisa},
  UDMNFeAnaliza in 'UDMNFeAnaliza.pas' {DMNFeAnaliza: TDataModule},
  DK_Procs1 in '..\..\Rotinas Delphi\DK_Procs1.pas' {FDK_Procs1},
  uj_001 in '..\..\Rotinas Delphi\Janelas\J_001 Login\uj_001.pas' {J_001},
  uj_002 in '..\..\Rotinas Delphi\Janelas\J_002 Mensagens\uj_002.pas' {J_002};

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Odir - N�o Fechar este Programa !!';
//  Application.ShowMainForm:=False;

  Application.CreateForm(TDMNFeAnaliza, DMNFeAnaliza);
  Application.CreateForm(TFrmNFeAnalisa, FrmNFeAnalisa);
  Application.CreateForm(TFDK_Procs1, FDK_Procs1);
  Application.CreateForm(TJ_001, J_001);
  Application.CreateForm(TJ_002, J_002);
  Application.Run;
end.
