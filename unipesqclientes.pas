unit unipesqclientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids;

type
  Tfrmpgtoclientes = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    editcliente: TEdit;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure editclienteKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmpgtoclientes: Tfrmpgtoclientes;

implementation

uses  unipgtodeconta, unidm;

{$R *.DFM}

procedure Tfrmpgtoclientes.BitBtn1Click(Sender: TObject);
begin
frmpgtodeconta.editcodcli.Text:= dm2.sqlclientesCodCli.AsString;
frmpgtodeconta.editcliente.Text:= dm2.sqlclientesCliente.AsString;
//frmpgtodeconta.editsaldo.Caption:=floattostrf(dm.sqlclientessaldo.AsCurrency,ffFixed,18,2);

frmpgtodeconta.abrir;
frmpgtodeconta.calculartaxa;
close;

end;

procedure Tfrmpgtoclientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
  vk_Escape: close;

end;
end;

procedure Tfrmpgtoclientes.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Tfrmpgtoclientes.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if key= #13 then
begin
BitBtn1Click(frmpgtoclientes);
key:=#0;
end;

end;

procedure Tfrmpgtoclientes.editclienteKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
begin
with dm2.sqlclientes do
     begin
     Close;
     SQL.Clear;
     SQL.Add('Select * from clientes where  Cliente LIKE "%'+editcliente.Text+'%" ');
    // params[0].AsString := frmpgtodeconta.editcliente.Text;
     open;

end;
if dm2.sqlclientes.RecordCount > 0 then begin
      DBGrid1.SetFocus;
  end;
end;
end;

end.
