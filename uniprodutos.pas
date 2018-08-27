unit uniprodutos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, DB, ZAbstractRODataset,
  ZAbstractDataset, ZAbstractTable, ZDataset;

type
  Tfrmprodutos = class(TForm)
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    editgrupo: TEdit;
    editbarra: TEdit;
    editdescricao: TEdit;
    editund: TEdit;
    editmarca: TEdit;
    editprecocusto: TEdit;
    editdesconto: TEdit;
    editprecovenda: TEdit;
    editcodforn: TEdit;
    BitBtn1: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    editpesquisar: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    editexclui: TEdit;
    DBGrid1: TDBGrid;
    editmatricula: TEdit;
    editminimo: TEdit;
    Label20: TLabel;
    BitBtn6: TBitBtn;
    editestoque: TEdit;
    Label2: TLabel;
    BitBtn7: TBitBtn;
    Label3: TLabel;
    editprecolocacao: TEdit;
    editpreco2: TEdit;
    Label4: TLabel;
    editpreco3: TEdit;
    Label5: TLabel;
    BitBtn8: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure editdescontoExit(Sender: TObject);
    procedure editprecovendaExit(Sender: TObject);
    procedure editprecocustoKeyPress(Sender: TObject; var Key: Char);
    procedure editprecovendaKeyPress(Sender: TObject; var Key: Char);
    procedure editdescontoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure editbarraKeyPress(Sender: TObject; var Key: Char);
    procedure editprecolocacaoKeyPress(Sender: TObject; var Key: Char);
    procedure editbarraExit(Sender: TObject);
    procedure editpreco2KeyPress(Sender: TObject; var Key: Char);
    procedure editpreco3KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure gravardados;
    procedure ultimamatricula;
    procedure abrir;
    procedure alteracao;
  end;

var
  frmprodutos: Tfrmprodutos;
  ultimo :  integer;

implementation

uses unidm, unirelprodutos, unilistarentradas;

{$R *.DFM}

function BuscaTroca(Text,Busca,Troca : string) : string;
{ Substitui um caractere dentro da string}
var n : integer;
begin
for n := 1 to length(Text) do
  begin
  if Copy(Text,n,1) = Busca then
  begin
  Delete(Text,n,1);
  Insert(Troca,Text,n);
  end;
  end;
Result := Text;
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
 



 procedure Tfrmprodutos.alteracao;
 begin
 With dm2.sqlprodutos do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update produtos set grupo = "'+editgrupo.text+'", barra = "'+ StringReplace(editbarra.text, 'F', EmptyStr, [rfReplaceAll])+'" , ' ) ;
  Sql.Add(' descricao = "'+BuscaTroca(editdescricao.text,'"',' POL.')+'", univenda = "'+editund.text+'" , ' ) ;
  Sql.Add(' marca = "'+editmarca.text+'", precocusto = "'+TrocaVirgPPto(editprecocusto.text)+'" , ' ) ;
  Sql.Add(' desconto = "'+TrocaVirgPPto(editdesconto.text)+'", precovenda = "'+TrocaVirgPPto(editprecovenda.text)+'",  ' ) ;
  Sql.Add(' codforn = "'+editcodforn.text+'", estoqueminimo = "'+editminimo.text+'" , estoque = "'+editestoque.text+'"  , preco2 = "'+editpreco2.text+'" , preco3 = "'+editpreco3.text+'"   ' ) ;

  Sql.Add('   where codprod = "'+editmatricula.text+'" ') ;
  ExecSql;

  end;
  Showmessage('Dados alterados com sussesso');
  // editgrupo.Text:='';
   editbarra.text:='';
   editdescricao.text:='';
   editund.text:='UND';
   editmarca.text:='';
   editprecocusto.text:='0';
   editdesconto.text:='0';
   editprecovenda.text:='0';
    editpreco2.text:='0';
     editpreco3.text:='0';
   editprecolocacao.text:='0';
   editcodforn.text:='';
//   editminimo.text:='';
   editestoque.Text:='0';
 //  ultimamatricula;

   
       abrir;
  ultimamatricula;
  editbarra.Text:=  IntToStr(ultimo);

  end;



procedure Tfrmprodutos.abrir;
begin
  With dm2.sqlprodutos do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from produtos  order by codprod ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;
  dm2.sqlprodutos.Last;
end;


procedure  Tfrmprodutos.ultimamatricula;
 begin
  With dm2.sqlultimousu do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT MAX( codprod + 1 )  ultimamatricula  FROM produtos  ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End  SELECT MAX( codprod + 1 ) ultimamatricula FROM produtos
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;
   if (dm2.sqlultimousuultimamatricula.AsString = '' )  then
  begin
  ultimo:= 1;
  end else begin
  ultimo:= 0;
  ultimo:= dm2.sqlultimousuultimamatricula.AsInteger;
  end;

 editmatricula.text := inttostr(ultimo);
// edittitulo.text := dm22.sqlultimousuultimamatricula.AsString;
end;


