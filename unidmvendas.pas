unit unidmvendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ZAbstractRODataset, ZAbstractDataset, ZDataset, ZConnection,
  ZAbstractTable;

type
  Tdm = class(TDataModule)
    srcprodutos: TDataSource;
    srcitens: TDataSource;
    srcdadosvendas: TDataSource;
    srcempresa: TDataSource;
    srcempresatbl: TDataSource;
    srcsqldesconto: TDataSource;
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
    sqlitens: TZQuery;
    sqlitensregistro: TIntegerField;
    sqlitenscodvenda: TIntegerField;
    sqlitenscodprod: TIntegerField;
    sqlitensdescricao: TStringField;
    sqlitensunivenda: TStringField;
    sqlitensqtd: TFloatField;
    sqlitenspreco: TFloatField;
    sqlitensdesconto: TFloatField;
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
    sqlitenssoma: TZQuery;
    sqlitenssomasomatotal: TFloatField;
    sqlitensitens: TZQuery;
    sqlitensitenssomaitens: TLargeintField;
    sqlultimavenda: TZQuery;
    sqlultimavendaultimavenda: TLargeintField;
    sqltotaldesconto: TZQuery;
    sqltotaldescontototaldesconto: TFloatField;
    sqlitenstotal: TCurrencyField;
    tblempresa: TZTable;
    tblempresaregistro: TIntegerField;
    tblempresaempresa: TStringField;
    tblempresaendereco: TStringField;
    tblempresatelefone: TStringField;
    tblempresacnpjinscr: TStringField;
    tblempresaimagem: TBlobField;
    sqlempresa: TZQuery;
    sqlvendedor: TZQuery;
    sqlvendedorregistro: TIntegerField;
    sqlvendedorvendedor: TStringField;
    sqlvendedorsenha: TStringField;
    sqlvendedoradm: TStringField;
    srcbanco: TDataSource;
    tbbanco: TTable;
    tbbancoCodigo: TIntegerField;
    tbbancoHost: TStringField;
    tbbancoBanco: TStringField;
    tbbancoLogin: TStringField;
    tbbancoSenha: TStringField;
    sqlitensprint: TZQuery;
    sqldadosvendasprint: TZQuery;
    sqldadosvendasprintcodvenda: TIntegerField;
    sqldadosvendasprintdata: TDateField;
    sqldadosvendasprinthoras: TTimeField;
    sqldadosvendasprintcodcli: TIntegerField;
    sqldadosvendasprintcliente: TStringField;
    sqldadosvendasprinttotal: TFloatField;
    sqldadosvendasprinttotalitens: TIntegerField;
    sqldadosvendasprintformapgto: TStringField;
    sqldadosvendasprintlocalentrega: TStringField;
    sqldadosvendasprintvendedor: TStringField;
    sqldadosvendasprintsituacao: TStringField;
    sqlitensprintregistro: TIntegerField;
    sqlitensprintcodvenda: TIntegerField;
    sqlitensprintcodprod: TIntegerField;
    sqlitensprintdescricao: TStringField;
    sqlitensprintunivenda: TStringField;
    sqlitensprintqtd: TFloatField;
    sqlitensprintpreco: TFloatField;
    sqlitensprintdesconto: TFloatField;
    DataSource1: TDataSource;
    sqlitensprinttotal: TCurrencyField;
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
    srcclientes: TDataSource;
    sqldadosvendasprintdesconto: TFloatField;
    sqldadosvendasprintsubtotal: TFloatField;
    tblempresacidade: TStringField;
    tblempresaimpressora: TStringField;
    sqldadoslocacao: TZQuery;
    IntegerField1: TIntegerField;
    DateField1: TDateField;
    TimeField1: TTimeField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    FloatField1: TFloatField;
    IntegerField3: TIntegerField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    sqlultimalocacao: TZQuery;
    sqlitenslocacao: TZQuery;
    srcitenslocacao: TDataSource;
    sqlultimalocacaoultimalocacao: TLargeintField;
    sqlitenssomalocacao: TZQuery;
    sqlitenssomalocacaosomatotallocacao: TFloatField;
    sqlitensitenslocacao: TZQuery;
    sqlitensitenslocacaosomaitenslocacao: TLargeintField;
    sqlprodutosprecolocacao: TFloatField;
    sqlitenslocacaototal: TCurrencyField;
    sqlitenslocacaoregistro: TIntegerField;
    sqlitenslocacaocodvenda: TIntegerField;
    sqlitenslocacaocodprod: TIntegerField;
    sqlitenslocacaodescricao: TStringField;
    sqlitenslocacaounivenda: TStringField;
    sqlitenslocacaoqtd: TFloatField;
    sqlitenslocacaopreco: TFloatField;
    sqlitenslocacaodesconto: TFloatField;
    sqlitenslocacaoprint: TZQuery;
    sqldadoslocacaoprint: TZQuery;
    sqlclientesdebitolocacao: TFloatField;
    sqlprodutoslocado: TStringField;
    sqlitenslocacaoprinttotal: TCurrencyField;
    sqldadoslocacaoprintcodvenda: TIntegerField;
    sqldadoslocacaoprintdata: TDateField;
    sqldadoslocacaoprinthoras: TTimeField;
    sqldadoslocacaoprintcodcli: TIntegerField;
    sqldadoslocacaoprintcliente: TStringField;
    sqldadoslocacaoprinttotal: TFloatField;
    sqldadoslocacaoprinttotalitens: TIntegerField;
    sqldadoslocacaoprintformapgto: TStringField;
    sqldadoslocacaoprintlocalentrega: TStringField;
    sqldadoslocacaoprintvendedor: TStringField;
    sqldadoslocacaoprintsituacao: TStringField;
    sqldadoslocacaoprintdesconto: TFloatField;
    sqldadoslocacaoprintsubtotal: TFloatField;
    sqlitenslocacaoprintregistro: TIntegerField;
    sqlitenslocacaoprintcodvenda: TIntegerField;
    sqlitenslocacaoprintcodprod: TIntegerField;
    sqlitenslocacaoprintdescricao: TStringField;
    sqlitenslocacaoprintunivenda: TStringField;
    sqlitenslocacaoprintqtd: TFloatField;
    sqlitenslocacaoprintpreco: TFloatField;
    sqlitenslocacaoprintdesconto: TFloatField;
    srcpgtodecliente: TDataSource;
    sqlpgtodecliente: TZQuery;
    sqlpgtodeclientecodpgto: TIntegerField;
    sqlpgtodeclientedata: TDateField;
    sqlpgtodeclientecodcli: TIntegerField;
    sqlpgtodeclientecliente: TStringField;
    sqlpgtodeclientetotal: TFloatField;
    sqlpgtodeclientestatus: TStringField;
    sqlpgtodeclienteformapgto: TStringField;
    srcformapgto: TDataSource;
    sqlformapgto: TZQuery;
    sqlformapgtoregistro: TIntegerField;
    sqlformapgtoformapgto: TStringField;
    sqlformapgtoprazo: TStringField;
    sqlultimopgto: TZQuery;
    sqlultimopgtoultimopgto: TLargeintField;
    srcdadosentrada: TDataSource;
    sqldadosentrada: TZQuery;
    sqldadosentradacodvenda: TIntegerField;
    sqldadosentradadata: TDateField;
    sqldadosentradahoras: TStringField;
    sqldadosentradatotal: TFloatField;
    sqldadosentradatotalitens: TIntegerField;
    sqldadosentradasituacao: TStringField;
    sqldadosentradavendedor: TStringField;
    sqldadosentradadescricao: TStringField;
    sqlitenslocacaodtdevolucao: TDateField;
    sqlitenslocacaoprintdtdevolucao: TDateField;
    sqlitensdevolucao: TZQuery;
    srcitensdevolucao: TDataSource;
    sqlitensdevolucaoregistro: TIntegerField;
    sqlitensdevolucaocodvenda: TIntegerField;
    sqlitensdevolucaocodprod: TIntegerField;
    sqlitensdevolucaodescricao: TStringField;
    sqlitensdevolucaounivenda: TStringField;
    sqlitensdevolucaoqtd: TFloatField;
    sqlitensdevolucaopreco: TFloatField;
    sqlitensdevolucaodesconto: TFloatField;
    sqlitensdevolucaodtdevolucao: TDateField;
    sqlitensdevolucaodtdevolvido: TDateField;
    sqlitensdevolucaoqtddias: TIntegerField;
    sqlitensdevolucaojuros: TFloatField;
    sqlitensdevolucaocheck: TStringField;
    sqlitensdevolucaocodvenda_1: TIntegerField;
    sqlitensdevolucaodata: TDateField;
    sqlitensdevolucaohoras: TTimeField;
    sqlitensdevolucaocodcli: TIntegerField;
    sqlitensdevolucaocliente: TStringField;
    sqlitensdevolucaototal: TFloatField;
    sqlitensdevolucaototalitens: TIntegerField;
    sqlitensdevolucaoformapgto: TStringField;
    sqlitensdevolucaolocalentrega: TStringField;
    sqlitensdevolucaovendedor: TStringField;
    sqlitensdevolucaosituacao: TStringField;
    sqlitensdevolucaodesconto_1: TFloatField;
    sqlitensdevolucaosubtotal: TFloatField;
    sqlitenslocacaodevolvido: TStringField;
    sqlitensdevolucaodevolvido: TStringField;
    sqlitenslocacaodtdevolvido: TDateField;
    sqlitenslocacaoprintdevolvido: TStringField;
    sqlitenslocacaoprintdtdevolvido: TDateField;
    sqlitenslocacaoprintqtddias: TIntegerField;
    sqlitenslocacaoprintjuros: TFloatField;
    sqlitenslocacaoqtddias: TIntegerField;
    sqlitenslocacaojuros: TFloatField;
    sqltotaljurosdevolucao: TZQuery;
    sqltotaljurosdevolucaototaljuros: TFloatField;
    sqlclientescpf: TStringField;
    sqlclientestipocliente: TStringField;
    sqldadostroca: TZQuery;
    sqlitenstrocaentrada: TZQuery;
    sqlitenstrocasaida: TZQuery;
    sqlultimatroca: TZQuery;
    sqldadostrocacodtroca: TIntegerField;
    sqldadostrocadata: TDateField;
    sqldadostrocaqtde: TFloatField;
    sqldadostrocaqtds: TFloatField;
    sqldadostrocatotale: TFloatField;
    sqldadostrocatotals: TFloatField;
    sqldadostrocadiferenca: TFloatField;
    sqlultimatrocaultimatroca: TLargeintField;
    srctrocaentrada: TDataSource;
    srctrocasaida: TDataSource;
    sqlitenstrocaentradaId: TIntegerField;
    sqlitenstrocaentradacodtroca: TIntegerField;
    sqlitenstrocaentradacodproduto: TIntegerField;
    sqlitenstrocaentradaqtd: TFloatField;
    sqlitenstrocaentradaund: TStringField;
    sqlitenstrocaentradaproduto: TStringField;
    sqlitenstrocaentradapreco: TFloatField;
    sqlitenstrocasaidaId: TIntegerField;
    sqlitenstrocasaidacodtroca: TIntegerField;
    sqlitenstrocasaidacodproduto: TIntegerField;
    sqlitenstrocasaidaqtd: TFloatField;
    sqlitenstrocasaidaund: TStringField;
    sqlitenstrocasaidaproduto: TStringField;
    sqlitenstrocasaidapreco: TFloatField;
    sqlescnota: TZQuery;
    sqlescnotacodvenda: TIntegerField;
    sqlescnotadata: TDateField;
    sqlescnotahoras: TTimeField;
    sqlescnotacodcli: TIntegerField;
    sqlescnotacliente: TStringField;
    sqlescnotatotal: TFloatField;
    sqlescnotatotalitens: TIntegerField;
    sqlescnotaformapgto: TStringField;
    sqlescnotalocalentrega: TStringField;
    sqlescnotavendedor: TStringField;
    sqlescnotasituacao: TStringField;
    sqlescnotadesconto: TFloatField;
    sqlescnotasubtotal: TFloatField;
    sqlescnotacodcli2: TIntegerField;
    sqlitenstroca: TZQuery;
    sqlitenstrocaregistro: TIntegerField;
    sqlitenstrocacodvenda: TIntegerField;
    sqlitenstrocacodprod: TIntegerField;
    sqlitenstrocadescricao: TStringField;
    sqlitenstrocaunivenda: TStringField;
    sqlitenstrocaqtd: TFloatField;
    sqlitenstrocapreco: TFloatField;
    sqlitenstrocadesconto: TFloatField;
    sqlitenstrocaTotal: TFloatField;
    sqlprodutospreco2: TFloatField;
    sqlprodutospreco3: TFloatField;
    procedure sqlitenscopyCalcFields(DataSet: TDataSet);
    procedure sqlitensCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure sqlitensprintCalcFields(DataSet: TDataSet);
    procedure sqlitenslocacaoCalcFields(DataSet: TDataSet);
    procedure sqlitenslocacaoprintCalcFields(DataSet: TDataSet);
    procedure sqlitenstrocaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation  



