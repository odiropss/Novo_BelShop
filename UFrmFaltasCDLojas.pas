unit UFrmFaltasCDLojas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, JvExControls, JvXPCore, JvXPButtons,
  StdCtrls, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  Mask, ToolEdit, CurrEdit, CheckLst, RXCtrls, DBGridJul, JvXPCheckCtrls;

type
  TFrmFaltasCDLojas = class(TForm)
    Pan_FaltasCDLojasOpcoes: TPanel;
    Bt_FaltasCDLojasFechar: TJvXPButton;
    Pan_FaltasCDLojas: TPanel;
    Pan_FaltasCDLojasLojas: TPanel;
    Label3: TLabel;
    DtEdt_FaltasCDLojasDtaInicio: TcxDateEdit;
    Label2: TLabel;
    DtEdt_FaltasCDLojasDtaFim: TcxDateEdit;
    Bt_FaltasCDLojasBuscaProdutos: TJvXPButton;
    Cbx_FaltasCDLojasSitProd: TComboBox;
    Label4: TLabel;
    Clbx_FaltasCDLojasLojas: TRxCheckListBox;
    PC_FaltasCDLojas: TPageControl;
    Ts_FaltasCDLojasForn: TTabSheet;
    Ts_FaltasCDLojasMovtos: TTabSheet;
    Dbg_FaltasCDLojas: TDBGrid;
    Gb_FiltroFornecedor: TGroupBox;
    Label188: TLabel;
    EdtFiltroCodForn: TCurrencyEdit;
    Bt_FiltroBuscaForn: TJvXPButton;
    Dbg_FiltroFornecedores: TDBGridJul;
    Bt_FaltasCDLojasSalvaExcel: TJvXPButton;
    Bt_FaltasCDLojasClipboard: TJvXPButton;
    Gb_CalculoCurvaABC: TGroupBox;
    Ckb_CalculoCurvaTodas: TJvXPCheckbox;
    Ckb_CalculoCurvaA: TJvXPCheckbox;
    Ckb_CalculoCurvaB: TJvXPCheckbox;
    Ckb_CalculoCurvaC: TJvXPCheckbox;
    Ckb_CalculoCurvaD: TJvXPCheckbox;
    Ckb_CalculoCurvaE: TJvXPCheckbox;
    OdirPanApres: TPanel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_FaltasCDLojasFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Clbx_FaltasCDLojasLojasClick(Sender: TObject);
    procedure Bt_FaltasCDLojasBuscaProdutosClick(Sender: TObject);
    procedure DtEdt_FaltasCDLojasDtaInicioEditing(Sender: TObject;
      var CanEdit: Boolean);
    procedure PC_FaltasCDLojasChange(Sender: TObject);
    procedure EdtFiltroCodFornExit(Sender: TObject);
    procedure Bt_FiltroBuscaFornClick(Sender: TObject);

    // Odir
    Function ConsistePeriodo: Boolean;
    procedure Ckb_CalculoCurvaTodasClick(Sender: TObject);
    procedure Ckb_CalculoCurvaTodasKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ckb_CalculoCurvaAClick(Sender: TObject);
    procedure Ckb_CalculoCurvaAKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    // Odir

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFaltasCDLojas: TFrmFaltasCDLojas;

implementation

