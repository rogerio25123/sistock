unit uniescproduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, Db, DBTables, ExtCtrls;

type
  Tfrmescprodutovendas = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    editdatadevolucao: TEdit;
    editsemana: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
 
  end;

var
  frmescprodutovendas: Tfrmescprodutovendas;

implementation

uses unidmvendas, univendass, unilocacao, unitroca;

{$R *.DFM}


function DataExtenso(Data:TDateTime): String;
{Retorna uma data por extenso}
var
  NoDia : Integer;
  DiaDaSemana : array [1..7] of String;
  Meses : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
{ Dias da Semana }
  DiaDasemana [1]:= 'domingo';
  DiaDasemana [2]:= 'segunda';
  DiaDasemana [3]:= 'terça';
  DiaDasemana [4]:= 'quarta';
  DiaDasemana [5]:= 'quinta';
  DiaDasemana [6]:= 'sexta';
  DiaDasemana [7]:= 'sabado';
{ Meses do ano }
  Meses [1] := 'Janeiro';
  Meses [2] := 'Fevereiro';
  Meses [3] := 'Março';
  Meses [4] := 'Abril';
  Meses [5] := 'Maio';
  Meses [6] := 'Junho';
  Meses [7] := 'Julho';
  Meses [8] := 'Agosto';
  Meses [9] := 'Setembro';
  Meses [10]:= 'Outubro';
  Meses [11]:= 'Novembro';
  Meses [12]:= 'Dezembro';
  DecodeDate (Data, Ano, Mes, Dia);
  NoDia := DayOfWeek (Data);
  Result := DiaDaSemana[NoDia];
 // Result := DiaDaSemana[NoDia] + ', ' +  IntToStr(Dia) + ' de ' + Meses[Mes]+ ' de ' + IntToStr(Ano);
end;


//////////////////////////////////////////////////////////juntas
   function ZeroEsquerda2(const I: integer; const Casas: byte): string;
var
Ch: Char;
begin
  Result := IntToStr(I);
  if Length(Result) > Casas then begin
     Ch := '*';
     Result := '';
  end
  else
  Ch := '0';
  while length(Result) < Casas do
  result:=Ch+Result;
  end;

function CDateStr(const date:tdatetime):string;
var
fano, fmes, fdia: word;
begin
  DecodeDate(date,fano,fmes,fdia);
  result:=zeroesquerda2(fano,4)+zeroesquerda2(fmes,2)+zeroesquerda2(fdia,2);
end;

  /////////////////juntas

  

function DataIng(Data:String):String;
begin
Result := Copy(Data, 1,4)+ '/'  + copy(Data, 5,2)+ '/'  +Copy(Data, 7, 2); ;
end;

function Dataportugues(Data:String):String;
begin
Result := Copy(Data, 7,2)+ '/'  + copy(Data, 5,2)+ '/'  +Copy(Data, 1, 4); ;
end;

///tudo junto 20100704////////////////////////////////////////////////////////





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


procedure Tfrmescprodutovendas.FormCreate(Sender: TObject);
var
A, M, D: Word;
vardata: TDate;
dtdevolucao: string;
begin
 
editsemana.text:= DataExtenso(date)     ;

if frmprivendas.tag = 5 then
begin

with dm.sqlprodutos do
     begin
     Close;
     SQL.Clear;
     SQL.Add('Select * from produtos where    descricao like "%' +frmlocacao.editbarra.Text+ '%"  order by descricao ');
    // params[0].AsString := frmpri.editbarra.Text;
     open;
     end;

end else begin
if frmprivendas.tag = 8 then
begin

with dm.sqlprodutos do
     begin
     Close;
     SQL.Clear;
     SQL.Add('Select * from produtos where    descricao like "%' +frmtroca.editbarra.Text+ '%"  order by descricao ');
    // params[0].AsString := frmpri.editbarra.Text;
     open;
     end;

end else begin

with dm.sqlprodutos do
     begin
     Close;
     SQL.Clear;
     SQL.Add('Select * from produtos where    descricao like "%' +frmprivendas.editbarra.Text+ '%"  order by descricao ');
    // params[0].AsString := frmpri.editbarra.Text;
     open;
     end;

   

    end;
     if dm.sqlprodutos.RecordCount >  0 then begin
      DBGrid1.TabOrder:=0;
end;
  

end;
end;

procedure Tfrmescprodutovendas.BitBtn2Click(Sender: TObject);
var qtd , varprecovenda : string;
begin
if dm.sqlprodutos.RecordCount > 0  then

if frmprivendas.tag = 5 then
begin



