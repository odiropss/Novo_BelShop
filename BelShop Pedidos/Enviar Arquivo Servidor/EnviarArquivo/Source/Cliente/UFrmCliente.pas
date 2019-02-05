unit UFrmCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ScktComp, ExtCtrls, JvExControls, JvXPCore,
  JvXPButtons, JvSpecialProgress, ShellAPI;

type
  TFrmCliente = class(TForm)
    ClientSocket1: TClientSocket;
    SaveDialog1: TSaveDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    ProgressBar: TJvSpecialProgress;
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure FormCreate(Sender: TObject);
    procedure ClientSocket1Connect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure FormShow(Sender: TObject);

    // ODIR ====================================================================
    Function  DescompactaExecutavel: Boolean;
    // ODIR ====================================================================

  private
    { Private declarations }
  public
    { Public declarations }
  end;

Const cr = #13#10;

var
  FrmCliente: TFrmCliente;

  Stream: TMemoryStream;

  Tamanho: Int64;
  Recebendo: Boolean;

  sgPastaExecutavel,
  sgInternetIP, sgInternetPorta, sgLojaLinx: String;

implementation

uses DK_Procs1;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Descontacta Executáel >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmCliente.DescompactaExecutavel: Boolean;
Var
  sPastaWinRar: String;
Begin
  Result:=True;
  sPastaWinRar:='';

  // Verifica se Existe a Pasta do Aplicativo WinRAR.exe =======================
  If DirectoryExists('C:\Program Files\WinRAR\')               Then sPastaWinRar:='C:\Program Files\WinRAR\'
  Else
  If DirectoryExists('C:\Arquivos de Programas\WinRAR\')       Then sPastaWinRar:='C:\Arquivos de Programas\WinRAR\'
  Else
  If DirectoryExists('C:\Program Files (x86)\WinRAR\')         Then sPastaWinRar:='C:\Program Files (x86)\WinRAR\'
  Else
  If DirectoryExists('C:\Arquivos de Programas (x86)\WinRAR\') Then sPastaWinRar:='C:\Arquivos de Programas (x86)\WinRAR\';

  If Trim(sPastaWinRar)='' Then
  Begin
    MessageBox(Application.Handle, Pchar('Descompactador de Arquivos NÃO Encontrado !!'+cr+cr+
                                         'Entrar em contado com o ODIR - 999-578-234 !!'), 'ATENÇÃO !!', MB_ICONEXCLAMATION);
    Result:=False;
    Exit;
  End;

  // Descompacta Novo Executável ===============================================
  If FileExists(sgPastaExecutavel+'PSolicTransf.exe') then
  Begin
    DeleteFile(sgPastaExecutavel+'@PSolicTransf.ANT');
    RenameFile(sgPastaExecutavel+'PSolicTransf.exe',sgPastaExecutavel+'@PSolicTransf.ANT')
  End;

  winexec (PChar(sPastaWinRar+'WinRAR.exe e '+sgPastaExecutavel+'PSolicTransf.rar '+sgPastaExecutavel),sw_normal);
End; // Descontacta Executáel >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmCliente.ClientSocket1Error(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ErrorCode := 0;
  MessageBox(Application.Handle, Pchar('SERVIDOR NÃO CONECTADO !!'+cr+cr+
                                       'Entrar em contado com o ODIR - 999-578-234 !!'), 'ATENÇÃO !!', MB_ICONEXCLAMATION);
  Application.Terminate;
end;

procedure TFrmCliente.ClientSocket1Disconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
//  Application.MessageBox('Desconectado do servidor!!', 'Desconectado', 16);
end;

procedure TFrmCliente.ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
var
  s: string;
begin
  Application.ProcessMessages;

  s := Socket.ReceiveText;

  If Recebendo = False Then
  Begin
    If Pos(#0, s)>0 Then
    Begin
      Application.ProcessMessages;

      Tamanho := StrToInt(Copy(s, 1, Pos(#0, s)-1));

      Delete(s, 1, Pos(#0, s));
      Stream := TMemoryStream.Create;
      ProgressBar.Maximum := Tamanho;
      Recebendo := True;
    End;
  End;

  Try
    Application.ProcessMessages;

    Stream.Write(s[1], Length(s));
    ProgressBar.Position := Stream.Size;

//    If Stream.Size >= Tamanho Then
    If Stream.Size >= Tamanho Then
    Begin
      Stream.Position := 0;

      Stream.SaveToFile(sgPastaExecutavel+'PSolicTransf.rar');

      // Desconecta Client =====================================================
      ClientSocket1.Active := False;
      ProgressBar.Position := 0;
      Recebendo := False;
      Stream.Free;

      // Descompacta Executável ================================================
//      If Not DescompactaExecutavel Then
//      Begin
//        Application.Terminate;
//        Exit;
//      End;

      Application.MessageBox('Nova Versão Salva com SUCESSO !!', 'AVISO !!', 64);

//      // Abre Nova Versão do Aplicativo ========================================
//      ShellExecute(Handle, 'open',Pchar(sgPastaExecutavel+'PSolicTransf.rar '+sgLojaLinx), nil, nil, 1);

      Application.Terminate;
      Exit;
    end;
  except
    Stream.Free;
    Recebendo := false;
  end;
end;

procedure TFrmCliente.FormCreate(Sender: TObject);
Var
  i: Integer;
  sParametro: String;
begin
  // Não Permite Movimentar o Formulário =======================================
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

  Recebendo := False;

  // Apropria IP e Porta do Servidor ===========================================
  sgInternetIP   :='';
  sgInternetPorta:='';
  sgLojaLinx     :='';
  sParametro     :='';
  for i:=1 to ParamCount do
   sParametro:=ParamStr(i);

//odiraqui
  sParametro:='201.21.193.78;3051;12;';

  // Pasta Executavel ==========================================================
  sgPastaExecutavel:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  sgPastaExecutavel:='C:\BelShop_Odir\Solicitação de Transferêncis CD Lojas BelShop\';

  // CONEXÃO: IP Internet e Porta no Servidor e Código da Loja Linx ============
  sgInternetIP   :=Separa_String(sParametro,1);
  sgInternetPorta:=Separa_String(sParametro,2);
  sgLojaLinx     :=Separa_String(sParametro,3);

//  CopyFile(PChar('\\201.21.193.78\E:\Projetos\Transferencias Instaladores\PSolicTransf.rar'),
//  PChar('C:\BelShop_Odir\PSolicTransf.rar'), False);
////  PChar('C:\BelShop_Odir\Solicitação de Transferêncis CD Lojas BelShop\PSolicTransf.rar'), False);
//
//  Exit;
end;

procedure TFrmCliente.ClientSocket1Connect(Sender: TObject; Socket: TCustomWinSocket);
begin
//  ShowMessage('Conectado!');
end;

procedure TFrmCliente.FormShow(Sender: TObject);
begin
  Application.ProcessMessages;

  Try
    // Conecta Client ==========================================================
    ClientSocket1.Port  :=StrToInt(sgInternetPorta);
    ClientSocket1.Host  :=sgInternetIP;
    ClientSocket1.Active:=True;

    FrmCliente.Refresh;

    Application.ProcessMessages;

    // Busca Executável ========================================================
    Application.MessageBox('Tecle <OK> Para Buscar Nova Versão !!', 'ATENÇÃO !!', 16);
    ClientSocket1.Socket.SendText('<|Arquivo|>');
  Except
  End;
end;

end.
