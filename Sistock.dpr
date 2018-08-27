program Sistock;

uses
  Forms,
  Controls,
  SysUtils,
  unipri in 'unipri.pas' {frmpri},
  unilogin in 'unilogin.pas' {frmlogin},
  unidm in 'unidm.pas' {dm2: TDataModule},
  uniprodutos in 'uniprodutos.pas' {frmprodutos},
  Univendas in 'Univendas.pas',
  uniclientes in 'uniclientes.pas' {frmclientes},
  univendedor in 'univendedor.pas' {frmvendedor},
  uniformapgto in 'uniformapgto.pas' {frmformapgto},
  unientraestoque in 'unientraestoque.pas' {frmentrada},
  unientradaescprod in 'unientradaescprod.pas' {frmescproduto},
  uninotasemitidas in 'uninotasemitidas.pas' {frmnotasemitidas},
  univeritensentradas in 'univeritensentradas.pas' {frmveritensentrada},
  unipgtodeconta in 'unipgtodeconta.pas' {frmpgtodeconta},
  unipesqclientes in 'unipesqclientes.pas' {frmpgtoclientes},
  unipgtoveritens in 'unipgtoveritens.pas' {frmpgtoveritens},
  univiscaixa in 'univiscaixa.pas' {frmviscaixa},
  univeritenscaixa in 'univeritenscaixa.pas' {frmveritenscaixa},
  unipedidos in 'unipedidos.pas' {frmpedidos},
  unipatrimonio in 'unipatrimonio.pas' {frmpatrimonio},
  unirelpedidos in 'unirelpedidos.pas' {frmrelpedidos},
  uniempresa in 'uniempresa.pas' {frmempresa},
  unirelsaidas in 'unirelsaidas.pas' {frmrelsaidas},
  unicontasapagar in 'unicontasapagar.pas' {frmcontasapagar},
  unirelcontasapagar in 'unirelcontasapagar.pas' {frmrelcontasapagar},
  unifornecedores in 'unifornecedores.pas' {frmfornecedor},
  unirelprodutos in 'unirelprodutos.pas' {frmrelprodutos},
  unibanco in 'unibanco.pas' {frmbanco},
  unirelpgtoconta in 'unirelpgtoconta.pas' {frmrelpgtoconta},
  unibackup in 'unibackup.pas' {frmbackup},
  unicontaspagas in 'unicontaspagas.pas' {frmcontaspagas},
  unilistarentradas in 'unilistarentradas.pas' {frmlistarentradas},
  unirelvendas in 'unirelvendas.pas' {frmrelvendas};

{$R *.RES}

begin

   Application.Initialize;

  Application.CreateForm(TDM2, DM2);
  // Application.CreateForm(Tfrmlogin, frmlogin);
 
 // if FrmLogin.ShowModal = mrOk then //Caso o retorno da tela seja Ok

 //  begin

  //    FreeAndNil(FrmLogin); //Libera o form de Login da mem�ria

      Application.CreateForm(TFrmPri , FrmPri ); //Cria a janela main

      Application.Run; //Roda a aplica��o

 //  end

  // else //Caso o retorno da tela de Login seja mrCancel ent�o
       FreeAndNil(FrmLogin) ;
      Application.Terminate; //Encerra a aplica��o

end.

