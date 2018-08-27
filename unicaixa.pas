unit unicaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBCtrls,  Menus,
  ComCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Mask;

type
  Tfrmcaixa = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    editsaida: TEdit;
    BitBtn4: TBitBtn;
    Label4: TLabel;
    editdescricao: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    editdata: TEdit;
    BitBtn5: TBitBtn;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    ImprimirCaixa1: TMenuItem;
    editdata2: TDateTimePicker;
    editdata1: TDateTimePicker;
    DataSource1: TDataSource;
    Image1: TImage;
    srctotalgrupo: TDataSource;
    sqltotalgrupo: TZQuery;
    DBGrid2: TDBGrid;
    sqltotalgrupototalgrupo: TFloatField;
    sqltotalgrupoformapgto: TStringField;
    sqltotalgrupoRetirada: TFloatField;
    sqltotalgrupoSaldo: TFloatField;
    sqltotalretirada: TZQuery;
    sqltotalretiradatotalretirada: TFloatField;
    DataSource2: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid11DblClick(Sender: TObject);
    procedure editsaidaKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ImprimirCaixa1Click(Sender: TObject);
    procedure sqltotalgrupoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure abrir;
    procedure listarfechadas;
    procedure  totalcaixa;
    procedure  totalcaixaaprazo;
    procedure inserirdadossaidas;
    procedure ultimavenda;
    procedure  totalretirada;
    procedure totalgrupo;
  end;

var
  frmcaixa: Tfrmcaixa;
  ultimo: integer;
  vardata: string;

implementation

uses unidmcaixa, unifinalizarvendas, unicaixaveritens, unirelnota,
  unirelcaixa;

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

Function RetornaTexto(Texto:String; Caracter:Char):String;
var
  I,Posicao1,Posicao2:Integer;
  TextoInvertido:String;
begin
  Result:='pol';
  for I := Length(Texto) downto 1 do
  begin
    TextoInvertido:=TextoInvertido+Texto[I]
  end;
  Posicao1:=Pos(Caracter,Texto)+1;
  Posicao2:=Pos(Caracter,TextoInvertido)-1;
  Result:=Copy(Texto,Posicao1,Length(Texto)-(Posicao1+Posicao2));
 end;


procedure Tfrmcaixa.totalgrupo;
var dataI,dataF: string;
begin
dataI := datetostr( editdata1.date);
dataF := datetostr(editdata2.date);



  With sqltotalretirada do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT  sum(subtotal)  as totalretirada from dadosvendas where  data >=:pInicial  and data <=:pFinal AND formapgto = "RETIRADA" ');
  ParamByName('pInicial').AsDateTime := strtodate(dataI);
   ParamByName('pFinal').AsDateTime := strtodate(dataF);

  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;





  With sqltotalgrupo do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT  sum(subtotal)  as totalgrupo, formapgto from dadosvendas where  data >=:pInicial  and data <=:pFinal AND formapgto <> "" group by formapgto order by formapgto ');
  ParamByName('pInicial').AsDateTime := strtodate(dataI);
   ParamByName('pFinal').AsDateTime := strtodate(dataF);

  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;


   

end;

 procedure  Tfrmcaixa.totalretirada;
var A, M, D, A2, M2, D2: Word;
dataI, dataF : string;

begin
 DecodeDate(editdata1.Date, A, M, D);
 DecodeDate(editdata2.Date, A2, M2, D2);

dataI:= Format('%.2d/%.2d/%d', [A, M ,D ]);
dataF:= Format('%.2d/%.2d/%d', [A2, M2 ,D2 ]);


  With dm.sqltotalretirada do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT sum(total) totalretirada  FROM dadosvendas where situacao = "FECHADO" and data >="'+dataI+'"  and data <="'+dataF+'"   and codcli =0 and total<0');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
 // ParamByName('pInicial').AsDateTime := strtodate(dataI);
 //  ParamByName('pFinal').AsDateTime := strtodate(dataF);
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;
 // editretirada.text := dm.sqltotalretiradatotalretirada.AsString;

  end;

 



