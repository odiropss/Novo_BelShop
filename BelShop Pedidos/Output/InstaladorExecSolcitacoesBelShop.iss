; Script Gerado Pelo Inno Setup Script Wizard.
; [Inno Setup(BR)]

[Setup]
AppName=Solicitação de Transferêncis CD Lojas BelShop
AppVerName=Versao 2.0
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

[Files]
Source: "C:\SolicitacaoTransferencias\PSolicTransf.exe"; DestDir: "{app}"; CopyMode: alwaysoverwrite

[Icons]
Name: "{group}\Solicitação de Transferêncis CD Lojas BelShop"; Filename: "{app}\PSolicTransf.exe"
