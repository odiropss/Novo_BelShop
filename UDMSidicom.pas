unit UDMSidicom;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, DBClient, FMTBcd,
  SqlExpr, Provider, DBLocal, DBLocalI, IBTable;

type
  TDMSidicom = class(TDataModule)
    IBQ_CDBusca: TIBQuery;
    CDS_Verifica: TClientDataSet;
    CDS_VerificaNome: TStringField;
    CDS_VerificaBel_01: TStringField;
    CDS_VerificaBel_02: TStringField;
    CDS_VerificaBel_03: TStringField;
    CDS_VerificaBel_04: TStringField;
    CDS_VerificaBel_05: TStringField;
    CDS_VerificaBel_06: TStringField;
    CDS_VerificaBel_07: TStringField;
    CDS_VerificaBel_08: TStringField;
    CDS_VerificaBel_09: TStringField;
    CDS_VerificaBel_10: TStringField;
    CDS_VerificaBel_11: TStringField;
    CDS_VerificaBel_12: TStringField;
    CDS_VerificaBel_13: TStringField;
    CDS_VerificaBel_14: TStringField;
    CDS_VerificaBel_15: TStringField;
    CDS_VerificaBel_16: TStringField;
    CDS_VerificaBel_98: TStringField;
    CDS_VerificaBel_99: TStringField;
    DS_CDS_Verifica: TDataSource;
    CDS_UsuaSidicom: TClientDataSet;
    DSP_UsuaSidicom: TDataSetProvider;
    DS_UsuaSidicom: TDataSource;
    SDS_UsuaSidicom: TSQLDataSet;
    CDS_UsuaSidicomCOD_USUARIO: TStringField;
    CDS_UsuaSidicomDES_USUARIO: TStringField;
    CDS_UsuaSidicomIND_ATIVO: TStringField;
    CDS_UsuaSidicomIND_ALTERASENHA: TStringField;
    CDS_UsuaSidicomIND_EXCLUIR: TStringField;
    CDS_UsuaSidicomIND_ENVIAR: TStringField;
    CDS_UsuaSidicomIND_PENDENTE: TStringField;
    CDS_UsuaSidicomUSU_INCLUI: TIntegerField;
    CDS_UsuaSidicomDTA_INCLUI: TSQLTimeStampField;
    CDS_UsuaSidicomEXECUTOR: TStringField;
    CDS_UsuaSidicomIND_EXCLUIDO: TStringField;
    CDS_LojasSidicom: TClientDataSet;
    DSp_LojasSidicom: TDataSetProvider;
    Ds_LojasSidicom: TDataSource;
    SDS_LojasSidicom: TSQLDataSet;
    CDS_LojasSidicomCOD_USUARIO: TStringField;
    CDS_LojasSidicomCOD_LOJA: TStringField;
    CDS_LojasSidicomRAZAO_SOCIAL: TStringField;
    CDS_LojasSidicomIND_ENVIADO: TStringField;
    CDS_LojasSidicomDTA_ENVIO: TSQLTimeStampField;
    CDS_LojasSidicomUSU_INCLUI: TIntegerField;
    CDS_LojasSidicomDTA_INCLUI: TSQLTimeStampField;
    CDS_LojasSidicomIND_ENVIAR: TStringField;
    CDS_LojasSidicomIND_PENDENTE: TStringField;

    // Odir

    // DIVERSOS ================================================================
    Procedure FechaTudoSidicom;
    Procedure SidicomTransfereTabelas;

    // Odir
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMSidicom: TDMSidicom;

  IBQ_ConsultaFilial: TIBQuery;
  IBTable           : TIBTable;

implementation

uses UDMConexoes, DK_Procs1, UDMBelShop, UFrmBelShop,
  UFrmSelectEmpProcessamento;

{$R *.dfm}

// =============================================================================
// Odir - INICIO ===============================================================
// =============================================================================

// DIVERSOS - Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMSidicom.FechaTudoSidicom;
Var
  i: Integer;
  s: String;
Begin
  // Fecha Componentes DMConciliacao =====================================
  For i:=0 to DMSidicom.ComponentCount-1 do
  Begin
    If DMSidicom.Components[i] is TIBQuery Then
     If (DMSidicom.Components[i] as TIBQuery).Active Then
      (DMSidicom.Components[i] as TIBQuery).Close;
  End;
