unit UMegaSena;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExControls, JvXPCore, JvXPButtons, Mask, ToolEdit,
  CurrEdit, ExtCtrls, ACBrBase, ACBrEnterTab, DB, Grids, DBGrids, DBClient, StrUtils ;

type
  TFrmMegaSenha = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Num1: TCurrencyEdit;
    Num2: TCurrencyEdit;
    Num4: TCurrencyEdit;
    Num3: TCurrencyEdit;
    Num5: TCurrencyEdit;
    GroupBox2: TGroupBox;
    Memo1: TMemo;
    JvXPButton1: TJvXPButton;
    Num6: TCurrencyEdit;
    CDS_Jogos: TClientDataSet;
    CDS_JogosCartao: TStringField;
    CDS_JogosDez1: TIntegerField;
    CDS_JogosDez2: TIntegerField;
    CDS_JogosDez3: TIntegerField;
    CDS_JogosDez4: TIntegerField;
    CDS_JogosDez5: TIntegerField;
    CDS_JogosDez6: TIntegerField;
    CDS_JogosSorteado1: TStringField;
    CDS_JogosSorteado2: TStringField;
    CDS_JogosSorteado3: TStringField;
    CDS_JogosSorteado4: TStringField;
    CDS_JogosSorteado5: TStringField;
    CDS_JogosSorteado6: TStringField;
    CDS_JogosSituao: TStringField;
    DBGrid1: TDBGrid;
    DS_Jogos: TDataSource;
    procedure JvXPButton1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Num4Exit(Sender: TObject);
    procedure Num1Exit(Sender: TObject);
    procedure Num2Exit(Sender: TObject);
    procedure Num3Exit(Sender: TObject);
    procedure Num5Exit(Sender: TObject);
    procedure Num6Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMegaSenha: TFrmMegaSenha;

implementation

uses DK_Procs1, Uf_Conecta, uj_001, uj_002, SysConst;

{$R *.dfm}

procedure TFrmMegaSenha.JvXPButton1Click(Sender: TObject);
Var
  Arq: TextFile;
  sNum, s, sJogo, sAcerto, sSorte: String;
  i, iNumAcertos: Integer;
