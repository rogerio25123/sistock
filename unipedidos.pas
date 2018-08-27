unit unipedidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Buttons;

type
  Tfrmpedidos = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listarminimo;
  end;

var
  frmpedidos: Tfrmpedidos;

implementation

uses unirelpedidos, unidm;

{$R *.DFM}

procedure Tfrmpedidos.listarminimo;
begin
  With dm2.sqlpedidos do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from produtos  where estoque < estoqueminimo  ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;

    end;
procedure Tfrmpedidos.BitBtn1Click(Sender: TObject);
begin
Application.CreateForm(tfrmrelpedidos, frmrelpedidos);
frmrelpedidos.QuickRep1.Preview;
end;

procedure Tfrmpedidos.BitBtn2Click(Sender: TObject);
begin
listarminimo;
end;

end.
