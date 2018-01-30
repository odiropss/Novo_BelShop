unit UFrmAcessosUsuario;
{
  - Inclusão.Tag=1
  - Alteração.Tag=2
  - Exclusão.Tag=3
  - Salvar.Tag=4
}
interface

uses
  Windows, Forms, Messages, SysUtils, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, JvGradientCaption,
  ImgList, Controls, jpeg, dxStatusBar, Grids, DBGrids, DBGridJul,
  ComCtrls, TreeSeguranca, StdCtrls, Graphics, JvExControls, JvXPCore,
  JvXPButtons, ExtCtrls, Classes, DBXpress, StrUtils;
//  Último: StrUtils;

  { RETIRADOS - 15/09/2015
   DBCtrls, JvExStdCtrls, JvRadioButton, DB, DBClient, Mask;
  }


type
  TFrmAcessosUsuario = class(TForm)
    ImageList1: TImageList;
    CorCaptionForm: TJvGradientCaption;
    PC_Principal: TPageControl;
    Ts_AcessoGerenciador: TTabSheet;
    Ts_AcessoSidicom: TTabSheet;
    Pan_Usuario: TPanel;
    Gb_Usuario: TGroupBox;
    EdtDescUsuario: TEdit;
    Bt_BuscaUsuario: TJvXPButton;
    Gb_Menu: TGroupBox;
    Cbx_Menu: TComboBox;
    Pan_Acessos: TPanel;
    TreeSeguranca: TTreeSeguranca;
    Panel10: TPanel;
    Bt_Salvar: TJvXPButton;
    Bt_Abandonar: TJvXPButton;
    OdirPanApres: TPanel;
    PC_SidicomPermissoes: TPageControl;
    Ts_SidicomPermissoesTransf: TTabSheet;
    Ts_SidicomPermissoesVerifica: TTabSheet;
    Dbg_SidicomPermissoesVerifica: TDBGrid;
    Dbg_SidicomUsuarios: TDBGridJul;
    Pan_SidicomVerificaNomes: TPanel;
    Bt_SidicomPermissoesVerifica: TJvXPButton;
    Bt_SidicomPermissoesSalvaExcel: TJvXPButton;
    Pan_SidicomTransferencias: TPanel;
    Bt_Fechar: TJvXPButton;
    Bt_SidicomPermissoesSair: TJvXPButton;
    Sb_SelectEmpProc2: TdxStatusBar;
    EdtSidicomLocalizaUsuario: TEdit;
    Bt_SidicomPermissoesLocalizaUsuario: TJvXPButton;
    Dbg_SidicomUsuaLojas: TDBGrid;
    Bt_SidicomPermissoesMarcar: TJvXPButton;
    Bt_SidicomPermissoesDesMarcar: TJvXPButton;
    JvXPButton1: TJvXPButton;
    Memo1: TMemo;
    procedure Bt_BuscaUsuarioClick(Sender: TObject);
    procedure Bt_FecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Bt_SalvarClick(Sender: TObject);

    // Odir ====================================================================

    // CONTROLE DE ACSSOS GERENCIADOR BELSHOP //////////////////////////////////
    // Habilito e Desabilito os Botoes e Outros Componentes Visuais Necessarios
    procedure HabilitaDesabilita;
    ////////////////////////////////////////////////////////////////////////////

    // DIVERSOS ////////////////////////////////////////////////////////////////
    procedure AcertaBotoes;
    ////////////////////////////////////////////////////////////////////////////

    // SIDICOM /////////////////////////////////////////////////////////////////
    Function BuscaUsuariosSidicom: Boolean; // Busca Usuarios SIDICOM

    procedure AlteraUsuarioEnvio(sTp: String); // Altera Usuario para Envio
                              // sTp = (DC) Altera Ind_Enviar (DuploClick )
                              // sTp = (F2) Altera IND_ALTERASENHA
                              // sTp = (F3) Altera IND_EXCLUIR
                              // sTp = (MA) Altera Ind_Enviar Todos para Marcado
                              // sTp = (DM) Altera Ind_Enviar Todos para DesMarcado
    ////////////////////////////////////////////////////////////////////////////

    // Odir ====================================================================

    procedure Bt_AbandonarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure TreeSegurancaMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Cbx_MenuChange(Sender: TObject);
    procedure Cbx_MenuEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PC_PrincipalChange(Sender: TObject);
    procedure PC_SidicomPermissoesChange(Sender: TObject);
    procedure Bt_SidicomPermissoesVerificaClick(Sender: TObject);
    procedure Bt_SidicomPermissoesSalvaExcelClick(Sender: TObject);
    procedure Dbg_SidicomUsuariosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_SidicomUsuariosDblClick(Sender: TObject);
    procedure Dbg_SidicomUsuariosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_SidicomPermissoesLocalizaUsuarioClick(Sender: TObject);
    procedure Dbg_SidicomUsuaLojasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Bt_SidicomPermissoesMarcarClick(Sender: TObject);
    procedure JvXPButton1Click(Sender: TObject);

  private
    { Private declarations }

    // Inibir Roalgem do Mouse
    procedure OnMessageOwn(var Msg: TMsg; var Handled: Boolean);
  public
    { Public declarations }
  end;

var
  FrmAcessosUsuario: TFrmAcessosUsuario;

  TD: TTransactionDesc;

  bgAdmin: Boolean;
  sgDesLogin: String;

  bgSairCaixa: Boolean;

implementation

uses DK_Procs1, UDMBelShop, UPesquisa, UFrmBelShop, UFrmBancoExtratos,
  UDMSidicom, UFrmSelectEmpProcessamento, UFrmSolicitacoes;

{$R *.dfm}

// Odir - INICIO ///////////////////////////////////////////////////////////////

// SIDICOM - Altera Usuario para Envio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmAcessosUsuario.AlteraUsuarioEnvio(sTp: String);
Var
  MySql, sSimNao: String;
