unit unifinalizarvendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids;

type
  Tfrmfinalizarvendas = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    btncliente: TBitBtn;
    editvalorpago: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    edittroco: TEdit;
    editformapgto: TEdit;
    editcodcli: TEdit;
    editcliente: TEdit;
    editlocalentrega: TEdit;
    Button1: TButton;
    Button2: TButton;
    BitBtn2: TBitBtn;
    editcodvenda: TEdit;
    procedure editvalorpagoExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnclienteClick(Sender: TObject);
    procedure editvalorpagoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure finalizar;
    procedure clientedebito;
    procedure baixaestoque;
    procedure abrir;
  end;

var
  frmfinalizarvendas: Tfrmfinalizarvendas;
  

implementation

uses unidmcaixa, unicaixa, unicaixacliente;

{$R *.DFM}
function TrocaVirgPPto(Valor: string): String;
var i:integer;
begin
if Valor <> ' ' then
begin
for i := 0 to Length(Valor) do
begin
if Valor[i]='.' then
begin
Valor[i]:=',';
end
else if Valor[i] = ',' then
begin
Valor[i]:='.';
end;
end;
end;
Result := valor;
end;

procedure Tfrmfinalizarvendas.abrir;
begin
  With dm.sqlitens do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from itensvendas  where codvenda = "' + editcodvenda.text +'"  ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;

end;


procedure Tfrmfinalizarvendas.baixaestoque;
//var
// marca,marca2:  TBookmarklist ;
begin
//marca:= dm.sqlprodutos.GetBookmark;
//marca2:= dm.sqlitens.GetBookmark;
  try
 // dm.sqlprodutos.DisableControls;
 // dm.sqlitens.DisableControls;

//Gauge1.Visible:= true;
//Gauge1.Progress:=0;
//Gauge1.MaxValue:= dm.sqlitens.RecordCount;
      abrir;
          dm.sqlitens.First;
While not dm.sqlitens.Eof do
  Begin
  With dm.sqlprodutos do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update produtos set estoque = estoque - "'+TrocaVirgPPto(dm.sqlitensQtd.AsString)+'" ' ) ;


  Sql.Add('   where codprod = "'+dm.sqlitensCodprod.AsString+'" ') ;
  ExecSql;

  end;

 //   Gauge1.Progress:=Gauge1.Progress+1;
    dm.sqlitens.Next;
   End;
  finally
 //Gauge1.Visible:= false;

// dm.sqlprodutos.GotoBookmark(marca);
// dm.sqlitens.GotoBookmark(marca2);

 //dm.sqlitens.EnableControls;
 //dm.sqlprodutos.EnableControls;

// dm.sqlprodutos.FreeBookmark(marca);
// dm.sqlitens.FreeBookmark(marca2);
 end;
    // dm.tbldadositens.edit;
     //dm.tbldadositensFechado.AsString:= 'S';
     //dm.tbldadositens.Post;



     
   // frmvendas.FormRefresh(self);

     End;



procedure Tfrmfinalizarvendas.clientedebito;
begin
if editcodcli.Text <> '' then begin
  With dm.sqlclientes do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update clientes set saldo = saldo + "'+TrocaVirgPPto( dm.sqlcaixaTotal.AsString)+'"' ) ;


  Sql.Add('   where codcli = "'+editcodcli.Text+'" ') ;
  ExecSql;

  end;
  end;   end;

procedure Tfrmfinalizarvendas.finalizar;
var varcodvenda: string;
begin
varcodvenda:= dm.sqlcaixaCodvenda.AsString;
 With dm.sqlcaixa do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update dadosvendas set codcli =  "'+(editcodcli.Text)+'", cliente = "'+editcliente.Text+'" ,' ) ;


  Sql.Add(' localentrega = "'+editlocalentrega.Text+'", situacao = "FECHADO", formapgto= "'+editformapgto.Text+'"    where codvenda = "'+varcodvenda+'" ') ;
  ExecSql;

  end;
  end;

procedure Tfrmfinalizarvendas.editvalorpagoExit(Sender: TObject);
var valorpago, total: double   ;
begin
valorpago:= strtofloat(editvalorpago.text);
total:= dm.sqlcaixaTotal.Value;
edittroco.Text:= floattostr(valorpago-total);

end;

procedure Tfrmfinalizarvendas.BitBtn1Click(Sender: TObject);
begin
if editformapgto.Text = '' then begin
showmessage('Vc precisa escolher a Forma de pgto.');
end else begin
if  application.messagebox('Deseja Finalizar a Venda?',
   'Confirmação' , mb_yesno + mb_iconquestion) = mrYes then
   begin
   baixaestoque;
   clientedebito;
   finalizar;

frmcaixa.abrir;
close;
end;
end;
end;

procedure Tfrmfinalizarvendas.Button1Click(Sender: TObject);
begin
dm.sqlformapgto.Prior;
editformapgto.Text:= dm.sqlformapgtoFormaPgto.asstring;
if dm.sqlformapgtoPrazo.AsString = 'N' then
begin
btncliente.Enabled:=false;
editcodcli.Text:='';
editcliente.Text:= '';
editcliente.Enabled:=false;
end else begin
btncliente.Enabled:= true;
editcliente.Enabled:=true;
end;


end;

procedure Tfrmfinalizarvendas.Button2Click(Sender: TObject);
begin
dm.sqlformapgto.next;
editformapgto.Text:= dm.sqlformapgtoFormaPgto.asstring;

if dm.sqlformapgtoPrazo.AsString = 'N' then
begin
btncliente.Enabled:=false;
editcodcli.Text:='';
editcliente.Text:= '' ;
editcliente.Enabled:=false;
end else begin
btncliente.Enabled:= true;
editcliente.Enabled:=true;
end;
end;

procedure Tfrmfinalizarvendas.btnclienteClick(Sender: TObject);
begin
Application.CreateForm(tfrmpesqcliente,frmpesqcliente);
frmpesqcliente.showmodal;
end;

procedure Tfrmfinalizarvendas.editvalorpagoKeyPress(Sender: TObject;
  var Key: Char);
  var valorpago, total: double   ;
begin
if Not (key in ['0'..'9',#8, ',' ]) then
key := #0;



end;
procedure Tfrmfinalizarvendas.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Tfrmfinalizarvendas.FormCreate(Sender: TObject);


begin

 editcodvenda.Text:= dm.sqlcaixaCodvenda.AsString;
 editvalorpago.Text:= dm.sqlcaixaTotal.AsString;
  editlocalentrega.text:= dm.sqlcaixaLocalEntrega.AsString;
end;

end.