begin

  Memo1.Lines.Clear;
  s:=ExtractFilePath(Application.ExeName);
  AssignFile(Arq,s+'Jogos.txt');

  Reset(Arq);
  While not Eof(Arq) do
  Begin
    iNumAcertos:=0;
    Readln(Arq,s);

    sJogo:=Separa_String(s,1);

    If Trim(sJogo)<>'' Then
    Begin
      // Primeiro Numero
      sAcerto:='    ';
      If (StrToInt(Separa_String(s,2))=Num1.AsInteger) or (StrToInt(Separa_String(s,2))=Num2.AsInteger) or (StrToInt(Separa_String(s,2))=Num3.AsInteger) or
         (StrToInt(Separa_String(s,2))=Num4.AsInteger) or (StrToInt(Separa_String(s,2))=Num5.AsInteger) or (StrToInt(Separa_String(s,2))=Num6.AsInteger) Then
      Begin
       sAcerto:=' X ';
      End;

      If sAcerto=' X ' Then
       Inc(iNumAcertos);

      sNum:=Separa_String(s,2);
      If StrToInt(sNum)<10 Then
       sNum:='0'+sNum;

      sJogo:=sJogo+'   - '+sNum+' ('+sAcerto+')';

      // Segundo Numero
      sAcerto:='    ';
      If (StrToInt(Separa_String(s,3))=Num1.AsInteger) or (StrToInt(Separa_String(s,3))=Num2.AsInteger) or (StrToInt(Separa_String(s,3))=Num3.AsInteger) or
         (StrToInt(Separa_String(s,3))=Num4.AsInteger) or (StrToInt(Separa_String(s,3))=Num5.AsInteger) or (StrToInt(Separa_String(s,3))=Num6.AsInteger) Then
      Begin
       sAcerto:=' X ';
      End;

      If sAcerto=' X ' Then
       Inc(iNumAcertos);

      sNum:=Separa_String(s,3);
      If StrToInt(sNum)<10 Then
       sNum:='0'+sNum;

      sJogo:=sJogo+'   - '+sNum+' ('+sAcerto+')';

      // Terceiro Numero
      sAcerto:='    ';
      If (StrToInt(Separa_String(s,4))=Num1.AsInteger) or (StrToInt(Separa_String(s,4))=Num2.AsInteger) or (StrToInt(Separa_String(s,4))=Num3.AsInteger) or
         (StrToInt(Separa_String(s,4))=Num4.AsInteger) or (StrToInt(Separa_String(s,4))=Num5.AsInteger) or (StrToInt(Separa_String(s,4))=Num6.AsInteger) Then
      Begin
       sAcerto:=' X ';
      End;

      If sAcerto=' X ' Then
       Inc(iNumAcertos);

      sNum:=Separa_String(s,4);
      If StrToInt(sNum)<10 Then
       sNum:='0'+sNum;

      sJogo:=sJogo+'   - '+sNum+' ('+sAcerto+')';

      // Quarto Numero
      sAcerto:='    ';
      If (StrToInt(Separa_String(s,5))=Num1.AsInteger) or (StrToInt(Separa_String(s,5))=Num2.AsInteger) or (StrToInt(Separa_String(s,5))=Num3.AsInteger) or
         (StrToInt(Separa_String(s,5))=Num4.AsInteger) or (StrToInt(Separa_String(s,5))=Num5.AsInteger) or (StrToInt(Separa_String(s,5))=Num6.AsInteger) Then
      Begin
       sAcerto:=' X ';
      End;

      If sAcerto=' X ' Then
       Inc(iNumAcertos);

      sNum:=Separa_String(s,5);
      If StrToInt(sNum)<10 Then
       sNum:='0'+sNum;

      sJogo:=sJogo+'   - '+sNum+' ('+sAcerto+')';

      // Quinto Numero
      sAcerto:='    ';
      If (StrToInt(Separa_String(s,6))=Num1.AsInteger) or (StrToInt(Separa_String(s,6))=Num2.AsInteger) or (StrToInt(Separa_String(s,6))=Num3.AsInteger) or
         (StrToInt(Separa_String(s,6))=Num4.AsInteger) or (StrToInt(Separa_String(s,6))=Num5.AsInteger) or (StrToInt(Separa_String(s,6))=Num6.AsInteger) Then
      Begin
       sAcerto:=' X ';
      End;

      If sAcerto=' X ' Then
       Inc(iNumAcertos);

      sNum:=Separa_String(s,6);
      If StrToInt(sNum)<10 Then
       sNum:='0'+sNum;

      sJogo:=sJogo+'   - '+sNum+' ('+sAcerto+')';

      // Sexto Numero
      sAcerto:='    ';
      If (StrToInt(Separa_String(s,7))=Num1.AsInteger) or (StrToInt(Separa_String(s,7))=Num2.AsInteger) or (StrToInt(Separa_String(s,7))=Num3.AsInteger) or
         (StrToInt(Separa_String(s,7))=Num4.AsInteger) or (StrToInt(Separa_String(s,7))=Num5.AsInteger) or (StrToInt(Separa_String(s,7))=Num6.AsInteger) Then
      Begin
       sAcerto:=' X ';
      End;

      If sAcerto=' X ' Then
       Inc(iNumAcertos);

      sNum:=Separa_String(s,7);
      If StrToInt(sNum)<10 Then
       sNum:='0'+sNum;

      sJogo:=sJogo+'   - '+sNum+' ('+sAcerto+')';