Begin
  // sTp = (DC) Altera Ind_Enviar (DuploClick )
  // sTp = (F2) Altera IND_ALTERASENHA
  // sTp = (F3) Altera IND_EXCLUIR
  // sTp = (MA) Altera Ind_Enviar Todos para Marcado
  // sTp = (DM) Altera Ind_Enviar Todos para DesMarcado

  // Usuarios a Ser Excluído ===================================================
  If (DMSidicom.CDS_UsuaSidicomIND_EXCLUIR.AsString='SIM') and (sTp='F2') Then
  Begin
    msg('Alteração nâo Permitida !!'+cr+cr+'Usuário Será Excluído nas Lojas !!','A');
    Exit;
  end; // If DMSidicom.CDS_UsuaSidicomIND_PENDENTE.AsString='SIM' Then

  // Usuarios Excluido =========================================================
  If DMSidicom.CDS_UsuaSidicomIND_EXCLUIDO.AsString='SIM' Then
  Begin
    if Pos(sTp, 'MA DM') = 0 then
      msg('Alteração nâo Permitida !!'+cr+cr+'Usuário Já Excluído nas Lojas !!','A');

    Exit;
  end; // If DMSidicom.CDS_UsuaSidicomIND_PENDENTE.AsString='SIM' Then

  // Altera Marcar ou DesMarca =================================================
  If Pos(sTp, 'MA DM')<>0 then
  Begin
    If (sTp='MA') And (DMSidicom.CDS_UsuaSidicomIND_ENVIAR.AsString='SIM') Then
     Exit;

    If (sTp='DM') And (DMSidicom.CDS_UsuaSidicomIND_ENVIAR.AsString='NAO') Then
     Exit;
  End; // If Pos(sTp, 'MA DM')<>0 then

  // Verifica se Transação esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  DMSidicom.CDS_UsuaSidicom.DisableControls;

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    // =========================================================================
    // Atualiza Usuarios =======================================================
    // =========================================================================
    DMSidicom.CDS_UsuaSidicom.Edit;

    MySql:=' UPDATE USUARIOS_SIDICOM us';

           sSimNao:='SIM';

           // Altera Ind_Enviar (DuploClick )
           If sTp='DC' Then
           Begin
             If DMSidicom.CDS_UsuaSidicomIND_ENVIAR.AsString='SIM' Then
              sSimNao:='NAO';

             MySql:=MySql+' SET us.ind_enviar='+QuotedStr(sSimNao);
             DMSidicom.CDS_UsuaSidicomIND_ENVIAR.AsString:=sSimNao;
           End;

           // Altera IND_ALTERASENHA
           If sTp='F2' Then
           Begin
             If DMSidicom.CDS_UsuaSidicomIND_ALTERASENHA.AsString='SIM' Then
              sSimNao:='NAO';

             MySql:=MySql+' SET us.ind_alterasenha='+QuotedStr(sSimNao);
             DMSidicom.CDS_UsuaSidicomIND_ALTERASENHA.AsString:=sSimNao;
           End;

            // Altera IND_EXCLUIR
           If sTp='F3' Then
           Begin
             If DMSidicom.CDS_UsuaSidicomIND_EXCLUIR.AsString='SIM' Then
              sSimNao:='NAO';

             MySql:=MySql+' SET us.ind_excluir='+QuotedStr(sSimNao);

             If sSimNao='SIM' Then
             Begin
               MySql:=MySql+', us.ind_alterasenha=''NAO''';
               DMSidicom.CDS_UsuaSidicomIND_ALTERASENHA.AsString:='NAO';
             End;
             DMSidicom.CDS_UsuaSidicomIND_EXCLUIR.AsString:=sSimNao;
           End;

           // Marcar Todos para Envio
           If sTp='MA' Then
           Begin
             sSimNao:='SIM';
             MySql:=MySql+' SET us.ind_enviar='+QuotedStr(sSimNao);
             DMSidicom.CDS_UsuaSidicomIND_ENVIAR.AsString:=sSimNao;
           End;

           // DesMarcar Todos para Envio
           If sTp='DM' Then
           Begin
             sSimNao:='NAO';
             MySql:=MySql+' SET us.ind_enviar='+QuotedStr(sSimNao);
             DMSidicom.CDS_UsuaSidicomIND_ENVIAR.AsString:=sSimNao;
           End;

           // Marca Enviar quando IND_ALTERASENHA e ou IND_EXCLUIR
           If (Pos(sTp, 'F2 F3')<>0) and (sSimNao='SIM') Then
           Begin
             MySql:=MySql+', us.ind_enviar='+QuotedStr(sSimNao);
             DMSidicom.CDS_UsuaSidicomIND_ENVIAR.AsString:=sSimNao;
           End;

           MySql:=MySql+', us.dta_inclui=CURRENT_TIMESTAMP'+
                        ', us.USU_INCLUI='+QuotedStr(Cod_Usuario)+
                        ' WHERE us.cod_usuario='+QuotedStr(DMSidicom.CDS_UsuaSidicomCOD_USUARIO.AsString);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Acerta Envio para Loja ==================================================
    sSimNao:=DMSidicom.CDS_UsuaSidicomIND_ENVIAR.AsString;

    DMSidicom.CDS_LojasSidicom.First;
    DMSidicom.CDS_LojasSidicom.DisableControls;
    While Not DMSidicom.CDS_LojasSidicom.Eof do
    Begin
      If DMSidicom.CDS_LojasSidicomIND_PENDENTE.AsString='NAO' Then
      Begin
        DMSidicom.CDS_LojasSidicom.Edit;

        // Altera Loja para IND_ENVIAR e IND_ENVIADO ===========================
        If (DMSidicom.CDS_LojasSidicomIND_PENDENTE.AsString='NAO') and (DMSidicom.CDS_LojasSidicomIND_ENVIAR.AsString<>sSimNao)Then
        Begin
          DMSidicom.CDS_LojasSidicomIND_ENVIADO.AsString:=sSimNao;
          If sSimNao='SIM' Then DMSidicom.CDS_LojasSidicomIND_ENVIADO.AsString:='NAO';
          If sSimNao='NAO' Then DMSidicom.CDS_LojasSidicomIND_ENVIADO.AsString:='SIM';

          DMSidicom.CDS_LojasSidicomIND_ENVIAR.AsString:=sSimNao;

          MySql:=' UPDATE USUARIOS_SIDICOM_LOJAS ul'+
                 ' SET ul.ind_enviado='+QuotedStr(DMSidicom.CDS_LojasSidicomIND_ENVIADO.AsString)+
                 ',    ul.ind_enviar='+QuotedStr(DMSidicom.CDS_LojasSidicomIND_ENVIAR.AsString)+
                 ' WHERE ul.cod_usuario='+QuotedStr(DMSidicom.CDS_LojasSidicomCOD_USUARIO.AsString)+
                 ' AND   ul.cod_loja='+QuotedStr(DMSidicom.CDS_LojasSidicomCOD_LOJA.AsString);
          DMBelShop.SQLC.Execute(MySql,nil,nil);
        End; // If (DMSidicom.CDS_LojasSidicomIND_PENDENTE.AsString='NAO') Then
      End; // If DMSidicom.CDS_LojasSidicomIND_PENDENTE.AsString='NAO' Then

      DMSidicom.CDS_LojasSidicom.Next;
    End; // While Not DMSidicom.CDS_LojasSidicom.Eof do
    DMSidicom.CDS_LojasSidicom.EnableControls;
    DMSidicom.CDS_LojasSidicom.First;

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
  DMSidicom.CDS_UsuaSidicom.EnableControls;

  If (Pos(sTp, 'F2 F3')<>0) And (DMSidicom.CDS_UsuaSidicomIND_ENVIAR.AsString='SIM') And
     (DMSidicom.CDS_UsuaSidicomIND_ALTERASENHA.AsString='NAO') and (DMSidicom.CDS_UsuaSidicomIND_EXCLUIR.AsString='NAO') Then
  Begin
    If msg('Deseja DESMARCAR o ENVIO ?','C')=1 Then
     Dbg_SidicomUsuariosDblClick(Self);
  End;

