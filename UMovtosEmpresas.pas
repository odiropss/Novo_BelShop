{
Comentar 11

timestamp-timestamp:
  - 1 hora = 0,041666667 Round 2 = 0,040
  - 2 hora = 0,083333334 Round 2 = 0,080
  - 3 hora = 0,125       Round 2 = 0,013
  - 4 hora = 0,166666667 Round 2 = 0,017
  - 5 hora = 0,208333333 Round 2 = 0,21
=============

select M.codfilial, m.Ind_Tipo,
case
  when m.ind_tipo in ('EC', 'EF', 'EM', 'EV')  then
      cast(lpad(extract(day    from max(m.dta_ref)),2,'0') as varchar(2))||'-'||
      cast(lpad(extract(month  from max(m.dta_ref)),2,'0') as varchar(2))||'-'||
      cast(lpad(extract(year   from max(m.dta_ref)),4,'0') as varchar(4))
  else
      cast(lpad(extract(day    from max(m.dta_atualizacao)),2,'0') as varchar(2))||'-'||
      cast(lpad(extract(month  from max(m.dta_atualizacao)),2,'0') as varchar(2))||'-'||
      cast(lpad(extract(year   from max(m.dta_atualizacao)),4,'0') as varchar(4))
end Dta_ult_Atualizacao,
cast(max(m.dta_atualizacao) as time) hora_Ult_Atualizacao,
Case
 When current_date-Cast(max(m.dta_atualizacao) as date)>0 Then
   current_date-Cast(max(m.dta_atualizacao) as date)
End Nao_Atualizou,
count(m.ind_tipo)
from MOVTOS_EMPRESAS m
where m.codfilial='06'
group by M.codfilial, m.Ind_Tipo
order by 1,3

select *
From MOVTOS_EMPRESAS m
Where m.ind_tipo='OK'
order by m.dta_atualizacao

select *
From MOVTOS_EMPRESAS m
Where m.ind_tipo='OK'
and m.nomefornecedor like '%: 10%'
order by m.dta_atualizacao

select count(m.ind_tipo) Total_rec
From MOVTOS_EMPRESAS m
Where m.ind_tipo='OK'


delete From MOVTOS_EMPRESAS m
Where m.ind_tipo='OK'

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
bProcDemanda    = DM (Demandas)
bProcTransito   = TR (Transitos)
bProcUltCompra  = UC (Ultimas Compras)
bProcTransfSai  = TS (Trasferencias de Saida)
bProcTransfEnt  = TE (Trasferencias de Entrada)
bProcPcCusto    = PC (Precos de Custo)

== Movtos BAP ===================================
bProcAjTrAvPe   = AP (Ajustes de Estoques e Transferencias de Avarias e Perdas)
bProcBonifca    = BF (Bonificações)
bProcDescFinan  = DF (Desconto Financeiro)
bProcPagtoST    = PS (Pagamento Substituição Tributária)
bProcVlrContab  = VC (Valor Contabil)
=================================================

bProcComprov (Comprovantes) =====================
bProcEstFinal (Estoque Financeiro):
  (EC) Estoque Financeiro por Valor de Compra (Mes)
  (EF) Estoque Fisico (Mes)
  (EM) Estoque Financeiro por Valor Margem (Mes)
  (EV) Estoque Financeiro por Valor Venda (Mes)
=================================================

bProcSaldoProd (Saldo Produto Mes) ==============
=================================================
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

}
unit UMovtosEmpresas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvXPCore, JvXPButtons, Grids, DBGrids, QExtCtrls,
  IBQuery, IBDatabase, ExtCtrls, DBXpress, StdCtrls, ShellApi, DB, WinInet;

type
  TFrmMovtosEmpresas = class(TForm)
    Dbg_Empresas: TDBGrid;
    Panel1: TPanel;
    Bt_Atualizar: TJvXPButton;
    EdtParamStr: TEdit;
    Lbx_EmpresasProcessar: TListBox;
    Bt_Estoques: TJvXPButton;

    // Odir ====================================================================
    Procedure ParaProcessamentoLoja; // Loja Ultrapassou 1 Hora

    Function  ConectaCentralTrocas: Boolean;

    Function  ConectaMPMS: Boolean;
    Procedure CriaQueryIB(sDataBase, sTransaction: String; Var IBQ_Free: TIBQuery;
                          bMatriz, bCriaIBQ: Boolean);
                        // sDataBase    = Database a Conectar
                        // sTransaction = Transaction a Conectar
                        // IBQ_Free     = Nome do TIBQuery a Destruir e Reconstruir
                        // bMatriz      = Se Conexão é Matriz
                        // Se Destruir e Reconstruir IBQuery

    Function  ConexaoEmpIndividual(sDataBase, sTransaction, sProcedimento: String): Boolean;
              // Procedimento: (A) Abrir Conexão (F) Fechar COnexão

    Function  BuscaCodLista(sLoja: String): String;

    Procedure VerificaProcessamento;

    Procedure AtualizaProdutos;//(sDta: String);
    Procedure AtualizaLP(sDta: String);
    Procedure AtualizaForn(sDta: String);

    Procedure Es_Finan_Curva_ABC(sCodLoja: String);

    // Salão
    Procedure AtualizaServicosSalao;
    Procedure AtualizaPercComissoesSalao;
    Procedure AtualizaPercComissoesHabProf;

    Procedure AtualizaTabelaEstoque(sCodLoja: String);

    // Odir =======================================================================

    procedure FormCreate(Sender: TObject);
    procedure Bt_AtualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Bt_EstoquesClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

const //  RODA PROGRAMA NA BARRA DE TAREFAS
  WM_TRAYICON = WM_USER+1;

var
  FrmMovtosEmpresas: TFrmMovtosEmpresas;

  bgNewIndTipo: Boolean; // Se Insere Ind_tipo=OK - INSERT INTO movtos_empresas (ind_tipo,

  sCodEmpresa: String;
  iCodLojaLinx: Integer; 

  // Oque Processar ////////////////////////////////////////////////////////////
  bProcEstoque, // Processa Tabela ESTOQUE
  bProcDemanda , bProcTransito , bProcUltCompra,
  bProcEstFinal, bProcTransfSai, bProcTransfEnt,
  bProcPcCusto , bProcComprov,

  // Movtos BAP
  bProcAjTrAvPe, bProcBonifca, bProcDescFinan, bProcPagtoST, bProcVlrContab,

  // Saldo Produto Mes
  bProcSaldoProd: Boolean;
  //////////////////////////////////////////////////////////////////////////////

  bExecutaDireto: Boolean;

  IBQ_Consulta: TIBQuery;
  IBQ_MPMS            : TIBQuery;

  TD : TTransactionDesc; // Ponteiro de Transação

  bProcessou: Boolean; // Se Inicio Processamento
  bExcluir: Boolean;   // Se é Para Excluir indicativo de Data Processada
  bgConexaoLocal: Boolean; // Se Conexão com o Servidor da Matriz é Local - Verifica a Existencia do Arquivo "ConexaoExterna.ini"

  bgJaProcessouUmaVez: Boolean;

  iNumTentativas: Integer;
  sgMensagem: String;

  sgDtaServidor: String;

  sgDML, sgValues: String;

  Flags : Cardinal; // Verifica Internet Ativo - Encerra Necessario

implementation

uses UDMConexoes, UDMMovtosEmpresas, DK_Procs1, DateUtils, IBCustomDataSet;

{$R *.dfm}

// Odir

// Atualiza Dados da Tabela ESTOQUE ============================================
Procedure TFrmMovtosEmpresas.AtualizaTabelaEstoque(sCodLoja: String);
var
  bSiga: Boolean;

  MySql,
  sHora,
  sgDML, sgValues: String;

  i: Integer;
