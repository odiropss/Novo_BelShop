unit UFrmSeparacaoDoctos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Mask, ToolEdit, CurrEdit,
  DBXpress, DateUtils, JvExControls, JvXPCore, JvXPButtons;

type
  TFrmSeparacaoDoctos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EdtCodBarras: TEdit;
    Panel2: TPanel;
    Gb_Docto: TGroupBox;
    Label5: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Gb_Romaneiro: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    EdtDocNumero: TCurrencyEdit;
    EdtDocData: TMaskEdit;
    EdtDocLoja: TEdit;
    EdtRomNumero: TCurrencyEdit;
    EdtRomCorredor: TEdit;
    EdtRomPrioridade: TEdit;
    EdtRomFornecedor: TEdit;
    Gb_Tempo: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    EdtTemInicio: TMaskEdit;
    EdtTemFim: TMaskEdit;
    EdtTemDias: TCurrencyEdit;
    EdtTemHoras: TMaskEdit;
    Label3: TLabel;
    EdtRomDtaEmissao: TMaskEdit;
    Label4: TLabel;
    EdtRomHraEmissao: TMaskEdit;
    EdtRomSeparados: TEdit;
    Label6: TLabel;
    Bt_GeraOCCalcular: TJvXPButton;
    Label2: TLabel;
    EdtDocItens: TCurrencyEdit;
    EdtDocItensSIM: TCurrencyEdit;
    Label9: TLabel;
    Label10: TLabel;
    EdtDocItensNAO: TCurrencyEdit;
    procedure EdtCodBarrasChange(Sender: TObject);

    // Odir ====================================================================
    Procedure LimpaTudo;

    Procedure LimpaRomaneiosInexistente;
    Function  BuscaDoctoRelatorio: Boolean;
    Function  AtualizaTempoSeparacao: Boolean;
    Procedure CalculaTempoSeparacao(dDtaIni, dDtaFim: TDateTime; Var iDias: Integer; Var sTempo: String);

    // Odir ====================================================================

    procedure FormShow(Sender: TObject);
    procedure Bt_GeraOCCalcularClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSeparacaoDoctos: TFrmSeparacaoDoctos;

  sgNumDoc, sgNumRel: String;

implementation

uses DK_Procs1, uj_001, uj_002, UDMSeparacaoDoctos, DB;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


// Exclui Romaneios Inexistente >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSeparacaoDoctos.LimpaRomaneiosInexistente;
Var
  MySql: String;
Begin
  // Verifica se Transação esta Ativa
  If DMSeparacaoDoctos.SQLC.InTransaction Then
   DMSeparacaoDoctos.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  Screen.Cursor:=crAppStart;
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMSeparacaoDoctos.SQLC.StartTransaction(TD);
  Try // Try da Transação

    MySql:=' DELETE FROM LG_REL_SEPARACAO l'+
           ' WHERE NOT EXISTS (SELECT 1'+
           '                   FROM ES_ESTOQUES_LOJAS e'+
           '                   WHERE e.rel_separacao=l.num_relatorio)';
    DMSeparacaoDoctos.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMSeparacaoDoctos.SQLC.Commit(TD);

  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMSeparacaoDoctos.SQLC.Rollback(TD);

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transação
  Screen.Cursor:=crDefault;
End; // Exclui Romaneios Inexistente >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Calcula Tempo de Separação >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSeparacaoDoctos.CalculaTempoSeparacao(dDtaIni, dDtaFim: TDateTime; Var iDias: Integer; Var sTempo: String);
var
  DifDias: double;
  sHoras, sMinutos, sSegundos: String;
begin
  DifDias := DaySpan(dDtaFim, dDtaIni);

  iDias:=Trunc(DifDias);
  sHoras:=FormatFloat('00',StrToInt(FormatDateTime('h', DifDias)));
  sMinutos:=FormatFloat('00',StrToInt(FormatDateTime('n', DifDias)));
  sSegundos:=FormatFloat('00',StrToInt(FormatDateTime('s', DifDias)));

  sTempo:=sHoras+':'+sMinutos+':'+sSegundos;
End; // Calcula Tempo de Separação >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Atualiza Tempo de Separação >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmSeparacaoDoctos.AtualizaTempoSeparacao: Boolean;
Var
  MySql: String;
  iDias: Integer;
  sDta, sTempo: String;
  bGravouDtaIni: Boolean;
