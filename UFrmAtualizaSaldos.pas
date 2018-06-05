unit UFrmAtualizaSaldos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvXPCore, JvXPButtons, DBXpress;

type
  TFrmAtualizaSaldos = class(TForm)
    Bt_Atualizar: TJvXPButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Bt_AtualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAtualizaSaldos: TFrmAtualizaSaldos;


  sgDia,
  sgLojas: String;

  // Cria Ponteiro de Transacão
  TD: TTransactionDesc;

implementation

uses UDMAtualizaSaldos, DK_Procs1, DB;

{$R *.dfm}

procedure TFrmAtualizaSaldos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
  Exit;

end;

procedure TFrmAtualizaSaldos.FormCreate(Sender: TObject);
begin
  Bt_AtualizarClick(Self);

end;

procedure TFrmAtualizaSaldos.Bt_AtualizarClick(Sender: TObject);
Var
  MySql, MySqlErro: String;

  hHrInicio, hHrFim,
  hHrIniSql1, hHrFimSql1,
  hHrIniSql2, hHrFimSql2,
  hHrIniSql3, hHrFimSql3,
  hHrIniSql4, hHrFimSql4,
  hHrIniSql5, hHrFimSql5,
  sFimSql1, sFimSql2, sFimSql3, sFimSql4, sFimSql5: String;
begin
  hHrInicio:='';
  hHrFim:='';
  hHrInicio:=TimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor));

  // Dia Anterior para Processar as Lojas ======================================
  sgDia:=DateToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor)-1);

  // Processa Saldos do Dia ====================================================
  If DMAtualizaSaldos.SQLC.InTransaction Then
   DMAtualizaSaldos.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMAtualizaSaldos.SQLC.StartTransaction(TD);
  Try // Try da Transação
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Exclui Saldo do Dia a Processar =========================================
    hHrIniSql1:=TimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor));

    MySql:=' DELETE FROM LINX_PRODUTOS_LOJAS lp'+
           ' WHERE lp.dta_processa='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDia)));
    DMAtualizaSaldos.SQLC.Execute(MySql,nil,nil);

    hHrFimSql1:=TimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor));
    sFimSql1:=TimeToStr(StrToTime(hHrFimSql1)-StrToTime(hHrIniSql1));

    // Inclui Produtos das Lojas a Processar ===================================
    hHrIniSql2:=TimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor));

    // Somentes Lojas que Tiveram Produtos Vendidos (LINX) no Dia ==============
    // CD - Se Houve Transferencias de Saída ===================================
    MySql:=' INSERT INTO LINX_PRODUTOS_LOJAS'+
           ' (dta_processa, cod_loja_sidicom, cod_loja_linx, codproduto, cod_produto, qtd_estoque, ind_curva)'+
           ' SELECT DISTINCT '+
           QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDia)))+' DTA_PROCESSA,'+
           ' m.cod_loja COD_LOJA_SIDICOM,'+
           ' m.empresa COD_LOJA_LINX,'+
           ' p.cod_auxiliar CODPRODUTO,'+
           ' m.cod_produto COD_PRODUTO,'+
           ' 0 QTD_ESTOQUE,'+
           ' ''E'' IND_CURVA'+

           ' FROM LINXMOVIMENTO m, LINXPRODUTOS p'+
           ' WHERE m.cod_produto=p.cod_produto'+
           ' AND  ((m.operacao=''S'' AND  m.tipo_transacao=''V'')'+ // Saídas Vendas (Todas as Lojas)
           '       Or'+
           '       (m.operacao=''S'' AND  m.tipo_transacao=''T'' and m.empresa=2))'+ // Saídas Transferencais (CD)
           ' AND   m.cancelado=''N'''+
           ' AND   m.excluido =''N'''+
           // Movimentação a 12 Meses
           ' AND   m.data_lancamento>='+QuotedStr(DateToStr(IncMonth(StrToDate(f_Troca('/','.',f_Troca('-','.',sgDia))),-12)))+

           ' UNION '+

           ' SELECT DISTINCT '+
           QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDia)))+' DTA_PROCESSA,'+
           ' cv.cod_loja COD_LOJA_SIDICOM,'+
           ' em.cod_linx COD_LOJA_LINX,'+
           ' cv.cod_produto CODPRODUTO,'+
           ' pr.cod_produto COD_PRODUTO,'+
           ' 0 QTD_ESTOQUE,'+
           ' ''E'' IND_CURVA'+

           ' FROM ES_FINAN_CURVA_ABC cv, LINXPRODUTOS pr, EMP_CONEXOES em'+
           ' WHERE cv.cod_produto=TRIM(pr.cod_auxiliar)'+
           ' AND cv.cod_loja=em.cod_filial'+
           // Estoque Minimo Mairo que 0
           ' AND cv.est_minimo>0';
