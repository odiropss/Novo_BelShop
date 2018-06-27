unit UDMRelatorio;

interface

uses
  Windows, SysUtils, Classes, Variants, Forms, frexpimg, FR_Class, FR_DSet,
  FR_DBSet, frOLEExl, frRtfExp, FR_E_HTML2, FR_E_HTM, FR_E_CSV, FR_E_RTF,
  FR_E_TXT, DBXpress, RelVisual, Dialogs, frxClass, frxExportPDF;
  //  Último: DBXpress;

type
  TDMRelatorio = class(TDataModule)
    frTextExport1: TfrTextExport;
    frRTFExport1: TfrRTFExport;
    frCSVExport1: TfrCSVExport;
    frHTMExport1: TfrHTMExport;
    frHTML2Export1: TfrHTML2Export;
    frRtfAdvExport1: TfrRtfAdvExport;
    frTIFFExport1: TfrTIFFExport;
    frJPEGExport1: TfrJPEGExport;
    frOLEExcelExport1: TfrOLEExcelExport;
    frDBDataSet1: TfrDBDataSet;
    frBMPExport1: TfrBMPExport;
    FontDialog: TFontDialog;
    RelVisual: TRelVisualJul;
    frReport1: TfrReport;
    frxPDFExport1: TfrxPDFExport;
    frxReport1: TfrxReport;

    // Odir
    Procedure ImpressaoRomaneioSeparacao(sNumDocto, sCodLoja, sNumOCGerada: String);
    // Odir

  private
    { Private declarations }
  public
    { Public declarations }
    sEmpTelefone, sEmpCcontato, sEmpEmail,
    sFornEndereco, sFornCidade, sFornEstado, sFornCodCep, sFornFone1,
    sFornFoneFax, sFornEmail, sFornContato: String;
  end;

var
  DMRelatorio: TDMRelatorio;

  // Cria Ponteiro de transacão ================================================
  TD: TTransactionDesc;

implementation

uses UDMBelShop, UDMConexoes, UDMVirtual, UFrmBelShop, DB, DK_Procs1,
  UDMCentralTrocas;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Impressão do Romaneio de Separação >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMRelatorio.ImpressaoRomaneioSeparacao(sNumDocto, sCodLoja, sNumOCGerada: String);
Var
  MySql, dir_relat: String;
  sTotal_Valor, sTotal_Itens, sTotal_Qtd: String;
  s: String;
