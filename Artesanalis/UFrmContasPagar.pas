unit UFrmContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvXPCore, JvXPButtons, ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, Mask, ToolEdit, CurrEdit,
  Commctrl, // SHOW HINT EM FORMA DE BALÃO
  StdCtrls, cxCurrencyEdit, Grids, DBGrids, DBXpress, Math, JvXPCheckCtrls,
  AppEvnts, JvExStdCtrls, JvRadioButton, DB, JvEdit, JvValidateEdit;

type
  TFrmContasPagar = class(TForm)
    Pan_Solicitacoes: TPanel;
    Bt_Fechar: TJvXPButton;
    Bt_Salvar: TJvXPButton;
    Bt_Abandonar: TJvXPButton;
    Bt_Excluir: TJvXPButton;
    Pan_Docto: TPanel;
    Gb_Pessoa: TGroupBox;
    EdtDesPessoa: TEdit;
    EdtCodPessoa: TCurrencyEdit;
    Bt_BuscaPessoa: TJvXPButton;
    Bt_NovaPessoa: TJvXPButton;
    Gb_NumDocto: TGroupBox;
    EdtNumDocto: TCurrencyEdit;
    Gb_DtaDocto: TGroupBox;
    DtEdt_DtaDocto: TcxDateEdit;
    Gb_DtaVencto: TGroupBox;
    DtEdt_DtaVencto: TcxDateEdit;
    Gb_ParcelasCalcular: TGroupBox;
    Label25: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    EdtNumParcelas: TCurrencyEdit;
    EdtPrazoDias: TCurrencyEdit;
    Gb_VlrDocto: TGroupBox;
    EdtVlrDocto: TCurrencyEdit;
    Gb_Historico: TGroupBox;
    EdtDesHistorico: TEdit;
    EdtCodHistorico: TCurrencyEdit;
    Bt_BuscaHistorico: TJvXPButton;
    Bt_NovoHistorico: TJvXPButton;
    OdirPanApres: TPanel;
    Gb_Parcelas: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdtNrParcela: TCurrencyEdit;
    EdtNrParcelas: TCurrencyEdit;
    Ckb_CalculoParcelas: TJvXPCheckbox;
    Label4: TLabel;
    ApplicationEvents1: TApplicationEvents;
    EdtNumSeq: TCurrencyEdit;
    Bt_Pagto: TJvXPButton;
    Pan_Lanctos: TPanel;
    Dbg_Lanctos: TDBGrid;
    Gb_Relatorio: TGroupBox;
    DtEdt_DtaInicio: TcxDateEdit;
    DtEdt_DtaFim: TcxDateEdit;
    Gb_Periodo: TGroupBox;
    Rb_APagar: TJvRadioButton;
    Rb_Pagas: TJvRadioButton;
    Label5: TLabel;
    Label6: TLabel;
    Bt_Imprimir: TJvXPButton;
    Pan_TipoPesquisa: TPanel;
    Label7: TLabel;
    Rb_PesqDtaVencto: TJvRadioButton;
    Rb_PesqDtaPagto: TJvRadioButton;
    v1: TJvValidateEdit;
    a1: TEdit;
    a2: TEdit;
    v2: TJvValidateEdit;
    a4: TEdit;
    v4: TJvValidateEdit;
    v3: TJvValidateEdit;
    a3: TEdit;
    a8: TEdit;
    v8: TJvValidateEdit;
    v7: TJvValidateEdit;
    a7: TEdit;
    v5: TJvValidateEdit;
    a5: TEdit;
    v6: TJvValidateEdit;
    a6: TEdit;
    v9: TJvValidateEdit;
    a9: TEdit;
    v10: TJvValidateEdit;
    a10: TEdit;
    procedure Bt_FecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    
    // Odir ====================================================================

    // Hint em Fortma de Balão
    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Balão
    Procedure FocoToControl(Sender: TControl);

    Procedure LimpaDocto(bCodigos: Boolean  = True);

    Procedure FluxoFinanceiroBusca;

    Function  ConsisteLancamento: Boolean;
    Function  InsereLancamento: Boolean;

    Procedure ApresentaDocto;

    Function  AtualizaPagamento(sDtaPagto: String = '00.00.0000'; sVlrPagto: String = '0.00'): Boolean;

    Procedure Componentes;

    // Odir ====================================================================

    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Bt_SalvarClick(Sender: TObject);
    procedure EdtCodPessoaExit(Sender: TObject);
    procedure Bt_BuscaPessoaClick(Sender: TObject);
    procedure EdtCodPessoaChange(Sender: TObject);
    procedure Dbg_LanctosEnter(Sender: TObject);
    procedure Dbg_LanctosExit(Sender: TObject);
    procedure Dbg_LanctosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_NovaPessoaClick(Sender: TObject);
    procedure EdtCodHistoricoExit(Sender: TObject);
    procedure Bt_AbandonarClick(Sender: TObject);
    procedure Ckb_CalculoParcelasClick(Sender: TObject);
    procedure Ckb_CalculoParcelasKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure Dbg_LanctosDblClick(Sender: TObject);
    procedure Bt_ExcluirClick(Sender: TObject);
    procedure EdtNumDoctoChange(Sender: TObject);
    procedure Dbg_LanctosTitleClick(Column: TColumn);
    procedure EdtCodPessoaEnter(Sender: TObject);
    procedure Bt_BuscaHistoricoClick(Sender: TObject);
    procedure DtEdt_DtaVenctoExit(Sender: TObject);
    procedure Bt_PagtoClick(Sender: TObject);
    procedure Rb_APagarClick(Sender: TObject);
    procedure Rb_APagarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_ImprimirClick(Sender: TObject);
    procedure JvRadioButton1Click(Sender: TObject);
    procedure Rb_PesqDtaVenctoClick(Sender: TObject);
    procedure Rb_PesqDtaVenctoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_NovoHistoricoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  // Show Hint em Forma de Balão
  TTS_BALLOON = $40;
  TTM_SETTITLE = (WM_USER + 32);
  //////////////////////////////

var
  FrmContasPagar: TFrmContasPagar;

  // Show Hint em Forma de Balão
  hTooltip: Cardinal;
  ti: TToolInfo;
  buffer : array[0..255] of char;
  ///////////////////////////////

  bgExecEvento, // Se Executa Eventos onChange e OnExit;
  bgSairCP: Boolean;

  igNumSeq, // Num_Seq Gravado
  ipNumSeq: Integer; // Posiciona no Docto Selecionado

  // Cria Ponteiro de transacão ================================================
  TD: TTransactionDesc;

implementation

uses DK_Procs1, UDMArtesanalis, UPesquisa, UFrmPessoaCadastro, 
     UFrmSolicitacoes, UDMRelatorios, RelVisual;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Inicio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Habilita/Desabilita Componentes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmContasPagar.Componentes;
Var
  b: Boolean;
  clCor: TColor;
Begin
  If Bt_Salvar.Caption='Incluir' Then
  Begin
    b:=False;
    clCor:=clWindow;
  End; // If Bt_Salvar.Caption='Incluir' Then

  If Bt_Salvar.Caption='Alterar' Then
  Begin
    b:=True;
    clCor:=clMoneyGreen;
  End; // If Bt_Salvar.Caption='Alterar' Then

  EdtCodPessoa.ReadOnly   :=b;
  EdtCodPessoa.Color      :=clCor;
  EdtCodHistorico.ReadOnly:=b;
  EdtCodHistorico.Color   :=clCor;

  Bt_BuscaPessoa.Enabled   :=Not b;
  Bt_BuscaHistorico.Enabled:=not b;
  Bt_NovaPessoa.Enabled    :=not b;
  Bt_NovoHistorico.Enabled :=Not b;

End; // Habilita/Desabilita Componentes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Atualiza Pagamento do Documento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmContasPagar.AtualizaPagamento(sDtaPagto: String = '00.00.0000'; sVlrPagto: String = '0.00'): Boolean;
Var
  MySql: String;
