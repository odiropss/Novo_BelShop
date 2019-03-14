unit UFrmAcceraLoreal;

//============================================================================
// Se Periodo Vem por Parametros =============================================
//============================================================================
// PAcceraLoreal.exe 01/08/2018 16/08/2018  ==> Usar Barras de Separação Normais < / >
//                   Parametro1 Parametro2
//============================================================================

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DateUtils, ExtCtrls;

type
  TFrmAcceraLoreal = class(TForm)
    mMemo_Odir: TMemo;
    OdirPanApres: TPanel;
    procedure FormCreate(Sender: TObject);

    //==============================================================================
    // ODIR - INICIO ===============================================================
    //==============================================================================
    Function ACC_CADPROD: Boolean; // Cadastro de Produtos
    Function ACC_CADSITE: Boolean; // Cadastro de CDs/Lojas
    Function ACC_POSESTQ: Boolean; // Cadastro de Estoques
    Function ACC_SELLOUT: Boolean; // Cadastro de Vendas do Distribuidor
    Function ACC_PDVS: Boolean;    // Cadastro de Clientes (PDVs)
    Function ACC_NFS: Boolean;     // Notas Fiscais Recebidas
    Function ACC_CADVEND: Boolean; // Cadastro de Vendedores

    //==============================================================================
    // ODIR - FIM ==================================================================
    //==============================================================================
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAcceraLoreal: TFrmAcceraLoreal;
  MySql: String;

  sgDtaGeracao, sgDtaIniParam, sgDtaFimParam: String;

  sgCodEmpresa, sgNomeEmpresa: String;

  bgUsaDtaParam: Boolean;

implementation

uses UDMAcceraLoreal, DB, DK_Procs1, UFrmPeriodoApropriacao;

{$R *.dfm}

//==============================================================================
// ODIR - INICIO ===============================================================
//==============================================================================

// Cadastro de Vendedores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmAcceraLoreal.ACC_CADVEND: Boolean;
Var
  tsArquivo: TStringList;
  i: Integer;
  sLinha: String;
