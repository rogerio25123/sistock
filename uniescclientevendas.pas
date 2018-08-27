unit uniescclientevendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids;

type
  Tfrmescclientes = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    editcliente: TEdit;
    Label1: TLabel;
    procedure editclienteKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure pesquisar;
  end;

var
  frmescclientes: Tfrmescclientes;

implementation   uses unidmvendas, unifecharvendas, univendass, unilocacao,
  unidevolucao;

{$R *.dfm}
procedure Tfrmescclientes.pesquisar;
begin

with dm.sqlclientes do
     begin
     Close;
     SQL.Clear;
     SQL.Add('Select * from clientes where  Cliente LIKE "%'+editcliente.Text+'%" ');
    // params[0].AsString := frmfinalizarvendas.editcliente.Text;
     open;
     end;
  if dm.sqlclientes.RecordCount > 0 then begin
      DBGrid1.SetFocus;
  end;



     end;


procedure Tfrmescclientes.editclienteKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
begin
pesquisar;
end;
end;

procedure Tfrmescclientes.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Tfrmescclientes.BitBtn1Click(Sender: TObject);
begin

if frmprivendas.tag = 5 then
begin
 frmlocacao.editcodcli.Text:= dm.sqlclientescodcli.AsString;
frmlocacao.editcliente.Text:= dm.sqlclientescliente.AsString;
 
close;
end else begin
if frmprivendas.tag = 6 then
begin
 frmdevolucao.editcodcli.Text:= dm.sqlclientescodcli.AsString;
frmdevolucao.editcliente.Text:= dm.sqlclientescliente.AsString;
frmdevolucao.abrir;
 
close;
end else begin
if (dm.sqlclientesbloqueio.Text = 'S') then
begin
ShowMessage('Cliente bloqueado, favor verificar com o administrador!');
end else begin
frmfecharvendas.editcodcli.Text:= dm.sqlclientescodcli.AsString;
frmfecharvendas.editcliente.Text:= dm.sqlclientescliente.AsString;
close;
end;
end;
end;
end;

procedure Tfrmescclientes.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
BitBtn1Click(frmescclientes);
end;
end;

procedure Tfrmescclientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
  vk_Escape: close;
end;
end;

procedure Tfrmescclientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:= cafree;

end;

procedure Tfrmescclientes.FormCreate(Sender: TObject);
begin
dm.sqlclientes.Close;
end;

end.
