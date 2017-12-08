unit UFrmSelectEmpProcessamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinsdxStatusBarPainter, dxStatusBar, Grids, DBGrids, DBGridJul,
  StdCtrls, JvExStdCtrls, JvCheckBox, JvExControls, JvXPCore, JvXPButtons,
  ExtCtrls,
  Clipbrd; // PrintScreen
//  Último: Clipbrd;

type
  TFrmSelectEmpProcessamento = class(TForm)
    Panel1: TPanel;
    Panel13: TPanel;
    Bt_SelectEmpProcFechar: TJvXPButton;
    Bt_SelectEmpProcMarcaTodos: TJvXPButton;
    Bt_SelectEmpProcDesMarcaTodos: TJvXPButton;
    Gb_SelectEmpProc: TGroupBox;
    Dbg_SelectEmpProc: TDBGridJul;
    Sb_SelectEmpProc: TdxStatusBar;
    Bt_SelectEmpProcOK: TJvXPButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Pan_SelectEmpProcECommerce: TPanel;
    Ckb_SelectEmpProcECommerce: TJvCheckBox;
    procedure FormShow(Sender: TObject);
    procedure Dbg_SelectEmpProcDblClick(Sender: TObject);
    procedure Bt_SelectEmpProcFecharClick(Sender: TObject);
    procedure Bt_SelectEmpProcOKClick(Sender: TObject);
    procedure Bt_SelectEmpProcMarcaTodosClick(Sender: TObject);
    procedure Bt_SelectEmpProcDesMarcaTodosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Dbg_SelectEmpProcDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Ckb_SelectEmpProcECommerceClick(Sender: TObject);
  private
    { Private declarations }
  public
    bUsarMatriz: Boolean; // Se Seleciona Matriz como Ancora
    iNrEmpProc: Integer;
    sEmpProc: String; // Codigos das Empresas a Processar (01,02,06,11) ou (Todas as Lojas)

    { Public declarations }
  end;

var
  FrmSelectEmpProcessamento: TFrmSelectEmpProcessamento;

  bOK: Boolean;

implementation

uses UDMBelShop, DK_Procs1, UFrmBelShop;

{$R *.dfm}

procedure TFrmSelectEmpProcessamento.FormShow(Sender: TObject);
begin
  Screen.Cursor:=crSQLWait;


  If DMBelShop.CDS_EmpProcessa.Eof Then
  Begin
    Screen.Cursor:=crDefault;
    msg('Problema no SISTEMA !!'+cr+cr+'SEM Empresa a Listar !!','A');

    Bt_SelectEmpProcFecharClick(Self);
  End;

  if Not bUsarMatriz Then
   Bt_SelectEmpProcDesMarcaTodosClick(Self);

  Screen.Cursor:=crDefault;
end;

procedure TFrmSelectEmpProcessamento.Dbg_SelectEmpProcDblClick(Sender: TObject);
begin
  If (Pan_SelectEmpProcECommerce.Visible) and (Ckb_SelectEmpProcECommerce.Checked) Then
  Begin
    msg('Produtos E-Commerce'+cr+cr+'Somente 99 - CD','A');
    Exit;
  End;

  If (bUsarMatriz) and (DMBelShop.CDS_EmpProcessaTIP_EMP.AsString='M') Then
  Begin
    msg('Empresa BelShop_CD é Ancora de Calculos !!'+cr+cr+'Impossível Alterar !!','A');
    Dbg_SelectEmpProc.SetFocus;
    Exit;
  End;

  DMBelShop.CDS_EmpProcessa.Edit;
  If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then
   DMBelShop.CDS_EmpProcessaPROC.AsString:='Não'
  Else
   DMBelShop.CDS_EmpProcessaPROC.AsString:='SIM';
  DMBelShop.CDS_EmpProcessa.Post;
end;