Begin
  Result:=False;

  // Insere Lancamento =========================================================
  OdirPanApres.Caption:='AGUARDE !! Atualizando Pagamento...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmContasPagar.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmContasPagar.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmContasPagar;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Verifica se Transação esta Ativa
  If DMArtesanalis.SQLC.InTransaction Then
   DMArtesanalis.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMArtesanalis.SQLC.StartTransaction(TD);
  Try // Try da Transação
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Atualiza Pagamento ======================================================
    MySql:=' UPDATE FLUXO_FINANCEIRO f'+
           ' SET f.vlr_pagamento='+f_Troca(',','.',sVlrPagto);

           If sDtaPagto='00.00.0000' Then
            MySql:=
             MySql+' ,   f.dta_pagamento=NULL'
           Else
            MySql:=
             MySql+' ,   f.dta_pagamento='+QuotedStr(sDtaPagto);

    MySql:=
     MySql+' WHERE f.num_seq='+EdtNumSeq.Text;
    DMArtesanalis.SQLC.Execute(MySql,Nil,Nil);

    // Atualiza Transacao ======================================================
    DMArtesanalis.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;
    Screen.Cursor:=crDefault;
    Result:=True;

  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMArtesanalis.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      OdirPanApres.Visible:=False;
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transação

  Bt_AbandonarClick(Self);

End; // Atualiza Pagamento do Documento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Apresenta Documento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmContasPagar.ApresentaDocto;
Begin
  // Se Executa Eventos onChange e OnExit
  bgExecEvento:=False;

  Ckb_CalculoParcelas.Enabled:=False;
  EdtNrParcela.Enabled:=False;
  EdtNrParcelas.Enabled:=False;

  EdtNumSeq.AsInteger      :=DMArtesanalis.CDS_FluxoFinanceiroNUM_SEQ.AsInteger;
  EdtCodPessoa.AsInteger   :=DMArtesanalis.CDS_FluxoFinanceiroCOD_FORNECEDOR.AsInteger;
  EdtCodHistorico.AsInteger:=DMArtesanalis.CDS_FluxoFinanceiroCOD_HISTORICO.AsInteger;
  EdtNumDocto.AsInteger    :=DMArtesanalis.CDS_FluxoFinanceiroNUM_DOCTO.AsInteger;
  DtEdt_DtaDocto.Date      :=DMArtesanalis.CDS_FluxoFinanceiroDTA_EMISSAO.AsDateTime;
  DtEdt_DtaVencto.Date     :=DMArtesanalis.CDS_FluxoFinanceiroDTA_VENCIMENTO.AsDateTime;
  EdtVlrDocto.Value        :=DMArtesanalis.CDS_FluxoFinanceiroVLR_PRESTACAO.AsCurrency;

  EdtNumParcelas.AsInteger :=DMArtesanalis.CDS_FluxoFinanceiroNUM_PRESTACOES.AsInteger;
  EdtPrazoDias.AsInteger   :=DMArtesanalis.CDS_FluxoFinanceiroNUM_PRAZO.AsInteger;

  EdtNrParcela.AsInteger   :=DMArtesanalis.CDS_FluxoFinanceiroNUM_PRESTACAO.AsInteger;
  EdtNrParcelas.AsInteger  :=DMArtesanalis.CDS_FluxoFinanceiroNUM_PRESTACOES.AsInteger;

  EdtCodPessoaExit(Self);
  EdtCodHistoricoExit(Self);

  // Se Executa Eventos onChange e OnExit
  bgExecEvento:=True;

  EdtCodPessoa.SetFocus;

  ipNumSeq:=DMArtesanalis.CDS_FluxoFinanceiroNUM_SEQ.AsInteger;

End; // Apresenta Documento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Insere Lancamento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmContasPagar.InsereLancamento: Boolean;
Var
  cVlrParc, cVlrDif: Currency;
  iDia, i, iQtdParc: Integer;
  MySql: String;
  sNomeDia: String;
  dDta, dDtaVenc: TDate;
  wDia, wMes, wAno: Word;
Begin
  Result:=False;

  // Insere Lancamento =========================================================
  OdirPanApres.Caption:='AGUARDE !! Incluindo Documento...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmContasPagar.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmContasPagar.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmContasPagar;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Verifica se Transação esta Ativa
  If DMArtesanalis.SQLC.InTransaction Then
   DMArtesanalis.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMArtesanalis.SQLC.StartTransaction(TD);
  Try // Try da Transação
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Calucla valor(es) da(s) Parcela(s) ======================================
    If Ckb_CalculoParcelas.Checked Then
    Begin
      iQtdParc:=EdtNumParcelas.AsInteger;
      cVlrParc:=RoundTo(EdtVlrDocto.Value/iQtdParc,-2);
      cVlrDif:=cVlrParc*iQtdParc;
      cVlrDif:=EdtVlrDocto.Value-cVlrDif;
    End; // If Ckb_CalculoParcelas.Checked Then

    If Not Ckb_CalculoParcelas.Checked Then
    Begin
      iQtdParc:=1;
      cVlrParc:=RoundTo(EdtVlrDocto.Value/iQtdParc,-2);
      cVlrDif:=cVlrParc*iQtdParc;
      cVlrDif:=EdtVlrDocto.Value-cVlrDif;
    End; // If Ckb_CalculoParcelas.Checked Then

    For i:=1 to iQtdParc do
    Begin
      If i=1 Then // Primeiro
       Begin
         DecodeDate(DtEdt_DtaVencto.Date, wAno, wMes, wDia);
         iDia:=wDia;

         dDta:=DtEdt_DtaVencto.Date
       End
      Else // If i=1 Then // Primeiro Registro
       Begin
         If EdtPrazoDias.Value=0 Then
          Begin
            // Próximo Mês e Desmembra Data
            dDta:=PrimUltDia(dDta,'U')+1;
            DecodeDate(dDta, wAno, wMes, wDia);

            // Monta Novo Vencimento
            dDta:=EncodeDate(wAno, wMes, iDia);
          End
         Else
          Begin
            dDta:=dDta+EdtPrazoDias.AsInteger;
          End;
       End; // If i=1 Then // Primeiro Registro

      // Acerta Vencimentos de Sábado ou Domingo ===============================
      If Ckb_CalculoParcelas.Checked Then
      Begin
        sNomeDia:=AnsiUpperCase(DiaSemanaNome(dDta));
        If sNomeDia='SÁBADO' Then
         dDta:=dDta+2;

        If sNomeDia='DOMINGO' Then
         dDta:=dDta+1;
      End; // If Ckb_CalculoParcelas.Checked Then

      dDtaVenc:=dDta;

      MySql:=' UPDATE OR INSERT INTO FLUXO_FINANCEIRO'+
             ' (NUM_SEQ, COD_FORNECEDOR, COD_HISTORICO, NUM_DOCTO, DTA_EMISSAO,'+
             '  VLR_ORIGINAL, NUM_PRESTACOES, NUM_PRAZO, DTA_PRIM_VENC,'+
             '  NUM_PRESTACAO, DTA_VENCIMENTO, VLR_PRESTACAO,'+
             '  VLR_PAGAMENTO, DTA_PAGAMENTO)'+

             ' VALUES (';

             // NUM_SEQ
             If EdtNumSeq.AsInteger<>0 Then
              MySql:=
               MySql+IntToStr(EdtNumSeq.AsInteger)+', '
             Else
              MySql:=
               MySql+' NULL, ';

      MySql:=
       MySql+IntToStr(EdtCodPessoa.AsInteger)+', '+ // COD_FORNECEDOR
             IntToStr(EdtCodHistorico.AsInteger)+', '+ // COD_HISTORICO
             IntToStr(EdtNumDocto.AsInteger)+', '+ // NUM_DOCTO
             QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaDocto.Date))))+', '+ // DTA_EMISSAO
             QuotedStr(f_Troca(',','.',CurrToStr(EdtVlrDocto.Value)))+', '; // VLR_ORIGINAL

             // NUM_PRESTACOES, NUM_PRAZO
             If Ckb_CalculoParcelas.Checked Then
              MySql:=
               MySql+IntToStr(EdtNumParcelas.AsInteger)+', '+IntToStr(EdtPrazoDias.AsInteger)+', ';

             If Not Ckb_CalculoParcelas.Checked Then
              MySql:=
               MySql+IntToStr(EdtNrParcelas.AsInteger)+', 0, ';

      MySql:=
       MySql+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaVencto.Date))))+', '; // DTA_PRIM_VENC

             // NUM_PRESTACAO
             If Ckb_CalculoParcelas.Checked Then
              MySql:=
               MySql+IntToStr(i)+', ';

             If Not Ckb_CalculoParcelas.Checked Then
              MySql:=
               MySql+IntToStr(EdtNrParcela.AsInteger)+', ';

      MySql:=
       MySql+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(dDtaVenc))))+', '; // DTA_VENCIMENTO

             // VLR_PRESTACAO
             If i=1 Then
              Begin
                MySql:=
                 MySql+QuotedStr(f_Troca(',','.',CurrToStr(cVlrParc+cVlrDif)))+', '
              End
             Else
              Begin
                MySql:=
                 MySql+QuotedStr(f_Troca(',','.',CurrToStr(cVlrParc)))+', ';
              End; // If i=1 Then

      MySql:=
       MySql+' 0.00, '+ // VLR_PAGAMENTO
             ' NULL)'+  // DTA_PAGAMENTO

             ' MATCHING (NUM_SEQ)';
      DMArtesanalis.SQLC.Execute(MySql,Nil,Nil);

      // Busca Num_Seq do Primeiro Registro --------------------------
      If i=1 Then
      Begin
        igNumSeq:=EdtNumSeq.AsInteger;
        If EdtNumSeq.AsInteger=0 Then
        Begin
          MySql:=' SELECT GEN_ID(GEN_FLUXO_FINANCEIRO_ID,0) Num_Seq'+
                 ' FROM RDB$DATABASE';
          DMArtesanalis.CDS_BuscaRapida.Close;
          DMArtesanalis.SQLQ_BuscaRapida.SQL.Clear;
          DMArtesanalis.SQLQ_BuscaRapida.SQL.Add(MySql);
          DMArtesanalis.CDS_BuscaRapida.Open;
          igNumSeq:=DMArtesanalis.CDS_BuscaRapida.FieldByName('Num_Seq').AsInteger;
          DMArtesanalis.CDS_BuscaRapida.Close;
        End; // If EdtNumSeq.AsInteger=0 Then
      End; // If i=1 Then
    End; // For i:=1 to iQtdParc do

    // Atualiza Transacao ======================================================
    DMArtesanalis.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;
    Screen.Cursor:=crDefault;
    Result:=True;

  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMArtesanalis.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      OdirPanApres.Visible:=False;
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Exit;
    End; // on e : Exception do
  End; // Try da Transação

