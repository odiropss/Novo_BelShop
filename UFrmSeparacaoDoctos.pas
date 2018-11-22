unit UFrmSeparacaoDoctos;
{
Icone em:
C:\Projetos\Botôes\Icons\doc03.ico
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Mask, ToolEdit, CurrEdit,
  DBXpress, DateUtils, JvExControls, JvXPCore, JvXPButtons, DB;

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
    Bt_RomLimpaTudo: TJvXPButton;
    Label2: TLabel;
    EdtDocItens: TCurrencyEdit;
    EdtDocItensSIM: TCurrencyEdit;
    Label9: TLabel;
    Label10: TLabel;
    EdtDocItensNAO: TCurrencyEdit;
    Bt_RomBuscaSeparados: TJvXPButton;
    procedure EdtCodBarrasChange(Sender: TObject);

    // Odir ====================================================================
    Procedure LimpaTudo;

    Procedure ExecutaTransacao;
    Function  BuscaDoctoRelatorio: Boolean;
    Function  AtualizaTempoSeparacao: Boolean;
    Procedure CalculaTempoSeparacao(dDtaIni, dDtaFim: TDateTime; Var iDias: Integer; Var sTempo: String);

    Procedure UsuarioCorredorSeparacao;
    // Odir ====================================================================

    procedure FormShow(Sender: TObject);
    procedure Bt_RomLimpaTudoClick(Sender: TObject);
    procedure Bt_RomBuscaSeparadosClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSeparacaoDoctos: TFrmSeparacaoDoctos;

  sgCodBarras,
  sgNumDoc, sgNumRel,
  sgCodUsuSep, sgNomeUsuSep: String;


implementation

uses DK_Procs1, uj_001, uj_002, UDMSeparacaoDoctos, UPesquisa_Geral;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// ROMANEIO DE SEPARAÇÃO - Usuario do Corredor de Separação >>>>>>>>>>>>>>>>>>>>
Procedure TFrmSeparacaoDoctos.UsuarioCorredorSeparacao;
Var
  MySql: String;
Begin
  sgCodUsuSep :='';
  sgNomeUsuSep:='';

  FrmPesquisaGeral:=TFrmPesquisaGeral.Create(Self);
  FrmPesquisaGeral.Caption:='Selecione o Usuário Separador Deste Docto de Separação';
  FrmPesquisaGeral.sgBt_PesquisaNovo:='1';
  FrmPesquisaGeral.Bt_PesquisaNovo.Visible:=True;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT t.des_aux NOME, t.cod_aux CODIGO'+
         ' FROM TAB_AUXILIAR t'+
         ' WHERE t.tip_aux=29'+ // 29 => LOGISTICA - CADASTRO DE SEPARADORES DE MERCADORIAS
         ' ORDER BY 1';
  FrmPesquisaGeral.CDS_Geral.Close;
  FrmPesquisaGeral.CDS_Geral.Filtered:=False;
  FrmPesquisaGeral.SDS_Geral.CommandText:=MySql;
  FrmPesquisaGeral.CDS_Geral.Open;

  Screen.Cursor:=crDefault;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisaGeral.Campo_pesquisa:='Nome';
  FrmPesquisaGeral.Campo_Codigo:='Codigo';
  FrmPesquisaGeral.Campo_Descricao:='Nome';
  FrmPesquisaGeral.EdtDescricao.Clear;

//  // Campos Qualquer de Retorno ================================================
//  // Variavel de Entrada  - Variavel de Retorno
//  // Campo_Retorno1       - Retorno1
//  // Campo_Retorno2       - Retorno2
//  // Campo_Retorno3       - Retorno3
//  FrmPesquisaGeral.Campo_Retorno1:='Dta_Cadastro';
//  FrmPesquisaGeral.Campo_Retorno2:='Cod_Cidade';
//  FrmPesquisaGeral.Campo_Retorno3:='';

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisaGeral.ShowModal;
  FrmPesquisaGeral.CDS_Geral.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisaGeral.EdtCodigo.Text)<>'') and (Trim(FrmPesquisaGeral.EdtDescricao.Text)<>'') Then
  Begin
    sgCodUsuSep :=Trim(FrmPesquisaGeral.EdtCodigo.Text);
    sgNomeUsuSep:=Trim(FrmPesquisaGeral.EdtDescricao.Text);
  End; // If (Trim(FrmPesquisaGeral.EdtCodigo.Text)<>'') and (Trim(FrmPesquisaGeral.EdtDescricao.Text)<>'') Then

  FrmPesquisaGeral.SQLC.Connected:=False;
  FreeAndNil(FrmPesquisaGeral);

End; // ROMANEIO DE SEPARAÇÃO - Usuario do Corredor de Separação >>>>>>>>>>>>>>>

// Exclui Romaneios Inexistente >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSeparacaoDoctos.ExecutaTransacao;
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

    // Altera Separador do Romaneio ============================================
    MySql:=' UPDATE LG_REL_SEPARACAO l'+
           ' SET l.cod_separador='+sgCodUsuSep+
           ' WHERE l.num_relatorio='+IntToStr(EdtRomNumero.AsInteger)+
           ' AND   l.num_docto='+IntToStr(EdtDocNumero.AsInteger);
    DMSeparacaoDoctos.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMSeparacaoDoctos.SQLC.Commit(TD);

    // Apresenta Novo Separador do Romaneio ====================================
    EdtRomSeparados.Text:=sgCodUsuSep+' - '+sgNomeUsuSep;
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