uses UDMBelShop, UFrmBelShop, DK_Procs1, UDMVirtual, UPesquisa;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Consiste Período >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmFaltasCDLojas.ConsistePeriodo: Boolean;
Begin
  Result:=False;

  // Verifica Período ==========================================================
  If (Trim(DtEdt_FaltasCDLojasDtaInicio.Text)<>'') Or (Trim(DtEdt_FaltasCDLojasDtaFim.Text)<>'') Then
  Begin
    Try
      StrToDate(DtEdt_FaltasCDLojasDtaInicio.Text);
    Except
      msg('Data Inicial do Período Inválida !!','A');
      DtEdt_FaltasCDLojasDtaInicio.SetFocus;
      Exit;
    End;

    Try
      StrToDate(DtEdt_FaltasCDLojasDtaFim.Text);
    Except
      msg('Data Final do Período Inválida !!','A');
      DtEdt_FaltasCDLojasDtaFim.SetFocus;
      Exit;
    End;

    If DtEdt_FaltasCDLojasDtaFim.Date<DtEdt_FaltasCDLojasDtaInicio.Date Then
    Begin
      msg('Período Inválido !!','A');
      DtEdt_FaltasCDLojasDtaInicio.SetFocus;
      Exit;
    End;
  End
  Else // If (Trim(DtEdt_FaltasCDLojasDtaInicio.Text)<>'') Or (Trim(DtEdt_FaltasCDLojasDtaFim.Text)<>'') Then
  Begin
    msg('Período Inválido !!','A');
    DtEdt_FaltasCDLojasDtaInicio.SetFocus;
    Exit;
  End; // If (Trim(DtEdt_FaltasCDLojasDtaInicio.Text)<>'') Or (Trim(DtEdt_FaltasCDLojasDtaFim.Text)<>'') Then

  Result:=True;
End; // Consiste Período >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmFaltasCDLojas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FrmBelShop.FechaTudo;
end;

procedure TFrmFaltasCDLojas.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Não Permite Movimentar o Formulário =======================================
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

end;

procedure TFrmFaltasCDLojas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmFaltasCDLojas.Bt_FaltasCDLojasFecharClick(Sender: TObject);
begin
  DMBelShop.CDS_FaltasCDLojas.Close;

  DMVirtual.CDS_V_Fornecedores.Close;
  Clbx_FaltasCDLojasLojas.Items.Clear;

  Close;
end;

procedure TFrmFaltasCDLojas.FormShow(Sender: TObject);
begin
  // Coloca BitMaps em Componentes =============================================
  BitMaps(FrmFaltasCDLojas);

  DtEdt_FaltasCDLojasDtaInicio.SetFocus;
end;

procedure TFrmFaltasCDLojas.Clbx_FaltasCDLojasLojasClick(Sender: TObject);
Var
  ii, i: Integer;
  bSelect, bNotSelect: Boolean;
begin
  sgCodLojas:='';
  bSelect:=False;
  bNotSelect:=False;
  for i:=0 to Clbx_FaltasCDLojasLojas.Items.Count - 1 do
  Begin
    if Clbx_FaltasCDLojasLojas.Checked[i] Then
    Begin
      bSelect:=True;
      ii:=pos('-',Clbx_FaltasCDLojasLojas.Items[i]);

      If sgCodLojas<>'' Then
       sgCodLojas:=sgCodLojas+', '+QuotedStr(Trim(Copy(Clbx_FaltasCDLojasLojas.Items[i],1,ii-1)));

      If sgCodLojas='' Then
       sgCodLojas:=sgCodLojas+(Trim(Copy(Clbx_FaltasCDLojasLojas.Items[i],1,ii-1)));
    End; // if Clbx_FaltasCDLojasLojas.Checked[i] Then

    if Not Clbx_FaltasCDLojasLojas.Checked[i] Then
     bNotSelect:=True;
  End; // for i:=0 to Clbx_FaltasCDLojasLojas.Count - 1 do

  If bNotSelect<>bSelect Then
   sgCodLojas:='';

  If (bNotSelect) and ( Not bSelect) Then
  Begin
    // Coloca Todos Como Selecionados -------------------------------
    For i:=0 to Clbx_FaltasCDLojasLojas.Items.Count-1 do
     Clbx_FaltasCDLojasLojas.Checked[i]:=True;
  End;

  DMBelShop.CDS_FaltasCDLojas.Close;
  PC_FaltasCDLojas.ActivePage:=Ts_FaltasCDLojasForn;
  PC_FaltasCDLojasChange(Self);

end;

procedure TFrmFaltasCDLojas.Bt_FaltasCDLojasBuscaProdutosClick(Sender: TObject);
Var
  MySql: String;
  i: Integer;
