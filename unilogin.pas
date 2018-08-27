unit unilogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  Tfrmlogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btnsair: TBitBtn;
    Image1: TImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  tentativas: Smallint;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmlogin: Tfrmlogin;

implementation

uses unidm;

{$R *.dfm}

procedure Tfrmlogin.BitBtn1Click(Sender: TObject);
begin
   if (edtUsuario.Text = '') then //Verifica se o campo "Usuário" foi preenchido

   begin

      Messagedlg('O campo "Usuário" deve ser preenchido!', mtInformation, [mbOk], 0);

      if edtUsuario.CanFocus then

         edtUsuario.SetFocus;

      Exit;

   end;

   if (edtSenha.Text = '') then //Verifica se o campo "Senha" foi preenchido

   begin

      Messagedlg('O campo "Senha" deve ser preenchido!', mtInformation, [mbOk], 0);

      if edtSenha.CanFocus then

         edtSenha.SetFocus;

      Exit;

   end;
      With dm2.sqlvendedor do
  Begin
  Close;
  Sql.Clear;
  Sql.Add('select * from vendedor  where senha = "' +edtSenha.text +'" and vendedor = "' +edtUsuario.text +'" ');
   //Sql.Add(' values ( "' + edit2.text +'", "' + edit3.text +'", "' + edit4.text +'") ');
  open;

   // End
 // Except
 // Showmessage('veja se os campos estao corretamente preenchidos');
  End;


     if (edtSenha.Text = dm2.sqlvendedorSenha.AsString) and (edtSenha.Text <> '') and (dm2.sqlvendedorAdm.AsString = 'S') then

      ModalResult := mrOk


   else //Caso o login não seja válido então

   begin

      inc(tentativas); //Incrementa em 1 o valor da variável tentativas

      if tentativas < 3 then

      begin

         MessageDlg(Format('Tentativa %d de 3', [tentativas]), mtError, [mbOk], 0);

         if edtSenha.CanFocus then

            edtSenha.SetFocus;

      end

      else

      begin

         MessageDlg(Format('%dª tentativa de acesso ao sistema.', 

            [tentativas]) + #13 + 'A aplicação será fechada!', mtError,                [mbOk], 0);

       ModalResult := mrCancel;

      end;

   end;

end;









procedure Tfrmlogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

end.
