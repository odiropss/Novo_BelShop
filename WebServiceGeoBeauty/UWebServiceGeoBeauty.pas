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
    CDS_GeoBeautyPagtos: TClientDataSet;
    DS_GeoBeautyPagtos: TDataSource;
    CDS_GeoBeautyPagtosDATA: TDateField;
    CDS_GeoBeautyPagtosCNPJ_LOJA: TStringField;
    CDS_GeoBeautyPagtosNOME_LOJA: TStringField;
    TabSheet3: TTabSheet;
    Panel3: TPanel;
    Bt_Apresenta: TJvXPButton;
    Dbg_ApresentaDados: TDBGrid;
    CDS_GeoBeautyPagtosVALOR_CHEQUE: TCurrencyField;
    CDS_GeoBeautyPagtosVALOR_CARTAO: TCurrencyField;
    CDS_GeoBeautyPagtosVALOR_DINHEIRO: TCurrencyField;
    CDS_GeoBeautyPagtosVALOR_TOTAL: TCurrencyField;
    Bt_DepAnaliseSalvaClipboard: TJvXPButton;
    HTTPRIO1: THTTPRIO;
    DS_GeoBeautyFechamento: TDataSource;
    CDS_GeoBeautyFechamento: TClientDataSet;
    CDS_GeoBeautyFechamentoCNPJ_LOJA: TStringField;
    CDS_GeoBeautyFechamentoNOME_LOJA: TStringField;
    CDS_GeoBeautyFechamentoVALOR_CHEQUE_ATUAL: TCurrencyField;
    CDS_GeoBeautyFechamentoVALOR_CARTAO_ATUAL: TCurrencyField;
    CDS_GeoBeautyFechamentoVALOR_DINHEIRO_ATUAL: TCurrencyField;
    CDS_GeoBeautyFechamentoVALORTOTAL: TCurrencyField;
    CDS_GeoBeautyFechamentoNOME_CAIXA: TStringField;
    CDS_GeoBeautyFechamentoNOME_USUARIO: TStringField;
    CDS_GeoBeautyFechamentoDATA_ABERTURA: TSQLTimeStampField;
    CDS_GeoBeautyFechamentoDATA_FECHAMENTO: TSQLTimeStampField;
    CDS_GeoBeautyFechamentoVALOR_CHEQUE_PREVISTO: TCurrencyField;
    CDS_GeoBeautyFechamentoVALOR_CARTAO_PREVISTO: TCurrencyField;
    CDS_GeoBeautyFechamentoVALOR_DINHEIRO_PREVISTO: TCurrencyField;
    CDS_GeoBeautyFechamentoVALOR_TOTAL_PREVISTO: TCurrencyField;
    CDS_GeoBeautyFechamentoEMPRESA: TIntegerField;
    CDS_GeoBeautyFechamentoCOD_LOJA: TStringField;
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

  sgFuncao, // Nome da Funçã que Esta Sendo Usada
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

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// FUNÇÕES >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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
// FUNÇÕES >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>





//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// consultaFaturamentoPorTipoPgto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//
//  sgFuncao:='consultaFaturamentoPorTipoPgto';
//
//  Memo1.Lines.Clear;
//  Memo1.Lines.Add('consultaFaturamentoPorTipoPgto: '+cr+
//                  (HTTPRIO1 as gestoriPortType).consultaFaturamentoPorTipoPgto('webservice@lojasbelshop.com.br', sChaveAcessoGeo, sDtaIncio, sDtaFim));
//
//  sgLinha:=(HTTPRIO1 as gestoriPortType).consultaFaturamentoPorTipoPgto('webservice@lojasbelshop.com.br', sChaveAcessoGeo, sDtaIncio, sDtaFim);
//
// consultaFaturamentoPorTipoPgto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// consultaFechamento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  sgFuncao:='consultaFechamento';

  Memo1.Lines.Clear;
  Memo1.Lines.Add('consultaFechamento: '+cr+
                  (HTTPRIO1 as gestoriPortType).consultaFechamento('webservice@lojasbelshop.com.br',sChaveAcessoGeo, sDtaIncio, sDtaFim));

  sgLinha:=(HTTPRIO1 as gestoriPortType).consultaFechamento('webservice@lojasbelshop.com.br',sChaveAcessoGeo, sDtaIncio, sDtaFim);

