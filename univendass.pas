unit univendass;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Grids, DBGrids, Mask, DBCtrls, ExtCtrls, Buttons, Gauges,
  ComCtrls;

type

  Tfrmprivendas = class(TForm)
    Label2: TLabel;
    Panel3: TPanel;
    DBEdit3: TDBEdit;
    PopupMenu1: TPopupMenu;
    Inserir1: TMenuItem;
    Confirmar1: TMenuItem;
    ExcluirItem1: TMenuItem;
    ExcluirTodososItens1: TMenuItem;
    ImprimirOramento1: TMenuItem;
    MudarQtd1: TMenuItem;
    editcodvenda: TEdit;
    Label13: TLabel;
    editbarra: TEdit;
    editquantidade: TEdit;
    Label1: TLabel;
    labelnota: TLabel;
    DBGrid11: TDBGrid;
    edittotal: TEdit;
    editqtditens: TEdit;
    editsenha: TEdit;
    editvendedor: TEdit;
    Label11: TLabel;
    editdata: TEdit;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Label3: TLabel;
    Panel2: TPanel;
    Label6: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Panel4: TPanel;
    labeldesconto: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    labeltotal: TLabel;
    CheckBox1: TCheckBox;
    ConfigurarBanco1: TMenuItem;
    PesquisarProduto1: TMenuItem;
    Label12: TLabel;
    Image1: TImage;
    checkperguntarqtd: TCheckBox;
    btnpreco1: TBitBtn;
    btnpreco2: TBitBtn;
    btnpreco3: TBitBtn;
    base: TSpeedButton;
    procedure Confirmar1Click(Sender: TObject);
    procedure ExcluirItem1Click(Sender: TObject);
    procedure ExcluirTodososItens1Click(Sender: TObject);
    procedure editbarraKeyPress(Sender: TObject; var Key: Char);
    procedure Image6Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure editquantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure editsenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ImprimirOramento1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure PesquisarProduto1Click(Sender: TObject);
    procedure MudarQtd1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ConfigurarBanco1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Inserir1Click(Sender: TObject);
    procedure btnpreco1Click(Sender: TObject);
    procedure btnpreco2Click(Sender: TObject);
    procedure btnpreco3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

     procedure inseriritens;
    procedure abrir;
    procedure ultimavenda;
    procedure inserirdadosvendas;
    procedure  cancelarnota;
    procedure  total;
    procedure baixaestoque;
    procedure alteradadosvendas;
     procedure abrirbanco;
     procedure abrirprint;

  end;

var
  frmprivendas: Tfrmprivendas;
  ultimo:integer;

implementation  uses unidmvendas, uniescproduto, unirelorcamento,
  univendasbanco, uninaocadastrado,  uniimprimirvendas, unifecharvendas,
  uniimprimirvendas2, unilocacao, unipgtodeconta, unipgtodecontavendas,
  unidevolucao, unitroca;

{$R *.DFM}

 procedure Tfrmprivendas.abrirbanco;
 begin
dm.conexao.Database := dm.tbbancoBanco.AsString;
dm.conexao.HostName := dm.tbbancoHost.AsString;
dm.conexao.User := dm.tbbancoLogin.AsString;
dm.conexao.Password := dm.tbbancosenha.AsString;
dm.conexao.Connected := true;
end;


procedure Tfrmprivendas.abrirprint;
var codvendas :string;
begin
codvendas :=  IntToStr(ultimo);
frmprivendas.Caption:= codvendas;

     ///abrir dados vendas
  With dm.sqldadosvendasprint do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from dadosvendas  where codvenda = "' + codvendas +'"   ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;


  ///abrir itens vendas
  With dm.sqlitensprint do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from itensvendas  where codvenda = "' + codvendas +'"  ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;

end;

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

procedure Tfrmprivendas.alteradadosvendas;
var varentrega: string;
begin
//varentrega:= InputBox('Aten��o', 'Digite o local de entrega caso seja necess�rio e o Nome.', UpperCase( ''));
 With dm.sqldadosvendas do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update dadosvendas set total =  "'+TrocaVirgPPto(edittotal.Text)+'", totalitens = "'+editqtditens.Text+'" ,' ) ;


  Sql.Add('localentrega = "'+varentrega+'", situacao = "ABERTA", vendedor = "'+editvendedor.Text+'"    where codvenda = "'+editcodvenda.Text+'" ') ;
  ExecSql;

  end;

   With dm.sqldadosvendas do
  Begin
  Close;
  Sql.Clear;
    Sql.Add('select * from dadosvendas    where codvenda = "'+editcodvenda.Text+'" ') ;
  open;

  end;




  end;

