unit UFrmDebCredST;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvGradientCaption, AppEvnts, jpeg, JvExControls, JvXPCore,
  JvXPButtons, ExtCtrls, ComCtrls, Grids, DBGrids, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls, dxSkinsdxStatusBarPainter,
  dxStatusBar, JvExStdCtrls, JvRadioButton,
  xmldom, XMLIntf, msxmldom, XMLDoc, // ==> Arqivo XML
  FileCtrl, Mask, ToolEdit, CurrEdit;

type
  TFrmDebCredST = class(TForm)
    CorCaptionForm: TJvGradientCaption;
    ApplicationEvents1: TApplicationEvents;
    PC_DebCredICMSST: TPageControl;
    Ts_FornBcICMSST: TTabSheet;
    Ts_FornTotais: TTabSheet;
    Ts_FornProdutos: TTabSheet;
    Dbg_TotaisForn: TDBGrid;
    Dbg_ProdutosForn: TDBGrid;
    Dbg_VlrBcICMSST: TDBGrid;
    Ts_XMLsAnalisa: TTabSheet;
    Pan_Solicitacoes: TPanel;
    Panel3: TPanel;
    Bt_Sair: TJvXPButton;
    Bt_VlrBcICMSST: TJvXPButton;
    Bt_Clipboard: TJvXPButton;
    Bt_ProdutosForn: TJvXPButton;
    Bt_TotaisForn: TJvXPButton;
    Panel2: TPanel;
    Gb_Periodo: TGroupBox;
    Label85: TLabel;
    DtEdtDtaInicio: TcxDateEdit;
    DtEdtDtaFim: TcxDateEdit;
    Gb_NFeCompras: TGroupBox;
    Rb_NFeAmbas: TJvRadioButton;
    Rb_NFeSem: TJvRadioButton;
    Rb_NFeCom: TJvRadioButton;
    dxStatusBar2: TdxStatusBar;
    Pan_XMLslBottom: TPanel;
    Bt_XMLsSair: TJvXPButton;
    Gb_XMLsSolicitacao: TGroupBox;
    Bt_XMLsPasta: TJvXPButton;
    EdtXMLsPasta: TEdit;
    Bt_XMLsAnaliza: TJvXPButton;
    Dbg_XMLs: TDBGrid;
    OdirPanApres: TPanel;
    Label1: TLabel;
    DtEdtXMLsDownLoad: TcxDateEdit;
    Shape1: TShape;
    Label2: TLabel;
    EdtXMLsEncontrados: TCurrencyEdit;
    Label3: TLabel;
    EdtXMLsProcessados: TCurrencyEdit;
    Bt_XMLsSalvar: TJvXPButton;
    Label11: TLabel;
    EdtXMLsSelecionados: TCurrencyEdit;
    Gb_XMLsFiltros: TGroupBox;
    Label6: TLabel;
    Cbx_XMLsCST: TComboBox;
    Label7: TLabel;
    Cbx_XMLsvST: TComboBox;
    Label8: TLabel;
    Cbx_XMLsVlrvST: TComboBox;
    Label9: TLabel;
    Cbx_XMLsvFCPSTRet: TComboBox;
    Label10: TLabel;
    Cbx_XMLsVlrvFCPSTRet: TComboBox;
    Label5: TLabel;
    Cbx_XMLsUFEmit: TComboBox;
    Label12: TLabel;
    Cbx_XMLsUFDest: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure Bt_SairClick(Sender: TObject);
    procedure Bt_VlrBcICMSSTClick(Sender: TObject);
    procedure Bt_TotaisFornClick(Sender: TObject);
    procedure Bt_ProdutosFornClick(Sender: TObject);

    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    Procedure TabSheetLibera(sNomeTab: String);

    Function  PeriodoApropriacao: Boolean;

    Procedure SqlProdutos;


    // ANALISE DE XMLs =========================================================
    Procedure XMLsAnalisaInicializa;
    Function  XMLsAnalisaBuscaXMLs: Boolean;
    Procedure XMLsAnalisaXMLs;
    //==========================================================================

    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    procedure Dbg_VlrBcICMSSTColEnter(Sender: TObject);
    procedure Dbg_VlrBcICMSSTKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_ProdutosFornColEnter(Sender: TObject);
    procedure Dbg_TotaisFornColEnter(Sender: TObject);
    procedure PC_DebCredICMSSTChange(Sender: TObject);
    procedure Dbg_VlrBcICMSSTDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DtEdtDtaInicioPropertiesEditValueChanged(Sender: TObject);
    procedure Dbg_TotaisFornDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_TotaisFornDblClick(Sender: TObject);
    procedure Dbg_TotaisFornTitleClick(Column: TColumn);
    procedure Dbg_VlrBcICMSSTTitleClick(Column: TColumn);
    procedure Dbg_ProdutosFornDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Bt_ClipboardClick(Sender: TObject);
    procedure Rb_NFeSemClick(Sender: TObject);
    procedure Rb_NFeSemKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_XMLsPastaClick(Sender: TObject);
    procedure Bt_XMLsAnalizaClick(Sender: TObject);
    procedure Dbg_XMLsColEnter(Sender: TObject);
    procedure Dbg_XMLsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_XMLsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DtEdtXMLsDownLoadPropertiesChange(Sender: TObject);
    procedure Cbx_XMLsUFEmitChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDebCredST: TFrmDebCredST;

  bgSairDC: Boolean;

  mMemoForn: TMemo;

implementation

uses DK_Procs1, UDMDebCredST, UFrmBelShop, SysConst, DB;

{$R *.dfm}
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// ANALISE DE XMLs - Inicializa Client e ComboBox >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmDebCredST.XMLsAnalisaInicializa;
Begin
  EdtXMLsEncontrados.AsInteger :=0;
  EdtXMLsProcessados.AsInteger :=0;
  EdtXMLsSelecionados.AsInteger:=0;

  // Iniciliza Client ==========================================================
  If DMDebCredST.CDS_V_XMLsAnalisa.Active Then
   DMDebCredST.CDS_V_XMLsAnalisa.Close;

  DMDebCredST.CDS_V_XMLsAnalisa.CreateDataSet;
  DMDebCredST.CDS_V_XMLsAnalisa.Filtered:=False;
  DMDebCredST.CDS_V_XMLsAnalisa.Filter:='';
  DMDebCredST.CDS_V_XMLsAnalisa.IndexFieldNames:='NOME';
  DMDebCredST.CDS_V_XMLsAnalisa.Open;

  // Iniciliza ComboBox ========================================================
  Cbx_XMLsUFEmit.Items.Clear;
  Cbx_XMLsUFEmit.Items.Add('Todos');
  Cbx_XMLsUFEmit.ItemIndex:=0;

  Cbx_XMLsUFDest.Items.Clear;
  Cbx_XMLsUFDest.Items.Add('Todos');
  Cbx_XMLsUFDest.ItemIndex:=0;

  Cbx_XMLsCST.Items.Clear;
  Cbx_XMLsCST.Items.Add('Todos');
  Cbx_XMLsCST.ItemIndex:=0;

  Cbx_XMLsvST.ItemIndex:=2;
  Cbx_XMLsVlrvST.ItemIndex:=2;

  Cbx_XMLsvFCPSTRet.ItemIndex:=2;
  Cbx_XMLsVlrvFCPSTRet.ItemIndex:=2;

  Gb_XMLsFiltros.Enabled:=False;
End; // ANALISE DE XMLs - Inicializa Client e ComboBox >>>>>>>>>>>>>>>>>>>>>>>>>

// ANALISE DE XMLs - Analiza os Arquivos XMLs >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmDebCredST.XMLsAnalisaXMLs;
Var
  DOC:IXMLDocument;
  NodeChild: IXMLNode;

  i, ii, iii: Integer;

  sEncontrado, // Campo Encontrado
  sNome, sCNPJ, sUFEmit, sUFDest, sFone, // Dados do Emitente
  svST, sValorST, svFCPSTRet, sValorFCPSTRet // Valores para LOCATE
  : String;

  bvST,          // Se Encontrou Tag vST
  bValorST,      // Se Consta Valor do ICMS ST
  bvFCPSTRet,    // Se Encontrou Tag vFCPSTRet - Valor Fundo de Combate a Pobreza Retido Anteriormente por Substituição Tributária
  bValorFCPSTRet // Se Consta Valor Fundo de Combate a Pobreza Retido Anteriormente por Substituição Tributária
  : Boolean;
