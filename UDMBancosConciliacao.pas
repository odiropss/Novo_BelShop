unit UDMBancosConciliacao;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, Variants;

type
  TDMConciliacao = class(TDataModule)
    SDS_Bancos: TSQLDataSet;
    DSP_Bancos: TDataSetProvider;
    CDS_Bancos: TClientDataSet;
    DS_Bancos: TDataSource;
    CDS_BancosCOD_BANCO: TIntegerField;
    CDS_BancosNUM_BANCO: TIntegerField;
    CDS_BancosDES_BANCO: TStringField;
    CDS_BancosNUM_AGENCIA: TStringField;
    CDS_BancosDES_AGENCIA: TStringField;
    CDS_BancosNUM_CONTA: TStringField;
    SDS_LojasBanco: TSQLDataSet;
    DSP_LojasBanco: TDataSetProvider;
    CDS_LojasBanco: TClientDataSet;
    DS_LojasBanco: TDataSource;
    CDS_LojasBancoCOD_LOJA: TStringField;
    CDS_LojasBancoRAZAO_SOCIAL: TStringField;
    CDS_LojasBancoCOD_BANCO: TIntegerField;
    DS_Extrato: TDataSource;
    CDS_Extrato: TClientDataSet;
    SDS_Extrato: TSQLDataSet;
    DSP_Extrato: TDataSetProvider;
    CDS_ExtratoNUM_SEQ: TIntegerField;
    CDS_ExtratoDTA_EXTRATO: TStringField;
    CDS_ExtratoDATA: TStringField;
    CDS_ExtratoDES_TPMOVTO: TStringField;
    CDS_ExtratoNUM_DOCTO: TStringField;
    CDS_ExtratoIND_TIPO: TStringField;
    CDS_ExtratoVLR_DOCTO: TFMTBCDField;
    DS_LojasBancos: TDataSource;
    CDS_LojasBancos: TClientDataSet;
    SDS_LojasBancos: TSQLDataSet;
    DSP_LojasBancos: TDataSetProvider;
    CDS_BancosCOD_LOJAS: TStringField;
    CDS_BancosUSU_INCLUI: TIntegerField;
    CDS_BancosDTA_INCLUI: TSQLTimeStampField;
    CDS_BancosUSU_ALTERA: TIntegerField;
    CDS_BancosDTA_ALTERA: TSQLTimeStampField;
    DS_ConcExtratos: TDataSource;
    CDS_ConcExtratos: TClientDataSet;
    SDS_ConcExtratos: TSQLDataSet;
    DSP_ConcExtratos: TDataSetProvider;
    CDS_ConcExtratosNUM_BANCO: TIntegerField;
    CDS_ConcExtratosDES_BANCO: TStringField;
    CDS_ConcExtratosNUM_AGENCIA: TStringField;
    CDS_ConcExtratosNUM_CONTA: TStringField;
    CDS_ConcExtratosDTA_EXTRATO: TDateField;
    CDS_ConcExtratosCOD_TPMOVTO: TIntegerField;
    CDS_ConcExtratosDES_TPMOVTO: TStringField;
    CDS_ConcExtratosNUM_DOCTO: TStringField;
    CDS_ConcExtratosVLR_DOCTO: TFMTBCDField;
    CDS_ConcExtratosIND_TIPO: TStringField;
    CDS_ConcExtratosConciliado: TStringField;
    CDS_ConcExtratosCHV_EXTRATO: TStringField;
    SDS_CMExtratos: TSQLDataSet;
    DSP_CMExtratos: TDataSetProvider;
    CDS_CMExtratos: TClientDataSet;
    CDS_CMExtratosQUEM: TStringField;
    CDS_CMExtratosConciliar: TStringField;
    CDS_CMExtratosNUM_BANCO: TIntegerField;
    CDS_CMExtratosDES_BANCO: TStringField;
    CDS_CMExtratosNUM_AGENCIA: TStringField;
    CDS_CMExtratosNUM_CONTA: TStringField;
    CDS_CMExtratosDTA_EXTRATO: TDateField;
    CDS_CMExtratosCOD_TPMOVTO: TIntegerField;
    CDS_CMExtratosDES_TPMOVTO: TStringField;
    CDS_CMExtratosNUM_DOCTO: TStringField;
    CDS_CMExtratosVLR_DOCTO: TFMTBCDField;
    CDS_CMExtratosIND_TIPO: TStringField;
    CDS_CMExtratosCHV_EXTRATO: TStringField;
    CDS_CMExtratosCOD_USUARIO: TIntegerField;
    DS_CMPagtos: TDataSource;
    CDS_CMPagtos: TClientDataSet;
    SDS_CMPagtos: TSQLDataSet;
    DSP_CMPagtos: TDataSetProvider;
    DS_CMExtratos: TDataSource;
    CDS_CMExtratosConciliado: TStringField;
    CDS_CMPagtosCOD_LOJA: TStringField;
    CDS_CMPagtosConciliado: TStringField;
    CDS_CMPagtosQUEM: TStringField;
    CDS_CMPagtosConciliar: TStringField;
    CDS_CMPagtosNUM_DOCTO: TStringField;
    CDS_CMPagtosDTA_VENC: TDateField;
    CDS_CMPagtosDTA_PAGTO: TDateField;
    CDS_CMPagtosVLR_DOCTO: TFMTBCDField;
    CDS_CMPagtosVLR_DESCONTO: TFMTBCDField;
    CDS_CMPagtosVLR_ACRESCIMO: TFMTBCDField;
    CDS_CMPagtosVLR_PAGTO: TFMTBCDField;
    CDS_CMPagtosCOD_COMPROVANTE: TStringField;
    CDS_CMPagtosNOMECOMPROVANTE: TStringField;
    CDS_CMPagtosCOD_FORNECEDOR: TStringField;
    CDS_CMPagtosNOMEFORNECEDOR: TStringField;
    CDS_CMPagtosIND_PAGTO_PARCIAL: TStringField;
    CDS_CMPagtosNUM_PRESTACAO: TStringField;
    CDS_CMPagtosNUM_SERIE: TStringField;
    CDS_CMPagtosRAZAO_SOCIAL: TStringField;
    CDS_CMPagtosDTA_DOCTO: TDateField;
    CDS_CMPagtosDTA_COMPR: TDateField;
    CDS_CMPagtosCOD_BANCO: TStringField;
    CDS_CMPagtosDES_BANCO: TStringField;
    CDS_CMPagtosCOD_COBRANCA: TStringField;
    CDS_CMPagtosOBS_TEXTO: TStringField;
    CDS_CMPagtosNUM_SEQ: TIntegerField;
    CDS_CMPagtosNUM_COMPL: TIntegerField;
    CDS_CMPagtosCHV_PAGTO: TStringField;
    CDS_CMPagtosCHV_NOTA: TStringField;
    CDS_CMPagtosCHV_RECIBO: TStringField;
    SDS_TpConciliacao: TSQLDataSet;
    DSP_TpConciliacao: TDataSetProvider;
    CDS_TpConciliacao: TClientDataSet;
    DS_TpConciliacao: TDataSource;
    CDS_TpConciliacaoTIP_AUX: TIntegerField;
    CDS_TpConciliacaoCOD_AUX: TIntegerField;
    CDS_TpConciliacaoDES_AUX: TStringField;
    CDS_CMPagtosTIP_CONCILIACAO: TStringField;
    CDS_CMExtratosTIP_CONCILIACAO: TStringField;
    CDS_CMPagtosCOD_USUARIO: TIntegerField;
    SDS_CMApresPagtos: TSQLDataSet;
    DSP_CMApresPagtos: TDataSetProvider;
    CDS_CMApresPagtos: TClientDataSet;
    DS_CMApresExtrato: TDataSource;
    SDS_CMApresExtratos: TSQLDataSet;
    DSP_CMApresExtratos: TDataSetProvider;
    DS_CMApresPagtos: TDataSource;
    CDS_CMApresPagtosCOD_LOJA: TStringField;
    CDS_CMApresPagtosRAZAO_SOCIAL: TStringField;
    CDS_CMApresPagtosCOMPROV: TStringField;
    CDS_CMApresPagtosCOMPROVANTE: TStringField;
    CDS_CMApresPagtosFORN: TStringField;
    CDS_CMApresPagtosFORNECEDOR: TStringField;
    CDS_CMApresPagtosNUM_DOCTO: TStringField;
    CDS_CMApresPagtosDTA_PAGTO: TDateField;
    CDS_CMApresPagtosVLR_DOCTO: TFMTBCDField;
    CDS_CMApresPagtosVLR_DESCONTO: TFMTBCDField;
    CDS_CMApresPagtosVLR_ACRESCIMO: TFMTBCDField;
    CDS_CMApresPagtosVLR_PAGTO: TFMTBCDField;
    CDS_CMApresPagtosPARCIAL: TStringField;
    CDS_CMApresPagtosDTA_VENC: TDateField;
    CDS_CMApresPagtosNUM_SERIE: TStringField;
    CDS_CMApresPagtosNUM_PREST: TStringField;
    CDS_CMApresPagtosCHV_PAGTO: TStringField;
    CDS_CMApresPagtosCOD_USUARIO: TIntegerField;
    CDS_CMApresPagtosDES_USUARIO: TStringField;
    CDS_CMApresPagtosTIP_CONCILIACAO: TStringField;
    SDS_CMTotalPagtos: TSQLDataSet;
    DSP_CMTotalPagtos: TDataSetProvider;
    CDS_CMTotalPagtos: TClientDataSet;
    DS_CMTotalPagtos: TDataSource;
    CDS_CMTotalPagtosCOD_LOJA: TStringField;
    CDS_CMTotalPagtosDTA_PAGTO: TDateField;
    CDS_CMTotalPagtosVLR_DOCTO: TFMTBCDField;
    CDS_CMTotalPagtosVLR_DESCONTO: TFMTBCDField;
    CDS_CMTotalPagtosVLR_ACRESCIMO: TFMTBCDField;
    CDS_CMTotalPagtosVLR_PAGTO: TFMTBCDField;
    CDS_CMTotalPagtosTOT_REG: TIntegerField;
    SDS_HistAuto: TSQLDataSet;
    DSP_HistAuto: TDataSetProvider;
    CDS_HistAuto: TClientDataSet;
    DS_HistAuto: TDataSource;
    CDS_HistAutoCOD_HISTORICO: TIntegerField;
    CDS_HistAutoDES_HISTORICO: TStringField;
    CDS_HistAutoLOJA: TStringField;
    CDS_HistAutoNUM_BANCO: TIntegerField;
    CDS_HistAutoDES_BANCO: TStringField;
    CDS_HistAutoNUM_AGENCIA: TStringField;
    CDS_HistAutoNUM_CONTA: TStringField;
    CDS_HistAutoDebCre: TStringField;
    CDS_CMExtratosCOD_BANCO: TIntegerField;
    CDS_ConcExtratosCOD_BANCO: TIntegerField;
    CDS_ConcExtratosCHV_CONCILIADA: TStringField;
    DS_ConcCaixa: TDataSource;
    SDS_ConcCaixaTotais: TSQLDataSet;
    DS_ConcCaixaTotais: TDataSource;
    DSP_ConcCaixaTotais: TDataSetProvider;
    CDS_ConcCaixaTotais: TClientDataSet;
    CDS_ConcCaixaTotaisCOD_CREDITO: TIntegerField;
    CDS_ConcCaixaTotaisDES_CREDITO: TStringField;
    CDS_ConcCaixaTotaisVLR_CREDITO: TFMTBCDField;
    CDS_ConcCaixaTotaisVLR_INFORMADO: TFMTBCDField;
    CDS_ConcCaixaTotaisVLR_DIFERENCA: TFMTBCDField;
    CDS_ConcCaixaTotaisIND_INFORMADO: TStringField;
    CDS_ConcCaixaTotaisUSU_INCLUI: TIntegerField;
    CDS_ConcCaixa: TClientDataSet;
    CDS_ConcCaixaNUM_SEQREG: TIntegerField;
    CDS_ConcCaixaNUM_SEQ: TIntegerField;
    CDS_ConcCaixaCOD_LOJA: TStringField;
    CDS_ConcCaixaDTA_CAIXA: TDateField;
    CDS_ConcCaixaCOD_OPERADOR: TStringField;
    CDS_ConcCaixaDES_OPERADOR: TStringField;
    CDS_ConcCaixaCOD_CREDITO: TIntegerField;
    CDS_ConcCaixaDES_CREDITO: TStringField;
    CDS_ConcCaixaVLR_CREDITO: TFMTBCDField;
    CDS_ConcCaixaVLR_INFORMADO: TFMTBCDField;
    CDS_ConcCaixaVLR_DIFERENCA: TFMTBCDField;
    CDS_ConcCaixaOBS: TStringField;
    CDS_ConcCaixaIND_INFORMADO: TStringField;
    CDS_ConcCaixaIND_FECHADO: TStringField;
    CDS_ConcCaixaUSU_INCLUI: TIntegerField;
    CDS_ConcCaixaDTA_INCLUI: TSQLTimeStampField;
    CDS_ConcCaixaUSU_ALTERA: TIntegerField;
    CDS_ConcCaixaDTA_ALTERA: TSQLTimeStampField;
    SDS_ConcCaixa: TSQLDataSet;
    DSP_ConcCaixa: TDataSetProvider;
    CDS_CMApresExtratos: TClientDataSet;
    CDS_CMApresExtratosNUM_BANCO: TIntegerField;
    CDS_CMApresExtratosDES_BANCO: TStringField;
    CDS_CMApresExtratosNUM_AGENCIA: TStringField;
    CDS_CMApresExtratosNUM_CONTA: TStringField;
    CDS_CMApresExtratosDTA_EXTRATO: TDateField;
    CDS_CMApresExtratosCOD_TPMOVTO: TIntegerField;
    CDS_CMApresExtratosDES_TPMOVTO: TStringField;
    CDS_CMApresExtratosNUM_DOCTO: TStringField;
    CDS_CMApresExtratosVLR_DOCTO: TFMTBCDField;
    CDS_CMApresExtratosIND_TIPO: TStringField;
    CDS_CMApresExtratosCHV_EXTRATO: TStringField;
    CDS_CMApresExtratosCOD_USUARIO: TIntegerField;
    CDS_CMApresExtratosDES_USUARIO: TStringField;
    CDS_CMApresExtratosTIP_CONCILIACAO: TStringField;
    CDS_CMApresPagtosVLR_TOTAL: TAggregateField;
    CDS_CMApresExtratosVLR_TOTAL: TAggregateField;
    CDS_ConcCaixaTotaisOBS: TStringField;
    SDS_CMExtratosDep: TSQLDataSet;
    DSP_CMExtratosDep: TDataSetProvider;
    CDS_CMExtratosDep: TClientDataSet;
    CDS_CMExtratosDepConciliado: TStringField;
    CDS_CMExtratosDepQUEM: TStringField;
    CDS_CMExtratosDepConciliar: TStringField;
    CDS_CMExtratosDepNUM_BANCO: TIntegerField;
    CDS_CMExtratosDepDES_BANCO: TStringField;
    CDS_CMExtratosDepNUM_AGENCIA: TStringField;
    CDS_CMExtratosDepNUM_CONTA: TStringField;
    CDS_CMExtratosDepDTA_EXTRATO: TDateField;
    CDS_CMExtratosDepCOD_TPMOVTO: TIntegerField;
    CDS_CMExtratosDepDES_TPMOVTO: TStringField;
    CDS_CMExtratosDepNUM_DOCTO: TStringField;
    CDS_CMExtratosDepVLR_DOCTO: TFMTBCDField;
    CDS_CMExtratosDepIND_TIPO: TStringField;
    CDS_CMExtratosDepCHV_EXTRATO: TStringField;
    CDS_CMExtratosDepCOD_USUARIO: TIntegerField;
    CDS_CMExtratosDepTIP_CONCILIACAO: TStringField;
    CDS_CMExtratosDepCOD_BANCO: TIntegerField;
    DS_CMDepositos: TDataSource;
    CDS_CMDepositos: TClientDataSet;
    CDS_CMDepositosCOD_LOJA: TStringField;
    CDS_CMDepositosConciliado: TStringField;
    CDS_CMDepositosQUEM: TStringField;
    CDS_CMDepositosConciliar: TStringField;
    CDS_CMDepositosDTA_VENC: TDateField;
    CDS_CMDepositosVLR_DOCTO: TFMTBCDField;
    CDS_CMDepositosVLR_DESCONTO: TFMTBCDField;
    CDS_CMDepositosVLR_ACRESCIMO: TFMTBCDField;
    CDS_CMDepositosDTA_DOCTO: TDateField;
    CDS_CMDepositosCOD_BANCO: TStringField;
    CDS_CMDepositosDES_BANCO: TStringField;
    CDS_CMDepositosOBS_TEXTO: TStringField;
    CDS_CMDepositosNUM_SEQ: TIntegerField;
    CDS_CMDepositosNUM_COMPL: TIntegerField;
    CDS_CMDepositosTIP_CONCILIACAO: TStringField;
    SDS_CMDepositos: TSQLDataSet;
    DSP_CMDepositos: TDataSetProvider;
    DS_CMExtratosDep: TDataSource;
    SDS_CMApresDepositos: TSQLDataSet;
    DSP_CMApresDepositos: TDataSetProvider;
    CDS_CMApresDepositos: TClientDataSet;
    CDS_CMApresDepositosCOD_LOJA: TStringField;
    CDS_CMApresDepositosRAZAO_SOCIAL: TStringField;
    CDS_CMApresDepositosCOMPROV: TStringField;
    CDS_CMApresDepositosCOMPROVANTE: TStringField;
    CDS_CMApresDepositosFORN: TStringField;
    CDS_CMApresDepositosFORNECEDOR: TStringField;
    CDS_CMApresDepositosNUM_DOCTO: TStringField;
    CDS_CMApresDepositosDTA_PAGTO: TDateField;
    CDS_CMApresDepositosVLR_DOCTO: TFMTBCDField;
    CDS_CMApresDepositosVLR_DESCONTO: TFMTBCDField;
    CDS_CMApresDepositosVLR_ACRESCIMO: TFMTBCDField;
    CDS_CMApresDepositosVLR_PAGTO: TFMTBCDField;
    CDS_CMApresDepositosPARCIAL: TStringField;
    CDS_CMApresDepositosDTA_VENC: TDateField;
    CDS_CMApresDepositosNUM_SERIE: TStringField;
    CDS_CMApresDepositosNUM_PREST: TStringField;
    CDS_CMApresDepositosCHV_PAGTO: TStringField;
    CDS_CMApresDepositosCOD_USUARIO: TIntegerField;
    CDS_CMApresDepositosDES_USUARIO: TStringField;
    CDS_CMApresDepositosTIP_CONCILIACAO: TStringField;
    CDS_CMApresDepositosVLR_TOTAL: TAggregateField;
    DS_CMApresExtratoDep: TDataSource;
    SDS_CMApresExtratosDep: TSQLDataSet;
    DSP_CMApresExtratosDep: TDataSetProvider;
    DS_CMApresDepositos: TDataSource;
    CDS_CMApresExtratosDep: TClientDataSet;
    CDS_CMApresExtratosDepNUM_BANCO: TIntegerField;
    CDS_CMApresExtratosDepDES_BANCO: TStringField;
    CDS_CMApresExtratosDepNUM_AGENCIA: TStringField;
    CDS_CMApresExtratosDepNUM_CONTA: TStringField;
    CDS_CMApresExtratosDepDTA_EXTRATO: TDateField;
    CDS_CMApresExtratosDepCOD_TPMOVTO: TIntegerField;
    CDS_CMApresExtratosDepDES_TPMOVTO: TStringField;
    CDS_CMApresExtratosDepNUM_DOCTO: TStringField;
    CDS_CMApresExtratosDepVLR_DOCTO: TFMTBCDField;
    CDS_CMApresExtratosDepIND_TIPO: TStringField;
    CDS_CMApresExtratosDepCHV_EXTRATO: TStringField;
    CDS_CMApresExtratosDepCOD_USUARIO: TIntegerField;
    CDS_CMApresExtratosDepDES_USUARIO: TStringField;
    CDS_CMApresExtratosDepTIP_CONCILIACAO: TStringField;
    CDS_CMApresExtratosDepVLR_TOTAL: TAggregateField;
    CDS_CMDepositosCOD_USUARIO: TIntegerField;
    CDS_CMDepositosUSU_LOJA: TIntegerField;
    CDS_CMDepositosNUM_DOCTO: TIntegerField;
    CDS_CMDepositosTXT_OBS: TStringField;
    CDS_CMApresDepositosNUM_SEQ: TIntegerField;
    CDS_CMApresDepositosNUM_COMPL: TIntegerField;
    CDS_CMDepositosRAZAO_SOCIAL: TStringField;
    procedure CDS_LojasBancoAfterScroll(DataSet: TDataSet);
    procedure CDS_CMApresExtratosAfterScroll(DataSet: TDataSet);
    procedure CDS_CMApresPagtosAfterScroll(DataSet: TDataSet);

    // ODIR ====================================================================

    // DIVERSOS ////////////////////////////////////////////////////////////////
    Procedure FechaTudoConciliacao;
    procedure CDS_CMApresDepositosAfterScroll(DataSet: TDataSet);
    procedure CDS_CMApresExtratosDepAfterScroll(DataSet: TDataSet);

    // ODIR ====================================================================

  private
    { Private declarations }
  public
    { Public declarations }
    sgDta1, sgDta2: String;
  end;

