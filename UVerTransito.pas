unit UVerTransito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExControls, JvXPCore, JvXPButtons, Mask, DBCtrls,
  Clipbrd, // PrintScreen
  DBXpress, Grids, DBGrids, ExtCtrls,
  DB, IBCustomDataSet, IBQuery;
//  Último: IBQuery;

{
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, QT, Mask, DBCtrls,
  JvExControls, JvXPCore, JvXPButtons, DBXpress, DB, IBCustomDataSet,
  Clipbrd, // PrintScreen
  IBQuery;
}

type
  TFrmVerTransito = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Pan_VerTransitoEmpresa: TPanel;
    Dbg_VerTransitoOCs: TDBGrid;
    Pan_VerTransitoProduto: TPanel;
    Label1: TLabel;
    Dbe_VerTransitoCodProduto: TDBEdit;
    Dbe_VerTransitoDesProduto: TDBEdit;
    Panel5: TPanel;
    Label5: TLabel;
    Panel8: TPanel;
    Panel9: TPanel;
    Label6: TLabel;
    Label4: TLabel;
    Dbg_VerTransitoOCsValores: TDBGrid;
    Pan_VerTransitoFechaOC: TPanel;
    Bt_VerTransitoFechaOC: TJvXPButton;
    Rb_VerTransitoFechaEntregue: TRadioButton;
    Rb_VerTransitoFechaCancelada: TRadioButton;
    OdirPanApres: TPanel;
    procedure Dbg_VerTransitoOCsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Rb_VerTransitoFechaEntregueClick(Sender: TObject);
    procedure Bt_VerTransitoFechaOCClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVerTransito: TFrmVerTransito;

  TD: TTransactionDesc;

implementation

uses UDMBelShop, DK_Procs1, UFrmBelShop;

{$R *.dfm}

procedure TFrmVerTransito.Dbg_VerTransitoOCsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not (gdSelected in State) Then
  Begin
    // OC Aberta - Pendente no Fornecedor ======================================
    if DMBelShop.CDS_VerTransitoCOD_SITUACAO.AsInteger=1 Then
     Dbg_VerTransitoOCs.Canvas.Brush.Color:=$00D7FFD7;

    Dbg_VerTransitoOCs.Canvas.FillRect(Rect);
    Dbg_VerTransitoOCs.DefaultDrawDataCell(Rect,Column.Field,state);
  End;

end;

procedure TFrmVerTransito.FormShow(Sender: TObject);
begin
  Dbg_VerTransitoOCs.SetFocus;
end;

procedure TFrmVerTransito.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=Char(VK_Escape) Then
   Close;

end;

procedure TFrmVerTransito.Rb_VerTransitoFechaEntregueClick(
  Sender: TObject);
begin
  AcertaRb_Style(Rb_VerTransitoFechaEntregue);
  AcertaRb_Style(Rb_VerTransitoFechaCancelada);

end;

procedure TFrmVerTransito.Bt_VerTransitoFechaOCClick(Sender: TObject);
Var
  sDescSit, sCodSit, MySql: String;
  s: String;
  bSiga: Boolean;
  IBQ_ConsultaLoja: TIBQuery;
  iRecNo, i: Integer;
  
