unit univeritensentradas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids;

type
  Tfrmveritensentrada = class(TForm)
    DBGrid1: TDBGrid;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmveritensentrada: Tfrmveritensentrada;

implementation  uses unidm;

{$R *.DFM}

procedure Tfrmveritensentrada.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tfrmveritensentrada.FormCreate(Sender: TObject);
begin
 With dm2.sqlitensentrada do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT *   FROM itensentrada where codvenda = "' + dm2.sqldadosentradaCodvenda.AsString + '" ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;

end;

procedure Tfrmveritensentrada.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
  vk_Escape: close;
end;

end;

end.