begin
  sHora:=TimeToStr(Time);

  // ============================================================
  // Busca ESTOQUE ==============================================
  // ============================================================
  DateSeparator:='.';
  DecimalSeparator:='.';

  If sCodLoja='50' Then
   ConectaCentralTrocas;

  // Cria Query da Empresa ------------------------------------
  If iCodLojaLinx=0 Then // SIDICOM
  Begin
    CriaQueryIB('IBDB_'+sCodLoja, 'IBT_'+sCodLoja, IBQ_Consulta, False, True);

    If DMMovtosEmpresas.IBQ_EstoqueLoja.Active Then
     DMMovtosEmpresas.IBQ_EstoqueLoja.Close;

    DMMovtosEmpresas.IBQ_EstoqueLoja.Database:=IBQ_Consulta.Database;
    DMMovtosEmpresas.IBQ_EstoqueLoja.Transaction:=IBQ_Consulta.Transaction;

    MySql:=' SELECT'+
           ' e.codfilial, e.codproduto, e.saldoatual, e.pedidopendente,'+
           ' e.zonaendereco, e.corredor, e.prateleira, e.gaveta,'+
           ' e.cusmedvalor, e.customedio,'+
           ' e.lastprecocompra, e.lastcustomedio, e.estoqueideal, e.estoquemaximo,'+
           ' e.dataalteracadastro, e.dataalteraestoque, e.dataalteraestoque_ped,'+
           ' coalesce(p.principalfor,''000000'') principalfor,'+
           ' current_date DTA_ATUALIZACAO, '+QuotedStr(sHora)+' HRA_ATUALIZACAO'+
           ' FROM ESTOQUE e'+
           '      LEFT JOIN PRODUTO p on e.codproduto=p.codproduto'+
           ' WHERE e.codfilial='+QuotedStr(sCodLoja);
    DMMovtosEmpresas.IBQ_EstoqueLoja.Close;
    DMMovtosEmpresas.IBQ_EstoqueLoja.SQL.Clear;
    DMMovtosEmpresas.IBQ_EstoqueLoja.SQL.Add(MySql);
  End; // If iCodLojaLinx=0 Then // SIDICOM

  // Linx ======================================================================
  If iCodLojaLinx<>0 Then // LINX
  Begin
    MySql:=' SELECT '+
           QuotedStr(sCodLoja)+' codfilial,'+
           ' lp.cod_auxiliar codproduto,'+
           ' lpd.quantidade saldoatual, 0.0000 pedidopendente,'+
           ' 0 zonaendereco, ''000'' corredor, ''000'' prateleira, ''0000'' gaveta,'+
           ' lpd.custo_medio cusmedvalor, lpd.custo_medio customedio,'+
           ' COALESCE((SELECT FIRST 1 m.valor_liquido'+
           '           FROM LINXMOVIMENTO m'+
           '           WHERE m.empresa = '+IntToStr(iCodLojaLinx)+
           '           AND   m.operacao = ''E'''+
           '           AND   ((m.tipo_transacao=''S'') OR (m.tipo_transacao=''E'') OR (m.tipo_transacao IS NULL))'+
           '           AND   m.cancelado=''N'''+
           '           AND   m.excluido=''N'''+
           '           AND   m.cod_produto = lpd.cod_produto'+
           '           ORDER BY m.data_documento DESC), 0.0000) lastprecocompra,'+
           ' lpd.custo_medio lastcustomedio,'+
           ' 0 estoqueideal, 0 estoquemaximo,'+
           ' lp.dt_update dataalteracadastro,'+
           ' lp.dt_update dataalteraestoque,'+
           ' lp.dt_update dataalteraestoque_ped,'+
           ' pr.principalfor principalfor,'+
           ' current_date DTA_ATUALIZACAO, '+QuotedStr(sHora)+' HRA_ATUALIZACAO'+

           ' FROM LINXPRODUTOSDETALHES lpd'+
           '          LEFT JOIN LINXPRODUTOS lp ON lp.cod_produto = lpd.cod_produto'+
           '          LEFT JOIN PRODUTO pr ON pr.codproduto = lp.cod_auxiliar'+
           ' WHERE lpd.empresa = '+IntToStr(iCodLojaLinx)+
           ' AND   lp.cod_auxiliar IS NOT NULL';
    DMMovtosEmpresas.CDS_LojaLinx.Close;
    DMMovtosEmpresas.SDS_LojaLinx.CommandText:=MySql;
    DMMovtosEmpresas.CDS_LojaLinx.Open;
  End; // If iCodLojaLinx<>0 Then // LINX

  // Abre Query da no Banco de Dados da Loja -----------------
  bSiga:=True;
  If iCodLojaLinx=0 Then // SIDICOM
  Begin
    i:=0;

    bSiga:=False;
    While Not bSiga do
    Begin
      Try
        DMMovtosEmpresas.IBQ_EstoqueLoja.Open;
        bSiga:=True;
      Except
        Inc(i);
      End; // Try

      If i>2 Then
       Break;
    End; // While Not bSiga do
  End; // If iCodLojaLinx=0 Then // SIDICOM

  // Processamento ==============================================================
  If bSiga Then // Consulta Transferencias de Entrada
  Begin
    Try
      // Monta Transacao  -------------------------------------------
      TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
      TD.IsolationLevel:=xilREADCOMMITTED;
      DMMovtosEmpresas.SQLC.StartTransaction(TD);

      DateSeparator:='.';
      DecimalSeparator:='.';

      sgDML:=' UPDATE OR INSERT INTO ESTOQUE ('+
             ' CODFILIAL, CODPRODUTO, SALDOATUAL, PEDIDOPENDENTE,'+
             ' ZONAENDERECO, CORREDOR, PRATELEIRA, GAVETA,'+
             ' CUSMEDVALOR, CUSTOMEDIO, LASTPRECOCOMPRA, LASTCUSTOMEDIO,'+
             ' ESTOQUEIDEAL, ESTOQUEMAXIMO,'+
             ' DATAALTERACADASTRO, DATAALTERAESTOQUE, DATAALTERAESTOQUE_PED,'+
             ' PRINCIPALFOR,'+
             ' DTA_ATUALIZACAO, HRA_ATUALIZACAO)'+

            ' VALUES (';


      // Atualiza Estoques da Loja ----------------------------------
      If iCodLojaLinx=0 Then // SIDICOM
      Begin
        While Not DMMovtosEmpresas.IBQ_EstoqueLoja.Eof do
        Begin
          sgValues:='';
          For i:=0 to DMMovtosEmpresas.IBQ_EstoqueLoja.FieldCount-1 do
          Begin
            // ULTIMO CAMPO - HRA_ATUALIZACAO ==================================
            If Trim(DMMovtosEmpresas.IBQ_EstoqueLoja.Fields[i].FieldName)='HRA_ATUALIZACAO' Then
            Begin
              sgValues:=sgValues+QuotedStr(DMMovtosEmpresas.IBQ_EstoqueLoja.Fields[i].AsString)+')';
            End // If Trim(DMMovtosEmpresas.IBQ_EstoqueLoja.Fields[i].FieldName)='HRA_ATUALIZACAO' Then

            // Grava Resto do Registro =========================================
            Else
             Begin
               If Trim(DMMovtosEmpresas.IBQ_EstoqueLoja.Fields[i].AsString)<>'' Then
                sgValues:=sgValues+QuotedStr(DMMovtosEmpresas.IBQ_EstoqueLoja.Fields[i].AsString)+', '
               Else
                sgValues:=sgValues+'NULL, ';
             End;
          End; // For i:=0 to DMMovtosEmpresas.IBQ_EstoqueLoja.FieldCount-1 do

          // UPDATE OR INSERT INTO MCLI ========================================
          MySql:=sgDML+sgValues+' MATCHING (CODFILIAL, CODPRODUTO)';
          DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

          DMMovtosEmpresas.IBQ_EstoqueLoja.Next;
        End; // While Not DMMovtosEmpresas.IBQ_EstoqueLoja.Eof do
        DMMovtosEmpresas.IBQ_EstoqueLoja.Close;
      End; // If iCodLojaLinx=0 Then // SIDICOM

      If iCodLojaLinx<>0 Then // LINX
      Begin
        While Not DMMovtosEmpresas.CDS_LojaLinx.Eof do
        Begin
          sgValues:='';
          For i:=0 to DMMovtosEmpresas.CDS_LojaLinx.FieldCount-1 do
          Begin
            // ULTIMO CAMPO - HRA_ATUALIZACAO ==================================
            If Trim(DMMovtosEmpresas.CDS_LojaLinx.Fields[i].FieldName)='HRA_ATUALIZACAO' Then
             Begin
               sgValues:=sgValues+QuotedStr(DMMovtosEmpresas.CDS_LojaLinx.Fields[i].AsString)+')';
             End // If Trim(DMMovtosEmpresas.CDS_LojaLinx.Fields[i].FieldName)='HRA_ATUALIZACAO' Then
            Else
             Begin
               // Grava Resto do Registro
               If Trim(DMMovtosEmpresas.CDS_LojaLinx.Fields[i].AsString)<>'' Then
                sgValues:=sgValues+QuotedStr(DMMovtosEmpresas.CDS_LojaLinx.Fields[i].AsString)+', '
               Else
                sgValues:=sgValues+'NULL, ';
             End;
          End; // For i:=0 to DMMovtosEmpresas.CDS_LojaLinx.FieldCount-1 do

          // UPDATE OR INSERT INTO MCLI ========================================
          MySql:=sgDML+sgValues+' MATCHING (CODFILIAL, CODPRODUTO)';
          DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

          DMMovtosEmpresas.CDS_LojaLinx.Next;
        End; // While Not DMMovtosEmpresas.CDS_LojaLinx.Eof do
        DMMovtosEmpresas.CDS_LojaLinx.Close;
      End; // If iCodLojaLinx<>0 Then // LINX

      DMMovtosEmpresas.SQLC.Commit(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
    Except
      on e : Exception do
      Begin
        DMMovtosEmpresas.SQLC.Rollback(TD);
        DMMovtosEmpresas.IBQ_EstoqueLoja.Close;

        DateSeparator:='/';
        DecimalSeparator:=',';

      End; // on e : Exception do
    End; // Try
  End; // If bSiga Then // Consulta Transferencias de Entrada

  If sCodLoja='50' Then
   ConexaoEmpIndividual('IBDB_50', 'IBT_50', 'F');

  DateSeparator:='/';
  DecimalSeparator:=',';

End; // Atualiza Dados da Tabela ESTOQUE =======================================

Procedure TFrmMovtosEmpresas.ParaProcessamentoLoja; // Loja Ultrapassou 1 Hora
Begin
  bProcDemanda  :=False;
  bProcTransito :=False;
  bProcUltCompra:=False;
  bProcTransfSai:=False;
  bProcTransfEnt:=False;
  bProcPcCusto  :=False;
  bProcComprov  :=False;

  bProcAjTrAvPe :=False;
  bProcBonifca  :=False;
  bProcDescFinan:=False;
  bProcPagtoST  :=False;
  bProcVlrContab:=False;
  bProcSaldoProd:=False;
  bProcEstFinal :=False;

  bProcEstoque  :=False;
End;

Function TFrmMovtosEmpresas.BuscaCodLista(sLoja: String): String;
Var
  MySql: String;
Begin
  MySql:=' SELECT e.cod_listaPre'+
         ' FROM EMP_CONEXOES e'+
         ' WHERE e.Cod_Filial='+QuotedStr(sLoja);
  DMMovtosEmpresas.CDS_BuscaRapida.Close;
  DMMovtosEmpresas.SDS_BuscaRapida.CommandText:=MySql;
  DMMovtosEmpresas.CDS_BuscaRapida.Open;
  Result:=DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('Cod_ListaPre').AsString;
  DMMovtosEmpresas.CDS_BuscaRapida.Close;

  If Trim(Result)='' Then
  Begin
    MySql:=' SELECT e.cod_listaPre'+
           ' FROM EMP_CONEXOES e'+
           ' WHERE e.Cod_Filial=''99''';
    DMMovtosEmpresas.CDS_BuscaRapida.Close;
    DMMovtosEmpresas.SDS_BuscaRapida.CommandText:=MySql;
    DMMovtosEmpresas.CDS_BuscaRapida.Open;
    Result:=DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('Cod_ListaPre').AsString;
    DMMovtosEmpresas.CDS_BuscaRapida.Close;
  End;

End; // Busca Lista de Preco da Loja ///////////////////////////////////////////

// Atualiza Comissões de Habilidades e Comissão Geral do Profissionais >>>>>>>>>
Procedure TFrmMovtosEmpresas.AtualizaPercComissoesHabProf;
Var
  MySql: String;
Begin
  // Atualiza Percentuais das Habilidades ======================================
  MySql:=' UPDATE sal_prof_habilidades ph'+
         ' SET ph.per_comissao_hab=COALESCE((SELECT FIRST 1 DISTINCT ps.per_comissao_serv'+
         '                                   FROM sal_prof_habilidades ps'+
         '                                   WHERE ps.cod_loja=ph.cod_loja'+
         '                                   AND ps.cod_profissional=ph.cod_profissional'+
         '                                   AND ps.cod_habilidade=ph.cod_habilidade'+
         '                                   AND ps.cod_servico IS NOT NULL'+
         '                                   AND ps.per_comissao_serv>0'+
         '                                   GROUP BY 1'+
         '                                   ORDER BY COUNT(DISTINCT ps.per_comissao_serv) DESC),0)'+
         ' WHERE ph.per_comissao_hab=0'+
         ' AND ph.cod_servico IS NULL';
  DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

  // Atualiza Percentuais da Camissão Geral dos Profissionais ==================
//  MySql:=' UPDATE sal_profissionais p'+
//         ' SET p.per_comissao=COALESCE((SELECT FIRST 1 DISTINCT ps.per_comissao_hab'+
//         '                              FROM sal_prof_habilidades ps'+
//         '                              WHERE ps.cod_loja=p.cod_loja'+
//         '                              AND ps.cod_profissional=p.cod_profissional'+
//         '                              AND ps.cod_servico IS NULL'+
//         '                              AND ps.per_comissao_hab>0'+
//         '                              GROUP BY 1'+
//         '                              ORDER BY COUNT(DISTINCT ps.per_comissao_hab) DESC),0)'+
//         ' WHERE p.tip_pessoa='+QuotedStr('P')+
//         ' AND p.ind_ativo='+QuotedStr('SIM')+
//         ' AND p.per_comissao=0';
//  DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

End; // Atualiza Comissões de Habilidades e Comissão Geral do Profissionais >>>>

// Atualiza Comissões de Serviços de Profissionais de Salão >>>>>>>>>>>>>>>>>>>>
Procedure TFrmMovtosEmpresas.AtualizaPercComissoesSalao;
Var
  i: Integer;
  MySqlDML, MySql: String;
  sCodProd, sCampo: String;
  sPerComissao: String;
  bSiga: Boolean;
Begin

  // Conecta MPMS ==============================================================
  i:=0;
  bSiga:=False;
  While Not bSiga do
  Begin
    If ConectaMPMS Then
      bSiga:=True
    Else
      Inc(i);

    If i>99 Then
      Break;
  End; // While Not bSiga do

  If Not bSiga Then
   Exit;

  // Atualiza Habilidade de PROMOÇÕES ==========================================
  If DMMovtosEmpresas.SQLC.InTransaction Then
   DMMovtosEmpresas.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMMovtosEmpresas.SQLC.StartTransaction(TD);
  Try // Geral
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Busca Serviços a Atualiza a Comissão ====================================
    For i:=1 to 8 do
    Begin
      MySql:=' SELECT ph.cod_loja, ph.cod_profissional, se.cod_sidicom,'+
             ' ph.cod_habilidade, ph.cod_servico, ph.per_comissao_serv'+

             ' FROM  sal_profissionais pr, sal_prof_habilidades ph, sal_hab_serv se'+

             ' WHERE pr.cod_loja=ph.cod_loja'+
             ' AND pr.cod_profissional=ph.cod_profissional'+
             ' AND ph.cod_servico=se.cod_habserv'+
             ' AND ph.cod_servico is not null'+
             ' AND se.tip_habserv='+QuotedStr('S')+
             ' AND pr.tip_pessoa='+QuotedStr('P')+
             ' AND pr.ind_sid_tabelaproc='+QuotedStr(IntToStr(i))+
             ' ORDER BY 3,4,5';
      DMMovtosEmpresas.CDS_Busca.Close;
      DMMovtosEmpresas.SDS_Busca.CommandText:=MySql;
      DMMovtosEmpresas.CDS_Busca.Open;

      sCodProd:='';
      While Not DMMovtosEmpresas.CDS_Busca.Eof do
      Begin
        If scodProd<>DMMovtosEmpresas.CDS_Busca.FieldBYName('cod_sidicom').AsString Then
        Begin
          If Trim(MySqlDML)<>'' Then
          Begin
            MySqlDML:=MySqlDML+')';
            DMMovtosEmpresas.SQLC.Execute(MySqlDML,nil,nil);
            MySqlDML:='';
          End;

          // Busca Percentua ===================================================
          sCampo:='Tabela'+IntToStr(i)+' Per_Comissao';
          MySql:=' SELECT '+sCampo+
                 ' FROM procomis c'+
                 ' WHERE c.codnivelcomissao=1'+
                 ' AND c.codproduto='+QuotedStr(DMMovtosEmpresas.CDS_Busca.FieldBYName('cod_sidicom').AsString);
          IBQ_MPMS.Close;
          IBQ_MPMS.SQL.Clear;
          IBQ_MPMS.SQL.Add(MySql);
          IBQ_MPMS.Open;
          sPerComissao:=f_Troca(',','.',IBQ_MPMS.FieldByName('Per_Comissao').AsString);
          IBQ_MPMS.Close;

          If Trim(sPerComissao)='' Then
           sPerComissao:='0';

          MySqlDML:=' UPDATE SAL_PROF_HABILIDADES cs'+
                    ' SET cs.per_comissao_serv='+QuotedStr(sPerComissao)+
                    ' WHERE ('+
                    ' (cs.cod_loja='+QuotedStr(DMMovtosEmpresas.CDS_Busca.FieldBYName('Cod_Loja').AsString)+
                    '  AND cs.cod_profissional='+QuotedStr(DMMovtosEmpresas.CDS_Busca.FieldBYName('Cod_Profissional').AsString)+
                    '  AND cs.cod_habilidade='+DMMovtosEmpresas.CDS_Busca.FieldBYName('Cod_Habilidade').AsString+
                    '  AND cs.cod_servico='+DMMovtosEmpresas.CDS_Busca.FieldBYName('Cod_Servico').AsString+')';

          DMMovtosEmpresas.CDS_Busca.Next;
        End; // If scodProd<>DMMovtosEmpresas.CDS_Busca.FieldBYName('cod_sidicom').AsString Then

        MySqlDML:=
         MySqlDML+' OR '+
                  ' (cs.cod_loja='+QuotedStr(DMMovtosEmpresas.CDS_Busca.FieldBYName('Cod_Loja').AsString)+
                  '  AND cs.cod_profissional='+QuotedStr(DMMovtosEmpresas.CDS_Busca.FieldBYName('Cod_Profissional').AsString)+
                  '  AND cs.cod_habilidade='+DMMovtosEmpresas.CDS_Busca.FieldBYName('Cod_Habilidade').AsString+
                  '  AND cs.cod_servico='+DMMovtosEmpresas.CDS_Busca.FieldBYName('Cod_Servico').AsString+')';

        scodProd:=DMMovtosEmpresas.CDS_Busca.FieldBYName('cod_sidicom').AsString;

        DMMovtosEmpresas.CDS_Busca.Next;
      End; // While Not DMMovtosEmpresas.CDS_Busca.Eof do
    End; // For i:=1 to 8 do
    DMMovtosEmpresas.CDS_Busca.Close;

    // Atualiza o Ultimo
    MySqlDML:=MySqlDML+')';
    DMMovtosEmpresas.SQLC.Execute(MySqlDML,nil,nil);
    MySqlDML:='';

    // Atualiza Transacao =======================================
    DMMovtosEmpresas.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    DMMovtosEmpresas.CDS_Pesquisa.Close;
    DMMovtosEmpresas.SDS_BuscaRapida.Close;
    DMMovtosEmpresas.CDS_Busca.Close;
    IBQ_MPMS.Close;

  Except
    on e : Exception do
    Begin
      // Abandona Transacao =====================================
      DMMovtosEmpresas.SQLC.Rollback(TD);

      DMMovtosEmpresas.CDS_Pesquisa.Close;
      DMMovtosEmpresas.SDS_BuscaRapida.Close;
      DMMovtosEmpresas.CDS_Busca.Close;
      IBQ_MPMS.Close;

      DateSeparator:='/';
      DecimalSeparator:=',';

      MySql:=' DELETE FROM movtos_empresas m'+
             ' Where m.Ind_Tipo=''OK'''+
             ' And m.NomeFornecedor=''Comissões Servicos Salao''';
      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

      sgMensagem:='Comissões Servicos Salao-'+e.Message;
      sgMensagem:=copy(sgMensagem,1,200);
      MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
             ' Values ('+
             QuotedStr('Er')+', '+
             QuotedStr(sgMensagem)+', '+
             QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

    End; // on e : Exception do
  End; // Try // Geral

End; // Atualiza Comissões de Serviços de Profissionais de Salão >>>>>>>>>>>>>>>

// Atualiza Serviços de Profissionais de Salão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmMovtosEmpresas.AtualizaServicosSalao;
Var
  MySql: String;
  sCodigo, sNome, sAbrev: String;
  bSiga: Boolean;
  cPreco: Currency;
  sCodHab, sCodServ: String;
  i: Integer;
begin
  // Conecta MPMS ==============================================================
  i:=0;
  bSiga:=False;
  While Not bSiga do
  Begin
    If ConectaMPMS Then
      bSiga:=True
    Else
      Inc(i);

    If i>99 Then
      Break;
  End; // While Not bSiga do

  If Not bSiga Then
   Exit;

  // Atualiza Habilidade de PROMOÇÕES ==========================================
  If DMMovtosEmpresas.SQLC.InTransaction Then
   DMMovtosEmpresas.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMMovtosEmpresas.SQLC.StartTransaction(TD);
  Try // Geral
    DateSeparator:='.';
    DecimalSeparator:='.';

    //==========================================================================
    // Inicia Analise de Serviços ==============================================
    //==========================================================================
    sCodHab:='';
    cPreco:=0;

    // Busca Abreviaturas da Habilidades =======================================
    MySql:=' SELECT h.des_abreviatura, h.des_habserv'+
           ' FROM sal_hab_serv h'+
           ' WHERE h.tip_habserv='+QuotedStr('H')+
           ' ORDER BY 1';
    DMMovtosEmpresas.CDS_Busca.Close;
    DMMovtosEmpresas.SDS_Busca.CommandText:=MySql;
    DMMovtosEmpresas.CDS_Busca.Open;

    // Busca Servicos no SIDICOM
    MySql:=' SELECT'+
           ' CASE';

           DMMovtosEmpresas.CDS_Busca.First;
           While Not DMMovtosEmpresas.CDS_Busca.Eof do
           Begin
             sNome:=Trim(DMMovtosEmpresas.CDS_Busca.FieldBYName('des_habserv').AsString);
             sAbrev:=Trim(DMMovtosEmpresas.CDS_Busca.FieldBYName('des_abreviatura').AsString);

             If sNome='CABELO' Then
             Begin
               MySql:=
                MySql+'  WHEN (TRIM(p.apresentacao)='+QuotedStr(sAbrev)+') or (TRIM(p.apresentacao)=''SALAO'') THEN'+
                      '      '+QuotedStr(sNome);
             End;

             If sNome<>'CABELO' Then
             Begin
               MySql:=
                MySql+'  WHEN TRIM(p.apresentacao)='+QuotedStr(sAbrev)+' THEN'+
                      '      '+QuotedStr(sNome);
              End;

             DMMovtosEmpresas.CDS_Busca.Next;
           End; // While Not DMMovtosEmpresas.CDS_Busca.Eof do

    MySql:=
     MySql+'   WHEN (POSITION('' '', p.apresentacao)<2) OR (TRIM(SUBSTRING(p.apresentacao FROM 1 FOR 1))=''*'')  THEN'+
           '      ''HABILIDADE DESCONTINUADA''';

           DMMovtosEmpresas.CDS_Busca.First;
           While Not DMMovtosEmpresas.CDS_Busca.Eof do
           Begin
             sNome:=Trim(DMMovtosEmpresas.CDS_Busca.FieldBYName('des_habserv').AsString);
             sAbrev:=Trim(DMMovtosEmpresas.CDS_Busca.FieldBYName('des_abreviatura').AsString);

             If sNome='CABELO' Then
             Begin
               MySql:=
                MySql+'  WHEN (TRIM(SUBSTRING(p.apresentacao FROM 1 FOR (POSITION('' '', p.apresentacao)-1)))='+QuotedStr(sAbrev)+') OR'+
                      '       (TRIM(SUBSTRING(p.apresentacao FROM 1 FOR (POSITION('' '', p.apresentacao)-1)))=''SALAO'') THEN'+
                      '      '+QuotedStr(sNome);
             End;

             If sNome<>'CABELO' Then
             Begin
               MySql:=
                MySql+'  WHEN TRIM(SUBSTRING(p.apresentacao FROM 1 FOR (POSITION('' '', p.apresentacao)-1)))='+QuotedStr(sAbrev)+' THEN'+
                      '      '+QuotedStr(sNome);
             End;

             DMMovtosEmpresas.CDS_Busca.Next;
           End; // While Not DMMovtosEmpresas.CDS_Busca.Eof do
    DMMovtosEmpresas.CDS_Busca.Close;

    MySql:=
     MySql+'   ELSE'+
           '     ''SEM HABILIDADE'''+
           ' END Habilidade,'+

           ' p.codproduto Cod_SIDICOM, p.apresentacao Servico,'+
           ' CASE'+
           '   WHEN p.situacaopro=0 THEN ''Ativo'''+
           '   WHEN p.situacaopro=1 THEN ''Bloqueado'''+
           '   WHEN p.situacaopro=2 THEN ''Excluido'''+
           '   WHEN p.situacaopro=3 THEN ''Não Compra'''+
           '   WHEN p.situacaopro=4 THEN ''Não Venda'''+
           ' END Situacao,'+

           ' CASE'+
           '   WHEN p.situacaopro=0 THEN ''SIM'''+
           '   Else ''NAO'''+
           ' End Ativo,'+

           ' COALESCE(c.tabela1,0) COMISSAO1, COALESCE(c.tabela2,0) COMISSAO2,'+
           ' COALESCE(c.tabela3,0) COMISSAO3, COALESCE(c.tabela4,0) COMISSAO4,'+
           ' COALESCE(c.tabela5,0) COMISSAO5, COALESCE(c.tabela6,0) COMISSAO6,'+
           ' COALESCE(c.tabela7,0) COMISSAO7, COALESCE(c.tabela8,0) COMISSAO8'+

           ' FROM produto p'+
           '      Left Join procomis c  on c.codproduto=p.codproduto'+
           '                           AND c.codnivelcomissao=1'+
           ' WHERE p.principalfor=''000500'''+
           ' AND p.codproduto BETWEEN ''500000'' AND ''599999'''+
           ' ORDER BY 1, 3';
    IBQ_MPMS.Close;
    IBQ_MPMS.SQL.Clear;
    IBQ_MPMS.SQL.Add(MySql);
    IBQ_MPMS.Open;

    While Not IBQ_MPMS.Eof do
    Begin

      bSiga:=True;

      //========================================================================
      // Habilidade = HABILIDADE DESCONTINUADA =================================
      //========================================================================
      If Trim(IBQ_MPMS.FieldByName('Habilidade').AsString)='HABILIDADE DESCONTINUADA' Then
      Begin
        bSiga:=False;

        // Desativa Serviço ====================================================
        MySql:=' SELECT s.cod_habserv cod_servico'+
               ' FROM sal_hab_serv s'+
               ' WHERE s.tip_habserv='+QuotedStr('S')+
               'AND s.cod_sidicom='+QuotedStr(Trim(IBQ_MPMS.FieldByName('Cod_SIDICOM').AsString));
        DMMovtosEmpresas.CDS_Busca.Close;
        DMMovtosEmpresas.SDS_Busca.CommandText:=MySql;
        DMMovtosEmpresas.CDS_Busca.Open;
        sCodigo:=Trim(DMMovtosEmpresas.CDS_Busca.FieldBYName('cod_servico').AsString);
        DMMovtosEmpresas.CDS_Busca.Close;

        If sCodigo<>'' Then
        Begin
          // Desativa o Servico ================================================
          MySql:=' UPDATE sal_hab_serv s'+
                 ' SET s.ind_ativo='+QuotedStr('NAO')+
                 ' WHERE s.tip_habserv='+QuotedStr('S')+
                 ' AND s.cod_habserv='+sCodigo;
          DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

          // Desativa o Servico nos Profissionais ==============================
          MySql:=' UPDATE sal_prof_habilidades p'+
                 ' SET p.ind_ativo='+QuotedStr('NAO')+
                 ' WHERE p.cod_servico='+sCodigo;
          DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

        End; // If sCodigo<>'' Then
      End; // If Trim(IBQ_MPMS.FieldByName('Habilidade').AsString)='HABILIDADE DESCONTINUADA' Then

      //========================================================================
      // Habilidade nâo Encontrada = SEM HABILIDADE ============================
      //========================================================================
      If Trim(IBQ_MPMS.FieldByName('Habilidade').AsString)='SEM HABILIDADE' Then
      Begin
        bSiga:=False;
      End; // If Trim(IBQ_MPMS.FieldByName('Habilidade').AsString)='SEM HABILIDADE' Then

      //========================================================================
      // Habilidade = PROMOÇÕES ================================================
      //========================================================================
      If Trim(IBQ_MPMS.FieldByName('Habilidade').AsString)='PROMOÇÕES' Then
      Begin
        bSiga:=False;

        // Cadastro de Serviço de Promoção =====================================
        MySql:=' SELECT s.cod_habserv Cod_Servico'+
               ' FROM sal_hab_serv s'+
               ' WHERE s.tip_habserv='+QuotedStr('S')+
               ' AND s.cod_sidicom='+QuotedStr(Trim(IBQ_MPMS.FieldByName('Cod_SIDICOM').AsString));
        DMMovtosEmpresas.CDS_Busca.Close;
        DMMovtosEmpresas.SDS_Busca.CommandText:=MySql;
        DMMovtosEmpresas.CDS_Busca.Open;

        // Cadastra Serviço ====================================================
        If Trim(DMMovtosEmpresas.CDS_Busca.FieldBYName('Cod_Servico').AsString)='' Then
        Begin
          // Busca Codigo da Habilidade de Promoções ----------------
          MySql:=' SELECT h.cod_habserv'+
                 ' FROM sal_hab_serv h'+
                 ' WHERE h.tip_habserv='+QuotedStr('H')+
                 ' AND Trim(h.des_habserv)='+QuotedStr('PROMOÇÕES');
          DMMovtosEmpresas.CDS_BuscaRapida.Close;
          DMMovtosEmpresas.SDS_BuscaRapida.CommandText:=MySql;
          DMMovtosEmpresas.CDS_BuscaRapida.Open;

          sCodHab:=DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('cod_habserv').AsString;
          DMMovtosEmpresas.SDS_BuscaRapida.Close;

          // Busca Código para Servico -----------------------------
          MySql:=' SELECT GEN_ID(GEN_HAB_SERVICOS,1) Codigo'+
                 ' FROM RDB$DATABASE';
          DMMovtosEmpresas.CDS_BuscaRapida.Close;
          DMMovtosEmpresas.SDS_BuscaRapida.CommandText:=MySql;
          DMMovtosEmpresas.CDS_BuscaRapida.Open;

          sCodServ:=DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('Codigo').AsString;
          DMMovtosEmpresas.SDS_BuscaRapida.Close;

          // Busca PrecoVenda  -------------------------------------
          MySql:=' SELECT COALESCE(l.precovenda,0) PrecoVenda'+
                 ' FROM listapre l'+
                 ' WHERE l.codproduto='+QuotedStr(Trim(IBQ_MPMS.FieldByName('Cod_SIDICOM').AsString))+
                 ' AND l.codlista='+QuotedStr(BuscaCodLista('99'));
          DMMovtosEmpresas.CDS_BuscaRapida.Close;
          DMMovtosEmpresas.SDS_BuscaRapida.CommandText:=MySql;
          DMMovtosEmpresas.CDS_BuscaRapida.Open;

          cPreco:=DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('PrecoVenda').AsCurrency;
          DMMovtosEmpresas.SDS_BuscaRapida.Close;

          // Insere Servico em SAL_HAB_SERV =================================
          MySql:=' INSERT INTO SAL_HAB_SERV ('+
                 ' TIP_HABSERV, COD_HABSERV, DES_HABSERV, DES_ABREVIATURA,'+
                 ' VLR_HABSERV, COD_SIDICOM, IND_ATIVO, USU_INCLUI)'+
                 ' Values ('+
                 QuotedStr('S')+', '+ // TIP_HABSERV
                 QuotedStr(sCodServ)+', '+ // COD_HABSERV
                 QuotedStr(Trim(IBQ_MPMS.FieldByName('Servico').AsString))+', '+ // DES_HABSERV
                 'NULL, '+ // DES_ABREVIATURA
                 QuotedStr(f_Troca(',','.',CurrToStr(cPreco)))+', '+ // VLR_HABSERV
                 QuotedStr(Trim(IBQ_MPMS.FieldByName('Cod_Sidicom').AsString))+', '+ // COD_SIDICOM
                 QuotedStr(Trim(IBQ_MPMS.FieldByName('Ativo').AsString))+', '+ // IND_ATIVO
                 QuotedStr('0')+')';
          DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

          // Insere em SAL_HAB_SERV_LINK ======================================
          MySql:=' INSERT INTO SAL_HAB_SERV_LINK ('+
                 ' COD_HABILIDADE, COD_SERVICO, USU_INCLUI)'+
                 ' VALUES ('+
                 QuotedStr(sCodHab)+', '+ // COD_HABILIDADE
                 QuotedStr(sCodServ)+', '+ // COD_SERVICO,
                 QuotedStr('0')+')'; // USU_INCLUI
          DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
        End; // If Trim(DMMovtosEmpresas.CDS_Busca.FieldBYName('Cod_Servico').AsString)='' Then
        DMMovtosEmpresas.CDS_Busca.Close;

      End; // If Trim(IBQ_MPMS.FieldByName('Habilidade').AsString)='PROMOÇÕES' Then

      //========================================================================
      // Cadastro de Serviços ==================================================
      //========================================================================
      If bSiga Then
      Begin
        // Verifica se Existe Cod_Servico na Belshop ===========================
        MySql:=' SELECT s.cod_sidicom,'+
               ' h.cod_habserv Cod_Habilidade, h.des_habserv Des_Habilidade,'+
               ' s.cod_habserv Cod_Servico, s.des_habserv Des_Servico'+
               ' FROM sal_hab_serv s, sal_hab_serv h, sal_hab_serv_link l'+
               ' WHERE s.cod_habserv=l.cod_servico'+
               ' AND h.cod_habserv=l.cod_habilidade'+
               ' AND h.tip_habserv='+QuotedStr('H')+
               ' AND s.tip_habserv='+QuotedStr('S')+
               ' AND s.cod_sidicom='+QuotedStr(Trim(IBQ_MPMS.FieldByName('Cod_SIDICOM').AsString))+
               ' AND h.des_habserv='+QuotedStr(Trim(IBQ_MPMS.FieldByName('Habilidade').AsString));
        DMMovtosEmpresas.CDS_Busca.Close;
        DMMovtosEmpresas.SDS_Busca.CommandText:=MySql;
        DMMovtosEmpresas.CDS_Busca.Open;

        If Trim(DMMovtosEmpresas.CDS_Busca.FieldBYName('Cod_Servico').AsString)<>'' Then
         Begin
           //===================================================================
           // SE EXISTE COD_SERVICO NA BELSHP ==================================
           //===================================================================
           // Atualiza Ind_Ativo e Nome do Servico
           MySql:=' UPDATE sal_hab_serv s'+
                  ' SET s.ind_ativo='+QuotedStr(Trim(IBQ_MPMS.FieldByName('Ativo').AsString))+
                  ', s.des_habserv='+QuotedStr(Trim(IBQ_MPMS.FieldByName('Servico').AsString))+
                  ' WHERE s.tip_habserv='+QuotedStr('S')+
                  ' AND s.cod_habserv='+DMMovtosEmpresas.CDS_Busca.FieldBYName('Cod_Servico').AsString;
           DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

           // Atualiza Ind_Ativo do Servico nos Profissionais
           MySql:=' UPDATE sal_prof_habilidades p'+
                  ' SET p.ind_ativo='+QuotedStr(Trim(IBQ_MPMS.FieldByName('Ativo').AsString))+
                  ' WHERE p.cod_servico='+DMMovtosEmpresas.CDS_Busca.FieldBYName('Cod_Servico').AsString+
                  ' AND p.ind_ativo<>'+QuotedStr(Trim(IBQ_MPMS.FieldByName('Ativo').AsString));
           DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
         End
        Else
         Begin
           //===================================================================
           // SE NÃO EXISTE COD_SERVICO NA BELSHOP =============================
           //===================================================================

           //===================================================================
           // Deleta Serviço em Qualqer Habilidade =============================
           //===================================================================
           // Busca Servico Existente em qualquer habilidade
           MySql:=' SELECT s.cod_habserv Codigo'+
                  ' FROM sal_hab_serv s'+
                  ' WHERE s.tip_habserv='+QuotedStr('S')+
                  ' AND s.cod_sidicom='+QuotedStr(Trim(IBQ_MPMS.FieldByName('Cod_SIDICOM').AsString));
           DMMovtosEmpresas.CDS_BuscaRapida.Close;
           DMMovtosEmpresas.SDS_BuscaRapida.CommandText:=MySql;
           DMMovtosEmpresas.CDS_BuscaRapida.Open;

           sCodServ:=DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('Codigo').AsString;
           DMMovtosEmpresas.SDS_BuscaRapida.Close;

           // Delete Tudo do Serviço, o mesmo será recadastrado, pois o Mesmo Pode ter Sido Trocado de Habilidade
           If sCodServ<>'' Then
           Begin
             // Exclui Servico do Profissional ----------------------
             MySql:=' Delete FROM SAL_PROF_HABILIDADES p'+
                    ' WHERE p.cod_servico='+sCodServ;
             DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

             // Exclui Servico do LINK ------------------------------
             MySql:=' Delete FROM SAL_HAB_SERV_LINK l'+
                    ' WHERE l.cod_servico='+sCodServ;
             DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

             // Exclui Servico --------------------------------------
             MySql:=' Delete FROM SAL_HAB_SERV s'+
                    ' WHERE s.tip_habserv='+QuotedStr('S')+
                    ' AND   s.cod_habserv='+sCodServ;
             DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
           End; // If sCodServ<>'' Then

           //===================================================================
           // Insere o Serviço =================================================
           //===================================================================
           // Busca Codigo da Habilidade ----------------------------
           MySql:=' SELECT h.cod_habserv'+
                  ' FROM sal_hab_serv h'+
                  ' WHERE h.tip_habserv='+QuotedStr('H')+
                  ' AND Trim(h.des_habserv)='+QuotedStr(Trim(IBQ_MPMS.FieldByName('Habilidade').AsString));
           DMMovtosEmpresas.CDS_BuscaRapida.Close;
           DMMovtosEmpresas.SDS_BuscaRapida.CommandText:=MySql;
           DMMovtosEmpresas.CDS_BuscaRapida.Open;

           sCodHab:=DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('cod_habserv').AsString;
           DMMovtosEmpresas.SDS_BuscaRapida.Close;

           // Busca Código para Servico -----------------------------
           MySql:=' SELECT GEN_ID(GEN_HAB_SERVICOS,1) Codigo'+
                  ' FROM RDB$DATABASE';
           DMMovtosEmpresas.CDS_BuscaRapida.Close;
           DMMovtosEmpresas.SDS_BuscaRapida.CommandText:=MySql;
           DMMovtosEmpresas.CDS_BuscaRapida.Open;

           sCodServ:=DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('Codigo').AsString;
           DMMovtosEmpresas.SDS_BuscaRapida.Close;

           // Busca PrecoVenda  -------------------------------------
           MySql:=' SELECT COALESCE(l.precovenda,0) PrecoVenda'+
                  ' FROM listapre l'+
                  ' WHERE l.codproduto='+QuotedStr(Trim(IBQ_MPMS.FieldByName('Cod_SIDICOM').AsString))+
                  ' AND l.codlista='+QuotedStr(BuscaCodLista('99'));
           DMMovtosEmpresas.CDS_BuscaRapida.Close;
           DMMovtosEmpresas.SDS_BuscaRapida.CommandText:=MySql;
           DMMovtosEmpresas.CDS_BuscaRapida.Open;

           cPreco:=DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('PrecoVenda').AsCurrency;
           DMMovtosEmpresas.SDS_BuscaRapida.Close;

           // Insere Servico em SAL_HAB_SERV =================================
           MySql:=' INSERT INTO SAL_HAB_SERV ('+
                  ' TIP_HABSERV, COD_HABSERV, DES_HABSERV, DES_ABREVIATURA,'+
                  ' VLR_HABSERV, COD_SIDICOM, IND_ATIVO, USU_INCLUI)'+
                  ' Values ('+
                  QuotedStr('S')+', '+ // TIP_HABSERV
                  QuotedStr(sCodServ)+', '+ // COD_HABSERV
                  QuotedStr(Trim(IBQ_MPMS.FieldByName('Servico').AsString))+', '+ // DES_HABSERV
                  'NULL, '+ // DES_ABREVIATURA
                  QuotedStr(f_Troca(',','.',CurrToStr(cPreco)))+', '+ // VLR_HABSERV
                  QuotedStr(Trim(IBQ_MPMS.FieldByName('Cod_Sidicom').AsString))+', '+ // COD_SIDICOM
                  QuotedStr(Trim(IBQ_MPMS.FieldByName('Ativo').AsString))+', '+ // IND_ATIVO
                  QuotedStr('0')+')';
           DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

           // Insere em SAL_HAB_SERV_LINK ======================================
           MySql:=' INSERT INTO SAL_HAB_SERV_LINK ('+
                  ' COD_HABILIDADE, COD_SERVICO, USU_INCLUI)'+
                  ' VALUES ('+
                  QuotedStr(sCodHab)+', '+ // COD_HABILIDADE
                  QuotedStr(sCodServ)+', '+ // COD_SERVICO,
                  QuotedStr('0')+')'; // USU_INCLUI
           DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

           // Busca Codigo da Habilidade e Servico ------------------
           MySql:=' SELECT h.cod_habserv Cod_Hab, s.cod_habserv Cod_Serv'+
                  ' FROM sal_hab_serv_link l, sal_hab_serv h, sal_hab_serv s'+
                  ' WHERE l.cod_habilidade=h.cod_habserv'+
                  ' AND   l.cod_servico=s.cod_habserv'+
                  ' AND   h.tip_habserv='+QuotedStr('H')+
                  ' AND   s.tip_habserv='+QuotedStr('S')+
                  ' AND   h.des_habserv='+QuotedStr(Trim(IBQ_MPMS.FieldByName('Habilidade').AsString))+
                  ' AND   s.cod_sidicom='+QuotedStr(Trim(IBQ_MPMS.FieldByName('Cod_Sidicom').AsString));
           DMMovtosEmpresas.CDS_BuscaRapida.Close;
           DMMovtosEmpresas.SDS_BuscaRapida.CommandText:=MySql;
           DMMovtosEmpresas.CDS_BuscaRapida.Open;

           sCodHab:=DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('Cod_Hab').AsString;
           sCodServ:=DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('Cod_Serv').AsString;
           DMMovtosEmpresas.SDS_BuscaRapida.Close;

           //===================================================================
           // Cadastra Novo Serviço nos Profissionais ==========================
           //===================================================================
           // Busca Profissionais com a Habilidade =============================
           MySql:=' SELECT ph.cod_loja, ph.cod_profissional, pr.ind_sid_tabelaproc'+
                  ' FROM sal_prof_habilidades ph, sal_profissionais pr'+
                  ' WHERE ph.cod_loja=pr.cod_loja'+
                  ' AND   ph.cod_profissional=pr.cod_profissional'+
                  ' AND  ((PH.cod_servico IS NULL) OR (TRIM(PH.cod_servico)=''''))'+
                  ' AND   ph.cod_habilidade='+sCodHab+
                  ' ORDER BY 1';
           DMMovtosEmpresas.CDS_Pesquisa.Close;
           DMMovtosEmpresas.SDS_Pesquisa.CommandText:=MySql;
           DMMovtosEmpresas.CDS_Pesquisa.Open;

           While Not DMMovtosEmpresas.CDS_Pesquisa.Eof do
           Begin
             If DMMovtosEmpresas.CDS_Pesquisa.RecNo=1 Then
             Begin
               // Busca Preco dp Serviço
               MySql:=' SELECT COALESCE(l.precovenda,0) PrecoVenda'+
                      ' FROM listapre l'+
                      ' WHERE l.codproduto='+QuotedStr(Trim(IBQ_MPMS.FieldByName('Cod_SIDICOM').AsString))+
                      ' AND l.codlista='+QuotedStr(BuscaCodLista(DMMovtosEmpresas.CDS_Pesquisa.FieldByName('Cod_loja').AsString));
               DMMovtosEmpresas.CDS_BuscaRapida.Close;
               DMMovtosEmpresas.SDS_BuscaRapida.CommandText:=MySql;
               DMMovtosEmpresas.CDS_BuscaRapida.Open;

               cPreco:=DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('PrecoVenda').AsCurrency;
               DMMovtosEmpresas.SDS_BuscaRapida.Close;
             End; // If DMMovtosEmpresas.CDS_Pesquisa.RecNo=1 Then

             // Insere Servico no Profisional (SAL_PROF_HABILIDADES) =============
             MySql:=' Insert Into SAL_PROF_HABILIDADES ('+
                    ' COD_LOJA, COD_PROFISSIONAL,'+
                    ' COD_HABILIDADE, PER_COMISSAO_HAB,'+
                    ' COD_SERVICO, VLR_SERVICO, PER_COMISSAO_SERV,'+
                    ' IND_ATIVO, USU_INCLUI)'+
                    ' Values('+
                    QuotedStr(DMMovtosEmpresas.CDS_Pesquisa.FieldByName('Cod_Loja').AsString)+', '+ // COD_LOJA
                    QuotedStr(DMMovtosEmpresas.CDS_Pesquisa.FieldByName('Cod_Profissional').AsString)+', '+ // COD_PROFISSIONAL
                    QuotedStr(sCodHab)+', '+ // COD_HABILIDADE
                    '0 , '+ // PER_COMISSAO_HAB
                    QuotedStr(sCodServ)+', '+ // COD_SERVICO
                    QuotedStr(f_Troca(',','.',CurrToStr(cPreco)))+', '; // VLR_SERVICO

                    // PER_COMISSAO_SERV
                    If DMMovtosEmpresas.CDS_Pesquisa.FieldByName('ind_sid_tabelaproc').AsString='1' Then
                     MySql:=
                      MySql+QuotedStr(f_troca(',','.',IBQ_MPMS.FieldByName('Comissao1').AsString))+', '

                    Else If DMMovtosEmpresas.CDS_Pesquisa.FieldByName('ind_sid_tabelaproc').AsString='2' Then
                     MySql:=
                      MySql+QuotedStr(f_troca(',','.',IBQ_MPMS.FieldByName('Comissao2').AsString))+', '

                    Else If DMMovtosEmpresas.CDS_Pesquisa.FieldByName('ind_sid_tabelaproc').AsString='3' Then
                     MySql:=
                      MySql+QuotedStr(f_troca(',','.',IBQ_MPMS.FieldByName('Comissao3').AsString))+', '

                    Else If DMMovtosEmpresas.CDS_Pesquisa.FieldByName('ind_sid_tabelaproc').AsString='4' Then
                     MySql:=
                      MySql+QuotedStr(f_troca(',','.',IBQ_MPMS.FieldByName('Comissao4').AsString))+', '

                    Else If DMMovtosEmpresas.CDS_Pesquisa.FieldByName('ind_sid_tabelaproc').AsString='5' Then
                     MySql:=
                      MySql+QuotedStr(f_troca(',','.',IBQ_MPMS.FieldByName('Comissao5').AsString))+', '

                    Else If DMMovtosEmpresas.CDS_Pesquisa.FieldByName('ind_sid_tabelaproc').AsString='6' Then
                     MySql:=
                      MySql+QuotedStr(f_troca(',','.',IBQ_MPMS.FieldByName('Comissao6').AsString))+', '

                    Else If DMMovtosEmpresas.CDS_Pesquisa.FieldByName('ind_sid_tabelaproc').AsString='7' Then
                     MySql:=
                      MySql+QuotedStr(f_troca(',','.',IBQ_MPMS.FieldByName('Comissao7').AsString))+', '

                    Else If DMMovtosEmpresas.CDS_Pesquisa.FieldByName('ind_sid_tabelaproc').AsString='8' Then
                     MySql:=
                      MySql+QuotedStr(f_troca(',','.',IBQ_MPMS.FieldByName('Comissao8').AsString))+', '

                    Else
                     MySql:=
                      MySql+'0, ';

             MySql:=
              MySql+QuotedStr(Trim(IBQ_MPMS.FieldByName('Ativo').AsString))+', '+ // IND_ATIVO
                    QuotedStr('0')+')'; // USU_INCLUI
             DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

             DMMovtosEmpresas.CDS_Pesquisa.Next;
           End;// While Not DMMovtosEmpresas.CDS_Pesquisa.Eof do
           DMMovtosEmpresas.CDS_Pesquisa.Close;

        End; // If Trim(DMMovtosEmpresas.CDS_Busca.FieldBYName('Cod_Servico').AsString<>'' Then
        DMMovtosEmpresas.CDS_Busca.Close;

      End; // If bSiga Then

      IBQ_MPMS.Next;
    End; // While Not IBQ_MPMS.Eof do

    MySql:=' DELETE FROM movtos_empresas m'+
           ' Where m.Ind_Tipo=''OK'''+
           ' And m.NomeFornecedor=''Servicos Salao''';
    DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao =======================================
    DMMovtosEmpresas.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    DMMovtosEmpresas.CDS_Pesquisa.Close;
    DMMovtosEmpresas.SDS_BuscaRapida.Close;
    DMMovtosEmpresas.CDS_Busca.Close;
    IBQ_MPMS.Close;

  Except
    on e : Exception do
    Begin
      // Abandona Transacao =====================================
      DMMovtosEmpresas.SQLC.Rollback(TD);

      DMMovtosEmpresas.CDS_Pesquisa.Close;
      DMMovtosEmpresas.SDS_BuscaRapida.Close;
      DMMovtosEmpresas.CDS_Busca.Close;
      IBQ_MPMS.Close;

      DateSeparator:='/';
      DecimalSeparator:=',';

      MySql:=' DELETE FROM movtos_empresas m'+
             ' Where m.Ind_Tipo=''OK'''+
             ' And m.NomeFornecedor=''Servicos Salao''';
      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

      sgMensagem:='Servicos Salao-'+e.Message;
      sgMensagem:=copy(sgMensagem,1,200);
      MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
             ' Values ('+
             QuotedStr('Er')+', '+
             QuotedStr(sgMensagem)+', '+
             QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

    End; // on e : Exception do
  End; // Try // Geral

End; // Atualiza Serviços de Profissionais de Salão >>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Insere Novos Produtos no Controle de Estoques >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmMovtosEmpresas.Es_Finan_Curva_ABC(sCodLoja: String);
Var
  MySql: String;
Begin
  Try
    // Monta Transacao =========================================================
    TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMMovtosEmpresas.SQLC.StartTransaction(TD);

    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
           ' Values ('+
           QuotedStr('OK')+', '+
           QuotedStr('Es_Finan_Curva_ABC: Bel_'+sCodLoja)+', '+
           QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
    DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

    // Busca Informações Atuais em Es_Finan_Curva_ABC da Loja  =================
    MySql:=' SELECT FIRST 1 num_dias_uteis, vlr_demandas_ano, qtd_demandas_ano, num_dias_estocagem'+
           ' FROM ES_FINAN_CURVA_ABC f'+
           ' WHERE f.ind_curva=''E'''+
           ' AND   f.per_participacao=0.0000'+
           ' and   f.cod_loja='+QuotedStr(sCodLoja);
    DMMovtosEmpresas.CDS_BuscaRapida.Close;
    DMMovtosEmpresas.SDS_BuscaRapida.CommandText:=MySql;
    DMMovtosEmpresas.CDS_BuscaRapida.Open;

    // Insere Novo Produtos na Loja  ===========================================
    MySql:=' INSERT INTO ES_FINAN_CURVA_ABC'+
           ' (cod_loja, cod_produto, est_minimo, est_maximo, num_dias_uteis, vlr_demandas_ano,'+
           '  vlr_demandas, per_participacao, ind_curva, qtd_demandas_ano, qtd_demandas, per_part_qtd,'+
           '  ind_curva_qtd, num_dias_estocagem, qtd_transito, dta_atualizacao, hra_atualizacao,'+
           '  usu_altera, dta_altera)'+

           ' SELECT '+QuotedStr(sCodLoja)+' cod_loja,'+
           ' pr.codproduto cod_produto,'+
           ' 0 est_minimo, 0 est_maximo,'+
           QuotedStr(DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('num_dias_uteis').AsString)+' num_dias_uteis,'+
           QuotedStr(DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('vlr_demandas_ano').AsString)+' vlr_demandas_ano,'+
           ' 0.00 vlr_demandas, 0.0000 per_participacao, ''E'' ind_curva,'+
           QuotedStr(DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('qtd_demandas_ano').AsString)+' qtd_demandas_ano,'+
           ' 0 qtd_demandas, 0.0000 per_part_qtd, ''E'' ind_curva_qtd,'+
           QuotedStr(DMMovtosEmpresas.CDS_BuscaRapida.FieldByName('num_dias_estocagem').AsString)+' num_dias_estocagem,'+
           ' 0 qtd_transito, CURRENT_DATE dta_atualizacao, CURRENT_TIME hra_atualizacao,'+
           ' 0 usu_altera, CURRENT_TIMESTAMP dta_altera'+

           ' FROM PRODUTO pr'+
           ' WHERE pr.principalfor NOT IN (''000300'', ''000500'', ''000883'', ''010000'', ''001072'')'+
           ' AND   pr.codaplicacao NOT IN (''0016'', ''0015'', ''0017'')'+
           ' AND   pr.situacaopro IN (0, 3)'+
           ' AND   pr.datainclusao > CURRENT_DATE - 10'+
           ' AND   NOT EXISTS(SELECT 1'+
           '                  FROM es_finan_curva_abc ef'+
           '                  WHERE ef.cod_loja = '+QuotedStr(sCodLoja)+
           '                  AND   ef.cod_produto = pr.codproduto)';
    DMMovtosEmpresas.CDS_BuscaRapida.Close;
    DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

    MySql:=' DELETE FROM movtos_empresas m'+
           ' Where m.Ind_Tipo=''OK'''+
           ' And m.NomeFornecedor=''Es_Finan_Curva_ABC: Bel_'+sCodLoja+'''';
    DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

    DMMovtosEmpresas.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
  Except
    on e : Exception do
    Begin
      DMMovtosEmpresas.SQLC.Rollback(TD);
      DMMovtosEmpresas.IBQ_EstoqueLoja.Close;

      DateSeparator:='/';
      DecimalSeparator:=',';

    End; // on e : Exception do
  End; // Try

End; // Insere Novos Produtos no Controle de Estoques >>>>>>>>>>>>>>>>>>>>>>>>>>

// Atualiza Fornecedores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmMovtosEmpresas.AtualizaForn(sDta: String);
Var
  MySql: String;
  i: Integer;
  bSiga: Boolean;
Begin

  // Conecta MPMS ==============================================================
  i:=0;
  bSiga:=False;
  While Not bSiga do
  Begin
    If ConectaMPMS Then
      bSiga:=True
    Else
      Inc(i);

    If i>99 Then
      Break;
  End; // While Not bSiga do

  If Not bSiga Then
   Exit;

  // Cria Querys da MPMS =====================================================
  DMMovtosEmpresas.IBQ_FornecedoresMPMS.Database   :=DMConexoes.IBDB_MPMS;
  DMMovtosEmpresas.IBQ_FornecedoresMPMS.Transaction:=DMConexoes.IBT_MPMS;

  // Verificva se Transação esta Ativa
  If DMMovtosEmpresas.SQLC.InTransaction Then
   DMMovtosEmpresas.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMMovtosEmpresas.SQLC.StartTransaction(TD);
  Try
    DateSeparator:='.';
    DecimalSeparator:='.';

    DMMovtosEmpresas.IBQ_FornecedoresMPMS.Close;
    DMMovtosEmpresas.IBQ_FornecedoresMPMS.Open;

    MySql:=' Delete From FORNECEDOR F';
    DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

    DMMovtosEmpresas.CDS_Fornecedores.Open;

    While Not DMMovtosEmpresas.IBQ_FornecedoresMPMS.Eof do
    Begin
      DMMovtosEmpresas.CDS_Fornecedores.Insert;
      For i:=0 to DMMovtosEmpresas.IBQ_FornecedoresMPMS.FieldCount-1 do
      Begin
        If DMMovtosEmpresas.IBQ_FornecedoresMPMS.Fields[i].FieldName='DTA_ATUALIZACAO' Then
         DMMovtosEmpresas.CDS_Fornecedores.Fields[i].AsDateTime:=DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor)
        Else
         DMMovtosEmpresas.CDS_Fornecedores.Fields[i].Assign(DMMovtosEmpresas.IBQ_FornecedoresMPMS.Fields[i]);
      End;

      DMMovtosEmpresas.CDS_Fornecedores.Post;

      if DMMovtosEmpresas.IBQ_FornecedoresMPMS.RecNo mod 10000 = 0 Then
       DMMovtosEmpresas.CDS_Fornecedores.ApplyUpdates(0);

      DMMovtosEmpresas.IBQ_FornecedoresMPMS.Next;

    End; // While Not DMMovtosEmpresas.IBQ_FornecedoresMPMS.Eof do
    DMMovtosEmpresas.IBQ_FornecedoresMPMS.Close;

    MySql:=' DELETE FROM movtos_empresas m'+
           ' Where m.Ind_Tipo=''OK'''+
           ' And m.NomeFornecedor=''Fornecedores''';
    DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao =======================================
    DMMovtosEmpresas.CDS_Fornecedores.ApplyUpdates(0);
    DMMovtosEmpresas.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    DMMovtosEmpresas.CDS_Fornecedores.Close;
    DMMovtosEmpresas.IBQ_FornecedoresMPMS.Close;
  Except
    on e : Exception do
    Begin
      // Abandona Transacao =====================================
      DMMovtosEmpresas.SQLC.Rollback(TD);

      DMMovtosEmpresas.CDS_Fornecedores.Close;
      DMMovtosEmpresas.IBQ_FornecedoresMPMS.Close;

      DateSeparator:='/';
      DecimalSeparator:=',';

      MySql:=' DELETE FROM movtos_empresas m'+
             ' Where m.Ind_Tipo=''OK'''+
             ' And m.NomeFornecedor=''Fornecedores''';
      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

      sgMensagem:='Fornecedor-'+e.Message+
                  '-Campo:'+DMMovtosEmpresas.IBQ_FornecedoresMPMS.Fields[i].FieldName+
                  '-'+DMMovtosEmpresas.IBQ_FornecedoresMPMS.Fields[i].AsString;
      sgMensagem:=copy(sgMensagem,1,200);

      MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
             ' Values ('+
             QuotedStr('Er')+', '+
             QuotedStr(sgMensagem)+', '+
             QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

    End; // on e : Exception do
  End; // Try

End; // Atualiza Fornecedores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Atualiza Lista de Precos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmMovtosEmpresas.AtualizaLP(sDta: String);
Var
  MySql: String;
  i: Integer;
  bSiga: Boolean;
Begin

  // Conecta MPMS ==============================================================
  i:=0;
  bSiga:=False;
  While Not bSiga do
  Begin
    If ConectaMPMS Then
      bSiga:=True
    Else
      Inc(i);
  
    If i>99 Then
      Break;
  End; // While Not bSiga do

  If Not bSiga Then
   Exit;

  // Cria Querys da MPMS =====================================================
  DMMovtosEmpresas.IBQ_ListaPrecosMPMS.Database   :=DMConexoes.IBDB_MPMS;
  DMMovtosEmpresas.IBQ_ListaPrecosMPMS.Transaction:=DMConexoes.IBT_MPMS;

  // Verificva se Transação esta Ativa
  If DMMovtosEmpresas.SQLC.InTransaction Then
   DMMovtosEmpresas.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMMovtosEmpresas.SQLC.StartTransaction(TD);
  Try
    DateSeparator:='.';
    DecimalSeparator:='.';

    DMMovtosEmpresas.IBQ_ListaPrecosMPMS.Close;
    DMMovtosEmpresas.IBQ_ListaPrecosMPMS.Open;

    MySql:=' Delete From LISTAPRE l';
    DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

    DMMovtosEmpresas.CDS_ListaPrecos.Open;

    While Not DMMovtosEmpresas.IBQ_ListaPrecosMPMS.Eof do
    Begin
      DMMovtosEmpresas.CDS_ListaPrecos.Insert;
      For i:=0 to DMMovtosEmpresas.IBQ_ListaPrecosMPMS.FieldCount-1 do
       DMMovtosEmpresas.CDS_ListaPrecos.Fields[i].Assign(DMMovtosEmpresas.IBQ_ListaPrecosMPMS.Fields[i]);

      DMMovtosEmpresas.CDS_ListaPrecos.Post;

      if DMMovtosEmpresas.IBQ_ListaPrecosMPMS.RecNo mod 10000 = 0 Then
       DMMovtosEmpresas.CDS_ListaPrecos.ApplyUpdates(0);

      DMMovtosEmpresas.IBQ_ListaPrecosMPMS.Next;

    End; // While Not DMMovtosEmpresas.IBQ_ListaPrecosMpmsMPMS.Eof do
    DMMovtosEmpresas.IBQ_ListaPrecosMPMS.Close;

    MySql:=' DELETE FROM movtos_empresas m'+
           ' Where m.Ind_Tipo=''OK'''+
           ' And m.NomeFornecedor=''Lista de Preços''';
    DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao =======================================
    DMMovtosEmpresas.CDS_ListaPrecos.ApplyUpdates(0);
    DMMovtosEmpresas.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    DMMovtosEmpresas.CDS_ListaPrecos.Close;
    DMMovtosEmpresas.IBQ_ListaPrecosMPMS.Close;
  Except

    on e : Exception do
    Begin
      // Abandona Transacao =====================================
      DMMovtosEmpresas.SQLC.Rollback(TD);

      DMMovtosEmpresas.CDS_ListaPrecos.Close;
      DMMovtosEmpresas.IBQ_ListaPrecosMPMS.Close;

      DateSeparator:='/';
      DecimalSeparator:=',';

      MySql:=' DELETE FROM movtos_empresas m'+
             ' Where m.Ind_Tipo=''OK'''+
             ' And m.NomeFornecedor=''Lista de Preços''';
      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

      sgMensagem:='LISTA PREÇOS-'+e.Message;
      sgMensagem:=copy(sgMensagem,1,200);
      MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
             ' Values ('+
             QuotedStr('Er')+', '+
             QuotedStr(sgMensagem)+', '+
             QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

    End; // on e : Exception do
  End; // Try

End; // Atualiza Lista de Precos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Atualiza Produtos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmMovtosEmpresas.AtualizaProdutos;//(sDta: String);
Var
  sCodProd, MySql: String;
  i: Integer;
  bSiga: Boolean;
Begin

  // Conecta MPMS ==============================================================
  i:=0;
  bSiga:=False;
  While Not bSiga do
  Begin
    If ConectaMPMS Then
      bSiga:=True
    Else
      Inc(i);

    If i>99 Then
      Break;
  End; // While Not bSiga do

  If Not bSiga Then
   Exit;

  // Cria Querys da MPMS =====================================================
  DMMovtosEmpresas.IBQ_ProdutoMPMS.Database   :=DMConexoes.IBDB_MPMS;
  DMMovtosEmpresas.IBQ_ProdutoMPMS.Transaction:=DMConexoes.IBT_MPMS;

  // Verificva se Transação esta Ativa
  If DMMovtosEmpresas.SQLC.InTransaction Then
   DMMovtosEmpresas.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMMovtosEmpresas.SQLC.StartTransaction(TD);
  Try
    DateSeparator:='.';
    DecimalSeparator:='.';

    DMMovtosEmpresas.IBQ_ProdutoMPMS.Close;
    DMMovtosEmpresas.IBQ_ProdutoMPMS.Open;
    While Not DMMovtosEmpresas.IBQ_ProdutoMPMS.Eof do
    Begin
      MySql:=DMMovtosEmpresas.IBQ_ProdutoMPMSUPDATE_INSERT.AsString;
      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

     DMMovtosEmpresas.IBQ_ProdutoMPMS.Next;
    End; // While Not DMMovtosEmpresas.IBQ_ProdutoMPMS.Eof do
    DMMovtosEmpresas.IBQ_ProdutoMPMS.Close;

    MySql:=' DELETE FROM movtos_empresas m'+
           ' Where m.Ind_Tipo=''OK'''+
           ' And m.NomeFornecedor=''Produtos''';
    DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao =======================================
    DMMovtosEmpresas.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
  Except
    on e : Exception do
    Begin
      // Abandona Transacao =====================================
      DMMovtosEmpresas.SQLC.Rollback(TD);

      DMMovtosEmpresas.IBQ_ProdutoMPMS.Close;

      DateSeparator:='/';
      DecimalSeparator:=',';

      MySql:=' DELETE FROM movtos_empresas m'+
             ' Where m.Ind_Tipo=''OK'''+
             ' And m.NomeFornecedor=''Produtos''';
      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

      sgMensagem:='PRODUTO - '+sCodProd+' - '+e.Message;
      sgMensagem:=copy(sgMensagem,1,200);
      MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
             ' Values ('+
             QuotedStr('Er')+', '+
             QuotedStr(sgMensagem)+', '+
             QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

    End; // on e : Exception do
  End; // Try

End; // Atualiza Produtos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Conecta Central de Trocas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmMovtosEmpresas.ConectaCentralTrocas: Boolean;
Var
  MySql: String;
  i: Integer;
  s: String;
Begin
  Result:=False;

  Try
    MySql:=' Select *'+
           ' From EMP_Conexoes e'+
           ' Where e.cod_filial=50';
    DMMovtosEmpresas.CDS_Busca.Close;
    DMMovtosEmpresas.SDS_Busca.CommandText:=MySql;
    DMMovtosEmpresas.CDS_Busca.Open;

    // Inicializa Conexao
    For i:=0 to DMConexoes.ComponentCount-1 do
    Begin
      If DMConexoes.Components[i] is TIBDatabase Then
      Begin
        If (DMConexoes.Components[i] as TIBDatabase).Name='IBDB_50' Then
        Begin
           (DMConexoes.Components[i] as TIBDatabase).Connected:=False;
           s:='\\';

           // Se Conexão Local ou Externa ======================================
           If (Not bgConexaoLocal) and (Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Endereco_IP_Externo').AsString)<>'') Then
            s:=s+IncludeTrailingPathDelimiter(DMMovtosEmpresas.CDS_Busca.FieldByName('ENDERECO_IP_EXTERNO').AsString)
           Else
            s:=s+IncludeTrailingPathDelimiter(DMMovtosEmpresas.CDS_Busca.FieldByName('ENDERECO_IP').AsString);

           s:=s+IncludeTrailingPathDelimiter(DMMovtosEmpresas.CDS_Busca.FieldByName('PASTA_BASE_DADOS').AsString)+
                                             DMMovtosEmpresas.CDS_Busca.FieldByName('DES_BASE_DADOS').AsString;
          //  \\201.86.212.10\C:\SIDICOM.NEW\BANCO.FDB
          (DMConexoes.Components[i] as TIBDatabase).DatabaseName:=s;
          Break;
        End;
      End; // If DMConexoes.Components[i] is TIBDatabase Then
    End; // For i:=0 to DMConexoes.ComponentCount-1 do

    If Not ConexaoEmpIndividual('IBDB_50', 'IBT_50','A') Then
    Begin
      DMMovtosEmpresas.CDS_Busca.Close;
      Exit;
    End;
    DMMovtosEmpresas.CDS_Busca.Close;

    Result:=True;
  Except
  End;
End; // Conecta Central de Trocas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


// Conecta a Administraçao MPMS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmMovtosEmpresas.ConectaMPMS: Boolean;
Var
  MySql: String;
  i: Integer;
  sConcTCP_IP, sConcNetBEUI: String;
  sEndIP: String;
Begin
  Result:=False;

  Try
    MySql:=' Select *'+
           ' From EMP_Conexoes e'+
           ' Where e.cod_filial='+QuotedStr('99');
    DMMovtosEmpresas.CDS_Busca.Close;
    DMMovtosEmpresas.SDS_Busca.CommandText:=MySql;
    DMMovtosEmpresas.CDS_Busca.Open;

    // Inicializa Conexao
    For i:=0 to DMConexoes.ComponentCount-1 do
    Begin
      If DMConexoes.Components[i] is TIBDatabase Then
      Begin
        If (DMConexoes.Components[i] as TIBDatabase).Name='IBDB_MPMS' Then
        Begin
           (DMConexoes.Components[i] as TIBDatabase).Connected:=False;

           sEndIP:=DMMovtosEmpresas.CDS_Busca.FieldByName('ENDERECO_IP').AsString;

           // Tipo de Conexão: TCP/IP
           sConcTCP_IP:=sEndIP+':'+        
              IncludeTrailingPathDelimiter(DMMovtosEmpresas.CDS_Busca.FieldByName('PASTA_BASE_DADOS').AsString)+
                                           DMMovtosEmpresas.CDS_Busca.FieldByName('DES_BASE_DADOS').AsString;

           // Tipo de Conexão: NetBEUI
           sConcNetBEUI:='\\'+sEndIP+'\'+
              IncludeTrailingPathDelimiter(DMMovtosEmpresas.CDS_Busca.FieldByName('PASTA_BASE_DADOS').AsString)+
                                           DMMovtosEmpresas.CDS_Busca.FieldByName('DES_BASE_DADOS').AsString;

          (DMConexoes.Components[i] as TIBDatabase).DatabaseName:=sConcTCP_IP;

          If Not ConexaoEmpIndividual('IBDB_MPMS', 'IBT_MPMS','A') Then
          Begin
            (DMConexoes.Components[i] as TIBDatabase).DatabaseName:=sConcNetBEUI;
            If Not ConexaoEmpIndividual('IBDB_MPMS', 'IBT_MPMS','A') Then
            Begin
              msg('Erro de Conecxão ao Banco de Dados'+cr+' do CD, Avise o Odir Imediatamente !!','X');
              Application.Terminate;
              Exit;
            End;
          End;

          Break;
        End;
      End; // If DMConexoes.Components[i] is TIBDatabase Then
    End; // For i:=0 to DMConexoes.ComponentCount-1 do

    // Cria Querys da MPMS =====================================================
    CriaQueryIB('IBDB_MPMS', 'IBT_MPMS', IBQ_MPMS, True, True);
    DMMovtosEmpresas.CDS_Busca.Close;

    Result:=True;
  Except
  End;
End; // Conecta a Administraçao MPMS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Procedure TFrmMovtosEmpresas.VerificaProcessamento;
Var
  MySql: String;
begin
  // Desmarca Para Nâo Processamento =======================================
  MySql:=' Delete FROM MOVTOS_EMPRESAS m'+
         ' Where m.IND_TIPO='+QuotedStr('OK');
  DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
End;

// Conexao IB Individual >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Procedimento: (A) Abrir Conexão (F) Fechar COnexão
Function TFrmMovtosEmpresas.ConexaoEmpIndividual(sDataBase, sTransaction, sProcedimento: String): Boolean;
Var
  i, ii: Integer;
  b: Boolean;
Begin
  Result:=False;
  b:=False;

  i:=0;
  ii:=0;
  While Not b do
  Begin
    Try
      If ii=0 Then
       Begin
         For i:=0 to DMConexoes.ComponentCount-1 do
         Begin
           If DMConexoes.Components[i] is TIBDatabase Then
           Begin
             If (DMConexoes.Components[i] as TIBDatabase).Name=sDataBase Then
             Begin

               // Abre Conexão --------------------------------------
               If sProcedimento='A' Then
               Begin
                 If (DMConexoes.Components[i] as TIBDatabase).Connected Then
                  (DMConexoes.Components[i] as TIBDatabase).Connected:=False;

                 Try 
                   (DMConexoes.Components[i] as TIBDatabase).Connected:=True;
                   Result:=True;
                   ii:=99;
                   Break;
                 Except
                 End;
               End; // If sProcedimento='A' Then

               // Fecha Conexão --------------------------------------
               If sProcedimento='F' Then
               Begin
                 (DMConexoes.Components[i] as TIBDatabase).Connected:=False;
                 Result:=True;
                 ii:=99;
                 Break;
               End; // If sProcedimento='A' Then

             End;
           End; // If DMConexoes.Components[i] is TIBDatabase Then
         End; // For i:=0 to DMConexoes.ComponentCount-1 do
       End
      Else // If ii=0 Then
       Begin

         // Abre Conexão --------------------------------------
         If sProcedimento='A' Then
         Begin
           If (DMConexoes.Components[i] as TIBDatabase).Connected Then
            (DMConexoes.Components[i] as TIBDatabase).Connected:=False;

           Try 
             (DMConexoes.Components[i] as TIBDatabase).Connected:=True;
             Result:=True;
             ii:=99;
             Break;
           Except
           End;
         End; // If sProcedimento='A' Then

         // Fecha Conexão -------------------------------------
         If sProcedimento='F' Then
         Begin
           (DMConexoes.Components[i] as TIBDatabase).Connected:=False;
           Result:=True;
           ii:=99;
           Break;
         End; // If sProcedimento='A' Then

       End;
    Except
      Inc(ii);
    End; // Try

    If (ii=0) or (ii>0) Then  // 1 Vezes
     Break;
  End; // While Not b do

End;

// Atualzia Conexao TIBQuery >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmMovtosEmpresas.CriaQueryIB(sDataBase, sTransaction: String;
                                         Var IBQ_Free: TIBQuery;
                                         bMatriz, bCriaIBQ: Boolean);
Var
  i: Integer;
  iOk: Integer;
Begin

  iOk:=0;

  If bCriaIBQ Then
  Begin
    Try
      If IBQ_Free <> Nil Then
       IBQ_Free.Free;
    Except
    End;

    IBQ_Free:=TIBQuery.Create(Self);
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

End;

procedure TFrmMovtosEmpresas.FormCreate(Sender: TObject);
Var
  i: Integer;
begin
  bProcessou:=False;

  // Fechar Programa do Agendamento Anterior ===================================
  ApagaUltProcesso('PAtualizaEstoques.exe');
  //============================================================================

  // Sem Intenet Encerra =======================================================
  if not InternetGetConnectedState(@Flags, 0) then
  Begin
    Application.Terminate;
    Exit;
  End;

  // Verifica Parametro Enviado ================================================
  EdtParamStr.Clear;
  for i := 1 to ParamCount do
   EdtParamStr.Text:=LowerCase(ParamStr(i));

  // odiropss odiraqui1: Original: Nao Comentar 1 ///////////////////////
  If Trim(EdtParamStr.Text)='' Then
   EdtParamStr.Text:='ODIR'; // Agora é Direto por Agendamento
// EdtParamStr.Text:='OPSS';   // Não Libera Direto
// EdtParamStr.Text:='OPSS_N'; // Não Libera Direto
  // odiraqui2: Original: Nao Comentar 1 ///////////////////////

  If EdtParamStr.Text='' Then
  Begin
    Application.Terminate;
    Exit;
  End;

  iNumTentativas:=0;
  bExecutaDireto:=False;

 If AnsiUpperCase(EdtParamStr.Text)='ODIR' Then
  Begin
   bExecutaDireto:=True;
  End
 Else
  Begin
    // Não Apresenta o Form
    Application.ShowMainForm:=True;
  End;

 FormShow(Self);
end;

// Busca Movtos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmMovtosEmpresas.Bt_AtualizarClick(Sender: TObject);
Var
  bSiga: Boolean;

  bExec: Boolean; // Se Executou Processamento

  MySql: String;

  i: Integer;
  s, sDtaUltAtualizacao, sDta: String;

  // Usado no Estoque Final ////////////
  Dta: TDate;
  Ano, Mes, Dia: Word;
  sAno, sMes, sDia: String;
  sCodListaPreco: String;
  /////////////////////////////////////

  dDtaProc: TDateTime;
  ex: Extended;
begin
//==============================================================================
//                         PROCESSAMENTO MANUAL
//==============================================================================
// Se Parametro = OPSS
//==========================
  // NÃO ATUALIZA ESTOQUES (AtualizaTabelaEstoque(Cod_Empresa))
  // NÃO PROCESSA "UMA VEZ" bgJaProcessouUmaVez=True (Fica Como Já Processado)
  // PROCESSA: VERIFICA SE PROCESSA <IND_TIPO> DA EMPRESA (Se Já Processada)

//==========================
// Se Parametro = OPSS_N
//==========================
  // NÃO ATUALIZA ESTOQUES (AtualizaTabelaEstoque(Cod_Empresa))
  // NÃO PROCESSA "UMA VEZ" bgJaProcessouUmaVez=True (Fica Como Já Processado)
  // NÃO PROCESSA: VERIFICA SE PROCESSA <IND_TIPO> DA EMPRESA (Se Já Processada)
                  // Sempre Processa Lojas Selecionadas.
//==============================================================================
//                         PROCESSAMENTO MANUAL
//==============================================================================

// =============================================================================
// INICIO DO PROCESSO ==========================================================
// =============================================================================
  // Guarda Parametro ==========================================================
  EdtParamStr.Text:=AnsiUpperCase(EdtParamStr.Text);

  // Se Processamento Manual NÃO Efetua Processamento Somente Uma Vez ==========
  If (EdtParamStr.Text='OPSS') Or (EdtParamStr.Text='OPSS_N') Then
  Begin
    bgJaProcessouUmaVez:=True;
  End;

  DMConexoes.FechaTudoIBDataBases;
  iNumTentativas:=iNumTentativas+1;

  If Not DMMovtosEmpresas.CDS_EmpProcessa.Active Then
   DMMovtosEmpresas.CDS_EmpProcessa.Open;

  If Lbx_EmpresasProcessar.Items.Count=0 Then
  Begin
    DMMovtosEmpresas.CDS_EmpProcessa.First;
    While Not DMMovtosEmpresas.CDS_EmpProcessa.Eof do
    Begin
      Lbx_EmpresasProcessar.Items.Add(DMMovtosEmpresas.CDS_EmpProcessaCOD_FILIAL.AsString);

      DMMovtosEmpresas.CDS_EmpProcessa.Next;
    End; // While Not DMMovtosEmpresas.CDS_EmpProcessa.Eof do
    DMMovtosEmpresas.CDS_EmpProcessa.First;
  End; // If Lbx_EmpresasProcessar.Items.Count=0 Then

  // Grava já ou em Processamento ==============================================
  DateSeparator:='.';
  DecimalSeparator:='.';
  MySql:=' Insert Into MOVTOS_EMPRESAS ('+
         ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
         ' Values ('+
         QuotedStr('OK')+', '+
         QuotedStr('Ultima Atualização')+', '+
         QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
  DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
  DateSeparator:='/';
  DecimalSeparator:=',';

  bExcluir:=False;
  bProcessou:=True;

// odiropss - Comentar
// bgJaProcessouUmaVez:=True;

  // ===========================================================================
  // PROCESSAMENTOS SOMENTE UMA VEZ - INICIO ===================================
  // ===========================================================================
  If Not bgJaProcessouUmaVez Then
  Begin
    // =========================================================================
    // Atualiza FORNECEDORES (MPMS) - INICIO ===================================
    // =========================================================================
    MySql:=' SELECT m.ind_tipo'+
           ' FROM movtos_empresas m'+
           ' WHERE m.ind_tipo=''OK'''+
           ' AND m.nomefornecedor=''Fornecedores''';
    DMMovtosEmpresas.CDS_Busca.Close;
    DMMovtosEmpresas.SDS_Busca.CommandText:=MySql;
    DMMovtosEmpresas.CDS_Busca.Open;
    bgNewIndTipo:=Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString)='';
    DMMovtosEmpresas.CDS_Busca.Close;

    If bgNewIndTipo Then
    Begin
      MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
             ' Values ('+
             QuotedStr('OK')+', '+
             QuotedStr('Fornecedores')+', '+
             QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

      // Atualiza Fornecedores (MPMS)
      sDtaUltAtualizacao:=DateToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor)-20);
      sDtaUltAtualizacao:=f_Troca('/','.',sDtaUltAtualizacao);
      sDtaUltAtualizacao:=f_Troca('-','.',sDtaUltAtualizacao);

      AtualizaForn(sDtaUltAtualizacao); // sDtaUltAtualizacao não esta sendo Usado Atualmente. Pega Toda a Tabela
    End; // If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString)='' Then
    // =========================================================================
    // Atualiza FORNECEDORES (MPMS) - FIM ======================================
    // =========================================================================

    // =========================================================================
    // Atualiza PRODUTOS (MPMS) - INICIO =======================================
    // =========================================================================
    MySql:=' SELECT m.ind_tipo'+
           ' FROM movtos_empresas m'+
           ' WHERE m.ind_tipo=''OK'''+
           ' AND m.nomefornecedor=''Produtos''';
    DMMovtosEmpresas.CDS_Busca.Close;
    DMMovtosEmpresas.SDS_Busca.CommandText:=MySql;
    DMMovtosEmpresas.CDS_Busca.Open;
    bgNewIndTipo:=Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString)='';
    DMMovtosEmpresas.CDS_Busca.Close;

    If bgNewIndTipo Then
    Begin
      MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
             ' Values ('+
             QuotedStr('OK')+', '+
             QuotedStr('Produtos')+', '+
             QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

      AtualizaProdutos;
    End;
    // =========================================================================
    // Atualiza PRODUTOS (MPMS) - FIM ==========================================
    // =========================================================================

    // =========================================================================
    // Atualiza LISTA DE PRECOS (MPMS) - INICIO ================================
    // =========================================================================
    MySql:=' SELECT m.ind_tipo'+
           ' FROM movtos_empresas m'+
           ' WHERE m.ind_tipo=''OK'''+
           ' AND m.nomefornecedor=''Lista de Preços''';
    DMMovtosEmpresas.CDS_Busca.Close;
    DMMovtosEmpresas.SDS_Busca.CommandText:=MySql;
    DMMovtosEmpresas.CDS_Busca.Open;
    bgNewIndTipo:=Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString)='';
    DMMovtosEmpresas.CDS_Busca.Close;

    If bgNewIndTipo Then
    Begin
      MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
             ' Values ('+
             QuotedStr('OK')+', '+
             QuotedStr('Lista de Preços')+', '+
             QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

      // Atualiza Lista de Precos (MPMS)
      sDtaUltAtualizacao:=DateToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor)-20);
      sDtaUltAtualizacao:=f_Troca('/','.',sDtaUltAtualizacao);
      sDtaUltAtualizacao:=f_Troca('-','.',sDtaUltAtualizacao);

      AtualizaLP(sDtaUltAtualizacao); // sDtaUltAtualizacao não esta sendo Usado Atualmente. Pega Toda a Tabela
    End; // If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString)='' Then
    // =========================================================================
    // Atualiza LISTA DE PRECOS (MPMS) - FIM ===================================
    // =========================================================================

