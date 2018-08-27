unit uniescnotatroca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  Tfrmescnotatroca = class(TForm)
    GroupBox1: TGroupBox;
    editcodvenda: TEdit;
    BitBtn1: TBitBtn;
    procedure editcodvendaKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmescnotatroca: Tfrmescnotatroca;

implementation

uses unidmvendas;

{$R *.dfm}

procedure Tfrmescnotatroca.editcodvendaKeyPress(Sender: TObject;
  var Key: Char);
begin
if Not (key in ['0'..'9',#8 ]) then
key := #0;
end;

procedure Tfrmescnotatroca.BitBtn1Click(Sender: TObject);
begin

    With dm.sqlescnota do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from dadosvendas  where codvenda= "' + editcodvenda.text +'"   ');

  open;

  End;

  if (dm.sqlescnotacodvenda.AsString =  editcodvenda.text   ) then
  begin
  close;
  end else begin
  ShowMessage('Nota de Venda não encontrada');

  end;
  end;






end.
