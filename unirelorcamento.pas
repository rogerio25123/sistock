unit unirelorcamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls;

type
  Tfrmrelorcamento = class(TForm)
    QuickRep1: TQuickRep;
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
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    lblvendedor: TQRLabel;
    lbltotal: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBImage1: TQRDBImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelorcamento: Tfrmrelorcamento;

implementation   uses unidmvendas, univendass,  QRExport;

{$R *.DFM}



procedure Tfrmrelorcamento.FormCreate(Sender: TObject);
begin
lblvendedor.Caption:= frmprivendas.editvendedor.text;
lbltotal.Caption:= frmprivendas.Label3.Caption;
//QuickRep1.ExportToFilter(TQRAsciiExportFilter.Create('C:\REPORT.TXT'));
//WinExec('NotePad.exe /p c:\REPORT.txt', 0)

end;

end.
