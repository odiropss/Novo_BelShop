unit UWebServiceLinx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, JvExStdCtrls, JvRichEdit,
  JvExControls, JvEditorCommon, JvEditor, ComCtrls, JvHLEditor, JvMemo,
  JvUnicodeHLEditor, JvUnicodeEditor, RxRichEd, xmldom, XMLIntf, msxmldom,
  XMLDoc, JvXPCore, JvXPButtons;

type
  TFrmWebServiceLinx = class(TForm)
    IdHTTP: TIdHTTP;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Button1: TButton;
    Button4: TButton;
    Button5: TButton;
    XMLDocument1: TXMLDocument;
    Bt_LinxLojas: TJvXPButton;
    JvEditor1: TJvEditor;
    Bt_LinxClientesFornec: TJvXPButton;
    Bt_LinxMovimento: TJvXPButton;
    Bt_LinxVendedores: TJvXPButton;
    Bt_LinxProdutosDetalhes: TJvXPButton;
    Bt_LinxProdutos: TJvXPButton;
    Bt_LinxFaturas: TJvXPButton;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Bt_LinxLojasClick(Sender: TObject);
    procedure Bt_LinxClientesFornecClick(Sender: TObject);
    procedure Bt_LinxMovimentoClick(Sender: TObject);
    procedure Bt_LinxVendedoresClick(Sender: TObject);
    procedure Bt_LinxProdutosDetalhesClick(Sender: TObject);
    procedure Bt_LinxProdutosClick(Sender: TObject);
    procedure Bt_LinxFaturasClick(Sender: TObject);

    // Odir
    Procedure MontaMetodoXMLPost(sMetodo, sChave, sCNPJEmp: String; sDtaInicio: String=''; sDtaFim: String='');
    // Odir
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
// Monta Metodos Post >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmWebServiceLinx.MontaMetodoXMLPost(sMetodo, sChave, sCNPJEmp: String; sDtaInicio: String=''; sDtaFim: String='');
Var
  txtArq:TextFile;
  sArq:String;
  sLinha:String;
Begin
  // Gera Arquivo
  sArq:='C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\'+sMetodo+'.XML';
  AssignFile(txtArq,sArq);
  Rewrite(txtArq);

  // Grava Linha
  sLinha:='<?xml version="1.0" encoding="UTF-8"?>';
  Writeln(txtArq,sLinha);
  sLinha:='<LinxMicrovix>';
  Writeln(txtArq,sLinha);
  sLinha:='	<Authentication password="linx_export" user="linx_export"/>';
  Writeln(txtArq,sLinha);
  sLinha:='	<ResponseFormat>xml</ResponseFormat>';
  Writeln(txtArq,sLinha);
  sLinha:='	<Command>';
  Writeln(txtArq,sLinha);
  sLinha:='		<Name>'+sMetodo+'</Name>'; // LinxLojas
  Writeln(txtArq,sLinha);
  sLinha:='		<Parameters>';
  Writeln(txtArq,sLinha);
  sLinha:='			<Parameter id="chave">'+sChave+'</Parameter>'; // d52511f4-3541-4a65-9adc-665513ea3207
  Writeln(txtArq,sLinha);
  sLinha:='			<Parameter id="cnpjEmp">'+sCNPJEmp+'</Parameter>'; // 03772229001880
  Writeln(txtArq,sLinha);

  If sMetodo='LinxClientesFornec' Then
  Begin
    sLinha:='			<Parameter id="data_inicial">'+sDtaInicio+'</Parameter>';
    Writeln(txtArq,sLinha);
    sLinha:='			<Parameter id="data_fim">'+sDtaFim+'</Parameter>';
    Writeln(txtArq,sLinha);
  End;

  // Encerramento XML
  sLinha:='		</Parameters>';
  Writeln(txtArq,sLinha);
  sLinha:='	</Command>';
  Writeln(txtArq,sLinha);
  sLinha:='</LinxMicrovix>';
  Writeln(txtArq,sLinha);

  CloseFile(txtArq);

End; // Monta Metodos Post >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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


  try

    IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
    IdHTTP.Request.ContentEncoding := 'multipart/form-data';
    sResponse := IdHTTP.Post('http://webapi.microvix.com.br/1.0/api/integracao', fsParams);

    JvEditor1.Lines.Add(sResponse);
  except
    on E: Exception do
      ShowMessage('Error encountered during POST: ' + E.Message);
  end;
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
  try
    IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
    IdHTTP.Request.ContentEncoding := 'multipart/form-data';
    sResponse := IdHTTP.Post('http://webapi.microvix.com.br/1.0/api/integracao', fsParams);

    JvEditor1.Lines.Add(sResponse);
    tsArquivo.Add(JvEditor1.Lines.Text);
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
  try
    IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
    IdHTTP.Request.ContentEncoding := 'multipart/form-data';
    sResponse := IdHTTP.Post('http://webapi.microvix.com.br/1.0/api/integracao', fsParams);

    xml.Text:=sResponse;
    xml.SaveToFile('C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\LinxLojas_Retorno.XML');

    JvEditor1.Lines.Add(xml.Text);

    XMLDocument1.LoadFromFile('C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\LinxLojas_Retorno.XML');
  except
    on E: Exception do
      ShowMessage('Error encountered during POST: ' + E.Message);
  end;
