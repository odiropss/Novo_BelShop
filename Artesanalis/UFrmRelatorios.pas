unit UFrmRelatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvXPCore, JvXPButtons, ExtCtrls,
  ComCtrls, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
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
  jpeg, Grids, DBGrids, Mask, ToolEdit, CurrEdit, JvExStdCtrls,
  JvRadioButton, Menus, AppEvnts;

type
  TFrmRelatorios = class(TForm)
    PC_Relatorios: TPageControl;
    Ts_MateriaPrima: TTabSheet;
    Ts_Produtos: TTabSheet;
    Ts_PessoasEntidades: TTabSheet;
    Ts_Despesas: TTabSheet;
    Ts_LancamentoNotas: TTabSheet;
    Pan_Baixo: TPanel;
    Bt_Sair: TJvXPButton;
    Ts_PedidosVendas: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Pan_PVPedidos: TPanel;
    Gb_PVCliente: TGroupBox;
    Edt_PVDesCliente: TEdit;
    Edt_PVCodCliente: TCurrencyEdit;
    Bt_PVBuscaCliente: TJvXPButton;
    Gb_PVPeriodo: TGroupBox;
    Label83: TLabel;
    DtaEdt_PVInicio: TcxDateEdit;
    DtaEdt_PVFim: TcxDateEdit;
    Bt_SalvarMemoria: TJvXPButton;
    Bt_Buscar: TJvXPButton;
    Label6: TLabel;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    MenuCADASTROS: TMenuItem;
    SubMenuCadastroMateriasPrimas: TMenuItem;
    SubMenuCadastroProdutos: TMenuItem;
    N3: TMenuItem;
    SubMenuCadastroPessoasEntidades: TMenuItem;
    N2: TMenuItem;
    SubMenuCadastroDespesas: TMenuItem;
    MenuENTRADASSAIDAS: TMenuItem;
    SubMenuEntradasSaidasLancamentoNotas: TMenuItem;
    MenuVENDASPEDIDOS: TMenuItem;
    SubMenuVendasPedidosPedidosVenda: TMenuItem;
    GroupBox1: TGroupBox;
    Rb_PVSintetico: TJvRadioButton;
    Rb_PVAnalitico: TJvRadioButton;
    Dbg_PVPedidos: TDBGrid;
    ApplicationEvents1: TApplicationEvents;
    Ts_ContasPagar: TTabSheet;
    MenuFINANCEIRO: TMenuItem;
    SubMenuFinanceiroContasPagar: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_SairClick(Sender: TObject);

    // ODIR >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    // Todas as TabSheet's Invisiveis
    Procedure DesabilitaTodasTabSheets(PC: TPageControl);

    Procedure ApresentaPedidos;

    // ODIR >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    procedure PC_RelatoriosChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SubMenuCadastroMateriasPrimasClick(Sender: TObject);
    procedure Edt_PVCodClienteChange(Sender: TObject);
    procedure Edt_PVCodClienteExit(Sender: TObject);
    procedure Edt_PVCodClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Bt_PVBuscaClienteClick(Sender: TObject);
    procedure Bt_BuscarClick(Sender: TObject);
    procedure Rb_PVAnaliticoClick(Sender: TObject);
    procedure Bt_SalvarMemoriaClick(Sender: TObject);
    procedure Dbg_PVPedidosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Rb_PVAnaliticoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure Dbg_PVPedidosColEnter(Sender: TObject);
    procedure SubMenuEntradasSaidasLancamentoNotasClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelatorios: TFrmRelatorios;

  igOrdem: Integer; // Colocado na Ordem do Client Virtual;

implementation

uses UDMArtesanalis, DK_Procs1, UPesquisa, DB;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


