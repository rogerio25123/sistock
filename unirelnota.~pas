unit unirelnota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls;

type
  Tfrmrelnota = class(TForm)
    QuickRep1: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRExpr2: TQRExpr;
    GroupFooterBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRDBText12: TQRDBText;
    QRExpr3: TQRExpr;
    QRLabel10: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBImage1: TQRDBImage;
    QRLabel17: TQRLabel;
    QRLabel1: TQRLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelnota: Tfrmrelnota;

implementation   uses unidmcaixa;

{$R *.DFM}

procedure Tfrmrelnota.FormCreate(Sender: TObject);
begin
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

end.