End; // SIDICOM - Altera Usuario para Envio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


// SIDICOM - Busca Usuarios SIDICOM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmAcessosUsuario.BuscaUsuariosSidicom: Boolean;
Var
  MySql, sCodUsuaSid: String;
Begin

  Result:=False;

  OdirPanApres.Caption:='AGUARDE !! Atualizando Usuários do CD !! ';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmAcessosUsuario.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmAcessosUsuario.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Visible:=True;
  Refresh;

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

    // Reabre Usuarios Sidicom na BelShop
    DMSidicom.CDS_UsuaSidicom.Close;
    DMSidicom.CDS_UsuaSidicom.Open;

    // =========================================================================
    // Atualiza Usuarios Sidicom na MPMS =======================================
    // =========================================================================
    MySql:=' SELECT u.codusuario, u.nomeusuario,'+
           ' CASE u.ativo_sn'+
           '    WHEN ''S'' THEN ''SIM'' ELSE ''NAO'''+
           ' End ativo_sn'+

           ' FROM USUARIO u'+
           ' ORDER BY 2';
    DMSidicom.IBQ_CDBusca.Close;
    DMSidicom.IBQ_CDBusca.SQL.Clear;
    DMSidicom.IBQ_CDBusca.SQL.Add(MySql);
    DMSidicom.IBQ_CDBusca.Open;

    While Not DMSidicom.IBQ_CDBusca.Eof do
    Begin
      Refresh;

      sCodUsuaSid:=Trim(DMSidicom.IBQ_CDBusca.FieldByName('codusuario').AsString);

      If Not DMSidicom.CDS_UsuaSidicom.Locate('COD_USUARIO',sCodUsuaSid,[]) Then
       Begin
         MySql:=' INSERT INTO USUARIOS_SIDICOM ('+
                ' COD_USUARIO, DES_USUARIO, IND_ATIVO)'+

                'Values ('+
                QuotedStr(sCodUsuaSid)+', '+
                QuotedStr(Trim(DMSidicom.IBQ_CDBusca.FieldByName('nomeusuario').AsString))+', '+
                QuotedStr(DMSidicom.IBQ_CDBusca.FieldByName('ativo_sn').AsString)+')';
       end
      Else // If Not DMSidicom.CDS_UsuaSidicom.Locate('DES_USUARIO',sNome,[]) Then
       Begin
         MySql:=' UPDATE USUARIOS_SIDICOM us'+
                ' SET us.IND_ATIVO='+QuotedStr(DMSidicom.IBQ_CDBusca.FieldByName('ativo_sn').AsString)+
                ' WHERE us.COD_USUARIO='+QuotedStr(sCodUsuaSid);
       End; // If Not DMSidicom.CDS_UsuaSidicom.Locate('DES_USUARIO',sNome,[]) Then
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      DMSidicom.IBQ_CDBusca.Next;
    end; // While Not DMSidicom.IBQ_CDBusca.Eof do
    DMSidicom.IBQ_CDBusca.Close;

    // =========================================================================
    // Atualiza Lojas de Usuarios ==============================================
    // =========================================================================
    MySql:=' SELECT us.cod_usuario'+
           ' FROM USUARIOS_SIDICOM us'+
           ' WHERE COALESCE(us.ind_excluido,''NAO'')=''NAO'''+
           ' ORDER BY us.cod_usuario';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    While not DMBelShop.CDS_Busca.Eof do
    Begin
      MySql:=' INSERT INTO USUARIOS_SIDICOM_LOJAS (COD_USUARIO, COD_LOJA, USU_INCLUI)'+
             ' SELECT '+
             QuotedStr(DMBelShop.CDS_Busca.FieldByName('cod_usuario').AsString)+' COD_USUARIO,'+
             ' em.cod_filial COD_LOJA, 0 USU_INCLUI'+

             ' FROM EMP_CONEXOES em'+
             ' WHERE NOT EXISTS (SELECT 1'+
             '                   FROM USUARIOS_SIDICOM_LOJAS ul'+
             '                   WHERE em.cod_filial=ul.cod_loja'+
             '                   AND ul.cod_usuario='+
                                     QuotedStr(DMBelShop.CDS_Busca.FieldByName('cod_usuario').AsString)+')'+
             ' AND EM.cod_filial<>''99'''+
             ' ORDER BY em.cod_filial';
      DMBelShop.SQLC.Execute(MySql,nil, nil);

      DMBelShop.CDS_Busca.Next;
    End; // While not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    Result:=True;

    OdirPanApres.Visible:=False;
    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;

  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      OdirPanApres.Visible:=False;
      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Exit;
    End; // on e : Exception do
  End; // Try

  Screen.Cursor:=crDefault;