procedure Tfrmprodutos.gravardados;
//var I:integer;
begin
//I := 1;
//while true do
//begin
//Inc(I);


  With dm2.sqlprodutos do
  Begin
   ultimamatricula;
  Close;
  Sql.Clear;
  Sql.Add('Insert Into produtos (codprod,barra,grupo,  ' ) ;
  Sql.Add('  descricao, univenda, marca ,   ') ;
    Sql.Add('  precocusto, desconto, precovenda, codforn, estoqueminimo, estoque, preco2, preco3) ');

   Sql.Add(' values ( "' + inttostr(ultimo)+ '"  , "' +  StringReplace(editbarra.text, 'F', EmptyStr, [rfReplaceAll]) + '" , ');
   Sql.Add('  "' + editgrupo.text +'", "' +BuscaTroca(editdescricao.text,'"','POL.') +'"  , "' + editund.text + '" , "' + editmarca.text + '" ,');
   Sql.Add('   "' + TrocaVirgPPto(editprecocusto.text)+ '"  , "' +TrocaVirgPPto(editdesconto.text) + '",  ');
   Sql.Add('  "' + TrocaVirgPPto(editprecovenda.text) +'", "' + editcodforn.text+ '"  , "' + editminimo.text + '", "' + editestoque.text + '", "' +TrocaVirgPPto(editpreco2.text) + '", "' +TrocaVirgPPto(editpreco3.text) + '" )  ');


  ExecSql;
   // End
 // Except
 Showmessage('dados gravados com sussesso');
   editbarra.text:='';
   editdescricao.text:='';
   editund.text:='UND';
   editmarca.text:='';
   editprecocusto.text:='0';
   editdesconto.text:='0';
   editprecovenda.text:='0';
      editpreco2.text:='0';
         editpreco2.text:='0';
   editprecolocacao.text:='0';
   editcodforn.text:='';
   editminimo.text:='0';
    editestoque.Text:='0';


  End;


  abrir;
  ultimamatricula;
  editbarra.Text:=  IntToStr(ultimo);
   
  //if I = 20000 then

//Break
         end;


procedure Tfrmprodutos.BitBtn1Click(Sender: TObject);
begin
if tag = 1 then
begin
alteracao;

tag:=0;
abrir;
//editgrupo.SetFocus;
editbarra.SetFocus;
end else begin
if tag= 0 then
begin
if editdescricao.Text = '' then
begin
ShowMessage('Digite o nome do produto');
end else begin
gravardados;
abrir;

dm2.sqlprodutos.Last;
editbarra.SetFocus;
end;


end;
end;
end;

procedure Tfrmprodutos.BitBtn2Click(Sender: TObject);
begin
with dm2.sqlprodutos do
     begin
     Close;
     SQL.Clear;
    // SQL.Add('Select * from produtos where UPPER(descricao)LIKE UPPEr(''%'' + :3 + ''%'')  order by descricao');
      SQL.Add('Select * from produtos where descricao LIKE   "%' + editpesquisar.text + '%"    order by descricao');
    // params[0].AsString := editpesquisar.text;
     open;
     end;

end;


procedure Tfrmprodutos.BitBtn3Click(Sender: TObject);
begin
if editexclui.text = '' then begin
ShowMessage('Digite o código do produto, no campo CodProd!');
end else begin
if  application.messagebox('Deseja Excluir?',
   'Confirmação' , mb_yesno + mb_iconquestion) = mrYes then
   begin

with dm2.sqlprodutos do
     begin
     Close;
     SQL.Clear;
     SQL.Add('DELETE FROM produtos where codprod = "' + editexclui.text + '" ');
     ExecSQL;

end;
editexclui.text:='';
abrir;
ultimamatricula;
editbarra.text:= inttostr(ultimo);
editbarra.SetFocus;

end;
end;
end;
procedure Tfrmprodutos.BitBtn5Click(Sender: TObject);
begin
abrir;
close;
end;

procedure Tfrmprodutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure Tfrmprodutos.BitBtn4Click(Sender: TObject);
begin
editgrupo.text:= dm2.sqlprodutosGrupo.asstring;
editbarra.Text:= dm2.sqlprodutosBarra.AsString;
editdescricao.Text:= dm2.sqlprodutosDescricao.AsString;
editund.Text:= dm2.sqlprodutosUnivenda.AsString;
editmarca.Text:= dm2.sqlprodutosMarca.AsString;
editprecocusto.Text:= dm2.sqlprodutosPrecocusto.AsString;
editdesconto.Text:= dm2.sqlprodutosDesconto.AsString;
editprecovenda.Text:= dm2.sqlprodutosPrecovenda.AsString;
editpreco2.Text:= dm2.sqlprodutosPreco2.AsString;
editpreco3.Text:= dm2.sqlprodutosPreco3.AsString;
editcodforn.Text:= dm2.sqlprodutosCodForn.AsString;
editminimo.Text:= dm2.sqlprodutosEstoqueMinimo.AsString;
editestoque.Text:= dm2.sqlprodutosEstoque.AsString;
editprecolocacao.Text:= dm2.sqlprodutosprecolocacao.AsString;

