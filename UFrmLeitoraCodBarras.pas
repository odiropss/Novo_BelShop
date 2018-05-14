unit UFrmLeitoraCodBarras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvXPCore, JvXPButtons, StdCtrls, ExtCtrls, Mask,
  ToolEdit, CurrEdit, MMSystem, JvGradientCaption, JvProgressBar,
  JvExStdCtrls, JvEdit, ComCtrls;

type
  TFrmLeitoraCodBarras = class(TForm)
    CorCaptionForm: TJvGradientCaption;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Bt_Processar: TJvXPButton;
    Bt_Fechar: TJvXPButton;
    EdtQtdEmbalagem: TCurrencyEdit;
    EdtCodBarras: TJvEdit;
    Pc_OBS: TPageControl;
    Ts_OBS_Reposicao: TTabSheet;
    Gb_CheckOut_OK: TGroupBox;
    PBar_CheckOut_OK: TJvGradientProgressBar;
    Lab_CheckOut_OK: TLabel;
    Gb_CheckOut_Erro: TGroupBox;
    PBar_CheckOut_Erro: TJvGradientProgressBar;
    Lab_CheckOut_Erro: TLabel;
    Ts_OBS_Avarias: TTabSheet;
    Panel3: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EdtCBSProduto: TEdit;
    EdtCBSForn: TEdit;
    EdtCBSEndereco: TEdit;
    MemCBSObs: TMemo;
    EdtCBSCodBarras: TEdit;
    Bt_CodBarrasSimplesRetornar: TJvXPButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_FecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtQtdEmbalagemEnter(Sender: TObject);
    procedure EdtQtdEmbalagemExit(Sender: TObject);
    procedure EdtCodBarrasChange(Sender: TObject);
    procedure Bt_ProcessarClick(Sender: TObject);
    procedure EdtCodBarrasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    // ODIR - INICO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    Function BuscaProdutoLinx(sCodBarras: String): Boolean;

    // ODIR - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    procedure Bt_CodBarrasSimplesRetornarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    bgProcessar,
    bgCheckOutPerdas,
    bgCheckOutSimples: Boolean;

  end;

var
  FrmLeitoraCodBarras: TFrmLeitoraCodBarras;

implementation

uses DK_Procs1, UFrmCentralTrocas, UDMBelShop, UDMCentralTrocas, DBClient,
  DB;

{$R *.dfm}
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - INICO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Produto pelo Codigo de Barras >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmLeitoraCodBarras.BuscaProdutoLinx(sCodBarras: String): Boolean;
Var
  MySql: String;
Begin
  Result:=False;

  // Busca Produto Linx ========================================================
  MySql:=' SELECT pr.cod_produto'+
         ' FROM LINXPRODUTOS pr'+
         ' WHERE pr.cod_barra='+sCodBarras+

         'UNION'+

         ' SELECT cb.cod_produto'+
         ' FROM LINXPRODUTOSCODBAR cb'+
         ' WHERE cb.cod_barra='+sCodBarras;
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  sgCodProdLinx:=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Produto').AsString);
  DMBelShop.CDS_BuscaRapida.Close;

  If Trim(sgCodProdLinx)<>'' Then
   Result:=True;

End; // Busca Produto pelo Codigo de Barras >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmLeitoraCodBarras.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  bgProcessar      :=False;
  bgCheckOutPerdas :=False;
  bgCheckOutSimples:=False;

end;

procedure TFrmLeitoraCodBarras.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmLeitoraCodBarras.Bt_FecharClick(Sender: TObject);
begin
  Panel1.SetFocus;

  bgProcessar:=False;
  Close;
end;

procedure TFrmLeitoraCodBarras.FormShow(Sender: TObject);
begin
  // Coloca BitMaps em Componentes =============================================
  BitMaps(FrmLeitoraCodBarras);

  // Cor Form
  CorCaptionForm.Active:=False;
  CorCaptionForm.Active:=True;

  EdtCodBarras.SetFocus;
end;

procedure TFrmLeitoraCodBarras.EdtQtdEmbalagemEnter(Sender: TObject);
begin
  EdtCodBarras.Text:='0';
end;