// Apresenta Movtos de Pedidos do Período >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmRelatorios.ApresentaPedidos;
Var
  MySql: String;
  sCodCli, sNumPed: String;

  // Calcula SubTotais de Cliente >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Procedure CalculaSubTotais;
  Begin
    MySql:=' SELECT'+
           ' ''TOTAIS'' Cod_Cliente,'+
           ' dc.des_pessoa Cliente,'+
           ' SUM(COALESCE(dc.vlr_produtos,0.00)) VLR_PRODUTOS,'+
           ' SUM(COALESCE(dc.vlr_desconto,0.00)) VLR_DESCONTO,'+
           ' SUM(COALESCE(dc.vlr_total,0.00)) VLR_TOTAL,'+
           ' SUM(COALESCE(dc.vlr_concedido,0.00)) VLR_CONCEDIDO,'+
           ' SUM(COALESCE(dc.vlr_pagamento,0.00)) VLR_PAGAMENTO'+

           ' FROM DOCTOS dc'+

           ' WHERE dc.origem=''P'''+
           ' AND   dc.cod_pessoa='+sCodCli+
           ' AND   dc.dta_docto between '+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtaEdt_PVInicio.Date))))+
           '                        and '+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtaEdt_PVFim.Date))))+

           ' GROUP BY 2';
    DMArtesanalis.CDS_BuscaRapida.Close;
    DMArtesanalis.SQLQ_BuscaRapida.SQL.Clear;
    DMArtesanalis.SQLQ_BuscaRapida.SQL.Add(MySql);
    DMArtesanalis.CDS_BuscaRapida.Open;

    // SubTotal do Cliente =====================================================
    DMArtesanalis.CDS_V_PVPedidos.Append;
    DMArtesanalis.CDS_V_PVPedidosCOD_CLIENTE.AsString:=
            DMArtesanalis.CDS_BuscaRapida.FieldByName('Cod_Cliente').AsString;
    DMArtesanalis.CDS_V_PVPedidosCLIENTE.AsString:=
                DMArtesanalis.CDS_BuscaRapida.FieldByName('Cliente').AsString;
    DMArtesanalis.CDS_V_PVPedidosVLR_PRODUTOS.AsString:=
           DMArtesanalis.CDS_BuscaRapida.FieldByName('Vlr_Produtos').AsString;
    DMArtesanalis.CDS_V_PVPedidosVLR_DESCONTO.AsString:=
           DMArtesanalis.CDS_BuscaRapida.FieldByName('Vlr_Desconto').AsString;
    DMArtesanalis.CDS_V_PVPedidosVLR_TOTAL.AsString:=
              DMArtesanalis.CDS_BuscaRapida.FieldByName('Vlr_Total').AsString;
    DMArtesanalis.CDS_V_PVPedidosVLR_CONCEDIDO.AsString:=
          DMArtesanalis.CDS_BuscaRapida.FieldByName('Vlr_Concedido').AsString;
    DMArtesanalis.CDS_V_PVPedidosVLR_PAGAMENTO.AsString:=
          DMArtesanalis.CDS_BuscaRapida.FieldByName('Vlr_Pagamento').AsString;
    DMArtesanalis.CDS_V_PVPedidosSINTETICO.AsString:='S';
    Inc(igOrdem);
    DMArtesanalis.CDS_V_PVPedidosORDEM.AsInteger:=igOrdem;
    DMArtesanalis.CDS_V_PVPedidos.Post;

    DMArtesanalis.CDS_BuscaRapida.Close;
  End; // Calcula SubTotais de Cliente >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Begin

  MySql:=' SELECT '+
         ' dc.cod_pessoa Cod_Cliente, dc.des_pessoa Cliente,'+
         ' dc.num_docto Num_Pedido, dc.dta_docto Dta_Emissao,'+
         ' dc.vlr_produtos, dc.per_desconto, dc.vlr_desconto, dc.vlr_total,'+
         ' dc.per_concedido, dc.vlr_concedido, dc.vlr_pagamento,'+
         ' di.num_seq, di.cod_produto, di.des_produto,'+
         ' di.qtd_movto, di.vlr_unitario, di.vlr_produto,'+
         ' di.per_desconto per_desconto_Item, di.vlr_desconto vlr_desconto_Item,'+
         ' di.vlr_total Vlr_Total_Item'+

         ' FROM DOCTOS dc, DOCTOS_ITENS di'+

         ' WHERE dc.num_seq_docto=di.num_seq_docto'+
         ' AND   dc.origem=''P'''+
         ' AND   dc.dta_docto between '+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtaEdt_PVInicio.Date))))+
         '                        and '+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtaEdt_PVFim.Date))));

         If Edt_PVCodCliente.AsInteger<>0 Then
          MySql:=
           MySql+' AND dc.cod_pessoa='+IntToStr(Edt_PVCodCliente.AsInteger);

  MySql:=
   MySql+' ORDER BY 2, 1, 4, 3';
  DMArtesanalis.CDS_Busca.Close;
  DMArtesanalis.SQLQ_Busca.SQL.Clear;
  DMArtesanalis.SQLQ_Busca.SQL.Add(MySql);
  DMArtesanalis.CDS_Busca.Open;

  If Trim(DMArtesanalis.CDS_Busca.FieldByName('Cliente').AsString)='' Then
  Begin
    DMArtesanalis.CDS_Busca.Close;
    msg('Sem Movto de Pedidos no Período !!','A');
    DtaEdt_PVInicio.SetFocus;
    Exit;
  End;

  // Limpa Dados do Client Virtual =============================================
  If DMArtesanalis.CDS_V_PVPedidos.Active Then
   DMArtesanalis.CDS_V_PVPedidos.Close;

  DMArtesanalis.CDS_V_PVPedidos.CreateDataSet;
  DMArtesanalis.CDS_V_PVPedidos.Filtered:=False;
  DMArtesanalis.CDS_V_PVPedidos.Filter:='';
  DMArtesanalis.CDS_V_PVPedidos.Open;
  igOrdem:=0;

  // Monta Apresentação dos Pedidos ============================================
  sNumPed:='';
  sCodCli:='';
  DMArtesanalis.CDS_Busca.DisableControls;
  While Not DMArtesanalis.CDS_Busca.Eof do
  Begin
    // Cria Registro de Totais do Cliente ---------------------------
    If (Trim(sCodCli)<>'') and (sCodCli<>Trim(DMArtesanalis.CDS_Busca.FieldByName('Cod_Cliente').AsString)) Then
    Begin
     CalculaSubTotais;
    End; // If (Trim(sCodCli)<>'') and (sCodCli<>Trim(DMArtesanalis.CDS_Busca.FieldByName('Cod_Cliente').AsString)) Then

    If sNumPed<>Trim(DMArtesanalis.CDS_Busca.FieldByName('Num_Pedido').AsString) Then
    Begin
      // Linha em Branco --------------------------------------------
      If sNumPed<>'' Then
      Begin
        DMArtesanalis.CDS_V_PVPedidos.Append;
        DMArtesanalis.CDS_V_PVPedidosSINTETICO.AsString:='N';
        Inc(igOrdem);
        DMArtesanalis.CDS_V_PVPedidosORDEM.AsInteger:=igOrdem;
        DMArtesanalis.CDS_V_PVPedidos.Post;
      End; // If sNumPed<>'' Then

      // Pedido -----------------------------------------------------
      DMArtesanalis.CDS_V_PVPedidos.Append;
      DMArtesanalis.CDS_V_PVPedidosCOD_CLIENTE.AsString:=
                    DMArtesanalis.CDS_Busca.FieldByName('Cod_Cliente').AsString;
      DMArtesanalis.CDS_V_PVPedidosCLIENTE.AsString:=
                        DMArtesanalis.CDS_Busca.FieldByName('Cliente').AsString;
      DMArtesanalis.CDS_V_PVPedidosDTA_EMISSAO.AsString:=
                    DMArtesanalis.CDS_Busca.FieldByName('Dta_Emissao').AsString;
      DMArtesanalis.CDS_V_PVPedidosNUM_PEDIDO.AsString:=
                     DMArtesanalis.CDS_Busca.FieldByName('Num_Pedido').AsString;
      // DMArtesanalis.CDS_V_PVPedidosQTD_PRODUTO.AsString:=
      // DMArtesanalis.CDS_V_PVPedidosVLR_UNITARIO.AsString:=
      DMArtesanalis.CDS_V_PVPedidosVLR_PRODUTOS.AsString:=
                   DMArtesanalis.CDS_Busca.FieldByName('Vlr_Produtos').AsString;
      DMArtesanalis.CDS_V_PVPedidosPER_DESCONTO.AsString:=
                   DMArtesanalis.CDS_Busca.FieldByName('Per_Desconto').AsString;
      DMArtesanalis.CDS_V_PVPedidosVLR_DESCONTO.AsString:=
                   DMArtesanalis.CDS_Busca.FieldByName('Vlr_Desconto').AsString;
      DMArtesanalis.CDS_V_PVPedidosVLR_TOTAL.AsString:=
                      DMArtesanalis.CDS_Busca.FieldByName('Vlr_Total').AsString;
      DMArtesanalis.CDS_V_PVPedidosPER_CONCEDIDO.AsString:=
                  DMArtesanalis.CDS_Busca.FieldByName('Per_Concedido').AsString;
      DMArtesanalis.CDS_V_PVPedidosVLR_CONCEDIDO.AsString:=
                  DMArtesanalis.CDS_Busca.FieldByName('Vlr_Concedido').AsString;
      DMArtesanalis.CDS_V_PVPedidosVLR_PAGAMENTO.AsString:=
                  DMArtesanalis.CDS_Busca.FieldByName('Vlr_Pagamento').AsString;
      DMArtesanalis.CDS_V_PVPedidosSINTETICO.AsString:='S';
      Inc(igOrdem);
      DMArtesanalis.CDS_V_PVPedidosORDEM.AsInteger:=igOrdem;
      DMArtesanalis.CDS_V_PVPedidos.Post;

      // Cabeçalho Prodtudos ----------------------------------------
      DMArtesanalis.CDS_V_PVPedidos.Append;
      DMArtesanalis.CDS_V_PVPedidosCLIENTE.AsString:='PRODUTOS';
      DMArtesanalis.CDS_V_PVPedidosSINTETICO.AsString:='N';
      Inc(igOrdem);
      DMArtesanalis.CDS_V_PVPedidosORDEM.AsInteger:=igOrdem;
      DMArtesanalis.CDS_V_PVPedidos.Post;
    End; // If sNumPed<>Trim(DMArtesanalis.CDS_Busca.FieldByName('Num_Pedido').AsString) Then

    // Produtos -----------------------------------------------------
    DMArtesanalis.CDS_V_PVPedidos.Append;
    DMArtesanalis.CDS_V_PVPedidosCOD_CLIENTE.AsString:=
                    DMArtesanalis.CDS_Busca.FieldByName('Cod_Produto').AsString;
    DMArtesanalis.CDS_V_PVPedidosCLIENTE.AsString:=
                    DMArtesanalis.CDS_Busca.FieldByName('Des_Produto').AsString;
    // DMArtesanalis.CDS_V_PVPedidosDTA_EMISSAO.AsString:=
    // DMArtesanalis.CDS_V_PVPedidosNUM_PEDIDO.AsString:=
    DMArtesanalis.CDS_V_PVPedidosQTD_PRODUTO.AsString:=
                      DMArtesanalis.CDS_Busca.FieldByName('Qtd_Movto').AsString;
    DMArtesanalis.CDS_V_PVPedidosVLR_UNITARIO.AsString:=
                   DMArtesanalis.CDS_Busca.FieldByName('Vlr_Unitario').AsString;
    DMArtesanalis.CDS_V_PVPedidosVLR_PRODUTOS.AsString:=
                    DMArtesanalis.CDS_Busca.FieldByName('Vlr_Produto').AsString;
    DMArtesanalis.CDS_V_PVPedidosPER_DESCONTO.AsString:=
              DMArtesanalis.CDS_Busca.FieldByName('Per_Desconto_Item').AsString;
    DMArtesanalis.CDS_V_PVPedidosVLR_DESCONTO.AsString:=
              DMArtesanalis.CDS_Busca.FieldByName('Vlr_Desconto_Item').AsString;
    DMArtesanalis.CDS_V_PVPedidosVLR_TOTAL.AsString:=
                 DMArtesanalis.CDS_Busca.FieldByName('Vlr_Total_Item').AsString;
    // DMArtesanalis.CDS_V_PVPedidosPER_CONCEDIDO.AsString:=
    // DMArtesanalis.CDS_V_PVPedidosVLR_CONCEDIDO.AsString:=
    // DMArtesanalis.CDS_V_PVPedidosVLR_PAGAMENTO.AsString:=
    DMArtesanalis.CDS_V_PVPedidosSINTETICO.AsString:='N';
    Inc(igOrdem);
    DMArtesanalis.CDS_V_PVPedidosORDEM.AsInteger:=igOrdem;
    DMArtesanalis.CDS_V_PVPedidos.Post;

    sNumPed:=Trim(DMArtesanalis.CDS_Busca.FieldByName('Num_Pedido').AsString);
    sCodCli:=Trim(DMArtesanalis.CDS_Busca.FieldByName('Cod_Cliente').AsString);

    DMArtesanalis.CDS_Busca.Next;
  End; // While Not DMArtesanalis.CDS_Busca.Eof do
  DMArtesanalis.CDS_Busca.EnableControls;
  DMArtesanalis.CDS_Busca.Close;
  DMArtesanalis.CDS_V_PVPedidos.First;

  // Cria Ultimo Registro de Totais do Cliente =================================
  CalculaSubTotais;

  // Linha em Branco ===========================================================
  DMArtesanalis.CDS_V_PVPedidos.Append;
  DMArtesanalis.CDS_V_PVPedidosSINTETICO.AsString:='N';
  Inc(igOrdem);
  DMArtesanalis.CDS_V_PVPedidosORDEM.AsInteger:=igOrdem;
  DMArtesanalis.CDS_V_PVPedidos.Post;

  // Cria Registro de Total Geral ==============================================
  MySql:=' SELECT'+
         ' ''TOTAIS'' Cod_Cliente,'+
         ' ''GERAL DO PERÍODO'' Cliente,'+
         ' SUM(COALESCE(dc.vlr_produtos,0.00)) VLR_PRODUTOS,'+
         ' SUM(COALESCE(dc.vlr_desconto,0.00)) VLR_DESCONTO,'+
         ' SUM(COALESCE(dc.vlr_total,0.00)) VLR_TOTAL,'+
         ' SUM(COALESCE(dc.vlr_concedido,0.00)) VLR_CONCEDIDO,'+
         ' SUM(COALESCE(dc.vlr_pagamento,0.00)) VLR_PAGAMENTO'+

         ' FROM DOCTOS dc'+

         ' WHERE dc.origem=''P'''+
         ' AND   dc.dta_docto between '+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtaEdt_PVInicio.Date))))+
         '                        and '+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtaEdt_PVFim.Date))));

         If Edt_PVCodCliente.AsInteger<>0 Then
          MySql:=
           MySql+' AND dc.cod_pessoa='+IntToStr(Edt_PVCodCliente.AsInteger);

  DMArtesanalis.CDS_BuscaRapida.Close;
  DMArtesanalis.SQLQ_BuscaRapida.SQL.Clear;
  DMArtesanalis.SQLQ_BuscaRapida.SQL.Add(MySql);
  DMArtesanalis.CDS_BuscaRapida.Open;

  // Total Geral ===============================================================
  DMArtesanalis.CDS_V_PVPedidos.Append;

  DMArtesanalis.CDS_V_PVPedidosCOD_CLIENTE.AsString:=
          DMArtesanalis.CDS_BuscaRapida.FieldByName('Cod_Cliente').AsString;
  DMArtesanalis.CDS_V_PVPedidosCLIENTE.AsString:=
              DMArtesanalis.CDS_BuscaRapida.FieldByName('Cliente').AsString;
  DMArtesanalis.CDS_V_PVPedidosVLR_PRODUTOS.AsString:=
         DMArtesanalis.CDS_BuscaRapida.FieldByName('Vlr_Produtos').AsString;
  DMArtesanalis.CDS_V_PVPedidosVLR_DESCONTO.AsString:=
         DMArtesanalis.CDS_BuscaRapida.FieldByName('Vlr_Desconto').AsString;
  DMArtesanalis.CDS_V_PVPedidosVLR_TOTAL.AsString:=
            DMArtesanalis.CDS_BuscaRapida.FieldByName('Vlr_Total').AsString;
  DMArtesanalis.CDS_V_PVPedidosVLR_CONCEDIDO.AsString:=
        DMArtesanalis.CDS_BuscaRapida.FieldByName('Vlr_Concedido').AsString;
  DMArtesanalis.CDS_V_PVPedidosVLR_PAGAMENTO.AsString:=
        DMArtesanalis.CDS_BuscaRapida.FieldByName('Vlr_Pagamento').AsString;
  DMArtesanalis.CDS_V_PVPedidosSINTETICO.AsString:='S';
  Inc(igOrdem);
  DMArtesanalis.CDS_V_PVPedidosORDEM.AsInteger:=igOrdem;

  DMArtesanalis.CDS_V_PVPedidos.Post;

  DMArtesanalis.CDS_BuscaRapida.Close;

  // Atualiza Filtros Analitico/Sintetico ======================================
  Rb_PVAnaliticoClick(Self);
