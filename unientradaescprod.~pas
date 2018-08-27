unit unientradaescprod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  Tfrmescproduto = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    srcsqlprod: TDataSource;
    editpreco: TEdit;
    sqlprodutos: TZQuery;
    sqlprodutoscodprod: TIntegerField;
    sqlprodutosbarra: TStringField;
    sqlprodutosgrupo: TStringField;
    sqlprodutosdescricao: TStringField;
    sqlprodutosunivenda: TStringField;
    sqlprodutosmarca: TStringField;
    sqlprodutosestoque: TFloatField;
    sqlprodutosprecocusto: TFloatField;
    sqlprodutosaddperc: TFloatField;
    sqlprodutosprecovenda: TFloatField;
    sqlprodutosestoqueminimo: TFloatField;
    sqlprodutoscodforn: TIntegerField;
    sqlprodutosdesconto: TFloatField;
    sqlprodutosprecolocacao: TFloatField;
    sqlprodutoslocado: TStringField;
    sqlprodutospreco2: TFloatField;
    sqlprodutospreco3: TFloatField;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmescproduto: Tfrmescproduto;

implementation

uses unientraestoque, unidm, unipri;

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


procedure Tfrmescproduto.BitBtn2Click(Sender: TObject);
var precovenda1,precovenda2,precovenda3 : string;
begin
frmentrada.editquantidade.Text:=InputBox('Atenção', 'Digite a Quantidade', '1');
// editpreco.text := InputBox('Atenção', 'Digite 0 Preço ou Mantenha o mesmo', '' + sqlprodutosPrecovenda.AsString+ '');
 precovenda1 :=  InputBox('Atenção', 'Digite o preço de venda 1', '' + sqlprodutosPrecovenda.AsString+ '');
  precovenda2  :=  InputBox('Atenção', 'Digite o preço de venda 2', '' + sqlprodutosPreco2.AsString+ '');
   precovenda3   :=    InputBox('Atenção', 'Digite o preço de venda 3', '' + sqlprodutosPreco3.AsString+ '');

 With dm2.sqlitensentrada do
  Begin
  // ultimamatricula;
  Close;
  Sql.Clear;
  Sql.Add('Insert Into itensentrada (codvenda,descricao,univenda,  ' ) ;
  Sql.Add('  qtd,    ') ;
    Sql.Add(' preco, preco2, preco3, codprod ) ');

   Sql.Add(' values ( "' + frmentrada.editcodvenda.Text+ '"  , "' + sqlprodutosDescricao.AsString + '" , ');
   Sql.Add('  "' + sqlprodutosUnivenda.AsString +'", "' + TrocaVirgPPto(frmentrada.editquantidade.text)+ '" ,');
   Sql.Add('   "' + TrocaVirgPPto(precovenda1)+ '","' + TrocaVirgPPto(precovenda2)+ '","' + TrocaVirgPPto(precovenda3)+ '","' + sqlprodutosCodProd.AsString+ '"   )  ');


  ExecSql;
   // End
 // Except





  End;


   frmentrada.total;
//dm.tblitensQtd.FocusControl;
frmentrada.editquantidade.Text:='1';
frmentrada.editbarra.Text:='';
frmentrada.editbarra.SetFocus;

  frmentrada.abrir;
  close;


end;

procedure Tfrmescproduto.FormCreate(Sender: TObject);
begin
with sqlprodutos do
     begin
     Close;
     SQL.Clear;
     SQL.Add('Select * from produtos where descricao LIKE "%'+frmentrada.editbarra.Text+'%" order by descricao ');
    // params[0].AsString := frmentrada.editbarra.Text;
     open;
     end;

end;

procedure Tfrmescproduto.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tfrmescproduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
  vk_Escape: close;

end;
end;

end.
