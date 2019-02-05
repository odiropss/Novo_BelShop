; Script Gerado Pelo Inno Setup Script Wizard.
; [Inno Setup(BR)]

[Setup]
AppName=Solicitação de Transferências
AppVerName=Versão 1.0
AppPublisher=BelShop
AppPublisherURL=odir.opss@gmail.com
AppSupportURL=odir.opss@gmail.com
AppUpdatesURL=odir.opss@gmail.com
DefaultDirName=C:\ODIR\SolicitacaoTransferencias\
DisableDirPage=yes
DefaultGroupName=Solicitação de Transferências
DisableProgramGroupPage=yes
; [Revisão e Tradução: Por Osiel Santos]
; MinVersion=5,3.51

[Tasks]
Name: "desktopicon"; Description: "Create a &desktop icon"; GroupDescription: "Additional icons:"; MinVersion: 4,4

[Files]
Source: "C:\SolicitacaoTransferencias\PSolicTransf.exe"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\dbexpint.dll"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\dbexpUIBfire15.dll"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\fbclient.dll"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\FBConect_InterNet.ini"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\FBConect_IntraNet.ini"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\FBConect_Local.ini"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\gds32.dll"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\Loja.ini"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\midas.dll"; DestDir: "{app}"; CopyMode: alwaysoverwrite

[Icons]
Name: "{group}\Solicitação de Transferências"; Filename: "{app}\PSolicTransf.exe"
Name: "{userdesktop}\Solicitação de Transferências"; Filename: "{app}\PSolicTransf.exe"; MinVersion: 4,4; Tasks: desktopicon

[Run]
Filename: "{app}\PSolicTransf.exe"; Description: "Launch Solicitação de Transferências"; Flags: nowait postinstall skipifsilent
