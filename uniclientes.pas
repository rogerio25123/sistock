unit uniclientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Buttons;

type
  Tfrmclientes = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Editcliente: TEdit;
    editendereco: TEdit;
    edittelefone: TEdit;
    editcpf: TEdit;
    editrg: TEdit;
    editnasc: TEdit;
    editfantasia: TEdit;
    editcargo: TEdit;
    editsaldo: TEdit;
    editlimite: TEdit;
    editbloqueio: TEdit;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    editpesquisar: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    editexclui: TEdit;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DBGrid1: TDBGrid;
    editcodcli: TEdit;
    GroupBox3: TGroupBox;
    edittipo: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure editbloqueioKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edittipoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure gravardados;
    procedure  ultimamatricula;
    procedure abrir;
     procedure alteracao;
  end;

var
  frmclientes: Tfrmclientes;
  ultimo: integer;

implementation

uses unidm;

{$R *.DFM}
 procedure Tfrmclientes.alteracao;
 begin
 With dm2.sqlclientes do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update clientes set cliente = "'+editcliente.text+'", endereco = "'+editendereco.text+'" , ' ) ;
  Sql.Add(' telefone = "'+edittelefone.text+'", cpf = "'+editcpf.text+'" , ' ) ;
  Sql.Add(' rg = "'+editrg.text+'", datanasc = "'+editnasc.text+'" , ' ) ;
  Sql.Add(' fantasia = "'+editfantasia.text+'", cargo = "'+editcargo.text+'",  ' ) ;
  Sql.Add(' saldo = "'+editsaldo.text+'", limite = "'+editlimite.text+'",  ' ) ;

  Sql.Add(' bloqueio = "'+editbloqueio.text+'", tipocliente = "'+edittipo.text+'"   where codcli = "'+editcodcli.text+'" ') ;
  ExecSql;

  end;
  Showmessage('Dados alterados com sussesso');
    editcliente.text:='';
   editendereco.text:='';
   edittelefone.text:='';
   editcpf.text:='';
   editrg.text:='';
   editnasc.text:='';
   editfantasia.text:='';
   editcargo.text:='';
   editsaldo.text:='';
   editlimite.text:='';
   editbloqueio.text:='';
//   edittipo.text:='';

   ultimamatricula;

   


  end;




procedure Tfrmclientes.abrir;
begin
  With dm2.sqlclientes do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from clientes  order by codcli asc ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;
  dm2.sqlclientes.Last;
end;


procedure  Tfrmclientes.ultimamatricula;
 begin
  With dm2.sqlultimocli do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT MAX( codcli + 1 + 0 ) ultimocli  FROM clientes  ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;
     if (dm2.sqlultimocliultimocli.AsString = '' )  then
  begin
  ultimo:= 1;
  end else begin
  ultimo:= 0;
  ultimo:= dm2.sqlultimocliultimocli.AsInteger;
  end;

 editcodcli.text := inttostr(ultimo);
// edittitulo.text := dm2.sqlultimousuultimamatricula.AsString;
end;


procedure Tfrmclientes.gravardados;
begin

  With dm2.sqlclientes do
  Begin
   ultimamatricula;
  Close;
  Sql.Clear;
  Sql.Add('Insert Into clientes (codcli,cliente,endereco,  ' ) ;
  Sql.Add('  telefone, cpf, rg ,   ') ;
    Sql.Add('  datanasc, fantasia, cargo, saldo, limite, bloqueio, tipocliente ) ');

   Sql.Add(' values ( "' + inttostr(ultimo)+ '"  , "' + Editcliente.text + '" , ');
   Sql.Add('  "' + editendereco.text +'", "' + edittelefone.text+ '"  , "' + editcpf.text + '" , "' + editrg.text + '" ,');
   Sql.Add('   "' + editnasc.text+ '"  , "' +editfantasia.text + '",  ');
   Sql.Add('  "' + editcargo.text +'", "' + editsaldo.text+ '"  , "' + editlimite.text + '", "N", "' + edittipo.text + '")  ');


  ExecSql;
   // End
 // Except
  Showmessage('dados gravados com sussesso');
   editcliente.text:='';
   editendereco.text:='';
   edittelefone.text:='';
   editcpf.text:='';
   editrg.text:='';
   editnasc.text:='';
   editfantasia.text:='';
   editcargo.text:='';
   editsaldo.text:='';
   editlimite.text:='';
   editbloqueio.text:='';
   //  edittipo.text:='';


  End;

  end;




procedure Tfrmclientes.BitBtn1Click(Sender: TObject);
begin
if tag = 1 then
begin
if Editcliente.Text = '' then
begin
ShowMessage('Por favor você deve Digitar um nome.');
 Editcliente.SetFocus;
end else  begin

alteracao;

tag:=0;
abrir;
Editcliente.SetFocus;


 end;

end else begin

if tag= 0 then
begin

if Editcliente.Text = '' then
begin
ShowMessage('Por favor você deve Digitar um nome.');
 Editcliente.SetFocus;
end else  begin

gravardados;
abrir;
dm2.sqlclientes.Last;


 end;
end;
end;

end;




procedure Tfrmclientes.BitBtn4Click(Sender: TObject);
begin
editcliente.text:= dm2.sqlclientesCliente.AsString;
editendereco.text:=dm2.sqlclientesEndereco.AsString;
edittelefone.text:=dm2.sqlclientesTelefone.AsString;
editcpf.text:=dm2.sqlclientesCPF.AsString;
editrg.text:=dm2.sqlclientesRG.AsString;
editnasc.text:=dm2.sqlclientesDataNasc.AsString;
editfantasia.text:=dm2.sqlclientesFantasia.AsString;
editcargo.text:=dm2.sqlclientesCargo.AsString;
editsaldo.text:=dm2.sqlclientesSaldo.AsString;
editlimite.text:=dm2.sqlclientesLimite.AsString;
editbloqueio.text:=dm2.sqlclientesBloqueio.AsString;
edittipo.text:=dm2.sqlclientestipocliente.AsString;


editcodcli.Text:= dm2.sqlclientesCodCli.AsString;

tag:=1;

end;

procedure Tfrmclientes.BitBtn2Click(Sender: TObject);
begin
with dm2.sqlclientes do
     begin
     Close;
     SQL.Clear;
     SQL.Add('Select * from clientes where cliente  LIKE   "%' + editpesquisar.text + '%"  order by cliente');

    // params[0].AsString := editpesquisar.text;
     open;
     end;

end;

procedure Tfrmclientes.BitBtn3Click(Sender: TObject);
begin
if  application.messagebox('Deseja Excluir?',
   'Confirmação' , mb_yesno + mb_iconquestion) = mrYes then
   begin

with dm2.sqlclientes do
     begin
     Close;
     SQL.Clear;
     SQL.Add('DELETE FROM clientes where codcli = "' + editexclui.text + '" ');
     ExecSQL;

end;
editexclui.text:='';
abrir;
ultimamatricula;

end;

end;

procedure Tfrmclientes.BitBtn5Click(Sender: TObject);
begin
close;
end;

procedure Tfrmclientes.editbloqueioKeyPress(Sender: TObject;
  var Key: Char);
begin
if Not (key in [#8, 'N','S','n','s']) then
key := #0;

end;

procedure Tfrmclientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
  vk_Escape: close;

end;

end;

procedure Tfrmclientes.FormCreate(Sender: TObject);
begin
abrir;
end;

procedure Tfrmclientes.edittipoKeyPress(Sender: TObject; var Key: Char);
begin
if Not (key in [#8, '1','2','3']) then
key := #0;
end;

end.
