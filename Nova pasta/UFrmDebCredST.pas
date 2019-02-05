unit UFrmDebCredST;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvGradientCaption;

type
  TFrmDebCredST = class(TForm)
    CorCaptionForm: TJvGradientCaption;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDebCredST: TFrmDebCredST;

  bgSairModelo: Boolean;

implementation

{$R *.dfm}

procedure TFrmDebCredST.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bgSairModelo Then
   Begin
     Action := caFree;

//odir     FechaTudoModelo;
   End
  Else
   Begin
//odir     msg('Para Sair Tecle no Botão <Fechar>...','A');
     Action := caNone;
   End;

end;

procedure TFrmDebCredST.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

end;

procedure TFrmDebCredST.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;
end;

procedure TFrmDebCredST.FormShow(Sender: TObject);
begin
  // Cor Form
  CorCaptionForm.Active:=False;
  CorCaptionForm.Active:=True;

  bgSairModelo:=False;

end;

end.