//odiropss - SALAO
    // =========================================================================
    // Atualiza SERVIÇOS DE SALÃO (MPMS) - INICIO ==============================
    // =========================================================================
    MySql:=' SELECT m.ind_tipo'+
           ' FROM movtos_empresas m'+
           ' WHERE m.ind_tipo=''OK'''+
           ' AND m.nomefornecedor=''Servicos Salao''';
    DMMovtosEmpresas.CDS_Busca.Close;
    DMMovtosEmpresas.SDS_Busca.CommandText:=MySql;
    DMMovtosEmpresas.CDS_Busca.Open;
    bgNewIndTipo:=Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString)='';
    DMMovtosEmpresas.CDS_Busca.Close;

    If bgNewIndTipo Then
    Begin
      MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
             ' Values ('+
             QuotedStr('OK')+', '+
             QuotedStr('Servicos Salao')+', '+
             QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

      AtualizaServicosSalao;
    End;
    // =========================================================================
    // Atualiza SERVIÇOS DE SALÃO (MPMS) - FIM =================================
    // =========================================================================

//    // =========================================================================
//    // Atualiza COMISSÇÕES DE SERVIÇOS DE SALÃO (MPMS) - INICIO ================
//    // =========================================================================
//    MySql:=' SELECT m.ind_tipo'+
//           ' FROM movtos_empresas m'+
//           ' WHERE m.ind_tipo=''OK'''+
//           ' AND m.nomefornecedor=''Comissões Servicos Salao''';
//    DMMovtosEmpresas.CDS_Busca.Close;
//    DMMovtosEmpresas.SDS_Busca.CommandText:=MySql;
//    DMMovtosEmpresas.CDS_Busca.Open;
//    bgNewIndTipo:=Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString)='';
//    DMMovtosEmpresas.CDS_Busca.Close;
//
//    If bgNewIndTipo Then
//    Begin
//      MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
//             ' Values ('+
//             QuotedStr('OK')+', '+
//             QuotedStr('Comissões Servicos Salao')+', '+
//             QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
//      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
//
//      AtualizaPercComissoesSalao;
//    End;
//    // =========================================================================
//    // Atualiza COMISSÇÕES DE SERVIÇOS DE SALÃO (MPMS) - FIM ===================
//    // =========================================================================
//
//    // =========================================================================
//    // Atualiza COMISSÕES DE HABILIDADES E GERAL DO PROFISSIONAL (MPMS) - INICIO
//    // =========================================================================
//    MySql:=' SELECT m.ind_tipo'+
//           ' FROM movtos_empresas m'+
//           ' WHERE m.ind_tipo=''OK'''+
//           ' AND m.nomefornecedor=''Comissões Hab/Prof Geral''';
//    DMMovtosEmpresas.CDS_Busca.Close;
//    DMMovtosEmpresas.SDS_Busca.CommandText:=MySql;
//    DMMovtosEmpresas.CDS_Busca.Open;
//    bgNewIndTipo:=Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString)='';
//    DMMovtosEmpresas.CDS_Busca.Close;
//
//    If bgNewIndTipo Then
//    Begin
//      MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
//             ' Values ('+
//             QuotedStr('OK')+', '+
//             QuotedStr('Comissões Hab/Prof Geral')+', '+
//             QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
//      DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
//
//      AtualizaPercComissoesHabProf;
//    End;
//    // =========================================================================
//    // Atualiza COMISSÕES DE HABILIDADES E GERAL DO PROFISSIONAL (MPMS) - FIM ==
//    // =========================================================================

    // =========================================================================
    // Atualiza Dados da Tabela ESTOQUE - Central de Trocas ====================
    // =========================================================================
    If (EdtParamStr.Text<>'OPSS') And (EdtParamStr.Text<>'OPSS_N') Then
    Begin
      AtualizaTabelaEstoque('50');
    End;

  End; // If Not bgJaProcessouUmaVez Then
  // ===========================================================================
  // PROCESSAMENTOS SOMENTE UMA VEZ - FIM ======================================
  // ===========================================================================

  bgJaProcessouUmaVez:=True;

  // ===========================================================================
  // INICIA PROCESSAMENTO ======================================================
  // ===========================================================================
  DMMovtosEmpresas.CDS_EmpProcessa.First;
  While Not DMMovtosEmpresas.CDS_EmpProcessa.Eof do
  Begin
    sCodEmpresa :=DMMovtosEmpresas.CDS_EmpProcessaCOD_FILIAL.AsString;

    Try
      iCodLojaLinx:=DMMovtosEmpresas.CDS_EmpProcessaCOD_LINX.AsInteger;
    Except
      iCodLojaLinx:=0;
    End;
    
