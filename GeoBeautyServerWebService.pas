// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://aplicativo.geobeauty.com.br/aplicativo/webservices/ws-salao/server.php?wsdl
// Encoding : ISO-8859-1
// Version  : 1.0
// (23/03/2018 09:28:02 - 1.33.2.5)
// ************************************************************************ //

unit GeoBeautyServerWebService;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"


  // ************************************************************************ //
  // Namespace : urn:gestori
  // soapAction: %operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : gestoriBinding
  // service   : gestori
  // port      : gestoriPort
  // URL       : http://aplicativo.geobeauty.com.br/aplicativo/webservices/ws-salao/server.php
  // ************************************************************************ //
  gestoriPortType = interface(IInvokable)
  ['{9858EC83-A2BE-3223-56B6-43E71FAD3B4D}']
    function  consultaUsuario(const login: WideString; const senha: WideString): WideString; stdcall;
    function  consultaFaturamento(const login: WideString; const senha: WideString; const dataIni: WideString; const dataFim: WideString): WideString; stdcall;
    function  consultaFechamento(const login: WideString; const senha: WideString; const dataIni: WideString; const dataFim: WideString): WideString; stdcall;
    function  consultaFaturamentoPorTipoPgto(const login: WideString; const senha: WideString; const dataIni: WideString; const dataFim: WideString): WideString; stdcall;
  end;

function GetgestoriPortType(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): gestoriPortType;


implementation

function GetgestoriPortType(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): gestoriPortType;
const
  defWSDL = 'http://aplicativo.geobeauty.com.br/aplicativo/webservices/ws-salao/server.php?wsdl';
  defURL  = 'http://aplicativo.geobeauty.com.br/aplicativo/webservices/ws-salao/server.php';
  defSvc  = 'gestori';
  defPrt  = 'gestoriPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as gestoriPortType);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(gestoriPortType), 'urn:gestori', 'ISO-8859-1');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(gestoriPortType), '%operationName%');

end.