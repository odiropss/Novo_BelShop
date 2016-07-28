program PMovtosEmpresas;

uses
  Forms,
  Windows,
  UMovtosEmpresas in 'UMovtosEmpresas.pas' {FrmMovtosEmpresas},
  UDMMovtosEmpresas in 'UDMMovtosEmpresas.pas' {DMMovtosEmpresas: TDataModule},
  UDMConexoes in 'UDMConexoes.pas' {DMConexoes: TDataModule},
  DK_Procs1 in '..\..\Rotinas Delphi\DK_Procs1.pas' {FDK_Procs1},
  uj_002 in '..\..\Rotinas Delphi\Janelas\J_002 Mensagens\uj_002.pas' {J_002},
  uj_001 in '..\..\Rotinas Delphi\Janelas\J_001 Login\uj_001.pas' {J_001};

{$R *.res}

var
  Aplicativo : THandle;

begin

  // NAO PERMITE EXECUTAR DUAS VEZES
  CreateMutex(nil, false, 'PMovtosEmpresas');
  If GetLastError()=ERROR_ALREADY_EXISTS Then
   Begin
     ShowWindow(Aplicativo, SW_RESTORE);
   End
  Else
   Begin
     Application.Initialize;
     Application.Title := 'Odir - Não Fechar este Programa !!';
     Application.ShowMainForm:=False;

     Application.CreateForm(TDMConexoes, DMConexoes);
  Application.CreateForm(TDMMovtosEmpresas, DMMovtosEmpresas);
  Application.CreateForm(TFrmMovtosEmpresas, FrmMovtosEmpresas);
  Application.CreateForm(TFDK_Procs1, FDK_Procs1);
  Application.CreateForm(TJ_002, J_002);
  Application.CreateForm(TJ_001, J_001);
  Application.Run;
   End;

end.
