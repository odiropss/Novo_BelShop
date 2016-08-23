unit UAcertaContEstoques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBDatabase, DB, StdCtrls, JvExControls, JvXPCore, JvXPButtons,
  ExtCtrls, Mask, ToolEdit, CurrEdit, IBCustomDataSet, IBQuery;

type
  TFrmAcertaContEstoques = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Bt_BuscaBanco: TJvXPButton;
    EdtBanco: TEdit;
    IBDB: TIBDatabase;
    IBT: TIBTransaction;
    OpenDialog1: TOpenDialog;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Bt_Conectar: TJvXPButton;
    GroupBox4: TGroupBox;
    EdtPedido: TCurrencyEdit;
    EdtLojaDest: TCurrencyEdit;
    Bt_Acertar: TJvXPButton;
    IBQ1: TIBQuery;
    IBQ2: TIBQuery;
    IBQ_Exec: TIBQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Lb_Total: TLabel;
    lb_Atualizados: TLabel;
    lb_NaoAtualizados: TLabel;
    GroupBox5: TGroupBox;
    EdtLojaOrig: TCurrencyEdit;
    Label4: TLabel;
    lb_Processados: TLabel;
    procedure Bt_BuscaBancoClick(Sender: TObject);
    procedure Bt_ConectarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Bt_AcertarClick(Sender: TObject);


    Procedure Zera;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAcertaContEstoques: TFrmAcertaContEstoques;

implementation

{$R *.dfm}

Procedure TFrmAcertaContEstoques.Zera;
Begin
 lb_Atualizados.Caption:='0';
 lb_NaoAtualizados.Caption:='0';
 Lb_Total.Caption:='0';
 lb_Processados.Caption:='0';
end;

procedure TFrmAcertaContEstoques.Bt_BuscaBancoClick(Sender: TObject);
begin
  EdtBanco.SetFocus;
  Zera;

  IBDB.Connected:=False;

  with OpenDialog1 do
  begin
    Options := [ofPathMustExist, ofHideReadOnly, ofOverwritePrompt]; // ofAllowMultiSelect
    DefaultExt := 'FDB';
    Filter := 'Banco de Dados (*.fdb)|*.FDB';
    FilterIndex := 1;
    Title := 'Localiza Banco de Dados SIDICOM';
  End;

  if OpenDialog1.Execute then
   Begin
     EdtBanco.Text:=OpenDialog1.FileName;
     SelectNext(ActiveControl,True,True);
   End
  else // if OpenDialog1.Execute then
   begin
     EdtBanco.SetFocus;
     Exit;
   end; // if OpenDialog1.Execute then
end;

procedure TFrmAcertaContEstoques.Bt_ConectarClick(Sender: TObject);
begin
  Zera;
  EdtPedido.SetFocus;

  Bt_Acertar.Enabled:=False;
  If Trim(EdtBanco.Text)='' Then
  Begin
    ShowMessage('Banco de Dados Não Encontrado !!');
    EdtBanco.SetFocus;
    Exit;
  End;

  IBDB.DatabaseName:='\\LOCALHOST\'+EdtBanco.Text;

  Try
    IBDB.Connected:=True;
  Except
    IBDB.Connected:=False;
    ShowMessage('Banco de Dados Não Conectado !!');
    Bt_BuscaBanco.SetFocus;
    Exit;
  End;

  ShowMessage('Banco de Dados CONECTADO !!');
  Bt_Acertar.Enabled:=True;
  EdtPedido.SetFocus;

end;

procedure TFrmAcertaContEstoques.FormCreate(Sender: TObject);
begin
  // Não Permite Movimentar o Formulário =======================================
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

  Zera;

end;

procedure TFrmAcertaContEstoques.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IBDB.Connected:=False;

end;

