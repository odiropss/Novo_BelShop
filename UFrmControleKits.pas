unit UFrmControleKits;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvGradientCaption, Grids, DBGrids, DBGridJul, ComCtrls,
  StdCtrls, JvExStdCtrls, JvRadioButton, ExtCtrls, JvExControls, JvXPCore,
  JvXPButtons, Mask, ToolEdit, CurrEdit, Math;

type
  TFrmControleKits = class(TForm)
    CorCaptionForm: TJvGradientCaption;
    Gb_KitFiltroLoja: TGroupBox;
    EdtKitCodLoja: TCurrencyEdit;
    Bt_KitBuscaLoja: TJvXPButton;
    EdtKitDesLoja: TEdit;
    Panel10: TPanel;
    Bt_KitFechar: TJvXPButton;
    Bt_KitClipboard: TJvXPButton;
    Bt_KitBuscaKits: TJvXPButton;
    Pan_KitsApresentacao: TPanel;
    Rb_KitAnalitico: TJvRadioButton;
    Rb_KitSintetico: TJvRadioButton;
    PC_Kit: TPageControl;
    Ts_KitKits: TTabSheet;
    Dbg_KitKits: TDBGridJul;
    Ts_KitNotas: TTabSheet;
    Dbg_KitNotas: TDBGridJul;
    OdirPanApres: TPanel;
    Memo2: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure EdtKitCodLojaChange(Sender: TObject);
    procedure EdtKitCodLojaExit(Sender: TObject);
    procedure Bt_KitBuscaLojaClick(Sender: TObject);
    procedure Dbg_KitKitsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Dbg_KitNotasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure PC_KitChange(Sender: TObject);
    procedure Bt_KitClipboardClick(Sender: TObject);
    procedure Rb_KitAnaliticoClick(Sender: TObject);
    procedure Rb_KitAnaliticoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_KitBuscaKitsClick(Sender: TObject);

    // Odir ====================================================================
    Function  KitsBuscaKits: Boolean;
    Procedure KitsApresentaKits;
    Procedure KitsDML_KITs(sDML: String; sTipo: String; Var iNumSeq: Integer; Var iCodKit: Integer;
                           iCodKitAnt, iNumNota: Integer);
    procedure Bt_KitFecharClick(Sender: TObject);

    // Odir ====================================================================

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmControleKits: TFrmControleKits;

  bgSairKits: Boolean;
  
implementation

uses UDMVirtual, DK_Procs1, UDMBelShop, UDMConexoes, UFrmBelShop, UPesquisa,
     UFrmSolicitacoes, UFrmPeriodoApropriacao;

{$R *.dfm}

// KITS - Monta Apresentação de Kits da Loja ///////////////////////////////////
Procedure TFrmControleKits.KitsDML_KITs(sDML: String; sTipo: String; Var iNumSeq: Integer; Var iCodKit: Integer;
                                   iCodKitAnt, iNumNota: Integer);
Var
  i: Integer;