// consultaFechamento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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

  // Retira todos os Til # Linha
  sLinha:=f_Troca('#','',sLinha);
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

      // sgFuncao: consultaFechamento ==========================================
      If sgFuncao='consultaFechamento' Then
      Begin
        // Substitui
        // Aspas Dois_Pontos Aspas ":" por #
        sLinha:=f_Troca('":"','#',sLinha);

        // Aspas Vírgula Aspas "," #
        sLinha:=f_Troca('","','#',sLinha);

        // Aspas " por NULL
        sLinha:=f_Troca('"','',sLinha);

        // Chave Aberta Vírgula }, por #
        sLinha:=f_Troca('},','#',sLinha);
      End;

      // sgFuncao: consultaFaturamentoPorTipoPgto ==============================
      If sgFuncao='consultaFaturamentoPorTipoPgto' Then
      Begin
        // Substitui
        // Aspas " por NULL
        // Chave Aberta { por NULL
        // Chave Fechada } por NULL
        // Substituir Virgula (,) por DoisPontos (:)
        sLinha:=f_Troca('"','',f_Troca('{','',f_Troca('}','',f_Troca(',',':',sLinha))));
      End; // If sgFuncao='consultaFaturamentoPorTipoPgto'

//      // Substituir Ponto (.) por Virgula (,) Nos Valores
//      sLinha:=f_Troca('.',',',sLinha);

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
  sLinha, sNomeLoja, sEmpresa, sCNPJ, sCod_Loja: String; // Dados para Fechamento
