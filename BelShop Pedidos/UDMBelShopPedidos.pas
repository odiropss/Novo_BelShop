unit UDMBelShopPedidos;

interface

uses
  Windows, Forms, SysUtils, Classes, DBXpress, FMTBcd, SqlExpr, DB, DBClient,
  Provider, StdCtrls, WinInet, ExtCtrls, // IBDatabase, IBCustomDataSet, IBQuery,
  RelVisual, Variants, IBCustomDataSet, IBUpdateSQL, IBQuery, IBDatabase;

type
  TDMBelShopPedidos = class(TDataModule)
    SQLC: TSQLConnection;
    SQLQ_Busca: TSQLQuery;
    DSP_Busca: TDataSetProvider;
    CDS_Busca: TClientDataSet;
    DS_Busca: TDataSource;
    DSP_Pesquisa: TDataSetProvider;
    CDS_Pesquisa: TClientDataSet;
    DS_Pesquisa: TDataSource;
    SQLQ_Pesquisa: TSQLQuery;
    DSP_Solicitacao: TDataSetProvider;
    CDS_Solicitacao: TClientDataSet;
    DS_Solicitacao: TDataSource;
    SQLQ_Solicitacao: TSQLQuery;
    CDS_SolicitacaoDTA_SOLICITACAO: TDateField;
    CDS_SolicitacaoNUM_SOLICITACAO: TIntegerField;
    CDS_SolicitacaoCOD_PROD_LINX: TIntegerField;
    CDS_SolicitacaoNOME: TStringField;
    CDS_SolicitacaoQTD_ESTOQUE: TFMTBCDField;
    CDS_SolicitacaoQTD_TRANSF: TFMTBCDField;
    Timer1: TTimer;
    SDS_DtaHoraServidor: TSQLDataSet;
    DSP_Verifica: TDataSetProvider;
    CDS_Verifica: TClientDataSet;
    DS_Verifica: TDataSource;
    SQLQ_Verifica: TSQLQuery;
    CDS_VerificaNUM_SOLICITACAO: TIntegerField;
    CDS_VerificaDTA_SOLICITACAO: TDateField;
    CDS_VerificaCOD_PROD_SIDI: TStringField;
    CDS_VerificaCOD_PROD_LINX: TIntegerField;
    CDS_VerificaNOME: TStringField;
    CDS_VerificaENVIADO_CD: TStringField;
    CDS_VerificaTRANSF_LOJA: TStringField;
    CDS_VerificaQTD_SOLICITADA: TFMTBCDField;
    CDS_VerificaQTD_DE_TRANSF: TFMTBCDField;
    CDS_VerificaQTD_A_TRANSF: TFMTBCDField;
    CDS_VerificaOBS_DOCTO: TStringField;
    CDS_VerificaDTA_PROCESSAMENTO: TDateField;
    CDS_VerificaDOC_GERADO: TIntegerField;
    SQLQ_BuscaRapida: TSQLQuery;
    DSP_BuscaRapida: TDataSetProvider;
    CDS_BuscaRapida: TClientDataSet;
    SQLQuery1: TSQLQuery;
    DSP_OCItensCheck: TDataSetProvider;
    CDS_OCItensCheck: TClientDataSet;
    DS_OCItensCheck: TDataSource;
    SQLQ_OCItensCheck: TSQLQuery;
    CDS_OCItensCheckNUM_SEQ_ITEM: TIntegerField;
    CDS_OCItensCheckDES_PRODUTO: TStringField;
    CDS_OCItensCheckQTD_PRODUTO: TIntegerField;
    CDS_OCItensCheckQTD_CHECKOUT: TIntegerField;
    CDS_OCItensCheckDTA_CHECKOUT: TDateField;
    CDS_OCItensCheckHRA_CHECKOUT: TTimeField;
    CDS_OCItensCheckIND_OC: TStringField;
    SQLQuery2: TSQLQuery;
    CDS_OCItensCheckNUM_SEQ_OC: TIntegerField;
    CDS_OCItensCheckNUM_OC: TIntegerField;
    SQLQuery3: TSQLQuery;
    CDS_OCItensCheckENDERECO: TStringField;
    CDS_OCItensCheckCOD_PRODUTO_SIDI: TStringField;
    CDS_OCItensCheckCOD_PRODUTO_LINX: TFMTBCDField;
    RelVisual: TRelVisualJul;
    SQLQ_Relatorio: TSQLQuery;
    DSP_Relatorio: TDataSetProvider;
    CDS_Relatorio: TClientDataSet;
    CDS_OCItensCheckREFERENCIA: TStringField;
    CDS_OCItensCheckCOD_BARRA: TStringField;
    SQLSP: TSQLStoredProc;
    DSP_ProdNegativos: TDataSetProvider;
    CDS_ProdNegativos: TClientDataSet;
    DS_ProdNegativos: TDataSource;
    SQLQ_ProdNegativos: TSQLQuery;
    CDS_ProdNegativosCOD_PRODUTO: TFMTBCDField;
    CDS_ProdNegativosNOME: TStringField;
    CDS_ProdNegativosQTD_ESTOQUE: TFMTBCDField;
    CDS_ProdNegativosATIVO: TStringField;
    IBDB_BelShop: TIBDatabase;
    IBT_BelShop: TIBTransaction;

    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    Procedure ConectaBanco;
    Procedure FechaTudo;

    Function LiberaLojaWork: Boolean;

    //==========================================================================
     // PEDIDO DE COMPRAS =======================================================
    //==========================================================================
    // Busca Numero da Ordem de Compra - SIDICOM / LINX
    Function OCBuscaNumeroOC(sCodLjSIDI: String; iCodLjLINX: Integer): String;

    // Calucla os Totais do Documento
    Function  Doc_CalculaValores(sDoc, sDtaDocto: String; sCodProd: String='0'; sCodLoja: String='0'): Boolean;

    // Manutenção de Produto no Docto ==========================================
    Function  DML_ProdutoDocto(sTpProc, sDoc, sDtaDocto: String; var sNumSeqDoc: String): Boolean;

    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    procedure DataModuleCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