begin
{
=======================================================
Empresas NÃO optante pelo Simples Nacional
=======================================================
ICMS10 - Grupo de Tributação do ICMS = 10
X.10

ICMS30 - Grupo de Tributação do ICMS = 30
X.30

ICMS60 - Grupo de Tributação do ICMS = 60
X.60

ICMS70 - Grupo de Tributação do ICMS = 70
X.70

=======================================================
Empresas Optantes pelo Simples Nacional
=======================================================
ICMSSN201 - Grupo CRT=1 ? Simples Nacional e CSOSN=201
X.201

ICMSSN202 - Grupo CRT=1 ? Simples Nacional e CSOSN=202 ou 203
X.202
X.203

ICMSSN500 - Grupo CRT=1 ? Simples Nacional e CSOSN = 500
X.500

ICMSSN900 - TAG de Grupo CRT=1 ? Simples Nacional e CSOSN=900
X.900
}
  OdirPanApres.Caption:='AGUARDE !! Analizando Arquivos XMLs...';
  Refresh;

  EdtXMLsEncontrados.AsInteger:=mMemoForn.Lines.Count;

  FrmBelShop.MontaProgressBar(True, FrmDebCredST);
  pgProgBar.Properties.Max:=mMemoForn.Lines.Count;
  pgProgBar.Position:=0;

  //============================================================================
  // Loop dos Arquivos XMLs ====================================================
  //============================================================================
  For iii:=0 to mMemoForn.Lines.Count-1 do
  Begin
    Application.ProcessMessages;

    If Trim(mMemoForn.Lines[iii])='' Then
    Begin
      Break;
      Exit;
    End;

    // Le Arquivo XML ==========================================================
    DOC:=LoadXMLDocument(EdtXMLsPasta.Text+Trim(mMemoForn.Lines[iii]));

    // Inicializa Variaveis ====================================================
    sEncontrado:=''; // Campo Encontrado
    // Dados do Emitente
    sNome:='';
    sCNPJ:='';
    sUFEmit:='';
    sUFDest:='';
    sFone:='';
    // Valores para LOCATE
    svST:='';
    sValorST:='';
    svFCPSTRet:='';
    sValorFCPSTRet:='';
    // Booleanas
    bvST:=False;           // Se Encontrou Valor do ICMS ST
    bValorST:=False;       // Se Consta Valor do ICMS ST
    bvFCPSTRet:=False;     // Se Encontrou Valor Fundo de Combate a Pobreza Retido Anteriormente por Substituição Tributária
    bValorFCPSTRet:=False; // Se Consta Valor Fundo de Combate a Pobreza Retido Anteriormente por Substituição Tributária

    // Le Dados dos Produtos ===================================================
    For i:=0 to DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                ChildNodes.Nodes['infNFe'].
                                                ChildNodes.Count-1 do
    Begin
      NodeChild:=DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                 ChildNodes.Nodes['infNFe'].
                                                 ChildNodes[i];

      //========================================================================
      // Analisa os Produtos ===================================================
      //========================================================================
      If (NodeChild.NodeName='det') And (sEncontrado='') Then
      Begin
        For ii:=0 to DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                     ChildNodes.Nodes['infNFe'].
                                                     ChildNodes[i].
                                                     ChildNodes.Nodes['imposto'].
                                                     ChildNodes.Nodes['ICMS'].ChildNodes.Count-1 do
        Begin
          NodeChild:=DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                     ChildNodes.Nodes['infNFe'].
                                                     ChildNodes[i].
                                                     ChildNodes.Nodes['imposto'].
                                                     ChildNodes.Nodes['ICMS'].ChildNodes[ii];

          // ICMS10 - Grupo de Tributação do ICMS = 10 =========================
          If NodeChild.NodeName='ICMS10' Then
          Begin
            sEncontrado:='ICMS10';
            Break;
          End; // If ChildNodes1.NodeName='ICMS10' Then

          // ICMS30 - Grupo de Tributação do ICMS = 30 =========================
          If NodeChild.NodeName='ICMS30' Then
          Begin
            sEncontrado:='ICMS30';
            Break;
          End; // If ChildNodes1.NodeName='ICMS30' Then

          // ICMS60 - Grupo de Tributação do ICMS = 60 =========================
          If NodeChild.NodeName='ICMS60' Then
          Begin
            sEncontrado:='ICMS60';
            Break;
          End; // If ChildNodes1.NodeName='ICMS60' Then

          // ICMS70 - Grupo de Tributação do ICMS = 70 =========================
          If NodeChild.NodeName='ICMS70' Then
          Begin
            sEncontrado:='ICMS70';
            Break;
          End; // If ChildNodes1.NodeName='ICMS70' Then

          // ICMSSN201 - Grupo CRT=1 ? Simples Nacional e CSOSN=201 ============
          If NodeChild.NodeName='ICMSSN201' Then
          Begin
            sEncontrado:='ICMSSN201';
            Break;
          End; // If ChildNodes1.NodeName='ICMSSN201' Then

          // ICMSSN202 - Grupo CRT=1 ? Simples Nacional e CSOSN=202 ou 203 =====
          If NodeChild.NodeName='ICMSSN202' Then
          Begin
            sEncontrado:='ICMSSN202';
            Break;
          End; // If ChildNodes1.NodeName='ICMSSN202' Then

          // ICMSSN500 - Grupo CRT=1 ? Simples Nacional e CSOSN = 500 ==========
          If NodeChild.NodeName='ICMSSN500' Then
          Begin
            sEncontrado:='ICMSSN500';
            Break;
          End; // If ChildNodes1.NodeName='ICMSSN500' Then

          // ICMSSN900 - TAG de Grupo CRT=1 ? Simples Nacional e CSOSN=900 =====
          If NodeChild.NodeName='ICMSSN900' Then
          Begin
            sEncontrado:='ICMSSN900';
            Break;
          End; // If ChildNodes1.NodeName='ICMSSN900' Then
        End; // For ii:=0 to DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe']....
      End; // If NodeChild.NodeName='det' Then
      // Analisa os Produtos ===================================================
      //========================================================================

      //========================================================================
      // Analisa Totais de ICMS ================================================
      //========================================================================
      If (NodeChild.NodeName='total') And (sEncontrado<>'') Then
      Begin
        For ii:=0 to DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                     ChildNodes.Nodes['infNFe'].
                                                     ChildNodes[i].
                                                     ChildNodes.Nodes['ICMSTot'].ChildNodes.Count-1 do
        Begin
          NodeChild:=DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                     ChildNodes.Nodes['infNFe'].
                                                     ChildNodes[i].
                                                     ChildNodes.Nodes['ICMSTot'].ChildNodes[ii];

          // Se Encontrou Valor do ICMS ST =====================================
          If NodeChild.NodeName='vST' Then
          Begin
            bvST:=True;

            // Se Consta Valor do ICMS ST
            If DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].ChildNodes.Nodes['infNFe'].
                                                     ChildNodes[i].ChildNodes.Nodes['ICMSTot'].ChildNodes[ii].NodeValue<>0 Then
             bValorST:=True;
          End; // If NodeChild.NodeName='vST' Then

          // Se Encontrou Valor Fundo de Combate a Pobreza Retido Anteriormente por Substituição Tributária
          If NodeChild.NodeName='vFCPSTRet' Then
          Begin
            bvFCPSTRet:=True;

            // Se Consta Valor Fundo de Combate a Pobreza Retido Anteriormente por Substituição Tributária
            If DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].ChildNodes.Nodes['infNFe'].
                                                     ChildNodes[i].ChildNodes.Nodes['ICMSTot'].ChildNodes[ii].NodeValue<>0 Then
             bValorFCPSTRet:=True;
          End; // If NodeChild.NodeName='vST' Then

        End; // For ii:=0 to DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe']...
      End; // If (NodeChild.NodeName='total') And (sEncontrado<>'') Then

    End; // For i:=0 to DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe']....

    //==========================================================================
    // Se Encontrou ICMS CST ===================================================
    //==========================================================================
    If (sEncontrado<>'') And ((Not bvST) Or (Not bValorST) Or (Not bvFCPSTRet) Or (Not bValorFCPSTRet)) Then
    Begin
      svST          :='NAO'; If bvST           Then svST          :='SIM';
      sValorST      :='NAO'; If bValorST       Then sValorST      :='SIM';
      svFCPSTRet    :='NAO'; If bvFCPSTRet     Then svFCPSTRet    :='SIM';
      sValorFCPSTRet:='NAO'; If bValorFCPSTRet Then sValorFCPSTRet:='SIM';

      //========================================================================
      // Dados do Emitente =====================================================
      //========================================================================
      sNome  :=Trim(DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                    ChildNodes.Nodes['infNFe'].
                                                    ChildNodes.Nodes['emit'].
                                                    ChildNodes.Nodes['xNome'].Text);
      sCNPJ  :=Trim(DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                    ChildNodes.Nodes['infNFe'].
                                                    ChildNodes.Nodes['emit'].
                                                    ChildNodes.Nodes['CNPJ'].Text);
      sUFEmit:=Trim(DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                    ChildNodes.Nodes['infNFe'].
                                                    ChildNodes.Nodes['emit'].
                                                    ChildNodes.Nodes['enderEmit'].
                                                    ChildNodes.Nodes['UF'].Text);

      sFone  :=Trim(DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                    ChildNodes.Nodes['infNFe'].
                                                    ChildNodes.Nodes['emit'].
                                                    ChildNodes.Nodes['enderEmit'].
                                                    ChildNodes.Nodes['fone'].Text);
      // Dados do Emitente =====================================================
      //========================================================================

      //========================================================================
      // Dados do Destinatario =================================================
      //========================================================================
      sUFDest:=Trim(DOC.ChildNodes.Nodes['nfeProc'].ChildNodes.Nodes['NFe'].
                                                    ChildNodes.Nodes['infNFe'].
                                                    ChildNodes.Nodes['dest'].
                                                    ChildNodes.Nodes['enderDest'].
                                                    ChildNodes.Nodes['UF'].Text);
      // Dados do Destinatario =================================================
      //========================================================================

      //========================================================================
      // Verifica se Emitente Já Cadastrado ====================================
      //========================================================================
       If Not DMDebCredST.CDS_V_XMLsAnalisa.Locate('CNPJ; CST; TAG_VST; VALOR_ST; TAG_VFCPSTRET; VALOR_VFCPSTRET',
                                       VarArrayOf([sCNPJ, sEncontrado, svST, sValorST, svFCPSTRet, sValorFCPSTRet]),[]) Then
       Begin
         //=====================================================================
         // Insere UF Emitente =================================================
         //=====================================================================
         bgSiga:=True;
         For i:=0 to Cbx_XMLsUFEmit.Items.Count-1 do
         Begin
           If Cbx_XMLsUFEmit.Items[i]=sUFEmit Then
           Begin
             bgSiga:=False;
             Break;
           End; // If Cbx_XMLsUFEmit.Items[i]=sUFEmit Then
         End; // For i:=0 to Cbx_XMLsUFEmit.Items.Count-1 do

         If bgSiga Then
          Cbx_XMLsUFEmit.Items.Add(sUFEmit);
         // Insere UF Emitente =================================================
         //=====================================================================

         //=====================================================================
         // Insere UF Destinatario =============================================
         //=====================================================================
         bgSiga:=True;
         For i:=0 to Cbx_XMLsUFDest.Items.Count-1 do
         Begin
           If Cbx_XMLsUFDest.Items[i]=sUFDest Then
           Begin
             bgSiga:=False;
             Break;
           End; // If Cbx_XMLsUFDest.Items[i]=sUFDest Then
         End; // For i:=0 to Cbx_XMLsUFDest.Items.Count-1 do

         If bgSiga Then
          Cbx_XMLsUFDest.Items.Add(sUFDest);
         // Insere UF Destinatario =============================================
         //=====================================================================

         //=====================================================================
         // Insere CST =========================================================
         //=====================================================================
         bgSiga:=True;
         For i:=0 to Cbx_XMLsCST.Items.Count-1 do
         Begin
           If Cbx_XMLsCST.Items[i]=sEncontrado Then
           Begin
             bgSiga:=False;
             Break;
           End; // If Cbx_XMLsCST.Items[i]=sEncontrado Then
         End; // For i:=0 to Cbx_XMLsCST.Items.Count-1 do

         If bgSiga Then
          Cbx_XMLsCST.Items.Add(sEncontrado);
         // Insere CST =========================================================
         //=====================================================================

         //=====================================================================
         // Insere Fornecedor ==================================================
         //=====================================================================
         DMDebCredST.CDS_V_XMLsAnalisa.Insert;
         DMDebCredST.CDS_V_XMLsAnalisaNOME.AsString           :=sNome;
         DMDebCredST.CDS_V_XMLsAnalisaCNPJ.AsString           :=sCNPJ;
         DMDebCredST.CDS_V_XMLsAnalisaFONE.AsString           :=sFone;
         DMDebCredST.CDS_V_XMLsAnalisaUF_EMIT.AsString        :=sUFEmit;
         DMDebCredST.CDS_V_XMLsAnalisaUF_DEST.AsString        :=sUFDest;
         DMDebCredST.CDS_V_XMLsAnalisaCST.AsString            :=sEncontrado;
         DMDebCredST.CDS_V_XMLsAnalisaTAG_VST.AsString        :=svST;
         DMDebCredST.CDS_V_XMLsAnalisaVALOR_ST.AsString       :=sValorST;
         DMDebCredST.CDS_V_XMLsAnalisaTAG_VFCPSTRET.AsString  :=svFCPSTRet;
         DMDebCredST.CDS_V_XMLsAnalisaVALOR_VFCPSTRET.AsString:=sValorFCPSTRet;
         DMDebCredST.CDS_V_XMLsAnalisa.Post;
         // Insere Fornecedor ==================================================
         //=====================================================================
       End; // If Not DMDebCredST.CDS_V_XMLsAnalisa.Locate('CNPJ; TAG_VST; VALOR_ST; TAG_VFCPSTRET; VALOR_VFCPSTRET',...
      // Verifica se Emitente Já Cadastrado ====================================
      //========================================================================
    End; // If (sEncontrado<>'') And ((Not bvST) Or (Not bValorST) Or (Not bvFCPSTRet) Or (Not bValorFCPSTRet)) Then
    // Se Encontrou ICMS CST ===================================================
    //==========================================================================

    pgProgBar.Position:=iii+1;
    EdtXMLsProcessados.AsInteger:=iii+1;

  End; // For iii:=0 to mMemoForn.Lines.Count-1 do
  FrmBelShop.MontaProgressBar(False, FrmDebCredST);
  mMemoForn.Lines.Clear;
  mMemoForn.Width:=500;

  Dbg_XMLs.SetFocus;

  If DMDebCredST.CDS_V_XMLsAnalisa.IsEmpty Then
  Begin
    msg('Sem XML Analisado com Problema !!','A');
  End;
  // Loop dos Arquivos XMLs ====================================================
  //============================================================================

  //============================================================================
  // Libera Painel de Filtros ==================================================
  //============================================================================
  If Not DMDebCredST.CDS_V_XMLsAnalisa.IsEmpty Then
  Begin
    Gb_XMLsFiltros.Enabled:=True;
    EdtXMLsSelecionados.AsInteger:=DMDebCredST.CDS_V_XMLsAnalisa.RecordCount;

    msg('Analise de XMLs'+cr+cr+'Efetuada com SUCESSO !!','A');
   End; // If Not DMDebCredST.CDS_V_XMLsAnalisa.IsEmpty Then
  // Libera Painel de Filtros ==================================================
  //============================================================================

