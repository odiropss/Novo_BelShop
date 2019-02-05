unit UBlueMetrics;

// ITENS_VENDA - CUSTO_VENDA_ITENS
// PRODUTOS - SUBGRUPO=LINHA
// ITENS_TROCAS - CUSTO_TROCA_ITENS = 0,00
// VENDAS - CUSTO_VENDA_TOTAL
//        - CUSTO_TROCA_TOTAL
//        - QTDE_TROCA_TOTAL = 0,00
//        - QTDE_VENDA_LIQUIDA_TOTAL
//        - VALOR_VENDA_BRUTA_TOTAL
//        - VALOR_VENDA_LIQUIDA_TOTAL
//        - 0 VALOR_TROCA_TOTAL= 0,00
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
    Procedure Clientes;     // Deleta Tutdo
    Procedure Empresas;     // Deleta Tutdo
    Procedure Fornecedores; // Deleta Tutdo
    Procedure Produtos;     // Deleta Tutdo
    Procedure Vendedores;   // Deleta Tutdo

    Procedure Estoques;     // Deleta Tutdo
    Procedure EstoquesEntradas;
    Procedure EstoquesVendas;

    Procedure Vendas;       // Deleta Por Periodo
    Procedure VendasTrocas;

    Procedure ItensVendas;  // Deleta Por Periodo
    Procedure ItensTrocas;  // Deleta Por Periodo

    Procedure Pagamentos;
    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    procedure Ckb_ClientesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);   // Deleta Por Periodo

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

  tgMySqlErro: TStringList; // Arquivo de Processamento e Erros

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

    // Deleta Clientes
    MySql:=' DELETE FROM CLIENTES';
    DMBlueMetrics.ADOC.Execute(MySql);

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
               MySql+QuotedStr(Trim(DMBlueMetrics.SQLQ_ClientesDATA_CADASTRO.AsString))+', ';

             // DATA_NASCIMENTO
             If Trim(DMBlueMetrics.SQLQ_ClientesDATA_NASCIMENTO.AsString)='' Then
              MySql:=
               MySql+'NULL, '
             Else
              MySql:=
               MySql+QuotedStr(Trim(DMBlueMetrics.SQLQ_ClientesDATA_NASCIMENTO.AsString))+', ';

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

    Ckb_Clientes.Font.Color:=clWindowText;

  Except // Except da Transação
    on e : Exception do
    Begin
      DMBlueMetrics.ADOC.RollbackTrans;
      MessageBox(Handle, pChar('Tabela: '+Lb_Tabela.Caption+#13+#13+e.message), 'Erro', MB_ICONERROR);

      tgMySqlErro.Add('Tabela: '+Lb_Tabela.Caption);
      tgMySqlErro.Add('ERROR: '+e.message);
      tgMySqlErro.Add(MySql);
      tgMySqlErro.Add('==================================');
      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_BlueMetrics_Erros.txt');
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

    // Deleta Clientes
    MySql:=' DELETE FROM EMPRESAS';
    DMBlueMetrics.ADOC.Execute(MySql);

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
               MySql+QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasDATA_ABERTURA.AsString))+', ';

             // DATA_FECHAMENTO
             If Trim(DMBlueMetrics.SQLQ_EmpresasDATA_FECHAMENTO.AsString)='' Then
              MySql:=
               MySql+'NULL, '
             Else
              MySql:=
               MySql+QuotedStr(Trim(DMBlueMetrics.SQLQ_EmpresasDATA_FECHAMENTO.AsString))+', ';

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

    Ckb_Empresas.Font.Color:=clWindowText;

  Except // Except da Transação
    on e : Exception do
    Begin
      DMBlueMetrics.ADOC.RollbackTrans;
      MessageBox(Handle, pChar('Tabela: '+Lb_Tabela.Caption+#13+#13+e.message), 'Erro', MB_ICONERROR);

      tgMySqlErro.Add('Tabela: '+Lb_Tabela.Caption);
      tgMySqlErro.Add('ERROR: '+e.message);
      tgMySqlErro.Add(MySql);
      tgMySqlErro.Add('==================================');
      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_BlueMetrics_Erros.txt');
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

    MySql:=' DELETE FROM FORNECEDORES';
    DMBlueMetrics.ADOC.Execute(MySql);

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
               MySql+QuotedStr(Trim(DMBlueMetrics.SQLQ_FornecedoresDATA_CADASTRO.AsString))+', ';

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

    Ckb_Fornecedores.Font.Color:=clWindowText;

  Except // Except da Transação
    on e : Exception do
    Begin
      DMBlueMetrics.ADOC.RollbackTrans;
      MessageBox(Handle, pChar('Tabela: '+Lb_Tabela.Caption+#13+#13+e.message), 'Erro', MB_ICONERROR);

      tgMySqlErro.Add('Tabela: '+Lb_Tabela.Caption);
      tgMySqlErro.Add('ERROR: '+e.message);
      tgMySqlErro.Add(MySql);
      tgMySqlErro.Add('==================================');
      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_BlueMetrics_Erros.txt');
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

    MySql:=' DELETE FROM PRODUTOS';
    DMBlueMetrics.ADOC.Execute(MySql);

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
             f_Troca(',','.',Trim(DMBlueMetrics.SQLQ_ProdutosULTIMO_CUSTO.AsString))+', '+ // ULTIMO_CUSTO
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ProdutosURL_IMAGEM.AsString))+')'; //URL_IMAGEM
      DMBlueMetrics.ADOC.Execute(MySql);

      Lb_Reg.Caption:=IntToStr(StrToInt(Lb_Reg.Caption)+1);

      DMBlueMetrics.SQLQ_Produtos.Next;
    End; // While Not DMBlueMetrics.SQLQ_Produtos.Eof do

    DMBlueMetrics.ADOC.CommitTrans;
    Application.ProcessMessages;

    Ckb_Produtos.Font.Color:=clWindowText;

  Except // Except da Transação
    on e : Exception do
    Begin
      DMBlueMetrics.ADOC.RollbackTrans;
      MessageBox(Handle, pChar('Tabela: '+Lb_Tabela.Caption+#13+#13+e.message), 'Erro', MB_ICONERROR);

      tgMySqlErro.Add('Tabela: '+Lb_Tabela.Caption);
      tgMySqlErro.Add('ERROR: '+e.message);
      tgMySqlErro.Add(MySql);
      tgMySqlErro.Add('==================================');
      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_BlueMetrics_Erros.txt');
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

    MySql:=' DELETE FROM VENDEDORES';
    DMBlueMetrics.ADOC.Execute(MySql);

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
               MySql+QuotedStr(Trim(DMBlueMetrics.SQLQ_VendedoresDATA_CADASTRO.AsString))+', ';

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

    Ckb_Vendedores.Font.Color:=clWindowText;

  Except // Except da Transação
    on e : Exception do
    Begin
      DMBlueMetrics.ADOC.RollbackTrans;
      MessageBox(Handle, pChar('Tabela: '+Lb_Tabela.Caption+#13+#13+e.message), 'Erro', MB_ICONERROR);

      tgMySqlErro.Add('Tabela: '+Lb_Tabela.Caption);
      tgMySqlErro.Add('ERROR: '+e.message);
      tgMySqlErro.Add(MySql);
      tgMySqlErro.Add('==================================');
      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_BlueMetrics_Erros.txt');
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
Begin
  Screen.Cursor:=crAppStart;

  DMBlueMetrics.ADOC.BeginTrans;
  Try // Try da Transação
    Lb_Tabela.Caption:='Estoques';
    Lb_Reg.Caption:='0';

    MySql:=' DELETE FROM ESTOQUES';
    DMBlueMetrics.ADOC.Execute(MySql);

    DMBlueMetrics.SQLQ_Estoques.Open;
    DMBlueMetrics.SQLQ_Estoques.DisableControls;
    While Not DMBlueMetrics.SQLQ_Estoques.Eof do
    Begin
      Application.ProcessMessages;

      // Insere ================================================================
      MySql:=' INSERT INTO ESTOQUES'+
             ' (CODIGO_EMPRESA, CODIGO_PRODUTO, DATA_PRIMEIRA_ENTRADA,'+
             '  DATA_ULTIMA_ENTRADA, DATA_ULTIMA_SAIDA, QUANTIDADE, ULTIMO_CUSTO)'+
             ' VALUES ('+
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EstoquesCODIGO_EMPRESA.AsString))+', '+ // CODIGO_EMPRESA
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EstoquesCODIGO_PRODUTO.AsString))+', '+ // CODIGO_PRODUTO
             'NULL, '+ // DATA_PRIMEIRA_ENTRADA
             'NULL, '+ // DATA_ULTIMA_ENTRADA
             'NULL, '+ // DATA_ULTIMA_SAIDA
             QuotedStr(Trim(DMBlueMetrics.SQLQ_EstoquesQUANTIDADE.AsString))+', '+ // QUANTIDADE
             f_Troca(',','.',Trim(DMBlueMetrics.SQLQ_EstoquesULTIMO_CUSTO.AsString))+')'; // ULTIMO_CUSTO
      DMBlueMetrics.ADOC.Execute(MySql);

      Lb_Reg.Caption:=IntToStr(StrToInt(Lb_Reg.Caption)+1);

      DMBlueMetrics.SQLQ_Estoques.Next;

      if StrToInt(Lb_Reg.Caption) mod 3000 = 0 Then
      Begin
        DMBlueMetrics.ADOC.CommitTrans;
        DMBlueMetrics.ADOC.BeginTrans;
      End; // if StrToInt(Lb_Reg.Caption) mod 3000 = 0 Then
    End; // While Not DMBlueMetrics.SQLQ_Estoques.Eof do

    DMBlueMetrics.ADOC.CommitTrans;
    Application.ProcessMessages;

  Except // Except da Transação
    on e : Exception do
    Begin
      DMBlueMetrics.ADOC.RollbackTrans;

      DMBlueMetrics.SQLQ_Estoques.EnableControls;
      DMBlueMetrics.SQLQ_Estoques.Close;

      MessageBox(Handle, pChar('Tabela: '+Lb_Tabela.Caption+#13+#13+e.message), 'Erro', MB_ICONERROR);

      tgMySqlErro.Add('Tabela: '+Lb_Tabela.Caption);
      tgMySqlErro.Add('ERROR: '+e.message);
      tgMySqlErro.Add(MySql);
      tgMySqlErro.Add('==================================');
      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_BlueMetrics_Erros.txt');
      Exit;
    End;
  End; // Try da Transação
  DMBlueMetrics.SQLQ_Estoques.EnableControls;
  DMBlueMetrics.SQLQ_Estoques.Close;

  // Atualiza Datas de Entradas ================================================
  EstoquesEntradas;

  // Atualiza Datas de Vendas ==================================================
  EstoquesVendas;

  Ckb_Estoques.Font.Color:=clWindowText;

  Screen.Cursor:=crDefault;

End; // Exporta Estoques >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Exporta EstoquesEntradas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBlueMetrics.EstoquesEntradas;
Var
  MySql: String;

  sDtaPrimEnt, sDtaUltEnt: String;
Begin
  Screen.Cursor:=crAppStart;

  DMBlueMetrics.ADOC.BeginTrans;
  Try // Try da Transação
    Lb_Tabela.Caption:='EstoquesEntradas';
    Lb_Reg.Caption:='0';

    DMBlueMetrics.SQLQ_EstoquesEntradas.Open;
    DMBlueMetrics.SQLQ_EstoquesEntradas.DisableControls;
    While Not DMBlueMetrics.SQLQ_EstoquesEntradas.Eof do
    Begin
      Application.ProcessMessages;

      If Trim(DMBlueMetrics.SQLQ_EstoquesEntradasPRIMERIA.AsString)<>'' Then
       sDtaPrimEnt:=DateTimeToStr(DMBlueMetrics.SQLQ_EstoquesEntradasPRIMERIA.AsDateTime);

      If Trim(DMBlueMetrics.SQLQ_EstoquesEntradasULTIMA.AsString)<>'' Then
       sDtaUltEnt:=DateTimeToStr(DMBlueMetrics.SQLQ_EstoquesEntradasULTIMA.AsDateTime);

      // Atualiza Datas ========================================================
      If (Trim(sDtaPrimEnt)<>'') Or (Trim(sDtaUltEnt)<>'') Then
      Begin
        MySql:=' UPDATE ESTOQUES';

               // DATA_PRIMEIRA_ENTRADA
               If Trim(sDtaPrimEnt)='' Then
                MySql:=
                 MySql+' SET data_primeira_entrada=NULL'
               Else
                MySql:=
                 MySql+' SET data_primeira_entrada='+QuotedStr(sDtaPrimEnt);

               // DATA_ULTIMA_ENTRADA
               If Trim(sDtaUltEnt)='' Then
                MySql:=
                 MySql+', data_ultima_entrada=NULL'
               Else
                MySql:=
                 MySql+', data_ultima_entrada='+QuotedStr(sDtaUltEnt);

        MySql:=
         MySql+' WHERE codigo_empresa='+QuotedStr(DMBlueMetrics.SQLQ_EstoquesEntradasEMPRESA.AsString)+
               ' AND   codigo_produto='+QuotedStr(DMBlueMetrics.SQLQ_EstoquesEntradasCOD_PRODUTO.AsString);
        DMBlueMetrics.ADOC.Execute(MySql);
      End; // If (Trim(sDtaPrimEnt)<>'') Or (Trim(sDtaUltEnt)<>'') Then
      Lb_Reg.Caption:=IntToStr(StrToInt(Lb_Reg.Caption)+1);

      DMBlueMetrics.SQLQ_EstoquesEntradas.Next;

      if StrToInt(Lb_Reg.Caption) mod 3000 = 0 Then
      Begin
        DMBlueMetrics.ADOC.CommitTrans;
        DMBlueMetrics.ADOC.BeginTrans;
      End; // if StrToInt(Lb_Reg.Caption) mod 3000 = 0 Then
    End; // While Not DMBlueMetrics.SQLQ_EstoquesEntradas.Eof do

    DMBlueMetrics.ADOC.CommitTrans;
    Application.ProcessMessages;

  Except // Except da Transação
    on e : Exception do
    Begin
      DMBlueMetrics.ADOC.RollbackTrans;
      MessageBox(Handle, pChar('Tabela: '+Lb_Tabela.Caption+#13+#13+e.message), 'Erro', MB_ICONERROR);

      tgMySqlErro.Add('Tabela: '+Lb_Tabela.Caption);
      tgMySqlErro.Add('ERROR: '+e.message);
      tgMySqlErro.Add(MySql);
      tgMySqlErro.Add('==================================');
      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_BlueMetrics_Erros.txt');
    End;
  End; // Try da Transação

  DMBlueMetrics.SQLQ_EstoquesEntradas.EnableControls;
  DMBlueMetrics.SQLQ_EstoquesEntradas.Close;

  Screen.Cursor:=crDefault;

End; // Exporta EstoquesEntradas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Exporta EstoquesVendas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBlueMetrics.EstoquesVendas;
Var
  MySql: String;

  sDtaPrimVen, sDtaUltVen: String;
Begin
  Screen.Cursor:=crAppStart;

  DMBlueMetrics.ADOC.BeginTrans;
  Try // Try da Transação
    Lb_Tabela.Caption:='EstoquesVendas';
    Lb_Reg.Caption:='0';

    DMBlueMetrics.SQLQ_EstoquesVendas.Open;
    DMBlueMetrics.SQLQ_EstoquesVendas.DisableControls;
    While Not DMBlueMetrics.SQLQ_EstoquesVendas.Eof do
    Begin
      Application.ProcessMessages;

      If Trim(DMBlueMetrics.SQLQ_EstoquesVendasPRIMERIA.AsString)<>'' Then
       sDtaPrimVen:=DateTimeToStr(DMBlueMetrics.SQLQ_EstoquesVendasPRIMERIA.AsDateTime);

      If Trim(DMBlueMetrics.SQLQ_EstoquesVendasULTIMA.AsString)<>'' Then
       sDtaUltVen:=DateTimeToStr(DMBlueMetrics.SQLQ_EstoquesVendasULTIMA.AsDateTime);

      // Atualiza Datas ========================================================
      If (Trim(sDtaPrimVen)<>'') Or (Trim(sDtaUltVen)<>'') Then
      Begin
        MySql:=' UPDATE ESTOQUES';

               // DATA_ULTIMA_SAIDA
               If Trim(sDtaUltVen)='' Then
                MySql:=
                 MySql+' SET data_ultima_saida=NULL'
               Else
                MySql:=
                 MySql+' SET data_ultima_saida='+QuotedStr(sDtaUltVen);

        MySql:=
         MySql+' WHERE codigo_empresa='+QuotedStr(DMBlueMetrics.SQLQ_EstoquesVendasEMPRESA.AsString)+
               ' AND   codigo_produto='+QuotedStr(DMBlueMetrics.SQLQ_EstoquesVendasCOD_PRODUTO.AsString);
        DMBlueMetrics.ADOC.Execute(MySql);
      End; // If (Trim(sDtaPrimVen)<>'') Or (Trim(sDtaUltVen)<>'') Then
      Lb_Reg.Caption:=IntToStr(StrToInt(Lb_Reg.Caption)+1);

      DMBlueMetrics.SQLQ_EstoquesVendas.Next;

      if StrToInt(Lb_Reg.Caption) mod 3000 = 0 Then
      Begin
        DMBlueMetrics.ADOC.CommitTrans;
        DMBlueMetrics.ADOC.BeginTrans;
      End; // if StrToInt(Lb_Reg.Caption) mod 3000 = 0 Then
    End; // While Not DMBlueMetrics.SQLQ_EstoquesVendas.Eof do

    DMBlueMetrics.ADOC.CommitTrans;
    Application.ProcessMessages;

  Except // Except da Transação
    on e : Exception do
    Begin
      DMBlueMetrics.ADOC.RollbackTrans;
      MessageBox(Handle, pChar('Tabela: '+Lb_Tabela.Caption+#13+#13+e.message), 'Erro', MB_ICONERROR);

      tgMySqlErro.Add('Tabela: '+Lb_Tabela.Caption);
      tgMySqlErro.Add('ERROR: '+e.message);
      tgMySqlErro.Add(MySql);
      tgMySqlErro.Add('==================================');
      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_BlueMetrics_Erros.txt');
    End;
  End; // Try da Transação

  DMBlueMetrics.SQLQ_EstoquesVendas.EnableControls;
  DMBlueMetrics.SQLQ_EstoquesVendas.Close;

  Screen.Cursor:=crDefault;

End; // Exporta EstoquesVendas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Exporta Vendas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBlueMetrics.Vendas;
Var
  MySql: String;
Begin

  Screen.Cursor:=crAppStart;

  DMBlueMetrics.ADOC.BeginTrans;
  Try // Try da Transação
    Lb_Tabela.Caption:='Vendas';
    Lb_Reg.Caption:='0';

    MySql:=' DELETE FROM VENDAS'+
           ' WHERE DATA_VENDA BETWEEN '+QuotedStr(DateToStr(DtEdt_DataInicio.Date))+' AND '+
                                        QuotedStr(DateToStr(DtEdt_DataFim.Date));
    DMBlueMetrics.ADOC.Execute(MySql);

    DMBlueMetrics.SQLQ_Vendas.Params.ParamByName('DtaI').AsDate:=DtEdt_DataInicio.Date;
    DMBlueMetrics.SQLQ_Vendas.Params.ParamByName('DtaF').AsDate:=DtEdt_DataFim.Date;
    DMBlueMetrics.SQLQ_Vendas.Open;
    DMBlueMetrics.SQLQ_Vendas.DisableControls;
    While Not DMBlueMetrics.SQLQ_Vendas.Eof do
    Begin
      Application.ProcessMessages;

      // Insere ================================================================
      MySql:=' INSERT INTO VENDAS'+
             ' (CODIGO_EMPRESA, CODIGO_VENDA, CODIGO_CLIENTE, CODIGO_VENDEDOR,'+
             '  CUSTO_VENDA_TOTAL, CUSTO_TROCA_TOTAL, DATA_VENDA, DESCONTO_TOTAL,'+
             '  FRETE, QTDE_TROCA_TOTAL, QTDE_VENDA_BRUTA_TOTAL, QTDE_VENDA_LIQUIDA_TOTAL,'+
             '  SERIE, VALOR_VENDA_BRUTA_TOTAL, VALOR_VENDA_LIQUIDA_TOTAL, VALOR_TROCA_TOTAL)'+
             ' VALUES ('+
             QuotedStr(Trim(DMBlueMetrics.SQLQ_VendasCODIGO_EMPRESA.AsString))+', '+ // CODIGO_EMPRESA
             QuotedStr(Trim(DMBlueMetrics.SQLQ_VendasCODIGO_VENDA.AsString))+', '+ // CODIGO_VENDA
             QuotedStr(Trim(DMBlueMetrics.SQLQ_VendasCODIGO_CLIENTE.AsString))+', '+ //CODIGO_CLIENTE
             QuotedStr(Trim(DMBlueMetrics.SQLQ_VendasCODIGO_VENDEDOR.AsString))+', '+ // CODIGO_VENDEDOR
             f_Troca(',','.',Trim(DMBlueMetrics.SQLQ_VendasCUSTO_VENDA_TOTAL.AsString))+', '+ // CUSTO_VENDA_TOTAL
             f_Troca(',','.',Trim(DMBlueMetrics.SQLQ_VendasCUSTO_TROCA_TOTAL.AsString))+', '; // CUSTO_TROCA_TOTAL

             // DATA_VENDA
             If Trim(DMBlueMetrics.SQLQ_VendasDATA_VENDA.AsString)='' Then
              MySql:=
               MySql+'NULL, '
             Else
              MySql:=
               MySql+QuotedStr(Trim(DMBlueMetrics.SQLQ_VendasDATA_VENDA.AsString))+', ';

      MySql:=
       MySql+f_Troca(',','.',Trim(DMBlueMetrics.SQLQ_VendasDESCONTO_TOTAL.AsString))+', '+ // DESCONTO_TOTAL
             f_Troca(',','.',Trim(DMBlueMetrics.SQLQ_VendasFRETE.AsString))+', '+ // FRETE
             Trim(DMBlueMetrics.SQLQ_VendasQTDE_TROCA_TOTAL.AsString)+', '+ // QTDE_TROCA_TOTAL
             Trim(DMBlueMetrics.SQLQ_VendasQTDE_VENDA_BRUTA_TOTAL.AsString)+', '+ // QTDE_VENDA_BRUTA_TOTAL
             Trim(DMBlueMetrics.SQLQ_VendasQTDE_VENDA_LIQUIDA_TOTAL.AsString)+', '+ // QTDE_VENDA_LIQUIDA_TOTAL
             QuotedStr(Trim(DMBlueMetrics.SQLQ_VendasSERIE.AsString))+', '+ // SERIE
             f_Troca(',','.',Trim(DMBlueMetrics.SQLQ_VendasVALOR_VENDA_BRUTA_TOTAL.AsString))+', '+ // VALOR_VENDA_BRUTA_TOTAL
             f_Troca(',','.',Trim(DMBlueMetrics.SQLQ_VendasVALOR_VENDA_LIQUIDA_TOTAL.AsString))+', '+ // VALOR_VENDA_LIQUIDA_TOTAL
             f_Troca(',','.',Trim(DMBlueMetrics.SQLQ_VendasVALOR_TROCA_TOTAL.AsString))+')'; // VALOR_TROCA_TOTAL
      DMBlueMetrics.ADOC.Execute(MySql);

      Lb_Reg.Caption:=IntToStr(StrToInt(Lb_Reg.Caption)+1);

      DMBlueMetrics.SQLQ_Vendas.Next;

      if StrToInt(Lb_Reg.Caption) mod 3000 = 0 Then
      Begin
        DMBlueMetrics.ADOC.CommitTrans;
        DMBlueMetrics.ADOC.BeginTrans;
      End; // if StrToInt(Lb_Reg.Caption) mod 3000 = 0 Then
    End; // While Not DMBlueMetrics.SQLQ_Vendas.Eof do

    DMBlueMetrics.ADOC.CommitTrans;
    Application.ProcessMessages;

  Except // Except da Transação
    on e : Exception do
    Begin
      DMBlueMetrics.ADOC.RollbackTrans;

      DMBlueMetrics.SQLQ_Vendas.EnableControls;
      DMBlueMetrics.SQLQ_Vendas.Close;

      MessageBox(Handle, pChar('Tabela: '+Lb_Tabela.Caption+#13+#13+e.message), 'Erro', MB_ICONERROR);

      tgMySqlErro.Add('Tabela: '+Lb_Tabela.Caption);
      tgMySqlErro.Add('ERROR: '+e.message);
      tgMySqlErro.Add(MySql);
      tgMySqlErro.Add('==================================');
      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_BlueMetrics_Erros.txt');
      Exit;
    End;
  End; // Try da Transação
  DMBlueMetrics.SQLQ_Vendas.EnableControls;
  DMBlueMetrics.SQLQ_Vendas.Close;

  // Odir Não Utilizae - Troca é Devoluções e Esta Em Itens_Trocas
  // Atualiza Totais de Devolução do Vendedor no Periodo =====================
  // VendasTrocas;

  Ckb_Vendas.Font.Color:=clWindowText;
  Screen.Cursor:=crDefault;

End; // Exporta Vendas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Exporta VendasTrocas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBlueMetrics.VendasTrocas;
Var
  MySql: String;
Begin
  Screen.Cursor:=crAppStart;

  DMBlueMetrics.ADOC.BeginTrans;
  Try // Try da Transação
    Lb_Tabela.Caption:='VendasTrocas';
    Lb_Reg.Caption:='0';

    DMBlueMetrics.SQLQ_VendasTrocas.Params.ParamByName('DtaI').AsDate:=DtEdt_DataInicio.Date;
    DMBlueMetrics.SQLQ_VendasTrocas.Params.ParamByName('DtaF').AsDate:=DtEdt_DataFim.Date;
    DMBlueMetrics.SQLQ_VendasTrocas.Open;
    DMBlueMetrics.SQLQ_VendasTrocas.DisableControls;
    While Not DMBlueMetrics.SQLQ_VendasTrocas.Eof do
    Begin
      Application.ProcessMessages;

      // Atualiza Valores de Devoluções ========================================
      MySql:=' UPDATE VENDAS'+
             ' SET custo_troca_total='+f_Troca(',','.',Trim(DMBlueMetrics.SQLQ_VendasTrocasCUSTO_TROCA_TOTAL.AsString))+
             ',    qtde_troca_total='+f_Troca(',','.',Trim(DMBlueMetrics.SQLQ_VendasTrocasQTDE_TROCA_TOTAL.AsString))+
             ',    qtde_venda_liquida_total = qtde_venda_liquida_total + '+
                                              f_Troca(',','.',Trim(DMBlueMetrics.SQLQ_VendasTrocasQTDE_TROCA_TOTAL.AsString))+
             ',    valor_venda_liquida_total = valor_venda_liquida_total - '+
                                              f_Troca(',','.',Trim(DMBlueMetrics.SQLQ_VendasTrocasVALOR_TROCA_TOTAL.AsString))+
             ',    valor_troca_total='+f_Troca(',','.',Trim(DMBlueMetrics.SQLQ_VendasTrocasVALOR_TROCA_TOTAL.AsString))+

             ' WHERE codigo_empresa='+QuotedStr(Trim(DMBlueMetrics.SQLQ_VendasTrocasEMPRESA.AsString))+
             ' AND   codigo_venda='+QuotedStr(Trim(DMBlueMetrics.SQLQ_VendasTrocasNOTA_ORIGEM.AsString))+
             ' AND   codigo_vendedor='+QuotedStr(Trim(DMBlueMetrics.SQLQ_VendasTrocasCOD_VENDEDOR.AsString));
      DMBlueMetrics.ADOC.Execute(MySql);

      Lb_Reg.Caption:=IntToStr(StrToInt(Lb_Reg.Caption)+1);

      DMBlueMetrics.SQLQ_VendasTrocas.Next;

      if StrToInt(Lb_Reg.Caption) mod 3000 = 0 Then
      Begin
        DMBlueMetrics.ADOC.CommitTrans;
        DMBlueMetrics.ADOC.BeginTrans;
      End; // if StrToInt(Lb_Reg.Caption) mod 3000 = 0 Then
    End; // While Not DMBlueMetrics.SQLQ_VendasTrocas.Eof do

    DMBlueMetrics.ADOC.CommitTrans;
    Application.ProcessMessages;

  Except // Except da Transação
    on e : Exception do
    Begin
      DMBlueMetrics.ADOC.RollbackTrans;
      MessageBox(Handle, pChar('Tabela: '+Lb_Tabela.Caption+#13+#13+e.message), 'Erro', MB_ICONERROR);

      tgMySqlErro.Add('Tabela: '+Lb_Tabela.Caption);
      tgMySqlErro.Add('ERROR: '+e.message);
      tgMySqlErro.Add(MySql);
      tgMySqlErro.Add('==================================');
      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_BlueMetrics_Erros.txt');
    End;
  End; // Try da Transação

  DMBlueMetrics.SQLQ_VendasTrocas.EnableControls;
  DMBlueMetrics.SQLQ_VendasTrocas.Close;

  Screen.Cursor:=crDefault;

End; // Exporta VendasTrocas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Exporta ItensVendas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBlueMetrics.ItensVendas;
Var
  MySql: String;
Begin

  Screen.Cursor:=crAppStart;

  DMBlueMetrics.ADOC.BeginTrans;
  Try // Try da Transação
    Lb_Tabela.Caption:='ItensVendas';
    Lb_Reg.Caption:='0';

    MySql:=' DELETE FROM ITENS_VENDAS'+
           ' WHERE DATA BETWEEN '+QuotedStr(DateToStr(DtEdt_DataInicio.Date))+' AND '+
                                  QuotedStr(DateToStr(DtEdt_DataFim.Date));
    DMBlueMetrics.ADOC.Execute(MySql);

    DMBlueMetrics.SQLQ_ItensVendas.Params.ParamByName('DtaI').AsDate:=DtEdt_DataInicio.Date;
    DMBlueMetrics.SQLQ_ItensVendas.Params.ParamByName('DtaF').AsDate:=DtEdt_DataFim.Date;
    DMBlueMetrics.SQLQ_ItensVendas.Open;
    DMBlueMetrics.SQLQ_ItensVendas.DisableControls;
    While Not DMBlueMetrics.SQLQ_ItensVendas.Eof do
    Begin
      Application.ProcessMessages;

      // Insere ================================================================
      MySql:=' INSERT INTO ITENS_VENDAS'+
             ' (CODIGO_EMPRESA, CODIGO_VENDA, CODIGO_PRODUTO, CUSTO_VENDA_ITENS,'+
             '  DATA, QUANTIDADE_VENDA_ITENS, SERIE, VALOR_VENDA_ITENS,'+
             '  VALOR_DESCONTO_ITENS)'+
             ' VALUES ('+
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ItensVendasCODIGO_EMPRESA.AsString))+', '+ // CODIGO_EMPRESA
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ItensVendasCODIGO_VENDA.AsString))+', '+ // CODIGO_VENDA
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ItensVendasCODIGO_PRODUTO.AsString))+', '+ // CODIGO_PRODUTO
             f_Troca(',','.',Trim(DMBlueMetrics.SQLQ_ItensVendasCUSTO_VENDA_ITENS.AsString))+', '; // CUSTO_VENDA_ITENS

             // DATA
             If Trim(DMBlueMetrics.SQLQ_ItensVendasDATA.AsString)='' Then
              MySql:=
               MySql+'NULL, '
             Else
              MySql:=
               MySql+QuotedStr(Trim(DMBlueMetrics.SQLQ_ItensVendasDATA.AsString))+', ';

      MySql:=
       MySql+f_Troca(',','.',Trim(DMBlueMetrics.SQLQ_ItensVendasQUANTIDADE_VENDA_ITENS.AsString))+', '+ // QUANTIDADE_VENDA_ITENS
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ItensVendasSERIE.AsString))+', '+ // SERIE
             f_Troca(',','.',Trim(DMBlueMetrics.SQLQ_ItensVendasVALOR_VENDA_ITENS.AsString))+', '+ // VALOR_VENDA_ITENS
             f_Troca(',','.',Trim(DMBlueMetrics.SQLQ_ItensVendasVALOR_DESCONTO_ITENS.AsString))+')'; // VALOR_DESCONTO_ITENS
      DMBlueMetrics.ADOC.Execute(MySql);

      Lb_Reg.Caption:=IntToStr(StrToInt(Lb_Reg.Caption)+1);

      DMBlueMetrics.SQLQ_ItensVendas.Next;

      if StrToInt(Lb_Reg.Caption) mod 3000 = 0 Then
      Begin
        DMBlueMetrics.ADOC.CommitTrans;
        DMBlueMetrics.ADOC.BeginTrans;
      End; // if StrToInt(Lb_Reg.Caption) mod 3000 = 0 Then
    End; // While Not DMBlueMetrics.SQLQ_ItensVendas.Eof do

    DMBlueMetrics.ADOC.CommitTrans;
    Application.ProcessMessages;

    Ckb_ItensVendas.Font.Color:=clWindowText;
  Except // Except da Transação
    on e : Exception do
    Begin
      DMBlueMetrics.ADOC.RollbackTrans;
      MessageBox(Handle, pChar('Tabela: '+Lb_Tabela.Caption+#13+#13+e.message), 'Erro', MB_ICONERROR);

      tgMySqlErro.Add('Tabela: '+Lb_Tabela.Caption);
      tgMySqlErro.Add('ERROR: '+e.message);
      tgMySqlErro.Add(MySql);
      tgMySqlErro.Add('==================================');
      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_BlueMetrics_Erros.txt');
    End;
  End; // Try da Transação
  DMBlueMetrics.SQLQ_ItensVendas.EnableControls;
  DMBlueMetrics.SQLQ_ItensVendas.Close;

  Screen.Cursor:=crDefault;

End; // Exporta ItensVendas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Exporta ItensTrocas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBlueMetrics.ItensTrocas;
Var
  MySql: String;
Begin

  Screen.Cursor:=crAppStart;

  DMBlueMetrics.ADOC.BeginTrans;
  Try // Try da Transação
    Lb_Tabela.Caption:='ItensTrocas';
    Lb_Reg.Caption:='0';

    MySql:=' DELETE FROM ITENS_TROCAS'+
           ' WHERE DATA BETWEEN '+QuotedStr(DateToStr(DtEdt_DataInicio.Date))+' AND '+
                                  QuotedStr(DateToStr(DtEdt_DataFim.Date));
    DMBlueMetrics.ADOC.Execute(MySql);

    DMBlueMetrics.SQLQ_ItensTrocas.Params.ParamByName('DtaI').AsDate:=DtEdt_DataInicio.Date;
    DMBlueMetrics.SQLQ_ItensTrocas.Params.ParamByName('DtaF').AsDate:=DtEdt_DataFim.Date;
    DMBlueMetrics.SQLQ_ItensTrocas.Open;
    DMBlueMetrics.SQLQ_ItensTrocas.DisableControls;
    While Not DMBlueMetrics.SQLQ_ItensTrocas.Eof do
    Begin
      Application.ProcessMessages;

      // Insere ================================================================
      MySql:=' INSERT INTO ITENS_TROCAS'+
             ' (CODIGO_EMPRESA, CODIGO_VENDA, SERIE, CODIGO_TROCA, CODIGO_PRODUTO,'+
             '  CUSTO_TROCA_ITENS, DATA, QUANTIDADE_TROCA_ITENS, VALOR_TROCA_ITENS)'+
             ' VALUES ('+
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ItensTrocasCODIGO_EMPRESA.AsString))+', '+ // CODIGO_EMPRESA
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ItensTrocasCODIGO_VENDA.AsString))+', '+ // CODIGO_VENDA
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ItensTrocasSERIE.AsString))+', '+ // SERIE
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ItensTrocasCODIGO_TROCA.AsString))+', '+ // CODIGO_TROCA
             QuotedStr(Trim(DMBlueMetrics.SQLQ_ItensTrocasCODIGO_PRODUTO.AsString))+', '+ // CODIGO_PRODUTO
             f_Troca(',','.',Trim(DMBlueMetrics.SQLQ_ItensTrocasCUSTO_TROCA_ITENS.AsString))+', '; // CUSTO_TROCA_ITENS

             // DATA
             If Trim(DMBlueMetrics.SQLQ_ItensTrocasDATA.AsString)='' Then
              MySql:=
               MySql+'NULL, '
             Else
              MySql:=
               MySql+QuotedStr(Trim(DMBlueMetrics.SQLQ_ItensTrocasDATA.AsString))+', ';

      MySql:=
       MySql+f_Troca(',','.',Trim(DMBlueMetrics.SQLQ_ItensTrocasQUANTIDADE_TROCA_ITENS.AsString))+', '+ // QUANTIDADE_TROCA_ITENS
             f_Troca(',','.',Trim(DMBlueMetrics.SQLQ_ItensTrocasVALOR_TROCA_ITENS.AsString))+')'; // VALOR_TROCA_ITENS
      DMBlueMetrics.ADOC.Execute(MySql);

      Lb_Reg.Caption:=IntToStr(StrToInt(Lb_Reg.Caption)+1);

      DMBlueMetrics.SQLQ_ItensTrocas.Next;

      if StrToInt(Lb_Reg.Caption) mod 3000 = 0 Then
      Begin
        DMBlueMetrics.ADOC.CommitTrans;
        DMBlueMetrics.ADOC.BeginTrans;
      End; // if StrToInt(Lb_Reg.Caption) mod 3000 = 0 Then
    End; // While Not DMBlueMetrics.SQLQ_ItensTrocas.Eof do

    DMBlueMetrics.ADOC.CommitTrans;

    Application.ProcessMessages;

    Ckb_ItensTrocas.Font.Color:=clWindowText;

  Except // Except da Transação
    on e : Exception do
    Begin
      DMBlueMetrics.ADOC.RollbackTrans;
      MessageBox(Handle, pChar('Tabela: '+Lb_Tabela.Caption+#13+#13+e.message), 'Erro', MB_ICONERROR);

      tgMySqlErro.Add('Tabela: '+Lb_Tabela.Caption);
      tgMySqlErro.Add('ERROR: '+e.message);
      tgMySqlErro.Add(MySql);
      tgMySqlErro.Add('==================================');
      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_BlueMetrics_Erros.txt');
    End;
  End; // Try da Transação
  DMBlueMetrics.SQLQ_ItensTrocas.EnableControls;
  DMBlueMetrics.SQLQ_ItensTrocas.Close;

  Screen.Cursor:=crDefault;

End; // Exporta ItensTrocas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Exporta Pagamentos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBlueMetrics.Pagamentos;
Var
  MySql: String;
Begin

  Screen.Cursor:=crAppStart;

  DMBlueMetrics.ADOC.BeginTrans;
  Try // Try da Transação
    Lb_Tabela.Caption:='Pagamentos';
    Lb_Reg.Caption:='0';

    MySql:=' DELETE FROM PAGAMENTOS'+
           ' WHERE DATA_LANCAMENTO BETWEEN '+QuotedStr(DateToStr(DtEdt_DataInicio.Date))+' AND '+
                                             QuotedStr(DateToStr(DtEdt_DataFim.Date));
    DMBlueMetrics.ADOC.Execute(MySql);

    DMBlueMetrics.SQLQ_Pagamentos.Params.ParamByName('DtaI').AsDate:=DtEdt_DataInicio.Date;
    DMBlueMetrics.SQLQ_Pagamentos.Params.ParamByName('DtaF').AsDate:=DtEdt_DataFim.Date;
    DMBlueMetrics.SQLQ_Pagamentos.Open;
    DMBlueMetrics.SQLQ_Pagamentos.DisableControls;
    While Not DMBlueMetrics.SQLQ_Pagamentos.Eof do
    Begin
      Application.ProcessMessages;

      // Insere ================================================================
      MySql:=' INSERT INTO PAGAMENTOS'+
             ' (ADMINISTRADORA, CODIGO_FILIAL, CODIGOLANCAMENTO, CODIGO_TERMINAL,'+
             '  DATA_LANCAMENTO, MODALIDADE_PAGAMENTO, NOME_FILIAL, PARCELAS,'+
             '  TIPO_PAGAMENTO, VALOR)'+
             ' VALUES ('+
             QuotedStr(Trim(DMBlueMetrics.SQLQ_PagamentosADMINISTRADORA.AsString))+', '+ // ADMINISTRADORA
             QuotedStr(Trim(DMBlueMetrics.SQLQ_PagamentosCODIGO_FILIAL.AsString))+', '+ // CODIGO_FILIAL
             QuotedStr(Trim(DMBlueMetrics.SQLQ_PagamentosCODIGOLANCAMENTO.AsString))+', '+ // CODIGOLANCAMENTO
             QuotedStr(Trim(DMBlueMetrics.SQLQ_PagamentosCODIGO_TERMINAL.AsString))+', '; // CODIGO_TERMINAL

             // DATA_LANCAMENTO
             If Trim(DMBlueMetrics.SQLQ_PagamentosDATA_LANCAMENTO.AsString)='' Then
              MySql:=
               MySql+'NULL, '
             Else
              MySql:=
               MySql+QuotedStr(Trim(DMBlueMetrics.SQLQ_PagamentosDATA_LANCAMENTO.AsString))+', ';

      MySql:=
       MySql+QuotedStr(Trim(DMBlueMetrics.SQLQ_PagamentosMODALIDADE_PAGAMENTO.AsString))+', '+ // MODALIDADE_PAGAMENTO
             QuotedStr(Trim(DMBlueMetrics.SQLQ_PagamentosNOME_FILIAL.AsString))+', '+ // NOME_FILIAL
             QuotedStr(Trim(DMBlueMetrics.SQLQ_PagamentosPARCELAS.AsString))+', '+ // PARCELAS
             QuotedStr(Trim(DMBlueMetrics.SQLQ_PagamentosTIPO_PAGAMENTO.AsString))+', '+ // TIPO_PAGAMENTO
             f_Troca(',','.',Trim(DMBlueMetrics.SQLQ_PagamentosVALOR.AsString))+')'; // VALOR
      DMBlueMetrics.ADOC.Execute(MySql);

      Lb_Reg.Caption:=IntToStr(StrToInt(Lb_Reg.Caption)+1);

      DMBlueMetrics.SQLQ_Pagamentos.Next;

      if StrToInt(Lb_Reg.Caption) mod 3000 = 0 Then
      Begin
        DMBlueMetrics.ADOC.CommitTrans;
        DMBlueMetrics.ADOC.BeginTrans;
      End; // if StrToInt(Lb_Reg.Caption) mod 3000 = 0 Then
    End; // While Not DMBlueMetrics.SQLQ_Pagamentos.Eof do

    DMBlueMetrics.ADOC.CommitTrans;
    Application.ProcessMessages;

    Ckb_Pagamentos.Font.Color:=clWindowText;

  Except // Except da Transação
    on e : Exception do
    Begin
      DMBlueMetrics.ADOC.RollbackTrans;
      MessageBox(Handle, pChar('Tabela: '+Lb_Tabela.Caption+#13+#13+e.message), 'Erro', MB_ICONERROR);

      tgMySqlErro.Add('Tabela: '+Lb_Tabela.Caption);
      tgMySqlErro.Add('ERROR: '+e.message);
      tgMySqlErro.Add(MySql);
      tgMySqlErro.Add('==================================');
      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_BlueMetrics_Erros.txt');
    End;
  End; // Try da Transação
  DMBlueMetrics.SQLQ_Pagamentos.EnableControls;
  DMBlueMetrics.SQLQ_Pagamentos.Close;

  Screen.Cursor:=crDefault;

End; // Exporta Pagamentos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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

  If (Ckb_Vendas.Checked) or (Ckb_ItensVendas.Checked) or (Ckb_ItensTrocas.Checked) or (Ckb_Pagamentos.Checked) Then
  Begin
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
  End; // If (Ckb_Vendas.Checked) or (Ckb_ItensVendas.Checked) or (Ckb_ItensTrocas.Checked) or (Ckb_Pagamentos.Checked) Then

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

      // Vendas - 09 e 10
      If Ckb_Vendas.Checked Then
       Vendas;

      // Itens Vendas - 05
      If Ckb_ItensVendas.Checked Then
       ItensVendas;

      // Itens Trocas - 08
      If Ckb_ItensTrocas.Checked Then
       ItensTrocas;

      // Pagamentos - 06
      If Ckb_Pagamentos.Checked Then
       Pagamentos;
   End; // If bUmVez Then

    bUmVez:=True;
    DMBlueMetrics.CDS_Lojas.Next;
  End; // While Not DMBlueMetrics.CDS_Lojas.Eof do
  DMBlueMetrics.CDS_Lojas.First;

  msg('FIM','A');
end;

procedure TFrmBlueMetrics.Ckb_ClientesClick(Sender: TObject);
begin
  If (Sender is TJvCheckBox) Then
  Begin
    (Sender as TJvCheckBox).Font.Color:=clWindowText;
    If (Sender as TJvCheckBox).Checked Then
     (Sender as TJvCheckBox).Font.Color:=clRed;
  End; // If (Sender is TCurrencyEdit) Then
end;

procedure TFrmBlueMetrics.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(tgMySqlErro);

end;

procedure TFrmBlueMetrics.FormCreate(Sender: TObject);
begin
  tgMySqlErro:=TStringList.Create;
  tgMySqlErro.Clear;
  tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_BlueMetrics_Erros.txt');

end;

end.

