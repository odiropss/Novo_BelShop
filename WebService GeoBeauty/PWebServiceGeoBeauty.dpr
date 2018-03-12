program PWebServiceGeoBeauty;

uses
  Forms,
  UWebServiceGeoBeauty in 'UWebServiceGeoBeauty.pas' {frmWebServiceGeoBeauty},
  ServerWebServiceGeoBeauty in 'ServerWebServiceGeoBeauty.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmWebServiceGeoBeauty, frmWebServiceGeoBeauty);
  Application.Run;
end.