// Busca Documento de Romaneio de Separação >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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

         ' CASE'+
         '   WHEN COALESCE(l.cod_separador,0)=0 THEN'+
         '     NULL'+
         '   ELSE'+
         '     l.cod_separador||'' - ''||u.des_aux'+
         ' END NOME_SEPARADOR,'+

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

End; // Busca Documento de Romaneio de Separação >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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
  EdtDocItens.Clear;
  EdtDocItensSIM.Clear;
  EdtDocItensNAO.Clear;

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
begin
  LimpaTudo;

  If Length(EdtCodBarras.Text)>=12 Then
  Begin
    // Atualiza e Apresenta Romaneiro ==========================================
    Try
      EdtCodBarras.Enabled:=False;
      sgCodBarras:=FormatFloat('0000000000000',StrToInt64(EdtCodBarras.Text));
      EdtCodBarras.Clear;
      EdtCodBarras.Enabled:=True;
    Except
      msg('Erro de Leitura do Código de Barras !!','A');
      LimpaTudo;
      EdtCodBarras.Enabled:=True;
      EdtCodBarras.Clear;
      EdtCodBarras.SetFocus;
      sgCodBarras:='';
      Exit;
    End;

    // Montagem do Codigo de Barras (13 Caracteres) ============================
    Try
      // Montagem do Codigo de Barras (13 Caracteres)
      //    NumDocSep Tamanho de 6
      //    NumDocto  Tamanho de 6
      //    Ultimo Caracter é Digito calculodo
      sgNumRel:=Copy(sgCodBarras,1,6);
      sgNumRel:=IntToStr(StrToInt(sgNumRel));

      sgNumDoc:=Copy(sgCodBarras,7,6);
      sgNumDoc:=IntToStr(StrToInt(sgNumDoc));
    Except
      msg('Erro de Leitura do Código de Barras !!','A');
      LimpaTudo;
      EdtCodBarras.Enabled:=True;
      EdtCodBarras.Clear;
      EdtCodBarras.SetFocus;
      sgCodBarras:='';
      Exit;
    End;

    If Not BuscaDoctoRelatorio Then
    Begin
      LimpaTudo;
      EdtCodBarras.Clear;
      EdtCodBarras.Enabled:=True;
      EdtCodBarras.SetFocus;
      sgCodBarras:='';
      Exit;
    End; // If Not BuscaDoctoRelatorio Then
    sgCodBarras:='';

    Application.ProcessMessages;
    If EdtTemHoras.Text='  :  :  ' Then
    Begin
      If Application.MessageBox('O Romaneio Selecionado Esta CORRETO ?', 'ATENÇÃO !!', 292) = IdNo Then
      Begin
        LimpaTudo;
        EdtCodBarras.Clear;
        EdtCodBarras.Enabled:=True;
        EdtCodBarras.SetFocus;
        Exit;
      End; // If Application.MessageBox('O Romaneio Selecionado Esta CORRETO ?', 'ATENÇÃO !!', 292) = IdNo Then
    End; // If EdtTemHoras.Text='  :  :  ' Then

    // Calcula Tempo de Separação ==============================================
    If EdtTemHoras.Text='  :  :  ' Then
     AtualizaTempoSeparacao;

    // Solicita o Separador ====================================================
    If Trim(EdtRomSeparados.Text)='' Then
    Begin
      Bt_RomBuscaSeparadosClick(Self);
    End; // If Trim(EdtRomSeparados.Text)='' Then

    // Retorna para Codigo de Barras ===========================================
    EdtCodBarras.SetFocus;
  End; // If Length(EdtCodBarras.Text)>=12 Then

  If Not EdtCodBarras.Enabled Then
   EdtCodBarras.Enabled:=True;

end;

procedure TFrmSeparacaoDoctos.FormShow(Sender: TObject);
begin
  LimpaTudo;
end;

procedure TFrmSeparacaoDoctos.Bt_RomLimpaTudoClick(Sender: TObject);
begin
  LimpaTudo;
  EdtCodBarras.Clear;
  EdtCodBarras.SetFocus;
end;

procedure TFrmSeparacaoDoctos.Bt_RomBuscaSeparadosClick(Sender: TObject);
Var
  b: Boolean;
begin
  EdtCodBarras.SetFocus;

  If EdtRomNumero.AsInteger=0 Then
   Exit;

  //============================================================================
  // Solicita Usuário de Separador de Mercadoria ===============================
  //============================================================================
  While b do
  Begin
    UsuarioCorredorSeparacao;

    If (Trim(sgCodUsuSep)='') and (Trim(EdtRomSeparados.Text)<>'') Then
    Begin
      Exit;
    End; // If (Trim(sgCodUsuSep)='') and (Trim(EdtRomSeparados.Text)<>'')  Then

    If Trim(sgCodUsuSep)<>'' Then
    Begin
      If msg('O Separador Selecionado Esta CORRETO ??'+cr+cr+sgCodUsuSep+' - '+sgNomeUsuSep,'C')=1 Then
       Begin
         Break;
       End
      Else
       Begin
         If Trim(EdtRomSeparados.Text)<>'' Then
          Exit;
       End; // If msg('O Separador Selecionado Esta CORRETO ??'+cr+cr+sgCodUsuSep+' - '+sgNomeUsuSep,'C')=2 Then
    End; // If Trim(sgCodUsuSep)<>'' Then
  End; // While b do
  // Solicita Usuário de Separador de Mercadoria ===============================
  //============================================================================

  //============================================================================
  // Altera para Novo Separador ================================================
  //============================================================================
  ExecutaTransacao;
  // Altera para Novo Separador ================================================
  //============================================================================

end;

end.