begin
  Screen.Cursor:=crAppStart;

  DecimalSeparator:=',';

  // sgFuncao: consultaFaturamentoPorTipoPgto ==============================
  If sgFuncao='consultaFaturamentoPorTipoPgto' Then
  Begin
    Dbg_ApresentaDados.DataSource:=DS_GeoBeautyPagtos;

    If CDS_GeoBeautyPagtos.Active Then
     CDS_GeoBeautyPagtos.Close;

    CDS_GeoBeautyPagtos.CreateDataSet;
    CDS_GeoBeautyPagtos.IndexFieldNames:='';
    CDS_GeoBeautyPagtos.Open;
  End; // If sgFuncao='consultaFaturamentoPorTipoPgto' Then

  // sgFuncao: consultaFechamento ==========================================
  If sgFuncao='consultaFechamento' Then
  Begin
    Dbg_ApresentaDados.DataSource:=DS_GeoBeautyFechamento;

    If CDS_GeoBeautyFechamento.Active Then
     CDS_GeoBeautyFechamento.Close;

    CDS_GeoBeautyFechamento.CreateDataSet;
    CDS_GeoBeautyFechamento.IndexFieldNames:='';
    CDS_GeoBeautyFechamento.Open;
  End; // If sgFuncao='consultaFechamento' Then

  For i:=0 to Memo2.Lines.Count-1 do
  Begin
    // sgFuncao: consultaFaturamentoPorTipoPgto ==============================
    If sgFuncao='consultaFaturamentoPorTipoPgto' Then
    Begin
      CDS_GeoBeautyPagtos.Append;
      CDS_GeoBeautyPagtosDATA.AsString            :=Trim(Separa_String(Memo2.Lines[i],14,':'));
      CDS_GeoBeautyPagtosCNPJ_LOJA.AsString       :=Trim(Separa_String(Memo2.Lines[i],10,':'));
      CDS_GeoBeautyPagtosNOME_LOJA.AsString       :=Trim(Separa_String(Memo2.Lines[i],12,':'));
      CDS_GeoBeautyPagtosVALOR_CHEQUE.AsCurrency  :=StrToCurr(ZerosCentavos(Trim(f_Troca('.',',',Separa_String(Memo2.Lines[i], 2,':'))),2));
      CDS_GeoBeautyPagtosVALOR_CARTAO.AsCurrency  :=StrToCurr(ZerosCentavos(Trim(f_Troca('.',',',Separa_String(Memo2.Lines[i], 4,':'))),2));
      CDS_GeoBeautyPagtosVALOR_DINHEIRO.AsCurrency:=StrToCurr(ZerosCentavos(Trim(f_Troca('.',',',Separa_String(Memo2.Lines[i], 6,':'))),2));
      CDS_GeoBeautyPagtosVALOR_TOTAL.AsCurrency   :=StrToCurr(ZerosCentavos(Trim(f_Troca('.',',',Separa_String(Memo2.Lines[i], 8,':'))),2));
      CDS_GeoBeautyPagtos.Post;
    End; // If sgFuncao='consultaFaturamentoPorTipoPgto' Then

   // sgFuncao: consultaFechamento ==========================================
   If sgFuncao='consultaFechamento' Then
   Begin
      // Atualiza variaveis de Fechamento
      sNomeLoja:=AnsiUpperCase(Trim(Separa_String(Memo2.Lines[i],10,'#')));

      If sNomeLoja='BEL ANDRADAS' Then
      Begin
        sEmpresa :='1';
        sCod_Loja:='02';
        sCNPJ    :='3772229000132';
      End;

      If sNomeLoja='BEL ASSIS BRASIL' Then
      Begin
        sEmpresa :='14';
        sCod_Loja:='03';
        sCNPJ    :='3772229001457';
      End;

      If sNomeLoja='BEL AZENHA' Then
      Begin
        sEmpresa :='21';
        sCod_Loja:='21';
        sCNPJ    :='3772229002186';
      End;

      If sNomeLoja='BEL DOM FELICIANO' Then
      Begin
        sEmpresa :='8';
        sCod_Loja:='01';
        sCNPJ    :='3772229000809';
      End;

      If sNomeLoja='BEL FIORAVANTE' Then
      Begin
        sEmpresa :='3';
        sCod_Loja:='11';
        sCNPJ    :='3772229000302';
      End;

      If sNomeLoja='BEL LUCIANA DE ABREU' Then
      Begin
        sEmpresa :='16';
        sCod_Loja:='14';
        sCNPJ    :='3772229001619';
      End;

      If sNomeLoja='BEL OSVALDO' Then
      Begin
        sEmpresa :='9';
        sCod_Loja:='09';
        sCNPJ    :='3772229000990';
      End;

      If sNomeLoja='BEL OTAVIO ROCHA' Then
      Begin
        sEmpresa :='13';
        sCod_Loja:='06';
        sCNPJ    :='3772229001376';
      End;

      If sNomeLoja='BEL PARKSHOPPING CANOAS' Then
      Begin
        sEmpresa :='22';
        sCod_Loja:='22';
        sCNPJ    :='3772229002267';
      End;

      If sNomeLoja='BEL PRAIA DE BELAS' Then
      Begin
        sEmpresa :='19';
        sCod_Loja:='19';
        sCNPJ    :='3772229001961';
      End;

      If sNomeLoja='BEL PROTASIO' Then
      Begin
        sEmpresa :='17';
        sCod_Loja:='17';
        sCNPJ    :='3772229001708';
      End;

      If sNomeLoja='BEL SALGADO FILHO' Then
      Begin
        sEmpresa :='11';
        sCod_Loja:='05';
        sCNPJ    :='3772229001104';
      End;

      If sNomeLoja='BEL TIRADENTES' Then
      Begin
        sEmpresa :='20';
        sCod_Loja:='20';
        sCNPJ    :='3772229002003';
      End;

      If sNomeLoja='BEL TOTAL' Then
      Begin
        sEmpresa :='18';
        sCod_Loja:='18';
        sCNPJ    :='3772229001880';
      End;

      If sNomeLoja='BEL URUGUAI' Then
      Begin
        sEmpresa :='6';
        sCod_Loja:='16';
        sCNPJ    :='3772229000647';
      End;

      If sNomeLoja='BELCENTER' Then
      Begin
        sEmpresa :='23';
        sCod_Loja:='8';
        sCNPJ    :='5110757000151';
      End;

      If sNomeLoja='BEL IGUATEMI' Then
      Begin
        sEmpresa :='24';
        sCod_Loja:='24';
        sCNPJ    :='3772229002348';
      End;

      CDS_GeoBeautyFechamento.Append;
      CDS_GeoBeautyFechamentoEMPRESA.AsString                  :=sEmpresa;
      CDS_GeoBeautyFechamentoCNPJ_LOJA.AsString                :=sCNPJ;
      CDS_GeoBeautyFechamentoNOME_LOJA.AsString                :=Trim(Separa_String(Memo2.Lines[i],10,'#'));
      CDS_GeoBeautyFechamentoNOME_CAIXA.AsString               :=Trim(Separa_String(Memo2.Lines[i], 2,'#'));
      CDS_GeoBeautyFechamentoNOME_USUARIO.AsString             :=Trim(Separa_String(Memo2.Lines[i], 4,'#'));
      CDS_GeoBeautyFechamentoDATA_ABERTURA.AsString            :=Trim(Separa_String(Memo2.Lines[i], 6,'#'));
      CDS_GeoBeautyFechamentoDATA_FECHAMENTO.AsString          :=Trim(Separa_String(Memo2.Lines[i], 8,'#'));
      CDS_GeoBeautyFechamentoVALOR_CHEQUE_ATUAL.AsCurrency     :=StrToCurr(ZerosCentavos(Trim(f_Troca('.',',',Separa_String(Memo2.Lines[i],12,'#'))),2));
      CDS_GeoBeautyFechamentoVALOR_CARTAO_ATUAL.AsCurrency     :=StrToCurr(ZerosCentavos(Trim(f_Troca('.',',',Separa_String(Memo2.Lines[i],14,'#'))),2));
      CDS_GeoBeautyFechamentoVALOR_DINHEIRO_ATUAL.AsCurrency   :=StrToCurr(ZerosCentavos(Trim(f_Troca('.',',',Separa_String(Memo2.Lines[i],16,'#'))),2));
      CDS_GeoBeautyFechamentoVALOR_CHEQUE_PREVISTO.AsCurrency  :=StrToCurr(ZerosCentavos(Trim(f_Troca('.',',',Separa_String(Memo2.Lines[i],18,'#'))),2));
      CDS_GeoBeautyFechamentoVALOR_CARTAO_PREVISTO.AsCurrency  :=StrToCurr(ZerosCentavos(Trim(f_Troca('.',',',Separa_String(Memo2.Lines[i],20,'#'))),2));
      CDS_GeoBeautyFechamentoVALOR_DINHEIRO_PREVISTO.AsCurrency:=StrToCurr(ZerosCentavos(Trim(f_Troca('.',',',Separa_String(Memo2.Lines[i],22,'#'))),2));
      CDS_GeoBeautyFechamentoVALORTOTAL.AsCurrency             :=StrToCurr(ZerosCentavos(Trim(f_Troca('.',',',Separa_String(Memo2.Lines[i],24,'#'))),2));
      CDS_GeoBeautyFechamentoVALOR_TOTAL_PREVISTO.AsCurrency   :=StrToCurr(ZerosCentavos(Trim(f_Troca('.',',',Separa_String(Memo2.Lines[i],26,'#'))),2));
      CDS_GeoBeautyFechamentoCOD_LOJA.AsString                 :=sCod_Loja;
      CDS_GeoBeautyFechamento.Post;
   End; // If sgFuncao='consultaFechamento' Then
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

  If (Not CDS_GeoBeautyPagtos.Active) Or (CDS_GeoBeautyPagtos.IsEmpty) Then
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


