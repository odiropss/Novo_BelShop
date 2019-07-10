unit UFrmContaRegistros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, FMTBcd, StdCtrls, DB, Grids, DBGrids, ExtCtrls,
  Provider, DBClient, SqlExpr, WinInet;

type
  TFrmContaRegistros = class(TForm)
    SQLC: TSQLConnection;
    SDS_: TSQLDataSet;
    CDS_: TClientDataSet;
    DSP_: TDataSetProvider;
    Mem_Contagens: TMemo;
    SDS_Tab: TSQLDataSet;
    CDS_Tab: TClientDataSet;
    DSP_Tab: TDataSetProvider;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    ds_Tab: TDataSource;
    CDS_TabTABELA: TStringField;
    procedure Button1Click(Sender: TObject);

    // Odir
    Procedure ConectaBanco;
    // Odir

    procedure FormCreate(Sender: TObject);
    procedure CDS_AfterOpen(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

Const
   sgUser_Name: String='SYSDBA';
   sgPassword: String='masterkey';
   sgPCTConect_IB: String='PCTConect_IB.ini';
   // sgPCTConect_IB: String='PCTConect_IB - Fabiano.ini';

   cr = #13#10;
   Tab =#9;

var
  FrmContaRegistros: TFrmContaRegistros;

  sPath_Local   : String; // Somente a Pasta do Executável

implementation

uses DK_Procs1, uj_001, uj_002;

{$R *.dfm}

// Odir
// Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmContaRegistros.ConectaBanco;
Var
  Arq: TextFile;
  s, sBancoIB: String;
  i: Integer;
  b: Boolean;
  Flags : Cardinal;
begin

  if not InternetGetConnectedState(@Flags, 0) then
  Begin
    If msg('Você não está conectado à Internet !!'+cr+cr+'Deseja Continuar Assim Mesmo ??','C')=2 Then
    Begin
      Application.Terminate;
      Exit;
    End;
  End;

  If Not (FileExists(sPath_Local+sgPCTConect_IB)) Then
  Begin
    Showmessage('Arquivo de Configuração Não Existe...'+cr+cr+'O Sistema será Encerrado !!');
    Application.Terminate;
    Exit;
  End;

  If SQLC.Connected Then
   SQLC.Connected:=False;

  InicializaFormatos; // define as configurações regionais para ignorar a configuração do windows

  // ===========================================================================
  // Conexão DBExpress BelShop =================================================
  // ===========================================================================
  with SQLC do
  Begin
    try
      SQLC.Params.Clear;
      LoadParamsFromIniFile(sPath_Local+sgPCTConect_IB);

      Params.Add('User_Name='+sgUser_Name);
      Params.Add('Password='+sgPassword);
      b:=False;
      While Not b do
      Begin
        Try
          Connected:=True;
          Break;
        Except
          on e : Exception do
          Begin
            MessageBox(Application.Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
            Application.Terminate;
            exit;
          End; // on e : Exception do
        End;
      End;
    Except // finally
    End;
  end;

End; // Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmContaRegistros.Button1Click(Sender: TObject);
Var
  MySql,
  sTab: String;
begin
  CDS_Tab.Close;
  CDS_Tab.Open;

  Mem_Contagens.Lines.Clear;

  CDS_Tab.First;
  While Not CDS_Tab.Eof do
  Begin
    sTab:=Trim(CDS_TabTABELA.AsString);


    CDS_.Close;
    SDS_.CommandText:=' SELECT '+QuotedStr(sTab)+' Tabela, COUNT(*) TotReg'+
                      ' FROM '+sTab;
    CDS_.Open;
    CDS_.Close;

    CDS_Tab.Next;
  end; // While Not CDS_Tab.Eof do
  CDS_Tab.Close;

  msg('Fim da Contagem!!','A');
end;

procedure TFrmContaRegistros.FormCreate(Sender: TObject);
begin
  sPath_Local:=IncludeTrailingPathDelimiter(ExtractFilePAth(Application.ExeName));

  ConectaBanco;
end;

procedure TFrmContaRegistros.CDS_AfterOpen(DataSet: TDataSet);
begin
  Mem_Contagens.Lines.Add(CDS_.FieldByName('TABELA').AsString+#9+CDS_.FieldByName('TotReg').AsString);
end;

end.