procedure  Tfrmcaixa.ultimavenda;
 begin
  With dm.sqlultimavenda do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT MAX( codvenda + 1 ) ultimavenda  FROM dadosvendas  ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;
  ultimo:= 0;
  ultimo := dm.sqlultimavendaultimavenda.AsInteger;

 //editcodvenda.text := inttostr(ultimo);
 //labelnota.caption:= inttostr(ultimo);
// edittitulo.text := dm.sqlultimousuultimamatricula.AsString;
end;

procedure Tfrmcaixa.inserirdadossaidas;
var A, M, D, A2, M2, D2: Word;
dataI : string;

begin
 DecodeDate(date, A, M, D);


dataI:= Format('%.2d/%.2d/%d', [A, M ,D ]);


  With dm.sqlcaixa do
  Begin
   ultimavenda;
  Close;
  Sql.Clear;
  Sql.Add('Insert Into dadosvendas (codvenda, data, horas, subtotal,codcli,cliente,situacao, vendedor, formapgto ) ' ) ;


   Sql.Add(' values ( "' + inttostr(ultimo)+ '", "' + dataI+ '","' + timetostr(time)+ '", ');
   Sql.Add('  "'+TrocaVirgPPto(editsaida.Text)+ '","0" , "'+UpperCase (editdescricao.text)+'", "FECHADO", "" , "RETIRADA" )');


  ExecSql;
   // End
 // Except



    End;
   editsaida.text:='';
   editdescricao.text:='';

  abrir;
  //ultimamatricula;



end;




procedure  Tfrmcaixa.totalcaixaaprazo;
var A, M, D, A2, M2, D2: Word;
dataI, dataF : string;

begin
 DecodeDate(editdata1.Date, A, M, D);
 DecodeDate(editdata2.Date, A2, M2, D2);

dataI:= Format('%.2d/%.2d/%d', [A, M ,D ]);
dataF:= Format('%.2d/%.2d/%d', [A2, M2 ,D2 ]);

  With dm.sqlcaixaaprazo do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT sum(total) totalaprazo  FROM dadosvendas where situacao = "FECHADO" and data >="'+dataI+'"  and data <="'+dataF+'"  and codcli >0 ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  //ParamByName('pInicial').AsDateTime := strtodate(dataI);
  // ParamByName('pFinal').AsDateTime := strtodate(dataF);
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;
 // editaprazo.text := floattostrf(dm.sqlcaixaaprazototalaprazo.AsCurrency,ffFixed,18,2);
  ///floattostrf(dm.sqltotalcaixatotalcaixa.AsCurrency,ffFixed,18,2);

  end;

procedure  Tfrmcaixa.totalcaixa;
var A, M, D, A2, M2, D2: Word;
dataI, dataF : string;

begin
 DecodeDate(editdata1.Date, A, M, D);
 DecodeDate(editdata2.Date, A2, M2, D2);

dataI:= Format('%.2d/%.2d/%d', [A, M ,D ]);
dataF:= Format('%.2d/%.2d/%d', [A2, M2 ,D2 ]);

  With dm.sqltotalcaixa do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT sum(subtotal) totalcaixa  FROM dadosvendas where situacao = "FECHADO" and data >= "'+dataI+'"  and data <= "'+dataF+'"  and codcli =0 ORDER by codvenda asc');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
 // ParamByName('pInicial').AsDateTime := strtodate(dataI);
 //  ParamByName('pFinal').AsDateTime := strtodate(dataF);
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;
 // edittotal.text := floattostrf(dm.sqltotalcaixatotalcaixa.AsCurrency,ffFixed,18,2);

  end;


procedure Tfrmcaixa.listarfechadas;
var A, M, D, A2, M2, D2: Word;
dataI, dataF : string;

begin
 DecodeDate(editdata1.Date, A, M, D);
 DecodeDate(editdata2.Date, A2, M2, D2);

dataI:= Format('%.2d/%.2d/%d', [A, M ,D ]);
dataF:= Format('%.2d/%.2d/%d', [A2, M2 ,D2 ]);


  With dm.sqlcaixa do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from dadosvendas  where situacao = "FECHADO" and data >= "'+dataI+'"   and data <="'+dataF+'" order by codvenda asc  ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  // ParamByName('pInicial').AsDateTime := strtodate(dataI);
   //ParamByName('pFinal').AsDateTime := strtodate(dataF);
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;

