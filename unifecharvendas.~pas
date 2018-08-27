unit unifecharvendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  Tfrmfecharvendas = class(TForm)
    BitBtn1: TBitBtn;
    editcodvenda: TEdit;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    editcodcli: TEdit;
    editcliente: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    edittotal: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    editdesconto: TEdit;
    editsubtotal: TEdit;
    Label5: TLabel;
    editlocalentrega: TEdit;
    Label6: TLabel;
    GroupBox3: TGroupBox;
    editvalorpago: TEdit;
    Label7: TLabel;
    edittroco: TEdit;
    Label8: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure editdescontoExit(Sender: TObject);
    procedure editdescontoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editvalorpagoExit(Sender: TObject);
    procedure editvalorpagoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure alteradadosvendas2;
    procedure formapgtochecked;
    procedure baixaestoque;
    procedure clientedebito;
  end;

var
  frmfecharvendas: Tfrmfecharvendas;
  formapgto: string;

implementation

uses uniimprimirvendas, univendass, unidmvendas, uniescclientevendas,
  uniimprimirvendas2;

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

procedure Tfrmfecharvendas.baixaestoque;
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

procedure Tfrmfecharvendas.clientedebito;
begin
if editcodcli.Text <> '' then begin
  With dm.sqlclientes do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update clientes set saldo = saldo - "'+TrocaVirgPPto( edittotal.Text)+'"   ' ) ;
// Sql.Add('Update clientes set saldo = saldo + 100  ' ) ;


  Sql.Add('   where codcli = "'+editcodcli.Text+'" ') ;
  ExecSql;

  end;
  end;   end;


procedure Tfrmfecharvendas.formapgtochecked;
begin
if RadioButton1.Checked then begin
formapgto :=  RadioButton1.HINT;
editcodcli.Text:='0';
editcliente.Text:='';
end else begin
if RadioButton2.Checked then begin
formapgto :=  RadioButton2.HINT;
editcodcli.Text:='0';
editcliente.Text:='';
end else begin
if RadioButton3.Checked then begin
formapgto :=  RadioButton3.HINT;
editcodcli.Text:='0';
editcliente.Text:='';
end else begin
if RadioButton4.Checked then begin
formapgto :=  RadioButton4.HINT;
end;
end;
end;
end;





end;

procedure Tfrmfecharvendas.alteradadosvendas2;
var varentrega : string;
begin

 formapgtochecked;


//varentrega:= InputBox('Atenção', 'Digite o local de entrega caso seja necessário e o Nome.', UpperCase( ''));
 With dm.sqldadosvendas do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update dadosvendas set total =  "'+TrocaVirgPPto(edittotal.Text)+'", totalitens = "'+frmprivendas.editqtditens.Text+'" , desconto =  "'+TrocaVirgPPto(editdesconto.Text)+'", subtotal =  "'+TrocaVirgPPto(editsubtotal.Text)+'", ' ) ;


  Sql.Add('localentrega = "'+editlocalentrega.Text+'", situacao = "FECHADO", vendedor = "'+frmprivendas.editvendedor.Text+'", codcli ="'+editcodcli.text+'", cliente = "'+editcliente.text+'", formapgto = "'+formapgto+'"    where codvenda = "'+editcodvenda.Text+'" ') ;
  ExecSql;

  end;


  end;


procedure Tfrmfecharvendas.BitBtn1Click(Sender: TObject);
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

  //   baixaestoque;
   alteradadosvendas2;
   frmprivendas.abrirprint;


   Application.CreateForm(Tfrmimprimirvendas,frmimprimirvendas);
 //   frmimprimirvendas.QuickRep1.PrinterSettings.Copies:=2;
   frmimprimirvendas.QuickRep1.print;
   frmimprimirvendas.QuickRep1.print;


   clientedebito;
   baixaestoque;
  

   frmprivendas.inserirdadosvendas;
   frmprivendas.total;
   frmprivendas.btnpreco1Click(frmprivendas);
   close;
   end else begin
   //   baixaestoque;
   alteradadosvendas2;

   baixaestoque;
   clientedebito;

   frmprivendas.inserirdadosvendas;
   frmprivendas.total;
      frmprivendas.btnpreco1Click(frmprivendas);
   close;
   end;
end;
    end;

     end;
procedure Tfrmfecharvendas.FormCreate(Sender: TObject);
begin

DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);


edittotal.Text := frmprivendas.Label3.Caption;
editcodvenda.Text:= frmprivendas.labelnota.Caption;
editsubtotal.Text := frmprivendas.Label3.Caption;
end;

procedure Tfrmfecharvendas.RadioButton4Click(Sender: TObject);
begin
Application.CreateForm(Tfrmescclientes, frmescclientes);
frmescclientes.ShowModal;
end;

procedure Tfrmfecharvendas.editdescontoExit(Sender: TObject);
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


procedure Tfrmfecharvendas.editdescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
if Not (key in ['0'..'9',#8, ',' ]) then
key := #0;
end;

procedure Tfrmfecharvendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
  vk_Escape: close;
end;
end;

procedure Tfrmfecharvendas.editvalorpagoExit(Sender: TObject);
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

procedure Tfrmfecharvendas.editvalorpagoKeyPress(Sender: TObject;
  var Key: Char);
begin
if Not (key in ['0'..'9',#8, ',' ]) then
key := #0;
end;
 

end.
