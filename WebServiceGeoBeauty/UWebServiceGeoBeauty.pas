unit UWebServiceGeoBeauty;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InvokeRegistry, Rio, SOAPHTTPClient, StdCtrls, JvExControls,
  JvXPCore, JvXPButtons, ExtCtrls, ComCtrls, JvEditorCommon, JvEditor,
  JvUnicodeEditor, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  DB, DBClient, Grids, DBGrids;

type
  TfrmWebServiceGeoBeauty = class(TForm)
    HTTPRIO111: THTTPRIO;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Bt_Busca: TJvXPButton;
    Memo1: TMemo;
    Panel2: TPanel;
    Bt_MontarEstrutura: TJvXPButton;
    Memo2: TMemo;
    Gb_CurvaABCEndPeriodo: TGroupBox;
    Label85: TLabel;
    DtEdtInicio: TcxDateEdit;
    DtEdtFim: TcxDateEdit;
    CDS_GeoBeauty: TClientDataSet;
    DS_GeoBeauty: TDataSource;
    CDS_GeoBeautyDATA: TDateField;
    CDS_GeoBeautyCNPJ_LOJA: TStringField;
    CDS_GeoBeautyNOME_LOJA: TStringField;
    TabSheet3: TTabSheet;
    Panel3: TPanel;
    Bt_Apresenta: TJvXPButton;
    Dbg_ApresentaDados: TDBGrid;
    CDS_GeoBeautyVALOR_CHEQUE: TCurrencyField;
    CDS_GeoBeautyVALOR_CARTAO: TCurrencyField;
    CDS_GeoBeautyVALOR_DINHEIRO: TCurrencyField;
    CDS_GeoBeautyVALOR_TOTAL: TCurrencyField;
    Bt_DepAnaliseSalvaClipboard: TJvXPButton;
    HTTPRIO1: THTTPRIO;
    procedure Bt_BuscaClick(Sender: TObject);
    procedure Bt_MontarEstruturaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_ApresentaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Bt_DepAnaliseSalvaClipboardClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

  sgLinha: WideString;

  sgPastaExecutavel: String;       // Somente a Pasta do Executável

implementation

uses ServerWebServiceGeoBeauty, DK_Procs1, UWindowsFirewall;

{$R *.dfm}

procedure TfrmWebServiceGeoBeauty.Bt_BuscaClick(Sender: TObject);
Var
  wDia, wMes, wAno: Word;
  sDtaIncio,sDtaFim: String;

  tsArquivo: TStringList;

  sChaveAcessoGeo, sParametro: String;

begin
  Screen.Cursor:=crAppStart;

  // Gera Chave de Acesso GeoBeauty
  tsArquivo:=TStringList.Create;

  Try
    tsArquivo.Add('102030'); // Codigo do Usuario
    tsArquivo.Add('302cllddf4301tu10sxvjh13070ueruih897634982'); // Chave da Empresa
    tsArquivo.Add(DateToStr(Now));

    tsArquivo.SaveToFile(sgPastaExecutavel+'Odir.TXT');
  Finally // Try
    { Libera a instancia da lista da memória }
    FreeAndNil(tsArquivo);
  End; // Try

  // Cria Chave de Acesso do Dia ===============================================
  sParametro:=sgPastaExecutavel+'PCriptografiaGeoBeauty.exe '+sgPastaExecutavel+'Odir.TXT';
//  sParametro:='C:\Projetos\Delphi XE2\Criptografia GeoBeauty\Win32\Debug\PCriptografiaGeoBeauty.exe" "C:\Projetos\Delphi XE2\Criptografia GeoBeauty\Odir.TXT';
  CreateProcessSimple(sParametro);

  // Busca Chave de Acesso
  tsArquivo:=TStringList.Create;

  Try
    tsArquivo.LoadFromFile(sgPastaExecutavel+'CriptografiaGeoBeautyRet.TXT');

    sChaveAcessoGeo:=tsArquivo[0];
  Finally // Try
    { Libera a instancia da lista da memória }
    FreeAndNil(tsArquivo);
  End; // Try

  // Acerta Data Inicio
  DecodeDate(DtEdtInicio.Date, wAno, wMes, wDia);
  sDtaIncio:=IntToStr(wAno);
  If wMes<10 Then
   sDtaIncio:=sDtaIncio+'0'+IntToStr(wMes)
  Else
   sDtaIncio:=sDtaIncio+IntToStr(wMes);

  If wDia<10 Then
   sDtaIncio:=sDtaIncio+'0'+IntToStr(wDia)
  Else
   sDtaIncio:=sDtaIncio+IntToStr(wDia);

  // Acerta Data Fim
  DecodeDate(DtEdtFim.Date, wAno, wMes, wDia);
  sDtaFim:=IntToStr(wAno);
  If wMes<10 Then
   sDtaFim:=sDtaFim+'0'+IntToStr(wMes)
  Else
   sDtaFim:=sDtaFim+IntToStr(wMes);

  If wDia<10 Then
   sDtaFim:=sDtaFim+'0'+IntToStr(wDia)
  Else
   sDtaFim:=sDtaFim+IntToStr(wDia);

