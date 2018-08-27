unit unirelcaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls;

type
  Tfrmrelcaixa = class(TForm)
    QuickRep1: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel3: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel14: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText4: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRExpr3: TQRExpr;
    QRDBText2: TQRDBText;
    GroupFooterBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel10: TQRLabel;
    lbldata1: TQRLabel;
    lbldata2: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBImage1: TQRDBImage;
    QRSubDetail2: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelcaixa: Tfrmrelcaixa;

implementation   uses unidmcaixa, unicaixa;

{$R *.DFM}

procedure Tfrmrelcaixa.FormCreate(Sender: TObject);
begin
//lbldinheiro.Caption:= frmcaixa.edittotal.text;
//lblprazo.Caption:= frmcaixa.editaprazo.text;
//lblretiradas.caption:= frmcaixa.editretirada.text;
lbldata1.Caption:= datetostr(frmcaixa.editdata1.date);
lbldata2.Caption:= datetostr(frmcaixa.editdata2.date);
end;

end.
