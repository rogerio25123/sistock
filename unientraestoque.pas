unit unientraestoque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Mask, DBCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls;

type
  Tfrmentrada = class(TForm)
    Label2: TLabel;
    DBText1: TDBText;
    Panel3: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    labelnota: TLabel;
    Label11: TLabel;
    editbarra: TEdit;
    editquantidade: TEdit;
    DBGrid1: TDBGrid;
    edittotal: TEdit;
    editqtditens: TEdit;
    editsenha: TEdit;
    editvendedor: TEdit;
    editdata: TEdit;
    DBEdit3: TDBEdit;
    editcodvenda: TEdit;
    PopupMenu1: TPopupMenu;
    Inserir1: TMenuItem;
    Confirmar1: TMenuItem;
    ExcluirTodososItens1: TMenuItem;
    ExcluirItem1: TMenuItem;
    ImprimirOramento1: TMenuItem;
    MudarQtd1: TMenuItem;
    Label1: TLabel;
    Panel1: TPanel;
    Label3: TLabel;
    Panel2: TPanel;
    Label6: TLabel;
    StatusBar1: TStatusBar;
    editpreco: TEdit;
    editdescricao: TEdit;
    procedure editbarraKeyPress(Sender: TObject; var Key: Char);
    procedure editsenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Confirmar1Click(Sender: TObject);
    procedure ExcluirItem1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure inseriritens;
    procedure abrir;
    procedure total;
    procedure inserirdadosentrada;
    procedure ultimavenda;
    procedure  cancelarnota;
    procedure alteradadosentrada;
    procedure entradaestoque;
  end;

var
  frmentrada: Tfrmentrada;
  ultimo : integer;

implementation

uses unidm, unientradaescprod;

{$R *.DFM}


function EnDecryptString(StrValue : String; Chave: Word) : String;
var
I: Integer;
OutValue : String;
begin
OutValue := '';
for I := 1 to Length(StrValue) do
OutValue := OutValue + char(Not(ord(StrValue[I])-Chave));
Result := OutValue;
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

procedure Tfrmentrada.entradaestoque;
var
 marca,marca2:  TBookmarklist ;
begin
//marca:= dm.sqlprodutos.GetBookmark;
//marca2:= dm.sqlitens.GetBookmark;
//  try
 // dm.sqlprodutos.DisableControls;
 // dm.sqlitens.DisableControls;

//Gauge1.Visible:= true;
//Gauge1.Progress:=0;
//Gauge1.MaxValue:= dm.sqlitens.RecordCount;

 //With dm2.sqlprodutos do
  //Begin
  //Close;
  //Sql.Clear;
  //Sql.Add('Update produtos set estoque = estoque + (select qtd from itensentrada where codprod = produtos.codprod  ),   ' ) ;


  //Sql.Add(' precovenda = (select preco from itensentrada where codprod = produtos.codprod  ) where codprod = (select codprod from itensentrada where  codprod = produtos.codprod) ');
  //ExecSql;
  //  Sql.Add('Update itensvendas set preco = (select precovenda from produtos where codprod = itensvendas.codprod )   ' ) ;
  // Sql.Add('   where codvenda = "'+ editcodvenda.Text +'" ') ;

 // end;







          dm2.sqlitensentrada.First;
While not dm2.sqlitensentrada.Eof do
  Begin
  With dm2.sqlprodutos do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update produtos set estoque = estoque + "'+TrocaVirgPPto(dm2.sqlitensentradaQtd.AsString)+'", ' ) ;


  Sql.Add(' precovenda = "'+TrocaVirgPPto( dm2.sqlitensentradaPreco.AsString)+'", preco2 = "'+TrocaVirgPPto( dm2.sqlitensentradapreco2.AsString)+'", preco3 = "'+TrocaVirgPPto( dm2.sqlitensentradaPreco3.AsString)+'"  where codprod = "'+dm2.sqlitensentradaCodprod.AsString+'" ') ;
  ExecSql;

  end;

 //   Gauge1.Progress:=Gauge1.Progress+1;
    dm2.sqlitensentrada.Next;
   End;
 // finally   
 //Gauge1.Visible:= false;

// dm.sqlprodutos.GotoBookmark(marca);
// dm.sqlitens.GotoBookmark(marca2);

 //dm.sqlitens.EnableControls;
 //dm.sqlprodutos.EnableControls;

// dm.sqlprodutos.FreeBookmark(marca);
// dm.sqlitens.FreeBookmark(marca2);
 //end;
    // dm.tbldadositens.edit;
     //dm.tbldadositensFechado.AsString:= 'S';
     //dm.tbldadositens.Post;




   // frmvendas.FormRefresh(self);

     End;


