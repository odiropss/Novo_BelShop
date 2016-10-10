unit UFrmComissaoVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvGradientCaption, JvExControls, JvXPCore, JvXPButtons, ExtCtrls,
  ComCtrls, StdCtrls, Grids, DBGrids, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, dxStatusBar, cxProgressBar, 
  DBXpress, DBClient, SqlExpr, IBQuery, Mask, ToolEdit, CurrEdit, DBGridJul;

type
  TFrmComissaoVendedor = class(TForm)
    CorCaptionForm: TJvGradientCaption;
    Panel38: TPanel;
    Bt_FluFornFechar: TJvXPButton;
    PC_ComissaoVendedor: TPageControl;
    Ts_Produtos: TTabSheet;
    Ts_Comissoes: TTabSheet;
    Gb_UltimaAtualizacao: TGroupBox;
    Gb_ProdutosComissao: TGroupBox;
    Panel1: TPanel;
    Bt_ImportaVendas: TJvXPButton;
    Dbg_UltimaAtualizacao: TDBGrid;
    Dbg_ProdutosComissao: TDBGrid;
    dxStatusBar2: TdxStatusBar;
    OdirPanApres: TPanel;
    dxStatusBar1: TdxStatusBar;
    Ts_ParametrosVendedores: TTabSheet;
    Gb_FamiliaPrecos: TGroupBox;
    Gb_Aplicacoes: TGroupBox;
    Dbg_Aplicacao: TDBGridJul;
    Dbg_FamiliaPrecos: TDBGridJul;
    Pan_Aplicacoes: TPanel;
    Bt_BuscaAplicacao: TJvXPButton;
    EdtCodAplicacao: TCurrencyEdit;
    Pan_FamiliaPrecos: TPanel;
    Bt_BuscaFamiliaPreco: TJvXPButton;
    EdtCodFamiliaPrecos: TCurrencyEdit;
    Panel2: TPanel;
    JvXPButton2: TJvXPButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Bt_FluFornFecharClick(Sender: TObject);
    procedure PC_ComissaoVendedorChange(Sender: TObject);

    //==========================================================================
    // Odir ====================================================================
    //==========================================================================
    Procedure FechaTudoComVend;

    Procedure UltimasAtualizacoes;    // Busca Ultima Atualização das Lojas
    Procedure ProdutosCampanhaVendas; // Busca Produtos da Aplicação e Família Preço

    Procedure Aplicacoes_FamiliaPrecos; // Busca Aplicacoes e FamiliaPrecos


    Procedure MontaProgressBar(bCria: Boolean; Form: TForm);
    //==========================================================================
    // Odir ====================================================================
    //==========================================================================

    procedure Dbg_UltimaAtualizacaoDblClick(Sender: TObject);
    procedure Dbg_UltimaAtualizacaoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_UltimaAtualizacaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_ImportaVendasClick(Sender: TObject);
    procedure Dbg_ProdutosComissaoEnter(Sender: TObject);
    procedure Dbg_ProdutosComissaoExit(Sender: TObject);
    procedure Dbg_ProdutosComissaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_ProdutosComissaoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_ProdutosComissaoKeyPress(Sender: TObject; var Key: Char);
    procedure Dbg_UltimaAtualizacaoTitleClick(Column: TColumn);
    procedure Dbg_AplicacaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_FamiliaPrecosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_FamiliaPrecosExit(Sender: TObject);
    procedure Dbg_FamiliaPrecosEnter(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
   THackDBGrid = class(TDBGrid);
  
var
  FrmComissaoVendedor: TFrmComissaoVendedor;

  bgSairComVend: Boolean;
  OrderGrid: String;    // Ordenar Grid

  IBQ_ConsultaFilial  : TIBQuery;

implementation

uses DK_Procs1, UDMComissaoVendedor, UDMBelShop, UFrmBelShop, DB;

{$R *.dfm}

//==============================================================================
// Odir - INICIO ===============================================================
//==============================================================================

// Busca Aplicacoes e FamiliaPrecos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmComissaoVendedor.Aplicacoes_FamiliaPrecos;
Var
  MySql: String;
Begin
  // Busca Aplicaçoes ==========================================================
  MySql:=' SELECT DISTINCT pr.nomeaplicacao DES_APLICACAO,'+
         '                 pr.codaplicacao  COD_APLICACAO'+
         ' FROM PRODUTO pr, TAB_AUXILIAR ap'+
         ' WHERE pr.codaplicacao=ap.Des_Aux'+
         ' AND   ap.tip_aux=15'+
         ' ORDER BY 2';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If DMComissaoVendedor.CDS_V_Aplicacao.Active Then
   DMComissaoVendedor.CDS_V_Aplicacao.Close;

  DMComissaoVendedor.CDS_V_Aplicacao.CreateDataSet;
  DMComissaoVendedor.CDS_V_Aplicacao.Open;

  DMComissaoVendedor.CDS_V_Aplicacao.Data:=DMBelShop.CDS_BuscaRapida.Data;
  DMBelShop.CDS_BuscaRapida.Close;

  // Busca Familia de Preços ===================================================
  MySql:=' SELECT DISTINCT pr.nomefamiliapreco des_familia,'+
         '        pr.codfamiliapreco cod_familia,'+
         '        fa.vlr_aux vlr_conversao'+
         ' FROM PRODUTO pr, TAB_AUXILIAR fa'+
         ' WHERE pr.codfamiliapreco=fa.Des_Aux'+
         ' AND   fa.tip_aux=16'+
         ' ORDER BY 2';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If DMComissaoVendedor.CDS_V_FamiliaPrecos.Active Then
   DMComissaoVendedor.CDS_V_FamiliaPrecos.Close;

  DMComissaoVendedor.CDS_V_FamiliaPrecos.CreateDataSet;
  DMComissaoVendedor.CDS_V_FamiliaPrecos.Open;

  DMComissaoVendedor.CDS_V_FamiliaPrecos.Data:=DMBelShop.CDS_BuscaRapida.Data;
  DMBelShop.CDS_BuscaRapida.Close;

End; // Busca Aplicacoes e FamiliaPrecos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Produtos da Aplicação e Família Preço >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmComissaoVendedor.ProdutosCampanhaVendas;
Var
  MySql: String;
Begin
  // Verifica se Transação esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Inclui Novos Produtos da Aplicação 0006
    MySql:=' INSERT INTO FIN_VEND_COMISSAO_PROD'+
           ' SELECT pr.codproduto COD_PRODUTO, 0.00 FAT_CONVERSAO,'+
           ' NULL DTA_VALIDADE_INI, NULL DTA_VALIDADE_FIM,'+
           QuotedStr(Cod_Usuario)+' USU_INCLUI, CURRENT_TIMESTAMP DTA_INCLUI,'+
           ' NULL USU_ALTERA, NULL DTA_ALTERA'+
           ' FROM PRODUTO pr'+
           ' WHERE pr.codaplicacao=''0006'''+
           ' AND NOT EXISTS (SELECT 1'+
           '                 FROM FIN_VEND_COMISSAO_PROD vp'+
           '                 WHERE vp.cod_produto=pr.codproduto)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Delete Novos Produtos que Não São Mais da Aplicação 0006
    MySql:=' DELETE FROM FIN_VEND_COMISSAO_PROD vp'+
           ' WHERE NOT EXISTS(SELECT 1'+
           '                  FROM PRODUTO pr'+
           '                  WHERE pr.codaplicacao = ''0006'' AND'+
           '                        pr.codproduto = vp.cod_produto)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Apresenta Produtos da Aplicação 0006
    MySql:=' SELECT VP.COD_PRODUTO, PR.APRESENTACAO, VP.FAT_CONVERSAO,'+
           ' VP.DTA_VALIDADE_INI, VP.DTA_VALIDADE_FIM'+
           ' FROM FIN_VEND_COMISSAO_PROD VP, PRODUTO PR'+
           ' WHERE VP.COD_PRODUTO=PR.CODPRODUTO'+
           ' ORDER BY 2';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If DMComissaoVendedor.CDS_V_Produtos.Active Then
     DMComissaoVendedor.CDS_V_Produtos.Close;

    DMComissaoVendedor.CDS_V_Produtos.CreateDataSet;
    DMComissaoVendedor.CDS_V_Produtos.Open;

    DMComissaoVendedor.CDS_V_Produtos.Data:=DMBelShop.CDS_BuscaRapida.Data;
    DMComissaoVendedor.CDS_V_ProdutosDTA_VALIDADE_INI.EditMask:='!99/99/2\099;1;_';
    DMComissaoVendedor.CDS_V_ProdutosDTA_VALIDADE_FIM.EditMask:='!99/99/2\099;1;_';

    DMBelShop.CDS_BuscaRapida.Close;

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;

  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try

End; // Busca Produtos da Aplicação e Família Preço >>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Monta ProgressBar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmComissaoVendedor.MontaProgressBar(bCria: Boolean; Form: TForm);
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
    pgProgBar.BringToFront;

    // Disabilita Formulario
    Form.Enabled:=False;
  End; // If bCria Then

  If Not bCria Then
  Begin
    FreeAndNil(pgProgBar);

    // Habilita Formulario
    Form.Enabled:=True;
  End;

  Refresh;
End; // Monta ProgressBar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmComissaoVendedor.FechaTudoComVend;
Var
  i: Integer;
Begin
                        
  // Fecha Componentes DMBelShop ===============================================
  For i:=0 to DMComissaoVendedor.ComponentCount-1 do
  Begin
    If DMComissaoVendedor.Components[i] is TClientDataSet Then
     If (DMComissaoVendedor.Components[i] as TClientDataSet).Active Then
     (DMComissaoVendedor.Components[i] as TClientDataSet).Close;

    If DMComissaoVendedor.Components[i] is TSQLQuery Then
     If (DMComissaoVendedor.Components[i] as TSQLQuery).Active Then
     (DMComissaoVendedor.Components[i] as TSQLQuery).Close;
  End;
end; // Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Ultimas Atualizações das Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmComissaoVendedor.UltimasAtualizacoes;
Var
  MySql: String;
Begin
  MySql:=' SELECT ''NAO'' Imp, ''Bel_''||e.cod_filial Codigo,'+
         ' e.razao_social Loja, e.dta_ult_atual_vend Data'+
         ' FROM EMP_CONEXOES e'+
         ' WHERE e.ind_ativo='+QuotedStr('SIM');
//         ' Order by 2';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If DMComissaoVendedor.CDS_V_UltimaAtualizacao.Active Then
   DMComissaoVendedor.CDS_V_UltimaAtualizacao.Close;

  DMComissaoVendedor.CDS_V_UltimaAtualizacao.CreateDataSet;
  DMComissaoVendedor.CDS_V_UltimaAtualizacao.IndexFieldNames:='Codigo';
  DMComissaoVendedor.CDS_V_UltimaAtualizacao.Open;

  DMComissaoVendedor.CDS_V_UltimaAtualizacao.Data:=DMBelShop.CDS_BuscaRapida.Data;

  DMBelShop.CDS_BuscaRapida.Close;
End; // Busca Ultimas Atualizações das Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//==============================================================================
// Odir - FIM ==================================================================
//==============================================================================

procedure TFrmComissaoVendedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bgSairComVend Then
   Begin
     Action := caFree;

     FechaTudoComVend;
   End
  Else
   Begin
     msg('Para Fechar Tecle no Botão <Fechar>...','A');
     Action := caNone;
   End;

end;

procedure TFrmComissaoVendedor.FormCreate(Sender: TObject);
begin
  bEnterTab:=True;

  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Busca Ultimas Atualizações e Produtos da Aplicação, e Familia de Preços ===
  If sgDescricao='Comissao' Then
  Begin
    UltimasAtualizacoes;
    ProdutosCampanhaVendas;
  End;

  // Busca Aplicacoes e FamiliaPrecos ==========================================
  If sgDescricao='Parametros' Then
  Begin
    Aplicacoes_FamiliaPrecos;
  End;

end;

procedure TFrmComissaoVendedor.FormKeyPress(Sender: TObject; var Key: Char);
begin

  If bEnterTab Then
  Begin
    If Key = #13 Then
    Begin
      Key:=#0;
      SelectNext(ActiveControl,True,True);
    End;
  End;

end;

procedure TFrmComissaoVendedor.FormShow(Sender: TObject);
begin
  // Coloca BitMaps em Componentes =============================================
  BitMaps(FrmComissaoVendedor);

  // Cor Form
  CorCaptionForm.Active:=False;
  CorCaptionForm.Active:=True;

  bgSairComVend:=False;

  PC_ComissaoVendedor.TabIndex:=0;

end;

procedure TFrmComissaoVendedor.Bt_FluFornFecharClick(Sender: TObject);
begin
  bgSairComVend:=True;
  Close;

end;

procedure TFrmComissaoVendedor.PC_ComissaoVendedorChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_ComissaoVendedor);

  If (PC_ComissaoVendedor.ActivePage=Ts_Produtos) And (Ts_Produtos.CanFocus) Then
  Begin
    Dbg_UltimaAtualizacao.SetFocus;
  End;

  If (PC_ComissaoVendedor.ActivePage=Ts_ParametrosVendedores) And (Ts_ParametrosVendedores.CanFocus) Then
  Begin
    Dbg_Aplicacao.SetFocus;
  End;
