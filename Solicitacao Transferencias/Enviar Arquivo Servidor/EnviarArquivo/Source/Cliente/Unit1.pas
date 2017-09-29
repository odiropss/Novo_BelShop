unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ScktComp;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    ProgressBar1: TProgressBar;
    Label2: TLabel;
    ClientSocket1: TClientSocket;
    SaveDialog1: TSaveDialog;
    Button3: TButton;
    Label3: TLabel;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure Button2Click(Sender: TObject);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure FormCreate(Sender: TObject);
    procedure ClientSocket1Connect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Const cr = #13#10;

var
  Form1: TForm1;
  Stream: TMemoryStream;
  Tamanho: Integer;
  Recebendo: Boolean;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ClientSocket1.Port:=StrToInt(Edit2.Text);
  ClientSocket1.Host := Edit1.Text;
  ClientSocket1.Active := true;
end;

procedure TForm1.ClientSocket1Error(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  ErrorCode := 0;
  MessageBox(Application.Handle, Pchar('SERVIDOR NÃO CONECTADO !!'+cr+cr+
                                        'Entra em contado com o ODIR - 999-578-234 !!'), 'ATENÇÃO !!', MB_ICONEXCLAMATION);
  Application.Terminate;
end;

procedure TForm1.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Application.MessageBox('Desconectado do servidor!!', 'Desconectado', 16);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ClientSocket1.Socket.SendText('<|Arquivo|>');
end;

procedure TForm1.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
var
  s: string;
begin
  s := Socket.ReceiveText;

  if Recebendo = False then begin
    if Pos(#0, s)>0 then begin
      
      Tamanho := StrToInt(Copy(s, 1, Pos(#0, s)-1));
      Delete(s, 1, Pos(#0, s));
      Stream := TMemoryStream.Create;
      ProgressBar1.Max := tamanho;
      Recebendo := true;
    end;
  end;
  try
    Stream.Write(s[1], Length(s));
    ProgressBar1.Position := Stream.Size;

    if Stream.Size >= Tamanho then begin
      Stream.Position := 0;

      Stream.SaveToFile('C:\BelShop_Odir\Solicitação de Transferêncis CD Lojas BelShop\PSolicTransf.rar');
      Application.MessageBox('Salvo com sucesso!', 'Aviso', 64);

      Recebendo := false;
      Stream.Free;
    end;
  except
    Stream.Free;
    Recebendo := false;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Recebendo := false;
end;

procedure TForm1.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  ShowMessage('Conectado!');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ClientSocket1.Active := False;

end;

end.
