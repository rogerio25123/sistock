unit unipgtodeconta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ComCtrls, Mask, DBCtrls, Menus;

type
  Tfrmpgtodeconta = class(TForm)
    DBGrid1: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
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
    Label5: TLabel;
    DBGrid2: TDBGrid;
    Label6: TLabel;
    Label7: TLabel;
    StatusBar1: TStatusBar;
    Label9: TLabel;
    BitBtn3: TBitBtn;
    editcodpgto: TEdit;
    DBEdit2: TDBEdit;
    editsaldocli: TEdit;
    BitBtn4: TBitBtn;
    GroupBox1: TGroupBox;
    edittaxaatrazo: TEdit;
    Label1: TLabel;
    lbtotaltaxa: TLabel;
    Label11: TLabel;
    BitBtn5: TBitBtn;
    editqtddias: TEdit;
    PopupMenu1: TPopupMenu;
    ZerarConta1: TMenuItem;
    editsaldoeatrazo: TEdit;
    Label10: TLabel;
    Label12: TLabel;
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
    procedure BitBtn5Click(Sender: TObject);
    procedure ZerarConta1Click(Sender: TObject);
    procedure editsaldoeatrazoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure baixacliente;
    procedure  ultimopgto;
    procedure abrir;
    procedure zerarconta;
    procedure abrircliente;
    procedure inserirpgto;
    procedure calculartaxa;
    procedure zerarcontasempagartudo;
    procedure ultimavenda;
  end;

var
  frmpgtodeconta: Tfrmpgtodeconta;
  ultimo : integer;
 saldoanterior : double;


implementation
uses  unipesqclientes, unipgtoveritens    , unirelpgtoconta, unidm,
  unicontaspagas, unipri;

{$R *.DFM}




function TrocaVirgPPto(Valor: string): String;
var i:integer;
begin
if Valor <> ' ' then
begin
for i := 0 to Length(Valor) do
begin
if Valor[i]=',' then
begin
Valor[i]:='.';
end
else if Valor[i] = ',' then
begin
Valor[i]:='.';
end;
end;
end;
Result := valor;
end;

function DifDias(DataVenc:TDateTime; DataAtual:TDateTime): String;
Var Data: TDateTime;
dia, mes, ano: Word;
begin
//if DataAtual < DataVenc then
//begin
//Result := 'A data data atual não pode ser menor que a data inicial';
//end
//else
//begin
Data :=  DataVenc - DataAtual ;
DecodeDate( Data, ano, mes, dia);
Result := FloatToStr(Data)+'';
end;

procedure Tfrmpgtodeconta.calculartaxa;
var primeiradata, qtddias, datacompra, totaltaxa, totaletaxa : string ;
begin
if (dm2.sqldadosvendas.RecordCount > 0)then begin
  dm2.sqldadosvendas.First;
   datacompra  := dm2.sqldadosvendasdata.AsString;
  qtddias := DifDias(date,strtodate(datacompra) );
  editqtddias.Text:= qtddias;
   lbtotaltaxa.Caption := '0.00';
   editsaldoeatrazo.Text:=  '0.00';

  if(strtoint(qtddias)>= 60 )then begin
      totaltaxa := floattostr(   (strtoint(edittaxaatrazo.Text) * dm2.sqlclientessaldo.value)/100  );

      totaletaxa:= floattostr(   (strtofloat(totaltaxa) + dm2.sqlclientessaldo.value)  );

   lbtotaltaxa.Caption := floattostrf(strtofloat(totaltaxa),ffFixed,18,2) ;
   editsaldoeatrazo.Text:= floattostrf(strtofloat(totaletaxa),ffFixed,18,2) ;


  end;



    end;
  End;


procedure  Tfrmpgtodeconta.ultimavenda;
 begin
  With dm2.sqlultimavenda do
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
  if (dm2.sqlultimavendaultimavenda.AsString = '' )  then
  begin
  ultimo:= 1;
  end else begin
  ultimo:= 0;
  ultimo:= dm2.sqlultimavendaultimavenda.AsInteger;
  end;

 editcodvenda.text := inttostr(ultimo);
// labelnota.caption:= inttostr(ultimo);
// edittitulo.text := dm.sqlultimousuultimamatricula.AsString;
end;


procedure Tfrmpgtodeconta.inserirpgto;
var
A, M, D: Word;
vardata: TDate;
datahoje, tipopagamento: string;
begin
DecodeDate(Date, A, M, D);
//ShowMessage(Format('Dia %.2d do mês %.2d de %d.', [D, M, A]));

