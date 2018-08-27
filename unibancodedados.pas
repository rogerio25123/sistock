unit unibancodedados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Table1: TTable;
    Table1Codigo: TIntegerField;
    Table1Host: TStringField;
    Table1Banco: TStringField;
    Table1Login: TStringField;
    Table1Senha: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
Table1.DatabaseName :=  ExtractFilePath(Application.ExeName );
Table1.TableName := 'banco.db';
Table1.open;
end;

end.