End; // Insere Lancamento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Consiste Documento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmContasPagar.ConsisteLancamento: Boolean;
Var
  MySql: String;
Begin
  Result:=False;

  // Fornecedor ================================================================
  If EdtCodPessoa.AsInteger=0 Then
  Begin
    If msg('Documento SEM Fornecedor !!'+cr+cr+'Esta CORRETO ??','C')=2 Then
    Begin
      EdtCodPessoa.SetFocus;
      Exit;
    End;
  End;

  // Histórico =================================================================
  If EdtCodHistorico.AsInteger=0 Then
  Begin
    msg('Favor Informar o Histórico !!','A');
    EdtCodHistorico.SetFocus;
    Exit;
  End;

  // Numero do Docto ===========================================================
  If EdtNumDocto.AsInteger=0 Then
  Begin
    msg('Favor Informar o Nº do Docto !!','A');
    EdtNumDocto.SetFocus;
    Exit;
  End;

  // Data do Docto =============================================================
  try
    StrToDate(DtEdt_DtaDocto.Text);
  Except
    msg('Data do Documento Inválida !!','A');
    DtEdt_DtaDocto.SetFocus;
    Exit;
  End;

  // Data do Vencimento ========================================================
  try
    StrToDate(DtEdt_DtaVencto.Text);
  Except
    msg('Data de Vencimento Inválida !!','A');
    DtEdt_DtaVencto.SetFocus;
    Exit;
  End;

  If DtEdt_DtaDocto.Date>DtEdt_DtaVencto.Date Then
  Begin
    msg('Data de Vencimento MENOR'+cr+cr+'Que Data do Docto !!','A');
    DtEdt_DtaVencto.SetFocus;
    Exit;
  End;

  // Valor =====================================================================
  If EdtVlrDocto.AsInteger=0 Then
  Begin
    msg('Favor Informar o Valor do Docto !!','A');
    EdtVlrDocto.SetFocus;
    Exit;
  End;

  // Calcula Parcelas ==========================================================
  If Ckb_CalculoParcelas.Checked Then
  Begin
    If EdtNumParcelas.AsInteger=0 Then
    Begin
      msg('Favor Informar o'+cr+cr+'Número de Parcelas !!','A');
      EdtNumParcelas.SetFocus;
      Exit;
    End;

    If EdtPrazoDias.AsInteger=0 Then
    Begin
      msg('Favor Informar o Prazo de Dias'+cr+'Para Calculo da(s) Parcela(s) !!','A');
      EdtPrazoDias.SetFocus;
      Exit;
    End;
  End; // If Ckb_CalculoParcelas.Checked Then

  // NÃO Calcula Parcelas ======================================================
  If Not Ckb_CalculoParcelas.Checked Then
  Begin
    If EdtNrParcela.AsInteger=0 Then
    Begin
      msg('Favor Informar o'+cr+cr+'Número da Parcela !!','A');
      EdtNrParcela.SetFocus;
      Exit;
    End;

    If EdtNrParcelas.AsInteger=0 Then
    Begin
      msg('Favor Informar o'+cr+cr+'Número de Parcela !!','A');
      EdtNrParcelas.SetFocus;
      Exit;
    End;

    If EdtNrParcela.AsInteger>EdtNrParcelas.AsInteger Then
    Begin
      msg('Número da Parcela MAIOR'+cr+'Que Número de Parcelas!!','A');
      EdtNrParcela.SetFocus;
      Exit;
    End;
  End; // If Ckb_CalculoParcelas.Checked Then

  // Não Permite Inserir Docto Existente =======================================
  If Bt_Salvar.Caption='Incluir' Then
  Begin
    MySql:=' SELECT f.num_prestacoes, f.num_prestacao, f.num_seq'+
           ' FROM FLUXO_FINANCEIRO f'+
           ' WHERE f.cod_fornecedor='+IntToStr(EdtCodPessoa.AsInteger)+
           ' AND   f.cod_historico='+IntToStr(EdtCodHistorico.AsInteger)+
           ' AND   f.num_docto='+IntToStr(EdtNumDocto.AsInteger);
    DMArtesanalis.CDS_BuscaRapida.Close;
    DMArtesanalis.SQLQ_BuscaRapida.SQL.Clear;
    DMArtesanalis.SQLQ_BuscaRapida.SQL.Add(MySql);
    DMArtesanalis.CDS_BuscaRapida.Open;

    // Examina Docto
    If Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)<>'' Then
    Begin
      // Calculo de Parcelas
      If Ckb_CalculoParcelas.Checked Then
      Begin
        msg('Impossível Calcular de Parcelas'+cr+'para Documento Existente !!','A');
        DMArtesanalis.CDS_BuscaRapida.Close;
        EdtNumDocto.SetFocus;
        Exit;
      End;

      // SEM Calculo de Parcelas
      If Not Ckb_CalculoParcelas.Checked Then
      Begin
        If DMArtesanalis.CDS_BuscaRapida.FieldByName('num_prestacoes').AsInteger<>EdtNrParcelas.AsInteger Then
        Begin
          msg('Impossivel Incluir Documento !!'+cr+cr+'Número de Parcelas Diferente'+cr+'do Docto Já Existente !!','A');
          DMArtesanalis.CDS_BuscaRapida.Close;
          EdtNrParcelas.SetFocus;
          Exit;
        end;

        If DMArtesanalis.CDS_BuscaRapida.FieldByName('num_prestacao').AsInteger=EdtNrParcela.AsInteger Then
        Begin
          msg('Impossivel Incluir !!'+cr+cr+'Este Docto Já Contém'+cr+'Este Número da Parcela !!','A');
          DMArtesanalis.CDS_BuscaRapida.Close;
          EdtNrParcela.SetFocus;
          Exit;
        end;
      End; // Not If Ckb_CalculoParcelas.Checked Then
    End; // If Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)<>'' Then
  End; // If Bt_Salvar.Caption='Incluir' Then
  DMArtesanalis.CDS_BuscaRapida.Close;

  // Não Permite Alterar Docto Com Pagamento Efetuado ==========================
  If (Bt_Salvar.Caption='Alterar') and (DMArtesanalis.CDS_FluxoFinanceiroVLR_PAGAMENTO.AsCurrency<>0.00) Then
  Begin
    msg('Impossivel Alterar !!'+cr+cr+'Docto com Pagamento Efetuado !!','A');
    EdtNumDocto.SetFocus;
    Exit;
  End; // If (Bt_Salvar.Caption='Alterar') and (DMArtesanalis.CDS_FluxoFinanceiroVLR_PAGAMENTO.AsCurrency<>0.00) Then
  Result:=True;

