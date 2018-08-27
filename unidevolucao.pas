unit unidevolucao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DBCtrls, DB, Mask,
  ComCtrls;

type
  Tfrmdevolucao = class(TForm)
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    editcliente: TEdit;
    editcodcli: TEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label8: TLabel;
    Panel2: TPanel;
    DBText1: TDBText;
    editatrazo: TEdit;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    DBText2: TDBText;
    Panel3: TPanel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    lbtotaapagar: TLabel;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editatrazoKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure abrir;
    procedure totaljuros;
  end;

var
  frmdevolucao: Tfrmdevolucao;

implementation

uses univendass, uniescclientevendas, unidmvendas, unifechardevolucao,
  unidevolucaoimprimir;

{$R *.dfm}

function DifDias(DataVenc:TDateTime; DataAtual:TDateTime): String;
Var Data: TDateTime;
dia, mes, ano: Word;
begin
Data :=  DataAtual -DataVenc;
DecodeDate( Data, ano, mes, dia);
Result := FloatToStr(Data);

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

procedure Tfrmdevolucao.totaljuros;
var totalapagar : string;
begin
  With dm.sqltotaljurosdevolucao do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select sum(juros) totaljuros from itenslocacao where codcli = "'+editcodcli.Text+'"  ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;
//  dm.sqlitensdevolucao.Last;

 totalapagar := floattostrf(dm.sqltotaljurosdevolucaototaljuros.AsCurrency + dm.sqlclientesdebitolocacao.AsCurrency,ffFixed,18,2);
 lbtotaapagar.Caption:= totalapagar;
 end;


procedure Tfrmdevolucao.abrir;
begin
  With dm.sqlitenslocacao do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select *  from itenslocacao    where codcli = "' + editcodcli.text +'"   order by registro asc ');
  open;


  End;


  totaljuros;
end;

procedure Tfrmdevolucao.FormCreate(Sender: TObject);
begin
frmprivendas.tag:= 6;
Application.CreateForm(Tfrmescclientes,  frmescclientes);
frmescclientes.ShowModal;
end;

procedure Tfrmdevolucao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
frmprivendas.Tag:=0;

end;

procedure Tfrmdevolucao.SpeedButton1Click(Sender: TObject);
begin
frmprivendas.tag:= 6;
Application.CreateForm(Tfrmescclientes,  frmescclientes);
frmescclientes.ShowModal;
end;

procedure Tfrmdevolucao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
  vk_Escape: close;
end;
end;

procedure Tfrmdevolucao.editatrazoKeyPress(Sender: TObject; var Key: Char);
begin
if Not (key in ['0'..'9',#8, ',' ]) then
key := #0;
end;




procedure Tfrmdevolucao.DBGrid1DblClick(Sender: TObject);
var coditenslocacao, dataalterar, check, devolvido, qtddias, juros: string;

begin
coditenslocacao := dm.sqlitenslocacaoregistro.AsString;
devolvido := dm.sqlitenslocacaodevolvido.AsString;

dataalterar := DataIng( CDateStr( date ));
 check := 'X';

 qtddias:= DifDias(dm.sqlitenslocacaodtdevolucao.AsDateTime, date )  ;
 
 if strtoint(qtddias) < 0 then begin
 qtddias := '0';
 end;
 juros := floattostr(strtofloat(qtddias) * strtofloat(editatrazo.text)) ;

 if (devolvido = '')then
 begin
 With dm.sqlitensdevolucao do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update itenslocacao set  devolvido = "'+check+'",  ' ) ;


  Sql.Add(' dtdevolvido = "'+dataalterar+'", qtddias="'+qtddias+'", juros =   "'+juros+'"  where registro = "'+coditenslocacao+'" ') ;
  ExecSql;

  end;
  end else begin
   With dm.sqlitensdevolucao do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update itenslocacao set devolvido = "" , ' ) ;


  Sql.Add(' dtdevolvido = "0000-00-00", qtddias=null, juros=null   where registro = "'+coditenslocacao+'" ') ;
  ExecSql;

  end;

  end;
  

    abrir ;
end;

procedure Tfrmdevolucao.BitBtn1Click(Sender: TObject);
begin
Application.CreateForm(Tfrmfechardevolucao, frmfechardevolucao);
frmfechardevolucao.ShowModal;
end;

end.
