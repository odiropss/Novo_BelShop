unit UBlueMetrics;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, jpeg, JvExControls, JvXPCore,
  JvXPButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  JvExStdCtrls, JvCheckBox;

type
  TFrmBlueMetrics = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    Gb_ConsultaNFePeriodo: TGroupBox;
    Label181: TLabel;
    DtEdt_DataFim: TcxDateEdit;
    DtEdt_DataInicio: TcxDateEdit;
    Bt_ExportaDados: TJvXPButton;
    Lb_Tabela: TLabel;
    Lb_Reg: TLabel;
    Ckb_Clientes: TJvCheckBox;
    Ckb_Empresas: TJvCheckBox;
    Ckb_Produtos: TJvCheckBox;
    Ckb_Fornecedores: TJvCheckBox;
    Ckb_ItensVendas: TJvCheckBox;
    Ckb_Vendas: TJvCheckBox;
    Ckb_Vendedores: TJvCheckBox;
    Ckb_Estoques: TJvCheckBox;
    Ckb_ItensTrocas: TJvCheckBox;
    Ckb_Pagamentos: TJvCheckBox;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_ExportaDadosClick(Sender: TObject);

    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    // Uma Vez ==============
    Procedure Clientes;
    Procedure Empresas;
    Procedure Fornecedores;
    Procedure Produtos;
    Procedure Vendedores;
    Procedure Estoques;

    // Vendas

    // Itens Vendas

    // Itens Trocas

    // Pagamentos
    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBlueMetrics: TFrmBlueMetrics;

  sgCodLoja,
  sgDtaInicio, sgDtaFim
  : String;


implementation

uses UDMBlueMetrics, DK_Procs1, DB;

{$R *.dfm}
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Exporta Clientes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBlueMetrics.Clientes;
Var
  MySql: String;