procedure Tfrmentrada.alteradadosentrada;
begin
 With dm2.sqldadosentrada do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update dadosentradas set total =  "'+TrocaVirgPPto(edittotal.Text)+'", totalitens = "'+editqtditens.Text+'" ,' ) ;


  Sql.Add(' situacao = "FECHADO",  vendedor = "'+editvendedor.text+'",descricao = "'+editdescricao.text+'"    where codvenda = "'+editcodvenda.Text+'" ') ;
  ExecSql;

  end;

  editdescricao.text:= '';
  end;


procedure  Tfrmentrada.ultimavenda;
 begin
  With dm2.sqlultimaentrada do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT MAX( codvenda + 1  ) ultimavenda  FROM dadosentradas ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;
     if (dm2.sqlultimaentradaultimavenda.AsString = '' )  then
  begin
  ultimo:= 1;
  end else begin
  ultimo:= 0;
  ultimo:= dm2.sqlultimaentradaultimavenda.AsInteger;
  end;

 editcodvenda.text := inttostr(ultimo);
 labelnota.caption:= inttostr(ultimo);
// edittitulo.text := dm.sqlultimousuultimamatricula.AsString;
end;



procedure Tfrmentrada.inserirdadosentrada;
begin



  With dm2.sqldadosentrada do
  Begin
   ultimavenda;
  Close;
  Sql.Clear;
  Sql.Add('Insert Into dadosentradas (codvenda, data, horas ) ' ) ;


   Sql.Add(' values ( "' + inttostr(ultimo)+ '", "' + editdata.Text+ '","' + timetostr(time)+ '" ');
   Sql.Add('  )');


  ExecSql;
   // End
 // Except



    End;


  abrir;
  //ultimamatricula;



end;





procedure  Tfrmentrada.total;
 begin
  With dm2.sqlitenssomaentrada do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT sum( qtd*preco ) somatotal  FROM itensentrada where codvenda = "' + editcodvenda.text +'" ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;

 // ultimo := ultimo + sqlmaximomaximoreg.AsInteger+1;

 edittotal.text := dm2.sqlitenssomaentradasomatotal.AsString;
  label3.Caption:= dm2.sqlitenssomaentradasomatotal.asstring;

  With dm2.sqlitenscountentrada do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT count( registro ) somaitens  FROM itensentrada where codvenda = "' + editcodvenda.text +'" ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;
 editqtditens.Text:= dm2.sqlitenscountentradasomaitens.asstring;

 label6.Caption:= dm2.sqlitenscountentradasomaitens.asstring;;

// edittitulo.text := dm.sqlultimousuultimamatricula.AsString;
end;



procedure Tfrmentrada.abrir;
begin
  With dm2.sqlitensentrada do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from itensentrada  where codvenda = "' + editcodvenda.text +'"  ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;
  dm2.sqlitensentrada.Last;
end;





procedure Tfrmentrada.inseriritens;
var precovenda1,precovenda2,precovenda3 : string;
begin
 editquantidade.Text:=InputBox('Aten��o', 'Digite a Quantidade', '1');
// editpreco.text := InputBox('Aten��o', 'Digite 0 Pre�o ou Mantenha o mesmo', '' + dm2.sqlprodutosPrecovenda.AsString+ '');
 precovenda1 :=  InputBox('Aten��o', 'Digite o pre�o de venda 1', '' + dm2.sqlprodutosPrecovenda.AsString+ '');
 precovenda2  :=  InputBox('Aten��o', 'Digite o pre�o de venda 2', '' + dm2.sqlprodutosPreco2.AsString+ '');
 precovenda3   :=    InputBox('Aten��o', 'Digite o pre�o de venda 3', '' + dm2.sqlprodutosPreco3.AsString+ '');

  With dm2.sqlitensentrada do
  Begin
  // ultimamatricula;
  Close;
  Sql.Clear;
  Sql.Add('Insert Into itensentrada (codvenda,descricao,univenda,  ' ) ;
  Sql.Add('  qtd,    ') ;
    Sql.Add('  preco, preco2, preco3, codprod ) ');

  // Sql.Add(' values ( "' + editcodvenda.Text+ '"  , "' + dm2.sqlprodutosDescricao.AsString + '" , ');
   //Sql.Add('  "' + dm2.sqlprodutosUnivenda.AsString +'", "' + TrocaVirgPPto(editquantidade.text)+ '" ,');
   //Sql.Add('   "' + TrocaVirgPPto(editpreco.Text)+ '","' + dm2.sqlprodutosCodProd.AsString+ '"   )  ');
   Sql.Add(' values ( "' + editcodvenda.Text+ '"  , "' + dm2.sqlprodutosDescricao.AsString + '" , ');
   Sql.Add('  "' + dm2.sqlprodutosUnivenda.AsString +'", "' + TrocaVirgPPto(editquantidade.text)+ '" ,');
   Sql.Add('   "' + TrocaVirgPPto(precovenda1)+ '","' + TrocaVirgPPto(precovenda2)+ '","' + TrocaVirgPPto(precovenda3)+ '","' + dm2.sqlprodutosCodProd.AsString+ '"   )  ');


  ExecSql;
   // End
 // Except





  End;







  abrir;
  //ultimamatricula;



