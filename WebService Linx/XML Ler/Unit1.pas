unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, StdCtrls, DB, Grids, DBGrids, SqlExpr, DBClient,
  DBXpress, Provider, xmldom, XMLIntf, msxmldom, XMLDoc, ExtCtrls;

type
  TForm1 = class(TForm)
    XMLDocument1: TXMLDocument;
    ListBox1: TListBox;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    EdtNode: TEdit;
    Button3: TButton;
    ListBox2: TListBox;
    ListBox3: TListBox;
    ListBox4: TListBox;
    ListBox5: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  StrTag: String;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
   Node, NodeChild, NodeAux:IXmlNode;
   i,x,j:integer;
   s: String;
begin
      try
        for i := 0 to XMLDocument1.DocumentElement.ChildNodes.Count - 1 do
          begin
            Node:=XMLDocument1.DocumentElement.ChildNodes[I];
            if Node.NodeName = Trim(StrTag) then
              begin
                if not VarIsNull(Node.NodeValue) then
                  begin
                    ListBox1.Items.Add('1 - '+VarToStr(Node.NodeValue));
                    Inc(x);
                  end;
               end
            else
              begin
                for j := 0 to Node.ChildNodes.Count - 1 do
                  begin
                    NodeChild:=Node.ChildNodes[j];
                    NodeAux:=NodeChild.ChildNodes.FindNode(StrTag);
                    if Assigned(NodeAux) then
                      begin
                        if not VarIsNull(NodeAux.NodeValue) then
                          begin
//                            result:=VarToStr(NodeAux.NodeValue);
                            ListBox1.Items.Add('1 - '+VarToStr(NodeAux.NodeValue));
                            Inc(x)
                          end;
                      end;
                  end;
              end;
          if x = 0  then
            abort;
        end;
    except
       on e:exception do
       begin
        Showmessage('Problemas ao ler o Tag'+#13+
            'Mensagem Original = '+e.Message);
        Abort;
       end;
     end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   StrTag:=EdtNode.Text;

end;

procedure TForm1.Button3Click(Sender: TObject);
var
  DOC:IXMLDocument;
  iii, ii,i: Integer;
  Note_Response, Node_Campos, Node_Valores: IXMLNode;
  sRetorno, sMensagem: String;
  s: String;
begin
  DOC := LoadXMLDocument('C:\Projetos\BelShop\Fontes\WebService Linx\Retornos\Retorno_LinxFaturas_ERRO.XML');

  If DOC.ChildNodes.Nodes['Microvix'].ChildNodes['ResponseResult'].ChildNodes['ResponseSuccess'].Text='False' Then
  Begin
    ShowMessage(sRetorno+' com Erro !!');
    sMensagem:='';
    For i := 0 to DOC.ChildNodes.Nodes['Microvix'].ChildNodes['ResponseResult'].ChildNodes['ResponseError'].ChildNodes.Count - 1 do
    Begin
      If DOC.ChildNodes.Nodes['Microvix'].ChildNodes['ResponseResult'].ChildNodes['ResponseError'].ChildNodes[i].NodeName='Message' Then
       sMensagem:=Trim(sMensagem+' '+
                  DOC.ChildNodes.Nodes['Microvix'].ChildNodes['ResponseResult'].ChildNodes['ResponseError'].ChildNodes[i].NodeValue);

    End;
    ShowMessage(sMensagem);
    Application.Terminate;
    Exit;
  End;

  for i := 0 to DOC.ChildNodes.Nodes['Microvix'].ChildNodes.Count - 1 do
  begin
    Note_Response := DOC.ChildNodes.Nodes['Microvix'].ChildNodes[i];
    if Note_Response.NodeName = 'ResponseData' then  // Your node(s) of interest
    begin
      // Le Campos =============================================================
      Node_Campos := Note_Response.ChildNodes.Nodes['C'];
      if Assigned(Node_Campos) then // did we find the node keeping the 'POSEX' node
      Begin
        for ii := 0 to Node_Campos.ChildNodes.Count - 1 do
         ListBox1.Items.Add(Node_Campos.ChildNodes[ii].NodeValue);
      End;

      // Le Valores =============================================================
      For iii:=0 to Note_Response.ChildNodes.Count - 1 do
      Begin
        Node_Valores := Note_Response.ChildNodes[iii];//.Nodes['R'];
//        Node_Valores := Note_Response.ChildNodes.Nodes['R'];

        // Nome do Node
        s:=VarToStr(Node_Valores.NodeName);
        If VarToStr(Node_Valores.NodeName)='R' Then
        Begin
          if Assigned(Node_Valores) then // did we find the node keeping the 'POSEX' node
          Begin
            for ii := 0 to Node_Valores.ChildNodes.Count - 1 do
            Begin
              If iii = 1 then
              Begin
                if VarIsNull(Node_Valores.ChildNodes[ii].NodeValue) Then
                 ListBox2.Items.Add('')
                Else
                 ListBox2.Items.Add(Node_Valores.ChildNodes[ii].NodeValue);
              End
            Else
              If iii = 2 then
              Begin
                if VarIsNull(Node_Valores.ChildNodes[ii].NodeValue) Then
                 ListBox3.Items.Add('')
                Else
                 ListBox3.Items.Add(Node_Valores.ChildNodes[ii].NodeValue);
              End
            Else
              If iii = 3 then
              Begin
                if VarIsNull(Node_Valores.ChildNodes[ii].NodeValue) Then
                 ListBox4.Items.Add('')
                Else
                 ListBox4.Items.Add(Node_Valores.ChildNodes[ii].NodeValue);
              End
              else
              If iii = 4 then
              Begin
                if VarIsNull(Node_Valores.ChildNodes[ii].NodeValue) Then
                 ListBox5.Items.Add('')
                Else
                 ListBox5.Items.Add(Node_Valores.ChildNodes[ii].NodeValue);
              End
              Else
              If iii = 5 then
               Break;
            End; // for ii := 0 to Node_Valores.ChildNodes.Count - 1 do
          End; // if Assigned(Node_Valores) then // did we find the node keeping the 'POSEX' node
        End; // If VarToStr(Node_Valores.NodeName)='R' Then
      End; // For iii:=0 to Note_ResponseChildNodes.Count - 1 do
    end; // if Note_Response.NodeName = 'ResponseData' then  // Your node(s) of interest
  end;
end;
procedure TForm1.ListBox1Click(Sender: TObject);
begin
   ListBox2.ItemIndex:=ListBox1.ItemIndex;
   ListBox3.ItemIndex:=ListBox1.ItemIndex;
   ListBox4.ItemIndex:=ListBox1.ItemIndex;
   ListBox5.ItemIndex:=ListBox1.ItemIndex;

end;

end.
