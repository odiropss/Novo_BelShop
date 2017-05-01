unit UFrmUnidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinsdxStatusBarPainter, StdCtrls, Mask, ToolEdit, CurrEdit,
  JvExControls, JvXPCore, JvXPButtons, ExtCtrls, dxStatusBar, Grids,
  DBGrids, DBXpress;

type
  TFrmUnidades = class(TForm)
    Gb_Unidades: TGroupBox;
    Pan_Unidade: TPanel;
    Gb_UnidadeCodigo: TGroupBox;
    EdtUnidadeCod: TCurrencyEdit;
    Gb_UnidadeDescricao: TGroupBox;
    EdtUnidadeAbrev: TEdit;
    Gb_UnidadeQuantidade: TGroupBox;
    EdtUnidadeQtd: TCurrencyEdit;
    Bt_UnidadeSalvar: TJvXPButton;
    Bt_UnidadeAbandonar: TJvXPButton;
    Bt_UnidadeExcluir: TJvXPButton;
    StB_Unidade: TdxStatusBar;
    Pan_Solicitacoes: TPanel;
    Bt_Fechar: TJvXPButton;
    Dbg_Unidade: TDBGrid;
    OdirPanApres: TPanel;
    procedure Bt_FecharClick(Sender: TObject);
    procedure Dbg_UnidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtUnidadeCodEnter(Sender: TObject);
    procedure EdtUnidadeCodExit(Sender: TObject);
    procedure Bt_UnidadeSalvarClick(Sender: TObject);

    // Odir ====================================================================
    Function  DMLUnidadea(sTipo: String): Boolean;
                       // sTipo:
                       // (IA) Incluir ou Alterar
                       // (EX) Excluir
    // Odir ====================================================================

    procedure Bt_UnidadeAbandonarClick(Sender: TObject);
    procedure Bt_UnidadeExcluirClick(Sender: TObject);
    procedure Dbg_UnidadeDblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUnidades: TFrmUnidades;

  TD: TTransactionDesc;

  bgAlterar,
  bgSairUnidades: Boolean;

  sgMensagem: String;

implementation

uses UDMArtesanalis, DK_Procs1;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Inicio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Manipuação de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmUnidades.DMLUnidadea(sTipo: String): Boolean;
Var
  MySql: String;

  sCodUni, sAbrevUni, sQtdUni: String;
Begin
  // sTipo:
  // (IA) Incluir ou Alterar
  // (EX) Excluir

  Result:=True;
  sgMensagem:='';

  OdirPanApres.Caption:='AGUARDE !! Atualizando Unidade !!';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmUnidades.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmUnidades.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmUnidades;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  sCodUni  :=EdtUnidadeCod.Text;
  If sCodUni='' Then sCodUni:='0';

  sAbrevUni:=EdtUnidadeAbrev.Text;
  sQtdUni  :=EdtUnidadeQtd.Text;

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

     // (IA) Incluir ou Alterar -------------------------------------
     If sTipo='IA' Then
     Begin
       MySql:=' UPDATE OR INSERT INTO UNIDADE (cod_unidade, des_unidade, qtd_unidade)'+
              ' VALUES (';

              If StrToInt(sCodUni)=0 Then
               MySql:=
                MySql+' NULL, '
              Else
               MySql:=
                MySql+sCodUni+', ';

               MySql:=
                MySql+QuotedStr(sAbrevUni)+', '+
                      sQtdUni+')'+
                      ' MATCHING (cod_unidade)';
     End; // If sTipo='IA' Then

     // (EX) Excluir ------------------------------------------------
     If sTipo='EX' Then
     Begin
       MySql:=' DELETE FROM UNIDADE u'+
              ' WHERE  u.cod_unidade='+sCodUni;
     End; // If sTipo='EX' Then

     DMArtesanalis.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ===========================================
    DMArtesanalis.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    // Reabre Unidade -----------------------------------------------
    DMArtesanalis.CDS_Unidade.DisableControls;
    DMArtesanalis.CDS_Unidade.Close;
    DMArtesanalis.CDS_Unidade.Open;
    DMArtesanalis.CDS_Unidade.EnableControls;

    DMArtesanalis.CDS_Unidade.Locate('DES_UNIDADE; QTD_UNIDADE', VarArrayOf([sAbrevUni,sQtdUni]),[]);

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
      sgMensagem:=e.message;

      Result:=False;
    End; // on e : Exception do
  End; // Try da Transação

