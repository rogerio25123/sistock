unit unifechardevolucao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  Tfrmfechardevolucao = class(TForm)
    BitBtn1: TBitBtn;
    editcodvenda: TEdit;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edittotal: TEdit;
    editdesconto: TEdit;
    editsubtotal: TEdit;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    editvalorpago: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure editdescontoExit(Sender: TObject);
    procedure editvalorpagoExit(Sender: TObject);
    procedure editdescontoKeyPress(Sender: TObject; var Key: Char);
    procedure editvalorpagoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure clientedebito;
    procedure eliminardevolvido;

  end;

var
  frmfechardevolucao: Tfrmfechardevolucao;

implementation

uses unidevolucao, unidmvendas, unidevolucaoimprimir;

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

procedure Tfrmfechardevolucao.eliminardevolvido;
begin
  With dm.sqlitenslocacao do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update itenslocacao set codcli2 = codcli, codcli = null ') ;


  Sql.Add('   where devolvido = "X" and codcli = "'+frmdevolucao.editcodcli.text+'" ') ;
  ExecSql;

  end;
end;

procedure Tfrmfechardevolucao.clientedebito;
begin

  With dm.sqlclientes do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update clientes set debitolocacao = "'+TrocaVirgPPto( editsubtotal.Text)+'"   ' ) ;
  Sql.Add('   where codcli = "'+frmdevolucao.editcodcli.Text+'" ') ;
  ExecSql;

  end;


  With dm.sqlclientes do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update clientes set debitolocacao = debitolocacao - "'+TrocaVirgPPto( editvalorpago.Text)+'"   ' ) ;
// Sql.Add('Update clientes set saldo = saldo + 100  ' ) ;


  Sql.Add('   where codcli = "'+frmdevolucao.editcodcli.Text+'" ') ;
  ExecSql;

  end;
   end;





procedure Tfrmfechardevolucao.FormCreate(Sender: TObject);
begin
edittotal.Text := floattostrf(strtofloat(frmdevolucao.lbtotaapagar.Caption) ,ffFixed,18,2);
editsubtotal.Text := floattostrf(strtofloat(frmdevolucao.lbtotaapagar.Caption) ,ffFixed,18,2);
editvalorpago.Text := floattostrf(strtofloat(frmdevolucao.lbtotaapagar.Caption) ,ffFixed,18,2);
end;

procedure Tfrmfechardevolucao.editdescontoExit(Sender: TObject);
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
editvalorpago.Text:= floattostrf(subtotal,ffFixed,18,2);
// label3.Caption:= floattostrf(dm.sqlitenssomasomatotal.AsCurrency,ffFixed,18,2);


end;

procedure Tfrmfechardevolucao.editvalorpagoExit(Sender: TObject);
var valorpago, subtotal : double;
begin

if editvalorpago.Text = '' then
begin
editvalorpago.Text:= editsubtotal.Text;
end;

 subtotal:= strtofloat(editsubtotal.Text);
valorpago:= strtofloat(editvalorpago.Text);

subtotal := valorpago - subtotal;
//edittroco.Text:= floattostrf(subtotal,ffFixed,18,2);
// label3.Caption:= floattostrf(dm.sqlitenssomasomatotal.AsCurrency,ffFixed,18,2);



end;

procedure Tfrmfechardevolucao.editdescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
if Not (key in ['0'..'9',#8, ',' ]) then
key := #0;
end;

procedure Tfrmfechardevolucao.editvalorpagoKeyPress(Sender: TObject;
  var Key: Char);
begin
if Not (key in ['0'..'9',#8, ',' ]) then
key := #0;
end;

procedure Tfrmfechardevolucao.BitBtn1Click(Sender: TObject);
begin


if  application.messagebox('Deseja finalizar a devolução?',
 'Confirmação' , mb_yesno + mb_iconquestion) = mrYes then
  begin
if  application.messagebox('Deseja Imprimir ?',
   'Confirmação' , mb_yesno + mb_iconquestion) = mrYes then
   begin
  Application.CreateForm(Tfrmdevolucaoimprimir, frmdevolucaoimprimir);
frmdevolucaoimprimir.QuickRep1.print;

clientedebito;
eliminardevolvido;
close;
frmdevolucao.Close;



   end else begin
 clientedebito;
eliminardevolvido;
close;
frmdevolucao.Close;
   end;
end;
    end;


end.