procedure Tfrmprivendas.baixaestoque;
var
 marca,marca2:  TBookmarklist ;
begin
//marca:= dm.sqlprodutos.GetBookmark;
//marca2:= dm.sqlitens.GetBookmark;
  try
 // dm.sqlprodutos.DisableControls;
 // dm.sqlitens.DisableControls;

//Gauge1.Visible:= true;
//Gauge1.Progress:=0;
//Gauge1.MaxValue:= dm.sqlitens.RecordCount;

          dm.sqlitens.First;
While not dm.sqlitens.Eof do
  Begin
  With dm.sqlprodutos do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update produtos set estoque = estoque - "'+TrocaVirgPPto(dm.sqlitensQtd.AsString)+'" ' ) ;


  Sql.Add('   where codprod = "'+dm.sqlitensCodprod.AsString+'" ') ;
  ExecSql;

  end;

 //   Gauge1.Progress:=Gauge1.Progress+1;
    dm.sqlitens.Next;
   End;
  finally
 //Gauge1.Visible:= false;

// dm.sqlprodutos.GotoBookmark(marca);
// dm.sqlitens.GotoBookmark(marca2);

 //dm.sqlitens.EnableControls;
 //dm.sqlprodutos.EnableControls;

// dm.sqlprodutos.FreeBookmark(marca);
// dm.sqlitens.FreeBookmark(marca2);
 end;
    // dm.tbldadositens.edit;
     //dm.tbldadositensFechado.AsString:= 'S';
     //dm.tbldadositens.Post;




   // frmvendas.FormRefresh(self);

     End;




procedure  Tfrmprivendas.total;
 begin
 if CheckBox1.Checked = true then
 begin
 With dm.sqltotaldesconto do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT sum( desconto * qtd ) totaldesconto  FROM itensvendas where codvenda = "' + editcodvenda.text +'" ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;


  labeldesconto.Caption:= floattostrf(dm.sqltotaldescontototaldesconto.AsCurrency,ffFixed,18,2);

  With dm.sqlitenssoma do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT sum( qtd*preco ) somatotal  FROM itensvendas where codvenda = "' + editcodvenda.text +'" ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;

 // ultimo := ultimo + sqlmaximomaximoreg.AsInteger+1;

 labeltotal.Caption := floattostrf(dm.sqlitenssomasomatotal.AsCurrency,ffFixed,18,2) ;


  With dm.sqlitenssoma do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT sum( (qtd*preco) - (desconto*qtd) ) somatotal  FROM itensvendas where codvenda = "' + editcodvenda.text +'" ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;

 // ultimo := ultimo + sqlmaximomaximoreg.AsInteger+1;

 edittotal.text := dm.sqlitenssomasomatotal.AsString;
  label3.Caption:= floattostrf(dm.sqlitenssomasomatotal.AsCurrency,ffFixed,18,2);

  With dm.sqlitensitens do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT count( registro ) somaitens  FROM itensvendas where codvenda = "' + editcodvenda.text +'" ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;
 editqtditens.Text:= dm.sqlitensitenssomaitens.asstring;

 label6.Caption:= dm.sqlitensitenssomaitens.asstring;

end else begin
///////  segunda opcao


  With dm.sqlitenssoma do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT sum( qtd*preco ) somatotal  FROM itensvendas where codvenda = "' + editcodvenda.text +'" ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;

 // ultimo := ultimo + sqlmaximomaximoreg.AsInteger+1;

 labeltotal.Caption := floattostrf(dm.sqlitenssomasomatotal.AsCurrency,ffFixed,18,2) ;


  With dm.sqlitenssoma do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT sum( (qtd*preco)  ) somatotal  FROM itensvendas where codvenda = "' + editcodvenda.text +'" ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;

 // ultimo := ultimo + sqlmaximomaximoreg.AsInteger+1;

 edittotal.text := dm.sqlitenssomasomatotal.AsString;
  label3.Caption:= floattostrf(dm.sqlitenssomasomatotal.AsCurrency,ffFixed,18,2);

  With dm.sqlitensitens do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT count( registro ) somaitens  FROM itensvendas where codvenda = "' + editcodvenda.text +'" ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;
 editqtditens.Text:= dm.sqlitensitenssomaitens.asstring;

 label6.Caption:= dm.sqlitensitenssomaitens.asstring;



end;

end;



