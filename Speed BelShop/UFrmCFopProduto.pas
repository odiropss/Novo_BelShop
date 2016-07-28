unit UFrmCFopProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvXPCore, JvXPButtons, ExtCtrls, StdCtrls;

type
  TFrmCFopProduto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Bt_OK: TJvXPButton;
    GroupBox1: TGroupBox;
    EdtDesNatOper: TEdit;
    GroupBox2: TGroupBox;
    EdtCST_ICMS: TEdit;
    GroupBox3: TGroupBox;
    EdtCST_IPI: TEdit;
    GroupBox4: TGroupBox;
    EdtCST_PIS: TEdit;
    GroupBox5: TGroupBox;
    EdtCST_COFINS: TEdit;
    GroupBox6: TGroupBox;
    EdtCFop: TEdit;
    EdtCodNatOper: TEdit;
    Label1: TLabel;
    EdtUFEmit: TEdit;
    Label2: TLabel;
    EdtUFDest: TEdit;
    Label3: TLabel;
    GroupBox7: TGroupBox;
    EdtRegistro: TEdit;
    GroupBox8: TGroupBox;
    EdtDesOper: TEdit;
    EdtCodOper: TEdit;
    GroupBox9: TGroupBox;
    Memo1: TMemo;
    GroupBox10: TGroupBox;
    EdtCFopDocto: TEdit;
    GroupBox11: TGroupBox;
    EdtInd_SubTrib: TEdit;
    procedure Bt_OKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure EdtCFopKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCFopProduto: TFrmCFopProduto;

  bProcessa: Boolean;
  bgSair: Boolean;

implementation

uses DK_Procs1, uj_001, uj_002, USpedFiscalAcerta, UDM;

{$R *.dfm}

procedure TFrmCFopProduto.Bt_OKClick(Sender: TObject);
Var
  wIniCFop: Word;
begin

  if StrToIntDef(EdtCFop.Text,0)=0 Then
  Begin
    msg('CFOP Inválido !!','A');
    EdtCFop.SetFocus;
    Exit;
  end;

  wIniCFop:=StrToInt(Copy(EdtCFop.Text,1,1));
  if ((Char(wIniCFop) in ['1'..'3']) And (EdtCodOper.Text='1')) Or
     ((Char(wIniCFop) in ['5'..'7']) And (EdtCodOper.Text='0')) Then
  Begin
    msg('CFOP Inválido !!'+cr+cr+'Leia a Observação !!','A');
    EdtCFop.SetFocus;
    Exit;
  end;

  DM.CDS_CFopZerados.Insert;
  DM.CDS_CFopZeradosCOD_NAT.AsString :=EdtCodNatOper.Text;
  DM.CDS_CFopZeradosCOD_OPER.AsString:=EdtCodOper.Text; // Entrada/Saida
  DM.CDS_CFopZeradosCST_ICMS.AsString     :=EdtCST_ICMS.Text;

  If (Char(wIniCFop) in ['1'..'3']) and (StrToInt(EdtCST_IPI.Text)>=50) Then
   Begin
     DM.CDS_CFopZeradosCST_IPI.AsString   :=FormatFloat('000',StrToInt(EdtCST_IPI.Text)-50);
   End
  Else If (Char(wIniCFop) in ['5'..'7']) and (StrToInt(EdtCST_IPI.Text)<50) Then
   Begin
     DM.CDS_CFopZeradosCST_IPI.AsString   :=FormatFloat('000',StrToInt(EdtCST_IPI.Text)+50);
   End
  Else
   Begin
     DM.CDS_CFopZeradosCST_IPI.AsString   :=EdtCST_IPI.Text;
   End;

  DM.CDS_CFopZeradosCST_PIS.AsString      :=EdtCST_PIS.Text;
  DM.CDS_CFopZeradosCST_COFINS.AsString   :=EdtCST_COFINS.Text;

  If Trim(EdtUFEmit.Text) <> Trim(EdtUFDest.Text) Then
   DM.CDS_CFopZeradosOPER_ESTADO.AsString:='NAO'
  Else
   DM.CDS_CFopZeradosOPER_ESTADO.AsString:='SIM';

  DM.CDS_CFopZeradosIND_ST.AsString       :=EdtInd_SubTrib.Text;
  DM.CDS_CFopZeradosCFOP.AsString         :=EdtCFop.Text;

  DM.CDS_CFopZerados.Post;

  bgSair:=True;
  Close;
end;

procedure TFrmCFopProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if bgSair Then
   Begin
     Action := caFree;

   End
  Else
   Begin
     msg('Para Fechar Tecle no Botão <OK>...','A');
     Action := caNone;
   End;

end;

procedure TFrmCFopProduto.FormShow(Sender: TObject);
begin
  bgSair:=False;

end;

procedure TFrmCFopProduto.EdtCFopKeyPress(Sender: TObject; var Key: Char);
begin
  If not (key in ['0'..'9']) then
  Begin
    Key := #0;
    Exit;
  End;

end;

procedure TFrmCFopProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

end.


