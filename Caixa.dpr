program Caixa;

uses
  Forms,
  unicaixa in 'unicaixa.pas' {frmcaixa},
  unidmcaixa in 'unidmcaixa.pas' {dm: TDataModule},
  unifinalizarvendas in 'unifinalizarvendas.pas' {frmfinalizarvendas},
  unicaixacliente in 'unicaixacliente.pas' {frmpesqcliente},
  unicaixaveritens in 'unicaixaveritens.pas' {frmvercaixa},
  unirelnota in 'unirelnota.pas' {frmrelnota},
  unirelcaixa in 'unirelcaixa.pas' {frmrelcaixa};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(Tfrmcaixa, frmcaixa);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