procedure TFrmLeitoraCodBarras.EdtQtdEmbalagemExit(Sender: TObject);
begin
  EdtCodBarras.SetFocus;
end;

procedure TFrmLeitoraCodBarras.EdtCodBarrasChange(Sender: TObject);
begin
  If Length(EdtCodBarras.Text)=13 Then
   Bt_ProcessarClick(Self);

end;

procedure TFrmLeitoraCodBarras.Bt_ProcessarClick(Sender: TObject);
Var
  bExisteNF: Boolean;
  MySql: String;
  sEndereco: String;
begin
  //============================================================================
  // Leitora de Codigo de Barras Separação de Transferencias ===================
  //============================================================================
  If Not bgCheckOutSimples Then
  Begin
    Panel1.SetFocus;

    If StrToInt64Def(EdtCodBarras.Text,0)<>0 Then
     Begin
       // Processa Reposição ===================================================
       FrmCentralTrocas.CheckOut_BuscaProdCodBarras_AtualizaQtd(Trim(EdtCodBarras.Text),EdtQtdEmbalagem.AsInteger);

       // Acerta Controle de Processamento =====================================
       FrmCentralTrocas.ReCalculaPosicaoLeitora;

       // Reposiciona ==========================================================
       EdtQtdEmbalagem.AsInteger:=1;
       EdtCodBarras.Text:='0';
       EdtQtdEmbalagem.SetFocus;
       SelectNext(ActiveControl,True,True);
     End
    Else
     Begin
       msg('Código de Barras Inválido !!','A');
       Screen.Cursor:=crDefault;
       EdtQtdEmbalagem.AsInteger:=1;
       EdtCodBarras.Text:='0';
       EdtQtdEmbalagem.SetFocus;
       SelectNext(ActiveControl,True,True);
     End; // If StrToInt64Def(EdtCodBarras.Text,0)<>0 Then
  End; // If Not bgCheckOutSimples Then
  // Leitora de Codigo de Barras Separação de Transferencias ===================
  //============================================================================

  //============================================================================
  // Leitora de Codigo de Barras SIMPLE ========================================
  //============================================================================
  If bgCheckOutSimples Then
  Begin
    If StrToInt64Def(EdtCodBarras.Text,0)<>0 Then
     Begin
       Screen.Cursor:=crAppStart;

       EdtCBSProduto.Clear;
       EdtCBSForn.Clear;
       EdtCBSCodBarras.Clear;
       EdtCBSEndereco.Clear;

       MemCBSObs.Lines.Clear;
       MemCBSObs.Color:=clWindow;
       MemCBSObs.Font.Color:=clWindowText;

       // Busca Produtos =======================================================
       If Not BuscaProdutoLinx(EdtCodBarras.Text) Then
       Begin
         Screen.Cursor:=crDefault;

         PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
         msg('Não Foi Encontrado Produto com'+cr+cr+'este Código de Barras !!','A');
         EdtCodBarras.SetFocus;
         Exit;
       End;

       //=======================================================================
       // Verifia se Este na Nota Fiscal de Avaria =============================
       //=======================================================================
       If Not bgCheckOutPerdas Then
       Begin
         bExisteNF:=False;
         If Not DMCentralTrocas.CDS_NFeAvarias.IsEmpty Then
          bExisteNF:=DMCentralTrocas.CDS_NFeAvarias.Locate('COD_PRODUTO', sgCodProdLinx,[]);

         // Apresenta Produto que não esta na Nota Fiscal ======================
         If Not bExisteNF Then
         Begin
           MySql:=' SELECT p.cod_produto, p.nome, p.cod_fornecedor, f.nome_cliente, t.des_aux'+
                  ' FROM LINXPRODUTOS p'+
                  '      LEFT JOIN linxclientesfornec f  ON f.cod_cliente=p.cod_fornecedor'+
                  '      LEFT JOIN         TAB_AUXILIAR t        ON t.tip_aux=23'+ // AVARIAS - ENDEREÇAMENTO DE FORNECEDOR
                  '                                     AND t.cod_aux=p.cod_fornecedor'+
                  ' WHERE p.cod_produto='+sgCodProdLinx;
           DMBelShop.CDS_BuscaRapida.Close;
           DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
           DMBelShop.CDS_BuscaRapida.Open;
           sEndereco:=DMBelShop.CDS_BuscaRapida.FieldByName('Des_Aux').AsString;

           If Trim(sEndereco)='' Then
            sEndereco:=FrmCentralTrocas.NFeAvariasAtualizaEnderecos(
              DMBelShop.CDS_BuscaRapida.FieldByName('cod_fornecedor').AsString);

           EdtCBSProduto.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Produto').AsString+' - '+
                               DMBelShop.CDS_BuscaRapida.FieldByName('Nome').AsString;
           EdtCBSForn.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('cod_fornecedor').AsString+' - '+
                            DMBelShop.CDS_BuscaRapida.FieldByName('Nome_Cliente').AsString;
           EdtCBSCodBarras.Text:=EdtCodBarras.Text;
           EdtCBSEndereco.Text:=sEndereco;

           MemCBSObs.Color:=clRed;
           MemCBSObs.Font.Color:=clWhite;
           MemCBSObs.Lines.Add('Produto NÃO ENCONTRADO na Nota Fiscal !!');

           DMBelShop.CDS_BuscaRapida.Close;

           Screen.Cursor:=crDefault;
           EdtQtdEmbalagem.AsInteger:=1;
           EdtCodBarras.Text:='0';
           EdtQtdEmbalagem.SetFocus;
           SelectNext(ActiveControl,True,True);
         End; // If Not bExisteNF Then

         // Apresenta Produto da Nota Fiscal ===================================
         If bExisteNF Then
         Begin
           // Acerta Quantidade de CheckOut ====================================
           DMCentralTrocas.CDS_NFeAvarias.Edit;
           DMCentralTrocas.CDS_NFeAvariasCHECKOUT.AsInteger:=
                               DMCentralTrocas.CDS_NFeAvariasCHECKOUT.AsInteger+
                                                      EdtQtdEmbalagem.AsInteger;
           DMCentralTrocas.CDS_NFeAvarias.Post;

           EdtCBSProduto.Text:=DMCentralTrocas.CDS_NFeAvariasCOD_PRODUTO.AsString+' - '+
                            DMCentralTrocas.CDS_NFeAvariasNOME_PRODUTO.AsString;
           EdtCBSForn.Text:=DMCentralTrocas.CDS_NFeAvariasCOD_FORNECEDOR.AsString+' - '+
                         DMCentralTrocas.CDS_NFeAvariasNOME_FORNECEDOR.AsString;
           EdtCBSCodBarras.Text:=EdtCodBarras.Text;
           EdtCBSEndereco.Text:=DMCentralTrocas.CDS_NFeAvariasENDERECAMENTO.AsString;

           MemCBSObs.Color:=$0080FF80;
           MemCBSObs.Font.Color:=clWindowText;
           MemCBSObs.Lines.Add('Produto ENCONTRADO na Nota Fiscal !!');

           Screen.Cursor:=crDefault;
           EdtQtdEmbalagem.AsInteger:=1;
           EdtCodBarras.Text:='0';
           EdtQtdEmbalagem.SetFocus;
           SelectNext(ActiveControl,True,True);
         End; // If bExisteNF Then
       End; // If Not bgCheckOutPerdas Then
       // Verifia se Este na Nota Fiscal de Avaria =============================
       //=======================================================================

       //=======================================================================
       // Inclui Produto no Documento de Perdas ================================
       //=======================================================================
       If bgCheckOutPerdas Then
       Begin
         // Busca Produto ======================================================
         MySql:=' SELECT p.cod_barra, p.referencia, p.cod_produto, p.nome,'+
                '        0 Quantidade, p.cod_fornecedor, f.nome_cliente'+
                ' FROM LINXPRODUTOS p, LINXCLIENTESFORNEC f'+
                ' WHERE p.cod_fornecedor=f.cod_cliente'+
                ' AND   p.cod_produto='+sgCodProdLinx;
         DMBelShop.CDS_BuscaRapida.Close;
         DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
         DMBelShop.CDS_BuscaRapida.Open;

         // Verifica se Existe =================================================
         If Not DMCentralTrocas.CDS_V_NfePerdas.Locate('COD_PRODUTO',sgCodProdLinx,[]) Then
          Begin
            DMCentralTrocas.CDS_V_NfePerdas.Insert;
            DMCentralTrocas.CDS_V_NfePerdasCOD_BARRA.AsString:=
                    DMBelShop.CDS_BuscaRapida.FieldByName('cod_barra').AsString;
            DMCentralTrocas.CDS_V_NfePerdasREFERENCIA.AsString:=
                   DMBelShop.CDS_BuscaRapida.FieldByName('referencia').AsString;
            DMCentralTrocas.CDS_V_NfePerdasCOD_PRODUTO.AsInteger:=
                 DMBelShop.CDS_BuscaRapida.FieldByName('cod_produto').AsInteger;
            DMCentralTrocas.CDS_V_NfePerdasNOME.AsString:=
                         DMBelShop.CDS_BuscaRapida.FieldByName('nome').AsString;
            DMCentralTrocas.CDS_V_NfePerdasQUANTIDADE.AsInteger:=
                                                      EdtQtdEmbalagem.AsInteger;
                 DMBelShop.CDS_BuscaRapida.FieldByName('cod_produto').AsInteger;
            DMCentralTrocas.CDS_V_NfePerdasCOD_FORNECEDOR.AsInteger:=
              DMBelShop.CDS_BuscaRapida.FieldByName('cod_fornecedor').AsInteger;
            DMCentralTrocas.CDS_V_NfePerdasNOME_CLIENTE.AsString:=
                 DMBelShop.CDS_BuscaRapida.FieldByName('nome_cliente').AsString;
            DMCentralTrocas.CDS_V_NfePerdas.Post;
          End
         Else
          Begin
            DMCentralTrocas.CDS_V_NfePerdas.Edit;
            DMCentralTrocas.CDS_V_NfePerdasQUANTIDADE.AsInteger:=
                           DMCentralTrocas.CDS_V_NfePerdasQUANTIDADE.AsInteger +
                                                      EdtQtdEmbalagem.AsInteger;
            DMCentralTrocas.CDS_V_NfePerdas.Post;
          End;
         DMCentralTrocas.CDS_V_NfePerdas.Locate('COD_BARRA',sgCodProdLinx,[]);

         EdtCBSProduto.Text:=DMCentralTrocas.CDS_V_NfePerdasCOD_PRODUTO.AsString+' - '+
                                   DMCentralTrocas.CDS_V_NfePerdasNOME.AsString;
         EdtCBSForn.Text:=DMCentralTrocas.CDS_V_NfePerdasCOD_FORNECEDOR.AsString+' - '+
                           DMCentralTrocas.CDS_V_NfePerdasNOME_CLIENTE.AsString;
         EdtCBSCodBarras.Text:=DMCentralTrocas.CDS_V_NfePerdasCOD_BARRA.AsString;
         DMBelShop.CDS_BuscaRapida.Close;

         Screen.Cursor:=crDefault;
         EdtQtdEmbalagem.AsInteger:=1;
         EdtCodBarras.Text:='0';
         EdtQtdEmbalagem.SetFocus;
         SelectNext(ActiveControl,True,True);
       End; // If bgCheckOutPerdas Then
       // Inclui Produto no Documento de Perdas ================================
       //=======================================================================

     End
    Else
     Begin
       msg('Código de Barras Inválido !!','A');
       Screen.Cursor:=crDefault;
       EdtQtdEmbalagem.AsInteger:=1;
       EdtCodBarras.Text:='0';
       EdtQtdEmbalagem.SetFocus;
       SelectNext(ActiveControl,True,True);
     End; // If StrToInt64Def(EdtCodBarras.Text,0)<>0 Then
  End; // If bgCheckOutSimples Then
  // Leitora de Codigo de Barras SIMPLE ========================================
  //============================================================================
end;

procedure TFrmLeitoraCodBarras.EdtCodBarrasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If (key=Vk_Return) And (StrToInt64Def(EdtCodBarras.Text,0)<>0) Then
   Bt_ProcessarClick(Self);

end;

procedure TFrmLeitoraCodBarras.Bt_CodBarrasSimplesRetornarClick(Sender: TObject);
begin
  Close;
end;

end.
