unit univeritenscaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids;

type
  Tfrmveritenscaixa = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn5: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmveritenscaixa: Tfrmveritenscaixa;

implementation

uses unidm;

{$R *.DFM}

procedure Tfrmveritenscaixa.FormCreate(Sender: TObject);
begin
 With dm2.sqlitens do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT *   FROM itensvendas where codvenda = "' + dm2.sqlcaixaCodvenda.AsString + '" ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;

end;

procedure Tfrmveritenscaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
  vk_Escape: close;

end;

end;

procedure Tfrmveritenscaixa.BitBtn5Click(Sender: TObject);
begin
close;
end;

end.