Begin
  //============================================================================
  // Insere Kit ================================================================
  //============================================================================
  If (sDML='I') and (sTipo='K') Then
  Begin
    DMVirtual.CDS_V_Kits.Append;
    DMVirtual.CDS_V_KitsDescricao.AsString:='';
    DMVirtual.CDS_V_KitsSintetico.AsString:='N';
    Inc(iNumSeq);
    DMVirtual.CDS_V_KitsNum_Seq.AsInteger:=iNumSeq;
    DMVirtual.CDS_V_KitsCod_Kit.AsInteger:=iCodKit;
    DMVirtual.CDS_V_Kits.Post;

    DMVirtual.CDS_V_Kits.Append;
    DMVirtual.CDS_V_KitsTipo.AsString:='KIT';
    DMVirtual.CDS_V_KitsCodigo.AsString:=IBQ_ConsultaFilial.FieldByName('CodKit').AsString;
    DMVirtual.CDS_V_KitsDescricao.AsString:=IBQ_ConsultaFilial.FieldByName('Des_Kit').AsString;

    DMVirtual.CDS_V_KitsQuant.AsInteger:=ParteInteiro(CurrToStr(
                                         IBQ_ConsultaFilial.FieldByName('QuantAtendida').AsCurrency/
                                         IBQ_ConsultaFilial.FieldByName('Qtd_Kit').AsCurrency));
    DMVirtual.CDS_V_KitsVlr_Total.AsCurrency:=IBQ_ConsultaFilial.FieldByName('ValTotal').AsCurrency/
                                              IBQ_ConsultaFilial.FieldByName('Qtd_Kit').AsCurrency;

    DMVirtual.CDS_V_KitsDta_Validade_Ini.AsString:=IBQ_ConsultaFilial.FieldByName('ValidadeIni_Kit').AsString;
    DMVirtual.CDS_V_KitsDta_Validade_Fim.AsString:=IBQ_ConsultaFilial.FieldByName('ValidadeFim_Kit').AsString;
    DMVirtual.CDS_V_KitsCod_Barras.AsString:=IBQ_ConsultaFilial.FieldByName('CodBarra_Kit').AsString;
    DMVirtual.CDS_V_KitsSintetico.AsString:='S';
    Inc(iNumSeq);
    DMVirtual.CDS_V_KitsNum_Seq.AsInteger:=iNumSeq;
    DMVirtual.CDS_V_KitsCod_Kit.AsInteger:=iCodKit;
    DMVirtual.CDS_V_Kits.Post;
  End; // If (sDML='I') and (sTipo='K') Then

  //============================================================================
  // Atualiza Kit ==============================================================
  //============================================================================
  If (sDML='A') and (sTipo='K') Then
  Begin
    DMVirtual.CDS_V_Kits.Edit;

    If ((iCodKit<>iCodKitAnt) Or (iNumNota<>IBQ_ConsultaFilial.FieldByName('Numero').AsInteger)) Or
        (Trim(IBQ_ConsultaFilial.FieldByName('CodKit').AsString)='')    Then
     DMVirtual.CDS_V_KitsQuant.AsInteger:=DMVirtual.CDS_V_KitsQuant.AsInteger+(ParteInteiro(CurrToStr(
                                          IBQ_ConsultaFilial.FieldByName('QuantAtendida').AsCurrency/
                                          IBQ_ConsultaFilial.FieldByName('Qtd_Kit').AsCurrency)));

    DMVirtual.CDS_V_KitsVlr_Total.AsCurrency:=DMVirtual.CDS_V_KitsVlr_Total.AsCurrency+
                                              (IBQ_ConsultaFilial.FieldByName('ValTotal').AsCurrency/
                                               IBQ_ConsultaFilial.FieldByName('Qtd_Kit').AsCurrency);

    DMVirtual.CDS_V_Kits.Post;
  End; // If (sDML='A') and (sTipo='K') Then

  //============================================================================
  // Insere Produto do Kit =====================================================
  //============================================================================
  If (sDML='I') and (sTipo='P') Then
  Begin
    DMVirtual.CDS_V_Kits.Append;
    DMVirtual.CDS_V_KitsTipo.AsString:='PRODUTO';
    DMVirtual.CDS_V_KitsCodigo.AsString:=IBQ_ConsultaFilial.FieldByName('CodProduto').AsString;
    DMVirtual.CDS_V_KitsDescricao.AsString:=IBQ_ConsultaFilial.FieldByName('Des_Produto').AsString;


    If Trim(IBQ_ConsultaFilial.FieldByName('CodKit').AsString)<>'' Then
     Begin
       DMVirtual.CDS_V_KitsQuant.AsCurrency:=IBQ_ConsultaFilial.FieldByName('QuantAtendida').AsCurrency;
       DMVirtual.CDS_V_KitsVlr_Desc.AsCurrency:=IBQ_ConsultaFilial.FieldByName('ValDescItem').AsCurrency;
       DMVirtual.CDS_V_KitsVlr_Total.AsCurrency:=IBQ_ConsultaFilial.FieldByName('ValTotal').AsCurrency;
     End
    Else // If Trim(IBQ_ConsultaFilial.FieldByName('CodKit').AsString)<>'' Then
     Begin
       If Memo2.Lines.Count=1 Then
        Begin
          DMVirtual.CDS_V_KitsQuant.AsCurrency:=IBQ_ConsultaFilial.FieldByName('QuantAtendida').AsCurrency;
          DMVirtual.CDS_V_KitsVlr_Desc.AsCurrency:=IBQ_ConsultaFilial.FieldByName('ValDescItem').AsCurrency;
          DMVirtual.CDS_V_KitsVlr_Total.AsCurrency:=IBQ_ConsultaFilial.FieldByName('ValTotal').AsCurrency;
        End
       Else
        Begin
          DMVirtual.CDS_V_KitsQuant.AsCurrency:=RoundTo(IBQ_ConsultaFilial.FieldByName('QuantAtendida').AsCurrency/
                                                        Memo2.Lines.Count,-2);
          DMVirtual.CDS_V_KitsVlr_Desc.AsCurrency:=RoundTo(IBQ_ConsultaFilial.FieldByName('ValDescItem').AsCurrency/
                                                           Memo2.Lines.Count,-2);
          DMVirtual.CDS_V_KitsVlr_Total.AsCurrency:=RoundTo(IBQ_ConsultaFilial.FieldByName('ValTotal').AsCurrency/
                                                            Memo2.Lines.Count,-2);
        End;
     End; // If Trim(IBQ_ConsultaFilial.FieldByName('CodKit').AsString)<>'' Then
    DMVirtual.CDS_V_KitsSintetico.AsString:='N';
    Inc(iNumSeq);
    DMVirtual.CDS_V_KitsNum_Seq.AsInteger:=iNumSeq;
    DMVirtual.CDS_V_KitsCod_Kit.AsInteger:=iCodKit;
    DMVirtual.CDS_V_Kits.Post;

    // Fraciona Quantidade do Produto Promocional nos Kits da Nota
    If (Memo2.Lines.Count>1) And (Trim(IBQ_ConsultaFilial.FieldByName('CodKit').AsString)='') Then
    Begin
      For i:=0 to Memo2.Lines.Count-1 do
      Begin
        If IntToStr(iCodKit)<>Memo2.Lines[i] Then
        Begin
          if Not DMVirtual.CDS_V_Kits.Locate('Tipo;Codigo;Cod_Kit',VarArrayOf(['PRODUTO',IBQ_ConsultaFilial.FieldByName('CodProduto').AsString,StrToInt(Memo2.Lines[i])]),[]) Then
           Begin
             DMVirtual.CDS_V_Kits.Append;
             DMVirtual.CDS_V_KitsTipo.AsString:='PRODUTO';
             DMVirtual.CDS_V_KitsCodigo.AsString:=IBQ_ConsultaFilial.FieldByName('CodProduto').AsString;
             DMVirtual.CDS_V_KitsDescricao.AsString:=IBQ_ConsultaFilial.FieldByName('Des_Produto').AsString;

             DMVirtual.CDS_V_KitsQuant.AsCurrency:=RoundTo(IBQ_ConsultaFilial.FieldByName('QuantAtendida').AsCurrency/
                                                           Memo2.Lines.Count,-2);
             DMVirtual.CDS_V_KitsVlr_Desc.AsCurrency:=RoundTo(IBQ_ConsultaFilial.FieldByName('ValDescItem').AsCurrency/
                                                              Memo2.Lines.Count,-2);
             DMVirtual.CDS_V_KitsVlr_Total.AsCurrency:=RoundTo(IBQ_ConsultaFilial.FieldByName('ValTotal').AsCurrency/
                                                               Memo2.Lines.Count,-2);

             DMVirtual.CDS_V_KitsSintetico.AsString:='N';
             Inc(iNumSeq);
             DMVirtual.CDS_V_KitsNum_Seq.AsInteger:=iNumSeq;
             DMVirtual.CDS_V_KitsCod_Kit.AsInteger:=StrToInt(Memo2.Lines[i]);
           End
          Else // if Not DMVirtual.CDS_V_Kits.Locate('Tipo;Codigo;Cod_Kit',VarArrayOf(['PRODUTO',IBQ_ConsultaFilial.FieldByName('CodProduto').AsString,StrToInt(Memo2.Lines[i])]),[]) Then
           Begin
             DMVirtual.CDS_V_Kits.Edit;
             DMVirtual.CDS_V_KitsQuant.AsCurrency:=DMVirtual.CDS_V_KitsQuant.AsCurrency+
                                                   RoundTo(IBQ_ConsultaFilial.FieldByName('QuantAtendida').AsCurrency/
                                                           Memo2.Lines.Count,-2);
             DMVirtual.CDS_V_KitsVlr_Desc.AsCurrency:=DMVirtual.CDS_V_KitsVlr_Desc.AsCurrency+
                                                      RoundTo(IBQ_ConsultaFilial.FieldByName('ValDescItem').AsCurrency/
                                                              Memo2.Lines.Count,-2);
             DMVirtual.CDS_V_KitsVlr_Total.AsCurrency:=DMVirtual.CDS_V_KitsVlr_Total.AsCurrency+
                                                       RoundTo(IBQ_ConsultaFilial.FieldByName('ValTotal').AsCurrency/
                                                               Memo2.Lines.Count,-2);
           End;
          DMVirtual.CDS_V_Kits.Post;
        End; // If IntToStr(iCodKit)<>Memo2.Lines[i] Then
      End; // For i:=0 to Memo2.Lines.Count-1 do
    End; // If Memo2.Lines.Count>1 Then
  End; // If (sDML='I') and (sTipo='P') Then

  //============================================================================
  // Atualiza Produto do Kit ===================================================
  //============================================================================
  If (sDML='A') and (sTipo='P') Then
  Begin
    DMVirtual.CDS_V_Kits.Edit;

    If Trim(IBQ_ConsultaFilial.FieldByName('CodKit').AsString)<>'' Then
     Begin
       DMVirtual.CDS_V_KitsQuant.AsCurrency:=DMVirtual.CDS_V_KitsQuant.AsCurrency+
                                             IBQ_ConsultaFilial.FieldByName('QuantAtendida').AsCurrency;
       DMVirtual.CDS_V_KitsVlr_Desc.AsCurrency:=DMVirtual.CDS_V_KitsVlr_Desc.AsCurrency+
                                                IBQ_ConsultaFilial.FieldByName('ValDescItem').AsCurrency;
       DMVirtual.CDS_V_KitsVlr_Total.AsCurrency:=DMVirtual.CDS_V_KitsVlr_Total.AsCurrency+
                                                 IBQ_ConsultaFilial.FieldByName('ValTotal').AsCurrency;
     End
    Else // If Trim(IBQ_ConsultaFilial.FieldByName('CodKit').AsString)<>'' Then
     Begin
       If Memo2.Lines.Count=1 Then
        Begin
          DMVirtual.CDS_V_KitsQuant.AsCurrency:=DMVirtual.CDS_V_KitsQuant.AsCurrency+
                                                IBQ_ConsultaFilial.FieldByName('QuantAtendida').AsCurrency;
          DMVirtual.CDS_V_KitsVlr_Desc.AsCurrency:=DMVirtual.CDS_V_KitsVlr_Desc.AsCurrency+
                                                   IBQ_ConsultaFilial.FieldByName('ValDescItem').AsCurrency;
          DMVirtual.CDS_V_KitsVlr_Total.AsCurrency:=DMVirtual.CDS_V_KitsVlr_Total.AsCurrency+
                                                    IBQ_ConsultaFilial.FieldByName('ValTotal').AsCurrency;
        End
       Else
        Begin
          DMVirtual.CDS_V_KitsQuant.AsCurrency:=DMVirtual.CDS_V_KitsQuant.AsCurrency+
                                                RoundTo(IBQ_ConsultaFilial.FieldByName('QuantAtendida').AsCurrency/
                                                        Memo2.Lines.Count,-2);
          DMVirtual.CDS_V_KitsVlr_Desc.AsCurrency:=DMVirtual.CDS_V_KitsVlr_Desc.AsCurrency+
                                                   RoundTo(IBQ_ConsultaFilial.FieldByName('ValDescItem').AsCurrency/
                                                           Memo2.Lines.Count,-2);
          DMVirtual.CDS_V_KitsVlr_Total.AsCurrency:=DMVirtual.CDS_V_KitsVlr_Total.AsCurrency+
                                                    RoundTo(IBQ_ConsultaFilial.FieldByName('ValTotal').AsCurrency/
                                                            Memo2.Lines.Count,-2);
        End;
     End; // If Trim(IBQ_ConsultaFilial.FieldByName('CodKit').AsString)<>'' Then
    DMVirtual.CDS_V_Kits.Post;

    // Fraciona Quantidade do Produto Promocional nos Kits da Nota
    If (Memo2.Lines.Count>1) And (Trim(IBQ_ConsultaFilial.FieldByName('CodKit').AsString)='') Then
    Begin
      For i:=0 to Memo2.Lines.Count-1 do
      Begin
        If IntToStr(iCodKit)<>Memo2.Lines[i] Then
        Begin
          if Not DMVirtual.CDS_V_Kits.Locate('Tipo;Codigo;Cod_Kit',VarArrayOf(['PRODUTO',IBQ_ConsultaFilial.FieldByName('CodProduto').AsString,StrToInt(Memo2.Lines[i])]),[]) Then
           Begin
             DMVirtual.CDS_V_Kits.Append;
             DMVirtual.CDS_V_KitsTipo.AsString:='PRODUTO';
             DMVirtual.CDS_V_KitsCodigo.AsString:=IBQ_ConsultaFilial.FieldByName('CodProduto').AsString;
             DMVirtual.CDS_V_KitsDescricao.AsString:=IBQ_ConsultaFilial.FieldByName('Des_Produto').AsString;

             DMVirtual.CDS_V_KitsQuant.AsCurrency:=RoundTo(IBQ_ConsultaFilial.FieldByName('QuantAtendida').AsCurrency/
                                                           Memo2.Lines.Count,-2);
             DMVirtual.CDS_V_KitsVlr_Desc.AsCurrency:=RoundTo(IBQ_ConsultaFilial.FieldByName('ValDescItem').AsCurrency/
                                                              Memo2.Lines.Count,-2);
             DMVirtual.CDS_V_KitsVlr_Total.AsCurrency:=RoundTo(IBQ_ConsultaFilial.FieldByName('ValTotal').AsCurrency/
                                                               Memo2.Lines.Count,-2);
             DMVirtual.CDS_V_KitsSintetico.AsString:='N';
             Inc(iNumSeq);
             DMVirtual.CDS_V_KitsNum_Seq.AsInteger:=iNumSeq;
             DMVirtual.CDS_V_KitsCod_Kit.AsInteger:=StrToInt(Memo2.Lines[i]);
           End
          Else // if Not DMVirtual.CDS_V_Kits.Locate('Tipo;Codigo;Cod_Kit',VarArrayOf(['PRODUTO',IBQ_ConsultaFilial.FieldByName('CodProduto').AsString,StrToInt(Memo2.Lines[i])]),[]) Then
           Begin
             DMVirtual.CDS_V_Kits.Edit;
             DMVirtual.CDS_V_KitsQuant.AsCurrency:=DMVirtual.CDS_V_KitsQuant.AsCurrency+
                                                   RoundTo(IBQ_ConsultaFilial.FieldByName('QuantAtendida').AsCurrency/
                                                           Memo2.Lines.Count,-2);
             DMVirtual.CDS_V_KitsVlr_Desc.AsCurrency:=DMVirtual.CDS_V_KitsVlr_Desc.AsCurrency+
                                                      RoundTo(IBQ_ConsultaFilial.FieldByName('ValDescItem').AsCurrency/
                                                              Memo2.Lines.Count,-2);
             DMVirtual.CDS_V_KitsVlr_Total.AsCurrency:=DMVirtual.CDS_V_KitsVlr_Total.AsCurrency+
                                                       RoundTo(IBQ_ConsultaFilial.FieldByName('ValTotal').AsCurrency/
                                                               Memo2.Lines.Count,-2);
           End;
          DMVirtual.CDS_V_Kits.Post;
        End; // If IntToStr(iCodKit)<>Memo2.Lines[i] Then
      End; // For i:=0 to Memo2.Lines.Count-1 do
    End; // If Memo2.Lines.Count>1 Then
  End; // If (sDML='A') and (sTipo='P') Then

  //============================================================================
  // Insere Nota de Kit ========================================================
  //============================================================================
  If (sDML='I') and (sTipo='N') Then
  Begin
    DMVirtual.CDS_V_KitsNotas.Append;
    DMVirtual.CDS_V_KitsNotasDescricao.AsString:='';
    Inc(iNumSeq);
    DMVirtual.CDS_V_KitsNotasNum_Seq.AsInteger:=iNumSeq;
    DMVirtual.CDS_V_KitsNotas.Post;

    DMVirtual.CDS_V_KitsNotas.Append;
    DMVirtual.CDS_V_KitsNotasTipo.AsString:='NOTA';
    DMVirtual.CDS_V_KitsNotasNum_Codigo.AsString:=IBQ_ConsultaFilial.FieldByName('Numero').AsString;
    DMVirtual.CDS_V_KitsNotasCodigo.AsString:=TRIM(IBQ_ConsultaFilial.FieldByName('CodComprovante').AsString);
    DMVirtual.CDS_V_KitsNotasDescricao.AsString:=IBQ_ConsultaFilial.FieldByName('NomeComprovante').AsString;
    DMVirtual.CDS_V_KitsNotasData1.AsString:=IBQ_ConsultaFilial.FieldByName('DataDocumento').AsString;
    DMVirtual.CDS_V_KitsNotasNumero.AsString:=IBQ_ConsultaFilial.FieldByName('ChaveNF').AsString;
    Inc(iNumSeq);
    DMVirtual.CDS_V_KitsNotasNum_Seq.AsInteger:=iNumSeq;
    DMVirtual.CDS_V_KitsNotas.Post;
  End; // If (sDML='I') and (sTipo='N') Then

  //============================================================================
  // Insere Produto de Nota de Kit =============================================
  //============================================================================
  If (sDML='I') and (sTipo='NP') Then
  Begin
    DMVirtual.CDS_V_KitsNotas.Append;
    DMVirtual.CDS_V_KitsNotasTipo.AsString:='PRODUTO';
    DMVirtual.CDS_V_KitsNotasNum_Codigo.AsString:=IBQ_ConsultaFilial.FieldByName('CodKit').AsString;
    DMVirtual.CDS_V_KitsNotasCodigo.AsString:=IBQ_ConsultaFilial.FieldByName('CodBarra_kit').AsString;
    DMVirtual.CDS_V_KitsNotasDescricao.AsString:=IBQ_ConsultaFilial.FieldByName('Des_Kit').AsString;
    DMVirtual.CDS_V_KitsNotasData1.AsString:=IBQ_ConsultaFilial.FieldByName('ValidadeIni_Kit').AsString;
    DMVirtual.CDS_V_KitsNotasData2.AsString:=IBQ_ConsultaFilial.FieldByName('ValidadeFim_Kit').AsString;
    DMVirtual.CDS_V_KitsNotasNumero.AsString:=IBQ_ConsultaFilial.FieldByName('SequenciaDoProduto').AsString;
    DMVirtual.CDS_V_KitsNotasCod_Produto.AsString:=IBQ_ConsultaFilial.FieldByName('CodProduto').AsString;
    DMVirtual.CDS_V_KitsNotasDes_Prod.AsString:=IBQ_ConsultaFilial.FieldByName('Des_Produto').AsString;
    DMVirtual.CDS_V_KitsNotasQuant.AsString:=IBQ_ConsultaFilial.FieldByName('QuantAtendida').AsString;
    DMVirtual.CDS_V_KitsNotasVlr_Bruto.AsCurrency:=IBQ_ConsultaFilial.FieldByName('ValBruto').AsCurrency;
    DMVirtual.CDS_V_KitsNotasPer_Desc.AsCurrency:=IBQ_ConsultaFilial.FieldByName('DescontoCalc').AsCurrency;
    DMVirtual.CDS_V_KitsNotasVlr_Desc.AsCurrency:=IBQ_ConsultaFilial.FieldByName('ValDescItem').AsCurrency;
    DMVirtual.CDS_V_KitsNotasVlr_Total.AsCurrency:=IBQ_ConsultaFilial.FieldByName('ValTotal').AsCurrency;
    Inc(iNumSeq);
    DMVirtual.CDS_V_KitsNotasNum_Seq.AsInteger:=iNumSeq;
    DMVirtual.CDS_V_KitsNotas.Post;
  End; // If (sDML='I') and (sTipo='NP') Then
