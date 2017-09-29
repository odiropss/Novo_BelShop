unit UFrmServidor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ScktComp, JvExControls, JvXPCore, JvXPButtons, Mask,
  ToolEdit, CurrEdit;


type
  TServ_Sock = class(TThread)
    private
      procedure Execute; override;
    public
      Socket: TCustomWinSocket;
  end;

type
  TFrmServidor = class(TForm)
    ServerSocket1: TServerSocket;
    Label1: TLabel;
    EdtPorta: TCurrencyEdit;
    Bt_Ativar: TJvXPButton;
    Bt_Desativar: TJvXPButton;
    Label2: TLabel;
    Lab_Ativo: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure ServerSocket1ClientError(Sender: TObject;
      Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
      var ErrorCode: Integer);
    procedure ServerSocket1Accept(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure Bt_AtivarClick(Sender: TObject);
    procedure Bt_DesativarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmServidor: TFrmServidor;

implementation

{$R *.dfm}

procedure TFrmServidor.Button2Click(Sender: TObject);
begin
end;

{ TServ_Sock }

procedure TServ_Sock.Execute;
var
  s: String;
  Stream: TMemoryStream;
begin
  inherited;

  while not Terminated and Socket.Connected do begin
    if Socket.ReceiveLength>0 then begin
      s := Socket.ReceiveText;

      if Pos('<|Arquivo|>', s)>0 then
      begin
          Stream := TMemoryStream.Create;
          Stream.LoadFromFile('E:\Projetos\Transferencias Instaladores\PSolicTransf.rar');
          Stream.Position := 0;
          Socket.SendText(IntToStr(Stream.Size)+#0);
          Sleep(1000);
          Socket.SendStream(Stream);
      end;
    end;
    Sleep(10);
  end;
end;

procedure TFrmServidor.ServerSocket1ClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  ErrorCode := 0;
  Application.MessageBox('Servidor Erro ao conectar!', 'Erro', 16);
end;

procedure TFrmServidor.ServerSocket1Accept(Sender: TObject;
  Socket: TCustomWinSocket);
var
  Conex: TServ_Sock;
begin
  Conex := TServ_Sock.Create(true);
  Conex.Socket := Socket;
  Conex.FreeOnTerminate := True;
  Conex.Resume;
end;

procedure TFrmServidor.Bt_AtivarClick(Sender: TObject);
begin
  ServerSocket1.Port:=EdtPorta.AsInteger;
  ServerSocket1.Active := True;
  Bt_Ativar.Enabled   := False;
  Bt_Desativar.Enabled:= True;

  Lab_Ativo.Caption:='ATIVADO !!';

end;

procedure TFrmServidor.Bt_DesativarClick(Sender: TObject);
begin
  ServerSocket1.Active := False;
  Bt_Ativar.Enabled   := True;
  Bt_Desativar.Enabled:= false;

  Lab_Ativo.Caption:='DESATIVADO !!';

end;

procedure TFrmServidor.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Bt_DesativarClick(Self);
end;

end.
