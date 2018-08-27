unit univendedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, Db, DBTables, ComCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  Tfrmvendedor = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    editvendedor: TEdit;
    editsenha: TEdit;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    editpesquisar: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    editexclui: TEdit;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    editregistro: TEdit;
    DBGrid1: TDBGrid;
    sqlcomissao111: TQuery;
    srccomissao: TDataSource;
    DBGrid2: TDBGrid;
    BitBtn5: TBitBtn;
    editadm: TEdit;
    Label3: TLabel;
    sqlcomissao111vendedor: TStringField;
    sqlcomissao111totalvendedor: TCurrencyField;
    sqlcomissao111Comissao: TFloatField;
    Label4: TLabel;
    Label5: TLabel;
    editporc: TEdit;
    Label6: TLabel;
    editdata1: TDateTimePicker;
    editdata2: TDateTimePicker;
    sqlcomissao: TZQuery;
    sqlcomissaovendedor: TStringField;
    sqlcomissaototalvendedor: TFloatField;
    sqlcomissaocomissao: TCurrencyField;
    BitBtn6: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editadmKeyPress(Sender: TObject; var Key: Char);
    procedure sqlcomissao111CalcFields(DataSet: TDataSet);
    procedure editporcKeyPress(Sender: TObject; var Key: Char);
    procedure sqlcomissaoCalcFields(DataSet: TDataSet);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure gravardados;
     procedure alteracao;
     procedure abrir;
  end;

var
  frmvendedor: Tfrmvendedor;

implementation      uses unidm;

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

 procedure Tfrmvendedor.alteracao;
 begin
 With dm2.sqlvendedor do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update vendedor set vendedor = "'+editvendedor.text+'", senha = "'+ editsenha.text +'",  ' ) ;

  Sql.Add('adm = "'+editadm.text+'"  where registro = "'+editregistro.text+'" ') ;
  ExecSql;

  end;
  Showmessage('Dados alterados com sussesso');
    editvendedor.text:='';
   editsenha.text:='';
   editadm.text:='';


  // ultimamatricula;

   


  end;




procedure Tfrmvendedor.abrir;
begin
  With dm2.sqlvendedor do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from vendedor   ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;
  dm2.sqlvendedor.Last;
end;

procedure Tfrmvendedor.gravardados;
begin

  With dm2.sqlvendedor do
  Begin
  // ultimamatricula;
  Close;
  Sql.Clear;
  Sql.Add('Insert Into vendedor (Vendedor,senha,adm ) ' ) ;

  Sql.Add(' values ( "' + editvendedor.text+ '"  , "' + editsenha.text + '" , "' + editadm.text + '") ');


  ExecSql;
   // End
 // Except
  Showmessage('dados gravados com sussesso');
  editvendedor.text:='';
  editsenha.text:='';
  editadm.text:='';
   
   End;

  end;


procedure Tfrmvendedor.BitBtn1Click(Sender: TObject);
begin
if tag = 1 then
begin
alteracao;

tag:=0;
abrir;
editvendedor.SetFocus;
end else begin
if tag= 0 then
begin
gravardados;
abrir;
dm2.sqlvendedor.Last;



end;
end;

end;

procedure Tfrmvendedor.BitBtn4Click(Sender: TObject);
begin
editvendedor.text:= dm2.sqlvendedorVendedor.AsString;
editsenha.text:=dm2.sqlvendedorSenha.AsString;
editadm.text:=dm2.sqlvendedorAdm.AsString;

editregistro.Text:= dm2.sqlvendedorRegistro.AsString;

tag:=1;

end;

procedure Tfrmvendedor.BitBtn2Click(Sender: TObject);
begin
with dm2.sqlvendedor do
     begin
     Close;
     SQL.Clear;
     SQL.Add('Select * from vendedor where vendedor LIKE "%'+editpesquisar.text+'%"');
    // params[0].AsString := editpesquisar.text;
     open;
     end;
end;

procedure Tfrmvendedor.BitBtn3Click(Sender: TObject);
begin
if  application.messagebox('Deseja Excluir?',
   'Confirmação' , mb_yesno + mb_iconquestion) = mrYes then
   begin

with dm2.sqlvendedor do
     begin
     Close;
     SQL.Clear;
     SQL.Add('DELETE FROM vendedor where registro = "' + editexclui.text + '" ');
     ExecSQL;

end;
editexclui.text:='';
abrir;
//ultimamatricula;

end;

end;

procedure Tfrmvendedor.BitBtn5Click(Sender: TObject);
begin
close;
end;

procedure Tfrmvendedor.FormCreate(Sender: TObject);
var
A, M, D: Word;
begin
DecodeDate(Date, A, M, D);
//ShowMessage(Format('Dia %.2d do mês %.2d de %d.', [D, M, A]));



editdata1.date:=strtodate(Format('%.2d/%.2d/%d', [D, M, A]));
editdata2.date:= strtodate(Format('%.2d/%.2d/%d', [D, M, A]));
abrir;
end;

procedure Tfrmvendedor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
  vk_Escape: close;

end;

end;

procedure Tfrmvendedor.editadmKeyPress(Sender: TObject; var Key: Char);
begin
if Not (key in [#8, 'N','S','n','s']) then
key := #0;
end;

procedure Tfrmvendedor.sqlcomissao111CalcFields(DataSet: TDataSet);
begin
sqlcomissaoComissao.Value:=  (sqlcomissaototalvendedor.Value* StrToFloat(editporc.text)/100);
end;

procedure Tfrmvendedor.editporcKeyPress(Sender: TObject; var Key: Char);
begin
if Not (key in ['0'..'9',#8, ',' ]) then
key := #0;
end;

procedure Tfrmvendedor.sqlcomissaoCalcFields(DataSet: TDataSet);
begin
sqlcomissaoComissao.Value:=  (sqlcomissaototalvendedor.Value* StrToFloat(editporc.text)/100);

end;

procedure Tfrmvendedor.BitBtn6Click(Sender: TObject);
var A, M, D, A2, M2, D2: Word;
dataI, dataF : string;

begin
 DecodeDate(editdata1.Date, A, M, D);
 DecodeDate(editdata2.Date, A2, M2, D2);

dataI:= Format('%.2d/%.2d/%d', [A, M ,D ]);
dataF:= Format('%.2d/%.2d/%d', [A2, M2 ,D2 ]);
 With sqlcomissao do
  Begin
  Close;
  Sql.Clear;

    Sql.Add('SELECT vendedor , sum( total )  totalvendedor FROM dadosvendas  where  data >="'+dataI+'"  and data <="'+dataF+'"  and total>0 and codcli = 0  and vendedor = "'+dm2.sqlvendedorVendedor.AsString+'"    GROUP BY vendedor ');
//  ParamByName('pInicial').AsDateTime := strtodate(dataI);
 // ParamByName('pFinal').AsDateTime := strtodate(dataF);
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;
end;

end.
