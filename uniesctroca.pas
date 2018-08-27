unit uniesctroca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB;

type
  Tfrmesctroca = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    srcitenstroca: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmesctroca: Tfrmesctroca;

implementation

uses unidmvendas, unitroca;

{$R *.dfm}

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


procedure Tfrmesctroca.FormCreate(Sender: TObject);
begin
  With dm.sqlitenstroca do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from itensvendas  where codvenda = "' + frmtroca.DBEdit1.text +'"   ');

  open;

  End;
end;

procedure Tfrmesctroca.BitBtn1Click(Sender: TObject);
var qtd : string;
begin
qtd := InputBox('Atenção', 'Digite a Quantidade', '1');
With dm.sqlitenstrocaentrada do
  Begin
  // ultimamatricula;
  Close;
  Sql.Clear;
  Sql.Add('Insert Into itenstrocaentrada (codtroca,produto,und,  ' ) ;
  Sql.Add('  qtd,    ') ;
    Sql.Add(' preco, codproduto) ');

   Sql.Add(' values ( "' + frmtroca.editcodtroca.Text+ '"  , "' + dm.sqlitenstrocadescricao.AsString + '" , ');
   Sql.Add('  "' + dm.sqlitenstrocaUnivenda.AsString +'", "' + TrocaVirgPPto(qtd)+ '" ,');
   Sql.Add('   "' + TrocaVirgPPto(dm.sqlitenstrocaPreco.AsString)+ '","' + dm.sqlitenstrocaCodProd.AsString+ '"   )  ');


  ExecSql;
   // End
 // Except





  End;
  frmtroca.abrir;
  close;

end;

end.
