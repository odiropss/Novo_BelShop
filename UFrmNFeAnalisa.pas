unit UFrmNFeAnalisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  xmldom, XMLIntf, msxmldom, XMLDoc, JvExControls, JvXPCore, JvXPButtons,
  StdCtrls, ExtCtrls; // ==> Arqivo XML


type
  TFrmNFeAnalisa = class(TForm)
    Panel1: TPanel;
    Bt_XMLsAnaliza: TJvXPButton;
    mMemXMLNFe: TMemo;
    Lab_Processar: TLabel;
    Lab_Processados: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Lab_NEncontrados: TLabel;
    procedure Bt_XMLsAnalizaClick(Sender: TObject);

    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    // ANALISE DE XMLs =========================================================
    Function  XMLsAnalisaBuscaXMLs: Boolean;
    Procedure XMLsAnalisaXMLs(sArquivoXML: String);
    //==========================================================================

    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmNFeAnalisa: TFrmNFeAnalisa;

implementation

uses UDMNFeAnaliza, DK_Procs1;

{$R *.dfm}
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// ANALISE DE XMLs - Analisa Arquivos XMLs >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmNFeAnalisa.XMLsAnalisaXMLs(sArquivoXML: String);
Var
  DOC:IXMLDocument;
  NodeChild: IXMLNode;

  MySql: String;

  // Dados da Nota
  sChAcesso,
  sNatOperacao,
  sModelo,
  sSerie,
  sNumNFe,
  sDtaEmissao,
  sDtaSaiEnt,
  svST,
  svFCPST,
  svProd,
  sVlrNFe,

  // Dados do Emitente
  sCodEmit,
  sEmitCNPJ,
  sEmitNome,
  sEmitFant,

  // Dados do Destinatário
  sCodEmpresa,
  sDestCNPJ,
  sDestNome,
  sDestFant,

  // Observação
  sObs
  : String;