procedure  Tfrmprivendas.cancelarnota;
begin
with dm.sqldadosvendas do
     begin
     Close;
     SQL.Clear;
     SQL.Add('DELETE FROM dadosvendas where codvenda = "' + editcodvenda.Text + '" ');
     ExecSQL;

end;


with dm.sqlitens do
     begin
     Close;
     SQL.Clear;
     SQL.Add('DELETE FROM itensvendas where codvenda = "' + editcodvenda.Text + '" ');
     ExecSQL;

end;



end;

procedure  Tfrmprivendas.ultimavenda;
 begin
  With dm.sqlultimavenda do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT MAX( codvenda + 1  ) ultimavenda  FROM dadosvendas  ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;
  if (dm.sqlultimavendaultimavenda.AsString = '' )  then
  begin
  ultimo:= 1;
  end else begin
  ultimo:= 0;
  ultimo:= dm.sqlultimavendaultimavenda.AsInteger;
  end;

 editcodvenda.text := inttostr(ultimo);
 labelnota.caption:= inttostr(ultimo);
// edittitulo.text := dm.sqlultimousuultimamatricula.AsString;
end;


procedure Tfrmprivendas.inserirdadosvendas;
begin

  With dm.sqldadosvendas do
  Begin
   ultimavenda;
  Close;
  Sql.Clear;
  Sql.Add('Insert Into dadosvendas (codvenda, data, horas ) ' ) ;


   Sql.Add(' values ( "' + inttostr(ultimo)+ '", "' + editdata.Text+ '","' + timetostr(time)+ '" ');
   Sql.Add('  )');


  ExecSql;
   // End
 // Except

    End;


  abrir;
  //ultimamatricula;



end;




procedure Tfrmprivendas.abrir;
begin
  With dm.sqlitens do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from itensvendas  where codvenda = "' + editcodvenda.text +'"  order by registro asc ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;
  dm.sqlitens.Last;

  total;
end;




procedure Tfrmprivendas.inseriritens;
begin
if checkperguntarqtd.Checked then begin
 editquantidade.Text:=InputBox('Aten��o', 'Digite a Quantidade', '1');
 //editpre.Text:=InputBox('Aten��o', 'Digite a Quantidade', '1');
 end else begin
 editquantidade.Text:='1';
 end;

 
  With dm.sqlitens do
  Begin
  // ultimamatricula;
  Close;
  Sql.Clear;
  Sql.Add('Insert Into itensvendas (codvenda,descricao,univenda,  ' ) ;
  Sql.Add('  qtd,    ') ;
    Sql.Add(' preco, codprod,desconto ) ');

   Sql.Add(' values ( "' + editcodvenda.Text+ '"  , "' + dm.sqlprodutosDescricao.AsString + '" , ');
   Sql.Add('  "' + dm.sqlprodutosUnivenda.AsString +'", "' + TrocaVirgPPto(editquantidade.text)+ '" ,');
   Sql.Add('   "' + TrocaVirgPPto(dm.sqlprodutosPrecovenda.AsString)+ '","' + dm.sqlprodutosCodProd.AsString+ '","' + TrocaVirgPPto(dm.sqlprodutosDesconto.AsString)+ '"   )  ');


  ExecSql;
   // End
 // Except





  End;







  abrir;
  //ultimamatricula;



end;


procedure Tfrmprivendas.Confirmar1Click(Sender: TObject);
begin
if editbarra.Visible = true then
begin
if dm.sqlitens.RecordCount > 0 then
begin
if editqtditens.Text = '0' then
begin
ShowMessage('Voce Nao pode finalizar a nota, pq nao tem itens');
end else begin
if editcodvenda.Text <> '' then
begin
Application.CreateForm(Tfrmfecharvendas, frmfecharvendas);
frmfecharvendas.ShowModal;

  
end;
    end;
    end;
end;
end;


procedure Tfrmprivendas.ExcluirItem1Click(Sender: TObject);
var reg: string;
begin
if editbarra.Visible = true then
begin
if dm.sqlitens.RecordCount > 0 then
begin
if  application.messagebox('Deseja Excluir Este Item?',
   'Confirma��o' , mb_yesno + mb_iconquestion) = mrYes then
   begin
   reg:=dm.sqlitensRegistro.AsString;
with dm.sqlitens do
     begin
     Close;
     SQL.Clear;
     SQL.Add('DELETE FROM itensvendas where registro = "' + reg + '" ');
     ExecSQL;

end;

abrir;
total;
end;
end;
end;

end;