procedure TFrmAcertaContEstoques.Bt_AcertarClick(Sender: TObject);
Var
  MySql, MySqlEst: String;

  //============================================================================
  // Gera Controle de Estoque no CD ============================================
  //============================================================================
  Procedure GeraEstoqueCD;
  Begin
    MySqlEst:=' INSERT INTO ESTOQUE (CODFILIAL, CODPRODUTO, CORREDOR, PRATELEIRA,'+
              ' GAVETA, SALDOATUAL, PEDIDOPENDENTE, COMPRAPENDENTE, DATACOMPRA,'+
              ' DATAVENDA, CUSMEDVALOR, CUSMEDITENS, CUSTOMEDIO, LASTPRECOCOMPRA,'+
              ' ESTOQUEIDEAL, ROTACAO, ROTACAOCONTA, ROTACAOATUAL, ROTACAO1, ROTACAO2,'+
              ' ROTACAO3, ROTACAO4, ROTACAO5, ROTACAO6, DM_DEMANDAREAL, DM_DEMANDA,'+
              ' DM_FALTA, DM_DIASDEESTOQUE, LASTCUSTOMEDIO, ZONAENDERECO, PECASSALDOATUAL,'+
              ' PECASPEDIDOPENDENTE, PECASCOMPRAPENDENTE, LASTPRECOCOMPRA_SEMIMP,'+
              ' DATAALTERACADASTRO, DATAALTERAESTOQUE, DATAALTERAESTOQUE_PED, ESTOQUEMAXIMO)'+

              ' VALUES('+
              QuotedStr(FormatFloat('00',StrToInt(EdtLojaDest.text)))+', '+ // CODFILIAL
              QuotedStr(IBQ1.FieldByName('codproduto').AsString)+', '+ // CODPRODUTO
              QuotedStr('000')+', '+ // CORREDOR
              QuotedStr('000')+', '+ // PRATELEIRA
              QuotedStr('0000')+', '+ // GAVETA
              '0.0000, '+ // SALDOATUAL
              '0.0000, '+ // PEDIDOPENDENTE
              '0.0000, '+ // COMPRAPENDENTE
              'current_date, '+ // DATACOMPRA
              'current_date, '+ // DATAVENDA
              '0.00, '+ // CUSMEDVALOR
              '0.00, '+ // CUSMEDITENS
              '0.0000, '+ // CUSTOMEDIO
              'null, '+ // LASTPRECOCOMPRA
              '3.0000, '+ // ESTOQUEIDEAL
              '30, '+ // ROTACAO
              '1, '+ // ROTACAOCONTA
              '0.0000, '+ // ROTACAOATUAL
              '0.0000, '+ // ROTACAO1
              '0.0000, '+ // ROTACAO2
              '0.0000, '+ // ROTACAO3
              '0.0000, '+ // ROTACAO4
              '0.0000, '+ // ROTACAO5
              '0.0000, '+ // ROTACAO6
              '0.0000, '+ // DM_DEMANDAREAL
              '1.0000, '+ // DM_DEMANDA
              '1.0000, '+ // DM_FALTA
              '0, '+ // DM_DIASDEESTOQUE
              '0.0000, '+ // LASTCUSTOMEDIO
              '0, '+ // ZONAENDERECO
              '0, '+ // PECASSALDOATUAL
              '0, '+ // PECASPEDIDOPENDENTE
              '0, '+ // PECASCOMPRAPENDENTE
              'null, '+ // LASTPRECOCOMPRA_SEMIMP
              'current_timestamp, '+ // DATAALTERACADASTRO
              'null, '+ // DATAALTERAESTOQUE
              'null, '+ // DATAALTERAESTOQUE_PED
              '999999.0000 '+ // ESTOQUEMAXIMO
              ')';
    IBQ_Exec.Close;
    IBQ_Exec.SQL.Clear;
    IBQ_Exec.SQL.Add(MySqlEst);
    IBQ_Exec.ExecSQL;
  End;

begin
  EdtPedido.SetFocus;
  Zera;

  If (Trim(EdtPedido.Text)='') Or (EdtPedido.Value=0) Then
  Begin
    ShowMessage('Número do Pedido é Inválido !!');
    EdtPedido.SetFocus;
    Exit;
  End;

  If (Trim(EdtLojaOrig.Text)='') Or (EdtLojaOrig.Value=0) Then
  Begin
    ShowMessage('Número da Loja Origem é Inválido !!');
    EdtLojaOrig.SetFocus;
    Exit;
  End;

  If (Trim(EdtLojaDest.Text)='') Or (EdtLojaDest.Value=0) Then
  Begin
    ShowMessage('Número da Loja Destino é Inválido !!');
    EdtLojaDest.SetFocus;
    Exit;
  End;

  If IBT.Active Then
   IBT.Rollback;

  IBT.StartTransaction;

  MySql:=' select i.codproduto'+
         ' from Pedido p, pedidoit i'+
         ' where p.codpedido=i.codpedido'+
         ' and p.codfilial='+QuotedStr(FormatFloat('00',StrToInt(EdtLojaOrig.text)))+
         ' and p.codpedido='+EdtPedido.Text;
  IBQ1.Close;
  IBQ1.SQL.Clear;
  IBQ1.SQL.Add(MySql);
  IBQ1.Open;

  If (IBQ1.IsEmpty) Or (Trim(IBQ1.FieldByName('codproduto').AsString)='') Then
  Begin
    IBQ1.Close;
    ShowMessage('Pedido Inexistente ou Sem Produto !!');
    EdtPedido.SetFocus;
    Exit;
  End;

  IBQ1.Last;
  Lb_Total.Caption:=IntToStr(IBQ1.RecordCount);
  IBQ1.First;

  While Not IBQ1.Eof do
  Begin
    Application.ProcessMessages;

    // Verifica se Existe Controle de Estoque no CD =============
    MySql:=' SELECT e.codproduto'+
           ' FROM ESTOQUE e'+
           ' WHERE e.codproduto='+QuotedStr(IBQ1.FieldByName('codproduto').AsString)+
           ' AND e.codfilial='+QuotedStr(FormatFloat('00',StrToInt(EdtLojaDest.text)));
    IBQ2.Close;
    IBQ2.SQL.Clear;
    IBQ2.SQL.Add(MySql);
    IBQ2.Open;

    If Trim(IBQ2.FieldByName('CodProduto').AsString)='' Then
     Begin
       lb_Atualizados.Caption:=IntToStr(StrToInt(lb_Atualizados.Caption)+1);

       // Gera Controle de Estoque no CD -------------------------
       GeraEstoqueCD;
     End
    Else
     Begin
       lb_NaoAtualizados.Caption:=IntToStr(StrToInt(lb_NaoAtualizados.Caption)+1);
     End;
    IBQ2.Close;

    lb_Processados.Caption:=IntToStr(IBQ1.RecordCount);
    IBQ1.Next;
  End;
  IBT.Commit;

  ShowMessage('Pedido Executado com SUCESSO !!');
  EdtPedido.SetFocus;
  Zera;
end;

procedure TFrmAcertaContEstoques.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
    Begin
      Key:=#0;
      SelectNext(ActiveControl,True,True);
    End;

end;

end.
