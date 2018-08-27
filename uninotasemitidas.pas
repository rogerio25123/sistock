unit uninotasemitidas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, Mask, DBCtrls, ComCtrls, Menus;

type
  Tfrmnotasemitidas = class(TForm)
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    editdata: TEdit;
    PopupMenu1: TPopupMenu;
    CancelarEntrada1: TMenuItem;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CancelarEntrada1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure  cancelarnota;
    procedure abrir;
    procedure saidaestoque;
  end;

var
  frmnotasemitidas: Tfrmnotasemitidas;

implementation   uses unidm, univeritensentradas;

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


procedure Tfrmnotasemitidas.saidaestoque;
var
 marca,marca2:  TBookmarklist ;
begin
//marca:= dm.sqlprodutos.GetBookmark;
//marca2:= dm.sqlitens.GetBookmark;
  try
 With dm2.sqlitensentrada do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT *   FROM itensentrada where codvenda = "' + dm2.sqldadosentradaCodvenda.AsString + '" ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;

          dm2.sqlitensentrada.First;
While not dm2.sqlitensentrada.Eof do
  Begin
  With dm2.sqlprodutos do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update produtos set estoque = estoque - "'+TrocaVirgPPto(dm2.sqlitensentradaQtd.AsString)+'", ' ) ;


  Sql.Add(' precovenda = "'+TrocaVirgPPto( dm2.sqlitensentradaPreco.AsString)+'"  where codprod = "'+dm2.sqlitensentradaCodprod.AsString+'" ') ;
  ExecSql;

  end;

 //   Gauge1.Progress:=Gauge1.Progress+1;
    dm2.sqlitensentrada.Next;
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


procedure Tfrmnotasemitidas.abrir;
begin
  With dm2.sqldadosentrada do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from dadosentradas    ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;
     end;
procedure  Tfrmnotasemitidas.cancelarnota;
var varreg: String;
begin
varreg := dm2.sqldadosentradaCodvenda.AsString ;
with dm2.sqldadosentrada do
     begin
     Close;
     SQL.Clear;
     SQL.Add('DELETE FROM dadosentradas where codvenda = "' + varreg + '" ');
     ExecSQL;

end;
with dm2.sqlitensentrada do
     begin
     Close;
     SQL.Clear;
     SQL.Add('DELETE FROM itensentrada where codvenda = "' + varreg + '" ');
     ExecSQL;

end;


    end;

procedure Tfrmnotasemitidas.DBGrid1DblClick(Sender: TObject);
begin
Application.CreateForm(Tfrmveritensentrada,frmveritensentrada);
frmveritensentrada.showmodal;
end;

procedure Tfrmnotasemitidas.FormCreate(Sender: TObject);
var
A, M, D: Word;
begin
DecodeDate(Date, A, M, D);
//ShowMessage(Format('Dia %.2d do m�s %.2d de %d.', [D, M, A]));



editdata.text:= Format('%.2d/%.2d/%d', [M, D, A]);
abrir;
end;




procedure Tfrmnotasemitidas.CancelarEntrada1Click(Sender: TObject);
begin

 if  application.messagebox('Deseja da baixa no estoque?',
   'Confirma��o' , mb_yesno + mb_iconquestion) = mrYes then
   begin
   saidaestoque;

   cancelarnota;
   abrir;

 //  inserirdadosvendas;
  // total;


end;
    end;


procedure Tfrmnotasemitidas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
  vk_Escape: close;

end;
    end;
end.