Const
   sUser_Name: String='SYSDBA';
   sPassword: String='masterkey';
   cr = #13#10;
   Tab =#9;

var
  DMBelShopPedidos: TDMBelShopPedidos;

  wgDiaH, wgMesH, wgAnoH: Word;

  sgDtaHoje,
  sgFBConect,
  sgPastaExecutavel,
  sgNomeComputador, sgNomeUsuario, // Usuario e Windows
  sgOrderGrid
  : String;

  // Retirei do FrmBelShopPedidos
  igRecNoOCs: Integer;
  sgNumSeq,
  sgNumSolicitacao,
  sgCodProdLinx, sgCodProdSidicom: String;

  dgDtaHoje: TDateTime;

  sgNrsOCs, sgNrsSeqOCs: String; // Usado na CheckOut OC / NFe

  tsgArquivo: TStringList;

  sgSenhaLj: String;
  sgLojaLinx, sgLojaSidicom, sgCodUsuLoja,
  sgNomeLoja, sgUfLoja: String;

  bgOCNova, // CheckOut NFe Entrada se é Para gerar OC Nova
  bgEnterTab: Boolean;

  sgMensagem,
  sgPastaExecutavelServer, // Pasta e Executável no Servidor (FrmBelShop)
  sgPastaBancoBelShop,     // Pasta do Banco de Dados BelShop.FDB
  sgSeqDeletar: String;

implementation

uses DK_Procs1, UFrmBelShopPedidos, UDMOCLinx;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Inicio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Libera Loja para Trabalho >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TDMBelShopPedidos.LiberaLojaWork: Boolean;
Var
  i: Integer;
Begin

{===============================================================================
                        DEFINIÇÃO DO ARQUIVO Loja.ini
 ===============================================================================
  Linha 0 = NÃO MEXER NESTE ARQUIVO !!
  Linha 1 = PERTENCE AO SISTEMA DA BELSHOP !!

  Apartir da Linha 2
  ==================
  Linha Par   - BI3Ë³AG  = Decriptado Código da Loja (DES_LOGIN)
  Linha Impar - B_Òk‡´ªxÊ = Decriptado Senha da Loja (DES_SENHA)

  Assim Sucessivamente até a Última Linha
  =======================================
  Linha Par   - BI3Ë³BJ  = Decriptado Código da Loja (DES_LOGIN)
  Linha Impar - B_Òk‡´©yÇ = Decriptado Senha da Loja (DES_SENHA)

  ...
  ...
  Última Linha = BI3¤8‘; < Decriptado = BEL_FIM >
===============================================================================}

  Result:=False;

  // Cria Componente StringList ================================================
  tsgArquivo:=TStringList.Create;
  tsgArquivo.LoadFromFile(IncludeTrailingPathDelimiter(sgPastaExecutavel)+'Loja.ini');

  Try
    For i := 0 to tsgArquivo.Count - 1 do
    Begin
      If Trim(DecriptaSTR(tsgArquivo[i],40,30,20))='BEL_FIM' Then
       Break;

      If i>1 Then
      Begin
        if ((i mod 2)<>0) Then
        Begin
          If DecriptaSTR(Trim(tsgArquivo[i]),40,30,20)=sgSenhaLj Then
          Begin
            Result:=True;
            Break;
          End; // If DecriptaSTR(Trim(tsgArquivo[i]),40,30,20)sgSenhaLj Then
        End; // if ((i mod 2)<>0) Then
      End; // If i>1 Then

    End; // For i := 0 to tsArquivo.Count - 1 do
  Finally // Try
    { Libera a instancia da lista da memória }
    FreeAndNil(tsgArquivo);
  End; // Try

  // Verifica Continuidade =====================================================

  // Busca Dados da Empresa ====================================================
