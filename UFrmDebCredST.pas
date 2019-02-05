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
  dxStatusBar;

type
  TFrmDebCredST = class(TForm)
    CorCaptionForm: TJvGradientCaption;
    ApplicationEvents1: TApplicationEvents;
    Panel3: TPanel;
    Bt_Sair: TJvXPButton;
    Bt_VlrBcICMSST: TJvXPButton;
    Bt_Clipboard: TJvXPButton;
    Bt_ProdutosForn: TJvXPButton;
    Bt_TotaisForn: TJvXPButton;
    Panel1: TPanel;
    PC_DebCredICMSST: TPageControl;
    Ts_FornBcICMSST: TTabSheet;
    Ts_FornTotais: TTabSheet;
    Ts_FornProdutos: TTabSheet;
    Dbg_TotaisForn: TDBGrid;
    Dbg_ProdutosForn: TDBGrid;
    OdirPanApres: TPanel;
    Gb_Periodo: TGroupBox;
    Label85: TLabel;
    DtEdtDtaInicio: TcxDateEdit;
    DtEdtDtaFim: TcxDateEdit;
    Dbg_VlrBcICMSST: TDBGrid;
    dxStatusBar2: TdxStatusBar;
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

    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    Procedure TabSheetLibera(sNomeTab: String);

    Function  PeriodoApropriacao: Boolean;

    Procedure SqlProdutos;
    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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

uses DK_Procs1, UDMDebCredST, UFrmBelShop;

{$R *.dfm}
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Monta Sql de Produtos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmDebCredST.SqlProdutos;
Var
  MySql: WideString;
  sForns: String;

  i: Integer;
Begin
  OdirPanApres.Caption:='AGUARDE !! Localizando Produtos/Fornecedores...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmDebCredST.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmDebCredST.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmDebCredST;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  sForns:='';
  For i:=0 to mMemoForn.Lines.Count-1 do
  Begin
    If sForns<>'' Then
     sForns:=sForns+', '+mMemoForn.Lines[i];

    If sForns='' Then
     sForns:=mMemoForn.Lines[i];

  End; // For i:=0 to mMemo.Lines.Count-1 do

  // 03 - PRODUTOS DE FORNECEDOR (POR FORNECEDOR SE SELECIONADO)
  // ------ Cabeçalho
  MySql:=' SELECT'+
         ' NULL COD_PRODUTO,'+
         ' ''CRÉDITO / DÉBITO ST - PRODUTOS'' NOME_PRODUTO,'+
         ' NULL VLR_CRETIDO_ICMS_ST,'+
         ' NULL VLR_DEBITO_ICMS_ST,'+
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
         ' NULL VLR_CRETIDO_ICMS_ST,'+
         ' NULL VLR_DEBITO_ICMS_ST,'+
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
         ' NULL VLR_CRETIDO_ICMS_ST,'+
         ' NULL VLR_DEBITO_ICMS_ST,'+
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
         ' SUM(dc.vlr_cretido_icms_st) VLR_CRETIDO_ICMS_ST,'+
         ' SUM(dc.vlr_debito_icms_st) VLR_DEBITO_ICMS_ST,'+
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
         ' WHERE dc.data_lancamento BETWEEN '+QuotedStr(sgDtaInicio)+' AND '+QuotedStr(sgDtaFim);

         If sForns<>'' Then
          MySql:=
           MySql+' AND   dc.cod_fornecedor IN ('+sForns+')';

  MySql:=
   MySql+' UNION ALL'+

         // ------ Resultado Crédito - Débito
         ' SELECT'+
         ' NULL COD_PRODUTO,'+
         ' ''RESULTADO: CRÉDITO / DÉBITO'' NOME_PRODUTO,'+
         ' (SUM(dc.vlr_cretido_icms_st) - SUM(dc.vlr_debito_icms_st)) VLR_CRETIDO_ICMS_ST,'+
         ' NULL VLR_DEBITO_ICMS_ST,'+
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
         ' 4 ORDEM'+

         ' FROM DEB_CRED_ICMS_ST dc'+
         ' WHERE dc.data_lancamento BETWEEN '+QuotedStr(sgDtaInicio)+' AND '+QuotedStr(sgDtaFim);

         If sForns<>'' Then
          MySql:=
           MySql+' AND   dc.cod_fornecedor IN ('+sForns+')';

  MySql:=
   MySql+' UNION ALL'+

         // ------ Linha em Branco
         ' SELECT'+
         ' NULL COD_PRODUTO,'+
         ' NULL NOME_PRODUTO,'+
         ' NULL VLR_CRETIDO_ICMS_ST,'+
         ' NULL VLR_DEBITO_ICMS_ST,'+
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
         ' dc.vlr_cretido_icms_st,'+
         ' dc.vlr_debito_icms_st,'+
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
         ' AND   dc.data_lancamento BETWEEN '+QuotedStr(sgDtaInicio)+' AND '+QuotedStr(sgDtaFim);


         If sForns<>'' Then
          MySql:=
           MySql+' AND   dc.cod_fornecedor IN ('+sForns+')';

  MySql:=
   MySql+' ORDER BY 27,2';
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