datahoje:= Format('%.2d/%.2d/%d', [A, M ,D ]);

  With dm2.sqldadosentrada do
  Begin
   ultimopgto;
  Close;
  Sql.Clear;
  Sql.Add('Insert Into pgtodecliente (codpgto, data, codcli,cliente,total,status, formapgto, vendedor ) ' ) ;


   Sql.Add(' values ( "' + inttostr(ultimo)+ '", "' + datahoje+ '","' +editcodcli.text+ '","' +editcliente.text+ '", ');
   Sql.Add('  "' +TrocaVirgPPto( editvalorpago.text)+ '","' +editstatus.text+ '" ,"' +editformapgto.text+ '" ,"' +dm2.sqlvendedorvendedor.AsString+ '")');


  ExecSql;
   // End
 // Except

    End;

     With dm2.sqlpgtodecliente do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from pgtodecliente  where codcli = "' + editcodcli.text +'"   order by codpgto asc');
   open;

 
  End;



  //////entrada em caixa
  if(editstatus.Text = 'C')then begin
  tipopagamento := 'PGTOCLIENTE-'+editformapgto.Text;
   With dm2.sqldadosvendas do
  Begin
   ultimavenda;
  Close;
  Sql.Clear;
  Sql.Add('Insert Into dadosvendas (codvenda, data, horas,codcli,cliente,total,subtotal,formapgto,vendedor,situacao ) ' ) ;


   Sql.Add(' values ( "' + inttostr(ultimo)+ '", "' + datahoje+ '","' + timetostr(time)+ '", "' + editcodcli.Text+ '" , "' + editcliente.Text+ '", "' + editvalorpago.Text+ '", "' + editvalorpago.Text+ '", "'+tipopagamento+'" , "' + frmpri.editvendedor.Text+ '", "FECHADO"   ');
   Sql.Add('  )');


  ExecSql;
   // End
 // Except

    End;
    end;



    end;



procedure Tfrmpgtodeconta.zerarcontasempagartudo;
begin

 begin

  With dm2.sqlpgtodecliente do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update pgtodecliente set codcli2 =  codcli , codcli = null  ' ) ;


  Sql.Add('    where codcli = "'+editcodcli.Text+'" ') ;
  ExecSql;

  end;

    With dm2.sqldadosvendas do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update dadosvendas set codcli2 =  codcli , codcli = null  ' ) ;


  Sql.Add('    where codcli = "'+editcodcli.Text+'" ') ;
  ExecSql;

  end;
  end;
  end;
 


procedure Tfrmpgtodeconta.zerarconta;

begin

if (dm2.sqlclientessaldo.Value >= 0) then

 begin
  With dm2.sqlpgtodecliente do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update pgtodecliente set codcli2 =  codcli , codcli = null  ' ) ;


  Sql.Add('    where codcli = "'+editcodcli.Text+'" ') ;
  ExecSql;

  end;

    With dm2.sqldadosvendas do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update dadosvendas set codcli2 =  codcli , codcli = null  ' ) ;


  Sql.Add('    where codcli = "'+editcodcli.Text+'" ') ;
  ExecSql;

  end;
  end;
  end;


procedure Tfrmpgtodeconta.abrircliente;
begin
     With dm2.sqlclientes do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from clientes  where codcli = "' + editcodcli.text +'"  ');
   open;

  End;

  end;
procedure Tfrmpgtodeconta.abrir;
begin
  With dm2.sqlpgtodecliente do
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

   With dm2.sqldadosvendas do
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

   With dm2.sqlformapgto do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from formapgto  where prazo = "N"  ');
   open;

  End;

   With dm2.sqlclientes do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from clientes  where codcli = "' + editcodcli.text +'"  ');
   open;

  End;


end;



procedure  Tfrmpgtodeconta.ultimopgto;
 begin
  With dm2.sqlultimopgto do
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
   if (dm2.sqlultimopgtoultimopgto.AsString = '' )  then
  begin
  ultimo:= 1;
  end else begin
  ultimo:= 0;
  ultimo:= dm2.sqlultimopgtoultimopgto.AsInteger;
  end;

 editcodpgto.text := inttostr(ultimo);
 //labelnota.caption:= inttostr(ultimo);
// edittitulo.text := dm.sqlultimousuultimamatricula.AsString;
end;



procedure Tfrmpgtodeconta.baixacliente;  ///credito cliente
begin

if editstatus.Text = 'C' then begin
    With dm2.sqlclientes do
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
  With dm2.sqlclientes do
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