Begin
                    
  FrmBelShop.OdirPanApres.Caption:='AGUARDE !! Montando Relatório...';
  FrmBelShop.OdirPanApres.Width:=Length(FrmBelShop.OdirPanApres.Caption)*10;
  FrmBelShop.OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBelShop.Width-FrmBelShop.OdirPanApres.Width)/2));
  FrmBelShop.OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBelShop.Height-FrmBelShop.OdirPanApres.Height)/2));
  FrmBelShop.OdirPanApres.Visible:=True;

  // Busca OC -----------------------------------------------------
  MySql:='SELECT ''Bel_''||oc.cod_empresa||'' - ''||oc.des_empresa des_empresa, oc.num_oc_gerada,'+
         ' Case co.compl_endereco'+
         '   when '''' Then'+
         '      co.des_endereco ||'', ''|| co.num_endereco'+
         '   Else'+
         '      co.des_endereco ||'', ''|| co.num_endereco ||'' - ''|| co.compl_endereco'+
         ' End Endereco,'+
         ' co.des_bairro, co.des_cidade, co.cod_uf,'+

         ' (substring(co.cod_cep from 1 for 5) ||''-''|| substring(co.cod_cep from 6 for 3)) cod_cep,'+

         ' (substring(co.num_cnpj from 1 for 2) ||''.''||'+
         '  substring(co.num_cnpj from 3 for 3) ||''.''||'+
         '  substring(co.num_cnpj from 6 for 3) ||''/''||'+
         '  substring(co.num_cnpj from 9 for 4) ||''-''||'+
         '  substring(co.num_cnpj from 13 for 2)) num_cnpj,'+

         ' co.inscr_estadual,'+
         ' case oc.ind_oc_gerada'+
         '   When ''N'' Then'+
         '      ''ABERTA'''+
         '   Else'+
         '      ''ABERTA - PENDENTE FORNECEDOR'''+
         ' End Situacao,'+
         ' Cast(oc.dta_oc_gerada as Date) Dta_Pedido,'+
         ' Cast(oc.dta_oc_gerada as Date) Dta_Entrega,'+
         ' oc.cod_fornecedor, oc.des_fornecedor,'+
         ' oc.cod_item, oc.cod_barras, oc.cod_referencia_forn,'+
         ' oc.des_item, oc.uni_compra, oc.uni_venda,'+
         ' SUM(oc.qtd_acomprar) qtd_acomprar,'+
         ' oc.vlr_uni_compra, oc.per_desconto,'+
         ' SUM(oc.vlr_tot_compra) vlr_tot_compra,'+
         ' oc.obs_oc, oc.cod_comprador, us.des_usuario,'+

         ' COALESCE(pe.zonaendereco,''0'')||''.''||'+
         ' COALESCE(pe.corredor,''0'')||''.''||'+
         ' COALESCE(pe.prateleira,''0'')||''.''||'+
         ' COALESCE(pe.gaveta,''0'') Enderecamento'+

         ' FROM OC_COMPRAR oc'+
         '    LEFT JOIN EMP_CONEXOES  co  ON oc.cod_empresa=co.cod_filial'+
         '    LEFT JOIN PS_USUARIOS   us  ON oc.cod_comprador=us.cod_usuario'+
         '    LEFT JOIN prod_endereco pe  ON pe.cod_loja=''99'''+
         '                               AND pe.cod_item=oc.cod_item'+

         ' where oc.num_documento='+QuotedStr(sNumDocto)+
         ' and   oc.cod_empresa='+ QuotedStr(sCodLoja)+
         ' and   oc.num_oc_gerada='+ QuotedStr(sNumOCGerada)+

         ' group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,22,23,25,26,27,28'+
         
         ' order by Enderecamento, oc.des_item';
  DMBelShop.IBQ_OrdemCompra.Close;
  DMBelShop.IBQ_OrdemCompra.SQL.Clear;
  DMBelShop.IBQ_OrdemCompra.SQL.Add(MySql);
  DMBelShop.IBQ_OrdemCompra.Open;

  // Atauliza Enderecamento ====================================================
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  Try
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Conecta MPMS - Atualizar
    FrmBelShop.ConectaMPMS;

    While Not DMBelShop.IBQ_OrdemCompra.Eof do
    Begin
      // Atualiza Enderecamento (MPMS)
      DMBelShop.AtualizaEnderecamentoProduto('99',DMBelShop.IBQ_OrdemCompraCOD_ITEM.AsString, 'IBQ_Executa');

      DMBelShop.IBQ_OrdemCompra.Next;
    End; // While Not DMBelShop.IBQ_OrdemCompra.Eof do

    // Atualiza Transacao =======================================
    DMBelShop.IBT_BelShop.CommitRetaining;

    DateSeparator:='/';
    DecimalSeparator:=',';

  Except
    on e : Exception do
    Begin
      // Abandona Transacao =====================================
      DMBelShop.IBT_BelShop.RollbackRetaining;

      DateSeparator:='/';
      DecimalSeparator:=',';

      MessageBox(Application.Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Exit;
    End; // on e : Exception do
  End; // Try

  // Busca Romaneio com Enderecamento Correto ==================================
  DMBelShop.IBQ_OrdemCompra.Close;
  DMBelShop.IBQ_OrdemCompra.Open;

  // Dados da Filial ----------------------------------------------
  MySql:=' select cl.telefone, cl.contato, cl.email'+
         ' from clientefone cl, filial fi'+
         ' where cl.codcliente = fi.codnocliente'+
         ' and fi.codfilial='+QuotedStr(sCodLoja);
  FrmBelShop.IBQ_Matriz.Close;
  FrmBelShop.IBQ_Matriz.SQL.Clear;
  FrmBelShop.IBQ_Matriz.SQL.Add(MySql);
  FrmBelShop.IBQ_Matriz.Open;

  sEmpTelefone  :=Trim(FrmBelShop.IBQ_Matriz.FieldByName('Telefone').AsString);
  sEmpCcontato  :=Trim(FrmBelShop.IBQ_Matriz.FieldByName('Contato').AsString);
  sEmpEmail     :=Trim(FrmBelShop.IBQ_Matriz.FieldByName('Email').AsString);

  FrmBelShop.IBQ_Matriz.Close;

  // Imprime Ordem de Compra --------------------------------------
  sgTipoImpressao:='ImpDocSeparacao';

  // Diretorio dos Relatórios -------------------------------------
  {$IFDEF MSWINDOWS}
    dir_relat       :=  ExtractFilePath(Application.ExeName)+'Relatorios\';
  {$ENDIF}

  frDBDataSet1.DataSet:=DMBelShop.IBQ_OrdemCompra;
  DMRelatorio.frReport1.LoadFromFile(Dir_Relat+'DocSeparacao.frf');

  // Atualiza Variaveis -------------------------------------------
  DMRelatorio.frReport1.Dictionary.Variables.Variable['Telefone']:=#39+sEmpTelefone+#39;
  DMRelatorio.frReport1.Dictionary.Variables.Variable['Contato']:=#39+sEmpCcontato+#39;
  DMRelatorio.frReport1.Dictionary.Variables.Variable['EMail']:=#39+sEmpEmail+#39;

  DMRelatorio.frReport1.PrepareReport;
  DMRelatorio.frReport1.ShowReport;

  FrmBelShop.OdirPanApres.Visible:=False;

end; // Impressão do Romaneio de Separação >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


end.