End; // ANALISE DE XMLs - Analiza os Arquivos XMLs >>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// ANALISE DE XMLs - Busca Arquivos XMLs >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmDebCredST.XMLsAnalisaBuscaXMLs: Boolean;
Var
  SR: TSearchRec;
  i: Integer;
  dDtaCiacao: TDate;
Begin
  Result:=True;

  // Monta Memo para Nome de Arquivos XMLs =====================================
  mMemoForn.Width:=1000;
  mMemoForn.Lines.Clear;

  i := FindFirst(IncludeTrailingPathDelimiter(EdtXMLsPasta.Text)+'*.xml', faAnyFile, SR);
  While i = 0 do
  Begin
    Application.ProcessMessages;

    If (SR.Attr and faDirectory) <> faDirectory then
    Begin
      dDtaCiacao:=StrToDate(DateToStr(FileDateToDateTime(FileAgeCreate(EdtXMLsPasta.Text+SR.Name))));
      If dDtaCiacao=DtEdtXMLsDownLoad.Date Then
      Begin
        mMemoForn.Lines.Add(SR.Name);
      End;
    End; // If (SR.Attr and faDirectory) <> faDirectory then
    i := FindNext(SR);
  End; // while i = 0 do

  // Verifica se Encontrou XML's ===============================================
  If mMemoForn.Lines.Count<1 Then
  Begin
    Result:=False;
    msg('XML NÃO Encontrado na'+cr+cr+'Pasta Selecionada !!','A');
  End; // If mMemoForn.Lines.Count<1 Then
End; // ANALISE DE XMLs - Busca Arquivos XMLs >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Monta Sql de Produtos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmDebCredST.SqlProdutos;
Var
  MySql: WideString;
  sForns: String;

  i: Integer;