End; // Consiste Documento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Apresenta Movtos de Fluxo Financeiro >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmContasPagar.FluxoFinanceiroBusca;
Var
  MySql: String;
Begin
  If Not Pan_Lanctos.Enabled Then
   Exit;

  MySql:=' SELECT ff.num_seq, ff.cod_historico, pl.des_historico,'+
         ' ff.cod_fornecedor,'+
         ' CASE'+
         '     WHEN ff.cod_fornecedor=0 THEN'+
         '       ''SEM FORNECEDOR INFORMADO'''+
         '     ELSE'+
         '       fo.des_pessoa'+
         ' END des_pessoa,'+
         ' ff.num_docto, ff.dta_emissao,'+
         ' ff.vlr_original, ff.num_prestacao, ff.num_prestacoes, ff.num_prazo,'+
         ' ff.dta_vencimento, ff.vlr_prestacao,'+
         ' ff.vlr_pagamento, ff.dta_pagamento'+

         ' FROM FLUXO_FINANCEIRO ff'+
         '      LEFT JOIN PESSOAS fo      on fo.cod_pessoa=ff.cod_fornecedor'+
         '      LEFT JOIN PLANO_CONTAS pl on pl.cod_historico=ff.cod_historico'+

         ' WHERE ff.cod_fornecedor='+IntToStr(EdtCodPessoa.AsInteger);

         If EdtCodHistorico.AsInteger<>0 Then
          MySql:=
           MySql+' AND   ff.cod_historico='+IntToStr(EdtCodHistorico.AsInteger);

  MySql:=
   MySql+' ORDER BY pl.des_historico, fo.des_pessoa, ff.num_docto, ff.dta_vencimento';
  DMArtesanalis.CDS_FluxoFinanceiro.Close;
  DMArtesanalis.SQLQ_FluxoFinanceiro.SQL.Clear;
  DMArtesanalis.SQLQ_FluxoFinanceiro.SQL.Add(MySql);
  DMArtesanalis.CDS_FluxoFinanceiro.Open;

  Bt_Salvar.Enabled:=True;
  EdtNumDoctoChange(Self);

  DMArtesanalis.CDS_FluxoFinanceiro.Locate('NUM_SEQ', ipNumSeq,[]);

End; // Apresenta Movtos de Fluxo Financeiro >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Limpa Campos do Docto na Tela >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmContasPagar.LimpaDocto(bCodigos: Boolean  = True);
Var
  i: Integer;
Begin

  For i:=0 to FrmContasPagar.ComponentCount-1 do
  Begin
    // TEdit ===================================================================
    If FrmContasPagar.Components[i] is TEdit Then
    Begin
     If bCodigos Then
      Begin // Incializa tudo
        (FrmContasPagar.Components[i] as TEdit).Clear;
      End
     Else If ((FrmContasPagar.Components[i] as TEdit).Name<>'EdtDesPessoa') And // Mantem as Descrições dos Códigos
             ((FrmContasPagar.Components[i] as TEdit).Name<>'EdtDesHistorico') Then
      (FrmContasPagar.Components[i] as TEdit).Clear;
    End; // If FrmContasPagar.Components[i] is TEdit Then

    // TCurrencyEdit ===========================================================
    If FrmContasPagar.Components[i] is TCurrencyEdit Then
    Begin
      If bCodigos Then // Incializa tudo
      Begin
        (FrmContasPagar.Components[i] as TCurrencyEdit).Value:=0;
//        DMArtesanalis.CDS_FluxoFinanceiro.Close;
      End
      Else If ((FrmContasPagar.Components[i] as TCurrencyEdit).Name='EdtNrParcela') Or
              ((FrmContasPagar.Components[i] as TCurrencyEdit).Name='EdtNrParcelas') Then
      Begin
        (FrmContasPagar.Components[i] as TCurrencyEdit).Value:=0;
        (FrmContasPagar.Components[i] as TCurrencyEdit).Enabled:=True;
      End
      Else If ((FrmContasPagar.Components[i] as TCurrencyEdit).Name<>'EdtCodPessoa') And
              ((FrmContasPagar.Components[i] as TCurrencyEdit).Name<>'EdtCodHistorico') Then
      Begin
       (FrmContasPagar.Components[i] as TCurrencyEdit).Value:=0;
      End
    End; // If FrmContasPagar.Components[i] is TCurrencyEdit Then

    // TcxDateEdit =============================================================
    If FrmContasPagar.Components[i] is TcxDateEdit Then
     (FrmContasPagar.Components[i] as TcxDateEdit).Clear;

    // TJvXPCheckbox ===========================================================
    If FrmContasPagar.Components[i] is TJvXPCheckbox Then
    Begin
      (FrmContasPagar.Components[i] as TJvXPCheckbox).Checked:=False;
      (FrmContasPagar.Components[i] as TJvXPCheckbox).Enabled:=True;

      If (FrmContasPagar.Components[i] as TJvXPCheckbox).Name='Ckb_CalculoParcelas' Then
       Ckb_CalculoParcelasClick(Self);
    End;
  End; // For i:=0 to FrmContasPagar.ComponentCount-1 do

  Gb_Parcelas.Visible:=True;
  Gb_ParcelasCalcular.Visible:=False;
  Pan_Lanctos.Enabled:=True;
  Dbg_Lanctos.Color:=clWindow;
  Bt_Excluir.Enabled:=False;
  Bt_Pagto.Enabled:=False;

  Bt_Salvar.Caption:='Incluir';
  Componentes;

End; // Limpa Campos do Docto na Tela >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Balão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmContasPagar.CreateToolTips(hWnd: Cardinal);
begin
  hToolTip := CreateWindowEx(0, 'Tooltips_Class32', nil, TTS_ALWAYSTIP or TTS_BALLOON,
  Integer(CW_USEDEFAULT), Integer(CW_USEDEFAULT),Integer(CW_USEDEFAULT),
  Integer(CW_USEDEFAULT), hWnd, 0, hInstance, nil);

  if hToolTip <> 0 then
  begin
    SetWindowPos(hToolTip, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or  SWP_NOSIZE or SWP_NOACTIVATE);
    ti.cbSize := SizeOf(TToolInfo);
    ti.uFlags := TTF_SUBCLASS;
    ti.hInst := hInstance;
  end;
end; // Show Hint em Forma de Balão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Balão - Usado no FormCreate >>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure AddToolTip(hwnd: dword; lpti: PToolInfo; IconType: Integer; Text, Title: PChar);
var
  Item: THandle;
  Rect: TRect;
begin

  Item := hWnd;

  if (Item <> 0) and (GetClientRect(Item, Rect)) then
  begin
    lpti.hwnd := Item;
    lpti.Rect := Rect;
    lpti.lpszText := Text;
    SendMessage(hToolTip, TTM_ADDTOOL, 0, Integer(lpti));
    FillChar(buffer, sizeof(buffer), #0);
    lstrcpy(buffer, Title);

    if (IconType > 3) or (IconType < 0) then
      IconType := 0;

    SendMessage(hToolTip, TTM_SETTITLE, IconType, Integer(@buffer));
  end;
end; // Show Hint em Forma de Balão - Usado no FormCreate >>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Balão - Posiciona do Componente >>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmContasPagar.FocoToControl(Sender: TControl);
Var
 NewPos: TPoint;
Begin
  NewPos.X:=Sender.Left+(Sender.Width div 2);
  NewPos.y:=Sender.Top+(Sender.Height div 2);

  If Sender.Parent<>Nil Then
   NewPos:=Sender.Parent.ClientToScreen(NewPos);

  SetCursorPos(NewPos.x,NewPos.y)
End; // Show Hint em Forma de Balão - Posiciona do Componente >>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Fim >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmContasPagar.Bt_FecharClick(Sender: TObject);
begin

  If DMArtesanalis.CDS_FluxoFinanceiro.Active Then
   DMArtesanalis.CDS_FluxoFinanceiro.Close;

  bgSairCP:=True;

  Close;

end;

procedure TFrmContasPagar.FormCreate(Sender: TObject);
const
  TipoDoIcone = 1; // Show Hint em Forma de Balão
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  Application.OnMessage := ApplicationEvents1Message;

  // Não Permite Movimentar o Formulário =======================================
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

  // Show Hint em Forma de Balão
  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Salvar.Handle, @ti, TipoDoIcone, 'Incluir/Alterar', 'LANÇAMEMTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Abandonar.Handle, @ti, TipoDoIcone, 'Abandonar', 'LANÇAMEMTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Excluir.Handle, @ti, TipoDoIcone, 'Excluir Lançto'+cr+'Selecionado', 'LANÇAMEMTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Pagto.Handle, @ti, TipoDoIcone, 'Pagamento Lançto'+cr+'Selecionado', 'LANÇAMEMTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Fechar.Handle, @ti, TipoDoIcone, 'Fechar', 'CONTAS A PAGAR');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_BuscaPessoa.Handle, @ti, TipoDoIcone, 'Localizar', 'FORNECEDOR');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_NovaPessoa.Handle, @ti, TipoDoIcone, 'Incluir', 'FORNECEDOR');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_BuscaHistorico.Handle, @ti, TipoDoIcone, 'Localizar', 'HISTÓRICO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_NovoHistorico.Handle, @ti, TipoDoIcone, 'Incluir', 'HISTÓRICO');

  sgMensagem:=DateToStr(PrimeiroUltimoDia(DataHoraServidorFI(DMArtesanalis.SDS_DtaHoraServidor),'P'));
  DtEdt_DtaInicio.Date:=StrToDate(sgMensagem);
  sgMensagem:=DateToStr(DataHoraServidorFI(DMArtesanalis.SDS_DtaHoraServidor));
  DtEdt_DtaFim.Date:=StrToDate(sgMensagem);

  // Se Executa Eventos onChange e OnExit
  bgExecEvento:=True;