End; // KITS - Monta Apresentação de Kits da Loja //////////////////////////////

// KITS - Apresenta Kits da Loja ///////////////////////////////////////////////
Procedure TFrmControleKits.KitsApresentaKits;
Var
  iNS_Kit, iNS_NTKit: Integer;
  iCodKit, iCodKitAnt, iNumNota: Integer;
  iNrNT, iNoRec: Integer;
Begin
  iNrNT:=0;

  // Apresentacao ==============================================================
  OdirPanApres.Caption:='AGUARDE !! Montando os Kits na Loja: '+sgCodEmp+' - '+sgDesLoja;
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBelShop.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBelShop.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Visible:=True;
  Refresh;

  // ClientDataSet Virtual
  try
    DMVirtual.CDS_V_Kits.CreateDataSet;
    DMVirtual.CDS_V_Kits.Open;
  Except
    DMVirtual.CDS_V_Kits.EmptyDataSet;
    DMVirtual.CDS_V_Kits.Open;
  End;
  Rb_KitAnalitico.Checked:=True;
  AcertaRb_Style(Rb_KitAnalitico);
  AcertaRb_Style(Rb_KitSintetico);

  DMVirtual.CDS_V_Kits.Filtered:=False;
  DMVirtual.CDS_V_Kits.Filter:='';

  try
    DMVirtual.CDS_V_KitsNotas.CreateDataSet;
    DMVirtual.CDS_V_KitsNotas.Open;
  Except
    DMVirtual.CDS_V_KitsNotas.EmptyDataSet;
    DMVirtual.CDS_V_KitsNotas.Open;
  End;

  // Cria Cabecalhos Kits ======================================================
  iNS_Kit:=0;
  DMVirtual.CDS_V_Kits.Append;
  DMVirtual.CDS_V_KitsDescricao.AsString:='Relação de Kits Vendidos';
  DMVirtual.CDS_V_KitsSintetico.AsString:='S';
  Inc(iNS_Kit);
  DMVirtual.CDS_V_KitsNum_Seq.AsInteger:=iNS_Kit;
  DMVirtual.CDS_V_KitsCod_Kit.AsInteger:=0;
  DMVirtual.CDS_V_Kits.Post;

  DMVirtual.CDS_V_Kits.Append;
  DMVirtual.CDS_V_KitsDescricao.AsString:='Bel_'+sgCodEmp+' - '+sgDesLoja;
  DMVirtual.CDS_V_KitsSintetico.AsString:='S';
  Inc(iNS_Kit);
  DMVirtual.CDS_V_KitsNum_Seq.AsInteger:=iNS_Kit;
  DMVirtual.CDS_V_KitsCod_Kit.AsInteger:=0;
  DMVirtual.CDS_V_Kits.Post;

  DMVirtual.CDS_V_Kits.Append;
  DMVirtual.CDS_V_KitsDescricao.AsString:='Período: '+f_Troca('.','/',sgDtaI)+' a '+f_Troca('.','/',sgDtaF);
  DMVirtual.CDS_V_KitsSintetico.AsString:='S';
  Inc(iNS_Kit);
  DMVirtual.CDS_V_KitsNum_Seq.AsInteger:=iNS_Kit;
  DMVirtual.CDS_V_KitsCod_Kit.AsInteger:=0;
  DMVirtual.CDS_V_Kits.Post;

  DMVirtual.CDS_V_Kits.Append;
  DMVirtual.CDS_V_KitsDescricao.AsString:='';
  DMVirtual.CDS_V_KitsSintetico.AsString:='S';
  Inc(iNS_Kit);
  DMVirtual.CDS_V_KitsNum_Seq.AsInteger:=iNS_Kit;
  DMVirtual.CDS_V_KitsCod_Kit.AsInteger:=0;
  DMVirtual.CDS_V_Kits.Post;

  // Cria Cabecalhos Notas Kits ================================================
  iNS_NTKit:=0;
  DMVirtual.CDS_V_KitsNotas.Append;
  DMVirtual.CDS_V_KitsNotasDescricao.AsString:='Relação de Notas de Kits Vendidos';
  Inc(iNS_NTKit);
  DMVirtual.CDS_V_KitsNotasNum_Seq.AsInteger:=iNS_NTKit;
  DMVirtual.CDS_V_KitsNotas.Post;

  DMVirtual.CDS_V_KitsNotas.Append;
  DMVirtual.CDS_V_KitsNotasDescricao.AsString:='Bel_'+sgCodEmp+' - '+sgDesLoja;
  Inc(iNS_NTKit);
  DMVirtual.CDS_V_KitsNotasNum_Seq.AsInteger:=iNS_NTKit;
  DMVirtual.CDS_V_KitsNotas.Post;

  DMVirtual.CDS_V_KitsNotas.Append;
  DMVirtual.CDS_V_KitsNotasDescricao.AsString:='Período: '+f_Troca('.','/',sgDtaI)+' a '+f_Troca('.','/',sgDtaF);
  Inc(iNS_NTKit);
  DMVirtual.CDS_V_KitsNotasNum_Seq.AsInteger:=iNS_NTKit;
  DMVirtual.CDS_V_KitsNotas.Post;

  DMVirtual.CDS_V_KitsNotas.Append;
  DMVirtual.CDS_V_KitsNotasDescricao.AsString:='';
  Inc(iNS_NTKit);
  DMVirtual.CDS_V_KitsNotasNum_Seq.AsInteger:=iNS_NTKit;
  DMVirtual.CDS_V_KitsNotas.Post;

  // ProgressBar - pgProgBar ===================================================
  IBQ_ConsultaFilial.Last;
  FrmBelShop.MontaProgressBar(True, FrmBelShop);
  pgProgBar.Properties.Max:=IBQ_ConsultaFilial.RecordCount;
  pgProgBar.Position:=0;

  // Gaura Kit da Mesma Nota ===================================================
  Memo2.Lines.Clear;
  Memo2.Width:=500;

  // Inicia Processamento ======================================================
  iNumNota:=0;
  IBQ_ConsultaFilial.First;
  While Not IBQ_ConsultaFilial.Eof do
  Begin
    Application.ProcessMessages;

    Refresh;
    pgProgBar.Position:=IBQ_ConsultaFilial.RecNo;

    //==========================================================================
    // Insere Nota de Kit ======================================================
    //==========================================================================
    If iNumNota<>IBQ_ConsultaFilial.FieldByName('Numero').AsInteger Then
    Begin
      Memo2.Lines.Clear;
      iNoRec:=IBQ_ConsultaFilial.RecNo;
      iNrNT:=IBQ_ConsultaFilial.FieldByName('Numero').AsInteger;
      While iNrNT=IBQ_ConsultaFilial.FieldByName('Numero').AsInteger do
      Begin
        If Trim(IBQ_ConsultaFilial.FieldByName('CodKit').AsString)<>'' Then
         Memo2.Lines.Add(IBQ_ConsultaFilial.FieldByName('CodKit').AsString);

        IBQ_ConsultaFilial.Next;

        If IBQ_ConsultaFilial.Eof Then
         Break;
      End;
      IBQ_ConsultaFilial.RecNo:=iNoRec;
      iNrNT:=IBQ_ConsultaFilial.FieldByName('Numero').AsInteger;

      KitsDML_KITs('I', 'N', iNS_NTKit, iCodKit, iCodKitAnt, iNumNota);
    End; // If iNumNota=IBQ_ConsultaFilial.FieldByName('Numero').AsInteger Then

    //==========================================================================
    // Insere Produto Nota Kit =================================================
    //==========================================================================
    KitsDML_KITs('I', 'NP', iNS_NTKit, iCodKit, iCodKitAnt, iNumNota);

    If Trim(IBQ_ConsultaFilial.FieldByName('CodKit').AsString)<>'' Then
    Begin
      iCodKit:=IBQ_ConsultaFilial.FieldByName('CodKit').AsInteger;
    End;

    //==========================================================================
    // Trata Kits ==============================================================
    //==========================================================================
    If Trim(IBQ_ConsultaFilial.FieldByName('CodKit').AsString)<>'' Then
    Begin
      if DMVirtual.CDS_V_Kits.Locate('Tipo;Codigo',VarArrayOf(['KIT', iCodKit]),[]) Then
       KitsDML_KITs('A', 'K', iNS_Kit, iCodKit, iCodKitAnt, iNumNota) // Atualiza Kit
      Else
       KitsDML_KITs('I', 'K', iNS_Kit, iCodKit, iCodKitAnt, iNumNota); // Insere Kit
    End; // If Trim(IBQ_ConsultaFilial.FieldByName('CodKit').AsString)<>'' Then

    //==========================================================================
    // Trata Produtos do Kit ===================================================
    //==========================================================================
    if DMVirtual.CDS_V_Kits.Locate('Tipo;Codigo;Cod_Kit',VarArrayOf(['PRODUTO',IBQ_ConsultaFilial.FieldByName('CodProduto').AsString,iCodKit]),[]) Then
     KitsDML_KITs('A', 'P', iNS_Kit, iCodKit, iCodKitAnt, iNumNota) // Atualiza Produto Kit
    Else
     KitsDML_KITs('I', 'P', iNS_Kit, iCodKit, iCodKitAnt, iNumNota); // Insere Produto Kit

    iNumNota:=IBQ_ConsultaFilial.FieldByName('Numero').AsInteger;
    iCodKitAnt:=0;
    If Trim(IBQ_ConsultaFilial.FieldByName('CodKit').AsString)<>'' Then
     iCodKitAnt:=IBQ_ConsultaFilial.FieldByName('CodKit').AsInteger;

    IBQ_ConsultaFilial.Next;
  End; // While Not IBQ_ConsultaFilial.Eof do

  FrmBelShop.MontaProgressBar(False, FrmBelShop);

  OdirPanApres.Visible:=False;
  DMVirtual.CDS_V_Kits.First;
  DMVirtual.CDS_V_KitsNotas.First;

