{
-- Instalador em:
        - C:\Program Files (x86)\Inno Setup 5\Compil32.exe"
Pasta para Instala��o em:
        - C:\SolicitacaoTransferencias\
}

unit UFrmSolicTransf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvGradientCaption, StdCtrls, ExtCtrls, Grids, DBGrids,
  DBGridJul, AppEvnts, JvExControls, JvXPCore, JvXPButtons, Mask, ToolEdit,
  CurrEdit, DBXpress, ComCtrls, Commctrl, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, dxStatusBar, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Shellapi,
  jpeg, RelVisual;

type
  TFrmSolicTransf = class(TForm)
    CorCaptionForm: TJvGradientCaption;
    Pan_Loja: TPanel;
    ApplicationEvents1: TApplicationEvents;
    PC_Principal: TPageControl;
    Ts_Produtos: TTabSheet;
    Gb_Solicitacao: TGroupBox;
    Label1: TLabel;
    EdtQtdTransf: TCurrencyEdit;
    Dbg_Produtos: TDBGridJul;
    Bt_Incluir: TJvXPButton;
    Bt_Excluir: TJvXPButton;
    Label2: TLabel;
    EdtQtdEstoque: TCurrencyEdit;
    Stb_ParamTransf: TdxStatusBar;
    Lab_Unidade: TLabel;
    Ts_Consultas: TTabSheet;
    Gb_Verifica: TGroupBox;
    Gb_Produto: TGroupBox;
    EdtCodProdLinx: TCurrencyEdit;
    Bt_BuscaProdtudo: TJvXPButton;
    EdtDescProduto: TEdit;
    DtEdt_DtaInicio: TcxDateEdit;
    Label75: TLabel;
    DtEdt_DtaFim: TcxDateEdit;
    Label3: TLabel;
    Bt_Verificar: TJvXPButton;
    Dbg_VerificaProdutos: TDBGridJul;
    Label4: TLabel;
    dxStatusBar1: TdxStatusBar;
    DBGridJul1: TDBGridJul;
    Label5: TLabel;
    EdtQtdEstoqueCD: TCurrencyEdit;
    Lab_UnidadeCD: TLabel;
    Ts_NFeCheckOut: TTabSheet;
    Dbg_NFeProdutosOC: TDBGrid;
    Panel7: TPanel;
    Gb_NFe_Solicitacoes: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EdtNFeCodFornLinx: TCurrencyEdit;
    EdtNFeDesFornLinx: TEdit;
    Bt_NFeBuscaFornLinx: TJvXPButton;
    EdtNFeNumNFe: TCurrencyEdit;
    EdtNFeNumOC: TCurrencyEdit;
    Bt_NFeBuscaOC: TJvXPButton;
    Bt_NFeEscanear: TJvXPButton;
    Lbx_NFeNumOCs: TListBox;
    dxStatusBar2: TdxStatusBar;
    dxStatusBar3: TdxStatusBar;
    Ts_ProdNegativos: TTabSheet;
    Gb_ProdNegativos: TGroupBox;
    Dbg_ProdNegativos: TDBGrid;
    Pan_ProdNegativos: TPanel;
    Bt_ProdNegativosBusca: TJvXPButton;
    Bt_ProdNegativosMemoria: TJvXPButton;
    OdirPanApres: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure Dbg_ProdutosEnter(Sender: TObject);
    procedure EdtCodProdLinxExit(Sender: TObject);
    procedure EdtCodProdLinxChange(Sender: TObject);
    procedure Bt_BuscaProdtudoClick(Sender: TObject);
    procedure PC_PrincipalChange(Sender: TObject);

    // ODIR >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    // Hint em Fortma de Bal�o
    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Bal�o
    Procedure FocoToControl(Sender: TControl);

    Function  CriaLimitesLoja: Boolean;

    Procedure LimpaEdts;

    Function  NovaVersao: Boolean;

    Procedure CheckOutBuscaOC;
    Procedure CheckOutRetiraQtdCheckout;
    Procedure CheckOutRelatorio;

    // ODIR >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    procedure Dbg_ProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_IncluirClick(Sender: TObject);
    procedure Bt_ExcluirClick(Sender: TObject);
    procedure Dbg_ProdutosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtQtdTransfExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Dbg_VerificaProdutosEnter(Sender: TObject);
    procedure Bt_VerificarClick(Sender: TObject);
    procedure Dbg_VerificaProdutosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_VerificaProdutosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtNFeCodFornLinxExit(Sender: TObject);
    procedure Bt_NFeBuscaFornLinxClick(Sender: TObject);
    procedure Bt_NFeBuscaOCClick(Sender: TObject);
    procedure EdtNFeNumNFeChange(Sender: TObject);
    procedure EdtNFeNumOCExit(Sender: TObject);
    procedure EdtNFeCodFornLinxChange(Sender: TObject);
    procedure Bt_NFeEscanearClick(Sender: TObject);
    procedure Lbx_NFeNumOCsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtNFeCodFornLinxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtNFeNumOCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_NFeProdutosOCDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure EdtNFeNumNFeExit(Sender: TObject);
    procedure Dbg_NFeProdutosOCEnter(Sender: TObject);
    procedure Dbg_NFeProdutosOCTitleClick(Column: TColumn);
    procedure Bt_ProdNegativosBuscaClick(Sender: TObject);
    procedure Bt_ProdNegativosMemoriaClick(Sender: TObject); // Posiciona no Componente

  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  // Show Hint em Forma de Bal�o
  TTS_BALLOON = $40;
  TTM_SETTITLE = (WM_USER + 32);
  //////////////////////////////

var
  FrmSolicTransf: TFrmSolicTransf;

  // Show Hint em Forma de Bal�o
  hTooltip: Cardinal;
  ti: TToolInfo;
  buffer : array[0..255] of char;
  ///////////////////////////////

  // Cria Ponteiro de transac�o ================================================
  TD: TTransactionDesc;

  sgNumSolicitacao,
  sgCodProdLinx, sgCodProdSidicom
  : String;

//  sgCodLojaVersaoOK: String;

  igNumMaxProd, igQtdMaxProd: Integer;

  sgNrOCNova, sgNumSeqOCNova: String;

implementation

uses DK_Procs1, UDMSolicTransf, UPesquisa, DB, UFrmLeitoraCodBarras;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// CHECKOUT NFeE - Emiss�o do Relat�rio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSolicTransf.CheckOutRelatorio;
Var
  MySql: String;
  sNotas: String;
Begin
  // Burca Produtos Checados ===================================================
  MySql:=' SELECT DISTINCT'+
         ' oc.num_oc,'+
         ' oi.cod_produto_linx, oi.cod_produto_sidi,'+

         ' CASE'+
         '   WHEN TRIM(COALESCE(ps.referencia,''''))<>'''' THEN'+
         '     TRIM(ps.referencia)'+
         '   ELSE'+
         '     TRIM(pl.referencia)'+
         ' END REFERENCIA,'+

         ' oi.des_produto,'+
         ' oi.qtd_checkout,'+
         ' TRIM(COALESCE(en.zonaendereco,0))||''.''||COALESCE(en.corredor,''000'')||''.''||'+
         '      COALESCE(en.prateleira,''000'')||''.''||COALESCE(en.gaveta,''0000'') ENDERECO'+

         ' FROM OC_LOJAS_ITENS oi'+
         '     LEFT JOIN OC_LOJAS_NFE oc        ON oc.num_seq_oc=oi.num_seq_oc'+
         '     LEFT JOIN LINXPRODUTOS pl        ON pl.cod_produto=oi.cod_produto_linx'+
         '     LEFT JOIN PRODUTO ps             ON ps.codproduto=oi.cod_produto_sidi'+
         '     LEFT JOIN ESTOQUE en             ON en.codproduto=oi.cod_produto_sidi'+
         '                                     AND en.codfilial=''99'''+

         ' WHERE oi.num_seq_oc in ('+sgNrsSeqOCs+')'+
         ' AND   oi.qtd_checkout>0'+

         ' ORDER BY oi.des_produto';
  DMSolicTransf.CDS_Relatorio.Close;
  DMSolicTransf.SQLQ_Relatorio.Close;
  DMSolicTransf.SQLQ_Relatorio.SQL.Clear;
  DMSolicTransf.SQLQ_Relatorio.SQL.Add(MySql);
  DMSolicTransf.CDS_Relatorio.Open;

  If Not DMSolicTransf.CDS_Relatorio.IsEmpty Then
   Begin
     // Notas Fiscais Envolvidas nas OCs =======================================
     MySql:=' SELECT DISTINCT nf.num_nfe'+
            ' FROM OC_LOJAS_ITENS_NFE nf'+
            ' WHERE nf.num_seq_oc in ('+sgNrsSeqOCs+')';
     DMSolicTransf.CDS_BuscaRapida.Close;
     DMSolicTransf.SQLQ_BuscaRapida.Close;
     DMSolicTransf.SQLQ_BuscaRapida.SQL.Clear;
     DMSolicTransf.SQLQ_BuscaRapida.SQL.Add(MySql);
     DMSolicTransf.CDS_BuscaRapida.Open;
     sNotas:='';
     While Not DMSolicTransf.CDS_BuscaRapida.Eof do
     Begin
       If Trim(sNotas)='' Then
        sNotas:=DMSolicTransf.CDS_BuscaRapida.FieldByName('num_nfe').AsString
       Else
        sNotas:=sNotas+', '+DMSolicTransf.CDS_BuscaRapida.FieldByName('num_nfe').AsString;

       DMSolicTransf.CDS_BuscaRapida.Next;
     End; // While Not DMSolicTransf.CDS_BuscaRapida.Eof do
     DMSolicTransf.CDS_BuscaRapida.Close;

     // Imprime Relat�rio ======================================================
     With DMSolicTransf.RelVisual do
     Begin
       ClientDataSet:=DMSolicTransf.CDS_Relatorio;
       Destino:=toVisualiza;
       Orientacao:=toRetrato;

       RodapeGrupo:=True;

       TextoRodape:='';
       TextoRodapeGrupo:='';
       Zoom:=140;

       ImprimirTarjaCinza:=False;
       ImprimirVisto:=False;

       Cabecalho1Esquerda:=sgNomeLoja;
       Cabecalho1Direita:='#Data';
       Cabecalho1Centro:='RELAT�RIO DE ENTRADA DE PRODUTOS';

       Cabecalho2Esquerda:='Fornecedor: '+EdtNFeCodFornLinx.Text+' - '+EdtNFeDesFornLinx.Text;
       Cabecalho2Direita:=EmptyStr;
       Cabecalho2Centro:=EmptyStr;

       Cabecalho3Esquerda:='N� OC(s): '+sgNrsOCs;
       Cabecalho3Direita:='N� NFeE(s): '+sNotas;
       Cabecalho3Centro:=EmptyStr;

       DefinicaoCampos.Clear;
       DefinicaoCampos.Add('D0;12;D;;NUM_OC;N� OC');
       DefinicaoCampos.Add('D0;14;D;;COD_PRODUTO_SIDI;Cod Sidi');
       DefinicaoCampos.Add('D0;14;D;;COD_PRODUTO_LINX;Cod Linx');
       DefinicaoCampos.Add('D0;100;E;;DES_PRODUTO;Nome Produto');
       DefinicaoCampos.Add('D0;24;D;;QTD_CHECKOUT;Qtd CheckOut');
       DefinicaoCampos.Add('D0;26;C;;ENDERECO;Endere�amento');
       DefinicaoCampos.Add('D0;48;E;;REFERENCIA;Refer�ncia');

       Execute;
      End; // With DMRelatorio.RelVisual do
   End
  Else // If Not DMSolicTransf.CDS_Relatorio.IsEmpty Then
   Begin
     msg('Sem Produto com'+cr+cr+'CheckOut Efetuado !!','A');
   End; // If Not DMSolicTransf.CDS_Relatorio.IsEmpty Then
  DMSolicTransf.CDS_Relatorio.Close;
End; // CHECKOUT NFeE - Emiss�o do Relat�rio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// CHECKOUT NFeE - Retira Quantidade de CheckOut na Nota Fiscal >>>>>>>>>>>>>>>>
Procedure TFrmSolicTransf.CheckOutRetiraQtdCheckout;
Var
  MySql: String;
  iRecNo: Integer;
