unit unicontaspagas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type
  Tfrmcontaspagas = class(TForm)
    Label6: TLabel;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    lbcliente: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure abrircontaspagas;
  end;

var
  frmcontaspagas: Tfrmcontaspagas;

implementation

uses unidm, unipgtodeconta;

{$R *.dfm}

procedure Tfrmcontaspagas.abrircontaspagas;
begin

  With dm2.sqlpgtodecliente do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from pgtodecliente  where codcli2 = "' + frmpgtodeconta.editcodcli.text +'"   order by codpgto asc');
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
  Sql.Add('select * from dadosvendas  where codcli2 = "' + frmpgtodeconta.editcodcli.text +'"  ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;





end;


procedure Tfrmcontaspagas.FormCreate(Sender: TObject);
begin
abrircontaspagas;
lbcliente.Caption:= frmpgtodeconta.editcliente.text;
end;

procedure Tfrmcontaspagas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
frmpgtodeconta.abrir;
end;

procedure Tfrmcontaspagas.BitBtn2Click(Sender: TObject);
begin
close;
end;

end.