var
  DMConciliacao: TDMConciliacao;

implementation

uses UDMBelShop, UFrmBelShop, UFrmBancoExtratos, UFrmConciliacaoCaixa,
  UFrmApresConciliacao, Controls, cxTextEdit;

{$R *.dfm}

// =============================================================================
// Odir - INICIO ===============================================================
// =============================================================================
// Diversos - Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMConciliacao.FechaTudoConciliacao;
Var
  i: Integer;
  s: String;
Begin

  // Fecha Componentes DMConciliacao =====================================
  For i:=0 to DMConciliacao.ComponentCount-1 do
  Begin
    If DMConciliacao.Components[i] is TClientDataSet Then
     If (DMConciliacao.Components[i] as TClientDataSet).Active Then
      (DMConciliacao.Components[i] as TClientDataSet).Close;

    If DMConciliacao.Components[i] is TSQLQuery Then
     If (DMConciliacao.Components[i] as TSQLQuery).Active Then
      (DMConciliacao.Components[i] as TSQLQuery).Close;
  End;

  Try
    FrmConciliacaoCaixa.gCDS_V_Geral.Free;
    FrmConciliacaoCaixa.gCDS_V_Geral:=nil;
    FrmConciliacaoCaixa.gDS.Free;
    FrmConciliacaoCaixa.gDS:=nil;
  Except
  End;
