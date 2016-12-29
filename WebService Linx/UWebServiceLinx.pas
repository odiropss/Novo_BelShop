unit UWebServiceLinx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFrmWebServiceLinx = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Memo1: TMemo;
    IdHTTP: TIdHTTP;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmWebServiceLinx: TFrmWebServiceLinx;

implementation

uses
  IdMultipartFormData;

{$R *.dfm}

procedure TFrmWebServiceLinx.Button1Click(Sender: TObject);
var
  sResponse: String;
  fsParams: TFileStream;
begin
//  fsParams := TFileStream.Create('C:\Users\aquasoft\Desktop\Odir\xmlExemplo.xml', fmOpenRead or fmShareDenyWrite);
//  fsParams := TFileStream.Create('C:\Documents and Settings\Administrador\Desktop\Odir\xmlExemplo.xml', fmOpenRead or fmShareDenyWrite);

// xmlExemplo_LinxLojas2.xml
// fsParams := TFileStream.Create('C:\Documents and Settings\Administrador\Desktop\Odir\xmlExemplo_LinxLojas2.xml', fmOpenRead or fmShareDenyWrite);

// LinxLojas.xml
//  fsParams := TFileStream.Create('C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\LinxLojas.xml', fmOpenRead or fmShareDenyWrite);

// LinxClientesFornec.xml
//  fsParams := TFileStream.Create('C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\LinxClientesFornec.xml', fmOpenRead or fmShareDenyWrite);

// LinxMovimento.xml
  fsParams := TFileStream.Create('C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\LinxMovimento.xml', fmOpenRead or fmShareDenyWrite);

  Memo1.Lines.Clear;
  try
    IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
    IdHTTP.Request.ContentEncoding := 'multipart/form-data';
    sResponse := IdHTTP.Post('http://webapi.microvix.com.br/1.0/api/integracao', fsParams);
    Memo1.Lines.Add(sResponse);
  except
    on E: Exception do
      ShowMessage('Error encountered during POST: ' + E.Message);
  end;end;

end.
