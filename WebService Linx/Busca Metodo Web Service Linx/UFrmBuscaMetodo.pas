unit UFrmBuscaMetodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvXPCore, JvXPButtons, ExtCtrls, Grids, DBGrids,
  DBGridJul, StdCtrls, Mask, ToolEdit, CurrEdit, cxProgressBar, cxGraphics,
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
  cxMaskEdit, cxDropDownEdit, cxCalendar, StrUtils ;

type
  TFrmBuscaMetodo = class(TForm)
    OdirPanApres: TPanel;
    Panel1: TPanel;
    Bt_BuscaMetodo: TJvXPButton;
    Dbg_Lojas: TDBGridJul;
    EdtCodLoja: TCurrencyEdit;
    Lab_LojaLinx: TLabel;
    Lab_MetodoBuca: TLabel;
    EdtDesLoja: TEdit;
    Lab_Periodo1: TLabel;
    DtEdt_DtaInicio: TcxDateEdit;
    Lab_Periodo2: TLabel;
    DtEdt_DtaFim: TcxDateEdit;
    Cbx_Metodos: TComboBox;
    Lab_Dias: TLabel;
    EdtCodQualquer: TEdit;
    Lab_CodQualquer: TLabel;
    Lab_CodProduto: TLabel;
    EdtCodProduto: TEdit;
    procedure Bt_BuscaMetodoClick(Sender: TObject);
    procedure EdtCodLojaExit(Sender: TObject);

    // Odir
    Procedure MontaProgressBar(bCria: Boolean; Form: TForm);
    // Odir

    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Cbx_MetodosChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscaMetodo: TFrmBuscaMetodo;

  pgProgBar: TcxProgressBar;

  sgDtaI, sgDtaF,
  sgCodQualquer,
  sgCodProduto: String;

implementation

uses DK_Procs1, UDMBuscaMetodo, DB;


{$R *.dfm}

// Odir Inicio

// Monta ProgressBar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBuscaMetodo.MontaProgressBar(bCria: Boolean; Form: TForm);
Begin
  If bCria Then
  Begin
    pgProgBar:=TcxProgressBar.Create(Self);
    pgProgBar.Parent:=Form;
    pgProgBar.Visible:=True;
    pgProgBar.Style.Font.Style:=[fsBold];
    pgProgBar.Left:=100;
    pgProgBar.Top:=302;
    pgProgBar.Width:=Form.ClientWidth-200;

    // Disabilita Formulario
    Form.Enabled:=False;
  End; // If bCria Then

  If Not bCria Then
  Begin
    FreeAndNil(pgProgBar);

    // Habilita Formulario
    Form.Enabled:=True;
  End;

  Application.ProcessMessages;
End; // Monta ProgressBar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Odir Fim
procedure TFrmBuscaMetodo.Bt_BuscaMetodoClick(Sender: TObject);
Var
  MySql: String;
  sParametros: String;
