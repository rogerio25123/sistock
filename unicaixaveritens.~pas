unit unicaixaveritens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons;

type
  Tfrmvercaixa = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    editlocalentrega: TEdit;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmvercaixa: Tfrmvercaixa;

implementation    uses unidmcaixa, unicaixa;

{$R *.DFM}

procedure Tfrmvercaixa.FormCreate(Sender: TObject);
begin
 editlocalentrega.text:= dm.sqlcaixaLocalEntrega.AsString;
 With dm.sqlitens do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('SELECT *   FROM itensvendas where codvenda = "' + dm.sqlcaixaCodvenda.AsString + '" ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;
   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');

  End;
end;

procedure Tfrmvercaixa.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tfrmvercaixa.BitBtn2Click(Sender: TObject);
var varcodvenda: string;
begin
varcodvenda:= dm.sqlcaixaCodvenda.AsString;
 With dm.sqlcaixa do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update dadosvendas set localentrega = "'+editlocalentrega.Text+'"  ' ) ;


  Sql.Add('    where codvenda = "'+varcodvenda+'" ') ;
  ExecSql;

  end;

  frmcaixa.BitBtn3Click(frmcaixa);

end;

end.
