unit unifechalocacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  Tfrmfecharlocacao = class(TForm)
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    editvalorpago: TEdit;
    edittroco: TEdit;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edittotal: TEdit;
    editdesconto: TEdit;
    editsubtotal: TEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    rbadiantado: TRadioButton;
    rbdevolucao: TRadioButton;
    editcodcli: TEdit;
    editcliente: TEdit;
    editcodvenda: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure editvalorpagoExit(Sender: TObject);
    procedure editvalorpagoKeyPress(Sender: TObject; var Key: Char);
    procedure editdescontoKeyPress(Sender: TObject; var Key: Char);
    procedure editdescontoExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure formapgtochecked;
    procedure alteradadoslocacao;
    procedure clientedebito;
    procedure baixaestoque;
    procedure abrirprint;
  end;

var
  frmfecharlocacao: Tfrmfecharlocacao;
    formapgto: string;

implementation

uses univendass, uniimprimirvendas2, unidmvendas, unilocacao,
  unilocacaoimprimir;

{$R *.dfm}


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


procedure Tfrmfecharlocacao.baixaestoque;
//var
// marca,marca2:  TBookmarklist ;
begin
//marca:= dm.sqlprodutos.GetBookmark;
//marca2:= dm.sqlitens.GetBookmark;
  try
 // dm.sqlprodutos.DisableControls;
 // dm.sqlitens.DisableControls;

//Gauge1.Visible:= true;
//Gauge1.Progress:=0;
//Gauge1.MaxValue:= dm.sqlitens.RecordCount;
    //  frmpri.abrir;
          dm.sqlitenslocacao.First;
While not dm.sqlitenslocacao.Eof do
  Begin
  With dm.sqlprodutos do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update produtos set locado = "SIM" ') ;


  Sql.Add('   where codprod = "'+dm.sqlitenslocacaocodprod.AsString+'" ') ;
  ExecSql;

  end;

 //   Gauge1.Progress:=Gauge1.Progress+1;
    dm.sqlitenslocacao.Next;
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

procedure Tfrmfecharlocacao.clientedebito;
begin
if editcodcli.Text <> '' then Begin

  if rbdevolucao.Checked then
begin
  With dm.sqlclientes do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update clientes set debitolocacao = debitolocacao + "'+TrocaVirgPPto( editsubtotal.Text)+'"   ' ) ;
// Sql.Add('Update clientes set saldo = saldo + 100  ' ) ;


  Sql.Add('   where codcli = "'+editcodcli.Text+'" ') ;
  ExecSql;

  end;



  end;


  end;
    end;



procedure Tfrmfecharlocacao.alteradadoslocacao;
var varentrega : string;
begin

 formapgtochecked;


//varentrega:= InputBox('Atenção', 'Digite o local de entrega caso seja necessário e o Nome.', UpperCase( ''));
 With dm.sqldadoslocacao do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update dadoslocacao set total =  "'+TrocaVirgPPto(edittotal.Text)+'", totalitens = "'+frmlocacao.editqtditens.Text+'" , desconto =  "'+TrocaVirgPPto(editdesconto.Text)+'", subtotal =  "'+TrocaVirgPPto(editsubtotal.Text)+'", ' ) ;


  Sql.Add(' situacao = "FECHADO", vendedor = "'+frmprivendas.editvendedor.Text+'", codcli ="'+editcodcli.text+'", cliente = "'+editcliente.text+'", formapgto = "'+formapgto+'"    where codvenda = "'+editcodvenda.Text+'" ') ;
  ExecSql;

  end;
  end;




procedure Tfrmfecharlocacao.abrirprint;
var codvendas :string;
begin
codvendas := frmlocacao.labelnota.Caption;


     ///abrir dados vendas
  With dm.sqldadoslocacaoprint do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from dadoslocacao  where codvenda = "' + codvendas +'"   ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;


  ///abrir itens vendas
  With dm.sqlitenslocacaoprint do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from itenslocacao  where codvenda = "' + codvendas +'"  ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;

end;

procedure Tfrmfecharlocacao.formapgtochecked;
begin
if rbadiantado.Checked then begin
formapgto :=  rbadiantado.HINT;
//editcodcli.Text:='0';
//editcliente.Text:='';
end else begin
if rbdevolucao.Checked then begin
formapgto :=  rbdevolucao.HINT;
//editcodcli.Text:='0';
//editcliente.Text:='';

end;
end;
end;




procedure Tfrmfecharlocacao.BitBtn1Click(Sender: TObject);
begin
formapgtochecked;
if  formapgto = '' then begin
ShowMessage('Escolha uma forma de pagamento');
end else begin

if  application.messagebox('Deseja finalizar a nota?',
 'Confirmação' , mb_yesno + mb_iconquestion) = mrYes then
  begin
if  application.messagebox('Deseja Imprimir ?',
   'Confirmação' , mb_yesno + mb_iconquestion) = mrYes then
   begin


   alteradadoslocacao;
  abrirprint;


   Application.CreateForm(Tfrmlocacaoimprimir,frmlocacaoimprimir);
   frmlocacaoimprimir.QuickRep1.print;


   clientedebito;
  baixaestoque;
  

   frmlocacao.inserirdadoslocacao;
   frmlocacao.total;
   close;
   end else begin
   //   baixaestoque;
   alteradadoslocacao;

   baixaestoque;
   clientedebito;

   frmlocacao.inserirdadoslocacao;
   frmlocacao.total;
   close;
   end;
end;
    end;

     end;


procedure Tfrmfecharlocacao.FormCreate(Sender: TObject);
begin
DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

editcodcli.Text := frmlocacao.editcodcli.text;
editcliente.Text := frmlocacao.editcliente.text;

edittotal.Text := frmlocacao.labeltotal.Caption;
editcodvenda.Text:= frmlocacao.labelnota.Caption;
editsubtotal.Text := frmlocacao.labeltotal.Caption;
end;

procedure Tfrmfecharlocacao.editvalorpagoExit(Sender: TObject);
var valorpago, subtotal : double;
begin

if editvalorpago.Text = '' then
begin
editvalorpago.Text:= editsubtotal.Text;
end;

 subtotal:= strtofloat(editsubtotal.Text);
valorpago:= strtofloat(editvalorpago.Text);

subtotal := valorpago - subtotal;
edittroco.Text:= floattostrf(subtotal,ffFixed,18,2);
// label3.Caption:= floattostrf(dm.sqlitenssomasomatotal.AsCurrency,ffFixed,18,2);



end;

procedure Tfrmfecharlocacao.editvalorpagoKeyPress(Sender: TObject;
  var Key: Char);
begin
if Not (key in ['0'..'9',#8, ',' ]) then
key := #0;
end;

procedure Tfrmfecharlocacao.editdescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
if Not (key in ['0'..'9',#8, ',' ]) then
key := #0;
end;

procedure Tfrmfecharlocacao.editdescontoExit(Sender: TObject);
var totaldesconto, total, subtotal, desconto : double;
begin

if editdesconto.Text = '' then
begin
editdesconto.Text:= '0';
end;

total:= strtofloat(edittotal.Text);
desconto:= strtofloat(editdesconto.Text);

subtotal := total - desconto;
editsubtotal.Text:= floattostrf(subtotal,ffFixed,18,2);
// label3.Caption:= floattostrf(dm.sqlitenssomasomatotal.AsCurrency,ffFixed,18,2);


end;

procedure Tfrmfecharlocacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
  vk_Escape: close;
end;
end;

end.