begin
  If Not ConsistePeriodo Then
  Begin
    Exit;
  End;

  OdirPanApres.Caption:='AGUARDE !! Localizando Produtos Não Repostos...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmFaltasCDLojas.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmFaltasCDLojas.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Visible:=True;
  Refresh;

  Screen.Cursor:=crAppStart;

  DMBelShop.CDS_FaltasCDLojas.Close;

  // Monta Curvas ==============================================================
  sgCurvas:='';
  If Ckb_CalculoCurvaA.Checked Then
   sgCurvas:=QuotedStr('A');

  If Ckb_CalculoCurvaB.Checked Then
  Begin
    If sgCurvas='' Then
     sgCurvas:=QuotedStr('B')
    Else
     sgCurvas:=sgCurvas+', '+QuotedStr('B');
  End;

  If Ckb_CalculoCurvaC.Checked Then
  Begin
    If sgCurvas='' Then
     sgCurvas:=QuotedStr('C')
    Else
     sgCurvas:=sgCurvas+', '+QuotedStr('C');
  End;

  If Ckb_CalculoCurvaD.Checked Then
  Begin
    If sgCurvas='' Then
     sgCurvas:=QuotedStr('D')
    Else
     sgCurvas:=sgCurvas+', '+QuotedStr('D');
  End;

  If Ckb_CalculoCurvaE.Checked Then
  Begin
    If sgCurvas='' Then
     sgCurvas:=QuotedStr('E')
    Else
     sgCurvas:=sgCurvas+', '+QuotedStr('E');
  End;

  sgDtaInicio:=f_Troca('/','.',f_Troca('-','.',DtEdt_FaltasCDLojasDtaInicio.Text));
  sgDtaFim:=f_Troca('/','.',f_Troca('-','.',DtEdt_FaltasCDLojasDtaFim.Text));

  If Clbx_FaltasCDLojasLojas.Items.Count<1 Then
  Begin
    //==========================================================================
    // Busca Lojas =============================================================
    //==========================================================================
    MySql:=' SELECT'+
           ' DISTINCT se.cod_loja||''-''||em.razao_social Loja'+
           ' FROM ES_ESTOQUES_SEM se, EMP_CONEXOES em, PRODUTO pr'+
           ' WHERE se.cod_loja=em.cod_filial'+
           ' AND   se.cod_produto=pr.codproduto'+
           ' AND   se.dta_movto Between '+QuotedStr(sgDtaInicio)+' AND '+QuotedStr(sgDtaFim)+
           ' AND   se.ind_curva IS NOT NULL';

           If Trim(sgCurvas)<>'' Then
            MySql:=
             MySql+' AND se.Ind_Curva in ('+sgCurvas+')';

           If Trim(sgCodLojas)<>'' Then
            MySql:=
             MySql+' AND se.Cod_Loja in ('+sgCodLojas+')';

           If Cbx_FaltasCDLojasSitProd.ItemIndex=0 Then
            MySql:=
             MySql+' AND Coalesce(pr.situacaopro,0)=0';

           If Cbx_FaltasCDLojasSitProd.ItemIndex=1 Then
            MySql:=
             MySql+' AND Coalesce(pr.situacaopro,0)=3';

           If Cbx_FaltasCDLojasSitProd.ItemIndex=2 Then
            MySql:=
             MySql+' AND Coalesce(p.situacaopro,0) in (0,3)';

    MySql:=
     MySql+' ORDER BY 1';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    sgCodLojas:='';

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Loja').AsString)='' Then
    Begin
      msg('Sem Movimentos no Período Solicitado !!', 'A');
      Screen.Cursor:=crDefault;
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;

    // Adiciona Lojas -----------------------------------------------
    Clbx_FaltasCDLojasLojas.Items.Clear;

    DMBelShop.CDS_BuscaRapida.First;
    DMBelShop.CDS_BuscaRapida.DisableControls;
    While Not DMBelShop.CDS_BuscaRapida.Eof do
    Begin
      Clbx_FaltasCDLojasLojas.Items.Add(Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Loja').AsString));

      DMBelShop.CDS_BuscaRapida.Next;
    End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
    DMBelShop.CDS_BuscaRapida.EnableControls;
    DMBelShop.CDS_BuscaRapida.Close;

    // Coloca Todos Como Selecionados -------------------------------
    For i:=0 to Clbx_FaltasCDLojasLojas.Items.Count-1 do
     Clbx_FaltasCDLojasLojas.Checked[i]:=True;
  End; // If Clbx_FaltasCDLojasLojas.Items.Count<1 Then


  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;
end;

procedure TFrmFaltasCDLojas.DtEdt_FaltasCDLojasDtaInicioEditing(Sender: TObject; var CanEdit: Boolean);
begin
  DMBelShop.CDS_FaltasCDLojas.Close;

  Clbx_FaltasCDLojasLojas.Items.Clear;

end;

procedure TFrmFaltasCDLojas.PC_FaltasCDLojasChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_FaltasCDLojas);

  Bt_FaltasCDLojasBuscaProdutos.Visible:=False;
  Bt_FaltasCDLojasSalvaExcel.Visible:=False;
  Bt_FaltasCDLojasClipboard.Visible:=False;

  If (PC_FaltasCDLojas.ActivePage=Ts_FaltasCDLojasForn) and (Ts_FaltasCDLojasForn.CanFocus) Then
  Begin
    Bt_FaltasCDLojasBuscaProdutos.Visible:=True;
    EdtFiltroCodForn.SetFocus;
  End;

  If (PC_FaltasCDLojas.ActivePage=Ts_FaltasCDLojasMovtos) and (Ts_FaltasCDLojasMovtos.CanFocus) Then
  Begin
    Bt_FaltasCDLojasSalvaExcel.Visible:=True;
    Bt_FaltasCDLojasClipboard.Visible:=True;
    Dbg_FaltasCDLojas.SetFocus;
  End;

