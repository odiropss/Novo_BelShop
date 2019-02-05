program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  UFrmDebCredST in 'UFrmDebCredST.pas' {FrmDebCredST};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFrmDebCredST, FrmDebCredST);
  Application.Run;
end.
