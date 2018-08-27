unit unitroca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, Mask, DBCtrls, Buttons;

type
  Tfrmtroca = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    labelnota: TLabel;
    editdata: TEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    editbarra: TEdit;
    Label9: TLabel;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label12: TLabel;
    DBEdit2: TDBEdit;
    Label13: TLabel;
    DBEdit3: TDBEdit;
    Label14: TLabel;
    DBEdit4: TDBEdit;
    Label15: TLabel;
    DBEdit5: TDBEdit;
    Label16: TLabel;
    DBEdit6: TDBEdit;
    Label17: TLabel;
    DBEdit7: TDBEdit;
    Label18: TLabel;
    DBEdit8: TDBEdit;
    Label7: TLabel;
    Panel4: TPanel;
    labeldesconto: TLabel;
    Label5: TLabel;
    Panel2: TPanel;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    editcodtroca: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure editbarraKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ultimatroca;
    procedure inserirdadostroca;
    procedure abrir;
    procedure cancelartroca;
    procedure inserirsaida;
  end;

var
  frmtroca: Tfrmtroca;
    ultimo:integer;

implementation

uses unidmvendas, uniescnotatroca, uniesctroca, uniescproduto, univendass;

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



procedure  Tfrmtroca.inserirsaida;
var qtd : string;
begin
qtd := InputBox('Atenção', 'Digite a Quantidade', '1');
With dm.sqlitenstrocasaida do
  Begin
  // ultimamatricula;
  Close;
  Sql.Clear;
  Sql.Add('Insert Into itenstrocasaida (codtroca,produto,und,  ' ) ;
  Sql.Add('  qtd,    ') ;
    Sql.Add(' preco, codproduto) ');

   Sql.Add(' values ( "' + frmtroca.editcodtroca.Text+ '"  , "' + dm.sqlprodutosdescricao.AsString + '" , ');
   Sql.Add('  "' + dm.sqlprodutosunivenda.AsString +'", "' + TrocaVirgPPto(qtd)+ '" ,');
   Sql.Add('   "' + TrocaVirgPPto(dm.sqlprodutosprecovenda.AsString)+ '","' + dm.sqlprodutoscodprod.AsString+ '"   )  ');


  ExecSql;

  End;
 


end;

procedure  Tfrmtroca.cancelartroca;
begin
with dm.sqldadostroca do
     begin
     Close;
     SQL.Clear;
     SQL.Add('DELETE FROM dadostroca where codtroca = "' + editcodtroca.Text + '" ');
     ExecSQL;

end;


with dm.sqlitenstrocaentrada do
     begin
     Close;
     SQL.Clear;
     SQL.Add('DELETE FROM itenstrocaentrada where codtroca = "' + editcodtroca.Text + '" ');
     ExecSQL;

end;

with dm.sqlitenstrocasaida do
     begin
     Close;
     SQL.Clear;
     SQL.Add('DELETE FROM itenstrocasaida where codtroca = "' + editcodtroca.Text + '" ');
     ExecSQL;

end;



end;

procedure Tfrmtroca.abrir;
begin
  With dm.sqlitenstrocaentrada do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from itenstrocaentrada  where codtroca = "' + editcodtroca.text +'"  order by Id asc ');
  
  open;


  End;
  dm.sqlitenstrocaentrada.Last;


    With dm.sqlitenstrocasaida do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from itenstrocasaida  where codtroca= "' + editcodtroca.text +'"  order by Id asc ');

  open;

  End;
  dm.sqlitenstrocaentrada.Last;




//  total;
end;


procedure  Tfrmtroca.ultimatroca;
 begin
  With dm.sqlultimatroca do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT MAX( codtroca + 1  ) ultimatroca  FROM dadostroca ');

  open;
   

  End;
  if (dm.sqlultimatrocaultimatroca.AsString = '' )  then
  begin
  ultimo:= 1;
  end else begin
  ultimo:= 0;
  ultimo:= dm.sqlultimatrocaultimatroca.AsInteger;
  end;

 editcodtroca.text := inttostr(ultimo);
 labelnota.caption:= inttostr(ultimo);
// edittitulo.text := dm.sqlultimousuultimamatricula.AsString;
end;


procedure Tfrmtroca.inserirdadostroca;
begin

  With dm.sqldadostroca do
  Begin
   ultimatroca;
  Close;
  Sql.Clear;
  Sql.Add('Insert Into dadostroca (codtroca, data) ' ) ;


   Sql.Add(' values ( "' + inttostr(ultimo)+ '", "' + editdata.Text+ '"  ');
   Sql.Add('  )');


  ExecSql;
   // End
 // Except

    End;


  abrir;
  //ultimamatricula;



end;

procedure Tfrmtroca.FormCreate(Sender: TObject);
var
A, M, D: Word;
vardata: TDate;
begin







DecodeDate(Date, A, M, D);

editdata.text:= Format('%.2d/%.2d/%d', [A, M ,D ]);

inserirdadostroca;

Application.CreateForm(Tfrmescnotatroca, frmescnotatroca);
frmescnotatroca.ShowModal;

end;

procedure Tfrmtroca.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if (editcodtroca.text <> '')  then
begin
  if MessageDlg ( 'Você não finalizou a venda, sua nota de venda será cancelada.',
  mtConfirmation, [mbok, mbCancel], 0) = idok then
  begin

    cancelartroca;

  end
  else
  begin
   Canclose:=False;


      end;
end;

end;

procedure Tfrmtroca.BitBtn1Click(Sender: TObject);
begin
Application.CreateForm(Tfrmesctroca, frmesctroca);
frmesctroca.ShowModal;
end;

procedure Tfrmtroca.editbarraKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
with  dm.sqlprodutos do
     begin
     Close;
     SQL.Clear;
     SQL.Add('Select * from produtos where barra = "' + StringReplace(editbarra.text, 'F', EmptyStr, [rfReplaceAll]) +'"  ');
    // params[0].AsString := editresponsavel.text;
     open;
     end;

if (dm.sqlprodutos.RecordCount > 0) and (editbarra.text <> '') then
begin
     inserirsaida;
     abrir;

     end else begin
     frmprivendas.tag:=8;
     
Application.CreateForm(tfrmescprodutovendas,frmescprodutovendas);
frmescprodutovendas.showmodal;

     end;
end;
end;
procedure Tfrmtroca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
frmprivendas.tag:=0;
end;

end.
