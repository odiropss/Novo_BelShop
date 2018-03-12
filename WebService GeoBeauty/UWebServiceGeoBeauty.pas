unit UWebServiceGeoBeauty;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InvokeRegistry, Rio, SOAPHTTPClient, StdCtrls, JvExControls,
  JvXPCore, JvXPButtons, ExtCtrls;

type
  TfrmWebServiceGeoBeauty = class(TForm)
    Panel1: TPanel;
    JvXPButton1: TJvXPButton;
    Memo1: TMemo;
    HTTPRIO1: THTTPRIO;
    procedure JvXPButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Const
  cr = #13#10;

{
DADOS DE ACESSO A WEB SERVICE GEOBEAUTY
====================================================
USUARIO: webservice@lojasbelshop.com.br
SENHA  : 102030
CHAVE  : 302cllddf4301tu10sxvjh13070ueruih897634982

ARQUIVO DE PARAMETROS DEVE CONTER
====================================================
Senha do Usário
Chave
Data atual

EXEMPLO DA FORMATAÇÃO DO ARQUIVO
====================================================
102030
302cllddf4301tu10sxvjh13070ueruih897634982
30/01/2018

NOME DO ARQUIVO DE RETORNO CONTENDO A NOVA CHAVE DE ACESSO
==========================================================
- SERÁ CRIADO NA MESMA PASTA DO ARQUIVO ENVIADO DE PARAMETRO.
- APÓS LEITURA DO ARQUIVO DE RETORNO O MESMO DEVE SER APAGADO
-------------------------------------------------------------
CriptografiaGeoBeautyRetorno.TXT
}

var
  frmWebServiceGeoBeauty: TfrmWebServiceGeoBeauty;

implementation

uses ServerWebServiceGeoBeauty;

{$R *.dfm}

procedure TfrmWebServiceGeoBeauty.JvXPButton1Click(Sender: TObject);
begin




 Memo1.Lines.Add('consulta Usuario: '+cr+
                 (HTTPRIO1 as gestoriPortType).consultaUsuario('webservice@lojasbelshop.com.br', 'e8f6b6c68778ceec0bb6e6c1e5754c24c36f007a'));
 Memo1.Lines.Add('==================================================================== ');
 ShowMessage('consulta Usuario: OK'+cr+
             'consulta Faturamento:'+cr+
             'consulta Fechamento: '+cr+
             'consultaFaturamentoPorTipoPgto: ');

 Memo1.Lines.Add('consulta Faturamento: '+cr+
                (HTTPRIO1 as gestoriPortType).consultaFaturamento('webservice@lojasbelshop.com.br', 'e8f6b6c68778ceec0bb6e6c1e5754c24c36f007a',
                '20180220', '20180225'));
 Memo1.Lines.Add('==================================================================== ');
 ShowMessage('consulta Usuario: OK'+cr+
             'consulta Faturamento: OK'+cr+
             'consulta Fechamento: '+cr+
             'consultaFaturamentoPorTipoPgto: ');

 Memo1.Lines.Add('consulta Fechamento: '+cr+
                (HTTPRIO1 as gestoriPortType).consultaFechamento('webservice@lojasbelshop.com.br', 'e8f6b6c68778ceec0bb6e6c1e5754c24c36f007a',
                '20180220', '20180225'));
 Memo1.Lines.Add('==================================================================== ');
 ShowMessage('consulta Usuario: OK'+cr+
             'consulta Faturamento: OK'+cr+
             'consulta Fechamento: OK'+cr+
             'consultaFaturamentoPorTipoPgto: ');

 Memo1.Lines.Add('consultaFaturamentoPorTipoPgto: '+cr+
                (HTTPRIO1 as gestoriPortType).consultaFaturamentoPorTipoPgto('webservice@lojasbelshop.com.br', 'e8f6b6c68778ceec0bb6e6c1e5754c24c36f007a',
                '20180220', '20180225'));
 Memo1.Lines.Add('==================================================================== ');
 ShowMessage('consulta Usuario: OK'+cr+
             'consulta Faturamento: OK'+cr+
             'consulta Fechamento: OK'+cr+
             'consultaFaturamentoPorTipoPgto: OK');

end;

end.