Begin
  iRecNo:=DMSolicTransf.CDS_OCItensCheck.RecNo;

  // Verifia se Existe Lan�amento da Nota Fiscal ===============================
  MySql:=' SELECT nf.num_seq_oc, nf.num_seq_item, nf.num_nfe,'+
         '        sum(nf.qtd_checkout) qtd_checkout'+
         ' FROM OC_LOJAS_ITENS_NFE nf'+
         ' WHERE nf.num_seq_oc='+DMSolicTransf.CDS_OCItensCheckNUM_SEQ_OC.AsString+
         ' AND nf.num_seq_item='+DMSolicTransf.CDS_OCItensCheckNUM_SEQ_ITEM.AsString+
         ' AND nf.num_nfe='+IntToStr(EdtNFeNumNFe.AsInteger)+
         ' GROUP BY 1,2,3';
  DMSolicTransf.CDS_BuscaRapida.Close;
  DMSolicTransf.SQLQ_BuscaRapida.Close;
  DMSolicTransf.SQLQ_BuscaRapida.SQL.Clear;
  DMSolicTransf.SQLQ_BuscaRapida.SQL.Add(MySql);
  DMSolicTransf.CDS_BuscaRapida.Open;

  If Trim(DMSolicTransf.CDS_BuscaRapida.FieldByName('Num_Seq_Oc').AsString)<>'' Then
   Begin
     OdirPanApres.Caption:='AGUARDE !! Retirando CheCkOut Efetuada Nesta Nota...';
     OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
     OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSolicTransf.Width-OdirPanApres.Width)/2));
     OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSolicTransf.Height-OdirPanApres.Height)/2))-20;
     OdirPanApres.Font.Style:=[fsBold];
     OdirPanApres.Parent:=FrmSolicTransf;
     OdirPanApres.BringToFront();
     OdirPanApres.Visible:=True;
     Refresh;

     // Verifica se Transa��o esta Ativa
     If DMSolicTransf.SQLC.InTransaction Then
      DMSolicTransf.SQLC.Rollback(TD);

     // Monta Transacao ========================================================
     TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
     TD.IsolationLevel:=xilREADCOMMITTED;
     DMSolicTransf.SQLC.StartTransaction(TD);
     Try // Try da Transa��o
       Screen.Cursor:=crAppStart;
       DateSeparator:='.';
       DecimalSeparator:='.';

       // Atualiza Produto =====================================================
       MySql:=' UPDATE OC_LOJAS_ITENS io'+
              ' SET  io.qtd_checkout=qtd_checkout-'+IntToStr(
              DMSolicTransf.CDS_BuscaRapida.FieldByName('qtd_checkout').AsInteger);

              If DMSolicTransf.CDS_BuscaRapida.FieldByName('qtd_checkout').AsInteger=DMSolicTransf.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then
               Begin
                 MySql:=
                  MySql+', io.dta_checkout=NULL'+
                        ', io.hra_checkout=NULL'
               End
              Else
               Begin
                 MySql:=
                  MySql+', io.dta_checkout=CURRENT_DATE'+
                        ', io.hra_checkout=CURRENT_TIME'
               End; // If DMSolicTransf.CDS_BuscaRapida.FieldByName('qtd_checkout').AsInteger=DMSolicTransf.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then

       MySql:=
        MySql+' WHERE io.num_seq_oc='+DMSolicTransf.CDS_OCItensCheckNUM_SEQ_OC.AsString+
              ' AND   io.num_seq_item='+DMSolicTransf.CDS_OCItensCheckNUM_SEQ_ITEM.AsString;
       DMSolicTransf.SQLC.Execute(MySql,nil,nil);

       // Retira Controle de Checkou da NFe ====================================
       MySql:=' DELETE FROM OC_LOJAS_ITENS_NFE nf'+
              ' WHERE nf.num_seq_oc='+DMSolicTransf.CDS_OCItensCheckNUM_SEQ_OC.AsString+
              ' AND nf.num_seq_item='+DMSolicTransf.CDS_OCItensCheckNUM_SEQ_ITEM.AsString+
              ' AND nf.num_nfe='+IntToStr(EdtNFeNumNFe.AsInteger);
       DMSolicTransf.SQLC.Execute(MySql,nil,nil);

       // Atualiza Transacao ===================================================
       DMSolicTransf.SQLC.Commit(TD);
     Except // Except da Transa��o
       on e : Exception do
       Begin
         // Abandona Transacao =================================================
         DMSolicTransf.SQLC.Rollback(TD);

          MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
        End; // on e : Exception do
      End; // Try da Transa��o
      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;
      OdirPanApres.Visible:=False;
   End
  Else // If Trim(DMSolicTransf.CDS_BuscaRapida.FieldByName('Num_Seq_Oc').AsString)<>'' Then
   Begin
     msg('Quantidade de ChekOut'+cr+'N�o Efetuada por Esta Nota !!','A')
   End; // If Trim(DMSolicTransf.CDS_BuscaRapida.FieldByName('Num_Seq_Oc').AsString)<>'' Then
  DMSolicTransf.CDS_BuscaRapida.Close;

  // Reabre Client dos Produtos da OC ==========================================
  DMSolicTransf.CDS_OCItensCheck.DisableControls;
  DMSolicTransf.CDS_OCItensCheck.Close;
  DMSolicTransf.CDS_OCItensCheck.Open;

  DMSolicTransf.CDS_OCItensCheck.EnableControls;

  // Posiciona no Produto ======================================================
  DMSolicTransf.CDS_OCItensCheck.RecNo:=iRecNo;

End; // CHECKOUT NFeE - Retira Quantidade de CheckOut na Nota Fiscal >>>>>>>>>>>

// CHECKOUT NFeE - Busca Ordens de Compra para CheckOut >>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSolicTransf.CheckOutBuscaOC;
Var
  MySql: String;
  i: Integer;
Begin
  DMSolicTransf.CDS_OCItensCheck.Close;

  sgNrsOCs:='';
  sgNrsSeqOCs:='';

  For i:=0 to Lbx_NFeNumOCs.Items.Count-1 do
  Begin
    If sgNrsOCs='' Then
     sgNrsOCs:=Lbx_NFeNumOCs.Items[i]
    Else
     sgNrsOCs:=sgNrsOCs+', '+Lbx_NFeNumOCs.Items[i];
  End; // For i:=0 to Lbx_NFeNumOCs.Items.Count-1 do

  If Trim(sgNrsOCs)='' Then
   Exit;

  // Busca Num_Seq_NFe da OCs ==================================================
  MySql:=' SELECT DISTINCT o.num_seq_oc'+
         ' FROM OC_LOJAS_NFE o'+
         ' WHERE o.num_oc IN ('+sgNrsOCs+')';
  DMSolicTransf.SQLQuery2.Close;
  DMSolicTransf.SQLQuery2.SQL.Clear;
  DMSolicTransf.SQLQuery2.SQL.Add(MySql);
  DMSolicTransf.SQLQuery2.Open;
  While Not DMSolicTransf.SQLQuery2.Eof do
  Begin
    If sgNrsSeqOCs='' Then
     sgNrsSeqOCs:=DMSolicTransf.SQLQuery2.FieldByName('num_seq_oc').AsString
    Else
     sgNrsSeqOCs:=sgNrsSeqOCs+', '+DMSolicTransf.SQLQuery2.FieldByName('num_seq_oc').AsString;

    DMSolicTransf.SQLQuery2.Next;
  End; // While Not DMSolicTransf.SQLQuery2.Eof do
  DMSolicTransf.SQLQuery2.Close;

  // Itens das OCs =============================================================
  MySql:=' SELECT DISTINCT'+
         ' oi.num_seq_oc, oi.num_seq_item, oc.num_oc,'+
         ' oi.cod_produto_linx, oi.cod_produto_sidi,'+

         ' TRIM(pl.referencia) REFERENCIA,'+

         ' oi.des_produto,'+
         ' oi.qtd_produto, oi.qtd_checkout,'+
         ' pl.cod_barra,'+
         ' TRIM(COALESCE(en.zonaendereco,0))||''.''||COALESCE(en.corredor,''000'')||''.''||'+
         '      COALESCE(en.prateleira,''000'')||''.''||COALESCE(en.gaveta,''0000'') ENDERECO,'+

         ' CASE'+
         '   WHEN ni.ind_oc IS NULL THEN'+
         '     ''S'''+
         '   ELSE'+
         '     ni.ind_oc'+
         ' END IND_OC,'+
         ' oi.dta_checkout, oi.hra_checkout'+

         ' FROM OC_LOJAS_ITENS oi'+
         '     LEFT JOIN OC_LOJAS_NFE oc        ON oc.num_seq_oc=oi.num_seq_oc'+
         '     LEFT JOIN OC_LOJAS_ITENS_NFE ni  ON ni.num_seq_oc=oi.num_seq_oc'+
         '                                     AND ni.num_seq_item=oi.num_seq_item'+
         '     LEFT JOIN LINXPRODUTOS pl        ON pl.cod_produto=oi.cod_produto_linx'+
         '     LEFT JOIN ESTOQUE en             ON en.codproduto=oi.cod_produto_sidi'+
         '                                     AND en.codfilial=''99'''+

         ' WHERE oi.num_seq_oc in ('+sgNrsSeqOCs+')'+
         ' ORDER BY oi.des_produto';
  DMSolicTransf.CDS_OCItensCheck.DisableControls;
  DMSolicTransf.CDS_OCItensCheck.Close;
  DMSolicTransf.CDS_OCItensCheck.Filtered:=False;
  DMSolicTransf.CDS_OCItensCheck.Filter:='';
  DMSolicTransf.SQLQ_OCItensCheck.SQL.Clear;
  DMSolicTransf.SQLQ_OCItensCheck.SQL.Add(MySql);
  DMSolicTransf.CDS_OCItensCheck.Open;

  DMSolicTransf.CDS_OCItensCheck.EnableControls;
End; // CHECKOUT NFeE - Busca Ordens de Compra para CheckOut >>>>>>>>>>>>>>>>>>>

// Atualiza Nova Vers�o do Sistema >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmSolicTransf.NovaVersao:Boolean;
Var
  MySql: String;

  sDtaAplicativo, sDtaVersao: String;
Begin
  Result:=True;

  sDtaAplicativo:=Copy(DateTimeToStr(FileDateToDateTime(
                       FileAge(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+
                       ExtractFileName(Application.ExeName)))),1,16);

  // Verifica se � Para Atualizar ==============================================
  MySql:=' SELECT *'+
         ' FROM TAB_AUXILIAR t'+
         ' WHERE t.tip_aux=20';
  DMSolicTransf.CDS_BuscaRapida.Close;
  DMSolicTransf.SQLQ_BuscaRapida.Close;
  DMSolicTransf.SQLQ_BuscaRapida.SQL.Clear;
  DMSolicTransf.SQLQ_BuscaRapida.SQL.Add(MySql);
  DMSolicTransf.CDS_BuscaRapida.Open;
  sDtaVersao:=Trim(DMSolicTransf.CDS_BuscaRapida.FieldByName('Des_Aux').AsString);
  DMSolicTransf.CDS_BuscaRapida.Close;

  // Analisa Nova Vers�o =======================================================
  If sDtaAplicativo<>sDtaVersao Then
   Result:=False;
End; // Atualiza Nova Vers�o do Sistema >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Limpa Todos os Edts e Datas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSolicTransf.LimpaEdts;
Begin
  EdtCodProdLinx.Clear;
  EdtDescProduto.Clear;
  EdtQtdEstoqueCD.Clear;
  EdtQtdEstoque.Clear;
  EdtQtdTransf.Clear;
  Lab_UnidadeCD.Caption:='';
  Lab_Unidade.Caption:='';

End; // Limpa Todos os Edts e Datas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Cria Limites da Loja em Tab_Auxiliar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmSolicTransf.CriaLimitesLoja: Boolean;
Var
  MySql: String;
Begin

  Result:=True;

  // Verifica se Transa��o esta Ativa
  If DMSolicTransf.SQLC.InTransaction Then
   DMSolicTransf.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMSolicTransf.SQLC.StartTransaction(TD);
  Try // Try da Transa��o
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' UPDATE OR INSERT INTO TAB_AUXILIAR'+
           ' (TIP_AUX, COD_AUX, DES_AUX, DES_AUX1, VLR_AUX, VLR_AUX1)'+
           ' VALUES ('+
           ' 19, '+ // TIP_AUX
           sgLojaLinx+', '+ // COD_AUX
           '25, '+ // DES_AUX
           '24, '+ // DES_AUX1
           ' NULL, '+ // VLR_AUX
           ' NULL)'+ // VLR_AUX1
           ' MATCHING (TIP_AUX, COD_AUX)';
    DMSolicTransf.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMSolicTransf.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;

  Except // Except da Transa��o
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      Result:=False;

      DMSolicTransf.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transa��o
End; // Cria Limites da Loja em Tab_Auxiliar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Bal�o >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmSolicTransf.CreateToolTips(hWnd: Cardinal);
begin
  hToolTip := CreateWindowEx(0, 'Tooltips_Class32', nil, TTS_ALWAYSTIP or TTS_BALLOON,
  Integer(CW_USEDEFAULT), Integer(CW_USEDEFAULT),Integer(CW_USEDEFAULT),
  Integer(CW_USEDEFAULT), hWnd, 0, hInstance, nil);

  if hToolTip <> 0 then
  begin
    SetWindowPos(hToolTip, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or  SWP_NOSIZE or SWP_NOACTIVATE);
    ti.cbSize := SizeOf(TToolInfo);
    ti.uFlags := TTF_SUBCLASS;
    ti.hInst := hInstance;
  end;
end; // Show Hint em Forma de Bal�o >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Bal�o - Usado no FormCreate >>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure AddToolTip(hwnd: dword; lpti: PToolInfo; IconType: Integer; Text, Title: PChar);
var
  Item: THandle;
  Rect: TRect;
