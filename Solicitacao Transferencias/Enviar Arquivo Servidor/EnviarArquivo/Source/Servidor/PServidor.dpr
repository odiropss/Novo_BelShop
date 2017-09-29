program PServidor;

uses
  Forms,
  UFrmServidor in 'UFrmServidor.pas' {FrmServidor};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmServidor, FrmServidor);
  Application.Run;
end.