procedure Tfrmprivendas.ExcluirTodososItens1Click(Sender: TObject);
begin
if editbarra.Visible = true then
begin
if dm.sqlitens.RecordCount > 0 then
begin
if editcodvenda.Text <> '' then
begin
if  application.messagebox('Deseja excluir esta nota?',
   'Confirma��o' , mb_yesno + mb_iconquestion) = mrYes then
   begin

   cancelarnota;
   inserirdadosvendas;
   total;

end;
end;
end;
end;
end;
procedure Tfrmprivendas.editbarraKeyPress(Sender: TObject; var Key: Char);
var varbarra : string;
begin

varbarra:= StringReplace(editbarra.text, 'F', EmptyStr, [rfReplaceAll])  ;
varbarra:= StringReplace(varbarra, '#', EmptyStr, [rfReplaceAll]) ;
if key = #13 then
begin
with  dm.sqlprodutos do
     begin
     Close;
     SQL.Clear;
     SQL.Add('Select * from produtos where barra = "' + varbarra +'"  ');
    // params[0].AsString := editresponsavel.text;
     open;
     end;

if (dm.sqlprodutos.RecordCount > 0) and (editbarra.text <> '') then
begin

 if (dm.sqlitensitenssomaitens.Value >= 500) then
begin
 ShowMessage('Retire outra nota s� pode colocar 25 itens por nota devido a impressao' );
end
else begin

inseriritens;
total;
//dm.tblitensQtd.FocusControl;
editquantidade.Text:='1';
editbarra.Text:='';
editbarra.SetFocus;
 end;
 end else begin
 if editbarra.text <> '' then
 begin
 if (dm.sqlitensitenssomaitens.Value >= 500) then
begin
 ShowMessage('Retire outra nota s� pode colocar 25 itens por nota devido a impressao' );
end
else begin
// ShowMessage('Produto n�o Cadastrado!');
// Application.CreateForm(Tfrmnaocadastrado, frmnaocadastrado);
//frmnaocadastrado.ShowModal;


Application.CreateForm(tfrmescprodutovendas,frmescprodutovendas);
frmescprodutovendas.showmodal;

 editbarra.Text:='';
editbarra.SetFocus;
 end;
end;
    end;
    end;


    end;


procedure Tfrmprivendas.Image6Click(Sender: TObject);
begin
WinExec('calc',0);
end;

