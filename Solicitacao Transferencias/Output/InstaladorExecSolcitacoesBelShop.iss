; Script Gerado Pelo Inno Setup Script Wizard.
; [Inno Setup(BR)]

[Setup]
AppName=Solicita��o de Transfer�ncis CD Lojas BelShop
AppVerName=Versao 2.0
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

[Files]
Source: "C:\SolicitacaoTransferencias\PSolicTransf.exe"; DestDir: "{app}"; CopyMode: alwaysoverwrite

[Icons]
Name: "{group}\Solicita��o de Transfer�ncis CD Lojas BelShop"; Filename: "{app}\PSolicTransf.exe"