end;

procedure TFrmContasPagar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If Not bgSairCP Then
  Begin
    msg('Para Fechar Tecle '+cr+cr+'no Botão <Fechar>...','A');
    Action := caNone;
    Exit;
  End;

  // Permite Sair do Sistema ===================================================
  DMArtesanalis.MemoRetiraNomeForm('FINANCEIRO - Contas a Pagar - Lançamentos');

end;

procedure TFrmContasPagar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmContasPagar.FormShow(Sender: TObject);
begin
  bgSairCP:=False;

  // Limpa Tela ================================================================
  LimpaDocto();

  EdtCodPessoa.SetFocus;

end;

procedure TFrmContasPagar.Bt_SalvarClick(Sender: TObject);
begin

  If Not ConsisteLancamento Then
   Exit;

  // Insere Lancamento =========================================================
  If Not InsereLancamento Then
   Exit;

  // Limpa Tela ================================================================
  LimpaDocto(False);

  // Busca Fluxo Financeiro ====================================================
  FluxoFinanceiroBusca;

  If igNumSeq<>0 Then
   DMArtesanalis.CDS_FluxoFinanceiro.Locate('NUM_SEQ',igNumSeq,[]);

  EdtCodPessoa.SetFocus;

end;

procedure TFrmContasPagar.EdtCodPessoaExit(Sender: TObject);
Var
  MySql: String;
begin

  EdtDesPessoa.Clear;

  If Pan_Lanctos.Enabled Then
   DMArtesanalis.CDS_FluxoFinanceiro.Close;

  If EdtCodPessoa.asInteger<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    EdtDesPessoa.Clear;

    MySql:=' SELECT p.des_pessoa nome, Tipo'+
           ' FROM PESSOAS p'+
           ' WHERE p.Tipo in (''A'', ''F'')'+
           ' AND p.cod_pessoa='+IntToStr(EdtCodPessoa.AsInteger);
    DMArtesanalis.CDS_BuscaRapida.Close;
    DMArtesanalis.SQLQ_BuscaRapida.SQL.Clear;
    DMArtesanalis.SQLQ_BuscaRapida.SQL.Add(MySql);
    DMArtesanalis.CDS_BuscaRapida.Open;

    If Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('Nome').AsString)='' Then
    Begin
      Screen.Cursor:=crDefault;
      DMArtesanalis.CDS_BuscaRapida.Close;
      msg('Fornecedor Não Encontrado !!'+cr+'Ou Não é Fornecedor !!','A');
      EdtCodPessoa.SetFocus;
      Exit;
    End;
    EdtDesPessoa.Text:=Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('Nome').AsString);
    DMArtesanalis.CDS_BuscaRapida.Close;
  End; // If EdtCodPessoa.asInteger<>0 Then

  // Busca Fluxo Financeiro ====================================================
  FluxoFinanceiroBusca;

  Screen.Cursor:=crDefault;
end;

procedure TFrmContasPagar.Bt_BuscaPessoaClick(Sender: TObject);
Var
  MySql: String;
begin
  If Pan_Lanctos.Enabled Then
   DMArtesanalis.CDS_FluxoFinanceiro.Close;

  EdtCodPessoa.Clear;
  EdtDesPessoa.Clear;

  Try
    Dbg_Lanctos.SetFocus;
  Except
  End;


  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT p.des_pessoa Nome, p.cod_pessoa Codigo'+
         ' FROM PESSOAS p'+
         ' WHERE p.Tipo in (''A'', ''F'')'+
         ' ORDER BY p.des_pessoa';
  DMArtesanalis.CDS_Pesquisa.Close;
  DMArtesanalis.CDS_Pesquisa.Filtered:=False;
  DMArtesanalis.SDS_Pesquisa.CommandText:=MySql;
  DMArtesanalis.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMArtesanalis.CDS_Pesquisa.FieldByName('Nome').AsString)='' Then
  Begin
    DMArtesanalis.CDS_Pesquisa.Close;
    msg('Sem Fornecedor a Listar !!','A');
    EdtCodPessoa.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Nome';
  FrmPesquisa.Campo_Codigo:='Codigo';
  FrmPesquisa.Campo_Descricao:='Nome';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMArtesanalis.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtCodPessoa.AsInteger:=StrToInt(FrmPesquisa.EdtCodigo.Text);
     EdtCodPessoaExit(Self);

     EdtCodHistorico.SetFocus;
   End
  Else
   Begin
     EdtCodPessoa.SetFocus;
   End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmContasPagar.EdtCodPessoaChange(Sender: TObject);
begin
  If bgExecEvento Then
  Begin
    Bt_Salvar.Enabled:=False;

    DMArtesanalis.CDS_FluxoFinanceiro.Close;

    If (Sender is TCurrencyEdit) Then
    Begin
      If (Sender as TCurrencyEdit).Name='EdtCodPessoa' Then
      Begin
        EdtDesPessoa.Clear;
      End;

      If (Sender as TCurrencyEdit).Name='EdtCodHistorico' Then
      Begin
        EdtDesHistorico.Clear;
      End;
    End; // If (Sender is TComboBoxJul) Then
  End; // If bgExecEvento Then

end;

procedure TFrmContasPagar.Dbg_LanctosEnter(Sender: TObject);
begin
//  (Sender as TDBGrid).Color:=clMoneyGreen;

//  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
//  ApplicationEvents1.OnActivate:=Dbg_LanctosEnter; // Nome do Evento do DBGRID
//  Application.OnMessage := ApplicationEvents1Message;
//  ApplicationEvents1.Activate;

end;

procedure TFrmContasPagar.Dbg_LanctosExit(Sender: TObject);
begin
  (Sender as TDBGrid).Color:=clWindow;

end;

procedure TFrmContasPagar.Dbg_LanctosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  // Não Permite Excluir Registro Pelo Grid ====================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

end;

procedure TFrmContasPagar.Bt_NovaPessoaClick(Sender: TObject);
begin
  Dbg_Lanctos.SetFocus;

  FrmCadastroPessoa.bgTransportar:=True;
  FrmCadastroPessoa.sgTipoPessoa:='F';

  FrmCadastroPessoa.ShowModal;

  If FrmCadastroPessoa.bgTransportar Then
  Begin
    EdtCodPessoa.AsInteger:=StrToInt(FrmCadastroPessoa.sgCodPesTransportar);
    EdtCodPessoaExit(Self);
  End;

end;

procedure TFrmContasPagar.EdtCodHistoricoExit(Sender: TObject);
Var
  MySql: String;