End; // Apresenta Movtos de Pedidos do Período >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Desabilita Todas as TabSheet de um PageControl >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmRelatorios.DesabilitaTodasTabSheets(PC: TPageControl);
Var
  i: Integer;
Begin
  // Desabilita TabSheets ======================================================
  For i:=0 to FrmRelatorios.ComponentCount-1 do
  Begin
    If FrmRelatorios.Components[i] is TTabSheet Then
    Begin
      If (FrmRelatorios.Components[i] as TTabSheet).Parent=PC Then
      Begin
        (FrmRelatorios.Components[i] as TTabSheet).TabVisible:=False;
      End;
    End; // If FrmRelatorios.Components[i] is TTabSheet Then
  End; // For i:=0 to FrmRelatorios.ComponentCount-1 do

  Bt_Buscar.Visible:=False;
  Bt_SalvarMemoria.Visible:=False;

//OdirAPapgar
//  // Desabilita Botoes de Calculo ==============================================
//  Bt_ProfINSSTXSCalcular.Visible:=False;
//  Bt_ProfINSSTXSExcel.Visible:=False;
//  Bt_ProfINSSTXSClipboard.Visible:=False;
//
//  Bt_MovtosRHRetornar.Visible:=True;
//  Bt_Fechar.Visible:=False;