//odiropss Comentar
//iCodLojaLinx:=18;
//if sCodEmpresa='01' Then
//sCodEmpresa:='18'
//else
//begin
// Application.Terminate;
// exit;
//End;

    // Sem Internet Encerra ====================================================
    if not InternetGetConnectedState(@Flags, 0) then
    Begin
      Application.Terminate;
      Exit;
    End;

    // ATUALIZA ES_FINAN_CURVA_ABC DA LOJA =====================================
    Es_Finan_Curva_ABC(sCodEmpresa);

    // Inicializa Variaveis ====================================================
    bExcluir:=False;
    bProcEstoque  :=True;

    bProcEstFinal :=True;
    bProcDemanda  :=True;
    bProcTransito :=True;
    bProcUltCompra:=True;
    bProcTransfSai:=True;
    bProcTransfEnt:=True;
    bProcPcCusto  :=True;
    bProcComprov  :=True;

    bProcAjTrAvPe :=True;
    bProcBonifca  :=True;
    bProcDescFinan:=True;
    bProcPagtoST  :=True;
    bProcVlrContab:=True;

    bProcSaldoProd:=True;

//==============================================================================
// VERIFICA SE PROCESSA <IND_TIPO> DA EMPRESA - INICIO =========================
//==============================================================================
    // Se Processamento Manual = OPSS_N
    //  NÃO Processa: VERIFICA SE PROCESSA <IND_TIPO> DA EMPRESA
    If EdtParamStr.Text<>'OPSS_N' Then
    Begin
      // Verifica se é para Processar Empresa ==================================
      MySql:=' select m.ind_tipo,'+
             ' Round((current_timestamp-Max(m.dta_atualizacao)),2) Diferenca'+
             ' From MOVTOS_EMPRESAS m'+
             ' Where m.codfilial='+QuotedStr(sCodEmpresa)+
             ' group by m.ind_tipo';
      DMMovtosEmpresas.CDS_Busca.Close;
      DMMovtosEmpresas.SDS_Busca.CommandText:=MySql;
      DMMovtosEmpresas.CDS_Busca.Open;

      // VERIFICA SE PROCESSA ==================================================
      While Not DMMovtosEmpresas.CDS_Busca.Eof do
      Begin

        //===========================
        // Preço de Custo ======================================================
        //===========================
        If DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString='PC' Then
        Begin
          If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsString)<>'' Then
          Begin
            If DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsCurrency<0.21 Then
             bProcPcCusto:=False;
          End; // If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsString)<>'' Then
        End; // If DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString='PC' Then

        //===========================
        // Demanda =============================================================
        //===========================
        If DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString='DM' Then
        Begin
          If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsString)<>'' Then
          Begin
            If DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsCurrency<0.21 Then
             bProcDemanda:=False;
          End; // If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsString)<>'' Then
        End; // If DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString='DM' Then

        //===========================
        // Transferencas de Saida ==============================================
        //===========================
        If DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString='TS' Then
        Begin
          If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsString)<>'' Then
          Begin
            If DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsCurrency<0.21 Then
             bProcTransfSai:=False;
          End; // If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsString)<>'' Then
        End; // If DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString='DM' Then

        //===========================
        // Transferencas de Entrada ============================================
        //===========================
        If DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString='TE' Then
        Begin
          If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsString)<>'' Then
          Begin
            If DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsCurrency<0.21 Then
             bProcTransfEnt:=False;
          End; // If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsString)<>'' Then
        End; // If DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString='DM' Then

        //===========================
        // Transito ============================================================
        //===========================
        If DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString='TR' Then
        Begin
          If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsString)<>'' Then
          Begin
            If DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsCurrency<0.21 Then
             bProcTransito:=False;
          End; // If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsString)<>'' Then
        End; // If DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString='TR' Then

        //===========================
        // Ultima Compra =======================================================
        //===========================
        If DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString='UC' Then
        Begin
          If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsString)<>'' Then
          Begin
            If DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsCurrency<0.21 Then
             bProcUltCompra:=False;
          End; // If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsString)<>'' Then
        End; // If DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString='UC' Then

        //===========================
        // Ajustes de Estoques e Transferencias de Avarias e Perdas ============
        //===========================
        If DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString='AP' Then
        Begin
          If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsString)<>'' Then
          Begin
            If DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsCurrency<0.21 Then
             bProcAjTrAvPe:=False;
          End; // If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsString)<>'' Then
        End; // If DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString='AP' Then

        //===========================
        // Bonificações ========================================================
        //===========================
        If DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString='BF' Then
        Begin
          If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsString)<>'' Then
          Begin
            If DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsCurrency<0.21 Then
             bProcBonifca:=False;
          End; // If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsString)<>'' Then
        End; // If DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString='BF' Then

        //===========================
        // Desconto Financeiro =================================================
        //===========================
        If DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString='DF' Then
        Begin
          If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsString)<>'' Then
          Begin
            If DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsCurrency<0.21 Then
             bProcDescFinan:=False;
          End; // If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsString)<>'' Then
        End; // If DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString='DF' Then

        //===========================
        // Pagamento Substituição Tributária ===================================
        //===========================
        If DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString='PS' Then
        Begin
          If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsString)<>'' Then
          Begin
            If DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsCurrency<0.21 Then
             bProcPagtoST:=False;
          End; // If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsString)<>'' Then
        End; // If DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString='PS' Then

        //===========================
        // Valor Contabil ======================================================
        //===========================
        If DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString='VC' Then
        Begin
          If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsString)<>'' Then
          Begin
            If DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsCurrency<0.21 Then
             bProcVlrContab:=False;
          End; // If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('Diferenca').AsString)<>'' Then
        End; // If DMMovtosEmpresas.CDS_Busca.FieldByName('Ind_Tipo').AsString='VC' Then

        DMMovtosEmpresas.CDS_Busca.Next;
      End; // While Not DMMovtosEmpresas.CDS_Busca.Eof do
      DMMovtosEmpresas.CDS_Busca.Close;
    End; // If EdtParamStr.Text<>'OPSS_N' Then
//==============================================================================
// VERIFICA SE PROCESSA <IND_TIPO> DA EMPRESA - FIM ============================
//==============================================================================

    // Estoques Financeiro Final de Mês ========================================
    Dta:=DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor);
    Dta:=PrimUltDia(Dta,'P');
    Dta:=Dta-1;
    DecodeDate(Dta, Ano, Mes, Dia);

    sAno:=VarToStr(Ano);
    sDia:=VarToStr(Dia);
    If Length(sDia)<2 Then
     sDia:='0'+sDia;

    sMes:=VarToStr(Mes);
    If Length(sMes)<2 Then
     sMes:='0'+sMes;

    bProcEstFinal:=False;
    MySql:=' select m.ind_tipo'+
           ' From MOVTOS_EMPRESAS m'+
           ' Where m.codfilial='+QuotedStr(sCodEmpresa)+
           ' and m.ind_tipo in (''EF'', ''EV'', ''EC'', ''EM'')'+
           ' and m.dta_ref='+QuotedStr('01.'+sMes+'.'+sAno);
    DMMovtosEmpresas.CDS_Busca.Close;
    DMMovtosEmpresas.SDS_Busca.CommandText:=MySql;
    DMMovtosEmpresas.CDS_Busca.Open;

    If DMMovtosEmpresas.CDS_Busca.IsEmpty Then
     bProcEstFinal:=True;

    DMMovtosEmpresas.CDS_Busca.Close;

    // Saldo Produtos Mês ======================================================
    bProcSaldoProd:=False;
    MySql:=' SELECT FIRST 1 m.dta_atualizacao'+
           ' FROM PROD_SALDO_MES m'+
           ' WHERE m.codfilial='+QuotedStr(sCodEmpresa)+
           ' AND CAST(m.dta_atualizacao AS DATE)=current_date';
    DMMovtosEmpresas.CDS_Busca.Close;
    DMMovtosEmpresas.SDS_Busca.CommandText:=MySql;
    DMMovtosEmpresas.CDS_Busca.Open;

    If DMMovtosEmpresas.CDS_Busca.IsEmpty Then
     bProcSaldoProd:=True;

    DMMovtosEmpresas.CDS_Busca.Close;

    // Verifica se é para Processar a Empresa ==================================
    bSiga:=False;
    for i:=0 to Lbx_EmpresasProcessar.Items.Count-1 do
    Begin
      If Lbx_EmpresasProcessar.Items[i]=sCodEmpresa Then
      Begin
        bSiga:=True;
        Break;
      End; // If Lbx_EmpresasProcessar.Items[i]=sCodEmpresa Then
    End; // for i:=0 to Lbx_EmpresasProcessar.Items.Count-1 do

    If (Not bProcDemanda)   and (Not bProcTransito)  and (Not bProcUltCompra) and
       (Not bProcEstFinal)  and (Not bProcTransfSai) and (Not bProcTransfEnt) and
       (Not bProcPcCusto)   and (Not bProcComprov)   and (Not bProcAjTrAvPe)  and
       (Not bProcBonifca)   and (Not bProcDescFinan) and (Not bProcPagtoST)   and
       (Not bProcVlrContab) and (Not bProcSaldoProd) and (Not bProcEstoque)   Then
    Begin
      for i:=0 to Lbx_EmpresasProcessar.Items.Count-1 do
      Begin
        If Lbx_EmpresasProcessar.Items[i]=sCodEmpresa Then
        Begin
          Lbx_EmpresasProcessar.Items.Delete(i);
          Break;
        End; // If Lbx_EmpresasProcessar.Items[i]=sCodEmpresa Then
      End; // for i:=0 to Lbx_EmpresasProcessar.Items.Count-1 do
      bSiga:=False;
    End; // If (Not bProcDemanda) and (Not bProcTransito) and (Not bProcUltCompra) and ...

    If iCodLojaLinx<>0 Then // LINX
    Begin
      // odiropss - Alterar para bProcDemanda:=True;
      bProcDemanda:=True;
      // odiropss - Alterar para bProcUltCompra:=True;
      bProcUltCompra:=True;

      bProcTransito:=False;
        bProcEstFinal:=False;
        bProcTransfSai:=False;
        bProcTransfEnt:=False;
        bProcPcCusto:=False;
        bProcComprov:=False;
        bProcAjTrAvPe:=False;
        bProcBonifca:=False;
        bProcDescFinan:=False;
        bProcPagtoST:=False;
        bProcVlrContab:=False;
        bProcSaldoProd:=False;
        bProcEstoque:=False;
    End; // If iCodLojaLinx<>0 Then // LINX

    If bSiga Then // Se já faz mais de 5 horas a Ultima Atualização da Empresa
    Begin
      If iCodLojaLinx=0 Then // SIDICOM
      Begin
        Try // Conecta Empresa
          Begin
            bSiga:=False;
            If ConexaoEmpIndividual('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, 'A') Then
             bSiga:=True;
          End;
        Except // Try // Conecta Empresa
          Begin
            bSiga:=False;
          End;
        End; // Try // Conecta Empresa
      End; // If iCodLojaLinx=0 Then // SIDICOM

      // =======================================================================
      // =======================================================================
      // VERIFICA SE CONTINUA O PROCESSAMENTO - INICIO =========================
      // =======================================================================
      // =======================================================================
      If bSiga Then // Conexão OK
      Begin
        // Grava Inicio do Processamento da Loja ===============================
        MySql:=' Insert Into MOVTOS_EMPRESAS ('+
               ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
               ' Values ('+
               QuotedStr('PR')+', '+
               QuotedStr('Inicio PROC Loja: '+sCodEmpresa)+', '+
               QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
        DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

        // odiraqui1: Original: Vale 2ª Linha ///////////////////
        // sDtaUltAtualizacao:='01.01.2013';
        sDtaUltAtualizacao:=DateTimeToStr(PrimeiroUltimoDia(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor)-60,'P'));
        // odiraqui2 Original: Vale 2ª Linha ///////////////////

        // ============================================================
        // Atualiza Dados da Tabela ESTOQUE ===========================
        // ============================================================
        If (EdtParamStr.Text<>'OPSS') And (EdtParamStr.Text<>'OPSS_N') Then
        Begin
          //odiropss - Retirar comentario
          AtualizaTabelaEstoque(sCodEmpresa);
        End;

        dDtaProc:=DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor);
        // ============================================================
        // Busca Comprovantes =========================================
        // ============================================================
        bExec:=False;
        If bProcComprov Then
        Begin
          dDtaProc:=DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // Grava Loja em Processamento --------------------------
          MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                 ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                 ' Values ('+
                 QuotedStr('OK')+', '+
                 QuotedStr('Comprovantes_Inicio Loja: '+sCodEmpresa)+', '+
                 QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
          DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

          DateSeparator:='/';
          DecimalSeparator:=',';

          // Cria Query da Empresa ------------------------------------
          CriaQueryIB('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, IBQ_Consulta, False, True);

          DateSeparator:='.';
          DecimalSeparator:='.';

          MySql:=' SELECT c.codcomprovante, c.nomecomprovante, c.tipocomprovante,'+
                 ' c.obscomprovante, c.compdesativado'+
                 ' FROM comprv c'+
                 ' ORDER BY 2';
          IBQ_Consulta.Close;
          IBQ_Consulta.SQL.Clear;
          IBQ_Consulta.SQL.Add(MySql);

          // Abre Query da no Banco de Dados da Loja -----------------
          i:=0;
          bSiga:=False;
          While Not bSiga do
          Begin
            Try
              IBQ_Consulta.Open;
              bSiga:=True;
            Except
              Inc(i);
            End; // Try

            If i>99 Then
              Break;
          End; // While Not bSiga do

          // Processamento  -------------------------------------------
          If bSiga Then // Consulta Comprovantes
          Begin
            Try
              // Monta Transacao  ---------------------------------------
              TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
              TD.IsolationLevel:=xilREADCOMMITTED;
              DMMovtosEmpresas.SQLC.StartTransaction(TD);

              DateSeparator:='.';
              DecimalSeparator:='.';

              // Exclui Movto da Empresa --------------------------------
              MySql:=' DELETE FROM comprv c'+
                     ' WHERE c.codloja='+QuotedStr(sCodEmpresa);
              DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

              While Not IBQ_Consulta.Eof do
              Begin
                // Acerta Data da Venda ---------------------------------
                MySql:=' Insert Into COMPRV ('+
                       ' CODLOJA, CODCOMPROVANTE, NOMECOMPROVANTE, TIPOCOMPROVANTE,'+
                       ' OBSCOMPROVANTE, COMPDESATIVADO, DTA_ATUALIZACAO)'+
                       ' Values ('+
                       QuotedStr(sCodEmpresa)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('CODCOMPROVANTE').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('NOMECOMPROVANTE').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('TIPOCOMPROVANTE').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('OBSCOMPROVANTE').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('COMPDESATIVADO').AsString)+', '+
                       QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                If Not bExec Then
                Begin
                  // Grava Loja em Processamento --------------------------
                  MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                         ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                         ' Values ('+
                         QuotedStr('OK')+', '+
                         QuotedStr('Comprovantes_Exec Loja: '+sCodEmpresa)+', '+
                         QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                  DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                  bExec:=True;
                End;

                IBQ_Consulta.Next;
              End; // While Not IBQ_Consulta.Eof do

              DMMovtosEmpresas.SQLC.Commit(TD);

              DateSeparator:='/';
              DecimalSeparator:=',';
            Except
              on e : Exception do
              Begin
                DMMovtosEmpresas.SQLC.Rollback(TD);
                bExcluir:=True;

                DateSeparator:='/';
                DecimalSeparator:=',';

                sgMensagem:='Comprov-'+sCodEmpresa+': '+e.Message;
                sgMensagem:=copy(sgMensagem,1,200);
                MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
                       ' Values ('+
                       QuotedStr('Er')+', '+
                       QuotedStr(sgMensagem)+', '+
                       QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
              End; // on e : Exception do
            End; // Try
          End; // If bSiga Then // Consulta Comprovantes

          DateSeparator:='/';
          DecimalSeparator:=',';
        End; // If bProcComprov Then
        // Busca Comprovantes =========================================

        If HoursBetween(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor), dDtaProc)>0 Then
         ParaProcessamentoLoja;

        // ============================================================
        // (PC) Busca Preço de Custo ==================================
        // ============================================================
        bExec:=False;
        If bProcPcCusto Then
        Begin
          dDtaProc:=DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // Grava Loja em Processamento --------------------------
          MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                 ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                 ' Values ('+
                 QuotedStr('OK')+', '+
                 QuotedStr('Preco Custo_Inicio Loja: '+sCodEmpresa)+', '+
                 QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
          DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

          DateSeparator:='/';
          DecimalSeparator:=',';

          // Cria Query da Empresa ------------------------------------
          CriaQueryIB('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, IBQ_Consulta, False, True);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // (PC) Busca Preço de Custo
          sDtaUltAtualizacao:=DateTimeToStr(PrimeiroUltimoDia(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor)-60,'P'));
          sDtaUltAtualizacao:=f_Troca('/','.',sDtaUltAtualizacao);
          sDtaUltAtualizacao:=f_Troca('-','.',sDtaUltAtualizacao);

          MySql:=' SELECT m.comp_anomes, p.codproduto,'+

                 ' SUM(COALESCE(p.quant,0)) Tot_Qtd,'+ // QUANT_REF (Soma da Quantidades do Produto)

                 ' ((SUM(COALESCE(p.valbruto,0))-'+
                 '   SUM(COALESCE(p.valdesconto,0))+'+
                 '   SUM(COALESCE(p.valsubstituicao,0))+'+
                 '   SUM(COALESCE(p.valipi,0)))/'+
                 '   SUM(COALESCE(p.quant,0))) Preco_Custo,'+ // PRECO Preco de Custo Médio ((Soma Vlr Bruto  - Soma Descontos + Soma Vlr IPI + Soma vlr ST)/Soma Qtd)

                 ' SUM(COALESCE(p.valipi,0)) Tot_IPI,'+ // DES_SITUACAO => (ATENÇÃO Esta em String) (Soma dos Valores IPI)

                 ' SUM(COALESCE(p.valbruto,0)) Tot_Bruto,'+ // VALBRUTO (Soma dos Valores Bruto)

                 ' SUM(COALESCE(p.valdesconto,0)) Tot_Desconto,'+ // VALDESCONTO (Soma dos Valores Desconto)

                 ' SUM(COALESCE(p.valsubstituicao,0)) Tot_ST,'+ // VALSUBSTITUICAO (Soma dos Valores ST)

                 ' (SUM(COALESCE(p.valbruto,0))-'+
                 '  SUM(COALESCE(p.valdesconto,0))+'+
                 '  SUM(COALESCE(p.valsubstituicao,0))+'+
                 '  SUM(COALESCE(p.valipi,0))) Tot_Valor'+ // VLR_TOTAL_REF Preco de Custo Médio Bruto - (Soma Vlr Bruto - Soma Descontos + Soma Vlr IPI + Soma vlr ST)

                 ' FROM MFOR m, MFORPRO p'+

                 ' WHERE m.CHAVENF=p.CHAVENF'+
                 ' AND m.codcomprovante=''010'''+
                 ' AND m.situacaonf=1'+
                 ' AND m.codfilial='+QuotedStr(sCodEmpresa)+
                 ' AND m.datacomprovante>='+QuotedStr(sDtaUltAtualizacao)+
                 ' GROUP BY 1,2';
          IBQ_Consulta.Close;
          IBQ_Consulta.SQL.Clear;
          IBQ_Consulta.SQL.Add(MySql);

          // Abre Query da no Banco de Dados da Loja -----------------
          i:=0;
          bSiga:=False;
          While Not bSiga do
          Begin
            Try
              IBQ_Consulta.Open;
              bSiga:=True;
            Except
              Inc(i);
            End; // Try

            If i>99 Then
              Break;
          End; // While Not bSiga do

          // Processamento  -------------------------------------------
          If bSiga Then // Consulta Preco de Custo
          Begin
            Try
              // Monta Transacao  ---------------------------------------
              TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
              TD.IsolationLevel:=xilREADCOMMITTED;
              DMMovtosEmpresas.SQLC.StartTransaction(TD);

              DateSeparator:='.';
              DecimalSeparator:='.';

              // Exclui Movto da Empresa --------------------------------
              MySql:=' Delete From MOVTOS_EMPRESAS'+
                     ' Where Ind_Tipo='+QuotedStr('PC')+
                     ' And CodFilial='+QuotedStr(sCodEmpresa)+
                     ' And DTA_REF>='+QuotedStr(sDtaUltAtualizacao);
              DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

              While Not IBQ_Consulta.Eof do
              Begin
                // Acerta Data da Venda ---------------------------------
                s:=IBQ_Consulta.FieldByName('comp_anomes').AsString;
                i:=pos('/',s);
                sDtaUltAtualizacao:=Copy(s,i+1,length(s));
                If length(sDtaUltAtualizacao)<2 Then
                 sDtaUltAtualizacao:='0'+sDtaUltAtualizacao;
                sDtaUltAtualizacao:='01.'+sDtaUltAtualizacao+'.'+Copy(s,1,4);
                sDtaUltAtualizacao:=f_Troca('/','.',sDtaUltAtualizacao);
                sDtaUltAtualizacao:=f_Troca('-','.',sDtaUltAtualizacao);