end; // DIVERSOS - Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// DIVERSOS - Transfere Tabelas para Lojas SIDICOM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMSidicom.SidicomTransfereTabelas;
Var
  MySql: String;
  sTabela: String;
  b, bSiga: Boolean;
  i: Integer;
Begin
  // Conecta Loja =======================================================
  If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then
   Begin
     // Cria Query da Empresa ------------------------------------
     FrmBelShop.CriaQueryIB('IBDB_'+sgCodEmp,'IBT_'+sgCodEmp, IBQ_ConsultaFilial, True, True);

     // Cria IBTable da Empresa ------------------------------------
     CriaIBTable('IBDB_'+sgCodEmp,'IBT_'+sgCodEmp, IBTable, True);
     bSiga:=True;
   End
  Else
   Begin
     bSiga:=False;

     If sgLojasNConectadas='' Then
      sgLojasNConectadas:='Bel_'+sgCodEmp
     Else
      sgLojasNConectadas:=sgLojasNConectadas+', Bel_'+sgCodEmp;
   End; // If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then

  // Inicia Processamento ==================================================
  If bSiga Then // Empresa Conectada
  Begin
    DMBelShop.CDS_Busca.First;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      sTabela:=Trim(DMBelShop.CDS_Busca.FieldBYName('Tabela').AsString);

      Try
        // Abre Transacao -------------------------------------------
        b:=False;
        While Not b do
        Begin
          b:=IBTransacao('S','IBT_'+sgCodEmp);
        End; // While Not b do

        // Delete Taabela na Loja -----------------------------------
        MySql:=' DELETE FROM '+sTabela;
        IBQ_ConsultaFilial.Close;
        IBQ_ConsultaFilial.SQL.Clear;
        IBQ_ConsultaFilial.SQL.Add(MySql);
        IBQ_ConsultaFilial.ExecSQL;

        // Abre Tabela na Loja --------------------------------------
        IBTable.TableName:=sTabela;
        IBTable.Open;

        // Abre Tabela no CD ----------------------------------------
        MySql:=' SELECT * FROM '+sTabela;
        FrmBelShop.IBQ_MPMS.Close;
        FrmBelShop.IBQ_MPMS.SQL.Clear;
        FrmBelShop.IBQ_MPMS.SQL.Add(MySql);
        FrmBelShop.IBQ_MPMS.Open;

        FrmBelShop.OdirPanApres.Caption:=FrmBelShop.OdirPanApres.Caption+' - TABELA: '+sTabela;
        FrmBelShop.OdirPanApres.Refresh;

        // Inclui Nvos Dados na Tabela da Loja ----------------------
        While not FrmBelShop.IBQ_MPMS.Eof do
        Begin
          FrmBelShop.OdirPanApres.Refresh;

          IBTable.Insert;
          For i:=0 to FrmBelShop.IBQ_MPMS.FieldCount-1 do
           IBTable.Fields[i].Assign(FrmBelShop.IBQ_MPMS.Fields[i]);

          IBTable.Post;

          FrmBelShop.IBQ_MPMS.Next;
        End;
        IBTable.Close;
        FrmBelShop.IBQ_MPMS.Close;

        // Commit ------------------------------------------------------
        b:=False;
        While Not b do
        Begin
          b:=IBTransacao('C', 'IBT_'+sgCodEmp);
        End; // While Not b do
      Except
        on e : Exception do
        Begin
          // Rollback Transacao -----------------------------------------
          b:=False;
          While Not b do
          Begin
            b:=IBTransacao('R', 'IBT_'+sgCodEmp);
          End; // While Not b do

          FrmBelShop.Mem_Salvar.Lines.Add('Bel_'+sgCodEmp+' - Erro ao Atualizar a Tabela: '+sTabela);
          FrmBelShop.Mem_Salvar.Lines.Add('DESCRIÇÃO DO ERRO');
          FrmBelShop.Mem_Salvar.Lines.Add('-----------------');
          FrmBelShop.Mem_Salvar.Lines.Add(e.message);
          FrmBelShop.Mem_Salvar.Lines.Add('=======================================================');
        End; // on e : Exception do
      End; // Try

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
  End; // If bSiga Then // Empresa Conectada

  // Fecha Conexão =========================================================
  ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F');

End; // DIVERSOS - Transfere Tabelas para Lojas SIDICOM >>>>>>>>>>>>>>>>>>>>>>>>

// =============================================================================
// Odir - FIM ==================================================================
// =============================================================================

end.


