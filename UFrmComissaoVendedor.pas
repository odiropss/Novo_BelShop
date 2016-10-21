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
  DBXpress, DBClient, SqlExpr, IBQuery, Mask, ToolEdit, CurrEdit, DBGridJul,
  AppEvnts, jpeg, JvExStdCtrls, JvRadioButton;

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
    dxStatusBar3: TdxStatusBar;
    Bt_ImportaProdutos: TJvXPButton;
    Panel3: TPanel;
    Bt_BuscaDocComissao: TJvXPButton;
    EdtCodDocComissao: TCurrencyEdit;
    Label1: TLabel;
    Bt_SalvaComissao: TJvXPButton;
    Bt_CalculaComiisao: TJvXPButton;
    Dbg_ComisVendedores: TDBGrid;
    ApplicationEvents1: TApplicationEvents;
    Bt_Clipboard: TJvXPButton;
    Rb_ComisVendSintetico: TJvRadioButton;
    Rb_ComisVendAnalitico: TJvRadioButton;
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

    Procedure UltimasAtualizacoes;    // Busca Ultima Atualiza��o das Lojas
    Procedure ProdutosCampanhaVendas; // Busca Produtos da Aplica��o e Fam�lia Pre�o

    Procedure Aplicacoes_FamiliaPrecos; // Busca Aplicacoes e FamiliaPrecos

    Procedure MontaProgressBar(bCria: Boolean; Form: TForm);
    Procedure AplicacoesSelecionadas;

    Function  BuscaComissoes(sNrDoc: String): Boolean;
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
    procedure Dbg_FamiliaPrecosExit(Sender: TObject);
    procedure Dbg_FamiliaPrecosEnter(Sender: TObject);
    procedure EdtCodAplicacaoExit(Sender: TObject);
    procedure Dbg_AplicacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodFamiliaPrecosExit(Sender: TObject);
    procedure Bt_BuscaAplicacaoClick(Sender: TObject);
    procedure Bt_BuscaFamiliaPrecoClick(Sender: TObject);
    procedure Dbg_ProdutosComissaoTitleClick(Column: TColumn);
    procedure Bt_ImportaProdutosClick(Sender: TObject);
    procedure Bt_CalculaComiisaoClick(Sender: TObject);
    procedure Bt_BuscaDocComissaoClick(Sender: TObject);
    procedure EdtCodDocComissaoExit(Sender: TObject);
    procedure Dbg_ComisVendedoresDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure EdtCodDocComissaoChange(Sender: TObject);
    procedure Bt_SalvaComissaoClick(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure Dbg_UltimaAtualizacaoEnter(Sender: TObject);
    procedure Dbg_ComisVendedoresEnter(Sender: TObject);
    procedure Dbg_AplicacaoEnter(Sender: TObject);
    procedure Bt_ClipboardClick(Sender: TObject);
    procedure Dbg_ComisVendedoresExit(Sender: TObject);
    procedure Rb_ComisVendSinteticoClick(Sender: TObject);
    procedure Rb_ComisVendSinteticoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

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
  OrderGridDtaAtual, OrderGridProd: String;    // Ordenar Grid

  IBQ_ConsultaFilial  : TIBQuery;

implementation

uses DK_Procs1, UDMComissaoVendedor, UDMBelShop, UFrmBelShop, DB,
  UPesquisaIB, UFrmPeriodoApropriacao, cxCalendar, UPesquisa;

{$R *.dfm}

//==============================================================================
// Odir - INICIO ===============================================================
//==============================================================================

// Busca Aplica��es Selecionadas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmComissaoVendedor.AplicacoesSelecionadas;
Var
  MySql: String;
Begin
  sgAplicacoes:='';
  MySql:=' SELECT ap.des_aux'+
         ' FROM TAB_AUXILIAR ap'+
         ' WHERE ap.tip_aux = 15';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;
  While Not DMBelShop.CDS_Busca.Eof do
  Begin
    If sgAplicacoes='' Then
     sgAplicacoes:=QuotedStr(DMBelShop.CDS_Busca.FieldByName('Des_Aux').AsString)
    Else
     sgAplicacoes:=sgAplicacoes+', '+
                 QuotedStr(DMBelShop.CDS_Busca.FieldByName('Des_Aux').AsString);

    DMBelShop.CDS_Busca.Next;
  End; // While Not DMBelShop.CDS_Busca.Eof do
  DMBelShop.CDS_Busca.Close;
End; // Busca Aplica��es Selecionadas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Comiss�es >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmComissaoVendedor.BuscaComissoes(sNrDoc: String): Boolean;
Var
  MySql: String;
Begin
  Result:=True;
  DMComissaoVendedor.CDS_ComisVendedores.Close;
  DMComissaoVendedor.CDS_ComisVendedores.DisableControls;

  // Aplicacoes Selecionadas ===================================================
  AplicacoesSelecionadas;

  // Monta Select ==============================================================
  MySql:=' select'+
         ' ''Bel_''||cv.cod_loja cod_loja, em.razao_social Loja,'+
         ' Trim(cv.cod_vendedor) cod_vendedor, cv.des_vendedor,'+
         ' Count(distinct coalesce(cv.numero, 0)) Qtd_Notas,'+
         ' sum(Cast(coalesce(cv.qtd_atendida, 0) as Integer)) Qtd_Venda,';

  If sNrDoc='0' Then
   MySql:=
    MySql+' coalesce(cp.fat_conversao, 0.00) VLR_CONVERSAO,'+
          ' sum(Cast(coalesce(cv.qtd_atendida, 0) as Integer)*coalesce(cp.fat_conversao, 0.00)) VLR_COMISSAO'
  Else
   MySql:=
    MySql+' coalesce(cv.vlr_conversao, 0.00) VLR_CONVERSAO,'+
          ' sum(Cast(coalesce(cv.qtd_atendida, 0) as Integer)*coalesce(cv.vlr_conversao, 0.00)) VLR_COMISSAO';

  MySql:=
   MySql+' from FIN_VEND_COMISSAO_VENDAS cv'+
         '       Left Join emp_conexoes em            on em.cod_filial=cv.cod_loja';

  If sNrDoc='0' Then
   MySql:=
    MySql+'       Left Join fin_vend_comissao_prod cp  on cp.cod_produto=cv.cod_produto';

  MySql:=
   MySql+' Where cv.num_docto='+sNrDoc;

  If sNrDoc='0' Then
   MySql:=
    MySql+' and cv.dta_docto between '+QuotedStr(sgDtaInicio)+' and '+QuotedStr(sgDtaFim)+
          ' and cv.cod_aplicacao in ('+sgAplicacoes+')';

  MySql:=
   MySql+' group by 1,2,3,4,7'+

         'UNION'+

         ' select'+
         ' ''Bel_''||cv.cod_loja cod_loja, em.razao_social Loja,'+
         ' ''TOTAL'' cod_vendedor, cv.des_vendedor,'+
         ' Count(distinct coalesce(cv.numero, 0)) Qtd_Notas,'+
         ' sum(Cast(coalesce(cv.qtd_atendida, 0) as Integer)) Qtd_Venda,'+
         ' 0.00 VLR_CONVERSAO,';

  If sNrDoc='0' Then
   MySql:=
    MySql+' sum(Cast(coalesce(cv.qtd_atendida, 0) as Integer)*coalesce(cp.fat_conversao, 0.00)) VLR_COMISSAO'
  Else
   MySql:=
    MySql+' sum(Cast(coalesce(cv.qtd_atendida, 0) as Integer)*coalesce(cv.vlr_conversao, 0.00)) VLR_COMISSAO';

  MySql:=
   MySql+' from fin_vend_comissao_vendas cv'+
         '       Left Join emp_conexoes em            on em.cod_filial=cv.cod_loja';

  If sNrDoc='0' Then
   MySql:=
    MySql+'      Left Join fin_vend_comissao_prod cp  on cp.cod_produto=cv.cod_produto';

  MySql:=
   MySql+' Where cv.num_docto='+sNrDoc;

  If sNrDoc='0' Then
   MySql:=
    MySql+' and cv.dta_docto between '+QuotedStr(sgDtaInicio)+' and '+QuotedStr(sgDtaFim)+
          ' and cv.cod_aplicacao in ('+sgAplicacoes+')';

  MySql:=
   MySql+' group by 1,2,3,4'+

         ' UNION'+

         ' select'+
         ' ''Bel_''||cv.cod_loja cod_loja, em.razao_social Loja,'+
         ' ''TOTAL DA LOJA'' cod_vendedor, '''' des_vendedor,'+
         ' Count(distinct coalesce(cv.numero, 0)) Qtd_Notas,'+
         ' sum(Cast(coalesce(cv.qtd_atendida, 0) as Integer)) Qtd_Venda,'+
         ' 0.00 VLR_CONVERSAO,';

  If sNrDoc='0' Then
   MySql:=
    MySql+' sum(Cast(coalesce(cv.qtd_atendida, 0) as Integer)*coalesce(cp.fat_conversao, 0.00)) VLR_COMISSAO'
  Else
   MySql:=
    MySql+' sum(Cast(coalesce(cv.qtd_atendida, 0) as Integer)*coalesce(cv.vlr_conversao, 0.00)) VLR_COMISSAO';

  MySql:=
   MySql+' from fin_vend_comissao_vendas cv'+
         '       Left Join emp_conexoes em            on em.cod_filial=cv.cod_loja';

  If sNrDoc='0' Then
   MySql:=
    MySql+'      Left Join fin_vend_comissao_prod cp  on cp.cod_produto=cv.cod_produto';

  MySql:=
   MySql+' Where cv.num_docto='+sNrDoc;

  If sNrDoc='0' Then
   MySql:=
    MySql+' and cv.dta_docto between '+QuotedStr(sgDtaInicio)+' and '+QuotedStr(sgDtaFim)+
          ' and cv.cod_aplicacao in ('+sgAplicacoes+')';

  MySql:=
   MySql+' group by 1,2,3,4'+

         ' UNION'+

         ' select'+

         ' '''' cod_loja, ''TOTAL DA EMPRESA: ''||'+QuotedStr(sgDtaInicio)+'||'' a ''||'+QuotedStr(sgDtaFim)+' Loja,'+
         ' '''' cod_vendedor, ''CAMPANHA DE VENDAS'' des_vendedor,'+
         ' Count(distinct coalesce(cv.numero, 0)) Qtd_Notas,'+
         ' sum(Cast(coalesce(cv.qtd_atendida, 0) as Integer)) Qtd_Venda,'+
         ' 0.00 VLR_CONVERSAO,';

  If sNrDoc='0' Then
   MySql:=
    MySql+' sum(Cast(coalesce(cv.qtd_atendida, 0) as Integer)*coalesce(cp.fat_conversao, 0.00)) VLR_COMISSAO'
  Else
   MySql:=
    MySql+' sum(Cast(coalesce(cv.qtd_atendida, 0) as Integer)*coalesce(cv.vlr_conversao, 0.00)) VLR_COMISSAO';

  MySql:=
   MySql+' from fin_vend_comissao_vendas cv'+
         '       Left Join emp_conexoes em            on em.cod_filial=cv.cod_loja';

  If sNrDoc='0' Then
   MySql:=
    MySql+'      Left Join fin_vend_comissao_prod cp  on cp.cod_produto=cv.cod_produto';

  MySql:=
   MySql+' Where cv.num_docto='+sNrDoc;

  If sNrDoc='0' Then
   MySql:=
    MySql+' and cv.dta_docto between '+QuotedStr(sgDtaInicio)+' and '+QuotedStr(sgDtaFim)+
          ' and cv.cod_aplicacao in ('+sgAplicacoes+')';

  MySql:=
   MySql+' order by 1,4,3,2';
  DMComissaoVendedor.CDS_ComisVendedores.Close;
  DMComissaoVendedor.SDS_ComisVendedores.CommandText:=MySql;
  DMComissaoVendedor.CDS_ComisVendedores.Open;

  Rb_ComisVendAnalitico.Checked:=True;
  Rb_ComisVendSinteticoClick(Self);

  DMComissaoVendedor.CDS_ComisVendedores.EnableControls;

  sgAplicacoes:='';

  If DMComissaoVendedor.CDS_ComisVendedores.RecordCount<2 Then
  Begin
    Result:=False;
    If sNrDoc='0' Then
     msg('Sem Comiss�o no Per�odo de'+cr+cr+QuotedStr(sgDtaInicio)+' a '+QuotedStr(sgDtaFim),'A')
    Else
     msg('Documento N�o Encontrado !!','A');

    DMComissaoVendedor.CDS_ComisVendedores.Close;
  End;
End; // Busca Comiss�es >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Aplicacoes e FamiliaPrecos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmComissaoVendedor.Aplicacoes_FamiliaPrecos;
Var
  MySql: String;
Begin
  // Busca Aplica�oes ==========================================================
  MySql:=' SELECT DISTINCT Trim(pr.nomeaplicacao) DES_APLICACAO,'+
         '                 Trim(pr.codaplicacao)  COD_APLICACAO'+
         ' FROM PRODUTO pr, TAB_AUXILIAR ap'+
         ' WHERE Trim(pr.codaplicacao)=Trim(ap.Des_Aux)'+
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

  // Busca Familia de Pre�os ===================================================
  MySql:=' SELECT DISTINCT Trim(pr.nomefamiliapreco) des_familia,'+
         '        Trim(pr.codfamiliapreco) cod_familia,'+
         '        fa.vlr_aux vlr_conversao'+
         ' FROM PRODUTO pr, TAB_AUXILIAR fa'+
         ' WHERE Trim(pr.codfamiliapreco)=Trim(fa.Des_Aux)'+
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

// Busca Produtos da Aplica��o e Fam�lia Pre�o >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmComissaoVendedor.ProdutosCampanhaVendas;
Var
  MySql: String;
Begin
  // Verifica se Transa��o esta Ativa
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

    // Inclui Novos Produtos da Aplica��o 0006
    MySql:=' INSERT INTO FIN_VEND_COMISSAO_PROD'+
           ' SELECT pr.codproduto COD_PRODUTO,'+
           ' COALESCE(fp.vlr_aux, 0.00) FAT_CONVERSAO,'+
           ' TRIM(pr.codaplicacao) COD_APLICACAO,'+
           ' TRIM(pr.codfamiliapreco) COD_FAMILIA_PRECO,'+
           ' NULL DTA_VALIDADE_INI, NULL DTA_VALIDADE_FIM, '+
           QuotedStr(Cod_Usuario)+' USU_INCLUI, CURRENT_TIMESTAMP DTA_INCLUI,'+
           ' NULL USU_ALTERA, NULL DTA_ALTERA'+

           ' FROM PRODUTO pr'+
           '       LEFT JOIN  TAB_AUXILIAR fp  ON Trim(fp.des_aux)=Trim(pr.codfamiliapreco)'+
           '                                  AND fp.tip_aux=16'+

           ' WHERE pr.codaplicacao=''0006'''+
           ' AND NOT EXISTS (SELECT 1'+
           '                 FROM FIN_VEND_COMISSAO_PROD vp'+
           '                 WHERE vp.cod_produto=pr.codproduto)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Delete Novos Produtos que N�o S�o Mais da Aplica��o 0006
    MySql:=' DELETE FROM FIN_VEND_COMISSAO_PROD vp'+
           ' WHERE NOT EXISTS(SELECT 1'+
           '                  FROM PRODUTO pr'+
           '                  WHERE pr.codaplicacao = ''0006'''+
           '                  AND   pr.codproduto = vp.cod_produto)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Apresenta Produtos da Aplica��o 0006
    MySql:=' SELECT vp.COD_PRODUTO, pr.APRESENTACAO, vp.FAT_CONVERSAO,'+
           '        vp.DTA_VALIDADE_INI, vp.DTA_VALIDADE_FIM'+
           ' FROM FIN_VEND_COMISSAO_PROD vp, PRODUTO pr'+
           ' WHERE vp.COD_PRODUTO=pr.CODPRODUTO'+
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

End; // Busca Produtos da Aplica��o e Fam�lia Pre�o >>>>>>>>>>>>>>>>>>>>>>>>>>>>

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

// Busca Ultimas Atualiza��es das Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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
End; // Busca Ultimas Atualiza��es das Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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
     msg('Para Fechar Tecle no Bot�o <Fechar>...','A');
     Action := caNone;
   End;

end;

procedure TFrmComissaoVendedor.FormCreate(Sender: TObject);
begin
  bEnterTab:=True;

  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  Application.OnMessage := ApplicationEvents1Message;

  // Busca Ultimas Atualiza��es e Produtos da Aplica��o, e Familia de Pre�os ===
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

  If (PC_ComissaoVendedor.ActivePage=Ts_ParametrosVendedores) And (Ts_ParametrosVendedores.CanFocus) Then
  Begin
    Dbg_Aplicacao.SetFocus;
  End;
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
    Bt_Clipboard.Visible:=False;
    Rb_ComisVendSintetico.Visible:=False;
    Rb_ComisVendAnalitico.Visible:=False;
    Dbg_UltimaAtualizacao.SetFocus;
  End;

  If (PC_ComissaoVendedor.ActivePage=Ts_ParametrosVendedores) And (Ts_ParametrosVendedores.CanFocus) Then
  Begin
    Bt_Clipboard.Visible:=False;
    Rb_ComisVendSintetico.Visible:=False;
    Rb_ComisVendAnalitico.Visible:=False;
    Dbg_Aplicacao.SetFocus;
  End;

  If (PC_ComissaoVendedor.ActivePage=Ts_Comissoes) And (Ts_Comissoes.CanFocus) Then
  Begin
    Bt_Clipboard.Visible:=True;
    Rb_ComisVendSintetico.Visible:=True;
    Rb_ComisVendAnalitico.Visible:=True;
    Dbg_ComisVendedores.SetFocus;
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

  // Marca / Desmarca Todas as Lojas para Importa��o de Vendas =================
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
  dDtaI, dDtaF: TDate;
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
    msg('Sem Loja Selecionada para'+cr+cr+'Importa��o de Vendas !!','A');
    Exit;
  End;

  // Solicita o Periodo de Apropria��o de Vendas dos Vendedores ===============
  bgSiga:=False;
  FrmPeriodoApropriacao:=TFrmPeriodoApropriacao.Create(Self);
  FrmPeriodoApropriacao.sgTipoProc:='CV'; // Comiss�o de Vendedores
  If Trim(DMComissaoVendedor.CDS_V_UltimaAtualizacaoDATA.AsString)='' Then
   sgDtaInicio:='01/09/2016'
  Else
   sgDtaInicio:=DateToStr(DMComissaoVendedor.CDS_V_UltimaAtualizacaoDATA.AsDateTime+1);

  FrmPeriodoApropriacao.ShowModal;

  dDtaI:=FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Date;
  dDtaF:=FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Date;

  FreeAndNil(FrmPeriodoApropriacao);

  If Not bgSiga Then
   Exit;

  Screen.Cursor:=crAppStart;

  // Aplicacoes Selecionadas ===================================================
  AplicacoesSelecionadas;

  // Importa Vendas ============================================================
  sgLojasNConectadas:='';
  bProcOK:=False;

  sgDtaFim:=DateToStr(dDtaF);
  sgDtaFim:=f_Troca('/','.',f_Troca('-','.',sgDtaFim));

  DMComissaoVendedor.CDS_V_UltimaAtualizacao.First;
  While Not DMComissaoVendedor.CDS_V_UltimaAtualizacao.Eof do
  Begin
    Application.ProcessMessages;

    If Trim(DMComissaoVendedor.CDS_V_UltimaAtualizacaoDATA.AsString)='' Then
     sgDtaInicio:=DateToStr(dDtaI)
    Else
     sgDtaInicio:=DateToStr(DMComissaoVendedor.CDS_V_UltimaAtualizacaoDATA.AsDateTime+1);

    if (DMComissaoVendedor.CDS_V_UltimaAtualizacaoIMP.AsString='SIM') And (StrToDate(sgDtaInicio)<dDtaF) Then
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

        MySql:=' SELECT 0 NUM_DOCTO, nt.codfilial COD_LOJA,'+
               ' nt.datadocumento DTA_DOCTO, nt.datacomprovante DTA_COMPRV,'+
               ' nt.chavenf, nt.numero, nt.numerocupom, nt.serie,'+
               ' Trim(nt.codvendedor) COD_VENDEDOR, Trim(vd.nomevendedor) DES_VENDEDOR,'+
               ' nt.codcomprovante COD_COMPROVANTE,'+
               ' it.codproduto COD_PRODUTO, pr.apresentacao DES_PRODUTO,'+
               ' pr.codaplicacao COD_APLICACAO, ap.nomeaplicacao DES_APLICACAO,'+
               ' pr.codfamiliapreco COD_FAMILIA_PRECO, fa.nomefamiliapreco DES_FAMILIAPRECO,'+
               ' it.quantatendida QTD_ATENDIDA,'+
               ' it.preco VLR_PRECO, it.valbruto VLR_BRUTO, it.valdescitem VLR_DESCITEM,'+
               ' it.valtotal VLR_TOTAL, 0.00 VLR_CONVERSAO';

  // Monta para Contagem
  MySqlSelect:=' FROM MCLI nt'+
               '       LEFT JOIN MCLIPRO  it  ON it.chavenf=nt.chavenf'+
               '       LEFT JOIN VENDEDOR vd  ON vd.codvendedor=nt.codvendedor'+
               '       LEFT JOIN PRODUTO  pr  ON pr.codproduto=it.codproduto'+
               '       LEFT JOIN APLICA   ap  ON ap.codaplicacao=pr.codaplicacao'+
               '       LEFT JOIN FAMILIAP fa  ON fa.codfamiliapreco=pr.codfamiliapreco'+

               ' WHERE nt.codcomprovante in (''002'', ''007'')';

               If Trim(sgAplicacoes)<>'' Then
                MySqlSelect:=
                 MySqlSelect+' AND   pr.codaplicacao in ('+sgAplicacoes+')';

  MySqlSelect:=
   MySqlSelect+' AND   nt.datadocumento Between '+QuotedStr(sgDtaInicio)+' AND '+QuotedStr(sgDtaFim)+
               ' AND   nt.codfilial='+QuotedStr(sgCodEmp);

        // Abre Query -----------------------------------------------
        i:=0;
        bSiga:=False;
        While Not bSiga do
        Begin
          Try
            igTotInteiro:=FrmBelShop.TotalRegistros(IBQ_ConsultaFilial, MySqlSelect);

            IBQ_ConsultaFilial.SQL.Clear;
            IBQ_ConsultaFilial.SQL.Add(MySql+MySqlSelect);
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
          MontaProgressBar(True, FrmComissaoVendedor);
          pgProgBar.Properties.Max:=igTotInteiro;
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
                     ' NUM_DOCTO, COD_LOJA, DTA_DOCTO, DTA_COMPRV, CHAVENF, NUMERO,'+
                     ' NUMEROCUPOM, SERIE, COD_VENDEDOR, DES_VENDEDOR,'+
                     ' COD_COMPROVANTE, COD_PRODUTO, DES_PRODUTO,'+
                     ' COD_APLICACAO, DES_APLICACAO,'+
                     ' COD_FAMILIA_PRECO, DES_FAMILIAPRECO,'+
                     ' QTD_ATENDIDA, VLR_PRECO,'+
                     ' VLR_BRUTO, VLR_DESCITEM, VLR_TOTAL, VLR_CONVERSAO)'+
                     ' VALUES ('+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('NUM_DOCTO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('COD_LOJA').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('DTA_DOCTO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('DTA_COMPRV').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('CHAVENF').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('NUMERO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('NUMEROCUPOM').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('SERIE').AsString)+', '+
                     QuotedStr(Trim(IBQ_ConsultaFilial.FieldByName('COD_VENDEDOR').AsString))+', '+
                     QuotedStr(Trim(IBQ_ConsultaFilial.FieldByName('DES_VENDEDOR').AsString))+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('COD_COMPROVANTE').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('COD_PRODUTO').AsString)+', '+
                     QuotedStr(Trim(IBQ_ConsultaFilial.FieldByName('DES_PRODUTO').AsString))+', '+
                     QuotedStr(Trim(IBQ_ConsultaFilial.FieldByName('COD_APLICACAO').AsString))+', '+
                     QuotedStr(Trim(IBQ_ConsultaFilial.FieldByName('DES_APLICACAO').AsString))+', '+
                     QuotedStr(Trim(IBQ_ConsultaFilial.FieldByName('COD_FAMILIA_PRECO').AsString))+', '+
                     QuotedStr(Trim(IBQ_ConsultaFilial.FieldByName('DES_FAMILIAPRECO').AsString))+', '+
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

            // Atualiza ultima Inporta��o ---------------------------
            MySql:=' UPDATE EMP_CONEXOES e'+
                   ' SET e.dta_ult_atual_vend='+QuotedStr(sgDtaFim)+
                   ' WHERE e.cod_filial='+QuotedStr(sgCodEmp);
            DMBelShop.SQLC.Execute(MySql,nil,nil);

            DMComissaoVendedor.CDS_V_UltimaAtualizacao.Edit;
            DMComissaoVendedor.CDS_V_UltimaAtualizacaoDATA.AsDateTime:=dDtaF;
            DMComissaoVendedor.CDS_V_UltimaAtualizacaoIMP.AsString:='NAO';
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

      // Fecha Conex�o =========================================================
      ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F');

    End; // if DMComissaoVendedor.CDS_V_UltimaAtualizacaoPROC.AsString='SIM' Then

    Application.ProcessMessages;

    DMComissaoVendedor.CDS_V_UltimaAtualizacao.Next;
  End; // While Not DMComissaoVendedor.CDS_V_UltimaAtualizacao.Eof do

  Screen.Cursor:=crDefault;
  OdirPanApres.Visible:=False;

  Refresh;

  If bProcOK Then
   Begin
     DMComissaoVendedor.CDS_V_UltimaAtualizacao.First;
     msg('Importa��o Efetuada com SUCESSO !!','A');
   End // If bProcOK Then
  Else
   Begin
     msg('IMPORTA��O N�O REALIZADA !!','A');
   End; //  // If bProcOK Then

  If sgLojasNConectadas<>'' Then
   msg('Lojas N�o Conctadas: '+cr+cr+sgLojasNConectadas,'A');

end;

procedure TFrmComissaoVendedor.Dbg_ProdutosComissaoEnter(Sender: TObject);
begin
  bEnterTab:=False;
  THackDBGrid(Dbg_ProdutosComissao).SelectedIndex:=2;

  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_ProdutosComissaoEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmComissaoVendedor.Dbg_ProdutosComissaoExit(Sender: TObject);
begin
  If (DMComissaoVendedor.CDS_V_Produtos.State=dsInsert) Or (DMComissaoVendedor.CDS_V_Produtos.State=dsEdit) Then
   DMComissaoVendedor.CDS_V_ProdutosAfterPost(DMComissaoVendedor.CDS_V_Produtos);

  ApplicationEvents1.OnActivate:=nil;
  Application.OnMessage := nil;

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
              msg('Produto N�o Encontrado !!','A');
            End;
          Except
            s:=AnsiUpperCase(s);
            If Not LocalizaRegistro(DMComissaoVendedor.CDS_V_Produtos, 'APRESENTACAO', s) Then
            Begin
              DMComissaoVendedor.CDS_V_Produtos.RecNo:=i;
              msg('Produto N�o Encontrado !!','A');
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
   If (OrderGridDtaAtual='') or (OrderGridDtaAtual='Crescente') Then
    Begin
      AddIndex(Column.FieldName,Column.FieldName,[],Column.FieldName);
      IndexName:= Column.FieldName;
      IndexDefs.Update;

      OrderGridDtaAtual:='Descendente';
    End
   Else
    Begin
      IndexFieldNames:=Column.FieldName;
      OrderGridDtaAtual:='Crescente';
    End; // If (OrderGridDtaAtual='') or (OrderGridDtaAtual='Crescente') Then
  End; // With DMComissaoVendedor.CDS_V_UltimaAtualizacao do

end;

procedure TFrmComissaoVendedor.Dbg_AplicacaoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  //============================================================================
  // USADO NOS DOIS GRIDS ======================================================
  //============================================================================

  // Bloquea TECLA Ctrl+Del ====================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;
end;

procedure TFrmComissaoVendedor.Dbg_FamiliaPrecosExit(Sender: TObject);
begin
  If (DMComissaoVendedor.CDS_V_FamiliaPrecos.State=dsInsert) Or (DMComissaoVendedor.CDS_V_FamiliaPrecos.State=dsEdit) Then
   DMComissaoVendedor.CDS_V_FamiliaPrecosAfterPost(DMComissaoVendedor.CDS_V_FamiliaPrecos);

  ApplicationEvents1.OnActivate:=nil;
  Application.OnMessage := nil;

  bEnterTab:=True;
end;

procedure TFrmComissaoVendedor.Dbg_FamiliaPrecosEnter(Sender: TObject);
begin
  bEnterTab:=False;

  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_FamiliaPrecosEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;
end;

procedure TFrmComissaoVendedor.EdtCodAplicacaoExit(Sender: TObject);
Var
  MySql: String;
begin

  If EdtCodAplicacao.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    If Not ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'A') Then
    Begin
      msg('Erro de Conex�o ao Banco de Dados do CD !!','X');
      Exit;
    end;

    FrmBelShop.CriaQueryIB('IBDB_99','IBT_99', IBQ_ConsultaFilial, True, True);

    // Busca Aplica�oes ========================================================
    MySql:=' SELECT a.NomeAplicacao, a.CodAplicacao'+
           ' FROM APLICA a'+
           ' WHERE a.CodAplicacao='+VarToStr(EdtCodAplicacao.Value);
    IBQ_ConsultaFilial.Close;
    IBQ_ConsultaFilial.SQL.Clear;
    IBQ_ConsultaFilial.SQL.Add(MySql);
    IBQ_ConsultaFilial.Open;

    Screen.Cursor:=crDefault;

    If Trim(IBQ_ConsultaFilial.FieldByName('CodAplicacao').AsString)='' Then
    Begin
      msg('Aplica��o N�O Encontrada !!!', 'A');

      IBQ_ConsultaFilial.Close;
      ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
      EdtCodAplicacao.Clear;
      EdtCodAplicacao.SetFocus;
      Exit;
    End; // If Trim(IBQ_ConsultaFilial.FieldByName('CodAplicacao').AsString)='' Then

    If DMComissaoVendedor.CDS_V_Aplicacao.Locate('Cod_Aplicacao',Trim(IBQ_ConsultaFilial.FieldByName('CodAplicacao').AsString),[]) Then
    Begin
      Begin
        msg('Aplica��o J� Informada !!','A');

        IBQ_ConsultaFilial.Close;
        ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
        EdtCodAplicacao.Clear;
        EdtCodAplicacao.SetFocus;
        Exit;
      End;
    End;

    DMComissaoVendedor.CDS_V_Aplicacao.Insert;
    DMComissaoVendedor.CDS_V_AplicacaoCod_Aplicacao.AsString:=
                  Trim(IBQ_ConsultaFilial.FieldByName('CodAplicacao').AsString);
    DMComissaoVendedor.CDS_V_AplicacaoDes_Aplicacao.AsString:=
                 Trim(IBQ_ConsultaFilial.FieldByName('NomeAplicacao').AsString);
    DMComissaoVendedor.CDS_V_Aplicacao.Post;

    IBQ_ConsultaFilial.Close;
    EdtCodAplicacao.Text:='0';
    EdtCodAplicacao.SetFocus;

    ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F')
  End;
end;

procedure TFrmComissaoVendedor.Dbg_AplicacaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  //============================================================================
  // Tratamento Grid Dbg_Aplicacao =============================================
  //============================================================================
  If (Sender as TDBGrid).Name='Dbg_Aplicacao' Then
  Begin
    // Delete Aplica��o ---------------------------------------------
    If (Key=VK_Delete) And (Not DMComissaoVendedor.CDS_V_Aplicacao.IsEmpty) Then
    Begin
      If Trim(DMComissaoVendedor.CDS_V_AplicacaoCOD_APLICACAO.AsString)='0006' Then
      Begin
        msg('Imposs�vel Excluir a Aplica��o'+cr+cr+Trim(DMComissaoVendedor.CDS_V_AplicacaoDES_APLICACAO.AsString),'A');
        Exit;
      End;

      If msg('Deseja Realmente EXCLUIR a'+cr+'Aplica��o SELECIONADA ??','C')=2 Then
       Exit;

      DMComissaoVendedor.CDS_V_Aplicacao.Delete;
    End; // If (Key=VK_Delete) And (Not DMComissaoVendedor.CDS_V_Aplicacao.IsEmpty) Then

    Dbg_Aplicacao.SetFocus;
  End; // If (Sender as TDBGrid).Name='Dbg_Aplicacao' Then

  //============================================================================
  // Tratamento Grid Dbg_FamiliaPrecos =========================================
  //============================================================================
  If (Sender as TDBGrid).Name='Dbg_FamiliaPrecos' Then
  Begin
    // Delete Familia de Pre�o --------------------------------------
    If (Key=VK_Delete) And (Not DMComissaoVendedor.CDS_V_FamiliaPrecos.IsEmpty) Then
    Begin
      If msg('Deseja Realmente EXCLUIR o'+cr+'Agrupamento de Pre�o'+cr+'SELECIONADO ??','C')=2 Then
       Exit;

      DMComissaoVendedor.CDS_V_FamiliaPrecos.Delete;
    End; // If (Key=VK_Delete) And (Not DMComissaoVendedor.CDS_V_FamiliaPrecos.IsEmpty) Then

    Dbg_FamiliaPrecos.SetFocus;
  End; // If (Sender as TDBGrid).Name='Dbg_FamiliaPrecos' Then

end;

procedure TFrmComissaoVendedor.EdtCodFamiliaPrecosExit(Sender: TObject);
Var
  MySql: String;
begin

  If EdtCodFamiliaPrecos.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    If Not ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'A') Then
    Begin
      msg('Erro de Conex�o ao Banco de Dados do CD !!','X');
      Exit;
    end;

    FrmBelShop.CriaQueryIB('IBDB_99','IBT_99', IBQ_ConsultaFilial, True, True);

    // Busca Aplica�oes ========================================================
    MySql:=' SELECT f.NomeFamiliaPreco, f.CodFamiliaPreco'+
           ' FROM FAMILIAP f'+
           ' WHERE f.CodFamiliaPreco='+VarToStr(EdtCodFamiliaPrecos.Value);
    IBQ_ConsultaFilial.Close;
    IBQ_ConsultaFilial.SQL.Clear;
    IBQ_ConsultaFilial.SQL.Add(MySql);
    IBQ_ConsultaFilial.Open;

    Screen.Cursor:=crDefault;

    If Trim(IBQ_ConsultaFilial.FieldByName('CodFamiliaPreco').AsString)='' Then
    Begin
      msg('Familia Pre�o N�O Encontrada !!!', 'A');

      IBQ_ConsultaFilial.Close;
      ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
      EdtCodFamiliaPrecos.Clear;
      EdtCodFamiliaPrecos.SetFocus;
      Exit;
    End; // If Trim(IBQ_ConsultaFilial.FieldByName('CodFamiliaPreco').AsString)='' Then

    If DMComissaoVendedor.CDS_V_FamiliaPrecos.Locate('Cod_Familia',Trim(IBQ_ConsultaFilial.FieldByName('CodFamiliaPreco').AsString),[]) Then
    Begin
      Begin
        msg('Familia Pre�o J� Informada !!','A');

        IBQ_ConsultaFilial.Close;
        ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
        EdtCodFamiliaPrecos.Clear;
        EdtCodFamiliaPrecos.SetFocus;
        Exit;
      End;
    End;

    DMComissaoVendedor.CDS_V_FamiliaPrecos.Insert;
    DMComissaoVendedor.CDS_V_FamiliaPrecosCOD_FAMILIA.AsString:=
               Trim(IBQ_ConsultaFilial.FieldByName('CodFamiliaPreco').AsString);
    DMComissaoVendedor.CDS_V_FamiliaPrecosDES_FAMILIA.AsString:=
              Trim(IBQ_ConsultaFilial.FieldByName('NomeFamiliaPreco').AsString);
    DMComissaoVendedor.CDS_V_FamiliaPrecosFAT_CONVERSAO.AsCurrency:=0.00;
    DMComissaoVendedor.CDS_V_FamiliaPrecos.Post;

    IBQ_ConsultaFilial.Close;
    EdtCodFamiliaPrecos.Text:='0';
    EdtCodFamiliaPrecos.SetFocus;

    ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F')
  End;
