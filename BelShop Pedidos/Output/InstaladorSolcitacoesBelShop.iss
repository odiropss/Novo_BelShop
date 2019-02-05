; Script Gerado Pelo Inno Setup Script Wizard.
; [Inno Setup(BR)]

[Setup]
AppName=Solicitação de Transferêncis CD Lojas BelShop
AppVerName=Versão 1.0
AppPublisher=BelShop
AppPublisherURL=odir.opss@gmail.com
AppSupportURL=odir.opss@gmail.com
AppUpdatesURL=odir.opss@gmail.com
DefaultDirName=c:\BelShop_Odir\Solicitação de Transferêncis CD Lojas BelShop
DisableDirPage=yes
DefaultGroupName=Solicitação de Transferêncis CD Lojas BelShop
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
Source: "C:\SolicitacaoTransferencias\qtintf70.dll"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\FBConect_InterNet.ini"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\FBConect_IntraNet.ini"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\FBConect_Local.ini"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\gds32.dll"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\InstaladorSolcitacoesBelShop.iss"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\InstallSolcitacoes.iss"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\Loja.ini"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\midas.dll"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "C:\SolicitacaoTransferencias\Dicas de Uso do Sistema de Transferência.doc"; DestDir: "{app}"; CopyMode: alwaysoverwrite

[Icons]
Name: "{group}\Solicitação de Transferêncis CD Lojas BelShop"; Filename: "{app}\PSolicTransf.exe"
Name: "{userdesktop}\Solicitação de Transferêncis CD Lojas BelShop"; Filename: "{app}\PSolicTransf.exe"; MinVersion: 4,4; Tasks: desktopicon

[Run]
Filename: "{app}\PSolicTransf.exe"; Description: "Launch Solicitação de Transferêncis CD Lojas BelShop"; Flags: nowait postinstall skipifsilent