end;

procedure TFrmComissaoVendedor.Dbg_UltimaAtualizacaoDblClick( Sender: TObject);
begin
  DMComissaoVendedor.CDS_V_UltimaAtualizacao.Edit;

  If DMComissaoVendedor.CDS_V_UltimaAtualizacaoIMP.AsString='SIM' Then
   DMComissaoVendedor.CDS_V_UltimaAtualizacaoIMP.AsString:='NAO'
  Else
   DMComissaoVendedor.CDS_V_UltimaAtualizacaoIMP.AsString:='SIM';

  DMComissaoVendedor.CDS_V_UltimaAtualizacao.Post;
end;

procedure TFrmComissaoVendedor.Dbg_UltimaAtualizacaoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not (gdSelected in State) Then
  Begin
    if DMComissaoVendedor.CDS_V_UltimaAtualizacaoIMP.AsString='SIM' Then
    Begin
      Dbg_UltimaAtualizacao.Canvas.Brush.Color:=clSkyBlue;
      Dbg_UltimaAtualizacao.Canvas.FillRect(Rect);
      Dbg_UltimaAtualizacao.DefaultDrawDataCell(Rect,Column.Field,state);
    end;
  End; // if not (gdSelected in State) Then

end;

procedure TFrmComissaoVendedor.Dbg_UltimaAtualizacaoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  sMarcar: String;
begin
  // Bloquea TECLA Ctrl+Del ====================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

  // Marca / Desmarca Todas as Lojas para Importação de Vendas =================
  If key=Vk_F5 Then
  Begin
    DMComissaoVendedor.CDS_V_UltimaAtualizacao.First;

    sMarcar:='SIM';
    If DMComissaoVendedor.CDS_V_UltimaAtualizacaoIMP.AsString='SIM' Then
     sMarcar:='NAO';

    While Not DMComissaoVendedor.CDS_V_UltimaAtualizacao.Eof do
    Begin
      DMComissaoVendedor.CDS_V_UltimaAtualizacao.Edit;
      DMComissaoVendedor.CDS_V_UltimaAtualizacaoIMP.AsString:=sMarcar;
      DMComissaoVendedor.CDS_V_UltimaAtualizacao.Post;

      DMComissaoVendedor.CDS_V_UltimaAtualizacao.Next;
    End; // While Not DMComissaoVendedor.CDS_V_UltimaAtualizacao.Eof do
    DMComissaoVendedor.CDS_V_UltimaAtualizacao.First;
  End; // If key=Vk_F5 Then