Begin
  Result:=False;

  // Instancia a variável arquivo
  tsArquivo:=TStringList.Create;

  Try
    // REGISTRO "V" VALORES ====================================================
    MySql:=' SELECT'+
           ' 1 ORDEM,'+ // 1 ORDEM
           ' ''V'' TR,'+ // 2
           ' v.fcod COD_VENDEDOR,'+ // 3 Codigo do Usuarios
           ' v.fnome NOME_VENDEDOR,'+ // 4 Nome do Vendedor

           ' (SELECT CAST(REPLACE(REPLACE(REPLACE(COALESCE(d.ciccgc,''99999999999999''),'+
           '              ''/'', ''''),''.'',''''),''-'','''') AS VARCHAR(18))'+
           '  FROM ea d) CPF_CNPJ,'+ // 5 CNPJ da Distribuidora

           ' 1 STATUS,'+ // 6 - Status Vendedor 0-Inativo 1-Ativo

           ' (SELECT e.fcod FROM AUGC0501 e WHERE e.fcod=''00009'') EQUIPE,'+ // 7 Equipe do Vendedor (MultiBel)

           ' NULL REGIAO,'+ // 8 Regiao do Vendedor

           ' CASE'+
           '     WHEN UPPER(TRIM(v.fcod))=''00009'' THEN'+
           '       ''G'''+
           '     ELSE'+
           '       ''V'''+
           ' END CARGO_VENDEDOR'+ // 9 Cargo do Vendedor

           ' FROM AUGC0501 v'+ // Cadastro de Vendedores
           ' WHERE v.ftipo=''V'''+

           // REGISTRO "H" CABECALHO ===========================================
           ' UNION'+

           ' SELECT'+
           ' 0,'+ // 1 ORDEM
           ' ''H'','+ // 2 Tipo de registro
           ' CAST(REPLACE(REPLACE(REPLACE(COALESCE(c.ciccgc,''99999999999999''),'+
           '      ''/'', ''''),''.'',''''),''-'','''') AS VARCHAR(18)),'+ // 3 CNPJ da Distribuidora

           ' CAST(EXTRACT(YEAR FROM CURRENT_TIMESTAMP) AS VARCHAR(4))||'+
           ' CAST(LPAD(EXTRACT(MONTH FROM CURRENT_TIMESTAMP),2,''0'') AS VARCHAR(2))||'+
           ' CAST(LPAD(EXTRACT(DAY FROM CURRENT_TIMESTAMP),2,''0'') AS VARCHAR(2)),'+ // 4 Data do Arquivo

           ' NULL,'+ // 5
           ' NULL,'+ // 6
           ' NULL,'+ // 7
           ' NULL,'+ // 8
           ' NULL'+  // 9

           ' FROM EA c'+

           // REGISTRO "E" FIM =================================================

           ' UNION'+

           ' SELECT'+
           ' 2,'+ // 1 ORDEM
           ' ''E'','+ // 2 Tipo de registro
           ' NULL,'+ // 3
           ' NULL,'+ // 4
           ' NULL,'+ // 5
           ' NULL,'+ // 6
           ' NULL,'+ // 7
           ' NULL,'+ // 8
           ' NULL'+  // 9

           ' FROM RDB$DATABASE';
    DMAcceraLoreal.SDS_Arquivo.Close;
    DMAcceraLoreal.SDS_Arquivo.CommandText:=MySql;
    DMAcceraLoreal.SDS_Arquivo.Open;

    While not DMAcceraLoreal.SDS_Arquivo.Eof do
    Begin
      // Registro Cabecalho ====================================================
      If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='H' Then
      Begin
        sLinha:='';
        For i:=1 to 3 do
        Begin
          If i=1 Then
           sLinha:=sLinha+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString)
          Else
           Begin
             If DMAcceraLoreal.SDS_Arquivo.Fields[i].FieldName='COD_FORNECEDOR' Then
              sLinha:=sLinha+';'+IntToStr(StrToInt64(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString))
             Else
              sLinha:=sLinha+';'+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString);
           End;
        End; // For i:=1 to 3 do
        tsArquivo.Add(sLinha)
      End; // If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='H' Then

      // Registro Valores ======================================================
      If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='V' Then
      Begin
        sLinha:='';
        For i:=1 to DMAcceraLoreal.SDS_Arquivo.FieldCount-1 do
        Begin
          If i=1 Then
           sLinha:=sLinha+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString)
          Else
           Begin
             If DMAcceraLoreal.SDS_Arquivo.Fields[i].FieldName='COD_FORNECEDOR' Then
              sLinha:=sLinha+';'+IntToStr(StrToInt64(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString))
             Else
              sLinha:=sLinha+';'+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString);
           End;
        End; // For i:=1 to DMAcceraLoreal.SDS_Arquivo.FieldCount-1 do
        tsArquivo.Add(sLinha)
      End; // If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='V' Then

      // Registro Fim ==========================================================
      If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='E' Then
      Begin
        tsArquivo.Add('E');
      End; // If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='E' Then

      DMAcceraLoreal.SDS_Arquivo.Next;
    End; // While not DMAcceraLoreal.SDS_Arquivo.Eof do
    DMAcceraLoreal.SDS_Arquivo.Close;

    tsArquivo.SaveToFile(sgPastaSalvarArq+'ACC_CADVEND_'+sgDtaGeracao+'.TXT');
  Finally // Try
    // Libera a instancia da lista da memória
    FreeAndNil(tsArquivo);
  End; // Try

  Result:=True;
End; // Cadastro de Vendedores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Notas Fiscais Recebidas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmAcceraLoreal.ACC_NFS: Boolean;
Var
  tsArquivo: TStringList;
  i: Integer;

  sDtaInicioMovto, sDtaFimMovto: String;

  sLinha: String;
Begin
   Result:=False;

  // Busca Datas de Inicio e Fim dos Movtos Selecionados =====================
  MySql:=' SELECT'+
         ' CAST(MIN(nt.data) AS DATE) DTA_INICIO,'+
         ' CAST(MAX(nt.data) AS DATE) DTA_FIM'+

         ' FROM ACEM1401 nt'+ // Notas Fiscais
         '     LEFT JOIN ACEM14IT it  ON it.documento=nt.documento'+ // Produtos da Nota
         '                           AND it.serie=nt.serie_doc'+
         '                           AND it.cod_op=nt.operacao_doc'+
         '                           AND it.cod_cli=nt.cod_cli'+
         '     LEFT JOIN ACEC1101 pr  ON pr.codigo=it.codigoproduto'+ // Cadastro de Produto
         '     LEFT JOIN AUGC0501 fo  ON fo.fcod=pr.cod_fornecedor'+ // Cadastro de Fornecedores
         '     LEFT JOIN AFVC0901 op  ON op.cod_op=it.cod_op'+ // Operacoes e Cfops

         ' WHERE NOT (nt.operacao_doc=''00000'' AND nt.operacaop=''05000'')'+ // Pedência Não
         ' AND   ((UPPER(TRIM(op.desc_op_nf)) LIKE ''%COMPRA%'') AND (UPPER(nt.entrada_saida)=''E''))'+
         ' AND   pr.cod_fornecedor=''00246'''+ // Somente Loreal
         ' AND   it.valor_unitarioproduto IS NOT NULL';

         If Not bgUsaDtaParam Then
          MySql:=
           MySql+' AND   CAST(nt.data as DATE)>=CURRENT_TIMESTAMP-31'+
                 ' AND   CAST(nt.data as DATE)<=CURRENT_TIMESTAMP-1'
         Else
          MySql:=
           MySql+' AND   CAST(nt.data as DATE)>='+QuotedStr(sgDtaIniParam)+
                 ' AND   CAST(nt.data as DATE)<='+QuotedStr(sgDtaFimParam);
  DMAcceraLoreal.SDS_Arquivo.Close;
  DMAcceraLoreal.SDS_Arquivo.CommandText:=MySql;
  DMAcceraLoreal.SDS_Arquivo.Open;
  sDtaInicioMovto:=DateToStr(DMAcceraLoreal.SDS_Arquivo.FieldByName('Dta_Inicio').AsDateTime);
  sDtaFimMovto   :=DateToStr(DMAcceraLoreal.SDS_Arquivo.FieldByName('Dta_Fim').AsDateTime);
  DMAcceraLoreal.SDS_Arquivo.Close;

  // Sem Movto Encerra =========================================================
  If (Trim(sDtaInicioMovto)='')           Or (Trim(sDtaFimMovto)='') Or
     (Trim(sDtaInicioMovto)='30/12/1899') Or (Trim(sDtaFimMovto)='30/12/1899') Then
   Exit;

  Try
    // Instancia a variável arquivo
    tsArquivo:=TStringList.Create;

    // REGISTRO "V" VALORES ====================================================
    MySql:='SELECT'+
           ' 1 ORDEM,'+ // 1 ORDEM
           ' ''V'' TR,'+ // 2

           ' TRIM(CAST(REPLACE(REPLACE(REPLACE(COALESCE(fo.fcnpj_cic,''99999999999999''),'+
           '                       ''/'', ''''),''.'',''''),''-'','''') AS VARCHAR(18))) COD_FORNECEDOR,'+ // 3 CNPJ - Codigo do Fornecedor
           ' TRIM(CAST(CAST(nt.documento AS INTEGER) AS VARCHAR(50))) NUMERO_NF,'+ // 4 Numero da NF
           ' ''E'' ACAO,'+ // 5 Ação R=Retorno E=Entregue
           ' CAST((CAST(nt.total_doc AS NUMERIC(12,2)) * 100) AS INTEGER) VALOR,'+ // 6 Valor da NF
           ' CAST(SUM(COALESCE(it.qunatidadeproduto,0) * 1000) AS INTEGER) QUANTIDADE,'+ // 7 Total das Quantidade

           ' CAST(EXTRACT(YEAR FROM nt.data) AS VARCHAR(4))||'+
           ' CAST(LPAD(EXTRACT(MONTH FROM nt.data),2,''0'') AS VARCHAR(2))||'+
           ' CAST(LPAD(EXTRACT(DAY FROM nt.data),2,''0'') AS VARCHAR(2)) DTA_ACAO,'+ // 8 Data da Ação Data da Entrega

           ' CAST(EXTRACT(YEAR FROM nt.data) AS VARCHAR(4))||'+
           ' CAST(LPAD(EXTRACT(MONTH FROM nt.data),2,''0'') AS VARCHAR(2))||'+
           ' CAST(LPAD(EXTRACT(DAY FROM nt.data),2,''0'') AS VARCHAR(2)) DTA_ENTRADA'+ // 9 Data da Entrada no Estoque

           ' FROM ACEM1401 nt'+ // Notas Fiscais
           '     LEFT JOIN ACEM14IT it  ON it.documento=nt.documento'+ // Produtos da Nota
           '                           AND it.serie=nt.serie_doc'+
           '                           AND it.cod_op=nt.operacao_doc'+
           '                           AND it.cod_cli=nt.cod_cli'+
           '     LEFT JOIN ACEC1101 pr  ON pr.codigo=it.codigoproduto'+ // Cadastro de Produto
           '     LEFT JOIN AUGC0501 fo  ON fo.fcod=pr.cod_fornecedor'+ // Cadastro de Fornecedores
           '     LEFT JOIN AFVC0901 op  ON op.cod_op=it.cod_op'+ // Operacoes e Cfops

           ' WHERE NOT (nt.operacao_doc=''00000'' AND nt.operacaop=''05000'')'+ // Pedencia Não
           ' AND   ((UPPER(TRIM(op.desc_op_nf)) LIKE ''%COMPRA%'') AND (UPPER(nt.entrada_saida)=''E''))'+
           ' AND   pr.cod_fornecedor=''00246'''+ // Somente Loreal
           ' AND   it.valor_unitarioproduto IS NOT NULL';

          If Not bgUsaDtaParam Then
           MySql:=
            MySql+' AND   CAST(nt.data as DATE)>=CURRENT_TIMESTAMP-31'+
                  ' AND   CAST(nt.data as DATE)<=CURRENT_TIMESTAMP-1'
          Else
           MySql:=
            MySql+' AND   CAST(nt.data as DATE)>='+QuotedStr(sgDtaIniParam)+
                  ' AND   CAST(nt.data as DATE)<='+QuotedStr(sgDtaFimParam);
    MySql:=
     MySql+' GROUP BY 3,4,5,6,8'+

           // REGISTRO "H" CABECALHO ===========================================
           ' UNION'+

           ' SELECT'+
           ' 0,'+ // 1 ORDEM
           ' ''H'','+ // 2 Tipo de Registro
           ' CAST(REPLACE(REPLACE(REPLACE(COALESCE(c.ciccgc,''99999999999999''),'+
           '      ''/'', ''''),''.'',''''),''-'','''') AS VARCHAR(18)),'+ // 3 CNPJ da Distribuidora

           ' CAST(EXTRACT(YEAR FROM CAST('+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaInicioMovto)))+' AS DATE)) AS VARCHAR(4))||'+
           ' CAST(LPAD(EXTRACT(MONTH FROM CAST('+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaInicioMovto)))+' AS DATE)),2,''0'') AS VARCHAR(2))||'+
           ' CAST(LPAD(EXTRACT(DAY FROM CAST('+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaInicioMovto)))+' AS DATE)),2,''0'') AS VARCHAR(2)),'+ // 4 Data Inicial dos Registro Apresentados

           ' CAST(EXTRACT(YEAR FROM CAST('+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaFimMovto)))+' AS DATE)) AS VARCHAR(4))||'+
           ' CAST(LPAD(EXTRACT(MONTH FROM CAST('+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaFimMovto)))+' AS DATE)),2,''0'') AS VARCHAR(2))||'+
           ' CAST(LPAD(EXTRACT(DAY FROM CAST('+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaFimMovto)))+' AS DATE)),2,''0'') AS VARCHAR(2)),'+ // 5 Data Final dos Registro Apresentados

           ' NULL,'+ // 6
           ' NULL,'+ // 7
           ' NULL,'+ // 8
           ' NULL'+  // 9

           ' FROM EA c'+

           // REGISTRO "E" FIM =================================================
           ' UNION'+

           ' SELECT'+
           ' 2,'+ // 1 ORDEM
           ' ''E'','+ // 2 Tipo de registro
           ' NULL,'+ // 3
           ' NULL,'+ // 4
           ' NULL,'+ // 5
           ' NULL,'+ // 6
           ' NULL,'+ // 7
           ' NULL,'+ // 8
           ' NULL'+  // 9

           ' FROM RDB$DATABASE';
    DMAcceraLoreal.SDS_Arquivo.Close;
    DMAcceraLoreal.SDS_Arquivo.CommandText:=MySql;
    DMAcceraLoreal.SDS_Arquivo.Open;

    While not DMAcceraLoreal.SDS_Arquivo.Eof do
    Begin
      // Registro Cabecalho ====================================================
      If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='H' Then
      Begin
        sLinha:='';
        For i:=1 to 4 do
        Begin
          If i=1 Then
           sLinha:=sLinha+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString)
          Else
           Begin
             If DMAcceraLoreal.SDS_Arquivo.Fields[i].FieldName='COD_FORNECEDOR' Then
              sLinha:=sLinha+';'+IntToStr(StrToInt64(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString))
             Else
              sLinha:=sLinha+';'+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString);
           End;
        End; // For i:=1 to 3 do
        tsArquivo.Add(sLinha)
      End; // If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='H' Then

      // Registro Valores ======================================================
      If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='V' Then
      Begin
        sLinha:='';
        For i:=1 to DMAcceraLoreal.SDS_Arquivo.FieldCount-1 do
        Begin
          If i=1 Then
           sLinha:=sLinha+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString)
          Else
           Begin
             If DMAcceraLoreal.SDS_Arquivo.Fields[i].FieldName='COD_FORNECEDOR' Then
              sLinha:=sLinha+';'+IntToStr(StrToInt64(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString))
             Else
              sLinha:=sLinha+';'+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString);
           End;
        End; // For i:=1 to DMAcceraLoreal.SDS_Arquivo.FieldCount-1 do
        tsArquivo.Add(sLinha)
      End; // If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='V' Then

      // Registro Fim ==========================================================
      If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='E' Then
      Begin
        tsArquivo.Add('E');
      End; // If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='E' Then

      DMAcceraLoreal.SDS_Arquivo.Next;
    End; // While not DMAcceraLoreal.SDS_Arquivo.Eof do
    DMAcceraLoreal.SDS_Arquivo.Close;

    tsArquivo.SaveToFile(sgPastaSalvarArq+'ACC_NFS_'+sgDtaGeracao+'.TXT');
  Finally // Try
    // Libera a instancia da lista da memória
    FreeAndNil(tsArquivo);
  End; // Try

  Result:=True;
End; // Notas Fiscais Recebidas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Cadastro de Clientes (PDVs) >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmAcceraLoreal.ACC_PDVS: Boolean;
Var
  tsArquivo: TStringList;
  i: Integer;
  sLinha: String;
Begin
  Result:=False;

  // Instancia a variável arquivo
  tsArquivo:=TStringList.Create;

  Try
    // REGISTRO "V" VALORES ====================================================
    MySql:=' SELECT'+
           ' 1 ORDEM,'+ // 1 ORDEM
           ' ''V'' TR,'+ // 2
           ' TRIM(CAST(REPLACE(REPLACE(REPLACE(COALESCE(cl.cgc_cnpj,''99999999999999''),'+
           '                        ''/'', ''''),''.'',''''),''-'','''') AS VARCHAR(18))) CNPJ_CPF,'+ // 3 CNPJ / CPF do PDV
           ' SUBSTRING(TRIM(cl.nome) FROM 1 FOR 60) RAZAO_NOME,'+ // 4 Razao Social ou Nome do Cliente
           ' SUBSTRING(TRIM(cl.nome_fantasia) FROM 1 FOR 60) NOME_FANTASIA,'+ // 5 Nome Fantasia do Cliente
           ' ''BRA'' PAIS,'+ // 6 Descrião do País
           ' cl.regiao REGIAO,'+ // 7 Região do Cliente
           ' cl.estado ESTADO,'+ // 8 Estado do Cliente
           ' cl.cidade CIDADE,'+ // 9 Cidade do Cliente
           ' cl.bairro BAIRRO,'+ // 10 Bairro do Cliente
           ' TRIM(CAST(REPLACE(cl.endereco,'';'', '':'' ) AS VARCHAR(120))) ENDERECO,'+ // 11 Endeço do Cliente
           ' NULL GRUPO_REDE,'+ // 12 Grupo/Rede

           ' CASE'+
           '   WHEN COALESCE(cl.ramo,0) = 4 THEN'+
           '     ''P1'''+ // Perfumarias
           '   ELSE'+
           '     ''N1'''+ // Outros
           ' END CLASSIFICACAO_PDV,'+ // 13 Classificaçção do PDV

           ' CASE'+
           '     WHEN TRIM(COALESCE(vd.fnome,''''))='''' THEN '+
           '       SUBSTRING(TRIM('+QuotedStr(sgCodEmpresa+'-'+sgNomeEmpresa)+') FROM 1 FOR 60)'+ // SQL - Busca Codigo e Nome da Empresa
           '     ELSE'+
           '       SUBSTRING(TRIM(cl.codigo_representacao||''-''||vd.fnome) FROM 1 FOR 60)'+
           ' END NOME_VENDEDOR,'+ // 14 Nome do Vendedor ou Nome da Distribudora

           ' CAST(EXTRACT(YEAR FROM CAST(REPLACE(cl.data_cadastro,''/'',''.'') AS DATE)) AS VARCHAR(4))||'+
           ' CAST(LPAD(EXTRACT(MONTH FROM CAST(REPLACE(cl.data_cadastro,''/'',''.'') AS DATE)),2,''0'') AS VARCHAR(2))||'+
           ' CAST(LPAD(EXTRACT(DAY FROM CAST(REPLACE(cl.data_cadastro,''/'',''.'') AS DATE)),2,''0'') AS VARCHAR(2)) DTA_CADASTRO,'+ // 15 Data do Cadastro

           ' TRIM(REPLACE(REPLACE(REPLACE(REPLACE(COALESCE(cl.cep,''99999999''), ''/'', ''''),''.'',''''),''-'',''''),'' '','''')) CEP_PDV,'+ // 16 CEP do PDV

           ' SUBSTRING(TRIM(cl.email) FROM 1 FOR 60) CONTATO,'+ // 17 E-Mail do Cliente
           ' ''A'' STATUS'+ // 18 Status do Cliente

           ' FROM AUGC0301 cl'+ // Cadastro de Clientes
           '     LEFT JOIN AUGC0501 vd  ON vd.fcod=cl.codigo_representacao'+ // Cadastro de vendedores

           ' WHERE EXISTS (SELECT 1'+
           '               FROM ACEM1401 nt'+ // Notas lOREAL
           '                   LEFT JOIN ACEM14IT it  ON it.documento=nt.documento'+ // Produtos da Nota
           '                                         AND it.serie=nt.serie_doc'+
           '                                         AND it.cod_op=nt.operacao_doc'+
           '                                         AND it.cod_cli=nt.cod_cli'+
           '                   LEFT JOIN ACEC1101 pr  ON pr.codigo=it.codigoproduto'+ // Cadastro de Produto
           '                   LEFT JOIN AUGC0501 fo  ON fo.fcod=pr.cod_fornecedor'+ // Cadastro de Fornecedores
           '                   LEFT JOIN AFVC0901 op  ON op.cod_op=it.cod_op'+ // Operacoes e Cfops

           '               WHERE NOT (nt.operacao_doc=''00000'' AND nt.operacaop=''05000'')'; // Pedencia Não

                           If Not bgUsaDtaParam Then
                            MySql:=
                             MySql+' AND   CAST(nt.data as DATE)>=CURRENT_TIMESTAMP-31'+
                                   ' AND   CAST(nt.data as DATE)<=CURRENT_TIMESTAMP-1'
                           Else
                            MySql:=
                             MySql+' AND   CAST(nt.data as DATE)>='+QuotedStr(sgDtaIniParam)+
                                   ' AND   CAST(nt.data as DATE)<='+QuotedStr(sgDtaFimParam);

    // OdirApagar - 12/03/2019 - Retirado as Devoluções
