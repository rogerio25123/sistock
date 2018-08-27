unit univiscaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, Menus, ComCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  Tfrmviscaixa = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    editdata: TEdit;
    BitBtn3: TBitBtn;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    C1: TMenuItem;
    BitBtn1: TBitBtn;
    CancelarNotasFechadacomEstorno1: TMenuItem;
    editdata1: TDateTimePicker;
    editdata2: TDateTimePicker;
    BitBtn5: TBitBtn;
    sqltotalgrupo: TZQuery;
    sqltotalgrupototalgrupo: TFloatField;
    sqltotalgrupoformapgto: TStringField;
    srctotalgrupo: TDataSource;
    DBGrid2: TDBGrid;
    sqltotalgrupovendedor: TStringField;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure editsaidaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CancelarNotasFechadacomEstorno1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      procedure listarfechadas;
    procedure  totalcaixa;
    procedure  totalcaixaaprazo;
    procedure abrirnotasabertas;


    procedure  totalretirada;
    

procedure  ultimavenda;
procedure  cancelarnota;
procedure estorno;
procedure totalgrupo;
  end;

var
  frmviscaixa: Tfrmviscaixa;
  vardata: string;
  ultimo : integer ;

implementation

uses unidm, univeritenscaixa;

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

procedure Tfrmviscaixa.totalgrupo;
var dataI,dataF: string;
begin
dataI := datetostr( editdata1.date);
dataF := datetostr(editdata2.date);
  With sqltotalgrupo do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT  sum(total)  as totalgrupo,formapgto, vendedor from dadosvendas where  data >=:pInicial  and data <=:pFinal AND formapgto <> "" group by formapgto, vendedor order by vendedor ');
  ParamByName('pInicial').AsDateTime := strtodate(dataI);
   ParamByName('pFinal').AsDateTime := strtodate(dataF);

  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;

end;

procedure Tfrmviscaixa.estorno;
var varcodvenda, varcodcli: string;
begin
varcodvenda:= dm2.sqlcaixaCodvenda.AsString;
varcodcli:= dm2.sqlcaixaCodCli.AsString;

 With dm2.sqlclientes do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update clientes set saldo = saldo - "'+TrocaVirgPPto( dm2.sqlcaixaTotal.AsString)+'"' ) ;


  Sql.Add('   where codcli = "'+varcodcli+'" ') ;
  ExecSql;

  end;


With dm2.sqlitens do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from itensvendas  where codvenda = "' + varcodvenda +'"  ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;


          dm2.sqlitens.First;
While not dm2.sqlitens.Eof do
  Begin
  With dm2.sqlprodutos do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update produtos set estoque = estoque + "'+TrocaVirgPPto(dm2.sqlitensQtd.AsString)+'" ' ) ;


  Sql.Add('   where codprod = "'+dm2.sqlitensCodprod.AsString+'" ') ;
  ExecSql;

  end;

 //   Gauge1.Progress:=Gauge1.Progress+1;
    dm2.sqlitens.Next;
   End;




   // frmvendas.FormRefresh(self);

     End;



procedure Tfrmviscaixa.abrirnotasabertas;
begin
  With dm2.sqlcaixa do
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

end;


procedure  Tfrmviscaixa.cancelarnota;
var varcodvenda: string;
begin
varcodvenda:= dm2.sqlcaixaCodvenda.AsString;
with dm2.sqlcaixa do
     begin
     Close;
     SQL.Clear;
     SQL.Add('DELETE FROM dadosvendas where codvenda = "' + varcodvenda + '" ');
     ExecSQL;

end;


with dm2.sqlitens do
     begin
     Close;
     SQL.Clear;
     SQL.Add('DELETE FROM itensvendas where codvenda = "' + varcodvenda + '" ');
     ExecSQL;

end;



end;





procedure  Tfrmviscaixa.ultimavenda;
 begin
  With dm2.sqlultimavenda do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT MAX( codvenda  ) ultimavenda  FROM dadosvendas  ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;
  ultimo:= 0;
  ultimo := ultimo + dm2.sqlultimavendaultimavenda.AsInteger+1;

 //editcodvenda.text := inttostr(ultimo);
 //labelnota.caption:= inttostr(ultimo);
// edittitulo.text := dm.sqlultimousuultimamatricula.AsString;
end;




 procedure  Tfrmviscaixa.totalretirada;
