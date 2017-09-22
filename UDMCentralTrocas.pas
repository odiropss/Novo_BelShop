unit UDMCentralTrocas;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr,
  IBQuery, IBDatabase, IBCustomDataSet, IBUpdateSQL, JvValidateEdit;

type
  TDMCentralTrocas = class(TDataModule)
    SDS_Transf_Cd: TSQLDataSet;
    DSP_Transf_Cd: TDataSetProvider;
    CDS_Transf_Cd: TClientDataSet;
    DS_Transf_Cd: TDataSource;
    CDS_Transf_CdNUM_SOLICITACAO: TIntegerField;
    CDS_Transf_CdDTA_SOLICITACAO: TDateField;
    CDS_Transf_CdCODPRODUTO: TStringField;
    CDS_Transf_CdAPRESENTACAO: TStringField;
    CDS_Transf_CdPRINCIPALFOR: TStringField;
    CDS_Transf_CdNOMEFORNECEDOR: TStringField;
    CDS_Transf_CdQUANT_CD: TFMTBCDField;
    CDS_Transf_CdCODBARRA: TStringField;
    CDS_NotasEntrada: TClientDataSet;
    SDS_NotasEntrada: TSQLDataSet;
    DSP_NotasEntrada: TDataSetProvider;
    DS_NotasEntrada: TDataSource;
    CDS_NotasEntradaNUM_SOLICITACAO: TIntegerField;
    CDS_NotasEntradaNFE_COD_LOJA: TStringField;
    CDS_NotasEntradaNFE_COD_PRODUTO: TStringField;
    CDS_NotasEntradaNFE_COD_BARRAS: TStringField;
    CDS_NotasEntradaNFE_PRODUTO: TStringField;
    CDS_NotasEntradaNFE_COD_FORNECEDOR: TStringField;
    CDS_NotasEntradaNFE_FORNECEDOR: TStringField;
    CDS_NotasEntradaNFE_COD_COMPROVANTE: TStringField;
    CDS_NotasEntradaNFE_NUMERO: TStringField;
    CDS_NotasEntradaNFE_SERIE: TStringField;
    CDS_NotasEntradaNFE_DTA_ENTRADA: TDateField;
    CDS_NotasEntradaNFE_DTA_COMPROVANTE: TDateField;
    CDS_NotasEntradaNFE_QTD: TFMTBCDField;
    CDS_NotasEntradaNFE_QTD_DEVOLUCAO: TFMTBCDField;
    CDS_NotasEntr: TClientDataSet;
    SDS_NotasEntr: TSQLDataSet;
    DSP_NotasEntr: TDataSetProvider;
    CDS_NotasEntrNUM_SEQ: TIntegerField;
    CDS_NotasEntrCODFILIAL: TStringField;
    CDS_NotasEntrCODCOMPROVANTE: TStringField;
    CDS_NotasEntrNUMERO: TStringField;
    CDS_NotasEntrSERIE: TStringField;
    CDS_NotasEntrSITUACAONF: TStringField;
    CDS_NotasEntrDATAENTRADA: TDateField;
    CDS_NotasEntrDATACOMPROVANTE: TDateField;
    CDS_NotasEntrCODFORNECEDOR: TStringField;
    CDS_NotasEntrCODPRODUTO: TStringField;
    CDS_NotasEntrQUANT: TFMTBCDField;
    CDS_NotasEntrQUANT_INFORMADA: TFMTBCDField;
    CDS_Transf_CdTOT_PRODUTOS: TAggregateField;
    CDS_Transf_CdTOT_QTD: TAggregateField;
    CDS_RomaneioDev: TClientDataSet;
    SDS_RomaneioDev: TSQLDataSet;
    DSP_RomaneioDev: TDataSetProvider;
    DS_RomaneioDev: TDataSource;
    CDS_RomaneioDevDES_LOJA: TStringField;
    CDS_RomaneioDevNUM_CNPJ: TStringField;
    CDS_RomaneioDevENDERECO: TStringField;
    CDS_RomaneioDevDES_BAIRRO: TStringField;
    CDS_RomaneioDevDES_CIDADE: TStringField;
    CDS_RomaneioDevCOD_UF: TStringField;
    CDS_RomaneioDevCOD_CEP: TStringField;
    CDS_RomaneioDevNOMEFORNECEDOR: TStringField;
    CDS_RomaneioDevCONTATO: TStringField;
    CDS_RomaneioDevTELEFONES: TStringField;
    CDS_RomaneioDevEMAIL: TStringField;
    CDS_RomaneioDevCODCOMPROVANTE: TStringField;
    CDS_RomaneioDevNUMERO: TStringField;
    CDS_RomaneioDevSERIE: TStringField;
    CDS_RomaneioDevSITUACAONF: TStringField;
    CDS_RomaneioDevDATACOMPROVANTE: TDateField;
    CDS_RomaneioDevDATAENTRADA: TDateField;
    CDS_RomaneioDevNOMEPRODUTO: TStringField;
    CDS_RomaneioDevUNID: TStringField;
    CDS_RomaneioDevUSUARIO: TStringField;
    CDS_RomaneioDevQTD_DEVOLVER: TFMTBCDField;
    CDS_RomaneioDevPRECOCOMPRA: TFMTBCDField;
    CDS_V_Geral: TClientDataSet;
    CDS_Transf_CdQTD_NAO: TFMTBCDField;
    CDS_V_GeralCodBarras: TStringField;
    CDS_Transf_CdSIT: TStringField;
    CDS_Transf_CdIND_IMPRESSO: TStringField;
    CDS_Transf_CdNUM_SEQ: TIntegerField;
    CDS_ReposicaoDocs: TClientDataSet;
    SDS_ReposicaoDocs: TSQLDataSet;
    DSP_ReposicaoDocs: TDataSetProvider;
    DS_ReposicaoDocs: TDataSource;
    CDS_ReposicaoDocsCOD_LOJA: TStringField;
    CDS_ReposicaoDocsRAZAO_SOCIAL: TStringField;
    CDS_ReposicaoDocsNUM_DOCTO: TIntegerField;
    CDS_ReposicaoDocsNUM_PRODUTOS: TIntegerField;
    CDS_ReposicaoTransf: TClientDataSet;
    SDS_ReposicaoTransf: TSQLDataSet;
    DSP_ReposicaoTransf: TDataSetProvider;
    DS_ReposicaoTransf: TDataSource;
    CDS_ReposicaoTransfCOD_PRODUTO: TStringField;
    CDS_ReposicaoTransfDES_PRODUTO: TStringField;
    CDS_ReposicaoTransfABC: TStringField;
    CDS_ReposicaoTransfQTD_A_TRANSF: TFMTBCDField;
    CDS_ReposicaoTransfNUM_PEDIDO: TStringField;
    CDS_ReposicaoTransfENDERECO: TStringField;
    CDS_ReposicaoTransfNUM_SEQ: TSmallintField;
    SDS_RelReposicao: TSQLDataSet;
    DSP_RelReposicao: TDataSetProvider;
    CDS_RelReposicao: TClientDataSet;
    CDS_RelReposicaoLOJA: TStringField;
    CDS_RelReposicaoCNPJ: TStringField;
    CDS_RelReposicaoNUM_DOCTO: TIntegerField;
    CDS_RelReposicaoDTA_MOVTO: TDateField;
    CDS_RelReposicaoSEQ: TIntegerField;
    CDS_RelReposicaoQTD_A_TRANSF: TFMTBCDField;
    CDS_RelReposicaoQTD_DISPONIVEL: TStringField;
    CDS_RelReposicaoCOD_PRODUTO: TStringField;
    CDS_RelReposicaoCODBARRA: TStringField;
    CDS_RelReposicaoDES_PRODUTO: TStringField;
    CDS_RelReposicaoUSUARIO: TStringField;
    CDS_RelReposicaoOBS_DOCTO: TStringField;
    DS_AnaliseReposicao: TDataSource;
    CDS_V_AnaliseReposicao: TClientDataSet;
    CDS_ReposicaoDocsQTD_SUG_TRANSF: TFMTBCDField;
    CDS_ReposicaoDocsQTD_A_TRANSF: TFMTBCDField;
    CDS_ReposicaoDocsQTD_TRANSF: TFMTBCDField;
    CDS_ReposicaoDocsQTD_NTRANSF: TFMTBCDField;
    CDS_ReposicaoTransfQTD_TRANSF: TFMTBCDField;
    CDS_ReposicaoTransfQTD_TRANSF_OC: TFMTBCDField;
    CDS_ReposicaoTransfPRECOCOMPRA: TFMTBCDField;
    CDS_QtdCxCDProdutos: TClientDataSet;
    SDS_QtdCxCDProdutos: TSQLDataSet;
    DSP_QtdCxCDProdutos: TDataSetProvider;
    DS_QtdCxCDProdutos: TDataSource;
    CDS_QtdCxCDGrupos: TClientDataSet;
    SDS_QtdCxCDGrupos: TSQLDataSet;
    DSP_QtdCxCDGrupos: TDataSetProvider;
    DS_QtdCxCDGrupos: TDataSource;
    CDS_QtdCxCDGruposCODIGO: TStringField;
    CDS_QtdCxCDGruposDESCRICAO: TStringField;
    CDS_QtdCxCDGruposQTD_CAIXA: TIntegerField;
    CDS_QtdCxCDGruposPER_CORTE: TIntegerField;
    CDS_QtdCxCDProdutosCODIGO: TStringField;
    CDS_QtdCxCDProdutosDESCRICAO: TStringField;
    CDS_QtdCxCDProdutosQTD_CAIXA: TIntegerField;
    CDS_QtdCxCDProdutosPER_CORTE: TIntegerField;
    CDS_RelReposicaoREFERENCIA: TStringField;
    CDS_ReposicaoTransfIND_PRIORIDADE: TSmallintField;
    CDS_ReposicaoTransfIND_LEITORA: TStringField;
    CDS_ReposicaoDocsTot_Itens: TAggregateField;
    CDS_ReposicaoTransfQTD_CHECKOUT: TFMTBCDField;
    CDS_V_ReposDivergencias: TClientDataSet;
    CDS_V_ReposDivergenciasCOD_PRODUTO: TStringField;
    CDS_V_ReposDivergenciasNOME: TStringField;
    CDS_V_ReposDivergenciasQTD_A_TRANSF: TFMTBCDField;
    CDS_V_ReposDivergenciasQTD_CHECKOUT: TFMTBCDField;
    CDS_V_ReposDivergenciasNUM_SEQ: TIntegerField;
    DS_V_ReposDivergencias: TDataSource;
    CDS_V_ReposDivergenciasIND_CORRIGIDO: TStringField;
    CDS_ReposicaoTransfCODBARRA: TStringField;
    CDS_V_ReposDivergenciasENDERECAMENTO: TStringField;
    CDS_RelReposicaoENDERECAMENTO: TStringField;
    CDS_RelReposicaoSALDO_CD: TFMTBCDField;
    CDS_ParamTransf: TClientDataSet;
    SDS_ParamTransf: TSQLDataSet;
    DSP_ParamTransf: TDataSetProvider;
    DS_ParamTransf: TDataSource;
    CDS_ParamTransfNUM_PROD_DIA: TStringField;
    CDS_ParamTransfQTD_MAX_PROD: TStringField;
    CDS_ParamTransfCOD_LOJA: TIntegerField;
    CDS_ParamTransfRAZAO_SOCIAL: TStringField;
    procedure CDS_Transf_CdAfterScroll(DataSet: TDataSet);

    // Odir
    Procedure FechaTudoCentralTrocas;

    Procedure CriaQueryIB(sDataBase, sTransaction: String; Var IBQ_Free: TIBQuery; bMatriz, bCriaIBQ: Boolean);
    procedure CDS_ReposicaoDocsAfterScroll(DataSet: TDataSet);
    procedure CDS_V_ReposDivergenciasAfterScroll(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
        // sDataBase    = Database a Conectar
        // sTransaction = Transaction a Conectar
        // IBQ_Free     = Nome do TIBQuery a Destruir e Reconstruir
        // bMatriz      = Se Conexão é Matriz (Não Gera Sql Automaticamente)
        // bCriaIBQ     = Se Destruir e Reconstruir IBQuery

    // Odir

  private
    { Private declarations }
  public
    { Public declarations }
    bgAfterScroll: Boolean;
  end;

var
  DMCentralTrocas: TDMCentralTrocas;

implementation

uses UDMBelShop, UDMConexoes, UFrmCentralTrocas, UFrmSolicitacoes;

{$R *.dfm}

// =============================================================================
// Odir - INICIO ===============================================================
// =============================================================================

Procedure TDMCentralTrocas.CriaQueryIB(sDataBase, sTransaction: String; Var IBQ_Free: TIBQuery; bMatriz, bCriaIBQ: Boolean);
Var
  i: Integer;
  iOk: Integer;
Begin

  iOk:=0;

  If bCriaIBQ Then
  Begin
    Try
      If IBQ_Free <> Nil Then
       FreeAndNil(IBQ_Free);
    Except
    End;

    IBQ_Free:=TIBQuery.Create(Self);
    IBQ_Free.BufferChunks := 100;   // Defaut = 1000 , coloque 100
    IBQ_Free.Unidirectional := False;
    IBQ_Free.FetchAll;
  End;

  IBQ_Free.Close;

  For i:=0 to DMConexoes.ComponentCount-1 do
  Begin
    If DMConexoes.Components[i] is TIBDatabase Then
    Begin
      If (DMConexoes.Components[i] as TIBDatabase).Name=sDataBase Then
      Begin
        IBQ_Free.Database:=(DMConexoes.Components[i] as TIBDatabase);
        Inc(iOk);
      End;
    End;

    If DMConexoes.Components[i] is TIBTransaction Then
    Begin
      If (DMConexoes.Components[i] as TIBTransaction).Name=sTransaction Then
      Begin
        IBQ_Free.Transaction:=(DMConexoes.Components[i] as TIBTransaction);
        Inc(iOk);
      End;
    End;

    If iOk = 2 Then
    Begin
      Break;
    End;
  End;
End; // Atualiza Conexao TIBQuery >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Diversos - Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMCentralTrocas.FechaTudoCentralTrocas;
Var
  i: Integer;
Begin

  // Fecha Componentes DMConciliacao =====================================
  For i:=0 to DMCentralTrocas.ComponentCount-1 do
  Begin
    If DMCentralTrocas.Components[i] is TClientDataSet Then
     If (DMCentralTrocas.Components[i] as TClientDataSet).Active Then
      (DMCentralTrocas.Components[i] as TClientDataSet).Close;
  End; // For i:=0 to DMCentralTrocas.ComponentCount-1 do
end; // Diversos - Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TDMCentralTrocas.CDS_Transf_CdAfterScroll(DataSet: TDataSet);
begin
 If Not CDS_Transf_Cd.IsEmpty Then
 Begin
   CDS_NotasEntrada.Close;
   SDS_NotasEntrada.Params.ParamByName('NUMERO').Value :=CDS_Transf_CdNUM_SOLICITACAO.AsInteger;
   SDS_NotasEntrada.Params.ParamByName('PRODUTO').Value:=CDS_Transf_CdCODPRODUTO.AsString;
   SDS_NotasEntrada.Params.ParamByName('Qtd').Value    :=CDS_Transf_CdQUANT_CD.AsCurrency;
   SDS_NotasEntrada.Params.ParamByName('NumSeq').Value :=CDS_Transf_CdNUM_SEQ.AsCurrency;
   CDS_NotasEntrada.OPen;
 End; // If Not CDS_Transf_Cd.IsEmpty Then
end;

// =============================================================================
// Odir - FIM ==================================================================
// =============================================================================

procedure TDMCentralTrocas.CDS_ReposicaoDocsAfterScroll(DataSet: TDataSet);
begin

  CDS_ReposicaoTransf.DisableControls;
  CDS_ReposicaoTransf.Close;
  SDS_ReposicaoTransf.Params.ParamByName('sDta').AsDate:=FrmCentralTrocas.DtaEdt_ReposLojas.Date;
  SDS_ReposicaoTransf.Params.ParamByName('Doc').AsInteger:=CDS_ReposicaoDocsNUM_DOCTO.AsInteger;
  SDS_ReposicaoTransf.Params.ParamByName('CodLoja').AsString:=CDS_ReposicaoDocsCOD_LOJA.AsString;
  CDS_ReposicaoTransf.Open;
  CDS_ReposicaoTransf.EnableControls;

  CDS_ReposicaoDocs.Edit;
  CDS_ReposicaoDocsNUM_PRODUTOS.AsInteger:=CDS_ReposicaoTransf.RecordCount;
  CDS_ReposicaoDocs.Post;
end;

procedure TDMCentralTrocas.CDS_V_ReposDivergenciasAfterScroll(DataSet: TDataSet);
begin
  If CDS_V_ReposDivergencias.IsEmpty Then
   Exit;

  If bgAfterScroll Then
  Begin
    FrmSolicitacoes.EdtReposDivQtd.AsInteger:=CDS_V_ReposDivergenciasQTD_CHECKOUT.AsInteger;
    FrmSolicitacoes.Mem_ReposDivProduto.Text:=CDS_V_ReposDivergenciasCOD_PRODUTO.AsString+cr+
                                              CDS_V_ReposDivergenciasNOME.AsString;
  End;
end;

procedure TDMCentralTrocas.DataModuleCreate(Sender: TObject);
begin
  bgAfterScroll:=True;
end;

end.