//////////////
      // Setimo Numero
      sAcerto:='    ';
      If Separa_String(s,8)<>'' Then
      Begin
        If (StrToInt(Separa_String(s,8))=Num1.AsInteger) or (StrToInt(Separa_String(s,8))=Num2.AsInteger) or (StrToInt(Separa_String(s,8))=Num3.AsInteger) or
           (StrToInt(Separa_String(s,8))=Num4.AsInteger) or (StrToInt(Separa_String(s,8))=Num5.AsInteger) or (StrToInt(Separa_String(s,8))=Num6.AsInteger) Then
        Begin
         sAcerto:=' X ';
        End;

        If sAcerto=' X ' Then
         Inc(iNumAcertos);

        sNum:=Separa_String(s,8);
        If StrToInt(sNum)<10 Then
         sNum:='0'+sNum;

        sJogo:=sJogo+'   - '+sNum+' ('+sAcerto+')';
      End;
//////////////

      sSorte:=' - Sem Acertos';
      If iNumAcertos>0 Then
       sSorte:=' => Número de Acertos: '+IntToStr(iNumAcertos);

      If iNumAcertos=4 Then
       sSorte:=' =====> Você Ganhou a Quadra';

      If iNumAcertos=5 Then
       sSorte:=' ========> Você Ganhou a QUINA';

      If iNumAcertos=6 Then
       sSorte:=' ==========>>> VOCÊ GANHOU NA MEGASENA !!!!';

      Memo1.Lines.Add(sJogo+sSorte);
      Memo1.Lines.Add('');

    End; // If Trim(sJogo)<>'' Then

  End; // While not Eof(Arq) do
  CloseFile(Arq);

  For i:=0 to Memo1.Lines.Count-1 do
  Begin
    If (AnsiContainsStr(Memo1.Lines[i], 'Ganhou')) Or (AnsiContainsStr(Memo1.Lines[i], 'GANHOU')) Then
    Begin
      ShowMessage('Você Ganhou no Jogo:'+cr+cr+Memo1.Lines[i]);
    End;
  End;
end;

procedure TFrmMegaSenha.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmMegaSenha.Num4Exit(Sender: TObject);
begin
  Num4.Color:=clWindow;

  If Num4.AsInteger>60 Then
  Begin
    msg('Número Inválido !!','A');
    Num4.AsInteger:=0;
    Num4.SetFocus;
    Exit;
  End;

  JvXPButton1Click(Self);

end;

procedure TFrmMegaSenha.Num1Exit(Sender: TObject);
begin
  Num1.Color:=clWindow;

  If Num1.AsInteger>60 Then
  Begin
    msg('Número Inválido !!','A');
    Num1.AsInteger:=0;
    Num1.SetFocus;
    Exit;
  End;

  JvXPButton1Click(Self);

end;

procedure TFrmMegaSenha.Num2Exit(Sender: TObject);
begin
  Num2.Color:=clWindow;

  If Num2.AsInteger>60 Then
  Begin
    msg('Número Inválido !!','A');
    Num2.AsInteger:=0;
    Num2.SetFocus;
    Exit;
  End;

  JvXPButton1Click(Self);


end;

procedure TFrmMegaSenha.Num3Exit(Sender: TObject);
begin
  Num3.Color:=clWindow;

  If Num3.AsInteger>60 Then
  Begin
    msg('Número Inválido !!','A');
    Num3.AsInteger:=0;
    Num3.SetFocus;
    Exit;
  End;

  JvXPButton1Click(Self);

end;

procedure TFrmMegaSenha.Num5Exit(Sender: TObject);
begin
  Num5.Color:=clWindow;

  If Num5.AsInteger>60 Then
  Begin
    msg('Número Inválido !!','A');
    Num5.AsInteger:=0;
    Num5.SetFocus;
    Exit;
  End;

  JvXPButton1Click(Self);

end;

procedure TFrmMegaSenha.Num6Exit(Sender: TObject);
begin
  Num6.Color:=clWindow;

  If Num6.AsInteger>60 Then
  Begin
    msg('Número Inválido !!','A');
    Num6.AsInteger:=0;
    Num6.SetFocus;
    Exit;
  End;

  JvXPButton1Click(Self);

end;

end.