//              QUANT_REF       Tot_Qtd -----------> (Soma da Quantidades do Produto)
//              PRECO           Preco_Custo -------> Preco de Custo Médio ((Soma Vlr Bruto  - Soma Descontos + Soma Vlr IPI + Soma vlr ST)/Soma Qtd)
//              DES_SITUACAO    Tot_IPI -----------> (Soma dos Valores IPI)
//              VALBRUTO        Tot_Bruto ---------> (Soma dos Valores Bruto)
//              VALDESCONTO     Tot_Desconto -----------> (Soma dos Valores Desconto)
//              VALSUBSTITUICAO Tot_ST ------------> (Soma dos Valores ST)
//              VLR_TOTAL_REF   Tot_Valor ---------> Preco de Custo Médio Bruto - (Soma Vlr Bruto - Soma Descontos + Soma Vlr IPI + Soma vlr ST)
//              DTA_ATUALIZACAO (DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor)))
                MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                       ' CODFILIAL, IND_TIPO, CODPRODUTO,'+
                       ' CODFORNECEDOR, NOMEFORNECEDOR, DTA_REF,'+
                       ' QUANT_REF, PRECO, DES_SITUACAO, VALBRUTO, VALDESCONTO,'+
                       ' VALSUBSTITUICAO, VLR_TOTAL_REF, DTA_ATUALIZACAO)'+
                       ' Values ('+
                       QuotedStr(sCodEmpresa)+', '+ // CODFILIAL
                       QuotedStr('PC')+', '+ // IND_TIPO
                       QuotedStr(IBQ_Consulta.FieldByName('codproduto').AsString)+', '+ // CODPRODUTO
                       'Null, '+ // CODFORNECEDOR
                       'Null, '+ // NOMEFORNECEDOR
                       QuotedStr(sDtaUltAtualizacao)+', '+ // DTA_REF
                       QuotedStr(IBQ_Consulta.FieldByName('Tot_Qtd').AsString)+', '+ // QUANT_REF
                       QuotedStr(IBQ_Consulta.FieldByName('Preco_Custo').AsString)+', '+ // PRECO
                       QuotedStr(f_Troca('.',',',IBQ_Consulta.FieldByName('Tot_IPI').AsString))+', '+ // DES_SITUACAO
                       QuotedStr(IBQ_Consulta.FieldByName('Tot_Bruto').AsString)+', '+ // VALBRUTO
                       QuotedStr(IBQ_Consulta.FieldByName('Tot_Desconto').AsString)+', '+ // VALDESCONTO
                       QuotedStr(IBQ_Consulta.FieldByName('Tot_ST').AsString)+', '+ // VALSUBSTITUICAO
                       QuotedStr(IBQ_Consulta.FieldByName('Tot_Valor').AsString)+', '+ // VLR_TOTAL_REF
                       QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')'; // DTA_ATUALIZACAO
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                If Not bExec Then
                Begin
                  // Grava Loja em Processamento --------------------------
                  MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                         ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                         ' Values ('+
                         QuotedStr('OK')+', '+
                         QuotedStr('Preco Custo_Exec Loja: '+sCodEmpresa)+', '+
                         QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                  DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                  bExec:=True;
                End;

                IBQ_Consulta.Next;
              End; // While Not IBQ_Consulta.Eof do

              DMMovtosEmpresas.SQLC.Commit(TD);

              DateSeparator:='/';
              DecimalSeparator:=',';
            Except
              on e : Exception do
              Begin
                DMMovtosEmpresas.SQLC.Rollback(TD);
                bExcluir:=True;

                DateSeparator:='/';
                DecimalSeparator:=',';

                sgMensagem:='PC-'+sCodEmpresa+': '+e.Message;
                sgMensagem:=copy(sgMensagem,1,200);
                MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
                       ' Values ('+
                       QuotedStr('Er')+', '+
                       QuotedStr(sgMensagem)+', '+
                       QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
              
              End; // on e : Exception do
            End; // Try
          End; // If bSiga Then // Consulta Preço de Custo

          DateSeparator:='/';
          DecimalSeparator:=',';
        End; // If bProcPcCusto Then
        // (PC) Busca Preço de Custo ==================================

        If HoursBetween(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor), dDtaProc)>0 Then
         ParaProcessamentoLoja;

        // ============================================================
        // (DM) Busca Demandas ========================================
        // ============================================================
        bExec:=False;
        If bProcDemanda Then
        Begin
          dDtaProc:=DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // Grava Loja em Processamento --------------------------
          MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                 ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                 ' Values ('+
                 QuotedStr('OK')+', '+
                 QuotedStr('Demanda_Inicio Loja: '+sCodEmpresa)+', '+
                 QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
          DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

          DateSeparator:='/';
          DecimalSeparator:=',';

          // Cria Query da Empresa ------------------------------------
          If iCodLojaLinx=0 Then // SIDICOM
          Begin
            CriaQueryIB('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, IBQ_Consulta, False, True);
          End; // If iCodLojaLinx=0 Then // SIDICOM

          DateSeparator:='.';
          DecimalSeparator:='.';

          // (DM) Busca Demandas
          sDtaUltAtualizacao:=DateTimeToStr(PrimeiroUltimoDia(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor)-60,'P'));
          sDtaUltAtualizacao:=f_Troca('/','.',sDtaUltAtualizacao);
          sDtaUltAtualizacao:=f_Troca('-','.',sDtaUltAtualizacao);

          If iCodLojaLinx=0 Then // SIDICOM
          Begin
            MySql:=' Select p.codproduto, m.comp_anomes,'+
                   ' sum(coalesce(p.quantatendida,0)) demanda,'+
                   ' sum(coalesce(p.valtotal,0)) Vlr_Total'+

                   ' From mcli m, mclipro p'+
                   ' where m.chavenf=p.chavenf'+

                   ' and p.somouestoque=''S''';

                   If sCodEmpresa='99' Then
                    MySql:=MySql+' and (m.codcomprovante=''001'' or m.codcomprovante=''007'')'+
                                 ' and m.clienteoufilial=''0''' // Somente Cliente
                   Else
                    MySql:=MySql+' and (m.codcomprovante=''002'' or m.codcomprovante=''007'')';

            MySql:=
             MySql+' and m.codfilial='+QuotedStr(sCodEmpresa)+
                   ' and m.datacomprovante>='+QuotedStr(sDtaUltAtualizacao)+

                   ' group by 1,2'+
                   ' order by 1,2';
            IBQ_Consulta.Close;
            IBQ_Consulta.SQL.Clear;
            IBQ_Consulta.SQL.Add(MySql);

            // Abre Query da no Banco de Dados da Loja -----------------
            i:=0;
            bSiga:=False;
            While Not bSiga do
            Begin
              Try
                IBQ_Consulta.Open;
                bSiga:=True;
              Except
                Inc(i);
              End; // Try

              If i>99 Then
                Break;
            End; // While Not bSiga do
          End; // If iCodLojaLinx=0 Then // SIDICOM

          If iCodLojaLinx<>0 Then // LINX
          Begin
            MySql:=' SELECT '+QuotedStr(sCodEmpresa)+' cod_filial, ''DM'' ind_tipo,'+
                   ' dem.codproduto,'+
                   ' ''01.''||SUBSTRING(dem.comp_anomes FROM 6 FOR 2)||''.''||SUBSTRING(dem.comp_anomes FROM 1 FOR 4) dta_ref,'+
                   ' SUM(dem.demanda) quant_ref,'+
                   ' SUM(dem.vlr_total) preco,'+
                   ' CURRENT_TIMESTAMP dta_atualizacao'+

                   ' FROM (SELECT lp.cod_auxiliar codproduto,'+
                   '              CAST(EXTRACT(YEAR FROM lm.data_documento) AS VARCHAR(4))||''/''||'+
                   '              CAST(LPAD(EXTRACT(MONTH FROM lm.data_documento), 2, ''0'') AS VARCHAR(2)) comp_anomes,'+
                   '              SUM(DECODE(lm.operacao, ''S'', lm.quantidade, -lm.quantidade)) demanda,'+
                   '              SUM(DECODE(lm.operacao, ''S'', lm.valor_total, -lm.valor_total)) vlr_total'+
                   '       FROM LINXMOVIMENTO lm, LINXPRODUTOS lp'+
                   '       WHERE lm.cod_produto = lp.cod_produto'+
                   '       AND   lm.operacao IN (''S'', ''DS'')'+
                   '       AND   ((lm.tipo_transacao IN (''V'', ''S'')) OR'+
                   '              (lm.tipo_transacao IS NULL) OR'+
                   '              (TRIM(lm.tipo_transacao) = ''''))'+
                   '       AND   lm.cancelado = ''N'''+
                   '       AND   lm.excluido = ''N'''+
                   '       AND   lm.soma_relatorio = ''S'''+
                   '       AND   lp.cod_auxiliar IS NOT NULL'+
                   '       AND   lm.empresa ='+IntToStr(iCodLojaLinx)+
                   '       AND   lm.data_documento >= '+QuotedStr(sDtaUltAtualizacao)+
                   '       GROUP BY 1, 2'+

                   '       UNION'+

                   '       SELECT m.codproduto,'+
                   '              CAST(EXTRACT(YEAR FROM m.dta_ref) AS VARCHAR(4))||''/''||CAST(LPAD(EXTRACT(MONTH FROM m.dta_ref), 2, ''0'') AS VARCHAR(2)) comp_anomes,'+
                   '              SUM(m.quant_ref) demanda,'+
                   '              SUM(m.preco) vlr_total'+
                   '       FROM MOVTOS_EMPRESAS_ANT m'+
                   '       WHERE m.ind_tipo = ''DM'''+
                   '       AND   m.codfilial = '+QuotedStr(sCodEmpresa)+
                   '       AND   m.dta_ref >= '+QuotedStr(sDtaUltAtualizacao)+
                   '       GROUP BY 1, 2'+
                   '       ORDER BY 1, 2) DEM'+
                   ' GROUP BY 1, 2, 3, 4';
            DMMovtosEmpresas.CDS_LojaLinx.Close;
            DMMovtosEmpresas.SDS_LojaLinx.CommandText:=MySql;
            DMMovtosEmpresas.CDS_LojaLinx.Open;
            bSiga:=True;
          End; // If iCodLojaLinx<>0 Then // LINX

          // Processamento  -------------------------------------------
          If bSiga Then // Consulta Demandas
          Begin
            Try
              // Monta Transacao  ---------------------------------------
              TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
              TD.IsolationLevel:=xilREADCOMMITTED;
              DMMovtosEmpresas.SQLC.StartTransaction(TD);

              DateSeparator:='.';
              DecimalSeparator:='.';

              If iCodLojaLinx=0 Then // SIDICOM
              Begin
                // Exclui Movto da Empresa --------------------------------
                MySql:=' Delete From MOVTOS_EMPRESAS'+
                       ' Where Ind_Tipo='+QuotedStr('DM')+
                       ' And CodFilial='+QuotedStr(sCodEmpresa)+
                       ' And DTA_REF>='+QuotedStr(sDtaUltAtualizacao);
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                While Not IBQ_Consulta.Eof do
                Begin
                  // Acerta Data da Venda ---------------------------------
                  s:=IBQ_Consulta.FieldByName('comp_anomes').AsString;
                  i:=pos('/',s);

                  sDtaUltAtualizacao:=Copy(s,i+1,length(s));
                  If length(sDtaUltAtualizacao)<2 Then
                   sDtaUltAtualizacao:='0'+sDtaUltAtualizacao;
                  sDtaUltAtualizacao:='01.'+sDtaUltAtualizacao+'.'+Copy(s,1,4);
                  sDtaUltAtualizacao:=f_Troca('/','.',sDtaUltAtualizacao);
                  sDtaUltAtualizacao:=f_Troca('-','.',sDtaUltAtualizacao);

                  MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                         ' CODFILIAL, IND_TIPO, CODPRODUTO,'+
                         ' CODFORNECEDOR, NOMEFORNECEDOR, DTA_REF,'+
                         ' QUANT_REF, PRECO, DTA_ATUALIZACAO)'+
                         ' Values ('+
                         QuotedStr(sCodEmpresa)+', '+
                         QuotedStr('DM')+', '+
                         QuotedStr(IBQ_Consulta.FieldByName('codproduto').AsString)+', '+
                         'Null, '+ // QuotedStr(IBQ_Consulta.FieldByName('principalfor').AsString)+
                         'Null, '+ // QuotedStr(IBQ_Consulta.FieldByName('nomefornecedor').AsString)+
                         QuotedStr(sDtaUltAtualizacao)+', '+
                         QuotedStr(IBQ_Consulta.FieldByName('Demanda').AsString)+', '+
                         QuotedStr(IBQ_Consulta.FieldByName('Vlr_Total').AsString)+', '+
                         QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                  DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                  If Not bExec Then
                  Begin
                    // Grava Loja em Processamento --------------------------
                    MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                           ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                           ' Values ('+
                           QuotedStr('OK')+', '+
                           QuotedStr('Demanda_Exec Loja: '+sCodEmpresa)+', '+
                           QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                    DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                    bExec:=True;
                  End;

                  IBQ_Consulta.Next;
                End; // While Not IBQ_Consulta.Eof do
              End; // If iCodLojaLinx=0 Then // SIDICOM

              If iCodLojaLinx<>0 Then // LINX
              Begin
                While Not DMMovtosEmpresas.CDS_LojaLinx.Eof do
                Begin
                  MySql:=' UPDATE OR INSERT INTO MOVTOS_EMPRESAS'+
                         ' (CODFILIAL, IND_TIPO, CODPRODUTO, DTA_REF, QUANT_REF, PRECO, DTA_ATUALIZACAO)'+
                         ' VALUES ('+
                         QuotedStr(DMMovtosEmpresas.CDS_LojaLinx.FieldByName('Cod_Filial').AsString)+', '+ // COD_FILIAL
                         QuotedStr(DMMovtosEmpresas.CDS_LojaLinx.FieldByName('Ind_Tipo').AsString)+', '+ // IND_TIPO
                         QuotedStr(DMMovtosEmpresas.CDS_LojaLinx.FieldByName('CodProduto').AsString)+', '+ // CODPRODUTO
                         QuotedStr(DMMovtosEmpresas.CDS_LojaLinx.FieldByName('Dta_Ref').AsString)+', '+ // DTA_REF
                         QuotedStr(DMMovtosEmpresas.CDS_LojaLinx.FieldByName('Quant_Ref').AsString)+', '+ // QUANT_REF
                         QuotedStr(DMMovtosEmpresas.CDS_LojaLinx.FieldByName('Preco').AsString)+', '+ // PRECO
                         QuotedStr(DMMovtosEmpresas.CDS_LojaLinx.FieldByName('Dta_Atualizacao').AsString)+')'+ // DTA_ATUALIZACAO
                         ' MATCHING (CODFILIAL, IND_TIPO, CODPRODUTO, DTA_REF)';
                  DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                  If Not bExec Then
                  Begin
                    // Grava Loja em Processamento --------------------------
                    MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                           ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                           ' Values ('+
                           QuotedStr('OK')+', '+
                           QuotedStr('Demanda_Exec Loja: '+sCodEmpresa)+', '+
                           QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                    DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                    bExec:=True;
                  End;

                  DMMovtosEmpresas.CDS_LojaLinx.Next;
                End; // While Not DMMovtosEmpresas.CDS_LojaLinx.Eof do
              End; // If iCodLojaLinx<>0 Then // LINX

              DMMovtosEmpresas.SQLC.Commit(TD);

              DateSeparator:='/';
              DecimalSeparator:=',';
            Except
              on e : Exception do
              Begin
                DMMovtosEmpresas.SQLC.Rollback(TD);
                bExcluir:=True;

                DateSeparator:='/';
                DecimalSeparator:=',';

                sgMensagem:='DM-'+sCodEmpresa+': '+e.Message;
                sgMensagem:=copy(sgMensagem,1,200);
                MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
                       ' Values ('+
                       QuotedStr('Er')+', '+
                       QuotedStr(sgMensagem)+', '+
                       QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

              End; // on e : Exception do
            End; // Try
          End; // If bSiga Then // Consulta Demandas

          DateSeparator:='/';
          DecimalSeparator:=',';
        End; // If bProcDemanda Then
        // (DM) Busca Demandas ========================================

        If HoursBetween(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor), dDtaProc)>0 Then
         ParaProcessamentoLoja;

        // ============================================================
        // (TS) Busca Transferencias de Saida =========================
        // ============================================================
        bExec:=False;
        If bProcTransfSai Then
        Begin
          dDtaProc:=DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // Grava Loja em Processamento --------------------------
          MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                 ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                 ' Values ('+
                 QuotedStr('OK')+', '+
                 QuotedStr('Trans_Saida_Inicio Loja: '+sCodEmpresa)+', '+
                 QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
          DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

          DateSeparator:='/';
          DecimalSeparator:=',';

          // Cria Query da Empresa ------------------------------------
          If sCodEmpresa<>'18' Then
          Begin
            CriaQueryIB('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, IBQ_Consulta, False, True);
          End; // If sCodEmpresa<>'18' Then

          DateSeparator:='.';
          DecimalSeparator:='.';

          sDtaUltAtualizacao:=DateTimeToStr(PrimeiroUltimoDia(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor)-60,'P'));
          sDtaUltAtualizacao:=f_Troca('/','.',sDtaUltAtualizacao);
          sDtaUltAtualizacao:=f_Troca('-','.',sDtaUltAtualizacao);

          // (TS) Busca Transferencias de Saida
          MySql:=' Select p.codproduto, m.comp_anomes,'+
                 ' sum(coalesce(p.quantatendida,0)) Transf,'+
                 ' sum(coalesce(p.valtotal,0)) Vlr_Total'+

                 ' From mcli m, mclipro p'+
                 ' where m.chavenf=p.chavenf'+

                 ' and p.somouestoque=''S'''+
                 ' and m.codcomprovante in (''019'',''015'', ''017'', ''020'')'+

                 ' and m.codfilial='+QuotedStr(sCodEmpresa)+
                 ' and m.datacomprovante>='+QuotedStr(sDtaUltAtualizacao)+

                 ' group by 1,2'+
                 ' Having sum(coalesce(p.quantatendida,0))>0'+
                 ' order by 1,2';
          IBQ_Consulta.Close;
          IBQ_Consulta.SQL.Clear;
          IBQ_Consulta.SQL.Add(MySql);

          // Abre Query da no Banco de Dados da Loja -----------------
          i:=0;
          bSiga:=False;
          While Not bSiga do
          Begin
            Try
              IBQ_Consulta.Open;
              bSiga:=True;
            Except
              Inc(i);
            End; // Try

            If i>99 Then
              Break;
          End; // While Not bSiga do

          // Processamento  -------------------------------------------
          If bSiga Then // Consulta Transferencias de Saida
          Begin
            Try
              // Monta Transacao  ---------------------------------------
              TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
              TD.IsolationLevel:=xilREADCOMMITTED;
              DMMovtosEmpresas.SQLC.StartTransaction(TD);

              DateSeparator:='.';
              DecimalSeparator:='.';

              // Exclui Movto da Empresa --------------------------------
              MySql:=' Delete From MOVTOS_EMPRESAS'+
                     ' Where Ind_Tipo='+QuotedStr('TS')+
                     ' And CodFilial='+QuotedStr(sCodEmpresa)+
                     ' And DTA_REF>='+QuotedStr(sDtaUltAtualizacao);
              DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

              While Not IBQ_Consulta.Eof do
              Begin
                // Acerta Data da Transferencia ------------------------
                s:=IBQ_Consulta.FieldByName('comp_anomes').AsString;
                i:=pos('/',s);
                sDtaUltAtualizacao:=Copy(s,i+1,length(s));
                If length(sDtaUltAtualizacao)<2 Then
                 sDtaUltAtualizacao:='0'+sDtaUltAtualizacao;
                sDtaUltAtualizacao:='01.'+sDtaUltAtualizacao+'.'+Copy(s,1,4);
                sDtaUltAtualizacao:=f_Troca('/','.',sDtaUltAtualizacao);
                sDtaUltAtualizacao:=f_Troca('-','.',sDtaUltAtualizacao);
                
                MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                       ' CODFILIAL, IND_TIPO, CODPRODUTO,'+
                       ' CODFORNECEDOR, NOMEFORNECEDOR, DTA_REF,'+
                       ' QUANT_REF, PRECO, DTA_ATUALIZACAO)'+
                       ' Values ('+
                       QuotedStr(sCodEmpresa)+', '+
                       QuotedStr('TS')+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('codproduto').AsString)+', '+
                       'Null, '+ // QuotedStr(IBQ_Consulta.FieldByName('principalfor').AsString)+
                       'Null, '+ // QuotedStr(IBQ_Consulta.FieldByName('nomefornecedor').AsString)+
                       QuotedStr(sDtaUltAtualizacao)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('Transf').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('Vlr_Total').AsString)+', '+
                       QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                If Not bExec Then
                Begin
                  // Grava Loja em Processamento --------------------------
                  MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                         ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                         ' Values ('+
                         QuotedStr('OK')+', '+
                         QuotedStr('Transf_Saida_Exec Loja: '+sCodEmpresa)+', '+
                         QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                  DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                  bExec:=True;
                End;

                IBQ_Consulta.Next;
              End; // While Not IBQ_Consulta.Eof do

              DMMovtosEmpresas.SQLC.Commit(TD);

              DateSeparator:='/';
              DecimalSeparator:=',';
            Except
              on e : Exception do
              Begin
                DMMovtosEmpresas.SQLC.Rollback(TD);
                bExcluir:=True;

                DateSeparator:='/';
                DecimalSeparator:=',';

                sgMensagem:='TS-'+sCodEmpresa+': '+e.Message;
                sgMensagem:=copy(sgMensagem,1,200);
                MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
                       ' Values ('+
                       QuotedStr('Er')+', '+
                       QuotedStr(sgMensagem)+', '+
                       QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

              End; // on e : Exception do
            End; // Try
          End; // If bSiga Then // Consulta Transferencias de Saida

          DateSeparator:='/';
          DecimalSeparator:=',';
        End; // If bProcTransfSai Then
        // (TS) Busca Transferencias de Saida =========================

        If HoursBetween(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor), dDtaProc)>0 Then
         ParaProcessamentoLoja;

        // ============================================================
        // (TE) Busca Transferencias de Entrada =======================
        // ============================================================
        bExec:=False;
        If bProcTransfEnt Then
        Begin
          dDtaProc:=DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // Grava Loja em Processamento --------------------------
          MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                 ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                 ' Values ('+
                 QuotedStr('OK')+', '+
                 QuotedStr('Trans_Entrada_Inicio Loja: '+sCodEmpresa)+', '+
                 QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
          DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

          DateSeparator:='/';
          DecimalSeparator:=',';

          // Cria Query da Empresa ------------------------------------
          CriaQueryIB('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, IBQ_Consulta, False, True);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // (TE) Busca Transferencias de Entrada
          sDtaUltAtualizacao:=DateTimeToStr(PrimeiroUltimoDia(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor)-60,'P'));
          sDtaUltAtualizacao:=f_Troca('/','.',sDtaUltAtualizacao);
          sDtaUltAtualizacao:=f_Troca('-','.',sDtaUltAtualizacao);

          MySql:=' Select p.codproduto, m.comp_anomes,'+
                 ' sum(coalesce(p.quant,0)) Transf,'+
                 ' sum(coalesce(p.valtotal,0)) Vlr_Total'+

                 ' From mfor m, mforpro p'+
                 ' where m.chavenf=p.chavenf'+

                 ' and p.entradasaida=''E'''+
                 ' and m.codcomprovante in (''018'',''016'')'+

                 ' and m.codfilial='+QuotedStr(sCodEmpresa)+
                 ' and m.datacomprovante>='+QuotedStr(sDtaUltAtualizacao)+

                 ' group by 1,2'+
                 ' Having sum(coalesce(p.quant,0))>0'+

                 ' UNION'+

                 ' SELECT p.codproduto, m.comp_anomes,'+
                 ' SUM(COALESCE(p.quantatendida,0)) Transf,'+
                 ' SUM(COALESCE(p.valtotal,0)) Vlr_Total'+

                 ' FROM mcli m, mclipro p'+

                 ' WHERE m.chavenf=p.chavenf'+
                 ' AND p.entradasaida=''E'''+
                 ' AND m.codcomprovante IN (''018'',''016'')'+
                 ' AND m.codfilial='+QuotedStr(sCodEmpresa)+
                 ' AND m.datacomprovante>='+QuotedStr(sDtaUltAtualizacao)+

                 ' GROUP BY 1,2'+
                 ' HAVING SUM(COALESCE(p.quantatendida,0))>0'+

                 ' ORDER BY 1,2';
          IBQ_Consulta.Close;
          IBQ_Consulta.SQL.Clear;
          IBQ_Consulta.SQL.Add(MySql);

          // Abre Query da no Banco de Dados da Loja -----------------
          i:=0;
          bSiga:=False;
          While Not bSiga do
          Begin
            Try
              IBQ_Consulta.Open;
              bSiga:=True;
            Except
              Inc(i);
            End; // Try

            If i>99 Then
              Break;
          End; // While Not bSiga do

          // Processamento  -------------------------------------------
          If bSiga Then // Consulta Transferencias de Entrada
          Begin
            Try
              // Monta Transacao  ---------------------------------------
              TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
              TD.IsolationLevel:=xilREADCOMMITTED;
              DMMovtosEmpresas.SQLC.StartTransaction(TD);

              DateSeparator:='.';
              DecimalSeparator:='.';

              // Exclui Movto da Empresa --------------------------------
              MySql:=' Delete From MOVTOS_EMPRESAS'+
                     ' Where Ind_Tipo='+QuotedStr('TE')+
                     ' And CodFilial='+QuotedStr(sCodEmpresa)+
                     ' And DTA_REF>='+QuotedStr(sDtaUltAtualizacao);
              DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

              While Not IBQ_Consulta.Eof do
              Begin
                // Acerta Data da Transferencia ------------------------
                s:=IBQ_Consulta.FieldByName('comp_anomes').AsString;
                i:=pos('/',s);
                sDtaUltAtualizacao:=Copy(s,i+1,length(s));
                If length(sDtaUltAtualizacao)<2 Then
                 sDtaUltAtualizacao:='0'+sDtaUltAtualizacao;
                sDtaUltAtualizacao:='01.'+sDtaUltAtualizacao+'.'+Copy(s,1,4);
                sDtaUltAtualizacao:=f_Troca('/','.',sDtaUltAtualizacao);
                sDtaUltAtualizacao:=f_Troca('-','.',sDtaUltAtualizacao);
                
                MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                       ' CODFILIAL, IND_TIPO, CODPRODUTO,'+
                       ' CODFORNECEDOR, NOMEFORNECEDOR, DTA_REF,'+
                       ' QUANT_REF, PRECO, DTA_ATUALIZACAO)'+
                       ' Values ('+
                       QuotedStr(sCodEmpresa)+', '+
                       QuotedStr('TE')+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('codproduto').AsString)+', '+
                       'Null, '+// QuotedStr(IBQ_Consulta.FieldByName('principalfor').AsString)+
                       'Null, '+ // QuotedStr(IBQ_Consulta.FieldByName('nomefornecedor').AsString)+', '+
                       QuotedStr(sDtaUltAtualizacao)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('Transf').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('Vlr_Total').AsString)+', '+
                       QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                If Not bExec Then
                Begin
                  // Grava Loja em Processamento --------------------------
                  MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                         ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                         ' Values ('+
                         QuotedStr('OK')+', '+
                         QuotedStr('Transf_Entrada_Exec Loja: '+sCodEmpresa)+', '+
                         QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                  DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                  bExec:=True;
                End;

                IBQ_Consulta.Next;
              End; // While Not IBQ_Consulta.Eof do

              DMMovtosEmpresas.SQLC.Commit(TD);

              DateSeparator:='/';
              DecimalSeparator:=',';
            Except
              on e : Exception do
              Begin
                DMMovtosEmpresas.SQLC.Rollback(TD);
                bExcluir:=True;

                DateSeparator:='/';
                DecimalSeparator:=',';

                sgMensagem:='TE-'+sCodEmpresa+': '+e.Message;
                sgMensagem:=copy(sgMensagem,1,200);
                MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
                       ' Values ('+
                       QuotedStr('Er')+', '+
                       QuotedStr(sgMensagem)+', '+
                       QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

              End; // on e : Exception do
            End; // Try
          End; // If bSiga Then // Consulta Transferencias de Entrada

          DateSeparator:='/';
          DecimalSeparator:=',';
        End; // If bProcTransfEnt Then
        // (TE) Busca Transferencias de Entrada =======================

        If HoursBetween(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor), dDtaProc)>0 Then
         ParaProcessamentoLoja;

        // ============================================================
        // (UC) Busca Ultima Compra ===================================
        // ============================================================
        bExec:=False;
        If bProcUltCompra Then
        Begin
          dDtaProc:=DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // Grava Loja em Processamento --------------------------
          MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                 ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                 ' Values ('+
                 QuotedStr('OK')+', '+
                 QuotedStr('Ultima Compra_Inicio Loja: '+sCodEmpresa)+', '+
                 QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
          DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

          DateSeparator:='/';
          DecimalSeparator:=',';

          // Cria Query da Empresa ------------------------------------
          If iCodLojaLinx=0 Then // SIDICOM
          Begin
            CriaQueryIB('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, IBQ_Consulta, False, True);
          End; // If iCodLojaLinx=0 Then // SIDICOM

          DateSeparator:='.';
          DecimalSeparator:='.';

          // (UC) Busca Ultima Compra
          sDtaUltAtualizacao:=DateTimeToStr(PrimeiroUltimoDia(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor)-60,'P'));
          sDtaUltAtualizacao:=f_Troca('/','.',sDtaUltAtualizacao);
          sDtaUltAtualizacao:=f_Troca('-','.',sDtaUltAtualizacao);

          If iCodLojaLinx=0 Then // SIDICOM
          Begin
            MySql:=' select p.codproduto,'+
                   ' m.dataentrada,'+ // DTA_REF
                   ' sum(Coalesce(p.quant,0)) quant,'+ // QUANT_REF
                   ' (sum(Coalesce(p.preco,0))/count(p.codproduto)) preco,'+ // PRECO
                   ' sum(Coalesce(p.valipi,0)) valipi,'+ // DES_SITUACAO ==>> Atenção esta em String
                   ' sum(Coalesce(p.valbruto,0)) valbruto,'+ // VALBRUTO
                   ' sum(Coalesce(p.valdesconto,0)) valdesconto,'+ // VALDESCONTO
                   ' sum(Coalesce(p.valsubstituicao,0)) valsubstituicao,'+ // VALSUBSTITUICAO
                   ' sum(Coalesce(p.valtotal,0)) valtotal'+ // VLR_TOTAL_REF

                   ' From mfor m, mforpro p'+

                   ' where m.chavenf=p.chavenf'+
                   ' and m.codcomprovante in (''010'', ''012'')'+

                   ' and m.dataentrada=(select Max(m1.dataentrada)'+
                   '                    from mfor m1, mforpro p1'+
                   '                    where m1.chavenf=p1.chavenf'+
                   '                    and p1.entradasaida = ''E'''+
                   '                    and m1.dataentrada>='+QuotedStr(sDtaUltAtualizacao)+
                   '                    and m1.codfilial = '+QuotedStr(sCodEmpresa)+
                   '                    and m1.codcomprovante in (''010'', ''012'')'+
                   '                    and p1.codproduto=p.codproduto)'+

                   ' and p.entradasaida = ''E'''+
                   ' and m.dataentrada>='+QuotedStr(sDtaUltAtualizacao)+
                   ' and m.codfilial = '+QuotedStr(sCodEmpresa)+
                   ' group by 1,2'+
                   ' order by 1,2';
            IBQ_Consulta.Close;
            IBQ_Consulta.SQL.Clear;
            IBQ_Consulta.SQL.Add(MySql);

            // Busca Iens da Empresa ----------------------------------
            i:=0;
            bSiga:=False;
            While Not bSiga do
            Begin
              Try
                IBQ_Consulta.Open;
                bSiga:=True;
              Except
                Inc(i);
              End; // Try

              If i>99 Then
                Break;
            End; // While Not bSiga do
          End; // If iCodLojaLinx=0 Then // SIDICOM

          If iCodLojaLinx<>0 Then // LINX
          Begin
            MySql:=' SELECT '+
                   ' pl.cod_auxiliar CODPRODUTO, cast(ml.data_lancamento as date) DATAENTRADA,'+
                   ' ml.quantidade QUANT, ml.valor_liquido PRECO, ml.valor_ipi VALIPI,'+
                   ' (ml.preco_custo * ml.quantidade) VALBRUTO, ml.desconto VALDESCONTO,'+
                   ' ml.valor_icms_st VALSUBSTITUICAO, ml.valor_total VALTOTAL'+

                   ' FROM LINXMOVIMENTO ml, LINXPRODUTOS pl'+
                   ' WHERE ml.cod_produto=pl.cod_produto'+
                   ' AND   pl.cod_auxiliar is not null'+
                   ' AND   ml.empresa='+IntToStr(iCodLojaLinx)+
                   ' AND   ml.operacao=''E'''+
                   ' AND   ((ml.tipo_transacao=''S'') OR (ml.tipo_transacao=''E'') OR (ml.tipo_transacao IS NULL))'+
                   ' AND   ml.cancelado=''N'''+
                   ' AND   ml.excluido=''N'''+
                   ' AND   ml.data_lancamento>='+QuotedStr(sDtaUltAtualizacao)+
                   ' AND   ml.data_lancamento='+
                   '                  (SELECT max(ml1.data_lancamento)'+
                   '                   FROM LINXMOVIMENTO ml1'+
                   '                   WHERE ml1.cod_produto=ml.cod_produto'+
                   '                   AND   ml1.empresa = ml.empresa'+
                   '                   AND   ml1.operacao = ml.operacao'+
                   '                   AND   ((ml1.tipo_transacao=''S'') OR (ml1.tipo_transacao=''E'') OR (ml1.tipo_transacao IS NULL))'+
                   '                   AND   ml1.cancelado=''N'''+
                   '                   AND   ml1.excluido=''N'')';
            DMMovtosEmpresas.CDS_LojaLinx.Close;
            DMMovtosEmpresas.SDS_LojaLinx.CommandText:=MySql;
            DMMovtosEmpresas.CDS_LojaLinx.Open;
            bSiga:=True;
          End; // If iCodLojaLinx<>0 Then // LINX

          // Processamento  -------------------------------------------
          If bSiga Then // Consulta Ultima Compra
          Begin
            Try
              // Monta Transacao  ---------------------------------------
              TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
              TD.IsolationLevel:=xilREADCOMMITTED;
              DMMovtosEmpresas.SQLC.StartTransaction(TD);

              DateSeparator:='.';
              DecimalSeparator:='.';

              If iCodLojaLinx=0 Then // SIDICOM
              Begin
                While Not IBQ_Consulta.Eof do
                Begin
                  // Exclui Movto da Empresa --------------------------------
                  MySql:=' Delete From MOVTOS_EMPRESAS'+
                         ' Where Ind_Tipo='+QuotedStr('UC')+
                         ' And   codproduto='+QuotedStr(IBQ_Consulta.FieldByName('codproduto').AsString)+
                         ' And   CodFilial='+QuotedStr(sCodEmpresa);
                  DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                  MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                         ' CODFILIAL, IND_TIPO, CODPRODUTO, CODFORNECEDOR,'+
                         ' NOMEFORNECEDOR, DTA_REF, QUANT_REF, PRECO, DES_SITUACAO,'+
                         ' VALBRUTO, VALDESCONTO, VALSUBSTITUICAO, VLR_TOTAL_REF,'+
                         ' DTA_ATUALIZACAO)'+
                         ' Values ('+
                         QuotedStr(sCodEmpresa)+', '+ // CODFILIAL
                         QuotedStr('UC')+', '+ // IND_TIPO
                         QuotedStr(IBQ_Consulta.FieldByName('codproduto').AsString)+', '+ // CODPRODUTO
                         'Null, '+ // CODFORNECEDOR
                         'Null, '+ // NOMEFORNECEDOR
                         QuotedStr(IBQ_Consulta.FieldByName('dataentrada').AsString)+', '+ // DTA_REF
                         QuotedStr(IBQ_Consulta.FieldByName('quant').AsString)+', '+ // QUANT_REF
                         QuotedStr(IBQ_Consulta.FieldByName('preco').AsString)+', '+ // PRECO
                         QuotedStr(f_Troca('.',',',IBQ_Consulta.FieldByName('valipi').AsString))+', '+ // DES_SITUACAO
                         QuotedStr(IBQ_Consulta.FieldByName('valbruto').AsString)+', '+ // VALBRUTO
                         QuotedStr(IBQ_Consulta.FieldByName('valdesconto').AsString)+', '+ // VALDESCONTO
                         QuotedStr(IBQ_Consulta.FieldByName('valsubstituicao').AsString)+', '+ // VALSUBSTITUICAO
                         QuotedStr(IBQ_Consulta.FieldByName('valtotal').AsString)+', '+
                         QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                  DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                  If Not bExec Then
                  Begin
                    // Grava Loja em Processamento --------------------------
                    MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                           ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                           ' Values ('+
                           QuotedStr('OK')+', '+
                           QuotedStr('Ultima Compra_Exec Loja: '+sCodEmpresa)+', '+
                           QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                    DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                    bExec:=True;
                  End;

                  IBQ_Consulta.Next;
                End; // While Not IBQ_Consulta.Eof do
                IBQ_Consulta.Close;
              End; // If iCodLojaLinx=0 Then // SIDICOM

              If iCodLojaLinx<>0 Then // LINX
              Begin
                While Not DMMovtosEmpresas.CDS_LojaLinx.Eof do
                Begin
                  // Exclui Movto da Empresa --------------------------------
                  MySql:=' Delete From MOVTOS_EMPRESAS'+
                         ' Where Ind_Tipo='+QuotedStr('UC')+
                         ' And   codproduto='+QuotedStr(DMMovtosEmpresas.CDS_LojaLinx.FieldByName('codproduto').AsString)+
                         ' And   CodFilial='+QuotedStr(sCodEmpresa);
                  DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                  MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                         ' CODFILIAL, IND_TIPO, CODPRODUTO, CODFORNECEDOR,'+
                         ' NOMEFORNECEDOR, DTA_REF, QUANT_REF, PRECO, DES_SITUACAO,'+
                         ' VALBRUTO, VALDESCONTO, VALSUBSTITUICAO, VLR_TOTAL_REF,'+
                         ' DTA_ATUALIZACAO)'+
                         ' Values ('+
                         QuotedStr(sCodEmpresa)+', '+ // CODFILIAL
                         QuotedStr('UC')+', '+ // IND_TIPO
                         QuotedStr(DMMovtosEmpresas.CDS_LojaLinx.FieldByName('codproduto').AsString)+', '+ // CODPRODUTO
                         'Null, '+ // CODFORNECEDOR
                         'Null, '+ // NOMEFORNECEDOR
                         QuotedStr(DMMovtosEmpresas.CDS_LojaLinx.FieldByName('dataentrada').AsString)+', '+ // DTA_REF
                         QuotedStr(DMMovtosEmpresas.CDS_LojaLinx.FieldByName('quant').AsString)+', '+ // QUANT_REF
                         QuotedStr(DMMovtosEmpresas.CDS_LojaLinx.FieldByName('preco').AsString)+', '+ // PRECO
                         QuotedStr(f_Troca('.',',',DMMovtosEmpresas.CDS_LojaLinx.FieldByName('valipi').AsString))+', '+ // DES_SITUACAO
                         QuotedStr(DMMovtosEmpresas.CDS_LojaLinx.FieldByName('valbruto').AsString)+', '+ // VALBRUTO
                         QuotedStr(DMMovtosEmpresas.CDS_LojaLinx.FieldByName('valdesconto').AsString)+', '+ // VALDESCONTO
                         QuotedStr(DMMovtosEmpresas.CDS_LojaLinx.FieldByName('valsubstituicao').AsString)+', '+ // VALSUBSTITUICAO
                         QuotedStr(DMMovtosEmpresas.CDS_LojaLinx.FieldByName('valtotal').AsString)+', '+
                         QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                  DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                  If Not bExec Then
                  Begin
                    // Grava Loja em Processamento --------------------------
                    MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                           ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                           ' Values ('+
                           QuotedStr('OK')+', '+
                           QuotedStr('Ultima Compra_Exec Loja: '+sCodEmpresa)+', '+
                           QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                    DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                    bExec:=True;
                  End;

                  DMMovtosEmpresas.CDS_LojaLinx.Next;
                End; // While Not DMMovtosEmpresas.CDS_LojaLinx.Eof do
                DMMovtosEmpresas.CDS_LojaLinx.Close;
              End; // If iCodLojaLinx<>0 Then // LINX

              DMMovtosEmpresas.SQLC.Commit(TD);

              DateSeparator:='/';
              DecimalSeparator:=',';
            Except
              on e : Exception do
              Begin
                DMMovtosEmpresas.SQLC.Rollback(TD);
                bExcluir:=True;

                DateSeparator:='/';
                DecimalSeparator:=',';

                sgMensagem:='UC-'+sCodEmpresa+': '+e.Message;
                sgMensagem:=copy(sgMensagem,1,200);
                MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
                       ' Values ('+
                       QuotedStr('Er')+', '+
                       QuotedStr(sgMensagem)+', '+
                       QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

              End; // on e : Exception do
            End; // Try
          End; // If bSiga Then // Consulta Ultima Compra

          DateSeparator:='/';
          DecimalSeparator:=',';
        End; // If bProcUltCompra Then
        // (UC) Busca Ultima Compra ===================================

        If HoursBetween(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor), dDtaProc)>0 Then
         ParaProcessamentoLoja;

        // ============================================================
        // (TR) Busca Transito ========================================
        // ============================================================
        bExec:=False;
        If bProcTransito Then
        Begin
          dDtaProc:=DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // Grava Loja em Processamento --------------------------
          MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                 ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                 ' Values ('+
                 QuotedStr('OK')+', '+
                 QuotedStr('Transito_Inicio Loja: '+sCodEmpresa)+', '+
                 QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
          DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

          DateSeparator:='/';
          DecimalSeparator:=',';

          // Cria Query da Empresa ------------------------------------
          CriaQueryIB('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, IBQ_Consulta, False, True);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // (TR) Busca Transito
          sDtaUltAtualizacao:=DateTimeToStr(PrimeiroUltimoDia(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor)-60,'P'));
          sDtaUltAtualizacao:=f_Troca('/','.',sDtaUltAtualizacao);
          sDtaUltAtualizacao:=f_Troca('-','.',sDtaUltAtualizacao);

          MySql:=' select oci.CODPRODUTO, oc.CODOC, oc.DATAPEDIDO, oc.SITUACAO,'+
                 ' case oc.SITUACAO'+
                 '   When 0 Then ''ABERTA'''+
                 '   When 1 Then ''ABERTA - PENDENTE FORNECEDOR'''+
                 '   When 2 Then ''ENTREGUE'''+
                 '   When 3 Then ''CANCELADA'''+
                 ' End DES_SITUACAO,'+
                 ' oc.CODFORNECEDOR,'+
                 ' Coalesce(oci.QUANTIDADE,0) QUANTIDADE,'+
                 ' Coalesce(oci.PRECO,0) PRECO,'+
                 ' Coalesce(oci.VALBRUTO,0) VALBRUTO,'+
                 ' Coalesce(oci.VALDESCONTO,0) VALDESCONTO,'+
                 ' Coalesce(oci.VALSUBSTITUICAO,0) VALSUBSTITUICAO,'+
                 ' Coalesce(oci.TOTALITEM,0) TOTALITEM'+

                 ' from ordem oc, ordemite oci'+

                 ' where oc.codoc = oci.codoc'+

                 ' and oc.situacao < 2'+
                 ' and oc.datapedido>='+QuotedStr(sDtaUltAtualizacao)+

                 ' and oc.codfilial='+QuotedStr(sCodEmpresa);
          IBQ_Consulta.Close;
          IBQ_Consulta.SQL.Clear;
          IBQ_Consulta.SQL.Add(MySql);

          // Busca Iens da Empresa ----------------------------------
          i:=0;
          bSiga:=False;
          While Not bSiga do
          Begin
            Try
              IBQ_Consulta.Open;
              bSiga:=True;
            Except
              Inc(i);
            End; // Try

            If i>99 Then
              Break;
          End; // While Not bSiga do

          // Processamento  -----------------------------------------
          If bSiga Then // Consulta Transito
          Begin
            Try
              // Monta Transacao  ---------------------------------------
              TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
              TD.IsolationLevel:=xilREADCOMMITTED;
              DMMovtosEmpresas.SQLC.StartTransaction(TD);

              DateSeparator:='.';
              DecimalSeparator:='.';

              // Exclui Movto da Empresa --------------------------------
              MySql:=' Delete From MOVTOS_EMPRESAS'+
                     ' Where Ind_Tipo='+QuotedStr('TR')+
                     ' And   Dta_Ref>='+QuotedStr(sDtaUltAtualizacao)+
                     ' And   CodFilial='+QuotedStr(sCodEmpresa);
              DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

              While Not IBQ_Consulta.Eof do
              Begin
                MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                       ' CODFILIAL, IND_TIPO, CODPRODUTO, CODFORNECEDOR,'+
                       ' NOMEFORNECEDOR, DTA_REF, QUANT_REF, PRECO, NUM_REF,'+
                       ' COD_SITUACAO, DES_SITUACAO, VALBRUTO, VALDESCONTO,'+
                       ' VALSUBSTITUICAO, VLR_TOTAL_REF, DTA_ATUALIZACAO)'+
                       ' Values ('+
                       QuotedStr(sCodEmpresa)+', '+
                       QuotedStr('TR')+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('codproduto').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('codfornecedor').AsString)+', '+
                       'Null, '+ // QuotedStr(IBQ_Consulta.FieldByName('nomefornecedor').AsString)+
                       QuotedStr(IBQ_Consulta.FieldByName('datapedido').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('quantidade').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('preco').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('codoc').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('situacao').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('des_situacao').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('valbruto').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('valdesconto').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('valsubstituicao').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('TOTALITEM').AsString)+', '+
                       QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                If Not bExec Then
                Begin
                  // Grava Loja em Processamento --------------------------
                  MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                         ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                         ' Values ('+
                         QuotedStr('OK')+', '+
                         QuotedStr('Transito_Exec Loja: '+sCodEmpresa)+', '+
                         QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                  DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                  bExec:=True;
                End;

                IBQ_Consulta.Next;
              End; // While Not IBQ_Consulta.Eof do

              DMMovtosEmpresas.SQLC.Commit(TD);

              DateSeparator:='/';
              DecimalSeparator:=',';
            Except
              on e : Exception do
              Begin
                DMMovtosEmpresas.SQLC.Rollback(TD);
                bExcluir:=True;

                DateSeparator:='/';
                DecimalSeparator:=',';

                sgMensagem:='TR-'+sCodEmpresa+': '+e.Message;
                sgMensagem:=copy(sgMensagem,1,200);
                MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
                       ' Values ('+
                       QuotedStr('Er')+', '+
                       QuotedStr(sgMensagem)+', '+
                       QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

              End; // on e : Exception do
            End; // Try
          End; // If bSiga Then // Consulta Transito
          
          DateSeparator:='/';
          DecimalSeparator:=',';
        End; // If bProcTransito Then
        // (TR) Busca Transito ========================================

        If HoursBetween(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor), dDtaProc)>0 Then
         ParaProcessamentoLoja;

        // ============================================================
        // (EF) (EV) (EC) (EM) Busca Estoques Final dos Meses =========
        // ============================================================
        bExec:=False;
        If bProcEstFinal Then
        Begin
          dDtaProc:=DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // Grava Loja em Processamento --------------------------
          MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                 ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                 ' Values ('+
                 QuotedStr('OK')+', '+
                 QuotedStr('EstoqueFinal_Inicio Loja: '+sCodEmpresa)+', '+
                 QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
          DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

          DateSeparator:='/';
          DecimalSeparator:=',';

          // Cria Query da Empresa ------------------------------------
          CriaQueryIB('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, IBQ_Consulta, False, True);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // Busca Lista de Precos da Loja =====================================
          MySql:=' SELECT e.cod_listapre'+
                 ' FROM emp_conexoes e'+
                 ' WHERE e.cod_filial='+QuotedStr(sCodEmpresa);
          DMMovtosEmpresas.CDS_Busca.Close;
          DMMovtosEmpresas.SDS_Busca.CommandText:=MySql;
          DMMovtosEmpresas.CDS_Busca.Open;
          sCodListaPreco:=DMMovtosEmpresas.CDS_Busca.FieldByName('cod_listapre').AsString;
          DMMovtosEmpresas.CDS_Busca.Close;

          If Trim(sCodListaPreco)='' Then
          Begin
            MySql:=' SELECT e.cod_listapre'+
                   ' FROM emp_conexoes e'+
                   ' WHERE e.cod_filial=''99''';
            DMMovtosEmpresas.CDS_Busca.Close;
            DMMovtosEmpresas.SDS_Busca.CommandText:=MySql;
            DMMovtosEmpresas.CDS_Busca.Open;
            sCodListaPreco:=DMMovtosEmpresas.CDS_Busca.FieldByName('cod_listapre').AsString;
            DMMovtosEmpresas.CDS_Busca.Close;
          End;

          MySql:=' Select'+
                 ' e.codfilial,'+
                 ' Cast(''01.''||substring(e.codanomes from 5 for 2)||''.''||substring(e.codanomes from 1 for 4) as Date) Dia,'+

                 ' Cast(coalesce(sum(Coalesce(e.saldoatual,0)),0) as numeric(12,2)) Est_Final,'+
                 ' Cast(Coalesce(sum(Coalesce(e.saldoatual*preco.precovenda,0)),0) as Numeric(12,2)) Est_Finan_Venda,'+
                 ' Cast(Coalesce(sum(Coalesce(e.saldoatual*preco.precocompra,0)),0) as Numeric(12,2)) Est_Finan_Compra,'+
                 ' Cast(Coalesce(sum(Coalesce(e.saldoatual*preco.Margem,0)),0) as Numeric(12,2)) Est_Finan_Margem'+

                 ' From estoqmes e, produto p,'+
                 '      (Select lpi.codproduto, lpi.precocompra, lpi.precovenda, lpi.margem'+
                 '       From listapre lpi'+
                 '       Where lpi.codlista='+QuotedStr(sCodListaPreco)+') Preco'+

                 ' where e.codproduto=p.codproduto'+
                 ' and   e.codproduto=preco.codproduto'+
                 ' and   p.principalfor Not In (''000300'', ''000500'', ''000883'', ''010000'', ''001072'')'+
                 ' and   e.codfilial='+QuotedStr(sCodEmpresa)+
                 ' and   e.codanomes='+QuotedStr(sAno+sMes)+
                 ' Group by 1,2'+
                 ' Order by 1';
          IBQ_Consulta.Close;
          IBQ_Consulta.SQL.Clear;
          IBQ_Consulta.SQL.Add(MySql);

          // Busca Iens da Empresa ----------------------------------
          i:=0;
          bSiga:=False;
          While Not bSiga do
          Begin
            Try
              IBQ_Consulta.Open;
              bSiga:=True;
            Except
              Inc(i);
            End; // Try

            If i>99 Then
              Break;
          End; // While Not bSiga do

          // Processamento  -----------------------------------------
          If bSiga Then // Consulta Estoques Final dos Meses
          Begin
            Try
              // Monta Transacao  ---------------------------------------
              TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
              TD.IsolationLevel:=xilREADCOMMITTED;
              DMMovtosEmpresas.SQLC.StartTransaction(TD);

              DateSeparator:='.';
              DecimalSeparator:='.';

              While Not IBQ_Consulta.Eof do
              Begin
                If IBQ_Consulta.FieldByName('Est_Final').AsCurrency<>0 Then
                Begin
                  For i:=1 to 4 do
                  Begin
                    MySql:=' Insert into MOVTOS_EMPRESAS'+
                           ' (CODFILIAL, IND_TIPO, DTA_REF, QUANT_REF, VLR_TOTAL_REF, DTA_ATUALIZACAO)'+
                           ' Values('+
                           QuotedStr(sCodEmpresa)+', ';

                           If i=1 Then
                           Begin
                             sgMensagem:='EF';
                             MySql:=MySql+' ''EF'','+
                                    QuotedStr(f_Troca('/','.',IBQ_Consulta.FieldByName('Dia').AsString))+', '+
                                    QuotedStr(f_Troca(',','.',IBQ_Consulta.FieldByName('Est_Final').AsString))+', null, current_date';
                           End;

                           If i=2 Then
                           Begin
                             sgMensagem:='EV';
                             MySql:=MySql+' ''EV'','+
                                    QuotedStr(f_Troca('/','.',IBQ_Consulta.FieldByName('Dia').AsString))+', null,'+
                                    QuotedStr(f_Troca(',','.',IBQ_Consulta.FieldByName('EST_FINAN_VENDA').AsString))+', current_date';
                           End;

                           If i=3 Then
                           Begin
                             sgMensagem:='EC';
                             MySql:=MySql+' ''EC'','+
                                    QuotedStr(f_Troca('/','.',IBQ_Consulta.FieldByName('Dia').AsString))+', null,'+
                                    QuotedStr(f_Troca(',','.',IBQ_Consulta.FieldByName('EST_FINAN_COMPRA').AsString))+', current_date';               
                           End;
           
                           If i=4 Then
                           Begin
                             sgMensagem:='EM';
                             MySql:=MySql+' ''EM'','+
                                    QuotedStr(f_Troca('/','.',IBQ_Consulta.FieldByName('Dia').AsString))+', null,'+
                                    QuotedStr(f_Troca(',','.',IBQ_Consulta.FieldByName('EST_FINAN_MARGEM').AsString))+', current_date';
                           End;

                           MySql:=MySql+')';
                         
                    DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
                  End; // For i:=1 to 4 do
                End; // If IBQ_Consulta.FieldByName('Est_Final').AsCurrency<>0 Then

                If Not bExec Then
                Begin
                  // Grava Loja em Processamento --------------------------
                  MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                         ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                         ' Values ('+
                         QuotedStr('OK')+', '+
                         QuotedStr('EstoqueFinal_Exec Loja: '+sCodEmpresa)+', '+
                         QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                  DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                  bExec:=True;
                End;

                IBQ_Consulta.Next;
              End; // While Not IBQ_Consulta.Eof do

              DMMovtosEmpresas.SQLC.Commit(TD);

              DateSeparator:='/';
              DecimalSeparator:=',';
            Except
              on e : Exception do
              Begin
                DMMovtosEmpresas.SQLC.Rollback(TD);
                bExcluir:=True;

                DateSeparator:='/';
                DecimalSeparator:=',';

                sgMensagem:=sgMensagem+'-'+sCodEmpresa+': '+e.Message;
                sgMensagem:=copy(sgMensagem,1,200);
                MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
                       ' Values ('+
                       QuotedStr('Er')+', '+
                       QuotedStr(sgMensagem)+', '+
                       QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

              End; // on e : Exception do
            End; // Try
          End; // If bSiga Then // Consulta Estoques Final dos Meses
          
          DateSeparator:='/';
          DecimalSeparator:=',';
        End; // If bProcEstFinal Then
        // (EF) (EV) (EC) (EM) Busca Estoques Final dos Meses =========

        If HoursBetween(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor), dDtaProc)>0 Then
         ParaProcessamentoLoja;

        // ============================================================
        // (AP) Busca Ajustes Estoques, Transf de Avarias e Perdas ====
        // ============================================================
        bExec:=False;
        If bProcAjTrAvPe Then
        Begin
          dDtaProc:=DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // Grava Loja em Processamento --------------------------
          MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                 ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                 ' Values ('+
                 QuotedStr('OK')+', '+
                 QuotedStr('AjusTransfAvaPerda_Inicio Loja: '+sCodEmpresa)+', '+
                 QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
          DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
          
          DateSeparator:='/';
          DecimalSeparator:=',';

          // Cria Query da Empresa ------------------------------------
          CriaQueryIB('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, IBQ_Consulta, False, True);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // (AP) Busca Ajustes Estoques, Transf de Avarias e Perdas
          sDtaUltAtualizacao:=DateTimeToStr(PrimeiroUltimoDia(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor)-60,'P'));
          sDtaUltAtualizacao:=f_Troca('/','.',sDtaUltAtualizacao);
          sDtaUltAtualizacao:=f_Troca('-','.',sDtaUltAtualizacao);

          MySql:=' SELECT nt.datacomprovante,'+
                 ' Coalesce(mp.codproduto,''SEM'') codproduto,'+
                 ' nt.codcomprovante,'+
                 ' Case'+
                 '   When nt.dbcr=''D'' then ''S'''+
                 '   When nt.dbcr=''C'' then ''E'''+
                 ' End Ent_SAI,'+
                 ' SUM(mp.quantatendida) Qtd_Total,'+
                 ' SUM(mp.valbruto) Tot_Valbruto,'+
                 ' SUM(mp.valdescitem) Tot_valdesconto,'+
                 ' SUM(mp.valipi) Tot_valipi,'+
                 ' SUM(mp.valsubstituicao) Tot_valsubstituicao,'+
                 ' SUM(mp.valrepasse) Tot_valrepasse,'+
                 ' SUM(mp.valtotal) Tot_valtotal'+

                 ' FROM mcli nt, mclipro mp'+
                 ' WHERE nt.chavenf=mp.chavenf'+
                 ' AND UPPER(nt.SITUACAONF)=''L'''+
                 ' AND mp.somouestoque=''S'''+
                 ' AND ((nt.codcomprovante IN (''021'',''022'',''023'', ''024'')) OR'+
                 '      (nt.codcomprovante IN (''015'',''017'', ''018'') '+
                 ' AND nt.codcliente=''010050''))'+
                 ' AND nt.datacomprovante>='+QuotedStr(sDtaUltAtualizacao)+
                 ' AND nt.codfilial='+QuotedStr(sCodEmpresa)+
                 ' GROUP BY 1,2,3,4';
          IBQ_Consulta.Close;
          IBQ_Consulta.SQL.Clear;
          IBQ_Consulta.SQL.Add(MySql);

          // Abre Query da no Banco de Dados da Loja -----------------
          i:=0;
          bSiga:=False;
          While Not bSiga do
          Begin
            Try
              IBQ_Consulta.Open;
              bSiga:=True;
            Except
              Inc(i);
            End; // Try

            If i>99 Then
              Break;
          End; // While Not bSiga do

          // Processamento  -------------------------------------------
          If bSiga Then // Consulta Ajustes de Estoques e Transferencias de Avarias e Perdas
          Begin
            Try
              // Monta Transacao  ---------------------------------------
              TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
              TD.IsolationLevel:=xilREADCOMMITTED;
              DMMovtosEmpresas.SQLC.StartTransaction(TD);

              DateSeparator:='.';
              DecimalSeparator:='.';

              // Exclui Movto da Empresa --------------------------------
              MySql:=' Delete From MOVTOS_EMPRESAS'+
                     ' Where Ind_Tipo='+QuotedStr('AP')+
                     ' And CodFilial='+QuotedStr(sCodEmpresa)+
                     ' And DTA_REF>='+QuotedStr(sDtaUltAtualizacao);
              DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

              While Not IBQ_Consulta.Eof do
              Begin
                MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                       ' CODFILIAL, IND_TIPO, CODPRODUTO, CODFORNECEDOR, DTA_REF,'+
                       ' QUANT_REF, PRECO, COD_SITUACAO, DES_SITUACAO, VALBRUTO,'+
                       ' VALDESCONTO, VALSUBSTITUICAO, VLR_TOTAL_REF,'+ 
                       ' DTA_ATUALIZACAO)'+
                       ' Values ('+
                       QuotedStr(sCodEmpresa)+', '+
                       QuotedStr('AP')+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('CodProduto').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('CodComprovante').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('DataComprovante').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('Qtd_Total').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('Tot_ValRepasse').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('Ent_Sai').AsString)+', '+
                       QuotedStr(f_Troca('.',',',IBQ_Consulta.FieldByName('Tot_ValIPI').AsString))+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('Tot_ValBruto').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('Tot_ValDesconto').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('Tot_ValSubstituicao').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('Tot_ValTotal').AsString)+', '+
                       QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                If Not bExec Then
                Begin
                  // Grava Loja em Processamento ------------------------------
                  MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                         ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                         ' Values ('+
                         QuotedStr('OK')+', '+
                         QuotedStr('AjusTransfAvaPerda_Exec Loja: '+sCodEmpresa)+', '+
                         QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                  DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                  bExec:=True;
                End;

                IBQ_Consulta.Next;
              End; // While Not IBQ_Consulta.Eof do

              DMMovtosEmpresas.SQLC.Commit(TD);

              DateSeparator:='/';
              DecimalSeparator:=',';
            Except
              on e : Exception do
              Begin
                DMMovtosEmpresas.SQLC.Rollback(TD);
                bExcluir:=True;

                DateSeparator:='/';
                DecimalSeparator:=',';

                sgMensagem:='AP-'+sCodEmpresa+': '+e.Message;
                sgMensagem:=copy(sgMensagem,1,200);
                MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
                       ' Values ('+
                       QuotedStr('Er')+', '+
                       QuotedStr(sgMensagem)+', '+
                       QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
              End; // on e : Exception do
            End; // Try
          End; // If bSiga Then // Consulta Ajustes de Estoques e Transferencias de Avarias e Perdas

          DateSeparator:='/';
          DecimalSeparator:=',';
        End; // If bProcAjTrAvPe Then
        // (AP) Busca Ajustes Estoques, Transf de Avarias e Perdas

        If HoursBetween(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor), dDtaProc)>0 Then
         ParaProcessamentoLoja;

        // ============================================================
        // (BF) Bonificações ==========================================
        // ============================================================
        bExec:=False;
        If bProcBonifca Then
        Begin
          dDtaProc:=DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // Grava Loja em Processamento --------------------------
          MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                 ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                 ' Values ('+
                 QuotedStr('OK')+', '+
                 QuotedStr('Bonificações_Inicio Loja: '+sCodEmpresa)+', '+
                 QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
          DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

          DateSeparator:='/';
          DecimalSeparator:=',';

          // Cria Query da Empresa ------------------------------------
          CriaQueryIB('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, IBQ_Consulta, False, True);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // (BF) Bonificações
          sDtaUltAtualizacao:=DateTimeToStr(PrimeiroUltimoDia(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor)-60,'P'));
          sDtaUltAtualizacao:=f_Troca('/','.',sDtaUltAtualizacao);
          sDtaUltAtualizacao:=f_Troca('-','.',sDtaUltAtualizacao);
          
          MySql:=' SELECT nt.datacomprovante,'+
                 ' Coalesce(mp.codproduto,''SEM'') codproduto,'+
                 ' nt.codcomprovante,'+
                 ' Case'+
                 '   When nt.dbcr=''D'' then ''S'''+
                 '   When nt.dbcr=''C'' then ''E'''+
                 ' End Ent_SAI,'+
                 ' SUM(mp.quant) Qtd_Total,'+
                 ' SUM(mp.valbruto) Tot_Valbruto,'+
                 ' SUM(mp.valdesconto) Tot_valdesconto,'+
                 ' SUM(mp.valipi) Tot_valipi,'+
                 ' SUM(mp.valsubstituicao) Tot_valsubstituicao,'+
                 ' SUM(mp.valrepasse) Tot_valrepasse,'+
                 ' SUM(mp.valtotal) Tot_valtotal'+

                 ' FROM mfor nt, mforpro mp'+
                 ' WHERE nt.chavenf=mp.chavenf'+
                 ' AND nt.situacaonf=1'+
                 ' AND nt.codcomprovante IN (''913'', ''916'')'+
                 ' AND nt.datacomprovante>='+QuotedStr(sDtaUltAtualizacao)+
                 ' AND nt.codfilial='+QuotedStr(sCodEmpresa)+
                 ' GROUP BY 1,2,3,4';
          IBQ_Consulta.Close;
          IBQ_Consulta.SQL.Clear;
          IBQ_Consulta.SQL.Add(MySql);

          // Abre Query da no Banco de Dados da Loja -----------------
          i:=0;
          bSiga:=False;
          While Not bSiga do
          Begin
            Try
              IBQ_Consulta.Open;
              bSiga:=True;
            Except
              Inc(i);
            End; // Try

            If i>99 Then
              Break;
          End; // While Not bSiga do

          // Processamento  -------------------------------------------
          If bSiga Then // Consulta Bonificações
          Begin
            Try
              // Monta Transacao  ---------------------------------------
              TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
              TD.IsolationLevel:=xilREADCOMMITTED;
              DMMovtosEmpresas.SQLC.StartTransaction(TD);

              DateSeparator:='.';
              DecimalSeparator:='.';

              // Exclui Movto da Empresa --------------------------------
              MySql:=' Delete From MOVTOS_EMPRESAS'+
                     ' Where Ind_Tipo='+QuotedStr('BF')+
                     ' And CodFilial='+QuotedStr(sCodEmpresa)+
                     ' And DTA_REF>='+QuotedStr(sDtaUltAtualizacao);
              DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

              While Not IBQ_Consulta.Eof do
              Begin
                MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                       ' CODFILIAL, IND_TIPO, CODPRODUTO, CODFORNECEDOR, DTA_REF,'+
                       ' QUANT_REF, PRECO, COD_SITUACAO, DES_SITUACAO, VALBRUTO,'+
                       ' VALDESCONTO, VALSUBSTITUICAO, VLR_TOTAL_REF,'+ 
                       ' DTA_ATUALIZACAO)'+
                       ' Values ('+
                       QuotedStr(sCodEmpresa)+', '+
                       QuotedStr('BF')+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('CodProduto').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('CodComprovante').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('DataComprovante').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('Qtd_Total').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('Tot_ValRepasse').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('Ent_Sai').AsString)+', '+
                       QuotedStr(f_Troca('.',',',IBQ_Consulta.FieldByName('Tot_ValIPI').AsString))+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('Tot_ValBruto').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('Tot_ValDesconto').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('Tot_ValSubstituicao').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('Tot_ValTotal').AsString)+', '+
                       QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                If Not bExec Then
                Begin
                  // Grava Loja em Processamento ------------------------------
                  MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                         ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                         ' Values ('+
                         QuotedStr('OK')+', '+
                         QuotedStr('Bonificações_Exec Loja: '+sCodEmpresa)+', '+
                         QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                  DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                  bExec:=True;
                End;

                IBQ_Consulta.Next;
              End; // While Not IBQ_Consulta.Eof do

              DMMovtosEmpresas.SQLC.Commit(TD);

              DateSeparator:='/';
              DecimalSeparator:=',';
            Except
              on e : Exception do
              Begin
                DMMovtosEmpresas.SQLC.Rollback(TD);
                bExcluir:=True;

                DateSeparator:='/';
                DecimalSeparator:=',';

                sgMensagem:='BF-'+sCodEmpresa+': '+e.Message;
                sgMensagem:=copy(sgMensagem,1,200);
                MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
                       ' Values ('+
                       QuotedStr('Er')+', '+
                       QuotedStr(sgMensagem)+', '+
                       QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
              End; // on e : Exception do
            End; // Try
          End; // If bSiga Then // Consulta Bonificações
          
          DateSeparator:='/';
          DecimalSeparator:=',';
        End; // If bProcBonifca Then
        // (BF) Bonificações ==========================================

        If HoursBetween(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor), dDtaProc)>0 Then
         ParaProcessamentoLoja;

        // ============================================================
        // (DF) Desconto Financeiro ===================================
        // ============================================================
        bExec:=False;
        If bProcDescFinan Then
        Begin
          dDtaProc:=DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // Grava Loja em Processamento --------------------------
          MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                 ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                 ' Values ('+
                 QuotedStr('OK')+', '+
                 QuotedStr('DescFinan_Inicio Loja: '+sCodEmpresa)+', '+
                 QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
          DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

          DateSeparator:='/';
          DecimalSeparator:=',';

          // Cria Query da Empresa ------------------------------------
          CriaQueryIB('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, IBQ_Consulta, False, True);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // (DF) Desconto Financeiro
          sDtaUltAtualizacao:=DateTimeToStr(PrimeiroUltimoDia(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor)-60,'P'));
          sDtaUltAtualizacao:=f_Troca('/','.',sDtaUltAtualizacao);
          sDtaUltAtualizacao:=f_Troca('-','.',sDtaUltAtualizacao);

          MySql:=' SELECT dd.datadocumento,'+
                 ' Coalesce(npd.codproduto,''SEM'') codproduto,'+
                 ' dd.codfornecedor,'+
                 ' ''1100'' codcomprovante,'+
                 ' ''E'' Ent_SAI,'+
                 ' SUM(COALESCE(npd.quant,0)) Qtd_Total,'+
                 ' Round(((((CAST(SUM(COALESCE(npd.quant,1)) AS NUMERIC(12,2))*100)/'+
                 '           CAST(SUM(COALESCE(QtdT.Qtd_Total,1)) AS NUMERIC(12,2)))*'+
                 '           CAST(SUM(COALESCE(dd.TOTNOTA,0)) AS NUMERIC(12,2))/100)),2) Tot_Valbruto,'+
                 ' Round(((((CAST(SUM(COALESCE(npd.quant,1)) AS NUMERIC(12,2))*100)/'+
                 '           CAST(SUM(COALESCE(QtdT.Qtd_Total,1)) AS NUMERIC(12,2)))*'+
                 '           CAST(SUM(COALESCE(dd.Desconto,0)) AS NUMERIC(12,2))/100)),2) Tot_valdesconto,'+

                 ' 0.00 Tot_valipi,'+
                 ' 0.00 Tot_valsubstituicao,'+
                 ' 0.00 Tot_valrepasse,'+
                 ' Round(((((CAST(SUM(COALESCE(npd.quant,1)) AS NUMERIC(12,2))*100)/'+
                 '           CAST(SUM(COALESCE(QtdT.Qtd_Total,1)) AS NUMERIC(12,2)))*'+
                 '           CAST(SUM((COALESCE(dd.TOTNOTA,0)-COALESCE(dd.Desconto,0))) AS NUMERIC(12,2))/100)),2) Tot_valtotal'+

                 ' FROM mforpago dd'+
                 '       LEFT JOIN mfor nd      on nd.chavenf=dd.codfilial||dd.codfornecedor||nd.codcomprovante||''UNIC''||dd.numero'+
                 '                             and nd.codfilial=dd.codfilial'+
                 '                             and nd.codcomprovante=dd.codcomprovante'+
                 '       LEFT JOIN mforpro npd  on nd.chavenf=npd.chavenf'+
                 '       LEFT JOIN (SELECT it.chavenf, SUM(it.quant) Qtd_Total'+
                 '                  FROM mforpro it'+
                 '                  GROUP BY 1) QtdT ON QtdT.chavenf=nd.chavenf'+

                 ' WHERE dd.codcomprovante in (''010'', ''912'', ''917'')'+
                 ' AND   dd.desconto<>0'+
                 ' AND   dd.datadocumento>='+QuotedStr(sDtaUltAtualizacao)+
                 ' AND   dd.codfilial='+QuotedStr(sCodEmpresa)+
                 ' GROUP BY 1,2,3'+
                 ' HAVING Round(((((CAST(SUM(COALESCE(npd.quant,1)) AS NUMERIC(12,2))*100)/'+
                 '                  CAST(SUM(COALESCE(QtdT.Qtd_Total,1)) AS NUMERIC(12,2)))*'+
                 '                  CAST(SUM(COALESCE(dd.Desconto,0)) AS NUMERIC(12,2))/100)),2)>0';
          IBQ_Consulta.Close;
          IBQ_Consulta.SQL.Clear;
          IBQ_Consulta.SQL.Add(MySql);

          // Abre Query da no Banco de Dados da Loja -----------------
          i:=0;
          bSiga:=False;
          While Not bSiga do
          Begin
            Try
              IBQ_Consulta.Open;
              bSiga:=True;
            Except
              Inc(i);
            End; // Try

            If i>99 Then
              Break;
          End; // While Not bSiga do

          // Processamento  -------------------------------------------
          If bSiga Then // Consulta Desconto Financeiro
          Begin
            Try
              // Monta Transacao  ---------------------------------------
              TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
              TD.IsolationLevel:=xilREADCOMMITTED;
              DMMovtosEmpresas.SQLC.StartTransaction(TD);

              DateSeparator:='.';
              DecimalSeparator:='.';

              // Exclui Movto da Empresa --------------------------------
              MySql:=' Delete From MOVTOS_EMPRESAS'+
                     ' Where Ind_Tipo='+QuotedStr('DF')+
                     ' And CodFilial='+QuotedStr(sCodEmpresa)+
                     ' And DTA_REF>='+QuotedStr(sDtaUltAtualizacao);
              DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

              While Not IBQ_Consulta.Eof do
              Begin
                If IBQ_Consulta.FieldByName('CodProduto').AsString='017418' Then
                 MySql:=MySql;

                MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                       ' CODFILIAL, IND_TIPO, CODPRODUTO, CODFORNECEDOR,'+
                       ' NOMEFORNECEDOR, DTA_REF, QUANT_REF, PRECO, NUM_REF,'+
                       ' COD_SITUACAO, DES_SITUACAO, VALBRUTO, VALDESCONTO,'+
                       ' VALSUBSTITUICAO, VLR_TOTAL_REF, DTA_ATUALIZACAO)'+
                       ' Values ('+
                       QuotedStr(sCodEmpresa)+', '+
                       QuotedStr('DF')+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('CodProduto').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('CodComprovante').AsString)+', '+
                       QuotedStr('DESCONTO FINANCEIRO')+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('datadocumento').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('Qtd_Total').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('Tot_ValRepasse').AsString)+', ';

                       If Trim(IBQ_Consulta.FieldByName('CodProduto').AsString)='SEM' Then
                        MySql:=MySql+QuotedStr(IBQ_Consulta.FieldByName('CodFornecedor').AsString)+', '
                       Else
                        MySql:=MySql+QuotedStr('0')+', ';

                       MySql:=MySql+QuotedStr(IBQ_Consulta.FieldByName('Ent_Sai').AsString)+', '+
                                    QuotedStr(f_Troca('.',',',IBQ_Consulta.FieldByName('Tot_ValIPI').AsString))+', '+
                                    QuotedStr(IBQ_Consulta.FieldByName('Tot_ValBruto').AsString)+', '+
                                    QuotedStr(IBQ_Consulta.FieldByName('Tot_ValDesconto').AsString)+', '+
                                    QuotedStr(IBQ_Consulta.FieldByName('Tot_ValSubstituicao').AsString)+', '+
                                    QuotedStr(IBQ_Consulta.FieldByName('Tot_ValTotal').AsString)+', '+
                                    QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                If Not bExec Then
                Begin
                  // Grava Loja em Processamento ------------------------------
                  MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                         ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                         ' Values ('+
                         QuotedStr('OK')+', '+
                         QuotedStr('DescFinan_Exec Loja: '+sCodEmpresa)+', '+
                         QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                  DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                  bExec:=True;
                End;

                IBQ_Consulta.Next;
              End; // While Not IBQ_Consulta.Eof do

              DMMovtosEmpresas.SQLC.Commit(TD);

              DateSeparator:='/';
              DecimalSeparator:=',';
            Except
              on e : Exception do
              Begin
                DMMovtosEmpresas.SQLC.Rollback(TD);
                bExcluir:=True;

                DateSeparator:='/';
                DecimalSeparator:=',';

                sgMensagem:='DF-'+sCodEmpresa+': '+e.Message;
                sgMensagem:=copy(sgMensagem,1,200);
                MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
                       ' Values ('+
                       QuotedStr('Er')+', '+
                       QuotedStr(sgMensagem)+', '+
                       QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
              End; // on e : Exception do
            End; // Try
          End; // If bSiga Then // Consulta Desconto Financeiro

          DateSeparator:='/';
          DecimalSeparator:=',';
        End; // If bProcDescFinan Then
        // (DF) Desconto Financeiro ===================================

        If HoursBetween(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor), dDtaProc)>0 Then
         ParaProcessamentoLoja;

        // ============================================================
        // (PS) Pagamento Substituição Tributária =====================
        // ============================================================
        bExec:=False;
        If bProcPagtoST Then
        Begin
          dDtaProc:=DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // Grava Loja em Processamento --------------------------
          MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                 ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                 ' Values ('+
                 QuotedStr('OK')+', '+
                 QuotedStr('PagtoST_Inicio Loja: '+sCodEmpresa)+', '+
                 QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
          DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

          DateSeparator:='/';
          DecimalSeparator:=',';

          // Cria Query da Empresa ------------------------------------
          CriaQueryIB('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, IBQ_Consulta, False, True);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // (PS) Pagamento Substituição Tributária
          sDtaUltAtualizacao:=DateTimeToStr(PrimeiroUltimoDia(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor)-60,'P'));
          sDtaUltAtualizacao:=f_Troca('/','.',sDtaUltAtualizacao);
          sDtaUltAtualizacao:=f_Troca('-','.',sDtaUltAtualizacao);

          MySql:=' SELECT dd.datacomprovante,'+
                 ' Coalesce(npd.codproduto,''SEM'') codproduto,'+
                 ' dd.codfornecedor,'+
                 ' ''1200'' codcomprovante,'+
                 ' ''S'' Ent_SAI,'+
                 ' SUM(COALESCE(npd.quant,0)) Qtd_Total,'+
                 ' Round(((((CAST(SUM(COALESCE(npd.quant,1)) AS NUMERIC(12,2))*100)/'+
                 '           CAST(SUM(COALESCE(QtdT.Qtd_Total,1)) AS NUMERIC(12,2)))*'+
                 '           CAST(SUM(COALESCE(dd.totnota,0)) AS NUMERIC(12,2))/100)),2) Tot_Valbruto,'+
                 ' 0.00 Tot_valdesconto,'+
                 ' 0.00 Tot_valipi,'+
                 ' 0.00 Tot_valsubstituicao,'+
                 ' 0.00 Tot_valrepasse,'+
                 ' Round(((((CAST(SUM(COALESCE(npd.quant,1)) AS NUMERIC(12,2))*100)/'+
                 '           CAST(SUM(COALESCE(QtdT.Qtd_Total,1)) AS NUMERIC(12,2)))*'+
                 '           CAST(SUM(COALESCE(dd.totnota,0)) AS NUMERIC(12,2))/100)),2) Tot_valtotal'+

                 ' FROM mfor dd'+
                 '       LEFT JOIN mfor nd      ON nd.chavenf LIKE dd.codfilial||dd.codfornecedor||''%UNIC''||dd.numero'+
                 '                             AND nd.codcomprovante<>''912'''+
                 '       LEFT JOIN mforpro npd  ON nd.chavenf=npd.chavenf'+
                 '       LEFT JOIN (SELECT it.chavenf, SUM(it.quant) Qtd_Total'+
                 '                  FROM mforpro it'+
                 '                  GROUP BY 1) QtdT ON QtdT.chavenf=nd.chavenf'+


                 ' WHERE dd.codfilial='+QuotedStr(sCodEmpresa)+
                 ' AND dd.datacomprovante>='+QuotedStr(sDtaUltAtualizacao)+
                 ' AND dd.codcomprovante=''912'''+
                 ' AND dd.totnota<>0'+
                 ' GROUP BY 1,2,3'+
                 ' HAVING Round(((((CAST(SUM(COALESCE(npd.quant,1)) AS NUMERIC(12,2))*100)/'+
                 '                  CAST(SUM(COALESCE(QtdT.Qtd_Total,1)) AS NUMERIC(12,2)))*'+
                 '                  CAST(SUM(COALESCE(dd.totnota,0)) AS NUMERIC(12,2))/100)),2)>0'+
                 ' order by 4';
          IBQ_Consulta.Close;
          IBQ_Consulta.SQL.Clear;
          IBQ_Consulta.SQL.Add(MySql);

          // Abre Query da no Banco de Dados da Loja -----------------
          i:=0;
          bSiga:=False;
          While Not bSiga do
          Begin
            Try
              IBQ_Consulta.Open;
              bSiga:=True;
            Except
              Inc(i);
            End; // Try

            If i>99 Then
              Break;
          End; // While Not bSiga do

          // Processamento  -------------------------------------------
          If bSiga Then // Consulta Pagamento Substituição Tributária
          Begin
            Try
              // Monta Transacao  ---------------------------------------
              TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
              TD.IsolationLevel:=xilREADCOMMITTED;
              DMMovtosEmpresas.SQLC.StartTransaction(TD);

              DateSeparator:='.';
              DecimalSeparator:='.';

              // Exclui Movto da Empresa --------------------------------
              MySql:=' Delete From MOVTOS_EMPRESAS'+
                     ' Where Ind_Tipo='+QuotedStr('PS')+
                     ' And CodFilial='+QuotedStr(sCodEmpresa)+
                     ' And DTA_REF>='+QuotedStr(sDtaUltAtualizacao);
              DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

              While Not IBQ_Consulta.Eof do
              Begin
                MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                       ' CODFILIAL, IND_TIPO, CODPRODUTO, CODFORNECEDOR,'+
                       ' NOMEFORNECEDOR, DTA_REF, QUANT_REF, PRECO, NUM_REF,'+
                       ' COD_SITUACAO, DES_SITUACAO, VALBRUTO, VALDESCONTO,'+
                       ' VALSUBSTITUICAO, VLR_TOTAL_REF, DTA_ATUALIZACAO)'+
                       ' Values ('+
                       QuotedStr(sCodEmpresa)+', '+
                       QuotedStr('PS')+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('CodProduto').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('CodComprovante').AsString)+', '+
                       QuotedStr('SUBSTITUIÇÃO TRIBUTÁRIA')+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('DataComprovante').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('Qtd_Total').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('Tot_ValRepasse').AsString)+', ';

                       If Trim(IBQ_Consulta.FieldByName('CodProduto').AsString)='SEM' Then
                        MySql:=MySql+QuotedStr(IBQ_Consulta.FieldByName('CodFornecedor').AsString)+', '
                       Else
                        MySql:=MySql+QuotedStr('0')+', ';

                       MySql:=MySql+QuotedStr(IBQ_Consulta.FieldByName('Ent_Sai').AsString)+', '+
                                    QuotedStr(f_Troca('.',',',IBQ_Consulta.FieldByName('Tot_ValIPI').AsString))+', '+
                                    QuotedStr(IBQ_Consulta.FieldByName('Tot_ValBruto').AsString)+', '+
                                    QuotedStr(IBQ_Consulta.FieldByName('Tot_ValDesconto').AsString)+', '+
                                    QuotedStr(IBQ_Consulta.FieldByName('Tot_ValSubstituicao').AsString)+', '+
                                    QuotedStr(IBQ_Consulta.FieldByName('Tot_ValTotal').AsString)+', '+
                                    QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                If Not bExec Then
                Begin
                  // Grava Loja em Processamento ------------------------------
                  MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                         ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                         ' Values ('+
                         QuotedStr('OK')+', '+
                         QuotedStr('PagtoST_Exec Loja: '+sCodEmpresa)+', '+
                         QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                  DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                  bExec:=True;
                End;

                IBQ_Consulta.Next;
              End; // While Not IBQ_Consulta.Eof do

              DMMovtosEmpresas.SQLC.Commit(TD);

              DateSeparator:='/';
              DecimalSeparator:=',';
            Except
              on e : Exception do
              Begin
                DMMovtosEmpresas.SQLC.Rollback(TD);
                bExcluir:=True;

                DateSeparator:='/';
                DecimalSeparator:=',';

                sgMensagem:='PS-'+sCodEmpresa+': '+e.Message;
                sgMensagem:=copy(sgMensagem,1,200);
                MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
                       ' Values ('+
                       QuotedStr('Er')+', '+
                       QuotedStr(sgMensagem)+', '+
                       QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
              End; // on e : Exception do
            End; // Try
          End; // If bSiga Then // Consulta Pagamento Substituição Tributária

          DateSeparator:='/';
          DecimalSeparator:=',';
        End; // If bProcPagtoST Then
        // (PS) Pagamento Substituição Tributária =====================

        If HoursBetween(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor), dDtaProc)>0 Then
         ParaProcessamentoLoja;

        // ============================================================
        // (VC) Valor Contabil ========================================
        // ============================================================
        bExec:=False;
        If bProcVlrContab Then
        Begin
          dDtaProc:=DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // Grava Loja em Processamento --------------------------
          MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                 ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                 ' Values ('+
                 QuotedStr('OK')+', '+
                 QuotedStr('VlrContabil_Inicio Loja: '+sCodEmpresa)+', '+
                 QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
          DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

          DateSeparator:='/';
          DecimalSeparator:=',';

          // Cria Query da Empresa ------------------------------------
          CriaQueryIB('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, IBQ_Consulta, False, True);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // (VC) Valor Contabil
          sDtaUltAtualizacao:=DateTimeToStr(PrimeiroUltimoDia(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor)-60,'P'));
          sDtaUltAtualizacao:=f_Troca('/','.',sDtaUltAtualizacao);
          sDtaUltAtualizacao:=f_Troca('-','.',sDtaUltAtualizacao);

          MySql:=' SELECT dd.datacomprovante,'+
                 ' Coalesce(npd.codproduto,''SEM'') codproduto,'+
                 ' dd.codfornecedor,'+
                 ' ''1300'' codcomprovante,'+
                 ' ''E'' Ent_SAI,'+
                 ' SUM(COALESCE(npd.quant,0)) Qtd_Total,'+
                 ' Round(((((CAST(SUM(COALESCE(npd.quant,1)) AS NUMERIC(12,2))*100)/'+
                 '           CAST(SUM(COALESCE(QtdT.Qtd_Total,1)) AS NUMERIC(12,2)))*'+
                 '           CAST(SUM(COALESCE(dd.totnota,0)) AS NUMERIC(12,2))/100)),2) Tot_Valbruto,'+
                 ' 0.00 Tot_valdesconto,'+
                 ' 0.00 Tot_valipi,'+
                 ' 0.00 Tot_valsubstituicao,'+
                 ' 0.00 Tot_valrepasse,'+
                 ' Round(((((CAST(SUM(COALESCE(npd.quant,1)) AS NUMERIC(12,2))*100)/'+
                 '           CAST(SUM(COALESCE(QtdT.Qtd_Total,1)) AS NUMERIC(12,2)))*'+
                 '           CAST(SUM(COALESCE(dd.totnota,0)) AS NUMERIC(12,2))/100)),2) Tot_valtotal'+

                 ' FROM mfor dd'+
                 '       LEFT JOIN mfor nd      ON nd.chavenf LIKE dd.codfilial||dd.codfornecedor||''%UNIC''||dd.numero'+
                 '                             AND nd.codcomprovante<>''917'''+
                 '       LEFT JOIN mforpro npd  ON nd.chavenf=npd.chavenf'+
                 '       LEFT JOIN (SELECT it.chavenf, SUM(it.quant) Qtd_Total'+
                 '                  FROM mforpro it'+
                 '                  GROUP BY 1) QtdT ON QtdT.chavenf=nd.chavenf'+

                 ' WHERE dd.codfilial='+QuotedStr(sCodEmpresa)+
                 ' AND dd.datacomprovante>='+QuotedStr(sDtaUltAtualizacao)+
                 ' AND dd.codcomprovante=''917'''+
                 ' AND dd.totnota<>0'+
                 ' GROUP BY 1,2,3'+
                 ' HAVING Round(((((CAST(SUM(COALESCE(npd.quant,1)) AS NUMERIC(12,2))*100)/'+
                 '                  CAST(SUM(COALESCE(QtdT.Qtd_Total,1)) AS NUMERIC(12,2)))*'+
                 '                  CAST(SUM(COALESCE(dd.totnota,0)) AS NUMERIC(12,2))/100)),2)>0';
          IBQ_Consulta.Close;
          IBQ_Consulta.SQL.Clear;
          IBQ_Consulta.SQL.Add(MySql);

          // Abre Query da no Banco de Dados da Loja -----------------
          i:=0;
          bSiga:=False;
          While Not bSiga do
          Begin
            Try
              IBQ_Consulta.Open;
              bSiga:=True;
            Except
              Inc(i);
            End; // Try

            If i>99 Then
              Break;
          End; // While Not bSiga do

          // Processamento  -------------------------------------------
          If bSiga Then // Consulta Valor Contabil
          Begin
            Try
              // Monta Transacao  ---------------------------------------
              TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
              TD.IsolationLevel:=xilREADCOMMITTED;
              DMMovtosEmpresas.SQLC.StartTransaction(TD);

              DateSeparator:='.';
              DecimalSeparator:='.';

              // Exclui Movto da Empresa --------------------------------
              MySql:=' Delete From MOVTOS_EMPRESAS'+
                     ' Where Ind_Tipo='+QuotedStr('VC')+
                     ' And CodFilial='+QuotedStr(sCodEmpresa)+
                     ' And DTA_REF>='+QuotedStr(sDtaUltAtualizacao);
              DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

              While Not IBQ_Consulta.Eof do
              Begin
                MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                       ' CODFILIAL, IND_TIPO, CODPRODUTO, CODFORNECEDOR,'+
                       ' NOMEFORNECEDOR, DTA_REF, QUANT_REF, PRECO, NUM_REF,'+
                       ' COD_SITUACAO, DES_SITUACAO, VALBRUTO, VALDESCONTO,'+
                       ' VALSUBSTITUICAO, VLR_TOTAL_REF, DTA_ATUALIZACAO)'+
                       ' Values ('+
                       QuotedStr(sCodEmpresa)+', '+
                       QuotedStr('VC')+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('CodProduto').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('CodComprovante').AsString)+', '+
                       QuotedStr('VALOR CONTABIL')+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('DataComprovante').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('Qtd_Total').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('Tot_ValRepasse').AsString)+', ';

                       If Trim(IBQ_Consulta.FieldByName('CodProduto').AsString)='SEM' Then
                        MySql:=MySql+QuotedStr(IBQ_Consulta.FieldByName('CodFornecedor').AsString)+', '
                       Else
                        MySql:=MySql+QuotedStr('0')+', ';

                       MySql:=MySql+QuotedStr(IBQ_Consulta.FieldByName('Ent_Sai').AsString)+', '+
                                    QuotedStr(f_Troca('.',',',IBQ_Consulta.FieldByName('Tot_ValIPI').AsString))+', '+
                                    QuotedStr(IBQ_Consulta.FieldByName('Tot_ValBruto').AsString)+', '+
                                    QuotedStr(IBQ_Consulta.FieldByName('Tot_ValDesconto').AsString)+', '+
                                    QuotedStr(IBQ_Consulta.FieldByName('Tot_ValSubstituicao').AsString)+', '+
                                    QuotedStr(IBQ_Consulta.FieldByName('Tot_ValTotal').AsString)+', '+
                                    QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                If Not bExec Then
                Begin
                  // Grava Loja em Processamento ------------------------------
                  MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                         ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                         ' Values ('+
                         QuotedStr('OK')+', '+
                         QuotedStr('VlrContabil_Exec Loja: '+sCodEmpresa)+', '+
                         QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                  DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                  bExec:=True;
                End;

                IBQ_Consulta.Next;
              End; // While Not IBQ_Consulta.Eof do

              DMMovtosEmpresas.SQLC.Commit(TD);

              DateSeparator:='/';
              DecimalSeparator:=',';
            Except
              on e : Exception do
              Begin
                DMMovtosEmpresas.SQLC.Rollback(TD);
                bExcluir:=True;

                DateSeparator:='/';
                DecimalSeparator:=',';

                sgMensagem:='VC-'+sCodEmpresa+': '+e.Message;
                sgMensagem:=copy(sgMensagem,1,200);
                MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
                       ' Values ('+
                       QuotedStr('Er')+', '+
                       QuotedStr(sgMensagem)+', '+
                       QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
              End; // on e : Exception do
            End; // Try
          End; // If bSiga Then // Consulta Valor Contabil
          
          DateSeparator:='/';
          DecimalSeparator:=',';
        End; // If bProcVlrContab Then
        // (VC) Valor Contabil ========================================

        If HoursBetween(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor), dDtaProc)>0 Then
         ParaProcessamentoLoja;

        // ============================================================
        // Movto Final de Mes dos Produtos ============================
        // ============================================================
        bExec:=False;
        If bProcSaldoProd Then
        Begin
          dDtaProc:=DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // Grava Loja em Processamento --------------------------
          MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                 ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                 ' Values ('+
                 QuotedStr('OK')+', '+
                 QuotedStr('SaldoProdMes_Inicio Loja: '+sCodEmpresa)+', '+
                 QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
          DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

          DateSeparator:='/';
          DecimalSeparator:=',';

          // Cria Query da Empresa ------------------------------------
          CriaQueryIB('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, IBQ_Consulta, False, True);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // Movto Final de Mes dos Produtos
          sDtaUltAtualizacao:=DateTimeToStr(PrimeiroUltimoDia(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor)-60,'P'));
          sDtaUltAtualizacao:=f_Troca('/','.',sDtaUltAtualizacao);
          sDtaUltAtualizacao:=f_Troca('-','.',sDtaUltAtualizacao);

          sDta:=Copy(sDtaUltAtualizacao,7,4)+Copy(sDtaUltAtualizacao,4,2);

          MySql:=' SELECT ''01.''||SUBSTRING(es.codanomes FROM 5 FOR 2)||''.''||SUBSTRING(es.codanomes FROM 1 FOR 4) Dta_Mes,'+
                 ' es.codfilial, es.codproduto,'+
                 ' COALESCE(es.saldoatual,0) saldoatual,'+
                 ' CURRENT_TIMESTAMP Dta_Atualizacao'+

                 ' FROM estoqmes es'+
                 ' WHERE es.codfilial='+QuotedStr(sCodEmpresa)+
                 ' AND es.codanomes>='+QuotedStr(sDta);
          IBQ_Consulta.Close;
          IBQ_Consulta.SQL.Clear;
          IBQ_Consulta.SQL.Add(MySql);

          // Abre Query da no Banco de Dados da Loja -----------------
          i:=0;
          bSiga:=False;
          While Not bSiga do
          Begin
            Try
              IBQ_Consulta.Open;
              bSiga:=True;
            Except
              Inc(i);
            End; // Try

            If i>99 Then
              Break;
          End; // While Not bSiga do

          // Processamento  -------------------------------------------
          If bSiga Then // Consulta Movtos de Produtos Mes
          Begin
            Try
              // Monta Transacao  ---------------------------------------
              TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
              TD.IsolationLevel:=xilREADCOMMITTED;
              DMMovtosEmpresas.SQLC.StartTransaction(TD);

              DateSeparator:='.';
              DecimalSeparator:='.';

              // Exclui Movto da Empresa --------------------------------
              MySql:=' DELETE FROM PROD_SALDO_MES sm'+
                     ' WHERE sm.codfilial='+QuotedStr(sCodEmpresa)+
                     ' AND   sm.dta_mes>='+QuotedStr(sDtaUltAtualizacao);
              DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

              While Not IBQ_Consulta.Eof do
              Begin
                MySql:=' Insert Into PROD_SALDO_MES ('+
                       ' DTA_MES, CODFILIAL, CODPRODUTO, SALDOATUAL, DTA_ATUALIZACAO)'+
                       ' Values ('+
                       QuotedStr(IBQ_Consulta.FieldByName('DTA_MES').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('CODFILIAL').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('CODPRODUTO').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('SALDOATUAL').AsString)+', '+
                       QuotedStr(IBQ_Consulta.FieldByName('DTA_ATUALIZACAO').AsString)+')';
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                If Not bExec Then
                Begin
                  // Grava Loja em Processamento ------------------------------
                  MySql:=' Insert Into MOVTOS_EMPRESAS ('+
                         ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                         ' Values ('+
                         QuotedStr('OK')+', '+
                         QuotedStr('SaldoProdMes_Exec Loja: '+sCodEmpresa)+', '+
                         QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                  DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

                  bExec:=True;
                End;

                IBQ_Consulta.Next;
              End; // While Not IBQ_Consulta.Eof do

              DMMovtosEmpresas.SQLC.Commit(TD);

              DateSeparator:='/';
              DecimalSeparator:=',';
            Except
              on e : Exception do
              Begin
                DMMovtosEmpresas.SQLC.Rollback(TD);
                bExcluir:=True;

                DateSeparator:='/';
                DecimalSeparator:=',';

                sgMensagem:='SaldoProdMes-'+sCodEmpresa+': '+e.Message;
                sgMensagem:=copy(sgMensagem,1,200);
                MySql:=' INSERT INTO movtos_empresas (ind_tipo, nomefornecedor, dta_atualizacao)'+
                       ' Values ('+
                       QuotedStr('Er')+', '+
                       QuotedStr(sgMensagem)+', '+
                       QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
                DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
              End; // on e : Exception do
            End; // Try
          End; // If bSiga Then // Consulta Valor Contabil

          DateSeparator:='/';
          DecimalSeparator:=',';
        End; // If bProcSaldoProd Then
        // Movto Final de Mes dos Produtos ============================

        If HoursBetween(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor), dDtaProc)>0 Then
         ParaProcessamentoLoja;

        // Exclui Loja Processada ==============================================
        If Not bExcluir Then
        Begin
          for i:=0 to Lbx_EmpresasProcessar.Items.Count-1 do
          Begin
            If Lbx_EmpresasProcessar.Items[i]=sCodEmpresa Then
            Begin
              Lbx_EmpresasProcessar.Items.Delete(i);
              Break;
            End; // If Lbx_EmpresasProcessar.Items[i]=sCodEmpresa Then
          End; // for i:=0 to Lbx_EmpresasProcessar.Items.Count-1 do
        End; // If Not bExcluir Then

        // Grava Final do Processamento da Loja ====================================
        MySql:=' Insert Into MOVTOS_EMPRESAS ('+
               ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
               ' Values ('+
               QuotedStr('PR')+', '+
               QuotedStr('Final PROC Loja: '+sCodEmpresa)+', '+
               QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))))+')';
        DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);
      End; // If bSiga Then // Conexão OK
      // =======================================================================
      // =======================================================================
      // VERIFICA SE CONTINUA O PROCESSAMENTO - FIM ============================
      // =======================================================================
      // =======================================================================

      // Fecha Conexão =========================================================
      ConexaoEmpIndividual('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, 'F');
    End; // If bSiga Then // Se já faz mais de 5 horas a Ultima Atualização da Empresa

    If iNumTentativas>5 Then // Era >9
    Begin
      Lbx_EmpresasProcessar.Items.Clear;
      Break;
    End; // If iNumTentativas>9 Then

    // Encerra se Chegou as 08 horas da Manhã ==================================
    If StrToInt(copy(TimeToStr(Now),1,2))=8 Then
    Begin
      Lbx_EmpresasProcessar.Items.Clear;
      Break;
    End;

    DMMovtosEmpresas.CDS_EmpProcessa.Next;
  End; // While Not DMMovtosEmpresas.CDS_EmpProcessa.Eof do

// Retirei Não Roda mais de uma vez ===================
//  If Lbx_EmpresasProcessar.Items.Count>0 Then
//  Begin
//    Bt_AtualizarClick(Self);
//    Exit;
//  End;
// Retirei Não Roda mais de uma vez ===================

  // Verifica Processamento ====================================================
  VerificaProcessamento;

  Application.Terminate;
  Exit;

// =============================================================================
// FIM DO PROCESSO =============================================================
// =============================================================================
end; // Busca Movtos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


procedure TFrmMovtosEmpresas.FormShow(Sender: TObject);
Var
  MySql: String;
begin

//  // Não Roda no Sábado e Domimgo ==============================================
//  If (DiaSemanaAbrev(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))='Sab') Or
//     (DiaSemanaAbrev(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))='Dom') Then
  // Não Roda no Sábado para Domimgo ===========================================
  If (DiaSemanaAbrev(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor))='Sab') Then
  Begin
    Application.Terminate;
    Exit;
  End; // Não Roda no Sábado e Domimgo

  // Guarda Data do Servidor ===================================================
  sgDtaServidor:=DateTimeToStr(DataHoraServidorFI(DMMovtosEmpresas.SDS_DtaHoraServidor));

  // Verifica se Pode Atualizar ================================================
  MySql:=' select m.ind_tipo , cast(m.dta_atualizacao as Date) dta_atualizacao'+
         ' from movtos_empresas m'+
         ' where m.ind_tipo='+QuotedStr('OK');
  DMMovtosEmpresas.CDS_Busca.Close;
  DMMovtosEmpresas.SDS_Busca.CommandText:=MySql;
  DMMovtosEmpresas.CDS_Busca.Open;

  If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('ind_tipo').AsString)<>'' Then
   Begin
     If StrToDate(DMMovtosEmpresas.CDS_Busca.FieldByName('dta_atualizacao').AsString)<>StrToDate(Copy(sgDtaServidor,1,10)) Then
      Begin
        MySql:=' Delete from movtos_empresas m'+
               ' where m.ind_tipo='+QuotedStr('OK');
        DMMovtosEmpresas.SQLC.Execute(MySql, nil, nil);
      End
     Else
      Begin
        Application.Terminate;
        Exit;
      End; //
   End; // If Trim(DMMovtosEmpresas.CDS_Busca.FieldByName('ind_tipo').AsString)<>'' Then
  DMMovtosEmpresas.CDS_Busca.Close;

  bgJaProcessouUmaVez:=False;
  If bExecutaDireto Then
   Bt_AtualizarClick(Self);

