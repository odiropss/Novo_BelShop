unit UFrmLeitoraCodBarras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, JvExControls, JvXPCore, JvXPButtons, JvExStdCtrls,
  JvEdit, StdCtrls, Mask, ToolEdit, CurrEdit;

type
  TFrmLeitoraCodBarras = class(TForm)
    Label1: TLabel;
    EdtQtdEmbalagem: TCurrencyEdit;
    Label2: TLabel;
    EdtCodBarras: TJvEdit;
    Bt_Processar: TJvXPButton;
    Panel1: TPanel;
    Bt_Retornar: TJvXPButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_RetornarClick(Sender: TObject);
    procedure EdtQtdEmbalagemEnter(Sender: TObject);
    procedure EdtQtdEmbalagemExit(Sender: TObject);
    procedure EdtCodBarrasChange(Sender: TObject);
    procedure EdtCodBarrasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_ProcessarClick(Sender: TObject);

    // ODIR - INICO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    Function BuscaProdutoLinx(sCodBarras: String): Boolean;
    Function CheckProcessa: Boolean;

    // ODIR - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  private
    { Private declarations }
  public
    { Public declarations }
    bgCheckOutSimples: Boolean;
  end;

var
  FrmLeitoraCodBarras: TFrmLeitoraCodBarras;

  sgProdLinx: String;

implementation

uses UDMSolicTransf;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - INICO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Processa Scaneamento do Produto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmLeitoraCodBarras.CheckProcessa: Boolean;
Begin
End; // Processa Scaneamento do Produto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Produto pelo Codigo de Barras >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmLeitoraCodBarras.BuscaProdutoLinx(sCodBarras: String): Boolean;
Var
  MySql: String;
Begin
  Result:=False;

  // Busca Produto Linx ========================================================
  MySql:=' SELECT pr.cod_produto'+
         ' FROM LINXPRODUTOS pr'+
         ' WHERE pr.cod_barra='+sCodBarras+

         'UNION'+

         ' SELECT cb.cod_produto'+
         ' FROM LINXPRODUTOSCODBAR cb'+
         ' WHERE cb.cod_barra='+sCodBarras;
  DMSolicTransf.CDS_BuscaRapida.Close;
  DMSolicTransf.SDS_BuscaRapida.CommandText:=MySql;
  DMSolicTransf.CDS_BuscaRapida.Open;
  sgProdLinx:=Trim(DMSolicTransf.CDS_BuscaRapida.FieldByName('Cod_Produto').AsString);
  DMSolicTransf.CDS_BuscaRapida.Close;

  If Trim(sgCodProdLinx)<>'' Then
   Result:=True;

End; // Busca Produto pelo Codigo de Barras >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmLeitoraCodBarras.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

end;

procedure TFrmLeitoraCodBarras.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmLeitoraCodBarras.Bt_RetornarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLeitoraCodBarras.EdtQtdEmbalagemEnter(Sender: TObject);
begin
  EdtCodBarras.Text:='0';

end;

procedure TFrmLeitoraCodBarras.EdtQtdEmbalagemExit(Sender: TObject);
begin
  EdtCodBarras.SetFocus;

end;

procedure TFrmLeitoraCodBarras.EdtCodBarrasChange(Sender: TObject);
begin
  If Length(EdtCodBarras.Text)=13 Then
   Bt_ProcessarClick(Self);

end;

procedure TFrmLeitoraCodBarras.EdtCodBarrasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If (key=Vk_Return) And (StrToInt64Def(EdtCodBarras.Text,0)<>0) Then
   Bt_ProcessarClick(Self);

end;

procedure TFrmLeitoraCodBarras.Bt_ProcessarClick(Sender: TObject);
Var
  MySql: String;
begin
  //============================================================================
  // Leitora de Codigo de Barras SIMPLE ========================================
  //============================================================================
  If bgCheckOutSimples Then
  Begin
    If StrToInt64Def(EdtCodBarras.Text,0)<>0 Then
     Begin
       Screen.Cursor:=crAppStart;

       // Busca Produtos =======================================================
       If Not BuscaProdutoLinx(EdtCodBarras.Text) Then
       Begin
         Screen.Cursor:=crDefault;

         PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
         msg('Não Foi Encontrado Produto com'+cr+cr+'Código de Barras'+cr+'Informado !!','A');
         EdtCodBarras.SetFocus;
         Exit;
       End;

       // Processa Scaneamento do Produto ======================================
       CheckProcessa;
     End
    Else // If StrToInt64Def(EdtCodBarras.Text,0)<>0 Then
     Begin
       msg('Código de Barras Inválido !!','A');
       Screen.Cursor:=crDefault;
       EdtQtdEmbalagem.AsInteger:=1;
       EdtCodBarras.Text:='0';
       EdtQtdEmbalagem.SetFocus;
       SelectNext(ActiveControl,True,True);
     End; // If StrToInt64Def(EdtCodBarras.Text,0)<>0 Then
  End; // If bgCheckOutSimples Then
  // Leitora de Codigo de Barras SIMPLE ========================================
  //============================================================================

end;

end.
