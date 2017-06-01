program PArtesanalis;

uses
  Forms,
  UArtesanalis in 'UArtesanalis.pas' {FrmArtesanalis},
  UDMArtesanalis in 'UDMArtesanalis.pas' {DMArtesanalis: TDataModule},
  DK_Procs1 in '..\..\..\Rotinas Delphi\DK_Procs1.pas' {FDK_Procs1},
  uj_001 in '..\..\..\Rotinas Delphi\Janelas\J_001 Login\uj_001.pas' {J_001},
  uj_002 in '..\..\..\Rotinas Delphi\Janelas\J_002 Mensagens\uj_002.pas' {J_002},
  UFrmMateriaPrimaCadastro in 'UFrmMateriaPrimaCadastro.pas' {FrmMateriaPrimaCadastro},
  UPesquisa in 'UPesquisa.pas' {FrmPesquisa},
  UFrmProdutoCadastro in 'UFrmProdutoCadastro.pas' {FrmProdutoCadastro},
  UFrmMovimentos in 'UFrmMovimentos.pas' {FrmMovimentos};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Artesalalis';
  Application.CreateForm(TFrmArtesanalis, FrmArtesanalis);
  Application.CreateForm(TDMArtesanalis, DMArtesanalis);
  Application.CreateForm(TFDK_Procs1, FDK_Procs1);
  Application.CreateForm(TJ_001, J_001);
  Application.CreateForm(TJ_002, J_002);
  Application.CreateForm(TFrmMateriaPrimaCadastro, FrmMateriaPrimaCadastro);
  Application.CreateForm(TFrmProdutoCadastro, FrmProdutoCadastro);
  Application.CreateForm(TFrmMovimentos, FrmMovimentos);
  //  Application.CreateForm(TFrmPesquisa, FrmPesquisa);
  Application.Run;
end.