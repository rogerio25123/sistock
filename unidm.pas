unit unidm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ZAbstractRODataset, ZAbstractDataset, ZDataset, ZConnection,
  ZAbstractTable;

type
  Tdm2 = class(TDataModule)
    srcprodutos: TDataSource;
    srcclientes: TDataSource;
    srcvendedor: TDataSource;
    srccaixa: TDataSource;
    srcformapgto: TDataSource;
    srcdadosentrada: TDataSource;
    srcitensentrada: TDataSource;
    srcpgtodecliente: TDataSource;
    srcdadosvendas: TDataSource;
    srcitens: TDataSource;
    srcpedidos: TDataSource;
    srcempresa: TDataSource;
    srcempresatbl: TDataSource;
    srccontasapagar: TDataSource;
    srcfornecedores: TDataSource;
    conexao: TZConnection;
    sqlprodutos: TZQuery;
    sqlprodutoscodprod: TIntegerField;
    sqlprodutosbarra: TStringField;
    sqlprodutosgrupo: TStringField;
    sqlprodutosdescricao: TStringField;
    sqlprodutosunivenda: TStringField;
    sqlprodutosmarca: TStringField;
    sqlprodutosestoque: TFloatField;
    sqlprodutosprecocusto: TFloatField;
    sqlprodutosaddperc: TFloatField;
    sqlprodutosprecovenda: TFloatField;
    sqlprodutosestoqueminimo: TFloatField;
    sqlprodutoscodforn: TIntegerField;
    sqlprodutosdesconto: TFloatField;
    sqlprodutos2: TZQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    IntegerField2: TIntegerField;
    FloatField6: TFloatField;
    sqlultimousu: TZQuery;
    sqlultimousuultimamatricula: TLargeintField;
    tbbanco: TTable;
    tbbancoCodigo: TIntegerField;
    tbbancoHost: TStringField;
    tbbancoBanco: TStringField;
    tbbancoLogin: TStringField;
    tbbancoSenha: TStringField;
    srcbanco: TDataSource;
    sqlclientes: TZQuery;
    sqlclientescodcli: TIntegerField;
    sqlclientescliente: TStringField;
    sqlclientesendereco: TStringField;
    sqlclientestelefone: TStringField;
    sqlclientessaldo: TFloatField;
    sqlclientesrg: TStringField;
    sqlclientesemail: TStringField;
    sqlclientesdatanasc: TStringField;
    sqlclientesfantasia: TStringField;
    sqlclientescargo: TStringField;
    sqlclienteslimite: TFloatField;
    sqlclientesbloqueio: TStringField;
    sqlultimocli: TZQuery;
    sqlultimocliultimocli: TLargeintField;
    sqlvendedor: TZQuery;
    sqlvendedorregistro: TIntegerField;
    sqlvendedorvendedor: TStringField;
    sqlvendedorsenha: TStringField;
    sqlvendedoradm: TStringField;
    sqlpedidos: TZQuery;
    sqlpedidoscodprod: TIntegerField;
    sqlpedidosbarra: TStringField;
    sqlpedidosgrupo: TStringField;
    sqlpedidosdescricao: TStringField;
    sqlpedidosunivenda: TStringField;
    sqlpedidosmarca: TStringField;
    sqlpedidosestoque: TFloatField;
    sqlpedidosprecocusto: TFloatField;
    sqlpedidosaddperc: TFloatField;
    sqlpedidosprecovenda: TFloatField;
    sqlpedidosestoqueminimo: TFloatField;
    sqlpedidoscodforn: TIntegerField;
    sqlpedidosdesconto: TFloatField;
    sqldadosvendas: TZQuery;
    sqldadosvendascodvenda: TIntegerField;
    sqldadosvendasdata: TDateField;
    sqldadosvendashoras: TTimeField;
    sqldadosvendascodcli: TIntegerField;
    sqldadosvendascliente: TStringField;
    sqldadosvendastotal: TFloatField;
    sqldadosvendastotalitens: TIntegerField;
    sqldadosvendasformapgto: TStringField;
    sqldadosvendaslocalentrega: TStringField;
    sqldadosvendasvendedor: TStringField;
    sqldadosvendassituacao: TStringField;
    sqlcontasapagar: TZQuery;
    sqlcontasapagarcodigo: TIntegerField;
    sqlcontasapagarvencimento: TDateField;
    sqlcontasapagardescricao: TStringField;
    sqlcontasapagarvalor: TFloatField;
    sqlcontasapagarboleto: TStringField;
    sqlcontasapagarsituacao: TStringField;
    sqlultimopgto: TZQuery;
    sqlultimopgtoultimopgto: TLargeintField;
    sqlformapgto: TZQuery;
    sqlformapgtoregistro: TIntegerField;
    sqlformapgtoformapgto: TStringField;
    sqlformapgtoprazo: TStringField;
    sqlcaixa: TZQuery;
    sqlcaixacodvenda: TIntegerField;
    sqlcaixadata: TDateField;
    sqlcaixahoras: TTimeField;
    sqlcaixacodcli: TIntegerField;
    sqlcaixacliente: TStringField;
    sqlcaixatotal: TFloatField;
    sqlcaixatotalitens: TIntegerField;
    sqlcaixaformapgto: TStringField;
    sqlcaixalocalentrega: TStringField;
    sqlcaixavendedor: TStringField;
    sqlcaixasituacao: TStringField;
    sqlcaixavencimento: TDateField;
    sqlitenssomaentrada: TZQuery;
    sqlitenssomaentradasomatotal: TFloatField;
    sqldadosentrada: TZQuery;
    sqldadosentradacodvenda: TIntegerField;
    sqldadosentradadata: TDateField;
    sqldadosentradahoras: TStringField;
    sqldadosentradatotal: TFloatField;
    sqldadosentradatotalitens: TIntegerField;
    sqldadosentradasituacao: TStringField;
    sqldadosentradavendedor: TStringField;
    sqldadosentradadescricao: TStringField;
    sqlpgtodecliente: TZQuery;
    sqlpgtodeclientecodpgto: TIntegerField;
    sqlpgtodeclientedata: TDateField;
    sqlpgtodeclientecodcli: TIntegerField;
    sqlpgtodeclientecliente: TStringField;
    sqlpgtodeclientetotal: TFloatField;
    sqlpgtodeclientestatus: TStringField;
    sqlultimavenda: TZQuery;
    sqlultimavendaultimavenda: TLargeintField;
    sqltotalcaixa: TZQuery;
    sqltotalcaixatotalcaixa: TFloatField;
    sqlcaixaaprazo: TZQuery;
    sqlcaixaaprazototalaprazo: TFloatField;
    sqltotalretirada: TZQuery;
    sqltotalretiradatotalretirada: TFloatField;
    sqlfornecedores: TZQuery;
    sqlfornecedorescodigo: TIntegerField;
    sqlfornecedoresfornecedor: TStringField;
    sqlfornecedoresendereco: TStringField;
    sqlfornecedorestelefone: TStringField;
    sqlfornecedorescnpj: TStringField;
    sqlfornecedoresoutros: TStringField;
    sqlitensentrada: TZQuery;
    sqlitensentradaregistro: TIntegerField;
    sqlitensentradacodvenda: TIntegerField;
    sqlitensentradacodprod: TIntegerField;
    sqlitensentradadescricao: TStringField;
    sqlitensentradaunivenda: TStringField;
    sqlitensentradaqtd: TFloatField;
    sqlitensentradapreco: TFloatField;
    sqlitenscountentrada: TZQuery;
    sqlitenscountentradasomaitens: TLargeintField;
    sqlultimaentrada: TZQuery;
    sqlultimaentradaultimavenda: TLargeintField;
    sqlempresa: TZQuery;
    sqlempresaregistro: TIntegerField;
    sqlempresaempresa: TStringField;
    sqlempresaendereco: TStringField;
    sqlempresatelefone: TStringField;
    sqlempresacnpjinscr: TStringField;
    sqlempresaimagem: TBlobField;
    sqlitens: TZQuery;
    sqlitensregistro: TIntegerField;
    sqlitenscodvenda: TIntegerField;
    sqlitenscodprod: TIntegerField;
    sqlitensdescricao: TStringField;
    sqlitensunivenda: TStringField;
    sqlitensqtd: TFloatField;
    sqlitenspreco: TFloatField;
    sqlitensdesconto: TFloatField;
    tblempresa: TZTable;
    tblempresaregistro: TIntegerField;
    tblempresaempresa: TStringField;
    tblempresaendereco: TStringField;
    tblempresatelefone: TStringField;
    tblempresacnpjinscr: TStringField;
    tblempresaimagem: TBlobField;
    sqlprodutosprecolocacao: TFloatField;
    sqlpgtodeclienteformapgto: TStringField;
    sqlclientesdebitolocacao: TFloatField;
    sqlpgtodeclientecodcli2: TIntegerField;
    sqlpgtodeclientevendedor: TStringField;
    sqlclientescpf: TStringField;
    sqlclientestipocliente: TStringField;
    sqlitensentradaTotal: TFloatField;
    sqlprodutospreco2: TFloatField;
    sqlprodutospreco3: TFloatField;
    sqlitensentradapreco2: TFloatField;
    sqlitensentradapreco3: TFloatField;
    procedure sqlcaixaCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure sqlitensentradaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm2: Tdm2;