{$R *.DFM}

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

procedure Tdm.sqlitenscopyCalcFields(DataSet: TDataSet);
begin
//dm.sqlitensTotal.Value:= dm.sqlitensQtd.value * dm.sqlitensPreco.Value;
end;

procedure Tdm.sqlitensCalcFields(DataSet: TDataSet);
begin
dm.sqlitensTotal.Value:= dm.sqlitensQtd.value * dm.sqlitensPreco.Value;
end;

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
tbbanco.DatabaseName := ExtractFilePath(Application.ExeName );
tbbanco.TableName:= 'banco.db';
tbbanco.Open;


conexao.Database := dm.tbbancoBanco.AsString;
conexao.HostName := tbbancoHost.AsString;
conexao.User := tbbancoLogin.AsString;
conexao.Password := tbbancosenha.AsString;
conexao.Connected := true;

sqlempresa.Active :=  true;
tblempresa.Active :=  true;
end;

procedure Tdm.sqlitensprintCalcFields(DataSet: TDataSet);
begin
dm.sqlitensprinttotal.Value:= dm.sqlitensprintQtd.value * dm.sqlitensPreco.Value;
end;

procedure Tdm.sqlitenslocacaoCalcFields(DataSet: TDataSet);
begin
dm.sqlitenslocacaototal.Value:= dm.sqlitenslocacaoqtd.value * dm.sqlitenslocacaoPreco.Value;
end;

procedure Tdm.sqlitenslocacaoprintCalcFields(DataSet: TDataSet);
begin
dm.sqlitenslocacaoprinttotal.Value:= dm.sqlitenslocacaoprintqtd.value * dm.sqlitenslocacaoprintpreco.Value;
end;

procedure Tdm.sqlitenstrocaCalcFields(DataSet: TDataSet);
begin
dm.sqlitenstrocaTotal.Value:= dm.sqlitenstrocaQtd.value * dm.sqlitenstrocaPreco.Value;
end;

end.
