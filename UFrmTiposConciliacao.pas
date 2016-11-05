unit UFrmTiposConciliacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, JvExControls, JvXPCore, JvXPButtons,
  ExtCtrls, DBXpress, StrUtils;
//  Último: StrUtils;

{
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvXPCore, JvXPButtons, ExtCtrls, Grids, DBGrids,
  StdCtrls, DBXpress, StrUtils;
}

type
  TFrmTiposConciliacao = class(TForm)
    Panel58: TPanel;
    Bt_Voltar: TJvXPButton;
    Bt_Novo: TJvXPButton;
    Bt_Alterar: TJvXPButton;
    Bt_Excluir: TJvXPButton;
    Panel1: TPanel;
    Pan_Bancos: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    EdtCodigo: TEdit;
    EdtDesc: TEdit;
    Dbg_TpConciliacao: TDBGrid;
    procedure Bt_VoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Bt_NovoClick(Sender: TObject);
    procedure Bt_AlterarClick(Sender: TObject);
    procedure Bt_ExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTiposConciliacao: TFrmTiposConciliacao;

  // Cria Ponteiro de transacão ================================================
  TD: TTransactionDesc;

  sgCodigo: String;
implementation

uses UDMBelShop, UDMBancosConciliacao, DK_Procs1;

{$R *.dfm}

procedure TFrmTiposConciliacao.Bt_VoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTiposConciliacao.FormShow(Sender: TObject);
begin
  DMConciliacao.CDS_TpConciliacao.Open;
end;

procedure TFrmTiposConciliacao.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

end;

procedure TFrmTiposConciliacao.Bt_NovoClick(Sender: TObject);
Var
  MySql: String;