end;

procedure TFrmDebCredST.ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
var
  Sentido: SmallInt;
begin
  // primeiramente verificamos se é o evento a ser tratado...
  If Msg.message = WM_MOUSEWHEEL then
  Begin
//    If ActiveControl is TDBGrid then // If Somente DBGRID *** Testa se Classe é TDBGRID
//    Begin
      Msg.message := WM_KEYDOWN;
      Msg.lParam := 0;
      Sentido := HiWord(Msg.wParam);
      if Sentido > 0 then
       Msg.wParam := VK_UP
      else
       Msg.wParam := VK_DOWN;
//    End; // If ActiveControl is TDBGrid then // If Somente DBGRID *** Testa se Classe é TDBGRID
  End; // if Msg.message = WM_MOUSEWHEEL then
end;

procedure TFrmDebCredST.Bt_SairClick(Sender: TObject);
begin
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

    mMemoForn.Lines.Clear;

    DMDebCredST.CDS_TotaisForn.Close;
    DMDebCredST.SQLQ_TotaisForn.Params.ParamByName('Dta1').Value:=sgDtaInicio;
    DMDebCredST.SQLQ_TotaisForn.Params.ParamByName('Dta2').Value:=sgDtaFim;
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
  If (f_Troca('.','/',sgDtaInicio)<>DtEdtDtaInicio.Text) Or (f_Troca('.','/',sgDtaFim)<>DtEdtDtaFim.Text) Then
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
  CorSelecaoTabSheet(PC_DebCredICMSST);

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
   uSADO EM:
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
        End;

        If (Trim(sgDtaInicio)<>'') Then
        Begin
          If (f_Troca('.','/',sgDtaInicio)<>DtEdtDtaInicio.Text) Or (f_Troca('.','/',sgDtaFim)<>DtEdtDtaFim.Text) Then
          Begin
            mMemoForn.Lines.Clear;
            DMDebCredST.CDS_TotaisForn.Close;
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
        End;

        If (Trim(sgDtaFim)<>'') Then
        Begin
          If (f_Troca('.','/',sgDtaInicio)<>DtEdtDtaInicio.Text) Or (f_Troca('.','/',sgDtaFim)<>DtEdtDtaFim.Text) Then
          Begin
            mMemoForn.Lines.Clear;
            DMDebCredST.CDS_TotaisForn.Close;
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
    DMDebCredST.CDS_TotaisFornTOT_CRETIDO_ICMS_ST.Alignment :=taRightJustify;
    DMDebCredST.CDS_TotaisFornTOT_DEBITO_ICMS_ST.Alignment  :=taRightJustify;
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

    DMDebCredST.CDS_ProdutoFornCOD_PRODUTO.Alignment        :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornVLR_CRETIDO_ICMS_ST.Alignment:=taRightJustify;
    DMDebCredST.CDS_ProdutoFornVLR_DEBITO_ICMS_ST.Alignment :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornDATA_DOCUMENTO.Alignment     :=taCenter;
    DMDebCredST.CDS_ProdutoFornDATA_LANCAMENTO.Alignment    :=taCenter;
    DMDebCredST.CDS_ProdutoFornDOCUMENTO.Alignment          :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornSERIE.Alignment              :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornMODELO_NF.Alignment          :=taCenter;
    DMDebCredST.CDS_ProdutoFornID_CFOP.Alignment            :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornCST_ICMS.Alignment           :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornPER_ALIQ_ICMS.Alignment      :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornVLR_ICMS.Alignment           :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornPER_ALIQ_ICMS_ST.Alignment   :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornVLR_ICMS_ST.Alignment        :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornVLR_BASE_ICMS_ST.Alignment   :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornVLR_OPERACAO.Alignment       :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornMODALIDADE.Alignment         :=taCenter;
    DMDebCredST.CDS_ProdutoFornTIPO.Alignment               :=taCenter;
    DMDebCredST.CDS_ProdutoFornDES_NCM.Alignment            :=taCenter;
    DMDebCredST.CDS_ProdutoFornPER_ICMS.Alignment           :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornPER_FCP.Alignment            :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornPER_ICMS_EFETIVO.Alignment   :=taRightJustify;
    DMDebCredST.CDS_ProdutoFornCOD_FORNECEDOR.Alignment     :=taRightJustify;
  End; // If Not DMDebCredST.CDS_ProdutoForn.IsEmpty Then

end;

procedure TFrmDebCredST.Bt_ClipboardClick(Sender: TObject);
begin
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

end.