end;

procedure TFrmComissaoVendedor.Bt_BuscaAplicacaoClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_Aplicacao.SetFocus;
  
  If Not ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'A') Then
  Begin
    msg('Erro de Conex�o ao Banco de Dados do CD !!','X');
    Exit;
  End;

  FrmBelShop.CriaQueryIB('IBDB_99','IBT_99', IBQ_ConsultaFilial, True, True);

  // ========== EFETUA A CONEX�O ===============================================
  FrmPesquisaIB:=TFrmPesquisaIB.Create(Self);

  FrmPesquisaIB.IBCDS_Pesquisa.DBConnection:=IBQ_ConsultaFilial.Database;
  FrmPesquisaIB.IBCDS_Pesquisa.DBTransaction:=IBQ_ConsultaFilial.Transaction;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  // Busca Aplica��es ==========================================================
  MySql:=' SELECT a.NomeAplicacao, a.CodAplicacao'+
         ' FROM APLICA a'+
         ' ORDER BY a.NomeAplicacao';
  FrmPesquisaIB.IBCDS_Pesquisa.Close;
  FrmPesquisaIB.IBCDS_Pesquisa.CommandText:=MySql;
  FrmPesquisaIB.IBCDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(FrmPesquisaIB.IBCDS_Pesquisa.FieldByName('CodAplicacao').AsString)='' Then
  Begin
    msg('Sem Registro a Listar !!','A');
    EdtCodAplicacao.Clear;
    ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
    FreeAndNil(FrmPesquisaIB);
    EdtCodAplicacao.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisaIB.Campo_pesquisa:='NomeAplicacao';
  FrmPesquisaIB.Campo_Codigo:='CodAplicacao';
  FrmPesquisaIB.Campo_Descricao:='NomeAplicacao';
  FrmPesquisaIB.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisaIB.ShowModal;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'') and (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'0')Then
  Begin
    If DMComissaoVendedor.CDS_V_Aplicacao.Locate('COD_APLICACAO',Trim(FrmPesquisaIB.EdtCodigo.Text),[]) Then
    Begin
      Begin
        msg('Aplica��o J� Informada !!','A');
        EdtCodAplicacao.Clear;
        ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
        FreeAndNil(FrmPesquisaIB);
        EdtCodAplicacao.SetFocus;
        Exit;
      End;
    End;

    DMComissaoVendedor.CDS_V_Aplicacao.Insert;
    DMComissaoVendedor.CDS_V_AplicacaoCOD_APLICACAO.AsString:=Trim(FrmPesquisaIB.EdtCodigo.Text);
    DMComissaoVendedor.CDS_V_AplicacaoDES_APLICACAO.AsString:=Trim(FrmPesquisaIB.EdtDescricao.Text);
    DMComissaoVendedor.CDS_V_Aplicacao.Post;

  End; // If (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'') and (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'0')Then

  ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
  FreeAndNil(FrmPesquisaIB);
