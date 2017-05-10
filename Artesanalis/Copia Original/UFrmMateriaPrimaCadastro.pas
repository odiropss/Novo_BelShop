unit UFrmMateriaPrimaCadastro;

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
  dxSkinsdxStatusBarPainter, dxStatusBar, Grids, DBGrids, JvExControls,
  JvXPCore, JvXPButtons, StdCtrls, Mask, ToolEdit, CurrEdit, ExtCtrls, DBXpress;

type
  TFrmMateriaPrimaCadastro = class(TForm)
    Gb_Principal: TGroupBox;
    Pan_MateriaPrimaSolic: TPanel;
    Gb_MateriaPrimaCod: TGroupBox;
    EdtMateriaPrimaCod: TCurrencyEdit;
    Gb_MateriaPrimaDesc: TGroupBox;
    EdtMateriaPrimaDesc: TEdit;
    Gb_MateriaPrimaQtdConv: TGroupBox;
    EdtMateriaPrimaQtdConv: TCurrencyEdit;
    Bt_MateriaPrimaSalvar: TJvXPButton;
    Bt_MateriaPrimaAbandonar: TJvXPButton;
    Bt_MateriaPrimaExcluir: TJvXPButton;
    Gb_MateriaPrimaVlrUnit: TGroupBox;
    EdtMateriaPrimaVlrUnit: TCurrencyEdit;
    Pan_MateriaPrima: TPanel;
    Dbg_MateriaPrima: TDBGrid;
    Pan_Solicitacoes: TPanel;
    Bt_Fechar: TJvXPButton;
    StB_MateriaPrima: TdxStatusBar;
    OdirPanApres: TPanel;
    procedure FormShow(Sender: TObject);
    procedure Bt_FecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtMateriaPrimaCodEnter(Sender: TObject);
    procedure EdtMateriaPrimaCodExit(Sender: TObject);
    procedure Bt_MateriaPrimaAbandonarClick(Sender: TObject);
    procedure Dbg_MateriaPrimaDblClick(Sender: TObject);
    procedure Bt_MateriaPrimaSalvarClick(Sender: TObject);

    // Odir ====================================================================
    Function  DMLMateriaPrima(sTipo: String): Boolean;
                           // sTipo:
                           // (IA) Incluir ou Alterar
                           // (EX) Excluir

    // Odir ====================================================================

    procedure Bt_MateriaPrimaExcluirClick(Sender: TObject);
    procedure Dbg_MateriaPrimaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Dbg_MateriaPrimaEnter(Sender: TObject);
    procedure Dbg_MateriaPrimaExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMateriaPrimaCadastro: TFrmMateriaPrimaCadastro;

  TD: TTransactionDesc;

  bgAlterar,
  bgSairMateria: Boolean;

  sgMensagem: String;

implementation

uses UDMArtesanalis, DK_Procs1;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Inicio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Manipua��o de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmMateriaPrimaCadastro.DMLMateriaPrima(sTipo: String): Boolean;
Var
  MySql: String;

  sCodMat, sDescMat, sQtdMat, sVlrUMat: String;
