unit unicontasapagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ComCtrls, Db, DBTables, Spin, Calendar,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Mask, ExtCtrls;

type
  Tfrmcontasapagar = class(TForm)
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    editdescricao: TEdit;
    editboleto: TEdit;
    editvalor: TEdit;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    editpesquisar: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    editexclui: TEdit;
    editmatricula: TEdit;
    BitBtn5: TBitBtn;
    DBGrid1: TDBGrid;
    Label7: TLabel;
    editdata1: TDateTimePicker;
    editdata2: TDateTimePicker;
    Label8: TLabel;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    editsituacao: TEdit;
    Label2: TLabel;
    sqlultimacontas: TZQuery;
    sqlultimacontasmaximoconta: TLargeintField;
    editvencimento: TDateTimePicker;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure editvalorKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure  maximocontas;
    procedure  gravardados;
    procedure abrir;
     procedure alteracao;
  end;

var
  frmcontasapagar: Tfrmcontasapagar;
  ultimo : Integer;

implementation uses unidm, unirelcontasapagar, DateUtils;

{$R *.DFM}


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





 procedure Tfrmcontasapagar.alteracao;
 var dataI,dataF: string;
begin
dataI := DataIng( CDateStr(editvencimento.Date));
 With dm2.sqlcontasapagar do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update contasapagar set vencimento = "'+dataI+'", descricao = "'+editdescricao.text+'" , ' ) ;
  Sql.Add(' valor = "'+TrocaVirgPPto(editvalor.text)+'", boleto = "'+editboleto.text+'" ,  situacao = "'+editsituacao.text+'" ' ) ;


  Sql.Add('   where codigo = "'+editmatricula.text+'" ') ;
  ExecSql;

  end;
  Showmessage('Dados alterados com sussesso');
   editdescricao.Text:='';
   editvalor.text:='';
   editboleto.text:='';

   maximocontas;




  end;



procedure Tfrmcontasapagar.abrir;
begin
  With dm2.sqlcontasapagar do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from contasapagar');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;
  dm2.sqlcontasapagar.Last;
end;



procedure  Tfrmcontasapagar.maximocontas;
 begin
  With sqlultimacontas do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT MAX( codigo + 1 ) maximoconta  FROM contasapagar  ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;
   if (sqlultimacontasmaximoconta.AsString = '' )  then
  begin
  ultimo:= 1;
  end else begin
  ultimo:= 0;
  ultimo:= sqlultimacontasmaximoconta.AsInteger;
  end;



 editmatricula.text := inttostr(ultimo);
// edittitulo.text := dm.sqlultimousuultimamatricula.AsString;
end;





procedure Tfrmcontasapagar.gravardados;
 var dataI,dataF: string;
begin
dataI := DataIng( CDateStr(editvencimento.Date));

  With dm2.sqlcontasapagar do
  Begin
   maximocontas;
  Close;
  Sql.Clear;
  Sql.Add('Insert Into contasapagar (codigo,vencimento,descricao,  ' ) ;
  Sql.Add('  valor, boleto, situacao  )   ') ;

   Sql.Add(' values ( "' + inttostr(ultimo)+ '"  , "' + dataI + '" , ');
   Sql.Add('  "' + editdescricao.text +'"  , "' +TrocaVirgPPto(editvalor.text) + '" , "' + editboleto.text + '", "' + editsituacao.text + '"  )');



  ExecSql;
   // End
 // Except
  Showmessage('Dados gravados com sussesso');

   editdescricao.text:='';
   editvalor.text:='';
   editboleto.text:='';
   

  End;

  abrir;
  maximocontas;

    end;

procedure Tfrmcontasapagar.BitBtn1Click(Sender: TObject);
begin
if tag = 1 then
begin
alteracao;

tag:=0;
abrir;
editdescricao.SetFocus;
end else begin
if tag= 0 then
begin
if editdescricao.Text = '' then
begin
ShowMessage('Digite a Descrição');
end else begin
gravardados;
abrir;
dm2.sqlcontasapagar.Last;
editvencimento.SetFocus;
end;

end;
    end;
    end;
procedure Tfrmcontasapagar.BitBtn4Click(Sender: TObject);
begin
editdescricao.text:= dm2.sqlcontasapagarDescricao.asstring;
editvalor.Text:= dm2.sqlcontasapagarValor.AsString;
editboleto.Text:= dm2.sqlcontasapagarBoleto.AsString;
editsituacao.Text:= dm2.sqlcontasapagarSituacao.AsString;

editvencimento.Date := strtodate(Dataportugues( CDateStr(dm2.sqlcontasapagarVencimento.AsDateTime)));


editmatricula.Text:= dm2.sqlcontasapagarCodigo.AsString;

tag:=1;

end;

procedure Tfrmcontasapagar.BitBtn3Click(Sender: TObject);
begin
if  application.messagebox('Deseja Excluir?',
   'Confirmação' , mb_yesno + mb_iconquestion) = mrYes then
   begin

with dm2.sqlcontasapagar do
     begin
     Close;
     SQL.Clear;
     SQL.Add('DELETE FROM contasapagar where codigo = "' + editexclui.text + '" ');
     ExecSQL;

end;
editexclui.text:='';
abrir;
maximocontas;

end;
end;

procedure Tfrmcontasapagar.BitBtn2Click(Sender: TObject);
begin
with dm2.sqlcontasapagar do
     begin
     Close;
     SQL.Clear;
     SQL.Add('Select * from contasapagar where UPPER(descricao)LIKE UPPEr(''%'' + :3 + ''%'')');
     params[0].AsString := editpesquisar.text;
     open;
     end;

end;

procedure Tfrmcontasapagar.BitBtn6Click(Sender: TObject);
var dataI,dataF: string;
begin
dataI :=  datetostr( editdata1.date);
dataF :=  datetostr(editdata2.date);


 With  dm2.sqlcontasapagar do
  Begin
  Close;
  Sql.Clear;
  Sql.Add(' SELECT * from contasapagar where vencimento >=:pInicial  and vencimento <=:pFinal ');

   ParamByName('pInicial').AsDateTime := strtodate(dataI);
   ParamByName('pFinal').AsDateTime := strtodate(dataF);
   open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;

end;

procedure Tfrmcontasapagar.FormCreate(Sender: TObject);
var
A, M, D: Word;
begin
maximocontas;
DecodeDate(Date, M, D, A);
//ShowMessage(Format('Dia %.2d do mês %.2d de %d.', [D, M, A]));



editdata1.date:= strtodate(Format('%.2d/%.2d/%d', [A,D , M]));
editdata2.date:= strtodate(Format('%.2d/%.2d/%d', [A,D , M]));
editvencimento.date:= date;

end;

procedure Tfrmcontasapagar.BitBtn5Click(Sender: TObject);
begin
close;
end;

procedure Tfrmcontasapagar.editvalorKeyPress(Sender: TObject;
  var Key: Char);
begin
if Not (key in ['0'..'9',#8, ',' ]) then
key := #0;

end;

procedure Tfrmcontasapagar.BitBtn7Click(Sender: TObject);
begin
Application.CreateForm(Tfrmrelcontasapagar, frmrelcontasapagar);
frmrelcontasapagar.QuickRep1.Preview;
end;











end.
