unit unilocacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, DBGrids, ExtCtrls, Menus, ComCtrls;

type
  Tfrmlocacao = class(TForm)
    GroupBox1: TGroupBox;
    editcliente: TEdit;
    editcodcli: TEdit;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    labelnota: TLabel;
    Label3: TLabel;
    editcodlocacao: TEdit;
    editdata: TEdit;
    Label4: TLabel;
    Panel1: TPanel;
    labeltotal: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Panel2: TPanel;
    Label7: TLabel;
    editqtditens: TEdit;
    editbarra: TEdit;
    Label13: TLabel;
    editquantidade: TEdit;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    Confirmar1: TMenuItem;
    ExcluirTodososItens1: TMenuItem;
    ExcluirItem1: TMenuItem;
    ImprimirOramento1: TMenuItem;
    MudarQtd1: TMenuItem;
    ConfigurarBanco1: TMenuItem;
    PesquisarProduto1: TMenuItem;
    editdatadevolucao: TEdit;
    editsemana: TEdit;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure editbarraKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure Confirmar1Click(Sender: TObject);
    procedure ExcluirItem1Click(Sender: TObject);
    procedure ExcluirTodososItens1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure inserirdadoslocacao;
    procedure  ultimalocacao;
    procedure abrir;
    procedure cancelarnota;
    procedure total;
    procedure inseriritens;
  end;

var
  frmlocacao: Tfrmlocacao;

implementation

uses uniescclientevendas, univendass, unidmvendas, uniescproduto,
  unifechalocacao, DateUtils, unialteradata;

{$R *.dfm}

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
  DiaDasemana [3]:= 'ter�a';
  DiaDasemana [4]:= 'quarta';
  DiaDasemana [5]:= 'quinta';
  DiaDasemana [6]:= 'sexta';
  DiaDasemana [7]:= 'sabado';
{ Meses do ano }
  Meses [1] := 'Janeiro';
  Meses [2] := 'Fevereiro';
  Meses [3] := 'Mar�o';
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




function ZeroEsquerda(ZEROS:string;QUANT: integer):String;
var
   I,Tamanho: integer;
   aux: string;
begin
  aux:=zeros;
  Tamanho:=length(ZEROS);
  ZEROS:='';
    for I:=1 to quant-tamanho do
        ZEROS:=ZEROS+'0';
  aux:=zeros+aux;
  ZeroEsquerda:=aux;
end;


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







procedure  Tfrmlocacao.total;
 begin

  With dm.sqlitenssomalocacao do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT sum( qtd*preco  ) somatotallocacao  FROM itenslocacao where codvenda = "' + editcodlocacao.text +'" ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;

 // ultimo := ultimo + sqlmaximomaximoreg.AsInteger+1;

 labeltotal.Caption := floattostrf(dm.sqlitenssomalocacaosomatotallocacao.AsCurrency,ffFixed,18,2) ;


  With dm.sqlitensitenslocacao do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT count( registro ) somaitenslocacao  FROM itenslocacao where codvenda = "' + editcodlocacao.text +'" ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;
 editqtditens.Text:= dm.sqlitensitenslocacaosomaitenslocacao.asstring;

 label7.Caption:= dm.sqlitensitenslocacaosomaitenslocacao.asstring;


end;

 












procedure  Tfrmlocacao.cancelarnota;
begin
with dm.sqldadoslocacao do
     begin
     Close;
     SQL.Clear;
     SQL.Add('DELETE FROM dadoslocacao where codvenda = "' + editcodlocacao.Text + '" ');
     ExecSQL;

end;


with dm.sqlitenslocacao do
     begin
     Close;
     SQL.Clear;
     SQL.Add('DELETE FROM itenslocacao where codvenda = "' + editcodlocacao.Text + '" ');
     ExecSQL;

end;



end;

procedure Tfrmlocacao.abrir;
begin
  With dm.sqlitenslocacao do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from itenslocacao  where codvenda = "' + editcodlocacao.text +'"  order by registro asc ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;
  dm.sqlitenslocacao.Last;

  total;
end;

procedure  Tfrmlocacao.ultimalocacao;
 begin
  With dm.sqlultimalocacao do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT MAX( codvenda + 1  ) ultimalocacao  FROM dadoslocacao  ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;
  if (dm.sqlultimalocacaoultimalocacao.AsString = '' )  then
  begin
  ultimo:= 1;
  end else begin
  ultimo:= 0;
  ultimo:= dm.sqlultimalocacaoultimalocacao.AsInteger;
  end;

 editcodlocacao.text := inttostr(ultimo);
 labelnota.caption:= ZeroEsquerda(inttostr(ultimo),5);