end; // Diversos - Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// =============================================================================
// Odir - FIM ==================================================================
// =============================================================================

procedure TDMConciliacao.CDS_LojasBancoAfterScroll(
  DataSet: TDataSet);
begin
  FrmBancoExtratos.EdtCodLoja.Clear;
  FrmBancoExtratos.EdtDesLoja.Clear;
  If Not CDS_LojasBanco.IsEmpty Then
  Begin
    FrmBancoExtratos.EdtCodLoja.Text:=CDS_LojasBancoCOD_LOJA.AsString;
    FrmBancoExtratos.EdtDesLoja.Text:=CDS_LojasBancoRAZAO_SOCIAL.AsString;
  End;

end;

procedure TDMConciliacao.CDS_CMApresExtratosAfterScroll(DataSet: TDataSet);
begin
  If (Not CDS_CMApresExtratos.IsEmpty) and (Not CDS_CMExtratos.IsEmpty) Then
  Begin
    FrmApresConciliacao.Lab_OBS.Caption:='Observações ...';

    If Not CDS_CMExtratos.Locate('CHV_EXTRATO',CDS_CMApresExtratosCHV_EXTRATO.AsString,[]) Then
    Begin
      FrmApresConciliacao.Lab_OBS.Caption:='Movto Fora do Período Selecionado: '+
                                           FrmBancoExtratos.DtEdt_ConcDtaInicio.Text+' a '+
                                           FrmBancoExtratos.DtEdt_ConcDtaFim.Text;
    End;
  End;