End; // KITS - Apresenta Kits da Loja //////////////////////////////////////////

// KITS - Busca Kits na Loja ///////////////////////////////////////////////////
Function TFrmControleKits.KitsBuscaKits: Boolean;
Var
  MySql: String;
Begin
  Result:=False;

  sgCodEmp :=FormatFloat('00',StrToInt(EdtKitCodLoja.Text));
  sgDesLoja:=EdtKitDesLoja.Text;

  // Apresentacao ==============================================================
  OdirPanApres.Caption:='AGUARDE !! Buscando Kits na Loja: '+sgCodEmp+' - '+sgDesLoja;
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBelShop.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBelShop.Height-OdirPanApres.Height)/2));
  OdirPanApres.Visible:=True;
  Refresh;

  // Conecta Empresa ===========================================================
  If Not ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then
  Begin
    OdirPanApres.Visible:=False;
    Refresh;
    msg('Loja Bel_'+sgCodEmp+cr+'NÃO Conectada a Internet !!'+cr+cr+'Tente Mais Tarde...','A');
    Exit;
  End; // If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then

  // Cria Query da Empresa =====================================================
  FrmBelShop.CriaQueryIB('IBDB_'+sgCodEmp,'IBT_'+sgCodEmp, IBQ_ConsultaFilial, True, True);

  Try
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' SELECT DISTINCT mo.numero, mo.chavenf, mo.datadocumento,'+
           ' TRIM(mo.codcomprovante) codcomprovante, cp.nomecomprovante,'+
           ' mp.sequenciadoproduto, mp.codproduto, pr.apresentacao Des_Produto,'+
           ' mp.quantatendida,'+
           ' CASE'+
           '   WHEN mp.descontocalc>99 THEN '''''+
           '   ELSE k.codkit'+
           ' END codkit,'+
           ' CASE'+
           '   WHEN mp.descontocalc>99 THEN '''''+
           '   ELSE k.codbarra'+
           ' END codbarra_kit,'+
           ' CASE'+
           '   WHEN mp.descontocalc>99 THEN ''Produto Promocional'''+
           '   ELSE k.descricao'+
           ' END des_kit,'+
           ' k.validadeini validadeini_kit, k.validadefim validadefim_kit, kp.quantidade qtd_Kit,'+
           ' mp.descontocalc, mp.valdescitem, mp.valbruto, mp.valtotal'+

           ' FROM mcli mo, mclipro mp, kit k, kit_produto kp, comprv cp, produto pr'+

           ' WHERE mo.chavenf=mp.chavenf'+
           ' AND   mo.codcomprovante=cp.codcomprovante'+
           ' AND   k.codkit=kp.codkit'+
           ' AND   mp.codproduto=kp.codproduto'+
           ' AND   mp.codproduto=pr.codproduto'+

           ' AND   mo.datadocumento between '+QuotedStr(sgDtaI)+' and '+QuotedStr(sgDtaF)+
           ' AND   (k.validadefim>='+QuotedStr(sgDtaI)+' or k.validadefim is null)'+
           ' AND   Trim(mo.codcomprovante) IN (''002'',''007'')'+
           ' AND   mo.codfilial='+QuotedStr(sgCodEmp)+

           ' AND EXISTS (SELECT mo1.chavenf, k1.codkit, tot1.tot_pd'+
           '             FROM mcli mo1, mclipro mp1, kit k1, kit_produto kp1,'+
           '              (SELECT kp.codkit, COUNT(DISTINCT kp.codproduto) tot_pd'+
           '               FROM  kit_produto kp'+
           '               GROUP BY 1) tot1'+
           '             WHERE mo1.chavenf=mp1.chavenf'+
           '             AND   mp1.codproduto=kp1.codproduto'+
           '             AND   mp1.desconto1=kp1.desconto'+
           '             AND   k1.codkit=kp1.codkit'+
           '             AND   k1.codkit=tot1.codkit'+
           '             AND   (k1.validadefim>='+QuotedStr(sgDtaI)+' or k1.validadefim is null)'+
           '             AND   mo1.chavenf=mo.chavenf'+
           '             AND   mo1.codfilial=mo.codfilial'+
           '             AND   k1.codkit =k.codkit'+
           '             GROUP BY 1,2,3'+
           '             HAVING COUNT(DISTINCT mp1.codproduto) =tot1.tot_pd)'+
           ' ORDER BY 3, 2, 10 Desc';
    IBQ_ConsultaFilial.Close;
    IBQ_ConsultaFilial.SQL.Clear;
    IBQ_ConsultaFilial.SQL.Add(MySql);
    IBQ_ConsultaFilial.Open;

    Result:=True;

  Except
    on e : Exception do
    Begin
      Screen.Cursor:=crDefault;
      MessageBox(Handle,pChar('Mensagem de erro do sistema:'+cr+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End;

  DateSeparator:='/';
  DecimalSeparator:=',';

  Screen.Cursor:=crDefault;
  OdirPanApres.Visible:=False;
  Refresh;
End; // KITS - Busca Kits na Loja //////////////////////////////////////////////

procedure TFrmControleKits.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bgSairKits Then
   Begin
     Action := caHide; // caFree;

     FrmBelShop.FechaTudo;
   End
  Else
   Begin
     msg('Para Fechar Tecle no Botão <Fechar>...','A');
     Action := caNone;
   End;

end;

procedure TFrmControleKits.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

end;

procedure TFrmControleKits.FormKeyPress(Sender: TObject; var Key: Char);
begin

  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;
end;

procedure TFrmControleKits.FormShow(Sender: TObject);
begin
  // Cor Form
  CorCaptionForm.Active:=False;
  CorCaptionForm.Active:=True;

  bgSairKits:=False;

end;

procedure TFrmControleKits.EdtKitCodLojaChange(Sender: TObject);
begin
  EdtKitDesLoja.Clear;
  FrmBelShop.FechaTudo;
  Refresh;
end;

procedure TFrmControleKits.EdtKitCodLojaExit(Sender: TObject);
Var
  MySql: String;
begin

  EdtKitDesLoja.Clear;

  FrmBelShop.FechaTudo;
  PC_Kit.ActivePage:=Ts_KitKits;
                    
  If EdtKitCodLoja.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Lojas =============================================================
    MySql:=' Select COD_FILIAL, RAZAO_SOCIAL'+
           ' From   EMP_CONEXOES'+
           ' Where  Ind_Ativo=''SIM'''+
           ' And    COD_FILIAL='+QuotedStr(FormatFloat('00',EdtKitCodLoja.AsInteger));
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('RAZAO_SOCIAL').AsString)='' Then
    Begin
      msg('Loja NÃO Encontrada !!!', 'A');
      Screen.Cursor:=crDefault;
      EdtKitCodLoja.Clear;
      EdtKitCodLoja.SetFocus;
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;
    EdtKitDesLoja.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Razao_Social').AsString;
    DMBelShop.CDS_BuscaRapida.Close;
    Dbg_KitKits.SetFocus;

    Screen.Cursor:=crDefault;
  End;
end;

procedure TFrmControleKits.Bt_KitBuscaLojaClick(Sender: TObject);
Var
  MySql: String;
begin

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtKitCodLoja.Clear;
  EdtKitDesLoja.Clear;

  FrmBelShop.FechaTudo;

  EdtKitCodLoja.SetFocus;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' Select COD_FILIAL, RAZAO_SOCIAL'+
         ' From EMP_CONEXOES'+
         ' Where IND_ATIVO=''SIM'''+
         ' Order by RAZAO_SOCIAL';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('RAZAO_SOCIAL').AsString)='' Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Loja a Listar !!','A');
    EdtKitCodLoja.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Razao_Social';
  FrmPesquisa.Campo_Codigo:='Cod_Filial';
  FrmPesquisa.Campo_Descricao:='Razao_Social';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtKitCodLoja.Text:=FrmPesquisa.EdtCodigo.Text;
     EdtKitDesLoja.Text:=FrmPesquisa.EdtDescricao.Text;
     EdtKitCodLojaExit(Self);
   End
  Else
   Begin
     EdtKitCodLoja.Clear;
     EdtKitDesLoja.Clear;
     EdtKitCodLoja.SetFocus;
   End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmControleKits.Dbg_KitKitsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not (gdSelected in State) Then
  Begin
    if DMVirtual.CDS_V_KitsTipo.AsString='KIT' Then
    Begin
      Dbg_KitKits.Canvas.Font.Style:=[fsBold];
      Dbg_KitKits.Canvas.Brush.Color:=clSkyBlue;
    End;

    Dbg_KitKits.Canvas.FillRect(Rect);
    Dbg_KitKits.DefaultDrawDataCell(Rect,Column.Field,state);

    DMVirtual.CDS_V_KitsDta_Validade_Ini.Alignment:=taCenter;
    DMVirtual.CDS_V_KitsDta_Validade_Fim.Alignment:=taCenter;
    DMVirtual.CDS_V_KitsCodigo.Alignment:=taRightJustify;
    DMVirtual.CDS_V_KitsCod_Barras.Alignment:=taRightJustify;
  End; // if not (gdSelected in State) Then


