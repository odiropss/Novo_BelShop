program PSolicitacaoLojas;

uses
  Forms,
  Windows,
  UFrmSolicitacaoLojas in 'UFrmSolicitacaoLojas.pas' {FrmSolicitacaoLojas},
  UDMSolicitacaoLojas in 'UDMSolicitacaoLojas.pas' {DMSolicitacaoLojas: TDataModule},
  DK_Procs1 in '..\Rotinas Delphi\DK_Procs1.pas' {FDK_Procs1},
  uj_002 in '..\Rotinas Delphi\Janelas\J_002 Mensagens\uj_002.pas' {J_002},
  uj_001 in '..\Rotinas Delphi\Janelas\J_001 Login\uj_001.pas' {J_001};

{$R *.res}

var
  Aplicativo : THandle;

begin
  // Não Permite Rodar Duas Vezes
  CreateMutex(nil, false, 'PSolicitacaoLojas');
  If GetLastError()=ERROR_ALREADY_EXISTS Then
   Begin
     ShowWindow(Aplicativo, SW_RESTORE);
   End
  Else
   Begin
     // Não Apresenta o Form
     Application.ShowMainForm:=False;

     Application.Initialize;
     Application.CreateForm(TDMSolicitacaoLojas, DMSolicitacaoLojas);
     Application.CreateForm(TFrmSolicitacaoLojas, FrmSolicitacaoLojas);
     Application.CreateForm(TFDK_Procs1, FDK_Procs1);
     Application.CreateForm(TJ_002, J_002);
     Application.CreateForm(TJ_001, J_001);
     Application.Run;
   End;
end.