procedure Tfrmpgtodeconta.Button1Click(Sender: TObject);
begin
dm2.sqlformapgto.Prior;
editformapgto.Text:= dm2.sqlformapgtoFormaPgto.asstring;
if dm2.sqlformapgtoPrazo.AsString = 'S' then
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

procedure Tfrmpgtodeconta.Button2Click(Sender: TObject);
begin
dm2.sqlformapgto.next;
editformapgto.Text:= dm2.sqlformapgtoFormaPgto.asstring;

if dm2.sqlformapgtoPrazo.AsString = 'S' then
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

procedure Tfrmpgtodeconta.btnclienteClick(Sender: TObject);
begin
Application.CreateForm(Tfrmpgtoclientes,frmpgtoclientes);
frmpgtoclientes.showmodal;

end;

procedure Tfrmpgtodeconta.editvalorpagoKeyPress(Sender: TObject;
  var Key: Char);
begin
if Not (key in ['0'..'9',#8, ',' ]) then
key := #0;
end;

procedure Tfrmpgtodeconta.BitBtn1Click(Sender: TObject);

begin
if (editformapgto.Text = '') or (editvalorpago.Text = '') then begin
showmessage('Vc precisa escolher a Forma de pgto ou preencher valor pago.');
end else begin
if  application.messagebox('Deseja Fazer o Pgto?',
   'Confirmação' , mb_yesno + mb_iconquestion) = mrYes then
   begin
 saldoanterior := dm2.sqlclientessaldo.Value;

    inserirpgto;
    baixacliente;
   dm2.sqlpgtodecliente.Last;

    if  application.messagebox('Deseja Imprimir ?',
   'Confirmação' , mb_yesno + mb_iconquestion) = mrYes then
   begin
   Application.CreateForm(Tfrmrelpgtoconta, frmrelpgtoconta);
   frmrelpgtoconta.QuickRep1.print;
       end;

       zerarconta;
         
             
      abrir;

       editstatus.Text:='C';
   end;



end;
end;



procedure Tfrmpgtodeconta.FormCreate(Sender: TObject);
var
A, M, D: Word;
vardata: TDate;
begin


DecodeDate(Date, A, M, D);
//ShowMessage(Format('Dia %.2d do mês %.2d de %d.', [D, M, A]));



editdata.text:= Format('%.2d/%.2d/%d', [M, D, A]);


//btncliente.Enabled:=false;
ultimopgto;


Application.CreateForm(Tfrmpgtoclientes,frmpgtoclientes);
frmpgtoclientes.showmodal;

end;

procedure Tfrmpgtodeconta.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Tfrmpgtodeconta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
  vk_Escape: close;

end;

end;

procedure Tfrmpgtodeconta.editstatusKeyPress(Sender: TObject; var Key: Char);
begin
if Not (key in [#8, 'C','D','c','d' ]) then
key := #0;
end;

procedure Tfrmpgtodeconta.DBGrid2DblClick(Sender: TObject);
begin
Application.CreateForm(Tfrmpgtoveritens,frmpgtoveritens);
frmpgtoveritens.showmodal;
end;

procedure Tfrmpgtodeconta.BitBtn3Click(Sender: TObject);
begin
Application.CreateForm(Tfrmrelpgtoconta, frmrelpgtoconta);
frmrelpgtoconta.QuickRep1.Preview;
end;

procedure Tfrmpgtodeconta.BitBtn4Click(Sender: TObject);
begin
Application.CreateForm(Tfrmcontaspagas, frmcontaspagas);
frmcontaspagas.ShowModal;
end;


procedure Tfrmpgtodeconta.BitBtn5Click(Sender: TObject);
begin
calculartaxa;
end;

procedure Tfrmpgtodeconta.ZerarConta1Click(Sender: TObject);
begin
abrir;
 if (dm2.sqlpgtodecliente.RecordCount > 0) or (dm2.sqldadosvendas.RecordCount >0)then begin

if  application.messagebox('Deseja eliminar pgto(s) e vendas da conta do cliente?',
   'Confirmação' , mb_yesno + mb_iconquestion) = mrYes then
   begin
zerarcontasempagartudo;
 abrir;
calculartaxa;
abrir;
   end;
   end else begin

   ShowMessage('Nao existem registro para eliminar');
   abrir;
end;
end;

procedure Tfrmpgtodeconta.editsaldoeatrazoExit(Sender: TObject);
var 
  TW: Integer; 
begin 
  TW := Canvas.TextWidth((Sender as TEdit).Text); 
  (Sender as TEdit).Perform(EM_SETMARGINS, EC_LEFTMARGIN, ((Sender as TEdit).Width - TW-23)); 


end;

end.