procedure TFrmSelectEmpProcessamento.Bt_SelectEmpProcFecharClick(Sender: TObject);
begin
  bOK    :=False;

  Close;
end;

procedure TFrmSelectEmpProcessamento.Bt_SelectEmpProcOKClick(Sender: TObject);
Var
  b: Boolean;
begin
  // Verifica se Existe Empresa a Processar ====================================
  iNrEmpProc:=0;
  sEmpProc:='';
  b:=True;
  DMBelShop.CDS_EmpProcessa.First;
  DMBelShop.CDS_EmpProcessa.DisableControls;
  While Not DMBelShop.CDS_EmpProcessa.Eof do
  Begin
    Refresh;

    If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then
    Begin

      Inc(iNrEmpProc);

      If Trim(sEmpProc)='' Then
       sEmpProc:=DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString
      Else
       sEmpProc:=sEmpProc+','+DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString;
    End;

    If DMBelShop.CDS_EmpProcessaPROC.AsString='Não' Then
     b:=False;

    DMBelShop.CDS_EmpProcessa.Next;
  End; // While Not DMBelShop.CDS_EmpProcessa.Eof do
  DMBelShop.CDS_EmpProcessa.EnableControls;
  DMBelShop.CDS_EmpProcessa.First;

  If b Then
   sEmpProc:='Todas';

  // Verifica se Existe Empresa a Processar ====================================
  If iNrEmpProc=0 Then
  Begin
   Bt_SelectEmpProcFecharClick(Self);
   Exit;
  End;

  // Verifica se Somante Matriz ================================================
  If (bUsarMatriz) and (iNrEmpProc=1) and (Not Ckb_SelectEmpProcECommerce.Checked) Then
  Begin
    If msg('Deseja Calcular Somente'+cr+cr+'para a Empresa MPMS ??','C')=2 Then
    Begin
      Dbg_SelectEmpProc.SetFocus;
      Exit;
    End;
  End; // If (bUsarMatriz) and (iNrEmpProc=1) Then

  If Ckb_SelectEmpProcECommerce.Checked Then
  Begin
    If msg('Deseja Calcular Somente'+cr+cr+'Produtos para E-Commerce ??','C')=2 Then
    Begin
      Dbg_SelectEmpProc.SetFocus;
      Exit;
    End;
  End; // If (bUsarMatriz) and (iNrEmpProc=1) Then

  bOK:=True;

  Close;
end;

procedure TFrmSelectEmpProcessamento.Bt_SelectEmpProcMarcaTodosClick(Sender: TObject);
begin
  If (Pan_SelectEmpProcECommerce.Visible) and (Ckb_SelectEmpProcECommerce.Checked) and (DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString<>'99') Then
  Begin
    msg('Produtos E-Commerce'+cr+cr+'Somente 99 - CD','A');
    Exit;
  End;

  DMBelShop.CDS_EmpProcessa.DisableControls;
  DMBelShop.CDS_EmpProcessa.First;
  While Not DMBelShop.CDS_EmpProcessa.Eof do
  Begin
    Refresh;

    DMBelShop.CDS_EmpProcessa.Edit;
    DMBelShop.CDS_EmpProcessaPROC.AsString:='SIM';
    DMBelShop.CDS_EmpProcessa.Post;

    DMBelShop.CDS_EmpProcessa.Next;
  End;
  DMBelShop.CDS_EmpProcessa.EnableControls;
  DMBelShop.CDS_EmpProcessa.First;

end;