end;

procedure TFrmControleKits.Dbg_KitNotasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not (gdSelected in State) Then
  Begin
    if DMVirtual.CDS_V_KitsNotasTipo.AsString='NOTA' Then
    Begin
      Dbg_KitNotas.Canvas.Font.Style:=[fsBold];
      Dbg_KitNotas.Canvas.Brush.Color:=clSkyBlue;
    End;

    Dbg_KitNotas.Canvas.FillRect(Rect);
    Dbg_KitNotas.DefaultDrawDataCell(Rect,Column.Field,state);

    DMVirtual.CDS_V_KitsNotasData1.Alignment:=taCenter;
    DMVirtual.CDS_V_KitsNotasData2.Alignment:=taCenter;
    DMVirtual.CDS_V_KitsNotasNum_Codigo.Alignment:=taRightJustify;
    DMVirtual.CDS_V_KitsNotasCodigo.Alignment:=taRightJustify;
    DMVirtual.CDS_V_KitsNotasNumero.Alignment:=taRightJustify;
    DMVirtual.CDS_V_KitsNotasCod_Produto.Alignment:=taRightJustify;
  End; // if not (gdSelected in State) Then


end;

procedure TFrmControleKits.PC_KitChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_Kit);

  If (PC_Kit.ActivePage=Ts_KitKits) And (Ts_KitKits.CanFocus) Then
  Begin
    Rb_KitAnalitico.Visible:=True;
    Rb_KitSintetico.Visible:=True;
  End;

  If (PC_Kit.ActivePage=Ts_KitNotas) And (Ts_KitNotas.CanFocus) Then
  Begin
    Rb_KitAnalitico.Visible:=False;
    Rb_KitSintetico.Visible:=False;
  End;