begin

  EdtDesHistorico.Clear;

  If Pan_Lanctos.Enabled Then
   DMArtesanalis.CDS_FluxoFinanceiro.Close;

  If EdtCodHistorico.asInteger<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    EdtDesHistorico.Clear;

    MySql:=' SELECT pl.des_historico, pl.cod_historico'+
           ' FROM PLANO_CONTAS pl'+
           ' WHERE pl.cod_historico='+IntToStr(EdtCodHistorico.AsInteger);
    DMArtesanalis.CDS_BuscaRapida.Close;
    DMArtesanalis.SQLQ_BuscaRapida.SQL.Clear;
    DMArtesanalis.SQLQ_BuscaRapida.SQL.Add(MySql);
    DMArtesanalis.CDS_BuscaRapida.Open;

    If Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('cod_historico').AsString)='' Then
    Begin
      Screen.Cursor:=crDefault;
      DMArtesanalis.CDS_BuscaRapida.Close;
      msg('Histórico Não Encontrado !!','A');
      EdtCodHistorico.SetFocus;
      Exit;
    End;
    EdtDesHistorico.Text:=Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('Des_Historico').AsString);
    DMArtesanalis.CDS_BuscaRapida.Close;
  End; // If EdtCodHistorico.asInteger<>0 Then

  // Busca Fluxo Financeiro ====================================================
  FluxoFinanceiroBusca;

  Screen.Cursor:=crDefault;
end;

procedure TFrmContasPagar.Bt_AbandonarClick(Sender: TObject);
begin
  // Limpa Tela ================================================================
  LimpaDocto(False);

  // Reposiciona ===============================================================
  EdtCodPessoa.SetFocus;
  If EdtCodPessoa.AsInteger<>0 Then
   EdtCodPessoaExit(Self);

  If EdtCodHistorico.AsInteger<>0 Then
   EdtCodHistoricoExit(Self);

  DMArtesanalis.CDS_FluxoFinanceiro.Locate('NUM_SEQ', ipNumSeq,[]);
end;

procedure TFrmContasPagar.Ckb_CalculoParcelasClick(Sender: TObject);
begin
  AcertaCkb_Style(Ckb_CalculoParcelas);

  Gb_Parcelas.Visible:=False;
  Gb_ParcelasCalcular.Visible:=False;

  If Ckb_CalculoParcelas.Checked Then
   Begin
     Gb_ParcelasCalcular.Visible:=True;
     Gb_DtaVencto.Caption:=' 1º Vencimento ';
   End
  Else
   Begin
     Gb_Parcelas.Visible:=True;
     Gb_DtaVencto.Caption:=' Data Vencimento ';
   End; // If Ckb_CalculoParcelas.Checked Then

end;

procedure TFrmContasPagar.Ckb_CalculoParcelasKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_CalculoParcelasClick(Self);
end;

procedure TFrmContasPagar.ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
var
  Sentido: SmallInt;
begin
  If Msg.message = WM_MOUSEWHEEL then
  Begin
    Msg.message := WM_KEYDOWN;
    Msg.lParam := 0;
    Sentido := HiWord(Msg.wParam);
    if Sentido > 0 then
     Msg.wParam := VK_UP
    else
     Msg.wParam := VK_DOWN;
  End; // if Msg.message = WM_MOUSEWHEEL then
end;

procedure TFrmContasPagar.Dbg_LanctosDblClick(Sender: TObject);
begin
  If DMArtesanalis.CDS_FluxoFinanceiro.IsEmpty Then
   Exit;

  Pan_Lanctos.Enabled:=False;
  Dbg_Lanctos.Color:=$00E6FFE6;

  Bt_Excluir.Enabled:=True;
  Bt_Pagto.Enabled:=True;

  // Apresenta Documento =======================================================
  ApresentaDocto;

  Bt_Salvar.Caption:='Alterar';
  Componentes;

  EdtNumDocto.SetFocus;

end;

procedure TFrmContasPagar.Bt_ExcluirClick(Sender: TObject);
Var
  MySql: String;
begin

  If DMArtesanalis.CDS_FluxoFinanceiroVLR_PAGAMENTO.AsCurrency<>0.00 Then
  Begin
    msg('Impossivel Excluir !!'+cr+cr+'Docto com Pagamento Efetuado !!','A');
    Exit;
  End;


  if msg('Deseja Realmente Excluir o'+cr+'Documento Número: '+IntToStr(EdtNumDocto.AsInteger)+cr+
         'Parcela: '+IntToStr(EdtNrParcela.AsInteger)+'/'+IntToStr(EdtNumParcelas.AsInteger)+
         ' no Valor de R$ '+FormatFloat(',0.00',EdtVlrDocto.Value)+cr+
         'Data Emissão: '+DateToStr(DtEdt_DtaDocto.Date)+cr+' Data Vencimento: '+DateToStr(DtEdt_DtaVencto.Date)+' ??','C')=2 Then
  Begin
    EdtCodPessoa.SetFocus;
    Exit;
  End;

  Bt_Excluir.Enabled:=False;
  Bt_Pagto.Enabled:=False;

  // Exclui Docto ==============================================================
  // Insere Lancamento =========================================================
  OdirPanApres.Caption:='AGUARDE !! Excluindo Documento...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmContasPagar.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmContasPagar.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmContasPagar;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Verifica se Transação esta Ativa
  If DMArtesanalis.SQLC.InTransaction Then
   DMArtesanalis.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMArtesanalis.SQLC.StartTransaction(TD);
  Try // Try da Transação
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' DELETE FROM FLUXO_FINANCEIRO f'+
           ' WHERE f.num_seq='+IntToStr(EdtNumSeq.AsInteger);
    DMArtesanalis.SQLC.Execute(MySql,Nil,Nil);

    // Atualiza Transacao ======================================================
    DMArtesanalis.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;
    Screen.Cursor:=crDefault;
  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMArtesanalis.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      OdirPanApres.Visible:=False;
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Exit;
    End; // on e : Exception do
  End; // Try da Transação

  msg('Documento Excluido com SUCESSO !!','A');

  // Limpa Tela ================================================================
  LimpaDocto(False);

  // Busca Fluxo Financeiro ====================================================
  Pan_Lanctos.Enabled:=True;
  Dbg_Lanctos.Color:=clWindow;
  FluxoFinanceiroBusca;

  EdtCodPessoa.SetFocus;
end;

procedure TFrmContasPagar.EdtNumDoctoChange(Sender: TObject);
begin
  If DMArtesanalis.CDS_FluxoFinanceiro.IsEmpty Then
   Exit;

  If (EdtNumSeq.AsInteger=0) and (EdtNumDocto.AsInteger<>0) Then
   DMArtesanalis.CDS_FluxoFinanceiro.Locate('NUM_DOCTO', EdtNumDocto.AsInteger,[])
  Else If (EdtNumSeq.AsInteger<>0) Then
   DMArtesanalis.CDS_FluxoFinanceiro.Locate('NUM_SEQ', EdtNumSeq.AsInteger,[]);
end;

procedure TFrmContasPagar.Dbg_LanctosTitleClick(Column: TColumn);
Var
  s, sPesquisa: String;
  b: Boolean;
  i: Integer;
begin
  If Not DMArtesanalis.CDS_FluxoFinanceiro.IsEmpty Then
  Begin
    i:=DMArtesanalis.CDS_FluxoFinanceiro.RecNo;
    sPesquisa:='';
    b:=True;
    While b do
    Begin
      s:=DMArtesanalis.CDS_FluxoFinanceiro.FieldByName(Column.FieldName).DisplayLabel;
      If InputQuery('Localizar: '+s,'',sPesquisa) then
       Begin
         Try
           If Not DMArtesanalis.CDS_FluxoFinanceiro.Locate(Column.FieldName, sPesquisa,[]) Then
           Begin
             If Not LocalizaRegistro(DMArtesanalis.CDS_FluxoFinanceiro, Column.FieldName, sPesquisa) Then
             Begin
               DMArtesanalis.CDS_FluxoFinanceiro.RecNo:=i;
               msg('Não Localizado !!','A');
               Exit;
             End;
           End; // If Not DMArtesanalis.CDS_FluxoFinanceiro.Locate(Column.FieldName, sPesquisa,[]) Then
           Break;

         Except
           msg('Informação Inválida !!','A');
           Break;
         End;
       End
      Else // If InputQuery('Localizar: '+s,'',sPesquisa) then
       Begin
         Break;
       End; // If InputQuery('Localizar: '+s,'',sPesquisa) then
    End; // While b do
  End; // If Not DMArtesanalis.CDS_FluxoFinanceiro.IsEmpty Then
end;

procedure TFrmContasPagar.EdtCodPessoaEnter(Sender: TObject);
begin
//  Bt_Excluir.Enabled:=False;
end;