Begin
  sForns:='';
  For i:=0 to mMemoForn.Lines.Count-1 do
  Begin
    If sForns<>'' Then
     sForns:=sForns+', '+mMemoForn.Lines[i];

    If sForns='' Then
     sForns:=mMemoForn.Lines[i];
  End; // For i:=0 to mMemo.Lines.Count-1 do

  If Trim(sForns)='' Then
  Begin
    If msg('Selecionar TODOS os Fornecedores !!'+cr+cr+'Esta CORRETO ??','C')=2 Then
     Exit;
  End; // If Trim(sForns)='' Then

  OdirPanApres.Caption:='AGUARDE !! Localizando Produtos/Fornecedores...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmDebCredST.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmDebCredST.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmDebCredST;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // 03 - PRODUTOS DE FORNECEDOR (POR FORNECEDOR SE SELECIONADO)
  // ------ Cabeçalho
  MySql:=' SELECT'+
         ' NULL COD_PRODUTO,'+
         ' ''Débito/Crédito ST - PRODUTOS'' NOME_PRODUTO,'+
         ' NULL VLR_ICMS_ST_VENDA,'+
         ' NULL VLR_ICMS_ST_COMPRA,'+
         ' NULL VLR_DEB_CRED_ICMS_ST,'+
         ' NULL DATA_DOCUMENTO,'+
         ' NULL DATA_LANCAMENTO,'+
         ' NULL DOCUMENTO,'+
         ' NULL SERIE,'+
         ' NULL MODELO_NF,'+
         ' NULL ID_CFOP,'+
         ' NULL CST_ICMS,'+
         ' NULL PER_ALIQ_ICMS,'+
         ' NULL VLR_ICMS,'+
         ' NULL PER_ALIQ_ICMS_ST,'+
         ' NULL VLR_ICMS_ST,'+
         ' NULL VLR_BASE_ICMS_ST,'+
         ' NULL VLR_OPERACAO,'+
         ' NULL MODALIDADE,'+
         ' NULL TIPO,'+
         ' NULL DES_NCM,'+
         ' NULL PER_ICMS,'+
         ' NULL PER_FCP,'+
         ' NULL PER_ICMS_EFETIVO,'+
         ' NULL UTILIZADO,'+
         ' NULL COD_FORNECEDOR,'+
         ' NULL NOME_FORNECDOR,'+
         ' 0 ORDEM'+
         ' FROM RDB$DATABASE'+

         ' UNION ALL'+

         // ------ Período
         ' SELECT'+
         ' NULL COD_PRODUTO,'+
         ' ''Período de: ''||CAST(LPAD(EXTRACT(DAY FROM CAST('+QuotedStr(sgDtaInicio)+' AS DATE)),2,''0'') AS VARCHAR(2))||''/''||'+
         '                   CAST(LPAD(EXTRACT(MONTH FROM CAST('+QuotedStr(sgDtaInicio)+' AS DATE)),2,''0'') AS VARCHAR(2))||''/''||'+
         '                   CAST(EXTRACT(YEAR FROM CAST('+QuotedStr(sgDtaInicio)+' AS DATE)) AS VARCHAR(4))||'+
         '                   '' A ''||'+
         '                   CAST(LPAD(EXTRACT(DAY FROM CAST('+QuotedStr(sgDtaFim)+' AS DATE)),2,''0'') AS VARCHAR(2))||''/''||'+
         '                   CAST(LPAD(EXTRACT(MONTH FROM CAST('+QuotedStr(sgDtaFim)+' AS DATE)),2,''0'') AS VARCHAR(2))||''/''||'+
         '                   CAST(EXTRACT(YEAR FROM CAST('+QuotedStr(sgDtaFim)+' AS DATE)) AS VARCHAR(4))'+
         '                   NOME_PRODUTO,'+
         ' NULL VLR_ICMS_ST_VENDA,'+
         ' NULL VLR_ICMS_ST_COMPRA,'+
         ' NULL VLR_DEB_CRED_ICMS_ST,'+
         ' NULL DATA_DOCUMENTO,'+
         ' NULL DATA_LANCAMENTO,'+
         ' NULL DOCUMENTO,'+
         ' NULL SERIE,'+
         ' NULL MODELO_NF,'+
         ' NULL ID_CFOP,'+
         ' NULL CST_ICMS,'+
         ' NULL PER_ALIQ_ICMS,'+
         ' NULL VLR_ICMS,'+
         ' NULL PER_ALIQ_ICMS_ST,'+
         ' NULL VLR_ICMS_ST,'+
         ' NULL VLR_BASE_ICMS_ST,'+
         ' NULL VLR_OPERACAO,'+
         ' NULL MODALIDADE,'+
         ' NULL TIPO,'+
         ' NULL DES_NCM,'+
         ' NULL PER_ICMS,'+
         ' NULL PER_FCP,'+
         ' NULL PER_ICMS_EFETIVO,'+
         ' NULL UTILIZADO,'+
         ' NULL COD_FORNECEDOR,'+
         ' NULL NOME_FORNECDOR,'+
         ' 1 ORDEM'+
         ' FROM RDB$DATABASE'+

         ' UNION ALL'+

         // ------ Linha em Branco
         ' SELECT'+
         ' NULL COD_PRODUTO,'+
         ' NULL NOME_PRODUTO,'+
         ' NULL VLR_ICMS_ST_VENDA,'+
         ' NULL VLR_ICMS_ST_COMPRA,'+
         ' NULL VLR_DEB_CRED_ICMS_ST,'+
         ' NULL DATA_DOCUMENTO,'+
         ' NULL DATA_LANCAMENTO,'+
         ' NULL DOCUMENTO,'+
         ' NULL SERIE,'+
         ' NULL MODELO_NF,'+
         ' NULL ID_CFOP,'+
         ' NULL CST_ICMS,'+
         ' NULL PER_ALIQ_ICMS,'+
         ' NULL VLR_ICMS,'+
         ' NULL PER_ALIQ_ICMS_ST,'+
         ' NULL VLR_ICMS_ST,'+
         ' NULL VLR_BASE_ICMS_ST,'+
         ' NULL VLR_OPERACAO,'+
         ' NULL MODALIDADE,'+
         ' NULL TIPO,'+
         ' NULL DES_NCM,'+
         ' NULL PER_ICMS,'+
         ' NULL PER_FCP,'+
         ' NULL PER_ICMS_EFETIVO,'+
         ' NULL UTILIZADO,'+
         ' NULL COD_FORNECEDOR,'+
         ' NULL NOME_FORNECDOR,'+
         ' 2 ORDEM'+
         ' FROM RDB$DATABASE'+

         ' UNION ALL'+

         // ------ Totais
         ' SELECT'+
         ' NULL COD_PRODUTO,'+
         ' ''TOTAIS'' NOME_PRODUTO,'+
         ' CAST(SUM(dc.vlr_icms_efetivo) AS NUMERIC(18,2)) TOT_ICMS_ST_VENDA,'+
         ' CAST(SUM(dc.qtd_item * dc.vlr_icms_efetivo_c) AS NUMERIC(18,2)) TOT_ICMS_ST_COMPRA,'+
         ' CAST(SUM(dc.vlr_icms_efetivo - (dc.qtd_item * dc.vlr_icms_efetivo_c)) AS NUMERIC(18,2)) TOT_DEB_CRED_ICMS_ST,'+
         ' NULL DATA_DOCUMENTO,'+
         ' NULL DATA_LANCAMENTO,'+
         ' NULL DOCUMENTO,'+
         ' NULL SERIE,'+
         ' NULL MODELO_NF,'+
         ' NULL ID_CFOP,'+
         ' NULL CST_ICMS,'+
         ' NULL PER_ALIQ_ICMS,'+
         ' SUM(dc.vlr_icms) VLR_ICMS,'+
         ' NULL PER_ALIQ_ICMS_ST,'+
         ' SUM(dc.vlr_icms_st) VLR_ICMS_ST,'+
         ' NULL VLR_BASE_ICMS_ST,'+
         ' NULL VLR_OPERACAO,'+
         ' NULL MODALIDADE,'+
         ' NULL TIPO,'+
         ' NULL DES_NCM,'+
         ' NULL PER_ICMS,'+
         ' NULL PER_FCP,'+
         ' NULL PER_ICMS_EFETIVO,'+
         ' NULL UTILIZADO,'+
         ' NULL COD_FORNECEDOR,'+
         ' NULL NOME_FORNECDOR,'+
         ' 3 ORDEM'+

         ' FROM DEB_CRED_ICMS_ST dc'+
         ' WHERE dc.modalidade=''VENDAS'''+
         ' AND   dc.data_lancamento BETWEEN '+QuotedStr(sgDtaInicio)+' AND '+QuotedStr(sgDtaFim);

         If sForns<>'' Then
          MySql:=
           MySql+' AND   dc.cod_fornecedor IN ('+sForns+')';

         If Rb_NFeCom.Checked Then
         Begin
           MySql:=
            MySql+' AND   dc.vlr_icms_efetivo_c BETWEEN 0.01 AND 9999999.99';
         End; // If Rb_NFeCom.Checked Then

         If Rb_NFeSem.Checked Then
         Begin
           MySql:=
            MySql+' AND   dc.vlr_icms_efetivo_c BETWEEN 0.00 AND 0.00';
         End; // If Rb_NFeSem.Checked Then

  MySql:=
   MySql+' UNION ALL'+

         // ------ Linha em Branco
         ' SELECT'+
         ' NULL COD_PRODUTO,'+
         ' NULL NOME_PRODUTO,'+
         ' NULL VLR_ICMS_ST_VENDA,'+
         ' NULL VLR_ICMS_ST_COMPRA,'+
         ' NULL VLR_DEB_CRED_ICMS_ST,'+
         ' NULL DATA_DOCUMENTO,'+
         ' NULL DATA_LANCAMENTO,'+
         ' NULL DOCUMENTO,'+
         ' NULL SERIE,'+
         ' NULL MODELO_NF,'+
         ' NULL ID_CFOP,'+
         ' NULL CST_ICMS,'+
         ' NULL PER_ALIQ_ICMS,'+
         ' NULL VLR_ICMS,'+
         ' NULL PER_ALIQ_ICMS_ST,'+
         ' NULL VLR_ICMS_ST,'+
         ' NULL VLR_BASE_ICMS_ST,'+
         ' NULL VLR_OPERACAO,'+
         ' NULL MODALIDADE,'+
         ' NULL TIPO,'+
         ' NULL DES_NCM,'+
         ' NULL PER_ICMS,'+
         ' NULL PER_FCP,'+
         ' NULL PER_ICMS_EFETIVO,'+
         ' NULL UTILIZADO,'+
         ' NULL COD_FORNECEDOR,'+
         ' NULL NOME_FORNECDOR,'+
         ' 5 ORDEM'+
         ' FROM RDB$DATABASE'+

         ' UNION ALL'+

         // ------ Produtos
         ' SELECT'+
         ' dc.cod_produto COD_PRODUTO,'+
         ' pr.nome NOME_PRODUTO,'+
         ' CAST(dc.vlr_icms_efetivo AS NUMERIC(18,2)) TOT_ICMS_ST_VENDA,'+
         ' CAST((dc.qtd_item * dc.vlr_icms_efetivo_c) AS NUMERIC(18,2)) TOT_ICMS_ST_COMPRA,'+
         ' CAST((dc.vlr_icms_efetivo - (dc.qtd_item * dc.vlr_icms_efetivo_c)) AS NUMERIC(18,2)) TOT_DEB_CRED_ICMS_ST,'+
         ' dc.data_documento,'+
         ' dc.data_lancamento,'+
         ' dc.documento,'+
         ' dc.serie,'+
         ' dc.modelo_nf,'+
         ' dc.id_cfop,'+
         ' dc.cst_icms,'+
         ' dc.per_aliq_icms,'+
         ' dc.vlr_icms,'+
         ' dc.per_aliq_icms_st,'+
         ' dc.vlr_icms_st,'+
         ' dc.vlr_base_icms_st,'+
         ' dc.vlr_operacao,'+
         ' dc.modalidade,'+
         ' dc.tipo,'+
         ' dc.des_ncm,'+
         ' dc.per_icms,'+
         ' dc.per_fcp,'+
         ' dc.per_icms_efetivo,'+
         ' dc.utilizado,'+
         ' dc.cod_fornecedor COD_FORNECEDOR,'+
         ' fo.nome_cliente NOME_FORNECDOR,'+
         ' 6 ORDEM'+

         ' FROM DEB_CRED_ICMS_ST dc, LINXPRODUTOS pr, LINXCLIENTESFORNEC fo'+
         ' WHERE dc.cod_produto=pr.cod_produto'+
         ' AND   dc.cod_fornecedor=fo.cod_cliente'+
         ' AND   dc.modalidade=''VENDAS'''+
         ' AND   dc.data_lancamento BETWEEN '+QuotedStr(sgDtaInicio)+' AND '+QuotedStr(sgDtaFim);

         If sForns<>'' Then
          MySql:=
           MySql+' AND   dc.cod_fornecedor IN ('+sForns+')';

         If Rb_NFeCom.Checked Then
         Begin
           MySql:=
            MySql+' AND   dc.vlr_icms_efetivo_c BETWEEN 0.01 AND 9999999.99';
         End; // If Rb_NFeCom.Checked Then

         If Rb_NFeSem.Checked Then
         Begin
           MySql:=
            MySql+' AND   dc.vlr_icms_efetivo_c BETWEEN 0.00 AND 0.00';
         End; // If Rb_NFeSem.Checked Then

  MySql:=
   MySql+' ORDER BY 28,2';
  DMDebCredST.CDS_ProdutoForn.Close;
  DMDebCredST.SQLQ_ProdutoForn.SQL.Clear;
  DMDebCredST.SQLQ_ProdutoForn.SQL.Add(MySql);
  DMDebCredST.CDS_ProdutoForn.Open;

  OdirPanApres.Visible:=False;

  If DMDebCredST.CDS_ProdutoForn.IsEmpty Then
  Begin
    DMDebCredST.CDS_ProdutoForn.Close;
    msg('Sem Produto'+cr+cr+'a Apresentar !!','A');
  End; // If DMDebCredST.CDS_ProdutoForn.IsEmpty Then

End; // Monta Sql de Produtos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Solicita o Período >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmDebCredST.PeriodoApropriacao: Boolean;
Begin
  Result:=False;

  sgDtaInicio:='';
  sgDtaFim   :='';

  Try
    StrToDate(DtEdtDtaInicio.Text);
  Except
    msg('Data Inicial do Período Inválida !!','A');
    DtEdtDtaInicio.SetFocus;
    Exit;
  End;

  Try
    StrToDate(DtEdtDtaFim.Text);
  Except
    msg('Data Final do Período Inválida !!','A');
    DtEdtDtaFim.SetFocus;
    Exit;
  End;

  If DtEdtDtaFim.Date<DtEdtDtaInicio.Date Then
  Begin
    msg('Período Inválido !!','A');
    DtEdtDtaInicio.SetFocus;
    Exit;
  End;

  If msg(DtEdtDtaInicio.Text+' a '+DtEdtDtaFim.Text+cr+cr+'O Período Esta CORRETO ??','C')=2 Then
  Begin
    DtEdtDtaInicio.SetFocus;
    Exit;
  End;

  sgDtaInicio:=f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdtDtaInicio.Date)));
  sgDtaFim   :=f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdtDtaFim.Date)));

  Result:=True;