// edittitulo.text := dm.sqlultimousuultimamatricula.AsString;
end;


procedure Tfrmlocacao.inserirdadoslocacao;
begin

  With dm.sqldadoslocacao do
  Begin
   ultimalocacao;
  Close;
  Sql.Clear;
  Sql.Add('Insert Into dadoslocacao (codvenda, data, horas ) ' ) ;


   Sql.Add(' values ( "' + inttostr(ultimo)+ '", "' + editdata.Text+ '","' + timetostr(time)+ '" ');
   Sql.Add('  )');


  ExecSql;
   // End
 // Except

    End;


  abrir;
  //ultimamatricula;



end;



procedure Tfrmlocacao.inseriritens;
var
A, M, D: Word;
dtdevolucao : string;
begin
DecodeDate(Date, M, D, A);



editsemana.text:= DataExtenso(date)     ;


if (editsemana.text = 'sabado') and (dm.sqlitenslocacao.RecordCount > 2) then
begin
dtdevolucao:= DateToStr(IncDay(date, +2)) ;
editdatadevolucao.Text := DataIng( CDateStr(strtodate(dtdevolucao)));
end else begin
if (editsemana.text = 'sabado') and (dm.sqlitenslocacao.RecordCount <= 2) then
begin
dtdevolucao:= DateToStr(IncDay(date, +2)) ;
editdatadevolucao.Text := DataIng( CDateStr(strtodate(dtdevolucao)));

end else begin
if (editsemana.text = 'sexta') and (dm.sqlitenslocacao.RecordCount <= 1) then
begin
dtdevolucao:= DateToStr(IncDay(date, +1)) ;
editdatadevolucao.Text := DataIng( CDateStr(strtodate(dtdevolucao)));
end else begin

if (editsemana.text = 'sexta') and (dm.sqlitenslocacao.RecordCount > 1) then
begin
dtdevolucao:= DateToStr(IncDay(date, +3)) ;
editdatadevolucao.Text := DataIng( CDateStr(strtodate(dtdevolucao)));

end else begin
if  (dm.sqlitenslocacao.RecordCount < 1) then
begin
dtdevolucao:= DateToStr(IncDay(date, +1)) ;
editdatadevolucao.Text := DataIng( CDateStr(strtodate(dtdevolucao)));

end else begin
if  (dm.sqlitenslocacao.RecordCount > 1) then
begin
dtdevolucao:= DateToStr(IncDay(date, +2)) ;
editdatadevolucao.Text := DataIng( CDateStr(strtodate(dtdevolucao)));


end;
end;

end;
end;
end;
end;




 editquantidade.Text:='1';//InputBox('Aten��o', 'Digite a Quantidade', '1');


  With dm.sqlitenslocacao do
  Begin
  // ultimamatricula;
  Close;
  Sql.Clear;
  Sql.Add('Insert Into itenslocacao (codvenda,descricao,univenda,  ' ) ;
  Sql.Add('  qtd,    ') ;
    Sql.Add(' preco, codprod,desconto, dtdevolucao, codcli ) ');

   Sql.Add(' values ( "' + editcodlocacao.Text+ '"  , "' + dm.sqlprodutosDescricao.AsString + '" , ');
   Sql.Add('  "' + dm.sqlprodutosUnivenda.AsString +'", "1" ,');
   Sql.Add('   "' + TrocaVirgPPto(dm.sqlprodutosPrecolocacao.AsString)+ '","' + dm.sqlprodutosCodProd.AsString+ '","' + TrocaVirgPPto(dm.sqlprodutosDesconto.AsString)+ '" , "' + editdatadevolucao.text+ '" , "' + editcodcli.text+ '"  )  ');


  ExecSql;



  End;



  abrir;
  //ultimamatricula;



end;



procedure Tfrmlocacao.FormCreate(Sender: TObject);
var
A, M, D: Word;
vardata: TDate;
dtdevolucao: string;
begin

editsemana.text:= DataExtenso(date)     ;
//dtdevolucao:= DateToStr(IncDay(date, +1)) ;
//editdatadevolucao.Text := DataIng( CDateStr(strtodate(dtdevolucao)));

DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);


DecodeDate(Date, A, M, D);
//ShowMessage(Format('Dia %.2d do m�s %.2d de %d.', [D, M, A]));


 
editdata.text:= Format('%.2d/%.2d/%d', [A, M ,D ]);

   inserirdadoslocacao;

frmprivendas.tag:= 5;
Application.CreateForm(Tfrmescclientes,  frmescclientes);
frmescclientes.ShowModal;


end;

procedure Tfrmlocacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
frmprivendas.Tag:=0;
end;

procedure Tfrmlocacao.SpeedButton1Click(Sender: TObject);
begin
frmprivendas.tag:= 5;
Application.CreateForm(Tfrmescclientes,  frmescclientes);
frmescclientes.ShowModal;
end;

procedure Tfrmlocacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
  vk_Escape: close;
end;
end;

procedure Tfrmlocacao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if (editcodlocacao.text <> '')  then
begin
  if MessageDlg ( 'Voc� n�o finalizou a Loca��o, sua nota de Loca��o ser� cancelada.',
  mtConfirmation, [mbok, mbCancel], 0) = idok then
  begin

    cancelarnota;

  end
  else
  begin
   Canclose:=False;


      end;
end;

end;

procedure Tfrmlocacao.editbarraKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
with  dm.sqlprodutos do
     begin
     Close;
     SQL.Clear;
     SQL.Add('Select * from produtos where barra = "' + editbarra.text +'"  ');
    // params[0].AsString := editresponsavel.text;
     open;
     end;

if (dm.sqlprodutos.RecordCount > 0) and (editbarra.text <> '') then
begin
inseriritens;
total;
//dm.tblitensQtd.FocusControl;
editquantidade.Text:='1';
editbarra.Text:='';
editbarra.SetFocus;
  end else begin

Application.CreateForm(tfrmescprodutovendas,frmescprodutovendas);
frmescprodutovendas.showmodal;

 editbarra.Text:='';
editbarra.SetFocus;
 end;
end;
    end;



 

procedure Tfrmlocacao.FormActivate(Sender: TObject);
begin
editbarra.SetFocus;
end;

procedure Tfrmlocacao.Confirmar1Click(Sender: TObject);
begin
if editcodcli.Text = '' then
begin
ShowMessage('Por favor escolha um cliente antes de finalizar!');
end else begin
if editbarra.Visible = true then
begin
if dm.sqlitenslocacao.RecordCount > 0 then
begin
if editqtditens.Text = '0' then
begin
ShowMessage('Voce Nao pode finalizar a nota, pq nao tem itens');
end else begin
if editcodlocacao.Text <> '' then
begin
Application.CreateForm(Tfrmfecharlocacao, frmfecharlocacao);
frmfecharlocacao.ShowModal;

  
end;
    end;
    end;
end;

end;    end;

procedure Tfrmlocacao.ExcluirItem1Click(Sender: TObject);
var reg: string;
begin
if editbarra.Visible = true then
begin
if dm.sqlitenslocacao.RecordCount > 0 then
begin
if  application.messagebox('Deseja Excluir Este Item?',
   'Confirma��o' , mb_yesno + mb_iconquestion) = mrYes then
   begin
   reg:=dm.sqlitenslocacaoregistro.AsString;
with dm.sqlitenslocacao do
     begin
     Close;
     SQL.Clear;
     SQL.Add('DELETE FROM itenslocacao where registro = "' + reg + '" ');
     ExecSQL;

end;

abrir;
total;
end;
 end;
 end;
 end;

procedure Tfrmlocacao.ExcluirTodososItens1Click(Sender: TObject);
begin
if editbarra.Visible = true then
begin
if dm.sqlitenslocacao.RecordCount > 0 then
begin
if editcodlocacao.Text <> '' then
begin
if  application.messagebox('Deseja excluir esta nota?',
   'Confirma��o' , mb_yesno + mb_iconquestion) = mrYes then
   begin

   cancelarnota;
   inserirdadoslocacao;
   total;

end;
end;
end;
end;
end;

procedure Tfrmlocacao.DBGrid1DblClick(Sender: TObject);
begin
Application.CreateForm(Tfrmalterardata, frmalterardata);
frmalterardata.ShowModal;
end;

procedure Tfrmlocacao.BitBtn1Click(Sender: TObject);
begin
close;
end;

end.
