unit unidevolucaoimprimir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  Tfrmdevolucaoimprimir = class(TForm)
    QuickRep1: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText13: TQRDBText;
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
    QRDBText20: TQRDBText;
    GroupFooterBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText18: TQRDBText;
    sqldevolucao: TZQuery;
    sqldevolucaoregistro: TIntegerField;
    sqldevolucaocodvenda: TIntegerField;
    sqldevolucaocodprod: TIntegerField;
    sqldevolucaodescricao: TStringField;
    sqldevolucaounivenda: TStringField;
    sqldevolucaoqtd: TFloatField;
    sqldevolucaopreco: TFloatField;
    sqldevolucaodesconto: TFloatField;
    sqldevolucaodtdevolucao: TDateField;
    sqldevolucaodevolvido: TStringField;
    sqldevolucaodtdevolvido: TDateField;
    sqldevolucaoqtddias: TIntegerField;
    sqldevolucaojuros: TFloatField;
    sqldevolucaocodcli: TIntegerField;
    sqldevolucaocodcli2: TIntegerField;
    debito: TQRLabel;
    desconto: TQRLabel;
    valorpago: TQRLabel;
    formapgto: TQRLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmdevolucaoimprimir: Tfrmdevolucaoimprimir;

implementation  uses unidmvendas, unidevolucao, unifechardevolucao;

{$R *.dfm}

//////////////////////////////////////////////////////////juntas
   function ZeroEsquerda2(const I: integer; const Casas: byte): string;
var
Ch: Char;
begin
  Result := IntToStr(I);
  if Length(Result) > Casas then begin
     Ch := '*';
     Result := '';
  end
  else
  Ch := '0';
  while length(Result) < Casas do
  result:=Ch+Result;
  end;

function CDateStr(const date:tdatetime):string;
var
fano, fmes, fdia: word;
begin
  DecodeDate(date,fano,fmes,fdia);
  result:=zeroesquerda2(fano,4)+zeroesquerda2(fmes,2)+zeroesquerda2(fdia,2);
end;

  /////////////////juntas

  

function DataIng(Data:String):String;
begin
Result := Copy(Data, 1,4)+ '/'  + copy(Data, 5,2)+ '/'  +Copy(Data, 7, 2); ;
end;

function Dataportugues(Data:String):String;
begin
Result := Copy(Data, 7,2)+ '/'  + copy(Data, 5,2)+ '/'  +Copy(Data, 1, 4); ;
end;

///tudo junto 20100704////////////////////////////////////////////////////////

procedure Tfrmdevolucaoimprimir.FormCreate(Sender: TObject);
var datahoje : string;
begin
if frmfechardevolucao.RadioButton1.checked then
begin
formapgto.Caption := frmfechardevolucao.RadioButton1.Hint;
end else begin
formapgto.Caption := frmfechardevolucao.RadioButton2.Hint;
end;
datahoje := DataIng( CDateStr(date));
debito.Caption := floattostrf(strtofloat(frmfechardevolucao.edittotal.Text),ffFixed,18,2);
desconto.Caption := floattostrf(strtofloat(frmfechardevolucao.editdesconto.Text),ffFixed,18,2);
valorpago.Caption := floattostrf(strtofloat(frmfechardevolucao.editvalorpago.Text),ffFixed,18,2);

 With sqldevolucao do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from itenslocacao  where dtdevolvido = "' + datahoje +'" and codcli = "'+frmdevolucao.editcodcli.Text+'" and devolvido = "X" ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;
end;

end.