Begin
  // sTipo:
  // (IA) Incluir ou Alterar
  // (EX) Excluir

  Result:=True;
  sgMensagem:='';

  OdirPanApres.Caption:='AGUARDE !! Atualizando Mat�ria-Prima !!';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmMateriaPrimaCadastro.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmMateriaPrimaCadastro.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmMateriaPrimaCadastro;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  sCodMat  :=EdtMateriaPrimaCod.Text;
  If sCodMat='' Then sCodMat:='0';

  sDescMat:=EdtMateriaPrimaDesc.Text;
  sQtdMat :=EdtMateriaPrimaQtdConv.Text;
  sVlrUMat:=EdtMateriaPrimaVlrUnit.Text;

  // Verifica se Transa��o esta Ativa
  If DMArtesanalis.SQLC.InTransaction Then
   DMArtesanalis.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMArtesanalis.SQLC.StartTransaction(TD);
  Try // Try da Transa��o
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    // (IA) Incluir ou Alterar -------------------------------------
    If sTipo='IA' Then
    Begin
      MySql:=' UPDATE OR INSERT INTO MATERIAPRIMA'+
             ' (COD_MATERIAPRIMA, DES_MATERIAPRIMA, QTD_CONVERSAO, VLR_UNITATIO)'+
             ' VALUES (';

             If StrToInt(sCodMat)=0 Then
              MySql:=
               MySql+' NULL, '
             Else
              MySql:=
               MySql+sCodMat+', ';

              MySql:=
               MySql+QuotedStr(sDescMat)+', '+
                     sQtdMat+', '+
                     QuotedStr(f_Troca(',','.',sVlrUMat))+')'+
                     ' MATCHING (COD_MATERIAPRIMA)';
    End; // If sTipo='IA' Then

    // (EX) Excluir ------------------------------------------------
    If sTipo='EX' Then
    Begin
      MySql:=' DELETE FROM MATERIAPRIMA ma'+
             ' WHERE  ma.cod_materiaprima='+sCodMat;
    End; // If sTipo='EX' Then

    DMArtesanalis.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ===========================================
    DMArtesanalis.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    // Reabre Unidade -----------------------------------------------
    DMArtesanalis.CDS_MateriaPrima.DisableControls;
    DMArtesanalis.CDS_MateriaPrima.Close;
    DMArtesanalis.CDS_MateriaPrima.Open;
    DMArtesanalis.CDS_MateriaPrima.EnableControls;

    DMArtesanalis.CDS_MateriaPrima.Locate('DES_MATERIAPRIMA', sDescMat,[]);

    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;

  Except // Except da Transa��o
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
  End; // Try da Transa��o
End; // Manipua��o de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Fim >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmMateriaPrimaCadastro.FormShow(Sender: TObject);
begin
  bgSairMateria:=False;

  EdtMateriaPrimaCod.AsInteger:=0;
  EdtMateriaPrimaDesc.Clear;
  EdtMateriaPrimaQtdConv.AsInteger:=0;
  EdtMateriaPrimaVlrUnit.Value:=0.00;

  EdtMateriaPrimaCod.SetFocus;
end;

procedure TFrmMateriaPrimaCadastro.Bt_FecharClick(Sender: TObject);
begin
  bgSairMateria:=True;

  Close;
end;

procedure TFrmMateriaPrimaCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Not bgSairMateria Then
  Begin
    msg('Para Fechar Tecle '+cr+cr+'no Bot�o <Fechar>...','A');
    Action := caNone;
    Exit;
  End;

  DMArtesanalis.CDS_MateriaPrima.Close;

  // Permite Sair do Sistema ===================================================
  DMArtesanalis.MemoRetiraNomeForm('Cadastro de Mat�ria-Prima');
end;

procedure TFrmMateriaPrimaCadastro.EdtMateriaPrimaCodEnter(Sender: TObject);
begin
  Bt_MateriaPrimaAbandonar.Enabled:=True;
  Bt_MateriaPrimaExcluir.Enabled:=True;
  Bt_MateriaPrimaSalvar.Enabled:=True;

  EdtMateriaPrimaCod.Clear;
  EdtMateriaPrimaDesc.Clear;
  EdtMateriaPrimaQtdConv.Clear;
  EdtMateriaPrimaVlrUnit.Clear;

  bgAlterar:=False;
end;