procedure TFrmSelectEmpProcessamento.Bt_SelectEmpProcDesMarcaTodosClick(Sender: TObject);
begin
  DMBelShop.CDS_EmpProcessa.First;
  DMBelShop.CDS_EmpProcessa.DisableControls;
  While Not DMBelShop.CDS_EmpProcessa.Eof do
  Begin
    Refresh;

    If bUsarMatriz Then
     Begin
       If DMBelShop.CDS_EmpProcessaTIP_EMP.AsString<>'M' Then
       Begin
         DMBelShop.CDS_EmpProcessa.Edit;
         DMBelShop.CDS_EmpProcessaPROC.AsString:='Não';
         DMBelShop.CDS_EmpProcessa.Post;
       End; // If DMBelShop.CDS_EmpProcessaTIP_EMP.AsString<>'M' Then
     End
    Else if sgCodLojaUnica=DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString Then
     Begin
       DMBelShop.CDS_EmpProcessa.Edit;
       DMBelShop.CDS_EmpProcessaPROC.AsString:='SIM';
       DMBelShop.CDS_EmpProcessa.Post;
     End
    Else  // If bUsarMatriz Then
     Begin
       DMBelShop.CDS_EmpProcessa.Edit;
       DMBelShop.CDS_EmpProcessaPROC.AsString:='Não';
       DMBelShop.CDS_EmpProcessa.Post;
     End; // If bUsarMatriz Then

    DMBelShop.CDS_EmpProcessa.Next;
  End; // While Not DMBelShop.CDS_EmpProcessa.Eof do
  DMBelShop.CDS_EmpProcessa.EnableControls;
  DMBelShop.CDS_EmpProcessa.First;

  If (Pan_SelectEmpProcECommerce.Visible) and (Ckb_SelectEmpProcECommerce.Checked)  Then
  Begin
    Ckb_SelectEmpProcECommerceClick(Self);
  End;

end;

procedure TFrmSelectEmpProcessamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sgOutrasEmpresa:='';
  sgEmpresaNao   :='';

  If Not bOK Then
   DMBelShop.CDS_EmpProcessa.Close;
end;

procedure TFrmSelectEmpProcessamento.Dbg_SelectEmpProcDrawColumnCell( Sender: TObject;
          const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) Then
  Begin
    if DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' then
     Dbg_SelectEmpProc.Canvas.Brush.Color:=clSkyBlue
    Else
     Dbg_SelectEmpProc.Canvas.Brush.Color:=$00EAEAFF;

    Dbg_SelectEmpProc.Canvas.FillRect(Rect);
    Dbg_SelectEmpProc.DefaultDrawDataCell(Rect,Column.Field,state);
  End;

  DMBelShop.CDS_EmpProcessaCOD_FILIAL.Alignment:=taCenter;
  DMBelShop.CDS_EmpProcessaCOD_LINX.Alignment:=taCenter;
  DMBelShop.CDS_EmpProcessaNUM_CNPJ.Alignment:=taCenter;
  DMBelShop.CDS_EmpProcessaDTA_INICIO_LINX.Alignment:=taCenter;
  DMBelShop.CDS_EmpProcessaDTA_INVENTARIO_LINX.Alignment:=taCenter;
end;

procedure TFrmSelectEmpProcessamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmSelectEmpProcessamento.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key=44   Then
   Clipboard.AsText:='';

end;