end;

procedure TFrmComissaoVendedor.Bt_BuscaFamiliaPrecoClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_FamiliaPrecos.SetFocus;

  If Not ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'A') Then
  Begin
    msg('Erro de Conex�o ao Banco de Dados do CD !!','X');
    Exit;
  End;

  FrmBelShop.CriaQueryIB('IBDB_99','IBT_99', IBQ_ConsultaFilial, True, True);

  // ========== EFETUA A CONEX�O ===============================================
  FrmPesquisaIB:=TFrmPesquisaIB.Create(Self);

  FrmPesquisaIB.IBCDS_Pesquisa.DBConnection:=IBQ_ConsultaFilial.Database;
  FrmPesquisaIB.IBCDS_Pesquisa.DBTransaction:=IBQ_ConsultaFilial.Transaction;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  // Busca Aplica��es ==========================================================
  MySql:=' SELECT f.NomeFamiliaPreco, f.CodFamiliaPreco'+
         ' FROM FAMILIAP f'+
         ' ORDER BY f.NomeFamiliaPreco';
  FrmPesquisaIB.IBCDS_Pesquisa.Close;
  FrmPesquisaIB.IBCDS_Pesquisa.CommandText:=MySql;
  FrmPesquisaIB.IBCDS_Pesquisa.Open;
                                                           
  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(FrmPesquisaIB.IBCDS_Pesquisa.FieldByName('CodFamiliaPreco').AsString)='' Then
  Begin
    msg('Sem Registro a Listar !!','A');
    EdtCodFamiliaPrecos.Clear;
    ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
    FreeAndNil(FrmPesquisaIB);
    EdtCodFamiliaPrecos.SetFocus;
    Exit;
  End;                                 

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisaIB.Campo_pesquisa:='NomeFamiliaPreco';
  FrmPesquisaIB.Campo_Codigo:='CodFamiliaPreco';
  FrmPesquisaIB.Campo_Descricao:='NomeFamiliaPreco';
  FrmPesquisaIB.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisaIB.ShowModal;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'') and (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'0')Then
  Begin
    If DMComissaoVendedor.CDS_V_FamiliaPrecos.Locate('COD_FAMILIA',Trim(FrmPesquisaIB.EdtCodigo.Text),[]) Then
    Begin
      Begin
        msg('Agrupamento de Precos J� Informada !!','A');
        EdtCodFamiliaPrecos.Clear;
        ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
        FreeAndNil(FrmPesquisaIB);
        EdtCodFamiliaPrecos.SetFocus;
        Exit;
      End;
    End;

    DMComissaoVendedor.CDS_V_FamiliaPrecos.Insert;
    DMComissaoVendedor.CDS_V_FamiliaPrecosCOD_FAMILIA.AsString:=Trim(FrmPesquisaIB.EdtCodigo.Text);
    DMComissaoVendedor.CDS_V_FamiliaPrecosDES_FAMILIA.AsString:=Trim(FrmPesquisaIB.EdtDescricao.Text);
    DMComissaoVendedor.CDS_V_FamiliaPrecosFAT_CONVERSAO.AsCurrency:=0.00;
    DMComissaoVendedor.CDS_V_FamiliaPrecos.Post;

  End; // If (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'') and (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'0')Then

  ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
  FreeAndNil(FrmPesquisaIB);