{
 Memo1.Lines.Add('consulta Usuario: '+cr+
                 (HTTPRIO1 as gestoriPortType).consultaUsuario('webservice@lojasbelshop.com.br', '9d177b4bd4dabdb759eadd088b3f65f4b4d28788'));
 Memo1.Lines.Add('==================================================================== ');
 ShowMessage('consulta Usuario: OK'+cr+
             'consulta Faturamento:'+cr+
             'consulta Fechamento: '+cr+
             'consultaFaturamentoPorTipoPgto: ');

 Memo1.Lines.Add('consulta Faturamento: '+cr+
                (HTTPRIO1 as gestoriPortType).consultaFaturamento('webservice@lojasbelshop.com.br', '9d177b4bd4dabdb759eadd088b3f65f4b4d28788',
                sDtaIncio, sDtaFim));
 Memo1.Lines.Add('==================================================================== ');
 ShowMessage('consulta Usuario: OK'+cr+
             'consulta Faturamento: OK'+cr+
             'consulta Fechamento: '+cr+
             'consultaFaturamentoPorTipoPgto: ');

 Memo1.Lines.Add('consulta Fechamento: '+cr+
                (HTTPRIO1 as gestoriPortType).consultaFechamento('webservice@lojasbelshop.com.br', '9d177b4bd4dabdb759eadd088b3f65f4b4d28788',
                sDtaIncio, sDtaFim));
 Memo1.Lines.Add('==================================================================== ');
 ShowMessage('consulta Usuario: OK'+cr+
             'consulta Faturamento: OK'+cr+
             'consulta Fechamento: OK'+cr+
             'consultaFaturamentoPorTipoPgto: ');
 }

// Memo1.Lines.Clear;
// Memo1.Lines.Add('consultaFaturamentoPorTipoPgto: '+cr+
//                (HTTPRIO1 as gestoriPortType).consultaFaturamentoPorTipoPgto('webservice@lojasbelshop.com.br', '5229f6953aa4f904fa0187402dfe8a0309a874f7',
//                sDtaIncio, sDtaFim));
// Memo1.Lines.Add('==================================================================== ');
// ShowMessage('consulta Usuario: OK'+cr+
//             'consulta Faturamento: OK'+cr+
//             'consulta Fechamento: OK'+cr+
//             'consultaFaturamentoPorTipoPgto: OK');


//  sgLinha:=(HTTPRIO1 as gestoriPortType).consultaFaturamentoPorTipoPgto('webservice@lojasbelshop.com.br',
//                                                                        '5229f6953aa4f904fa0187402dfe8a0309a874f7',
//                                                                        sDtaIncio, sDtaFim);


//  Memo1.Lines.Clear;
//  Memo1.Lines.Add('consultaFaturamentoPorTipoPgto: '+cr+
//                  (HTTPRIO1 as gestoriPortType).consultaFaturamentoPorTipoPgto('webservice@lojasbelshop.com.br',
//                                                                             sChaveAcessoGeo, sDtaIncio, sDtaFim));
//
//  sgLinha:=(HTTPRIO1 as gestoriPortType).consultaFaturamentoPorTipoPgto('webservice@lojasbelshop.com.br',
//                                                                             sChaveAcessoGeo, sDtaIncio, sDtaFim);

// consultaFechamento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Memo1.Lines.Clear;
  Memo1.Lines.Add('consultaFechamento: '+cr+
                  (HTTPRIO1 as gestoriPortType).consultaFechamento('webservice@lojasbelshop.com.br',sChaveAcessoGeo, sDtaIncio, sDtaFim));


  sgLinha:=(HTTPRIO1 as gestoriPortType).consultaFechamento('webservice@lojasbelshop.com.br',sChaveAcessoGeo, sDtaIncio, sDtaFim);

  Screen.Cursor:=crDefault;

//opss
//  PageControl1.TabIndex:=1;
//  CorSelecaoTabSheet(PageControl1);
//
//  Bt_MontarEstruturaClick(Self);

end;

procedure TfrmWebServiceGeoBeauty.Bt_MontarEstruturaClick(Sender: TObject);
Var
  ii, i: Integer;
  b, bb: Boolean;
  sLinha:  WideString;
begin
  Screen.Cursor:=crAppStart;

  Memo2.Lines.Clear;

//  Memo2.Lines.Clear;
//  Memo2.Lines.Add(copy('1º Caracter: '+sgLinha,1,101));

  // Retira os 1 Primeiro Caracteres
  delete(sgLinha,1,1);
//  Memo2.Lines.Add(copy('1º Caracter: '+sgLinha,1,101));

  // Retira os 2 ultimos Caracteres
//  Memo2.Lines.Add('100 ult: '+copy(sgLinha,length(sgLinha)-100,101));
  delete(sgLinha,length(sgLinha)-1,2);