procedure TFrmMateriaPrimaCadastro.EdtMateriaPrimaCodExit(Sender: TObject);
begin
  If EdtMateriaPrimaCod.AsInteger=0 Then
   Exit;

  If DMArtesanalis.CDS_MateriaPrima.Locate('COD_MATERIAPRIMA', EdtMateriaPrimaCod.AsInteger,[]) Then
   Begin
     EdtMateriaPrimaDesc.Text    :=DMArtesanalis.CDS_MateriaPrimaDES_MATERIAPRIMA.AsString;
     EdtMateriaPrimaQtdConv.Value:=DMArtesanalis.CDS_MateriaPrimaQTD_CONVERSAO.AsInteger;
     EdtMateriaPrimaVlrUnit.Value:=DMArtesanalis.CDS_MateriaPrimaVLR_UNITATIO.AsInteger;
     bgAlterar:=True;
   End
  Else
   Begin
     msg('Mat�ria-Prima N�o Encontrada !!','A');
     bgAlterar:=False;
     EdtMateriaPrimaCod.SetFocus;
   End; // If DMArtesanalis.CDS_MateriaPrima.Locate('COD_MATERIAPRIMA', EdtMateriaPrimaCod.AsInteger,[]) Then
end;

procedure TFrmMateriaPrimaCadastro.Bt_MateriaPrimaAbandonarClick(Sender: TObject);
begin
  EdtMateriaPrimaCodEnter(Self);
  EdtMateriaPrimaCod.SetFocus;
end;

procedure TFrmMateriaPrimaCadastro.Dbg_MateriaPrimaDblClick(Sender: TObject);
begin
  If DMArtesanalis.CDS_MateriaPrima.IsEmpty Then
   Exit;

  EdtMateriaPrimaCod.AsInteger    :=DMArtesanalis.CDS_MateriaPrimaCOD_MATERIAPRIMA.AsInteger;
  EdtMateriaPrimaDesc.Text        :=DMArtesanalis.CDS_MateriaPrimaDES_MATERIAPRIMA.AsString;
  EdtMateriaPrimaQtdConv.AsInteger:=DMArtesanalis.CDS_MateriaPrimaQTD_CONVERSAO.AsInteger;
  EdtMateriaPrimaVlrUnit.Value    :=DMArtesanalis.CDS_MateriaPrimaVLR_UNITATIO.AsCurrency;
  EdtMateriaPrimaDesc.SetFocus;
end;