begin

  Item := hWnd;

  if (Item <> 0) and (GetClientRect(Item, Rect)) then
  begin
    lpti.hwnd := Item;
    lpti.Rect := Rect;
    lpti.lpszText := Text;
    SendMessage(hToolTip, TTM_ADDTOOL, 0, Integer(lpti));
    FillChar(buffer, sizeof(buffer), #0);
    lstrcpy(buffer, Title);

    if (IconType > 3) or (IconType < 0) then
      IconType := 0;

    SendMessage(hToolTip, TTM_SETTITLE, IconType, Integer(@buffer));
  end;
end; // Show Hint em Forma de Bal�o - Usado no FormCreate >>>>>>>>>>>>>>>>>>>>>>

procedure TFrmSolicTransf.EdtNFeCodFornLinxChange(Sender: TObject);
begin
  DMSolicTransf.CDS_OCItensCheck.Close;
  EdtNFeDesFornLinx.Clear;
  Lbx_NFeNumOCs.Items.Clear;
  EdtNFeNumNFe.Clear;
end;

// Show Hint em Forma de Bal�o - Posiciona do Componente >>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSolicTransf.FocoToControl(Sender: TControl);
Var
 NewPos: TPoint;
Begin
  NewPos.X:=Sender.Left+(Sender.Width div 2);
  NewPos.y:=Sender.Top+(Sender.Height div 2);

  If Sender.Parent<>Nil Then
   NewPos:=Sender.Parent.ClientToScreen(NewPos);

  SetCursorPos(NewPos.x,NewPos.y)
End; // Show Hint em Forma de Bal�o - Posiciona do Componente >>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmSolicTransf.FormCreate(Sender: TObject);
const
  TipoDoIcone = 1; // Show Hint em Forma de Bal�o
Var
  MySql: String;
  b: Boolean;
  i, iIndexCol: Integer;
begin

  If not(fileexists(IncludeTrailingPathDelimiter(sgPastaExecutavel)+'Loja.ini')) then
  Begin
    msg('Defini��o da Loja N�o Encontrada !!'+cr+'Entrar em Contato com o ODIR'+cr+'Celcular:  999-578-234','A');
    Application.Terminate;
    Exit;
  End;

  // Verifica Parametro Enviado ================================================
//  sgCodLojaVersaoOK:='';
//  for i:=1 to ParamCount do
//   sgCodLojaVersaoOK:=ParamStr(i);

  // ===========================================================================
  // Coloca Icone no Form ======================================================
  // ===========================================================================
  Icon:=Application.Icon;
  // Coloca Icone no Form ======================================================
  // ===========================================================================

  // ===========================================================================
  // Descri��o do Loja =========================================================
  // ===========================================================================
  Pan_Loja.Caption:=sgNomeLoja;
  // Descri��o do Loja =========================================================
  // ===========================================================================

  // ===========================================================================
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  // ===========================================================================
  Application.OnMessage := ApplicationEvents1Message;
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  // ===========================================================================

  // ===========================================================================
  // N�o Permite Movimentar o Formul�rio =======================================
  // ===========================================================================
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);
  // N�o Permite Movimentar o Formul�rio =======================================
  // ===========================================================================

  // ===========================================================================
  // Show Hint em Forma de Bal�o ===============================================
  // ===========================================================================
  CreateToolTips(Self.Handle);
  AddToolTip(EdtCodProdLinx.Handle, @ti, TipoDoIcone, 'Informar C�digo Linx', 'C�DIGO DO PRODUTO !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_BuscaProdtudo.Handle, @ti, TipoDoIcone, 'Busca Produtos Linx', 'SELECIONA PRODUTO !!');

  CreateToolTips(Self.Handle);
  AddToolTip(EdtQtdTransf.Handle, @ti, TipoDoIcone, 'Informar Quantidade a Transferir', 'QUANTIDADE !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Incluir.Handle, @ti, TipoDoIcone, 'Inclui/Sobscreve'+cr+'Produto da Solicita��o', 'INCLUIR PRODUTO !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Excluir.Handle, @ti, TipoDoIcone, 'Exclui Produto Selecionado'+cr+'na Solicita��o', 'EXCLUIR PRODUTO !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_NFeBuscaFornLinx.Handle, @ti, TipoDoIcone, 'Busca Fornecedore', 'CHECKOUT PRODUTOS !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_NFeBuscaOC.Handle, @ti, TipoDoIcone, 'Busca Ordem de Compra', 'CHECKOUT PRODUTOS !!');


  CreateToolTips(Self.Handle);
  AddToolTip(Bt_NFeEscanear.Handle, @ti, TipoDoIcone, 'Orcanear Produtos', 'CHECKOUT PRODUTOS !!');
  // Show Hint em Forma de Bal�o ===============================================
  // ===========================================================================

  // ===========================================================================
  // Verifica Conex�o ==========================================================
  // ===========================================================================
  If Not DMSolicTransf.SQLC.Connected Then
   DMSolicTransf.SQLC.Connected:=True;
  // Verifica Conex�o ==========================================================
  // ===========================================================================

  // ===========================================================================
  // Busca Informa��es para Lojas ==============================================
  // ===========================================================================
  If sgLojaLinx<>'2' Then
  Begin
    // ===========================================================================
    // Busca Numero/Quantidade M�xima de Transferencia ===========================
    // ===========================================================================
    b:=True;
    While b do
    Begin
      MySql:=' SELECT t.des_aux Num_Prod, t.des_aux1 Qtd_Prod'+
             ' FROM TAB_AUXILIAR t'+
             ' WHERE t.tip_aux=19'+
             ' AND   t.cod_aux='+sgLojaLinx;
      DMSolicTransf.CDS_Busca.Close;
      DMSolicTransf.SQLQ_Busca.Close;
      DMSolicTransf.SQLQ_Busca.SQL.Clear;
      DMSolicTransf.SQLQ_Busca.SQL.Add(MySql);
      DMSolicTransf.CDS_Busca.Open;
      If Trim(DMSolicTransf.CDS_Busca.FieldByName('Num_Prod').AsString)='' Then
       Begin
         // Cria Limites da Loja em Tab_Auxiliar
         If Not CriaLimitesLoja Then
         Begin
           msg('Erro ao Criar Limites da Loja !!','A');
           Application.Terminate;
           Exit;
         End;
       End
      Else
       Begin
         Break;
       End; // If Trim(DMSolicTransf.CDS_Busca.FieldByName('Num_Prod').AsString)='' Then
    End; // While b do
    igNumMaxProd:=DMSolicTransf.CDS_Busca.FieldByName('Num_Prod').AsInteger;
    igQtdMaxProd:=DMSolicTransf.CDS_Busca.FieldByName('Qtd_Prod').AsInteger;
    DMSolicTransf.CDS_Busca.Close;
    Stb_ParamTransf.Panels[3].Text:='N� Maximo de Produtos/Dia: '+IntToStr(igNumMaxProd);
    Stb_ParamTransf.Panels[4].Text:='Quantidade Maxima Por Produto: '+IntToStr(igQtdMaxProd);
    // Busca Numero/Quantidade M�xima de Transferencia ===========================
    // ===========================================================================

    // ===========================================================================
    // Busca Solicita��o do Dia ==================================================
    // ===========================================================================
    MySql:=' SELECT tr.dta_solicitacao, tr.num_solicitacao,'+
           '        tr.cod_prod_linx, TRIM(pr.nome) nome,'+
           '        tr.qtd_estoque, tr.qtd_transf'+
           ' FROM SOL_TRANSFERENCIA_CD tr, LINXPRODUTOS pr'+
           ' WHERE tr.cod_prod_linx=pr.cod_produto'+
           ' AND  tr.dta_solicitacao=CURRENT_DATE'+
           ' AND  tr.cod_loja_linx='+sgLojaLinx+
           ' ORDER BY pr.nome';
    DMSolicTransf.CDS_Solicitacao.Close;
    DMSolicTransf.CDS_Solicitacao.Filtered:=False;
    DMSolicTransf.CDS_Solicitacao.Filter:='';
    DMSolicTransf.SQLQ_Solicitacao.Close;
    DMSolicTransf.SQLQ_Solicitacao.SQL.Clear;
    DMSolicTransf.SQLQ_Solicitacao.SQL.Add(MySql);
    DMSolicTransf.CDS_Solicitacao.Open;
    sgNumSolicitacao:=DMSolicTransf.CDS_SolicitacaoNUM_SOLICITACAO.AsString;
    // Busca Solicita��o do Dia ==================================================
    // ===========================================================================
  End; // If sgLojaLinx<>'2' Then
  // Busca Informa��es para Lojas ==============================================
  // ===========================================================================

  // ===========================================================================
  // Coluna de Endere�amento INVISIVEL para Lojas ==============================
  // ===========================================================================
  For iIndexCol:=0 to Dbg_NFeProdutosOC.Columns.Count-1 do
  Begin
    If Dbg_NFeProdutosOC.Columns[iIndexCol].FieldName='ENDERECO' Then
     Break;
  End; // For iIndexCol:=0 to Dbg_NFeProdutosOC.Columns.Count-1 do
  Dbg_NFeProdutosOC.Columns[iIndexCol].Visible:=False;
  // Coluna de Endere�amento INVISIVEL para Lojas ==============================
  // ===========================================================================

  // ===========================================================================
  // Acerta Apresenta��o para o CD =============================================
  // ===========================================================================
  If sgLojaLinx='2' Then
  Begin
    // =========================================================================
    // Inicializa TabSheets para o CD ==========================================
    // =========================================================================
    FrmSolicTransf.AutoSize:=False;
    Ts_Consultas.TabVisible:=False;
    Ts_Produtos.TabVisible:=False;
    FrmSolicTransf.Align:=alClient;
    FrmSolicTransf.AutoSize:=True;
    // Inicializa TabSheets para o CD ==========================================
    // =========================================================================

    // =========================================================================
    // Coluna de Endere�amento VISIVEL para CD =================================
    // =========================================================================
    Dbg_NFeProdutosOC.Columns[iIndexCol].Visible:=True;
    // Coluna de Endere�amento VISIVEL para CD =================================
    // =========================================================================
  End;
  // Acerta Apresenta��o para o CD =============================================
  // ===========================================================================

  PC_Principal.TabIndex:=0;
end;

procedure TFrmSolicTransf.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;
end;

procedure TFrmSolicTransf.FormShow(Sender: TObject);
begin
  If sgLojaLinx<>'2' Then
   Ts_NFeCheckOut.TabVisible:=False;


  // Cor Form
  CorCaptionForm.Active:=False;
  CorCaptionForm.Active:=True;

  // Atualiza Novca Vers�o do Sistema ==========================================
  If sgLojaLinx<>'2' Then // N�o Verifica Vers�o para o CD
  Begin
    If Not NovaVersao Then
    Begin
      msg('== TECNONOLOGIA DA INFORMA��O =='+cr+
          ' BelShop-CD ADVERTE !!'+cr+
          'Vers�o do Sistema esta Incorreta !!'+cr+
          'Solicite Atualiza��o Imediata'+cr+'para ODIR / ALINE...','A');
    End; // If not NovaVersao Then
  End; // If sgLojaLinx<>2 Then // N�o Verifica Vers�o para o CD
  PC_PrincipalChange(Self);

end;

procedure TFrmSolicTransf.ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
var
  Sentido: SmallInt;
begin
  // primeiramente verificamos se � o evento a ser tratado...
  If Msg.message = WM_MOUSEWHEEL then
  Begin
    Msg.message := WM_KEYDOWN;
    Msg.lParam := 0;
    Sentido := HiWord(Msg.wParam);
    if Sentido > 0 then
     Msg.wParam := VK_UP
    else
     Msg.wParam := VK_DOWN;
  End; // if Msg.message = WM_MOUSEWHEEL then
end;

procedure TFrmSolicTransf.Dbg_ProdutosEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_ProdutosEnter; // Nome do Evento do DBGRID
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmSolicTransf.EdtCodProdLinxExit(Sender: TObject);
Var
  MySql,
  sDesAtivado: String;
begin

  If EdtCodProdLinx.Value<>0 Then
  Begin
    If DMSolicTransf.CDS_Solicitacao.RecNo>=igNumMaxProd Then
    Begin
      msg('N�mero M�ximo de Produtos por'+cr+'Transfer�cia Di�ria Esta Completo !!'+cr+IntToStr(igNumMaxProd)+' Produtos por Dia !!','A');
      LimpaEdts;
      EdtCodProdLinx.SetFocus;
      Exit;
    End; // If Not bMultiplo Then

    Screen.Cursor:=crAppStart;

    // Verifica Conex�o ========================================================
    If Not DMSolicTransf.SQLC.Connected Then
     DMSolicTransf.SQLC.Connected:=True;


    // Buaca Saldo do Produto no CD ============================================
    MySql:=' SELECT pr.Cod_Produto, pr.Nome, pr.Cod_Auxiliar,'+
           '        pr.DesAtivado, pr.Unidade,'+
           '        COALESCE(pd.Quantidade,0) Quantidade'+
           ' FROM LINXPRODUTOS pr, LINXPRODUTOSDETALHES pd'+
           ' WHERE pr.cod_produto=pd.cod_produto'+
           ' AND   pd.empresa=2'+
           ' AND   pr.cod_produto='+IntToStr(EdtCodProdLinx.AsInteger);
    DMSolicTransf.CDS_Busca.Close;
    DMSolicTransf.SQLQ_Busca.Close;
    DMSolicTransf.SQLQ_Busca.SQL.Clear;
    DMSolicTransf.SQLQ_Busca.SQL.Add(MySql);
    DMSolicTransf.CDS_Busca.Open;

    EdtDescProduto.Text      :=Trim(DMSolicTransf.CDS_Busca.FieldByName('Nome').AsString);
    EdtQtdEstoqueCD.AsInteger:=DMSolicTransf.CDS_Busca.FieldByName('Quantidade').AsInteger;
    sDesAtivado              :=Trim(DMSolicTransf.CDS_Busca.FieldByName('DesAtivado').AsString);
    sgCodProdLinx            :=DMSolicTransf.CDS_Busca.FieldByName('Cod_Produto').AsString;
    sgCodProdSidicom         :=Trim(DMSolicTransf.CDS_Busca.FieldByName('Cod_Auxiliar').AsString);
    Lab_Unidade.Caption      :=Trim(DMSolicTransf.CDS_Busca.FieldByName('Unidade').AsString);
    Lab_UnidadeCD.Caption    :=Trim(DMSolicTransf.CDS_Busca.FieldByName('Unidade').AsString);

    DMSolicTransf.CDS_Busca.Close;

    // Acerta Quantidade para Separa��o ========================================
    If EdtQtdEstoqueCD.AsInteger>0 Then
    Begin
      // Busca Solicita��es em Aberto ==========================================
      MySql:=' SELECT Prod_Solic.Cod_produto, SUM(Prod_Solic.Qtd_Solic) Qtd_Solic'+
             ' FROM (SELECT p.cod_produto, SUM(l.Qtd_a_transf) Qtd_Solic'+
             '       FROM ES_ESTOQUES_LOJAS l, LINXPRODUTOS p'+
             '       WHERE l.cod_produto=p.cod_auxiliar'+
             '       AND   l.ind_transf=''SIM'''+
             '       AND   l.num_pedido=''000000'''+
             '       AND   l.qtd_a_transf>0.00'+
             '       AND   l.qtd_checkout=0.00'+
             '       AND   l.dta_movto=current_date'+
             '       AND   p.cod_produto='+IntToStr(EdtCodProdLinx.AsInteger)+
             '       GROUP BY 1'+

             '       UNION'+ //////////////////// UNION

             '       SELECT c.cod_prod_linx, SUM(c.Qtd_Transf) Qtd_Solic'+
             '       FROM SOL_TRANSFERENCIA_CD c'+
             '       WHERE c.doc_gerado=0'+
             '       AND   c.cod_prod_linx='+IntToStr(EdtCodProdLinx.AsInteger)+
             '       GROUP BY 1) Prod_Solic'+
             ' GROUP BY 1';
      DMSolicTransf.CDS_Busca.Close;
      DMSolicTransf.SQLQ_Busca.Close;
      DMSolicTransf.SQLQ_Busca.SQL.Clear;
      DMSolicTransf.SQLQ_Busca.SQL.Add(MySql);
      DMSolicTransf.CDS_Busca.Open;

      // Acerta Quantidade para Separa��o ======================================
      EdtQtdEstoqueCD.AsInteger:=EdtQtdEstoqueCD.AsInteger - DMSolicTransf.CDS_Busca.FieldByName('Qtd_Solic').AsInteger;

      If EdtQtdEstoqueCD.AsInteger<0 Then
       EdtQtdEstoqueCD.AsInteger:=0;

      DMSolicTransf.CDS_Busca.Close;
    End; // If EdtQtdEstoqueCD.AsInteger>0 Then

    Screen.Cursor:=crDefault;
    If EdtDescProduto.Text='' Then
    Begin
      msg('Produto (Linx) N�O Encontrado !!!', 'A');
      LimpaEdts;
      EdtCodProdLinx.SetFocus;
      Exit;
    End;

    If sDesAtivado='S' Then
    Begin
      msg('Produto (Linx) Desativado !!!', 'A');
      LimpaEdts;
      EdtCodProdLinx.SetFocus;
      Exit;
    End;

    If Trim(sgCodProdSidicom)='' Then
    Begin
      msg('Produto N�o Encontrado no CD !!!', 'A');
      LimpaEdts;
      EdtCodProdLinx.SetFocus;
      Exit;
    End;

    If EdtQtdEstoqueCD.AsInteger<1 Then
    Begin
      msg('Produto SEM ESTOQUE no CD !!!', 'A');
      LimpaEdts;
      EdtCodProdLinx.SetFocus;
      Exit;
    End;

    If EdtQtdEstoque.CanFocus   Then EdtQtdEstoque.SetFocus;
    If DtEdt_DtaInicio.CanFocus Then DtEdt_DtaInicio.SetFocus;
  End; // If EdtFiltroCodProdLinx.Value<>0 Then
end;

procedure TFrmSolicTransf.EdtCodProdLinxChange(Sender: TObject);
begin
  EdtDescProduto.Clear;
  Lab_Unidade.Caption:='';
  Lab_UnidadeCD.Caption:='';
  EdtQtdEstoque.Clear;
  EdtQtdEstoqueCD.Clear;
  EdtQtdTransf.Clear;
end;

procedure TFrmSolicTransf.Bt_BuscaProdtudoClick(Sender: TObject);
Var
  MySql: String;
  b:Boolean;
  sNome: String;
Begin

  LimpaEdts;
  b:=True;
  While b do
  Begin
    If InputQuery('Informe Parte do Nome','',sNome) then
     Begin
       Try
         If Trim(sNome)='' Then
          msg('Informe Parte'+cr+'do Nome do Produto !!','A')
         Else
          Break;
       Except
       End;
     End
    Else // If InputQuery('Informe o Desconto','',sVlrDesc) then
     Begin
       Exit;
     End; // If InputQuery('Informe o Desconto','',sVlrDesc) then
  End; // While b do

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  OdirPanApres.Caption:='AGUARDE !! Localizando Produtos no Servidor BelShop ...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSolicTransf.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSolicTransf.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmSolicTransf;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Verifica Conex�o ==========================================================
  If Not DMSolicTransf.SQLC.Connected Then
   DMSolicTransf.SQLC.Connected:=True;

  MySql:=' SELECT TRIM(pr.nome) nome, pr.cod_produto'+
         ' FROM LINXPRODUTOS pr'+
         ' WHERE pr.desativado=''N'''+
         ' AND pr.Nome LIKE ''%'+AnsiUpperCase(sNome)+'%'''+
         ' ORDER BY pr.nome';
  DMSolicTransf.CDS_Pesquisa.Close;
  DMSolicTransf.SQLQ_Pesquisa.Close;
  DMSolicTransf.SQLQ_Pesquisa.SQL.Clear;
  DMSolicTransf.SQLQ_Pesquisa.SQL.Add(MySql);
  DMSolicTransf.CDS_Pesquisa.Filtered:=False;
  DMSolicTransf.CDS_Pesquisa.Filter:='';
  DMSolicTransf.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;
  OdirPanApres.Visible:=False;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMSolicTransf.CDS_Pesquisa.FieldByName('Nome').AsString)='' Then
  Begin
    msg('Sem Produto a Listar !!','A');
    DMSolicTransf.CDS_Pesquisa.Close;
    FreeAndNil(FrmPesquisa);
    EdtCodProdLinx.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Nome';
  FrmPesquisa.Campo_Codigo:='Cod_Produto';
  FrmPesquisa.Campo_Descricao:='Nome';
  FrmPesquisa.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMSolicTransf.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    EdtCodProdLinx.AsInteger:=StrToInt(FrmPesquisa.EdtCodigo.Text);
    EdtCodProdLinxExit(Self);
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmSolicTransf.PC_PrincipalChange(Sender: TObject);
Var
  bFocar_Gb_Produto: Boolean;