End; // Desabilita Todas as TabSheet de um PageControl >>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmRelatorios.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  // Permite Sair do Sistema ===================================================
  DMArtesanalis.MemoRetiraNomeForm('RELATÓRIOS');

end;

procedure TFrmRelatorios.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Não Permite Movimentar o Formulário =======================================
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  Application.OnMessage := ApplicationEvents1Message;

  // Inicializa Client Virtual =================================================
  If DMArtesanalis.CDS_V_PVPedidos.Active Then
   DMArtesanalis.CDS_V_PVPedidos.Close;

  DMArtesanalis.CDS_V_PVPedidos.CreateDataSet;
  DMArtesanalis.CDS_V_PVPedidos.Filtered:=False;
  DMArtesanalis.CDS_V_PVPedidos.Filter:='';
  DMArtesanalis.CDS_V_PVPedidos.Open;
  igOrdem:=0;
end;

procedure TFrmRelatorios.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmRelatorios.Bt_SairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelatorios.PC_RelatoriosChange(Sender: TObject);
begin
  // Pedidos de Vendas =========================================================
  If (PC_Relatorios.ActivePage=Ts_PedidosVendas) And (Ts_PedidosVendas.CanFocus) Then
  Begin
    Edt_PVCodCliente.SetFocus;
  End; // If (PC_Relatorios.ActivePage=Ts_PedidosVendas) And (Ts_PedidosVendas.CanFocus) Then

  Try
    CorSelecaoTabSheet(PC_Relatorios);
  Except
  End;

