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

  // Cria Ponteiro de Transacão
  TD: TTransactionDesc;

  sgDia, sgLojas: String;

  tgMySqlErro: TStringList; // Arquivo de Processamento e Erros

implementation

uses UDMAtualizaSaldos, DK_Procs1, DB;

{$R *.dfm}

procedure TFrmAtualizaSaldos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(tgMySqlErro);

  Application.Terminate;
  Exit;

end;

procedure TFrmAtualizaSaldos.FormCreate(Sender: TObject);
begin
  tgMySqlErro:=TStringList.Create;
  tgMySqlErro.Clear;
  tgMySqlErro.Add('==================================');
  tgMySqlErro.Add('Processamento INÍCIO: '+DateTimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor)));
  tgMySqlErro.Add('==================================');
  tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Atual_Saldos_Erros.txt');

  Bt_AtualizarClick(Self);

end;

procedure TFrmAtualizaSaldos.Bt_AtualizarClick(Sender: TObject);
Var
  MySql, MySqlErro: String;

  sDtaPesq, sDtaExcl,
  sCodLjLinx, sCodLjSidi: String;

  hHrInicio, hHrFim,
  hHrIniLj, hHrFimLj:String;
begin
  hHrInicio:='';
  hHrFim:='';
  hHrInicio:=TimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor));

  // Dia Anterior para Processar as Lojas ======================================
  sgDia:=DateToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor)-1);

  // Dia para Pesquisa - 1 Ano a Tras ==========================================
  sDtaPesq:=DateToStr(IncMonth((DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor)-1),-12));
  sDtaPesq:=f_Troca('/','.',f_Troca('-','.',sDtaPesq));

  // Dia para Exclusão - 1 Mes a Tras ==========================================
  sDtaExcl:=DateToStr(PrimeiroUltimoDia(IncMonth((DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor)-1),-1), 'P'));
  sDtaExcl:=f_Troca('/','.',f_Troca('-','.',sDtaExcl));

  // Processa Saldos do Dia ====================================================
  If DMAtualizaSaldos.SQLC.InTransaction Then
   DMAtualizaSaldos.SQLC.Rollback(TD);

  // Busca Lojas ===============================================================
  MySql:=' SELECT l.empresa, l.cod_loja'+
         ' FROM LINXLOJAS l'+
         ' ORDER BY 1';
  DMAtualizaSaldos.CDS_Empresas.Close;
  DMAtualizaSaldos.SQLQ_Empresas.SQL.Clear;
  DMAtualizaSaldos.SQLQ_Empresas.SQL.Add(MySql);
  DMAtualizaSaldos.CDS_Empresas.Open;

  DMAtualizaSaldos.CDS_Empresas.DisableControls;
  While Not DMAtualizaSaldos.CDS_Empresas.Eof do
  Begin
    hHrIniLj:=TimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor));

    sCodLjLinx:=DMAtualizaSaldos.CDS_Empresas.FieldByName('Empresa').AsString;
    sCodLjSidi:=DMAtualizaSaldos.CDS_Empresas.FieldByName('Cod_Loja').AsString;

    // Monta Transacao ===========================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMAtualizaSaldos.SQLC.StartTransaction(TD);
    Try // Try da Transação
      DateSeparator:='.';
      DecimalSeparator:='.';

      // Exclui Saldo a Mais de Um Mes =========================================
      MySql:=' DELETE FROM LINX_PRODUTOS_LOJAS lp'+
             ' WHERE lp.dta_processa<'+QuotedStr(sDtaExcl)+
             ' AND   lp.cod_loja_linx='+sCodLjLinx;
      DMAtualizaSaldos.SQLC.Execute(MySql,nil,nil);

      // Atualiza Transacao ====================================================
      DMAtualizaSaldos.SQLC.Commit(TD);

      // Monta Transacao =======================================================
      TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
      TD.IsolationLevel:=xilREADCOMMITTED;
      DMAtualizaSaldos.SQLC.StartTransaction(TD);

      // Exclui Saldo do Dia a Processar =======================================
      MySql:=' DELETE FROM LINX_PRODUTOS_LOJAS lp'+
             ' WHERE lp.dta_processa='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDia)))+
             ' AND   lp.cod_loja_linx='+sCodLjLinx;
      DMAtualizaSaldos.SQLC.Execute(MySql,nil,nil);

      // Atualiza Transacao ====================================================
      DMAtualizaSaldos.SQLC.Commit(TD);

      // Monta Transacao =======================================================
      TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
      TD.IsolationLevel:=xilREADCOMMITTED;
      DMAtualizaSaldos.SQLC.StartTransaction(TD);

      //==========================================================================
      // Inclui Produtos das Lojas a Processar ===================================
      //==========================================================================
      // Somentes Lojas que Tiveram Produtos Vendidos (LINX) no Dia ==============
      // CD - Se Houve Transferencias de Saída ===================================
      MySql:=' INSERT INTO LINX_PRODUTOS_LOJAS'+
             ' (dta_processa, cod_loja_sidicom, cod_loja_linx, codproduto,'+
             '  cod_produto, qtd_estoque, ind_curva, cod_fornecedor)'+

             ' SELECT DISTINCT '+
             QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDia)))+' DTA_PROCESSA,'+
             ' m.cod_loja COD_LOJA_SIDICOM,'+
             ' m.empresa COD_LOJA_LINX,'+

             ' CASE'+
             '    WHEN CHAR_LENGTH(TRIM(COALESCE(p.cod_auxiliar, '''')))=6 THEN'+
             '       TRIM(p.cod_auxiliar)'+
             '    ELSE'+
             '       NULL'+
             '  END CODPRODUTO,'+

             ' m.cod_produto COD_PRODUTO,'+
             ' 0 QTD_ESTOQUE,'+
             ' ''E'' IND_CURVA,'+
             ' p.COD_FORNECEDOR'+

             ' FROM LINXMOVIMENTO m'+
             '   LEFT JOIN LINXPRODUTOS           p  ON p.cod_produto=m.cod_produto'+

//             ' WHERE ( ((m.operacao=''S'') AND  ((m.tipo_transacao=''V'') OR (TRIM(COALESCE(m.tipo_transacao, ''''))='''')))'+ // Vendas
//             '         Or'+
//             '         (m.operacao=''E'') )'+ // Entradas
             ' WHERE ( (m.operacao=''S'') Or (m.operacao=''E'') )'+ // Entradas

             ' AND   m.cancelado=''N'''+
             ' AND   m.excluido =''N'''+
             // Movimentação a 12 Meses
             ' AND   m.data_lancamento>= CAST('+QuotedStr(sDtaPesq)+'  AS TIMESTAMP)'+
             ' AND   m.empresa='+sCodLjLinx;
      DMAtualizaSaldos.SQLC.Execute(MySql,nil,nil);

      // Atualiza Transacao ======================================================
      DMAtualizaSaldos.SQLC.Commit(TD);

      // Monta Transacao ===========================================================
      TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
      TD.IsolationLevel:=xilREADCOMMITTED;
      DMAtualizaSaldos.SQLC.StartTransaction(TD);

      // Atualiza Saldo dos Produtos das Lojas a Processar =======================
      MySql:=' UPDATE LINX_PRODUTOS_LOJAS pl'+
             ' SET pl.qtd_estoque=(SELECT iv.quantidade'+
             '                     FROM LINXPRODUTOSINVENTARIO iv'+
             '                     WHERE iv.empresa=pl.cod_loja_linx'+
             '                     AND   iv.cod_produto=pl.cod_produto)'+
             ' WHERE pl.dta_processa='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDia)))+
             ' AND   pl.cod_loja_linx='+sCodLjLinx;
      DMAtualizaSaldos.SQLC.Execute(MySql,nil,nil);

      // Atualiza Transacao ======================================================
      DMAtualizaSaldos.SQLC.Commit(TD);

      // Monta Transacao ===========================================================
      TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
      TD.IsolationLevel:=xilREADCOMMITTED;
      DMAtualizaSaldos.SQLC.StartTransaction(TD);

      // Atualiza Indicado da Curva ABC dos Produtos das Lojas a Processar =======
      MySql:=' UPDATE LINX_PRODUTOS_LOJAS pl'+
             ' SET pl.ind_curva=(SELECT c.ind_curva'+
             '                   FROM ES_FINAN_CURVA_ABC c'+
             '                   WHERE c.cod_linx=pl.cod_loja_linx'+
             '                   AND   c.cod_prod_linx=pl.cod_produto)'+
             ' WHERE pl.dta_processa='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDia)))+
             ' AND   pl.cod_loja_linx='+sCodLjLinx;
      DMAtualizaSaldos.SQLC.Execute(MySql,nil,nil);

      // Atualiza Transacao ======================================================
      DMAtualizaSaldos.SQLC.Commit(TD);

      // Monta Transacao ===========================================================
      TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
      TD.IsolationLevel:=xilREADCOMMITTED;
      DMAtualizaSaldos.SQLC.StartTransaction(TD);

      // Atualiza Indicado da Curva ABC Para 'E' dos Produtos com Curva Nula =====
      MySql:=' UPDATE LINX_PRODUTOS_LOJAS pl'+
             ' SET pl.ind_curva=''E'''+
             ' WHERE pl.ind_curva IS NULL'+
             ' AND   pl.cod_loja_linx='+sCodLjLinx;
      DMAtualizaSaldos.SQLC.Execute(MySql,nil,nil);

      // Atualiza Transacao ======================================================
      DMAtualizaSaldos.SQLC.Commit(TD);

      hHrFimLj:=TimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor));

      DateSeparator:='/';
      DecimalSeparator:=',';

      tgMySqlErro.Add('Linx: '+sCodLjLinx+' Sid: '+sCodLjSidi+' - Inicio: '+hHrIniLj+' Fim: '+hHrFimLj+' - TEMPO: '+TimeToStr(StrToTime(hHrFimLj)-StrToTime(hHrIniLj)));
      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Atual_Saldos_Erros.txt');
    Except // Except da Transação
      on e : Exception do
      Begin
        // Abandona Transacao ====================================================
        DMAtualizaSaldos.SQLC.Rollback(TD);

        tgMySqlErro.Add('==================================');
        tgMySqlErro.Add('ERROR: '+e.message);
        tgMySqlErro.Add(MySql);
        tgMySqlErro.Add('==================================');
        tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Atual_Saldos_Erros.txt');

        DateSeparator:='/';
        DecimalSeparator:=',';
      End; // on e : Exception do
    End; // Try da Transação

    DMAtualizaSaldos.CDS_Empresas.Next;
  End; // While Not DMAtualizaSaldos.CDS_Empresas.Eof do
  DMAtualizaSaldos.CDS_Empresas.EnableControls;
  DMAtualizaSaldos.CDS_Empresas.Close;

  // Gravação do Final do Processamento ========================================
  hHrFim:=TimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor));

  tgMySqlErro.Add('==================================');
  tgMySqlErro.Add('Processamento FIM: '+DateTimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor)));
  tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Atual_Saldos_Erros.txt');

  tgMySqlErro.Add('==================================');
  tgMySqlErro.Add('Final Atualização de Saldos');
  tgMySqlErro.Add('Inicio: '+hHrInicio+' Fim: '+hHrFim);
  tgMySqlErro.Add('TEMPO: '+TimeToStr(StrToTime(hHrFim)-StrToTime(hHrInicio)));
  tgMySqlErro.Add('==================================');
  tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Atual_Saldos_Erros.txt');

  Application.Terminate;
  Close;

end;

end.