//opssaqui
    DMAtualizaSaldos.SQLC.Execute(MySql,nil,nil);

    hHrFimSql2:=TimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor));
    sFimSql2:=TimeToStr(StrToTime(hHrFimSql2)-StrToTime(hHrIniSql2));

    // Atualiza Saldo dos Produtos das Lojas a Processar =======================
    hHrIniSql3:=TimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor));

    MySql:=' UPDATE LINX_PRODUTOS_LOJAS pl'+
           ' SET pl.qtd_estoque=(SELECT d.quantidade'+
           '                     FROM LINXPRODUTOSDETALHES d'+
           '                     WHERE d.empresa=pl.cod_loja_linx'+
           '                     AND   d.cod_produto=pl.cod_produto)'+
           ' WHERE pl.dta_processa='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDia)));
//opssaqui
    DMAtualizaSaldos.SQLC.Execute(MySql,nil,nil);

    hHrFimSql3:=TimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor));
    sFimSql3:=TimeToStr(StrToTime(hHrFimSql3)-StrToTime(hHrIniSql3));

    // Atualiza Indicado da Curva ABC dos Produtos das Lojas a Processar =======
    hHrIniSql4:=TimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor));

    MySql:=' UPDATE LINX_PRODUTOS_LOJAS pl'+
           ' SET pl.ind_curva=(SELECT c.ind_curva'+
           '                   FROM ES_FINAN_CURVA_ABC c'+
           '                   WHERE c.cod_loja=pl.cod_loja_sidicom'+
           '                   AND   c.cod_produto=pl.codproduto)'+
           ' WHERE pl.dta_processa='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDia)));
//opssaqui
    DMAtualizaSaldos.SQLC.Execute(MySql,nil,nil);

    hHrFimSql4:=TimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor));
    sFimSql4:=TimeToStr(StrToTime(hHrFimSql4)-StrToTime(hHrIniSql4));

    // Atualiza Indicado da Curva ABC Para 'E' dos Produtos com Curva Nula =====
    hHrIniSql5:=TimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor));

    MySql:=' UPDATE LINX_PRODUTOS_LOJAS pl'+
           ' SET pl.ind_curva=''E'''+
           ' WHERE pl.ind_curva IS NULL';
//opssaqui
    DMAtualizaSaldos.SQLC.Execute(MySql,nil,nil);

    hHrFimSql5:=TimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor));
    sFimSql5:=TimeToStr(StrToTime(hHrFimSql5)-StrToTime(hHrIniSql5));

    // Grava Final do Processamento ============================================
    hHrFim:=TimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor));
    MySql:=' Insert Into MOVTOS_EMPRESAS ('+
           ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
           ' Values ('+
           QuotedStr('AS')+', '+
           QuotedStr('Final Atualização de Saldos: '+
                     'TEMPO:'+TimeToStr(StrToTime(hHrFim)-StrToTime(hHrInicio))+
                     ' 1º-'+sFimSql1+' 2º-'+sFimSql2+' 3º-'+sFimSql3+
                     ' 4º-'+sFimSql4+' 5º-'+sFimSql5)+', '+
                     QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor))))+')';
//opssaqui
    DMAtualizaSaldos.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMAtualizaSaldos.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMAtualizaSaldos.SQLC.Rollback(TD);

      // Transacao para Gravação do Erro no Banco de Dados =====================
      TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
      TD.IsolationLevel:=xilREADCOMMITTED;
      DMAtualizaSaldos.SQLC.StartTransaction(TD);

      MySqlErro:=' Insert Into MOVTOS_EMPRESAS ('+
                 ' IND_TIPO, NOMEFORNECEDOR, DTA_ATUALIZACAO)'+
                 ' Values ('+
                 QuotedStr('AS')+', '+
                 QuotedStr('ERRO Atualização de Saldos: ')+'||'+QuotedStr(Trim(e.Message))+', '+
                           QuotedStr(f_Troca('/','.',DateTimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor))))+')';
      DMAtualizaSaldos.SQLC.Execute(MySqlErro,nil,nil);

      // Atualiza Transacao ====================================================
      DMAtualizaSaldos.SQLC.Commit(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
    End; // on e : Exception do
  End; // Try da Transação

  Application.Terminate;
  Close;

end;

end.