end;

procedure TFrmWebServiceLinx.Bt_LinxLojasClick(Sender: TObject);
var
  xml : TStringlist;
  sResponse: String;
  fsParams: TFileStream;
begin
  MontaMetodoXMLPost('LinxLojas', 'd52511f4-3541-4a65-9adc-665513ea3207', '03772229001880');

//  MontaMetodoXMLPost(sMetodo, sChave, sCNPJEmp: String; sDtaInicio: String=''; sDtaFim: String='');
  // LinxLojas.xml
  fsParams := TFileStream.Create('C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\LinxLojas.xml', fmOpenRead or fmShareDenyWrite);

  xml := TStringlist.create;
  JvEditor1.Lines.Clear;
  try
    IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
    IdHTTP.Request.ContentEncoding := 'multipart/form-data';
    sResponse := IdHTTP.Post('http://webapi.microvix.com.br/1.0/api/integracao', fsParams);

    xml.Text:=sResponse;
    xml.SaveToFile('C:\Projetos\BelShop\Fontes\WebService Linx\Retornos\Retorno_LinxLojas.XML');

    JvEditor1.Lines.Add(xml.Text);
//    XMLDocument1.LoadFromFile('C:\Projetos\BelShop\Fontes\WebService Linx\Retornos\Retorno_LinxLojas.XML');
  except
    on E: Exception do
      ShowMessage('Error encountered during POST: ' + E.Message);
  end;
end;

procedure TFrmWebServiceLinx.Bt_LinxClientesFornecClick(Sender: TObject);
var
  xml : TStringlist;
  sResponse: String;
  fsParams: TFileStream;
begin

  MontaMetodoXMLPost('LinxClientesFornec', 'd52511f4-3541-4a65-9adc-665513ea3207', '03772229001880', '2017-01-01', '2017-05-01');

  // LinxClientesFornec.xml
  fsParams := TFileStream.Create('C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\LinxClientesFornec.xml', fmOpenRead or fmShareDenyWrite);

  xml := TStringlist.create;
  JvEditor1.Lines.Clear;
  try
    IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
    IdHTTP.Request.ContentEncoding := 'multipart/form-data';
    sResponse := IdHTTP.Post('http://webapi.microvix.com.br/1.0/api/integracao', fsParams);

    xml.Text:=sResponse;
    xml.SaveToFile('C:\Projetos\BelShop\Fontes\WebService Linx\Retornos\Retorno_LinxClientesFornec.XML');

    JvEditor1.Lines.Add(xml.Text);
//    XMLDocument1.LoadFromFile('C:\Projetos\BelShop\Fontes\WebService Linx\Retornos\Retorno_LinxClientesFornec.XML');
  except
    on E: Exception do
      ShowMessage('Error encountered during POST: ' + E.Message);
  end;
end;

procedure TFrmWebServiceLinx.Bt_LinxMovimentoClick(Sender: TObject);
var
  xml : TStringlist;
  sResponse: String;
  fsParams: TFileStream;
begin
  // LinxMovimento.xml
  fsParams := TFileStream.Create('C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\LinxMovimento.xml', fmOpenRead or fmShareDenyWrite);

  xml := TStringlist.create;
  JvEditor1.Lines.Clear;
  try
    IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
    IdHTTP.Request.ContentEncoding := 'multipart/form-data';
    sResponse := IdHTTP.Post('http://webapi.microvix.com.br/1.0/api/integracao', fsParams);

    xml.Text:=sResponse;
    xml.SaveToFile('C:\Projetos\BelShop\Fontes\WebService Linx\Retornos\Retorno_LinxMovimento.XML');

    JvEditor1.Lines.Add(xml.Text);
//    XMLDocument1.LoadFromFile('C:\Projetos\BelShop\Fontes\WebService Linx\Retornos\Retorno_LinxMovimento.XML');
  except
    on E: Exception do
      ShowMessage('Error encountered during POST: ' + E.Message);
  end;
end;

procedure TFrmWebServiceLinx.Bt_LinxVendedoresClick(Sender: TObject);
var
  xml : TStringlist;
  sResponse: String;
  fsParams: TFileStream;
  i: Integer;