//    MySql:=
//     MySql+'               AND   (((UPPER(TRIM(op.desc_op_nf)) LIKE ''%VENDA%'') AND (UPPER(nt.entrada_saida)=''S''))'+
//           '                      OR'+
//           '                      ((UPPER(TRIM(op.desc_op_nf)) LIKE ''%DEVOL%VENDA%'') AND (UPPER(nt.entrada_saida)=''E'')))'+
    MySql:=
     MySql+'               AND   ((UPPER(TRIM(op.desc_op_nf)) LIKE ''%VENDA%'') AND (UPPER(nt.entrada_saida)=''S''))'+

           '               AND   pr.cod_fornecedor=''00246'''+ // Somente Loreal
           '               AND   it.valor_unitarioproduto IS NOT NULL'+
           '               AND   nt.cod_cli=cl.codigo_cliente)'+

           // REGISTRO "H" CABECALHO ===========================================
           ' UNION'+

           ' SELECT'+
           ' 0,'+ // 1 ORDEM
           ' ''H'','+ // 2 Tipo de registro
           ' CAST(REPLACE(REPLACE(REPLACE(COALESCE(c.ciccgc,''99999999999999''),'+
           '      ''/'', ''''),''.'',''''),''-'','''') AS VARCHAR(18)),'+ // 3 CNPJ da Distribuidora

           ' CAST(EXTRACT(YEAR FROM CURRENT_TIMESTAMP) AS VARCHAR(4))||'+
           ' CAST(LPAD(EXTRACT(MONTH FROM CURRENT_TIMESTAMP),2,''0'') AS VARCHAR(2))||'+
           ' CAST(LPAD(EXTRACT(DAY FROM CURRENT_TIMESTAMP),2,''0'') AS VARCHAR(2)),'+ // 4 Data do Arquivo

           ' NULL,'+ // 5
           ' NULL,'+ // 6
           ' NULL,'+ // 7
           ' NULL,'+ // 8
           ' NULL,'+ // 9
           ' NULL,'+ // 10
           ' NULL,'+ // 11
           ' NULL,'+ // 12
           ' NULL,'+ // 13
           ' NULL,'+ // 14
           ' NULL,'+ // 15
           ' NULL,'+ // 16
           ' NULL,'+ // 17
           ' NULL'+  // 18

           ' FROM EA c'+

           // REGISTRO "E" FIM =================================================

           ' UNION'+

           ' SELECT'+
           ' 2,'+ // 1 ORDEM
           ' ''E'','+ // 2 Tipo de registro
           ' NULL,'+ // 3
           ' NULL,'+ // 4
           ' NULL,'+ // 5
           ' NULL,'+ // 6
           ' NULL,'+ // 7
           ' NULL,'+ // 8
           ' NULL,'+ // 9
           ' NULL,'+ // 10
           ' NULL,'+ // 11
           ' NULL,'+ // 12
           ' NULL,'+ // 13
           ' NULL,'+ // 14
           ' NULL,'+ // 15
           ' NULL,'+ // 16
           ' NULL,'+ // 17
           ' NULL'+  // 18

           ' FROM RDB$DATABASE';
    DMAcceraLoreal.SDS_Arquivo.Close;
    DMAcceraLoreal.SDS_Arquivo.CommandText:=MySql;
    DMAcceraLoreal.SDS_Arquivo.Open;

    While not DMAcceraLoreal.SDS_Arquivo.Eof do
    Begin
      // Registro Cabecalho ====================================================
      If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='H' Then
      Begin
        sLinha:='';
        For i:=1 to 3 do
        Begin
          If i=1 Then
           sLinha:=sLinha+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString)
          Else
           Begin
             If DMAcceraLoreal.SDS_Arquivo.Fields[i].FieldName='CNPJ_CPF' Then
              sLinha:=sLinha+';'+IntToStr(StrToInt64(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString))
             Else
              sLinha:=sLinha+';'+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString);
           End;
        End; // For i:=1 to 3 do
        tsArquivo.Add(sLinha)
      End; // If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='H' Then

      // Registro Valores ======================================================
      If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='V' Then
      Begin
        sLinha:='';
        For i:=1 to DMAcceraLoreal.SDS_Arquivo.FieldCount-1 do
        Begin
          If i=1 Then
           sLinha:=sLinha+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString)
          Else
           Begin
             If DMAcceraLoreal.SDS_Arquivo.Fields[i].FieldName='CNPJ_CPF' Then
              sLinha:=sLinha+';'+IntToStr(StrToInt64(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString))
             Else
              sLinha:=sLinha+';'+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString);
           End;
        End; // For i:=1 to DMAcceraLoreal.SDS_Arquivo.FieldCount-1 do
        tsArquivo.Add(sLinha)
      End; // If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='V' Then

      // Registro Fim ==========================================================
      If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='E' Then
      Begin
        tsArquivo.Add('E');
      End; // If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='E' Then

      DMAcceraLoreal.SDS_Arquivo.Next;
    End; // While not DMAcceraLoreal.SDS_Arquivo.Eof do
    DMAcceraLoreal.SDS_Arquivo.Close;

    tsArquivo.SaveToFile(sgPastaSalvarArq+'ACC_PDVS_'+sgDtaGeracao+'.TXT');
  Finally // Try
    // Libera a instancia da lista da memória
    FreeAndNil(tsArquivo);
  End; // Try

  Result:=True;
End; // Cadastro de Clientes (PDVs) >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Cadastro de Vendas do Distribuidor >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmAcceraLoreal.ACC_SELLOUT: Boolean;
Var
  tsArquivo: TStringList;
  i: Integer;

  sDtaInicioMovto, sDtaFimMovto: String;

  sLinha: String;
Begin
  Result:=False;

  // Busca Datas de Inicio e Fim dos Movtos Selecionados =====================
  MySql:=' SELECT'+
         ' CAST(MIN(nt.data) AS DATE) DTA_INICIO,'+
         ' CAST(MAX(nt.data) AS DATE) DTA_FIM'+

         ' FROM ACEM1401 nt'+ // Movimento de Notas Fiscais
         '     LEFT JOIN ACEM14IT it  ON it.documento=nt.documento'+ // Produtos das Notas Fiscais
         '                           AND it.serie=nt.serie_doc'+
         '                           AND it.cod_op=nt.operacao_doc'+
         '                           AND it.cod_cli=nt.cod_cli'+
         '     LEFT JOIN ACEC1101 pr  ON pr.codigo=it.codigoproduto'+ // Cadastro de Produto
         '     LEFT JOIN AUGC0501 fo  ON fo.fcod=pr.cod_fornecedor'+ // Cadastro de Fornecedores
         '     LEFT JOIN AUGC0501 vd  ON vd.fcod=nt.vendedor_doc'+ // Cadastro de Vendedores/Outros
         '     LEFT JOIN AFVC0901 op  ON op.cod_op=it.cod_op'+ // Cadastro de Operacoes e Cfops
         '     LEFT JOIN AUGC0301 cl  ON cl.codigo_cliente=nt.cod_cli'+ // Cadastro de Clientes

         ' WHERE NOT (nt.operacao_doc=''00000'' AND nt.operacaop=''05000'')'; // Pedencia Não

         If Not bgUsaDtaParam Then
          MySql:=
           MySql+' AND   CAST(nt.data as DATE)>=CURRENT_TIMESTAMP-31'+
                 ' AND   CAST(nt.data as DATE)<=CURRENT_TIMESTAMP-1'
         Else
          MySql:=
           MySql+' AND   CAST(nt.data as DATE)>='+QuotedStr(sgDtaIniParam)+
                 ' AND   CAST(nt.data as DATE)<='+QuotedStr(sgDtaFimParam);

  // OdirApagar - 12/03/2019 - Retirado as Devoluções
//  MySql:=
//   MySql+' AND   (((UPPER(TRIM(op.desc_op_nf)) LIKE ''%VENDA%'') AND (UPPER(nt.entrada_saida)=''S''))'+
//         '        OR'+
//         '        ((UPPER(TRIM(op.desc_op_nf)) LIKE ''%DEVOL%VENDA%'') AND (UPPER(nt.entrada_saida)=''E'')))'+
  MySql:=
   MySql+' AND   ((UPPER(TRIM(op.desc_op_nf)) LIKE ''%VENDA%'') AND (UPPER(nt.entrada_saida)=''S''))'+

         ' AND   pr.cod_fornecedor=''00246'''+ // Somente Loreal
         ' AND   it.valor_unitarioproduto IS NOT NULL';
  DMAcceraLoreal.SDS_Arquivo.Close;
  DMAcceraLoreal.SDS_Arquivo.CommandText:=MySql;
  DMAcceraLoreal.SDS_Arquivo.Open;
  sDtaInicioMovto:=DMAcceraLoreal.SDS_Arquivo.FieldByName('Dta_Inicio').AsString;
  sDtaFimMovto   :=DMAcceraLoreal.SDS_Arquivo.FieldByName('Dta_Fim').AsString;
  DMAcceraLoreal.SDS_Arquivo.Close;

  // Sem Movto Encerra =========================================================
  If (Trim(sDtaInicioMovto)='')           Or (Trim(sDtaFimMovto)='') Or
     (Trim(sDtaInicioMovto)='30/12/1899') Or (Trim(sDtaFimMovto)='30/12/1899') Then
   Exit;

  Try
    // Instancia a variável arquivo
    tsArquivo:=TStringList.Create;

    // REGISTRO "V" VALORES ====================================================
    MySql:=' SELECT'+
           ' 1 ORDEM,'+ // 1 ORDEM
           ' ''V'' TR,'+ // 2
           ' (SELECT CAST(REPLACE(REPLACE(REPLACE(COALESCE(d.ciccgc,''99999999999999''),'+
           '              ''/'', ''''),''.'',''''),''-'','''') as VARCHAR(18))'+
           '  FROM ea d) COD_LOJA,'+ // 3 CNPJ da Distribuidora

           ' CAST(REPLACE(REPLACE(REPLACE(COALESCE(fo.fcnpj_cic,''99999999999999''),'+
           '           ''/'', ''''),''.'',''''),''-'','''') AS VARCHAR(18)) CNPJ_FORN,'+ // 4 CNPJ do Fornecedor