end;

procedure TFrmRelatorios.FormShow(Sender: TObject);
begin
  // Todas as TabSheet's Invisiveis ============================================
  DesabilitaTodasTabSheets(PC_Relatorios);
end;

procedure TFrmRelatorios.SubMenuCadastroMateriasPrimasClick(Sender: TObject);
begin
  // Desabilita Todas as TabSheets e Botoes ====================================
  DesabilitaTodasTabSheets(PC_Relatorios);

  If (Sender is TMenuItem) Then
  Begin
    // Habilita TabSheet =======================================================
    If (Sender as TMenuItem).Name='SubMenuCadastroMateriasPrimas' Then
    Begin
      PC_Relatorios.ActivePage:=Ts_MateriaPrima;
      Ts_MateriaPrima.TabVisible:=True;
    End;

    If (Sender as TMenuItem).Name='SubMenuCadastroProdutos' Then
    Begin
      PC_Relatorios.ActivePage:=Ts_Produtos;
      Ts_Produtos.TabVisible:=True;
    End;

    If (Sender as TMenuItem).Name='SubMenuCadastroPessoasEntidades' Then
    Begin
      PC_Relatorios.ActivePage:=Ts_PessoasEntidades;
      Ts_PessoasEntidades.TabVisible:=True;
    End;

    If (Sender as TMenuItem).Name='SubMenuCadastroDespesas' Then
    Begin
      PC_Relatorios.ActivePage:=Ts_Despesas;
      Ts_Despesas.TabVisible:=True;
    End;

    If (Sender as TMenuItem).Name='SubMenuEntradasSaidasLancamentoNotas' Then
    Begin
      PC_Relatorios.ActivePage:=Ts_LancamentoNotas;
      Ts_LancamentoNotas.TabVisible:=True;
    End;

    If (Sender as TMenuItem).Name='SubMenuVendasPedidosPedidosVenda' Then
    Begin
      PC_Relatorios.ActivePage:=Ts_PedidosVendas;
      Ts_PedidosVendas.TabVisible:=True;

      Bt_Buscar.Visible:=True;
      Bt_SalvarMemoria.Visible:=True;
    End;

    If (Sender as TMenuItem).Name='SubMenuFinanceiroContasPagar' Then
    Begin
      PC_Relatorios.ActivePage:=Ts_ContasPagar;
      Ts_ContasPagar.TabVisible:=True;

      Bt_Buscar.Visible:=True;
      Bt_SalvarMemoria.Visible:=True;
    End;
  End; // If (Sender is TMenuItem) Then

  PC_RelatoriosChange(Self);