implementation

{$R *.DFM}

procedure Tdm2.sqlcaixaCalcFields(DataSet: TDataSet);
begin
if sqlcaixaCodCli.value > 0 then begin
sqlcaixavencimento.Value:=sqlcaixaData.Value + 30 ;
end;
end;

procedure Tdm2.DataModuleCreate(Sender: TObject);
begin
  //editlocal.text := ExtractFilePath(Application.ExeName )+'salvar.bat' ;
//WinExec(Pchar(editlocal.Text), 0)


tbbanco.DatabaseName := ExtractFilePath(Application.ExeName );
tbbanco.TableName:='banco.db'  ;
tbbanco.Open;


conexao.Database := tbbancoBanco.AsString;
conexao.HostName := tbbancoHost.AsString;
conexao.User := tbbancoLogin.AsString;
conexao.Password := tbbancosenha.AsString;
conexao.Connected := true;

sqlprodutos.Active:= true;
sqlprodutos2.Active:= true;
sqlultimousu.Active:= true;
//sqlclientes.Active:= true;
sqlultimocli.Active:= true;
tblempresa.Active:= true;
sqlformapgto.Active:= true;
end;

procedure Tdm2.sqlitensentradaCalcFields(DataSet: TDataSet);
begin
sqlitensentradaTotal.Value :=  sqlitensentradaqtd.Value * sqlitensentradapreco.value;
end;

end.