End;

// DIVERSOS - Acerta Botoes na Troca de TABSHEET >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmAcessosUsuario.AcertaBotoes;
Begin

  If PC_SidicomPermissoes.ActivePage=Ts_SidicomPermissoesTransf Then
  Begin
    Bt_SidicomPermissoesSair.Parent:=Pan_SidicomTransferencias;
  End;

  If PC_SidicomPermissoes.ActivePage=Ts_SidicomPermissoesVerifica Then
  Begin
    Bt_SidicomPermissoesSair.Parent:=Pan_SidicomVerificaNomes;
  End;

End; // DIVERSOS - Acerta Botoes na Troca de TABSHEET >>>>>>>>>>>>>>>>>>>>>>>>>>

// Inibir Rolagem do Mouse >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmAcessosUsuario.OnMessageOwn(var Msg: TMsg; var Handled: Boolean) ;
var
  i: SmallInt;
begin
   if Msg.message = WM_MOUSEWHEEL then
   begin
     Msg.message := WM_KEYDOWN;
     Msg.lParam := 0;
     i := HiWord(Msg.wParam) ;
     if i > 0 then
       Msg.wParam := VK_UP
     else
       Msg.wParam := VK_DOWN;
     Handled := False;
   end;
end; // Inibir Rolagem do Mouse >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Habilito e Desabilito os Botoes e Outros Componentes Visuais Necessarios >>>>
procedure TFrmAcessosUsuario.HabilitaDesabilita;
begin
   TreeSeguranca.Enabled  := not TreeSeguranca.Enabled;
   Bt_Salvar.Enabled      := not Bt_Salvar.Enabled;
   Bt_Abandonar.Enabled   := not Bt_Abandonar.Enabled;
   Bt_BuscaUsuario.Enabled:= not Bt_BuscaUsuario.Enabled;

   If Bt_BuscaUsuario.Enabled Then
    EdtDescUsuario.Clear;
end; // Habilito e Desabilito os Botoes e Outros Componentes Visuais Necessarios
// Odir - FIM //////////////////////////////////////////////////////////////////

procedure TFrmAcessosUsuario.Bt_BuscaUsuarioClick(Sender: TObject);
Var
  MySql: String;
  sIndAdmin: String;
begin
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtDescUsuario.Clear;
  sgDesLogin:='';

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:='Select Des_Usuario, Cod_Usuario, Ind_Admin, Des_Login'+
         ' From PS_Usuarios'+
         ' Where Ind_Ativo=''SIM'''+
         ' And Cod_Usuario>1'+
         ' Order by Des_Usuario';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If DMBelShop.CDS_Pesquisa.Eof Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Usuario a Listar !!','A');
    EdtDescUsuario.SetFocus;
    FrmPesquisa.Free;
    FrmPesquisa:=nil;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Des_Usuario';
  FrmPesquisa.Campo_Codigo:='Cod_Usuario';
  FrmPesquisa.Campo_Descricao:='Des_Usuario';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // Campos Qualquer de Retorno ================================================
  // Variavel de Entrada  - Variavel de Retorno
  // Campo_Retorno1       - Retorno1
  // Campo_Retorno2       - Retorno2
  // Campo_Retorno3       - Retorno3
  FrmPesquisa.Campo_Retorno1:='Des_Login';
  FrmPesquisa.Campo_Retorno2:='Ind_Admin';
  FrmPesquisa.Campo_Retorno3:='';

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtDescUsuario.Text:=FrmPesquisa.EdtDescricao.Text;
     sgDesLogin:=FrmPesquisa.Retorno1;
     sIndAdmin:=FrmPesquisa.Retorno2;
   End
  Else
   Begin
     EdtDescUsuario.Clear;
     Bt_BuscaUsuario.SetFocus;
     DMBelShop.CDS_Pesquisa.Close;
     FrmPesquisa.Free;
     FrmPesquisa:=nil;
     Exit;
   End;

  // Busca Permissoes ==========================================================
  // Passa o Codigo do Usuario para o Componente =============================
  TreeSeguranca.pUsuario := Trim(sgDesLogin);

  // Ativo a Arvore de Menu ==================================================
  TreeSeguranca.AutoExpand:=True;
  TreeSeguranca.AtivaTree;
  TreeSeguranca.AutoExpand:=False;

  HabilitaDesabilita;
  TreeSeguranca.SetFocus;
  Screen.Cursor:=crDefault;

  DMBelShop.CDS_Pesquisa.Close;
  FrmPesquisa.Free;
  FrmPesquisa:=nil;

  If sIndAdmin='SIM' Then
  Begin
    msg('Este Usuário é Administrador do Sistema'+cr+cr+'Não a Necessidade de Permissões !!','A');
    Bt_AbandonarClick(Self);
  End;
end;

procedure TFrmAcessosUsuario.Bt_FecharClick(Sender: TObject);
begin
  DMSidicom.FechaTudoSidicom;

  bgSairCaixa:=True;
  Close;
end;

procedure TFrmAcessosUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  If Bt_Salvar.Enabled Then
  Begin
    msg('Favor <Salvar> Ou <Abandonar>'+cr+cr+'Antes de Fechar...','A');
    Action := caNone;
    Exit;
  End;


  if bgSairCaixa Then
   Begin
     Action := caHide;// caFree;

     DMSidicom.FechaTudoSidicom;
   End
  Else
   Begin
     msg('Para Sair Tecle no Botão <Fechar>...','A');
     Action := caNone;
   End;

end;

procedure TFrmAcessosUsuario.Bt_SalvarClick(Sender: TObject);
Var
  MySql: String;
