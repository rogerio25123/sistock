unit unialteradata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  Tfrmalterardata = class(TForm)
    editdata: TDateTimePicker;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmalterardata: Tfrmalterardata;

implementation

uses unilocacao, unidmvendas;

{$R *.dfm}

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



procedure Tfrmalterardata.BitBtn1Click(Sender: TObject);
var coditenslocacao, dataalterar : string;
begin
coditenslocacao := dm.sqlitenslocacaoregistro.AsString;

dataalterar := DataIng( CDateStr( editdata.date ));


 With dm.sqlitenslocacao do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update itenslocacao set dtdevolucao =  "'+dataalterar+'" ' ) ;


  Sql.Add('   where registro = "'+coditenslocacao+'" ') ;
  ExecSql;

  end;

  frmlocacao.abrir;
  close;

end;

procedure Tfrmalterardata.FormCreate(Sender: TObject);
begin
editdata.Date := dm.sqlitenslocacaodtdevolucao.AsDateTime;
end;

end.
