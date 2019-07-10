{
  // Colocar no Projeto <<<=============

  FrmEntrada:=TFrmEntrada.Create(FrmEntrada);
  FrmEntrada.Label1.caption:= NOME DO SISTEMA;

  FrmEntrada.Show;

  Application.Initialize;
  FrmEntrada.Refresh;

  // Retirar Auto Create <<<=============
  Application.CreateForm(TFrmEntrada, FrmEntrada);

}

unit UEntrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, dxGDIPlusClasses;

type
  TFrmEntrada = class(TForm)
    OdirPanApres: TPanel;
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEntrada: TFrmEntrada;

implementation

{$R *.dfm}

procedure TFrmEntrada.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

end;

end.
