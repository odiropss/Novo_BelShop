; Script Gerado Pelo Inno Setup Script Wizard.
; [Inno Setup(BR)]

[Setup]
AppName=Solicita��o de Transfer�ncis CD Lojas BelShop
AppVerName=Vers�o 1.0
AppPublisher=BelShop
AppPublisherURL=odir.opss@gmail.com
AppSupportURL=odir.opss@gmail.com
AppUpdatesURL=odir.opss@gmail.com
DefaultDirName=c:\BelShop_Odir\Solicita��o de Transfer�ncis CD Lojas BelShop
DisableDirPage=yes
DefaultGroupName=Solicita��o de Transfer�ncis CD Lojas BelShop
DisableProgramGroupPage=yes
; [Revis�o e Tradu��o: Por Osiel Santos]
; MinVersion=5,3.51

[Tasks]
Name: "desktopicon"; Description: "Create a &desktop icon"; GroupDescription: "Additional icons:"; MinVersion: 4,4

[Files]
Source: "C:\SolicitacaoTransferencias\PSolicTransf.exe"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\dbexpint.dll"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\dbexpUIBfire15.dll"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\fbclient.dll"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\qtintf70.dll"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\FBConect_InterNet.ini"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\FBConect_IntraNet.ini"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\FBConect_Local.ini"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\gds32.dll"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\InstaladorSolcitacoesBelShop.iss"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\InstallSolcitacoes.iss"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\Loja.ini"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\midas.dll"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\Dicas de Uso do Sistema de Transfer�ncia.doc"; DestDir: "{app}"; CopyMode: alwaysoverwrite

[Icons]
Name: "{group}\Solicita��o de Transfer�ncis CD Lojas BelShop"; Filename: "{app}\PSolicTransf.exe"
Name: "{userdesktop}\Solicita��o de Transfer�ncis CD Lojas BelShop"; Filename: "{app}\PSolicTransf.exe"; MinVersion: 4,4; Tasks: desktopicon

[Run]
Filename: "{app}\PSolicTransf.exe"; Description: "Launch Solicita��o de Transfer�ncis CD Lojas BelShop"; Flags: nowait postinstall skipifsilent