begin
  CorSelecaoTabSheet(PC_Principal);

  LimpaEdts;

  If DMSolicTransf.CDS_ProdNegativos.Active Then
   DMSolicTransf.CDS_ProdNegativos.Close;

  bFocar_Gb_Produto:=False;

  If (PC_Principal.ActivePage=Ts_Produtos) And (Ts_Produtos.CanFocus) Then
  Begin
    CorCaptionForm.FormCaption:='BelShop - '+Ts_Produtos.Caption;
    Gb_Produto.Parent:=Gb_Solicitacao;
    bFocar_Gb_Produto:=True;
  End;

  If (PC_Principal.ActivePage=Ts_Consultas) And (Ts_Consultas.CanFocus) Then
  Begin
    bFocar_Gb_Produto:=True;
    CorCaptionForm.FormCaption:='BelShop - '+Ts_Consultas.Caption;
    Gb_Produto.Parent:=Gb_Verifica;
  End;

  If (PC_Principal.ActivePage=Ts_NFeCheckOut) And (Ts_NFeCheckOut.CanFocus) Then
  Begin
    CorCaptionForm.FormCaption:='BelShop - '+Ts_NFeCheckOut.Caption;
    EdtNFeCodFornLinx.SetFocus;
  End;

  If (PC_Principal.ActivePage=Ts_ProdNegativos) And (Ts_ProdNegativos.CanFocus) Then
  Begin
    CorCaptionForm.FormCaption:='BelShop - '+Ts_ProdNegativos.Caption;
    Dbg_ProdNegativos.SetFocus;
  End;

  If bFocar_Gb_Produto Then
  Begin
    Gb_Produto.TabOrder:=0;
    EdtCodProdLinx.SetFocus;
  End; //   If bFocar_Gb_Produto Then
end;

procedure TFrmSolicTransf.Dbg_ProdutosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Usado em:
  //=====================
  // Dbg_Produtos
  // Dbg_VerificaProdutos
  // Dbg_NFeProdutosOC
  //=====================
  // Bloquei Ctrl + Delete =====================================================
  If ((Shift = [ssCtrl]) And (key = vk_delete)) Then
   Abort;

  //============================================================================
  // Dbg_NFeProdutosOC =========================================================
  //============================================================================
  If (Sender as TDBGrid).Name='Dbg_NFeProdutosOC' Then
  Begin
    If DMSolicTransf.CDS_OCItensCheck.IsEmpty Then
     Exit;

    // CHECKOUT NFeE - Retira Quantidade de CheckOut na Nota Fiscal ============
    If Key=Vk_Delete Then
    Begin
      If DMSolicTransf.CDS_OCItensCheckQTD_CHECKOUT.AsInteger=0 Then
      Begin
        msg('Produto SEM Quantidade de Checout !!','A');
        Exit;
      End;

      // Retira Quantidade de Checkou da NFe
      CheckOutRetiraQtdCheckout;
    End; // If Key=Vk_Delete Then

    // Impress�o do Relat�rio do Produtos Checados =============================
    If Key=Vk_F3 Then
    Begin
      CheckOutRelatorio;
    End; // If Key=Vk_F3 Then
  End; // If (Sender as TDBGrid).Name='Dbg_NFeProdutosOC' Then
  // Dbg_NFeProdutosOC =========================================================
  //============================================================================
end;

procedure TFrmSolicTransf.Bt_IncluirClick(Sender: TObject);
Var
  MySql: String;
begin
  If DMSolicTransf.CDS_Solicitacao.RecNo>=igNumMaxProd Then
  Begin
    msg('N�mero M�ximo de Produtos por'+cr+'Transfer�cia Di�ria Esta Completo !!'+cr+IntToStr(igNumMaxProd)+' Produtos por Dia !!','A');
    LimpaEdts;
    EdtCodProdLinx.SetFocus;
    Exit;
  End; // If Not bMultiplo Then

  // Consiste ==================================================================
  If EdtCodProdLinx.AsInteger=0 Then
  Begin
    msg('Favor Informar o Produto !!','A');
    EdtCodProdLinx.SetFocus;
    Exit;
  End;

  If EdtQtdTransf.AsInteger=0 Then
  Begin
    msg('Quantidade a Transferir � Inv�lida !!','A');
    EdtQtdTransf.SetFocus;
    Exit;
  End;

  If EdtQtdEstoque.AsInteger<0 Then
  Begin
    msg('Estoque F�sico Inv�lido (Negativo) !!','A');
    EdtQtdEstoque.SetFocus;
    Exit;
  End;

  If EdtQtdTransf.AsInteger>EdtQtdEstoqueCD.AsInteger Then
  Begin
    msg('Quantidade Solicitada � Maior'+cr+cr+'Que Estoque Dispon�vel no CD !!','X');
    EdtQtdTransf.SetFocus;
    Exit;
  End;

  OdirPanApres.Caption:='AGUARDE !! Incluindo Produto na Solicita��o';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSolicTransf.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSolicTransf.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmSolicTransf;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // ===========================================================================
  // Busca Numero da Solicita��o ===============================================
  // ===========================================================================
  If Trim(sgNumSolicitacao)='' Then
  Begin
    If Trim(sgNumSolicitacao)='' Then
    Begin
      MySql:=' SELECT GEN_ID(GEN_SOLIC_TRANSFERENCIAS,1) Numero'+
             ' FROM RDB$DATABASE';
      DMSolicTransf.CDS_Busca.Close;
      DMSolicTransf.SQLQ_Busca.Close;
      DMSolicTransf.SQLQ_Busca.SQL.Clear;
      DMSolicTransf.SQLQ_Busca.SQL.Add(MySql);
      DMSolicTransf.CDS_Busca.Open;
      sgNumSolicitacao:=DMSolicTransf.CDS_Busca.FieldByName('Numero').AsString;
      DMSolicTransf.CDS_Busca.Close;
    End; // If Trim(sgNumSolicitacao)='' Then
  End; // If Trim(sgNumSolicitacao)='' Then
  // Busca Numero da Solicita��o ===============================================
  // ===========================================================================

  // Verifica Conex�o ==========================================================
  If Not DMSolicTransf.SQLC.Connected Then
   DMSolicTransf.SQLC.Connected:=True;

  // Verifica se Transa��o esta Ativa
  If DMSolicTransf.SQLC.InTransaction Then
   DMSolicTransf.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMSolicTransf.SQLC.StartTransaction(TD);
  Try // Try da Transa��o
    Screen.Cursor:=crAppStart;

    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' UPDATE OR INSERT INTO SOL_TRANSFERENCIA_CD'+
           ' (DTA_SOLICITACAO, NUM_SOLICITACAO, COD_LOJA_SIDI, COD_LOJA_LINX,'+
           '  COD_PROD_LINX, COD_PROD_SIDI, QTD_ESTOQUE, QTD_TRANSF)'+
           ' VALUES (CURRENT_DATE,'+ // DTA_SOLICITACAO
           sgNumSolicitacao+', '+ // NUM_SOLICITACAO
           QuotedStr(sgLojaSidicom)+', '+ // COD_LOJA_SIDI
           sgLojaLinx+', '+ // COD_LOJA_LINX
           sgCodProdLinx+', '; // COD_PROD_LINX

           // COD_PROD_SIDI
           If Trim(sgCodProdSidicom)<>'' Then
            MySql:=
             MySql+QuotedStr(sgCodProdSidicom)+', '
           Else
            MySql:=
             MySql+'NULL , ';

    MySql:=
     MySql+IntToStr(EdtQtdEstoque.AsInteger)+', '+ // QTD_ESTOQUE
           IntToStr(EdtQtdTransf.AsInteger)+')'+ // QTD_TRANSF
           ' MATCHING (DTA_SOLICITACAO, NUM_SOLICITACAO, COD_LOJA_LINX, COD_PROD_LINX)';
    DMSolicTransf.SQLC.Execute(MySql,nil,nil);

    DMSolicTransf.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;

    DMSolicTransf.CDS_Solicitacao.Close;
    DMSolicTransf.CDS_Solicitacao.Open;
    DMSolicTransf.CDS_Solicitacao.Locate('COD_PROD_LINX', sgCodProdLinx,[]);
  Except // Except da Transa��o
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMSolicTransf.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      OdirPanApres.Visible:=False;
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Exit;
    End; // on e : Exception do
  End; // Try da Transa��o

  LimpaEdts;
  
  EdtCodProdLinx.SetFocus;
