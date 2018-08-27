unit unirelsaidas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls;

type
  Tfrmrelsaidas = class(TForm)
    QuickRep1: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRDBText7: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel13: TQRLabel;
    lbldata1: TQRLabel;
    lbldata2: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel14: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText4: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText10: TQRDBText;
    QRExpr3: TQRExpr;
    GroupFooterBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBImage1: TQRDBImage;
    QRLabel5: TQRLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelsaidas: Tfrmrelsaidas;

implementation  uses unipatrimonio, unidm;

{$R *.DFM}

procedure Tfrmrelsaidas.FormCreate(Sender: TObject);
begin
lbldata1.Caption:= datetostr(frmpatrimonio.editdata1.date);
lbldata2.Caption:= datetostr(frmpatrimonio.editdata2.date);
end;

end.
