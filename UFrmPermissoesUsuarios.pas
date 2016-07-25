unit UFrmPermissoesUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBXpress, DB, JvExControls, JvXPCore, JvXPButtons,
  IBDatabase, IBQuery, IBCustomDataSet, FMTBcd, SqlExpr, StdCtrls;

type
  TFrmPermissoesUsuarios = class(TForm)
    Panel1: TPanel;
    Bt_ExportaPermissoes: TJvXPButton;
    SQLQuery1: TSQLQuery;

    // ODIR ====================================================================

    // Manda Exportar Permissoes de Usuarios para Loja
    Procedure ExportaPermissoesUsuarios;

    // Exporta Permissoes de Usuarios para Loja
    Function  ExportaPermissoesLojas(sCodLoja: String): Boolean;

    // ODIR ====================================================================

    procedure Bt_ExportaPermissoesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPermissoesUsuarios: TFrmPermissoesUsuarios;

  bgConexaoLocal: Boolean; // Se Conexão com o Servidor da Matriz é Local - Verifica a Existencia do Arquivo "ConexaoExterna.ini"

  // Cria Ponteiro de transacão
  TD: TTransactionDesc;

  sgCodLoja: String;

  bgExclidoMPMS: Boolean;

  IBQ_Filial  : TIBQuery;
  IBQ_MPMS    : TIBQuery;

implementation

uses DK_Procs1, UDMPermissoesUsuarios;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Exporta Permissoes de Usuarios para Loja >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function  TFrmPermissoesUsuarios.ExportaPermissoesLojas(sCodLoja: String): Boolean;
Var
  b: Boolean;
  MySql: String;

  sTabela: String;
  sCodUsuMPMS, sSenhaUsuMPMS,
  sCodUsuLoja sSenhaUsuLoja: String;

  IBDB, IBT: String;

  mMemo: TMemo;
  i: Integer;
Begin
  Result:=False;

  // Cria Memo Com Tabelas =====================================================
  mMemo:=TMemo.Create(Self);
  mMemo.Visible:=False;
  mMemo.Parent:=FrmPermissoesUsuarios;
  mMemo.Width:=500;
  mMemo.Lines.Clear;

  mMemo.Lines.Add('USUARIOP'); // SIDICOM Aba: Programas
  mMemo.Lines.Add('USUARIOFILIAL'); // SIDICOM Aba: Filiais
        /// COLOCAR 'S' NA FILIAL QUE ESTA CSENDO IMPORTADA
  mMemo.Lines.Add('USUARIOCOMPRV'); // SIDICOM Aba: Comprovantes
  mMemo.Lines.Add('USUARIOLISTA'); // SIDICOM Aba: Listas
  mMemo.Lines.Add('USUARIO_MONITOR'); // SIDICOM Aba: Sidicom Monitor
  mMemo.Lines.Add('USUARIO'); // SIDICOM Abas: Clientes/Debitos/Vendas/Compras/Agenda/Geral/

  // Conecta Empresa ===========================================================
  IBDB:='IBDB_'+sCodLoja;
  IBT :='IBT_'+sCodLoja;

  If Not ConexaoEmpIndividual(IBDB, IBT, 'A') Then
  Begin
    Exit;
  End; // If Not ConexaoEmpIndividual(IBDB, IBT, 'A') Then

  // Monta IBQuery =============================================================
  Try
    DMPermissoes.CriaQueryIB(IBDB, IBT, IBQ_Filial, True);
  Except
  End;

  Try
    b:=False;
    While Not b do
    Begin
      b:=IBTransacao('S', IBT);
    End; // While Not b do

    DateSeparator:='.';
    DecimalSeparator:='.';

    sCodUsuMPMS  :=DMPermissoes.CDS_PermissoesCOD_USUARIO.AsString;

    For i:=0 to mMemo.Lines.Count-1 do
    Begin
      sTabela:=mMemo.Lines[i];

      // Busca Codigo do Usuario ===============================================
      sCodUsuLoja:='';
      MySql:=' SELECT u.codusuario, u.senhausuario'+
             ' FROM USUARIO u'+
             ' WHERE TRIM(UPPER(u.nomeusuario))=TRIM(UPPER('+DMPermissoes.CDS_PermissoesDES_USUARIO.AsString+'))';
      IBQ_Filial.Close;
      IBQ_Filial.SQL.Clear;
      IBQ_Filial.SQL.Add(MySql);
      IBQ_Filial.Open;
      sCodUsuLoja:=Trim(IBQ_Filial.FieldByName('CodUsuario').AsString);
      IBQ_Filial.Close;

      // Executa Exclusão ======================================================
      If DMPermissoes.CDS_PermissoesIND_EXCLUIR.AsString='SIM' Then
      Begin
        If sCodUsuLoja<>''

        MySql:=' DELETE FROM USUARIO u'+
               ' WHERE u.CodUsuario='+QuotedStr(sCodUsuario);
        IBQ_Filial.Close;
        IBQ_Filial.SQL.Clear;
        IBQ_Filial.SQL.Add(MySql);
        IBQ_Filial.ExecSQL;

        Break;
      End; // If DMPermissoes.CDS_PermissoesIND_EXCLUIR.AsString='SIM' Then

      // Busca Dados da Tabela em MPMS =========================================
      DMPermissoes.ConectaMPMS;

      MySql:=' SELECT u.senhausuario'+
             ' FROM USUARIO u'+
             ' WHERE u.CodUsuario='+QuotedStr(sCodUsuario);
      IBQ_MPMS.Close;
      IBQ_MPMS.SQL.Clear;
      IBQ_MPMS.SQL.Add(MySql);
      IBQ_MPMS.Open;
      sSenhaUsuMPMS:=IBQ_MPMS.FieldByName('senhausuario').AsString;

      MySql:=' SELECT *'+
             ' FROM '+sTabela+' t'+
             ' WHERE t.CodUsuario='+QuotedStr(sCodUsuario);
      IBQ_MPMS.Close;
      IBQ_MPMS.SQL.Clear;
      IBQ_MPMS.SQL.Add(MySql);
      IBQ_MPMS.Open;


    End; // For i:=0 to mMemo.Lines.Count-1 do

    // Commita Transação =======================================================
    b:=False;
    While Not b do
    Begin
      b:=IBTransacao('C', IBT);
    End; // While Not b do
    Result:=True;

    DateSeparator:='/';
    DecimalSeparator:=',';

  Except
    On e : Exception do
    Begin
      // Rollback Transacao --------------------------------------------
      b:=False;
      While Not b do
      Begin
        b:=IBTransacao('R', IBT);
      End; // While Not b do

      DateSeparator:='/';
      DecimalSeparator:=',';
    End;
  End; // Try

  // Fecha Conexão =========================================================
  FreeAndNil(mMemo);
  FreeAndNil(IBQ_Filial);
  ConexaoEmpIndividual(IBDB, IBT, 'F');

