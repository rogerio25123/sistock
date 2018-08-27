unit unibackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, Buttons;

type
  Tfrmbackup = class(TForm)
    DriveComboBox1: TDriveComboBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    editorigem: TEdit;
    Button1: TButton;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    editlocal: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmbackup: Tfrmbackup;

implementation  uses shellapi, unidm;

{$R *.dfm}



procedure Tfrmbackup.FormCreate(Sender: TObject);
 
Begin 


  editlocal.text := ExtractFilePath(Application.ExeName )+'salvar.bat' ;
WinExec(Pchar(editlocal.Text), 0)

end;

procedure Tfrmbackup.BitBtn1Click(Sender: TObject);
var
  SR: TSearchRec;
  I: integer;
  Origem, Destino,nomedoarquivo: string;
e:integer;
const
str='1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ';
max=6;
begin
if dm2.tbbancoHost.AsString <> 'localhost' then
begin
ShowMessage('O Backup só pode ser feito no servidor');
end else begin
Edit1.Text:='';
for e:=1 to max do

  nomedoarquivo := FormatDateTime('ddmmyyyy', (date));
   nomedoarquivo :=  nomedoarquivo+StringReplace(timetostr(time), ':', EmptyStr, [rfReplaceAll]) ;

Edit1.Text:= nomedoarquivo ;//FormatDateTime('ddmmyyyy', (date)); // Edit1.Text+str[random(length(str))+2];


  editorigem.text := ExtractFilePath(Application.ExeName )+'backup.sql' ;

   If not(fileexists(DriveComboBox1.Drive+':\'+Edit1.Text+'.sql')) then
 begin

  I := FindFirst(editorigem.text, faAnyFile, SR);
  while I = 0 do begin
  if (SR.Attr and faDirectory) <> faDirectory then
  begin
  Origem := editorigem.text ;
  Destino := DriveComboBox1.Drive+':\'+nomedoarquivo+'.sql' ;
  if not CopyFile(PChar(Origem), PChar(Destino), true) then
  ShowMessage('Erro ao copiar ' + Origem + ' para ' + Destino);
  end;
  I := FindNext(SR);
 
  ShowMessage('Dados Gravados com Sussesso!');
 end;
  end else begin
  Showmessage('Arquivo já existe na origem, tente gravar novamente');

end;
   end;
   end;
procedure Tfrmbackup.Button1Click(Sender: TObject);
begin
 editorigem.text := ExtractFilePath(Application.ExeName )+'backup.sql' ;


 If (fileexists(editorigem.text)) then
  Showmessage('Arquivo existente');
//editorigem.text := DriveComboBox1.drive+':\';
//editorigem.text := editorigem.Text+'backup.sql'  ;


end;

procedure Tfrmbackup.BitBtn2Click(Sender: TObject);
begin
close;
end;

end.