end;

procedure TFrmFaltasCDLojas.EdtFiltroCodFornExit(Sender: TObject);
Var
  MySql: String;
begin

  If EdtFiltroCodForn.AsInteger<>0 Then
  Begin
    If Clbx_FaltasCDLojasLojas.Items.Count<1 Then
    Begin
      msg('Favor Buscar os Produtos Primeiro !!', 'A');
      EdtFiltroCodForn.Value:=0;
      EdtFiltroCodForn.SetFocus;
      Exit;
    End;

    Screen.Cursor:=crAppStart;
    DMBelShop.CDS_FaltasCDLojas.Close;

    // Busca Fornecedor ========================================================
    MySql:=' SELECT'+
           ' DISTINCT pr.nomefornecedor, pr.principalfor'+
           ' FROM ES_ESTOQUES_SEM se, PRODUTO pr'+
           ' WHERE se.cod_produto=pr.codproduto'+
           ' AND   se.dta_movto Between '+QuotedStr(sgDtaInicio)+' AND '+QuotedStr(sgDtaFim)+
           ' AND   se.ind_curva IS NOT NULL'+
           ' AND   pr.principalfor='+QuotedStr(FormatFloat('000000',EdtFiltroCodForn.AsInteger));

           If Trim(sgCurvas)<>'' Then
            MySql:=
             MySql+' AND se.Ind_Curva in ('+sgCurvas+')';

           If Trim(sgCodLojas)<>'' Then
            MySql:=
             MySql+' AND se.Cod_Loja in ('+sgCodLojas+')';;

           If Cbx_FaltasCDLojasSitProd.ItemIndex=0 Then
            MySql:=
             MySql+' AND Coalesce(pr.situacaopro,0)=0';

           If Cbx_FaltasCDLojasSitProd.ItemIndex=1 Then
            MySql:=
             MySql+' AND Coalesce(pr.situacaopro,0)=3';

           If Cbx_FaltasCDLojasSitProd.ItemIndex=2 Then
            MySql:=
             MySql+' AND Coalesce(p.situacaopro,0) in (0,3)';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('NomeFornecedor').AsString)='' Then
    Begin
      msg('Fornecedor NÃO Encontrado !!!', 'A');
      Screen.Cursor:=crDefault;
      EdtFiltroCodForn.Clear;
      EdtFiltroCodForn.SetFocus;
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;

    If DMVirtual.CDS_V_Fornecedores.Locate('Cod_Fornecedor',DMBelShop.CDS_BuscaRapida.FieldByName('principalfor').AsString,[]) Then
    Begin
      Begin
        msg('Fornecedor Já Informado !!','A');
        Screen.Cursor:=crDefault;
        EdtFiltroCodForn.Clear;
        EdtFiltroCodForn.SetFocus;
        DMBelShop.CDS_BuscaRapida.Close;
        Exit;
      End;
    End;

    DMVirtual.CDS_V_Fornecedores.Insert;
    DMVirtual.CDS_V_FornecedoresCod_Fornecedor.AsString:=
                 DMBelShop.CDS_BuscaRapida.FieldByName('principalfor').AsString;
    DMVirtual.CDS_V_FornecedoresDes_Fornecedor.AsString:=
               DMBelShop.CDS_BuscaRapida.FieldByName('NomeFornecedor').AsString;
    DMVirtual.CDS_V_Fornecedores.Post;
    DMBelShop.CDS_BuscaRapida.Close;

    Screen.Cursor:=crDefault;

    // Monta sFornecedore
    FrmBelShop.MontaSelectFornecedores;

    EdtFiltroCodForn.Text:='0';
    EdtFiltroCodForn.SetFocus;
  End;

