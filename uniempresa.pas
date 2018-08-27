unit uniempresa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, ExtDlgs, Db, DBTables;

type
  Tfrmempresa = class(TForm)
    BitBtn1: TBitBtn;
    editempresa: TEdit;
    editendereco: TEdit;
    edittelefone: TEdit;
    editCnpjInscr: TEdit;
    DBImage1: TDBImage;
    openlogo: TOpenPictureDialog;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBImage1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmempresa: Tfrmempresa;

implementation    uses unidm;

{$R *.DFM}

procedure Tfrmempresa.BitBtn1Click(Sender: TObject);
begin
 With dm2.sqlempresa do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('Update empresa set empresa = "'+editempresa.text+'", endereco = "'+editendereco.text+'",  ' ) ;

  Sql.Add('telefone = "'+edittelefone.text+'", cnpjInscr="'+editCnpjInscr.text+'"  ') ;
  ExecSql;

  end;
  Showmessage('Dados alterados com sussesso');


  With dm2.sqlempresa do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from empresa ' ) ;

 // Sql.Add('telefone = "'+edittelefone.text+'", cnpjInscr="'+editCnpjInscr.text+'"  ') ;
  open;

  end;

   


  end;


procedure Tfrmempresa.DBImage1DblClick(Sender: TObject);
begin
dm2.tblempresa.edit;
if openlogo.execute then
 DBImage1.Picture.LoadFromFile(openlogo.filename);
 dm2.tblempresa.post;
end;

procedure Tfrmempresa.FormCreate(Sender: TObject);
begin
editempresa.text:= dm2.tblempresaEmpresa.AsString;
editendereco.text:= dm2.tblempresaEndereco.AsString;
edittelefone.text:= dm2.tblempresaTelefone.AsString;
editCnpjInscr.text:= dm2.tblempresaCnpjInscr.AsString;

end;

end.
