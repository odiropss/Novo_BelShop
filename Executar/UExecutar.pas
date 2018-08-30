unit UExecutar;
{
Manter no servidor Junto com o Aplicativo Principal (PBelShop):
  - WinRAR.exe
  - PBelShop.rar
  - PMovtosEmpresas.rar
  - TradDevExpBr.rar
  - PAtualizaDocWord.rar
  - PExecutar.exe
  - PExecutar.rar
  - PExecutar_OK.exe
  - VisualR4.exe
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Shellapi, ComCtrls, Buttons, ExtCtrls;

type
  TFrmExecutar = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdtOrigem: TEdit;
    EdtDestino: TEdit;
    EdtAplicativo: TEdit;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Const
   cr = #13#10;

var
  FrmExecutar: TFrmExecutar;

  bPastaRelatorio: Boolean;

implementation

uses UEntrada, SysConst;

{$R *.dfm}

procedure TFrmExecutar.FormShow(Sender: TObject);
Var
  SR: TSearchRec;
  I: integer;
  sMensagem, Origem, Destino: String;
begin

  sMensagem:='';
  If Trim(EdtDestino.Text)<>'' Then
  Begin
    // Cria Pastas se Necessario ===============================================
    FrmExecutar.Refresh;
    If not DirectoryExists(EdtDestino.Text) Then
     ForceDirectories(EdtDestino.Text);

    //==========================================================================
    // Copia WinRAR ============================================================
    //==========================================================================
    If Not fileexists(EdtDestino.Text+'WinRAR.exe') then
    Begin
      If Not fileexists(EdtOrigem.Text+'WinRAR.exe') then
      Begin
        ShowMessage('O Arquivo Abaixo Não Foi Encontrado !!'+cr+'Entrar em Contato com o ODIR !!'+cr+cr+'WinRAR.exe');
        Application.Terminate;
        Exit;
      End;

      i := FindFirst(EdtOrigem.Text+'WinRAR.exe', faAnyFile, SR);
      FrmExecutar.Refresh;
      while i = 0 do
      begin
        if (SR.Attr and faDirectory) <> faDirectory then
        begin
          Origem := EdtOrigem.Text + SR.Name;
          Destino := EdtDestino.Text + SR.Name;
          CopyFile(PChar(Origem), PChar(Destino), False);
        end;
        i := FindNext(SR);
      end;
    End; // If Not fileexists(EdtDestino.Text+'WinRAR.exe') then
    // Copia WinRAR ============================================================
    //==========================================================================

    //==========================================================================
    // Copia Executável PBelShop ===============================================
    //==========================================================================
    If fileexists(EdtDestino.Text+'PBelShop.rar') then
     DeleteFile(EdtDestino.Text+'PBelShop.rar');

    If Not fileexists(EdtOrigem.Text+'PBelShop.rar') then
    Begin
      ShowMessage('O Arquivo Abaixo Não Foi Encontrado !!'+cr+'Entrar em Contato com o ODIR !!'+cr+cr+'PBelShop.rar');
      Application.Terminate;
      Exit;
    End;

    i := FindFirst(EdtOrigem.Text+'PBelShop.rar', faAnyFile, SR);
    FrmExecutar.Refresh;
    while i = 0 do
    begin
      if (SR.Attr and faDirectory) <> faDirectory then
      begin
        Origem := EdtOrigem.Text + SR.Name;
        Destino := EdtDestino.Text + SR.Name;
        CopyFile(PChar(Origem), PChar(Destino), False);
      end;
      i := FindNext(SR);
    end;

    If fileexists(EdtDestino.Text+'PBelShop.exe') then
     Begin
       If DeleteFile(EdtDestino.Text+'PBelShop.exe') Then
        winexec(PChar(EdtDestino.Text+'WinRAR.exe e '+EdtDestino.Text+'PBelShop.rar '+EdtDestino.Text),sw_normal);
     End
    Else // If fileexists(EdtDestino.Text+'PBelShop.exe') then
     Begin
       winexec(PChar(EdtDestino.Text+'WinRAR.exe e '+EdtDestino.Text+'PBelShop.rar '+EdtDestino.Text),sw_normal);
     End; // If fileexists(EdtDestino.Text+'PBelShop.exe') then
    // Copia Executável PBelShop ===============================================
    //==========================================================================

    //==========================================================================
    // Copia Executável PCriptografiaGeoBeauty =================================
    //==========================================================================
    If fileexists(EdtDestino.Text+'PCriptografiaGeoBeauty.rar') then
     DeleteFile(EdtDestino.Text+'PCriptografiaGeoBeauty.rar');

    If Not fileexists(EdtOrigem.Text+'PCriptografiaGeoBeauty.rar') then
    Begin
      ShowMessage('O Arquivo Abaixo Não Foi Encontrado !!'+cr+'Entrar em Contato com o ODIR !!'+cr+cr+'PCriptografiaGeoBeauty.rar');
      Application.Terminate;
      Exit;
    End;

    i := FindFirst(EdtOrigem.Text+'PCriptografiaGeoBeauty.rar', faAnyFile, SR);
    FrmExecutar.Refresh;
    while i = 0 do
    begin
      if (SR.Attr and faDirectory) <> faDirectory then
      begin
        Origem := EdtOrigem.Text + SR.Name;
        Destino := EdtDestino.Text + SR.Name;
        CopyFile(PChar(Origem), PChar(Destino), False);
      end;
      i := FindNext(SR);
    end;

    If fileexists(EdtDestino.Text+'PCriptografiaGeoBeauty.exe') then
     Begin
       If DeleteFile(EdtDestino.Text+'PCriptografiaGeoBeauty.exe') Then
        winexec(PChar(EdtDestino.Text+'WinRAR.exe e '+EdtDestino.Text+'PCriptografiaGeoBeauty.rar '+EdtDestino.Text),sw_normal);
     End
    Else // If fileexists(EdtDestino.Text+'PCriptografiaGeoBeauty.exe') then
     Begin
       winexec(PChar(EdtDestino.Text+'WinRAR.exe e '+EdtDestino.Text+'PCriptografiaGeoBeauty.rar '+EdtDestino.Text),sw_normal);
     End; // If fileexists(EdtDestino.Text+'PCriptografiaGeoBeauty.exe') then
    // Copia Executável PCriptografiaGeoBeauty =================================
    //==========================================================================

    //==========================================================================
    // Copia Executável PSeparacaoDoctos =======================================
    //==========================================================================
    If fileexists(EdtDestino.Text+'PSeparacaoDoctos.rar') then
     DeleteFile(EdtDestino.Text+'PSeparacaoDoctos.rar');

    If Not fileexists(EdtOrigem.Text+'PSeparacaoDoctos.rar') then
    Begin
      ShowMessage('O Arquivo Abaixo Não Foi Encontrado !!'+cr+'Entrar em Contato com o ODIR !!'+cr+cr+'PSeparacaoDoctos.rar');
      Application.Terminate;
      Exit;
    End;

    i := FindFirst(EdtOrigem.Text+'PSeparacaoDoctos.rar', faAnyFile, SR);
    FrmExecutar.Refresh;
    while i = 0 do
    begin
      if (SR.Attr and faDirectory) <> faDirectory then
      begin
        Origem := EdtOrigem.Text + SR.Name;
        Destino := EdtDestino.Text + SR.Name;
        CopyFile(PChar(Origem), PChar(Destino), False);
      end;
      i := FindNext(SR);
    end;

    If fileexists(EdtDestino.Text+'PSeparacaoDoctos.exe') then
     Begin
      If DeleteFile(EdtDestino.Text+'PSeparacaoDoctos.exe') Then
       winexec (PChar(EdtDestino.Text+'WinRAR.exe e '+EdtDestino.Text+'PSeparacaoDoctos.rar '+EdtDestino.Text),sw_normal);
     End
    Else // If fileexists(EdtDestino.Text+'PSeparacaoDoctos.exe') then
     Begin
       winexec (PChar(EdtDestino.Text+'WinRAR.exe e '+EdtDestino.Text+'PSeparacaoDoctos.rar '+EdtDestino.Text),sw_normal);
     End; // If fileexists(EdtDestino.Text+'PSeparacaoDoctos.exe') then
    // Copia Executável PSeparacaoDoctos =======================================
    //==========================================================================

    //==========================================================================
    // Retirei Fora em 29/08/2018 ==============================================
    // Copia Executável PMovtosEmpresas ========================================
    //==========================================================================
//    If fileexists(EdtDestino.Text+'PMovtosEmpresas.rar') then
//     DeleteFile(EdtDestino.Text+'PMovtosEmpresas.rar');
//
//    If Not fileexists(EdtOrigem.Text+'PMovtosEmpresas.rar') then
//    Begin
//      ShowMessage('O Arquivo Abaixo Não Foi Encontrado !!'+cr+'Entrar em Contato com o ODIR !!'+cr+cr+'PMovtosEmpresas.rar');
//      Application.Terminate;
//      Exit;
//    End;
//
//    i := FindFirst(EdtOrigem.Text+'PMovtosEmpresas.rar', faAnyFile, SR);
//    FrmExecutar.Refresh;
//    while i = 0 do
//    begin
//      if (SR.Attr and faDirectory) <> faDirectory then
//      begin
//        Origem := EdtOrigem.Text + SR.Name;
//        Destino := EdtDestino.Text + SR.Name;
//        CopyFile(PChar(Origem), PChar(Destino), False);
//      end;
//      i := FindNext(SR);
//    end;
//
//    If fileexists(EdtDestino.Text+'PMovtosEmpresas.exe') then
//     Begin
//      If DeleteFile(EdtDestino.Text+'PMovtosEmpresas.exe') Then
//       winexec (PChar(EdtDestino.Text+'WinRAR.exe e '+EdtDestino.Text+'PMovtosEmpresas.rar '+EdtDestino.Text),sw_normal);
//     End
//    Else // If fileexists(EdtDestino.Text+'PMovtosEmpresas.exe') then
//     Begin
//       winexec (PChar(EdtDestino.Text+'WinRAR.exe e '+EdtDestino.Text+'PMovtosEmpresas.rar '+EdtDestino.Text),sw_normal);
//     End; // If fileexists(EdtDestino.Text+'PMovtosEmpresas.exe') then
    // Retirei Fora em 29/08/2018 ==============================================
    // Copia Executável PMovtosEmpresas ========================================
    //==========================================================================

    //==========================================================================
    // Copia Executável Relatório Visual (VisualR4.exe) =============================
    //==========================================================================
    If fileexists(EdtDestino.Text+'VisualR4.rar') then
     DeleteFile(EdtDestino.Text+'VisualR4.rar');

    If Not fileexists(EdtOrigem.Text+'VisualR4.rar') then
    Begin
      ShowMessage('O Arquivo Abaixo Não Foi Encontrado !!'+cr+'Entrar em Contato com o ODIR !!'+cr+cr+'VisualR4.rar');
      Application.Terminate;
      Exit;
    End;

    i := FindFirst(EdtOrigem.Text+'VisualR4.rar', faAnyFile, SR);
    FrmExecutar.Refresh;
    while i = 0 do
    begin
      if (SR.Attr and faDirectory) <> faDirectory then
      begin
        Origem := EdtOrigem.Text + SR.Name;
        Destino := EdtDestino.Text + SR.Name;
        CopyFile(PChar(Origem), PChar(Destino), False);
      end;
      i := FindNext(SR);
    end;

    If fileexists(EdtDestino.Text+'VisualR4.exe') then
     Begin
      If DeleteFile(EdtDestino.Text+'VisualR4.exe') Then
       winexec (PChar(EdtDestino.Text+'WinRAR.exe e '+EdtDestino.Text+'VisualR4.rar '+EdtDestino.Text),sw_normal);
     End
    Else // If fileexists(EdtDestino.Text+'VisualR4.exe') then
     Begin
       winexec (PChar(EdtDestino.Text+'WinRAR.exe e '+EdtDestino.Text+'VisualR4.rar '+EdtDestino.Text),sw_normal);
     End; // If fileexists(EdtDestino.Text+'VisualR4.exe') then
    // Copia Executável Relatório Visual (VisualR4.exe) =============================
    //==========================================================================

    //==========================================================================
    // Copia Tradução DevExpress ===============================================
    //==========================================================================
    If fileexists(EdtDestino.Text+'TradDevExpBr.rar') then
     DeleteFile(EdtDestino.Text+'TradDevExpBr.rar');

    If Not fileexists(EdtOrigem.Text+'TradDevExpBr.rar') then
    Begin
      ShowMessage('O Arquivo Abaixo Não Foi Encontrado !!'+cr+'Entrar em Contato com o ODIR !!'+cr+cr+'TradDevExpBr.rar');
      Application.Terminate;
      Exit;
    End;

    i := FindFirst(EdtOrigem.Text+'TradDevExpBr.rar', faAnyFile, SR);
    FrmExecutar.Refresh;
    while i = 0 do
    begin
      if (SR.Attr and faDirectory) <> faDirectory then
      begin
        Origem := EdtOrigem.Text + SR.Name;
        Destino := EdtDestino.Text + SR.Name;
        CopyFile(PChar(Origem), PChar(Destino), False);
      end;
      i := FindNext(SR);
    end;

    If fileexists(EdtDestino.Text+'TradDevExpBr.ini') then
     Begin
      If DeleteFile(EdtDestino.Text+'TradDevExpBr.ini') Then
       winexec (PChar(EdtDestino.Text+'WinRAR.exe e '+EdtDestino.Text+'TradDevExpBr.rar '+EdtDestino.Text),sw_normal);
     End
    Else // If fileexists(EdtDestino.Text+'TradDevExpBr.ini') then
     Begin
       winexec (PChar(EdtDestino.Text+'WinRAR.exe e '+EdtDestino.Text+'TradDevExpBr.rar '+EdtDestino.Text),sw_normal);
     End; // If fileexists(EdtDestino.Text+'TradDevExpBr.ini') then
    // Copia Tradução DevExpress ===============================================
    //==========================================================================

    //==========================================================================
    // Retirei em 29/08/2018 ===================================================
    // Copia Executável PAtualizaDocWord =======================================
    //==========================================================================
//    If fileexists(EdtDestino.Text+'PAtualizaDocWord.rar') then
//     DeleteFile(EdtDestino.Text+'PAtualizaDocWord.rar');
//
//    If Not fileexists(EdtOrigem.Text+'PAtualizaDocWord.rar') then
//    Begin
//      ShowMessage('O Arquivo Abaixo Não Foi Encontrado !!'+cr+'Entrar em Contato com o ODIR !!'+cr+cr+'PAtualizaDocWord.rar');
//      Application.Terminate;
//      Exit;
//    End;
//
//    i := FindFirst(EdtOrigem.Text+'PAtualizaDocWord.rar', faAnyFile, SR);
//    FrmExecutar.Refresh;
//    while i = 0 do
//    begin
//      if (SR.Attr and faDirectory) <> faDirectory then
//      begin
//        Origem := EdtOrigem.Text + SR.Name;
//        Destino := EdtDestino.Text + SR.Name;
//        CopyFile(PChar(Origem), PChar(Destino), False);
//      end;
//      i := FindNext(SR);
//    end;
//
//    If fileexists(EdtDestino.Text+'PAtualizaDocWord.exe') then
//     Begin
//       If DeleteFile(EdtDestino.Text+'PAtualizaDocWord.exe') Then
//        winexec(PChar(EdtDestino.Text+'WinRAR.exe e '+EdtDestino.Text+'PAtualizaDocWord.rar '+EdtDestino.Text),sw_normal);
//     End
//    Else // If fileexists(EdtDestino.Text+'PAtualizaDocWord.exe') then
//     Begin
//        winexec(PChar(EdtDestino.Text+'WinRAR.exe e '+EdtDestino.Text+'PAtualizaDocWord.rar '+EdtDestino.Text),sw_normal);
//     End; // If fileexists(EdtDestino.Text+'PAtualizaDocWord.exe') then
    // Retirei em 29/08/2018 ===================================================
    // Copia Executável PAtualizaDocWord =======================================
    //==========================================================================

    //==========================================================================
    // Copia Relatorios ========================================================
    //==========================================================================
    If bPastaRelatorio Then
    Begin
      If not DirectoryExists(EdtDestino.Text+'Relatorios\') Then
       ForceDirectories(EdtDestino.Text+'Relatorios\');

      i := FindFirst(EdtOrigem.Text+'Relatorios\'+'*.frf', faAnyFile, SR);
      FrmExecutar.Refresh;
      while i = 0 do
      begin
        if (SR.Attr and faDirectory) <> faDirectory then
        begin
          Origem := EdtOrigem.Text+'Relatorios\' + SR.Name;
          Destino := EdtDestino.Text+'Relatorios\' + SR.Name;
          CopyFile(PChar(Origem), PChar(Destino), False);
        end;
        i := FindNext(SR);
      end;
    End; // If bPastaRelatorio Then
    // Copia Relatorios ========================================================
    //==========================================================================

    //==========================================================================
    // Copia Arquivos.ini ======================================================
    //==========================================================================
    FrmExecutar.Refresh;
    i := FindFirst(EdtOrigem.Text+'*.ini', faAnyFile, SR);
    while i = 0 do
    begin
      if (SR.Attr and faDirectory) <> faDirectory then
      begin
        Origem := EdtOrigem.Text + SR.Name;
        Destino := EdtDestino.Text + SR.Name;
        CopyFile(PChar(Origem), PChar(Destino), False);
      end;
      i := FindNext(SR);
    end;
    // Copia Arquivos.ini ======================================================
    //==========================================================================

    //==========================================================================
    // Copia fbclient.dll ======================================================
    //==========================================================================
    If fileexists(EdtDestino.Text+'fbclient.dll') then
     DeleteFile(EdtDestino.Text+'fbclient.dll');

    i := FindFirst(EdtOrigem.Text+'fbclient.dll', faAnyFile, SR);
    FrmExecutar.Refresh;
    while i = 0 do
    begin
      if (SR.Attr and faDirectory) <> faDirectory then
      begin
        Origem := EdtOrigem.Text + SR.Name;
        Destino := EdtDestino.Text + SR.Name;
        CopyFile(PChar(Origem), PChar(Destino), False);
      end;
      i := FindNext(SR);
    end;
    // Copia fbclient.dll ======================================================
    //==========================================================================

    //==========================================================================
    // Copia gds32.dll==========================================================
    //==========================================================================
    If fileexists(EdtDestino.Text+'gds32.dll') then
     DeleteFile(EdtDestino.Text+'gds32.dll');

    i := FindFirst(EdtOrigem.Text+'gds32.dll', faAnyFile, SR);
    FrmExecutar.Refresh;
    while i = 0 do
    begin
      if (SR.Attr and faDirectory) <> faDirectory then
      begin
        Origem := EdtOrigem.Text + SR.Name;
        Destino := EdtDestino.Text + SR.Name;
        CopyFile(PChar(Origem), PChar(Destino), False);
      end;
      i := FindNext(SR);
    end;
    // Copia gds32.dll==========================================================
    //==========================================================================

    //==========================================================================
    // Executa EdtAplicativo.Text ==============================================
    //==========================================================================
    FrmExecutar.Refresh;
    // ShellExecute(handle, 'open', PChar(EdtAplicativo.Text), '', PChar(EdtDestino.Text), sw_shownormal);
    ShellExecute(handle, 'open', PChar(EdtAplicativo.Text), PChar(EdtOrigem.Text+'PBelShop.exe'), PChar(EdtDestino.Text), sw_shownormal);
    // Executa EdtAplicativo.Text ==============================================
    //==========================================================================

    FrmEntrada.Free;
    Application.Terminate;
  End; // If Trim(EdtDestino.Text)<>'' Then
end;

procedure TFrmExecutar.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmExecutar.FormCreate(Sender: TObject);
Var
  Arq: TextFile;
  s, ss: String;
  i: Integer;
  sPasta: String;
begin
  sPasta:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  If fileexists(sPasta+'ExecutarRedeLocal.ini') then 
   AssignFile(Arq,sPasta+'ExecutarRedeLocal.ini')
  Else
   AssignFile(Arq,sPasta+'ExecutarRedeExterna.ini');
   

  Reset(Arq);
  Readln(Arq,s);
  While not Eof(Arq) do
  Begin

   i:=pos('=', s);
   ss:=Trim(Copy(s,(i+1),length(s)-1));
   If ss='SIM' Then
    bPastaRelatorio:=True
   Else
    bPastaRelatorio:=False;
   Readln(Arq,s);

   i:=pos('=', s);
   EdtOrigem.Text:=IncludeTrailingPathDelimiter(Trim(Copy(s,(i+1),length(s)-1)));
   Readln(Arq,s);

   i:=pos('=', s);
   EdtDestino.Text:=IncludeTrailingPathDelimiter(Trim(Copy(s,(i+1),length(s)-1)));
   Readln(Arq,s);

   i:=pos('=', s);
   EdtAplicativo.Text:=Trim(Copy(s,(i+1),length(s)-1));
   Readln(Arq,s);

  End;
  CloseFile(Arq);
end;

end.

{
    // Copia DLL'S Executaveis ===================================================
    FrmExecutar.Refresh;
    i := FindFirst(EdtOrigem.Text+'*.DLL', faAnyFile, SR);
    while i = 0 do
    begin
      // Copia para Pasta de Destino
      if (SR.Attr and faDirectory) <> faDirectory then
      begin
        Origem := EdtOrigem.Text + SR.Name;
        Destino := EdtDestino.Text + SR.Name;
        CopyFile(PChar(Origem), PChar(Destino), False);
      end;

      // Copia para Pasta do Windows
      If DirectoryExists('C:\Windows\System\') Then
      Begin
        Destino := 'C:\Windows\System\'+ SR.Name;
        CopyFile(PChar(Origem), PChar(Destino), True);
      End;

      If DirectoryExists('C:\Windows\System32\') Then
      Begin
        Destino := 'C:\Windows\System32\'+ SR.Name;
        CopyFile(PChar(Origem), PChar(Destino), True);
      End;

      If DirectoryExists('C:\WINNT\System32\') Then
      Begin
        Destino := 'C:\WINNT\System32\'+ SR.Name;
        CopyFile(PChar(Origem), PChar(Destino), True);
      End;

      If DirectoryExists('C:\Windows\SysWOW64\') Then
      Begin
        Destino := 'C:\Windows\SysWOW64\'+ SR.Name;
        CopyFile(PChar(Origem), PChar(Destino), True);
      End;

      i := FindNext(SR);
    end;
}