end;

procedure TDMConciliacao.CDS_CMApresPagtosAfterScroll(DataSet: TDataSet);
begin

  If (Not CDS_CMApresPagtos.IsEmpty) and (Not CDS_CMPagtos.IsEmpty)Then
  Begin
    FrmApresConciliacao.Lab_OBS.Caption:='Observações ...';

    if Not CDS_CMPagtos.Locate('CHV_PAGTO',CDS_CMApresPagtosCHV_PAGTO.AsString,[]) Then
    Begin
      FrmApresConciliacao.Lab_OBS.Caption:='Movto Fora do Período Selecionado: '+
                                           FrmBancoExtratos.DtEdt_ConcDtaInicio.Text+' a '+
                                           FrmBancoExtratos.DtEdt_ConcDtaFim.Text;
    End;
  End;
end;

procedure TDMConciliacao.CDS_CMApresDepositosAfterScroll(DataSet: TDataSet);
begin
  If (Not CDS_CMApresDepositos.IsEmpty) and (Not CDS_CMDepositos.IsEmpty)Then
  Begin
    FrmApresConciliacao.Lab_OBS.Caption:='Observações ...';

    If Not CDS_CMDepositos.Locate('NUM_SEQ; NUM_COMPL',VarArrayOf([CDS_CMApresDepositosNUM_SEQ.AsString,CDS_CMApresDepositosNUM_COMPL.AsString]),[]) Then
    Begin
      FrmApresConciliacao.Lab_OBS.Caption:='Movto Fora do Período Selecionado: '+sgDta1+' a '+sgDta2;
    End;
  End;

end;

procedure TDMConciliacao.CDS_CMApresExtratosDepAfterScroll(DataSet: TDataSet);
begin
  If (Not CDS_CMApresExtratosDep.IsEmpty) and (Not CDS_CMExtratosDep.IsEmpty) Then
  Begin
    FrmApresConciliacao.Lab_OBS.Caption:='Observações ...';

    If Not CDS_CMExtratosDep.Locate('CHV_EXTRATO',CDS_CMApresExtratosDepCHV_EXTRATO.AsString,[]) Then
    Begin
      FrmApresConciliacao.Lab_OBS.Caption:='Movto Fora do Período Selecionado: '+sgDta1+' a '+sgDta2;
    End;
  End;

end;

end.