end;



procedure Tfrmcaixa.abrir;
begin
  With dm.sqlcaixa do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from dadosvendas  where situacao = "ABERTA"  ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;
  dm.sqlitens.Last;
end;


procedure Tfrmcaixa.BitBtn1Click(Sender: TObject);
begin
if dm.sqlcaixaCodvenda.AsString = '' then
begin
ShowMessage('Nao existem notas para fechar');
end else begin
Application.CreateForm(tfrmfinalizarvendas,frmfinalizarvendas);
frmfinalizarvendas.showmodal;
end;
         end;
procedure Tfrmcaixa.BitBtn2Click(Sender: TObject);
begin
DBGrid1.Visible:=true;
BitBtn1.Enabled:=true;
BitBtn5.Enabled:= false;
abrir;
end;

procedure Tfrmcaixa.BitBtn3Click(Sender: TObject);
begin
 DBGrid1.Visible:=true;
 listarfechadas;
 totalcaixa;
 totalcaixaaprazo ;
 totalretirada ;
 BitBtn1.Enabled:=false;
 BitBtn5.Enabled:= true;
 dm.sqlcaixa.Last;
 totalgrupo;
end;

procedure Tfrmcaixa.FormCreate(Sender: TObject);
var
A, M, D: Word;
begin
Image1.Picture.LoadFromFile('empresa.bmp');
DecodeDate(Date, A, M, D);
//ShowMessage(Format('Dia %.2d do mês %.2d de %d.', [D, M, A]));



editdata1.date:= strtodate( Format('%.2d/%.2d/%d', [D, M, A]));
editdata2.date:= strtodate( Format('%.2d/%.2d/%d', [D, M, A]));
vardata:= Format('%.2d/%.2d/%d', [M, D, A]);
editdata.text := Format('%.2d/%.2d/%d', [M, D, A]);
end;

procedure Tfrmcaixa.DBGrid11DblClick(Sender: TObject);
begin
Application.CreateForm(tfrmvercaixa,frmvercaixa);
frmvercaixa.showmodal;

end;

procedure Tfrmcaixa.editsaidaKeyPress(Sender: TObject; var Key: Char);
begin
if Not (key in ['0'..'9',#8, ',' ]) then
key := #0;
end;


procedure Tfrmcaixa.BitBtn4Click(Sender: TObject);
begin
if editsaida.text <> '' then begin

if  application.messagebox('Deseja Lançar Saída?',
   'Confirmação' , mb_yesno + mb_iconquestion) = mrYes then
   begin


inserirdadossaidas;
listarfechadas;
BitBtn3Click(frmcaixa);
totalgrupo;
end;
end;
 end;
procedure Tfrmcaixa.DBGrid1DblClick(Sender: TObject);
begin
Application.CreateForm(tfrmvercaixa,frmvercaixa);
frmvercaixa.showmodal;

end;

procedure Tfrmcaixa.BitBtn5Click(Sender: TObject);
begin
if dm.sqlcaixaSituacao.AsString = 'ABERTA' THEN
begin
showmessage('Você só pode imprimir notas fechadas');
end else begin
Application.CreateForm(Tfrmrelnota,frmrelnota);
frmrelnota.QuickRep1.Preview;
end;
end;

procedure Tfrmcaixa.ImprimirCaixa1Click(Sender: TObject);
begin
 Application.CreateForm(Tfrmrelcaixa,frmrelcaixa);
frmrelcaixa.QuickRep1.Preview;
end;

procedure Tfrmcaixa.sqltotalgrupoCalcFields(DataSet: TDataSet);
begin
if sqltotalgrupoformapgto.AsString = 'DINHEIRO' then
begin
 sqltotalgrupoRetirada.value:= sqltotalretiradatotalretirada.Value;
  sqltotalgruposaldo.value:= sqltotalgrupototalgrupo.value - sqltotalgrupoRetirada.value;
end
end;

end.