procedure TFrmMateriaPrimaCadastro.Bt_MateriaPrimaSalvarClick(Sender: TObject);
begin
  // Consiste a Descri��o da Mat�ria-Prima =====================================
  If Trim(EdtMateriaPrimaDesc.Text)='' Then
  Begin
    msg('Favor Informar a'+cr+cr+'Descri��o da Mat�ria-Prima !!','A');
    EdtMateriaPrimaDesc.SetFocus;
    Exit;
  End;

  // Consiste a Quantidade de Convers�o ========================================
  If EdtMateriaPrimaQtdConv.AsInteger=0 Then
  Begin
    msg('Favor Informar a'+cr+cr+'Quantidade de Convers�o !!','A');
    EdtMateriaPrimaQtdConv.SetFocus;
    Exit;
  End;

  // Consiste o Valor Unit�rio =================================================
  If EdtMateriaPrimaVlrUnit.AsInteger=0 Then
  Begin
    msg('Favor Informar o'+cr+cr+'Valor Unit�rio !!','A');
    EdtMateriaPrimaVlrUnit.SetFocus;
    Exit;
  End;

  // Executa DML ===============================================================
  If not DMLMateriaPrima('IA') Then
   MessageBox(Handle, pChar('Erro ao Incluir/Altera a Mat�ria-Prima !!'+#13+sgMensagem), 'ATEN��O !!', MB_ICONERROR);

  EdtMateriaPrimaCodEnter(Self);
  EdtMateriaPrimaCod.SetFocus;
end;

procedure TFrmMateriaPrimaCadastro.Bt_MateriaPrimaExcluirClick(Sender: TObject);
Var
  MySql: String;
begin
  If (DMArtesanalis.CDS_MateriaPrima.IsEmpty) or (EdtMateriaPrimaCod.AsInteger=0) Then
   Exit;

  If EdtMateriaPrimaCod.AsInteger=0 Then
  Begin
    msg('Favor Selecinar'+cr+cr+'A Mat�ria-Prima a Excluir !!','A');
    EdtMateriaPrimaCod.SetFocus;
    Exit;
  End; // If EdtUnidadeCod.AsInteger=0 Then

  If msg('Deseja Realmente Excluir a'+cr+'Mat�ria-Prima Selecionada ??','C')=2 Then
  Begin
    EdtMateriaPrimaCod.SetFocus;
    Exit;
  End;

  // Consiste Exclus�o =========================================================
  sgMensagem:='';
  MySql:=' SELECT p.Cod_MateriaPrima'+
         ' FROM PRODUCAO p'+
         ' WHERE p.cod_materiaprima='+EdtMateriaPrimaCod.Text;
  DMArtesanalis.CDS_Busca.Close;
  DMArtesanalis.SQLQ_Busca.SQL.Clear;
  DMArtesanalis.SQLQ_Busca.SQL.Add(MySql);
  DMArtesanalis.CDS_Busca.Open;
  If Trim(DMArtesanalis.CDS_Busca.FieldByName('Cod_MateriaPrima').AsString)<>'' Then
   sgMensagem:='PRODU��O';
  DMArtesanalis.CDS_Busca.Close;

  If Trim(sgMensagem)<>'' Then
  Begin
    MessageBox(Handle, pChar('Imposs�vel Excluir !!'+cr+'Mat�ria-Prima J� Utilizada em:'+cr+cr+sgMensagem), 'Erro', MB_ICONERROR);
    EdtMateriaPrimaCod.SetFocus;
    Exit;
  End; // If Trim(sgMensagem)<>'' Then

  // Executa DML ===============================================================
  If not DMLMateriaPrima('EX') Then
   MessageBox(Handle, pChar('Erro ao Excluir a Mat�ria-Prima !!'+#13+sgMensagem), 'ATEN��O !!', MB_ICONERROR);

  EdtMateriaPrimaCodEnter(Self);
  EdtMateriaPrimaCod.SetFocus;
end;

procedure TFrmMateriaPrimaCadastro.Dbg_MateriaPrimaKeyDown(Sender: TObject;var Key: Word; Shift: TShiftState);
Var
  s: String;
  i: Integer;
begin
  // N�o Permite Excluir Registro Pelo Grid ====================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

  // Localiza Materia-Prima ====================================================
  If Key=VK_F4 Then
  Begin
    If Not DMArtesanalis.CDS_MateriaPrima.IsEmpty Then
    Begin
      i:=DMArtesanalis.CDS_MateriaPrima.RecNo;

      s:='';
      If InputQuery('Localizar Mat�ria-Prima','',s) then
      Begin
        if Trim(s)<>'' then
        Begin
          Try
            StrToInt(s);
            If Not DMArtesanalis.CDS_MateriaPrima.Locate('COD_MATERIAPRIMA',StrToInt(s),[]) Then
            Begin
              DMArtesanalis.CDS_MateriaPrima.RecNo:=i;
              msg('Mat�ria-Prima N�o Encontrada !!','A');
            End;
          Except
            s:=AnsiUpperCase(s);
            If Not LocalizaRegistro(DMArtesanalis.CDS_MateriaPrima, 'DES_MATERIAPRIMA', s) Then
            Begin
              DMArtesanalis.CDS_MateriaPrima.RecNo:=i;
              msg('Mat�ria-Prima N�o Encontrada !!','A');
            End;
          End; // Try
        End; // if Trim(s)<>'' then
      End; // If InputQuery('Localizar Mat�ria-Prima','',s) then
    End; // If Not DMArtesanalis.CDS_MateriaPrima.IsEmpty Then
  End; //If Key=VK_F4 Then
end;

procedure TFrmMateriaPrimaCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;
end;

procedure TFrmMateriaPrimaCadastro.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

end;

procedure TFrmMateriaPrimaCadastro.Dbg_MateriaPrimaEnter(Sender: TObject);
begin
  (Sender as TDBGrid).Color:=clMoneyGreen;
end;

procedure TFrmMateriaPrimaCadastro.Dbg_MateriaPrimaExit(Sender: TObject);
begin
  (Sender as TDBGrid).Color:=clWindow;
end;

end.