// Retirado em 26/09/2018 - Produto com mais de um Fornecedor
//           ' CASE'+
//           '   WHEN COALESCE(pr.outro_codigo,'''')<>'''' THEN'+
//           '     pr.outro_codigo'+
//           '   WHEN COALESCE(cf.ficodigo_barras,'''')<>'''' THEN'+
//           '     cf.ficodigo_barras'+
//           '   WHEN COALESCE(cf.ficodigofornecedor,'''')<>'''' THEN'+
//           '     cf.ficodigofornecedor'+
//           '   ELSE'+
//           '     pr.codigo'+
//           ' END COD_BARRAS,'+ // 5 Codigo de Barras
           ' CASE'+
           '   WHEN COALESCE(pr.outro_codigo,'''')<>'''' THEN'+
           '     pr.outro_codigo'+
           '   ELSE'+
           '     pr.codigo'+
           ' END COD_BARRAS,'+ // 5 Codigo de Barras

           ' NULL LOTE,'+ // 6 Lote
           ' NULL LOTE_VALIDADE,'+ // 7 Lote Validade

           ' CAST(SUM(COALESCE(it.qunatidadeproduto,0) * 1000) AS INTEGER) QUANTIDADE,'+ // 8 Quantidade de Venda Atendida
           ' SUM(COALESCE(it.valor_total_unit,0)) * 100  VALOR_TRANSACAO,'+ // 9 Valor Final da Tansação
           ' ''BRL'' MOEDA,'+ // 10 Moeda
           ' nt.documento DOCUMENTO,'+ // 11 Identificação da Transação

           ' CAST(EXTRACT(YEAR FROM nt.data) AS VARCHAR(4))||'+
           ' CAST(LPAD(EXTRACT(MONTH FROM nt.data),2,''0'') AS VARCHAR(2))||'+
           ' CAST(LPAD(EXTRACT(DAY FROM nt.data),2,''0'') AS VARCHAR(2)) DTA_DOCUMENTO,'+ // 12 Data da Emissão do Documento

           ' CASE'+
           '   WHEN UPPER(op.tipo_op)=''D'' THEN'+
           '     ''DV'''+
           '   WHEN ((nt.menfemotivocancelamento IS NOT NULL) OR (UPPER(COALESCE(nt.operacaop, ''''))=''CA'')) THEN'+
           '     ''C'''+
           '   ELSE'+
           '     ''V'''+
           ' END TIPO_TRANSACAO,'+ // 13 Tipo de Transação

           ' CAST(CAST(COALESCE(op.cod_natureza,0) AS INTEGER) AS VARCHAR(4)) CFOP,'+ // 14 CFop

           ' CASE'+
           '    WHEN CHAR_LENGTH(TRIM(CAST(REPLACE(REPLACE(REPLACE(COALESCE(cl.cgc_cnpj,''99999999999999''),'+
           '                     ''/'',''''),''.'',''''),''-'','''') AS VARCHAR(18))))<12 Then'+
           '      1'+
           '    ELSE'+
           '      2'+
           ' END  TIPO_IDENT_PDV,'+ // 15 Tipo Identificador PDV

           ' TRIM(CAST(REPLACE(REPLACE(REPLACE(COALESCE(cl.cgc_cnpj,''99999999999999''),'+
           '                        ''/'', ''''),''.'',''''),''-'','''') AS VARCHAR(18))) IDENTIFICADOR_PDV,'+ // 16 Identificador do PDV

           ' SUBSTRING(TRIM(cl.nome) FROM 1 FOR 60) DESCRICAO_PDV,'+ // 17 Descrição do PDV
           ' TRIM(REPLACE(REPLACE(REPLACE(REPLACE(COALESCE(cl.cep,''99999999''), ''/'', ''''),''.'',''''),''-'',''''),'' '','''')) CEP_PDV,'+ // 18 CEP do PDV

           ' CASE'+
           '   WHEN COALESCE(cl.ramo,0) = 4 THEN'+
           '     ''P1'''+ // Perfumarias
           '   ELSE'+
           '     ''N1'''+ // Outros
           ' END CLASSIFICACAO_PDV,'+ // 19 Classificaçção do PDV

           ' CASE'+
           '     WHEN TRIM(COALESCE(vd.fnome,''''))='''' THEN '+
           '       SUBSTRING(TRIM('+QuotedStr(sgCodEmpresa+'-'+sgNomeEmpresa)+') FROM 1 FOR 60)'+ // SQL - Busca Codigo e Nome da Empresa
           '     ELSE'+
           '       SUBSTRING(TRIM(nt.vendedor_doc||''-''||vd.fnome) FROM 1 FOR 60)'+
           ' END NOME_VENDEDOR,'+ // 20 Nome do Vendedor

           ' NULL CAMPO_LIVRE_1,'+ // 21 Campo Livre 1
           ' NULL CAMPO_LIVRE_2'+  // 22 Campo Livre 2

           ' FROM ACEM1401 nt'+ // Movimento de Notas Fiscais
           '     LEFT JOIN ACEM14IT it  ON it.documento=nt.documento'+ // Produtos das Notas Fiscais
           '                           AND it.serie=nt.serie_doc'+
           '                           AND it.cod_op=nt.operacao_doc'+
           '                           AND it.cod_cli=nt.cod_cli'+
           '     LEFT JOIN ACEC1101 pr  ON pr.codigo=it.codigoproduto'+ // Cadastro de Produto
           '     LEFT JOIN AUGC0501 fo  ON fo.fcod=pr.cod_fornecedor'+ // Cadastro de Fornecedores
           '     LEFT JOIN AUGC0501 vd  ON vd.fcod=nt.vendedor_doc'+ // Cadastro de Vendedores/Outros
           '     LEFT JOIN AFVC0901 op  ON op.cod_op=it.cod_op'+ // Cadastro de Operacoes e Cfops
           '     LEFT JOIN AUGC0301 cl  ON cl.codigo_cliente=nt.cod_cli'+ // Cadastro de Clientes
// Retirado em 26/09/2018 - Produto com mais de um Fornecedor
//           '     LEFT JOIN AUGM2101 cf  ON cf.produto=pr.codigo'+ // Cadastro de Fornecedores e Produtos

           ' WHERE NOT (nt.operacao_doc=''00000'' AND nt.operacaop=''05000'')'; // Pedencia Não

           If Not bgUsaDtaParam Then
            MySql:=
             MySql+' AND   CAST(nt.data as DATE)>=CURRENT_TIMESTAMP-31'+
                   ' AND   CAST(nt.data as DATE)<=CURRENT_TIMESTAMP-1'
           Else
            MySql:=
             MySql+' AND   CAST(nt.data as DATE)>='+QuotedStr(sgDtaIniParam)+
                   ' AND   CAST(nt.data as DATE)<='+QuotedStr(sgDtaFimParam);

    // OdirApagar - 12/03/2019 - Retirado as Devoluções
//    MySql:=
//     MySql+' AND   (((UPPER(TRIM(op.desc_op_nf)) LIKE ''%VENDA%'') AND (UPPER(nt.entrada_saida)=''S''))'+
//           '        OR'+
//           '        ((UPPER(TRIM(op.desc_op_nf)) LIKE ''%DEVOL%VENDA%'') AND (UPPER(nt.entrada_saida)=''E'')))'+
    MySql:=
     MySql+' AND   ((UPPER(TRIM(op.desc_op_nf)) LIKE ''%VENDA%'') AND (UPPER(nt.entrada_saida)=''S''))'+

           ' AND   pr.cod_fornecedor=''00246'''+ // Somente Loreal
           ' AND   it.valor_unitarioproduto IS NOT NULL'+

           ' GROUP BY 3,4,5,11,12,13,14,15,16,17,18,19, 20'+

           // OdirApagar - 17/09/2018 - Não Separar Devoluções =================
