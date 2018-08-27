unit unipgtoclientesvendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids;

type
  Tfrmpgtoclientesvendas = class(TForm)
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
   frmpgtoclientesvendas: Tfrmpgtoclientesvendas;

implementation

uses  unipgtodecontavendas,  unidmvendas;

{$R *.DFM}

procedure Tfrmpgtoclientesvendas.BitBtn1Click(Sender: TObject);
begin
frmpgtodecontavendas.editcodcli.Text:= dm.sqlclientesCodCli.AsString;
frmpgtodecontavendas.editcliente.Text:= dm.sqlclientesCliente.AsString;
//frmpgtodeconta.editsaldo.Caption:=floattostrf(dm.sqlclientessaldo.AsCurrency,ffFixed,18,2);

frmpgtodecontavendas.abrir;
close;

end;

procedure Tfrmpgtoclientesvendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
  vk_Escape: close;

end;
end;

procedure Tfrmpgtoclientesvendas.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Tfrmpgtoclientesvendas.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if key= #13 then
begin
BitBtn1Click(frmpgtoclientesvendas);
key:=#0;
end;

end;

procedure Tfrmpgtoclientesvendas.editclienteKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
begin
with dm.sqlclientes do
     begin
     Close;
     SQL.Clear;
     SQL.Add('Select * from clientes where  Cliente LIKE "%'+editcliente.Text+'%" ');
    // params[0].AsString := frmpgtodeconta.editcliente.Text;
     open;

end;
if dm.sqlclientes.RecordCount > 0 then begin
      DBGrid1.SetFocus;
  end;
end;
end;

end.