procedure TFrmSelectEmpProcessamento.FormCreate(Sender: TObject);
Var
  MySql: String;
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  Ckb_SelectEmpProcECommerce.Checked:=False;


         If bgSelectSoLinx Then
          Dbg_SelectEmpProc.Columns[1].Visible:=False;

  // Busca Dados das Lojs SIDICOM ==============================================
  If Not bgSelectSoLinx Then
  Begin
    // Acerta DBGrid ------------------------------------------------
    Dbg_SelectEmpProc.Columns[1].Visible:=True;

    MySql:=' Select'+
           ' Case e.TIP_EMP'+
           '   When ''M'' Then ''SIM'''+
           '   Else ''Não'''+
           ' End  PROC,'+
           ' e.COD_FILIAL, e.COD_LINX,';

           // Se Conexão Externa =================================================
           If (Not bgConexaoLocal) Then
            MySql:=
             MySql+' Case '+
                   '    When Trim(e.Endereco_IP_Externo)<>'''' Then'+
                   '       e.ENDERECO_IP_EXTERNO'+
                   '    Else'+
                   '       e.ENDERECO_IP'+
                   ' End ENDERECO_IP,';

           // Se Conexão Local ===================================================
           If  bgConexaoLocal Then
            MySql:=
             MySql+' e.ENDERECO_IP,';

           MySql:=
            MySql+' e.PASTA_BASE_DADOS, e.DES_BASE_DADOS, e.COD_EMP, e.RAZAO_SOCIAL,'+
                  ' e.TIP_EMP, e.DES_BAIRRO, e.DES_CIDADE, e.COD_UF, e.COD_CEP,'+

                  ' substring(e.NUM_CNPJ from 1 for 2) || ''.'' ||'+
                  ' substring(e.NUM_CNPJ from 3 for 3) || ''.'' ||'+
                  ' substring(e.NUM_CNPJ from 6 for 3) || ''/'' ||'+
                  ' substring(e.NUM_CNPJ from 9 for 4) || ''-'' ||'+
                  ' substring(e.NUM_CNPJ from 13 for 2) NUM_CNPJ,'+

                  ' e.INSCR_ESTADUAL, e.DES_ENDERECO, e.NUM_ENDERECO,'+
                  ' e.COMPL_ENDERECO, e.IND_ATIVO, e.USU_INCLUI, e.DTA_INCLUI,'+
                  ' e.USU_ALTERA, e.DTA_ALTERA, e.COD_LISTAPRE,'+
                  ' e.DTA_INICIO_LINX, e.DTA_INVENTARIO_LINX'+

                  ' From EMP_CONEXOES e'+

                  ' Where COALESCE(e.cod_emp, 0)>0';

                  If Trim(sgOutrasEmpresa)='' Then
                   MySql:=
                    MySql+' And e.Ind_Ativo=''SIM'''
                  Else
                   MySql:=
                    MySql+' And (e.Ind_Ativo=''SIM'' Or e.Cod_Filial in '+sgOutrasEmpresa+')';

                  If Trim(sgEmpresaNao)<>'' Then
                   MySql:=
                    MySql+' And e.Cod_Filial Not in '+sgEmpresaNao;

                   MySql:=
                    MySql+' Order by e.COD_FILIAL';
  End; // If Not bgSelectSoLinx Then

  // Busca Dados das Lojs Lix ==================================================
  If bgSelectSoLinx Then
  Begin
    // Acerta DBGrid ------------------------------------------------
    Dbg_SelectEmpProc.Columns[1].Visible:=False;

    MySql:=' Select'+
           ' ''Não'' PROC,'+
           ' coalesce(e.cod_filial,''00'') COD_FILIAL,'+
           ' l.empresa COD_LINX,'+
           ' cast(LPad('''',  30,'' '') as varchar(30))  ENDERECO_IP,'+
           ' cast(LPad('''', 100,'' '') as varchar(100)) PASTA_BASE_DADOS,'+
           ' cast(LPad('''', 100,'' '') as varchar(100)) DES_BASE_DADOS,'+
           ' cast(LPad('''',   6,'' '') as varchar(6))   COD_EMP,'+
           ' cast(RPad(l.nome_emp, 60,'' '') as varchar(60)) RAZAO_SOCIAL,'+
           ' NULL TIP_EMP,'+
           ' l.bairro_emp DES_BAIRRO,'+
           ' cast(RPad(l.cidade_emp, 60,'' '') as varchar(60)) DES_CIDADE,'+
           ' l.estado_emp COD_UF,'+
           ' l.cep_emp COD_CEP,'+

           ' substring(l.cnpj_emp from 1 for 2) || ''.'' ||'+
           ' substring(l.cnpj_emp from 3 for 3) || ''.'' ||'+
           ' substring(l.cnpj_emp from 6 for 3) || ''/'' ||'+
           ' substring(l.cnpj_emp from 9 for 4) || ''-'' ||'+
           ' substring(l.cnpj_emp from 13 for 2) NUM_CNPJ,'+

           ' l.inscricao_emp INSCR_ESTADUAL,'+
           ' l.endereco_emp DES_ENDERECO,'+
           ' Cast(l.num_emp as VarChar(30)) NUM_ENDERECO,'+
           ' l.complement_emp COMPL_ENDERECO,'+
           ' cast(LPad('''',   3,'' '') as varchar(3)) IND_ATIVO,'+
           ' 0 USU_INCLUI,'+
           ' current_timestamp DTA_INCLUI,'+
           ' 0 USU_ALTERA,'+
           ' current_timestamp DTA_ALTERA,'+
           ' cast(LPad('''',   4,'' '') as varchar(4)) COD_LISTAPRE,'+
           ' e.DTA_INICIO_LINX,'+
           ' e.DTA_INVENTARIO_LINX'+

           ' From LINXLOJAS l'+
           '      Left Join EMP_CONEXOES e on e.cod_linx=l.empresa'+
           ' Order by l.nome_emp';
  End; // If bgSelectSoLinx Then
  DMBelShop.CDS_EmpProcessa.Close;
  DMBelShop.SDS_EmpProcessa.CommandText:=MySql;
  DMBelShop.CDS_EmpProcessa.Open;

  If sgCodLojaUnica<>'' Then
  Begin
    Application.ShowMainForm:=False;

    DMBelShop.CDS_EmpProcessa.First;
    DMBelShop.CDS_EmpProcessa.DisableControls;
    While Not DMBelShop.CDS_EmpProcessa.Eof do
    Begin
      DMBelShop.CDS_EmpProcessa.Edit;

      DMBelShop.CDS_EmpProcessaPROC.AsString:='NAO';
      If DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString=sgCodLojaUnica Then
       DMBelShop.CDS_EmpProcessaPROC.AsString:='SIM';

      DMBelShop.CDS_EmpProcessa.Post;

      DMBelShop.CDS_EmpProcessa.Next;
    End; // While Not DMBelShop.CDS_EmpProcessa.Eof do
    DMBelShop.CDS_EmpProcessa.EnableControls;

    bOK:=True;
    DMBelShop.CDS_EmpProcessa.First;

    // Fecha o Form no OnCreate ================================================
    PostMessage(self.handle, WM_CLOSE, 0, 0);
  End; // If sgCodLojaUnica<>'' Then