end;

procedure  Tfrmentrada.cancelarnota;
begin
with dm2.sqldadosentrada do
     begin
     Close;
     SQL.Clear;
     SQL.Add('DELETE FROM dadosentradas where codvenda = "' + editcodvenda.Text + '" ');
     ExecSQL;

end;


with dm2.sqlitensentrada do
     begin
     Close;
     SQL.Clear;
     SQL.Add('DELETE FROM itensentrada where codvenda = "' + editcodvenda.Text + '" ');
     ExecSQL;

end;



end;




procedure Tfrmentrada.editbarraKeyPress(Sender: TObject; var Key: Char);
var varbarra : string;
begin

varbarra:= StringReplace(editbarra.text, 'F', EmptyStr, [rfReplaceAll])  ;
varbarra:= StringReplace(varbarra, '#', EmptyStr, [rfReplaceAll]) ;

if key = #13 then
begin
    
with  dm2.sqlprodutos do
     begin
     Close;
     SQL.Clear;
     SQL.Add('Select * from produtos where barra = "' +  varbarra +'" ');
    // params[0].AsString := editresponsavel.text;
     open;
     end;

if (dm2.sqlprodutos.RecordCount> 0) and (editbarra.text <> '') then
begin
inseriritens;
total;
//dm.tblitensQtd.FocusControl;
editquantidade.Text:='1';
editbarra.Text:='';
editbarra.SetFocus;

 end else begin
 if editbarra.text <> '' then
 begin
Application.CreateForm(tfrmescproduto,frmescproduto);
frmescproduto.showmodal;

end;
    end;
    end;

end;

procedure Tfrmentrada.editsenhaKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
With dm2.sqlvendedor do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from vendedor  where senha = "' +  editsenha.text  +'"  ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;

  if (editsenha.Text = dm2.sqlvendedorSenha.AsString ) and (editsenha.Text <> '') then
begin
 inserirdadosentrada;
 //Button1.Enabled:=false;
 editbarra.Visible:= true;
//editquantidade.Visible:= true;
//Label12.Visible:=true;
Label13.Visible:=true;
DBGrid1.Visible:=true;
//editdescricao.Visible:=true;
//GroupBox1.Visible:=true;
//Button1.Visible:=false;
editsenha.Visible:=false;
editbarra.SetFocus;
editvendedor.text:= dm2.sqlvendedorVendedor.AsString;
end else begin
ShowMessage('Senha Nao Confere');
end;

end;


end;
    
procedure Tfrmentrada.FormCreate(Sender: TObject);
var
A, M, D: Word;
vardata: TDate;
begin
DecodeDate(Date, A, M, D);
//ShowMessage(Format('Dia %.2d do m�s %.2d de %d.', [D, M, A]));



editdata.text:= Format('%.2d/%.2d/%d', [A, M ,D ]);


end;

procedure Tfrmentrada.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if (editcodvenda.text <> '')  then
begin
  if MessageDlg ( 'Voc� n�o finalizou a venda, sua nota de venda ser� cancelada.',
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
procedure Tfrmentrada.Confirmar1Click(Sender: TObject);
begin
if editqtditens.Text = '0' then
begin
ShowMessage('Voce Nao pode finalizar a nota, pq nao tem itens');
end else begin
if editcodvenda.Text <> '' then
begin
if  application.messagebox('Deseja finalizar a nota?',
   'Confirma��o' , mb_yesno + mb_iconquestion) = mrYes then
   begin
     entradaestoque;
      alteradadosentrada;
   inserirdadosentrada;
   total;

end;
    end;
    end;

end;

procedure Tfrmentrada.ExcluirItem1Click(Sender: TObject);
var reg : string;
begin
if editqtditens.Text = '0' then
begin
ShowMessage('Voce Nao pode Excluir, nao existem itens');
end else begin
if  application.messagebox('Deseja Excluir Este Item?',
   'Confirma��o' , mb_yesno + mb_iconquestion) = mrYes then
   begin
   reg:=dm2.sqlitensentradaRegistro.AsString;
with dm2.sqlitensentrada do
     begin
     Close;
     SQL.Clear;
     SQL.Add('DELETE FROM itensentrada where registro = "' + reg + '" ');
     ExecSQL;

end;

abrir;
total;
end;
 end;
end;

procedure Tfrmentrada.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
  vk_Escape: close;

end;
    end;
end.
