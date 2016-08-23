program PAcertaContEstoques;

uses
  Forms,
  UAcertaContEstoques in 'UAcertaContEstoques.pas' {FrmAcertaContEstoques};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmAcertaContEstoques, FrmAcertaContEstoques);
  Application.Run;
end.