end;

procedure TFrmSolicTransf.Bt_ExcluirClick(Sender: TObject);
Var
  MySql: String;
begin

  If DMSolicTransf.CDS_Solicitacao.IsEmpty Then
   Exit;

  If msg('Excluir o Produto Selecionado ?'+cr+DMSolicTransf.CDS_SolicitacaoNOME.AsString,'C')=2 Then
   Exit;

  EdtCodProdLinxChange(Self);
  EdtCodProdLinx.Clear;

  OdirPanApres.Caption:='AGUARDE !! Excluindo Produto da Solicita��o...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSolicTransf.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSolicTransf.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmSolicTransf;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Verifica Conex�o ==========================================================
  If Not DMSolicTransf.SQLC.Connected Then
   DMSolicTransf.SQLC.Connected:=True;

  // Verifica se Transa��o esta Ativa
  If DMSolicTransf.SQLC.InTransaction Then
   DMSolicTransf.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMSolicTransf.SQLC.StartTransaction(TD);
  Try // Try da Transa��o
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' DELETE FROM SOL_TRANSFERENCIA_CD so'+
           ' WHERE so.dta_solicitacao=CURRENT_DATE'+
           ' AND   so.num_solicitacao='+DMSolicTransf.CDS_SolicitacaoNUM_SOLICITACAO.AsString+
           ' AND   so.cod_prod_linx='+DMSolicTransf.CDS_SolicitacaoCOD_PROD_LINX.AsString;
    DMSolicTransf.SQLC.Execute(MySql,nil,nil);

    DMSolicTransf.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;

    DMSolicTransf.CDS_Solicitacao.Close;
    DMSolicTransf.CDS_Solicitacao.Open;

    msg('Exclus�o Efetuada com SUCESSO !!','A');

  Except // Except da Transa��o
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMSolicTransf.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      OdirPanApres.Visible:=False;
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transa��o

  EdtCodProdLinx.SetFocus;
end;

procedure TFrmSolicTransf.Dbg_ProdutosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  sValor, sCodProd: String;
  b: Boolean;
begin
  If DMSolicTransf.CDS_Solicitacao.IsEmpty Then
   Exit;

  // Localizar Produto =========================================================
  If Key=Vk_F4 Then
  Begin
    sCodProd:= DMSolicTransf.CDS_SolicitacaoCOD_PROD_LINX.AsString;
    
    sValor:='';
    b:=True;
    While b do
    Begin
      If InputQuery('Localizar Produto','',sValor) then
       Begin
         Try
           StrToInt(sValor);

           If Not DMSolicTransf.CDS_Solicitacao.Locate('COD_PROD_LINX', sValor,[]) Then
           Begin
            If Not LocalizaRegistro(DMSolicTransf.CDS_Solicitacao, 'COD_PROD_LINX', sValor) Then
             b:=False;
           End; // If Not DMSolicTransf.CDS_Solicitacao.Locate('COD_PROD_LINX', sValor,[]) Then

           Break;
         Except
           If Not DMSolicTransf.CDS_Solicitacao.Locate('NOME', sValor,[]) Then
           Begin
             If Not LocalizaRegistro(DMSolicTransf.CDS_Solicitacao, 'NOME', sValor) Then
              b:=False;
           End; // If Not DMSolicTransf.CDS_Solicitacao.Locate('NOME', sValor,[]) Then

           Break;
         End;
       End
      Else // If InputQuery('Localizar Produto','',sValor) then
       Begin
         Break;
       End; // If InputQuery('Localizar Produto','',sValor) then
    End; // While b do

    If Not b Then
    Begin
      DMSolicTransf.CDS_Solicitacao.Locate('COD_PROD_LINX',sCodProd,[]);
      msg('Produto N�o Localizado !!','A');
    End;
  End; // If Key=Vk_F4 Then

end;

procedure TFrmSolicTransf.EdtQtdTransfExit(Sender: TObject);
Var
  MySql: String;
  sCodGrupo, sCodSubGrupo, sQtdCaixa: String;
  iQtdMultiplo: Integer;
  bMultiplo: Boolean;
begin

  If (EdtCodProdLinx.AsInteger=0) and (EdtQtdTransf.AsInteger=0) Then
  Begin
    EdtCodProdLinx.SetFocus;
    Exit;
  End;

  If EdtQtdTransf.AsInteger=0 Then
  Begin
    msg('Quantidade de Transfer�ncia'+cr+'INV�LIDA !!','A');
    EdtCodProdLinx.SetFocus;
    Exit;
  End;

  If EdtCodProdLinx.AsInteger=0 Then
  Begin
    msg('Favor Informar o Produto !!','A');
    EdtCodProdLinx.SetFocus;
    Exit;
  End;

  // Verifica Conex�o ==========================================================
  If Not DMSolicTransf.SQLC.Connected Then
   DMSolicTransf.SQLC.Connected:=True;

  bMultiplo:=False;

// Retirado Controle de Qtd/Cx - 27/09/2018 ====================================
//  // Busca Produto Caixa Embarque ==============================================
//  MySql:=' SELECT Trim(pr.codgrupo) CodGrupo, Trim(pr.codsubgrupo) CodSubGrupo'+
//         ' FROM PRODUTO pr'+
//         ' WHERE pr.codproduto='+QuotedStr(sgCodProdSidicom);
//  DMSolicTransf.CDS_Busca.Close;
//  DMSolicTransf.SQLQ_Busca.Close;
//  DMSolicTransf.SQLQ_Busca.SQL.Clear;
//  DMSolicTransf.SQLQ_Busca.SQL.Add(MySql);
//  DMSolicTransf.CDS_Busca.Open;
//  sCodGrupo   :=DMSolicTransf.CDS_Busca.FieldByName('CodGrupo').AsString;
//  sCodSubGrupo:=DMSolicTransf.CDS_Busca.FieldByName('CodSubGrupo').AsString;
//  DMSolicTransf.CDS_Busca.Close;
//
//  MySql:=' SELECT cp.Cod_Produto, cp.Cod_Grupo, cp.Cod_Subgrupo,'+
//         '        cp.Qtd_Caixa, cp.Per_Corte'+
//         ' FROM PROD_CAIXA_CD cp'+
//         ' WHERE ((cp.cod_produto='+QuotedStr(sgCodProdSidicom)+')'+
//         '        OR'+
//         '        ((cp.cod_grupo='+QuotedStr(sCodGrupo)+') and (cp.cod_subgrupo is null))'+
//         '        OR'+
//         '        ((cp.cod_grupo='+QuotedStr(sCodGrupo)+') and (cp.cod_subgrupo='+QuotedStr(sCodSubGrupo)+')))'+
//         ' ORDER BY 1 desc, 4 desc';
//  DMSolicTransf.CDS_Busca.Close;
//  DMSolicTransf.SQLQ_Busca.Close;
//  DMSolicTransf.SQLQ_Busca.SQL.Clear;
//  DMSolicTransf.SQLQ_Busca.SQL.Add(MySql);
//  DMSolicTransf.CDS_Busca.Open;
//
//  sQtdCaixa:=DMSolicTransf.CDS_Busca.FieldByName('Qtd_Caixa').AsString;
//  DMSolicTransf.CDS_Busca.Close;
//
//  If Trim(sQtdCaixa)<>'' Then
//  Begin
//    bMultiplo:=True;
//    If StrToInt(sQtdCaixa)<>igQtdMaxProd Then
//    Begin
//      MessageBox(Application.Handle, Pchar('PRODUTO com CAIXA de Transfer�ncia'+cr+
//                                           'com '+sQtdCaixa+' Produtos por Caixa'), 'Aviso', MB_ICONEXCLAMATION);
//
//      If EdtQtdTransf.AsInteger<StrToInt(sQtdCaixa) Then
//       Begin
//         EdtQtdTransf.AsInteger:=StrToInt(sQtdCaixa)
//       End
//      Else If EdtQtdTransf.AsInteger>StrToInt(sQtdCaixa) Then // Calcula Multiplo
//       Begin
//         iQtdMultiplo:=StrToInt(sQtdCaixa);
//         While bMultiplo do
//         Begin
//           If iQtdMultiplo>igQtdMaxProd Then
//           Begin
//             EdtQtdTransf.AsInteger:=iQtdMultiplo;
//             Break;
//           End;
//
//           If EdtQtdTransf.AsInteger<iQtdMultiplo Then
//           Begin
//             EdtQtdTransf.AsInteger:=iQtdMultiplo;
//             Break;
//           End;
//
//           If EdtQtdTransf.AsInteger=iQtdMultiplo Then
//            Begin
//              Break;
//            End
//           Else
//            Begin
//              iQtdMultiplo:=iQtdMultiplo+StrToInt(sQtdCaixa);
//            End;
//         End; // While bMultiplo do
//       End; // If EdtQtdTransf.AsInteger<StrToInt(sQtdCaixa) Then
//    End; // If StrToInt(sQtdCaixa)<>igQtdMaxProd Then
//    Bt_Incluir.SetFocus;
//  End; // If Trim(sQtdCaixa)<>'' Then

  If (Not bMultiplo) And (EdtQtdTransf.AsInteger>igQtdMaxProd) Then
  Begin
    msg('Quantidade de Transfer�ncia Inv�lida !!'+cr+'Superior ao Maximo de '+IntToStr(igQtdMaxProd)+' por Produto','A');
    EdtQtdTransf.SetFocus;
    Exit;
  End; // If Not bMultiplo Then

end;

procedure TFrmSolicTransf.FormCloseQuery(Sender: TObject;  var CanClose: Boolean);
begin
  // Encerra Conex�o ===========================================================
  If DMSolicTransf.SQLC.Connected Then
   DMSolicTransf.SQLC.Connected:=False;

end;

procedure TFrmSolicTransf.Dbg_VerificaProdutosEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_VerificaProdutosEnter; // Nome do Evento do DBGRID
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmSolicTransf.Bt_VerificarClick(Sender: TObject);
Var
  MySql: String;
