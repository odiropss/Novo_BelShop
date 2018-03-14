unit UFrmBuscaMetodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvXPCore, JvXPButtons, ExtCtrls, Grids, DBGrids,
  DBGridJul, StdCtrls, Mask, ToolEdit, CurrEdit, cxProgressBar, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TFrmBuscaMetodo = class(TForm)
    OdirPanApres: TPanel;
    Panel1: TPanel;
    Bt_BuscaMetodo: TJvXPButton;
    Dbg_Lojas: TDBGridJul;
    EdtCodLoja: TCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    EdtMetodo: TEdit;
    EdtDesLoja: TEdit;
    Label74: TLabel;
    DtEdt_DtaInicio: TcxDateEdit;
    Label75: TLabel;
    DtEdt_DtaFim: TcxDateEdit;
    procedure Bt_BuscaMetodoClick(Sender: TObject);
    procedure EdtCodLojaExit(Sender: TObject);

    // Odir
    Procedure MontaProgressBar(bCria: Boolean; Form: TForm);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    // Odir
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscaMetodo: TFrmBuscaMetodo;

  pgProgBar: TcxProgressBar;

  sgDtaI, sgDtaF: String;

implementation

uses DK_Procs1, UDMBuscaMetodo, DB;


{$R *.dfm}

// Odir Inicio

// Monta ProgressBar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBuscaMetodo.MontaProgressBar(bCria: Boolean; Form: TForm);
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

    // Disabilita Formulario
    Form.Enabled:=False;
  End; // If bCria Then

  If Not bCria Then
  Begin
    FreeAndNil(pgProgBar);

    // Habilita Formulario
    Form.Enabled:=True;
  End;

  Application.ProcessMessages;
End; // Monta ProgressBar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Odir Fim
procedure TFrmBuscaMetodo.Bt_BuscaMetodoClick(Sender: TObject);
Var
  MySql: String;
  sParametros: String;
begin

  OdirPanApres.Caption:='AGUARDE !! Atualizando WebService LINX - CLOUD';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBuscaMetodo.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBuscaMetodo.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmBuscaMetodo;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Busca Lojas Linx ==========================================================
  MySql:=' SELECT em.cod_linx, em.Razao_Social'+
         ' FROM EMP_CONEXOES em';

         If Trim(EdtDesLoja.Text)<>'' Then
          MySql:=
           MySql+' WHERE em.cod_linx='+EdtCodLoja.Text
         Else
          MySql:=
           MySql+' WHERE em.cod_linx<>0'+
                 ' AND   em.ind_ativo=''SIM''';

  MySql:=
   MySql+' ORDER BY 1';
  DMBuscaMetodo.CDS_Busca.Close;
  DMBuscaMetodo.SDS_Busca.CommandText:=MySql;
  DMBuscaMetodo.CDS_Busca.Open;

  MontaProgressBar(True, FrmBuscaMetodo);
  pgProgBar.Properties.Max:=DMBuscaMetodo.CDS_Busca.RecordCount;
  pgProgBar.Position:=0;

  sgDtaI:=DateToStr(DtEdt_DtaInicio.Date);
  sgDtaF:=DateToStr(DtEdt_DtaFim.Date);

  Try
    While Not DMBuscaMetodo.CDS_Busca.Eof do
    Begin
      OdirPanApres.Caption:='AGUARDE !! Atualizando Metodo: '+EdtMetodo.Text+' (LINX - CLOUD) Loja: '+DMBuscaMetodo.CDS_Busca.FieldByName('Cod_Linx').AsString;
      Application.ProcessMessages;

      sParametros:=sgPastaWebService+'PWebServiceLinx.exe '+EdtMetodo.Text; // Excutavel e Metodo a Processar
      sParametros:=sParametros+' '+DMBuscaMetodo.CDS_Busca.FieldByName('Cod_Linx').AsString; // Codigo da Loja a Processar
      sParametros:=sParametros+' "'+IncludeTrailingPathDelimiter(sgPastaWebService+'Metodos')+'"'; // Pasta dos Metodos
      sParametros:=sParametros+' "'+IncludeTrailingPathDelimiter(sgPastaWebService+'Retornos')+'"'; // Pasta dos Retornos
      sParametros:=sParametros+' "'+sgDtaI+'"'; // Data Inicial
      sParametros:=sParametros+' "'+sgDtaF+'"'; // Data Final

      // Envia Parametro e Aguarda Termino do Processo =============================
      CreateProcessSimple(sParametros);

      pgProgBar.Position:=DMBuscaMetodo.CDS_Busca.RecNo;

      DMBuscaMetodo.CDS_Busca.Next;
    End; // While Not DMBuscaMetodo.CDS_Busca.Eof do
  Except
    on e : Exception do
    Begin
      MessageBox(Handle, pChar(e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End;
  DMBuscaMetodo.CDS_Busca.Close;
  MontaProgressBar(False, FrmBuscaMetodo);
  OdirPanApres.Visible:=False;

  msg('FIM','A');
end;

procedure TFrmBuscaMetodo.EdtCodLojaExit(Sender: TObject);
Var
  MySql:String;
begin
  EdtDesLoja.Clear;

  If EdtCodLoja.AsInteger=0 Then
  Begin
    Exit;
  End;

  MySql:=' select l.empresa, l.nome_emp'+
         ' from linxlojas l'+
         ' where l.empresa='+EdtCodLoja.Text;
  DMBuscaMetodo.CDS_Busca.Close;
  DMBuscaMetodo.SDS_Busca.CommandText:=MySql;
  DMBuscaMetodo.CDS_Busca.Open;
  EdtDesLoja.Text:=DMBuscaMetodo.CDS_Busca.FieldByName('nome_emp').AsString;
  DMBuscaMetodo.CDS_Busca.Close;

  If Trim(EdtDesLoja.Text)='' Then
  Begin
    msg('Loja Não Encontrada !!','A');
    EdtCodLoja.AsInteger:=0;
    Exit;
  End;


end;

procedure TFrmBuscaMetodo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

end.
