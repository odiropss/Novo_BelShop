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

  // Cria Ponteiro de Transac�o
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
  tgMySqlErro.Add('Processamento INCIO: '+DateTimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor)));
  tgMySqlErro.Add('==================================');
  tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Atual_Saldos_Erros.txt');

  Bt_AtualizarClick(Self);

end;

procedure TFrmAtualizaSaldos.Bt_AtualizarClick(Sender: TObject);
Var
  MySql, MySqlErro: String;

  sDtaPesq,
  sCodLjLinx, sCodLjSidi: String;

  hHrInicio, hHrFim: String;
begin
  hHrInicio:='';
  hHrFim:='';
  hHrInicio:=TimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor));

  // Dia Anterior para Processar as Lojas ======================================
  sgDia:=DateToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor)-1);
  sDtaPesq:=DateToStr(IncMonth((DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor)-1),-12));
  sDtaPesq:=f_Troca('/','.',f_Troca('-','.',sDtaPesq));


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
    sCodLjLinx:=DMAtualizaSaldos.CDS_Empresas.FieldByName('Empresa').AsString;
    sCodLjSidi:=DMAtualizaSaldos.CDS_Empresas.FieldByName('Cod_Loja').AsString;

    // Monta Transacao ===========================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMAtualizaSaldos.SQLC.StartTransaction(TD);
    Try // Try da Transa��o
      DateSeparator:='.';
      DecimalSeparator:='.';

      // Exclui Saldo do Dia a Processar =========================================
      MySql:=' DELETE FROM LINX_PRODUTOS_LOJAS lp'+
             ' WHERE lp.dta_processa='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDia)))+
             ' AND   lp.cod_loja_linx='+sCodLjLinx;
      DMAtualizaSaldos.SQLC.Execute(MySql,nil,nil);

      //==========================================================================
      // Inclui Produtos das Lojas a Processar ===================================
      //==========================================================================
      // Somentes Lojas que Tiveram Produtos Vendidos (LINX) no Dia ==============
      // CD - Se Houve Transferencias de Sa�da ===================================
      MySql:=' INSERT INTO LINX_PRODUTOS_LOJAS'+
             ' (dta_processa, cod_loja_sidicom, cod_loja_linx, codproduto,'+
             '  cod_produto, qtd_estoque, ind_curva)'+

             ' SELECT DISTINCT '+
             QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDia)))+' DTA_PROCESSA,'+
             ' m.cod_loja COD_LOJA_SIDICOM,'+
             ' m.empresa COD_LOJA_LINX,'+

             ' CASE'+
             '    WHEN CHAR_LENGTH(TRIM(p.cod_auxiliar))=6 THEN'+
             '       TRIM(p.cod_auxiliar)'+
             '    ELSE'+
             '       NULL'+
             '  END CODPRODUTO,'+

             ' m.cod_produto COD_PRODUTO,'+
             ' 0 QTD_ESTOQUE,'+
             ' ''E'' IND_CURVA'+

             ' FROM LINXMOVIMENTO m'+
             '   LEFT JOIN LINXPRODUTOS           p  ON p.cod_produto=m.cod_produto'+

             ' WHERE ( ((m.operacao=''S'') AND  ((m.tipo_transacao=''V'') OR (TRIM(COALESCE(m.tipo_transacao, ''''))='''')))'+ // Vendas
             '        Or'+
             '        (m.operacao=''E'' AND m.codigo_cliente=13) )'+ // Entradas do CD

             ' AND   m.cancelado=''N'''+
             ' AND   m.excluido =''N'''+
             // Movimenta��o a 12 Meses
             ' AND   m.data_lancamento>= CAST('+QuotedStr(sDtaPesq)+'  AS TIMESTAMP)'+
             ' AND   m.empresa='+sCodLjLinx+

             ' UNION '+

             ' SELECT DISTINCT '+
             QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDia)))+' DTA_PROCESSA,'+
             ' cv.cod_loja COD_LOJA_SIDICOM,'+
             ' em.cod_linx COD_LOJA_LINX,'+
             ' cv.cod_produto CODPRODUTO,'+
             ' pr.cod_produto COD_PRODUTO,'+
             ' 0 QTD_ESTOQUE,'+
             ' ''E'' IND_CURVA'+

             ' FROM ES_FINAN_CURVA_ABC cv'+
             '     LEFT JOIN LINXPRODUTOS pr           ON pr.cod_auxiliar=cv.cod_produto'+
             '     LEFT JOIN EMP_CONEXOES em           ON em.cod_filial=cv.cod_loja'+

             // Estoque Minimo Mairo que 0
             ' WHERE cv.est_minimo>0'+
             ' AND   cv.cod_loja='+QuotedStr(sCodLjSidi);
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
             '                   WHERE c.cod_loja=pl.cod_loja_sidicom'+
             '                   AND   c.cod_produto=pl.codproduto)'+
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

      DateSeparator:='/';
      DecimalSeparator:=',';

      tgMySqlErro.Add('Linx: '+sCodLjLinx+' Sid: '+sCodLjSidi+' - OK');
      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Atual_Saldos_Erros.txt');

    Except // Except da Transa��o
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
    End; // Try da Transa��o

    DMAtualizaSaldos.CDS_Empresas.Next;
  End; // While Not DMAtualizaSaldos.CDS_Empresas.Eof do
  DMAtualizaSaldos.CDS_Empresas.EnableControls;
  DMAtualizaSaldos.CDS_Empresas.Close;

  // Grava��o do Final do Processamento ========================================
  hHrFim:=TimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor));

  tgMySqlErro.Add('==================================');
  tgMySqlErro.Add('Processamento FIM: '+DateTimeToStr(DataHoraServidorFI(DMAtualizaSaldos.SDS_DtaHoraServidor)));
  tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Atual_Saldos_Erros.txt');

  tgMySqlErro.Add('==================================');
  tgMySqlErro.Add('Final Atualiza��o de Saldos');
  tgMySqlErro.Add('Inicio: '+hHrInicio+' Fim: '+hHrFim);
  tgMySqlErro.Add('TEMPO: '+TimeToStr(StrToTime(hHrFim)-StrToTime(hHrInicio)));
  tgMySqlErro.Add('==================================');
  tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Atual_Saldos_Erros.txt');

  Application.Terminate;
  Close;
end;

end.