procedure TFrmContasPagar.Bt_BuscaHistoricoClick(Sender: TObject);
Var
  MySql: String;
begin

  EdtCodHistorico.Clear;
  EdtDesHistorico.Clear;
  Dbg_Lanctos.SetFocus;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT pl.des_historico, pl.cod_historico'+
         ' FROM PLANO_CONTAS pl'+
         ' ORDER BY pl.des_historico';
  DMArtesanalis.CDS_Pesquisa.Close;
  DMArtesanalis.CDS_Pesquisa.Filtered:=False;
  DMArtesanalis.SDS_Pesquisa.CommandText:=MySql;
  DMArtesanalis.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMArtesanalis.CDS_Pesquisa.FieldByName('cod_historico').AsString)='' Then
  Begin
    DMArtesanalis.CDS_Pesquisa.Close;
    msg('Sem Histórico a Listar !!','A');
    EdtCodHistorico.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Des_Historico';
  FrmPesquisa.Campo_Codigo:='Cod_Historico';
  FrmPesquisa.Campo_Descricao:='Des_Historico';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMArtesanalis.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtCodHistorico.AsInteger:=StrToInt(FrmPesquisa.EdtCodigo.Text);
     EdtCodHistoricoExit(Self);
     EdtNumDocto.SetFocus;
   End
  Else
   Begin
     EdtCodHistorico.SetFocus;
   End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmContasPagar.DtEdt_DtaVenctoExit(Sender: TObject);
begin
  If DMArtesanalis.CDS_FluxoFinanceiro.IsEmpty Then
   Exit;

  If (EdtNumSeq.AsInteger=0) and (EdtNumDocto.AsInteger<>0) and (DtEdt_DtaVencto.Text<>'') Then
   DMArtesanalis.CDS_FluxoFinanceiro.Locate('NUM_DOCTO; DTA_VENCIMENTO',VarArrayOf([EdtNumDocto.AsInteger,DtEdt_DtaVencto.Date]),[])

  Else If (EdtNumSeq.AsInteger<>0) and (DtEdt_DtaVencto.Text<>'') Then
   DMArtesanalis.CDS_FluxoFinanceiro.Locate('NUM_SEQ; DTA_VENCIMENTO',VarArrayOf([EdtNumSeq.AsInteger,DtEdt_DtaVencto.Date]),[])

  Else If (EdtNumSeq.AsInteger=0) and (EdtNumDocto.AsInteger=0) and (DtEdt_DtaVencto.Text<>'') Then
   DMArtesanalis.CDS_FluxoFinanceiro.Locate('DTA_VENCIMENTO', DtEdt_DtaVencto.Date,[]);

end;

procedure TFrmContasPagar.Bt_PagtoClick(Sender: TObject);
Var
  dDtaPagto: TDate;
  cVlrPagto: Currency;
  bSiga: Boolean;
begin

  If DMArtesanalis.CDS_FluxoFinanceiroVLR_PAGAMENTO.AsCurrency<>0.00 Then
  Begin
    cVlrPagto:=DMArtesanalis.CDS_FluxoFinanceiroVLR_PAGAMENTO.AsCurrency;
    dDtaPagto:=DMArtesanalis.CDS_FluxoFinanceiroDTA_PAGAMENTO.AsDateTime;
    If msg('Deseja Retirar o'+cr+'Pagamento do Docto Selecionado ??'+cr+cr+
           'Data Pagto: '+DateToStr(dDtaPagto)+cr+
           'Valor Pagto: R$ '+FormatFloat(',0.00',cVlrPagto),'C')=1 Then
    Begin
      AtualizaPagamento();
      EdtCodPessoaExit(Self);
      Dbg_Lanctos.SetFocus;
    End;
    Exit;
  End; // If DMArtesanalis.CDS_FluxoFinanceiroVLR_PAGAMENTO.AsCurrency<>0.00 Then

  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmSolicitacoes.AbreSolicitacoes(0);
  
  FrmSolicitacoes.Caption:='FINANCEIRO - Contas a Pagar';
  FrmSolicitacoes.ClientHeight:=198;
  FrmSolicitacoes.ClientWidth :=362;

  FrmSolicitacoes.ShowModal;

  cVlrPagto:=FrmSolicitacoes.EdtVlrPagto.Value;
  dDtaPagto:=FrmSolicitacoes.DtEdt_DtaPagto.Date;
  bSiga:=FrmSolicitacoes.bgProcessado;

  FreeAndNil(FrmSolicitacoes);

  // Insere Pagamento ==========================================================
  If bSiga Then
  Begin
    If DateToStr(dDtaPagto)='00/00/0000' Then
    Begin
      msg('Data de Pagamento Inválida !!!'+cr+cr+DateToStr(dDtaPagto),'A');
      Exit;
    End; // If dDtaPagto<>DtEdt_DtaVencto.Date Then

    If cVlrPagto<0.00 Then
    Begin
      msg('Valores do Pagamento'+cr+'Negativo é Inválido !!'+cr+cr+'R$ '+FormatFloat(',0.00',cVlrPagto),'A');
      Exit;
    End; // If cVlrPagto<>EdtVlrDocto.Value Then

    If cVlrPagto<>EdtVlrDocto.Value Then
    Begin
      If msg('Valores Divergentes !!'+cr+'A Pagar: R$ '+FormatFloat(',0.00',EdtVlrDocto.Value)+cr+
             'Pagamto: R$ '+FormatFloat(',0.00',cVlrPagto)+cr+cr+'O Valor Pago esta Correto ??','C')=2 Then
       Exit;
    End; // If cVlrPagto<>EdtVlrDocto.Value Then

    If dDtaPagto<>DtEdt_DtaVencto.Date Then
    Begin
      If msg('Datas Divergentes !!'+cr+'Vencimento: '+DtEdt_DtaVencto.Text+cr+
             'Pagamento :'+DateToStr(dDtaPagto)+cr+cr+'A Data Pagto esta Correta ??','C')=2 Then
      Exit;
    End; // If dDtaPagto<>DtEdt_DtaVencto.Date Then

    AtualizaPagamento(f_Troca('/','.',f_Troca('-','.',DateToStr(dDtaPagto))), CurrToStr(cVlrPagto));
    EdtCodPessoa.SetFocus;
    EdtCodPessoaExit(Self);
  End; // If bSiga Then

end;

procedure TFrmContasPagar.Rb_APagarClick(Sender: TObject);
begin
  AcertaRb_Style(Rb_APagar);
  AcertaRb_Style(Rb_Pagas);

  Pan_TipoPesquisa.Visible:=False;
  If Rb_Pagas.Checked Then
  Begin
    Rb_PesqDtaVencto.Checked:=True;
    Pan_TipoPesquisa.Visible:=True;
  End;
end;