begin
  Try
    StrToDate(DtEdt_DtaInicio.Text);
  Except
    msg('Data Inicial Inv�lida !!','A');
    DtEdt_DtaInicio.SetFocus;
    Exit;
  End;

  Try
    StrToDate(DtEdt_DtaFim.Text);
  Except
    msg('Data Final Inv�lida !!','A');
    DtEdt_DtaFim.SetFocus;
    Exit;
  End;

  If DtEdt_DtaFim.Date>=dgDtaHoje Then
  Begin
    msg('Data Final Deve Ser'+cr+cr+'MENOR que Hoje !!','A');
    DtEdt_DtaFim.SetFocus;
    Exit;
  End;

  If DtEdt_DtaFim.Date<DtEdt_DtaInicio.Date Then
  Begin
    msg('Per�odo Inv�lido !!','A');
    DtEdt_DtaInicio.SetFocus;
    Exit;
  End;

  If (DtEdt_DtaFim.Date-DtEdt_DtaInicio.Date)>10 Then
  Begin
    msg('Per�odo a Verificar deve Conter'+cr+cr+'no M�ximo 10 (DEZ) Dias !!','A');
    DtEdt_DtaInicio.SetFocus;
    Exit;
  End;

  MySql:=' SELECT so.dta_solicitacao, pl.nome,'+

         ' CASE'+
         '   WHEN so.doc_gerado=0 THEN'+
         '     ''N�O'''+
         '   ELSE'+
         '     ''SIM'''+
         ' END enviado_cd,'+

         ' CASE'+
         '   WHEN (COALESCE(el.num_pedido,''000000'')<>''000000'') AND (CAST(COALESCE(el.num_pedido,''0'') AS INTEGER)<999990) THEN'+
         '     ''SIM'''+
         '   ELSE'+
         '     ''N�O'''+
         ' END transf_loja,'+

         ' so.qtd_transf Qtd_Solicitada,'+
         ' el.qtd_transf Qtd_De_Transf,'+

         ' CASE'+
         '   WHEN (COALESCE(el.num_pedido,''000000'')<>''000000'') AND (CAST(COALESCE(el.num_pedido,''0'') AS INTEGER)<999990) THEN'+
         '     el.qtd_a_transf'+
         '   ELSE'+
         '     0'+
         ' END qtd_a_transf,'+

         ' so.cod_prod_sidi, so.cod_prod_linx,'+
         ' so.dta_processamento, so.doc_gerado, el.obs_docto, so.num_solicitacao'+

         ' FROM SOL_TRANSFERENCIA_CD so'+
         '    LEFT JOIN LINXPRODUTOS      pl  ON pl.cod_produto=so.cod_prod_linx'+
         '    LEFT JOIN ES_ESTOQUES_LOJAS el  ON el.dta_movto  =so.dta_processamento'+
         '                                   AND el.num_docto  =so.doc_gerado'+
         '                                   AND el.cod_produto=so.cod_prod_sidi'+
         '                                   AND el.cod_loja   =so.cod_loja_sidi'+

         ' WHERE so.dta_solicitacao BETWEEN '+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaInicio.Date))))+' AND '+
                                              QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaFim.Date))))+
         ' AND   so.cod_loja_linx='+sgLojaLinx;

         If EdtCodProdLinx.AsInteger<>0 Then
          MySql:=
           MySql+' AND   so.cod_prod_linx='+IntToStr(EdtCodProdLinx.AsInteger);

  MySql:=
   MySql+' ORDER BY 2, 1';
  DMSolicTransf.CDS_Verifica.Close;
  DMSolicTransf.SQLQ_Verifica.Close;
  DMSolicTransf.SQLQ_Verifica.SQL.Clear;
  DMSolicTransf.SQLQ_Verifica.SQL.Add(MySql);
  DMSolicTransf.CDS_Verifica.Open;

  If Trim(DMSolicTransf.CDS_VerificaCOD_PROD_LINX.AsString)='' Then
  Begin
    msg('Sem Solicita��o a'+cr+cr+'Lista no Per�odo !!','A');
    DMSolicTransf.CDS_Verifica.Close;
    LimpaEdts;
    EdtCodProdLinx.SetFocus;
    Exit;
  End;
  Dbg_VerificaProdutos.SetFocus;
end;

procedure TFrmSolicTransf.Dbg_VerificaProdutosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If (Column.FieldName='ENVIADO_CD') Then // Este comando altera cor da Celula
  Begin
    If DMSolicTransf.CDS_VerificaENVIADO_CD.AsString='SIM' Then
    Begin
      Dbg_VerificaProdutos.Canvas.Font.Style:=[fsBold];
      Dbg_VerificaProdutos.Canvas.Font.Color:=clBlue; // Cor da Fonte
    End;
  End;

  If (Column.FieldName='TRANSF_LOJA') Then // Este comando altera cor da Celula
  Begin
    If DMSolicTransf.CDS_VerificaTRANSF_LOJA.AsString='SIM' Then
    Begin
      Dbg_VerificaProdutos.Canvas.Font.Style:=[fsBold];
      Dbg_VerificaProdutos.Canvas.Font.Color:=clBlue; // Cor da Fonte
    End;
  End;

  If (Column.FieldName='QTD_A_TRANSF') Then // Este comando altera cor da Celula
  Begin
    If DMSolicTransf.CDS_VerificaQTD_A_TRANSF.AsCurrency<>0.00 Then
    Begin
      Dbg_VerificaProdutos.Canvas.Font.Style:=[fsBold];
      Dbg_VerificaProdutos.Canvas.Font.Color:=clBlue; // Cor da Fonte
    End;
  End;
  Dbg_VerificaProdutos.Canvas.FillRect(Rect);
  Dbg_VerificaProdutos.DefaultDrawDataCell(Rect,Column.Field,state);

  // Alinhamento
  DMSolicTransf.CDS_VerificaDTA_SOLICITACAO.Alignment:=taCenter;
  DMSolicTransf.CDS_VerificaENVIADO_CD.Alignment:=taCenter;
  DMSolicTransf.CDS_VerificaTRANSF_LOJA.Alignment:=taCenter;
  DMSolicTransf.CDS_VerificaQTD_DE_TRANSF.Alignment:=taRightJustify;
  DMSolicTransf.CDS_VerificaQTD_A_TRANSF.Alignment:=taRightJustify;
  DMSolicTransf.CDS_VerificaCOD_PROD_LINX.Alignment:=taRightJustify;
  DMSolicTransf.CDS_VerificaCOD_PROD_SIDI.Alignment:=taRightJustify;
  DMSolicTransf.CDS_VerificaDTA_PROCESSAMENTO.Alignment:=taCenter;
  DMSolicTransf.CDS_VerificaDOC_GERADO.Alignment:=taRightJustify;
  DMSolicTransf.CDS_VerificaNUM_SOLICITACAO.Alignment:=taRightJustify;
end;

procedure TFrmSolicTransf.Dbg_VerificaProdutosKeyUp(Sender: TObject; Var Key: Word; Shift: TShiftState);
Var
  sValor, sCodProd: String;
  b: Boolean;
begin

  If DMSolicTransf.CDS_Verifica.IsEmpty Then
   Exit;

  // Localizar Produto =========================================================
  If Key=Vk_F4 Then
  Begin
    sCodProd:= DMSolicTransf.CDS_VerificaCOD_PROD_LINX.AsString;

    sValor:='';
    b:=True;
    While b do
    Begin
      If InputQuery('Localizar Produto','',sValor) then
       Begin
         Try
           StrToInt(sValor);

           If Not DMSolicTransf.CDS_Verifica.Locate('COD_PROD_LINX', sValor,[]) Then
           Begin
            If Not LocalizaRegistro(DMSolicTransf.CDS_Verifica, 'COD_PROD_LINX', sValor) Then
             b:=False;
           End; // If Not DMSolicTransf.CDS_Verifica.Locate('COD_PROD_LINX', sValor,[]) Then

           Break;
         Except
           If Not DMSolicTransf.CDS_Verifica.Locate('NOME', sValor,[]) Then
           Begin
             If Not LocalizaRegistro(DMSolicTransf.CDS_Verifica, 'NOME', sValor) Then
              b:=False;
           End; // If Not DMSolicTransf.CDS_Verifica.Locate('NOME', sValor,[]) Then

           Break;
         End;
       End
      Else // If InputQuery('Localizar Produto','',sValor) then
       Begin
         Break;
       End; // If InputQuery('Localizar Produto','',sValor) then
    End; // While b do

    If Not b Then
    Begin
      DMSolicTransf.CDS_Verifica.Locate('COD_PROD_LINX',sCodProd,[]);
      msg('Produto N�o Localizado !!','A');
    End;
  End; // If Key=Vk_F4 Then
end;

procedure TFrmSolicTransf.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Vers�o do Sistema =========================================================
  If Key=Vk_F1 Then
  Begin
    msg('Data da �ltima Altera��o: '+cr+cr+Copy(DateTimeToStr(FileDateToDateTime(
        FileAge(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+
        ExtractFileName(Application.ExeName)))),1,19),'A');
  End;

end;

procedure TFrmSolicTransf.EdtNFeCodFornLinxExit(Sender: TObject);
Var
  MySql: String;
begin

  EdtNFeDesFornLinx.Clear;
  EdtNFeNumNFe.Clear;
  EdtNFeNumOC.Clear;

  sgNumSeqOCNova:='';
  sgNrOCNova:='';
  bgOCNova:=False;
  EdtNFeNumOC.Enabled:=True;
  Bt_NFeBuscaOC.Enabled:=True;
  Lbx_NFeNumOCs.Enabled:=True;

  If EdtNFeCodFornLinx.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Fornecedores ========================================================
    MySql:=' SELECT fo.nome_cliente des_forn_linx, fo.cod_cliente cod_forn_linx'+
           ' FROM LINXCLIENTESFORNEC fo'+
           ' WHERE fo.tipo_cliente IN (''F'',''A'',''J'')'+
           ' AND   TRIM(COALESCE(fo.nome_cliente,''''))<>'''''+
           ' AND   EXISTS(SELECT 1'+
           '              FROM LINXPRODUTOS pr'+
           '              WHERE pr.cod_fornecedor = fo.cod_cliente)'+
           ' AND   fo.cod_cliente='+VarToStr(EdtNFeCodFornLinx.AsInteger)+

           ' UNION '+

           ' SELECT be.nome_cliente, be.cod_cliente'+
           ' FROM LINXCLIENTESFORNEC be'+
           ' WHERE UPPER(be.nome_cliente) LIKE ''%BELSHOP%'''+
           ' AND   be.cod_cliente='+VarToStr(EdtNFeCodFornLinx.AsInteger);
    DMSolicTransf.SQLQuery1.Close;
    DMSolicTransf.SQLQuery1.SQL.Clear;
    DMSolicTransf.SQLQuery1.SQL.Add(MySql);
    DMSolicTransf.SQLQuery1.Open;

    // ============== Verifica Existencia de Dados ===============================
    If Trim(DMSolicTransf.SQLQuery1.FieldByName('des_forn_linx').AsString)='' Then
    Begin
      DMSolicTransf.SQLQuery1.Close;
      msg('Fornecedor N�o Encontrado !!','A');
      EdtNFeCodFornLinx.SetFocus;
      Exit;
    End;
    EdtNFeDesFornLinx.Text:=DMSolicTransf.SQLQuery1.FieldByName('des_forn_linx').AsString;

    // Busca OC do Fornecedor ==================================================
    MySql:=' SELECT FIRST 1 fo.des_forn_linx, fo.cod_forn_linx'+
           ' FROM OC_LOJAS_NFE fo'+
           ' WHERE fo.cod_loja_linx='+sgLojaLinx+
           ' AND   fo.cod_forn_linx='+VarToStr(EdtNFeCodFornLinx.AsInteger);
    DMSolicTransf.SQLQuery1.Close;
    DMSolicTransf.SQLQuery1.SQL.Clear;
    DMSolicTransf.SQLQuery1.SQL.Add(MySql);
    DMSolicTransf.SQLQuery1.Open;

    If Trim(DMSolicTransf.SQLQuery1.FieldByName('des_forn_linx').AsString)='' Then
    Begin
      If msg('Fornecedor Sem Ordem de Compra !'+cr+cr+'Deseja Continuar ??', 'C')=2 Then
      Begin
        Screen.Cursor:=crDefault;
        EdtNFeCodFornLinx.Clear;
        EdtNFeCodFornLinx.SetFocus;
        DMSolicTransf.SQLQuery1.Close;
        Exit;
      End; // If msg('Fornecedor Sem Ordem de Compra !'+cr+cr+'Deseja Continuar ??', 'C')=2 Then
    End;
    DMSolicTransf.SQLQuery1.Close;

    EdtNFeNumNFe.SetFocus;

    Screen.Cursor:=crDefault;
  End;
end;

procedure TFrmSolicTransf.Bt_NFeBuscaFornLinxClick(Sender: TObject);
Var
  MySql: String;