//           ' UNION'+
//
//           // Notas Fiscais Canceladas =========================================
//           ' SELECT'+
//           ' 1 ORDEM,'+ // 1 ORDEM
//           ' ''V'' TR,'+ // 2
//           ' (SELECT CAST(REPLACE(REPLACE(REPLACE(COALESCE(d.ciccgc,''99999999999999''), ''/'',''''),''.'',''''),''-'','''')'+
//           '         AS VARCHAR(18))'+
//           '  FROM ea d) COD_LOJA,'+ // 3 CNPJ da Distribuidora
//
//           ' CAST(REPLACE(REPLACE(REPLACE(COALESCE(fo.fcnpj_cic,''99999999999999''), ''/'', ''''),''.'',''''),''-'','''')'+
//           '     AS VARCHAR(18)) CNPJ_FORN,'+ // 4 CNPJ do Fornecedor
//
//           ' CASE'+
//           '   WHEN pr.outro_codigo=NULL THEN'+
//           '     pr.codigo'+
//           '   ELSE'+
//           '     pr.outro_codigo'+
//           ' END COD_BARRAS,'+ // 5 Codigo de Barras
//
//           ' NULL LOTE,'+ // 6 Lote
//           ' NULL LOTE_VALIDADE,'+ // 7 Lote Validade
//
//           ' CAST(SUM(COALESCE(it.qunatidadeproduto,0) * 1000) AS INTEGER) QUANTIDADE,'+ // 8 Quantidade de Venda Atendida
//
//           // OdirApagar - 30/08/2018 - É o campo VALOR_TOTAL_UNIT
//           // ' SUM(COALESCE(it.meitvalorbrutoitem,0) + COALESCE(it.meitfreterateado,0)) * 100  VALOR_TRANSACAO,'+ // 9 Valor Final da Tansação
//           ' SUM(COALESCE(it.valor_total_unit,0)) * 100  VALOR_TRANSACAO,'+ // 9 Valor Final da Tansação
//
//           ' ''BRL'' MOEDA,'+ // 10 Moeda
//           ' nt.documento DOCUMENTO,'+ // 11 Identificação da Transação
//
//           ' CAST(EXTRACT(YEAR FROM nt.data) AS VARCHAR(4))||'+
//           ' CAST(LPAD(EXTRACT(MONTH FROM nt.data),2,''0'') AS VARCHAR(2))||'+
//           ' CAST(LPAD(EXTRACT(DAY FROM nt.data),2,''0'') AS VARCHAR(2)) DTA_DOCUMENTO,'+ // 12 Data da Emissão do Documento
//
//           ' ''C'','+ // 13 Tipo de Transação
//
//           ' CAST(CAST(COALESCE(op.cod_natureza,0) AS INTEGER) AS VARCHAR(4)) CFOP,'+ // 14 CFop
//
//           ' CASE'+
//           '    WHEN CHAR_LENGTH(TRIM(CAST(REPLACE(REPLACE(REPLACE(COALESCE(cl.cgc_cnpj,''99999999999999''),'+
//           '                        ''/'', ''''),''.'',''''),''-'','''') AS VARCHAR(18))))<12 Then'+
//           '      1'+
//           '    ELSE'+
//           '      2'+
//           ' END  TIPO_IDENT_PDV,'+ // 15 Tipo Identificador PDV
//
//           ' TRIM(CAST(REPLACE(REPLACE(REPLACE(COALESCE(cl.cgc_cnpj,''99999999999999''),'+
//           '                        ''/'', ''''),''.'',''''),''-'','''') AS VARCHAR(18))) IDENTIFICADOR_PDV,'+ // 16 Identificador do PDV
//
//           ' SUBSTRING(TRIM(cl.nome) FROM 1 FOR 60) DESCRICAO_PDV,'+ // 17 Descrição do PDV
//           ' TRIM(REPLACE(REPLACE(REPLACE(REPLACE(COALESCE(cl.cep,''99999999''), ''/'', ''''),''.'',''''),''-'',''''),'' '','''')) CEP_PDV,'+ // 18 CEP do PDV
//
//           ' CASE'+
//           '   WHEN COALESCE(cl.ramo,0) = 4 THEN'+
//           '     ''P1'''+ // Perfumarias
//           '   ELSE'+
//           '     ''N1'''+ // Outros
//           ' END CLASSIFICACAO_PDV,'+ // 13 Classificaçção do PDV
//
//           ' CASE'+
//           '     WHEN TRIM(COALESCE(vd.fnome,''''))='''' THEN '+
//           '       SUBSTRING(TRIM('+QuotedStr(sgCodEmpresa+'-'+sgNomeEmpresa)+') FROM 1 FOR 60)'+ // SQL - Busca Codigo e Nome da Empresa
//           '     ELSE'+
//           '       SUBSTRING(TRIM(nt.vendedor_doc||''-''||vd.fnome) FROM 1 FOR 60)'+
//           ' END NOME_VENDEDOR,'+ // 20 Nome do Vendedor
//
//           ' NULL CAMPO_LIVRE_1,'+ // 21 Campo Livre 1
//           ' NULL CAMPO_LIVRE_2'+ // 22 Campo Livre 2
//
//           ' FROM ACEM1401 nt'+ // Movimento de Notas
//           '     LEFT JOIN ACEM14IT it  ON it.documento=nt.documento'+ // Produtos da Nota
//           '                           AND it.serie=nt.serie_doc'+
//           '                           AND it.cod_op=nt.operacao_doc'+
//           '                           AND it.cod_cli=nt.cod_cli'+
//           '     LEFT JOIN ACEC1101 pr  ON pr.codigo=it.codigoproduto'+ // Cadastro de Produto
//           '     LEFT JOIN AUGC0501 fo  ON fo.fcod=pr.cod_fornecedor'+ // Cadastro de Fornecedores
//           '     LEFT JOIN AUGC0501 vd  ON vd.fcod=nt.vendedor_doc'+ // Cadastro de Vendedores
//           '     LEFT JOIN AFVC0901 op  ON op.cod_op=it.cod_op'+ // Operacoes e Cfops
//           '     LEFT JOIN AUGC0301 cl  ON cl.codigo_cliente=nt.cod_cli'+ // Cadastro de Clientes
//
//           ' WHERE NOT (nt.operacao_doc=''00000'' AND nt.operacaop=''05000'')'; // Pedencia Não
//
//           If Not bgUsaDtaParam Then
//            MySql:=
//             MySql+' AND   CAST(nt.data as DATE)>=CURRENT_TIMESTAMP-31'+
//                   ' AND   CAST(nt.data as DATE)<=CURRENT_TIMESTAMP-1'
//           Else
//            MySql:=
//             MySql+' AND   CAST(nt.data as DATE)>='+QuotedStr(sgDtaIniParam)+
//                   ' AND   CAST(nt.data as DATE)<='+QuotedStr(sgDtaFimParam);
//
//    MySql:=
//     MySql+' AND   ((UPPER(TRIM(op.desc_op_nf)) LIKE ''%VENDA%'') AND (UPPER(nt.entrada_saida)=''S''))'+
//           ' AND   ((nt.menfemotivocancelamento IS NOT NULL) OR (UPPER(COALESCE(nt.operacaop, ''''))=''CA''))'+
//           ' AND   pr.cod_fornecedor=''00246'''+ // Somente Loreal
//           ' AND   it.valor_unitarioproduto IS NOT NULL'+
//
//           ' GROUP BY 3,4,5,11,12,13,14,15,16,17,18,20'+

           // REGISTRO "H" CABECALHO ===========================================
           ' UNION'+

           ' SELECT'+
           ' 0,'+ // 1 ORDEM
           ' ''H'','+ // 2 Tipo de registro
           ' CAST(REPLACE(REPLACE(REPLACE(COALESCE(c.ciccgc,''99999999999999''),'+
           '      ''/'', ''''),''.'',''''),''-'','''') AS VARCHAR(18)),'+ // 3 CNPJ da Distribuidora

           ' CAST(EXTRACT(YEAR FROM CAST('+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaInicioMovto)))+' AS DATE)) AS VARCHAR(4))||'+
           ' CAST(LPAD(EXTRACT(MONTH FROM CAST('+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaInicioMovto)))+' AS DATE)),2,''0'') AS VARCHAR(2))||'+
           ' CAST(LPAD(EXTRACT(DAY FROM CAST('+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaInicioMovto)))+' AS DATE)),2,''0'') AS VARCHAR(2)),'+ // 4 Data Inicial dos Registro Apresentados

           ' CAST(EXTRACT(YEAR FROM CAST('+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaFimMovto)))+' AS DATE)) AS VARCHAR(4))||'+
           ' CAST(LPAD(EXTRACT(MONTH FROM CAST('+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaFimMovto)))+' AS DATE)),2,''0'') AS VARCHAR(2))||'+
           ' CAST(LPAD(EXTRACT(DAY FROM CAST('+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaFimMovto)))+' AS DATE)),2,''0'') AS VARCHAR(2)),'+ // 5 Data Final dos Registro Apresentados

           ' NULL,'+ // 6
           ' NULL,'+ // 7
           ' NULL,'+ // 8
           ' NULL,'+ // 9
           ' NULL,'+ // 10
           ' NULL,'+ // 11
           ' NULL,'+ // 12
           ' NULL,'+ // 13
           ' NULL,'+ // 14
           ' NULL,'+ // 15
           ' NULL,'+ // 16
           ' NULL,'+ // 17
           ' NULL,'+ // 18
           ' NULL,'+ // 19
           ' NULL,'+ // 20
           ' NULL,'+ // 21
           ' NULL'+  // 22

           ' FROM EA c'+

           // REGISTRO "E" FIM =================================================
           ' UNION'+

           ' SELECT'+
           ' 2,'+ // 1 ORDEM
           ' ''E'','+ // 2 Tipo de registro
           ' NULL,'+ // 3
           ' NULL,'+ // 4
           ' NULL,'+ // 5
           ' NULL,'+ // 6
           ' NULL,'+ // 7
           ' NULL,'+ // 8
           ' NULL,'+ // 9
           ' NULL,'+ // 10
           ' NULL,'+ // 11
           ' NULL,'+ // 12
           ' NULL,'+ // 13
           ' NULL,'+ // 14
           ' NULL,'+ // 15
           ' NULL,'+ // 16
           ' NULL,'+ // 17
           ' NULL,'+ // 18
           ' NULL,'+ // 19
           ' NULL,'+ // 20
           ' NULL,'+ // 21
           ' NULL'+  // 22

           ' FROM RDB$DATABASE'+

           ' ORDER BY 1,2,3,11,10';
    DMAcceraLoreal.SDS_Arquivo.Close;
    DMAcceraLoreal.SDS_Arquivo.CommandText:=MySql;
    DMAcceraLoreal.SDS_Arquivo.Open;

    While not DMAcceraLoreal.SDS_Arquivo.Eof do
    Begin
      // Registro Cabecalho ====================================================
      If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='H' Then
      Begin
        sLinha:='';
        For i:=1 to 4 do
        Begin
          If i=1 Then
           sLinha:=sLinha+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString)
          Else
           Begin
             If (DMAcceraLoreal.SDS_Arquivo.Fields[i].FieldName='CNPJ_FORN') Or
                (DMAcceraLoreal.SDS_Arquivo.Fields[i].FieldName='COD_LOJA')  Or
                (DMAcceraLoreal.SDS_Arquivo.Fields[i].FieldName='IDENTIFICADOR_PDV') Then
              sLinha:=sLinha+';'+IntToStr(StrToInt64(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString))
             Else
              sLinha:=sLinha+';'+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString);
           End;
        End; // For i:=1 to 3 do
        tsArquivo.Add(sLinha)
      End; // If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='H' Then

      // Registro Valores ======================================================
      If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='V' Then
      Begin
        sLinha:='';
        For i:=1 to DMAcceraLoreal.SDS_Arquivo.FieldCount-1 do
        Begin
          If i=1 Then
           sLinha:=sLinha+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString)
          Else
           Begin
             If (DMAcceraLoreal.SDS_Arquivo.Fields[i].FieldName='CNPJ_FORN') Or
                (DMAcceraLoreal.SDS_Arquivo.Fields[i].FieldName='COD_LOJA')  Or
                (DMAcceraLoreal.SDS_Arquivo.Fields[i].FieldName='IDENTIFICADOR_PDV') Then
              sLinha:=sLinha+';'+IntToStr(StrToInt64(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString))
             Else
              sLinha:=sLinha+';'+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString);
           End;
        End; // For i:=1 to DMAcceraLoreal.SDS_Arquivo.FieldCount-1 do
        tsArquivo.Add(sLinha)
      End; // If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='V' Then

      // Registro Fim ==========================================================
      If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='E' Then
      Begin
        tsArquivo.Add('E');
      End; // If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='E' Then

      DMAcceraLoreal.SDS_Arquivo.Next;
    End; // While not DMAcceraLoreal.SDS_Arquivo.Eof do
    DMAcceraLoreal.SDS_Arquivo.Close;
                                           
    tsArquivo.SaveToFile(sgPastaSalvarArq+'ACC_SELLOUT_'+sgDtaGeracao+'.TXT');
  Finally // Try
    // Libera a instancia da lista da memória
    FreeAndNil(tsArquivo);
  End; // Try

  Result:=True;
End; // Cadastro de Vendas do Distribuidor >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Cadastro de Estoques >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmAcceraLoreal.ACC_POSESTQ: Boolean;
Var
  tsArquivo: TStringList;
  i: Integer;
  sLinha: String;
Begin
  Result:=False;

  // Instancia a variável arquivo
  tsArquivo:=TStringList.Create;

  Try
    // REGISTRO "V" VALORES ====================================================
    MySql:=' SELECT'+
           ' 1 ORDEM,'+ // 1 Ordem
           ' ''V'' TR,'+ // 2 Tipo de Registro

           ' (SELECT CAST(REPLACE(REPLACE(REPLACE(COALESCE(d.ciccgc,''99999999999999''),'+
           '              ''/'', ''''),''.'',''''),''-'','''') AS VARCHAR(18))'+
           '  FROM ea d) COD_CDLOJA,'+ // 3 CNPJ da Distribuidora

           ' CAST(REPLACE(REPLACE(REPLACE(COALESCE(fo.fcnpj_cic,''99999999999999''),'+
           '      ''/'', ''''),''.'',''''),''-'','''') AS VARCHAR(18)) COD_FORNECEDOR,'+ // 4 Codigo (CNPJ) Fornecedor

// Retirado em 26/09/2018 - Produto com mais de um Fornecedor
//           ' CASE'+
//           '   WHEN COALESCE(pr.outro_codigo,'''')<>'''' THEN'+
//           '     pr.outro_codigo'+
//           '   WHEN COALESCE(cf.ficodigo_barras,'''')<>'''' THEN'+
//           '     cf.ficodigo_barras'+
//           '   WHEN COALESCE(cf.ficodigofornecedor,'''')<>'''' THEN'+
//           '     cf.ficodigofornecedor'+
//           '   ELSE'+
//           '     pr.codigo'+
//           ' END COD_BARRAS,'+ // 5 Codigo de Barras
           ' CASE'+
           '   WHEN COALESCE(pr.outro_codigo,'''')<>'''' THEN'+
           '     pr.outro_codigo'+
           '   ELSE'+
           '     pr.codigo'+
           ' END COD_BARRAS,'+ // 5 Codigo de Barras

           ' NULL LOTE,'+ // 6 Numero do Lote
           ' NULL LOTE_VALIDADE,'+ // 7 Validadedo Lote

           ' (CAST(CASE'+
           '       WHEN pr.estoque<0.000 THEN'+
           '         0'+
           '       ELSE'+
           '         pr.estoque'+
           '     END'+
           ' AS INTEGER) * 1000) QUANTIDADE,'+ // 8 Estoque (Estoque Negativo Aparesentar com estoque 0 <Zero>)

           ' ''H'' TIPO_ESTOQUE,'+ // 9 Tipo do Estoque

           ' CAST(EXTRACT(YEAR FROM CURRENT_TIMESTAMP) AS VARCHAR(4))||'+
           ' CAST(LPAD(EXTRACT(MONTH FROM CURRENT_TIMESTAMP),2,''0'') AS VARCHAR(2))||'+
           ' CAST(LPAD(EXTRACT(DAY FROM CURRENT_TIMESTAMP),2,''0'') AS VARCHAR(2)) DTA_ESTOQUE'+ // 10 Data da Posicao de Estoque

           ' FROM ACEC1101 pr'+ // Cadastro de Produto
           '    LEFT JOIN AUGC0501 fo ON fo.fcod=pr.cod_fornecedor'+ // Cadastro de Fornecedores

// Retirado em 26/09/2018 - Produto com mais de um Fornecedor
//           '    LEFT JOIN AUGM2101 cf ON cf.produto=pr.codigo'+ // Cadastro de Fornecedores e Produtos

           ' WHERE pr.codigo<>''000001'''+ // Produto de Teste
           ' AND   ((pr.prativo=''S'') OR (pr.prativo=''N'' AND pr.estoque>0))'+ // Inativos Somente com Estoque
           ' AND   pr.cod_fornecedor=''00246'''+ // Somente Loreal

           // REGISTRO "H" CABECALHO ===========================================
           ' UNION'+

           ' SELECT'+
           ' 0,'+ // 1 ORDEM
           ' ''H'','+ // 2 Tipo de registro
           ' CAST(REPLACE(REPLACE(REPLACE(COALESCE(C.CICCGC,''99999999999999''),'+
           '      ''/'', ''''),''.'',''''),''-'','''') AS VARCHAR(18)),'+ // 3 CNPJ da Distribuidora

           ' CAST(EXTRACT(YEAR FROM CURRENT_TIMESTAMP) AS VARCHAR(4))||'+
           ' CAST(LPAD(EXTRACT(MONTH FROM CURRENT_TIMESTAMP),2,''0'') AS VARCHAR(2))||'+
           ' CAST(LPAD(EXTRACT(DAY FROM CURRENT_TIMESTAMP),2,''0'') AS VARCHAR(2)),'+ // 4 Data Inicial dos Registro Apresentados

           ' CAST(EXTRACT(YEAR FROM CURRENT_TIMESTAMP) AS VARCHAR(4))||'+
           ' CAST(LPAD(EXTRACT(MONTH FROM CURRENT_TIMESTAMP),2,''0'') AS VARCHAR(2))||'+
           ' CAST(LPAD(EXTRACT(DAY FROM CURRENT_TIMESTAMP),2,''0'') AS VARCHAR(2)),'+ // 5 Data Final dos Registro Apresentados

           ' NULL,'+ // 6
           ' NULL,'+ // 7
           ' NULL,'+ // 8
           ' NULL,'+ // 9
           ' NULL'+  // 10

           ' FROM EA c'+

           // REGISTRO "E" FIM =================================================
           ' UNION'+

           ' SELECT'+
           ' 2,'+ // 1 ORDEM
           ' ''E'','+ // 2 Tipo de registro
           ' NULL,'+ // 3
           ' NULL,'+ // 4
           ' NULL,'+ // 5
           ' NULL,'+ // 6
           ' NULL,'+ // 7
           ' NULL,'+ // 8
           ' NULL,'+ // 9
           ' NULL'+  // 10

           ' FROM RDB$DATABASE';
    DMAcceraLoreal.SDS_Arquivo.Close;
    DMAcceraLoreal.SDS_Arquivo.CommandText:=MySql;
    DMAcceraLoreal.SDS_Arquivo.Open;

    While not DMAcceraLoreal.SDS_Arquivo.Eof do
    Begin
      // Registro Cabecalho ====================================================
      If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='H' Then
      Begin
        sLinha:='';
        For i:=1 to 4 do
        Begin
          If i=1 Then
           sLinha:=sLinha+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString)
          Else
           Begin
             If (DMAcceraLoreal.SDS_Arquivo.Fields[i].FieldName='COD_FORNECEDOR') OR
                (DMAcceraLoreal.SDS_Arquivo.Fields[i].FieldName='COD_CDLOJA') Then
              sLinha:=sLinha+';'+IntToStr(StrToInt64(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString))
             Else
              sLinha:=sLinha+';'+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString);
           End;
        End; // For i:=1 to 3 do
        tsArquivo.Add(sLinha)
      End; // If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='H' Then

      // Registro Valores ======================================================
      If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='V' Then
      Begin
        sLinha:='';
        For i:=1 to DMAcceraLoreal.SDS_Arquivo.FieldCount-1 do
        Begin
          If i=1 Then
           sLinha:=sLinha+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString)
          Else
           Begin
             If (DMAcceraLoreal.SDS_Arquivo.Fields[i].FieldName='COD_FORNECEDOR') OR
                (DMAcceraLoreal.SDS_Arquivo.Fields[i].FieldName='COD_CDLOJA') Then
              sLinha:=sLinha+';'+IntToStr(StrToInt64(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString))
             Else
              sLinha:=sLinha+';'+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString);
           End;
        End; // For i:=1 to DMAcceraLoreal.SDS_Arquivo.FieldCount-1 do
        tsArquivo.Add(sLinha)
      End; // If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='V' Then

      // Registro Fim ==========================================================
      If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='E' Then
      Begin
        tsArquivo.Add('E');
      End; // If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='E' Then

      DMAcceraLoreal.SDS_Arquivo.Next;
    End; // While not DMAcceraLoreal.SDS_Arquivo.Eof do
    DMAcceraLoreal.SDS_Arquivo.Close;

    tsArquivo.SaveToFile(sgPastaSalvarArq+'ACC_POSESTQ_'+sgDtaGeracao+'.TXT');
  Finally // Try
    // Libera a instancia da lista da memória
    FreeAndNil(tsArquivo);
  End; // Try

  Result:=True;
End; // Cadastro de Estoques >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Cadastro de CDs/Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmAcceraLoreal.ACC_CADSITE: Boolean;
Var
  tsArquivo: TStringList;
  i: Integer;
  sLinha: String;
Begin
  Result:=False;

  // Instancia a variável arquivo
  tsArquivo:=TStringList.Create;

  Try
    // REGISTRO "V" VALORES ====================================================
    MySql:=' SELECT'+
           ' 1 ORDEM,'+ // 1 Ordem
           ' ''V'' TR,'+ // 2 Tipo de Registro
           ' CAST(REPLACE(REPLACE(REPLACE(COALESCE(l.ciccgc,''99999999999999''),'+
           '      ''/'', ''''),''.'',''''),''-'','''') AS VARCHAR(18)) COD_LOJA,'+ // 3 CNPJ da Distribuidora
           ' SUBSTRING(TRIM(l.nome) FROM 1 FOR 60) DES_LOJA,'+ // 4 Nome Fornecedor
           ' TRIM(l.estado) UF_LOJA,'+ // 5 UF
           ' SUBSTRING(TRIM(l.cidade) FROM 1 FOR 60) CIDADE_LOJA,'+ // 6 Cidade
           ' SUBSTRING(TRIM(l.bairro) FROM 1 FOR 60) BAIRRO_LOJA,'+ // 7 Bairro
           ' TRIM(REPLACE(REPLACE(REPLACE(REPLACE(COALESCE(l.cep,''99999999''), ''/'',''''),''.'',''''),''-'',''''),'' '','''')) CEP_LOJA,'+ // 8 CEP
           ' ''A'' STATUS_LOJA'+ // 9 Status da Loja

           ' FROM EA l'+

           // REGISTRO "H" CABECALHO ===========================================
           ' UNION'+

           ' SELECT'+
           ' 0,'+ // 1 Ordem
           ' ''H'','+ // 2 Tipo de Registro
           ' REPLACE(REPLACE(REPLACE(COALESCE(c.ciccgc,''99999999999999''), ''/'', ''''),''.'',''''),''-'',''''),'+ // 3 CNPJ da Distribuidora

           ' CAST(EXTRACT(YEAR FROM CURRENT_TIMESTAMP) AS VARCHAR(4))||'+
           ' CAST(LPAD(EXTRACT(MONTH FROM CURRENT_TIMESTAMP),2,''0'') AS VARCHAR(2))||'+
           ' CAST(LPAD(EXTRACT(DAY FROM CURRENT_TIMESTAMP),2,''0'') AS VARCHAR(2)),'+ // 4 DATA DA GERAÇÃO DO ARQUIVO

           ' NULL,'+ // 5
           ' NULL,'+ // 6
           ' NULL,'+ // 7
           ' NULL,'+ // 8
           ' NULL'+  // 9
           ' FROM EA C'+

           // REGISTRO "E" FIM =================================================
           ' UNION'+

           ' SELECT'+
           ' 2,'+ // 1 Ordem
           ' ''E'','+ // 2 Tipo de registro
           ' NULL,'+ // 3
           ' NULL,'+ // 4
           ' NULL,'+ // 5
           ' NULL,'+ // 6
           ' NULL,'+ // 7
           ' NULL,'+ // 8
           ' NULL'+  // 9

           ' FROM RDB$DATABASE';
    DMAcceraLoreal.SDS_Arquivo.Close;
    DMAcceraLoreal.SDS_Arquivo.CommandText:=MySql;
    DMAcceraLoreal.SDS_Arquivo.Open;

    While not DMAcceraLoreal.SDS_Arquivo.Eof do
    Begin
      // Registro Cabecalho ====================================================
      If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='H' Then
      Begin
        sLinha:='';
        For i:=1 to 3 do
        Begin
          If i=1 Then
           sLinha:=sLinha+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString)
          Else
           Begin
             If DMAcceraLoreal.SDS_Arquivo.Fields[i].FieldName='COD_LOJA' Then
              sLinha:=sLinha+';'+IntToStr(StrToInt64(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString))
             Else
              sLinha:=sLinha+';'+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString);
           End;
        End; // For i:=1 to 3 do
        tsArquivo.Add(sLinha)
      End; // If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='H' Then

      // Registro Valores ======================================================
      If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='V' Then
      Begin
        sLinha:='';
        For i:=1 to DMAcceraLoreal.SDS_Arquivo.FieldCount-1 do
        Begin
          If i=1 Then
           sLinha:=sLinha+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString)
          Else
           Begin
             If DMAcceraLoreal.SDS_Arquivo.Fields[i].FieldName='COD_LOJA' Then
              sLinha:=sLinha+';'+IntToStr(StrToInt64(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString))
             Else
              sLinha:=sLinha+';'+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString);
           End;
        End; // For i:=1 to DMAcceraLoreal.SDS_Arquivo.FieldCount-1 do
        tsArquivo.Add(sLinha)
      End; // If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='V' Then

      // Registro Fim ==========================================================
      If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='E' Then
      Begin
        tsArquivo.Add('E');
      End; // If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='E' Then

      DMAcceraLoreal.SDS_Arquivo.Next;
    End; // While not DMAcceraLoreal.SDS_Arquivo.Eof do
    DMAcceraLoreal.SDS_Arquivo.Close;

    tsArquivo.SaveToFile(sgPastaSalvarArq+'ACC_CADSITE_'+sgDtaGeracao+'.TXT');
  Finally // Try
    // Libera a instancia da lista da memória
    FreeAndNil(tsArquivo);
  End; // Try

  Result:=True;
End; // // Cadastro de CDs/Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Cadastro de Produtos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmAcceraLoreal.ACC_CADPROD: Boolean;
Var
  tsArquivo: TStringList;
  i: Integer;
  sLinha: String;
Begin
  Result:=False;

  // Instancia a variável arquivo
  tsArquivo:=TStringList.Create;

  Try
    // REGISTRO "V" VALORES ====================================================
    MySql:=' SELECT'+
           ' 1 Ordem,'+ // 1 Ordem
           ' ''V'' TR,'+ // 2 TIPO DE REGISTRO
           ' REPLACE(REPLACE(REPLACE(COALESCE(fo.fcnpj_cic,''99999999999999''), ''/'', ''''),''.'',''''),''-'','''') COD_FORNECEDOR,'+ // 3 Codigo (CNPJ) Fornecedor
           ' SUBSTRING(TRIM(fo.fnome) FROM 1 FOR 60) DES_FORNECEDOR,'+ // 4 Nome Fornecedor
           ' pr.codigo COD_PRODUTO,'+ // 5 Codigo Produto
           ' SUBSTRING(TRIM(pr.descricao) FROM 1 FOR 60) DES_PRODUTO,'+ // 6 Descricao Produto
           ' gr.codigo COD_GRUPO,'+ // 7 Codigo Grupo
           ' SUBSTRING(TRIM(gr.descricao) FROM 1 FOR 60) DES_GRUPO,'+ // 8 Descricao grupo
           ' NULL COD_FAMILIA,'+ // 9 Codigo Familia
           ' NULL DES_FAMILIA,'+ // 109 Descricao Familia
           ' NULL COD_SUBFAMILIA,'+ // 11 Codigo SubFamilia
           ' NULL DES_SUBFAMILIA,'+ // 12 Descricao SubFamilia
           ' ''E'' TIPO_CODBARRAS,'+ // 13 Tipo do Codigo de Barras (EAN)