Begin
  // Verifica se Transação esta Ativa
  If DMSeparacaoDoctos.SQLC.InTransaction Then
   DMSeparacaoDoctos.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  Screen.Cursor:=crAppStart;
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMSeparacaoDoctos.SQLC.StartTransaction(TD);
  Try // Try da Transação
    bGravouDtaIni:=False;

    sDta:=DateTimeToStr(DataHoraServidorFI(DMSeparacaoDoctos.SDS_DtaHoraServidor));

    // Coloca Somente Data/Hora de Inicio da Separação =========================
    If EdtTemInicio.Text='  /  /20     :  :  ' Then
    Begin
      EdtTemInicio.Text:=sDta;
      EdtTemInicio.Color:=clYellow;

      MySql:=' UPDATE LG_REL_SEPARACAO l'+
             ' SET l.dta_inicio=CAST('+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDta)))+' AS TIMESTAMP)'+
             ' WHERE l.num_relatorio='+sgNumRel+
             ' AND   l.num_docto='+sgNumDoc;
      DMSeparacaoDoctos.SQLC.Execute(MySql,nil,nil);

      bGravouDtaIni:=True;
    End; // If EdtTemInicio.Text='  /  /20     :  :  ' Then

    // Coloca Data/Hora de Fim e Calcula tempo de Separação ====================
    If (EdtTemFim.Text='  /  /20     :  :  ') And (Not bGravouDtaIni) Then
    Begin
      EdtTemFim.Text:=sDta;
      EdtTemFim.Color:=clYellow;

      CalculaTempoSeparacao(StrToDateTime(EdtTemInicio.Text), StrToDateTime(EdtTemFim.Text), iDias, sTempo);

      MySql:=' UPDATE LG_REL_SEPARACAO l'+
             ' SET l.dta_fim=CAST('+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDta)))+' AS TIMESTAMP)'+
             ',    l.sep_dias='+IntToStr(iDias)+
             ',    l.sep_horas=CAST('+QuotedStr(sTempo)+' AS TIME)'+
             ' WHERE l.num_relatorio='+sgNumRel+
             ' AND   l.num_docto='+sgNumDoc;
      DMSeparacaoDoctos.SQLC.Execute(MySql,nil,nil);

      EdtTemDias.Text:=IntToStr(iDias);
      EdtTemDias.Color:=clYellow;
      EdtTemHoras.Text:=sTempo;
      EdtTemHoras.Color:=clYellow;
    End; // If EdtTemInicio.Text='  /  /20     :  :  ' Then

    // Atualiza Transacao ======================================================
    DMSeparacaoDoctos.SQLC.Commit(TD);

  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMSeparacaoDoctos.SQLC.Rollback(TD);

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transação
  Screen.Cursor:=crDefault;

End; // Atualiza Tempo de Separação >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Documento de Relatóroi de Separação >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmSeparacaoDoctos.BuscaDoctoRelatorio: Boolean;
Var
  MySql: String;
