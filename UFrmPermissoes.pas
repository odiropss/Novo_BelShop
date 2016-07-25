unit UFrmPermissoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, TreeSeguranca, StdCtrls, Mask, ToolEdit,
  CurrEdit, JvExControls, JvXPCore, JvXPButtons, ExtCtrls;

type
  TFrmPermissoes = class(TForm)
    Panel8: TPanel;
    Panel10: TPanel;
    Bt_AcessoFechar: TJvXPButton;
    Bt_AcessoSalvar: TJvXPButton;
    Bt_AcessoAbandonar: TJvXPButton;
    Pan_AcessoUsuario: TPanel;
    Gb_AcessoUsuario: TGroupBox;
    EdtAcessoCodUsuario: TCurrencyEdit;
    EdtAcessoDescUsuario: TEdit;
    Bt_AcessoBuscaUsuario: TJvXPButton;
    TreeSeguranca: TTreeSeguranca;
    ImageList1: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPermissoes: TFrmPermissoes;

implementation

{$R *.dfm}

end.