begin
  If Bt_Novo.Caption='Novo' Then
  Begin
    EdtDesc.SetFocus;

    MySql:=' SELECT Coalesce(max(t.COD_AUX)+1 ,1) Codigo'+
           ' FROM TAB_AUXILIAR t'+
           ' WHERE t.TIP_AUX=3';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;
    sgCodigo:=DMBelShop.CDS_Busca.FieldByName('Codigo').AsString;
    DMBelShop.CDS_Busca.Close;

    EdtCodigo.Text:=sgCodigo;
    EdtDesc.Clear;

    Bt_Novo.Caption:='Inserir';
    Bt_Alterar.Caption:='Abandonar';
    Bt_Voltar.Enabled:=False;
    Exit;
  End; // If Bt_Novo.Caption='Novo' Then

  If (Bt_Novo.Caption='Inserir') Or (Bt_Novo.Caption='Alterar')Then
  Begin
    EdtDesc.SetFocus;
    If Trim(EdtDesc.Text)='' Then
    Begin
      msg('Favor Informar a Descriçao !!','A');
      Exit;
    End;

    // Verificva se Transação esta Ativa
    If DMBelShop.SQLC.InTransaction Then
     DMBelShop.SQLC.Rollback(TD);

    // Monta Transacao ===========================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMBelShop.SQLC.StartTransaction(TD);
    Try
      Screen.Cursor:=crAppStart;
      DateSeparator:='.';
      DecimalSeparator:='.';

      If Bt_Novo.Caption='Inserir' Then
      Begin
        MySql:=' Insert into TAB_AUXILIAR (TIP_AUX, COD_AUX, DES_AUX)'+
               ' Values('+
               QuotedStr('3')+', '+
               QuotedStr(EdtCodigo.Text)+', '+
               QuotedStr(EdtDesc.Text)+')';
        DMBelShop.SQLC.Execute(MySql,nil,nil);
      End; // If Bt_Novo.Caption='Inserir' Then

      If Bt_Novo.Caption='Alterar' Then
      Begin
        MySql:=' Update TAB_AUXILIAR'+
               ' Set DES_AUX='+QuotedStr(EdtDesc.Text)+
               ' Where TIP_AUX=3'+
               ' And COD_AUX='+QuotedStr(EdtCodigo.Text);
        DMBelShop.SQLC.Execute(MySql,nil,nil);
      End; // If Bt_Novo.Caption='Inserir' Then

      // Atualiza Transacao =======================================
      DMBelShop.SQLC.Commit(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      EdtCodigo.Clear;
      EdtDesc.Clear;

      DMConciliacao.CDS_TpConciliacao.Close;
      DMConciliacao.CDS_TpConciliacao.Open;
      DMConciliacao.CDS_TpConciliacao.Locate('Cod_Aux',sgCodigo,[]);

    Except
      on e : Exception do
      Begin
        // Abandona Transacao =====================================
        DMBelShop.SQLC.Rollback(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
        Screen.Cursor:=crDefault;

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      End; // on e : Exception do
    End; // Try
  End; // If (Bt_Novo.Caption='Inserir') Or (Bt_Novo.Caption='Alterar')Then

  Dbg_TpConciliacao.SetFocus;
  Bt_Novo.Caption:='Novo';
  Bt_Alterar.Caption:='Alterar';
  Bt_Voltar.Enabled:=True;

end;

procedure TFrmTiposConciliacao.Bt_AlterarClick(Sender: TObject);
begin
  EdtDesc.SetFocus;

  If Bt_Alterar.Caption='Alterar' Then
  Begin
    If DMConciliacao.CDS_TpConciliacao.IsEmpty Then
     Exit;

    sgCodigo:=DMConciliacao.CDS_TpConciliacaoCOD_AUX.AsString;

    EdtCodigo.Text:=sgCodigo;
    EdtDesc.Text:=DMConciliacao.CDS_TpConciliacaoDES_AUX.AsString;

    Bt_Novo.Caption:='Alterar';
    Bt_Alterar.Caption:='Abandonar';
    Bt_Voltar.Enabled:=False;

    EdtDesc.SetFocus;
    Exit;
  End; // If Bt_Novo.Caption='Novo' Then

  If Bt_Alterar.Caption='Abandonar' Then
  Begin
    EdtCodigo.Clear;
    EdtDesc.Clear;

    Bt_Novo.Caption:='Novo';
    Bt_Alterar.Caption:='Alterar';
    Bt_Voltar.Enabled:=True;

    Dbg_TpConciliacao.SetFocus;
    Exit;

  End; // If Bt_Novo.Caption='Alterar' Then
end;

procedure TFrmTiposConciliacao.Bt_ExcluirClick(Sender: TObject);
Var
  MySql: String;
  i, ii, iii: Integer;
begin
  If DMConciliacao.CDS_TpConciliacao.IsEmpty Then
   Exit;

  If msg('Deseja Realmente Excluir o'+cr+'Tipo de Conciliação Selecionado ??','C')=2 Then
   Exit;

  // Verificva se Transação esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' Delete From TAB_AUXILIAR'+
           ' Where TIP_AUX=3'+
           ' And COD_AUX='+QuotedStr(DMConciliacao.CDS_TpConciliacaoCOD_AUX.AsString);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao =======================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;

    DMConciliacao.CDS_TpConciliacao.Close;
    DMConciliacao.CDS_TpConciliacao.Open;

  Except
    on e : Exception do
    Begin
      // Abandona Transacao =====================================
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      If AnsiContainsStr(e.message, 'FOREIGN KEY') Then
       Begin
         i:=Pos('table "',e.Message);
         i:=i+7;
         iii:=0;
         For ii:=i to Length(e.Message) do
         Begin
           Inc(iii);
           If e.Message[ii]='"' Then
           Begin
             Break;
           End;
         End;

         ShowMessage('IMPOSSÍVEL EXCLUIR !!'+cr+cr+'Tipo de Conciliação Já Utilizado em'+cr+Copy(e.Message,i,iii-1));
       End
      Else // If AnsiContainsStr(e.message, 'FOREIGN KEY') Then
       Begin
         MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
       End; // If AnsiContainsStr(e.message, 'FOREIGN KEY') Then

      exit;
    End; // on e : Exception do
  End; // Try

end;

end.
