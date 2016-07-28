unit USpedFiscalAcerta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExControls, JvXPCore, JvXPButtons, cxProgressBar,
  ExtCtrls, Grids, DBGrids, DB, DBClient, ACBrBase, ACBrSocket, ACBrIBGE,
  dxGDIPlusClasses, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, dxStatusBar, ComCtrls,
  JvExComCtrls, JvStatusBar, Mask, ToolEdit, CurrEdit;

type
  TFrmSpedFiscalAcerta = class(TForm)
    Panel1: TPanel;
    Gb_Arquivo: TGroupBox;
    Bt_BuscaArquivo: TJvXPButton;
    EdtPastaArquivo: TEdit;
    Bt_CorrigeArquivo: TJvXPButton;
    Pan_OBS: TPanel;
    ACBrIBGE1: TACBrIBGE;
    Bt_Parar: TJvXPButton;
    Image1: TImage;
    Label1: TLabel;
    StBar: TJvStatusBar;
    Pan_ST: TPanel;
    Pan_Diversos: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    DBGrid5: TDBGrid;
    Pan_Notas_Des: TPanel;
    DBGrid6: TDBGrid;
    Pan_Notas_ST_Erradas: TPanel;
    DBGrid7: TDBGrid;
    Label2: TLabel;
    hHrInicio: TLabel;
    Label4: TLabel;
    hHrFim: TLabel;
    Label6: TLabel;
    hHrTotal: TLabel;
    Gb_Versao: TGroupBox;
    EdtVersao: TCurrencyEdit;
    procedure Bt_BuscaArquivoClick(Sender: TObject);
    procedure Bt_CorrigeArquivoClick(Sender: TObject);

    // Odir
    Procedure FechaTudo;

    // Monta PrograssBar
    Procedure MontaProgressBar(bCria: Boolean);

    // Atualiza ST
    Procedure AtualizaST_Serie_DES(Var tsArquivo: TStringList);

    // Acerta Registros de Inventário
    Procedure AcertaRegistrosInventario(Var tsArquivo: TStringList);

    // Odir

    procedure ACBrIBGE1BuscaEfetuada(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_PararClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSpedFiscalAcerta: TFrmSpedFiscalAcerta;

  pgProgBar:TcxProgressBar;

  ArrayCFopErrado: array of string;
  ArrayCFopCerto: array of string;     

//  ArrayCFopCerto: array[1..25] of string =
//  ('1403','1403','1403','1403','1403','2403','2403','2403','2403','2403',
//   '1102','1102','1102','1102','1102','2102','2102','2102','2102','2102',
//   '1910','1910','2910','2910','1152');

  dgDtaI, dgDtaF: TDate;

  sgDtIni_Per, sgDtFim_Per,
  sgCodDest, sgUFDest: String;
  sOdir: String;

  bgParar: Boolean;

  sgPastaExe: String;

  bgAtualizaST: Boolean; // Notas ST Erradas já Processadas

  // Registro de Invantário
  bg0500,                // Se Existe Plano de contas contábeis
  bgCod82601,            // Se Existe o Codigo 82601 - Estoque de Mercadorias
  bgInventario:Boolean;  // Se Existe Registro de Inventário

  cgTotalInventario: Currency;

  OdirTXT: String;

implementation

uses DK_Procs1, uj_001, uj_002, StrUtils, UFrmCFopProduto, UDM,
  UFrmAlertaST, Math;

{$R *.dfm}

// Odir

// Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSpedFiscalAcerta.FechaTudo;
Var
  i: Integer;
Begin

  // Fecha Componentes DMBelShop ===============================================
  For i:=0 to DM.ComponentCount-1 do
  Begin
    If DM.Components[i] is TClientDataSet Then
     If (DM.Components[i] as TClientDataSet).Active Then
     (DM.Components[i] as TClientDataSet).Close;

//    If DM.Components[i] is TIBQuery Then
//     If (DM.Components[i] as TIBQuery).Active Then
//     (DM.Components[i] as TIBQuery).Close;
  End;
end; // Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Acerta Registros de Inventário >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSpedFiscalAcerta.AcertaRegistrosInventario(Var tsArquivo: TStringList);
var
  iSoma, iSoma9990, i, ii: Integer;
  s, sLinha, sNovaLinha, sRegAtual: String;

  b9900_OK, bH010_Excluido: Boolean;

  mMemo: TMemo;

  iH990,               // |H990|????|
  i9900_H010: Integer; // |9900|H010|????|
Begin

  // Cria Componente Memo ======================================================
  mMemo:=TMemo.Create(Self);
  mMemo.Visible:=False;
  mMemo.Parent:=FrmSpedFiscalAcerta;
  mMemo.Width:=500;
  mMemo.Lines.Clear;

  MontaProgressBar(True);

  iSoma:=0;
  b9900_OK:=False;
  iH990:=0;      // |H990|????|
  i9900_H010:=0; // |9900|H010|????|

  pgProgBar.Properties.Max:=tsArquivo.Count;
  For i:=0 to tsArquivo.Count-1 do
  Begin
    Application.ProcessMessages;

    If bgParar Then
    Begin
      Break;
    End;

    pgProgBar.Position:=i+1;

    sLinha:=tsArquivo[i];
    sRegAtual:=Trim(Separa_String(sLinha,2,'|'));

    //Odir
//    Label1.Caption:=IntToStr(i+1);
//    Label1.Caption:=Label1.Caption+' - '+sRegAtual;

    // =========================================================================
    // REGISTRO 0500: PLANO DE CONTAS CONTÁBEIS ================================
    // =========================================================================
    If ((sRegAtual='0500') and (bg0500) and (not bgCod82601)) Or
       ((StrToInt(copy(sRegAtual,2,3))>460) and (Not bg0500) and (not bgCod82601)) Then
    Begin
      Inc(iSoma);
      bgCod82601:=True;
      mMemo.Lines.Add(IntToStr(i)+';'+'|0500|'+sgDtIni_Per+'|01|A|1|82601|ESTOQUE DE MECADORIAS|;');
    End; // If ((sRegAtual)='0500') and (bg0500) and (not bgCod82601)) Or

    // =========================================================================
    // REGISTRO H005: TOTAIS DO INVENTÁRIO =====================================
    // =========================================================================
    If (sRegAtual='H005') Then
    Begin
      For ii:=2 to 5 do
      Begin
        If ii=4 Then
         Begin
           s:=CurrToStr(cgTotalInventario);
           s:=ZerosCentavos(s,2);

           sNovaLinha:=sNovaLinha+'|'+s;
         End
        Else // If ii=11 Then
         Begin
           sNovaLinha:=sNovaLinha+'|'+Trim(Separa_String(sLinha,ii,'|'));
         End; // If ii=11 Then
      End; // For ii:=2 to 5 do

      tsArquivo[i]:=sNovaLinha+'|';
      sNovaLinha:='';
      sLinha:=tsArquivo[i];
    End; // If (sRegAtual='H005') Then

    // =========================================================================
    // REGISTRO H010: INVENTÁRIO ===============================================
    // Retira Produto com Quantidade Inventariada = 0 ==========================
    // Código da conta analítica contábil debitada/creditada ===================
    // Leiaute Alterado apartir de 01/01/2015 ==================================
    // =========================================================================
    While (sRegAtual='H010') do
    Begin

      If (sRegAtual<>'H010') Then
       Break;

      bH010_Excluido:=False;

      // Retira Prodtuo com Quantidade Inventariada = 0
      If StrToCurr(Trim(Separa_String(sLinha,5,'|')))=0 Then
      Begin
        tsArquivo.Delete(i);
        Inc(iH990);
        Inc(i9900_H010);
        iSoma:=iSoma-1;

        sLinha:=tsArquivo[i];
        sRegAtual:=Trim(Separa_String(sLinha,2,'|'));

        bH010_Excluido:=True;
      End; // If StrToInt(Trim(Separa_String(sLinha,5,'|'))=0) Then

      If (sRegAtual<>'H010') Then
       Break;

      // Código da conta analítica contábil debitada/creditada
      If (Trim(Separa_String(sLinha,11,'|'))='') Then
      Begin
        // ==============================
        // Para Inventario de ANO < 2015
        // ==============================
        If StrToInt(Copy(sgDtIni_Per,5,4))<2015 Then
        Begin
          For ii:=2 to 11 do
          Begin
            If ii=11 Then
             Begin
               sNovaLinha:=sNovaLinha+'|'+'82601';
             End
            Else // If ii=11 Then
             Begin
               sNovaLinha:=sNovaLinha+'|'+Trim(Separa_String(sLinha,ii,'|'));
             End; // If ii=11 Then
          End; // For ii:=2 to 11 do
        End; // If StrToInt(Copy(sgDtIni_Per,5,4))<2015 Then

        // ==============================
        // Para Inventario de ANO >= 2015
        // ==============================
        If StrToInt(Copy(sgDtIni_Per,5,4))>=2015 Then
        Begin
          For ii:=2 to 12 do
          Begin
            If ii=11 Then
             Begin
               sNovaLinha:=sNovaLinha+'|'+'82601';
             End
            Else // If ii=11 Then
             Begin
               sNovaLinha:=sNovaLinha+'|'+Trim(Separa_String(sLinha,ii,'|'));
             End; // If ii=11 Then
          End; // For ii:=2 to 12 do
        End; // If StrToInt(Copy(sgDtIni_Per,5,4))>=2015 Then

        tsArquivo[i]:=sNovaLinha+'|';
        sNovaLinha:='';
        sLinha:=tsArquivo[i];
      End; // If (Trim(Separa_String(sLinha,11,'|'))='') Then

      // Valores Negativos ===================================
      If (StrToCurr(Trim(Separa_String(sLinha,5,'|')))<0) or
         (StrToCurr(Trim(Separa_String(sLinha,6,'|')))<0) or
         (StrToCurr(Trim(Separa_String(sLinha,7,'|')))<0) Then
      Begin
        If StrToInt(Copy(sgDtIni_Per,5,4))<2015 Then
        Begin
          For ii:=2 to 11 do
          Begin
            If ii=5 Then
             Begin
               sNovaLinha:=sNovaLinha+'|'+ZerosCentavos(FloatToStr(ABS(StrToFloat(Trim(Separa_String(sLinha,5,'|'))))),3);
             End
            Else If ii=6 Then
             Begin
               sNovaLinha:=sNovaLinha+'|'+ZerosCentavos(FloatToStr(ABS(StrToFloat(Trim(Separa_String(sLinha,6,'|'))))),6);
             End
            Else If ii=7 Then
             Begin
               sNovaLinha:=sNovaLinha+'|'+ZerosCentavos(FloatToStr(ABS(StrToFloat(Trim(Separa_String(sLinha,7,'|'))))),2);
             End
            Else
             Begin
               sNovaLinha:=sNovaLinha+'|'+Trim(Separa_String(sLinha,ii,'|'));
             End; // If ii=5 Then
          End; // For ii:=2 to 11 do
        End; // If StrToInt(Copy(sgDtIni_Per,5,4))<2015 Then

        // ==============================
        // Para Inventario de ANO >= 2015
        // ==============================
        If StrToInt(Copy(sgDtIni_Per,5,4))>=2015 Then
        Begin
          For ii:=2 to 12 do
          Begin
            If ii=5 Then
             Begin
               sNovaLinha:=sNovaLinha+'|'+ZerosCentavos(FloatToStr(ABS(StrToFloat(Trim(Separa_String(sLinha,5,'|'))))),3);
             End
            Else If ii=6 Then
             Begin
               sNovaLinha:=sNovaLinha+'|'+ZerosCentavos(FloatToStr(ABS(StrToFloat(Trim(Separa_String(sLinha,6,'|'))))),6);
             End
            Else If ii=7 Then
             Begin
               sNovaLinha:=sNovaLinha+'|'+ZerosCentavos(FloatToStr(ABS(StrToFloat(Trim(Separa_String(sLinha,7,'|'))))),2);
             End
            Else
             Begin
               sNovaLinha:=sNovaLinha+'|'+Trim(Separa_String(sLinha,ii,'|'));
             End; // If ii=5 Then
          End; // For ii:=2 to 12 do
        End; // If StrToInt(Copy(sgDtIni_Per,5,4))>=2015 Then

        tsArquivo[i]:=sNovaLinha+'|';
        sNovaLinha:='';
        sLinha:=tsArquivo[i];
      End; // If (Trim(Separa_String(sLinha,11,'|'))='') Then

      If Not bH010_Excluido Then
       Break;

      If (sRegAtual<>'H010') Then
       Break;
    End; // While sRegAtual='H010' do

    // =========================================================================
    // REGISTRO 0990: ENCERRAMENTO DO BLOCO 0 ==================================
    // =========================================================================
    If sRegAtual='0990' Then
    Begin
      tsArquivo[i]:='|0990|'+(IntToStr(StrToInt(Trim(Separa_String(sLinha,3,'|')))+iSoma))+'|';
    End; // If sRegAtual='0990' Then

    // =========================================================================
    // REGISTRO 9900: REGISTROS DO ARQUIVO (Se Não Existir Reg 500) ============
    // =========================================================================
    If (sRegAtual='9900') and  (StrToInt(copy(Trim(Separa_String(sLinha,3,'|')),2,3))>460) and (not bg0500) And (Not b9900_OK) Then
    Begin
      Inc(iSoma);
      Inc(iSoma9990);
      mMemo.Lines.Add(IntToStr(i-1)+';'+'|9900|0500|1|;');
      b9900_OK:=True;
    End;

    // =========================================================================
    // REGISTRO 9900: REGISTROS DO ARQUIVO (Se Existir Reg 500) ================
    // =========================================================================
    If (sRegAtual='9900') and  (Trim(Separa_String(sLinha,3,'|'))='0500') and (bg0500) Then
    Begin
      tsArquivo[i]:='|9900|0500|'+(IntToStr(StrToInt(Trim(Separa_String(sLinha,4,'|')))+iSoma))+'|';
    End;

    // =========================================================================
    // REGISTRO H990 H010: ENCERRAMENTO DO BLOCO H010 ==========================
    // =========================================================================
    If (sRegAtual='9900') And (Trim(Separa_String(sLinha,3,'|'))='H010') Then
    Begin
      tsArquivo[i]:='|9900|H010|'+(IntToStr(StrToInt(Trim(Separa_String(sLinha,4,'|')))-i9900_H010))+'|';
    End;

    // =========================================================================
    // REGISTRO H990: ENCERRAMENTO DO BLOCO H ==================================
    // =========================================================================
    If (sRegAtual='H990') Then
    Begin
      tsArquivo[i]:='|H990|'+(IntToStr(StrToInt(Trim(Separa_String(sLinha,3,'|')))-iH990))+'|';
    End;

    // =========================================================================
    // REGISTRO 9900: REGISTROS DO ARQUIVO (Total) =============================
    // =========================================================================
    If (sRegAtual='9900') and  (Trim(Separa_String(sLinha,3,'|'))='9900') and (Not bg0500) Then
    Begin
      tsArquivo[i]:='|9900|9900|'+(IntToStr(StrToInt(Trim(Separa_String(sLinha,4,'|')))+1))+'|';
    End;

    // =========================================================================
    // REGISTRO 9990: ENCERRAMENTO DO BLOCO 9 ==================================
    // =========================================================================
    If sRegAtual='9990' Then
    Begin
      tsArquivo[i]:='|9990|'+(IntToStr(StrToInt(Trim(Separa_String(sLinha,3,'|')))+iSoma9990))+'|';
    End; // If sRegAtual='9990' Then

    // =========================================================================
    // REGISTRO 9999: ENCERRAMENTO DO ARQUIVO DIGITAL ==========================
    // =========================================================================
    If sRegAtual='9999' Then
    Begin
      tsArquivo[i]:='|9999|'+(IntToStr(StrToInt(Trim(Separa_String(sLinha,3,'|')))+iSoma))+'|';
      Break;
    End; // If sRegAtual='9999' Then
  End; // For i:=0 to tsArquivo.Count-1 do

  // Insere Novas Linhas =======================================================
  For i:=0 to mMemo.Lines.Count-1 do
  Begin
    s:=Separa_String(mMemo.Lines[i],1,';')+' - '+Separa_String(mMemo.Lines[i],2,';');
    tsArquivo.Insert(StrToInt(Separa_String(mMemo.Lines[i],1,';')),Separa_String(mMemo.Lines[i],2,';'));

  End; // For i:=0 to mMemo.Lines.Count-1 do
  FreeAndNil(mMemo);

  MontaProgressBar(False);
End; // Acerta Registros de Inventário >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Atualiza ST com Serie = DES >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSpedFiscalAcerta.AtualizaST_Serie_DES(Var tsArquivo: TStringList);
var
  i, ii: Integer;
  iIndexST: Integer;

  s, sLinha, sNovaLinha, sRegAtual: String;
  cVlr_ST: Currency;

  bAlteraC170, bEncontrouC170, bGravouC170, bGravouC190: Boolean;

  sCST_ICMS, sCFOP, sALIQ_ICMS: String;
  sCOD_PART, sNUM_DOC, sDT_DOC, sDT_E_S, sSERIE,
  sVlr_ST, sVlr_Nota, sVlr_Merc: String;
Begin

  If Not bgAtualizaST Then
   DM.CDS_Nota_ST_Errada.EmptyDataSet;

  MontaProgressBar(True);

  bAlteraC170:=False;
  bEncontrouC170:=False;
  bGravouC170:=False;
  bGravouC190:=False;

  sCST_ICMS:='';
  sCFOP:='';
  sALIQ_ICMS:='';

  sCOD_PART:='';
  sNUM_DOC :='';
  sDT_DOC  :='';
  sDT_E_S  :='';
  sSERIE   :='';
  sVlr_ST  :='';
  sVlr_Nota:='';
  sVlr_Merc:='';
  cVlr_ST  :=0;

  pgProgBar.Properties.Max:=tsArquivo.Count;
  For i:=0 to tsArquivo.Count-1 do
  Begin
    Application.ProcessMessages;

    If bgParar Then
    Begin
      Break;
    End;

    pgProgBar.Position:=i+1;

    sLinha:=tsArquivo[i];
    sRegAtual:=Trim(Separa_String(sLinha,2,'|'));

    //Odir
//    Label1.Caption:=IntToStr(i+1);
//    Label1.Caption:=Label1.Caption+' - '+sRegAtual;

    // =========================================================================
    // REGISTRO C100: NOTA FISCAL (CÓDIGO 01), NOTA FISCAL AVULSA (CÓDIGO 1B),
    // NOTA FISCAL DE PRODUTOR (CÓDIGO 04) E NF-e (CÓDIGO 55).
    // =========================================================================
    If sRegAtual='C100' Then
    Begin
      bAlteraC170:=False;
      bEncontrouC170:=False;
      bGravouC170:=False;
      bGravouC190:=False;

      sCST_ICMS:='';
      sCFOP:='';
      sALIQ_ICMS:='';

      sCOD_PART:='';
      sNUM_DOC :='';
      sDT_DOC  :='';
      sDT_E_S  :='';
      sSERIE   :='';
      sVlr_ST  :='';
      sVlr_Nota:='';
      sVlr_Merc:='';

      cVlr_ST  :=0;

      if DM.CDS_ST.Locate('COD_PART;NUM_DOC',VarArrayOf([Trim(Separa_String(sLinha,5,'|')), Trim(Separa_String(sLinha,9,'|'))]),[]) Then
      Begin
//        Refresh;
        iIndexST:=i; // Guarde Index da Nota que Acrescentou a ST no Valor da Nota

        bAlteraC170:=True;
        bEncontrouC170:=False;
        bGravouC170:=False;
        bGravouC190:=False;

        cVlr_ST:=StrToCurr(Trim(DM.CDS_STVL_DOC.AsString));

        // Atualiza Registro C100 -------------------------------
        For ii:=2 to 30 do
        Begin
          If ii=13 Then
           Begin
             s:=CurrToStr((cVlr_ST+StrToCurr(Trim(Separa_String(sLinha,13,'|')))));
             s:=ZerosCentavos(s,2);

             sNovaLinha:=sNovaLinha+'|'+s;
           End
          Else If ii=17 Then
           Begin
             s:=CurrToStr((cVlr_ST+StrToCurr(Trim(Separa_String(sLinha,17,'|')))));
             s:=ZerosCentavos(s,2);

             sNovaLinha:=sNovaLinha+'|'+s;
           End
          Else
           Begin
             sNovaLinha:=sNovaLinha+'|'+Trim(Separa_String(sLinha,ii,'|'));
           End; // If ii=13 Then
        End; // For ii:=2 to 30 do

        // Guarda Variaveis para Utiliza caso nota ST Errada ---
        sCOD_PART:=Trim(Separa_String(sLinha,5,'|'));
        sNUM_DOC :=Trim(Separa_String(sLinha,9,'|'));
        sDT_DOC  :=Trim(Separa_String(sLinha,11,'|'));
        sDT_E_S  :=Trim(Separa_String(sLinha,12,'|'));
        sSERIE   :=Trim(Separa_String(sLinha,08,'|'));
        sVlr_ST  :=CurrToStr(cVlr_ST);
        sVlr_Nota:=Trim(Separa_String(sLinha,13,'|'));
        sVlr_Merc:=Trim(Separa_String(sLinha,17,'|'));

        DM.CDS_ST.Delete;

        tsArquivo[i]:=sNovaLinha+'|';
        sNovaLinha:='';
        sLinha:=tsArquivo[i];
      End; // if DM.CDS_ST.Locate('COD_PART;NUM_DOC',VarArrayOf([Trim(Separa_String(sLinha,5,'|')), Trim(Separa_String(sLinha,9,'|'))]),[]) Then
    End; // If sRegAtual='C100' Then

    // =========================================================================
    // REGISTRO C170: ITENS DO DOCUMENTO (CÓDIGO 01, 1B, 04 e 55). =============
    // =========================================================================
    If (bAlteraC170) And (Not  bEncontrouC170) and (Not bGravouC170) and (sRegAtual='C170') Then
    Begin
      // Vefirica CST_ICMS com Final Igual 10 ou  60
      If (Copy(Trim(Separa_String(sLinha,11,'|')),2,2)='10') Or (Copy(Trim(Separa_String(sLinha,11,'|')),2,2)='60')  Then
      Begin
        bEncontrouC170:=True;
        bGravouC170:=True;
        bAlteraC170:=False;
        bGravouC190:=False;

        For ii:=2 to 38 do
        Begin
          If ii=8 Then
           Begin
             s:=CurrToStr((cVlr_ST+StrToCurr(Trim(Separa_String(sLinha,8,'|')))));
             s:=ZerosCentavos(s,2);

             sNovaLinha:=sNovaLinha+'|'+s;
           End
          Else // If ii=8 Then
           Begin
             sNovaLinha:=sNovaLinha+'|'+Trim(Separa_String(sLinha,ii,'|'));
           End; // If ii=8 Then
        End; // For ii:=2 to 38 do

        // Guarda Variaveis para Atualizar C190
        sCST_ICMS :=Trim(Separa_String(sLinha,11,'|'));
        sCFOP     :=Trim(Separa_String(sLinha,12,'|'));
        sALIQ_ICMS:=Trim(Separa_String(sLinha,15,'|'));

        tsArquivo[i]:=sNovaLinha+'|';
        sNovaLinha:='';
        sLinha:=tsArquivo[i];
      End; // If (Copy(Trim(Separa_String(sLinha,11,'|')),2,2) in ['10','60']) Then
    End; // If (bAlteraC170) and (sRegAtual='C170') Then

    // =========================================================================
    // REGISTRO C190: REGISTRO ANALÍTICO DO DOCUMENTO (CÓDIGO 01, 1B, 04 E 55).
    // =========================================================================
    If (sRegAtual='C190') and (bEncontrouC170) and (Not bAlteraC170) and (bGravouC170) and (Not bGravouC190) Then
    Begin
      // Vefirica CST_ICMS, Aliq_ICMS
      If (Trim(Separa_String(sLinha,3,'|'))=sCST_ICMS)  and
         (Trim(Separa_String(sLinha,4,'|'))=sCFOP)      and
         (Trim(Separa_String(sLinha,5,'|'))=sALIQ_ICMS) Then
      Begin
        bGravouC190:=True;

        For ii:=2 to 13 do
        Begin
          If ii=6 Then
           Begin
             s:=CurrToStr((cVlr_ST+StrToCurr(Trim(Separa_String(sLinha,6,'|')))));
             s:=ZerosCentavos(s,2);

             sNovaLinha:=sNovaLinha+'|'+s;
           End
          Else // If ii=6 Then
           Begin
             sNovaLinha:=sNovaLinha+'|'+Trim(Separa_String(sLinha,ii,'|'));
           End; // If ii=6 Then
        End; // For ii:=2 to 13 do

        sCST_ICMS:='';
        sCFOP:='';
        sALIQ_ICMS:='';

        sCOD_PART:='';
        sNUM_DOC :='';
        sDT_DOC  :='';
        sDT_E_S  :='';
        sSERIE   :='';
        sVlr_ST  :='';
        sVlr_Nota:='';
        sVlr_Merc:='';

        tsArquivo[i]:=sNovaLinha+'|';
        sNovaLinha:='';
        sLinha:=tsArquivo[i];
      End; // If (Trim(Separa_String(sLinha,3,'|'))=sCST_ICMS)  and
    End; // If (bEncontrouC170) and (Not bAlteraC170) and (sRegAtual='C190') Then

    // Guarde Nota com CST_ICMS Errada para Acertar ============================
    If  (sRegAtual='C190') and (Not bEncontrouC170) and (bAlteraC170) and
        (Not bGravouC170) and (Not bGravouC190) and (Trim(sNUM_DOC)<>'')Then
    Begin
      bAlteraC170:=False;
      bEncontrouC170:=False;
      bGravouC190:=True;

      // Guarda Nota Errada -----------------------------------------
      DM.CDS_Nota_ST_Errada.Insert;
      DM.CDS_Nota_ST_ErradaCOD_PART.AsString :=sCOD_PART;
      DM.CDS_Nota_ST_ErradaNUM_DOC.AsString  :=sNUM_DOC;
      DM.CDS_Nota_ST_ErradaSERIE.AsString    :=sSERIE;
      DM.CDS_Nota_ST_ErradaDT_DOC.AsString   :=sDT_DOC;
      DM.CDS_Nota_ST_ErradaDT_E_S.AsString   :=sDT_E_S;
      DM.CDS_Nota_ST_ErradaVL_DOC.AsString   :=sVlr_Nota;
      DM.CDS_Nota_ST_ErradaVL_ST.AsString    :=sVlr_ST;
      DM.CDS_Nota_ST_Errada.Post;

      // Retorna valores Originais da Nota --------------------------
      For ii:=2 to 30 do
      Begin
        If ii=13 Then
         Begin
           s:=ZerosCentavos(sVlr_Nota,2);

           sNovaLinha:=sNovaLinha+'|'+s;
         End
        Else If ii=17 Then
         Begin
           s:=ZerosCentavos(sVlr_Merc,2);

           sNovaLinha:=sNovaLinha+'|'+s;
         End
        Else
         Begin
           sNovaLinha:=sNovaLinha+'|'+Trim(Separa_String(tsArquivo[iIndexST],ii,'|'));
         End; // If ii=13 Then
      End; // For ii:=2 to 30 do
      tsArquivo[iIndexST]:=sNovaLinha+'|';
      sNovaLinha:='';

      sCST_ICMS:='';
      sCFOP:='';
      sALIQ_ICMS:='';

      sCOD_PART:='';
      sNUM_DOC :='';
      sDT_DOC  :='';
      sDT_E_S  :='';
      sSERIE   :='';
      sVlr_ST  :='';
      sVlr_Nota:='';
      sVlr_Merc:='';
    End; // If (Not bEncontrouC170) and (bAlteraC170) and (sRegAtual='C190') Then

  End; // For i:=0 to tsArquivo.Count-1 do
  MontaProgressBar(False);
End; // Atualiza ST com Serie = DES >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Monta ProgressBar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSpedFiscalAcerta.MontaProgressBar(bCria: Boolean);
Begin

  If bCria Then
  Begin
    pgProgBar:=TcxProgressBar.Create(Self);
    pgProgBar.Parent:=FrmSpedFiscalAcerta;
    pgProgBar.Visible:=True;
    pgProgBar.Style.Font.Style:=[fsBold];
    pgProgBar.Left:=27;
    pgProgBar.Top:=140;
    pgProgBar.Width:=969;
  End; // If bCria Then

  If Not bCria Then
  Begin
    FreeAndNil(pgProgBar);
  End;

//  Refresh;

End; // Monta ProgressBar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmSpedFiscalAcerta.Bt_BuscaArquivoClick(Sender: TObject);
Var
  OpenDialog: TOpenDialog;
begin

  EdtPastaArquivo.SetFocus;
  
  Pan_ST.Visible:=False;
  Pan_Diversos.Visible:=True;


  Bt_CorrigeArquivo.Enabled:=False;

  OpenDialog := TOpenDialog.Create(Self);
  With OpenDialog do
  Begin
    Options := [ofPathMustExist, ofHideReadOnly, ofOverwritePrompt];
    DefaultExt := 'TXT';
    Filter := 'Arquivo SpedFiscal (*.txt)|*.TXT';
    FilterIndex := 1;
    Title := 'Busca Arquivo SpedFiscal';

    If Execute then
     Begin
       EdtPastaArquivo.Text:=OpenDialog.FileName;
       Bt_CorrigeArquivo.Enabled:=True;
       EdtVersao.SetFocus;
     End
    Else
    Begin
      Free;
      Exit;
    End;

    Free;
  End;
end;

procedure TFrmSpedFiscalAcerta.Bt_CorrigeArquivoClick(Sender: TObject);
var
  tsArqICMS, tsArquivo, tsArquivoNovo, tsArqCFops: TStringList;

  MySql, sNomePart: String;

  i, ii, iii, iTotal: Integer;
  sArq, sExt, sPasta: String;

  s, ss, sLinha, sNovaLinha, sCodProd: String;

  // Acerta ICMS de 17 para 18 % ////
  sAliqICMS: String;
  cVlr_ICMS, cTot_ICMS: Currency;
  bJaGravou, bReg490: Boolean;
  iTotRegC, iTotRegC490: Integer;
  ///////////////////////////////////

  // Acerta Serie do Documento Conforme Serie da Chave de Acesso ///////////////
  sChAcessoSerie: String;
  ///////////////////

  sRegAtual: String;
  bRegAlteraC170, bRegAlteraC190: Boolean;

  sCfopUltimoUtilizado, sNovoCFop: String;
  sCstICMS, sCstIPI, sCstPIS, sCstCofins, sInd_ST : String;
  iCST: Integer;
  sCFopNoEstado: String;

  sCodMunIBGE, sEndereco, sEnderecoNr, sEnderecoCompl, sBairro, sUFEmit: String;

  sTipoOper: String;

  // Linhas Excluidas
  b, bb: Boolean;
  iIndex, iIndexMenos, iRegSoma: integer;

  // Dados do Contabilista
  sContNome, sContCPF, sContCRC, sContCNPJ, sContCEP, sContEnd, sContNum,
  sContCompl, sContBairro, sContFone, sContFax, sContEMail, sContCod_Mun: String;

  // Exlclui Produtos
  i9900_H010: Integer;  // |9900|0200|????| Produto
  i9900_0200: Integer;  // |9900|0200|????| Produto
  i9900_0205: Integer;  // |9900|0205|????| Alteração de Produto

  i9900_0150: Integer;  // |9900|0150|????| Participantes
  i9900_0175: Integer;  // |9900|0175|????| Alteração de Participantes

  bExcluiu: Boolean;    // Se excluiu o produto/participante
  bC100: Boolean; // Se Registro Igual C100 - Verifica se Proximo é o C190 e Grava os Dois.

  // Acerta Totais ST (Serie=DES)
  bExcluiReg_DES: Boolean;

  iC990,          // |C990|34735|
  i9900_C100,     // |9900|C100|88|
  i9900_C170,     // |9900|C170|52|
  i9900_C140,     // |9900|C140|82|
  i9900_C141,     // |9900|C141|83|
  i9900_C190,     // |9900|C190|63|
  i9999: Integer; // |9999|46538|

  sNrNota: String;

  bSiga: Boolean;

  dDTEmissao, dDTEntSai: TDate;
begin
  EdtPastaArquivo.SetFocus;

  If msg('O Código da versão do leiaute'+cr+cr+'Esta CORRETA ??','C')=2 Then
  Begin
    EdtVersao.SetFocus;
    Exit;
  End;

  If Trim(EdtPastaArquivo.Text)='' Then
  Begin
    msg('Favor Informar a Pasta e Arquivo'+cr+'do SpedFiscal !!','A');
    Bt_CorrigeArquivo.Enabled:=False;
    Bt_BuscaArquivo.SetFocus;
    Exit;
  End;

  hHrInicio.Caption:=TimeToStr(DataHoraServidorFI(DM.SDS_DtaHoraServidor));
  hHrFim.Caption   :='00:00:00';
  hHrTotal.Caption :='00:00:00';

  // ClientDataSet Virtual de Participantes e Codigo Municipio IBGE ============
  DM.CDS_Pessoas.Open;
  DM.CDS_Pessoas.EmptyDataSet;

  // ClientDataSet Virtual de Produtos Participantes ===========================
  DM.CDS_Prod.Open;
  DM.CDS_Prod.EmptyDataSet;

  // ClientDataSet Virtual de Natureza da Operação =============================
  DM.CDS_NatOperacao.Open;
  DM.CDS_NatOperacao.EmptyDataSet;

  // ClientDataSet Virtual de Municipios IBGE ==================================
  DM.CDS_IBGE_UF.Open;
  DM.CDS_IBGE_UF.EmptyDataSet;
  For i:=1 to 28 do
  Begin
    If i=1  Then Begin s:='RO'; ss:='11'; End;
    If i=2  Then Begin s:='AC'; ss:='12'; End;
    If i=3  Then Begin s:='AM'; ss:='13'; End;
    If i=4  Then Begin s:='RR'; ss:='14'; End;
    If i=5  Then Begin s:='PA'; ss:='15'; End;
    If i=6  Then Begin s:='AP'; ss:='16'; End;
    If i=7  Then Begin s:='MA'; ss:='21'; End;
    If i=8  Then Begin s:='PI'; ss:='22'; End;
    If i=9  Then Begin s:='CE'; ss:='23'; End;
    If i=10 Then Begin s:='RN'; ss:='24'; End;
    If i=11 Then Begin s:='PB'; ss:='25'; End;
    If i=12 Then Begin s:='PE'; ss:='26'; End;
    If i=13 Then Begin s:='AL'; ss:='27'; End;
    If i=14 Then Begin s:='SE'; ss:='28'; End;
    If i=15 Then Begin s:='BA'; ss:='29'; End;
    If i=16 Then Begin s:='MG'; ss:='31'; End;
    If i=17 Then Begin s:='ES'; ss:='32'; End;
    If i=18 Then Begin s:='RJ'; ss:='33'; End;
    If i=19 Then Begin s:='SP'; ss:='35'; End;
    If i=20 Then Begin s:='PR'; ss:='41'; End;
    If i=21 Then Begin s:='SC'; ss:='42'; End;
    If i=22 Then Begin s:='TO'; ss:='52'; End;
    If i=23 Then Begin s:='RS'; ss:='43'; End;
    If i=24 Then Begin s:='MS'; ss:='50'; End;
    If i=25 Then Begin s:='MT'; ss:='51'; End;
    If i=26 Then Begin s:='GO'; ss:='52'; End;
    If i=27 Then Begin s:='DF'; ss:='53'; End;
    If i=28 Then Begin s:='EX'; ss:='99'; End;

    DM.CDS_IBGE_UF.Append;
    DM.CDS_IBGE_UFUF.AsString :=s;
    DM.CDS_IBGE_UFMUN.AsString:=ss;
    DM.CDS_IBGE_UF.Post;
  End;
  s :='';
  ss:='';

  // ClientDataSet Virtual de CFOP dos Produtos ================================
//  DM.CDS_CFopProd.Open;
//  DM.CDS_CFopProd.EmptyDataSet;

  // ClientDataSet Virtual de Registro C190 ====================================
  DM.CDS_C190.Open;
  DM.CDS_C190.EmptyDataSet;

  // ClientDataSet Virtual de Acerta ST (Serie=DES) ============================
  DM.CDS_ST.Open;
  DM.CDS_ST.EmptyDataSet;

  // ClientDataSet Virtual de Nota ST Errada ===================================
  DM.CDS_Nota_ST_Errada.Open;
  DM.CDS_Nota_ST_Errada.EmptyDataSet;

  // ClientDataSet Virtual de CFops para Acertar CFops Zerados =================
  DM.CDS_CFopZerados.Open;
  DM.CDS_CFopZerados.EmptyDataSet;

  // Saidas ====================================================================
  For i:=1 to 16 do
  Begin

    DM.CDS_CFopZerados.Insert;
    DM.CDS_CFopZeradosCOD_OPER.AsString:='1'; // (0=Entrada 1=Saida)
    DM.CDS_CFopZeradosCOD_NAT.AsString:='1';  // Natureza da Operação (VENDA)

    DM.CDS_CFopZeradosCST_IPI.AsString:='99';

    // CST_ICMS ======================
    If (i in [1..4]) then
    Begin
      DM.CDS_CFopZeradosCST_ICMS.AsString:='000';
    End; // If (Char(i) in ['1'..'4']) then

    If (i in [5..8]) then
    Begin
      DM.CDS_CFopZeradosCST_ICMS.AsString:='060';
    End; // If (Char(i) in ['5'..'8']) then

    If (i in [9..12]) then
    Begin
      DM.CDS_CFopZeradosCST_ICMS.AsString:='010';
    End; // If (Char(i) in ['9'..'12']) then

    If (i in [13..16]) then
    Begin
      DM.CDS_CFopZeradosCST_ICMS.AsString:='040';
    End; // If (Char(i) in ['13'..'16']) then

    // CST_PIS / CST_COFINS ==============
    If (i in [1..2]) then
     Begin
       DM.CDS_CFopZeradosCST_PIS.AsString:='01';
       DM.CDS_CFopZeradosCST_COFINS.AsString:='01';
     End
    Else
     Begin
       DM.CDS_CFopZeradosCST_PIS.AsString:='04';
       DM.CDS_CFopZeradosCST_COFINS.AsString:='04';
     End; // If (Char(i) in ['1'..'2']) then

    // CFOP / Operacao Estado / Subst. Tributaria =======
    If (i in [1,7,11,15]) then
    Begin
      DM.CDS_CFopZeradosCFOP.AsString:='5102';
      DM.CDS_CFopZeradosOPER_ESTADO.AsString:='SIM';
      DM.CDS_CFopZeradosIND_ST.AsString:='NAO';
    End; // If (Char(i) in ['1'..'2']) then

    If (i in [2,8,12,16]) then
    Begin
      DM.CDS_CFopZeradosCFOP.AsString:='6102';
      DM.CDS_CFopZeradosOPER_ESTADO.AsString:='NAO';
      DM.CDS_CFopZeradosIND_ST.AsString:='NAO';
    End; // If (Char(i) in ['2','8','12','16']) then

    If (i in [3,5,9,13]) then
    Begin
      DM.CDS_CFopZeradosCFOP.AsString:='5403';
      DM.CDS_CFopZeradosOPER_ESTADO.AsString:='SIM';
      DM.CDS_CFopZeradosIND_ST.AsString:='SIM';
    End; // If (Char(i) in ['2','8','12','16']) then

    If (i in [4,6,10,14]) then
    Begin
      DM.CDS_CFopZeradosCFOP.AsString:='6403';
      DM.CDS_CFopZeradosOPER_ESTADO.AsString:='NAO';
      DM.CDS_CFopZeradosIND_ST.AsString:='SIM';
    End; // If (Char(i) in ['2','8','12','16']) then

    DM.CDS_CFopZerados.Post
  End; // For i:=1 to 16 do

  // Devoluções ================================================================
  For i:=1 to 8 do
  Begin

    DM.CDS_CFopZerados.Insert;
    DM.CDS_CFopZeradosCOD_NAT.AsString:='2';  // Natureza da Operação (DEVOLUCAO)
    DM.CDS_CFopZeradosCST_IPI.AsString:='49';

    // CST_PIS / CST_COFINS ==============
    DM.CDS_CFopZeradosCST_PIS.AsString:='04';
    DM.CDS_CFopZeradosCST_COFINS.AsString:='04';

    // COD_OPER ======================
    If (i in [1..4]) then
    Begin
      DM.CDS_CFopZeradosCOD_OPER.AsString:='0'; // (0=Entrada 1=Saida)
    End; // If (Char(i) in ['1'..'4']) then

    If (i in [5..8]) then
    Begin
      DM.CDS_CFopZeradosCOD_OPER.AsString:='1'; // (0=Entrada 1=Saida)
    End; // If (Char(i) in ['1'..'4']) then

    // CST_ICMS ======================
    If (i in [1,2,5,6]) then
    Begin
      DM.CDS_CFopZeradosCST_ICMS.AsString:='060';
    End; // If (Char(i) in ['1'..'4']) then

    If (i in [3,4,7,8]) then
    Begin
      DM.CDS_CFopZeradosCST_ICMS.AsString:='000';
    End; // If (Char(i) in ['1'..'4']) then

    // CFOP / Operacao Estado / Subst. Tributaria =======
    If i=1 then DM.CDS_CFopZeradosCFOP.AsString:='1411';
    If i=2 then DM.CDS_CFopZeradosCFOP.AsString:='2411';
    If i=3 then DM.CDS_CFopZeradosCFOP.AsString:='1202';
    If i=4 then DM.CDS_CFopZeradosCFOP.AsString:='2202';
    If i=5 then DM.CDS_CFopZeradosCFOP.AsString:='5411';
    If i=6 then DM.CDS_CFopZeradosCFOP.AsString:='6411';
    If i=7 then DM.CDS_CFopZeradosCFOP.AsString:='5202';
    If i=8 then DM.CDS_CFopZeradosCFOP.AsString:='6202';

    If (i in [1,3,5,7]) then
      DM.CDS_CFopZeradosOPER_ESTADO.AsString:='SIM';

    If (i in [1,2,5,6]) then
      DM.CDS_CFopZeradosIND_ST.AsString:='SIM';

    If (i in [2,4,6,8]) then
      DM.CDS_CFopZeradosOPER_ESTADO.AsString:='NAO';

    If (i in [3,4,7,8]) then
      DM.CDS_CFopZeradosIND_ST.AsString:='NAO';

    DM.CDS_CFopZerados.Post
  End; // For i:=1 to 16 do

  // Busca CFops a Corrigir ====================================================
  If (FileExists(sgPastaExe+'EntradasCFopsAlterar.txt')) Then
  Begin
    Try
      tsArqCFops:=TStringList.Create;
      tsArqCFops.LoadFromFile(sgPastaExe+'EntradasCFopsAlterar.txt');

      SetLength(ArrayCFopCerto,tsArqCFops.Count);
      SetLength(ArrayCFopErrado,tsArqCFops.Count);

      For i:=0 to tsArqCFops.Count-1 do
      Begin
        sLinha:=tsArqCFops[i];
        ArrayCFopErrado[i]:=Trim(Separa_String(sLinha,1));
        ArrayCFopCerto[i] :=Trim(Separa_String(sLinha,2));
      End; // For i:=0 to tsArqCFops.Count-1 do
    Finally // Try
      { Libera a instancia da lista da memória }
      FreeAndNil(tsArqCFops);
    End; // Try
    FreeAndNil(tsArqCFops);
    
  End; // If (FileExists(sgPastaExe+'EntradasCFopsAlterar.txt')) Then

  //============================================================================
  // Busca Dados do Contabilista - INICIO ======================================
  //============================================================================
  If Not (FileExists(sgPastaExe+'Contabilista.txt')) Then
  Begin
    MessageDlg('Arquivo com dados do Contabilista NÃO foi Encontro !!'+cr+cr+
               'Entratar em contato com o ODIR !!', mtError, [mbOK], 0);
    Exit;
  End;

  Try
    // tsArqCFops Utilizado momentaneamente para pegar dados do contabilista
    tsArqCFops:=TStringList.Create;
    tsArqCFops.LoadFromFile(sgPastaExe+'Contabilista.txt');

    For i:=0 to tsArqCFops.Count-1 do
    Begin
      sLinha:=tsArqCFops[i];

      If i=0  Then sContNome   :=Trim(Separa_String(sLinha,2));
      If i=1  Then sContCPF    :=Trim(Separa_String(sLinha,2));
      If i=2  Then sContCRC    :=Trim(Separa_String(sLinha,2));
      If i=3  Then sContCNPJ   :=Trim(Separa_String(sLinha,2));
      If i=4  Then sContCEP    :=Trim(Separa_String(sLinha,2));
      If i=5  Then sContEnd    :=Trim(Separa_String(sLinha,2));
      If i=6  Then sContNum    :=Trim(Separa_String(sLinha,2));
      If i=7  Then sContCompl  :=Trim(Separa_String(sLinha,2));
      If i=8  Then sContBairro :=Trim(Separa_String(sLinha,2));
      If i=9  Then sContFone   :=Trim(Separa_String(sLinha,2));
      If i=10 Then sContFax    :=Trim(Separa_String(sLinha,2));
      If i=11 Then sContEMail  :=Trim(Separa_String(sLinha,2));
      If i=12 Then sContCod_Mun:=Trim(Separa_String(sLinha,2));
    End; // For i:=0 to tsArqCFops.Count-1 do

    sContFone:=Tira_Mascara(sContFone);
    sContFone:=StringReplace(sContFone,'(','',[rfReplaceAll]);
    sContFone:=StringReplace(sContFone,')','',[rfReplaceAll]);
    sContFone:=StringReplace(sContFone,'[','',[rfReplaceAll]);
    sContFone:=StringReplace(sContFone,']','',[rfReplaceAll]);

    If Length(sContFone)>11 Then
    Begin
      iii:=Length(sContFone)-10;
      sContFone:=Copy(sContFone,iii,Length(sContFone));
    End;

  Finally // Try
    { Libera a instancia da lista da memória }
    FreeAndNil(tsArqCFops);
  End; // Try
  FreeAndNil(tsArqCFops);

  //============================================================================
  // Busca Dados do Contabilista - FIM =========================================
  //============================================================================
  { Instancia a variável arquivo }
  tsArqICMS:=TStringList.Create;
  tsArquivo:=TStringList.Create;

  Try
   { Carrega o conteúdo do arquivo texto para a   memória }
    tsArqICMS.LoadFromFile(EdtPastaArquivo.Text);

    StBar.Panels[0].Text:='Empresa: '+Trim(Separa_String(tsArqICMS[0],7,'|'))+
                          '     CNPJ: '+Trim(Separa_String(tsArqICMS[0],8,'|'))+
                          '     do Período de : '+Copy(Trim(Separa_String(tsArqICMS[0],5,'|')),1,2)+'/'+
                                                  Copy(Trim(Separa_String(tsArqICMS[0],5,'|')),3,2)+'/'+
                                                  Copy(Trim(Separa_String(tsArqICMS[0],5,'|')),5,4)+' A '+
                                                  Copy(Trim(Separa_String(tsArqICMS[0],6,'|')),1,2)+'/'+
                                                  Copy(Trim(Separa_String(tsArqICMS[0],6,'|')),3,2)+'/'+
                                                  Copy(Trim(Separa_String(tsArqICMS[0],6,'|')),5,4);

    sgDtIni_Per:=Trim(Separa_String(tsArqICMS[0],5,'|'));
    sgDtFim_Per:=Trim(Separa_String(tsArqICMS[0],6,'|'));

    dgDtaI:=StrToDate(copy(sgDtIni_Per,1,2)+'/'+copy(sgDtIni_Per,3,2)+'/'+copy(sgDtIni_Per,5,4));
    dgDtaF:=StrToDate(copy(sgDtFim_Per,1,2)+'/'+copy(sgDtFim_Per,3,2)+'/'+copy(sgDtFim_Per,5,4));

// =============================================================================
// INICIO DO PROCESSAMENTO =====================================================
// =============================================================================

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    Pan_OBS.Caption:='AGUARDE !! Fase 01/09 - ICMS ERRADO 17%=>18%, SERIE = SERIE CHACESSO NF-e/NFC-e...';
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    Screen.Cursor:=crAppStart;

    Pan_OBS.Visible:=True;
    MontaProgressBar(True);
    bgParar:=False;

    pgProgBar.Properties.Max:=tsArqICMS.Count;
    pgProgBar.Position:=0;

    Pan_ST.Visible:=False;
    Pan_Diversos.Visible:=True;

    // Usado para Guarda Resulta do C490 =======================================
    DM.CDS_C190.EmptyDataSet;

    { Realiza um loop em toda a lista }
    cTot_ICMS:=0;
    iTotRegC:=0;
    iTotRegC490:=0;
    i9900_0200 :=0; // Cadastro   - Retirar Itens de Serviço
    i9900_H010 :=0; // Inventário - Retirar Itens de Serviço

    For i:=0 to tsArqICMS.Count-1 do
    Begin
      Application.ProcessMessages;
      pgProgBar.Position:=i+1;

      bJaGravou:=False;

      If bgParar Then
      Begin
        Break;
      End;

      sLinha:=tsArqICMS[i];

      sRegAtual:=Trim(Separa_String(sLinha,2,'|'));

      If (Copy(sRegAtual,1,1)='C') And (sRegAtual<>'C490') Then
       Inc(iTotRegC);

      // Acerta Registro C420 ==================================================
      //  REGISTRO DOS TOTALIZADORES PARCIAIS DA REDUÇÃO Z =====================
      If sRegAtual='C420' Then
      Begin
        // Se Aliquota ICMS = 17 Altera para 18
        If Pos('T1700', Trim(Separa_String(sLinha,3,'|')))<>0 Then
        Begin
          sNovaLinha:='';
          For ii:=2 to 6 do
          Begin
            If ii=3 Then
             Begin
               sNovaLinha:=sNovaLinha+'|'+StringReplace(Trim(Separa_String(sLinha,ii,'|')), 'T1700', 'T1800', [rfReplaceAll]);
             End
            Else
             Begin
               sNovaLinha:=sNovaLinha+'|'+Trim(Separa_String(sLinha,ii,'|'));
             End; // If ii=3 Then
          End; // For ii:=2 to 6 do

          sLinha:=sNovaLinha+'|';
          tsArqICMS[i]:=sLinha;
          sNovaLinha:='';
        End; // If Pos('T1700', Trim(Separa_String(sLinha,3,'|')))<>0 Then
      End; // If sRegAtual='C420' Then
      //========================================================================

      // Acerta Serie do Documento (Se Serie Diferente da Serie da Chave de Acesso)
      // NOTA FISCAL (CÓDIGO 01), NOTA FISCAL AVULSA (CÓDIGO 1B), NOTA FISCAL DE PRODUTOR (CÓDIGO 04) E NF-e (CÓDIGO 55)
      If sRegAtual='C100' Then
      Begin
        // Se Chave de Acesso Existir
        If Trim(Separa_String(sLinha,10,'|'))<>'' Then
        Begin
          sChAcessoSerie:=Copy(Trim(Separa_String(sLinha,10,'|')),23,3);
          sNovaLinha:='';

          // Se Serie Diferente da Serie da Chave de Acesso
          If ZerosEsquerda(Trim(Separa_String(sLinha,8,'|')),3)<>sChAcessoSerie Then
          Begin
            For ii:=2 to 30 do
            Begin
              If ii=8 Then
               Begin
                 sNovaLinha:=sNovaLinha+'|'+sChAcessoSerie;
               End
              Else
               Begin
                 sNovaLinha:=sNovaLinha+'|'+Trim(Separa_String(sLinha,ii,'|'));
               End; // If ii=8 Then
            End; // For ii:=2 to 29 do

            sLinha:=sNovaLinha+'|';
            tsArqICMS[i]:=sLinha;
            sNovaLinha:='';
          End; // If ZerosEsquerda(Trim(Separa_String(sLinha,8,'|')),3)<>sChAcessoSerie Then
        End; // If Trim(Separa_String(sLinha,10,'|'))<>'' Then
      End; // If sRegAtual='C100' Then

      // Verifica ICMS 17% e Muda para 18% =====================================
      If (dgDtaI>StrToDate('31/12/2015')) and (dgDtaF<StrToDate('01/04/2016')) Then
       Begin
         If sRegAtual='C470' Then
         Begin
           bReg490:=False;

           sAliqICMS:='0,00';
           If StrToFloatDef(Trim(Separa_String(sLinha,10,'|')),0.00)=0.00 Then // 10 - Aliq_ICMS
            Begin
              cVlr_ICMS:=0;
            End
           Else If StrToFloat(Trim(Separa_String(sLinha,10,'|')))=17.00 Then
            Begin
              cVlr_ICMS:=SimpleRoundTo(((StrToCurr(Trim(Separa_String(sLinha,7,'|')))*18)/100),-2); // 7 - Vlr_Item
              sAliqICMS:='18,00';
            End
           Else
            Begin
              cVlr_ICMS:=RoundTo(((StrToCurr(Trim(Separa_String(sLinha,7,'|')))*StrToCurr(Trim(Separa_String(sLinha,10,'|'))))/100),-2);
              sAliqICMS:=Trim(Separa_String(sLinha,10,'|'));
            End;

           // Gaurda Total de ICMS =============================================
           cTot_ICMS:=cTot_ICMS+cVlr_ICMS;

           // Insere Novo Registo C470 =========================================
           bJaGravou:=True;
           tsArquivo.Add('|'+Trim(Separa_String(sLinha, 2,'|'))+'|'+ // Reg
                             Trim(Separa_String(sLinha, 3,'|'))+'|'+ // Cod_Item
                             Trim(Separa_String(sLinha, 4,'|'))+'|'+ // Qtd
                             Trim(Separa_String(sLinha, 5,'|'))+'|'+ // Qtd_Canc
                             Trim(Separa_String(sLinha, 6,'|'))+'|'+ // Unid
                             Trim(Separa_String(sLinha, 7,'|'))+'|'+ // Vlr_Item
                             Trim(Separa_String(sLinha, 8,'|'))+'|'+ // Cst_ICMS
                             Trim(Separa_String(sLinha, 9,'|'))+'|'+ // CFOP
                             sAliqICMS+'|'+                          // Aliq_ICMS
                             Trim(Separa_String(sLinha,11,'|'))+'|'+ // Vlr_PIS
                             Trim(Separa_String(sLinha,12,'|'))+'|'); // Vlr_COFINS

           If not DM.CDS_C190.Locate('CST_ICMS;CFOP;ALIQ_ICMS',VarArrayOf(
                 [Trim(Separa_String(sLinha, 8,'|')),Trim(Separa_String(sLinha, 9,'|')),sAliqICMS]),[]) Then
            Begin
              DM.CDS_C190.Append;
              DM.CDS_C190CST_ICMS.AsString     :=Trim(Separa_String(sLinha,8,'|'));
              DM.CDS_C190CFOP.AsString         :=Trim(Separa_String(sLinha,9,'|'));
              DM.CDS_C190ALIQ_ICMS.AsFloat     :=StrToFloat(sAliqICMS);
              DM.CDS_C190VL_OPR.AsFloat        :=StrToFloat(Trim(Separa_String(sLinha,7,'|')));
              DM.CDS_C190VL_BC_ICMS.AsFloat    :=StrToFloat(Trim(Separa_String(sLinha,7,'|')));
              DM.CDS_C190VL_ICMS.AsFloat       :=cVlr_ICMS;

              DM.CDS_C190VL_ICMS_ST.AsFloat:=0;
              DM.CDS_C190VL_RED_BC.AsFloat:=0;
              DM.CDS_C190VL_IPI.AsFloat:=0;
            End
           Else // If not DM.CDS_C190.Locate('CST_ICMS;CFOP;ALIQ_ICMS',VarArrayOf(
            Begin
              DM.CDS_C190.Edit;
              DM.CDS_C190VL_OPR.AsFloat       :=DM.CDS_C190VL_OPR.AsFloat+StrToFloat(Trim(Separa_String(sLinha,7,'|')));
              DM.CDS_C190VL_BC_ICMS.AsFloat   :=DM.CDS_C190VL_BC_ICMS.AsFloat+StrToFloat(Trim(Separa_String(sLinha,7,'|')));
              DM.CDS_C190VL_ICMS.AsFloat      :=DM.CDS_C190VL_ICMS.AsFloat+cVlr_ICMS;
            End; // If not DM.CDS_C190.Locate('CST_ICMS;CFOP;ALIQ_ICMS',VarArrayOf(
           DM.CDS_C190.Post;

         End; // If sRegAtual='C470' Then

         If (sRegAtual='C490') and (Not bReg490) Then
         Begin
           bReg490:=True;

           If Not DM.CDS_C190.IsEmpty Then
           Begin
             DM.CDS_C190.First;
             While Not DM.CDS_C190.Eof do
             Begin
               Inc(iTotRegC);
               Inc(iTotRegC490);

               bJaGravou:=True;

               tsArquivo.Add('|C490|'+DM.CDS_C190CST_ICMS.AsString+'|'+DM.CDS_C190CFOP.AsString+'|'+
                                      ZerosCentavos(DM.CDS_C190ALIQ_ICMS.AsString,2)+'|'+
                                      ZerosCentavos(DM.CDS_C190VL_OPR.AsString,2)+'|'+
                                      ZerosCentavos(DM.CDS_C190VL_BC_ICMS.AsString,2)+'|'+
                                      ZerosCentavos(DM.CDS_C190VL_ICMS.AsString,2)+'||');

               DM.CDS_C190.Next;
             End; // While Not DM.CDS_C190.Eof do

             DM.CDS_C190.EmptyDataSet;
           End; // If Not DM.CDS_C190.IsEmpty Then
         End; // If (sRegAtual='C490') and (Not bReg490) Then

          // Atualiza registro E110 - Apuração do ICMS - Operações Próprias
          If (sRegAtual='E110') Then
          Begin
            bJaGravou:=True;

            tsArquivo.Add('|E110|'+ // REG
                          CurrToStr(cTot_ICMS)+'|'+ // VL_TOT_DEBITOS
                          Trim(Separa_String(sLinha, 4,'|'))+'|'+ // VL_AJ_DEBITOS
                          Trim(Separa_String(sLinha, 5,'|'))+'|'+ // VL_TOT_AJ_DEBITOS
                          Trim(Separa_String(sLinha, 6,'|'))+'|'+ // VL_ESTORNOS_CRED
                          Trim(Separa_String(sLinha, 7,'|'))+'|'+ // VL_TOT_CREDITOS
                          Trim(Separa_String(sLinha, 8,'|'))+'|'+ // VL_AJ_CREDITOS
                          Trim(Separa_String(sLinha, 9,'|'))+'|'+ // VL_TOT_AJ_CREDITOS
                          Trim(Separa_String(sLinha,10,'|'))+'|'+ // VL_ESTORNOS_DEB
                          Trim(Separa_String(sLinha,11,'|'))+'|'+ // VL_SLD_CREDOR_ANT
                          CurrToStr(cTot_ICMS-StrToFloat(Trim(Separa_String(sLinha,7,'|'))))+'|'+ // VL_SLD_APURADO
                          Trim(Separa_String(sLinha,13,'|'))+'|'+ // VL_TOT_DED
                          CurrToStr(cTot_ICMS-StrToFloat(Trim(Separa_String(sLinha,7,'|'))))+'|'+ // VL_ICMS_RECOLHER
                          Trim(Separa_String(sLinha,15,'|'))+'|'+ // VL_SLD_CREDOR_TRANSPORTAR
                          Trim(Separa_String(sLinha,16,'|'))+'|'); // DEB_ESP
          End; // If (sRegAtual='E110') Then

          // Total de Linhas no Registro C490 => |9900|C490|106|
          If (sRegAtual='9900') And (Trim(Separa_String(sLinha,3,'|'))='C490') Then
          Begin
            bJaGravou:=True;
            tsArquivo.Add('|9900|C490|'+IntToStr(iTotRegC490)+'|');
          End;

          // Total de Linhas no Registros C => |C990|24971|
          If (sRegAtual='C990') Then
          Begin
            bJaGravou:=True;
            tsArquivo.Add('|C990|'+IntToStr(iTotRegC)+'|');
          End;

          // Total de Linhas no Arquivo |9999|29275|
          If (sRegAtual='9999') Then
          Begin
            bJaGravou:=True;
            tsArquivo.Add('|9999|'+IntToStr(tsArquivo.Count+1)+'|');
          End;

          If (Not bJaGravou) And (sRegAtual<>'C490') Then
           tsArquivo.Add(tsArqICMS[i]);
       End
      Else // If (dgDtaI>StrToDate('31/12/2015')) and (dgDtaF<StrToDate('01/04/2016')) Then
       Begin
         tsArquivo.Add(tsArqICMS[i]);
       End; // If (dgDtaI>StrToDate('31/12/2015')) and (dgDtaF<StrToDate('01/04/2016')) Then
    End; // For i:=0 to tsArquICMS.Count-1 do
    DM.CDS_C190.EmptyDataSet;

    iTotRegC   :=0;
    iTotRegC490:=0;
    iRegSoma   :=0;

    MontaProgressBar(False);
    Screen.Cursor:=crDefault;
    //==========================================================================
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//    Pan_OBS.Caption:='AGUARDE !! Fase 01/09 - ICMS ERRADO 17%=>18%, SERIE = SERIE CHACESSO...';
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    Pan_OBS.Caption:='AGUARDE !! Fase 02/09 - LOCALIZANDO ITENS NÃO FISCAIS (SERVIÇO...)';
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    Screen.Cursor:=crAppStart;

    Pan_OBS.Visible:=True;
    MontaProgressBar(True);
    bgParar:=False;

    pgProgBar.Properties.Max:=tsArquivo.Count;
    pgProgBar.Position:=0;

    FreeAndNil(tsArqICMS);
    tsArqICMS:=TStringList.Create;

    MySql:=' SELECT p.CodProduto Codigo'+
           ' FROM produto p'+
           ' WHERE p.principalfor IN (''000300'', ''000500'', ''000883'', ''010000'', ''001072'')'+
           ' ORDER BY p.codproduto';
    DM.CDS_Busca.Close;
    DM.SDS_Busca.CommandText:=MySql;
    DM.CDS_Busca.Open;
    DM.CDS_Prod.Data:=DM.CDS_Busca.Data;
    DM.CDS_Busca.Close;
    DM.CDS_Prod.First;

    // Guarda Somente Produtos Com Movimento
    For i:=0 to tsArquivo.Count-1 do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=i+1;

      sLinha:=tsArquivo[i];
      sRegAtual:=Trim(Separa_String(sLinha,2,'|'));

      //========================================================================
      // Exclui Produtos Existentes - INICIO ------------------------
      //========================================================================
      If (sRegAtual='C321') Or (sRegAtual='C425') Or (sRegAtual='C470') Or
         (sRegAtual='1300') Or (sRegAtual='1400') Then
      Begin
        If DM.CDS_Prod.Locate('CODIGO',Trim(Separa_String(sLinha,3,'|')),[]) Then
        Begin
          DM.CDS_Prod.Delete;
        End;
      End; // If (sRegAtual='C321') Or (sRegAtual='C425') Or (sRegAtual='C470') Or

      If (sRegAtual='C170') or (sRegAtual='C370') or (sRegAtual='C495') or
         (sRegAtual='C510') or (sRegAtual='C610') or (sRegAtual='D110') or (sRegAtual='D510') or
         (sRegAtual='D610') or (sRegAtual='G140') or (sRegAtual='1370') or (sRegAtual='1510') Then
      Begin
        If DM.CDS_Prod.Locate('CODIGO',Trim(Separa_String(sLinha,4,'|')),[]) Then
        Begin
          DM.CDS_Prod.Delete;
        End;
      End; // If (sRegAtual='C170') or (sRegAtual='C370') or (sRegAtual='C495') or (sRegAtual='C510') or

      If (sRegAtual='D197') or (sRegAtual='C197') Then
      Begin
        If DM.CDS_Prod.Locate('CODIGO',Trim(Separa_String(sLinha,5,'|')),[]) Then
        Begin
          DM.CDS_Prod.Delete;
        End;
      End; // If (sRegAtual='D197') or (sRegAtual='C197') Then

      If sRegAtual='1105' Then
      Begin
        If DM.CDS_Prod.Locate('CODIGO',Trim(Separa_String(sLinha,8,'|')),[]) Then
        Begin
          DM.CDS_Prod.Delete;
        End;
      End; // If sRegAtual='1105' Then

      // Exclui Produtos Existentes ---------------------------------
      If (sRegAtual='E113') or (sRegAtual='E240') or (sRegAtual='1923') Then
      Begin
        If DM.CDS_Prod.Locate('CODIGO',Trim(Separa_String(sLinha,9,'|')),[]) Then
        Begin
          DM.CDS_Prod.Delete;
        End;
      End; // If sRegAtual='E113' Then
      //========================================================================
      // Exclui Podutos Existentes - FIM
      //========================================================================

      tsArqICMS.Add(tsArquivo[i]);
    End;
    MontaProgressBar(False);
    Screen.Cursor:=crDefault;
    //==========================================================================
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//    Pan_OBS.Caption:='AGUARDE !! Fase 02/09 - LOCALIZANDO ITENS NÃO FISCAIS (SERVIÇO...)';
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    Pan_OBS.Caption:='AGUARDE !! Fase 03/09 - RETIRA ITENS NÃO FISCAIS (SERVIÇO...)';
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    FreeAndNil(tsArquivo);
    tsArquivo:=TStringList.Create;

    MontaProgressBar(True);
    pgProgBar.Properties.Max:=tsArqICMS.Count;
    pgProgBar.Position:=0;

    Pan_ST.Visible:=False;
    Pan_Diversos.Visible:=True;

    i9900_H010 :=0;
    i9900_0200 :=0;

    { Realiza um loop em toda a lista }
    For i:=0 to tsArqICMS.Count-1 do
    Begin
      Application.ProcessMessages;
      pgProgBar.Position:=i+1;

      //Odir
      If bgParar Then
      Begin
        Break;
      End;

      sLinha:=tsArqICMS[i];

      sRegAtual:=Trim(Separa_String(sLinha,2,'|'));

      If (sRegAtual='0200') Then // Retira Cadastro de Itens de Serviço
       Begin
         If DM.CDS_Prod.Locate('CODIGO',Trim(Separa_String(sLinha,3,'|')),[]) Then
          Inc(i9900_0200)
         Else
          tsArquivo.Add(tsArqICMS[i]);
       End

      Else If (sRegAtual='H010') Then // Retira de Itens de Serviço do Inventário
       Begin
         If DM.CDS_Prod.Locate('CODIGO',Trim(Separa_String(sLinha,3,'|')),[]) Then
          Inc(i9900_H010)
         Else
          tsArquivo.Add(tsArqICMS[i]);
       End

      Else If (sRegAtual='0990') Then // Total de Linhas no Registros 0000
       Begin
         iTotal:=StrToInt(Trim(Separa_String(sLinha,3,'|')))-i9900_0200;
         tsArquivo.Add('|0990|'+IntToStr(iTotal)+'|');
       End

      Else If (sRegAtual='9900') And (Trim(Separa_String(sLinha,3,'|'))='0200') Then // Total de Linhas no Registro 0200
       Begin
         iTotal:=StrToInt(Trim(Separa_String(sLinha,4,'|')))-i9900_0200;
         tsArquivo.Add('|9900|0200|'+IntToStr(iTotal)+'|');
       End

      Else If (sRegAtual='H990') Then // Total de Linhas no Registros H000
       Begin
         iTotal:=StrToInt(Trim(Separa_String(sLinha,3,'|')))-i9900_H010;
         tsArquivo.Add('|H990|'+IntToStr(iTotal)+'|');
       End

      Else If (sRegAtual='9900') And (Trim(Separa_String(sLinha,3,'|'))='H010') Then // Total de Linhas no Registro H010
       Begin
         iTotal:=StrToInt(Trim(Separa_String(sLinha,4,'|')))-i9900_H010;
         tsArquivo.Add('|9900|H010|'+IntToStr(iTotal)+'|');
       End

      Else If (sRegAtual='9999') Then // Total de Linhas no Arquivo |9999|29275|
       Begin
         iTotal:=StrToInt(Trim(Separa_String(sLinha,3,'|')))-i9900_H010-i9900_0200;
         tsArquivo.Add('|9999|'+IntToStr(iTotal)+'|');
       End

      Else
       Begin
         tsArquivo.Add(tsArqICMS[i]);
       End; // If (sRegAtual='0200') Then

    End; // For i:=0 to tsArqICMS.Count-1 do
    i9900_H010 :=0;
    i9900_0200 :=0;

    Screen.Cursor:=crDefault;
    MontaProgressBar(False);
    //==========================================================================
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//    Pan_OBS.Caption:='AGUARDE !! Fase 03/09 - RETIRA ITENS NÃO FISCAIS (SERVIÇO...)';
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    Pan_OBS.Caption:='AGUARDE !! Fase 04/09 - DADOS PRODUTOS/PARTCIPANTES, CFOP, DATA DE ENTRADA E SAIDA...';
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    Screen.Cursor:=crAppStart;

    // ClientDataSet Virtual de Produtos Participantes ===========================
    DM.CDS_Prod.Open;
    DM.CDS_Prod.EmptyDataSet;

    Pan_OBS.Visible:=True;
    MontaProgressBar(True);
    bgParar:=False;

    pgProgBar.Properties.Max:=tsArquivo.Count;
    pgProgBar.Position:=0;

    Pan_ST.Visible:=False;
    Pan_Diversos.Visible:=True;

    { Realiza um loop em toda a lista }
    For i:=0 to tsArquivo.Count-1 do
    Begin
      Application.ProcessMessages;
      pgProgBar.Position:=i+1;


      //Odir
//      Label1.Caption:=IntToStr(i+1);
//      If Label1.Caption='6133' Then
//       OdirTxt:='';

      If bgParar Then
      Begin
        Break;
      End;

      sLinha:=tsArquivo[i];

      sRegAtual:=Trim(Separa_String(sLinha,2,'|'));
//      Label1.Caption:=Label1.Caption+' - '+sRegAtual;

      //========================================================================
      // REGISTRO 0000: ABERTURA DO ARQUIVO DIGITAL E IDENTIFICAÇÃO DA ENTIDADE - INICIO
      //========================================================================
      If sRegAtual='0000' Then
      Begin
        // Guarda UF e Codigo do Municipio do Emitente --------------
        sUFEmit:=Trim(Separa_String(sLinha,10,'|'));
        sCodMunIBGE:=Trim(Separa_String(sLinha,12,'|'));

        // Altera Perfil = A ----------------------------------------
        For ii:=2 to 16 do
        Begin
          If ii=15 Then
           Begin
             sNovaLinha:=sNovaLinha+'|A';
           End
          Else If (ii=3) And (EdtVersao.Value<>0) Then
           Begin
             sNovaLinha:=sNovaLinha+'|'+ZerosEsquerda(VarToStr(EdtVersao.Value),3);
           End

          Else
           Begin
             sNovaLinha:=sNovaLinha+'|'+Trim(Separa_String(sLinha,ii,'|'));
           End;
        End; // For ii:=2 to 14 do

        tsArquivo[i]:=sNovaLinha+'|';
        sNovaLinha:='';
        sLinha:=tsArquivo[i];
      End; // If sRegAtual='0000' Then
      //========================================================================
      // REGISTRO 0000: ABERTURA DO ARQUIVO DIGITAL E IDENTIFICAÇÃO DA ENTIDADE - FIM
      //========================================================================

      //========================================================================
      // REGISTRO 0005: DADOS COMPLEMENTARES DA ENTIDADE - INICIO
      //========================================================================
      If sRegAtual='0005' Then
      Begin
        // Guarda Dados da Entidade ---------------------------------
        sEndereco:=Trim(Separa_String(sLinha,5,'|'));
        sEnderecoNr:=Trim(Separa_String(sLinha,6,'|'));
        sEnderecoCompl:=Trim(Separa_String(sLinha,7,'|'));
        sBairro:=Trim(Separa_String(sLinha,8,'|'));

        // Acerta Telefone ------------------------------------------
        For ii:=2 to 11 do
        Begin
          If ii=9 Then
           Begin
             s:=Trim(Separa_String(sLinha,ii,'|'));
             s:=Tira_Mascara(s);
             s:=StringReplace(s,'(','',[rfReplaceAll]);
             s:=StringReplace(s,')','',[rfReplaceAll]);
             s:=StringReplace(s,'[','',[rfReplaceAll]);
             s:=StringReplace(s,']','',[rfReplaceAll]);

             If Length(s)>11 Then
             Begin
               iii:=Length(s)-10;
               s:=Copy(s,iii,Length(s));
             End;

             sNovaLinha:=sNovaLinha+'|'+s;
           End
          Else
           Begin
             sNovaLinha:=sNovaLinha+'|'+Trim(Separa_String(sLinha,ii,'|'));
           End;
        End; // For ii:=2 to 14 do

        tsArquivo[i]:=sNovaLinha+'|';
        sNovaLinha:='';
        sLinha:=tsArquivo[i];
      End; // If sRegAtual='0005' Then
      //========================================================================
      // REGISTRO 0005: DADOS COMPLEMENTARES DA ENTIDADE - FIM
      //========================================================================

      //========================================================================
      // REGISTRO 0100: DADOS DO CONTABILISTA - INICIO
      //========================================================================
      If sRegAtual='0100' Then
      Begin
        // Acerta Dados do Contabilista -----------------------------
        sNovaLinha:='|0100|'+sContNome+'|'+sContCPF+'|'+sContCRC+'|'+sContCNPJ+'|'+
                             sContCEP+'|'+sContEnd+'|'+sContNum+'|'+sContCompl+'|'+
                             sContBairro+'|'+sContFone+'|'+sContFax+'|'+sContEMail+'|'+
                             sContCod_Mun;

         tsArquivo[i]:=sNovaLinha+'|';
         sNovaLinha:='';

         sLinha:=tsArquivo[i];
      End; // If sRegAtual='0100' Then
      //========================================================================
      // REGISTRO 0100: DADOS DO CONTABILISTA - FIM
      //========================================================================

      //========================================================================
      // REGISTRO 0150: TABELA DE CADASTRO DO PARTICIPANTE - INICIO
      //========================================================================
      If sRegAtual='0150' Then
      Begin
        // Acerta Nome Vazio ----------------------------------------
        If (Trim(Separa_String(sLinha,4,'|'))='') Then
        Begin
          // Por CPF --------------------------------
          If Trim(Separa_String(sLinha,7,'|'))<>'' Then
           sNomePart:=Trim(Separa_String(sLinha,7,'|'));

          // Por CNPJ --------------------------------
          If Trim(Separa_String(sLinha,6,'|'))<>'' Then
           sNomePart:=Trim(Separa_String(sLinha,6,'|'));

          // Busca Nome em MPMS ----------------------
          MySql:=' SELECT f.nomefornecedor, f.razaosocial'+
                 ' FROM FORNECED f'+
                 ' WHERE f.numerocgcmf='+QuotedStr(sNomePart);
          DM.CDS_Busca.Close;
          DM.SDS_Busca.CommandText:=MySql;
          DM.CDS_Busca.Open;

          Application.ProcessMessages;

          sNomePart:='';
          If Trim(DM.CDS_Busca.FieldByName('razaosocial').AsString)<>'' Then
           sNomePart:=Trim(DM.CDS_Busca.FieldByName('razaosocial').AsString);

          If Trim(DM.CDS_Busca.FieldByName('nomefornecedor').AsString)<>'' Then
           sNomePart:=Trim(DM.CDS_Busca.FieldByName('nomefornecedor').AsString);

          If Trim(sNomePart)<>'' Then
          Begin
            For ii:=2 to 14 do
            Begin
              If ii=4 Then
               Begin
                 sNovaLinha:=sNovaLinha+'|'+sNomePart;
               End
              Else
               Begin
                 sNovaLinha:=sNovaLinha+'|'+Trim(Separa_String(sLinha,ii,'|'));
               End; // If ii=4 Then
            End; // For ii:=2 to 14 do

            tsArquivo[i]:=sNovaLinha+'|';
            sNovaLinha:='';

            sLinha:=tsArquivo[i];
          End;
        End; // If (Trim(Separa_String(sLinha,4,'|'))='') Then

        // Acerta Consumidor Final ----------------------------------
        If (Trim(Separa_String(sLinha,4,'|'))='CONSUMIDOR FINAL') Then
        Begin
          For ii:=2 to 14 do
          Begin
            If (ii=5) And (StrToIntDef(Trim(Separa_String(sLinha,5,'|')),0)=0) Then
             Begin
               sNovaLinha:=sNovaLinha+'|'+'1058';
             End
//            Else If (ii=6) And (StrToIntDef(Trim(Separa_String(sLinha,6,'|')),0)=0) and (StrToIntDef(Trim(Separa_String(sLinha,7,'|')),0)=0) Then
//             Begin
//               sNovaLinha:=sNovaLinha+'|'+'11111111000191'
//             End
            Else If (ii=9) And (StrToIntDef(Trim(Separa_String(sLinha,9,'|')),0)=0) Then
             Begin
               sNovaLinha:=sNovaLinha+'|'+sCodMunIBGE;
             End
            Else If (ii=11) And (StrToIntDef(Trim(Separa_String(sLinha,11,'|')),0)=0) Then
             Begin
               sNovaLinha:=sNovaLinha+'|'+sEndereco;
             End
            Else If (ii=12) And (StrToIntDef(Trim(Separa_String(sLinha,12,'|')),0)=0) Then
             Begin
               sNovaLinha:=sNovaLinha+'|'+sEnderecoNr;
             End
            Else If (ii=13) And (StrToIntDef(Trim(Separa_String(sLinha,13,'|')),0)=0) Then
             Begin
               sNovaLinha:=sNovaLinha+'|'+sEnderecoCompl;
             End
            Else If (ii=14) And (StrToIntDef(Trim(Separa_String(sLinha,14,'|')),0)=0) Then
             Begin
               sNovaLinha:=sNovaLinha+'|'+sBairro;
             End
            Else
             Begin
               sNovaLinha:=sNovaLinha+'|'+Trim(Separa_String(sLinha,ii,'|'));
             End;
          End; // For ii:=2 to 14 do

          tsArquivo[i]:=sNovaLinha+'|';
          sNovaLinha:='';

          sLinha:=tsArquivo[i];
        End; // If Trim(Separa_String(sLinha,4,'|'))='CONSUMIDOR FINAL' Then

        // Salva Codigo IBGE do Participante ------------------------
        DM.CDS_Pessoas.Append;
        DM.CDS_PessoasCODIGO.AsString:=Trim(Separa_String(sLinha,3,'|'));

        If (StrToIntDef(Trim(Separa_String(sLinha,9,'|')),0)=0) Then
         DM.CDS_PessoasCODIGO_IBGE.AsString:=sCodMunIBGE
        Else
         DM.CDS_PessoasCODIGO_IBGE.AsString:=Trim(Separa_String(sLinha,9,'|'));

        DM.CDS_PessoasMOVTO.AsString:='N';
        DM.CDS_PessoasINDEX.AsInteger:=0;
        DM.CDS_Pessoas.Post;
      End; // If sRegAtual='0150' Then
      //========================================================================
      // REGISTRO 0150: TABELA DE CADASTRO DO PARTICIPANTE - FIM
      //========================================================================

      //========================================================================
      // REGISTRO 0200: TABELA DE IDENTIFICAÇÃO DO ITEM (PRODUTO E SERVIÇOS) - INICIO
      //
      // Guarda Codigo dos Produtos Participantes
      //========================================================================
      If sRegAtual='0200' Then
      Begin
        DM.CDS_Prod.Append;
        DM.CDS_ProdCODIGO.AsString:=Trim(Separa_String(sLinha,3,'|'));
        DM.CDS_Prod.Post;
      End; // If sRegAtual='0200' Then
      //========================================================================
      // REGISTRO 0200: TABELA DE IDENTIFICAÇÃO DO ITEM (PRODUTO E SERVIÇOS) - FIM
      //
      // Guarda Codigo dos Produtos Participantes
      //========================================================================

      //========================================================================
      // REGISTRO 0400: TABELA DE NATUREZA DA OPERAÇÃO/PRESTAÇÃO - INICIO
      //========================================================================
      If sRegAtual='0400' Then
      Begin
        // Guarde Codigos da Natureza da Operação -------------------
        DM.CDS_NatOperacao.Append;
        DM.CDS_NatOperacaoCOD_NATOPERACAO.AsString:=Trim(Separa_String(sLinha,3,'|'));
        DM.CDS_NatOperacaoDES_NATOPERACAO.AsString:=Trim(Separa_String(sLinha,4,'|'));
        DM.CDS_NatOperacao.Post;
      End; // If sRegAtual='0400' Then
      //========================================================================
      // REGISTRO 0400: TABELA DE NATUREZA DA OPERAÇÃO/PRESTAÇÃO - FIM
      //========================================================================

      //========================================================================
      // REGISTRO C460: DOCUMENTO FISCAL EMITIDO POR ECF - INICIO
      //========================================================================
      // Acerta CPF_CNPJ='00000000000000' para ''
      If sRegAtual='C460' Then
      Begin
        // Acerta CPF ou CNPJ Zerados -------------------------------
        If Trim(Separa_String(sLinha,10,'|'))='00000000000000' Then
        Begin
          For ii:=2 to 11 do
          Begin
            If ii=10 Then
             Begin
               sNovaLinha:=sNovaLinha+'|'
             End
            Else
             Begin
               sNovaLinha:=sNovaLinha+'|'+Trim(Separa_String(sLinha,ii,'|'));
             End;
          End; // For ii:=2 to 14 do

          tsArquivo[i]:=sNovaLinha+'|';
          sNovaLinha:='';
          sLinha:=tsArquivo[i];
        End; // If StrToIntDef(Trim(Separa_String(sLinha,10,'|')),0)=0 Then
      End; // If sRegAtual='C460' Then
      //========================================================================
      // REGISTRO C460: DOCUMENTO FISCAL EMITIDO POR ECF - FIM
      //========================================================================

      //========================================================================
      // Acerta CFOP - INICIO ==================================================
      //========================================================================

      //========================================================================
      // REGISTRO C100: NOTA FISCAL (CÓDIGO 01), NOTA FISCAL AVULSA (CÓDIGO 1B),
      //                NOTA FISCAL DE PRODUTOR (CÓDIGO 04) E NF-e (CÓDIGO 55). - INICIO
      //========================================================================
      If sRegAtual='C100' Then
      Begin
        sCfopUltimoUtilizado:='';

        // Indicador do tipo de operação: 0- Entrada 1- Saída
        sTipoOper:=Trim(Separa_String(sLinha,3,'|'));

        // Acerta DT_E_S Menor que DT_DOC -----------------------------
        If Trim(Separa_String(sLinha,11,'|'))<>'' Then
        Begin
          dDTEmissao:=StrToDate(Copy(Trim(Separa_String(sLinha,11,'|')),1,2)+'/'+Copy(Trim(Separa_String(sLinha,11,'|')),3,2)+'/'+Copy(Trim(Separa_String(sLinha,11,'|')),5,4));
          dDTEntSai:=dDTEmissao+1; // Caso Data de Entrada/Saida em Branco

          If Trim(Separa_String(sLinha,12,'|'))<>'' Then
           dDTEntSai :=StrToDate(Copy(Trim(Separa_String(sLinha,12,'|')),1,2)+'/'+Copy(Trim(Separa_String(sLinha,12,'|')),3,2)+'/'+Copy(Trim(Separa_String(sLinha,12,'|')),5,4));

          If dDTEmissao>dDTEntSai Then
          Begin
            For ii:=2 to 30 do
            Begin
              If ii=12 Then
               Begin
                 sNovaLinha:=sNovaLinha+'|'+Trim(Separa_String(sLinha,11,'|'));
               End
              Else
               Begin
                 sNovaLinha:=sNovaLinha+'|'+Trim(Separa_String(sLinha,ii,'|'));
               End; // If ii=12 Then
            End; // For ii:=2 to 30 do

            tsArquivo[i]:=sNovaLinha+'|';
            sNovaLinha:='';
            sLinha:=tsArquivo[i];
          End; // If dDTEmissao<dDTEntSai Then
        End; // If Trim(Separa_String(sLinha,11,'|'))<>'' Then

        // Verifica se Participante Existe --------------------------
        // Desconsidera Nota Com Serie = "DES"
        sgCodDest:=Trim(Separa_String(sLinha,5,'|'));

        If (Trim(Separa_String(sLinha,8,'|'))<>'DES') And (DM.CDS_Pessoas.Locate('CODIGO',sgCodDest,[])) Then
        Begin
          DM.CDS_Pessoas.Edit;
          DM.CDS_PessoasMOVTO.AsString:='S';
          DM.CDS_Pessoas.Post;
        End; // If DM.CDS_Pessoas.Locate('CODIGO',sgCodDest,[]) Then

        // Verifica se é para Altera os Registros C170 / C190 -------
        If Trim(Separa_String(sLinha,3,'|'))='0' Then
         Begin
           bRegAlteraC170:=True;
           bRegAlteraC190:=True;
         End
        Else
         Begin
           bRegAlteraC170:=False;
           bRegAlteraC190:=False;
         End
      End; // If sRegAtual='C100' Then
      //========================================================================
      // REGISTRO C100: NOTA FISCAL (CÓDIGO 01), NOTA FISCAL AVULSA (CÓDIGO 1B),
      //                NOTA FISCAL DE PRODUTOR (CÓDIGO 04) E NF-e (CÓDIGO 55). - FIM
      //========================================================================

      //========================================================================
      // REGISTRO C170: ITENS DO DOCUMENTO - INICIO
      //========================================================================
      // Altera CFOP e IPI da Saida - INICIO ===================================
      //========================================================================
      If (sRegAtual='C170') And (sTipoOper='1') And (StrToIntDef(Trim(Separa_String(sLinha,12,'|')),0)<>0) Then
      Begin
        If StrToIntDef(Trim(Separa_String(sLinha,12,'|')),99999)<5000 Then // If cfop<5000 + 4
        Begin
          For ii:=2 to 38 do
          Begin
            If ii=12 Then // CFop para Saida
             Begin
               If Trim(Separa_String(sLinha,12,'|'))='2220' Then
                sNovaLinha:=sNovaLinha+'|6120'
               Else If Trim(Separa_String(sLinha,12,'|'))='1220' Then
                sNovaLinha:=sNovaLinha+'|5120'
               Else
                sNovaLinha:=sNovaLinha+'|'+IntToStr(StrToInt(Trim(Separa_String(sLinha,12,'|')))+4000);
             End
            Else If (ii=21) And (StrToIntDef(Trim(Separa_String(sLinha,21,'|')),99999)<50) Then // If IPI<50 + 5
             Begin
               sNovaLinha:=sNovaLinha+'|'+IntToStr(StrToInt(Trim(Separa_String(sLinha,21,'|')))+50);
             End
            Else
             Begin
               sNovaLinha:=sNovaLinha+'|'+Trim(Separa_String(sLinha,ii,'|'));
             End;
          End; // For ii:=2 to 38 do

          tsArquivo[i]:=sNovaLinha+'|';
          sNovaLinha:='';
          sLinha:=tsArquivo[i];
        End; // If StrToIntDef(Trim(Separa_String(sLinha,12,'|')),0)<5000 Then
      End; // If (sTipoOper=1) And (sRegAtual='C170') Then
      //========================================================================
      // Altera CFOP e IPI da Saida - INICIO ===================================
      //========================================================================

      // Altera CFOP e IPI da Entrada ==========================================
      If (Trim(Separa_String(sLinha,2,'|'))='C170') and (bRegAlteraC170) Then
      Begin
        // Busca Novo CFOP ------------------------------------------
        sNovoCFop:='';
        for ii:=Low(ArrayCFopErrado) to High(ArrayCFopErrado) do
        Begin
          If ArrayCFopErrado[ii]=Trim(Separa_String(sLinha,12,'|')) Then
          Begin
            sNovaLinha:='';
            sNovoCFop:=ArrayCFopCerto[ii];
            Break;
          End; // If ArrayCFopErrado[ii]=Trim(Separa_String(sLinha,12,'|')) Then
        End; // for ii:=Low(ArrayCFopErrado) to High(ArrayCFopErrado) do

        // Alterar CFOP e/ou CST_IPI ---------------------------------
        For ii:=2 to 38 do
        Begin
          If (ii=12) and (sNovoCFop<>'') Then
           Begin
             sNovaLinha:=sNovaLinha+'|'+sNovoCFop;
           End
          Else If ii=21 Then
           Begin
             // Se Codigo Situação Tributária em Branco = -1
             iCST:=-1;
             If Trim(Separa_String(sLinha,21,'|'))<>'' Then
              iCST:=StrToInt(Trim(Separa_String(sLinha,21,'|')));

             If iCST>49 Then
              iCST:=iCST-50;

             If iCST>=0 Then
              sNovaLinha:=sNovaLinha+'|'+FormatFloat('00',iCST)
             Else
              sNovaLinha:=sNovaLinha+'|';
           End
          Else
           Begin
             sNovaLinha:=sNovaLinha+'|'+Trim(Separa_String(sLinha,ii,'|'));
           End;
        End; // For ii:=2 to 38 do

        tsArquivo[i]:=sNovaLinha+'|';
        sNovaLinha:='';
        sLinha:=tsArquivo[i];
      End; // If (Trim(Separa_String(sLinha,2,'|'))='C170') and (bRegAlteraC170) Then
      //========================================================================
      // REGISTRO C170: ITENS DO DOCUMENTO - FIM
      //========================================================================

      //========================================================================
      // REGISTRO C190: REGISTRO ANALÍTICO DO DOCUMENTO - INICIO
      //========================================================================
      If (Trim(Separa_String(sLinha,2,'|'))='C190') And (bRegAlteraC190) Then
      Begin
        // Busca Novo CFOP ------------------------------------------
        sNovoCFop:='';
        for ii:=Low(ArrayCFopErrado) to High(ArrayCFopErrado) do
        Begin
          If ArrayCFopErrado[ii]=Trim(Separa_String(sLinha,4,'|')) Then
          Begin
            sNovaLinha:='';
            sNovoCFop:=ArrayCFopCerto[ii];
            Break;
          End; // If ArrayCFopErrado[ii]=Trim(Separa_String(sLinha,12,'|')) Then
        End; // for ii:=Low(ArrayCFopErrado) to High(ArrayCFopErrado) do

        // Se Encontrou CFOP Altera ---------------------------------
        If sNovoCFop<>'' Then
        Begin
          For ii:=2 to 13 do
          Begin
            If ii=4 Then
             Begin
               sNovaLinha:=sNovaLinha+'|'+sNovoCFop;
             End
            Else
             Begin
               sNovaLinha:=sNovaLinha+'|'+Trim(Separa_String(sLinha,ii,'|'));
             End;
          End; // For ii:=2 to 13 do

          tsArquivo[i]:=sNovaLinha+'|';
          sNovaLinha:='';
          sLinha:=tsArquivo[i];
        End; // If sNovoCFop<>'' Then
      End; // If (Trim(Separa_String(sLinha,2,'|'))='C190') And (bRegAlteraC190) Then
      //========================================================================
      // REGISTRO C190: REGISTRO ANALÍTICO DO DOCUMENTO - FIM
      //========================================================================

      //========================================================================
      // Acerta CFOP - FIM =====================================================
      //========================================================================

      //========================================================================
      // REGISTRO C170: ITENS DO DOCUMENTO - INICIO
      //========================================================================
      If sRegAtual='C170' Then
      Begin
        // Busca UF Destinatario -------------------------------
        DM.CDS_Pessoas.Locate('CODIGO', sgCodDest,[]);

        sgUFDest:='RS';
        If DM.CDS_IBGE_UF.Locate('MUN', Copy(DM.CDS_PessoasCODIGO_IBGE.AsString,1,2),[]) Then
         sgUFDest:=DM.CDS_IBGE_UFUF.AsString;

        sCFopNoEstado:='SIM';
        If sUFEmit<>sgUFDest Then
         sCFopNoEstado:='NAO';

        // Se Contem ST
        sInd_ST:='NAO';
        If StrToIntDef(Trim(Separa_String(sLinha,19,'|')),0)=0 Then
         sInd_ST:='SIM';

        //  Guarda CFOP OK ------------------------------------------
        If StrToIntDef(Trim(Separa_String(sLinha,12,'|')),0)<>0 Then
        Begin
          If Not DM.CDS_CFopZerados.Locate('COD_NAT;COD_OPER;OPER_ESTADO;CST_ICMS;CST_PIS;CST_COFINS;IND_ST',
                                           VarArrayOf([Trim(Separa_String(sLinha,13,'|')), // COD_NAT
                                                       sTipoOper, // Tipo de Operacao (Entrada/Saida)
                                                       sCFopNoEstado, // Operacao no Estado ou Fora do Estado
                                                       Trim(Separa_String(sLinha,11,'|')), // CST_ICMS
                                                       Trim(Separa_String(sLinha,26,'|')), // CST_PIS
                                                       Trim(Separa_String(sLinha,32,'|')), // CST_COFINS
                                                       sInd_ST]),[]) Then // Indicativo de ST
          Begin
            DM.CDS_CFopZerados.Insert;
            DM.CDS_CFopZeradosCOD_NAT.AsString     :=Trim(Separa_String(sLinha,13,'|'));
            DM.CDS_CFopZeradosCOD_OPER.AsString    :=sTipoOper;
            DM.CDS_CFopZeradosOPER_ESTADO.AsString :=sCFopNoEstado;
            DM.CDS_CFopZeradosCST_ICMS.AsString    :=Trim(Separa_String(sLinha,11,'|'));
            DM.CDS_CFopZeradosCST_IPI.AsString     :=Trim(Separa_String(sLinha,21,'|'));
            DM.CDS_CFopZeradosCST_PIS.AsString     :=Trim(Separa_String(sLinha,26,'|'));
            DM.CDS_CFopZeradosCST_COFINS.AsString  :=Trim(Separa_String(sLinha,32,'|'));
            DM.CDS_CFopZeradosIND_ST.AsString      :=sInd_ST;
            DM.CDS_CFopZeradosCFOP.AsString        :=Trim(Separa_String(sLinha,12,'|'));
            DM.CDS_CFopZerados.Post;

            sCfopUltimoUtilizado:=Trim(Separa_String(sLinha,12,'|'));
          End; // If Not DM.CDS_CFopZerados.Locate('COD_NAT;CST_ICMS;OPER_ESTADO',VarArrayOf([Trim(Separa_String(sLinha,13,'|')),
        End; // If StrToIntDef(Trim(Separa_String(sLinha,12,'|')),0)<>0 Then

        //  CFOP do item zerado -------------------------------------
        If StrToIntDef(Trim(Separa_String(sLinha,12,'|')),0)=0 Then
        Begin
          // Altera CFOP Zerados nos Produtos das Notas ----------
          sNovoCFop :='';
          sCstICMS  :='';
          sCstIPI   :='';
          sCstPIS   :='';
          sCstCofins:='';

          b:=False;
          While Not b do
          Begin
            If DM.CDS_CFopZerados.Locate('COD_NAT;COD_OPER;OPER_ESTADO;CST_ICMS;CST_PIS;CST_COFINS;IND_ST',
                                           VarArrayOf([Trim(Separa_String(sLinha,13,'|')), // COD_NAT
                                                       sTipoOper, // Tipo de Operacao (Entrada/Saida)
                                                       sCFopNoEstado, // Operacao no Estado ou Fora do Estado
                                                       Trim(Separa_String(sLinha,11,'|')), // CST_ICMS
                                                       Trim(Separa_String(sLinha,26,'|')), // CST_PIS
                                                       Trim(Separa_String(sLinha,32,'|')), // CST_COFINS
                                                       sInd_ST]),[]) Then // Indicativo de ST
             Begin
               sNovoCFop:=DM.CDS_CFopZeradosCFOP.AsString;
               sCfopUltimoUtilizado:=DM.CDS_CFopZeradosCFOP.AsString;

               sCstICMS  :=DM.CDS_CFopZeradosCST_ICMS.AsString;
               sCstIPI   :=DM.CDS_CFopZeradosCST_IPI.AsString;
               sCstPIS   :=DM.CDS_CFopZeradosCST_PIS.AsString;
               sCstCofins:=DM.CDS_CFopZeradosCST_COFINS.AsString;
             End
            Else If Trim(sCfopUltimoUtilizado)<>'' Then
             Begin
               sNovoCFop:=Trim(sCfopUltimoUtilizado);
             End
            Else // If DM.CDS_CFopZerados.Locate('COD_NAT;COD_OPER;OPER_ESTADO;CST_ICMS;CST_PIS;CST_COFINS;IND_ST', ...
             Begin
               FrmCFopProduto:=TFrmCFopProduto.Create(Self);

               DM.CDS_NatOperacao.Locate('COD_NATOPERACAO',Trim(Separa_String(sLinha,13,'|')),[]);
               FrmCFopProduto.EdtCodNatOper.Text:=DM.CDS_NatOperacaoCOD_NATOPERACAO.AsString;
               FrmCFopProduto.EdtDesNatOper.Text:=DM.CDS_NatOperacaoDES_NATOPERACAO.AsString;

               FrmCFopProduto.EdtRegistro.Text  :=Trim(sLinha);
               FrmCFopProduto.EdtCodOper.Text:=Trim(sTipoOper);

               If sTipoOper='0' Then
                FrmCFopProduto.EdtDesOper.Text:='ENTRADA'
               Else
                FrmCFopProduto.EdtDesOper.Text:='SAÍDA';

               FrmCFopProduto.EdtUFEmit.Text     :=Trim(sUFEmit);
               FrmCFopProduto.EdtUFDest.Text     :=Trim(sgUFDest);
               FrmCFopProduto.EdtCST_ICMS.Text   :=Trim(Separa_String(sLinha,11,'|'));
               FrmCFopProduto.EdtCST_IPI.Text    :=Trim(Separa_String(sLinha,21,'|'));
               FrmCFopProduto.EdtCST_PIS.Text    :=Trim(Separa_String(sLinha,26,'|'));
               FrmCFopProduto.EdtCST_COFINS.Text :=Trim(Separa_String(sLinha,32,'|'));
               FrmCFopProduto.EdtInd_SubTrib.Text:=sInd_ST;

               FrmCFopProduto.EdtCFopDocto.Text:=sCfopUltimoUtilizado;

               FrmCFopProduto.ShowModal;

               sNovoCFop :=DM.CDS_CFopZeradosCFOP.AsString;
               sCstICMS  :=DM.CDS_CFopZeradosCST_ICMS.AsString;
               sCstIPI   :=DM.CDS_CFopZeradosCST_IPI.AsString;
               sCstPIS   :=DM.CDS_CFopZeradosCST_PIS.AsString;
               sCstCofins:=DM.CDS_CFopZeradosCST_COFINS.AsString;

               FreeAndNil(FrmCFopProduto);
             End; // If DM.CDS_CFopZerados.Locate('COD_NAT;COD_OPER;OPER_ESTADO;CST_ICMS;CST_PIS;CST_COFINS;IND_ST', ...

            If sNovoCFop<>'' Then
             Break;
          End; // While Not b do

          For ii:=2 to 38 do
          Begin
            If ii=12 Then // CFOP
             Begin
               sNovaLinha:=sNovaLinha+'|'+sNovoCFop;
             End
            Else If (ii=11) And (sCstICMS<>'') Then // CST_ICMS
             Begin
               sNovaLinha:=sNovaLinha+'|'+sCstICMS;
             End
            Else If (ii=21) And (sCstIPI<>'') Then // CST_IPI
             Begin
               sNovaLinha:=sNovaLinha+'|'+sCstIPI;
             End
            Else If (ii=26) And (sCstPIS<>'') Then // CST_PIS
             Begin
               sNovaLinha:=sNovaLinha+'|'+sCstPIS;
             End
            Else If (ii=32) And (sCstCofins<>'') Then // CST_COFINS
             Begin
               sNovaLinha:=sNovaLinha+'|'+sCstCofins;
             End
            Else
             Begin
               sNovaLinha:=sNovaLinha+'|'+Trim(Separa_String(sLinha,ii,'|'));
             End;
          End; // For ii:=2 to 38 do

          tsArquivo[i]:=sNovaLinha+'|';
          sNovaLinha:='';
          sLinha:=tsArquivo[i];
        End; // If StrToIntDef(Trim(Separa_String(sLinha,12,'|')),0)=0 Then
      End; // If sRegAtual='C170' Then
      //========================================================================
      // REGISTRO C170: ITENS DO DOCUMENTO - FIM
      //========================================================================

      //========================================================================
      // Exclui Podutos Existentes - INICIO
      //========================================================================
      sLinha:=tsArquivo[i];
      sRegAtual:=Trim(Separa_String(sLinha,2,'|'));

      // Exclui Produtos Existentes ---------------------------------
      If (sRegAtual='C321') Or (sRegAtual='C425') Or (sRegAtual='C470') Or
         (sRegAtual='1300') Or (sRegAtual='1400') Then
      Begin
        If DM.CDS_Prod.Locate('CODIGO',Trim(Separa_String(sLinha,3,'|')),[]) Then
        Begin
          DM.CDS_Prod.Delete;
        End;
      End; // If (sRegAtual='C321') Or (sRegAtual='C425') Or (sRegAtual='C470') Or

      // Exclui Produtos Existentes (Invrntario) --------------------
      If (sRegAtual='H010') Then
      Begin
        If (StrToCurr(Trim(Separa_String(sLinha,5,'|')))<>0) Then // Quantidade Inventariada <> 0
        Begin
          If (StrToCurr(Trim(Separa_String(sLinha,7,'|')))=0) Then // Valor Total do Inventatio =0 (Enceera Programa)
          Begin
            MessageDlg('Registro H010: INVENTÁRIO'+cr+
                       '==========================='+cr+cr+
                       'Existe(m) Produto(s) Inventariado(s) SEM o Valor Unitário !!'+cr+
                       'LINHA:  '+sLinha+cr+cr+
                       'REFAÇA o arquivo no SIDICOM'+cr+
                       'Solicitando o Preço de Custo no Inventário !!', mtError, [mbOK], 0);

            FechaTudo;
            Bt_CorrigeArquivo.Enabled:=False;
            EdtPastaArquivo.Clear;
            MontaProgressBar(False);
            FreeAndNil(tsArquivo);
            FreeAndNil(tsArquivoNovo);
            Pan_OBS.Visible:=False;
            Screen.Cursor:=crDefault;
            Bt_BuscaArquivo.sETfOCUS;
            Exit;
          End;

          If DM.CDS_Prod.Locate('CODIGO',Trim(Separa_String(sLinha,3,'|')),[]) Then
          Begin
            DM.CDS_Prod.Delete;
          End;
        End;
      End;

      // Exclui Produtos Existentes ---------------------------------
      If (sRegAtual='C170') or (sRegAtual='C370') or (sRegAtual='C495') or
         (sRegAtual='C510') or (sRegAtual='C610') or (sRegAtual='D110') or (sRegAtual='D510') or
         (sRegAtual='D610') or (sRegAtual='G140') or (sRegAtual='1370') or (sRegAtual='1510') Then
      Begin
        If DM.CDS_Prod.Locate('CODIGO',Trim(Separa_String(sLinha,4,'|')),[]) Then
        Begin
          DM.CDS_Prod.Delete;
        End;
      End; // If (sRegAtual='C170') or (sRegAtual='C370') or (sRegAtual='C495') or (sRegAtual='C510') or

      // Exclui Produtos Existentes ---------------------------------
      If (sRegAtual='D197') or (sRegAtual='C197') Then
      Begin
        If DM.CDS_Prod.Locate('CODIGO',Trim(Separa_String(sLinha,5,'|')),[]) Then
        Begin
          DM.CDS_Prod.Delete;
        End;
      End; // If sRegAtual='D197' Then

      // Exclui Produtos Existentes ---------------------------------
      If sRegAtual='1105' Then
      Begin
        If DM.CDS_Prod.Locate('CODIGO',Trim(Separa_String(sLinha,8,'|')),[]) Then
        Begin
          DM.CDS_Prod.Delete;
        End;
      End; // If sRegAtual='1105' Then

      // Exclui Produtos Existentes ---------------------------------
      If (sRegAtual='E113') or (sRegAtual='E240') or (sRegAtual='1923') Then
      Begin
        If DM.CDS_Prod.Locate('CODIGO',Trim(Separa_String(sLinha,9,'|')),[]) Then
        Begin
          DM.CDS_Prod.Delete;
        End;
      End; // If sRegAtual='E113' Then
      //========================================================================
      // Exclui Podutos Existentes - FIM
      //========================================================================

      //========================================================================
      // Marca Participantes Existentes - INICIO
      //========================================================================
      If (sRegAtual='C160') or (sRegAtual='C165') or (sRegAtual='D140') or
         (sRegAtual='D400') or (sRegAtual='E113') or (sRegAtual='E240') or
         (sRegAtual='1110') or (sRegAtual='1600') or (sRegAtual='1923') Then
      Begin
        // Verifica se Participante Existe --------------------------
        if DM.CDS_Pessoas.Locate('CODIGO;MOVTO',VarArrayOf([Trim(Separa_String(sLinha,3,'|')),'N']),[]) Then
        Begin
          DM.CDS_Pessoas.Edit;
          DM.CDS_PessoasMOVTO.AsString:='S';
          DM.CDS_Pessoas.Post;
        End; // if DM.CDS_Pessoas.Locate('CODIGO;MOVTO',VarArrayOf([Trim(Separa_String(sLinha,3,'|')),'N']),[]) Then
      End; // If (sRegAtual='C160') or (sRegAtual='C165') or (sRegAtual='D140') or

      // Marca Participantes Existentes -----------------------------
      If (sRegAtual='D130') or (sRegAtual='D170') or (sRegAtual='G130') Then
      Begin
        // Verifica se Participante Existe --------------------------
        if (DM.CDS_Pessoas.Locate('CODIGO;MOVTO',VarArrayOf([Trim(Separa_String(sLinha,3,'|')),'N']),[])) Or
           (DM.CDS_Pessoas.Locate('CODIGO;MOVTO',VarArrayOf([Trim(Separa_String(sLinha,4,'|')),'N']),[])) Then
        Begin
          DM.CDS_Pessoas.Edit;
          DM.CDS_PessoasMOVTO.AsString:='S';
          DM.CDS_Pessoas.Post;
        End; // if (DM.CDS_Pessoas.Locate('CODIGO;MOVTO',VarArrayOf([Trim(Separa_String(sLinha,3,'|')),'N']),[])) Or
      End; // If (sRegAtual='D130') or (sRegAtual='D170') or (sRegAtual='G130') Then

      // Marca Participantes Existentes -----------------------------
      If (sRegAtual='C113') or (sRegAtual='C500') or (sRegAtual='D100') or (sRegAtual='D500') or (sRegAtual='1500') Then
      Begin
        // Verifica se Participante Existe --------------------------
        if DM.CDS_Pessoas.Locate('CODIGO;MOVTO',VarArrayOf([Trim(Separa_String(sLinha,5,'|')),'N']),[]) Then
        Begin
          DM.CDS_Pessoas.Edit;
          DM.CDS_PessoasMOVTO.AsString:='S';
          DM.CDS_Pessoas.Post;
        End; // if DM.CDS_Pessoas.Locate('CODIGO;MOVTO',VarArrayOf([Trim(Separa_String(sLinha,5,'|')),'N']),[]) Then
      End; // If (sRegAtual='C113') or (sRegAtual='C500') or (sRegAtual='D100') or (sRegAtual='D500') or (sRegAtual='1500') Then

      // Marca Participantes Existentes -----------------------------
      If (sRegAtual='C176') Then
      Begin
        // Verifica se Participante Existe --------------------------
        if DM.CDS_Pessoas.Locate('CODIGO;MOVTO',VarArrayOf([Trim(Separa_String(sLinha,7,'|')),'N']),[]) Then
        Begin
          DM.CDS_Pessoas.Edit;
          DM.CDS_PessoasMOVTO.AsString:='S';
          DM.CDS_Pessoas.Post;
        End; // if DM.CDS_Pessoas.Locate('CODIGO;MOVTO',VarArrayOf([Trim(Separa_String(sLinha,7,'|')),'N']),[]) Then
      End; // If (sRegAtual='C176') Then

      // Marca Participantes Existentes -----------------------------
      If (sRegAtual='H010') Then
      Begin
        // Verifica se Quantidade Inventariada é Diferente de Zero
        If (StrToCurr(Trim(Separa_String(sLinha,5,'|')))<>0) Then
        Begin
          // Verifica se Participante Existe -----------------
          If DM.CDS_Pessoas.Locate('CODIGO;MOVTO',VarArrayOf([Trim(Separa_String(sLinha,9,'|')),'N']),[]) Then
          Begin
            DM.CDS_Pessoas.Edit;
            DM.CDS_PessoasMOVTO.AsString:='S';
            DM.CDS_Pessoas.Post;
          End; // if DM.CDS_Pessoas.Locate('CODIGO;MOVTO',VarArrayOf([Trim(Separa_String(sLinha,9,'|')),'N']),[]) Then
        End; // If (StrToCurr(Trim(Separa_String(sLinha,7,'|')))<>0) Then
      End; // If (sRegAtual='H010') Then

      // Marca Participantes Existentes -----------------------------
      If (sRegAtual='D510') Then
      Begin
        // Verifica se Participante Existe --------------------------
        if DM.CDS_Pessoas.Locate('CODIGO;MOVTO',VarArrayOf([Trim(Separa_String(sLinha,18,'|')),'N']),[]) Then
        Begin
          DM.CDS_Pessoas.Edit;
          DM.CDS_PessoasMOVTO.AsString:='S';
          DM.CDS_Pessoas.Post;
        End; // if DM.CDS_Pessoas.Locate('CODIGO;MOVTO',VarArrayOf([Trim(Separa_String(sLinha,18,'|')),'N']),[]) Then
      End; // If (sRegAtual='D510') Then

      // Marca Participantes Existentes -----------------------------
      If (sRegAtual='C510') or (sRegAtual='1510') Then
      Begin
        // Verifica se Participante Existe --------------------------
        if DM.CDS_Pessoas.Locate('CODIGO;MOVTO',VarArrayOf([Trim(Separa_String(sLinha,19,'|')),'N']),[]) Then
        Begin
          DM.CDS_Pessoas.Edit;
          DM.CDS_PessoasMOVTO.AsString:='S';
          DM.CDS_Pessoas.Post;
        End; // if DM.CDS_Pessoas.Locate('CODIGO;MOVTO',VarArrayOf([Trim(Separa_String(sLinha,19,'|')),'N']),[]) Then
      End; // If (sRegAtual='C510') or (sRegAtual='1510') Then
      //========================================================================
      // Marca Participantes Existentes - FIM
      //========================================================================
    End; // For i:=0 to tsArquivo.Count-1 do
    MontaProgressBar(False);
    Screen.Cursor:=crDefault;
    //==========================================================================
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//    Pan_OBS.Caption:='AGUARDE !! Fase 04/09 - DADOS DO PARTCIPANTE, CFOP, DATA DE ENTRADA E SAIDA...';
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    //==========================================================================
    //==========================================================================
    // Retira Participante e/ou Produtos Não Movimentados no Período - INICIO
    //==========================================================================
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    Pan_OBS.Caption:='AGUARDE !! Fase 05/09 - ACERTA PRODUTOS...';
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    Screen.Cursor:=crAppStart;

    i9900_0200:=0; // |9900|0205|????| Produto
    i9900_0205:=0; // |9900|0205|????| Alteração de Produto
    i9900_0150:=0; // |9900|0175|????| Participantes
    i9900_0175:=0; // |9900|0175|????| Alteração de Participantes

    MontaProgressBar(True);
    iIndexMenos:=0;
    pgProgBar.Properties.Max:=tsArquivo.Count;
    pgProgBar.Position:=0;

    For i:=0 to tsArquivo.Count-1 do
    Begin
      Application.ProcessMessages;

      If bgParar Then
      Begin
        Break;
      End;

      bExcluiu    :=False;     // Se Excluiu Produto
      pgProgBar.Position:=i+1;

      iIndex:=i-iIndexMenos;

      sLinha:=tsArquivo[iIndex];

      sRegAtual:=Trim(Separa_String(sLinha,2,'|'));

      //Odir
//        Label1.Caption:=IntToStr(i+1);
//        Label1.Caption:=Label1.Caption+' - '+sRegAtual;

      //========================================================================
      // REGISTRO 0200: TABELA DE IDENTIFICAÇÃO DO ITEM (PRODUTO E SERVIÇOS) - INICIO
      //
      // Retira Produtos Não Movimentados no Período
      //========================================================================
      If (sRegAtual='0200') And (Not DM.CDS_Prod.IsEmpty) Then
      Begin
        If DM.CDS_Prod.Locate('CODIGO',Trim(Separa_String(sLinha,3,'|')),[]) Then
        Begin
          bExcluiu:=True;

          tsArquivo.Delete(iIndex);
          Inc(iIndexMenos);
          Inc(i9900_0200);

          sLinha:=tsArquivo[iIndex];
          sRegAtual:=Trim(Separa_String(sLinha,2,'|'));

          // Exclui Alteração do Item
          b:=True;
          While b do
          Begin
            If sRegAtual='0205' Then
             Begin
               tsArquivo.Delete(iIndex);
               Inc(iIndexMenos);
               Inc(i9900_0205);

               sLinha:=tsArquivo[iIndex];
               sRegAtual:=Trim(Separa_String(sLinha,2,'|'));
             End
            Else
             Begin
               Break;
             End
          End; // While b do
        End; // If DM.CDS_Prod.Locate('CODIGO',Trim(Separa_String(sLinha,3,'|')),[]) Then
      End; // If (sRegAtual='0200') And (Not DM.CDS_Prod.IsEmpty) Then
      //========================================================================
      // REGISTRO 0200: TABELA DE IDENTIFICAÇÃO DO ITEM (PRODUTO E SERVIÇOS) - FIM
      //
      // Retira Produtos Não Movimentados no Período
      //========================================================================

      //========================================================================
      // REGISTRO 0150: TABELA DE CADASTRO DO PARTICIPANTE - INICIO
      //
      // Retira Participantes Não Movimentados no Período
      //========================================================================
      If (sRegAtual='0150') Then
      Begin
        If DM.CDS_Pessoas.Locate('CODIGO;MOVTO',VarArrayOf([Trim(Separa_String(sLinha,3,'|')), 'N']),[]) Then
        Begin
          bExcluiu:=True;

          tsArquivo.Delete(iIndex);
          Inc(iIndexMenos);
          Inc(i9900_0150);

          sLinha:=tsArquivo[iIndex];
          sRegAtual:=Trim(Separa_String(sLinha,2,'|'));

          // Exclui Alteração do Item
          b:=True;
          While b do
          Begin
            If sRegAtual='0175' Then
             Begin
               tsArquivo.Delete(iIndex);
               Inc(iIndexMenos);
               Inc(i9900_0175);

               sLinha:=tsArquivo[iIndex];
               sRegAtual:=Trim(Separa_String(sLinha,2,'|'));
             End
            Else
             Begin
               Break;
             End
          End; // While b do
        End; // If DM.CDS_Pessoas.Locate('CODIGO,MOVTO',VarArrayOf([Trim(Separa_String(sLinha,3,'|')), 'N']),[]) Then
      End; // If (sRegAtual='0150') Then
      //========================================================================
      // REGISTRO 0150: TABELA DE CADASTRO DO PARTICIPANTE - FIM
      //
      // Retira Participantes Não Movimentados no Período
      //========================================================================

      //========================================================================
      // Acerta Totalizadores de Participantes e Produtos ======================
      //========================================================================
      If Not bExcluiu Then
      Begin
        If sRegAtual='0990' Then // |0990|????|
        Begin
          tsArquivo[iIndex]:='|0990|'+(IntToStr(StrToInt(Trim(Separa_String(sLinha,3,'|')))-iIndexMenos))+'|';
        End; // If sRegAtual='0990' Then

        // Totalizadores de Participantes ---------------------------
        If sRegAtual='9900' Then // |9900|0150|????|
        Begin
          If Trim(Separa_String(sLinha,3,'|'))='0150' Then
           tsArquivo[iIndex]:='|9900|0150|'+(IntToStr(StrToInt(Trim(Separa_String(sLinha,4,'|')))-i9900_0150))+'|';
        End; // If sRegAtual='9900' Then

        If sRegAtual='9900' Then // |9900|0175|????|
        Begin
          If Trim(Separa_String(sLinha,3,'|'))='0175' Then
           tsArquivo[iIndex]:='|9900|0175|'+(IntToStr(StrToInt(Trim(Separa_String(sLinha,4,'|')))-i9900_0175))+'|';
        End; // If sRegAtual='9900' Then
        // Totalizadores de Participantes ---------------------------

        // Totalizadores de Produtos --------------------------------
        If sRegAtual='9900' Then // |9900|0200|????|
        Begin
          If Trim(Separa_String(sLinha,3,'|'))='0200' Then
           tsArquivo[iIndex]:='|9900|0200|'+(IntToStr(StrToInt(Trim(Separa_String(sLinha,4,'|')))-i9900_0200))+'|';
        End; // If sRegAtual='9900' Then

        If sRegAtual='9900' Then // |9900|0205|????|
        Begin
          If Trim(Separa_String(sLinha,3,'|'))='0205' Then
           tsArquivo[iIndex]:='|9900|0205|'+(IntToStr(StrToInt(Trim(Separa_String(sLinha,4,'|')))-i9900_0205))+'|';
        End; // If sRegAtual='9900' Then
        // Totalizadores de Produtos --------------------------------

        If sRegAtual='9999' Then //  |9999|11749|
        Begin
          tsArquivo[iIndex]:='|9999|'+(IntToStr(StrToInt(Trim(Separa_String(sLinha,3,'|')))-iIndexMenos))+'|';
        End; // If sRegAtual='9999' Then
      End; // If Not bExcluiu Then

    End; // For i:=0-iIndex to tsArquivo.Count-1 do
    MontaProgressBar(False);
    Screen.Cursor:=crDefault;
    //==========================================================================
    // Retira Participante e/ou Produtos Não Movimentados no Período - FIM
    //==========================================================================
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//    Pan_OBS.Caption:='AGUARDE !! Fase 05/09 - ACERTA PRODUTOS...';
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    //==========================================================================
    // Retira ST (SERIE=DES) ===================================================
    //==========================================================================
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    Pan_OBS.Caption:='AGUARDE !! Fase 06/09 - RETIRA SERIE=DES...';
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    Screen.Cursor:=crAppStart;

    Pan_OBS.Visible:=True;
    MontaProgressBar(True);
    bgParar:=False;

    iC990:=0;      // |C990|34735|
    i9900_C100:=0; // |9900|C100|88|
    i9900_C170:=0; // |9900|C170|52|
    i9900_C140:=0; // |9900|C140|82|
    i9900_C141:=0; // |9900|C141|83|
    i9900_C190:=0; // |9900|C190|63|
    i9999:=0;      // |9999|46538|

    // Registro de Invantário
    bg0500:=False;       // Se Existe Plano de contas contábeis
    bgCod82601:=False;   // Se Existe o Codigo 82601 - Estoque de Mercadorias
    bgInventario:=False; // Se Existe Registro de Inventário
    cgTotalInventario:=0;

    Pan_ST.Visible:=True;
    Pan_Notas_Des.Visible:=True;
    Pan_Notas_ST_Erradas.Visible:=True;
    Pan_Diversos.Visible:=False;

    pgProgBar.Properties.Max:=tsArquivo.Count;
    pgProgBar.Position:=0;

    iIndex:=tsArquivo.Count-1;
    For i:=0 to tsArquivo.Count-1 do
    Begin
      Application.ProcessMessages;

      pgProgBar.Properties.Max:=iIndex;

      If bgParar Then
      Begin
        Break;
      End;

      pgProgBar.Position:=i+1;

      sLinha:=tsArquivo[i];
      sRegAtual:=Trim(Separa_String(sLinha,2,'|'));

      //Odir
//      Label1.Caption:=IntToStr(i+1);
//      Label1.Caption:=Label1.Caption+' - '+sRegAtual;

      //========================================================================
      // VERIFICA SE EXISTE - REGISTRO 0500: PLANO DE CONTAS CONTÁBEIS =========
      //========================================================================
      If (sRegAtual='0500') Then
      Begin
        bg0500:=True;

        If StrToInt(Trim(Separa_String(sLinha,7,'|')))=82601 Then
         bgCod82601:=True;
      End; // If (sRegAtual='0500') Then
      //========================================================================

      //========================================================================
      // VERIFICA SE EXISTE - REGISTRO H001: ABERTURA DO BLOCO H ===============
      //========================================================================
      If (sRegAtual='H010') Then
      Begin
        bgInventario:=True;
        cgTotalInventario:=cgTotalInventario+ABS(StrToCurr(Trim(Separa_String(sLinha,7,'|'))));
      End;
      //========================================================================

      If (sRegAtual='C100') Then
      Begin
        bExcluiReg_DES:=False;
        b:=True;
        While b do
        Begin
  //        iC990:=0;      // |C990|34735|
  //        i9900_C100:=0; // |9900|C100|88|
  //        i9900_C170:=0; // |9900|C170|52|
  //        i9900_C140:=0; // |9900|C140|82|
  //        i9900_C141:=0; // |9900|C141|83|
  //        i9900_C190:=0; // |9900|C190|63|
  //        i9999:=0;      // |9999|46538|

          If sRegAtual='C400' Then
           Break;

          If (sRegAtual='C100') and (Trim(Separa_String(sLinha,3,'|'))='0') And (Trim(Separa_String(sLinha,8,'|'))='DES') Then
           Begin
             DM.CDS_ST.Append;
             DM.CDS_STCOD_PART.AsString:=Trim(Separa_String(sLinha,5,'|'));
             DM.CDS_STDT_DOC.AsString:=Trim(Separa_String(sLinha,11,'|'));
             DM.CDS_STDT_E_S.AsString:=Trim(Separa_String(sLinha,12,'|'));
             DM.CDS_STNUM_DOC.AsString:=Trim(Separa_String(sLinha,9,'|'));
             DM.CDS_STSERIE.AsString:=Trim(Separa_String(sLinha,8,'|'));
             DM.CDS_STVL_DOC.AsString:=Trim(Separa_String(sLinha,13,'|'));
             DM.CDS_ST.Post;

             Inc(iC990);  // |C990|34735|
             Inc(i9900_C100); // |9900|C100|88|
             Inc(i9999);      // |9999|46538|
             tsArquivo.Delete(i);
             sLinha:=tsArquivo[i];
             iIndex:=iIndex-1;
             sRegAtual:=Trim(Separa_String(sLinha,2,'|'));

             bExcluiReg_DES:=True
           End
          Else if (sRegAtual='C100') And (Trim(Separa_String(sLinha,8,'|'))<>'DES') Then
           Begin
             bExcluiReg_DES:=False;
           End;

          If Not bExcluiReg_DES Then
          Begin
            bExcluiReg_DES:=False;
            b:=False;
            Break;
          End;

          If (sRegAtual='C170') And (bExcluiReg_DES) Then
          Begin
            Inc(iC990);      // |C990|34735|
            Inc(i9900_C170); // |9900|C170|52|
            Inc(i9999);      // |9999|46538|
            tsArquivo.Delete(i);
            sLinha:=tsArquivo[i];
            iIndex:=iIndex-1;
            sRegAtual:=Trim(Separa_String(sLinha,2,'|'));
          End; // If (sRegAtual='C170') And (bExcluiReg_DES) Then

          If (sRegAtual='C140') And (bExcluiReg_DES) Then
          Begin
            Inc(iC990);      // |C990|34735|
            Inc(i9900_C140); // |9900|C140|82|
            Inc(i9999);      // |9999|46538|
            tsArquivo.Delete(i);
            sLinha:=tsArquivo[i];
            iIndex:=iIndex-1;
            sRegAtual:=Trim(Separa_String(sLinha,2,'|'));
          End; // If (sRegAtual='C140') And (bExcluiReg_DES) Then

          If (sRegAtual='C141') And (bExcluiReg_DES) Then
          Begin
            Inc(iC990);      // |C990|34735|
            Inc(i9900_C141); // |9900|C141|83|
            Inc(i9999);      // |9999|46538|
            tsArquivo.Delete(i);
            sLinha:=tsArquivo[i];
            iIndex:=iIndex-1;
            sRegAtual:=Trim(Separa_String(sLinha,2,'|'));
          End; // Else If (sRegAtual='C141') And (bExcluiReg_DES) Then

          If (sRegAtual='C190') And (bExcluiReg_DES) Then
          Begin
            Inc(iC990);      // |C990|34735|
            Inc(i9900_C190); // |9900|C190|63|
            Inc(i9999);      // |9999|46538|
            tsArquivo.Delete(i);
            sLinha:=tsArquivo[i];
            iIndex:=iIndex-1;
            sRegAtual:=Trim(Separa_String(sLinha,2,'|'));
          End; // Else If (sRegAtual='C190') And (bExcluiReg_DES) Then

        End; // While b do
      End; // If (sRegAtual='C100') Then

      // Totais dos Registros =================================================
      If (sRegAtual='C990') Then // |C990|34735|
       tsArquivo[i]:='|C990|'+IntToStr(StrToInt(Trim(Separa_String(sLinha,3,'|')))-iC990)+'|';

      If (sRegAtual='9900') And (Trim(Separa_String(sLinha,3,'|'))='C100') Then // |9900|C100|88|
       tsArquivo[i]:='|9900|C100|'+IntToStr(StrToInt(Trim(Separa_String(sLinha,4,'|')))-i9900_C100)+'|';

      If (sRegAtual='9900') And (Trim(Separa_String(sLinha,3,'|'))='C170') Then // |9900|C170|52|
       tsArquivo[i]:='|9900|C170|'+IntToStr(StrToInt(Trim(Separa_String(sLinha,4,'|')))-i9900_C170)+'|';

      If (sRegAtual='9900') And (Trim(Separa_String(sLinha,3,'|'))='C140') Then // |9900|C140|82|
       tsArquivo[i]:='|9900|C140|'+IntToStr(StrToInt(Trim(Separa_String(sLinha,4,'|')))-i9900_C140)+'|';

      If (sRegAtual='9900') And (Trim(Separa_String(sLinha,3,'|'))='C141') Then // |9900|C141|83|
       tsArquivo[i]:='|9900|C141|'+IntToStr(StrToInt(Trim(Separa_String(sLinha,4,'|')))-i9900_C141)+'|';

      If (sRegAtual='9900') And (Trim(Separa_String(sLinha,3,'|'))='C190') Then // |9900|C190|63|
       tsArquivo[i]:='|9900|C190|'+IntToStr(StrToInt(Trim(Separa_String(sLinha,4,'|')))-i9900_C190)+'|';

      If (sRegAtual='9999') Then // |9999|46538|
       tsArquivo[i]:='|9999|'+IntToStr(StrToInt(Trim(Separa_String(sLinha,3,'|')))-i9999)+'|';

      If i=iIndex Then
       Break;
    End; // For i:=0 to tsArquivo.Count-1 do
    MontaProgressBar(False);
    Screen.Cursor:=crDefault;
    //==========================================================================
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//    Pan_OBS.Caption:='AGUARDE !! Fase 06/09 - RETIRA SERIE=DES...';
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    Pan_OBS.Caption:='AGUARDE !! Fase 07/09 - ATUALIZA SUBSTITUIÇÃO TRIBUTÁRIA (SERIE=DES)...';
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    //==========================================================================
    // Atualiza ST (SERIE=DES) na Nota e no Primeiro Produto ===================
    //==========================================================================
    Screen.Cursor:=crAppStart;

    Pan_OBS.Visible:=True;

    bgAtualizaST:=False;
    bSiga:=True;
    b:=True;
    While b do
    Begin
      DM.CDS_ST.First;
      If Not DM.CDS_ST.IsEmpty Then
       Begin
         bgAtualizaST:=True;
         AtualizaST_Serie_DES(tsArquivo);

        If bgParar Then
        Begin
          Break;
        End;

         If Not DM.CDS_ST.IsEmpty Then
         Begin
            If msg('Existem Notas ST Sem Nota de Origem !!'+cr+'Serie=DES'+cr+cr+'Deseja Alterar a Numeração da Nota ??','C')=2 Then
            Begin
              If Not DM.CDS_ST.IsEmpty Then
              Begin
                msg('O Sistema Salvará em Excel as Notas'+cr+'com Série="DES" Sem Nota de Origem !!','A');
                DM.CDS_ST.First;
                While Not DM.CDS_ST.Eof do
                Begin
                  If (Trim(DM.CDS_STNUM_DOC_ORIGINAL.AsString)<>'') And (Trim(DM.CDS_STNUM_DOC_ORIGINAL.AsString)<>Trim(DM.CDS_STNUM_DOC.AsString)) Then
                  Begin
                    DM.CDS_ST.Edit;
                    DM.CDS_STNUM_DOC.AsString:=DM.CDS_STNUM_DOC_ORIGINAL.AsString;
                    DM.CDS_STNUM_DOC_ORIGINAL.AsString:='';
                    DM.CDS_ST.Post;
                  End; // If Trim(DM.CDS_STNUM_DOC_ORIGINAL.AsString)<>Trim(DM.CDS_STNUM_DOC.AsString) Then

                  DM.CDS_ST.Next;
                End; // While Not DM.CDS_ST.Eof do
                DM.CDS_ST.First;

                ExportDBGridExcel(True, DBGrid6, FrmAlertaST);
              End;

              Break;
            End;

            DM.CDS_ST.First;
            While not DM.CDS_ST.Eof do
            Begin
              sNrNota:=DM.CDS_STNUM_DOC.AsString;
              bb:=True;
              While bb do
              Begin
                If InputQuery('Altere o Nº Nota','',sNrNota) then
                 Begin
                   if (Trim(sNrNota)='') Or (StrToIntDef(sNrNota,99999999)=99999999) then
                    Begin
                      Application.MessageBox('Número da Nota é Inválido !!', 'ATENÇÃO', 0);
                    End
                   Else If Length(sNrNota) > 6 then
                    Begin
                      Application.MessageBox('Número da Nota é Inválido !!'+cr+'Deve Conter no máximo 6 Caracteres !!', 'ATENÇÃO', 0);
                    End
                   Else
                    Begin
                      Break;
                    End; // if Trim(sNrNota)='' then
                 End
                Else // If InputQuery('Altere o Nº Nota','',sNrNota) then
                 Begin
                   if MessageBox(Application.Handle,'Número da Nota Esta Correto ??',
                      'ATENÇÂO',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = idYes then
                   Begin
                     Break;
                   End; // if MessageBox(Application.Handle,'O Motivo de cancelamento Esata Correto ??',
                 End; // If InputQuery('Motivo de Cancelamento','',sMotCanc) then
              End; // While bb do

              If sNrNota<>DM.CDS_STNUM_DOC.AsString Then
              Begin
                DM.CDS_ST.Edit;

                If Trim(DM.CDS_STNUM_DOC_ORIGINAL.AsString)='' Then
                 DM.CDS_STNUM_DOC_ORIGINAL.AsString:=DM.CDS_STNUM_DOC.AsString;

                DM.CDS_STNUM_DOC.AsString:=FormatFloat('000000',StrToInt(sNrNota));
                DM.CDS_ST.Post;

                bSiga:=False;
              End; // If sNrNota<>DM.CDS_STNUM_DOC.AsString Then

              DM.CDS_ST.Next;
            End;
            DM.CDS_ST.First;
         End; // If Not DM.CDS_ST.IsEmpty Then

         If bSiga Then
          Break;

       End
      Else // If Not DM.CDS_ST.IsEmpty Then
       Begin
         Break;
       End; // If Not DM.CDS_ST.IsEmpty Then
    End; // While b do
    //==========================================================================

    If Not DM.CDS_Nota_ST_Errada.IsEmpty Then
    Begin
      Pan_Notas_ST_Erradas.Visible:=True;
      Pan_Notas_Des.Visible:=False;

      bgParar:=False;

      FrmAlertaST.ShowModal;
    End; // If Not DM.CDS_Nota_ST_Errada.IsEmpty Then

    Pan_ST.Visible:=False;
    Pan_Diversos.Visible:=True;
    Screen.Cursor:=crDefault;
    //==========================================================================
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//    Pan_OBS.Caption:='AGUARDE !! Fase 07/09 - ATUALIZA SUBSTITUIÇÃO TRIBUTÁRIA (SERIE=DES)...';
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    Pan_OBS.Caption:='AGUARDE !! Fase 08/09 - ATUALIZA DADOS DE INVENTÁRIO...';
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    //==========================================================================
    // BLOCO H: INVENTÁRIO FÍSICO ==============================================
    //==========================================================================
    Screen.Cursor:=crAppStart;

    Pan_OBS.Visible:=True;
    If bgInventario Then
    Begin
      AcertaRegistrosInventario(tsArquivo);

      If bgParar Then
      Begin
        Exit;
      End;
    End; // If bgInventario Then
    Screen.Cursor:=crDefault;
    //==========================================================================
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//    Pan_OBS.Caption:='AGUARDE !! Fase 08/09 - ATUALIZA DADOS DE INVENTÁRIO...';
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    Pan_OBS.Caption:='AGUARDE !! Fase 09/09 - Reorganizando Estrutura do Arquivo SpedFiscal (Regsitro C170)...';
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    //==========================================================================
    // Re-Estrura do Arquivo ===================================================
    //==========================================================================
    Screen.Cursor:=crAppStart;

    Pan_OBS.Visible:=True;
    MontaProgressBar(True);

    tsArquivoNovo:= TStringList.Create;

    DM.CDS_C190.EmptyDataSet;
    iRegSoma:=0;

    pgProgBar.Properties.Max:=tsArquivo.Count;
    pgProgBar.Position:=0;

    bC100:=False;
    For i:=0 to tsArquivo.Count-1 do
    Begin
      Application.ProcessMessages;

      If bgParar Then
      Begin
        Break;
      End;

      pgProgBar.Position:=i+1;

      sLinha:=tsArquivo[i];

      sRegAtual:=Trim(Separa_String(sLinha,2,'|'));

      //Odir
//      Label1.Caption:=IntToStr(i+1);
//      Label1.Caption:=Label1.Caption+' - '+sRegAtual;

      If sRegAtual='C100' Then
       Begin
         tsArquivoNovo.Add(tsArquivo[i]);
         bC100:=True;
       End
      Else If (sRegAtual='C190') and (bC100) Then
       Begin
         tsArquivoNovo.Add(tsArquivo[i]);
         bC100:=False;
       End
      Else // If (sRegAtual='C190') and (bC100) Then
       Begin
        bC100:=False;

        // Analisa Registros
        If sRegAtual='C170' Then
         Begin
           If not DM.CDS_C190.Locate('CST_ICMS;CFOP;ALIQ_ICMS',VarArrayOf([Trim(Separa_String(sLinha,11,'|')),
                                                                        Trim(Separa_String(sLinha,12,'|')),
                                                                        Trim(Separa_String(sLinha,15,'|'))]),[]) Then
            Begin
              DM.CDS_C190.Append;
              DM.CDS_C190CST_ICMS.AsString     :=Trim(Separa_String(sLinha,11,'|'));
              DM.CDS_C190CFOP.AsString         :=Trim(Separa_String(sLinha,12,'|'));
              DM.CDS_C190ALIQ_ICMS.AsFloat     :=StrToFloat(Trim(Separa_String(sLinha,15,'|')));
              DM.CDS_C190VL_OPR.AsFloat        :=(StrToFloat(Trim(Separa_String(sLinha,8,'|')))+
                                               StrToFloat(Trim(Separa_String(sLinha,19,'|')))+
                                               StrToFloat(Trim(Separa_String(sLinha,25,'|'))))-
                                              StrToFloat(Trim(Separa_String(sLinha,9,'|')));
              DM.CDS_C190VL_BC_ICMS.AsFloat    :=StrToFloat(Trim(Separa_String(sLinha,14,'|')));
              DM.CDS_C190VL_ICMS.AsFloat       :=StrToFloat(Trim(Separa_String(sLinha,16,'|')));
              DM.CDS_C190VL_BC_ICMS_ST.AsFloat :=StrToFloat(Trim(Separa_String(sLinha,17,'|')));
              DM.CDS_C190VL_ICMS_ST.AsFloat    :=StrToFloat(Trim(Separa_String(sLinha,19,'|')));

              If (StrToFloat(Trim(Separa_String(sLinha,8,'|')))>0) And (StrToFloat(Trim(Separa_String(sLinha,14,'|')))>0) Then
               DM.CDS_C190VL_RED_BC.AsFloat:=ABS(StrToFloat(Trim(Separa_String(sLinha,8,'|')))-
                                                 StrToFloat(Trim(Separa_String(sLinha,14,'|'))))
              Else
               DM.CDS_C190VL_RED_BC.AsFloat:=0;

              DM.CDS_C190VL_IPI.AsFloat:=StrToFloat(Trim(Separa_String(sLinha,25,'|')));
            End
           Else // If not DM.CDS_C190.Locate('CST_ICMS;CFOP;ALIQ_ICMS',VarArrayOf([Trim(Separa_String(sLinha,11,'|')),
            Begin
              DM.CDS_C190.Edit;
              DM.CDS_C190VL_OPR.AsFloat        :=DM.CDS_C190VL_OPR.AsFloat+
                                              (StrToFloat(Trim(Separa_String(sLinha,8,'|')))+
                                               StrToFloat(Trim(Separa_String(sLinha,19,'|')))+
                                               StrToFloat(Trim(Separa_String(sLinha,25,'|'))))-
                                              StrToFloat(Trim(Separa_String(sLinha,9,'|')));
              DM.CDS_C190VL_BC_ICMS.AsFloat    :=DM.CDS_C190VL_BC_ICMS.AsFloat+
                                              StrToFloat(Trim(Separa_String(sLinha,14,'|')));
              DM.CDS_C190VL_ICMS.AsFloat       :=DM.CDS_C190VL_ICMS.AsFloat+
                                              StrToFloat(Trim(Separa_String(sLinha,16,'|')));
              DM.CDS_C190VL_BC_ICMS_ST.AsFloat :=DM.CDS_C190VL_BC_ICMS_ST.AsFloat+
                                              StrToFloat(Trim(Separa_String(sLinha,17,'|')));
              DM.CDS_C190VL_ICMS_ST.AsFloat    :=DM.CDS_C190VL_ICMS_ST.AsFloat+
                                              StrToFloat(Trim(Separa_String(sLinha,19,'|')));

              If (StrToFloat(Trim(Separa_String(sLinha,8,'|')))>0) And (StrToFloat(Trim(Separa_String(sLinha,14,'|')))>0) Then
               DM.CDS_C190VL_RED_BC.AsFloat:=ABS(DM.CDS_C190VL_RED_BC.AsFloat+
                                                 (StrToFloat(Trim(Separa_String(sLinha,8,'|')))-
                                                  StrToFloat(Trim(Separa_String(sLinha,14,'|')))));

              DM.CDS_C190VL_IPI.AsFloat:=DM.CDS_C190VL_IPI.AsFloat+
                                   StrToFloat(Trim(Separa_String(sLinha,25,'|')));
            End; // If not DM.CDS_C190.Locate('CST_ICMS;CFOP;ALIQ_ICMS',VarArrayOf([Trim(Separa_String(sLinha,11,'|')),
            DM.CDS_C190.Post;

           tsArquivoNovo.Add(tsArquivo[i]);
         End
        Else If sRegAtual='C190' Then
         Begin
           iRegSoma:=iRegSoma-1;

           If Not DM.CDS_C190.IsEmpty Then
           Begin
             DM.CDS_C190.First;
             While Not DM.CDS_C190.Eof do
             Begin
               tsArquivoNovo.Add('|C190|'+
                                 DM.CDS_C190CST_ICMS.AsString+'|'+
                                 DM.CDS_C190CFOP.AsString+'|'+
                                 ZerosCentavos(DM.CDS_C190ALIQ_ICMS.AsString,2)+'|'+
                                 ZerosCentavos(DM.CDS_C190VL_OPR.AsString,2)+'|'+
                                 ZerosCentavos(DM.CDS_C190VL_BC_ICMS.AsString,2)+'|'+
                                 ZerosCentavos(DM.CDS_C190VL_ICMS.AsString,2)+'|'+
                                 ZerosCentavos(DM.CDS_C190VL_BC_ICMS_ST.AsString,2)+'|'+
                                 ZerosCentavos(DM.CDS_C190VL_ICMS_ST.AsString,2)+'|'+
                                 ZerosCentavos(DM.CDS_C190VL_RED_BC.AsString,2)+'|'+
                                 ZerosCentavos(DM.CDS_C190VL_IPI.AsString,2)+'||');
               Inc(iRegSoma);

               DM.CDS_C190.Next;
             End; // While Not DM.CDS_C190.Eof do

             DM.CDS_C190.EmptyDataSet;
           End; // If Not DM.CDS_C190.IsEmpty Then

         End
        Else If sRegAtual='C990' Then
         Begin
           //      |C990|2664|
           tsArquivoNovo.Add('|C990|'+(IntToStr(StrToInt(Trim(Separa_String(sLinha,3,'|')))+iRegSoma))+'|');
         End
        Else If sRegAtual='9900' Then
         Begin
           //      |9900|C190|2619|
           If Trim(Separa_String(sLinha,3,'|'))='C190' Then
             tsArquivoNovo.Add('|9900|C190|'+(IntToStr(StrToInt(Trim(Separa_String(sLinha,4,'|')))+iRegSoma))+'|')
           Else
             tsArquivoNovo.Add(tsArquivo[i]);
         End
        Else If sRegAtual='9999' Then
         Begin
           //      |9999|11749|
           tsArquivoNovo.Add('|9999|'+(IntToStr(StrToInt(Trim(Separa_String(sLinha,3,'|')))+iRegSoma))+'|');
         End
        Else
         Begin
           tsArquivoNovo.Add(tsArquivo[i]);
         End;
      End; // If sRegAtual='C100' Then
    End; // For i:=0 to tsArquivo.Count-1 do
    MontaProgressBar(False);
    Screen.Cursor:=crDefault;

    //==========================================================================
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//    Pan_OBS.Caption:='AGUARDE !! Fase 09/09 - Reorganizando Estrutura do Arquivo SpedFiscal (Regsitro C170)...';
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    DBGrid6.Refresh;
    Panel1.Refresh;
    FrmSpedFiscalAcerta.Refresh;

//==============================================================================
// FIM DO PROCESSAMENTO ========================================================
//==============================================================================

    hHrFim.Caption   :=TimeToStr(DataHoraServidorFI(DM.SDS_DtaHoraServidor));
    hHrTotal.Caption :=TimeToStr(StrToTime(hHrFim.Caption)-StrToTime(hHrInicio.Caption));

    If Not bgParar Then
    Begin
      // Salvar Arquivo Novo ===================================================
      sArq  :=ExtractName(EdtPastaArquivo.Text);
      sExt  :=ExtractFileExt(EdtPastaArquivo.Text);
      sPasta:=ExtractFilePath(EdtPastaArquivo.Text);

      sArq:=sArq+'_Novo'+sExt;

      tsArquivoNovo.SaveToFile(IncludeTrailingPathDelimiter(sPasta)+sArq);

      MessageBox(Handle, pChar('NOVO ARQUIVO GERADO:'+cr+cr+'PASTA: '+IncludeTrailingPathDelimiter(sPasta)+cr+cr+'ARQUIVO: '+sArq), 'ATENÇÃO !!', MB_ICONERROR);
      Bt_CorrigeArquivo.Enabled:=False;
      EdtPastaArquivo.Clear;

      MontaProgressBar(False);
      Screen.Cursor:=crDefault;
    End;

  Finally // Try
    MontaProgressBar(False);
    FreeAndNil(tsArquivo);
    FreeAndNil(tsArquivoNovo);
  End; // Try

  FechaTudo;

  Pan_ST.Visible:=False;
  Pan_Diversos.Visible:=False;

  Pan_OBS.Visible:=False;

  If pgProgBar<>nil Then
  Begin
    FreeAndNil(pgProgBar);
  End;

  MontaProgressBar(False);
//  StBar.Panels[0].Text:='';

  If tsArquivo<>nil Then
   FreeAndNil(tsArquivo);

  If tsArquivoNovo<>nil Then
   FreeAndNil(tsArquivoNovo);

  If bgParar Then
   msg('Correção Encerrada pelo Usuário ...','A');

end;

procedure TFrmSpedFiscalAcerta.ACBrIBGE1BuscaEfetuada(Sender: TObject);
var
   i : Integer;
begin
   sgUFDest:='RS';
   for i:=0 to ACBrIBGE1.Cidades.Count-1 do
   begin
     sgUFDest:=ACBrIBGE1.Cidades[i].UF;
   end;
end;

procedure TFrmSpedFiscalAcerta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FechaTudo;
end;

procedure TFrmSpedFiscalAcerta.FormCreate(Sender: TObject);
Var
  i: Integer;
begin
  sgPastaExe:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));

  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

  bgParar:=False;

  i:=FileAge(sgPastaExe+ExtractFileName(Application.ExeName));

  FrmSpedFiscalAcerta.Caption:=FrmSpedFiscalAcerta.Caption+' - '+DateTimeToStr(FileDateToDateTime(i));