end;

procedure TFrmFaltasCDLojas.Bt_FiltroBuscaFornClick(Sender: TObject);
Var
  MySql: String;
begin

  If Clbx_FaltasCDLojasLojas.Items.Count<1 Then
  Begin
    msg('Favor Buscar os Produtos Primeiro !!', 'A');
    EdtFiltroCodForn.Value:=0;
    EdtFiltroCodForn.SetFocus;
    Exit;
  End;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;
  EdtFiltroCodForn.Value:=0;

    // Busca Fornecedores ======================================================
    MySql:=' SELECT'+
           ' DISTINCT pr.nomefornecedor, pr.principalfor'+
           ' FROM ES_ESTOQUES_SEM se, PRODUTO pr'+
           ' WHERE se.cod_produto=pr.codproduto'+
           ' AND   se.dta_movto Between '+QuotedStr(sgDtaInicio)+' AND '+QuotedStr(sgDtaFim)+
           ' AND   se.ind_curva IS NOT NULL';

           If Trim(sgCurvas)<>'' Then
            MySql:=
             MySql+' AND se.Ind_Curva in ('+sgCurvas+')';

           If Trim(sgCodLojas)<>'' Then
            MySql:=
             MySql+' AND se.Cod_Loja in ('+sgCodLojas+')';;

           If Cbx_FaltasCDLojasSitProd.ItemIndex=0 Then
            MySql:=
             MySql+' AND Coalesce(pr.situacaopro,0)=0';

           If Cbx_FaltasCDLojasSitProd.ItemIndex=1 Then
            MySql:=
             MySql+' AND Coalesce(pr.situacaopro,0)=3';

           If Cbx_FaltasCDLojasSitProd.ItemIndex=2 Then
            MySql:=
             MySql+' AND Coalesce(p.situacaopro,0) in (0,3)';

  MySql:=
   MySql+' ORDER BY 1';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;
  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('NomeFornecedor').AsString)='' Then
  Begin
    msg('Sem fORNECEDOR a Listar !!','A');
    DMBelShop.CDS_Pesquisa.Close;
    FreeAndNil(FrmPesquisa);
    EdtFiltroCodForn.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='NomeFornecedor';
  FrmPesquisa.Campo_Codigo:='PrincipalFor';
  FrmPesquisa.Campo_Descricao:='NomeFornecedor';
  FrmPesquisa.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then
  Begin
    If DMVirtual.CDS_V_Fornecedores.Locate('Cod_Fornecedor',FrmPesquisa.EdtCodigo.Text,[]) Then
    Begin
      Begin
        msg('Fornecedor Já Informado !!','A');
        EdtFiltroCodForn.Clear;
        FreeAndNil(FrmPesquisa);
        EdtFiltroCodForn.SetFocus;
        Exit;
      End;
    End;

    DMVirtual.CDS_V_Fornecedores.Insert;
    DMVirtual.CDS_V_FornecedoresCod_Fornecedor.AsString:=FrmPesquisa.EdtCodigo.Text;
    DMVirtual.CDS_V_FornecedoresDes_Fornecedor.AsString:=FrmPesquisa.EdtDescricao.Text;
    DMVirtual.CDS_V_Fornecedores.Post;

    // Monta sFornecedore
    FrmBelShop.MontaSelectFornecedores;
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmFaltasCDLojas.Ckb_CalculoCurvaTodasClick(Sender: TObject);
begin
  If Ckb_CalculoCurvaTodas.Checked Then
   Begin
     Ckb_CalculoCurvaA.Checked:=True;
     Ckb_CalculoCurvaB.Checked:=True;
     Ckb_CalculoCurvaC.Checked:=True;
     Ckb_CalculoCurvaD.Checked:=True;
     Ckb_CalculoCurvaE.Checked:=True;

     Ckb_CalculoCurvaA.Enabled:=False;
     Ckb_CalculoCurvaB.Enabled:=False;
     Ckb_CalculoCurvaC.Enabled:=False;
     Ckb_CalculoCurvaD.Enabled:=False;
     Ckb_CalculoCurvaE.Enabled:=False;
   End
  Else
   Begin
     Ckb_CalculoCurvaA.Checked:=True;
     Ckb_CalculoCurvaB.Checked:=False;
     Ckb_CalculoCurvaC.Checked:=False;
     Ckb_CalculoCurvaD.Checked:=False;
     Ckb_CalculoCurvaE.Checked:=False;

     Ckb_CalculoCurvaA.Enabled:=True;
     Ckb_CalculoCurvaB.Enabled:=True;
     Ckb_CalculoCurvaC.Enabled:=True;
     Ckb_CalculoCurvaD.Enabled:=True;
     Ckb_CalculoCurvaE.Enabled:=True;
   End;

   AcertaCkb_Style(Ckb_CalculoCurvaTodas);
   AcertaCkb_Style(Ckb_CalculoCurvaA);
   AcertaCkb_Style(Ckb_CalculoCurvaB);
   AcertaCkb_Style(Ckb_CalculoCurvaC);
   AcertaCkb_Style(Ckb_CalculoCurvaD);
   AcertaCkb_Style(Ckb_CalculoCurvaE);