Begin
  Screen.Cursor:=crAppStart;

  DMBlueMetrics.ADOC.BeginTrans;
  Try // Try da Transação
    Lb_Tabela.Caption:='Clientes';
    Lb_Reg.Caption:='0';

    DMBlueMetrics.SQLQ_Clientes.Open;
    DMBlueMetrics.SQLQ_Clientes.DisableControls;
    While Not DMBlueMetrics.SQLQ_Clientes.Eof do
    Begin
      Application.ProcessMessages;

      MySql:=' INSERT INTO CLIENTES'+
             ' (CELULAR, CEP, CIDADE, CODIGO, CODIGO_TIPO, DATA_CADASTRO, DATA_NASCIMENTO,'+
             '  DDD_FIXO, DDD_CELULAR, EMAIL, FILIAL_CADASTRO, FONE, NOME, PAIS, SEXO, UF)'+
             ' VALUES ('+
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ClientesCELULAR.AsString))+', '+ // CELULAR
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ClientesCEP.AsString))+', '+ // CEP
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ClientesCIDADE.AsString))+', '+ // CIDADE
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ClientesCODIGO.AsString))+', '+ // CODIGO
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ClientesCODIGO_TIPO.AsString))+', '; // CODIGO_TIPO

              // DATA_CADASTRO
             If Trim(DMBlueMetrics.SQLQ_ClientesDATA_CADASTRO.AsString)='' Then
              MySql:=
               MySql+'NULL, '
             Else
              MySql:=
               MySql+QuotedStr(f_Troca('/','.',f_Troca('-','.',Trim(DMBlueMetrics.SQLQ_ClientesDATA_CADASTRO.AsString))))+', ';

             // DATA_NASCIMENTO
             If Trim(DMBlueMetrics.SQLQ_ClientesDATA_NASCIMENTO.AsString)='' Then
              MySql:=
               MySql+'NULL, '
             Else
              MySql:=
               MySql+QuotedStr(f_Troca('/','.',f_Troca('-','.',Trim(DMBlueMetrics.SQLQ_ClientesDATA_NASCIMENTO.AsString))))+', ';

      MySql:=
       MySql+QuotedStr(Trim(DMBlueMetrics.SQLQ_ClientesDDD_FIXO.AsString))+', '+ // DDD_FIXO
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ClientesDDD_CELULAR.AsString))+', '+ // DDD_CELULAR
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ClientesEMAIL.AsString))+', '+ // EMAIL
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ClientesFILIAL_CADASTRO.AsString))+', '+ // FILIAL_CADASTRO
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ClientesFONE.AsString))+', '+ // FONE
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ClientesNOME.AsString))+', '+ // NOME
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ClientesPAIS.AsString))+', '+ // PAIS
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ClientesSEXO.AsString))+', '+ // SEXO
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ClientesUF.AsString))+')'; // UF
      DMBlueMetrics.ADOC.Execute(MySql);

      Lb_Reg.Caption:=IntToStr(StrToInt(Lb_Reg.Caption)+1);

      DMBlueMetrics.SQLQ_Clientes.Next;
    End; // While Not DMBlueMetrics.SQLQ_Clientes.Eof do

    DMBlueMetrics.ADOC.CommitTrans;
    Application.ProcessMessages;
    msg('Exportação: Clientes'+cr+cr+'Efetuada com SUCESSO !!','A');

  Except // Except da Transação
    on e : Exception do
    Begin
      DMBlueMetrics.ADOC.RollbackTrans;
      MessageBox(Handle, pChar('Tabela: '+Lb_Tabela.Caption+#13+#13+e.message), 'Erro', MB_ICONERROR);
    End;
  End; // Try da Transação

  DMBlueMetrics.SQLQ_Clientes.EnableControls;
  DMBlueMetrics.SQLQ_Clientes.Close;

  Screen.Cursor:=crDefault;

End; // Exporta Clientes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Exporta Empresas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBlueMetrics.Empresas;
Var
  MySql: String;
Begin
  Screen.Cursor:=crAppStart;

  DMBlueMetrics.ADOC.BeginTrans;
  Try // Try da Transação
    Lb_Tabela.Caption:='Empresas';
    Lb_Reg.Caption:='0';

    DMBlueMetrics.SQLQ_Empresas.Open;
    DMBlueMetrics.SQLQ_Empresas.DisableControls;
    While Not DMBlueMetrics.SQLQ_Empresas.Eof do
    Begin
      Application.ProcessMessages;

      MySql:=' INSERT INTO EMPRESAS'+
             ' (AREA_LOJA, ATIVA, BAIRRO, CANAL, CEP, CIDADE, CODIGO_FILIAL,'+
             '  COMPLEMENTO, DATA_ABERTURA, DATA_FECHAMENTO, DDD1, DDD2, EMAIL,'+
             '  ENDERECO, ESTADO, LATITUDE, LONGITUDE, NOME, NOME_REDUZIDO, NUMERO,'+
             '  PAIS, RAZAO_SOCIAL, REDE_LOJA, REGIAO, TELEFONE_1, TELEFONE_2, TIPO_LOJA)'+
             ' VALUES ('+
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasAREA_LOJA.AsString))+', '+ // AREA_LOJA
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasATIVA.AsString))+', '+ // ATIVA
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasBAIRRO.AsString))+', '+ // BAIRRO
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasCANAL.AsString))+', '+ // CANAL
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasCEP.AsString))+', '+ // CEP
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasCIDADE.AsString))+', '+ // CIDADE
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasCODIGO_FILIAL.AsString))+', '+ // CODIGO_FILIAL
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasCOMPLEMENTO.AsString))+', '; // COMPLEMENTO

             // DATA_ABERTURA
             If Trim(DMBlueMetrics.SQLQ_EmpresasDATA_ABERTURA.AsString)='' Then
              MySql:=
               MySql+'NULL, '
             Else
              MySql:=
               MySql+QuotedStr(f_Troca('/','.',f_Troca('-','.',Trim(DMBlueMetrics.SQLQ_EmpresasDATA_ABERTURA.AsString))))+', ';

             // DATA_FECHAMENTO
             If Trim(DMBlueMetrics.SQLQ_EmpresasDATA_FECHAMENTO.AsString)='' Then
              MySql:=
               MySql+'NULL, '
             Else
              MySql:=
               MySql+QuotedStr(f_Troca('/','.',f_Troca('-','.',Trim(DMBlueMetrics.SQLQ_EmpresasDATA_FECHAMENTO.AsString))))+', ';

      MySql:=
       MySql+QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasDDD1.AsString))+', '+ // DDD1
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasDDD2.AsString))+', '+ // DDD2
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasEMAIL.AsString))+', '+ // EMAIL
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasENDERECO.AsString))+', '+ // ENDERECO
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasESTADO.AsString))+', '+ // ESTADO
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasLATITUDE.AsString))+', '+ // LATITUDE
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasLONGITUDE.AsString))+', '+ // LONGITUDE
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasNOME.AsString))+', '+ // NOME
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasNOME_REDUZIDO.AsString))+', '+ // NOME_REDUZIDO
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasNUMERO.AsString))+', '+ // NUMERO
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasPAIS.AsString))+', '+ // PAIS
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasRAZAO_SOCIAL.AsString))+', '+ // RAZAO_SOCIAL
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasREDE_LOJA.AsString))+', '+ // REDE_LOJA
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasREGIAO.AsString))+', '+ // REGIAO
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasTELEFONE_1.AsString))+', '+ // TELEFONE_1
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasTELEFONE_2.AsString))+', '+ // TELEFONE_2
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasTIPO_LOJA.AsString))+')'; // IPO_LOJA
      DMBlueMetrics.ADOC.Execute(MySql);

      Lb_Reg.Caption:=IntToStr(StrToInt(Lb_Reg.Caption)+1);

      DMBlueMetrics.SQLQ_Empresas.Next;
    End; // While Not DMBlueMetrics.SQLQ_Empresas.Eof do

    DMBlueMetrics.ADOC.CommitTrans;
    Application.ProcessMessages;
    msg('Exportação: Empresas'+cr+cr+'Efetuada com SUCESSO !!','A');

  Except // Except da Transação
    on e : Exception do
    Begin
      DMBlueMetrics.ADOC.RollbackTrans;
      MessageBox(Handle, pChar('Tabela: '+Lb_Tabela.Caption+#13+#13+e.message), 'Erro', MB_ICONERROR);
    End;
  End; // Try da Transação

  DMBlueMetrics.SQLQ_Empresas.EnableControls;
  DMBlueMetrics.SQLQ_Empresas.Close;

  Screen.Cursor:=crDefault;

End; // Exporta Empresas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Exporta Fornecedores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBlueMetrics.Fornecedores;
Var
  MySql: String;
Begin
  Screen.Cursor:=crAppStart;

  DMBlueMetrics.ADOC.BeginTrans;
  Try // Try da Transação
    Lb_Tabela.Caption:='Fornecedores';
    Lb_Reg.Caption:='0';

    DMBlueMetrics.SQLQ_Fornecedores.Open;
    DMBlueMetrics.SQLQ_Fornecedores.DisableControls;
    While Not DMBlueMetrics.SQLQ_Fornecedores.Eof do
    Begin
      Application.ProcessMessages;

      MySql:=' INSERT INTO FORNECEDORES'+
             ' (CIDADE, CODIGO, DATA_CADASTRO, NOME, STATUS, UF)'+
             ' VALUES ('+
             QuotedStr(Trim(DMBlueMetrics.SQLQ_FornecedoresCIDADE.AsString))+', '+ // CIDADE
             QuotedStr(Trim(DMBlueMetrics.SQLQ_FornecedoresCODIGO.AsString))+', '; // CODIGO

             // DATA_CADASTRO
             If Trim(DMBlueMetrics.SQLQ_FornecedoresDATA_CADASTRO.AsString)='' Then
              MySql:=
               MySql+'NULL, '
             Else
              MySql:=
               MySql+QuotedStr(f_Troca('/','.',f_Troca('-','.',Trim(DMBlueMetrics.SQLQ_FornecedoresDATA_CADASTRO.AsString))))+', ';

      MySql:=
       MySql+QuotedStr(Trim(DMBlueMetrics.SQLQ_FornecedoresNOME.AsString))+', '+ // NOME
             QuotedStr(Trim(DMBlueMetrics.SQLQ_FornecedoresSTATUS.AsString))+', '+ // STATUS
             QuotedStr(Trim(DMBlueMetrics.SQLQ_FornecedoresUF.AsString))+')'; // UF
      DMBlueMetrics.ADOC.Execute(MySql);

      Lb_Reg.Caption:=IntToStr(StrToInt(Lb_Reg.Caption)+1);

      DMBlueMetrics.SQLQ_Fornecedores.Next;
    End; // While Not DMBlueMetrics.SQLQ_Fornecedores.Eof do

    DMBlueMetrics.ADOC.CommitTrans;
    Application.ProcessMessages;
    msg('Exportação: Fornecedores'+cr+cr+'Efetuada com SUCESSO !!','A');

  Except // Except da Transação
    on e : Exception do
    Begin
      DMBlueMetrics.ADOC.RollbackTrans;
      MessageBox(Handle, pChar('Tabela: '+Lb_Tabela.Caption+#13+#13+e.message), 'Erro', MB_ICONERROR);
    End;
  End; // Try da Transação

  DMBlueMetrics.SQLQ_Fornecedores.EnableControls;
  DMBlueMetrics.SQLQ_Fornecedores.Close;

  Screen.Cursor:=crDefault;

End; // Exporta Fornecedores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Exporta Produtos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBlueMetrics.Produtos;
Var
  MySql: String;
Begin
  Screen.Cursor:=crAppStart;

  DMBlueMetrics.ADOC.BeginTrans;
  Try // Try da Transação
    Lb_Tabela.Caption:='Produtos';
    Lb_Reg.Caption:='0';

    DMBlueMetrics.SQLQ_Produtos.Open;
    DMBlueMetrics.SQLQ_Produtos.DisableControls;
    While Not DMBlueMetrics.SQLQ_Produtos.Eof do
    Begin
      Application.ProcessMessages;

      MySql:=' INSERT INTO PRODUTOS'+
             ' (CODIGO, COLECAO, FORNECEDOR, GRADE, GRIFE, GRUPO, LINHA, MARCA,'+
             '  NOME, SEXO, SUBGRUPO, ULTIMO_CUSTO, URL_IMAGEM)'+
             ' VALUES ('+
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ProdutosCODIGO.AsString))+', '+ // CODIGO
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ProdutosCOLECAO.AsString))+', '+ // COLECAO
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ProdutosFORNECEDOR.AsString))+', '+ // FORNECEDOR
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ProdutosGRADE.AsString))+', '+ // GRADE
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ProdutosGRIFE.AsString))+', '+ // GRIFE
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ProdutosGRUPO.AsString))+', '+ // GRUPO
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ProdutosLINHA.AsString))+', '+ // LINHA
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ProdutosMARCA.AsString))+', '+ // MARCA
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ProdutosNOME.AsString))+', '+ // NOME
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ProdutosSEXO.AsString))+', '+ // SEXO
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ProdutosSUBGRUPO.AsString))+', '+ // SUBGRUPO
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ProdutosULTIMO_CUSTO.AsString))+', '+ // ULTIMO_CUSTO
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ProdutosURL_IMAGEM.AsString))+')'; //URL_IMAGEM
      DMBlueMetrics.ADOC.Execute(MySql);

      Lb_Reg.Caption:=IntToStr(StrToInt(Lb_Reg.Caption)+1);

      DMBlueMetrics.SQLQ_Produtos.Next;
    End; // While Not DMBlueMetrics.SQLQ_Produtos.Eof do

    DMBlueMetrics.ADOC.CommitTrans;
    Application.ProcessMessages;
    msg('Exportação: Produtos'+cr+cr+'Efetuada com SUCESSO !!','A');

  Except // Except da Transação
    on e : Exception do
    Begin
      DMBlueMetrics.ADOC.RollbackTrans;
      MessageBox(Handle, pChar('Tabela: '+Lb_Tabela.Caption+#13+#13+e.message), 'Erro', MB_ICONERROR);
    End;
  End; // Try da Transação

  DMBlueMetrics.SQLQ_Produtos.EnableControls;
  DMBlueMetrics.SQLQ_Produtos.Close;

  Screen.Cursor:=crDefault;

End; // Exporta Produtos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Exporta Vendedores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBlueMetrics.Vendedores;
Var
  MySql: String;
Begin
  Screen.Cursor:=crAppStart;

  DMBlueMetrics.ADOC.BeginTrans;
  Try // Try da Transação
    Lb_Tabela.Caption:='Vendedores';
    Lb_Reg.Caption:='0';

    DMBlueMetrics.SQLQ_Vendedores.Open;
    DMBlueMetrics.SQLQ_Vendedores.DisableControls;
    While Not DMBlueMetrics.SQLQ_Vendedores.Eof do
    Begin
      Application.ProcessMessages;

      MySql:=' INSERT INTO VENDEDORES'+
             ' (CIDADE, CODIGO, CODIGO_EMPRESA, DATA_CADASTRO, NOME, STATUS, UF)'+
             ' VALUES ('+
             QuotedStr(Trim(DMBlueMetrics.SQLQ_VendedoresCIDADE.AsString))+', '+ // CIDADE
             QuotedStr(Trim(DMBlueMetrics.SQLQ_VendedoresCODIGO.AsString))+', '+ // CODIGO
             QuotedStr(Trim(DMBlueMetrics.SQLQ_VendedoresCODIGO_EMPRESA.AsString))+', '; // CODIGO_EMPRESA

             // DATA_CADASTRO
             If Trim(DMBlueMetrics.SQLQ_VendedoresDATA_CADASTRO.AsString)='' Then
              MySql:=
               MySql+'NULL, '
             Else
              MySql:=
               MySql+QuotedStr(f_Troca('/','.',f_Troca('-','.',Trim(DMBlueMetrics.SQLQ_VendedoresDATA_CADASTRO.AsString))))+', ';

      MySql:=
       MySql+QuotedStr(Trim(DMBlueMetrics.SQLQ_VendedoresNOME.AsString))+', '+ // NOME
             QuotedStr(Trim(DMBlueMetrics.SQLQ_VendedoresSTATUS.AsString))+', '+ // STATUS
             QuotedStr(Trim(DMBlueMetrics.SQLQ_VendedoresUF.AsString))+')'; // UF
      DMBlueMetrics.ADOC.Execute(MySql);

      Lb_Reg.Caption:=IntToStr(StrToInt(Lb_Reg.Caption)+1);

      DMBlueMetrics.SQLQ_Vendedores.Next;
    End; // While Not DMBlueMetrics.SQLQ_Vendedores.Eof do

    DMBlueMetrics.ADOC.CommitTrans;
    Application.ProcessMessages;
    msg('Exportação: Vendedores'+cr+cr+'Efetuada com SUCESSO !!','A');

  Except // Except da Transação
    on e : Exception do
    Begin
      DMBlueMetrics.ADOC.RollbackTrans;
      MessageBox(Handle, pChar('Tabela: '+Lb_Tabela.Caption+#13+#13+e.message), 'Erro', MB_ICONERROR);
    End;
  End; // Try da Transação

  DMBlueMetrics.SQLQ_Vendedores.EnableControls;
  DMBlueMetrics.SQLQ_Vendedores.Close;

  Screen.Cursor:=crDefault;

End; // Exporta Vendedores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Exporta Estoques >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBlueMetrics.Estoques;
Var
  MySql: String;

  sDtaPrimEnt, sDtaUltEnt,
  sDtaPrimVen, sDtaUltVen: String;
Begin
  Screen.Cursor:=crAppStart;

  DMBlueMetrics.ADOC.BeginTrans;
  Try // Try da Transação
    Lb_Tabela.Caption:='Estoques';
    Lb_Reg.Caption:='0';

    DMBlueMetrics.SQLQ_Estoques.Open;
    DMBlueMetrics.SQLQ_Estoques.DisableControls;
    While Not DMBlueMetrics.SQLQ_Estoques.Eof do
    Begin
      Application.ProcessMessages;

      // Busca Movimentos de Entrada e Saida ===================================
      sDtaPrimEnt:='';
      sDtaUltEnt :='';
      sDtaPrimVen:='';
      sDtaUltVen :='';

      // Monta SQL para Busca Movimentos de Entrada ================================
      MySql:=' SELECT MIN(me.data_lancamento) Primeira,'+
             '        MAX(me.data_lancamento) Ultima'+
             ' FROM LINXMOVIMENTO me'+
             ' WHERE me.operacao=''E'''+
             ' AND   ((COALESCE(me.tipo_transacao,'''')='''') OR (me.tipo_transacao=''E''))'+ // Entradas de Mercadorias
             ' AND   me.cancelado=''N'''+
             ' AND   me.excluido=''N'''+
             ' AND   me.cod_produto='+DMBlueMetrics.SQLQ_EstoquesCODIGO_PRODUTO.AsString+
             ' AND   me.empresa='+DMBlueMetrics.SQLQ_EstoquesCODIGO_EMPRESA.AsString;
      DMBlueMetrics.SQLQ_Busca.Close;
      DMBlueMetrics.SQLQ_Busca.SQL.Clear;
      DMBlueMetrics.SQLQ_Busca.SQL.Add(MySql);
      DMBlueMetrics.SQLQ_Busca.Open;

      If Trim(DMBlueMetrics.SQLQ_Busca.FieldByName('Primeira').AsString)<>'' Then
       sDtaPrimEnt:=f_Troca('/','.',f_Troca('-','.',DateTimeToStr(
                            DMBlueMetrics.SQLQ_Busca.FieldByName('Primeira').AsDateTime)));

      If Trim(DMBlueMetrics.SQLQ_Busca.FieldByName('Ultima').AsString)<>'' Then
       sDtaUltEnt:=f_Troca('/','.',f_Troca('-','.',DateTimeToStr(
                           DMBlueMetrics.SQLQ_Busca.FieldByName('Ultima').AsDateTime)));

      // Monta SQL para Busca Movimentos de Saida ==================================
      MySql:=' SELECT MIN(mv.data_lancamento) Primeira,'+
             '        MAX(mv.data_lancamento) Ultima'+
             ' FROM LINXMOVIMENTO mv'+
             ' WHERE mv.operacao=''S'''+
             ' AND (((mv.tipo_transacao=''V'') OR (COALESCE(mv.tipo_transacao,'''')='''')))'+ // Vendas
             ' AND   mv.cancelado=''N'''+
             ' AND   mv.excluido=''N'''+
             ' AND   mv.cod_produto='+DMBlueMetrics.SQLQ_EstoquesCODIGO_PRODUTO.AsString+
             ' AND   mv.empresa='+DMBlueMetrics.SQLQ_EstoquesCODIGO_EMPRESA.AsString;
      DMBlueMetrics.SQLQ_Busca.Close;
      DMBlueMetrics.SQLQ_Busca.SQL.Clear;
      DMBlueMetrics.SQLQ_Busca.SQL.Add(MySql);
      DMBlueMetrics.SQLQ_Busca.Open;

      If Trim(DMBlueMetrics.SQLQ_Busca.FieldByName('Primeira').AsString)<>'' Then
       sDtaPrimVen:=f_Troca('/','.',f_Troca('-','.',DateTimeToStr(
                            DMBlueMetrics.SQLQ_Busca.FieldByName('Primeira').AsDateTime)));

      If Trim(DMBlueMetrics.SQLQ_Busca.FieldByName('Ultima').AsString)<>'' Then
       sDtaUltVen:=f_Troca('/','.',f_Troca('-','.',DateTimeToStr(
                           DMBlueMetrics.SQLQ_Busca.FieldByName('Ultima').AsDateTime)));

      DMBlueMetrics.SQLQ_Busca.Close;

      // Insere ================================================================
      MySql:=' INSERT INTO ESTOQUES'+
             ' (CODIGO_EMPRESA, CODIGO_PRODUTO, DATA_PRIMEIRA_ENTRADA,'+
             '  DATA_ULTIMA_ENTRADA, DATA_ULTIMA_SAIDA, QUANTIDADE, ULTIMO_CUSTO)'+
             ' VALUES ('+
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EstoquesCODIGO_EMPRESA.AsString))+', '+ // CODIGO_EMPRESA
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EstoquesCODIGO_PRODUTO.AsString))+', '; // CODIGO_PRODUTO

             // DATA_PRIMEIRA_ENTRADA
             If Trim(sDtaPrimEnt)='' Then
              MySql:=
               MySql+'NULL, '
             Else
              MySql:=
               MySql+QuotedStr(sDtaPrimEnt)+', ';

             // DATA_ULTIMA_ENTRADA
             If Trim(sDtaUltEnt)='' Then
              MySql:=
               MySql+'NULL, '
             Else
              MySql:=
               MySql+QuotedStr(sDtaUltEnt)+', ';

             // DATA_ULTIMA_SAIDA
             If Trim(sDtaPrimVen)='' Then
              MySql:=
               MySql+'NULL, '
             Else
              MySql:=
               MySql+QuotedStr(sDtaPrimVen)+', ';
      MySql:=
       MySql+QuotedStr(Trim(DMBlueMetrics.SQLQ_EstoquesQUANTIDADE.AsString))+', '+ // QUANTIDADE
             f_Troca(',','.',Trim(DMBlueMetrics.SQLQ_EstoquesULTIMO_CUSTO.AsString))+')'; // ULTIMO_CUSTO
      DMBlueMetrics.ADOC.Execute(MySql);

      Lb_Reg.Caption:=IntToStr(StrToInt(Lb_Reg.Caption)+1);

      DMBlueMetrics.SQLQ_Estoques.Next;

      if StrToInt(Lb_Reg.Caption) mod 3000 = 0 Then
      Begin
        DMBlueMetrics.ADOC.CommitTrans;
        DMBlueMetrics.ADOC.BeginTrans;
      End; // If iCodLoja<>DMBlueMetrics.SQLQ_EstoquesCODIGO_EMPRESA.AsInteger Then
    End; // While Not DMBlueMetrics.SQLQ_Estoques.Eof do

    DMBlueMetrics.ADOC.CommitTrans;
    Application.ProcessMessages;
    msg('Exportação: Estoques'+cr+cr+'Efetuada com SUCESSO !!','A');

  Except // Except da Transação
    on e : Exception do
    Begin
      DMBlueMetrics.ADOC.RollbackTrans;
      MessageBox(Handle, pChar('Tabela: '+Lb_Tabela.Caption+#13+#13+e.message), 'Erro', MB_ICONERROR);
    End;
  End; // Try da Transação

  DMBlueMetrics.SQLQ_Estoques.EnableControls;
  DMBlueMetrics.SQLQ_Estoques.Close;

  Screen.Cursor:=crDefault;

End; // Exporta Estoques >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmBlueMetrics.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Bloquei Ctrl + Delete =====================================================
  If ((Shift = [ssCtrl]) And (key = vk_delete)) Then
   Abort;

end;

procedure TFrmBlueMetrics.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmBlueMetrics.Bt_ExportaDadosClick(Sender: TObject);
Var
  bUmVez: Boolean; // Se Rodou Uma Vez
begin

  DBGrid1.Setfocus;
  
  If (Trim(DtEdt_DataInicio.Text)<>'') Or (Trim(DtEdt_DataFim.Text)<>'') Then
   Begin
     Try
       StrToDate(DtEdt_DataInicio.Text);
     Except
       msg('Data Inicial do Período Inválida !!','A');
       DtEdt_DataInicio.SetFocus;
       Exit;
     End;

     Try
       StrToDate(DtEdt_DataFim.Text);
     Except
       msg('Data Final do Período Inválida !!','A');
       DtEdt_DataFim.SetFocus;
       Exit;
     End;

     If DtEdt_DataFim.Date<DtEdt_DataInicio.Date Then
     Begin
       msg('Período Inválido !!','A');
       DtEdt_DataInicio.SetFocus;
       Exit;
     End;
   End
  Else // If (Trim(DtEdt_DataInicio.Text)<>'') Or (Trim(DtEdt_DataFim.Text)='') Then
   Begin
     msg('Período Inválido !!','A');
     DtEdt_DataInicio.SetFocus;
     Exit;
   End; // If (Trim(DtEdt_DataInicio.Text)<>'') Or (Trim(DtEdt_DataFim.Text)='') Then

  If msg('O Período Informado de '+cr+DtEdt_DataInicio.Text+' a '+DtEdt_DataFim.Text+cr+cr+'Esta CORRETO ??','C')=2 Then
   Exit;

  sgDtaInicio:=f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DataInicio.Date)));
  sgDtaFim   :=f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DataFim.Date)));

  bUmVez:=False;
  DMBlueMetrics.CDS_Lojas.First;
  While Not DMBlueMetrics.CDS_Lojas.Eof do
  Begin

    If Not bUmVez Then
    Begin
      // Clientes - 01
      If Ckb_Clientes.Checked Then
       Clientes;

      // Empresas - 02
      If Ckb_Empresas.Checked Then
       Empresas;

      // Fornecedores - 04
      If Ckb_Fornecedores.Checked Then
       Fornecedores;

      // Produtos - 07
      If Ckb_Produtos.Checked Then
       Produtos;

      // Vendedores - 11
      If Ckb_Vendedores.Checked Then
       Vendedores;

      // Estoques - 03
      If Ckb_Estoques.Checked Then
       Estoques;
    End; // If bUmVez Then

    // Vendas - 09 e 10
//    If Ckb_Vendas.Checked Then

    // Itens Vendas - 05
//    If Ckb_ItensVendas.Checked Then

    // Itens Trocas - 08
//    If Ckb_ItensTrocas.Checked Then

    // Pagamentos - 06
//    If Ckb_Pagamentos.Checked Then

    bUmVez:=True;
    DMBlueMetrics.CDS_Lojas.Next;
  End; // While Not DMBlueMetrics.CDS_Lojas.Eof do
  DMBlueMetrics.CDS_Lojas.First;

  msg('FIM','A');
end;

end.