Begin
  Result:=True;

  MySql:=' SELECT'+
         ' l.num_relatorio, l.dta_relatorio, l.hra_relatorio,'+
         ' l.end_zona_corredor,'+
         ' l.ind_prioridades,'+
         ' l.cod_forn||'' - ''||f.nomefornecedor NOME_FORNECEDOR,'+
         ' l.cod_separador||'' - ''||u.des_aux NOME_SEPARADOR,'+
         ' l.num_docto, l.dta_docto,'+

         {
         ' (SELECT FIRST 1 e.cod_cli_linx||'' - ''||e.razao_social'+
         '  FROM ES_ESTOQUES_LOJAS s, EMP_CONEXOES e'+
         '  WHERE s.cod_loja=e.cod_filial'+
         '  AND   s.num_docto=l.num_docto'+
         '  AND   s.dta_movto=l.dta_docto'+
         '  ) LOJA,'+
         }

         // Linha = Código_NomeDaLoja ; Total_Itens ; Itens_Separados ; Itens_Não_Separados;
         ' (SELECT e.cod_cli_linx ||'' - ''|| e.razao_social ||'';''||'+ // Loja
         '         COUNT(s.num_seq) ||'';''||'+ // Total de Itens
         '         SUM('+ // Separados
         '             CASE'+
         '               WHEN ((s.qtd_transf>0) AND (s.qtd_a_transf>0)) OR ((s.qtd_transf_oc>0) AND (s.qtd_a_transf>0)) THEN'+
         '                  1'+
         '               ELSE'+
         '                  0'+
         '             END) ||'';''||'+
         '         SUM('+ // Não Separados
         '             CASE'+
         '               WHEN ((s.qtd_transf>0) AND (s.qtd_a_transf=0))  OR ((s.qtd_transf_oc>0) AND (s.qtd_a_transf=0)) THEN'+
         '                  1'+
         '               ELSE'+
         '                  0'+
         '             End) ||'';'''+
         '  FROM ES_ESTOQUES_LOJAS s, EMP_CONEXOES e'+
         '  WHERE s.cod_loja=e.cod_filial'+
         '  AND   s.ind_transf=''SIM'''+
         '  AND   s.num_docto=l.num_docto'+
         '  AND   s.dta_movto=l.dta_docto'+
         '  AND   s.rel_separacao=l.num_relatorio'+
         '  GROUP BY  e.cod_cli_linx, e.razao_social) LINHA,'+

         ' l.dta_inicio, l.dta_fim,'+
         ' l.sep_dias, l.sep_horas'+

         ' FROM LG_REL_SEPARACAO l'+
         '     LEFT JOIN TAB_AUXILIAR u       ON u.cod_aux=l.cod_separador'+
         '                                   AND u.tip_aux=29'+ // 29 => LOGISTICA - CADASTRO DE SEPARADORES DE MERCADORIAS
         '     LEFT JOIN FORNECEDOR f         ON f.codfornecedor=l.cod_forn'+

         ' WHERE l.num_relatorio='+sgNumRel+
         ' AND   l.num_docto='+sgNumDoc;
  DMSeparacaoDoctos.SQLQ_Romaneio.Close;
  DMSeparacaoDoctos.SQLQ_Romaneio.SQL.Clear;
  DMSeparacaoDoctos.SQLQ_Romaneio.SQL.Add(MySql);
  DMSeparacaoDoctos.SQLQ_Romaneio.Open;

  If DMSeparacaoDoctos.SQLQ_Romaneio.Eof Then
  Begin
    msg('Romaneio de Separação Não Encontrado !!','A');
    Result:=False;
  End; // If DMSeparacaoDoctos.CDS_Busca.Eof Then

  If Result Then
  Begin
    EdtRomNumero.AsInteger:=DMSeparacaoDoctos.SQLQ_RomaneioNUM_RELATORIO.AsInteger;
    EdtRomDtaEmissao.Text :=DMSeparacaoDoctos.SQLQ_RomaneioDTA_RELATORIO.AsString;
    EdtRomHraEmissao.Text :=DMSeparacaoDoctos.SQLQ_RomaneioHRA_RELATORIO.AsString;
    EdtRomCorredor.Text   :=DMSeparacaoDoctos.SQLQ_RomaneioEND_ZONA_CORREDOR.AsString;
    EdtRomPrioridade.Text :=DMSeparacaoDoctos.SQLQ_RomaneioIND_PRIORIDADES.AsString;
    EdtRomFornecedor.Text :=DMSeparacaoDoctos.SQLQ_RomaneioNOME_FORNECEDOR.AsString;
    EdtRomSeparados.Text  :=DMSeparacaoDoctos.SQLQ_RomaneioNOME_SEPARADOR.AsString;

    EdtDocNumero.AsInteger:=DMSeparacaoDoctos.SQLQ_RomaneioNUM_DOCTO.AsInteger;
    EdtDocData.Text       :=DMSeparacaoDoctos.SQLQ_RomaneioDTA_DOCTO.AsString;
    EdtDocLoja.Text       :=Separa_String(DMSeparacaoDoctos.SQLQ_RomaneioLINHA.AsString,1);
    EdtDocItens.Text      :=Separa_String(DMSeparacaoDoctos.SQLQ_RomaneioLINHA.AsString,2);
    EdtDocItensSIM.Text   :=Separa_String(DMSeparacaoDoctos.SQLQ_RomaneioLINHA.AsString,3);
    EdtDocItensNAO.Text   :=Separa_String(DMSeparacaoDoctos.SQLQ_RomaneioLINHA.AsString,4);

    If Trim(DMSeparacaoDoctos.SQLQ_RomaneioDTA_INICIO.AsString)<>'' Then
     EdtTemInicio.Text:=DMSeparacaoDoctos.SQLQ_RomaneioDTA_INICIO.AsString;

    If Trim(DMSeparacaoDoctos.SQLQ_RomaneioDTA_FIM.AsString)<>'' Then
     EdtTemFim.Text:=DMSeparacaoDoctos.SQLQ_RomaneioDTA_FIM.AsString;

    If Trim(DMSeparacaoDoctos.SQLQ_RomaneioSEP_DIAS.AsString)<>'' Then
     EdtTemDias.AsInteger:=DMSeparacaoDoctos.SQLQ_RomaneioSEP_DIAS.AsInteger;

    If Trim(DMSeparacaoDoctos.SQLQ_RomaneioSEP_HORAS.AsString)<>'' Then
     EdtTemHoras.Text:=DMSeparacaoDoctos.SQLQ_RomaneioSEP_HORAS.AsString;

  End; //   If Result Then
  DMSeparacaoDoctos.SQLQ_Romaneio.Close;

