unit unilocacaoimprimir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  Tfrmlocacaoimprimir = class(TForm)
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
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText4: TQRDBText;
    QRDBText10: TQRDBText;
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
    QRDBText18: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    subtotal: TQRDBText;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure abrirprint2;
  end;

var
  frmlocacaoimprimir: Tfrmlocacaoimprimir;

implementation    uses unidmvendas, unilocacao;

{$R *.dfm}

procedure Tfrmlocacaoimprimir.abrirprint2;
var codvendas :string;
begin
codvendas := frmlocacao.labelnota.Caption;


     ///abrir dados vendas
  With dm.sqldadoslocacaoprint do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from dadoslocacao  where codvenda = "' + codvendas +'"   ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;


  ///abrir itens vendas
  With dm.sqlitenslocacaoprint do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from itenslocacao  where codvenda = "' + codvendas +'" order by registro asc  ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;

end;

procedure Tfrmlocacaoimprimir.FormCreate(Sender: TObject);
begin
abrirprint2;
end;

end.