begin

  // Exclui Permissões Anterior ================================================
  MySql:=' DELETE FROM SEGURANCA S'+
         ' WHERE s.usuario='+QuotedStr(Trim(sgDesLogin))+
         ' AND s.TIP_MENU='+QuotedStr(Cbx_Menu.Text);
  DMBelShop.SQLC.Execute(MySql,nil,nil);

  // Grava os Itens da Grade Marcada na Tabela
  TreeSeguranca.Salvar;

  // Atualiza Nome do Menu Atual ===============================================
  MySql:=' Update SEGURANCA S'+
         ' Set TIP_MENU='+QuotedStr(Cbx_Menu.Text)+
         ' WHERE s.usuario='+QuotedStr(Trim(sgDesLogin))+
         ' AND s.TIP_MENU is NUll';
  DMBelShop.SQLC.Execute(MySql,nil,nil);

  HabilitaDesabilita;
  TreeSeguranca.Items.Clear;

end;

procedure TFrmAcessosUsuario.Bt_AbandonarClick(Sender: TObject);
begin
  HabilitaDesabilita;
  TreeSeguranca.Items.Clear;
  Bt_BuscaUsuario.SetFocus;
end;

procedure TFrmAcessosUsuario.FormKeyPress(Sender: TObject; var Key: Char);
begin

  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmAcessosUsuario.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  Application.OnMessage := OnMessageOwn;

end;

procedure TFrmAcessosUsuario.TreeSegurancaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  Application.OnMessage := OnMessageOwn;

end;

procedure TFrmAcessosUsuario.Cbx_MenuChange(Sender: TObject);
Var
  MySql: String;
  i: Integer;
  sNomeForm: String;
begin
  If Bt_Salvar.Enabled Then
  Begin
    msg('Favor <Salvar> Ou <Abandonar>'+cr+cr+'Antes de Trocar o MENU...','A');
    Exit;
  End;

  // indica em qual formulario esta o menu principal
  MySql:=' SELECT m.cod_menu, m.des_menu, m.des_form'+
         ' FROM per_menus m'+
         ' WHERE m.Des_Menu='+QuotedStr(Cbx_Menu.Text);
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  sNomeForm:=DMBelShop.CDS_BuscaRapida.FieldByName('Des_Form').AsString;
  DMBelShop.CDS_BuscaRapida.Close;

  For i:=0 to application.ComponentCount-1 Do
  Begin
    if application.Components[i] is TForm then
    Begin
     If (application.Components[i] as TForm).Name=sNomeForm Then
     Begin
       TreeSeguranca.Active:=False;
       TreeSeguranca.pFormulario := (application.Components[i] as TForm);
       TreeSeguranca.Active:=True;
       Break;
     End;
    End;
  End; // For i:=0 to application.ComponentCount-1 Do

end;

procedure TFrmAcessosUsuario.Cbx_MenuEnter(Sender: TObject);
begin
  If Bt_Salvar.Enabled Then
  Begin
    msg('Favor <Salvar> Ou <Abandonar>'+cr+cr+'Antes de Trocar o MENU...','A');
    Bt_Salvar.SetFocus;
    Exit;
  End;

end;

procedure TFrmAcessosUsuario.FormShow(Sender: TObject);
begin
  // Cor Form
  CorCaptionForm.Active:=False;
  CorCaptionForm.Active:=True;

  bgSairCaixa:=False;

  PC_PrincipalChange(Self);

end;

procedure TFrmAcessosUsuario.PC_PrincipalChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_Principal);

  If PC_Principal.ActivePage=Ts_AcessoSidicom Then
  Begin
    // Acerta Botao de Fechar
    AcertaBotoes;

    // Busca Usuarios SIDICOM ==================================================
    If Not BuscaUsuariosSidicom Then
    Begin
      msg('Erro Ao Localiza Usuários no CD','A');

      DMSidicom.FechaTudoSidicom;
      bgSairCaixa:=True;
      PostMessage(self.handle, WM_CLOSE, 0, 0);
      Exit;
    End;

    // Reabre Usuarios Sidicom na BelShop
    DMSidicom.CDS_UsuaSidicom.Close;
    DMSidicom.CDS_UsuaSidicom.Open;

    DMSidicom.CDS_LojasSidicom.Close;
    DMSidicom.CDS_LojasSidicom.Open;

    Dbg_SidicomUsuarios.SetFocus;
  End;

end;

procedure TFrmAcessosUsuario.PC_SidicomPermissoesChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_SidicomPermissoes);

  // Acerta Botao de Fechar
  AcertaBotoes;

end;

procedure TFrmAcessosUsuario.Bt_SidicomPermissoesVerificaClick(
  Sender: TObject);
Var
  MySql: String;
  bSiga: Boolean;
  i: Integer;
  sCampo: String;