//  Memo2.Lines.Add('100 ult: '+copy(sgLinha,length(sgLinha)-100,101));

  // Coloca Virgula no Ultimo Caracter
  If Copy(sgLinha, Length(sgLinha),1)<>'}' Then
   sgLinha:=sgLinha+'},"'
  Else
   sgLinha:=sgLinha+',"';
//  Memo2.Lines.Add('Virgula ult: '+copy(sgLinha,length(sgLinha)-100,101));

  b:=True;
  While b do
  Begin
    i:=pos('},"', sgLinha);

    If i<>0 Then
    Begin
      // Pega Linha da Loja Somente UM Dia
      sLinha:=copy(sgLinha,1,i+2);

      // Retina Parte Inicial do registro - ("8679":) ou CNPJ e Data do Inicio da Linha
      bb:=True;
      While bb do
      Begin
        ii:=pos('":{"', sLinha);

        If ii=0 Then
         Break;

        Delete(sLinha,1,ii+2);
      end; // While bb do

      // Substitui
              // Aspas "
      // Chave Aberta {
      // Chave Fechada }
              // Substituir Virgula (,) por DoisPontos (:)
      sLinha:=f_Troca('"','',f_Troca('{','',f_Troca('}','',f_Troca(',',':',sLinha))));

      // Substituir Ponto (.) por Virgula (,) Nos Valores
      sLinha:=f_Troca('.',',',sLinha);

      // Acerta Separador de Data
      sLinha:=f_Troca('\/','/',sLinha);

      Memo2.Lines.Add(sLinha);

      // Exclui Registro do Retorno
      Delete(sgLinha,1,i+2);
    End; // If i<>0 Then


    If Trim(sgLinha)='' Then
     Break;
  End; // While b do
  Screen.Cursor:=crDefault;

//opss
//  PageControl1.TabIndex:=2;
//  CorSelecaoTabSheet(PageControl1);
//
//  Bt_ApresentaClick(Self);

end;

procedure TfrmWebServiceGeoBeauty.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TfrmWebServiceGeoBeauty.Bt_ApresentaClick(Sender: TObject);
Var
  i: Integer;
begin
  Screen.Cursor:=crAppStart;

  If CDS_GeoBeauty.Active Then
   CDS_GeoBeauty.Close;

  CDS_GeoBeauty.CreateDataSet;
  CDS_GeoBeauty.IndexFieldNames:='';
  CDS_GeoBeauty.Open;

  DecimalSeparator:=',';

  For i:=0 to Memo2.Lines.Count-1 do
  Begin
    CDS_GeoBeauty.Append;
    CDS_GeoBeautyDATA.AsString          :=Separa_String(Memo2.Lines[i],14,':');
    CDS_GeoBeautyCNPJ_LOJA.AsString     :=Separa_String(Memo2.Lines[i],10,':');
    CDS_GeoBeautyNOME_LOJA.AsString     :=Separa_String(Memo2.Lines[i],12,':');
    CDS_GeoBeautyVALOR_CHEQUE.AsCurrency   :=StrToCurr(ZerosCentavos(Separa_String(Memo2.Lines[i], 2,':'),2));
    CDS_GeoBeautyVALOR_CARTAO.AsCurrency  :=StrToCurr(ZerosCentavos(Separa_String(Memo2.Lines[i], 4,':'),2));
    CDS_GeoBeautyVALOR_DINHEIRO.AsCurrency:=StrToCurr(ZerosCentavos(Separa_String(Memo2.Lines[i], 6,':'),2));
    CDS_GeoBeautyVALOR_TOTAL.AsCurrency   :=StrToCurr(ZerosCentavos(Separa_String(Memo2.Lines[i], 8,':'),2));
    CDS_GeoBeauty.Post;
  End; // For i:=0 to mMemo.Lines.Count-1 do

  Screen.Cursor:=crDefault;
  ShowMessage('Favor Conferir...');
end;

procedure TfrmWebServiceGeoBeauty.FormShow(Sender: TObject);
begin
  PageControl1.TabIndex:=0
end;

procedure TfrmWebServiceGeoBeauty.Bt_DepAnaliseSalvaClipboardClick(Sender: TObject);
begin
  Dbg_ApresentaDados.SetFocus;

  If (Not CDS_GeoBeauty.Active) Or (CDS_GeoBeauty.IsEmpty) Then
   Exit;

  DBGridClipboard(Dbg_ApresentaDados);

end;

procedure TfrmWebServiceGeoBeauty.FormCreate(Sender: TObject);
begin
  // Pasta Executavel ==========================================================
  sgPastaExecutavel:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));

  // Adiciona PBelShop no FireWall =============================================
  Try
    addApplicationToFirewall('WebService GoeBeauty', IncludeTrailingPathDelimiter(sgPastaExecutavel)+'PWebServiceGeoBeauty.exe');
  Except
  End;
end;

end.
//  Screen.Cursor:=crAppStart;
//  Screen.Cursor:=crDefault;