End; // Manipuação de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Fim >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmUnidades.Bt_FecharClick(Sender: TObject);
begin
  bgSairUnidades:=True;
  Close;
end;

procedure TFrmUnidades.Dbg_UnidadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  s: String;
  i: Integer;
begin
  // Não Permite Excluir Registro Pelo Grid ====================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

  // Localiza Unidade ==========================================================
  If Key=VK_F4 Then
  Begin
    If Not DMArtesanalis.CDS_Unidade.IsEmpty Then
    Begin
      i:=DMArtesanalis.CDS_Unidade.RecNo;

      s:='';
      If InputQuery('Localizar Unidade','',s) then
      Begin
        if Trim(s)<>'' then
        Begin
          Try
            StrToInt(s);
            If Not DMArtesanalis.CDS_Unidade.Locate('COD_UNIDADE',StrToInt(s),[]) Then
            Begin
              DMArtesanalis.CDS_Unidade.RecNo:=i;
              msg('Unidade Não Encontrada !!','A');
            End;
          Except
            s:=AnsiUpperCase(s);
            If Not LocalizaRegistro(DMArtesanalis.CDS_Unidade, 'DES_UNIDADE', s) Then
            Begin
              DMArtesanalis.CDS_Unidade.RecNo:=i;
              msg('Unidade Não Encontrada !!','A');
            End;
          End; // Try
        End; // if Trim(s)<>'' then
      End; // If InputQuery('Localizar Unidade','',s) then
    End; // If Not DMArtesanalis.CDS_Unidade.IsEmpty Then
  End; //If Key=VK_F4 Then
end;

procedure TFrmUnidades.FormShow(Sender: TObject);
begin
  bgSairUnidades:=False;

  EdtUnidadeCod.AsInteger:=0;
  EdtUnidadeAbrev.Clear;
  EdtUnidadeQtd.AsInteger:=0;

  EdtUnidadeCod.SetFocus;

end;

procedure TFrmUnidades.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if Not bgSairUnidades Then
  Begin
    msg('Para Fechar Tecle '+cr+cr+'no Botão <Fechar>...','A');
    Action := caNone;
    Exit;
  End;

  DMArtesanalis.FechaTudo;

end;

procedure TFrmUnidades.EdtUnidadeCodEnter(Sender: TObject);
begin
  Bt_UnidadeAbandonar.Enabled:=True;
  Bt_UnidadeExcluir.Enabled:=True;
  Bt_UnidadeSalvar.Enabled:=True;

  EdtUnidadeCod.Clear;
  EdtUnidadeAbrev.Clear;
  EdtUnidadeQtd.Clear;

  bgAlterar:=False;

end;

procedure TFrmUnidades.EdtUnidadeCodExit(Sender: TObject);
begin
  If EdtUnidadeCod.AsInteger=0 Then
   Exit;

  If DMArtesanalis.CDS_Unidade.Locate('COD_UNIDADE', EdtUnidadeCod.AsInteger,[]) Then
   Begin
     EdtUnidadeAbrev.Text:=DMArtesanalis.CDS_UnidadeDES_UNIDADE.AsString;
     EdtUnidadeQtd.Value :=DMArtesanalis.CDS_UnidadeQTD_UNIDADE.AsInteger;
     bgAlterar:=True;
   End
  Else
   Begin
     msg('Unidade Não Encontrada !!','A');
     bgAlterar:=False;
     EdtUnidadeCod.SetFocus;
   End; // If DMArtesanalis.CDS_Unidade.Locate('COD_UNIDADE', EdtUnidadeCod.AsInteger,[]) Then
end;

