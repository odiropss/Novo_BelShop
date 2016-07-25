program PCurvasDemandas;

uses
  Forms,
  Windows,
  UCurvasDemandas in 'UCurvasDemandas.pas' {FrmCurvasDemandas},
  UDMMovtosEmpresas in 'UDMMovtosEmpresas.pas' {DMMovtosEmpresas: TDataModule},
  DK_Procs1 in '..\Rotinas Delphi\DK_Procs1.pas' {FDK_Procs1},
  uj_002 in '..\Rotinas Delphi\Janelas\J_002 Mensagens\uj_002.pas' {J_002},
  uj_001 in '..\Rotinas Delphi\Janelas\J_001 Login\uj_001.pas' {J_001},
  Uf_Conecta in '..\Rotinas Delphi\Conecta\Uf_Conecta.pas' {UFConecta},
  UDMConexoes in 'UDMConexoes.pas' {DMConexoes: TDataModule};

{$R *.res}

var
  Aplicativo : THandle;

begin

  // NAO PERMITE EXECUTAR DUAS VEZES
  CreateMutex(nil, false, 'PCurvasDemandas');
  If GetLastError()=ERROR_ALREADY_EXISTS Then
   Begin
     ShowWindow(Aplicativo, SW_RESTORE);
   End
  Else
   Begin
     Application.Initialize;
     Application.Title := 'Odir - N�o Fechar este Programa !!';
     Application.ShowMainForm:=False;

  Application.CreateForm(TDMConexoes, DMConexoes);
  Application.CreateForm(TDMMovtosEmpresas, DMMovtosEmpresas);
  Application.CreateForm(TFrmCurvasDemandas, FrmCurvasDemandas);
  Application.CreateForm(TFDK_Procs1, FDK_Procs1);
  Application.CreateForm(TJ_001, J_001);
  Application.CreateForm(TJ_002, J_002);
  Application.CreateForm(TUFConecta, UFConecta);
  Application.Run;
   End;

end.