end;

procedure TFrmComissaoVendedor.Dbg_ProdutosComissaoTitleClick(Column: TColumn);
begin
  If DMComissaoVendedor.CDS_V_Produtos.IsEmpty Then
   Exit;

  With DMComissaoVendedor.CDS_V_Produtos do
  Begin
    If IndexDefs.Count>0 Then
     IndexDefs.Delete(0);

   IndexFieldNames:='';
   IndexName:='';
   If (OrderGridProd='') or (OrderGridProd='Crescente') Then
    Begin
      AddIndex(Column.FieldName,Column.FieldName,[],Column.FieldName);
      IndexName:= Column.FieldName;
      IndexDefs.Update;

      OrderGridProd:='Descendente';
    End
   Else
    Begin
      IndexFieldNames:=Column.FieldName;
      OrderGridProd:='Crescente';
    End; // If (OrderGridProd='') or (OrderGridProd='Crescente') Then
  End; // With DMComissaoVendedor.CDS_V_Produtos do

end;

procedure TFrmComissaoVendedor.Bt_ImportaProdutosClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_Aplicacao.SetFocus;

  If Not ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'A') Then
  Begin
    msg('Erro de Conex�o ao Banco de Dados do CD !!','X');
    Exit;
  End;

  If msg('Deseja Realmente IMPORTAR'+cr+'PRODUTOS AGORA ??','C')=2 Then
   Exit;

  OdirPanApres.Caption:='AGUARDE !! Importando Produtos';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmComissaoVendedor.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmComissaoVendedor.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmComissaoVendedor;
  OdirPanApres.Visible:=True;
  Application.ProcessMessages;

  FrmBelShop.CriaQueryIB('IBDB_99','IBT_99', DMComissaoVendedor.IBQ_ProdutoMPMS, True, False);

  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    DateSeparator:='.';
    DecimalSeparator:='.';

    DMComissaoVendedor.IBQ_ProdutoMPMS.Close;
    DMComissaoVendedor.IBQ_ProdutoMPMS.Open;

    While Not DMComissaoVendedor.IBQ_ProdutoMPMS.Eof do
    Begin
      MySql:=DMComissaoVendedor.IBQ_ProdutoMPMSUPDATE_INSERT.AsString;
      DMBelShop.SQLC.Execute(MySql,nil,nil);

     DMComissaoVendedor.IBQ_ProdutoMPMS.Next;
    End; // While Not DMComissaoVendedor.IBQ_ProdutoMPMS.Eof do
    DMComissaoVendedor.IBQ_ProdutoMPMS.Close;

    // Atualiza Transacao =======================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    msg('Importa��o de Produtos'+cr+'Efetuado com Sucesso !!','A');

  Except
    on e : Exception do
    Begin
      // Abandona Transacao =====================================
      DMBelShop.SQLC.Rollback(TD);

      DMComissaoVendedor.IBQ_ProdutoMPMS.Close;

      DateSeparator:='/';
      DecimalSeparator:=',';
      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
            
    End; // on e : Exception do
  End; // Try

  OdirPanApres.Visible:=False;

  ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