end;

procedure TFrmControleKits.Bt_KitClipboardClick(Sender: TObject);
begin
  If PC_Kit.ActivePage=Ts_KitKits Then
  Begin
    If DMVirtual.CDS_V_Kits.IsEmpty Then
     Exit;

    DBGridClipboard(Dbg_KitKits);
    Dbg_KitKits.SetFocus;
  End;

  If PC_Kit.ActivePage=Ts_KitNotas Then
  Begin
    If DMVirtual.CDS_V_KitsNotas.IsEmpty Then
     Exit;

    DBGridClipboard(Dbg_KitNotas);
    Dbg_KitNotas.SetFocus;
  End;

end;

procedure TFrmControleKits.Rb_KitAnaliticoClick(Sender: TObject);
Var
  ii: Integer;
  sCodKit: String;
begin
  If DMVirtual.CDS_V_Kits.IsEmpty Then
  Begin
    Rb_KitAnalitico.Checked:=True;
    Exit;
  End;

  AcertaRb_Style(Rb_KitAnalitico);
  AcertaRb_Style(Rb_KitSintetico);

  sCodKit:=DMVirtual.CDS_V_KitsCod_Kit.AsString;
  If DMVirtual.CDS_V_KitsTipo.AsString<>'KIT' Then
  Begin
    For ii:=DMVirtual.CDS_V_Kits.RecNo  downto 0 do
    Begin
      If ii<1 Then
       Break;
       
      DMVirtual.CDS_V_Kits.RecNo:=ii;
      If DMVirtual.CDS_V_KitsTipo.AsString='KIT' Then
      Begin
        sCodKit:=DMVirtual.CDS_V_KitsCod_Kit.AsString;
        Break;
      End;
    End; // For ii:=DMVirtual.CDS_V_Kits.RecNo  downto 0 do
  End; // If DMVirtual.CDS_V_KitsTipo.AsString<>'KTI' Then

  DMVirtual.CDS_V_Kits.Filtered:=False;
  DMVirtual.CDS_V_Kits.Filter:='';

  If Rb_KitSintetico.Checked Then
  Begin
    DMVirtual.CDS_V_Kits.Filter:='SINTETICO=''S''';
    DMVirtual.CDS_V_Kits.Filtered:=True;
  End;
  if Not DMVirtual.CDS_V_Kits.Locate('Tipo;Codigo',VarArrayOf(['KIT',sCodKit]),[]) Then
   DMVirtual.CDS_V_Kits.First;

  Dbg_KitKits.SetFocus;

