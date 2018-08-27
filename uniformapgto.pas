unit uniformapgto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids;

type
  Tfrmformapgto = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    editforma: TEdit;
    editprazo: TEdit;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    editpesquisar: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    editexclui: TEdit;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    editregistro: TEdit;
    BitBtn5: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure editprazoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure gravardados;
     procedure alteracao;
     procedure abrir;
  end;

var
  frmformapgto: Tfrmformapgto;

implementation   uses unidm;

{$R *.DFM}

 procedure Tfrmformapgto.alteracao;
 begin
 With dm2.sqlformapgto do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update formapgto set formapgto = "'+editforma.text+'", prazo = "'+editprazo.text+'"  ' ) ;

  Sql.Add('  where registro = "'+editregistro.text+'" ') ;
  ExecSql;

  end;
  Showmessage('Dados alterados com sussesso');
    editforma.text:='';
   editprazo.text:='';


  // ultimamatricula;

   


  end;




procedure Tfrmformapgto.abrir;
begin
  With dm2.sqlformapgto do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from formapgto   ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;
  dm2.sqlformapgto.Last;
end;

procedure Tfrmformapgto.gravardados;
begin

  With dm2.sqlformapgto do
  Begin
  // ultimamatricula;
  Close;
  Sql.Clear;
  Sql.Add('Insert Into formapgto (formapgto,prazo ) ' ) ;

   Sql.Add(' values ( "' + editforma.text+ '"  , "' + editprazo.text + '" ) ');


  ExecSql;
   // End
 // Except
  Showmessage('dados gravados com sussesso');
   editforma.text:='';
   editprazo.text:='';
   


  End;

  end;

procedure Tfrmformapgto.BitBtn1Click(Sender: TObject);
begin
if tag = 1 then
begin
alteracao;

tag:=0;
abrir;
editforma.SetFocus;
end else begin
if tag= 0 then
begin
gravardados;
abrir;
dm2.sqlformapgto.Last;



end;
end;

end;

procedure Tfrmformapgto.BitBtn4Click(Sender: TObject);
begin
editforma.text:= dm2.sqlformapgtoFormaPgto.AsString;
editprazo.text:=dm2.sqlformapgtoPrazo.AsString;

editregistro.Text:= dm2.sqlformapgtoRegistro.AsString;

tag:=1;

end;

procedure Tfrmformapgto.BitBtn2Click(Sender: TObject);
begin
with dm2.sqlformapgto do
     begin
     Close;
     SQL.Clear;
     SQL.Add('Select * from formapgto where UPPER(formapgto)LIKE UPPEr(''%'' + :3 + ''%'')');
     params[0].AsString := editpesquisar.text;
     open;
     end;

end;

procedure Tfrmformapgto.BitBtn3Click(Sender: TObject);
begin
if  application.messagebox('Deseja Excluir?',
   'Confirmação' , mb_yesno + mb_iconquestion) = mrYes then
   begin

with dm2.sqlformapgto do
     begin
     Close;
     SQL.Clear;
     SQL.Add('DELETE FROM formapgto where registro = "' + editexclui.text + '" ');
     ExecSQL;

end;
editexclui.text:='';
abrir;
//ultimamatricula;

end;

end;

procedure Tfrmformapgto.BitBtn5Click(Sender: TObject);
begin
close;
end;

procedure Tfrmformapgto.editprazoKeyPress(Sender: TObject; var Key: Char);
begin
if Not (key in [#8, 'N','S','n','s']) then
key := #0;
end;

procedure Tfrmformapgto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
  vk_Escape: close;

end;

end;

end.