var dataI,dataF: string;
begin
dataI := datetostr( editdata1.date);
dataF := datetostr(editdata2.date);
  With dm2.sqltotalretirada do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT sum(total) totalretirada  FROM dadosvendas where situacao = "FECHADO" and data >=:pInicial  and data <=:pFinal  and codcli =0 and total<0');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  ParamByName('pInicial').AsDateTime := strtodate(dataI);
   ParamByName('pFinal').AsDateTime := strtodate(dataF);
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;


  end;





procedure  Tfrmviscaixa.totalcaixaaprazo;
var  dataI,dataF: string;
begin
dataI := datetostr( editdata1.date);
dataF := datetostr(editdata2.date);
  With dm2.sqlcaixaaprazo do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT sum(total) totalaprazo  FROM dadosvendas where situacao = "FECHADO" and data >=:pInicial  and data <=:pFinal  and codcli >0 ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  ParamByName('pInicial').AsDateTime := strtodate(dataI);
   ParamByName('pFinal').AsDateTime := strtodate(dataF);
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;


  end;



procedure  Tfrmviscaixa.totalcaixa;
var dataI,dataF: string;
begin
dataI := datetostr( editdata1.date);
dataF := datetostr(editdata2.date);
  With dm2.sqltotalcaixa do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT sum(total) totalcaixa  FROM dadosvendas where situacao = "FECHADO" and data >=:pInicial  and data <=:pFinal  and codcli =0 ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  ParamByName('pInicial').AsDateTime := strtodate(dataI);
   ParamByName('pFinal').AsDateTime := strtodate(dataF);
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;


  end;
  
procedure Tfrmviscaixa.listarfechadas;
var dataI,dataF: string;
begin
dataI := datetostr( editdata1.date);
dataF := datetostr(editdata2.date);
  With dm2.sqlcaixa do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from dadosvendas  where situacao = "FECHADO" and data >=:pInicial  and data <=:pFinal  ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
   ParamByName('pInicial').AsDateTime := strtodate(dataI);
   ParamByName('pFinal').AsDateTime := strtodate(dataF);
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;

end;

procedure Tfrmviscaixa.BitBtn3Click(Sender: TObject);
begin
DBGrid1.Visible:=true;
 listarfechadas;
 totalcaixa;
 totalcaixaaprazo ;
 totalretirada ;
 totalgrupo;
 //BitBtn1.Enabled:=false;
end;

procedure Tfrmviscaixa.FormCreate(Sender: TObject);
var
A, M, D: Word;
begin
DecodeDate(Date, A, M, D);
//ShowMessage(Format('Dia %.2d do mês %.2d de %d.', [D, M, A]));



editdata1.date:= strtodate(Format('%.2d/%.2d/%d', [D, M, A]));
editdata2.date:= strtodate(Format('%.2d/%.2d/%d', [D, M, A]));
vardata:= Format('%.2d/%.2d/%d', [M, D, A]);
editdata.text := Format('%.2d/%.2d/%d', [M, D, A]);

end;



procedure Tfrmviscaixa.editsaidaKeyPress(Sender: TObject; var Key: Char);
begin
if Not (key in ['0'..'9',#8, ',' ]) then
key := #0;
end;

procedure Tfrmviscaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
  vk_Escape: close;

end;

end;

procedure Tfrmviscaixa.DBGrid1DblClick(Sender: TObject);
begin
Application.CreateForm(tfrmveritenscaixa,frmveritenscaixa);
frmveritenscaixa.showmodal;

end;

procedure Tfrmviscaixa.C1Click(Sender: TObject);
begin
if dm2.sqlcaixaSituacao.AsString = 'ABERTA' then
begin
if  application.messagebox('Deseja Excluir Esta Nota?',
   'Confirmação' , mb_yesno + mb_iconquestion) = mrYes then
   begin
   cancelarnota;
   BitBtn3Click(frmviscaixa);

end;
end;
    end;
procedure Tfrmviscaixa.BitBtn1Click(Sender: TObject);
begin
DBGrid1.Visible:=true;
abrirnotasabertas;
end;

procedure Tfrmviscaixa.CancelarNotasFechadacomEstorno1Click(
  Sender: TObject);
begin
if dm2.sqlcaixaSituacao.AsString = 'FECHADO' then
begin
if  application.messagebox('Deseja Excluir Esta Nota?',
   'Confirmação' , mb_yesno + mb_iconquestion) = mrYes then
   begin
   estorno;
   cancelarnota;
   BitBtn3Click(frmviscaixa);
   totalgrupo;

end;

end;
    END;
procedure Tfrmviscaixa.BitBtn5Click(Sender: TObject);
begin
close;
end;

end.