procedure TFrmContasPagar.Rb_APagarKeyUp(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  Rb_APagarClick(Self);
end;

procedure TFrmContasPagar.Bt_ImprimirClick(Sender: TObject);
Var
  MySql: String;
begin
  // Data Inicio do Periodo=====================================================
  Try
    StrToDate(DtEdt_DtaInicio.Text);
  Except
    msg('Data do Início do Período'+cr+cr+'é Inválida !!','A');
    DtEdt_DtaInicio.SetFocus;
    Exit;
  End;

  // Data Fim do Periodo========================================================
  try
    StrToDate(DtEdt_DtaFim.Text);
  Except
    msg('Data do Fim do Período'+cr+cr+'é Inválida !!','A');
    DtEdt_DtaFim.SetFocus;
    Exit;
  End;

  If DtEdt_DtaInicio.Date>DtEdt_DtaFim.Date Then
  Begin
    msg('Data de Final MENOR'+cr+cr+'Que Data Inicial do Período !!','A');
    DtEdt_DtaInicio.SetFocus;
    Exit;
  End;

  OdirPanApres.Caption:='AGUARDE !! Preparando Relatório de Contas a Pagar...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmContasPagar.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmContasPagar.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmContasPagar;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  MySql:=' SELECT';

         If (Rb_Pagas.Checked) and (Rb_PesqDtaPagto.Checked) Then
          MySql:=
           MySql+' ff.dta_pagamento,'
         Else
          MySql:=
           MySql+' ff.dta_vencimento,';

  MySql:=
   MySql+' ps.des_pessoa nome,'+
         ' ff.dta_emissao,'+
         ' ff.num_docto,'+
         ' hi.des_historico,'+
         ' ff.vlr_original,'+
         ' ff.num_prestacoes,'+
         ' ff.num_prestacao,'+
         ' ff.vlr_prestacao,'+
         ' ff.vlr_pagamento,';

         If (Rb_Pagas.Checked) and (Rb_PesqDtaPagto.Checked) Then
          MySql:=
           MySql+' ff.dta_pagamento'
         Else
          MySql:=
           MySql+' ff.dta_vencimento';

  MySql:=
   MySql+' FROM FLUXO_FINANCEIRO ff, PESSOAS ps, PLANO_CONTAS hi'+

         ' WHERE ff.cod_fornecedor=ps.cod_pessoa'+
         ' AND   ff.cod_historico=hi.cod_historico';

         If (Rb_Pagas.Checked) and (Rb_PesqDtaPagto.Checked) Then
          MySql:=
           MySql+' AND   ff.dta_pagamento BETWEEN '
         Else
          MySql:=
           MySql+' AND   ff.dta_vencimento BETWEEN ';

  MySql:=
   MySql+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaInicio.Date))))+' AND '+
         QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaFim.Date))));

         If Rb_Pagas.Checked Then
          MySql:=
           MySql+' AND   ff.vlr_pagamento>0.00';

         If Rb_APagar.Checked Then
          MySql:=
           MySql+' AND   ff.vlr_pagamento=0.00';

  MySql:=
   MySql+' ORDER BY 1,3';
  DMArtesanalis.CDS_Busca.Close;
  DMArtesanalis.SQLQ_Busca.Close;
  DMArtesanalis.SQLQ_Busca.SQL.Clear;
  DMArtesanalis.SQLQ_Busca.SQL.Add(MySql);
  DMArtesanalis.CDS_Busca.Open;

  If Trim(DMArtesanalis.CDS_Busca.FieldByName('dta_emissao').AsString)='' Then
  Begin
    OdirPanApres.Visible:=False;
    DMArtesanalis.CDS_Busca.Close;
    msg('Sem Doctos a Listar no período Solicitado !!','A');
    Exit;
  End;

  With DMRelatorios.RelVisual do
  Begin
    ClientDataSet:=DMArtesanalis.CDS_Busca;
    Destino:=toVisualiza;
    Orientacao:=toRetrato;

    RodapeGrupo:=True;

    TextoRodape:='';
    TextoRodapeGrupo:='';
    Zoom:=160;

    ImprimirTarjaCinza:=False;
    ImprimirVisto:=False;

    Cabecalho1Esquerda:='LÍXISSE';
    If Rb_APagar.Checked Then Cabecalho1Centro:='CONTAS A PAGAR';
    If Rb_Pagas.Checked Then  Cabecalho1Centro:='CONTAS PAGAS';
    Cabecalho1Direita:='#Data';

    Cabecalho2Esquerda:='Período de '+DateToStr(DtEdt_DtaInicio.Date)+' a '+DateToStr(DtEdt_DtaFim.Date);
    Cabecalho2Centro:=EmptyStr;
    Cabecalho2Direita:=EmptyStr;

    Cabecalho3Esquerda:=EmptyStr;
    Cabecalho3Centro:=EmptyStr;
    Cabecalho3Direita:=EmptyStr;

    DefinicaoCampos.Clear;
    DefinicaoCampos.Add('D0;60;E;;NOME;Nome');
    DefinicaoCampos.Add('D0;18;D;;DTA_EMISSAO;Emissão');
    DefinicaoCampos.Add('D0;14;D;;NUM_DOCTO;Nº Docto');
    DefinicaoCampos.Add('D0;52;E;;DES_HISTORICO;Histórico');
    DefinicaoCampos.Add('D0;17;D;#,##0.00;VLR_ORIGINAL;Vlr Origem');
    DefinicaoCampos.Add('D0;12;C;#,##0;NUM_PRESTACOES;Tot Prest');
    DefinicaoCampos.Add('D0;8;C;#,##0;NUM_PRESTACAO;Nº da Prest');
    DefinicaoCampos.Add('D1;17;D;#,##0.00;VLR_PRESTACAO;Vlr A Pagar');
    DefinicaoCampos.Add('D1;17;D;#,##0.00;VLR_PAGAMENTO;Vlr Pago');

    If (Rb_Pagas.Checked) and (Rb_PesqDtaPagto.Checked) Then
     DefinicaoCampos.Add('D0;18;D;;DTA_PAGAMENTO;Data Pagto')
    Else
     DefinicaoCampos.Add('D0;18;D;;DTA_VENCIMENTO;Data Vencto');

//    DefinicaoCampos.Add('D0;'+v1.Text+';'+a1.Text+';;NOME;Nome');
//    DefinicaoCampos.Add('D0;'+v2.Text+';'+a2.Text+';;DTA_EMISSAO;Emissão');
//    DefinicaoCampos.Add('D0;'+v3.Text+';'+a3.Text+';;NUM_DOCTO;Nº Docto');
//    DefinicaoCampos.Add('D0;'+v4.Text+';'+a4.Text+';;DES_HISTORICO;Histórico');
//    DefinicaoCampos.Add('D0;'+v5.Text+';'+a5.Text+';#,##0.00;VLR_ORIGINAL;Vlr Origem');
//    DefinicaoCampos.Add('D0;'+v6.Text+';'+a6.Text+';#,##0;NUM_PRESTACOES;Nº Parc');
//    DefinicaoCampos.Add('D0;'+v7.Text+';'+a7.Text+';#,##0;NUM_PRESTACAO;Parc');
//    DefinicaoCampos.Add('D1;'+v8.Text+';'+a8.Text+';#,##0.00;VLR_PRESTACAO;Vlr Pagar');
//    DefinicaoCampos.Add('D1;'+v9.Text+';'+a9.Text+';#,##0.00;VLR_PAGAMENTO;Vlr Pago');
//
//    If (Rb_Pagas.Checked) and (Rb_PesqDtaPagto.Checked) Then
//     DefinicaoCampos.Add('D0;'+v10.Text+';'+a10.Text+';;DTA_VENCIMENTO;Data Vencto')
//    Else
//     DefinicaoCampos.Add('D0;'+v10.Text+';'+a10.Text+';;DTA_PAGAMENTO;Data Pagto');

    // Quebra de Grupo
    If (Rb_Pagas.Checked) and (Rb_PesqDtaPagto.Checked) Then
     Begin
       DefinicaoCampos.Add('G1;100;E;;DTA_PAGAMENTO;Data Pagamento');
     End
    Else
     Begin
      DefinicaoCampos.Add('G1;100;E;;DTA_VENCIMENTO;Data Vencimento');
     End;

    OdirPanApres.Visible:=False;
    Execute;
    DMArtesanalis.CDS_Busca.Close;
  End; // With DMRelatorio.RelVisual do

end;

procedure TFrmContasPagar.JvRadioButton1Click(Sender: TObject);
begin
  AcertaRb_Style(Rb_APagar);
  AcertaRb_Style(Rb_Pagas);

end;

procedure TFrmContasPagar.Rb_PesqDtaVenctoClick(Sender: TObject);
begin
  AcertaRb_Style(Rb_PesqDtaPagto);
  AcertaRb_Style(Rb_PesqDtaVencto);

end;

procedure TFrmContasPagar.Rb_PesqDtaVenctoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Rb_PesqDtaVenctoClick(Self);
end;

procedure TFrmContasPagar.Bt_NovoHistoricoClick(Sender: TObject);
begin
  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmSolicitacoes.AbreSolicitacoes(1);

  FrmSolicitacoes.Pan_Principal.Parent:=FrmSolicitacoes.Ts_CP_CadastroHistoticos;
  FrmSolicitacoes.EdtCodCentroCusto.Clear;
  FrmSolicitacoes.EdtCodHistorico.Clear;
  FrmSolicitacoes.Caption:='FINANCEIRO - Contas a Pagar';
  
  FrmSolicitacoes.ShowModal;

  If FrmSolicitacoes.bgProcessado Then
   Begin
     EdtCodHistorico.AsInteger:=StrToInt(FrmSolicitacoes.EdtCodHistorico.Text);
     EdtCodHistoricoExit(Self);
     EdtNumDocto.SetFocus;
   End
  Else
   Begin
     EdtCodHistorico.SetFocus;
   End; // If FrmSolicitacoes.bgProcessado Then

  FreeAndNil(FrmSolicitacoes);

end;

end.