end;

procedure TFrmSelectEmpProcessamento.Ckb_SelectEmpProcECommerceClick(Sender: TObject);
begin
  AcertaCkb_Style(Ckb_SelectEmpProcECommerce);

  If Ckb_SelectEmpProcECommerce.Checked Then
  Begin
    DMBelShop.CDS_EmpProcessa.First;
    DMBelShop.CDS_EmpProcessa.DisableControls;
    While Not DMBelShop.CDS_EmpProcessa.Eof do
    Begin
      Refresh;

      If DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString<>'99' Then
       Begin
         DMBelShop.CDS_EmpProcessa.Edit;
         DMBelShop.CDS_EmpProcessaPROC.AsString:='Não';
         DMBelShop.CDS_EmpProcessa.Post;
       End
      Else // If DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString<>'99' Then
       Begin
         DMBelShop.CDS_EmpProcessa.Edit;
         DMBelShop.CDS_EmpProcessaPROC.AsString:='SIM';
         DMBelShop.CDS_EmpProcessa.Post;
       End; // If DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString<>'99' Then

      DMBelShop.CDS_EmpProcessa.Next;
    End; // While Not DMBelShop.CDS_EmpProcessa.Eof do
    DMBelShop.CDS_EmpProcessa.EnableControls;
    DMBelShop.CDS_EmpProcessa.First;
  End; // If Ckb_SelectEmpProcECommerce.Checked Then
end;

end.
