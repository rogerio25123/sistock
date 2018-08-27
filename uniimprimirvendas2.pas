unit uniimprimirvendas2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  Tfrmimprimirvendas2 = class(TForm)
    QuickRep1: TQuickRep;
    ColumnHeaderBand1: TQRBand;
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
    QRDBText15: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel3: TQRLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure abrirprint2;
  end;

var
  frmimprimirvendas2: Tfrmimprimirvendas2;

implementation  uses unidmvendas, unifecharvendas, univendass;

{$R *.dfm}

procedure Tfrmimprimirvendas2.abrirprint2;
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
  Sql.Add('select * from itensvendas  where codvenda = "' + codvendas +'" order by registro asc ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;

end;

procedure Tfrmimprimirvendas2.FormCreate(Sender: TObject);
begin
abrirprint2;
end;

end.