end;

procedure TFrmComissaoVendedor.Bt_CalculaComiisaoClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_ComisVendedores.SetFocus;

  Bt_SalvaComissao.Enabled:=False;
  EdtCodDocComissao.Clear;

  // Solicita o Periodo de Apropria��o de Vendas dos Vendedores ===============
  bgSiga:=False;
  FrmPeriodoApropriacao:=TFrmPeriodoApropriacao.Create(Self);
  FrmPeriodoApropriacao.sgTipoProc:='';

  FrmPeriodoApropriacao.ShowModal;

  sgDtaInicio:=DateToStr(FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Date);
  sgDtaFim   :=DateToStr(FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Date);

  FreeAndNil(FrmPeriodoApropriacao);

  If Not bgSiga Then
   Exit;

  // Analisa Data de Inicio do Periodo
  MySql:=' SELECT Max(d.cod_aux) docto'+
         ' FROM TAB_AUXILIAR d'+
         ' WHERE d.tip_aux=17';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  If Trim(DMBelShop.CDS_Busca.FieldByName('Docto').AsString)<>'' Then
  Begin
    MySql:=' SELECT d.des_aux, d.des_aux1'+
           ' FROM TAB_AUXILIAR d'+
           ' WHERE d.tip_aux = 17'+
           ' AND  d.cod_aux='+DMBelShop.CDS_Busca.FieldByName('Docto').AsString;
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    If (DMBelShop.CDS_Busca.FieldByName('Des_Aux1').AsDateTime>=StrToDate(sgDtaFim)) Or
       (DMBelShop.CDS_Busca.FieldByName('Des_Aux1').AsDateTime>=StrToDate(sgDtaInicio)) Then
    Begin
      msg('Per�odo Informado: '+cr+sgDtaInicio+' a '+sgDtaFim+cr+cr+' Diverge com o Per�odo do �ltimo Calculo:'+cr+
          DMBelShop.CDS_Busca.FieldByName('Des_Aux').AsString+' a '+DMBelShop.CDS_Busca.FieldByName('Des_Aux1').AsString,'A');

      DMBelShop.CDS_Busca.Close;
      Exit;
    End;
  End; // If Not DMBelShop.CDS_Busca.IsEmpty Then
  DMBelShop.CDS_Busca.Close;

  // Apresenta Comissi�es -----------------------------------------
  sgDtaInicio:=f_Troca('/','.',f_Troca('-','.',sgDtaInicio));
  sgDtaFim   :=f_Troca('/','.',f_Troca('-','.',sgDtaFim));

  If Not BuscaComissoes('0') Then
   Exit;

  Bt_SalvaComissao.Enabled:=True;