begin
  // Le Arquivo XML ============================================================
  DOC:=LoadXMLDocument(sArquivoXML);

  // Dados da Nota =============================================================
  sChAcesso   :=Trim(DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['protNFe'].
                                                     ChildNodes.Nodes['infProt'].
                                                     ChildNodes.Nodes['chNFe'].Text);

  sNatOperacao:=Trim(DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                     ChildNodes.Nodes['infNFe'].
                                                     ChildNodes.Nodes['ide'].
                                                     ChildNodes.Nodes['natOp'].Text);

  sModelo     :=Trim(DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                     ChildNodes.Nodes['infNFe'].
                                                     ChildNodes.Nodes['ide'].
                                                     ChildNodes.Nodes['mod'].Text);

  sSerie      :=Trim(DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                     ChildNodes.Nodes['infNFe'].
                                                     ChildNodes.Nodes['ide'].
                                                     ChildNodes.Nodes['serie'].Text);

  sNumNFe     :=Trim(DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                     ChildNodes.Nodes['infNFe'].
                                                     ChildNodes.Nodes['ide'].
                                                     ChildNodes.Nodes['nNF'].Text);

  sDtaEmissao :=Trim(DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                     ChildNodes.Nodes['infNFe'].
                                                     ChildNodes.Nodes['ide'].
                                                     ChildNodes.Nodes['dhEmi'].Text);

  If Trim(sDtaEmissao)='' Then
   sDtaEmissao:=Trim(DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                     ChildNodes.Nodes['infNFe'].
                                                     ChildNodes.Nodes['ide'].
                                                     ChildNodes.Nodes['dEmi'].Text);

  sDtaEmissao :=Copy(sDtaEmissao,9,2)+'/'+Copy(sDtaEmissao,6,2)+'/'+Copy(sDtaEmissao,1,4);

  sDtaSaiEnt  :=Trim(DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                     ChildNodes.Nodes['infNFe'].
                                                     ChildNodes.Nodes['ide'].
                                                     ChildNodes.Nodes['dhSaiEnt'].Text);
  sDtaSaiEnt  :=Copy(sDtaSaiEnt,9,2)+'/'+Copy(sDtaSaiEnt,6,2)+'/'+Copy(sDtaSaiEnt,1,4);

  svST        :=Trim(DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                     ChildNodes.Nodes['infNFe'].
                                                     ChildNodes.Nodes['total'].
                                                     ChildNodes.Nodes['ICMSTot'].
                                                     ChildNodes.Nodes['vST'].Text);
  If Trim(svST)='' Then
   svST:='0.00';

  svFCPST     :=Trim(DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                     ChildNodes.Nodes['infNFe'].
                                                     ChildNodes.Nodes['total'].
                                                     ChildNodes.Nodes['ICMSTot'].
                                                     ChildNodes.Nodes['vFCPST'].Text);
  If Trim(svFCPST)='' Then
   svFCPST:='0.00';

  svProd      :=Trim(DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                     ChildNodes.Nodes['infNFe'].
                                                     ChildNodes.Nodes['total'].
                                                     ChildNodes.Nodes['ICMSTot'].
                                                     ChildNodes.Nodes['vProd'].Text);
  If Trim(svProd)='' Then
   svProd:='0.00';

  sVlrNFe     :=Trim(DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                     ChildNodes.Nodes['infNFe'].
                                                     ChildNodes.Nodes['total'].
                                                     ChildNodes.Nodes['ICMSTot'].
                                                     ChildNodes.Nodes['vNF'].Text);


  // Dados do Emitente =========================================================
  sEmitCNPJ   :=Trim(DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                   ChildNodes.Nodes['infNFe'].
                                                   ChildNodes.Nodes['emit'].
                                                   ChildNodes.Nodes['CNPJ'].Text);
  sEmitCNPJ   :=FormatFloat('00000000000000',StrToInt64(sEmitCNPJ));

  sEmitNome   :=Trim(DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                   ChildNodes.Nodes['infNFe'].
                                                   ChildNodes.Nodes['emit'].
                                                   ChildNodes.Nodes['xNome'].Text);

  sEmitFant   :=Trim(DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                   ChildNodes.Nodes['infNFe'].
                                                   ChildNodes.Nodes['emit'].
                                                   ChildNodes.Nodes['xFant'].Text);

  // Dados do Destinatário =====================================================
  sDestCNPJ   :=Trim(DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                   ChildNodes.Nodes['infNFe'].
                                                   ChildNodes.Nodes['dest'].
                                                   ChildNodes.Nodes['CNPJ'].Text);
  sDestCNPJ   :=FormatFloat('00000000000000',StrToInt64(sDestCNPJ));

  sDestNome   :=Trim(DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                   ChildNodes.Nodes['infNFe'].
                                                   ChildNodes.Nodes['dest'].
                                                   ChildNodes.Nodes['xNome'].Text);
  DOC.XML.Clear;

//  If sNumNFe='204002' Then
//   Lab_Processados.Caption:=Lab_Processados.Caption;
//
  If (Trim(Lab_Processados.Caption)='8572') Then
   Lab_Processados.Caption:=Lab_Processados.Caption;

  sObs:='';
  // Busca Codigo da Empresa ===================================================
  MySql:=' SELECT l.empresa, l.nome_emp'+
         ' FROM LINXLOJAS l'+
         ' WHERE l.cnpj_emp='+QuotedStr(sDestCNPJ);
  DMNFeAnaliza.SQLQuery1.Close;
  DMNFeAnaliza.SQLQuery1.SQL.Clear;
  DMNFeAnaliza.SQLQuery1.SQL.Add(MySql);
  DMNFeAnaliza.SQLQuery1.Open;
  sCodEmpresa:=DMNFeAnaliza.SQLQuery1.FieldByName('empresa').AsString;
  sDestFant  :=DMNFeAnaliza.SQLQuery1.FieldByName('nome_emp').AsString;
  DMNFeAnaliza.SQLQuery1.Close;

  // Verifica se Existe a Loja Destinatario ====================================
  If (Trim(sCodEmpresa)='') Or (Trim(sCodEmpresa)='0') Then
  Begin
    sCodEmpresa:='9999';
    sObs:='Destinatário Não Encontrado.';
  End;

  // Busca Codigo da Empresa de Entrada ========================================
  MySql:=' SELECT f.cod_cliente'+
         ' FROM LINXCLIENTESFORNEC f'+
         ' WHERE f.doc_cliente='+QuotedStr(sEmitCNPJ);
  DMNFeAnaliza.SQLQuery1.Close;
  DMNFeAnaliza.SQLQuery1.SQL.Clear;
  DMNFeAnaliza.SQLQuery1.SQL.Add(MySql);
  DMNFeAnaliza.SQLQuery1.Open;
  sCodEmit:=DMNFeAnaliza.SQLQuery1.FieldByName('cod_cliente').AsString;
  DMNFeAnaliza.SQLQuery1.Close;

  // Verifica se Existe a Loja Destinatario ====================================
  If (Trim(sCodEmit)='') Or (Trim(sCodEmit)='0') Then
  Begin
    sCodEmit:='9999';
    sObs:=Trim(sObs)+' - Emitente Não Encontrado.';
  End;

  // Verifica se Existe a Nota no Sistema Linx =================================