//      sgLojaSidicom  :=Separa_String(tsgArquivo[0],1);
//      sgLojaLinx     :=Separa_String(tsgArquivo[0],2);
//      sgNomeLoja     :=Separa_String(tsgArquivo[0],3);

End; // Libera Loja para Trabalho >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// PEDIDO DE COMPRAS - Manutenção de Produto no Docto >>>>>>>>>>>>>>>>>>>>>>>>>>
Function  TDMBelShopPedidos.DML_ProdutoDocto(sTpProc, sDoc, sDtaDocto: String; var sNumSeqDoc: String): Boolean;
Var
  i: Integer;
  MySql: String;
  s: String;
  cQtdSaldo: Currency;
Begin
  sgSeqDeletar:='';
  Result:=False;
  s:='';

  Try
    sDtaDocto:=DateToStr(StrToDateTime(sDtaDocto));
  Except
    Try
      sDtaDocto:=DateToStr(StrToDateTime(f_Troca('.','/',f_Troca('-','/',sDtaDocto))));
    Except
      sDtaDocto:=DateToStr(StrToDateTime(f_Troca('/','.',f_Troca('-','.',sDtaDocto))));
    End;
  End;

  cQtdSaldo:=0;
  If DMOCLinx.IBQ_AComprarQTD_ACOMPRAR.AsCurrency > DMOCLinx.IBQ_AComprarQTD_TRANSF.AsCurrency Then
   cQtdSaldo:=DMOCLinx.IBQ_AComprarQTD_ACOMPRAR.AsCurrency-DMOCLinx.IBQ_AComprarQTD_TRANSF.AsCurrency
  Else If DMOCLinx.IBQ_AComprarQTD_ACOMPRAR.AsCurrency <= DMOCLinx.IBQ_AComprarQTD_TRANSF.AsCurrency Then
   cQtdSaldo:=0;

  // Altera Produto no Docto ===================================================
  If sTpProc='A' Then
  Begin
    // Verifica se Ja Existe Treanferencia do Produto na Loja ==================
    MySql:=' SELECT o.Num_Seq'+
           ' FROM   OC_COMPRAR o'+
           ' WHERE  o.num_documento='+sDoc+
           ' AND    Cast(o.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaDocto)))+
           ' AND    o.cod_item='+QuotedStr(DMOCLinx.IBQ_AComprarCOD_ITEM.AsString)+
           ' AND    o.cod_empresa='+QuotedStr(DMOCLinx.IBQ_AComprarCOD_EMPRESA.AsString)+
           ' AND    o.num_seq<>'+QuotedStr(DMOCLinx.IBQ_AComprarNUM_SEQ.AsString)+
           ' AND    o.qtd_transf=0'+
           ' Order by o.Num_Seq Desc';
    DMBelShopPedidos.CDS_BuscaRapida.Close;
    DMBelShopPedidos.SQLQ_BuscaRapida.Close;
    DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Clear;
    DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Add(MySql);
    DMBelShopPedidos.CDS_BuscaRapida.Open;
    s:=DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Num_Seq').AsString;
    DMBelShopPedidos.CDS_BuscaRapida.Close;

    sTpProc:='I';
  End;

  // Inclui Produto no Docto ===================================================
  If sTpProc='I' Then
  Begin
    If Trim(s)='' Then // Grava Novo Produtos para Compra
     Begin
       MySql:=' SELECT COALESCE(MAX(o.num_seq)+1 ,1) Num_seq'+
              ' FROM OC_COMPRAR o'+
              ' WHERE o.num_documento='+sDoc+
              ' AND   Cast(o.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaDocto)));
       DMBelShopPedidos.CDS_BuscaRapida.Close;
       DMBelShopPedidos.SQLQ_BuscaRapida.Close;
       DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Clear;
       DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Add(MySql);
       DMBelShopPedidos.CDS_BuscaRapida.Open;
       i:=DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Num_Seq').AsInteger;
       DMBelShopPedidos.CDS_BuscaRapida.Close;

       MySql:=' INSERT INTO OC_COMPRAR'+
              ' SELECT'+
              ' '+IntToStr(i)+' NUM_SEQ, o.NUM_DOCUMENTO, o.DTA_DOCUMENTO, o.IND_OC_GERADA, o.DTA_OC_GERADA,'+
              ' o.NUM_OC_GERADA, o.OBS_OC, o.COD_EMPRESA, o.DES_EMPRESA, o.COD_ITEM, o.DES_ITEM,'+
              ' o.QTD_SUGERIDA, '+QuotedStr(f_Troca(',','.',CurrToStr(cQtdSaldo)))+' QTD_ACOMPRAR,'+
              ' o.QTD_SALDO, o.QTD_TRANSITO, o.QTD_DISPONIVEL,'+
              ' o.QTD_MEDIA_MES, o.QTD_MEDIA_DIA, o.QTD_DEM_MES1, o.QTD_DEM_MES2, o.QTD_DEM_MES3,'+
              ' o.QTD_DEM_MES4, o.QTD_DEM_MES5, o.QTD_DEM_MES6, o.QTD_DEM_MES7, o.QTD_DEM_MES8,'+
              ' o.UNI_COMPRA, o.UNI_VENDA, o.COD_BARRAS, o.COD_GRUPO, o.DES_GRUPO, o.COD_SUBGRUPO,'+
              ' o.DES_SUBGRUPO, o.DES_GENERICO, o.COD_APLICACAO, o.DES_APLICACAO, o.COD_REFERENCIA,'+
              ' o.CLA_CURVA_ABC, o.COD_FAMILIA_PRECO, o.DES_FAMILIA_PRECO, o.DTA_ULT_COMPRA,'+
              ' o.COD_FOR_ULT_COMPRA, o.DES_FOR_ULT_COMPRA, o.QTD_ULT_COMPRA, o.VLR_UNI_ULT_COMPRA,'+
              ' o.VLR_TOT_ULT_COMPRA, o.VLR_UNI_COMPRA, o.PER_DESCONTO, o.DTA_ULT_VENDA, o.COD_CLI_ULT_VENDA,'+
              ' o.DES_CLI_ULT_VENDA, o.QTD_ULT_VENDA, o.VLR_UNI_ULT_VENDA, o.VLR_TOT_ULT_VENDA, o.VLR_UNI_VENDA,'+
              ' o.COD_LISTA_VENDA, o.DES_LISTA_VENDA, o.COD_LISTA_COMPRA, o.DES_LISTA_COMPRA,'+
              ' o.VLR_CUSTO_MEDIO, o.VLR_TOT_VENDA, o.VLR_TOT_COMPRA, o.VLR_BRUTO, o.VLR_DESCONTOS,'+
              ' o.VLR_DESPESAS, o.VLR_FRETE, o.IND_SOMA_IPI_BASE_ICMS, o.IND_SOMA_FRETE_BASE_ICMS,'+
              ' o.IND_SOMA_DESPESA_BASE_ICMS, o.IND_SOMA_IPI_BASE_ST, o.IND_SOMA_FRETE_BASE_ST,'+
              ' o.IND_SOMA_DESPESA_BASE_ST, o.COD_SIT_TRIBUTARIA, o.COD_IPI, o.IND_IPI, o.PER_IPI,'+
              ' o.VLR_IPI, o.COD_ICMS, o.PER_REDUCAO_ICMS, o.VLR_REDUCAO_ICMS, o.VLR_BASE_ICMS,'+
              ' o.PER_ICMS, o.VLR_ICMS, o.COD_GRUPO_ST, o.DES_GRUPO_ST, o.PER_MARGEM_ST, o.IND_ST,'+
              ' o.VLR_BASE_ST, o.PER_ST, o.VLR_ST, o.PER_REPASSE, o.VLR_REPASSE, o.COD_COMPROVANTE_ICMS,'+
              ' o.COD_REFERENCIA_FORN, o.COD_FORNECEDOR, o.DES_FORNECEDOR, o.TIP_PESSOA, o.DES_EMAIL,'+
              ' o.QTD_NR_DIAS, o.QTD_NR_MESES, o.QTD_TOT_MESES, o.COD_COMPRADOR, o.BLOB_TEXTO, o.IND_TRANSF,'+
              ' o.DTA_LIM_TRANSF, '+QuotedStr('0')+' QTD_TRANSF, o.IND_USAR, '+QuotedStr('0')+' IND_QTD_ACIMA,'+
              ' o.QTD_SUGERIDA_ANO, o.QTD_TRANSF_PERIODO, o.QTD_TRANSF_ANO, o.EST_MINIMO,'+
              ' o.DIAS_ESTOCAGEM, o.QTD_DEMANDA_DIA, o.QTD_DEMANDA_ANO, o.QTD_DIAS_ANO,'+
              ' o.DATAINCLUSAO, o.ESTADO, o.DATAALTERACAO, o.IND_TRANSF_CD, o.DOC_TRANSF_CD'+

              ' FROM OC_COMPRAR o'+

              ' WHERE o.num_documento='+sDoc+
              ' AND   Cast(o.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaDocto)))+
              ' AND   o.NUM_SEQ='+sNumSeqDoc;
       DMOCLinx.IBQ_Executa.Close;
       DMOCLinx.IBQ_Executa.SQL.Clear;
       DMOCLinx.IBQ_Executa.SQL.Add(MySql);
       DMOCLinx.IBQ_Executa.ExecSQL;

       IBT_BelShop.CommitRetaining;
     End
    Else // If Trim(s)='' Then // Grava Novo Produtos para Compra
     Begin
         sgSeqDeletar:=sNumSeqDoc;
         sNumSeqDoc:=s;

         MySql:=' UPDATE oc_comprar c'+
                ' SET    c.qtd_acomprar=c.qtd_acomprar+'+f_Troca(',','.',DMOCLinx.IBQ_AComprarQTD_TRANSF.OldValue)+
                ' WHERE  c.num_documento='+sDoc+
                ' AND    Cast(c.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaDocto)))+
                ' AND    c.num_seq='+sNumSeqDoc;
         DMOCLinx.IBQ_Executa.Close;
         DMOCLinx.IBQ_Executa.SQL.Clear;
         DMOCLinx.IBQ_Executa.SQL.Add(MySql);
         DMOCLinx.IBQ_Executa.ExecSQL;

         IBT_BelShop.CommitRetaining;
     End;
  End; // If sTpProc='I' Then

  Result:=True;
