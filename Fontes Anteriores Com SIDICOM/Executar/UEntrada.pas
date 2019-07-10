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
  Dialogs, StdCtrls, ExtCtrls, Animate, GIFCtrl, ComCtrls;

type
  TFrmEntrada = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Animate1: TAnimate;
    Panel2: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEntrada: TFrmEntrada;

implementation

{$R *.dfm}

end.
