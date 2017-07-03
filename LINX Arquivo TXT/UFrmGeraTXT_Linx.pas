unit UFrmGeraTXT_Linx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, JvExControls, JvXPCore, JvXPButtons, ExtCtrls,
  Mask, ToolEdit, CurrEdit;

type
  TFrmGeraTtxLinx = class(TForm)
    Gb_ArquivoExcel: TGroupBox;
    Bt_BuscaArquivoExcel: TJvXPButton;
    EdtPastaArquivoExcel: TEdit;
    Gb_ArquivoTXT: TGroupBox;
    Bt_BuscaArquivoTXT: TJvXPButton;
    EdtPastaArquivoTXT: TEdit;
    Panel2: TPanel;
    Strg_Arquivo: TStringGrid;
    Gb_QtdMinima: TGroupBox;
    Gb_PercDesconto: TGroupBox;
    Bt_GeraArquivoTXT: TJvXPButton;
    EdtQtdMinima: TCurrencyEdit;
    EdtPercDesconto: TCurrencyEdit;
    procedure Bt_BuscaArquivoExcelClick(Sender: TObject);
    procedure Bt_BuscaArquivoTXTClick(Sender: TObject);
    procedure Bt_GeraArquivoTXTClick(Sender: TObject);

    // Odir ====================================================================
    Procedure GeraArquivoTXT;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    // Odir ====================================================================

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGeraTtxLinx: TFrmGeraTtxLinx;

implementation

uses DK_Procs1;

{$R *.dfm}

// Odir - INICIO ===============================================================

// Gera Arquivo Texto de Codigo LINX >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmGeraTtxLinx.GeraArquivoTXT;
Var
  tsArquivo: TStringList;
  i: Integer;
Begin
  Try
    tsArquivo:=TStringList.Create;

    For i:=0 to Strg_Arquivo.RowCount-1 do
    Begin
      Application.ProcessMessages;

      // Posiciona na Linha
      Strg_Arquivo.Col:=0;
      Strg_Arquivo.Row:=i;


      If Trim(Strg_Arquivo.Cells[0,i])<>'' Then
      Begin
        Try
          StrToInt(Trim(Strg_Arquivo.Cells[0,i]));

          If tsArquivo.Count<1 Then
           tsArquivo.Add(Trim(Strg_Arquivo.Cells[0,i]))
          Else
           tsArquivo[0]:=tsArquivo[0]+','+Trim(Strg_Arquivo.Cells[0,i]);

        Except
        End;
      End; // If Trim(Strg_Arquivo.Cells[0,i])<>'' Then
    End; // For i:=0 to Strg_Arquivo.RowCount-1 do

    // Acrescenta Quantidade Mínima e Percentual de Descontos ==================
    tsArquivo[0]:=tsArquivo[0]+';'+IntToStr(EdtQtdMinima.AsInteger)+';'+IntToStr(EdtPercDesconto.AsInteger);

    // Salva Arquivo Texto
    tsArquivo.SaveToFile(EdtPastaArquivoTXT.Text);
  Except
    on e : Exception do
    Begin
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Exit;
    End; // on e : Exception do
  End; // Try

  Screen.Cursor:=crDefault;
  msg('Arquivo Gerado com SUCESSO','A');

End; // Gera Arquivo Texto de Codigo LINX >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Odir - FIM ==================================================================

procedure TFrmGeraTtxLinx.Bt_BuscaArquivoExcelClick(Sender: TObject);
Var
  OpenDialog: TOpenDialog;
 s: String;
begin

  LimpaStringGrid(Strg_Arquivo, True);

  OpenDialog := TOpenDialog.Create(Self);
  With OpenDialog do
  Begin
    Options := [ofAllowMultiSelect , ofPathMustExist, ofHideReadOnly, ofOverwritePrompt];
    DefaultExt := 'xls;xlsx';
    Filter := 'Arquivo Excel (*.xls;*.xlsx)|*.xls;*.xlsx';
    FilterIndex := 1;
    Title := 'Busca Plano Saúde.Excel';

    if Execute then
    Begin
      EdtPastaArquivoExcel.Text:=OpenDialog.FileName;
      XlsToStringGrid(Strg_Arquivo,EdtPastaArquivoExcel.Text);

      EdtQtdMinima.SetFocus;
    End;
  End; // With OpenDialog do
  FreeAndNil(OpenDialog);
end;

procedure TFrmGeraTtxLinx.Bt_BuscaArquivoTXTClick(Sender: TObject);
Var
  SaveDialog: TSaveDialog;
begin
  SaveDialog := TSaveDialog.Create(Self);
  With SaveDialog do
  Begin
    Options := [ofAllowMultiSelect , ofPathMustExist, ofHideReadOnly, ofOverwritePrompt];
    DefaultExt := 'txt';
    Filter := 'Arquivo TEXTO (*.txt)|*.txt';
    FilterIndex := 1;
    Title := 'Salvar Arquivo Texto';

    if Execute then
    Begin
      EdtPastaArquivoTXT.Text:=SaveDialog.FileName;
      Bt_BuscaArquivoExcel.SetFocus;
    End;
  End; // With OpenDialog do
  FreeAndNil(SaveDialog);
end;

procedure TFrmGeraTtxLinx.Bt_GeraArquivoTXTClick(Sender: TObject);
begin
  Strg_Arquivo.SetFocus;

  If Trim(EdtPastaArquivoTXT.Text)='' Then
  Begin
    msg('Favor Informar o'+cr+cr+'Arquivo Texto a Gerar !!','A');
    Bt_BuscaArquivoTXT.SetFocus;
    Exit;
  End;

  If Trim(EdtPastaArquivoExcel.Text)='' Then
  Begin
    msg('Favor Informar o'+cr+cr+'Arquivo Excel !!','A');
    LimpaStringGrid(Strg_Arquivo, True);
    Bt_BuscaArquivoExcel.SetFocus;
    Exit;
  End;

  If Strg_Arquivo.RowCount<2 Then
  Begin
    msg('Arquivo Excel SEM Dados !!','A');
    LimpaStringGrid(Strg_Arquivo, True);
    EdtPastaArquivoExcel.Clear;
    Bt_BuscaArquivoExcel.SetFocus;
    Exit;
  End;

  If msg('A Quantidade Mínima Esta CORRETA ??','C')=2 Then
  Begin
    EdtQtdMinima.SetFocus;
    Exit;
  End;

  If msg('O Percentual de Desconto Esta CORRETO ??','C')=2 Then
  Begin
    EdtPercDesconto.SetFocus;
    Exit;
  End;

  GeraArquivoTXT;

  LimpaStringGrid(Strg_Arquivo, True);
  EdtPastaArquivoExcel.Clear;
  EdtPastaArquivoTXT.Clear;

end;

procedure TFrmGeraTtxLinx.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;
end;

end.