End; // Exporta Permissoes de Usuarios para Loja >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Manda Exportar Permissoes de Usuarios para Loja >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmPermissoesUsuarios.ExportaPermissoesUsuarios;
Var
   MySql: String;
Begin

  // Verifica se Transação esta Ativa
  If DMPermissoes.SQLC.InTransaction Then
   DMPermissoes.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMPermissoes.SQLC.StartTransaction(TD);
  Try
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    DMPermissoes.CDS_Permissoes.Close;
    DMPermissoes.CDS_Permissoes.Open;

    While Not DMPermissoes.CDS_Permissoes.Eof do
    Begin
      sgCodLoja:=DMPermissoes.CDS_PermissoesCOD_LOJA.AsString;

      // Verifica Exclusão MPMS ================================================
      bgExclidoMPMS:=False;
      If DMPermissoes.CDS_PermissoesIND_EXCLUIR.AsString='SIM' Then
      Begin
        If Not bgExclidoMPMS Then
         If ExportaPermissoesLojas('99') Then
          bgExclidoMPMS:=True;
      End; // If DMPermissoes.CDS_PermissoesIND_EXCLUIR.AsString='SIM' Then

      If ExportaPermissoesLojas(sgCodLoja) Then
       Begin
       End
      Else
       Begin
       End;

      DMPermissoes.CDS_Permissoes.Next;
    End; // While Not DMPermissoes.CDS_Permissoes.Eof do


    // Atualiza Transacao ======================================================
    DMPermissoes.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;

  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMPermissoes.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;
    End; // on e : Exception do
  End; // Try

  Application.Terminate;
  Exit;

End; // Exporta Permissoes de Usuarios para Loja >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmPermissoesUsuarios.Bt_ExportaPermissoesClick(Sender: TObject);
begin
  ExportaPermissoesUsuarios;

end;

procedure TFrmPermissoesUsuarios.FormCreate(Sender: TObject);
begin
  Bt_ExportaPermissoesClick(Self);
end;

end.
