unit UFrmApresConciliacao;

interface

uses
  Windows, Forms, Grids, DBGrids, DBGridJul, StdCtrls, Graphics,
  JvExControls, JvXPCore, JvXPButtons, Controls, Classes, ExtCtrls, Mask,
  DBCtrls, MASKUTILS;
//  Último: ExtCtrls;

type
  TFrmApresConciliacao = class(TForm)
    Panel124: TPanel;
    Bt_Sair: TJvXPButton;
    Gb_ConcManutExtrato: TGroupBox;
    Gb_ConcManutPagtos: TGroupBox;
    Dbg_ConcManutPagto: TDBGridJul;
    Dbg_ConcManutExtrato: TDBGridJul;
    Lab_OBS: TLabel;
    Dbe_ConcManutTotal: TDBEdit;
    Label1: TLabel;
    procedure Bt_SairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmApresConciliacao: TFrmApresConciliacao;

implementation

uses UDMBancosConciliacao, SysUtils;

{$R *.dfm}

procedure TFrmApresConciliacao.Bt_SairClick(Sender: TObject);
begin
  Close;
  
end;

procedure TFrmApresConciliacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMConciliacao.CDS_CMApresExtratos.Close;
  DMConciliacao.CDS_CMApresPagtos.Close;

  DMConciliacao.CDS_CMApresExtratosDep.Close;
  DMConciliacao.CDS_CMApresDepositos.Close;

end;

procedure TFrmApresConciliacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key=VK_Escape Then
   Bt_SairClick(Self);
end;

procedure TFrmApresConciliacao.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

end;

procedure TFrmApresConciliacao.FormShow(Sender: TObject);
begin
  Dbe_ConcManutTotal.Text:=FormatFloat(',0.00',StrToCurr(Dbe_ConcManutTotal.Text));

end;

end.
