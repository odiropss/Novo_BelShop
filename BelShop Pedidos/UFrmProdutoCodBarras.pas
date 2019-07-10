unit UFrmProdutoCodBarras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, JvExControls, JvXPCore, JvXPButtons, JvExStdCtrls,
  JvEdit, StdCtrls, Mask, ToolEdit, CurrEdit, MMSystem, DBXpress,
  JvCheckBox;

type
  TFrmProdutoCodBarras = class(TForm)
    Label2: TLabel;
    EdtCodBarras: TJvEdit;
    Bt_Processar: TJvXPButton;
    Panel1: TPanel;
    Bt_Retornar: TJvXPButton;
    Ckb_Referencia: TJvCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_RetornarClick(Sender: TObject);
    procedure EdtCodBarrasChange(Sender: TObject);
    procedure EdtCodBarrasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Bt_ProcessarClick(Sender: TObject);

    // ODIR - INICO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    Function BuscaProdutoLinx(sCodBarras: String): Boolean;

    // ODIR - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    procedure Ckb_ReferenciaClick(Sender: TObject);
    procedure Ckb_ReferenciaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
    bgCheckOutSimples: Boolean;
    sgNumNFe, sgProdLinx: String;
  end;

var
  FrmProdutoCodBarras: TFrmProdutoCodBarras;

  // Cria Ponteiro de Transacão
  TD: TTransactionDesc;

implementation

uses UDMBelShopPedidos, DK_Procs1, DB, UFrmBelShopPedidos;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - INICO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Produto pelo Codigo de Barras >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmProdutoCodBarras.BuscaProdutoLinx(sCodBarras: String): Boolean;
Var
  MySql: String;
Begin
  Result:=False;

  //============================================================================
  // Busca Produto Linx pelo Codigo de Barras ==================================
  //============================================================================
  If Not Ckb_Referencia.Checked Then
  Begin
    MySql:=' SELECT pr.cod_produto'+
           ' FROM LINXPRODUTOS pr'+
           ' WHERE pr.cod_barra='+QuotedStr(sCodBarras)+

           ' UNION'+

           ' SELECT cb.cod_produto'+
           ' FROM LINXPRODUTOSCODBAR cb'+
           ' WHERE cb.cod_barra='+QuotedStr(sCodBarras);
    DMBelShopPedidos.CDS_BuscaRapida.Close;
    DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Clear;
    DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Add(MySql);
    DMBelShopPedidos.CDS_BuscaRapida.Open;
    sgProdLinx:=Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Cod_Produto').AsString);
    DMBelShopPedidos.CDS_BuscaRapida.Close;
  End; // If Not Ckb_Referencia.Checked Then
  // Busca Produto Linx pelo Codigo de Barras ==================================
  //============================================================================

  //============================================================================
  // Busca Produto Linx pelo Codigo de Referencia ==============================
  //============================================================================
  If Ckb_Referencia.Checked Then
  Begin
    MySql:=' SELECT p.cod_produto'+
           ' FROM LINXPRODUTOS p'+
           ' WHERE p.cod_fornecedor='+IntToStr(FrmBelShopPedidos.EdtNFeCodFornLinx.AsInteger)+
           ' AND   TRIM(UPPER(p.referencia))='+QuotedStr(sCodBarras);
    DMBelShopPedidos.CDS_BuscaRapida.Close;
    DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Clear;
    DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Add(MySql);
    DMBelShopPedidos.CDS_BuscaRapida.Open;
    sgProdLinx:=Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Cod_Produto').AsString);
    DMBelShopPedidos.CDS_BuscaRapida.Close;
  End; // If Ckb_Referencia.Checked Then
  // Busca Produto Linx pelo Codigo de Referencia ==============================
  //============================================================================

  If Trim(sgProdLinx)<>'' Then
   Result:=True;
End; // Busca Produto pelo Codigo de Barras >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmProdutoCodBarras.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

end;

procedure TFrmProdutoCodBarras.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmProdutoCodBarras.Bt_RetornarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmProdutoCodBarras.EdtCodBarrasChange(Sender: TObject);
begin
  If Not Ckb_Referencia.Checked Then
  Begin
    If Length(EdtCodBarras.Text)=13 Then
     Bt_ProcessarClick(Self);
  End; // If Not Ckb_Referencia.Checked Then

end;

procedure TFrmProdutoCodBarras.EdtCodBarrasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If (key=Vk_Return) And (StrToInt64Def(EdtCodBarras.Text,0)<>0) Then
   Bt_ProcessarClick(Self);

end;

procedure TFrmProdutoCodBarras.Bt_ProcessarClick(Sender: TObject);
Var
  bSiga: Boolean;
begin
  //============================================================================
  // Leitora de Codigo de Barras SIMPLES =======================================
  //============================================================================
  Screen.Cursor:=crAppStart;

  If StrToInt64Def(EdtCodBarras.Text,0)<>0 Then
   Begin
     // Busca Produtos =======================================================
     If Not BuscaProdutoLinx(EdtCodBarras.Text) Then
     Begin
       Screen.Cursor:=crDefault;

       PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
       msg('Não Foi Encontrado Produto com'+cr+'Código de Barras Informado !!','A');
       EdtCodBarras.SetFocus;
     End;
   End
  Else // If StrToInt64Def(EdtCodBarras.Text,0)<>0 Then
   Begin
     msg('Código de Barras Inválido !!','A');
   End; // If StrToInt64Def(EdtCodBarras.Text,0)<>0 Then
    // Busca Pelo Codigo de referencia =========================================
    //==========================================================================

  Screen.Cursor:=crDefault;
  Close;
  // Leitora de Codigo de Barras SIMPLES =======================================
  //============================================================================

end;

procedure TFrmProdutoCodBarras.Ckb_ReferenciaClick(Sender: TObject);
begin
  AcertaCkb_Style(Ckb_Referencia);
  EdtCodBarras.SetFocus;
end;

procedure TFrmProdutoCodBarras.Ckb_ReferenciaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_ReferenciaClick(Self);
end;

end.
