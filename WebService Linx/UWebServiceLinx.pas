unit UWebServiceLinx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, JvExStdCtrls, JvRichEdit,
  JvExControls, JvEditorCommon, JvEditor, ComCtrls, JvHLEditor, JvMemo,
  JvUnicodeHLEditor, JvUnicodeEditor, RxRichEd, xmldom, XMLIntf, msxmldom,
  XMLDoc;

type
  TFrmWebServiceLinx = class(TForm)
    IdHTTP: TIdHTTP;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Panel1: TPanel;
    Button1: TButton;
    Memo1: TMemo;
    JvRichEdit1: TJvRichEdit;
    JvEditor1: TJvEditor;
    JvHLEditor1: TJvHLEditor;
    JvWideEditor1: TJvWideEditor;
    TabSheet6: TTabSheet;
    JvWideHLEditor1: TJvWideHLEditor;
    TabSheet7: TTabSheet;
    JvMemo1: TJvMemo;
    TabSheet8: TTabSheet;
    RxRichEdit1: TRxRichEdit;
    Button2: TButton;
    Edit1: TEdit;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    XMLDocument1: TXMLDocument;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmWebServiceLinx: TFrmWebServiceLinx;

implementation

uses
  IdMultipartFormData, DK_Procs1, uj_001, uj_002;

{$R *.dfm}

procedure TFrmWebServiceLinx.Button1Click(Sender: TObject);
var
  s, sResponse: String;
  fsParams: TFileStream;
begin

//  fsParams := TFileStream.Create('C:\Users\aquasoft\Desktop\Odir\xmlExemplo.xml', fmOpenRead or fmShareDenyWrite);
//  fsParams := TFileStream.Create('C:\Documents and Settings\Administrador\Desktop\Odir\xmlExemplo.xml', fmOpenRead or fmShareDenyWrite);

// xmlExemplo_LinxLojas2.xml
// fsParams := TFileStream.Create('C:\Documents and Settings\Administrador\Desktop\Odir\xmlExemplo_LinxLojas2.xml', fmOpenRead or fmShareDenyWrite);

// LinxLojas.xml
//  fsParams := TFileStream.Create('C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\LinxLojas.xml', fmOpenRead or fmShareDenyWrite);

// LinxClientesFornec.xml
  fsParams := TFileStream.Create('C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\LinxClientesFornec.xml', fmOpenRead or fmShareDenyWrite);

// LinxMovimento.xml
//  fsParams := TFileStream.Create('C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\LinxMovimento.xml', fmOpenRead or fmShareDenyWrite);

  Memo1.Lines.Clear;
  JvRichEdit1.Lines.Clear;
  JvRichEdit1.Height:=2000;

  try

    IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
    IdHTTP.Request.ContentEncoding := 'multipart/form-data';
    sResponse := IdHTTP.Post('http://webapi.microvix.com.br/1.0/api/integracao', fsParams);

    Memo1.Lines.Add(sResponse);
    JvRichEdit1.Lines.Add(sResponse);
    JvEditor1.Lines.Add(sResponse);
    JvHLEditor1.Lines.Add(sResponse);
    JvWideEditor1.Lines.Add(sResponse);
    JvMemo1.Lines.Add(sResponse);
    RxRichEdit1.Lines.Add(sResponse);
  except
    on E: Exception do
      ShowMessage('Error encountered during POST: ' + E.Message);
  end;
end;

procedure TFrmWebServiceLinx.Button3Click(Sender: TObject);
begin
  Memo1.Lines.Clear;

  Memo1.Lines.Add(JvRichEdit1.Lines[1]);
  Memo1.Lines.Add(JvRichEdit1.Lines[2]);

end;

procedure TFrmWebServiceLinx.Button4Click(Sender: TObject);
var
  tsArquivo: TStringList;

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
  fsParams := TFileStream.Create('C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\LinxClientesFornec.xml', fmOpenRead or fmShareDenyWrite);

// LinxMovimento.xml
//  fsParams := TFileStream.Create('C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\LinxMovimento.xml', fmOpenRead or fmShareDenyWrite);

  tsArquivo:=TStringList.Create;
  Memo1.Lines.Clear;
  Memo1.Height:=2000;
  try
    IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
    IdHTTP.Request.ContentEncoding := 'multipart/form-data';
    sResponse := IdHTTP.Post('http://webapi.microvix.com.br/1.0/api/integracao', fsParams);
    Memo1.Lines.Add(sResponse);
    tsArquivo.Add(Memo1.Text);
    tsArquivo.SaveToFile('C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\OPSS.CSV');
    FreeAndNil(tsArquivo);

  except
    on E: Exception do
      ShowMessage('Error encountered during POST: ' + E.Message);
  end;
end;

procedure TFrmWebServiceLinx.Button5Click(Sender: TObject);
var
  xml : TStringlist;

  sResponse: String;
  fsParams: TFileStream;
begin

//  fsParams := TFileStream.Create('C:\Users\aquasoft\Desktop\Odir\xmlExemplo.xml', fmOpenRead or fmShareDenyWrite);
//  fsParams := TFileStream.Create('C:\Documents and Settings\Administrador\Desktop\Odir\xmlExemplo.xml', fmOpenRead or fmShareDenyWrite);

// xmlExemplo_LinxLojas2.xml
// fsParams := TFileStream.Create('C:\Documents and Settings\Administrador\Desktop\Odir\xmlExemplo_LinxLojas2.xml', fmOpenRead or fmShareDenyWrite);

// LinxLojas.xml
  fsParams := TFileStream.Create('C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\LinxLojas.xml', fmOpenRead or fmShareDenyWrite);

// LinxClientesFornec.xml
//  fsParams := TFileStream.Create('C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\LinxClientesFornec.xml', fmOpenRead or fmShareDenyWrite);
//  fsParams:=TFileStream.Create('C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\LinxClientesFornec.xml', fmOpenRead or fmShareDenyWrite);

// LinxMovimento.xml
//  fsParams := TFileStream.Create('C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\LinxMovimento.xml', fmOpenRead or fmShareDenyWrite);

  xml := TStringlist.create;
  Memo1.Lines.Clear;
  Memo1.Height:=2000;
  try
    IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
    IdHTTP.Request.ContentEncoding := 'multipart/form-data';
    sResponse := IdHTTP.Post('http://webapi.microvix.com.br/1.0/api/integracao', fsParams);

    xml.Text:=sResponse;
    xml.SaveToFile('C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\LinxLojas_Retorno.XML');

    Memo1.Lines.Add(xml.Text);
    JvRichEdit1.Lines.Add(xml.Text);

    XMLDocument1.LoadFromFile('C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\LinxLojas_Retorno.XML');
  except
    on E: Exception do
      ShowMessage('Error encountered during POST: ' + E.Message);
  end;
end;

end.