End; // PEDIDO DE COMPRAS - Manutenção de Produto no Docto >>>>>>>>>>>>>>>>>>>>>

// PEDIDO DE COMPRAS - Calucla os Totais do Documento >>>>>>>>>>>>>>>>>>>>>>>>>>
Function TDMBelShopPedidos.Doc_CalculaValores(sDoc, sDtaDocto: String; sCodProd: String='0'; sCodLoja: String='0'): Boolean;
Var
  MySql: String;
Begin
  Result:=False;

  Try
    sDtaDocto:=DateToStr(StrToDateTime(sDtaDocto));
  Except
    Try
      sDtaDocto:=DateToStr(StrToDateTime(f_Troca('.','/',f_Troca('-','/',sDtaDocto))));
    Except
      sDtaDocto:=DateToStr(StrToDateTime(f_Troca('/','.',f_Troca('-','.',sDtaDocto))));
    End;
  End;

  // Verifica se Transação esta Ativa
  If SQLC.InTransaction Then
   SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  SQLC.StartTransaction(TD);
  Try
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' Update OC_COMPRAR'+
           ' Set VLR_DESCONTOS=((QTD_ACOMPRAR*VLR_UNI_COMPRA)*(PER_DESCONTO/100))'+
           ', VLR_BRUTO=(QTD_ACOMPRAR*VLR_UNI_COMPRA)-VLR_DESCONTOS'+
           ', VLR_BASE_ICMS=VLR_BRUTO'+
           ', VLR_ICMS=Cast(((VLR_BASE_ICMS*PER_ICMS)/100) as Numeric(12,2))'+
           ', VLR_IPI=Cast(((VLR_BRUTO*PER_IPI)/100) as Numeric(12,2))'+
           ', VLR_BASE_ST=VLR_BRUTO+(Cast(((VLR_BRUTO*PER_MARGEM_ST)/100) as Numeric(12,2)))'+
           ', VLR_ST=(Cast(((VLR_BASE_ST*PER_ST)/100) as Numeric(12,2))-VLR_ICMS)'+
           ', VLR_TOT_COMPRA=VLR_BRUTO+VLR_ST+VLR_IPI'+
           ', VLR_TOT_VENDA=QTD_ACOMPRAR*VLR_UNI_VENDA'+

           ' WHERE Ind_OC_Gerada=''N'''+
           ' AND   Num_Documento='+QuotedStr(sDoc)+
           ' And   Cast(dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaDocto)));

           If sCodProd<>'0' Then
            MySql:=MySql+' AND Cod_Item='+QuotedStr(sCodProd);

           If sCodLoja<>'0' Then
            MySql:=MySql+' AND Cod_Empresa='+QuotedStr(sCodLoja);
    SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao =======================================
    SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    Result:=True;
  Except
    on e : Exception do
    Begin
      // Abandona Transacao =====================================
      SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      MessageBox(Application.Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try
End; // PEDIDO DE COMPRAS - Calucla os Totais do Documento >>>>>>>>>>>>>>>>>>>>>

// PEDIDO DE COMPRAS - Busca Numero da Ordem de Compra - SIDICOM / LINX >>>>>>>>
Function TDMBelShopPedidos.OCBuscaNumeroOC(sCodLjSIDI: String; iCodLjLINX: Integer): String;
Begin
  SQLSP.Prepared:=False;
  SQLSP.StoredProcName:='SP_BUSCA_NUMERO_OC';
  SQLSP.ParamByName('par_CodLojaSIDI').AsString:=sCodLjSIDI;
  SQLSP.ParamByName('par_CodLojaLINX').AsInteger:=iCodLjLINX;
  SQLSP.Prepared:=True;

  SQLSP.ExecProc;
  Result:=SQLSP.ParamByName('Ret_NumOC').AsString;
  SQLSP.Prepared:=False;
  SQLSP.Close;
  SQLSP.Params.Clear;
  SQLSP.StoredProcName:='';
End; // PEDIDO DE COMPRAS - Busca Numero da Ordem de Compra - SIDICOM / LINX >>>

// Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMBelShopPedidos.FechaTudo;
Var
  i: Integer;
Begin
  // Fecha Componentes DMBelShopPedidos ===========================================
  For i:=0 to DMBelShopPedidos.ComponentCount-1 do
  Begin
    If DMBelShopPedidos.Components[i] is TClientDataSet Then
     If (DMBelShopPedidos.Components[i] as TClientDataSet).Active Then
     (DMBelShopPedidos.Components[i] as TClientDataSet).Close;

    If DMBelShopPedidos.Components[i] is TSQLQuery Then
     If (DMBelShopPedidos.Components[i] as TSQLQuery).Active Then
     (DMBelShopPedidos.Components[i] as TSQLQuery).Close;
  End;
end; // Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMBelShopPedidos.ConectaBanco;
Var
  Arq: TextFile;
  s, sBancoIB: String;

  i: Integer;
  bConecta: Boolean;
  Flags : Cardinal;
  sErroLocal, sErroIntraNet, sErroInterNet: String;
begin

  if not InternetGetConnectedState(@Flags, 0) then
  Begin
    If msg('Você não está conectado à Internet !!'+cr+cr+'Deseja Continuar Assim Mesmo ??','C')=2 Then
    Begin
      Application.Terminate;
      Exit;
    End;
  End; // if not InternetGetConnectedState(@Flags, 0) then

  InicializaFormatos; // define as configurações regionais para ignorar a configuração do windows

  // ===========================================================================
  // Conexão DBExpress =========================================================
  // ===========================================================================
  i:=0;
  bConecta:=True;
  While bConecta do
  Begin
    inc(i);

    If i=1 Then sgFBConect:='FBConect_InterNet.ini';
    If i=2 Then sgFBConect:='FBConect_IntraNet.ini';
    If i=3 Then sgFBConect:='FBConect_Local.ini';

    // Se Loja Cd = 99-SIDICOM e/ou 2-Linx Utiliza FBConect_IntraNet.ini =======
    If sgLojaLinx='2' Then
     If i=2 Then sgFBConect:='FBConect_IntraNet.ini';

    If AnsiUpperCase(sgNomeUsuario)='ODIR' Then
    Begin
      If msg('DB Local ??','C')=1 Then
       If i=1 Then sgFBConect:='FBConect_Local.ini';
    End; // If AnsiUpperCase(sgNomeUsuario)='ODIR' Then

    If i=4 Then
    Begin
      MessageBox(Application.Handle, pChar('ERRO DE CONEXÃO !!'+cr+
                                           'Entrar em Contato com o Odir'+cr+
                                           '============================'+cr+cr+
                                           'LOCAL: '+cr+sErroLocal+cr+cr+
                                           'INTRANET: '+cr+sErroIntraNet+cr+cr+
                                           'INTERNET: '+cr+sErroInterNet+cr+cr+
                                           'SQLC: '+SQLC.Params.GetText), 'ATENÇÃO !!', MB_ICONERROR);

      Application.Terminate;
      Exit;
    End; // If i=4 Then

    If SQLC.Connected Then
     SQLC.Connected:=False;

    Try
      With SQLC do
      Begin
        Params.Clear;
        Params.LoadFromFile(sgPastaExecutavel+sgFBConect);

        // =====================================================================
        // Apresentação dos Parametros de Conexão ==============================
        // =====================================================================
        FrmBelShopPedidos.Mem_Odir.Lines.Add(Params.GetText);
        If SQLC.Connected Then
         FrmBelShopPedidos.Mem_Odir.Lines.Add('CONNECTED=True')
        Else
         FrmBelShopPedidos.Mem_Odir.Lines.Add('CONNECTED=False');
        // Apresentação dos Parametros de Conexão ==============================
        // =====================================================================

        Params.Add('User_Name='+sUser_Name);
        Params.Add('Password='+sPassword);

        Connected:=True;
        Break;
      End; // with SQLC do
    Except // finally
      on e : Exception do
      Begin
        If i=1 Then sErroLocal   :=e.message;
        If i=2 Then sErroIntraNet:=e.message;
        If i=3 Then sErroInterNet:=e.message;
      End;
    End; // try
  End; // While bConecta do
  // Conexão DBExpress =========================================================
  // ===========================================================================

  // ===========================================================================
  // Conexão IBDatabase BelShop ================================================
  // ===========================================================================
  AssignFile(Arq,IncludeTrailingPathDelimiter(sgPastaExecutavel)+sgFBConect);

  sgPastaExecutavelServer:='';
  Reset(Arq);
  While not Eof(Arq) do
  Begin
   Readln(Arq,s);

   sBancoIB:='';
   i:=pos('Database=localhost/3050:', Trim(s));
   If i<>0 Then
    sBancoIB:=copy(Trim(s),i+24,length(Trim(s)));

   If (i=0) and (sBancoIB='') Then
   Begin
     i:=pos('Database=', Trim(s));
     If i<>0 Then
       sBancoIB:=copy(Trim(s),i+9,length(Trim(s)));
   End;

   If sBancoIB<>'' Then
   Begin
     sgPastaExecutavelServer:=ExtractFilePath(sBancoIB);
     sgPastaBancoBelShop    :=ExtractFilePath(sBancoIB);

     i:=Pos('\BelShop\',Trim(sgPastaExecutavelServer));
     sgPastaExecutavelServer:=Copy(sgPastaExecutavelServer,1, i+8);

     i:=Pos(AnsiUpperCase('\\localhost\'),Trim(AnsiUpperCase(sgPastaExecutavelServer)));
     If i>0 Then
     Begin
       sgPastaExecutavelServer:=Copy(sgPastaExecutavelServer, i+12, Length(sgPastaExecutavelServer));
     End;

     Break;
   End; // If sBancoIB<>'' Then
  End; //While not Eof(Arq) do
  CloseFile(Arq);

  // Pasta Executavel WebService ===============================================
//  sgPastaWebService:=sgPastaExecutavelServer;
//  if DirectoryExists(IncludeTrailingPathDelimiter(sgPastaWebService)+'WebService Linx\') then
//   sgPastaWebService:=IncludeTrailingPathDelimiter(sgPastaWebService)+'WebService Linx\'
//  Else
//   sgPastaWebService:=IncludeTrailingPathDelimiter(sgPastaWebService)+'Fontes\WebService Linx\';
//
//  if Not DirectoryExists(sgPastaWebService) then
//   sgPastaWebService:='\\192.168.0.252\Projetos\BelShop\WebService Linx\';

  // Conecta IBDataBase BelShop ================================================
  IBDB_BelShop.DatabaseName:=sBancoIB;
  i:=0;
  bConecta:=False;
  While Not bConecta do
  Begin
    Try
      IBDB_BelShop.Connected:=True;
      bConecta:=True;
    Except
      on e : Exception do
      Begin
         i:=i+1;
         If i=2 Then
         Begin
           s:=e.message;
           MessageBox(Application.Handle, pChar('Erro ao Conectar Banco BelShop !!'+cr+e.message), 'Erro', MB_ICONERROR);
           Application.Terminate;
           bConecta:=True;
         End;
      End;
    End;
  End; // While Not bConecta do

End; // Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Fim >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TDMBelShopPedidos.DataModuleCreate(Sender: TObject);
Var
  MySql: String;

  sErro: String;
begin
  // ===========================================================================
  // Pasta Executavel ==========================================================
  // ===========================================================================
  sgPastaExecutavel:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  // Pasta Executavel ==========================================================
  // ===========================================================================
{ // OdirApagar - 30/05/2019
  // ===========================================================================
  // Descrição do Loja =========================================================
  // Loja.Ini = Cod_Loja_Sidicom ; Cod_Loja_Linx ; Descriçãso do Loja ;
  // ===========================================================================
  tsgArquivo:=TStringList.Create;
  tsgArquivo.LoadFromFile(IncludeTrailingPathDelimiter(sgPastaExecutavel)+'Loja.ini');

  sgLojaLinx     :='';
  sgLojaSidicom  :='';
  sgNomeLoja     :='';
  sErro          :='';
  Try
    If Trim(tsgArquivo[0])='' Then
     sErro:='SIM';

    If sErro='' Then
    Begin
      sgLojaSidicom  :=Separa_String(tsgArquivo[0],1);
      sgLojaLinx     :=Separa_String(tsgArquivo[0],2);
      sgNomeLoja     :=Separa_String(tsgArquivo[0],3);

      StrToInt(sgLojaLinx);
      StrToInt(sgLojaSidicom);

      If Trim(sgNomeLoja)='' Then
       sErro:='SIM';
    End; // If sErro='' Then
  Except
    sErro:='SIM'
  End;

  If (Trim(sErro)<>'') or (Trim(sgNomeLoja)='Limite Superado') Then
  Begin
    msg('Definição da Loja Inválida !!'+cr+'Entrar em Contato com o ODIR'+cr+'Celcular:  999-578-234','A');
    Application.Terminate;
    Exit;
  End;
  FreeAndNil(tsgArquivo);

  // Descrição do Loja =========================================================
  // Loja.Ini = Cod_Loja_Sidicom ; Cod_Loja_Linx ; Descriçãso do Loja ;
  // ===========================================================================
}
  // ===========================================================================
  // Verifica Existencia do Arquivo de Configuração de Conexão =================
  // ===========================================================================
  sgFBConect:='FBConect_Local.ini';
  If not(fileexists(IncludeTrailingPathDelimiter(sgPastaExecutavel)+sgFBConect)) then
  Begin
    msg('Arquivo '+sgFBConect+' Não Encontrado !!','A');
    Application.Terminate;
    Exit;
  End;

  sgFBConect:='FBConect_IntraNet.ini';
  If not(fileexists(IncludeTrailingPathDelimiter(sgPastaExecutavel)+sgFBConect)) then
  Begin
    msg('Arquivo '+sgFBConect+' Não Encontrado !!','A');
    Application.Terminate;
    Exit;
  End;

  sgFBConect:='FBConect_InterNet.ini';
  If not(fileexists(IncludeTrailingPathDelimiter(sgPastaExecutavel)+sgFBConect)) then
  Begin
    msg('Arquivo '+sgFBConect+' Não Encontrado !!','A');
    Application.Terminate;
    Exit;
  End;
  // ===========================================================================
  // Verifica Existencia do Arquivo de Configuração de Conexão =================
  // ===========================================================================

  // ===========================================================================
  // Windows: Nome do Usuario e do Computador ==================================
  // ===========================================================================
  UsuarioComputadorWindows(sgNomeUsuario, sgNomeComputador);
  // Windows: Nome do Usuario e do Computador ==================================
  // ===========================================================================

  // ===========================================================================
  // Conecta Banco BelShop.FDB =================================================
  // ===========================================================================
  SQLC.Connected:=False;

  ConectaBanco;
  // Conecta Banco BelShop.FDB =================================================
  // ===========================================================================

  // ===========================================================================
  // Date da Inicialização do Sistema ==========================================
  // ===========================================================================
  sgDtaHoje:=DateToStr(DataHoraServidorFI(DMBelShopPedidos.SQLQuery1));
  dgDtaHoje:=StrToDate(sgDtaHoje);
  // Date da Inicialização do Sistema ==========================================
  // ===========================================================================
end;

procedure TDMBelShopPedidos.Timer1Timer(Sender: TObject);
Var
  sDtaAgora: String;
begin
  sDtaAgora:=DateToStr(DataHoraServidorFI(DMBelShopPedidos.SQLQuery1));

  If dgDtaHoje<>StrToDate(sDtaAgora) Then
  Begin
    Application.Terminate;
    Exit;
  End;
end;

end.