end;

procedure TFrmSpedFiscalAcerta.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmSpedFiscalAcerta.Bt_PararClick(Sender: TObject);
begin
  EdtPastaArquivo.SetFocus;
  bgParar:=True;
end;

procedure TFrmSpedFiscalAcerta.FormShow(Sender: TObject);
begin
  Pan_ST.Visible:=False;
  Pan_Diversos.Visible:=False;

  // ClientDataSet Virtual de Participantes e Codigo Municipio IBGE ============
  DM.CDS_Pessoas.CreateDataSet;

  // ClientDataSet Virtual de Produtos Participantes ===========================
  DM.CDS_Prod.CreateDataSet;

  // ClientDataSet Virtual de Natureza da Operação =============================
  DM.CDS_NatOperacao.CreateDataSet;

  // ClientDataSet Virtual de Municipios IBGE ==================================
  DM.CDS_IBGE_UF.CreateDataSet;

//  // ClientDataSet Virtual de CFOP dos Produtos ================================
//  DM.CDS_CFopProd.CreateDataSet;

  // ClientDataSet Virtual de Registro C190 ====================================
  DM.CDS_C190.CreateDataSet;

  // ClientDataSet Virtual de Acerta ST (Serie=DES) ============================
  DM.CDS_ST.CreateDataSet;

  // ClientDataSet Virtual de Acerta ST (Serie=DES) ============================
  DM.CDS_Nota_ST_Errada.CreateDataSet;

  // ClientDataSet Virtual de CFops para Acertar CFops Zerados =================
  DM.CDS_CFopZerados.CreateDataSet;

end;

end.

