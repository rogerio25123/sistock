unit unilistarentradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ZAbstractRODataset, ZDataset, StdCtrls,
  Buttons;

type
  Tfrmlistarentradas = class(TForm)
    DBGrid1: TDBGrid;
    sqlitensentada: TZReadOnlyQuery;
    DataSource1: TDataSource;
    sqlitensentadaregistro: TIntegerField;
    sqlitensentadacodvenda: TIntegerField;
    sqlitensentadacodprod: TIntegerField;
    sqlitensentadadescricao: TStringField;
    sqlitensentadaunivenda: TStringField;
    sqlitensentadaqtd: TFloatField;
    sqlitensentadapreco: TFloatField;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmlistarentradas: Tfrmlistarentradas;

implementation

uses unidm;

{$R *.dfm}

procedure Tfrmlistarentradas.FormCreate(Sender: TObject);
begin
 With sqlitensentada do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from itensentrada where codprod = "'+dm2.sqlprodutoscodprod.AsString+'"  order by codprod ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;
end;

end.
