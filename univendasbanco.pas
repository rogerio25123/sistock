unit univendasbanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids;

type
  Tfrmbancoa = class(TForm)
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmbancoa: Tfrmbancoa;

implementation uses unidmvendas;

{$R *.dfm}

end.