begin
  If DMSidicom.CDS_Verifica.Active Then
   DMSidicom.CDS_Verifica.Close;

  DMSidicom.CDS_Verifica.CreateDataSet;
  DMSidicom.CDS_Verifica.IndexFieldNames:='Nome';
  DMSidicom.CDS_Verifica.Open;

  // Seleciona Empresa =========================================================
  sgOutrasEmpresa:='(99)'; //ou '(50)';
  FrmSelectEmpProcessamento:=TFrmSelectEmpProcessamento.Create(Self);
  FrmSelectEmpProcessamento.bUsarMatriz:=False;
  FrmSelectEmpProcessamento.iNrEmpProc:=0;
  FrmSelectEmpProcessamento.ShowModal;

  // Verifica se Existe Empresa a Processar ====================================
  If FrmSelectEmpProcessamento.iNrEmpProc=0 Then
  Begin
    FrmSelectEmpProcessamento.Free;
    FrmSelectEmpProcessamento:=nil;
    Exit;
  End; // If FrmSelectEmpProcessamento.iNrEmpProc=1 Then
  FrmSelectEmpProcessamento.Free;
  FrmSelectEmpProcessamento:=nil;

  // Inicia Processamento ======================================================
  DMBelShop.CDS_EmpProcessa.First;
  While Not DMBelShop.CDS_EmpProcessa.Eof do
  Begin
    Refresh;

    if DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then
    Begin
      sgCodEmp:=DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString;
      sgDesLoja:=DMBelShop.CDS_EmpProcessaRAZAO_SOCIAL.AsString;
      sCampo:='Bel_'+sgCodEmp;

      // Apresentacao ==========================================================
      OdirPanApres.Caption:='AGUARDE !! Localizando Usuarios da Loja: '+sgCodEmp+' - '+sgDesLoja;
      OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
      OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmAcessosUsuario.Width-OdirPanApres.Width)/2));
      OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmAcessosUsuario.Height-OdirPanApres.Height)/2))-20;
      OdirPanApres.Visible:=True;
      Refresh;

      // Monta Sql =============================================================
      MySql:=' SELECT u.codusuario, u.nomeusuario, u.ativo_sn'+
             ' FROM USUARIO u'+
             ' ORDER BY 2';

      // Conecta Empresa =======================================================
      If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then
       Begin
         bSiga:=True;
       End
      Else
       Begin
         Refresh;
         bSiga:=False;
       End; // If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then

      // Inicia Processamento ==================================================
      If bSiga Then // Empresa Conectada
      Begin
        // Cria Query da Empresa ------------------------------------
        FrmBelShop.CriaQueryIB('IBDB_'+sgCodEmp,'IBT_'+sgCodEmp,FrmBelShop.IBQ_ConsultaFilial, True, True);

        // Busca Comprovantes ---------------------------------------
        FrmBelShop.IBQ_ConsultaFilial.SQL.Clear;
        FrmBelShop.IBQ_ConsultaFilial.SQL.Add(MySql);

        // Abre Query -----------------------------------------------
        i:=0;
        bSiga:=False;
        While Not bSiga do
        Begin
          Try
            FrmBelShop.IBQ_ConsultaFilial.Open;
            bSiga:=True;
          Except
            Inc(i);
          End; // Try

          If i>10 Then
          Begin
            If sgLojasNConectadas='' Then
             sgLojasNConectadas:='Bel_'+DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString
            Else If Not AnsiContainsStr(sgLojasNConectadas, 'Bel_'+DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString) then
             sgLojasNConectadas:=sgLojasNConectadas+', Bel_'+DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString;

            Break;
          End; // If i>10 Then
        End; // While Not bSiga do

        // Processamento =======================================================
        If bSiga Then // Query Executada
        Begin
          // Monta Transacao ===================================================
          TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
          TD.IsolationLevel:=xilREADCOMMITTED;
          DMBelShop.SQLC.StartTransaction(TD);
          Try
            Screen.Cursor:=crAppStart;
            DateSeparator:='.';
            DecimalSeparator:='.';

            While Not FrmBelShop.IBQ_ConsultaFilial.Eof do
            Begin
              Refresh;

              If DMSidicom.CDS_Verifica.Locate('Nome',Trim(FrmBelShop.IBQ_ConsultaFilial.FieldByName('nomeusuario').AsString),[]) Then
               Begin
                 DMSidicom.CDS_Verifica.Edit;
                 DMSidicom.CDS_Verifica.FieldByName(sCampo).AsString:=Trim(FrmBelShop.IBQ_ConsultaFilial.FieldByName('codusuario').AsString)+
                                                    ' (Ativo='+Trim(FrmBelShop.IBQ_ConsultaFilial.FieldByName('ativo_sn').AsString)+')';
                 DMSidicom.CDS_Verifica.Post;
               End
              Else
               Begin
                 DMSidicom.CDS_Verifica.Insert;
                 DMSidicom.CDS_Verifica.FieldByName('Nome').AsString:=Trim(FrmBelShop.IBQ_ConsultaFilial.FieldByName('nomeusuario').AsString);
                 DMSidicom.CDS_Verifica.FieldByName(sCampo).AsString:=Trim(FrmBelShop.IBQ_ConsultaFilial.FieldByName('codusuario').AsString)+
                                                    ' (Ativo='+Trim(FrmBelShop.IBQ_ConsultaFilial.FieldByName('ativo_sn').AsString)+')';
                 DMSidicom.CDS_Verifica.Post;
               End;

              FrmBelShop.IBQ_ConsultaFilial.Next;
            End; // While Not FrmBelShop.IBQ_ConsultaFilial.Eof do
            FrmBelShop.IBQ_ConsultaFilial.Close;

            // Fecha Transacao =================================================
            DMBelShop.SQLC.Commit(TD);

            DateSeparator:='/';
            DecimalSeparator:=',';
            Screen.Cursor:=crDefault;

          Except
            on e : Exception do
            Begin
              DMBelShop.SQLC.Rollback(TD);

              OdirPanApres.Visible:=False;

              DateSeparator:='/';
              DecimalSeparator:=',';
              Screen.Cursor:=crDefault;

              MessageBox(Handle, pChar(sgCodEmp+#13+e.message), 'Erro', MB_ICONERROR);
            End; // on e : Exception do
          End; // Try

        End; // If bSiga Then // Query Executada
      End; // If bSiga Then // Empresa Conectada

      // Fecha Conexão =========================================================
      ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F');

    End; // if DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then

    DMBelShop.CDS_EmpProcessa.Next;
  End; // While Not DMBelShop.CDS_EmpProcessa.Eof do

  OdirPanApres.Visible:=False;

  If sgLojasNConectadas<>'' Then
   msg('Lojas Não Conectadas: '+cr+cr+sgLojasNConectadas,'A');

  msg('Verificação Efetuada com SUCESSO !!','A');


end;

procedure TFrmAcessosUsuario.Bt_SidicomPermissoesSalvaExcelClick(
  Sender: TObject);
begin
 If DMSidicom.CDS_Verifica.IsEmpty Then
  Exit;

  ExportDBGridExcel(True, Dbg_SidicomPermissoesVerifica, FrmAcessosUsuario);
  Dbg_SidicomPermissoesVerifica.SetFocus;

end;

procedure TFrmAcessosUsuario.Dbg_SidicomUsuariosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  // Cor da Linha IND_ENVIAR ===================================================
  if not (gdSelected in State) Then
  Begin
    if DMSidicom.CDS_UsuaSidicomIND_ENVIAR.AsString='SIM' Then
     Dbg_SidicomUsuarios.Canvas.Brush.Color:=$0080FFFF; //$00DDFFDD;
  End;

  If (Column.FieldName='IND_PENDENTE') Then // Cor da Celula IND_PENDENTE
   Begin
     If (DMSidicom.CDS_UsuaSidicomIND_PENDENTE.AsString='SIM') Then
     Begin
       Dbg_SidicomUsuarios.Canvas.Font.Color:=clRed;
       Dbg_SidicomUsuarios.Canvas.Font.Style:=[fsBold];
     End;
   End
  Else If (Column.FieldName='IND_EXCLUIR') Then // Cor da Celula de IND_EXCLUIR
   Begin
     If (DMSidicom.CDS_UsuaSidicomIND_EXCLUIR.AsString='SIM')  Then
     Begin
       Dbg_SidicomUsuarios.Canvas.Font.Color:=clRed;
       Dbg_SidicomUsuarios.Canvas.Font.Style:=[fsBold];
     End;
   End
  Else If (Column.FieldName='IND_ALTERASENHA') Then // Cor da Celula IND_ALTERASENHA
   Begin
     If (DMSidicom.CDS_UsuaSidicomIND_ALTERASENHA.AsString='SIM') Then
     Begin
       Dbg_SidicomUsuarios.Canvas.Font.Color:=clRed;
       Dbg_SidicomUsuarios.Canvas.Font.Style:=[fsBold];
     End;
   End;

  // Cor da Linha Se Usuário já Excluido =======================================
  if not (gdSelected in State) Then
  Begin
    if DMSidicom.CDS_UsuaSidicomIND_EXCLUIDO.AsString='SIM' Then
    Begin
      Dbg_SidicomUsuarios.Canvas.Brush.Color:=clRed;
      Dbg_SidicomUsuarios.Canvas.Font.Color:=clWhite;
      Dbg_SidicomUsuarios.Canvas.Font.Style:=[fsBold];
    End;
  End;

  Dbg_SidicomUsuarios.Canvas.FillRect(Rect);
  Dbg_SidicomUsuarios.DefaultDrawDataCell(Rect,Column.Field,state);
end;

procedure TFrmAcessosUsuario.Dbg_SidicomUsuariosDblClick(Sender: TObject);
begin
  If (DMSidicom.CDS_UsuaSidicomIND_ENVIAR.AsString='SIM') and
     ((DMSidicom.CDS_UsuaSidicomIND_ALTERASENHA.AsString='SIM') Or
      (DMSidicom.CDS_UsuaSidicomIND_EXCLUIR.AsString='SIM')) Then
  Begin
    If Application.MessageBox('Um ou os dois Indicativos de:'+cr+cr+
                              '- ALTERAÇÃO DE SENHA DO USUÁRIO'+cr+
                              '- EXCLUSÃO DO USUÁRIO'+cr+cr+
                              'Esta(m) Marcado(s) !!'+cr+cr+
                              'Deseja Realmente DESMARCAR O ENVIO ??', 'ATENÇÃO !!', 292) = IdNo Then
     Exit;
  end; // If DMSidicom.CDS_UsuaSidicomIND_PENDENTE.AsString='SIM' Then

  // Altera Usuario para Envio =================================================
  AlteraUsuarioEnvio('DC');
end;

procedure TFrmAcessosUsuario.Dbg_SidicomUsuariosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  // Alterar Senha do Usuario ==================================================
  If key=Vk_F2 Then
   AlteraUsuarioEnvio('F2');

  // Excluir do Usuario ========================================================
  If key=Vk_F3 Then
   AlteraUsuarioEnvio('F3');

end;

procedure TFrmAcessosUsuario.Bt_SidicomPermissoesLocalizaUsuarioClick(Sender: TObject);
begin

  //============================================================================
  // Pesquisa Profissional na Loja já Selecionada ==============================
  //============================================================================
  If DMSidicom.CDS_UsuaSidicom.IsEmpty Then
   Exit;

  If StrToIntDef(EdtSidicomLocalizaUsuario.Text,99999999)=99999999 Then
   Begin
     If Not DMSidicom.CDS_UsuaSidicom.Locate('DES_USUARIO', EdtSidicomLocalizaUsuario.Text,[]) Then
     Begin
       If Not LocalizaRegistro(DMSidicom.CDS_UsuaSidicom, 'DES_USUARIO', EdtSidicomLocalizaUsuario.Text) Then
       Begin
         msg('Usuário Não Encontrado !!','A');
         DMSidicom.CDS_UsuaSidicom.First;
       End; // If Not LocalizaRegistro(DMSidicom.CDS_UsuaSidicom, 'DES_USUARIO', EdtSidicomLocalizaUsuario.Text) Then
     End; // If Not DMSidicom.CDS_UsuaSidicom.Locate('DES_USUARIO', EdtSidicomLocalizaUsuario.Text,[]) Then
   End
  Else // If StrToIntDef(EdtSidicomLocalizaUsuario.Text,99999999)=99999999 Then
   Begin
     If Not DMSidicom.CDS_UsuaSidicom.Locate('COD_USUARIO', EdtSidicomLocalizaUsuario.Text,[]) Then
     Begin
       If Not LocalizaRegistro(DMSidicom.CDS_UsuaSidicom, 'COD_USUARIO', FormatFloat('000',StrToInt(EdtSidicomLocalizaUsuario.Text))) Then
       Begin
         msg('Usuário Não Encontrado !!','A');
         DMSidicom.CDS_UsuaSidicom.First;
       End; // If Not LocalizaRegistro(DMSidicom.CDS_UsuaSidicom, 'COD_PROFISSIONAL', FormatFloat('000000',StrToInt(EdtSidicomLocalizaUsuario.Text))) Then
     End; // If Not DMSidicom.CDS_UsuaSidicom.Locate('COD_PROFISSIONAL', EdtSidicomLocalizaUsuario.Text,[]) Then
   End; // If StrToIntDef(EdtSidicomLocalizaUsuario.Text,99999999)=99999999 Then
end;

procedure TFrmAcessosUsuario.Dbg_SidicomUsuaLojasDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not (gdSelected in State) Then
  Begin
    if (DMSidicom.CDS_LojasSidicomIND_PENDENTE.AsString='SIM') Then
    Begin
      Dbg_SidicomUsuaLojas.Canvas.Brush.Color:=clRed;
      Dbg_SidicomUsuaLojas.Canvas.Font.Color:=clWhite;
      Dbg_SidicomUsuaLojas.Canvas.Font.Style:=[fsBold];
    End;

    If (DMSidicom.CDS_LojasSidicomIND_ENVIAR.AsString='SIM') and (DMSidicom.CDS_LojasSidicomIND_PENDENTE.AsString='NAO') Then
    Begin
      Dbg_SidicomUsuaLojas.Canvas.Brush.Color:=$00FFFFD2;
      Dbg_SidicomUsuaLojas.Canvas.Font.Style:=[fsBold];
    End;

    Dbg_SidicomUsuaLojas.Canvas.FillRect(Rect);
    Dbg_SidicomUsuaLojas.DefaultDrawDataCell(Rect,Column.Field,state);
  End;

  DMSidicom.CDS_LojasSidicomCOD_LOJA.Alignment:=taCenter;
end;

procedure TFrmAcessosUsuario.Bt_SidicomPermissoesMarcarClick(Sender: TObject);
Var
  sMarcar: String;
  iRecNo: Integer;
begin

  iRecNo:=DMSidicom.CDS_UsuaSidicom.RecNo;
  
  Dbg_SidicomUsuarios.SetFocus;
  If (Sender is TJvXPButton) Then
  Begin
    If Trim((Sender as TJvXPButton).Name)='Bt_SidicomPermissoesDesMarcar' Then
    Begin
      sMarcar:='DM';
      if msg('Deseja Realmente DESMARCAR'+cr+'Todos os Usuários ??','C')=2 Then
       Exit;
    End;

    If Trim((Sender as TJvXPButton).Name)='Bt_SidicomPermissoesMarcar' Then
    Begin
      sMarcar:='MA';
      if msg('Deseja Relamente MARCAR'+cr+'Todos os Usuários ??','C')=2 Then
       Exit;
    End;
  End; // If (Sender is TJvXPButton) Then

  DMSidicom.CDS_UsuaSidicom.First;
  DMSidicom.CDS_UsuaSidicom.DisableControls;
  While Not DMSidicom.CDS_UsuaSidicom.Eof do
  Begin
    AlteraUsuarioEnvio(sMarcar);

    DMSidicom.CDS_UsuaSidicom.Next;
  End; // While Not DMSidicom.CDS_UsuaSidicom.Eof do
  DMSidicom.CDS_UsuaSidicom.EnableControls;
  DMSidicom.CDS_UsuaSidicom.First;

  DMSidicom.CDS_UsuaSidicom.RecNo:=iRecNo;

end;

procedure TFrmAcessosUsuario.JvXPButton1Click(Sender: TObject);
begin
  If (AnsiUpperCase(Des_Login)<>'ODIR')  And (AnsiUpperCase(Des_Login)<>'RENATO') And
     (AnsiUpperCase(Des_Login)<>'TIAGO') And (AnsiUpperCase(Des_Login)<>'CADASTRO')Then
   Exit;

  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmBelShop.AbreSolicitacoes(22);
  FrmSolicitacoes.Caption:='Permissões de Usuários';
  FrmSolicitacoes.Ts_SidicomUsuario.Caption:='Transfere Permissões de Usuários';

  FrmSolicitacoes.ShowModal;
  FreeAndNil(FrmSolicitacoes);

  FrmBelShop.FechaTudo;

end;

end.


-- Busca lojas e usuarios a enviar
----------------------------------
select ul.cod_loja, ul.cod_usuario,
us.des_usuario, us.ind_alterasenha, us.ind_excluir
from usuarios_sidicom_lojas ul, usuarios_sidicom us
where ul.cod_usuario=us.cod_usuario
And   ((ul.ind_enviar='SIM') or (ul.ind_pendente='SIM'))
order by 1
-- 152 Reg

select *
from usuarios_sidicom_lojas ul, usuarios_sidicom us
where ul.cod_usuario=us.cod_usuario
And   ((ul.ind_enviar='SIM') or (ul.ind_pendente='SIM'))
order by 1

--------------------------------------------------
-- INICIO DO ENVIO DE PERMISSOES PARA LOJAS
--------------------------------------------------

--------------------------------------------------
-- Trata Variavel que Indica se Ocorreu
-- Transferencia para Todas as Lojas
--------------------------------------------------
-- bEnviouTodas=True
    - Altera na
        - Except
            - bEnviouTodas=True

-- Marca usuario
    - us.ind_enviar=NAO
    - us.ind_pendente=SIM

--------------------------------------------------
-- 1ª Etapa: EXCLUIR USUARIO DA LOJA
--------------------------------------------------
-- Se EXCLUIU Usuario em TODAS as Lojas
    - us.ind_excluir=NAO
    - us.ind_excluido=SIM

-- Se NÃO EXCLUIU Usuario em TODAS as Loja
    - us.ind_excluir=SIM
    - us.ind_excluido=NAO

--------------------------------------------------
-- 2ª Etapa: ENVIA PERMISSOES DO USUARIO PARA LOJA
--------------------------------------------------

--------------------------------------------------
-- 3ª Etapa: TRATA ENVIA PARA A LOJA
--------------------------------------------------
-- Se Enviou usuario para Loja
    - ul.ind_enviado=SIM
    - ul.dta_envio=current_timestamp
    - ul.ind_enviar=NAO
    - ul.ind_pendente=NAO
-- Se NÃO Enviou usuario para Loja
    - ul.ind_enviado=NAO
    - ul.ind_enviar=SIM
    - ul.ind_pendente=SIM

--------------------------------------------------
-- Trata Variavel que Indica se Ocorreu
-- Transferencia para Todas as Lojas
--------------------------------------------------
--SE ENVIOU usuario em todas as lojas ENTAO ATUALIZA
    - if (bEnvouTodas) then
       - us.ind_pendente=NAO

--------------------------------------------------
-- FIM DO ENVIO DE PERMISSOES PARA LOJAS
--------------------------------------------------