procedure Tfrmprivendas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure Tfrmprivendas.editquantidadeKeyPress(Sender: TObject; var Key: Char);
begin
if Not (key in ['0'..'9',#8, ',' ]) then
key := #0;
end;

procedure Tfrmprivendas.FormCreate(Sender: TObject);
var
A, M, D: Word;
vardata: TDate;
begin
base.Caption:='11';
 btnpreco1.Enabled:= false;
//Image1.Picture.LoadFromFile('empresa.bmp');


DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);


DecodeDate(Date, A, M, D);
//ShowMessage(Format('Dia %.2d do m�s %.2d de %d.', [D, M, A]));



editdata.text:= Format('%.2d/%.2d/%d', [A, M ,D ]);


//vardata:= strtodate(Format('%.2d/%.2d/%d', [M, D        , A]));
//editvencimento.Text:= datetostr(vardata);
//datetostr(vardata+30);
end;

procedure Tfrmprivendas.editsenhaKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin


With dm.sqlvendedor do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from vendedor  where senha = "' +editsenha.text +'"  ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;

if (editsenha.Text = dm.sqlvendedorSenha.AsString) and (editsenha.Text <> '') then
begin
abrirbanco;

 inserirdadosvendas;
 //Button1.Enabled:=false;
 editbarra.Visible:= true;
//editquantidade.Visible:= true;
//Label12.Visible:=true;
Label13.Visible:=true;
DBGrid11.Visible:=true;

//GroupBox1.Visible:=true;
//Button1.Visible:=false;
editsenha.Visible:=false;
Label12.Visible:= false;
editbarra.SetFocus;
editvendedor.text:= dm.sqlvendedorVendedor.AsString;
Label1.Visible := true;
labelnota.Visible := true;
//SpeedButton1.Visible:= true;
//SpeedButton2.Visible:= true;
end else begin
ShowMessage('Senha Nao Confere');
end;

end;
 end;



procedure Tfrmprivendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
  vk_Escape: close;
end;
end;

procedure Tfrmprivendas.ImprimirOramento1Click(Sender: TObject);
begin

if dm.sqlitensCodVenda.Value > 0 then
begin
if  application.messagebox('Deseja Imprimir Or�amento?',
   'Confirma��o' , mb_yesno + mb_iconquestion) = mrYes then
   begin
 alteradadosvendas;
Application.CreateForm(Tfrmimprimirvendas2,frmimprimirvendas2);
frmimprimirvendas2.QuickRep1.print;
end;
end;
end;

procedure Tfrmprivendas.CheckBox1Click(Sender: TObject);
begin
total;
end;

procedure Tfrmprivendas.FormPaint(Sender: TObject);
var
  altura, coluna: Word;
  i,j: integer;
begin
  //for i:= 0 to Round(Width/Image1.Width) do
//for j := 0 to Round(Height/Image1.Height) do
//Canvas.Draw(i*Image1.Width,j*Image1.Height,Image1.Picture.Graphic);

 altura := (ClientHeight + 255) div 256;
  for coluna := 0 to 255 do
   with Canvas do
    begin
     Brush.Color := RGB(coluna, 180, 5); { Modifique para obter cores diferentes }
      FillRect(Rect(0, coluna * altura, ClientWidth, (coluna + 1) * altura)) ;
    end;

end;

procedure Tfrmprivendas.FormResize(Sender: TObject);
begin
Invalidate;
end;

procedure Tfrmprivendas.PesquisarProduto1Click(Sender: TObject);
begin

if editbarra.Visible = true then
begin
Application.CreateForm(tfrmescprodutovendas,frmescprodutovendas);
frmescprodutovendas.showmodal;
end;
end;

procedure Tfrmprivendas.MudarQtd1Click(Sender: TObject);
var qtdalterar, coditens :string;
begin
qtdalterar:= InputBox('Aten��o', 'Digite a quantidade.', '1');
 coditens :=  dm.sqlitensregistro.AsString;
 With dm.sqlitens do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update itensvendas set qtd =  "'+TrocaVirgPPto(qtdalterar)+'" ' ) ;


  Sql.Add('  where registro = "'+coditens+'" ') ;
  ExecSql;
end;
abrir;
 end;
procedure Tfrmprivendas.SpeedButton1Click(Sender: TObject);
begin
Application.CreateForm(Tfrmlocacao, frmlocacao);
frmlocacao.ShowModal;
end;

procedure Tfrmprivendas.ConfigurarBanco1Click(Sender: TObject);
begin
if editbarra.Visible = true then
begin
// Application.CreateForm(Tfrmpgtodecontavendas,  frmpgtodecontavendas);
//frmpgtodecontavendas.ShowModal;
end else begin

ShowMessage('Entre com senha primeiramente');
end;
 end;
procedure Tfrmprivendas.SpeedButton2Click(Sender: TObject);
begin
Application.CreateForm(Tfrmdevolucao, frmdevolucao);
frmdevolucao.ShowModal;
end;

procedure Tfrmprivendas.Inserir1Click(Sender: TObject);
begin
if editbarra.Visible = true then
begin
 Application.CreateForm(Tfrmtroca, frmtroca);
frmtroca.ShowModal;
end else begin

ShowMessage('Entre com senha primeiramente');
end;
end;

procedure Tfrmprivendas.btnpreco1Click(Sender: TObject);
begin
btnpreco1.Enabled:= false;
btnpreco2.Enabled:= true;
btnpreco3.Enabled:= true;
base.Caption:='11';
 With dm.sqlitens do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update itensvendas set preco = (select precovenda from produtos where codprod = itensvendas.codprod )   ' ) ;


  Sql.Add('   where codvenda = "'+ editcodvenda.Text +'" ') ;
  ExecSql;

  end;
  abrir;
end;

procedure Tfrmprivendas.btnpreco2Click(Sender: TObject);
begin
btnpreco1.Enabled:= true;
btnpreco2.Enabled:= false;
btnpreco3.Enabled:= true;

base.Caption:='12';
 With dm.sqlitens do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update itensvendas set preco = (select preco2 from produtos where codprod = itensvendas.codprod )   ' ) ;


  Sql.Add('   where codvenda = "'+ editcodvenda.Text +'" ') ;
  ExecSql;

  end;
  abrir;
end;

procedure Tfrmprivendas.btnpreco3Click(Sender: TObject);
begin
btnpreco1.Enabled:= true;
btnpreco2.Enabled:= true;
btnpreco3.Enabled:= false;
base.Caption:='13';
 With dm.sqlitens do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update itensvendas set preco = (select preco3 from produtos where codprod = itensvendas.codprod )   ' ) ;


  Sql.Add('   where codvenda = "'+ editcodvenda.Text +'" ') ;
  ExecSql;

  end;
  abrir;
end;

end.
