unit unipgtoveritens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids;

type
  Tfrmpgtoveritens = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmpgtoveritens: Tfrmpgtoveritens;

implementation   uses unidm;

{$R *.DFM}

procedure Tfrmpgtoveritens.FormCreate(Sender: TObject);
begin
 With dm2.sqlitens do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT *   FROM itensvendas where codvenda = "' + dm2.sqldadosvendasCodvenda.AsString + '" ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;

end;

procedure Tfrmpgtoveritens.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tfrmpgtoveritens.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
  vk_Escape: close;

end;
end;

end.
