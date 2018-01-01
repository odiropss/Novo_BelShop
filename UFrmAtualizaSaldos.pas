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
  MySql: String;

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

  // Verifica o Dia para Processar as Lojas ====================================
  sgDia:=DateToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor)-1);

  // Busca Lojas ===============================================================
  MySql:=' SELECT c.cod_linx'+
         ' FROM EMP_CONEXOES  c'+
         ' WHERE (c.ind_ativo=''SIM'' or c.tip_emp=''M'')';

         If (AnsiUpperCase(DiaSemanaNome(StrToDate(sgDia)))='DOMINGO') Then
          MySql:=
           MySql+' AND c.ind_domingo=''S''';

  MySql:=
   MySql+' ORDER BY c.cod_linx';
  DMAtualizaSaldos.CDS_Empresas.Close;
  DMAtualizaSaldos.SQLQ_Empresas.SQL.Clear;
  DMAtualizaSaldos.SQLQ_Empresas.SQL.Add(MySql);
  DMAtualizaSaldos.CDS_Empresas.Open;

  sgLojas:='';
  DMAtualizaSaldos.CDS_Empresas.DisableControls;
  While Not DMAtualizaSaldos.CDS_Empresas.Eof do
  Begin
    If sgLojas<>'' Then
     sgLojas:=sgLojas+', '+DMAtualizaSaldos.CDS_Empresas.FieldByName('Cod_linx').AsString
    Else
     sgLojas:=DMAtualizaSaldos.CDS_Empresas.FieldByName('Cod_linx').AsString;

    DMAtualizaSaldos.CDS_Empresas.Next;
  End; // While Not DMAtualizaSaldos.CDS_Empresas.Eof do
  DMAtualizaSaldos.CDS_Empresas.EnableControls;
  DMAtualizaSaldos.CDS_Empresas.Close;

  If sgLojas='' Then
  Begin
    Application.Terminate;
    Close;
  End;

  sgLojas:='('+sgLojas+')';

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
           ' WHERE lp.dta_processa=CURRENT_DATE-1';
    DMAtualizaSaldos.SQLC.Execute(MySql,nil,nil);

    hHrFimSql1:=TimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor));
    sFimSql1:=TimeToStr(StrToTime(hHrFimSql1)-StrToTime(hHrIniSql1));

    // Inclui Produtos das Lojas a Processar ===================================
    hHrIniSql2:=TimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor));

    MySql:=' INSERT INTO LINX_PRODUTOS_LOJAS'+
           ' (dta_processa, cod_loja_sidicom, cod_loja_linx, codproduto, cod_produto, qtd_estoque, ind_curva)'+
           ' SELECT DISTINCT'+
           ' CURRENT_DATE-1 DTA_PROCESSA,'+
           ' m.cod_loja COD_LOJA_SIDICOM,'+
           ' m.empresa COD_LOJA_LINX,'+
           ' p.cod_auxiliar CODPRODUTO,'+
           ' m.cod_produto COD_PRODUTO,'+
           ' 0 QTD_ESTOQUE,'+
           ' ''E'' IND_CURVA'+

           ' FROM LINXMOVIMENTO m, LINXPRODUTOS p'+

           ' WHERE m.cod_produto=p.cod_produto'+
           ' AND   m.empresa in '+sgLojas;
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
           ' WHERE pl.dta_processa=CURRENT_DATE-1';
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
           ' WHERE pl.dta_processa=CURRENT_DATE-1';
    DMAtualizaSaldos.SQLC.Execute(MySql,nil,nil);

    hHrFimSql4:=TimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor));
    sFimSql4:=TimeToStr(StrToTime(hHrFimSql4)-StrToTime(hHrIniSql4));

    // Atualiza Indicado da Curva ABC Para 'E' dos Produtos com Curva Nula =====
    hHrIniSql5:=TimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor));

    MySql:=' UPDATE LINX_PRODUTOS_LOJAS pl'+
           ' SET pl.ind_curva=''E'''+
           ' WHERE pl.ind_curva IS NULL';
    DMAtualizaSaldos.SQLC.Execute(MySql,nil,nil);

    hHrFimSql5:=TimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor));
    sFimSql5:=TimeToStr(StrToTime(hHrFimSql5)-StrToTime(hHrIniSql5));

    // Atualiza Transacao ======================================================
    DMAtualizaSaldos.SQLC.Commit(TD);

  // APRESENTA O RESULTA DO TEMPO FINAL
  hHrFim:=TimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor));
  msg('TEMPO: '+TimeToStr(StrToTime(hHrFim)-StrToTime(hHrInicio))+cr+
                '1-'+sFimSql1+' 2-'+sFimSql2+' 3-'+sFimSql3+cr+
                ' 4-'+cr+sFimSql4+' 5-'+sFimSql5,'A');

  hHrInicio:='';
  hHrFim:='';

    DateSeparator:='/';
    DecimalSeparator:=',';
  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMAtualizaSaldos.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
    End; // on e : Exception do
  End; // Try da Transação

  Application.Terminate;
  Close;

end;

end.