begin

  EdtNFeCodFornLinx.SetFocus;
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtNFeCodFornLinx.Clear;
  EdtNFeDesFornLinx.Clear;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  // Busca Fornecedores ========================================================
  MySql:=' SELECT fo.nome_cliente DES_FORN_LINX,'+
         '        CASE'+
         '          WHEN char_length(TRIM(fo.doc_cliente))=14 THEN'+
         '            SUBSTRING(TRIM(fo.doc_cliente) FROM 1 FOR 2) || ''.'' ||'+
         '            SUBSTRING(TRIM(fo.doc_cliente) FROM 3 for 3) || ''.'' ||'+
         '            SUBSTRING(TRIM(fo.doc_cliente) FROM 6 for 3) || ''/'' ||'+
         '            SUBSTRING(TRIM(fo.doc_cliente) FROM 9 for 4) || ''-'' ||'+
         '            SUBSTRING(TRIM(fo.doc_cliente) FROM 13 for 2)'+
         '          WHEN char_length(TRIM(fo.doc_cliente))=11 THEN'+
         '            SUBSTRING(TRIM(fo.doc_cliente) FROM 1 for 3) || ''.'' ||'+
         '            SUBSTRING(TRIM(fo.doc_cliente) FROM 4 for 3) || ''.'' ||'+
         '            SUBSTRING(TRIM(fo.doc_cliente) FROM 7 for 3) || ''-'' ||'+
         '            SUBSTRING(TRIM(fo.doc_cliente) FROM 10 for 2)'+
         '          ELSE'+
         '            TRIM(fo.doc_cliente)'+
         '        End CNPJ_CPF,'+
         '        fo.razao_cliente RAXAO_SOCIAL,'+
         '        fo.cod_cliente COD_FORN_LINX'+
         ' FROM LINXCLIENTESFORNEC fo'+
         ' WHERE fo.tipo_cliente IN (''F'',''A'',''J'')'+
         ' AND   TRIM(COALESCE(fo.nome_cliente,''''))<>'''''+
         ' AND   EXISTS(SELECT 1'+
         '              FROM LINXPRODUTOS pr'+
         '              WHERE pr.cod_fornecedor = fo.cod_cliente)'+

         ' UNION'+

         ' SELECT be.nome_cliente,'+
         '        CASE'+
         '          WHEN char_length(TRIM(be.doc_cliente))=14 THEN'+
         '            SUBSTRING(TRIM(be.doc_cliente) FROM 1 FOR 2) || ''.'' ||'+
         '            SUBSTRING(TRIM(be.doc_cliente) FROM 3 for 3) || ''.'' ||'+
         '            SUBSTRING(TRIM(be.doc_cliente) FROM 6 for 3) || ''/'' ||'+
         '            SUBSTRING(TRIM(be.doc_cliente) FROM 9 for 4) || ''-'' ||'+
         '            SUBSTRING(TRIM(be.doc_cliente) FROM 13 for 2)'+
         '          WHEN char_length(TRIM(be.doc_cliente))=11 THEN'+
         '            SUBSTRING(TRIM(be.doc_cliente) FROM 1 for 3) || ''.'' ||'+
         '            SUBSTRING(TRIM(be.doc_cliente) FROM 4 for 3) || ''.'' ||'+
         '            SUBSTRING(TRIM(be.doc_cliente) FROM 7 for 3) || ''-'' ||'+
         '            SUBSTRING(TRIM(be.doc_cliente) FROM 10 for 2)'+
         '          ELSE'+
         '            TRIM(be.doc_cliente)'+
         '        End CNPJ_CPF,'+
         '        be.razao_cliente RAXAO_SOCIAL,'+
         '        be.cod_cliente COD_FORN_LINX'+

         ' FROM LINXCLIENTESFORNEC be'+
         ' WHERE UPPER(be.nome_cliente) LIKE ''%BELSHOP%'''+

         ' ORDER BY 1';
  DMSolicTransf.CDS_Pesquisa.Close;
  DMSolicTransf.SQLQ_Pesquisa.Close;
  DMSolicTransf.SQLQ_Pesquisa.SQL.Clear;
  DMSolicTransf.SQLQ_Pesquisa.SQL.Add(MySql);
  DMSolicTransf.CDS_Pesquisa.Filtered:=False;
  DMSolicTransf.CDS_Pesquisa.Filter:='';
  DMSolicTransf.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMSolicTransf.CDS_Pesquisa.FieldByName('des_forn_linx').AsString)='' Then
  Begin
    DMSolicTransf.CDS_Pesquisa.Close;
    msg('Sem Fornecedor a Listar !!','A');
    EdtNFeCodFornLinx.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='des_forn_linx';
  FrmPesquisa.Campo_Codigo:='cod_forn_linx';
  FrmPesquisa.Campo_Descricao:='des_forn_linx';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMSolicTransf.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtNFeCodFornLinx.Text:=FrmPesquisa.EdtCodigo.Text;
     DMSolicTransf.CDS_OCItensCheck.Close;
     EdtNFeCodFornLinx.SetFocus;
     EdtNFeNumNFe.SetFocus;
   End
  Else
   Begin
     EdtNFeCodFornLinx.Clear;
     EdtNFeDesFornLinx.Clear;
     EdtNFeCodFornLinx.SetFocus;
   End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmSolicTransf.Bt_NFeBuscaOCClick(Sender: TObject);
Var
  MySql: String;
begin

  If EdtNFeCodFornLinx.AsInteger=0 Then
  Begin
    msg('Favor Informar o Fornecedor !!','A');
    EdtNFeCodFornLinx.SetFocus;
    Exit;
  End; // If EdtNFeCodFornLinx.AsInteger=0 Then

  If EdtNFeNumNFe.AsInteger=0 Then
  Begin
    msg('Favor Informar o N� da NFE !!','A');
    EdtNFeNumNFe.SetFocus;
    Exit;
  End; // If EdtNFeNumNFe.AsInteger=0 Then Then

  EdtNFeNumOC.SetFocus;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtNFeNumOC.Clear;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT oc.num_oc, oc.dta_oc, oe.num_nfe,'+
         '        COUNT(oi.cod_produto_linx) Tot_Itens'+

         ' FROM OC_LOJAS_NFE oc'+
         '    LEFT JOIN OC_LOJAS_ITENS oi      ON oi.num_seq_oc=oc.num_seq_oc'+
         '    LEFT JOIN oc_lojas_itens_nfe oe  ON oe.num_seq_oc=oc.num_seq_oc'+
         '                                    AND oe.num_seq_item=oi.num_seq_item'+

         ' WHERE oc.cod_loja_linx='+sgLojaLinx+
         ' AND   oc.cod_forn_linx='+IntToStr(EdtNFeCodFornLinx.AsInteger)+
         ' GROUP BY 1, 2, 3'+
         ' ORDER BY 1 DESC';
  DMSolicTransf.CDS_Pesquisa.Close;
  DMSolicTransf.SQLQ_Pesquisa.Close;
  DMSolicTransf.SQLQ_Pesquisa.SQL.Clear;
  DMSolicTransf.SQLQ_Pesquisa.SQL.Add(MySql);
  DMSolicTransf.CDS_Pesquisa.Filtered:=False;
  DMSolicTransf.CDS_Pesquisa.Filter:='';
  DMSolicTransf.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMSolicTransf.CDS_Pesquisa.FieldByName('Num_OC').AsString)='' Then
  Begin
    DMSolicTransf.CDS_Pesquisa.Close;
    msg('Sem Ordem de Compra a Listar !!','A');
    EdtNFeNumOC.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='num_oc';
  FrmPesquisa.Campo_Codigo:='num_oc';
  FrmPesquisa.Campo_Descricao:='num_oc';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMSolicTransf.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtNFeNumOC.Text:=FrmPesquisa.EdtCodigo.Text;
     EdtNFeNumOCExit(Self);
   End
  Else
   Begin
     EdtNFeNumOC.Clear;
     EdtNFeNumOC.SetFocus;
   End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);

end;

procedure TFrmSolicTransf.EdtNFeNumNFeChange(Sender: TObject);
begin
  DMSolicTransf.CDS_OCItensCheck.Close;

  Lbx_NFeNumOCs.Items.Clear;
end;

procedure TFrmSolicTransf.EdtNFeNumOCExit(Sender: TObject);
Var
  MySql: String;
  i: Integer;
  bInfomado: Boolean;
begin
  If EdtNFeNumOC.Value<>0 Then
  Begin
    If EdtNFeCodFornLinx.AsInteger=0 Then
    Begin
      msg('Favor Informar o Fornecedor !!','A');
      EdtNFeNumOC.Clear;
      EdtNFeCodFornLinx.SetFocus;
      Exit;
    End; // If EdtNFeCodFornLinx.AsInteger=0 Then

    If EdtNFeNumNFe.AsInteger=0 Then
    Begin
      msg('Favor Informar o N� da NFE !!','A');
      EdtNFeNumOC.Clear;
      EdtNFeNumNFe.SetFocus;
      Exit;
    End; // If EdtNFeNumNFe.AsInteger=0 Then Then

    Screen.Cursor:=crAppStart;

    // Busca Lojas =============================================================
    MySql:=' SELECT oc.num_seq_oc, oc.dta_oc, oc.des_comprador, oc.sis_origem'+
           ' FROM OC_LOJAS_NFE oc'+
           ' WHERE oc.cod_loja_linx='+sgLojaLinx+
           ' AND   oc.cod_forn_linx='+IntToStr(EdtNFeCodFornLinx.AsInteger)+
           ' AND   oc.num_oc='+IntToStr(EdtNFeNumOC.AsInteger);
    DMSolicTransf.SQLQuery1.Close;
    DMSolicTransf.SQLQuery1.SQL.Clear;
    DMSolicTransf.SQLQuery1.SQL.Add(MySql);
    DMSolicTransf.SQLQuery1.Open;

    If Trim(DMSolicTransf.SQLQuery1.FieldByName('num_seq_oc').AsString)='' Then
    Begin
      msg('Ordem de Compra N�o Encontrada!!!', 'A');
      Screen.Cursor:=crDefault;
      EdtNFeNumOC.Clear;
      EdtNFeNumOC.SetFocus;
      DMSolicTransf.SQLQuery1.Close;
      Exit;
    End;

    // Verifica se J� Informnado ===============================================
    bInfomado:=False;
    For i:=0 to Lbx_NFeNumOCs.Items.Count-1 do
    Begin
      If StrToInt(Lbx_NFeNumOCs.Items[i])=EdtNFeNumOC.AsInteger Then
      Begin
        bInfomado:=True;
        Break;
      End;
    End; // For i:=0 to Lbx_NFeNumOCs.Items.Count-1 do

    If Not bInfomado Then
    Begin
      Lbx_NFeNumOCs.Items.Add(EdtNFeNumOC.Text);
    End; // If Not bInfomado Then
    DMSolicTransf.SQLQuery1.Close;

    // Busca Ordens de Compra para CheckOut ==================================
    CheckOutBuscaOC;

    EdtNFeNumOC.Clear;
    EdtNFeNumOC.SetFocus;

    Screen.Cursor:=crDefault;
  End; // If EdtNFeNumOC.Value<>0 Then
end;

procedure TFrmSolicTransf.Bt_NFeEscanearClick(Sender: TObject);
Var
  MySql: String;
begin
  If EdtNFeCodFornLinx.AsInteger=0 Then
  Begin
    msg('Favor Informar o Fornecedor !!','A');
    EdtNFeNumOC.Clear;
    EdtNFeCodFornLinx.SetFocus;
    Exit;
  End; // If EdtNFeCodFornLinx.AsInteger=0 Then

  If EdtNFeNumNFe.AsInteger=0 Then
  Begin
    msg('Favor Informar o N� da NFE !!','A');
    EdtNFeNumOC.Clear;
    EdtNFeNumNFe.SetFocus;
    Exit;
  End; // If EdtNFeNumNFe.AsInteger=0 Then Then

  // Cria OC NOVA ==============================================================
  If Lbx_NFeNumOCs.Items.Count<1 Then
  Begin
    If msg('Deseja Criar ORDEM DE COMPRA ??', 'C')=2 Then
     Exit;

    EdtNFeNumOC.Enabled:=False;
    Bt_NFeBuscaOC.Enabled:=False;
    Lbx_NFeNumOCs.Enabled:=False;

    // Busca Numero da Ordem de Compra Nova =======================================
    sgNrOCNova:=DMSolicTransf.OCBuscaNumeroOC(sgLojaSidicom, StrToInt(sgLojaLinx));
                                 //SIDICOM  // LINX
    Lbx_NFeNumOCs.Items.Add(sgNrOCNova);

    // Busca Num_Seq da OC =======================================================
    MySql:=' SELECT GEN_ID(GEN_OC_LOJAS,1) Num_Seq'+
           ' FROM RDB$DATABASE';
    DMSolicTransf.SQLQuery1.Close;
    DMSolicTransf.SQLQuery1.SQL.Clear;
    DMSolicTransf.SQLQuery1.SQL.Add(MySql);
    DMSolicTransf.SQLQuery1.Open;
    sgNumSeqOCNova:=DMSolicTransf.SQLQuery1.FieldByName('Num_Seq').AsString;
    DMSolicTransf.SQLQuery1.Close;

    bgOCNova:=True;
  End; // If Lbx_NFeNumOCs.Items.Count<1 Then

  Dbg_NFeProdutosOC.SetFocus;

  FrmLeitoraCodBarras:=TFrmLeitoraCodBarras.Create(Self);
  FrmLeitoraCodBarras.bgCheckOutSimples:=True;
  FrmLeitoraCodBarras.sgNumNFe:=IntToStr(EdtNFeNumNFe.AsInteger);

  FrmLeitoraCodBarras.ShowModal;
  FreeAndNil(FrmLeitoraCodBarras);

  // Se Oc foI Criada no Caso de Sem OC ========================================
  If Not Lbx_NFeNumOCs.Enabled Then
  Begin
    MySql:=' SELECT oc.num_seq_oc'+
           ' FROM OC_LOJAS_NFE oc'+
           ' WHERE oc.num_oc='+Lbx_NFeNumOCs.Items[0]+
           ' AND   oc.cod_forn_linx='+VarToStr(EdtNFeCodFornLinx.AsInteger)+
           ' AND   oc.cod_loja_linx='+sgLojaLinx;
    DMSolicTransf.CDS_BuscaRapida.Close;
    DMSolicTransf.SQLQ_BuscaRapida.SQL.Clear;
    DMSolicTransf.SQLQ_BuscaRapida.SQL.Add(MySql);
    DMSolicTransf.CDS_BuscaRapida.Open;

    If Trim(DMSolicTransf.CDS_BuscaRapida.FieldByName('num_seq_oc').AsString)='' Then
     Lbx_NFeNumOCs.Items.Clear;

    DMSolicTransf.CDS_BuscaRapida.Close;

    EdtNFeNumOC.Enabled:=True;
    Bt_NFeBuscaOC.Enabled:=True;
    Lbx_NFeNumOCs.Enabled:=True;
  End; // If Not Lbx_NFeNumOCs.Enabled Then

  Dbg_NFeProdutosOC.SetFocus;

end;

procedure TFrmSolicTransf.Lbx_NFeNumOCsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
Var
  bSelect: Boolean;
  i: Integer;
