unit uniimprimirvendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  Tfrmimprimirvendas = class(TForm)
    QuickRep1: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel17: TQRLabel;
    QRImage1: TQRImage;
    QRLabel4: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText4: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText1: TQRDBText;
    QRExpr3: TQRExpr;
    QRDBText2: TQRDBText;
    GroupFooterBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText20: TQRDBText;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

   procedure abrirprint2;
  end;

var
  frmimprimirvendas: Tfrmimprimirvendas;

implementation  uses unidmvendas, unifecharvendas, univendass;

{$R *.dfm}


procedure Tfrmimprimirvendas.abrirprint2;
var codvendas :string;
begin
codvendas := frmprivendas.labelnota.Caption;


     ///abrir dados vendas
  With dm.sqldadosvendasprint do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from dadosvendas  where codvenda = "' + codvendas +'"   ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;


  ///abrir itens vendas
  With dm.sqlitensprint do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from itensvendas  where codvenda = "' + codvendas +'"  ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;

end;
procedure Tfrmimprimirvendas.FormCreate(Sender: TObject);
begin
QRImage1.Picture.LoadFromFile('empresa2.bmp');
  abrirprint2;
end;

end.