begin
  // LinxVendedores.xml
  fsParams := TFileStream.Create('C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\LinxVendedores.xml', fmOpenRead or fmShareDenyWrite);

  xml := TStringlist.create;
  JvEditor1.Lines.Clear;
  try
    IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
    IdHTTP.Request.ContentEncoding := 'multipart/form-data';
    sResponse := IdHTTP.Post('http://webapi.microvix.com.br/1.0/api/integracao', fsParams);

    xml.Text:=sResponse;
    xml.SaveToFile('C:\Projetos\BelShop\Fontes\WebService Linx\Retornos\Retorno_LinxVendedores.XML');

    For i:=0 to xml.Count-1 do
    JvEditor1.Lines.Add(xml.ValueFromIndex[i]);
//    XMLDocument1.LoadFromFile('C:\Projetos\BelShop\Fontes\WebService Linx\Retornos\Retorno_LinxMovimento.XML');
  except
    on E: Exception do
      ShowMessage('Error encountered during POST: ' + E.Message);
  end;
end;

procedure TFrmWebServiceLinx.Bt_LinxProdutosDetalhesClick(Sender: TObject);
var
  xml : TStringlist;
  sResponse: String;
  fsParams: TFileStream;
  i: Integer;
begin
  // LinxProdutosDetalhes.xml
  fsParams := TFileStream.Create('C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\LinxProdutosDetalhes.xml', fmOpenRead or fmShareDenyWrite);

  xml := TStringlist.create;
  JvEditor1.Lines.Clear;
  try
    IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
    IdHTTP.Request.ContentEncoding := 'multipart/form-data';
    sResponse := IdHTTP.Post('http://webapi.microvix.com.br/1.0/api/integracao', fsParams);

    xml.Text:=sResponse;
    xml.SaveToFile('C:\Projetos\BelShop\Fontes\WebService Linx\Retornos\Retorno_LinxProdutosDetalhes.XML');

    For i:=0 to xml.Count-1 do
    JvEditor1.Lines.Add(xml.ValueFromIndex[i]);
//    XMLDocument1.LoadFromFile('C:\Projetos\BelShop\Fontes\WebService Linx\Retornos\Retorno_LinxMovimento.XML');
  except
    on E: Exception do
      ShowMessage('Error encountered during POST: ' + E.Message);
  end;
end;

procedure TFrmWebServiceLinx.Bt_LinxProdutosClick(Sender: TObject);
var
  xml : TStringlist;
  sResponse: String;
  fsParams: TFileStream;
  i: Integer;
begin
  // LinxProdutos.xml
  fsParams := TFileStream.Create('C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\LinxProdutos.xml', fmOpenRead or fmShareDenyWrite);

  xml := TStringlist.create;
  JvEditor1.Lines.Clear;
  try
    IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
    IdHTTP.Request.ContentEncoding := 'multipart/form-data';
    sResponse := IdHTTP.Post('http://webapi.microvix.com.br/1.0/api/integracao', fsParams);

    xml.Text:=sResponse;
    xml.SaveToFile('C:\Projetos\BelShop\Fontes\WebService Linx\Retornos\Retorno_LinxProdutos.XML');

    For i:=0 to xml.Count-1 do
    JvEditor1.Lines.Add(xml.ValueFromIndex[i]);
//    XMLDocument1.LoadFromFile('C:\Projetos\BelShop\Fontes\WebService Linx\Retornos\Retorno_LinxMovimento.XML');
  except
    on E: Exception do
      ShowMessage('Error encountered during POST: ' + E.Message);
  end;
end;

procedure TFrmWebServiceLinx.Bt_LinxFaturasClick(Sender: TObject);
var
  xml : TStringlist;
  sResponse: String;
  fsParams: TFileStream;
begin
  // LinxFaturas.xml
  fsParams := TFileStream.Create('C:\Projetos\BelShop\Fontes\WebService Linx\Metodos\LinxFaturas.xml', fmOpenRead or fmShareDenyWrite);

  xml := TStringlist.create;
  JvEditor1.Lines.Clear;
  try
    IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
    IdHTTP.Request.ContentEncoding := 'multipart/form-data';
    sResponse := IdHTTP.Post('http://webapi.microvix.com.br/1.0/api/integracao', fsParams);

    xml.Text:=sResponse;
    xml.SaveToFile('C:\Projetos\BelShop\Fontes\WebService Linx\Retornos\Retorno_LinxFaturas.XML');

    JvEditor1.Lines.Add(xml.Text);
//    XMLDocument1.LoadFromFile('C:\Projetos\BelShop\Fontes\WebService Linx\Retornos\Retorno_LinxMovimento.XML');
  except
    on E: Exception do
      ShowMessage('Error encountered during POST: ' + E.Message);
  end;
  FreeAndNil(fsParams);
  FreeAndNil(xml);
end;

end.