begin
  If Lbx_NFeNumOCs.Items.Count<1 Then
   Exit;

  // Exclui OC da Lista ========================================================
  If Key=Vk_Delete Then
  Begin
    bSelect:=False;
    For i:=0 to Lbx_NFeNumOCs.Items.Count-1 do
    Begin
      If Lbx_NFeNumOCs.Selected[i] Then
      Begin
        bSelect:=True;
        Break;
      End;
    End; // For i:=0 to Lbx_NFeNumOCs.Items.Count-1 do

    If Not bSelect Then
    Begin
      msg('Favor Selecionar a Ordem de Compra'+cr+cr+'a Excluir da Lista !!','A');
      Lbx_NFeNumOCs.SetFocus;
      Exit;
    End;

    If msg('Deseja Retira da Lista'+cr+cr+'a Ordem de Compra Selecionada !!','C')=2 Then
     Exit;

    Lbx_NFeNumOCs.DeleteSelected;

    // Busca Ordens de Compra para CheckOut ====================================
    CheckOutBuscaOC;
  End; // If Key=Vk_Delete Then

end;

procedure TFrmSolicTransf.EdtNFeCodFornLinxKeyDown(Sender: TObject;var Key: Word; Shift: TShiftState);
begin
  If Key=VK_F9 Then
   Bt_NFeBuscaFornLinxClick(Self);
end;

procedure TFrmSolicTransf.EdtNFeNumOCKeyDown(Sender: TObject;var Key: Word; Shift: TShiftState);
begin
  If Key=VK_F9 Then
   Bt_NFeBuscaOCClick(Self);

end;

procedure TFrmSolicTransf.Dbg_NFeProdutosOCDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  If (Column.FieldName='QTD_CHECKOUT') Then // Este comando altera cor da Celula
  Begin
    If DMSolicTransf.CDS_OCItensCheckQTD_CHECKOUT.AsInteger<>0 Then
    Begin
      // Checkout Fechado ======================================================
      If DMSolicTransf.CDS_OCItensCheckQTD_PRODUTO.AsInteger = DMSolicTransf.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then
      Begin
        Dbg_NFeProdutosOC.Canvas.Font.Style:=[fsBold];
        Dbg_NFeProdutosOC.Canvas.Font.Color:=clWindowText; // Cor da Fonte
        Dbg_NFeProdutosOC.Canvas.Brush.Color:=clLime; // Cor da Celula
      End; // If DMSolicTransf.CDS_OCItensCheckQTD_PRODUTO.AsInteger > DMSolicTransf.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then

      // Checkout a Menor ======================================================
      If DMSolicTransf.CDS_OCItensCheckQTD_PRODUTO.AsInteger > DMSolicTransf.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then
      Begin
        Dbg_NFeProdutosOC.Canvas.Font.Style:=[fsBold];
        Dbg_NFeProdutosOC.Canvas.Font.Color:=clWindowText; // Cor da Fonte
        Dbg_NFeProdutosOC.Canvas.Brush.Color:=clAqua; // Cor da Celula
      End; // If DMSolicTransf.CDS_OCItensCheckQTD_PRODUTO.AsInteger > DMSolicTransf.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then

      // Checkout a Maior ======================================================
      If DMSolicTransf.CDS_OCItensCheckQTD_PRODUTO.AsInteger < DMSolicTransf.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then
      Begin
        Dbg_NFeProdutosOC.Canvas.Font.Style:=[fsBold];
        Dbg_NFeProdutosOC.Canvas.Font.Color:=clWindowText; // Cor da Fonte
        Dbg_NFeProdutosOC.Canvas.Brush.Color:=clYellow; // Cor da Celula
      End; // If DMSolicTransf.CDS_OCItensCheckQTD_PRODUTO.AsInteger > DMSolicTransf.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then

      // Checkout de Produto N�o Pertencente a OC ==============================
      If DMSolicTransf.CDS_OCItensCheckIND_OC.AsString='N' Then
      Begin
        Dbg_NFeProdutosOC.Canvas.Font.Style:=[fsBold];
        Dbg_NFeProdutosOC.Canvas.Font.Color:=clWhite; // Cor da Fonte
        Dbg_NFeProdutosOC.Canvas.Brush.Color:=clRed; // Cor da Celula
      End; // If DMSolicTransf.CDS_OCItensCheckIND_OC.AsString='N' Then

      Dbg_NFeProdutosOC.Canvas.FillRect(Rect);
      Dbg_NFeProdutosOC.DefaultDrawDataCell(Rect,Column.Field,state);
    End; // If DMSolicTransf.CDS_OCItensCheckQTD_CHECKOUT.AsInteger<>0 Then
  End;


{
  If (Column.FieldName='IND_OC') Or (Column.FieldName='COD_PRODUTO_LINX') Then // Este comando altera cor da Celula
  Begin
    If DMSolicTransf.CDS_OCItensCheckQTD_CHECKOUT.AsInteger<>0 Then
    Begin
      // Checkout Igual ========================================================
      If DMSolicTransf.CDS_OCItensCheckQTD_PRODUTO.AsInteger = DMSolicTransf.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then
      Begin
        Dbg_NFeProdutosOC.Canvas.Font.Style:=[fsBold];
        Dbg_NFeProdutosOC.Canvas.Font.Color:=clWindowText; // Cor da Fonte
        Dbg_NFeProdutosOC.Canvas.Brush.Color:=clYellow; // Cor da Celula
      End; // If DMSolicTransf.CDS_OCItensCheckQTD_PRODUTO.AsInteger > DMSolicTransf.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then

      // Checkout a Menor ======================================================
      If DMSolicTransf.CDS_OCItensCheckQTD_PRODUTO.AsInteger > DMSolicTransf.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then
      Begin
        Dbg_NFeProdutosOC.Canvas.Font.Style:=[fsBold];
        Dbg_NFeProdutosOC.Canvas.Font.Color:=clWhite; // Cor da Fonte
        Dbg_NFeProdutosOC.Canvas.Brush.Color:=clBlue; // Cor da Celula
      End; // If DMSolicTransf.CDS_OCItensCheckQTD_PRODUTO.AsInteger > DMSolicTransf.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then

      // Checkout a Maior ======================================================
      If DMSolicTransf.CDS_OCItensCheckQTD_PRODUTO.AsInteger < DMSolicTransf.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then
      Begin
        Dbg_NFeProdutosOC.Canvas.Font.Style:=[fsBold];
        Dbg_NFeProdutosOC.Canvas.Font.Color:=clWindowText; // Cor da Fonte
        Dbg_NFeProdutosOC.Canvas.Brush.Color:=clLime; // Cor da Celula
      End; // If DMSolicTransf.CDS_OCItensCheckQTD_PRODUTO.AsInteger > DMSolicTransf.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then

      // Checkout de produto N�o Pertencente a OC ==============================
      If DMSolicTransf.CDS_OCItensCheckIND_OC.AsString='N' Then
      Begin
        Dbg_NFeProdutosOC.Canvas.Font.Style:=[fsBold];
        Dbg_NFeProdutosOC.Canvas.Font.Color:=clWhite; // Cor da Fonte
        Dbg_NFeProdutosOC.Canvas.Brush.Color:=clRed; // Cor da Celula
      End; // If DMSolicTransf.CDS_OCItensCheckIND_OC.AsString='N' Then

      Dbg_NFeProdutosOC.Canvas.FillRect(Rect);
      Dbg_NFeProdutosOC.DefaultDrawDataCell(Rect,Column.Field,state);
    End; // If DMSolicTransf.CDS_OCItensCheckQTD_CHECKOUT.AsInteger<>0 Then
  End; // If (Column.FieldName='IND_OC') Then // Este comando altera cor da Celula
}
  // Alinhamento
  DMSolicTransf.CDS_OCItensCheckNUM_OC.Alignment:=taRightJustify;
  DMSolicTransf.CDS_OCItensCheckCOD_PRODUTO_LINX.Alignment:=taRightJustify;
  DMSolicTransf.CDS_OCItensCheckQTD_PRODUTO.Alignment:=taRightJustify;
  DMSolicTransf.CDS_OCItensCheckQTD_CHECKOUT.Alignment:=taRightJustify;
  DMSolicTransf.CDS_OCItensCheckDTA_CHECKOUT.Alignment:=taCenter;
  DMSolicTransf.CDS_OCItensCheckHRA_CHECKOUT.Alignment:=taCenter;
  DMSolicTransf.CDS_OCItensCheckIND_OC.Alignment:=taCenter;

end;

procedure TFrmSolicTransf.EdtNFeNumNFeExit(Sender: TObject);
Var
  MySql: String;
begin
  If (Trim(EdtNFeNumNFe.Text)<>'') and (Trim(EdtNFeCodFornLinx.Text)<>'') Then
  Begin
    MySql:=' SELECT DISTINCT o.num_oc'+
           ' FROM OC_LOJAS_NFE o, OC_LOJAS_ITENS_NFE n'+
           ' WHERE o.num_seq_oc=n.num_seq_oc'+
           ' AND   o.cod_forn_linx='+IntToStr(EdtNFeCodFornLinx.AsInteger)+
           ' AND   n.num_nfe='+IntToStr(EdtNFeNumNFe.AsInteger);
    DMSolicTransf.SQLQuery3.Close;
    DMSolicTransf.SQLQuery3.SQL.Clear;
    DMSolicTransf.SQLQuery3.SQL.Add(MySql);
    DMSolicTransf.SQLQuery3.Open;
    While Not DMSolicTransf.SQLQuery3.Eof do
    Begin
      EdtNFeNumOC.AsInteger:=DMSolicTransf.SQLQuery3.FieldByName('num_oc').AsInteger;
      EdtNFeNumOCExit(Self);

      DMSolicTransf.SQLQuery3.Next;
    End; // While Not DMSolicTransf.SQLQuery3.Eof do
    
    DMSolicTransf.SQLQuery3.Close;
  End; // If (Trim(EdtNFeNumNFe.Text)<>'')) and (Trim(EdtNFeCodFornLinx.Text)<>'')) Then
end;

procedure TFrmSolicTransf.Dbg_NFeProdutosOCEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_NFeProdutosOCEnter; // Nome do Evento do DBGRID
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmSolicTransf.Dbg_NFeProdutosOCTitleClick(Column: TColumn);
Var
  s, sPesquisa: String;
  b: Boolean;
  i: Integer;
begin

  If Not DMSolicTransf.CDS_OCItensCheck.IsEmpty Then
  Begin
    If (Column.FieldName<>'COD_PRODUTO_LINX') And (Column.FieldName<>'REFERENCIA') And (Column.FieldName<>'COD_PRODUTO_SIDI') Then
     Exit;

    i:=DMSolicTransf.CDS_OCItensCheck.RecNo;
    sPesquisa:='';
    b:=True;
    While b do
    Begin
      s:=DMSolicTransf.CDS_OCItensCheck.FieldByName(Column.FieldName).DisplayLabel;
      If InputQuery('Localizar: '+s,'',sPesquisa) then
       Begin
         Try
           If Not DMSolicTransf.CDS_OCItensCheck.Locate(Column.FieldName, sPesquisa,[]) Then
           Begin
             If Not LocalizaRegistro(DMSolicTransf.CDS_OCItensCheck, Column.FieldName, sPesquisa) Then
             Begin
               DMSolicTransf.CDS_OCItensCheck.RecNo:=i;
               msg('N�o Localizado !!','A');
               Exit;
             End;
           End; // If Not DMSolicTransf.CDS_OCItensCheck.Locate(Column.FieldName, sPesquisa,[]) Then
           Break;
         Except
           msg('Informa��o Inv�lida !!','A');
           Break;
         End;
       End
      Else // If InputQuery('Localizar: '+s,'',sPesquisa) then
       Begin
         Break;
       End; // If InputQuery('Localizar: '+s,'',sPesquisa) then
    End; // While b do
  End; // If Not DMSolicTransf.CDS_OCItensCheck.IsEmpty Then
end;

procedure TFrmSolicTransf.Bt_ProdNegativosBuscaClick(Sender: TObject);
Var
  MySql: String;
begin
  OdirPanApres.Caption:='AGUARDE !! Localizando Produtos com Saldos Negativos...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSolicTransf.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSolicTransf.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmSolicTransf;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT p.cod_produto, p.nome , COALESCE(d.quantidade,0) QTD_ESTOQUE,'+
         ' CASE'+
         '   WHEN COALESCE(p.desativado,''N'')=''N'' THEN'+
         '    ''SIM'''+
         '   ELSE'+
         '    ''N�O'''+
         ' END ATIVO'+
         ' FROM LINXPRODUTOS p, LINXPRODUTOSDETALHES d'+
         ' WHERE p.cod_produto=d.cod_produto'+
         ' AND   d.quantidade<0'+
         ' AND   d.empresa='+sgLojaLinx+
         ' ORDER BY 2';
  DMSolicTransf.CDS_ProdNegativos.Close;
  DMSolicTransf.SQLQ_ProdNegativos.Close;
  DMSolicTransf.SQLQ_ProdNegativos.SQL.Clear;
  DMSolicTransf.SQLQ_ProdNegativos.SQL.Add(MySql);
  DMSolicTransf.CDS_ProdNegativos.Open;

  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;

  If DMSolicTransf.CDS_ProdNegativos.IsEmpty Then
  Begin
    msg('SEM Produto Com'+cr+cr+'Saldo Negativo a Listar...','A');
    DMSolicTransf.CDS_ProdNegativos.Close;
  End; // If DMSolicTransf.CDS_ProdNegativos.IsEmpty Then

end;

procedure TFrmSolicTransf.Bt_ProdNegativosMemoriaClick(Sender: TObject);
begin
  Dbg_ProdNegativos.SetFocus;

  If DMSolicTransf.CDS_ProdNegativos.IsEmpty Then
   Exit;

  DBGridClipboard(Dbg_ProdNegativos);

end;

end.