begin
  If Rb_VerTransitoFechaEntregue.Checked Then
   Begin
     sDescSit:='ENTREGUE';
     sCodSit:='2';
   End
  Else // If Rb_VerTransitoFechaEntregue.Checked Then
   Begin
     sDescSit:='CANCELADA';
     sCodSit:='3';
   End; // If Rb_VerTransitoFechaEntregue.Checked Then

  if msg('Deseja Realmente Modificar a OC'+cr+'Selecionada para '+sDescSit+' ??','C')=2 Then
   Exit;

  // Apresentacao ==============================================================
  OdirPanApres.Caption:='AGUARDE !! Modificando OC nº '+DMBelShop.CDS_VerTransitoNUM_REF.AsString+' no SIDICOM ... ';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBelShop.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBelShop.Height-OdirPanApres.Height)/2));
  OdirPanApres.Visible:=True;
  Refresh;

  Screen.Cursor:=crAppStart;

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);

  // Modificar Situacao da OC no SIDICOM
  Try 
    Screen.Cursor:=crAppStart; 
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Conecta Empresa =========================================================
    If ConexaoEmpIndividual('IBDB_'+DMBelShop.CDS_VerTransitoCODFILIAL.AsString,
                            'IBT_'+DMBelShop.CDS_VerTransitoCODFILIAL.AsString, 'A') Then
     Begin
       bSiga:=True;
     End
    Else // If ConexaoEmpIndividual('IBDB_'+DMBelShop.CDS_VerTransitoCODFILIAL.AsString,'IBT_'+DMBelShop.CDS_VerTransitoCODFILIAL.AsString, 'A') Then
     Begin
       Refresh;
       bSiga:=False;
     End; // If ConexaoEmpIndividual('IBDB_'+DMBelShop.CDS_VerTransitoCODFILIAL.AsString,'IBT_'+DMBelShop.CDS_VerTransitoCODFILIAL.AsString, 'A') Then

    // Inicia Processamento ====================================================
    If bSiga Then // Empresa Conectada
    Begin
      // Cria Query da Empresa --------------------------------------
      FrmBelShop.CriaQueryIB('IBDB_'+DMBelShop.CDS_VerTransitoCODFILIAL.AsString,
                  'IBT_'+DMBelShop.CDS_VerTransitoCODFILIAL.AsString,
                  IBQ_ConsultaLoja, True, True);

      // Starta Transacao IB ----------------------------------------
      IBTransacao('S','IBT_'+DMBelShop.CDS_VerTransitoCODFILIAL.AsString);
      Try // Starta Transacao IB
      
        // Monta DML Altera Situacao da OC ==========================
        MySql:=' UPDATE ordem oc'+
               ' SET oc.situacao='+sCodSit+
               ' WHERE CAST(oc.codoc AS INTEGER)='+
               DMBelShop.CDS_VerTransitoNUM_REF.AsString+
               ' AND oc.codfornecedor='+
               QuotedStr(DMBelShop.CDS_VerTransitoCODFORNECEDOR.AsString)+
               ' AND oc.codfilial='+
               QuotedStr(DMBelShop.CDS_VerTransitoCODFILIAL.AsString);
        IBQ_ConsultaLoja.SQL.Clear;
        IBQ_ConsultaLoja.SQL.Add(MySql);

        // Executa Query --------------------------------------------
        i:=0;
        bSiga:=False;
        While Not bSiga do
        Begin
          Try
            IBQ_ConsultaLoja.ExecSQL;
            bSiga:=True;
          Except
            Inc(i);
          End; // Try

          If i>20 Then
          Begin
            msg('Conexão Perdida !!'+cr+'Loja: '+DMBelShop.CDS_VerTransitoCODFILIAL.AsString+' !!','A');

            DMBelShop.SQLC.Rollback(TD);
            IBTransacao('R','IBT_'+DMBelShop.CDS_VerTransitoCODFILIAL.AsString);

            // Fecha Conexão ----------------------------------------------
            ConexaoEmpIndividual('IBDB_'+DMBelShop.CDS_VerTransitoCODFILIAL.AsString,
                                 'IBT_'+DMBelShop.CDS_VerTransitoCODFILIAL.AsString, 'F');
                                
            OdirPanApres.Visible:=False;
            DateSeparator:='/';
            DecimalSeparator:=',';
            Screen.Cursor:=crDefault;

            Exit;
          End; // If i>20 Then
        End; // While Not bSiga do - Executa Query

        // Acerta Transito -----------------------------------------------
        s:=f_Troca('/','.',DMBelShop.CDS_VerTransitoDTA_REF.AsString);
        s:=f_Troca('-','.',s);
        MySql:=' Select *'+
               ' From Movtos_Empresas m'+
               ' Where m.ind_tipo=''TR'''+
               ' and m.codfilial='+
               QuotedStr(DMBelShop.CDS_VerTransitoCODFILIAL.AsString)+
               ' and CAST(m.num_ref AS INTEGER)='+
               DMBelShop.CDS_VerTransitoNUM_REF.AsString+
               ' AND m.codfornecedor='+
               QuotedStr(DMBelShop.CDS_VerTransitoCODFORNECEDOR.AsString)+
               ' and m.dta_ref='+QuotedStr(s);
        DMBelShop.CDS_Busca.Close;
        DMBelShop.SDS_Busca.CommandText:=MySql;
        DMBelShop.CDS_Busca.Open;

        iRecNo:=DMBelShop.CDS_AComprarItens.RecNo;
        While Not DMBelShop.CDS_Busca.Eof do
        Begin
          Refresh;

          If DMBelShop.CDS_AComprarItens.Locate('Cod_Item', DMBelShop.CDS_Busca.FieldByName('CodProduto').AsString,[]) Then
          Begin
            MySql:=' Update oc_comprar o'+
                   ' Set o.qtd_transito=o.qtd_transito-'+
                   f_Troca(',','.',DMBelShop.CDS_Busca.FieldByName('Quant_Ref').AsString)+
                   ' where o.num_documento='+
                   VarToStr(FrmBelShop.EdtGeraOCBuscaDocto.Value)+
                   ' and o.cod_item='+
                   QuotedStr(DMBelShop.CDS_Busca.FieldByName('CodProduto').AsString)+
                   ' and o.COD_EMPRESA='+
                   QuotedStr(DMBelShop.CDS_VerTransitoCODFILIAL.AsString);
            DMBelShop.SQLC.Execute(MySql, nil, nil);

            // Monta DML Altera Estoque - Compra Pendente no SIDICOM ========
            MySql:=' UPDATE estoque es'+
                   ' SET es.comprapendente=es.comprapendente-'+
                   f_Troca(',','.',DMBelShop.CDS_Busca.FieldByName('Quant_Ref').AsString)+
                   ' WHERE  es.codproduto='+
                   QuotedStr(DMBelShop.CDS_Busca.FieldByName('CodProduto').AsString)+
                   ' AND es.codfilial='+
                   QuotedStr(DMBelShop.CDS_VerTransitoCODFILIAL.AsString)+
                   ' AND es.comprapendente>='+
                   f_Troca(',','.',DMBelShop.CDS_Busca.FieldByName('Quant_Ref').AsString);
            IBQ_ConsultaLoja.SQL.Clear;
            IBQ_ConsultaLoja.SQL.Add(MySql);

            // Executa Query --------------------------------------------
            i:=0;
            bSiga:=False;
            While Not bSiga do
            Begin
              Try
                IBQ_ConsultaLoja.ExecSQL;
                bSiga:=True;
              Except
                Inc(i);
              End; // Try

              If i>20 Then
              Begin
                msg('Conexão Perdida !!'+cr+'Loja: '+DMBelShop.CDS_VerTransitoCODFILIAL.AsString+' !!','A');

                DMBelShop.SQLC.Rollback(TD);
                IBTransacao('R','IBT_'+DMBelShop.CDS_VerTransitoCODFILIAL.AsString);

                // Fecha Conexão ----------------------------------------------
                ConexaoEmpIndividual('IBDB_'+DMBelShop.CDS_VerTransitoCODFILIAL.AsString,
                                     'IBT_'+DMBelShop.CDS_VerTransitoCODFILIAL.AsString, 'F');
                                
                OdirPanApres.Visible:=False;
                DateSeparator:='/';
                DecimalSeparator:=',';
                Screen.Cursor:=crDefault;

                Exit;
              End; // If i>20 Then
            End; // While Not bSiga do - Executa Query
          End; // If DMBelShop.CDS_AComprarItens.Locate('Cod_Item', DMBelShop.CDS_Busca.FieldByName('CodProduto').AsString,[]) Then

          DMBelShop.CDS_Busca.Next;
        End; // While Not DMBelShop.CDS_Busca.Eof do
        DMBelShop.CDS_Busca.Close;

        IBTransacao('C','IBT_'+DMBelShop.CDS_VerTransitoCODFILIAL.AsString);

        // Fecha Conexão ----------------------------------------------
        ConexaoEmpIndividual('IBDB_'+DMBelShop.CDS_VerTransitoCODFILIAL.AsString,
                             'IBT_'+DMBelShop.CDS_VerTransitoCODFILIAL.AsString, 'F');
        
      Except // Try - Starta Transacao IB
        msg('Erro ao Atualiza SIDICOM !!'+cr+'Loja: '+DMBelShop.CDS_VerTransitoCODFILIAL.AsString+' !!','A');

        DMBelShop.SQLC.Rollback(TD);
        IBTransacao('R','IBT_'+DMBelShop.CDS_VerTransitoCODFILIAL.AsString);

        // Fecha Conexão ----------------------------------------------
        ConexaoEmpIndividual('IBDB_'+DMBelShop.CDS_VerTransitoCODFILIAL.AsString,
                             'IBT_'+DMBelShop.CDS_VerTransitoCODFILIAL.AsString, 'F');

        OdirPanApres.Visible:=False;
        DateSeparator:='/';
        DecimalSeparator:=',';
        Screen.Cursor:=crDefault;

        Exit;
      End; // Try - Starta Transacao IB

    End; //If bSiga Then // Empresa Conectada
    
    // Exclui Movtos Empresas ---------------------------------------
    s:=f_Troca('/','.',DMBelShop.CDS_VerTransitoDTA_REF.AsString);
    s:=f_Troca('-','.',s);
    MySql:=' Delete From Movtos_Empresas m'+
           ' Where m.ind_tipo=''TR'''+
           ' and m.codfilial='+
           QuotedStr(DMBelShop.CDS_VerTransitoCODFILIAL.AsString)+
           ' and CAST(m.num_ref AS INTEGER)='+
           DMBelShop.CDS_VerTransitoNUM_REF.AsString+
           ' AND m.codfornecedor='+
           QuotedStr(DMBelShop.CDS_VerTransitoCODFORNECEDOR.AsString)+
           ' and m.dta_ref='+QuotedStr(s);
    DMBelShop.SQLC.Execute(MySql, nil, nil);

    // Fecha Transacao ----------------------------------------------
    DMBelShop.SQLC.Commit(TD);

    OdirPanApres.Visible:=False;
    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;

    // Reabre Sugestoes de Compra -------------------------------
    FrmBelShop.EdtGeraOCBuscaDoctoExit(Self);
    DMBelShop.CDS_AComprarItens.RecNo:=iRecNo;

    DMBelShop.CDS_VerTransito.Close;
    DMBelShop.CDS_VerTransito.Open;

    msg('Se Necessário, Recalcule a Necessidade de Compra !!','A');

  Except // Modificar Situacao da OC no SIDICOM
    on e : Exception do
    Begin
      DMBelShop.SQLC.Rollback(TD);

      OdirPanApres.Visible:=False;
      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      exit;
    End; // on e : Exception do
  End; // Try - Modificar Situacao da OC no SIDICOM

end;

procedure TFrmVerTransito.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=44   Then
   Clipboard.AsText:='';

end;

procedure TFrmVerTransito.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

end;

end.
