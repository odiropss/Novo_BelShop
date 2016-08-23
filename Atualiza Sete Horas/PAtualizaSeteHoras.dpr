program PAtualizaSeteHoras;

uses
  Forms,
  Windows,
  UDMAtualizaSeteHoras in 'UDMAtualizaSeteHoras.pas' {DMAtualizaSeteHoras: TDataModule},
  DK_Procs1 in '..\..\..\Rotinas Delphi\DK_Procs1.pas' {FDK_Procs1},
  uj_001 in '..\..\..\Rotinas Delphi\Janelas\J_001 Login\uj_001.pas' {J_001},
  uj_002 in '..\..\..\Rotinas Delphi\Janelas\J_002 Mensagens\uj_002.pas' {J_002},
  UDMConexoes in '..\UDMConexoes.pas' {DMConexoes: TDataModule},
  UFrmAtualizaSeteHoras in 'UFrmAtualizaSeteHoras.pas' {FrmAtualizaSeteHoras};

{$R *.res}

var
  Aplicativo : THandle;

begin
  // N�o Permite Rodar Duas Vezes
  CreateMutex(nil, false, 'PFrmTransferencias');
  If GetLastError()=ERROR_ALREADY_EXISTS Then
   Begin
     ShowWindow(Aplicativo, SW_RESTORE);
   End
  Else
   Begin
     // N�o Apresenta o Form
     // odiraqui
     Application.ShowMainForm:=False;

     Application.Initialize;
     Application.Title := 'BelShop - Transfer�ncias';
     Application.CreateForm(TDMAtualizaSeteHoras, DMAtualizaSeteHoras);
     Application.CreateForm(TFrmAtualizaSeteHoras, FrmAtualizaSeteHoras);
     Application.CreateForm(TFDK_Procs1, FDK_Procs1);
     Application.CreateForm(TJ_001, J_001);
     Application.CreateForm(TJ_002, J_002);
     Application.CreateForm(TDMConexoes, DMConexoes);
     Application.Run;
   End;
end.