end;

procedure TFrmRelatorios.Edt_PVCodClienteChange(Sender: TObject);
begin
  // Incicializa Produtos ======================================================
  If DMArtesanalis.CDS_V_PVPedidos.Active Then
   DMArtesanalis.CDS_V_PVPedidos.Close;

  DMArtesanalis.CDS_V_PVPedidos.CreateDataSet;
  DMArtesanalis.CDS_V_PVPedidos.Filtered:=False;
  DMArtesanalis.CDS_V_PVPedidos.Filter:='';
  DMArtesanalis.CDS_V_PVPedidos.Open;
  igOrdem:=0;

  Edt_PVDesCliente.Clear;

end;

procedure TFrmRelatorios.Edt_PVCodClienteExit(Sender: TObject);
Var
  MySql: String;
begin
  If Edt_PVCodCliente.asInteger=0 Then
   Exit;

  Screen.Cursor:=crAppStart;

  Edt_PVDesCliente.Clear;                          

  MySql:=' SELECT p.des_pessoa nome, Tipo'+
         ' FROM PESSOAS p'+
         ' WHERE p.Tipo in (''A'', ''C'')'+
         ' AND p.cod_pessoa='+IntToStr(Edt_PVCodCliente.AsInteger);
  DMArtesanalis.CDS_BuscaRapida.Close;
  DMArtesanalis.SQLQ_BuscaRapida.SQL.Clear;
  DMArtesanalis.SQLQ_BuscaRapida.SQL.Add(MySql);
  DMArtesanalis.CDS_BuscaRapida.Open;
               
  If Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('Nome').AsString)='' Then
  Begin
    Screen.Cursor:=crDefault;
    DMArtesanalis.CDS_BuscaRapida.Close;
    msg('Cliente Não Encontrado !!'+cr+'Ou Não é Cliente !!','A');
    Edt_PVCodCliente.SetFocus;
    Exit;
  End;
  Edt_PVDesCliente.Text:=Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('Nome').AsString);
  DMArtesanalis.CDS_BuscaRapida.Close;

  Screen.Cursor:=crDefault;
  DtaEdt_PVInicio.SetFocus;
