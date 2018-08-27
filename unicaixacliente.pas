unit unicaixacliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons;

type
  Tfrmpesqcliente = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmpesqcliente: Tfrmpesqcliente;

implementation

uses unidmcaixa, unifinalizarvendas;

{$R *.DFM}

procedure Tfrmpesqcliente.BitBtn1Click(Sender: TObject);
begin
frmfinalizarvendas.editcodcli.Text:= dm.sqlclientesCodCli.AsString;
frmfinalizarvendas.editcliente.Text:= dm.sqlclientesCliente.AsString;
close;
end;

procedure Tfrmpesqcliente.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Tfrmpesqcliente.FormCreate(Sender: TObject);
begin
with dm.sqlclientes do
     begin
     Close;
     SQL.Clear;
     SQL.Add('Select * from clientes where  Cliente LIKE "%'+frmfinalizarvendas.editcliente.Text+'%" ');
    // params[0].AsString := frmfinalizarvendas.editcliente.Text;
     open;
     end;
end;

end.