editmatricula.Text:= dm2.sqlprodutosCodProd.AsString;

tag:=1;
end;

procedure Tfrmprodutos.BitBtn6Click(Sender: TObject);
var  varcodprod, vardescricao : string;
begin
          dm2.sqlprodutos.First;
While not dm2.sqlprodutos.Eof do
    Begin
    vardescricao:= dm2.sqlprodutosDescricao.AsString;
    varcodprod:= dm2.sqlprodutosCodProd.AsString;
     vardescricao:=   BuscaTroca(vardescricao,'"',' POL.');
     vardescricao:=   BuscaTroca(vardescricao,'"D"',' ''D'' ')  ;

 With dm2.sqlprodutos2 do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update produtos set descricao = "'+ vardescricao +'" where codprod = "'+varcodprod+'" ' ) ;

  ExecSql;

  end;
  dm2.sqlprodutos.Next;
end;
         end;
procedure Tfrmprodutos.editdescontoExit(Sender: TObject);
var varprecocusto ,varprecovenda, varporc: double;
begin
//varprecocusto:=  strtofloat(editprecocusto.text);
//varprecovenda:=  strtofloat(editprecovenda.text);
//varporc :=    strtofloat(editaddperc.text);
//editprecovenda.Text:= floattostr(((varprecocusto*varporc)/100)+ varprecocusto);
end;

procedure Tfrmprodutos.editprecovendaExit(Sender: TObject);
var varprecocusto ,varprecovenda, varporc: double;
begin
//varprecocusto:=  strtofloat(editprecocusto.text);
//varprecovenda:=  strtofloat(editprecovenda.text);
//varporc :=    strtofloat(editaddperc.text);
//editaddperc.Text:= floattostrF((((varprecovenda-varprecocusto)*100)/ varprecocusto),ffFixed,18,2);


end;

procedure Tfrmprodutos.editprecocustoKeyPress(Sender: TObject;
  var Key: Char);
begin
if Not (key in ['0'..'9',#8, ',' ]) then
key := #0;
end;

procedure Tfrmprodutos.editprecovendaKeyPress(Sender: TObject;
  var Key: Char);
begin
if Not (key in ['0'..'9',#8, ',' ]) then
key := #0;
end;

procedure Tfrmprodutos.editdescontoKeyPress(Sender: TObject; var Key: Char);
begin
if Not (key in ['0'..'9',#8, ',' ]) then
key := #0;
end;

procedure Tfrmprodutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
  vk_Escape: close;

end;

end;

procedure Tfrmprodutos.BitBtn7Click(Sender: TObject);
begin
Application.createform(Tfrmrelprodutos, frmrelprodutos);
frmrelprodutos.QuickRep1.preview;
end;

procedure Tfrmprodutos.FormCreate(Sender: TObject);
begin
abrir;
ultimamatricula;
editbarra.text:= inttostr(ultimo);
end;

procedure Tfrmprodutos.editbarraKeyPress(Sender: TObject; var Key: Char);
var varbarra : string;
begin

varbarra:= StringReplace(editbarra.text, 'F', EmptyStr, [rfReplaceAll])  ;
varbarra:= StringReplace(varbarra, '#', EmptyStr, [rfReplaceAll]) ;


if key = #13 then
begin
if editdescricao.Text <> '' then
begin

end else begin

with  dm2.sqlprodutos do
     begin
     Close;
     SQL.Clear;
     SQL.Add('Select * from produtos where barra = "' + varbarra +'"  ');
    // params[0].AsString := editresponsavel.text;
     open;
     end;

     if dm2.sqlprodutos.RecordCount > 0 then begin
     ShowMessage('Produto cadastrado!');
     editbarra.Text := '';
     editbarra.SetFocus;
     end else begin
       editdescricao.SetFocus;
     end;
     end;
      end;

    end;
procedure Tfrmprodutos.editprecolocacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
if Not (key in ['0'..'9',#8, ',' ]) then
key := #0;
end;

procedure Tfrmprodutos.editbarraExit(Sender: TObject);
var varbarra : string;
begin
varbarra:= StringReplace(editbarra.text, 'F', EmptyStr, [rfReplaceAll])  ;
varbarra:= StringReplace(varbarra, '#', EmptyStr, [rfReplaceAll]) ;


editbarra.text := varbarra ;

end;

procedure Tfrmprodutos.editpreco2KeyPress(Sender: TObject; var Key: Char);
begin
if Not (key in ['0'..'9',#8, ',' ]) then
key := #0;
end;

procedure Tfrmprodutos.editpreco3KeyPress(Sender: TObject; var Key: Char);
begin
if Not (key in ['0'..'9',#8, ',' ]) then
key := #0;
end;

procedure Tfrmprodutos.BitBtn8Click(Sender: TObject);
begin
Application.CreateForm(Tfrmlistarentradas, frmlistarentradas);
frmlistarentradas.showmodal;
end;

end.