End; // // Solicita o Período >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Libera TabSheet >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmDebCredST.TabSheetLibera(sNomeTab: String);
Var
  i: Integer;
Begin
  For i:=0 to FrmDebCredST.ComponentCount-1 do
  Begin
    If FrmDebCredST.Components[i] is TTabSheet Then
    Begin
      (FrmDebCredST.Components[i] as TTabSheet).TabVisible:=False;

      If (FrmDebCredST.Components[i] as TTabSheet).Name=sNomeTab Then
       (FrmDebCredST.Components[i] as TTabSheet).TabVisible:=True;

    End; // If FrmDebCredST.Components[i] is TTabSheet Then
  End; // For i:=0 to FrmDebCredST.ComponentCount-1 do

End; // // Libera TabSheet >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmDebCredST.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bgSairDC Then
   Begin
     FreeAndNil(mMemoForn);
     //odir FechaTudoModelo;

     Action := caFree;
   End
  Else
   Begin
     msg('Para Sair Tecle no Botão <Sair>...','A');
     Action := caNone;
   End;

end;

procedure TFrmDebCredST.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  sgDtaInicio:='';
  sgDtaFim   :='';

  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  Application.OnMessage := ApplicationEvents1Message;
end;

procedure TFrmDebCredST.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;
end;

procedure TFrmDebCredST.FormShow(Sender: TObject);
begin
  // Cor Form
  CorCaptionForm.Active:=False;
  CorCaptionForm.Active:=True;

  bgSairDC:=False;

  // Cria Componente Memo ======================================================
  mMemoForn:=TMemo.Create(Self);
  mMemoForn.Visible:=False;
  mMemoForn.Parent:=FrmDebCredST;
  mMemoForn.Width:=500;
  mMemoForn.Lines.Clear;

  // Acderta Data de Download dos Arquivos XML's de NFE de Entrada
  DtEdtXMLsDownLoad.Date:=StrToDate(DateToStr(DataHoraServidorFI(DMDebCredST.SQLQuery1)-1));

  PC_DebCredICMSSTChange(Self);

end;

procedure TFrmDebCredST.ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
var
  Sentido: SmallInt;
begin
  // primeiramente verificamos se é o evento a ser tratado...
  If Msg.message = WM_MOUSEWHEEL then
  Begin
    // If (ActiveControl is TDBGrid) Or (ActiveControl is TDBGridJul) then // If Somente DBGRID *** Testa se Classe é TDBGRID
    If (ActiveControl is TDBGrid) then // If Somente DBGRID *** Testa se Classe é TDBGRID
    Begin
      Msg.message := WM_KEYDOWN;
      Msg.lParam := 0;
      Sentido := HiWord(Msg.wParam);
      if Sentido > 0 then
       Msg.wParam := VK_UP
      else
       Msg.wParam := VK_DOWN;
    End; // If (ActiveControl is TDBGrid) Or (ActiveControl is TDBGridJul) then // If Somente DBGRID *** Testa se Classe é TDBGRID
  End; // if Msg.message = WM_MOUSEWHEEL then
end;

procedure TFrmDebCredST.Bt_SairClick(Sender: TObject);
begin
  {
   Usado em:
   Bt_XmlsSair
  }

  bgSairDC:=True;
  Close;
end;

procedure TFrmDebCredST.Bt_VlrBcICMSSTClick(Sender: TObject);
begin
  TabSheetLibera(Ts_FornBcICMSST.Name);
  PC_DebCredICMSSTChange(Self);
end;

procedure TFrmDebCredST.Bt_TotaisFornClick(Sender: TObject);
Var
  bNovoSQL:Boolean;
begin
  TabSheetLibera(Ts_FornTotais.Name);
  PC_DebCredICMSSTChange(Self);

  bNovoSQL:=True;
  If (Trim(sgDtaInicio)<>'') Then
  Begin
    If (f_Troca('.','/',sgDtaInicio)=DtEdtDtaInicio.Text) and (f_Troca('.','/',sgDtaFim)=DtEdtDtaFim.Text) Then
     bNovoSQL:=False
  End; // If (Trim(sgDtaInicio)<>'') Then

  If bNovoSQL Then
  Begin
    If Not PeriodoApropriacao Then
     Exit;
  End; // If bNovoSQL Then

  // Executa SQL ================================================================
  If (bNovoSQL) Or (Not DMDebCredST.CDS_TotaisForn.Active) Then
  Begin
    OdirPanApres.Caption:='AGUARDE !! Localizando Fornecedores...';
    OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
    OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmDebCredST.Width-OdirPanApres.Width)/2));
    OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmDebCredST.Height-OdirPanApres.Height)/2))-20;
    OdirPanApres.Font.Style:=[fsBold];
    OdirPanApres.Parent:=FrmDebCredST;
    OdirPanApres.BringToFront();
    OdirPanApres.Visible:=True;
    Refresh;

    {=================================
     02 - TOTAL POR FORNECEDOR
     Parametros:
     ===========
     Com ICMS ST..: :Vlr1 = 0.01
                    :Vlr2 = 9999999.99
     Sem ICMS ST..: :Vlr1 = 0.00
                    :Vlr2 = 0.00
     Todos ICMS ST: :Vlr1 = 0
                    :Vlr2 = 9999999.99
     ==================================}

    mMemoForn.Lines.Clear;

    DMDebCredST.CDS_TotaisForn.Close;
    DMDebCredST.SQLQ_TotaisForn.Params.ParamByName('Dta1').Value:=sgDtaInicio;
    DMDebCredST.SQLQ_TotaisForn.Params.ParamByName('Dta2').Value:=sgDtaFim;

    If Rb_NFeCom.Checked Then
    Begin
      DMDebCredST.SQLQ_TotaisForn.Params.ParamByName('Vlr1').AsCurrency:=0.01;
      DMDebCredST.SQLQ_TotaisForn.Params.ParamByName('Vlr2').AsCurrency:=9999999.99;
    End; // If Rb_NFeCom.Checked Then

    If Rb_NFeSem.Checked Then
    Begin
      DMDebCredST.SQLQ_TotaisForn.Params.ParamByName('Vlr1').Value:='0.00';
      DMDebCredST.SQLQ_TotaisForn.Params.ParamByName('Vlr2').Value:='0.00';
    End; // If Rb_NFeSem.Checked Then

    If Rb_NFeAmbas.Checked Then
    Begin
      DMDebCredST.SQLQ_TotaisForn.Params.ParamByName('Vlr1').Value:='0';
      DMDebCredST.SQLQ_TotaisForn.Params.ParamByName('Vlr2').Value:='9999999';
    End; // If Rb_NFeAmbas.Checked Then

    DMDebCredST.CDS_TotaisForn.Open;

    OdirPanApres.Visible:=False;

    If DMDebCredST.CDS_TotaisForn.IsEmpty Then
    Begin
      DMDebCredST.CDS_TotaisForn.Close;
      msg('Sem Fornecedor'+cr+cr+'a Apresentar !!','A');
    End; // If DMDebCredST.CDS_TotaisForn.IsEmpty Then
 End; // If bNovoSQL Then
end;

procedure TFrmDebCredST.Bt_ProdutosFornClick(Sender: TObject);
begin
  TabSheetLibera(Ts_FornProdutos.Name);
  PC_DebCredICMSSTChange(Self);

  DMDebCredST.CDS_ProdutoForn.Close;
  If (f_Troca('.','/',sgDtaInicio)<>DtEdtDtaInicio.Text) Or (f_Troca('.','/',sgDtaFim)<>DtEdtDtaFim.Text) Or
     (Trim(sgDtaInicio)<>'') Or (Trim(sgDtaInicio)<>'/  /')Then
  Begin
    If Not PeriodoApropriacao Then
     Exit;
  End; // If (f_Troca('.','/',sgDtaInicio)<>DtEdtDtaInicio.Text) Or (f_Troca('.','/',sgDtaFim)<>DtEdtDtaFim.Text) Then

  // Apresenta Produtos ========================================================
  SqlProdutos;

end;

procedure TFrmDebCredST.Dbg_VlrBcICMSSTColEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_VlrBcICMSSTColEnter; // Nome do Evento do DBGRID
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmDebCredST.Dbg_VlrBcICMSSTKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  {
   Usado em:
   Dbg_TotaisForn
   Dbg_ProdutosForn
  }
  // Bloquea TECLA Ctrl+Del ====================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;
end;

procedure TFrmDebCredST.Dbg_ProdutosFornColEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_ProdutosFornColEnter; // Nome do Evento do DBGRID
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmDebCredST.Dbg_TotaisFornColEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_TotaisFornColEnter; // Nome do Evento do DBGRID
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmDebCredST.PC_DebCredICMSSTChange(Sender: TObject);
begin

  If (Not Ts_FornBcICMSST.TabVisible) And (Not Ts_FornTotais.TabVisible) And
     (Not Ts_FornProdutos.TabVisible) And (Not Ts_XMLsAnalisa.TabVisible) Then
  Begin
    Exit;
  End;

  CorSelecaoTabSheet(PC_DebCredICMSST);
  Pan_Solicitacoes.Visible:=True;

  If (PC_DebCredICMSST.ActivePage=Ts_XMLsAnalisa) And (Ts_XMLsAnalisa.CanFocus) Then
  Begin
    Pan_Solicitacoes.Visible:=False;
    Bt_XMLsPasta.SetFocus;
  End; // If (PC_DebCredICMSST.ActivePage=Ts_XmlAnalisa) And (Ts_XmlAnalisa.CanFocus) Then

  If (PC_DebCredICMSST.ActivePage=Ts_FornBcICMSST) And (Ts_FornBcICMSST.CanFocus) Then
  Begin
    Dbg_VlrBcICMSST.Setfocus;
    dxStatusBar2.Panels[1].Visible:=False;

    OdirPanApres.Caption:='AGUARDE !! Localizando Fornecedores...';
    OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
    OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmDebCredST.Width-OdirPanApres.Width)/2));
    OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmDebCredST.Height-OdirPanApres.Height)/2))-20;
    OdirPanApres.Font.Style:=[fsBold];
    OdirPanApres.Parent:=FrmDebCredST;
    OdirPanApres.BringToFront();
    OdirPanApres.Visible:=True;
    Refresh;

    If Not DMDebCredST.CDS_VlrBcICMSST.Active Then
     DMDebCredST.CDS_VlrBcICMSST.Open;

    OdirPanApres.Visible:=False;

    If DMDebCredST.CDS_VlrBcICMSST.IsEmpty Then
    Begin
      DMDebCredST.CDS_VlrBcICMSST.Close;
      msg('Sem Fornecedor'+cr+cr+'a Apresentar !!','A');
    End; // If DMDebCredST.CDS_TotaisForn.IsEmpty Then

  End; // If (PC_DebCredICMSST.ActivePage=Ts_FornBcICMSST) And (Ts_FornBcICMSST.CanFocus) Then

  If (PC_DebCredICMSST.ActivePage=Ts_FornTotais) And (Ts_FornTotais.CanFocus) Then
  Begin
    dxStatusBar2.Panels[1].Visible:=True;
    Dbg_TotaisForn.Setfocus;
  End; // If (PC_DebCredICMSST.ActivePage=Ts_FornTotais) And (Ts_FornTotais.CanFocus) Then

  If (PC_DebCredICMSST.ActivePage=Ts_FornProdutos) And (Ts_FornProdutos.CanFocus) Then
  Begin
    dxStatusBar2.Panels[1].Visible:=False;
    Dbg_ProdutosForn.Setfocus;
  End; // If (PC_DebCredICMSST.ActivePage=Ts_FornProdutos) And (Ts_FornProdutos.CanFocus) Then