End; // Busca Documento de Relatóroi de Separação >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Limpa todos os Componentes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSeparacaoDoctos.LimpaTudo;
Begin
  EdtRomNumero.Clear;
  EdtRomDtaEmissao.Clear;
  EdtRomHraEmissao.Clear;
  EdtRomCorredor.Clear;
  EdtRomPrioridade.Clear;
  EdtRomFornecedor.Clear;
  EdtRomSeparados.Clear;

  EdtDocNumero.Clear;
  EdtDocData.Clear;
  EdtDocLoja.Clear;

  EdtTemInicio.Clear;
  EdtTemInicio.Color:=clBtnFace;
  EdtTemFim.Clear;
  EdtTemFim.Color:=clBtnFace;
  EdtTemDias.Clear;
  EdtTemDias.Color:=clBtnFace;
  EdtTemHoras.Clear;
  EdtTemHoras.Color:=clBtnFace;
End; // Limpa todos os Componentes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmSeparacaoDoctos.EdtCodBarrasChange(Sender: TObject);
Var
  sCodBarras: String;
begin
  LimpaTudo;

  If Length(EdtCodBarras.Text)>=12 Then
  Begin

    // Exclui Romaneios Inexistente ============================================
    LimpaRomaneiosInexistente;

    // Atualiza e Apresenta Romaneiro ==========================================
    EdtCodBarras.Enabled:=False;
    sCodBarras:=FormatFloat('0000000000000',StrToInt(EdtCodBarras.Text));
    EdtCodBarras.Clear;
    EdtCodBarras.Enabled:=True;

    Try
      // Montagem do Codigo de Barras
      //    NumDocSep Tamanho de 7
      //    NumDocto  Tamanho de 6
      sgNumRel:=Copy(sCodBarras,1,7);
      sgNumRel:=IntToStr(StrToInt(sgNumRel));

      sgNumDoc:=Copy(sCodBarras,8,6);
      sgNumDoc:=IntToStr(StrToInt(sgNumDoc));
    Except
      msg('Erro de leitura do Código de Barras !!','A');
      LimpaTudo;
      EdtCodBarras.Clear;
      EdtCodBarras.SetFocus;
      Exit;
    End;

    If Not BuscaDoctoRelatorio Then
    Begin
      LimpaTudo;
      EdtCodBarras.Clear;
      EdtCodBarras.SetFocus;
      Exit;
    End; // If Not BuscaDoctoRelatorio Then

    Application.ProcessMessages;
    If EdtTemHoras.Text='  :  :  ' Then
    Begin
      If Application.MessageBox('O Romaneio Selecionado Esta CORRETO ?', 'ATENÇÃO !!', 292) = IdNo Then
      Begin
        LimpaTudo;
        EdtCodBarras.Clear;
        EdtCodBarras.SetFocus;
        Exit;
      End; // If Application.MessageBox('O Romaneio Selecionado Esta CORRETO ?', 'ATENÇÃO !!', 292) = IdNo Then
    End; // If EdtTemHoras.Text='  :  :  ' Then

    // Calcula Tempo de Separação ==============================================
    If EdtTemHoras.Text='  :  :  ' Then
     AtualizaTempoSeparacao;

    // Retorna para Codigo de Barras ===========================================
    EdtCodBarras.SetFocus;
  End; // If Length(EdtCodBarras.Text)>=12 Then
end;

procedure TFrmSeparacaoDoctos.FormShow(Sender: TObject);
begin
  LimpaTudo;
end;

procedure TFrmSeparacaoDoctos.Bt_GeraOCCalcularClick(Sender: TObject);
begin
  LimpaTudo;
  EdtCodBarras.Clear;
  EdtCodBarras.SetFocus;
end;

end.
