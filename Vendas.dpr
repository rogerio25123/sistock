program Vendas;



uses
  Forms,
  univendass in 'univendass.pas' {frmprivendas},
  unidmvendas in 'unidmvendas.pas' {dm: TDataModule},
  uniescproduto in 'uniescproduto.pas' {frmescprodutovendas},
  unirelorcamento in 'unirelorcamento.pas' {frmrelorcamento},
  univendasbanco in 'univendasbanco.pas' {frmbancoa},
  uninaocadastrado in 'uninaocadastrado.pas' {frmnaocadastrado},
  uniimprimirvendas in 'uniimprimirvendas.pas' {frmimprimirvendas},
  unifecharvendas in 'unifecharvendas.pas' {frmfecharvendas},
  uniescclientevendas in 'uniescclientevendas.pas' {frmescclientes},
  uniimprimirvendas2 in 'uniimprimirvendas2.pas' {frmimprimirvendas2},
  unilocacao in 'unilocacao.pas' {frmlocacao},
  unifechalocacao in 'unifechalocacao.pas' {frmfecharlocacao},
  unilocacaoimprimir in 'unilocacaoimprimir.pas' {frmlocacaoimprimir},
  unipgtodecontavendas in 'unipgtodecontavendas.pas' {frmpgtodecontavendas},
  unipgtoclientesvendas in 'unipgtoclientesvendas.pas' {frmpgtoclientesvendas},
  unialteradata in 'unialteradata.pas' {frmalterardata},
  unidevolucao in 'unidevolucao.pas' {frmdevolucao},
  unifechardevolucao in 'unifechardevolucao.pas' {frmfechardevolucao},
  unidevolucaoimprimir in 'unidevolucaoimprimir.pas' {frmdevolucaoimprimir},
  uniimprimirpgtoconta in 'uniimprimirpgtoconta.pas' {frmimprimirpgtoconta},
  unitroca in 'unitroca.pas' {frmtroca},
  unicontaspagasvendas in 'unicontaspagasvendas.pas' {frmcontaspagasvendas},
  uniescnotatroca in 'uniescnotatroca.pas' {frmescnotatroca},
  uniesctroca in 'uniesctroca.pas' {frmesctroca};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(Tfrmprivendas, frmprivendas);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.