end;

procedure TFrmControleKits.Rb_KitAnaliticoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Rb_KitAnaliticoClick(Self);

end;

procedure TFrmControleKits.Bt_KitBuscaKitsClick(Sender: TObject);
begin
  If (EdtKitCodLoja.Value=0) Or (Trim(EdtKitDesLoja.Text)='') Then
  Begin
    msg('Favor Informar a Loja !!','A');
    EdtKitCodLoja.SetFocus;
    Exit;
  End;

  FrmBelShop.FechaTudo;
  FrmBelShop.MontaProgressBar(False, FrmBelShop);

  PC_Kit.ActivePage:=Ts_KitKits;
  Dbg_KitKits.SetFocus;

  // Solicita Periodo ==========================================================
  bgSiga:=False;
  FrmPeriodoApropriacao:=TFrmPeriodoApropriacao.Create(Self);
  FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Text:=
                      DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));
  FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Text   :=
                      DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));
  FrmPeriodoApropriacao.ShowModal;

  sgDtaI:=DateToStr(FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Date);
  sgDtaF:=DateToStr(FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Date);
  FreeAndNil(FrmPeriodoApropriacao);

  sgDtaI:=f_Troca('/','.',f_Troca('-','.',sgDtaI));
  sgDtaF:=f_Troca('/','.',f_Troca('-','.',sgDtaF));

  // Verifica se Prossegue Processamento =======================================
  If Not bgSiga Then
   Exit;

  // Busca Notas Com Kit =======================================================
  If Not KitsBuscaKits Then
  Begin
    PC_Kit.ActivePage:=Ts_KitKits;
    Dbg_KitKits.SetFocus;
    Exit;
  End;

  // Monta a Apresentacao dos Kits =============================================
  KitsApresentaKits;

  // Fecha Conexão =============================================================
  ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F');

  Dbg_KitKits.SetFocus;


end;

procedure TFrmControleKits.Bt_KitFecharClick(Sender: TObject);
begin
  bgSairKits:=True;
  Close;
end;

end.
