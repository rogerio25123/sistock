unit unipgtodecontavendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ComCtrls, Mask, DBCtrls;

type
  Tfrmpgtodecontavendas = class(TForm)
    Label6: TLabel;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    StatusBar1: TStatusBar;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    BitBtn1: TBitBtn;
    btncliente: TBitBtn;
    editvalorpago: TEdit;
    editformapgto: TEdit;
    editcodcli: TEdit;
    editcliente: TEdit;
    Button1: TButton;
    Button2: TButton;
    BitBtn2: TBitBtn;
    editdata: TEdit;
    editstatus: TEdit;
    BitBtn3: TBitBtn;
    editcodpgto: TEdit;
    DBEdit1: TDBEdit;
    editsaldocli: TEdit;
    BitBtn4: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    lbtotaltaxa: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edittaxaatrazo: TEdit;
    BitBtn5: TBitBtn;
    editqtddias: TEdit;
    editsaldoeatrazo: TEdit;
    editcodvenda: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnclienteClick(Sender: TObject);
    procedure editvalorpagoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editstatusKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure  ultimopgto;
    procedure abrir;
    procedure zerarconta;
    procedure inserirpgtovendas;
    procedure ultimavendavenda;
    procedure baixaclientevendas;
    procedure abrircliente;
  end;

var
  frmpgtodecontavendas: Tfrmpgtodecontavendas;
  ultimo : integer;
   saldoanterior : double;

implementation
uses    unipgtoveritens    , unirelpgtoconta, unidmvendas,
  unipgtoclientesvendas, uniimprimirpgtoconta, unicontaspagasvendas,
  univendass;

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


procedure Tfrmpgtodecontavendas.abrircliente;
begin
     With dm.sqlclientes do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from clientes  where codcli = "' + editcodcli.text +'"  ');
   open;

  End;

  end;

procedure  Tfrmpgtodecontavendas.ultimavendavenda;
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
// labelnota.caption:= inttostr(ultimo);
// edittitulo.text := dm.sqlultimousuultimamatricula.AsString;
end;



procedure Tfrmpgtodecontavendas.inserirpgtovendas;
var
A, M, D: Word;
vardata: TDate;
datahoje, tipopagamento: string;
begin
DecodeDate(Date, A, M, D);
//ShowMessage(Format('Dia %.2d do mês %.2d de %d.', [D, M, A]));

datahoje:= Format('%.2d/%.2d/%d', [A, M ,D ]);

  With dm.sqldadosentrada do
  Begin
   ultimopgto;
  Close;
  Sql.Clear;
  Sql.Add('Insert Into pgtodecliente (codpgto, data, codcli,cliente,total,status, formapgto, vendedor ) ' ) ;


   Sql.Add(' values ( "' + inttostr(ultimo)+ '", "' + datahoje+ '","' +editcodcli.text+ '","' +editcliente.text+ '", ');
   Sql.Add('  "' +TrocaVirgPPto( editvalorpago.text)+ '","' +editstatus.text+ '" ,"' +editformapgto.text+ '" ,"' +dm.sqlvendedorvendedor.AsString+ '")');


  ExecSql;
   // End
 // Except

    End;

     With dm.sqlpgtodecliente do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from pgtodecliente  where codcli = "' + editcodcli.text +'"   order by codpgto asc');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;



  //////entrada em caixa
  if(editstatus.Text = 'C')then begin
  tipopagamento := 'PGTOCLIENTE-'+editformapgto.Text;
   With dm.sqldadosvendas do
  Begin
   ultimavendavenda;
  Close;
  Sql.Clear;
  Sql.Add('Insert Into dadosvendas (codvenda, data, horas,codcli,cliente,total,subtotal,formapgto,vendedor,situacao ) ' ) ;


   Sql.Add(' values ( "' + inttostr(ultimo)+ '", "' + datahoje+ '","' + timetostr(time)+ '", "' + editcodcli.Text+ '" , "' + editcliente.Text+ '", "' + editvalorpago.Text+ '", "' + editvalorpago.Text+ '", "'+tipopagamento+'" , "' + frmprivendas.editvendedor.Text+ '", "FECHADO"   ');
   Sql.Add('  )');


  ExecSql;
   // End
 // Except

    End;
    end;



    end;



procedure Tfrmpgtodecontavendas.zerarconta;
begin
if (dm.sqlclientessaldo.Value >= 0) then

 begin
  With dm.sqlpgtodecliente do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update pgtodecliente set codcli2 =  codcli , codcli = null  ' ) ;


  Sql.Add('    where codcli = "'+editcodcli.Text+'" ') ;
  ExecSql;

  end;

    With dm.sqldadosvendas do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update dadosvendas set codcli2 =  codcli , codcli = null  ' ) ;


  Sql.Add('    where codcli = "'+editcodcli.Text+'" ') ;
  ExecSql;

  end;
  end;
  end;

  

procedure Tfrmpgtodecontavendas.abrir;
begin
  With dm.sqlpgtodecliente do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from pgtodecliente  where codcli = "' + editcodcli.text +'"   order by codpgto asc');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;

   With dm.sqldadosvendas do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from dadosvendas  where codcli = "' + editcodcli.text +'" and formapgto ="A PRAZO" ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;

   With dm.sqlformapgto do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from formapgto  where prazo = "N"  ');
   open;

  End;

   With dm.sqlclientes do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from clientes  where codcli = "' + editcodcli.text +'"  ');
   open;

  End;


end;