end;

procedure TFrmComissaoVendedor.Bt_BuscaDocComissaoClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_ComisVendedores.SetFocus;
  Bt_SalvaComissao.Enabled:=False;

  DMComissaoVendedor.CDS_ComisVendedores.Close;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtCodDocComissao.Clear;
  EdtCodDocComissao.SetFocus;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;
  DMBelShop.CDS_Pesquisa.Close;
  MySql:=' SELECT d.cod_aux DOCTO, d.des_aux || '' a '' || d.des_aux1 PERIODO'+
         ' FROM TAB_AUXILIAR d'+
         ' WHERE d.tip_aux=17'+
         ' ORDER BY 1';
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('DOCTO').AsString)='' Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Documento a Listar !!','A');
    EdtCodDocComissao.SetFocus;
    FrmPesquisa.Free;
    FrmPesquisa:=nil;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Periodo';
  FrmPesquisa.Campo_Codigo:='Docto';
  FrmPesquisa.Campo_Descricao:='Periodo';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    EdtCodDocComissao.Value:=StrToInt(FrmPesquisa.EdtCodigo.Text);
    EdtCodDocComissaoExit(Self);
  End;

  FrmPesquisa.Free;
  FrmPesquisa:=nil;

end;

procedure TFrmComissaoVendedor.EdtCodDocComissaoExit(Sender: TObject);
Var
  MySql: String;