//  MySql:=' SELECT mv.empresa'+
//         ' FROM LINXMOVIMENTO mv'+
//         ' WHERE mv.excluido =''N'''+
//         ' AND   mv.cancelado=''N'''+
//         ' AND   ('+
//         '        ((COALESCE(mv.chave_nf,'''')='+QuotedStr(sChAcesso)+') AND (COALESCE(mv.documento,0)='+sNumNFe+'))'+
//         '        OR'+
//         '        ((COALESCE(mv.chave_nf,'''')='''') AND (COALESCE(mv.documento,0)='+sNumNFe+'))'+
//         '       )'+
//         ' AND   mv.empresa='+sCodEmpresa+
//         ' AND   mv.codigo_cliente='+sCodEmit+
//         ' GROUP BY 1'+
//
//         ' HAVING ('+
//         '         (TRUNC(SUM(mv.valor_total)) = TRUNC('+sVlrNFe+'))'+
//         '         OR'+
//         '         (TRUNC(SUM(mv.valor_total)) = TRUNC('+sVlrNFe+' - '+svFCPST+'))'+
//         '         OR'+
//         '         (TRUNC(sum(mv.quantidade * mv.preco_unitario)) = TRUNC('+svProd+'))'+
//         '        )';
//  DMNFeAnaliza.SQLQuery1.Close;
//  DMNFeAnaliza.SQLQuery1.SQL.Clear;
//  DMNFeAnaliza.SQLQuery1.SQL.Add(MySql);
//  DMNFeAnaliza.SQLQuery1.Open;

  MySql:=' SELECT mv.empresa'+
         ' FROM LINXMOVIMENTO mv'+
         ' WHERE mv.excluido =''N'''+
         ' AND   mv.cancelado=''N'''+
         ' AND   ('+
         '        ((COALESCE(mv.chave_nf,'''')='+QuotedStr(sChAcesso)+') AND (COALESCE(mv.documento,0)='+sNumNFe+'))'+
         '        OR'+
         '        ((COALESCE(mv.chave_nf,'''')='''') AND (COALESCE(mv.documento,0)='+sNumNFe+'))'+
         '       )'+
         ' AND   mv.empresa='+sCodEmpresa+
         ' AND   mv.codigo_cliente='+sCodEmit+
         ' GROUP BY 1'+

         ' HAVING (TRUNC(SUM(mv.valor_total)) = TRUNC('+sVlrNFe+'))';
  DMNFeAnaliza.SQLQuery1.Close;
  DMNFeAnaliza.SQLQuery1.SQL.Clear;
  DMNFeAnaliza.SQLQuery1.SQL.Add(MySql);
  DMNFeAnaliza.SQLQuery1.Open;

  If DMNFeAnaliza.SQLQuery1.IsEmpty Then
  Begin
    MySql:=' SELECT mv.empresa'+
           ' FROM LINXMOVIMENTO mv'+
           ' WHERE mv.excluido =''N'''+
           ' AND   mv.cancelado=''N'''+
           ' AND   ('+
           '        ((COALESCE(mv.chave_nf,'''')='+QuotedStr(sChAcesso)+') AND (COALESCE(mv.documento,0)='+sNumNFe+'))'+
           '        OR'+
           '        ((COALESCE(mv.chave_nf,'''')='''') AND (COALESCE(mv.documento,0)='+sNumNFe+'))'+
           '       )'+
           ' AND   mv.empresa='+sCodEmpresa+
           ' AND   mv.codigo_cliente='+sCodEmit+
           ' GROUP BY 1'+

           ' HAVING (TRUNC(SUM(mv.valor_total)) = TRUNC('+sVlrNFe+' - '+svFCPST+'))';
    DMNFeAnaliza.SQLQuery1.Close;
    DMNFeAnaliza.SQLQuery1.SQL.Clear;
    DMNFeAnaliza.SQLQuery1.SQL.Add(MySql);
    DMNFeAnaliza.SQLQuery1.Open;
  End; // If DMNFeAnaliza.SQLQuery1.IsEmpty Then

  If DMNFeAnaliza.SQLQuery1.IsEmpty Then
  Begin
    MySql:=' SELECT mv.empresa'+
           ' FROM LINXMOVIMENTO mv'+
           ' WHERE mv.excluido =''N'''+
           ' AND   mv.cancelado=''N'''+
           ' AND   ('+
           '        ((COALESCE(mv.chave_nf,'''')='+QuotedStr(sChAcesso)+') AND (COALESCE(mv.documento,0)='+sNumNFe+'))'+
           '        OR'+
           '        ((COALESCE(mv.chave_nf,'''')='''') AND (COALESCE(mv.documento,0)='+sNumNFe+'))'+
           '       )'+
           ' AND   mv.empresa='+sCodEmpresa+
           ' AND   mv.codigo_cliente='+sCodEmit+
           ' GROUP BY 1'+

           ' HAVING (TRUNC(sum(mv.quantidade * mv.preco_unitario)) = TRUNC('+svProd+'))';
    DMNFeAnaliza.SQLQuery1.Close;
    DMNFeAnaliza.SQLQuery1.SQL.Clear;
    DMNFeAnaliza.SQLQuery1.SQL.Add(MySql);
    DMNFeAnaliza.SQLQuery1.Open;
  End; // If DMNFeAnaliza.SQLQuery1.IsEmpty Then

  If DMNFeAnaliza.SQLQuery1.IsEmpty Then
  Begin
    Lab_NEncontrados.Caption:=IntToStr(StrToInt(Lab_NEncontrados.Caption)+1);

    mMemXMLNFe.Lines.Add(sCodEmpresa+';'+
                         sDestCNPJ+';'+
                         sDestNome+';'+
                         sDestFant+';'+
                         sEmitCNPJ+';'+
                         sEmitNome+';'+
                         sEmitFant+';'+
                         sChAcesso+';'+
                         sNatOperacao+';'+
                         sModelo+';'+
                         sSerie+';'+
                         sNumNFe+';'+
                         sDtaEmissao+';'+
                         sDtaSaiEnt+';'+
                         svFCPST+';'+
                         svProd+';'+
                         sVlrNFe+';'+
                         Trim(sObs)+';');
  End; // If DMNFeAnaliza.SQLQuery1.IsEmpty Then
  DMNFeAnaliza.SQLQuery1.Close;


End; // ANALISE DE XMLs - Analisa Arquivos XMLs >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// ANALISE DE XMLs - Busca Arquivos XMLs >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmNFeAnalisa.XMLsAnalisaBuscaXMLs: Boolean;
Var
  SR: TSearchRec;
  DOC:IXMLDocument;

  i, iConta: Integer;

  dDtaInicio, dDtaFim,
  dDtaCiacao: TDate;

  s, sDtaDocto: String;
Begin
  Result:=True;

  // Conta Arquivo da Pasta ====================================================
  Lab_Processar.Caption:=IntToStr(PastaContaArquivos(sgPastaXMLArquivei+'*.*'));
  Lab_Processados.Caption:='0';
  Lab_NEncontrados.Caption:='0';

  // Inicializa Período ========================================================
  dDtaInicio:=EncodeDate(2019, 1, 1);
  s:=DateToStr(dDtaInicio);
  dDtaFim   :=StrToDate(DateToStr(DataHoraServidorFI(DMNFeAnaliza.SQLQuery1)-5));

  // Inicializa Memo para Nome de Arquivos XMLs ================================
  mMemXMLNFe.Lines.Clear;
  mMemXMLNFe.Lines.Add('CodEmpresa;DestCNPJ;DestNome;DestFant+;EmitCNPJ;sEmitNome;'+
                       'EmitFant;ChAcesso;NatOperacao;Modelo;Serie;NumNFe;DtaEmissao;'+
                       'DtaSaiEnt;vFCPST;vProd;VlrNFe;Observação;');

  i := FindFirst(IncludeTrailingPathDelimiter(sgPastaXMLArquivei)+'*.xml', faAnyFile, SR);
  iConta:=0;
  While i = 0 do
  Begin
    Application.ProcessMessages;

    If (SR.Attr and faDirectory) <> faDirectory then
    Begin
      // Le Arquivo XML ============================================================
      DOC:=LoadXMLDocument(sgPastaXMLArquivei+Trim(SR.Name));

      sDtaDocto:=Trim(DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                      ChildNodes.Nodes['infNFe'].
                                                      ChildNodes.Nodes['ide'].
                                                      ChildNodes.Nodes['dhEmi'].Text);

      If Trim(sDtaDocto)='' Then
       sDtaDocto:=Trim(DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                      ChildNodes.Nodes['infNFe'].
                                                      ChildNodes.Nodes['ide'].
                                                      ChildNodes.Nodes['dEmi'].Text);

      sDtaDocto :=Copy(sDtaDocto,9,2)+'/'+Copy(sDtaDocto,6,2)+'/'+Copy(sDtaDocto,1,4);

      DOC.XML.Clear;

     If (Trim(Lab_Processados.Caption)='8572') Then
      Lab_Processados.Caption:=Lab_Processados.Caption;

      If (StrToDate(sDtaDocto)>=dDtaInicio) And (StrToDate(sDtaDocto)<=dDtaFim) Then
      Begin
        XMLsAnalisaXMLs(sgPastaXMLArquivei+Trim(SR.Name));
      End;
      // Data da Criação
      // dDtaCiacao:=StrToDate(DateToStr(FileDateToDateTime(FileAgeCreate(sgPastaXMLArquivei+SR.Name))));
      // Data da Alteração
//      dDtaCiacao:=StrToDate(DateToStr(FileDateToDateTime(FileAge(sgPastaXMLArquivei+SR.Name))));
//      If (dDtaCiacao>=dDtaInicio) And (dDtaCiacao<=dDtaFim) Then
//      Begin
//        XMLsAnalisaXMLs(sgPastaXMLArquivei+Trim(SR.Name));
//      End;
    End; // If (SR.Attr and faDirectory) <> faDirectory then
    i := FindNext(SR);

    Inc(iConta);
    Lab_Processados.Caption:=IntToStr(iConta);

//    If iConta=50 Then
//     Break;
  End; // while i = 0 do

  // Verifica se Encontrou XML's ===============================================
  If mMemXMLNFe.Lines.Count<1 Then
  Begin
    Result:=False;
    msg('XML NÃO Encontrado na'+cr+cr+'Pasta Selecionada !!','A');
  End; // If mMemXMLNFe.Lines.Count<1 Then

End; // ANALISE DE XMLs - Busca Arquivos XMLs >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


procedure TFrmNFeAnalisa.Bt_XMLsAnalizaClick(Sender: TObject);
begin
  mMemXMLNFe.SetFocus;

  if msg('Iniciar ?','C')=2 Then
   Exit;

  mMemXMLNFe.Lines.Clear;

  If Trim(sgPastaXMLArquivei)='' Then
  Begin
    msg('Pasta dos XMLs Inválida !!','A');
    Application.Terminate;
    Exit;
  End; // If Trim(sgPastaXMLArquivei)='' Then

  //============================================================================
  // Busca Arquivos XMLs =======================================================
  //============================================================================
  If Not XMLsAnalisaBuscaXMLs Then
  Begin
    msg('ERRO - XMLsAnalisaBuscaXMLs','A');
  End;
  // Busca Arquivos XMLs =======================================================
  //============================================================================

  msg('FIM','A');
end;

end.