procedure  Tfrmpgtodecontavendas.ultimopgto;
 begin
  With dm.sqlultimopgto do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT MAX( codpgto + 1  ) ultimopgto  FROM pgtodecliente ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;
   if (dm.sqlultimopgtoultimopgto.AsString = '' )  then
  begin
  ultimo:= 1;
  end else begin
  ultimo:= 0;
  ultimo:= dm.sqlultimopgtoultimopgto.AsInteger;
  end;

 editcodpgto.text := inttostr(ultimo);
 //labelnota.caption:= inttostr(ultimo);
// edittitulo.text := dm.sqlultimousuultimamatricula.AsString;
end;



procedure Tfrmpgtodecontavendas.baixaclientevendas;  ///credito cliente
begin

if editstatus.Text = 'C' then begin
    With dm.sqlclientes do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update clientes set saldo =  saldo + "'+TrocaVirgPPto(editvalorpago.Text)+'" ' ) ;


  Sql.Add('    where codcli = "'+editcodcli.Text+'" ') ;
  ExecSql;

  end;

 // editformapgto.text:= '';

//editcliente.text:= '';
 //editvalorpago.text:= '';



  // abrir;

    abrircliente;

 // editcodcli.text:= '';
 end else begin
  With dm.sqlclientes do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update clientes set saldo =  saldo - "'+TrocaVirgPPto(editvalorpago.Text)+'" ' ) ;


  Sql.Add('    where codcli = "'+editcodcli.Text+'" ') ;
  ExecSql;

  end;

 // editformapgto.text:= '';

//  editcliente.text:= '';
//  editvalorpago.text:= '';
    

 //  abrir;
        abrircliente;    
 end;


 

//  editcodcli.text:= '';

end;



procedure Tfrmpgtodecontavendas.Button1Click(Sender: TObject);
begin
dm.sqlformapgto.Prior;
editformapgto.Text:= dm.sqlformapgtoFormaPgto.asstring;
if dm.sqlformapgtoPrazo.AsString = 'S' then
begin
btncliente.Enabled:=false;
editcodcli.Text:='';
editcliente.Text:= '';
editcliente.Enabled:=false;
end else begin
btncliente.Enabled:= true;
editcliente.Enabled:=true;
end;

end;

procedure Tfrmpgtodecontavendas.Button2Click(Sender: TObject);
begin
dm.sqlformapgto.next;
editformapgto.Text:= dm.sqlformapgtoFormaPgto.asstring;

if dm.sqlformapgtoPrazo.AsString = 'S' then
begin
btncliente.Enabled:=false;
editcodcli.Text:='';
editcliente.Text:= '' ;
editcliente.Enabled:=false;
end else begin
btncliente.Enabled:= true;
editcliente.Enabled:=true;
end;

end;

procedure Tfrmpgtodecontavendas.btnclienteClick(Sender: TObject);
begin
Application.CreateForm(Tfrmpgtoclientesvendas,frmpgtoclientesvendas);
frmpgtoclientesvendas.showmodal;

end;

procedure Tfrmpgtodecontavendas.editvalorpagoKeyPress(Sender: TObject;
  var Key: Char);
begin
if Not (key in ['0'..'9',#8, ',' ]) then
key := #0;
end;

procedure Tfrmpgtodecontavendas.BitBtn1Click(Sender: TObject);
begin
if (editformapgto.Text = '') or (editvalorpago.Text = '') then begin
showmessage('Vc precisa escolher a Forma de pgto ou preencher valor pago.');
end else begin
if  application.messagebox('Deseja Fazer o Pgto?',
   'Confirmação' , mb_yesno + mb_iconquestion) = mrYes then
   begin
 saldoanterior := dm.sqlclientessaldo.Value;

    inserirpgtovendas;
    baixaclientevendas;
   dm.sqlpgtodecliente.Last;

    if  application.messagebox('Deseja Imprimir ?',
   'Confirmação' , mb_yesno + mb_iconquestion) = mrYes then
   begin
      Application.CreateForm(Tfrmimprimirpgtoconta, frmimprimirpgtoconta);
   frmimprimirpgtoconta.QuickRep1.print;
       end;

       zerarconta;
         
             
      abrir;

       editstatus.Text:='C';
   end;



end;

 end;



procedure Tfrmpgtodecontavendas.FormCreate(Sender: TObject);
var
A, M, D: Word;
vardata: TDate;
begin


DecodeDate(Date, A, M, D);
//ShowMessage(Format('Dia %.2d do mês %.2d de %d.', [D, M, A]));



editdata.text:= Format('%.2d/%.2d/%d', [M, D, A]);


//btncliente.Enabled:=false;
ultimopgto;


Application.CreateForm(Tfrmpgtoclientesvendas,frmpgtoclientesvendas);
frmpgtoclientesvendas.showmodal;

end;

procedure Tfrmpgtodecontavendas.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Tfrmpgtodecontavendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
  vk_Escape: close;

end;

end;

procedure Tfrmpgtodecontavendas.editstatusKeyPress(Sender: TObject; var Key: Char);
begin
if Not (key in [#8, 'C','D','c','d' ]) then
key := #0;
end;

procedure Tfrmpgtodecontavendas.DBGrid2DblClick(Sender: TObject);
begin
//Application.CreateForm(Tfrmpgtoveritens,frmpgtoveritens);
//frmpgtoveritens.showmodal;
end;

procedure Tfrmpgtodecontavendas.BitBtn3Click(Sender: TObject);
begin
 Application.CreateForm(Tfrmimprimirpgtoconta, frmimprimirpgtoconta);
   frmimprimirpgtoconta.QuickRep1.preview;
end;

procedure Tfrmpgtodecontavendas.BitBtn4Click(Sender: TObject);
begin
Application.CreateForm(Tfrmcontaspagasvendas, frmcontaspagasvendas);
frmcontaspagasvendas.ShowModal;
end;

end.