begin
  If EdtCodDocComissao.Value<>0 Then
  Begin
    Bt_SalvaComissao.Enabled:=False;
    Dbg_ComisVendedores.SetFocus;

    DMComissaoVendedor.CDS_ComisVendedores.Close;

    Screen.Cursor:=crAppStart;

    // Busca Lojas =============================================================
    MySql:=' SELECT d.cod_aux DOCTO, d.des_aux, d.des_aux1'+
           ' FROM TAB_AUXILIAR d'+
           ' WHERE d.tip_aux=17'+
           ' AND d.Cod_Aux='+VarToStr(EdtCodDocComissao.Value);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Docto').AsString)='' Then
    Begin
      msg('Documento N�O Encontrado !!!', 'A');
      Screen.Cursor:=crDefault;
      EdtCodDocComissao.Clear;
      EdtCodDocComissao.SetFocus;
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;

    sgDtaInicio:=f_Troca('/','.',f_Troca('-','.',DMBelShop.CDS_BuscaRapida.FieldByName('Des_Aux').AsString));
    sgDtaFim   :=f_Troca('/','.',f_Troca('-','.',DMBelShop.CDS_BuscaRapida.FieldByName('Des_Aux1').AsString));

    // Apresenta Comissi�es -----------------------------------------
    BuscaComissoes(DMBelShop.CDS_BuscaRapida.FieldByName('Docto').AsString);

    DMBelShop.CDS_BuscaRapida.Close;
    Screen.Cursor:=crDefault;
  End;
end;