end;

procedure TFrmFaltasCDLojas.Ckb_CalculoCurvaTodasKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Ckb_CalculoCurvaTodasClick(Self);
end;

procedure TFrmFaltasCDLojas.Ckb_CalculoCurvaAClick(Sender: TObject);
begin
  AcertaCkb_Style(Ckb_CalculoCurvaA);
  AcertaCkb_Style(Ckb_CalculoCurvaB);
  AcertaCkb_Style(Ckb_CalculoCurvaC);
  AcertaCkb_Style(Ckb_CalculoCurvaD);
  AcertaCkb_Style(Ckb_CalculoCurvaE);

  If (Ckb_CalculoCurvaA.Checked) And (Ckb_CalculoCurvaB.Checked) And
     (Ckb_CalculoCurvaC.Checked) And (Ckb_CalculoCurvaD.Checked) And
     (Ckb_CalculoCurvaE.Checked) Then
  Begin
    Ckb_CalculoCurvaTodas.Checked:=True;
    Ckb_CalculoCurvaTodasClick(Self)
  End;

  If (Not Ckb_CalculoCurvaA.Checked) and (Not Ckb_CalculoCurvaB.Checked) and 
     (Not Ckb_CalculoCurvaC.Checked) and (Not Ckb_CalculoCurvaD.Checked) and 
     (Not Ckb_CalculoCurvaE.Checked) Then
  Begin
    Ckb_CalculoCurvaTodas.Checked:=True;
    Ckb_CalculoCurvaTodasClick(Self);
  End;

end;

procedure TFrmFaltasCDLojas.Ckb_CalculoCurvaAKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Ckb_CalculoCurvaAClick(Self);
end;

end.
