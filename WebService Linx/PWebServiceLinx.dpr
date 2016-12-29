program PWebServiceLinx;

uses
  Forms,
  UWebServiceLinx in 'UWebServiceLinx.pas' {FrmWebServiceLinx};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmWebServiceLinx, FrmWebServiceLinx);
  Application.Run;
end.