end;

procedure TFrmMovtosEmpresas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  VerificaProcessamento;

  Try
    Application.Terminate;
    Exit;
  Except
  End;
end;

procedure TFrmMovtosEmpresas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  VerificaProcessamento;

  Try
    Application.Terminate;
    Exit;
  Except
  End;

end;

procedure TFrmMovtosEmpresas.Bt_EstoquesClick(Sender: TObject);
var
  bSiga: Boolean;

  MySql,
  sCodEmpresa, sHora,
  sgDML, sgValues: String;

  i: Integer;
begin
  If Not DMMovtosEmpresas.CDS_EmpProcessa.Active Then
   DMMovtosEmpresas.CDS_EmpProcessa.Open;

  // Inicia Processamento ======================================================
  DMMovtosEmpresas.CDS_EmpProcessa.First;
  While Not DMMovtosEmpresas.CDS_EmpProcessa.Eof do
  Begin
    sCodEmpresa:=DMMovtosEmpresas.CDS_EmpProcessaCOD_FILIAL.AsString;

    sHora:=TimeToStr(Time);

    // Conecta Empresa =======================================================
    Try
      If ConexaoEmpIndividual('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, 'A') Then
       Begin
         bSiga:=True;
       End
      Else
       Begin
         bSiga:=False;
       End; // If ConexaoEmpIndividual(DMVirtual.CDS_V_EmpConexoesDATABASE.AsString, DMVirtual.CDS_V_EmpConexoesTRANSACAO.AsString, 'A') Then
    Except
      bSiga:=False;
    End;

    If bSiga Then // Conexão
    Begin
      // ============================================================
      // Busca ESTOQUE ==============================================
      // ============================================================
      DateSeparator:='.';
      DecimalSeparator:='.';

      // Cria Query da Empresa ------------------------------------
      CriaQueryIB('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, IBQ_Consulta, False, True);

      If DMMovtosEmpresas.IBQ_EstoqueLoja.Active Then
       DMMovtosEmpresas.IBQ_EstoqueLoja.Close;

      DMMovtosEmpresas.IBQ_EstoqueLoja.Database:=IBQ_Consulta.Database;
      DMMovtosEmpresas.IBQ_EstoqueLoja.Transaction:=IBQ_Consulta.Transaction;

      MySql:=' SELECT'+
             ' e.codfilial, e.codproduto, e.saldoatual, e.pedidopendente,'+
             ' e.zonaendereco, e.corredor, e.prateleira, e.gaveta,'+
             ' e.cusmedvalor, e.customedio, e.lastprecocompra, e.lastcustomedio,'+
             ' e.estoqueideal, e.estoquemaximo,'+
             ' e.dataalteracadastro, e.dataalteraestoque, e.dataalteraestoque_ped,'+
             ' coalesce(p.principalfor,''000000'') principalfor,'+
             ' current_date DTA_ATUALIZACAO, '+QuotedStr(sHora)+' HRA_ATUALIZACAO'+
             ' FROM ESTOQUE e'+
             '      LEFT JOIN PRODUTO p on e.codproduto=p.codproduto'+
             ' WHERE e.codfilial='+QuotedStr(sCodEmpresa);
      DMMovtosEmpresas.IBQ_EstoqueLoja.Close;
      DMMovtosEmpresas.IBQ_EstoqueLoja.SQL.Clear;
      DMMovtosEmpresas.IBQ_EstoqueLoja.SQL.Add(MySql);

      // Abre Query da no Banco de Dados da Loja -----------------
      i:=0;
      bSiga:=False;
      While Not bSiga do
      Begin
        Try
          DMMovtosEmpresas.IBQ_EstoqueLoja.Open;
          bSiga:=True;
        Except
          Inc(i);
        End; // Try

        If i>2 Then
         Break;
      End; // While Not bSiga do

      // Processamento  -------------------------------------------
      If bSiga Then // Consulta Transferencias de Entrada
      Begin
        Try
          // Monta Transacao  ---------------------------------------
          TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
          TD.IsolationLevel:=xilREADCOMMITTED;
          DMMovtosEmpresas.SQLC.StartTransaction(TD);

          DateSeparator:='.';
          DecimalSeparator:='.';

          // Atualiza Estoques da Loja --------------------------------
          sgDML:=' UPDATE OR INSERT INTO ESTOQUE ('+
                 ' CODFILIAL, CODPRODUTO, SALDOATUAL, PEDIDOPENDENTE,'+
                 ' ZONAENDERECO, CORREDOR, PRATELEIRA, GAVETA,'+
                 ' CUSMEDVALOR, CUSTOMEDIO, LASTPRECOCOMPRA, LASTCUSTOMEDIO,'+
                 ' ESTOQUEIDEAL, ESTOQUEMAXIMO,'+
                 ' DATAALTERACADASTRO, DATAALTERAESTOQUE, DATAALTERAESTOQUE_PED,'+
                 ' PRINCIPALFOR,'+
                 ' DTA_ATUALIZACAO, HRA_ATUALIZACAO)'+

                 ' VALUES (';

          While Not DMMovtosEmpresas.IBQ_EstoqueLoja.Eof do
          Begin
            sgValues:='';
            For i:=0 to DMMovtosEmpresas.IBQ_EstoqueLoja.FieldCount-1 do
            Begin
              // ULTIMO CAMPO - HRA_ATUALIZACAO ==================================
              If Trim(DMMovtosEmpresas.IBQ_EstoqueLoja.Fields[i].FieldName)='HRA_ATUALIZACAO' Then
              Begin
                sgValues:=sgValues+QuotedStr(DMMovtosEmpresas.IBQ_EstoqueLoja.Fields[i].AsString)+')';
              End // If Trim(DMMovtosEmpresas.IBQ_EstoqueLoja.Fields[i].FieldName)='HRA_ATUALIZACAO' Then

              // Grava Resto do Registro =========================================
              Else
               Begin
                 If Trim(DMMovtosEmpresas.IBQ_EstoqueLoja.Fields[i].AsString)<>'' Then
                  sgValues:=sgValues+QuotedStr(DMMovtosEmpresas.IBQ_EstoqueLoja.Fields[i].AsString)+', '
                 Else
                  sgValues:=sgValues+'NULL, ';
               End;
            End; // For i:=0 to DMMovtosEmpresas.IBQ_EstoqueLoja.FieldCount-1 do

            // UPDATE OR INSERT INTO MCLI ========================================
            MySql:=sgDML+sgValues+' MATCHING (CODFILIAL, CODPRODUTO)';
            DMMovtosEmpresas.SQLC.Execute(MySql,nil,nil);

            DMMovtosEmpresas.IBQ_EstoqueLoja.Next;
          End; // While Not DMMovtosEmpresas.IBQ_EstoqueLoja.Eof do
          DMMovtosEmpresas.IBQ_EstoqueLoja.Close;

          DMMovtosEmpresas.SQLC.Commit(TD);

          DateSeparator:='/';
          DecimalSeparator:=',';
        Except
          on e : Exception do
          Begin
            DMMovtosEmpresas.SQLC.Rollback(TD);
            DMMovtosEmpresas.IBQ_EstoqueLoja.Close;

            DateSeparator:='/';
            DecimalSeparator:=',';

          End; // on e : Exception do
        End; // Try
      End; // If bSiga Then // Consulta Transferencias de Entrada

      DateSeparator:='/';
      DecimalSeparator:=',';
      // ============================================================
      // Busca ESTOQUE ==============================================
      // ============================================================

      // Fecha Conexão =========================================================
      ConexaoEmpIndividual('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, 'F');
    End; // If bSiga Then // Conexão

    DMMovtosEmpresas.CDS_EmpProcessa.Next;
  End; // While Not DMMovtosEmpresas.CDS_EmpProcessa.Eof do
  DMMovtosEmpresas.CDS_EmpProcessa.Close;

// =============================================================================
// FIM DO PROCESSO =============================================================
// =============================================================================
end;

end.




