program PMegaSena;

uses
  Forms,
  UMegaSena in 'UMegaSena.pas' {FrmMegaSenha},
  DK_Procs1 in '..\Rotinas Delphi\DK_Procs1.pas' {FDK_Procs1},
  uj_002 in '..\Rotinas Delphi\Janelas\J_002 Mensagens\uj_002.pas' {J_002},
  uj_001 in '..\Rotinas Delphi\Janelas\J_001 Login\uj_001.pas' {J_001},
  Uf_Conecta in '..\Rotinas Delphi\Conecta\Uf_Conecta.pas' {UFConecta};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMegaSenha, FrmMegaSenha);
  Application.CreateForm(TFDK_Procs1, FDK_Procs1);
  Application.CreateForm(TJ_002, J_002);
  Application.CreateForm(TJ_001, J_001);
  Application.CreateForm(TUFConecta, UFConecta);
  Application.Run;
end.