{  With dm.sqlitenslocacao do
  Begin
  // ultimamatricula;
  Close;
  Sql.Clear;
  Sql.Add('Insert Into itenslocacao (codvenda,descricao,univenda,  ' ) ;
  Sql.Add('  qtd,    ') ;
    Sql.Add(' preco, codprod,desconto, dtdevolucao, codcli ) ');

   Sql.Add(' values ( "' + frmlocacao.editcodlocacao.Text+ '"  , "' + dm.sqlprodutosDescricao.AsString + '" , ');
   Sql.Add('  "' + dm.sqlprodutosUnivenda.AsString +'", "1" ,');
   Sql.Add('   "' + TrocaVirgPPto(dm.sqlprodutosPrecolocacao.AsString)+ '","' + dm.sqlprodutosCodProd.AsString+ '","' + TrocaVirgPPto(dm.sqlprodutosDesconto.AsString)+ '" , "' + editdatadevolucao.text+ '" , "' + frmlocacao.editcodcli.text+ '"  )  ');


  ExecSql;      }

        frmlocacao.inseriritens;

 // End;

frmlocacao.total;
//dm.tblitensQtd.FocusControl;
frmlocacao.editquantidade.Text:='1';
frmlocacao.editbarra.Text:='';
frmlocacao.editbarra.SetFocus;

  frmlocacao.abrir;
  close;



end else begin
if dm.sqlprodutos.RecordCount > 0  then
if frmprivendas.tag =8 then
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
    
   frmtroca.abrir;
    close;





end else begin

if dm.sqlprodutos.RecordCount > 0  then begin

frmprivendas.editquantidade.Text:=InputBox('Atenção', 'Digite a Quantidade', '1');



if frmprivendas.base.Caption = '11' then
begin
if dm.sqlprodutosprecovenda.Value = 0 then
begin
varprecovenda :=  InputBox('Atenção', 'Produto sem preço digite o preço', '1');
end else begin
varprecovenda := dm.sqlprodutosprecovenda.AsString;
end;
end else begin
if frmprivendas.base.Caption = '12' then
begin
if dm.sqlprodutospreco2.Value = 0 then
begin
varprecovenda :=  InputBox('Atenção', 'Produto sem preço digite o preço', '1');
end else begin
varprecovenda := dm.sqlprodutospreco2.AsString;

end;
end else begin
if frmprivendas.base.Caption = '13' then
begin
if dm.sqlprodutospreco3.Value = 0 then
begin
varprecovenda :=  InputBox('Atenção', 'Produto sem preço digite o preço', '1');
end else begin
varprecovenda := dm.sqlprodutospreco3.AsString;

end;


 end;

end;
 end;





 With dm.sqlitens do
  Begin
  // ultimamatricula;
  Close;
  Sql.Clear;
  Sql.Add('Insert Into itensvendas (codvenda,descricao,univenda,  ' ) ;
  Sql.Add('  qtd,    ') ;
    Sql.Add(' preco, codprod, desconto ) ');

   Sql.Add(' values ( "' + frmprivendas.editcodvenda.Text+ '"  , "' + dm.sqlprodutosDescricao.AsString + '" , ');
   Sql.Add('  "' + dm.sqlprodutosUnivenda.AsString +'", "' + TrocaVirgPPto(frmprivendas.editquantidade.text)+ '" ,');
   Sql.Add('   "' + TrocaVirgPPto(varprecovenda)+ '","' + dm.sqlprodutosCodProd.AsString+ '" ,"' + dm.sqlprodutosdesconto.AsString+ '"  )  ');


  ExecSql;
   // End
 // Except





  End;


   frmprivendas.total;
//dm.tblitensQtd.FocusControl;
frmprivendas.editquantidade.Text:='1';
frmprivendas.editbarra.Text:='';
frmprivendas.editbarra.SetFocus;

  frmprivendas.abrir;
//   frmprivendas.base.Caption:= '11';
  close;
  end;
end;
end;
end;


procedure Tfrmescprodutovendas.BitBtn1Click(Sender: TObject);
begin
frmprivendas.editbarra.Text:='';
close;
end;

procedure Tfrmescprodutovendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of

  vk_Escape: close;
end;
frmprivendas.editbarra.Text:='';
end;

procedure Tfrmescprodutovendas.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
with  dm.sqlprodutos do
     begin
  Close;
     SQL.Clear;
     SQL.Add('Select * from produtos where    descricao like "%' +edit1.Text+ '%"   ');
    // params[0].AsString := frmpri.editbarra.Text;
     open;
     end;
     end;
end;

procedure Tfrmescprodutovendas.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
    BitBtn2Click(frmescprodutovendas);
end;

end;

end.