procedure TFrmComissaoVendedor.Dbg_ComisVendedoresDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If Not DMComissaoVendedor.CDS_ComisVendedores.IsEmpty Then
  Begin
    If not (gdSelected in State) Then
    Begin
      If Copy(Trim(DMComissaoVendedor.CDS_ComisVendedoresLOJA.AsString),1,16)='TOTAL DA EMPRESA' Then
      Begin
        Dbg_ComisVendedores.Canvas.Brush.Color:=clBlue;
        Dbg_ComisVendedores.Canvas.Font.Color :=clWhite;
      End;

      If Trim(DMComissaoVendedor.CDS_ComisVendedoresCOD_VENDEDOR.AsString)='TOTAL DA LOJA' Then
      Begin
        Dbg_ComisVendedores.Canvas.Brush.Color:=clRed;
        Dbg_ComisVendedores.Canvas.Font.Color :=clWhite;
      End;

      If Trim(DMComissaoVendedor.CDS_ComisVendedoresCOD_VENDEDOR.AsString)='TOTAL' Then
      Begin
        Dbg_ComisVendedores.Canvas.Brush.Color:=clSkyBlue;
        Dbg_ComisVendedores.Canvas.Font.Style :=[fsBold];
      End;

      Dbg_ComisVendedores.Canvas.FillRect(Rect);
      Dbg_ComisVendedores.DefaultDrawDataCell(Rect,Column.Field,state);
    End; // if not (gdSelected in State) Then
  End; // If Not DMComissaoVendedor.CDS_ComisVendedores.IsEmpty Then

end;

procedure TFrmComissaoVendedor.EdtCodDocComissaoChange(Sender: TObject);
begin
  DMComissaoVendedor.CDS_ComisVendedores.Close;
  Bt_SalvaComissao.Enabled:=False;

end;

procedure TFrmComissaoVendedor.Bt_SalvaComissaoClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_ComisVendedores.SetFocus;

  If DMComissaoVendedor.CDS_ComisVendedores.IsEmpty Then
   Exit;

  If msg('Deseja Realmente Salvar o'+cr+'Documento Listado ??','C')=2 Then
   Exit;

  // Apresentacao ==========================================================
  OdirPanApres.Caption:='AGUARDE !! Salvando Documento...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmComissaoVendedor.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmComissaoVendedor.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmComissaoVendedor;
  OdirPanApres.Visible:=True;
  Application.ProcessMessages;

  // Aplicacoes Selecionadas ===================================================
  AplicacoesSelecionadas;

  // Numero do Proximo Docto ===================================================
  MySql:=' SELECT COALESCE(MAX(d.cod_aux) + 1, 1) NrDoc'+
         ' FROM TAB_AUXILIAR d'+
         ' WHERE d.tip_aux = 17';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;
  sNumDoc:=DMBelShop.CDS_Busca.FieldByName('NrDoc').AsString;
  DMBelShop.CDS_Busca.Close;

  // Verifica se Transa��o esta Ativa
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

    // Grava Valores de Convers�o e Numero do Docto ============================
    MySql:=' UPDATE FIN_VEND_COMISSAO_VENDAS cv'+
           ' SET cv.num_docto = '+QuotedStr(sNumDoc)+
           ', cv.vlr_conversao = (COALESCE((SELECT COALESCE(cp.fat_conversao, 0.00)'+
           '                                FROM fin_vend_comissao_prod cp'+
           '                                WHERE cp.cod_produto = cv.cod_produto), 0.00))'+
           ' WHERE cv.dta_docto between '+QuotedStr(sgDtaInicio)+' and '+QuotedStr(sgDtaFim)+
           ' AND   cv.cod_aplicacao in ('+sgAplicacoes+')'+
           ' AND   cv.num_docto = 0';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Grava  Numero e Periodo do Docto ========================================
    MySql:=' INSERT INTO TAB_AUXILIAR (TIP_AUX, COD_AUX, DES_AUX, DES_AUX1)'+
           ' VALUES ('+
           QuotedStr('17')+', '+    // TIP_AUX
           QuotedStr(sNumDoc)+', '+ // COD_AUX  = N�mero do Documento Gerado
           QuotedStr(f_Troca('.','/',f_Troca('-','/',sgDtaInicio)))+', '+ // DES_AUX  = Data do Inicio do Per�odo
           QuotedStr(f_Troca('.','/',f_Troca('-','/',sgDtaFim)))+')';    // DES_AUX1 = Data do Fim do Per�odo
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;
    OdirPanApres.Visible:=False;

    EdtCodDocComissao.Value:=StrToInt(sNumDoc);
    EdtCodDocComissaoExit(Self);


    msg('Documento N�mero: '+sNumDoc+cr+cr+'Salvo com SUCESSO !!','A');
  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;
      OdirPanApres.Visible:=False;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try

end;

procedure TFrmComissaoVendedor.ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
var
  Sentido: SmallInt;
begin
  // primeiramente verificamos se � o evento a ser tratado...
  If Msg.message = WM_MOUSEWHEEL then
  Begin
//    If ActiveControl is TDBGrid then // If Somente DBGRID *** Testa se Classe � TDBGRID
//    Begin
      Msg.message := WM_KEYDOWN;
      Msg.lParam := 0;
      Sentido := HiWord(Msg.wParam);
      if Sentido > 0 then
       Msg.wParam := VK_UP
      else
       Msg.wParam := VK_DOWN;
//    End; // If ActiveControl is TDBGrid then // If Somente DBGRID *** Testa se Classe � TDBGRID
  End; // if Msg.message = WM_MOUSEWHEEL then
end;

procedure TFrmComissaoVendedor.Dbg_UltimaAtualizacaoEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_UltimaAtualizacaoEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmComissaoVendedor.Dbg_ComisVendedoresEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_ComisVendedoresEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmComissaoVendedor.Dbg_AplicacaoEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_AplicacaoEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmComissaoVendedor.Bt_ClipboardClick(Sender: TObject);
begin
  Dbg_ComisVendedores.SetFocus;
  
  If DMComissaoVendedor.CDS_ComisVendedores.IsEmpty Then
   Exit;

  DBGridClipboard(Dbg_ComisVendedores);
end;

procedure TFrmComissaoVendedor.Dbg_ComisVendedoresExit(Sender: TObject);
begin
  ApplicationEvents1.OnActivate:=nil;
  Application.OnMessage := nil;

end;

procedure TFrmComissaoVendedor.Rb_ComisVendSinteticoClick(Sender: TObject);
begin
  AcertaRb_Style(Rb_ComisVendSintetico);
  AcertaRb_Style(Rb_ComisVendAnalitico);

  If DMComissaoVendedor.CDS_ComisVendedores.IsEmpty Then
   Exit;

  DMComissaoVendedor.CDS_ComisVendedores.Filtered:=False;
  DMComissaoVendedor.CDS_ComisVendedores.Filter:='';

  If Rb_ComisVendSintetico.Checked Then
  Begin
    DMComissaoVendedor.CDS_ComisVendedores.Filter:='TRIM(DES_VENDEDOR)=''CAMPANHA DE VENDAS'' OR TRIM(COD_VENDEDOR)=''TOTAL'' OR TRIM(COD_VENDEDOR)=''TOTAL DA LOJA''';
    DMComissaoVendedor.CDS_ComisVendedores.Filtered:=True;
  End;

  Dbg_ComisVendedores.SetFocus;

end;

procedure TFrmComissaoVendedor.Rb_ComisVendSinteticoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Rb_ComisVendSinteticoClick(Self);

end;

end.