end;

procedure TFrmDebCredST.Dbg_VlrBcICMSSTDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If Not DMDebCredST.CDS_VlrBcICMSST.IsEmpty Then
  Begin
    If not (gdSelected in State) Then
    Begin
      If (Trim(DMDebCredST.CDS_VlrBcICMSSTCOD_FORNECEDOR.AsString)='') And
         (Trim(DMDebCredST.CDS_VlrBcICMSSTNOME_FORNECDOR.AsString)<>'') Then
      Begin
        Dbg_VlrBcICMSST.Canvas.Font.Style:=[fsBold];
        Dbg_VlrBcICMSST.Canvas.Brush.Color:=clYellow;
      End;
    End; // If not (gdSelected in State) Then

    If (Column.FieldName='BC_ICMS_ST') Then // Este comando altera cor da Celula
    Begin
      If Trim(DMDebCredST.CDS_VlrBcICMSSTBC_ICMS_ST.AsString)='COM' Then
      Begin
        Dbg_VlrBcICMSST.Canvas.Font.Style:=[fsBold];
        Dbg_VlrBcICMSST.Canvas.Brush.Color:=$0080FF00;
      End;

      If Trim(DMDebCredST.CDS_VlrBcICMSSTBC_ICMS_ST.AsString)='SEM' Then
      Begin
        Dbg_VlrBcICMSST.Canvas.Font.Style:=[fsBold];
        Dbg_VlrBcICMSST.Canvas.Brush.Color:=clRed;
        Dbg_VlrBcICMSST.Canvas.Font.Color :=clWhite;
      End;
    End; // If (Column.FieldName='BC_ICMS_ST') Then // Este comando altera cor da Celula

    Dbg_VlrBcICMSST.Canvas.FillRect(Rect);
    Dbg_VlrBcICMSST.DefaultDrawDataCell(Rect,Column.Field,state);

    DMDebCredST.CDS_VlrBcICMSSTCOD_FORNECEDOR.Alignment    :=taRightJustify;
    DMDebCredST.CDS_VlrBcICMSSTTOT_DEBITO_ICMS_ST.Alignment:=taRightJustify;
    DMDebCredST.CDS_VlrBcICMSSTBC_ICMS_ST.Alignment        :=taCenter;
  End; // If Not DMDebCredST.CDS_VlrBcICMSST.IsEmpty Then

end;

procedure TFrmDebCredST.DtEdtDtaInicioPropertiesEditValueChanged(Sender: TObject);
begin
  {
   Usado em:
   DtEdtDtaFimPropertiesEditValueChanged
  }

  If (Sender is TcxDateEdit) Then
  Begin
    If (Sender as TcxDateEdit).Name='DtEdtDtaInicio' Then
    Begin
      Try
        StrToDate(DtEdtDtaInicio.Text);

        If Trim(sgDtaInicio)='' Then
        Begin
          mMemoForn.Lines.Clear;
          DMDebCredST.CDS_TotaisForn.Close;
          DMDebCredST.CDS_ProdutoForn.Close;
        End;

        If (Trim(sgDtaInicio)<>'') Then
        Begin
          If (f_Troca('.','/',sgDtaInicio)<>DtEdtDtaInicio.Text) Or (f_Troca('.','/',sgDtaFim)<>DtEdtDtaFim.Text) Then
          Begin
            mMemoForn.Lines.Clear;
            DMDebCredST.CDS_TotaisForn.Close;
            DMDebCredST.CDS_ProdutoForn.Close;
          End;
        End; // If (Trim(sgDtaInicio)<>'') Then
      Except
      End; // Try
    End; // If (Sender as TcxDateEdit).Name='DtEdtDtaInicio' Then

    If (Sender as TcxDateEdit).Name='DtEdtDtaFim' Then
    Begin
      Try
        StrToDate(DtEdtDtaFim.Text);

        If Trim(sgDtaFim)='' Then
        Begin
          mMemoForn.Lines.Clear;
          DMDebCredST.CDS_TotaisForn.Close;
          DMDebCredST.CDS_ProdutoForn.Close;
        End;

        If (Trim(sgDtaFim)<>'') Then
        Begin
          If (f_Troca('.','/',sgDtaInicio)<>DtEdtDtaInicio.Text) Or (f_Troca('.','/',sgDtaFim)<>DtEdtDtaFim.Text) Then
          Begin
            mMemoForn.Lines.Clear;
            DMDebCredST.CDS_TotaisForn.Close;
            DMDebCredST.CDS_ProdutoForn.Close;
          End;
        End; // If (Trim(sgDtaInicio)<>'') Then
      Except
      End; // Try
    End; // If (Sender as TcxDateEdit).Name='DtEdtDtaInicio' Then
  End; // If (Sender is TcxDateEdit) Then

end;

procedure TFrmDebCredST.Dbg_TotaisFornDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  If Not DMDebCredST.CDS_TotaisForn.IsEmpty Then
  Begin
    If not (gdSelected in State) Then
    Begin
      If (Trim(DMDebCredST.CDS_TotaisFornCOD_FORNECEDOR.AsString)='') And
         (Trim(DMDebCredST.CDS_TotaisFornNOME_FORNECDOR.AsString)<>'') Then
      Begin
        Dbg_TotaisForn.Canvas.Font.Style:=[fsBold];
        Dbg_TotaisForn.Canvas.Brush.Color:=clYellow;
      End; // If (Trim(DMDebCredST.CDS_TotaisFornCOD_FORNECEDOR.AsString)='') And ...
    End; // If not (gdSelected in State) Then

    If (Column.FieldName='TOT_DEB_CRED_ICMS_ST') Then // Este comando altera cor da Celula
    Begin
      If DMDebCredST.CDS_TotaisFornTOT_DEB_CRED_ICMS_ST.AsCurrency<0 Then
      Begin
        Dbg_TotaisForn.Canvas.Brush.Color:=clRed;
        Dbg_TotaisForn.Canvas.Font.Color :=clWhite;
      End;
    End; // If (Column.FieldName='TOT_DEBITO_ICMS_ST') Then // Este comando altera cor da Celula

    If (Column.FieldName='SELECAO') Then // Este comando altera cor da Celula
    Begin
      If DMDebCredST.CDS_TotaisFornSELECAO.AsString='SIM' Then
      Begin
        Dbg_TotaisForn.Canvas.Brush.Color:=clLime;
        Dbg_TotaisForn.Canvas.Font.Style:=[fsBold];
      End;
    End; // If (Column.FieldName='TOT_DEBITO_ICMS_ST') Then // Este comando altera cor da Celula

    Dbg_TotaisForn.Canvas.FillRect(Rect);
    Dbg_TotaisForn.DefaultDrawDataCell(Rect,Column.Field,state);

    DMDebCredST.CDS_TotaisFornSELECAO.Alignment             :=taCenter;
    DMDebCredST.CDS_TotaisFornCOD_FORNECEDOR.Alignment      :=taRightJustify;
    DMDebCredST.CDS_TotaisFornTOT_ICMS_ST_VENDA.Alignment   :=taRightJustify;
    DMDebCredST.CDS_TotaisFornTOT_ICMS_ST_COMPRA.Alignment  :=taRightJustify;
    DMDebCredST.CDS_TotaisFornTOT_DEB_CRED_ICMS_ST.Alignment:=taRightJustify;
  End; // If Not DMDebCredST.CDS_TotaisForn.IsEmpty Then
end;

procedure TFrmDebCredST.Dbg_TotaisFornDblClick(Sender: TObject);
Var
  i: Integer;
begin
  If (DMDebCredST.CDS_TotaisForn.IsEmpty) Or (Trim(DMDebCredST.CDS_TotaisFornSELECAO.AsString)='') Then
   Exit;

  DMDebCredST.CDS_ProdutoForn.Close;

  DMDebCredST.CDS_TotaisForn.Edit;
  If DMDebCredST.CDS_TotaisFornSELECAO.AsString='NAO' Then
   DMDebCredST.CDS_TotaisFornSELECAO.AsString:='SIM'
  Else
   DMDebCredST.CDS_TotaisFornSELECAO.AsString:='NAO';
  DMDebCredST.CDS_TotaisForn.Post;

  // Trata Memo de Codigo de Fornecedores ======================================
  For i:=0 to mMemoForn.Lines.Count-1 do
  Begin
     If (DMDebCredST.CDS_TotaisFornSELECAO.AsString='NAO') And (mMemoForn.Lines[i]=DMDebCredST.CDS_TotaisFornCOD_FORNECEDOR.AsString) Then
     Begin
       mMemoForn.Lines.Delete(i);
       Break;
     End;

     If (DMDebCredST.CDS_TotaisFornSELECAO.AsString='SIM') Then
     Begin
       mMemoForn.Lines.Add(DMDebCredST.CDS_TotaisFornCOD_FORNECEDOR.AsString);
       Break;
     End;
  End; // For i:=0 to mMemo.Lines.Count-1 do

  // Inclui Fornecedor se Memo Estiver Vazio ===================================
  If (mMemoForn.Lines.Count<1) And (DMDebCredST.CDS_TotaisFornSELECAO.AsString='SIM') Then
   mMemoForn.Lines.Add(DMDebCredST.CDS_TotaisFornCOD_FORNECEDOR.AsString);