procedure TFrmUnidades.Bt_UnidadeSalvarClick(Sender: TObject);
begin
  // Consiste a Abreviatuara da Unidade ========================================
  If Trim(EdtUnidadeAbrev.Text)='' Then
  Begin
    msg('Favor Informar a'+cr+cr+'Abreviatira da Unidade !!','A');
    EdtUnidadeAbrev.SetFocus;
    Exit;
  End;

  // Consiste a Quantidade da Unidade ==========================================
  If EdtUnidadeQtd.AsInteger=0 Then
  Begin
    msg('Favor Informar a'+cr+cr+'Quantidade da Unidade !!','A');
    EdtUnidadeQtd.SetFocus;
    Exit;
  End;

  // Verifica a Existencia da Unidade ==========================================
  If (DMArtesanalis.CDS_Unidade.Locate('DES_UNIDADE', EdtUnidadeAbrev.Text,[])) And (Not bgAlterar) Then
  Begin
    If EdtUnidadeQtd.AsInteger=DMArtesanalis.CDS_UnidadeQTD_UNIDADE.AsInteger Then
    Begin
      msg('Unidade Já Cadastra!!','A');
      EdtUnidadeCod.SetFocus;
      Exit;
    End;
  End;

  // Executa DML ===============================================================
  If not DMLUnidadea('IA') Then
   MessageBox(Handle, pChar('Erro ao Incluir/Altera a Unidade !!'+#13+sgMensagem), 'ATENÇÃO !!', MB_ICONERROR);

  EdtUnidadeCodEnter(Self);
  EdtUnidadeCod.SetFocus;

end;

procedure TFrmUnidades.Bt_UnidadeAbandonarClick(Sender: TObject);
begin
  EdtUnidadeCodEnter(Self);
  EdtUnidadeCod.SetFocus;

end;

procedure TFrmUnidades.Bt_UnidadeExcluirClick(Sender: TObject);
Var
  MySql: String;
begin
  If DMArtesanalis.CDS_Unidade.IsEmpty Then
   Exit;

  If EdtUnidadeCod.AsInteger=0 Then
  Begin
    msg('Favor Selecinar'+cr+cr+'A Unidade a Excluir !!','A');
    EdtUnidadeCod.SetFocus;
    Exit;
  End; // If EdtUnidadeCod.AsInteger=0 Then

  If msg('Deseja Realmente Excluir a'+cr+'Unidade Selecionada ??','C')=2 Then
  Begin
    EdtUnidadeCod.SetFocus;
    Exit;
  End;

  // Consiste Exclusão =========================================================
  sgMensagem:='';
  MySql:=' SELECT pr.Des_Produto'+
         ' FROM PRODUTO pr'+
         ' WHERE pr.cod_unidade='+EdtUnidadeCod.Text;
  DMArtesanalis.CDS_Busca.Close;
  DMArtesanalis.SQLQ_Busca.SQL.Clear;
  DMArtesanalis.SQLQ_Busca.SQL.Add(MySql);
  DMArtesanalis.CDS_Busca.Open;
  If Trim(DMArtesanalis.CDS_Busca.FieldByName('Des_Produto').AsString)<>'' Then
   sgMensagem:=Trim(DMArtesanalis.CDS_Busca.FieldByName('Des_Produto').AsString);
  DMArtesanalis.CDS_Busca.Close;

  If Trim(sgMensagem)<>'' Then
  Begin
    MessageBox(Handle, pChar('Impossível Excluir !!'+cr+cr+'Unidade Já Utilizada no Produto:'+cr+sgMensagem), 'Erro', MB_ICONERROR);
    EdtUnidadeCod.SetFocus;
    Exit;
  End; // If Trim(sgMensagem)<>'' Then

  // Executa DML ===============================================================
  If not DMLUnidadea('EX') Then
   MessageBox(Handle, pChar('Erro ao Excluir a Unidade !!'+#13+sgMensagem), 'ATENÇÃO !!', MB_ICONERROR);

  EdtUnidadeCodEnter(Self);
  EdtUnidadeCod.SetFocus;
end;

procedure TFrmUnidades.Dbg_UnidadeDblClick(Sender: TObject);
Begin
  bgAlterar:=True;

  If DMArtesanalis.CDS_Unidade.IsEmpty Then
   Exit;

  EdtUnidadeCod.AsInteger:=DMArtesanalis.CDS_UnidadeCOD_UNIDADE.AsInteger;
  EdtUnidadeAbrev.Text   :=DMArtesanalis.CDS_UnidadeDES_UNIDADE.AsString;
  EdtUnidadeQtd.AsInteger:=DMArtesanalis.CDS_UnidadeQTD_UNIDADE.AsInteger;
  EdtUnidadeAbrev.SetFocus;
end;

procedure TFrmUnidades.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;
end;

end.