end;

procedure TFrmComissaoVendedor.Bt_ImportaVendasClick(Sender: TObject);
Var
  bProcOK, bSiga: Boolean;
  dDtaOntem: TDate;
  MySql: String;
  i: Integer;
begin
  Dbg_UltimaAtualizacao.SetFocus;

  // Verifica se Existe loja a Importar ========================================
  bSiga:=False;
  DMComissaoVendedor.CDS_V_UltimaAtualizacao.First;
  DMComissaoVendedor.CDS_V_UltimaAtualizacao.DisableControls;
  While not DMComissaoVendedor.CDS_V_UltimaAtualizacao.Eof do
  Begin
    If DMComissaoVendedor.CDS_V_UltimaAtualizacaoIMP.AsString='SIM' Then
    Begin
      bSiga:=True;
      Break;
    End;

    DMComissaoVendedor.CDS_V_UltimaAtualizacao.Next;
  End; // While not DMComissaoVendedor.CDS_V_UltimaAtualizacao.Eof do
  DMComissaoVendedor.CDS_V_UltimaAtualizacao.EnableControls;
  DMComissaoVendedor.CDS_V_UltimaAtualizacao.First;

  If Not bSiga Then
  Begin
    msg('Sem Loja Selecionada para'+cr+cr+'Importação de Vendas !!','A');
    Exit;
  End;

  Screen.Cursor:=crAppStart;

  // Importa Vendas ============================================================
  sgLojasNConectadas:='';
  bProcOK:=False;

  sgDtaFim:=DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)-1);
  dDtaOntem:=StrToDate(sgDtaFim);
  sgDtaFim:=f_Troca('/','.',f_Troca('-','.',sgDtaFim));

  DMComissaoVendedor.CDS_V_UltimaAtualizacao.First;
  While Not DMComissaoVendedor.CDS_V_UltimaAtualizacao.Eof do
  Begin
    Application.ProcessMessages;

    If Trim(DMComissaoVendedor.CDS_V_UltimaAtualizacaoDATA.AsString)='' Then
     sgDtaInicio:='01/09/2016'
    Else
     sgDtaInicio:=DateToStr(DMComissaoVendedor.CDS_V_UltimaAtualizacaoDATA.AsDateTime+1);

    if (DMComissaoVendedor.CDS_V_UltimaAtualizacaoIMP.AsString='SIM') And (StrToDate(sgDtaInicio)<dDtaOntem) Then
    Begin
      sgCodEmp:=Copy(DMComissaoVendedor.CDS_V_UltimaAtualizacaoCODIGO.AsString,5,2);
      sgDesLoja:=DMComissaoVendedor.CDS_V_UltimaAtualizacaoLOJA.AsString;

      // Apresentacao ==========================================================
      OdirPanApres.Caption:='AGUARDE !! Processando Empresa: '+sgCodEmp+' - '+sgDesLoja;
      OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
      OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmComissaoVendedor.Width-OdirPanApres.Width)/2));
      OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmComissaoVendedor.Height-OdirPanApres.Height)/2))-20;
      OdirPanApres.Font.Style:=[fsBold];
      OdirPanApres.Parent:=FrmComissaoVendedor;
      OdirPanApres.Visible:=True;
      Application.ProcessMessages;
      
      // Conecta Empresa =======================================================
      If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then
       Begin
         bSiga:=True;
       End
      Else
       Begin
         Refresh;
         bSiga:=False;

         If sgLojasNConectadas='' Then
          sgLojasNConectadas:=DMComissaoVendedor.CDS_V_UltimaAtualizacaoCODIGO.AsString
         Else
          sgLojasNConectadas:=', '+DMComissaoVendedor.CDS_V_UltimaAtualizacaoCODIGO.AsString;
       End; // If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then

      // Inicia Processamento ==================================================
      If bSiga Then // Empresa Conectada
      Begin
        // Cria Query da Empresa ------------------------------------
        FrmBelShop.CriaQueryIB('IBDB_'+sgCodEmp,'IBT_'+sgCodEmp, IBQ_ConsultaFilial, True, True);

        // Monta SQL ------------------------------------------------
        sgDtaInicio:=f_Troca('/','.',f_Troca('-','.',sgDtaInicio));

        MySql:=' SELECT 0 NUM_DOCTO, nt.codfilial COD_LOJA, nt.datadocumento DTA_DOCTO,'+
               ' nt.chavenf, nt.numero, nt.numerocupom, nt.serie, nt.codvendedor COD_VENDEDOR,'+
               ' vd.nomevendedor DES_VENDEDOR, nt.codcomprovante COD_COMPROVANTE,'+
               ' it.codproduto COD_PRODUTO, it.quantatendida QTD_ATENDIDA,'+
               ' it.preco VLR_PRECO, it.valbruto VLR_BRUTO, it.valdescitem VLR_DESCITEM,'+
               ' it.valtotal VLR_TOTAL, 0.00 VLR_CONVERSAO'+

               ' FROM MCLI nt'+
               '       LEFT JOIN MCLIPRO  it  ON it.chavenf=nt.chavenf'+
               '       LEFT JOIN VENDEDOR vd  ON vd.codvendedor=nt.codvendedor'+
               '       LEFT JOIN PRODUTO  pr  ON pr.codproduto=it.codproduto'+

               ' WHERE nt.codcomprovante in (''002'', ''007'')'+
               ' AND   pr.codaplicacao=''0006'''+
               ' AND   nt.datadocumento Between '+QuotedStr(sgDtaInicio)+' AND '+QuotedStr(sgDtaFim)+
               ' AND   nt.codfilial='+QuotedStr(sgCodEmp)+
               ' oRDER BY nt.datadocumento, nt.numero';
        IBQ_ConsultaFilial.SQL.Clear;
        IBQ_ConsultaFilial.SQL.Add(MySql);

        // Abre Query -----------------------------------------------
        i:=0;
        bSiga:=False;
        While Not bSiga do
        Begin
          Try
            IBQ_ConsultaFilial.Open;
            bSiga:=True;
          Except
            Inc(i);
          End; // Try

          If i>2 Then
          Begin
            If sgLojasNConectadas='' Then
             sgLojasNConectadas:=DMComissaoVendedor.CDS_V_UltimaAtualizacaoCODIGO.AsString
            Else
             sgLojasNConectadas:=', '+DMComissaoVendedor.CDS_V_UltimaAtualizacaoCODIGO.AsString;

            Break;
          End; // If i>2 Then
        End; // While Not bSiga do

        // Processamento =======================================================
        If bSiga Then // Query Executada
        Begin
          IBQ_ConsultaFilial.Last;
          MontaProgressBar(True, FrmComissaoVendedor);
          pgProgBar.Properties.Max:=IBQ_ConsultaFilial.RecordCount;
          pgProgBar.Position:=0;
          Application.ProcessMessages;
          IBQ_ConsultaFilial.First;

          // Monta Transacao ===================================================
          TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
          TD.IsolationLevel:=xilREADCOMMITTED;
          DMBelShop.SQLC.StartTransaction(TD);
          Try
            Screen.Cursor:=crAppStart;
            DateSeparator:='.';
            DecimalSeparator:='.';

            While Not IBQ_ConsultaFilial.Eof do
            Begin
              Application.ProcessMessages;
              bProcOK:=True;

              // Insere Movimento de Vendas -------------------------
              MySql:=' INSERT INTO FIN_VEND_COMISSAO_VENDAS ('+
                     ' NUM_DOCTO, COD_LOJA, DTA_DOCTO, CHAVENF, NUMERO,'+
                     ' NUMEROCUPOM, SERIE, COD_VENDEDOR, DES_VENDEDOR,'+
                     ' COD_COMPROVANTE, COD_PRODUTO, QTD_ATENDIDA, VLR_PRECO,'+
                     ' VLR_BRUTO, VLR_DESCITEM, VLR_TOTAL, VLR_CONVERSAO)'+
                     ' VALUES ('+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('NUM_DOCTO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('COD_LOJA').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('DTA_DOCTO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('CHAVENF').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('NUMERO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('NUMEROCUPOM').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('SERIE').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('COD_VENDEDOR').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('DES_VENDEDOR').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('COD_COMPROVANTE').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('COD_PRODUTO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('QTD_ATENDIDA').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('VLR_PRECO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('VLR_BRUTO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('VLR_DESCITEM').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('VLR_TOTAL').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('VLR_CONVERSAO').AsString)+')';
              DMBelShop.SQLC.Execute(MySql,nil,nil);

              pgProgBar.Position:=IBQ_ConsultaFilial.RecNo;

              IBQ_ConsultaFilial.Next;
            End; // While Not IBQ_ConsultaFilial.Eof do
            IBQ_ConsultaFilial.Close;
            MontaProgressBar(False, FrmComissaoVendedor);

            // Atualiza ultima Inportação ---------------------------
            MySql:=' UPDATE EMP_CONEXOES e'+
                   ' SET e.dta_ult_atual_vend='+QuotedStr(sgDtaFim)+
                   ' WHERE e.cod_filial='+QuotedStr(sgCodEmp);
            DMBelShop.SQLC.Execute(MySql,nil,nil);

            DMComissaoVendedor.CDS_V_UltimaAtualizacao.Edit;
            DMComissaoVendedor.CDS_V_UltimaAtualizacaoDATA.AsDateTime:=DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)-1;
            DMComissaoVendedor.CDS_V_UltimaAtualizacao.Post;

            // Fecha Transacao =================================================
            DMBelShop.SQLC.Commit(TD);

            DateSeparator:='/';
            DecimalSeparator:=',';
            Screen.Cursor:=crDefault;

          Except
            on e : Exception do
            Begin
              DMBelShop.SQLC.Rollback(TD);

              DateSeparator:='/';
              DecimalSeparator:=',';
              Screen.Cursor:=crDefault;
              MontaProgressBar(False, FrmComissaoVendedor);

              MessageBox(Handle, pChar(sgCodEmp+#13+e.message), 'Erro', MB_ICONERROR);
              Refresh;
            End; // on e : Exception do
          End; // Try

        End; // If bSiga Then // Query Executada
      End; // If bSiga Then // Empresa Conectada

      // Fecha Conexão =========================================================
      ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F');

    End; // if DMComissaoVendedor.CDS_V_UltimaAtualizacaoPROC.AsString='SIM' Then

    DMComissaoVendedor.CDS_V_UltimaAtualizacao.Edit;
    DMComissaoVendedor.CDS_V_UltimaAtualizacaoIMP.AsString:='NAO';
    DMComissaoVendedor.CDS_V_UltimaAtualizacao.Post;

    Application.ProcessMessages;

    DMComissaoVendedor.CDS_V_UltimaAtualizacao.Next;
  End; // While Not DMComissaoVendedor.CDS_V_UltimaAtualizacao.Eof do

  Screen.Cursor:=crDefault;
  OdirPanApres.Visible:=False;

  Refresh;

  If bProcOK Then
   Begin
     DMComissaoVendedor.CDS_V_UltimaAtualizacao.First;
     msg('Importação Efetuada com SUCESSO !!','A');
   End // If bProcOK Then
  Else
   Begin
     msg('IMPORTAÇÃO NÃO REALIZADA !!','A');
   End; //  // If bProcOK Then

  If sgLojasNConectadas<>'' Then
   msg('Lojas Não Conctadas: '+cr+cr+sgLojasNConectadas,'A');

end;

procedure TFrmComissaoVendedor.Dbg_ProdutosComissaoEnter(Sender: TObject);
begin
  bEnterTab:=False;
  THackDBGrid(Dbg_ProdutosComissao).SelectedIndex:=2;
end;

procedure TFrmComissaoVendedor.Dbg_ProdutosComissaoExit(Sender: TObject);
begin
  DMComissaoVendedor.CDS_V_ProdutosAfterPost(DMComissaoVendedor.CDS_V_Produtos);
  bEnterTab:=True;
end;

procedure TFrmComissaoVendedor.Dbg_ProdutosComissaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  s: String;
  i: Integer;
begin
  // BLOQUEAR TECLA Ctrl+Del ===================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
   Key := 0;

  // Localiza Produto ==========================================================
  If Key=VK_F4 Then
  Begin
    If Not DMComissaoVendedor.CDS_V_Produtos.IsEmpty Then
    Begin
      i:=DMComissaoVendedor.CDS_V_Produtos.RecNo;

      s:='';
      If InputQuery('Localizar Produto','',s) then
      Begin
        if Trim(s)<>'' then
        Begin
          Try
            StrToInt(s);
            If Not DMComissaoVendedor.CDS_V_Produtos.Locate('COD_PRODUTO',FormatFloat('000000',StrToInt(s)),[]) Then
            Begin
              DMComissaoVendedor.CDS_V_Produtos.RecNo:=i;
              msg('Produto Não Encontrado !!','A');
            End;
          Except
            s:=AnsiUpperCase(s);
            If Not LocalizaRegistro(DMComissaoVendedor.CDS_V_Produtos, 'APRESENTACAO', s) Then
            Begin
              DMComissaoVendedor.CDS_V_Produtos.RecNo:=i;
              msg('Produto Não Encontrado !!','A');
            End;
          End;
        End; // if Trim(s)<>'' then
      End; // If InputQuery('Localizar Produto','',s) then

      THackDBGrid(Dbg_ProdutosComissao).SelectedIndex:=2;
    End; // If Not DMComissaoVendedor.CDS_V_Produtos.IsEmpty Then
  End; // If Key=VK_F4 Then

end;

procedure TFrmComissaoVendedor.Dbg_ProdutosComissaoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  // Este comando altera cor da Celula
  If (Column.FieldName='FAT_CONVERSAO') Then
  Begin
    If Trim(DMComissaoVendedor.CDS_V_ProdutosFAT_CONVERSAO.AsString)='' Then
    Begin
      Dbg_ProdutosComissao.Canvas.Brush.Color:=clRed;
    End;
  End;

  If (Column.FieldName='DTA_VALIDADE_INI') Then
  Begin
    If (Trim(DMComissaoVendedor.CDS_V_ProdutosDTA_VALIDADE_INI.AsString)='') And
       (Trim(DMComissaoVendedor.CDS_V_ProdutosDTA_VALIDADE_FIM.AsString)<>'') Then
    Begin
      Dbg_ProdutosComissao.Canvas.Brush.Color:=clRed;
    End;
  End;

  If (Column.FieldName='DTA_VALIDADE_FIM') Then
  Begin
    If (Trim(DMComissaoVendedor.CDS_V_ProdutosDTA_VALIDADE_FIM.AsString)='') And
       (Trim(DMComissaoVendedor.CDS_V_ProdutosDTA_VALIDADE_INI.AsString)<>'') Then
    Begin
      Dbg_ProdutosComissao.Canvas.Brush.Color:=clRed;
    End;
  End;

  // Funciona Somente com Isto
  Dbg_ProdutosComissao.Canvas.FillRect(Rect);
  Dbg_ProdutosComissao.DefaultDrawDataCell(Rect,Column.Field,state);

end;

procedure TFrmComissaoVendedor.Dbg_ProdutosComissaoKeyPress(
  Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
   DMComissaoVendedor.CDS_V_Produtos.Next;

end;

procedure TFrmComissaoVendedor.Dbg_UltimaAtualizacaoTitleClick(Column: TColumn);
begin
  If DMComissaoVendedor.CDS_V_UltimaAtualizacao.IsEmpty Then
   Exit;

  With DMComissaoVendedor.CDS_V_UltimaAtualizacao do
  Begin
    If IndexDefs.Count>0 Then
     IndexDefs.Delete(0);

   IndexFieldNames:='';
   IndexName:='';
   If (OrderGrid='') or (OrderGrid='Crescente') Then
    Begin
      AddIndex(Column.FieldName,Column.FieldName,[],Column.FieldName);
      IndexName:= Column.FieldName;
      IndexDefs.Update;

      OrderGrid:='Descendente';
    End
   Else
    Begin
      IndexFieldNames:=Column.FieldName;
      OrderGrid:='Crescente';
    End; // If (OrderGrid='') or (OrderGrid='Crescente') Then
  End; // With DMComissaoVendedor.CDS_V_UltimaAtualizacao do

end;

procedure TFrmComissaoVendedor.Dbg_AplicacaoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  // Bloquea TECLA Ctrl+Del ====================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

end;

procedure TFrmComissaoVendedor.Dbg_FamiliaPrecosKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  // Bloquea TECLA Ctrl+Del ====================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

end;

procedure TFrmComissaoVendedor.Dbg_FamiliaPrecosExit(Sender: TObject);
begin
  DMComissaoVendedor.CDS_V_FamiliaPrecosAfterPost(DMComissaoVendedor.CDS_V_FamiliaPrecos);
  bEnterTab:=True;

end;

procedure TFrmComissaoVendedor.Dbg_FamiliaPrecosEnter(Sender: TObject);
begin
  bEnterTab:=False;

end;

end.