// Retirado em 26/09/2018 - Produto com mais de um Fornecedor
//           ' CASE'+
//           '   WHEN COALESCE(pr.outro_codigo,'''')<>'''' THEN'+
//           '     pr.outro_codigo'+
//           '   WHEN COALESCE(cf.ficodigo_barras,'''')<>'''' THEN'+
//           '     cf.ficodigo_barras'+
//           '   WHEN COALESCE(cf.ficodigofornecedor,'''')<>'''' THEN'+
//           '     cf.ficodigofornecedor'+
//           '   ELSE'+
//           '     pr.codigo'+
//           ' END COD_BARRAS,'+ // 14 Codigo de Barras
           ' CASE'+
           '   WHEN COALESCE(pr.outro_codigo,'''')<>'''' THEN'+
           '     pr.outro_codigo'+
           '   ELSE'+
           '     pr.codigo'+
           ' END COD_BARRAS,'+ // 14 Codigo de Barras

           ' ''CAIXA'' TIPO_EMBALAGEM,'+ // 15 Tipo de Embalagem de Venda (=====>> VER)
           ' ''UN'' UNI_PRODUTO,'+ // 16 Unidade do Produto
           ' ''1000'' VOLUMA_EMB_VENDA,'+ // 17 Volume da Embalagem de Venda (=====>> VER)

           ' CASE'+
           '   WHEN pr.prativo=''S'' THEN'+
           '     ''A'''+
           '   ELSE'+
           '     ''I'''+
           ' END STATUS_PRODUTO,'+ // 18 Status do Produto

           ' CAST(EXTRACT(YEAR FROM pr.data_inclusao) AS VARCHAR(4))||'+
           ' CAST(LPAD(EXTRACT(MONTH FROM pr.data_inclusao),2,''0'') AS VARCHAR(2))||'+
           ' CAST(LPAD(EXTRACT(DAY FROM pr.data_inclusao),2,''0'') AS VARCHAR(2)) DTA_CADASTRO'+ // 19 Data do Cadastro

           ' FROM ACEC1101 pr'+ // Cadastro de Produto
           '    LEFT JOIN AUGC0501 fo ON fo.fcod=pr.cod_fornecedor'+ // Cadastro de Fornecedores
           '    LEFT JOIN ACEC1201 gr ON gr.codigo=pr.grupo'+ // Cadastro de Grupos de Produtos