begin

  OdirPanApres.Caption:='AGUARDE !! Atualizando WebService LINX - CLOUD';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBuscaMetodo.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBuscaMetodo.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmBuscaMetodo;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;
  
  // Busca Lojas Linx ==========================================================
  MySql:=' SELECT em.cod_linx, em.Razao_Social'+
         ' FROM EMP_CONEXOES em';

         If Trim(EdtDesLoja.Text)<>'' Then
          MySql:=
           MySql+' WHERE em.cod_linx='+EdtCodLoja.Text
         Else
          MySql:=
           MySql+' WHERE em.cod_linx<>0'+
                 ' AND   em.ind_ativo=''SIM''';

  MySql:=
   MySql+' ORDER BY 1';
  DMBuscaMetodo.CDS_Busca.Close;
  DMBuscaMetodo.SDS_Busca.CommandText:=MySql;
  DMBuscaMetodo.CDS_Busca.Open;

  MontaProgressBar(True, FrmBuscaMetodo);
  pgProgBar.Properties.Max:=DMBuscaMetodo.CDS_Busca.RecordCount;
  pgProgBar.Position:=0;

  sgDtaI:='';
  sgDtaF:='';
  If Trim(DtEdt_DtaInicio.Text)<>'' Then
  Begin
    sgDtaI:=DateToStr(DtEdt_DtaInicio.Date);
    sgDtaF:=DateToStr(DtEdt_DtaFim.Date);
  End;

  sgCodQualquer:='0';
  If Trim(EdtCodQualquer.Text)<>'' Then
   sgCodQualquer:=Trim(EdtCodQualquer.Text);

  sgCodProduto:='0';
  If Trim(EdtCodProduto.Text)<>'' Then
   sgCodProduto:=Trim(EdtCodProduto.Text);

  Try
    While Not DMBuscaMetodo.CDS_Busca.Eof do
    Begin
      OdirPanApres.Caption:='AGUARDE !! Atualizando Metodo: '+Cbx_Metodos.Text+' (LINX - CLOUD) Loja: '+DMBuscaMetodo.CDS_Busca.FieldByName('Cod_Linx').AsString;
      Application.ProcessMessages;

      sParametros:=sgPastaWebService+'PWebServiceLinx.exe';
      sParametros:=sParametros+' '+Cbx_Metodos.Text; // Executavel e Metodo a Processar
      sParametros:=sParametros+' '+DMBuscaMetodo.CDS_Busca.FieldByName('Cod_Linx').AsString; // Codigo da Loja a Processar
      sParametros:=sParametros+' "'+IncludeTrailingPathDelimiter(sgPastaWebService+'Metodos')+'"'; // Pasta dos Metodos
      sParametros:=sParametros+' "'+IncludeTrailingPathDelimiter(sgPastaWebService+'Retornos')+'"'; // Pasta dos Retornos
      sParametros:=sParametros+' "'+sgDtaI+'"'; // Data Inicial
      sParametros:=sParametros+' "'+sgDtaF+'"'; // Data Final
      sParametros:=sParametros+' "'+sgCodProduto+'"'; // Codigo de Determinado Produto
      sParametros:=sParametros+' "'+sgCodQualquer+'"'; // Um Codigo Qualquer - Utilizado se ha Necessidade de Uma Unico Elelmente
      sParametros:=sParametros+' "SIM"'; // Metodo LinxFaturas - Pesquisa Pela Data: SIM=Emissão NAO=Pagamento

      // Envia Parametro e Aguarda Termino do Processo =============================
      CreateProcessSimple(sParametros);

      pgProgBar.Position:=DMBuscaMetodo.CDS_Busca.RecNo;

      DMBuscaMetodo.CDS_Busca.Next;
    End; // While Not DMBuscaMetodo.CDS_Busca.Eof do
  Except
    on e : Exception do
    Begin
      MessageBox(Handle, pChar(e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End;
  DMBuscaMetodo.CDS_Busca.Close;
  MontaProgressBar(False, FrmBuscaMetodo);
  OdirPanApres.Visible:=False;

  msg('FIM','A');
end;

procedure TFrmBuscaMetodo.EdtCodLojaExit(Sender: TObject);
Var
  MySql:String;
begin
  EdtDesLoja.Clear;

  If EdtCodLoja.AsInteger=0 Then
  Begin
    Exit;
  End;

  MySql:=' select l.empresa, l.nome_emp'+
         ' from linxlojas l'+
         ' where l.empresa='+EdtCodLoja.Text;
  DMBuscaMetodo.CDS_Busca.Close;
  DMBuscaMetodo.SDS_Busca.CommandText:=MySql;
  DMBuscaMetodo.CDS_Busca.Open;
  EdtDesLoja.Text:=DMBuscaMetodo.CDS_Busca.FieldByName('nome_emp').AsString;
  DMBuscaMetodo.CDS_Busca.Close;

  If Trim(EdtDesLoja.Text)='' Then
  Begin
    msg('Loja Não Encontrada !!','A');
    EdtCodLoja.AsInteger:=0;
    Exit;
  End;


end;

procedure TFrmBuscaMetodo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmBuscaMetodo.Cbx_MetodosChange(Sender: TObject);
begin
  Lab_Periodo1.Visible:=False;
  Lab_Periodo2.Visible:=False;
  Lab_Dias.Visible:=False;

  DtEdt_DtaInicio.Clear;
  DtEdt_DtaInicio.Visible:=False;
  DtEdt_DtaFim.Clear;
  DtEdt_DtaFim.Visible:=False;

  Lab_CodQualquer.Visible:=False;
  EdtCodQualquer.Clear;
  EdtCodQualquer.Visible:=False;

  EdtCodProduto.Clear;

  Bt_BuscaMetodo.Enabled:=False;
  If Trim(Cbx_Metodos.Text)<>'' Then
  Begin
    // Não Rodar ===============================================================
    If AnsiContainsStr('LinxMovimentoSerial LinxReducoesZ LinxLancContabil ', Cbx_Metodos.Text+' ') Then
    Begin
      msg('Não Rodar Este Metodo !!','A');
      Cbx_Metodos.SetFocus;
      Exit;
    End;

    Bt_BuscaMetodo.Enabled:=True;

    // Menos 30 Dias ===========================================================
    If AnsiContainsStr('LinxClientesFornec LinxClientesFornecCamposAdicionais ', Cbx_Metodos.Text+' ') Then
    Begin
      Lab_Periodo1.Visible:=True;
      Lab_Periodo2.Visible:=True;
      Lab_Dias.Visible:=True;
      Lab_Dias.Caption:='30 Dias';

      DtEdt_DtaInicio.Visible:=True;
      DtEdt_DtaFim.Visible:=True;

      DtEdt_DtaInicio.Date:=(Now-31);
      DtEdt_DtaFim.Date:=(Now-1);
    End;

    // Menos 15 Dias ===========================================================
    If AnsiContainsStr('LinxMovimento LinxMovtosAjustesEntradas LinxMovtosAjustesSaidas LinxMovimentoTrocas ', Cbx_Metodos.Text+' ') Then
    Begin
      Lab_Periodo1.Visible:=True;
      Lab_Periodo2.Visible:=True;
      Lab_Dias.Visible:=True;
      Lab_Dias.Caption:='15 Dias';

      DtEdt_DtaInicio.Visible:=True;
      DtEdt_DtaFim.Visible:=True;

      DtEdt_DtaInicio.Date:=(Now-16);
      DtEdt_DtaFim.Date:=(Now-1);
    End;

    // Menos 7 Dias ============================================================
    If AnsiContainsStr('LinxMovimentoOrigemDevolucoes LinxMovimentoPlanos LinxAcoesPromocionais '+
                       'LinxMovimentoAcoesPromocionais LinxPedidosVenda LinxPlanosPedidoVenda '+
                       'LinxPedidosCompra LinxSangriaSuprimentos LinxFaturas ', Cbx_Metodos.Text+' ') Then
    Begin
      Lab_Periodo1.Visible:=True;
      Lab_Periodo2.Visible:=True;
      Lab_Dias.Visible:=True;
      Lab_Dias.Caption:='7 Dias';

      DtEdt_DtaInicio.Visible:=True;
      DtEdt_DtaFim.Visible:=True;

      DtEdt_DtaInicio.Date:=(Now-8);
      DtEdt_DtaFim.Date:=(Now-1);
    End;

    // Solicita Código Qualquer ================================================
    If AnsiContainsStr('LinxProdutosDepositos ', Cbx_Metodos.Text+' ') Then
    Begin
      Lab_CodQualquer.Caption:='Codigo do Local do Depósito'; 
      Lab_CodQualquer.Visible:=True;
      EdtCodQualquer.Visible:=True;
    End;

  End; // If Trim(Cbx_Metodos.Text)<>'' Then

end;

end.