end;

procedure TFrmRelatorios.Edt_PVCodClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // <F9> Busca Pessoa =========================================================
  If Key=VK_F9 Then
   Bt_PVBuscaClienteClick(Self);

end;

procedure TFrmRelatorios.Bt_PVBuscaClienteClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_PVPedidos.SetFocus;
  Edt_PVCodCliente.Clear;
  Edt_PVDesCliente.Clear;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT p.des_pessoa Nome, p.cod_pessoa Codigo'+
         ' FROM PESSOAS p'+
         ' WHERE p.Tipo in (''A'', ''C'')'+
         ' ORDER BY p.des_pessoa';
  DMArtesanalis.CDS_Pesquisa.Close;
  DMArtesanalis.CDS_Pesquisa.Filtered:=False;
  DMArtesanalis.SDS_Pesquisa.CommandText:=MySql;
  DMArtesanalis.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMArtesanalis.CDS_Pesquisa.FieldByName('Nome').AsString)='' Then
  Begin
    DMArtesanalis.CDS_Pesquisa.Close;
    msg('Sem Cliente a Listar !!','A');
    Edt_PVCodCliente.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Nome';
  FrmPesquisa.Campo_Codigo:='Codigo';
  FrmPesquisa.Campo_Descricao:='Nome';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMArtesanalis.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    Edt_PVCodCliente.AsInteger:=StrToInt(FrmPesquisa.EdtCodigo.Text);
    Edt_PVCodClienteExit(Self);
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmRelatorios.Bt_BuscarClick(Sender: TObject);
begin
  If (PC_Relatorios.ActivePage=Ts_PedidosVendas) And (Ts_PedidosVendas.CanFocus) Then
  Begin
    // Consiste Datas ============================================================
    Try
      StrToDate(DtaEdt_PVInicio.Text)
    Except
      msg('Data do Início do Período é Inválida !!','A');
      DtaEdt_PVInicio.SetFocus;
      Exit;
    End;

    Try
      StrToDate(DtaEdt_PVFim.Text)
    Except
      msg('Data do Fim do Período é Inválida !!','A');
      DtaEdt_PVFim.SetFocus;
      Exit;
    End;

    If DtaEdt_PVInicio.Date>DtaEdt_PVFim.Date Then
    Begin
      msg('Período Inválido !!','A');
      DtaEdt_PVInicio.SetFocus;
      Exit;
    End;

    Dbg_PVPedidos.SetFocus;

    // Busca Movtos de Pedidos do Período ========================================
    Screen.Cursor:=crAppStart;
    ApresentaPedidos;
    Screen.Cursor:=crDefault;
  End; // If (PC_Relatorios.ActivePage=Ts_PedidosVendas) And (Ts_PedidosVendas.CanFocus) Then
end;

