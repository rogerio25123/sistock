unit unifornecedores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ComCtrls, StdCtrls, Buttons, Db, DBTables;

type
  Tfrmfornecedor = class(TForm)
    GroupBox1: TGroupBox;
    Label13: TLabel;
    Label15: TLabel;
    editfornecedor: TEdit;
    edittelefone: TEdit;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    editpesquisar: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    editexclui: TEdit;
    editmatricula: TEdit;
    BitBtn7: TBitBtn;
    BitBtn5: TBitBtn;
    DBGrid1: TDBGrid;
    editendereco: TEdit;
    Label3: TLabel;
    Label2: TLabel;
    editcnpj: TEdit;
    editoutros: TEdit;
    Label4: TLabel;
    sqlultimofornecedor: TQuery;
    sqlultimofornecedormaximofor: TIntegerField;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure alteracao;
    procedure  maximofornecedor;
    procedure abrir;
    procedure gravardados;
  end;

var
  frmfornecedor: Tfrmfornecedor;
  ultimo: integer;

implementation uses unidm;

{$R *.DFM}

procedure Tfrmfornecedor.alteracao;
 begin
 With dm2.sqlfornecedores do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update fornecedores set fornecedor = "'+editfornecedor.text+'", endereco = "'+editendereco.text+'" , ' ) ;
  Sql.Add(' telefone = "'+edittelefone.text+'", cnpj = "'+editcnpj.text+'" ,  outros = "'+editoutros.text+'" ' ) ;


  Sql.Add('   where codigo = "'+editmatricula.text+'" ') ;
  ExecSql;

  end;
  Showmessage('Dados alterados com sussesso');
   editfornecedor.Text:='';
   editendereco.text:='';
   edittelefone.text:='';
   editcnpj.text:= '';
   editoutros.text:= '';

   maximofornecedor;




  end;



procedure Tfrmfornecedor.abrir;
begin
  With dm2.sqlfornecedores do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from fornecedores');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;
  dm2.sqlfornecedores.Last;
end;



procedure  Tfrmfornecedor.maximofornecedor;
 begin
  With sqlultimofornecedor do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT MAX( codigo  ) maximofor  FROM fornecedores  ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;
  ultimo:= 0;
  ultimo := ultimo + sqlultimofornecedormaximofor.AsInteger+1;

 editmatricula.text := inttostr(ultimo);
// edittitulo.text := dm.sqlultimousuultimamatricula.AsString;
end;


procedure Tfrmfornecedor.gravardados;
begin

  With dm2.sqlcontasapagar do
  Begin
   maximofornecedor;
  Close;
  Sql.Clear;
  Sql.Add('Insert Into fornecedores (codigo,fornecedor,endereco,  ' ) ;
  Sql.Add('  telefone, cnpj, outros  )   ') ;

   Sql.Add(' values ( "' + inttostr(ultimo)+ '"  , "' + editfornecedor.Text + '" , ');
   Sql.Add('  "' + editendereco.text +'"  , "' +(edittelefone.text) + '" , "' + editcnpj.text + '", "' + editoutros.text + '"  )');



  ExecSql;
   // End
 // Except
  Showmessage('Dados gravados com sussesso');

  editfornecedor.Text:='';
   editendereco.text:='';
   edittelefone.text:='';
   editcnpj.text:= '';
   editoutros.text:= '';


  End;

  abrir;
  maximofornecedor;

    end;


procedure Tfrmfornecedor.BitBtn5Click(Sender: TObject);
begin
close;
end;

procedure Tfrmfornecedor.BitBtn2Click(Sender: TObject);
begin
with dm2.sqlfornecedores do
     begin
     Close;
     SQL.Clear;
     SQL.Add('Select * from fornecedores where UPPER(fornecedor)LIKE UPPEr(''%'' + :3 + ''%'')');
     params[0].AsString := editpesquisar.text;
     open;
     end;

end;

procedure Tfrmfornecedor.BitBtn3Click(Sender: TObject);
begin
if  application.messagebox('Deseja Excluir?',
   'Confirmação' , mb_yesno + mb_iconquestion) = mrYes then
   begin

with dm2.sqlfornecedores do
     begin
     Close;
     SQL.Clear;
     SQL.Add('DELETE FROM fornecedores where codigo = "' + editexclui.text + '" ');
     ExecSQL;

end;
editexclui.text:='';
abrir;
maximofornecedor;

end;

end;

procedure Tfrmfornecedor.BitBtn1Click(Sender: TObject);
begin
if tag = 1 then
begin
alteracao;

tag:=0;
abrir;
editfornecedor.SetFocus;
end else begin
if tag= 0 then
begin
if editfornecedor.Text = '' then
begin
ShowMessage('Digite o nome do fornecedor');
end else begin
gravardados;
abrir;
dm2.sqlfornecedores.Last;
end;


end;
end;

end;

procedure Tfrmfornecedor.BitBtn4Click(Sender: TObject);
begin
editfornecedor.text:= dm2.sqlfornecedoresFornecedor.asstring;
editendereco.Text:= dm2.sqlfornecedoresEndereco.AsString;
edittelefone.Text:= dm2.sqlfornecedoresTelefone.AsString;
editcnpj.Text:= dm2.sqlfornecedoresCnpj.AsString;
editoutros.Text:= dm2.sqlfornecedoresOutros.AsString;


editmatricula.Text:= dm2.sqlfornecedoresCodigo.AsString;

tag:=1;

end;

end.
