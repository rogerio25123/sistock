unit unibanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type
  Tfrmbanco = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmbanco: Tfrmbanco;

implementation   uses unidm;

{$R *.dfm}

procedure Tfrmbanco.BitBtn1Click(Sender: TObject);
begin
close;
end;

end.