procedure TFrmRelatorios.Rb_PVAnaliticoClick(Sender: TObject);
begin
  AcertaRb_Style(Rb_PVAnalitico);
  AcertaRb_Style(Rb_PVSintetico);

  If DMArtesanalis.CDS_V_PVPedidos.IsEmpty Then
   Exit;

  Screen.Cursor:=crAppStart;
  DMArtesanalis.CDS_V_PVPedidos.Filtered:=False;
  DMArtesanalis.CDS_V_PVPedidos.Filter:='';

  Dbg_PVPedidos.Columns[4].Visible:=True;
  Dbg_PVPedidos.Columns[5].Visible:=True;

  If Rb_PVSintetico.Checked Then
  Begin
    Dbg_PVPedidos.Columns[4].Visible:=False;
    Dbg_PVPedidos.Columns[5].Visible:=False;

    DMArtesanalis.CDS_V_PVPedidos.Filter:='SINTETICO=''S''';
    DMArtesanalis.CDS_V_PVPedidos.Filtered:=True;
  End; // If Rb_PVSintetico.Checked Then

  Screen.Cursor:=crDefault;
  Dbg_PVPedidos.SetFocus;

end;

procedure TFrmRelatorios.Bt_SalvarMemoriaClick(Sender: TObject);
begin
  If (PC_Relatorios.ActivePage=Ts_PedidosVendas) And (Ts_PedidosVendas.CanFocus) Then
  Begin
    If Not DMArtesanalis.CDS_V_PVPedidos.IsEmpty Then
    Begin
      Dbg_PVPedidos.SetFocus;
      Screen.Cursor:=crAppStart;

      DBGridClipboard(Dbg_PVPedidos);

      Screen.Cursor:=crDefault;
    End;
  End; // If (PC_Relatorios.ActivePage=Ts_PedidosVendas) And (Ts_PedidosVendas.CanFocus) Then
end;

procedure TFrmRelatorios.Dbg_PVPedidosDrawColumnCell(Sender: TObject;
   const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  If DMArtesanalis.CDS_V_PVPedidos.IsEmpty Then
   Exit;

  If (Column.FieldName='CLIENTE') Then // Este comando altera cor da Celula
  Begin
    If DMArtesanalis.CDS_V_PVPedidosCLIENTE.AsString='PRODUTOS' Then
    Begin
      Dbg_PVPedidos.Canvas.Font.Style:=[fsBold];
      Dbg_PVPedidos.Canvas.Font.Color:=clWindowText; // Cor da Fonte
      Dbg_PVPedidos.Canvas.Brush.Color:=$00E4E4E4; // Cor da Celula
    End;
  End; // If (Column.FieldName='CLIENTE') Then // Este comando altera cor da Celula

  if not (gdSelected in State) Then // Este comando altera cor da Linha
  Begin
    If DMArtesanalis.CDS_V_PVPedidosSINTETICO.AsString='S' Then
    Begin
      Dbg_PVPedidos.Canvas.Brush.Color:=clSkyBlue;
    End;

    If Trim(DMArtesanalis.CDS_V_PVPedidosCOD_CLIENTE.AsString)='TOTAIS' Then
    Begin
//      Dbg_PVPedidos.Canvas.Brush.Color:=clSkyBlue;
      Dbg_PVPedidos.Canvas.Font.Style:=[fsBold];
      Dbg_PVPedidos.Canvas.Font.Color:=clWindowText; // Cor da Fonte
    End;
  End; // if not (gdSelected in State) Then // Este comando altera cor da Linha

  Dbg_PVPedidos.Canvas.FillRect(Rect);
  Dbg_PVPedidos.DefaultDrawDataCell(Rect,Column.Field,state);

  // Alinhamento
  DMArtesanalis.CDS_V_PVPedidosCOD_CLIENTE.Alignment:=taRightJustify;
  DMArtesanalis.CDS_V_PVPedidosDTA_EMISSAO.Alignment:=taCenter;
end;

procedure TFrmRelatorios.Rb_PVAnaliticoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Rb_PVAnaliticoClick(Self);
end;

procedure TFrmRelatorios.ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
var
  Sentido: SmallInt;
begin
  If Msg.message = WM_MOUSEWHEEL then
  Begin
    Msg.message := WM_KEYDOWN;
    Msg.lParam := 0;
    Sentido := HiWord(Msg.wParam);
    if Sentido > 0 then
     Msg.wParam := VK_UP
    else
     Msg.wParam := VK_DOWN;
  End; // if Msg.message = WM_MOUSEWHEEL then
end;

procedure TFrmRelatorios.Dbg_PVPedidosColEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_PVPedidosColEnter; // Nome do Evento do DBGRID
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmRelatorios.SubMenuEntradasSaidasLancamentoNotasClick(Sender: TObject);
begin
  // Desabilita Todas as TabSheets e Botoes ====================================
  DesabilitaTodasTabSheets(PC_Relatorios);

end;

end.
