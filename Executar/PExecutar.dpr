program PExecutar;

uses
  Forms,
  UExecutar in 'UExecutar.pas' {FrmExecutar},
  UEntrada in 'UEntrada.pas' {FrmEntrada};

{$R *.res}

begin
  FrmEntrada:=TFrmEntrada.Create(FrmEntrada);
  FrmEntrada.Label1.caption:=' GERENCIADOR BELSHOP ';

  FrmEntrada.Show;
  Application.Initialize;
  FrmEntrada.Refresh;
  Application.CreateForm(TFrmExecutar, FrmExecutar);
  FrmEntrada.Refresh;
  Application.Run;
end.
