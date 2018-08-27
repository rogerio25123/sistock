unit unipri;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DBCtrls,
  Menus;

type
  Tfrmpri = class(TForm)
    editsenha: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    ToolBar2: TToolBar;
    BitBtn15: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn14: TBitBtn;
    ToolBar1: TToolBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn13: TBitBtn;
    editvendedor: TEdit;
    StatusBar1: TStatusBar;
    Image1: TImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure editsenhaKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmpri: Tfrmpri;

implementation

uses uniprodutos, uniclientes, univendedor, unidm, uniformapgto,
  unientraestoque, uninotasemitidas, unipgtodeconta, univiscaixa,
  unipedidos, unipatrimonio, uniempresa, unientradaescprod, unicontasapagar,
  unifornecedores, unibanco,  unibackup, shellapi, unirelvendas;

{$R *.DFM}




function EnDecryptString(StrValue : String; Chave: Word) : String;
var
I: Integer;
OutValue : String;
begin
OutValue := '';
for I := 1 to Length(StrValue) do
OutValue := OutValue + char(Not(ord(StrValue[I])-Chave));
Result := OutValue;
end;

procedure Tfrmpri.BitBtn1Click(Sender: TObject);
begin
Application.CreateForm(Tfrmprodutos,frmprodutos);
frmprodutos.showmodal;
end;

procedure Tfrmpri.BitBtn3Click(Sender: TObject);
begin


Application.CreateForm(Tfrmclientes,frmclientes);
frmclientes.showmodal;

end;

procedure Tfrmpri.BitBtn4Click(Sender: TObject);
begin
Application.CreateForm(Tfrmformapgto,frmformapgto);
frmformapgto.showmodal;
end;

procedure Tfrmpri.BitBtn2Click(Sender: TObject);
begin
Application.CreateForm(Tfrmentrada,frmentrada);
frmentrada.showmodal;

end;

procedure Tfrmpri.BitBtn6Click(Sender: TObject);
begin
Application.CreateForm(Tfrmvendedor,frmvendedor);
frmvendedor.showmodal;
end;

procedure Tfrmpri.BitBtn5Click(Sender: TObject);
begin
Application.CreateForm(Tfrmnotasemitidas,frmnotasemitidas);
frmnotasemitidas.showmodal;
end;

procedure Tfrmpri.BitBtn7Click(Sender: TObject);
begin
Application.CreateForm(Tfrmpgtodeconta,frmpgtodeconta);
frmpgtodeconta.showmodal;

end;

procedure Tfrmpri.BitBtn8Click(Sender: TObject);
begin
Application.CreateForm(Tfrmviscaixa,frmviscaixa);
frmviscaixa.showmodal;

end;

procedure Tfrmpri.BitBtn9Click(Sender: TObject);
begin
Application.CreateForm(Tfrmempresa,frmempresa);
frmempresa.showmodal;

end;

procedure Tfrmpri.editsenhaKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
With dm2.sqlvendedor do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from vendedor  where senha = "' +editsenha.text +'"  ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;

//if (editsenha.Text = EnDecryptString(dm2.sqlvendedorSenha.AsString,236)) and (editsenha.Text <> '') and (dm2.sqlvendedorAdm.AsString = 'S') then
if (editsenha.Text = dm2.sqlvendedorSenha.AsString) and (editsenha.Text <> '') and (dm2.sqlvendedorAdm.AsString = 'S') then

begin
 ToolBar1.Visible:= true;
 ToolBar2.Visible:= true;
  panel1.Visible:= true;
 editsenha.text:= '';
 editsenha.Visible:= false;
 Label1.Visible := false;
 editvendedor.Text := dm2.sqlvendedorvendedor.text;
end else begin
ShowMessage('Senha N�o Confere ou N�o Autorizado');
end;

end;
    end;
procedure Tfrmpri.BitBtn10Click(Sender: TObject);
begin
Application.CreateForm(Tfrmcontasapagar, frmcontasapagar);
frmcontasapagar.ShowModal;
end;

procedure Tfrmpri.BitBtn11Click(Sender: TObject);
var local :string;
begin
  local := ExtractFilePath(Application.ExeName )+'vendas.exe' ;
WinExec(Pchar(local), SW_SHOWNORMAL)

//Winexec(Pchar(ExtractFilePath(Application.ExeName ))+'\',SW_SHOWNORMAL);

end;

procedure Tfrmpri.BitBtn13Click(Sender: TObject);
var local2 :string;
begin
  local2 := ExtractFilePath(Application.ExeName )+'caixa.exe' ;
WinExec(Pchar(local2), SW_SHOWNORMAL)
//Winexec('C:\sistock\caixa.exe',SW_SHOWNORMAL);
end;

procedure Tfrmpri.BitBtn12Click(Sender: TObject);
begin
Application.createform(TFRmfornecedor, frmfornecedor);
frmfornecedor.ShowModal;
end;

procedure Tfrmpri.BitBtn14Click(Sender: TObject);
begin
 Application.createform(TFRmrelvendas, frmrelvendas);
 frmrelvendas.ShowModal;

end;

procedure Tfrmpri.BitBtn15Click(Sender: TObject);
begin
Application.CreateForm(Tfrmpedidos,frmpedidos);
frmpedidos.showmodal;
end;

procedure Tfrmpri.BitBtn16Click(Sender: TObject);
begin
Application.CreateForm(Tfrmpatrimonio,frmpatrimonio);
frmpatrimonio.showmodal;
end;

procedure Tfrmpri.FormPaint(Sender: TObject);

var
  altura, coluna: Word;
begin
  altura := (ClientHeight + 255) div 256;
  for coluna := 0 to 255 do
    with Canvas do
    begin
      Brush.Color := RGB(coluna, 180, 5); { Modifique para obter cores diferentes }
     FillRect(Rect(0, coluna * altura, ClientWidth, (coluna + 1) * altura)) ;
   end;
end;

procedure Tfrmpri.FormResize(Sender: TObject);
begin
invalidate;
end;

procedure Tfrmpri.FormCreate(Sender: TObject);
begin
editvendedor.Text := dm2.sqlvendedorvendedor.text;
StatusBar1.Panels[0].Text:= 'Vendedor: '+dm2.sqlvendedorvendedor.text;

//Image1.Picture.LoadFromFile('empresa.bmp');
Image1.Left := (Self.Width - Image1.Width) div 2;
Image1.Top := (Self.Height - Image1.Height ) div 2;

editsenha.Left := (Self.Width - editsenha.Width) div 2;
editsenha.Top := (Self.Height - editsenha.Height ) div 2;
editsenha.Top := 275;

Label1.Left := (Self.Width - Label1.Width) div 2;
Label1.Top := (Self.Height - Label1.Height ) div 2;
Label1.Top := 260;

panel1.Left := (Self.Width - panel1.Width) div 2;
panel1.Top := (Self.Height - panel1.Height ) div 2;
panel1.Top := 10;

end;




procedure Tfrmpri.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if MessageDlg ( 'Deseja fazer o Backup do Banco de dados?',
  mtConfirmation, [mbok, mbCancel], 0) = idok then
  begin

  Application.CreateForm(Tfrmbackup, frmbackup);
frmbackup.ShowModal;
  end
  else
  begin
   Canclose:=true;


      end;
end;

end.
