unit UWindowsFirewall;

interface

uses ActiveX, ComObj;

Const
  NET_FW_PROFILE_DOMAIN = 0;
  NET_FW_PROFILE_STANDARD = 1;
  NET_FW_IP_VERSION_ANY = 2;
  NET_FW_IP_PROTOCOL_UDP = 17;
  NET_FW_IP_PROTOCOL_TCP = 6;
  NET_FW_SCOPE_ALL = 0;
  NET_FW_SCOPE_LOCAL_SUBNET = 1;

  procedure addPortToFirewall(EntryName:string; PortNumber:Cardinal);
  procedure addApplicationToFirewall(EntryName:string;ApplicationPathAndExe:string);

implementation

procedure addPortToFirewall(EntryName:string;PortNumber:Cardinal);
var
  fwMgr,port:OleVariant;
  profile:OleVariant;
begin
  fwMgr := CreateOLEObject('HNetCfg.FwMgr');
  profile := fwMgr.LocalPolicy.CurrentProfile;
  port := CreateOLEObject('HNetCfg.FWOpenPort');
  port.Name := EntryName;
  port.Protocol := NET_FW_IP_PROTOCOL_TCP;
  port.Port := PortNumber;
  port.Scope := NET_FW_SCOPE_ALL;
  port.Enabled := true;
  profile.GloballyOpenPorts.Add(port);
end;

procedure addApplicationToFirewall(EntryName:string;ApplicationPathAndExe:string);
var
  fwMgr,app:OleVariant;
  profile:OleVariant;
begin
  fwMgr := CreateOLEObject('HNetCfg.FwMgr');
  profile := fwMgr.LocalPolicy.CurrentProfile;
  app := CreateOLEObject('HNetCfg.FwAuthorizedApplication');
  app.ProcessImageFileName := ApplicationPathAndExe;
  app.Name := EntryName;
  app.Scope := NET_FW_SCOPE_ALL;
  app.IpVersion := NET_FW_IP_VERSION_ANY;
  app.Enabled :=true;
  profile.AuthorizedApplications.Add(app);
end;


{
http://www.delphi3000.com/articles/article_5021.asp
More things you can see at this Address:
http://msdn2.microsoft.com/en-us/library/aa366415.aspx

NOTE: If you application doesn't initialize any activex objects you
will also need to call CoInitialize(nil); before using the firewall
functions and CoUninitialize; at the end.}

initialization
  CoInitialize(nil);
finalization
  CoUninitialize;
end.