// Retirado em 26/09/2018 - Produto com mais de um Fornecedor
//           '    LEFT JOIN AUGM2101 cf ON cf.produto=pr.codigo'+ // Cadastro de Fornecedores e Produtos

           ' WHERE pr.codigo<>''000001'''+ // Produto de Teste
           ' AND   pr.cod_fornecedor=''00246'''+ // Somente Loreal

           // REGISTRO "H" CABECALHO ===========================================
           ' UNION'+

           ' SELECT'+
           ' 0,'+ // 1
           ' ''H'','+ // 2

           ' (SELECT CAST(REPLACE(REPLACE(REPLACE(COALESCE(d.ciccgc,''99999999999999''),'+
           '                   ''/'', ''''),''.'',''''),''-'','''') AS VARCHAR(18))'+
           '  FROM ea d),'+ // 3 CNPJ da Distribuidora

           ' CAST(EXTRACT(YEAR FROM CURRENT_TIMESTAMP) AS VARCHAR(4))||'+
           ' CAST(LPAD(EXTRACT(MONTH FROM CURRENT_TIMESTAMP),2,''0'') AS VARCHAR(2))||'+
           ' CAST(LPAD(EXTRACT(DAY FROM CURRENT_TIMESTAMP),2,''0'') AS VARCHAR(2)),'+ // 4 Data da Geração do Arquivo

           ' NULL,'+ // 5
           ' NULL,'+ // 6
           ' NULL,'+ // 7
           ' NULL,'+ // 8
           ' NULL,'+ // 9
           ' NULL,'+ // 10
           ' NULL,'+ // 11
           ' NULL,'+ // 12
           ' NULL,'+ // 13
           ' NULL,'+ // 14
           ' NULL,'+ // 15
           ' NULL,'+ // 16
           ' NULL,'+ // 17
           ' NULL,'+  // 18
           ' NULL'+  // 19

           ' FROM RDB$DATABASE'+

           // REGISTRO "E" FIM =================================================

           ' UNION'+

           ' SELECT'+
           ' 2,'+  // 1
           ' ''E'','+ // 2
           ' NULL,'+ // 3
           ' NULL,'+ // 4
           ' NULL,'+ // 5
           ' NULL,'+ // 6
           ' NULL,'+ // 7
           ' NULL,'+ // 8
           ' NULL,'+ // 9
           ' NULL,'+ // 10
           ' NULL,'+ // 11
           ' NULL,'+ // 12
           ' NULL,'+ // 13
           ' NULL,'+ // 14
           ' NULL,'+ // 15
           ' NULL,'+ // 16
           ' NULL,'+ // 17
           ' NULL,'+ // 18
           ' NULL'+  // 19

           ' FROM RDB$DATABASE'+

           ' ORDER BY 1,6';
    DMAcceraLoreal.SDS_Arquivo.Close;
    DMAcceraLoreal.SDS_Arquivo.CommandText:=MySql;
    DMAcceraLoreal.SDS_Arquivo.Open;

    While not DMAcceraLoreal.SDS_Arquivo.Eof do
    Begin
      // Registro Cabecalho ====================================================
      If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='H' Then
      Begin
        sLinha:='';
        For i:=1 to 3 do
        Begin
          If i=1 Then
           sLinha:=sLinha+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString)
          Else
           Begin
             If DMAcceraLoreal.SDS_Arquivo.Fields[i].FieldName='COD_FORNECEDOR' Then
              sLinha:=sLinha+';'+IntToStr(StrToInt64(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString))
             Else
              sLinha:=sLinha+';'+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString);
           End;
        End; // For i:=1 to 3 do
        tsArquivo.Add(sLinha)
      End; // If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='H' Then

      // Registro Valores ======================================================
      If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='V' Then
      Begin
        sLinha:='';
        For i:=1 to DMAcceraLoreal.SDS_Arquivo.FieldCount-1 do
        Begin
          If i=1 Then
           sLinha:=sLinha+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString)
          Else
           Begin
             If DMAcceraLoreal.SDS_Arquivo.Fields[i].FieldName='COD_FORNECEDOR' Then
              sLinha:=sLinha+';'+IntToStr(StrToInt64(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString))
             Else
              sLinha:=sLinha+';'+Trim(DMAcceraLoreal.SDS_Arquivo.Fields[i].AsString);
           End;
        End; // For i:=1 to DMAcceraLoreal.SDS_Arquivo.FieldCount-1 do
        tsArquivo.Add(sLinha)
      End; // If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='V' Then

      // Registro Fim ==========================================================
      If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='E' Then
      Begin
        tsArquivo.Add('E');
      End; // If DMAcceraLoreal.SDS_Arquivo.FieldByName('TR').AsString='E' Then

      DMAcceraLoreal.SDS_Arquivo.Next;
    End; // While not DMAcceraLoreal.SDS_Arquivo.Eof do
    DMAcceraLoreal.SDS_Arquivo.Close;

    tsArquivo.SaveToFile(sgPastaSalvarArq+'ACC_CADPROD_'+sgDtaGeracao+'.TXT');
  Finally // Try
    // Libera a instancia da lista da memória
    FreeAndNil(tsArquivo);
  End; // Try

  Result:=True;
End; // Cadastro de Produtos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//==============================================================================
// ODIR - FIM ==================================================================
//==============================================================================

procedure TFrmAcceraLoreal.FormCreate(Sender: TObject);
Var
  sArqProc, sPeriodo: String;
  bInformarPeriodo: Boolean;
begin
  If Not DMAcceraLoreal.SQLC.Connected Then
  Begin
    Application.Terminate;
    Exit;
  End;

  bInformarPeriodo:=False;
//  If Trim(ParamStr(1))='' Then
//  Begin
//    if msg('Deseja Informar o Período ??', 'C')=1 Then
//    Begin
//      bInformarPeriodo:=True;
//    End; // If Application.MessageBox('Deseja Informar o Período ??', 'ATENÇÃO !!', 292) = IdOk Then
//  End; // If Trim(ParamStr(1))='' Then

  OdirPanApres.Caption:='AGUARDE !! Criando Arquivos ACCERA/R´ORÉAL...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmAcceraLoreal.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmAcceraLoreal.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmAcceraLoreal;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  //============================================================================
  // Se Periodo Vem por Parametros =============================================
  //============================================================================
  // PAcceraLoreal.exe 01/08/2018 16/08/2018  ==> Usar Barras de Separação Normais < / >
  //                   Parametro1 Parametro2
  //============================================================================
  bgUsaDtaParam:=False;
  sgDtaIniParam:=f_Troca('/','.',f_Troca('-','.',ParamStr(1)));
  sgDtaFimParam:=f_Troca('/','.',f_Troca('-','.',ParamStr(2)));
  If (Trim(sgDtaIniParam)<>'') And (Trim(sgDtaFimParam)<>'') Then
   bgUsaDtaParam:=True;
  // Se Periodo Vem por Parametros =============================================
  //============================================================================

  If (Not bgUsaDtaParam) And (bInformarPeriodo) Then
  Begin
    bgSiga:=False;

    FrmPeriodoApropriacao:=TFrmPeriodoApropriacao.Create(Self);
    FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Date:=IncMonth(Date,-1);
    FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Date   :=Date;
    FrmPeriodoApropriacao.ShowModal;

    sgDtaIniParam:=f_Troca('/','.',f_Troca('-','.',DateToStr(FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Date)));
    sgDtaFimParam:=f_Troca('/','.',f_Troca('-','.',DateToStr(FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Date)));

    FreeAndNil(FrmPeriodoApropriacao);

    // Verifica se Prossegue Processamento =======================================
    If Not bgSiga Then
    Begin
      msg('Aplicativo Será Encerrado !!','A');
      Application.Terminate;
      Exit;
    End;

    bgUsaDtaParam:=True;
  End; // If (Not bgUsaDtaParam) And (bInformarPeriodo) Then

  sArqProc:='';
  Application.ProcessMessages;

  //============================================================================
  // Monta Data da Geração dos Arquivos ========================================
  //============================================================================
  If Not bgUsaDtaParam Then
  Begin
    MySql:=' SELECT'+
           ' CAST(EXTRACT(YEAR FROM CURRENT_TIMESTAMP) AS VARCHAR(4))||'+
           ' CAST(LPAD(EXTRACT(MONTH FROM CURRENT_TIMESTAMP),2,''0'') AS VARCHAR(2))||'+
           ' CAST(LPAD(EXTRACT(DAY FROM CURRENT_TIMESTAMP),2,''0'') AS VARCHAR(2)) DTA_GERACAO'+
           ' FROM RDB$DATABASE';
  End; // If Not bgUsaDtaParam Then

  If bgUsaDtaParam Then
  Begin
    MySql:=' SELECT'+
           ' CAST(EXTRACT(YEAR FROM CAST('+QuotedStr(sgDtaFimParam)+' AS DATE)) AS VARCHAR(4))||'+
           ' CAST(LPAD(EXTRACT(MONTH FROM CAST('+QuotedStr(sgDtaFimParam)+' AS DATE)),2,''0'') AS VARCHAR(2))||'+
           ' CAST(LPAD(EXTRACT(DAY FROM CAST('+QuotedStr(sgDtaFimParam)+' AS DATE)),2,''0'') AS VARCHAR(2)) DTA_GERACAO'+
           ' FROM RDB$DATABASE';
  End; // If Not bgUsaDtaParam Then
  DMAcceraLoreal.SDS_Arquivo.Close;
  DMAcceraLoreal.SDS_Arquivo.CommandText:=MySql;
  DMAcceraLoreal.SDS_Arquivo.Open;
  sgDtaGeracao:=DMAcceraLoreal.SDS_Arquivo.FieldByName('Dta_Geracao').AsString;
  DMAcceraLoreal.SDS_Arquivo.Close;
  // Monta Data da Geração dos Arquivos ========================================
  //============================================================================

  //============================================================================
  // Busca Codigo e Nome da Empresa ============================================
  //============================================================================
  MySql:=' SELECT d.codigo, d.nome'+
         ' FROM EA d';
  DMAcceraLoreal.SDS_Arquivo.Close;
  DMAcceraLoreal.SDS_Arquivo.CommandText:=MySql;
  DMAcceraLoreal.SDS_Arquivo.Open;
  sgCodEmpresa :=Trim(DMAcceraLoreal.SDS_Arquivo.FieldByName('Codigo').AsString);
  sgNomeEmpresa:=Trim(DMAcceraLoreal.SDS_Arquivo.FieldByName('Nome').AsString);
  DMAcceraLoreal.SDS_Arquivo.Close;
  // Busca Codigo e Nome da Empresa ============================================
  //============================================================================

  //============================================================================
  // Cadastro de Produtos ======================================================
  //============================================================================
  If Not ACC_CADPROD Then
   sArqProc:=sArqProc+cr+'Cadastro de Produtos';
  // Cadastro de Produtos ======================================================
  //============================================================================

  //============================================================================
  // Cadastro de CDs/Lojas =====================================================
  //============================================================================
  If Not ACC_CADSITE Then
   sArqProc:=sArqProc+cr+'Cadastro de CDs/Lojas';
  // Cadastro de CDs/Lojas =====================================================
  //============================================================================

  //============================================================================
  // Cadastro de Estoques ======================================================
  //============================================================================
  If Not ACC_POSESTQ Then
   sArqProc:=sArqProc+cr+'Cadastro de Estoques';
  // Cadastro de Estoques ======================================================
  //============================================================================

  //============================================================================
  // Cadastro de Vendas do Distribuidor ========================================
  //============================================================================
  If Not ACC_SELLOUT Then
   sArqProc:=sArqProc+cr+'Cadastro de Vendas do Distribuidor';
  // Cadastro de Vendas do Distribuidor ========================================
  //============================================================================

  //============================================================================
  // Cadastro de Clientes (PDVs) ===============================================
  //============================================================================
  If Not ACC_PDVS Then
   sArqProc:=sArqProc+cr+'Cadastro de Clientes (PDVs)';
  // Cadastro de Clientes (PDVs) ===============================================
  //============================================================================

  //============================================================================
  // Notas Fiscais Recebidas ===================================================
  //============================================================================
  If Not ACC_NFS Then
   sArqProc:=sArqProc+cr+'Notas Fiscais Recebidas';
  // Notas Fiscais Recebidas ===================================================
  //============================================================================

  //============================================================================
  // Cadastro de Vendedores ====================================================
  //============================================================================
  If Not ACC_CADVEND Then
   sArqProc:=sArqProc+cr+'Cadastro de Vendedores';

  //============================================================================
  // F I M =====================================================================
  //============================================================================
// OdirApagar - 12/03/2019
//  If Trim(sArqProc)='' Then
//   Begin
//     MessageBox(Handle, pChar('Arquivos Gerados com SUCESSO !!'), 'ATENÇÃO !!', MB_ICONERROR);
//   End
//  Else
//   Begin
//     MessageBox(Handle, pChar('ERRO ao Gerar Arquivos !!'+cr+cr+
//                              'Período de '+DateToStr(Date-31)+' a '+DateToStr(Date-1)+cr+cr+
//                              'Não Existe Movto a Gerar no(s) Arquivo(s) Abaixo'+cr+cr+
//                              Trim(sArqProc)), 'ATENÇÃO !!', MB_ICONERROR);
//   End; // If Trim(sArqProc)='' Then
  If Trim(sArqProc)<>'' Then
  Begin
    MessageBox(Handle, pChar('ERRO ao Gerar Arquivos !!'+cr+cr+
                             'Período de '+DateToStr(Date-31)+' a '+DateToStr(Date-1)+cr+cr+
                             'Não Existe Movto a Gerar no(s) Arquivo(s) Abaixo'+cr+cr+
                             Trim(sArqProc)), 'ATENÇÃO !!', MB_ICONERROR);
  End; // If Trim(sArqProc)='' Then
  // F I M =====================================================================
  //============================================================================

  OdirPanApres.Visible:=False;

  DMAcceraLoreal.SQLC.Connected:=False;
  Application.Terminate;
end;

end.



