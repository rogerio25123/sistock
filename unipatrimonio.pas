unit unipatrimonio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Mask, DBCtrls, Buttons, ComCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  Tfrmpatrimonio = class(TForm)
    srctotalcusto: TDataSource;
    srctotalvenda: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DataSource1: TDataSource;
    srcsqlsaidasprodutos: TDataSource;
    DBGrid2: TDBGrid;
    Label3: TLabel;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    editdata1: TDateTimePicker;
    editdata2: TDateTimePicker;
    BitBtn2: TBitBtn;
    sqltotalvenda: TZQuery;
    sqltotalvendatotalpatrimoniovenda: TFloatField;
    sqltotalentrada: TZQuery;
    sqltotalentradadescricao: TStringField;
    sqltotalentradatotalentrada: TFloatField;
    sqltotalentradaCodprod: TIntegerField;
    sqltotalcusto: TZQuery;
    sqlsaidasprodutos: TZQuery;
    sqlsaidasprodutosdescricao: TStringField;
    sqlsaidasprodutostotalsaida: TFloatField;
    sqlsaidasprodutosEstoque: TFloatField;
    sqlsaidasprodutosEstoqueMinimo: TFloatField;
    sqlsaidasprodutosCodprod: TIntegerField;
    Query1: TZQuery;
    BitBtn5: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmpatrimonio: Tfrmpatrimonio;

implementation

uses unirelsaidas,unidm;

{$R *.DFM}

procedure Tfrmpatrimonio.FormCreate(Sender: TObject);
var
A, M, D: Word;
vardata: string;
begin
DecodeDate(Date, A, M, D);
//ShowMessage(Format('Dia %.2d do mês %.2d de %d.', [D, M, A]));


vardata:= Format('%.2d/%.2d/%d', [D, M, A]);
editdata1.Date:= StrToDate(vardata);
editdata2.date:= strtodate(Format('%.2d/%.2d/%d', [D, M, A]));






 With  sqltotalcusto do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT sum( estoque*precocusto ) totalpatrimoniocusto  FROM produtos ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;

   With  sqltotalvenda do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT sum( estoque*precovenda ) totalpatrimoniovenda  FROM produtos ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;

end;

procedure Tfrmpatrimonio.BitBtn1Click(Sender: TObject);
var dataI,dataF: string;
begin
dataI := datetostr( editdata1.date);
dataF := datetostr(editdata2.date);


 With  sqlsaidasprodutos do
  Begin
  Close;
  Sql.Clear;
  Sql.Add(' SELECT itensvendas.descricao, SUM( itensvendas.qtd ) totalsaida, Produtos.Estoque, Produtos.EstoqueMinimo,  itensvendas.Codprod ');
  Sql.Add(' FROM itensvendas   INNER JOIN dadosvendas    ON  ');
  Sql.Add(' (dadosvendas.codvenda = itensvendas.codvenda) ');
  Sql.Add(' INNER JOIN  Produtos    ON  (itensvendas.Codprod = Produtos.CodProd) ');
  Sql.Add(' WHERE   dadosvendas.data >=:pInicial  and dadosvendas.data <=:pFinal ');
  Sql.Add('GROUP BY itensvendas.descricao, Produtos.Estoque, Produtos.EstoqueMinimo, itensvendas.Codprod  order by   totalsaida desc') ;

   ParamByName('pInicial').AsDateTime := strtodate(dataI);
   ParamByName('pFinal').AsDateTime := strtodate(dataF);
   open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;
end;

procedure Tfrmpatrimonio.BitBtn2Click(Sender: TObject);
begin
Application.CreateForm(tfrmrelsaidas, frmrelsaidas);
frmrelsaidas.QuickRep1.Preview;
end;

procedure Tfrmpatrimonio.BitBtn5Click(Sender: TObject);
begin
close;
end;

end.