end;

procedure TFrmDebCredST.Dbg_TotaisFornTitleClick(Column: TColumn);
Var
  s, sPesquisa: String;
  b: Boolean;
  i: Integer;
begin
  If Not DMDebCredST.CDS_TotaisForn.IsEmpty Then
  Begin
    i:=DMDebCredST.CDS_TotaisForn.RecNo;
    sPesquisa:='';
    b:=True;
    While b do
    Begin
      s:=DMDebCredST.CDS_TotaisForn.FieldByName(Column.FieldName).DisplayLabel;
      If InputQuery('Localizar: '+s,'',sPesquisa) then
       Begin
         Try
           If Not DMDebCredST.CDS_TotaisForn.Locate(Column.FieldName, sPesquisa,[]) Then
           Begin
             If Not LocalizaRegistro(DMDebCredST.CDS_TotaisForn, Column.FieldName, sPesquisa) Then
             Begin
               DMDebCredST.CDS_TotaisForn.RecNo:=i;
               msg('Não Localizado !!','A');
               Exit;
             End;
           End; // If Not DMDebCredST.CDS_TotaisForn.Locate(Column.FieldName, sPesquisa,[]) Then
           Break;
         Except
           msg('Informação Inválida !!','A');
           Break;
         End;
       End
      Else // If InputQuery('Localizar: '+s,'',sPesquisa) then
       Begin
         Break;
       End; // If InputQuery('Localizar: '+s,'',sPesquisa) then
    End; // While b do
  End; // If Not DMDebCredST.CDS_TotaisForn.IsEmpty Then

end;

procedure TFrmDebCredST.Dbg_VlrBcICMSSTTitleClick(Column: TColumn);
Var
  s, sPesquisa: String;
  b: Boolean;
  i: Integer;
begin
  If Not DMDebCredST.CDS_VlrBcICMSST.IsEmpty Then
  Begin
    i:=DMDebCredST.CDS_VlrBcICMSST.RecNo;
    sPesquisa:='';
    b:=True;
    While b do
    Begin
      s:=DMDebCredST.CDS_VlrBcICMSST.FieldByName(Column.FieldName).DisplayLabel;
      If InputQuery('Localizar: '+s,'',sPesquisa) then
       Begin
         Try
           If Not DMDebCredST.CDS_VlrBcICMSST.Locate(Column.FieldName, sPesquisa,[]) Then
           Begin
             If Not LocalizaRegistro(DMDebCredST.CDS_VlrBcICMSST, Column.FieldName, sPesquisa) Then
             Begin
               DMDebCredST.CDS_VlrBcICMSST.RecNo:=i;
               msg('Não Localizado !!','A');
               Exit;
             End;
           End; // If Not DMDebCredST.CDS_VlrBcICMSST.Locate(Column.FieldName, sPesquisa,[]) Then
           Break;
         Except
           msg('Informação Inválida !!','A');
           Break;
         End;
       End
      Else // If InputQuery('Localizar: '+s,'',sPesquisa) then
       Begin
         Break;
       End; // If InputQuery('Localizar: '+s,'',sPesquisa) then
    End; // While b do
  End; // If Not DMDebCredST.CDS_VlrBcICMSST.IsEmpty Then

end;

procedure TFrmDebCredST.Dbg_ProdutosFornDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
                      
  If Not DMDebCredST.CDS_ProdutoForn.IsEmpty Then
  Begin
    If not (gdSelected in State) Then
    Begin
      If (Trim(DMDebCredST.CDS_ProdutoFornCOD_PRODUTO.AsString)='') And
         (Trim(DMDebCredST.CDS_ProdutoFornNOME_PRODUTO.AsString)<>'') Then
      Begin
        Dbg_ProdutosForn.Canvas.Font.Style:=[fsBold];
        Dbg_ProdutosForn.Canvas.Brush.Color:=clYellow;
      End; // If (Trim(DMDebCredST.CDS_ProdutoFornCOD_PRODUTO.AsString)='') And ...
    End; // If not (gdSelected in State) Then

    Dbg_ProdutosForn.Canvas.FillRect(Rect);
    Dbg_ProdutosForn.DefaultDrawDataCell(Rect,Column.Field,state);

    DMDebCredST.CDS_ProdutoFornCOD_PRODUTO.Alignment         :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornVLR_ICMS_ST_COMPRA.Alignment  :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornVLR_ICMS_ST_VENDA.Alignment   :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornVLR_DEB_CRED_ICMS_ST.Alignment:=taRightJustify;
    DMDebCredST.CDS_ProdutoFornDATA_DOCUMENTO.Alignment      :=taCenter;
    DMDebCredST.CDS_ProdutoFornDATA_LANCAMENTO.Alignment     :=taCenter;
    DMDebCredST.CDS_ProdutoFornDOCUMENTO.Alignment           :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornSERIE.Alignment               :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornMODELO_NF.Alignment           :=taCenter;
    DMDebCredST.CDS_ProdutoFornID_CFOP.Alignment             :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornCST_ICMS.Alignment            :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornPER_ALIQ_ICMS.Alignment       :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornVLR_ICMS.Alignment            :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornPER_ALIQ_ICMS_ST.Alignment    :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornVLR_ICMS_ST.Alignment         :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornVLR_BASE_ICMS_ST.Alignment    :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornVLR_OPERACAO.Alignment        :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornMODALIDADE.Alignment          :=taCenter;
    DMDebCredST.CDS_ProdutoFornTIPO.Alignment                :=taCenter;
    DMDebCredST.CDS_ProdutoFornDES_NCM.Alignment             :=taCenter;
    DMDebCredST.CDS_ProdutoFornPER_ICMS.Alignment            :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornPER_FCP.Alignment             :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornPER_ICMS_EFETIVO.Alignment    :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornCOD_FORNECEDOR.Alignment      :=taRightJustify;
  End; // If Not DMDebCredST.CDS_ProdutoForn.IsEmpty Then

end;

procedure TFrmDebCredST.Bt_ClipboardClick(Sender: TObject);
begin
  {
   Usado em:
   Bt_XMLsSalvar
  }
  If (PC_DebCredICMSST.ActivePage=Ts_XMLsAnalisa) And (Ts_XMLsAnalisa.CanFocus) Then
  Begin
    Dbg_XMLs.Setfocus;

    If Not DMDebCredST.CDS_V_XMLsAnalisa.IsEmpty Then
    Begin
      DBGridClipboard(Dbg_XMLs);
    End;
  End; // If (PC_DebCredICMSST.ActivePage=Ts_XMLsAnalisa) And (Ts_XMLsAnalisa.CanFocus) Then

  If (PC_DebCredICMSST.ActivePage=Ts_FornBcICMSST) And (Ts_FornBcICMSST.CanFocus) Then
  Begin
    Dbg_VlrBcICMSST.Setfocus;

    If Not DMDebCredST.CDS_VlrBcICMSST.IsEmpty Then
    Begin
      DBGridClipboard(Dbg_VlrBcICMSST);
    End;
  End; // If (PC_DebCredICMSST.ActivePage=Ts_FornBcICMSST) And (Ts_FornBcICMSST.CanFocus) Then

  If (PC_DebCredICMSST.ActivePage=Ts_FornTotais) And (Ts_FornTotais.CanFocus) Then
  Begin
    Dbg_TotaisForn.Setfocus;

    If Not DMDebCredST.CDS_TotaisForn.IsEmpty Then
    Begin
      DBGridClipboard(Dbg_TotaisForn);
    End;
  End; // If (PC_DebCredICMSST.ActivePage=Ts_FornTotais) And (Ts_FornTotais.CanFocus) Then

  If (PC_DebCredICMSST.ActivePage=Ts_FornProdutos) And (Ts_FornProdutos.CanFocus) Then
  Begin
    Dbg_ProdutosForn.Setfocus;

    If Not DMDebCredST.CDS_ProdutoForn.IsEmpty Then
    Begin
      DBGridClipboard(Dbg_ProdutosForn);
    End;
  End; // If (PC_DebCredICMSST.ActivePage=Ts_FornProdutos) And (Ts_FornProdutos.CanFocus) Then

end;

procedure TFrmDebCredST.Rb_NFeSemClick(Sender: TObject);
begin
  AcertaRb_Style(Rb_NFeAmbas);
  AcertaRb_Style(Rb_NFeCom);
  AcertaRb_Style(Rb_NFeSem);

  mMemoForn.Lines.Clear;
  DMDebCredST.CDS_TotaisForn.Close;
  DMDebCredST.CDS_ProdutoForn.Close;


end;

