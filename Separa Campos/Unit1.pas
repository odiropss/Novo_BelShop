unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses DK_Procs1, uj_001, uj_002;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  tsArquivo: TStringList;
  i, ii: Integer;
  s, scampo, sCampo1, sCampo2: String;
begin

  { Instancia a variável arquivo }
  tsArquivo:=TStringList.Create;

  Try
    { Carrega o conteúdo do arquivo texto para a   memória }
    if OpenDialog1.Execute then
     tsArquivo.LoadFromFile(OpenDialog1.FileName);

    Label1.Caption:=IntToStr(tsArquivo.Count);

    { Realiza um loop em toda a lista }
    For i := 1 to tsArquivo.Count - 1 do
    Begin
      Form1.Refresh;

      s:=tsArquivo[i];
      s:=s+',';
      
      For ii:=1 to 10000 do
      Begin
       If Separa_String(s,ii,',')='Limite Superado' Then
        Break;

       scampo:=Separa_String(s,ii,',');
       If Copy(scampo,1,1)='"' Then
        scampo1:=scampo
       Else if Copy(scampo,Length(scampo),1)='"' Then
        Begin
          sCampo2:=Copy(scampo1,2,Length(scampo1))+','+Copy(scampo,1,Length(scampo)-1);
          Memo1.Lines.Add(sCampo2);
        End
       Else
         Memo1.Lines.Add(sCampo);
      End;
      Label2.Caption:=IntToStr(i);
      break;
    End; // For i := 0 to tsArquivo.Count - 1 do

    tsArquivo.SaveToFile(OpenDialog1.FileName);
  Finally // Try
    { Libera a instancia da lista da memória }
    FreeAndNil(tsArquivo);
  End; // Try
end;

end.
