unit uninaocadastrado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  Tfrmnaocadastrado = class(TForm)
    Timer1: TTimer;
    Label1: TLabel;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmnaocadastrado: Tfrmnaocadastrado;

implementation

{$R *.dfm}

procedure Tfrmnaocadastrado.Timer1Timer(Sender: TObject);
begin
   if Timer1.Interval = 3000 then
   begin
   close;
   end;
end;

end.