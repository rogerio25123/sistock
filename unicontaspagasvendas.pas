unit unicontaspagasvendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids;

type
  Tfrmcontaspagasvendas = class(TForm)
    Label6: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    lbcliente: TLabel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure abrircontaspagas;
  end;

var
  frmcontaspagasvendas: Tfrmcontaspagasvendas;

implementation

uses unipgtodecontavendas, unidmvendas;

{$R *.dfm}

procedure Tfrmcontaspagasvendas.abrircontaspagas;
begin

  With dm.sqlpgtodecliente do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from pgtodecliente  where codcli2 = "' + frmpgtodecontavendas.editcodcli.text +'"   order by codpgto asc');
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
  Sql.Add('select * from dadosvendas  where codcli2 = "' + frmpgtodecontavendas.editcodcli.text +'"  ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;





end;


procedure Tfrmcontaspagasvendas.FormCreate(Sender: TObject);
begin
abrircontaspagas;
lbcliente.Caption:= frmpgtodecontavendas.editcliente.text;
end;

procedure Tfrmcontaspagasvendas.BitBtn2Click(Sender: TObject);
begin
close;
end;

end.