procedure TFrmDebCredST.Rb_NFeSemKeyUp(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  Rb_NFeSemClick(Self);
end;

procedure TFrmDebCredST.Bt_XMLsPastaClick(Sender: TObject);
var
  sDir: string;
begin
  // Inicializa Client e ComboBox ==============================================
  XMLsAnalisaInicializa;

  EdtXmlsPasta.Clear;

  If SelectDirectory('Selecione a Pasta dos XMLs', '', sDir) Then
   EdtXMLsPasta.Text := sDir;
end;

procedure TFrmDebCredST.Bt_XMLsAnalizaClick(Sender: TObject);
begin
  Dbg_XMLs.SetFocus;

  If Trim(EdtXMLsPasta.Text)='' Then
  Begin
    msg('Favor Informar a Pasta dos XMLs !!','A');
    Bt_XMLsPastaClick(Self);
    Exit;
  End; // If Trim(EdtXMLsPasta.Text)='' Then
  EdtXMLsPasta.Text:=IncludeTrailingPathDelimiter(EdtXMLsPasta.Text);

  bgSiga:=True;

  // Inicializa Client e ComboBox ==============================================
  XMLsAnalisaInicializa;

  OdirPanApres.Caption:='AGUARDE !! Localizando Arquivos XMLs...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmDebCredST.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmDebCredST.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmDebCredST;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;
  Screen.Cursor:=crAppStart;

  //============================================================================
  // Busca Arquivos XMLs =======================================================
  //============================================================================
  If Not XMLsAnalisaBuscaXMLs Then
  Begin
    bgSiga:=False;
  End;
  // Busca Arquivos XMLs =======================================================
  //============================================================================

  If bgSiga Then
  Begin
    //==========================================================================
    // Analiza os XMLs =========================================================
    //==========================================================================
    XMLsAnalisaXMLs;
    // Analiza os XMLs =========================================================
    //==========================================================================
  End; // If bgSiga Then
  Screen.Cursor:=crDefault;
  OdirPanApres.Visible:=False;
end;

procedure TFrmDebCredST.Dbg_XMLsColEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_XMLsColEnter; // Nome do Evento do DBGRID
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;


end;

procedure TFrmDebCredST.Dbg_XMLsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // BLOQUEAR TECLA Ctrl+Del ===================================================
  if (Shift=[ssCtrl]) and (Key=46) then
    Key:=0;

end;

procedure TFrmDebCredST.Dbg_XMLsDrawColumnCell(Sender: TObject;
         const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If (Column.FieldName='TAG_VST') Then // Este comando altera cor da Celula
  Begin
    Dbg_XMLs.Canvas.Font.Style:=[fsBold];
    Dbg_XMLs.Canvas.Font.Color:=clBlue; // Cor da Fonte

    If DMDebCredST.CDS_V_XMLsAnalisaTAG_VST.AsString='NAO' Then
    Begin
      Dbg_XMLs.Canvas.Font.Style:=[fsBold];
      Dbg_XMLs.Canvas.Font.Color:=clRed; // Cor da Fonte
    End;
  End; // If (Column.FieldName='TAG_VST') Then // Este comando altera cor da Celula

  If (Column.FieldName='VALOR_ST') Then // Este comando altera cor da Celula
  Begin
    Dbg_XMLs.Canvas.Font.Style:=[fsBold];
    Dbg_XMLs.Canvas.Font.Color:=clBlue; // Cor da Fonte

    If DMDebCredST.CDS_V_XMLsAnalisaVALOR_ST.AsString='NAO' Then
    Begin
      Dbg_XMLs.Canvas.Font.Style:=[fsBold];
      Dbg_XMLs.Canvas.Font.Color:=clRed; // Cor da Fonte
    End;
  End; // If (Column.FieldName='VALOR_ST') Then // Este comando altera cor da Celula

  If (Column.FieldName='TAG_VFCPSTRET') Then // Este comando altera cor da Celula
  Begin
    Dbg_XMLs.Canvas.Font.Style:=[fsBold];
    Dbg_XMLs.Canvas.Font.Color:=clBlue; // Cor da Fonte

    If DMDebCredST.CDS_V_XMLsAnalisaTAG_VFCPSTRET.AsString='NAO' Then
    Begin
      Dbg_XMLs.Canvas.Font.Style:=[fsBold];
      Dbg_XMLs.Canvas.Font.Color:=clRed; // Cor da Fonte
    End;
  End; // If (Column.FieldName='TAG_VFCPSTRET') Then // Este comando altera cor da Celula

  If (Column.FieldName='VALOR_VFCPSTRET') Then // Este comando altera cor da Celula
  Begin
    Dbg_XMLs.Canvas.Font.Style:=[fsBold];
    Dbg_XMLs.Canvas.Font.Color:=clBlue; // Cor da Fonte

    If DMDebCredST.CDS_V_XMLsAnalisaVALOR_VFCPSTRET.AsString='NAO' Then
    Begin
      Dbg_XMLs.Canvas.Font.Style:=[fsBold];
      Dbg_XMLs.Canvas.Font.Color:=clRed; // Cor da Fonte
    End;
  End; // If (Column.FieldName='VALOR_VFCPSTRET') Then // Este comando altera cor da Celula

  // Funciona Somente com Isto
  Dbg_XMLs.Canvas.FillRect(Rect);
  Dbg_XMLs.DefaultDrawDataCell(Rect,Column.Field,state);

  // Alinhamento
  DMDebCredST.CDS_V_XMLsAnalisaCNPJ.Alignment:=taCenter;
  DMDebCredST.CDS_V_XMLsAnalisaFONE.Alignment:=taCenter;
  DMDebCredST.CDS_V_XMLsAnalisaUF_EMIT.Alignment:=taCenter;
  DMDebCredST.CDS_V_XMLsAnalisaUF_DEST.Alignment:=taCenter;
  DMDebCredST.CDS_V_XMLsAnalisaCST.Alignment:=taCenter;
  DMDebCredST.CDS_V_XMLsAnalisaTAG_VST.Alignment:=taCenter;
  DMDebCredST.CDS_V_XMLsAnalisaVALOR_ST.Alignment:=taCenter;
  DMDebCredST.CDS_V_XMLsAnalisaTAG_VFCPSTRET.Alignment:=taCenter;
  DMDebCredST.CDS_V_XMLsAnalisaVALOR_VFCPSTRET.Alignment:=taCenter;

end;

procedure TFrmDebCredST.DtEdtXMLsDownLoadPropertiesChange(Sender: TObject);
begin
  // Inicializa Client e ComboBox ==============================================
  XMLsAnalisaInicializa;

end;

procedure TFrmDebCredST.Cbx_XMLsUFEmitChange(Sender: TObject);
Var
  sCST, sUFEmit, sUFDest, svST, sValorST,
  svFCPSTRet, sValorFCPSTRet,
  sFiltro
  : String;
begin
  sUFEmit:='';
  sUFDest:='';
  sCST:='';
  svST:='';
  sValorST:='';
  svFCPSTRet:='';
  sValorFCPSTRet:='';
  sFiltro:='';

  sUFEmit:=Cbx_XMLsUFEmit.Items[Cbx_XMLsUFEmit.ItemIndex];
  sUFDest:=Cbx_XMLsUFDest.Items[Cbx_XMLsUFDest.ItemIndex];
  sCST:=Cbx_XMLsCST.Items[Cbx_XMLsCST.ItemIndex];
  svST:=Cbx_XMLsvST.Items[Cbx_XMLsvST.ItemIndex];
  sValorST:=Cbx_XMLsVlrvST.Items[Cbx_XMLsVlrvST.ItemIndex];
  svFCPSTRet:=Cbx_XMLsvFCPSTRet.Items[Cbx_XMLsvFCPSTRet.ItemIndex];
  sValorFCPSTRet:=Cbx_XMLsVlrvFCPSTRet.Items[Cbx_XMLsVlrvFCPSTRet.ItemIndex];

  // Filtro UF Emitente ========================================================
  If (Trim(sUFEmit)<>'') And (Trim(sUFEmit)<>'Todos') Then
  Begin
    If Trim(sFiltro)='' Then
     sFiltro:='UF_EMIT='+QuotedStr(sUFEmit)
    Else
     sFiltro:=sFiltro+' AND UF_EMIT='+QuotedStr(sUFEmit);
  End; // If (Trim(sUFEmit)<>'') And (Trim(sUFEmit)<>'Todos') Then

  // Filtro UF Emitente ========================================================
  If (Trim(sUFDest)<>'') And (Trim(sUFDest)<>'Todos') Then
  Begin
    If Trim(sFiltro)='' Then
     sFiltro:='UF_DEST='+QuotedStr(sUFDest)
    Else
     sFiltro:=sFiltro+' AND UF_DEST='+QuotedStr(sUFDest);
  End; // If (Trim(sUFDest)<>'') And (Trim(sUFDest)<>'Todos') Then

  // Filtro CST ================================================================
  If (Trim(sCST)<>'') And (Trim(sCST)<>'Todos') Then
  Begin
    If Trim(sFiltro)='' Then
     sFiltro:='CST='+QuotedStr(sCST)
    Else
     sFiltro:=sFiltro+' AND CST='+QuotedStr(sCST);
  End; // If (Trim(sCST)<>'') And (Trim(sCST)<>'Todos') Then

  // Filtro vST ================================================================
  If (Trim(svST)<>'') And (Trim(svST)<>'Ambos') Then
  Begin
    If Trim(sFiltro)='' Then
     sFiltro:='TAG_VST='+QuotedStr(svST)
    Else
     sFiltro:=sFiltro+' AND TAG_VST='+QuotedStr(svST);
  End; // If (Trim(svST)<>'') And (Trim(svST)<>'Ambos') Then

  // Filtro ValorST ============================================================
  If (Trim(sValorST)<>'') And (Trim(sValorST)<>'Ambos') Then
  Begin
    If Trim(sFiltro)='' Then
     sFiltro:='VALOR_ST='+QuotedStr(sValorST)
    Else
     sFiltro:=sFiltro+' AND VALOR_ST='+QuotedStr(sValorST);
  End; // If (Trim(sValorST)<>'') And (Trim(sValorST)<>'Ambos') Then

  // Filtro vFCPSTRet ==========================================================
  If (Trim(svFCPSTRet)<>'') And (Trim(svFCPSTRet)<>'Ambos') Then
  Begin
    If Trim(sFiltro)='' Then
     sFiltro:='TAG_VFCPSTRET='+QuotedStr(svFCPSTRet)
    Else
     sFiltro:=sFiltro+' AND TAG_VFCPSTRET='+QuotedStr(svFCPSTRet);
  End; // If (Trim(svFCPSTRet)<>'') And (Trim(svFCPSTRet)<>'Ambos') Then

  // Filtro ValorFCPSTRet ======================================================
  If (Trim(sValorFCPSTRet)<>'') And (Trim(sValorFCPSTRet)<>'Ambos') Then
  Begin
    If Trim(sFiltro)='' Then
     sFiltro:='VALOR_VFCPSTRET='+QuotedStr(sValorFCPSTRet)
    Else
     sFiltro:=sFiltro+' AND VALOR_VFCPSTRET='+QuotedStr(sValorFCPSTRet);
  End; // If (Trim(sValorFCPSTRet)<>'') And (Trim(sValorFCPSTRet)<>'Ambos') Then

  DMDebCredST.CDS_V_XMLsAnalisa.Filtered:=False;
  DMDebCredST.CDS_V_XMLsAnalisa.Filter:='';

  If Trim(sFiltro)<>'' Then
  Begin
    DMDebCredST.CDS_V_XMLsAnalisa.Filter:=sFiltro;
    DMDebCredST.CDS_V_XMLsAnalisa.Filtered:=True;
  End; // If Trim(sFiltro)<>'' Then
  EdtXMLsSelecionados.AsInteger:=DMDebCredST.CDS_V_XMLsAnalisa.RecordCount;

end;

end.

