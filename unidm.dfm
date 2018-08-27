object dm2: Tdm2
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 302
  Top = 155
  Height = 605
  Width = 819
  object srcprodutos: TDataSource
    DataSet = sqlprodutos
    Left = 72
    Top = 64
  end
  object srcclientes: TDataSource
    DataSet = sqlclientes
    Left = 152
    Top = 184
  end
  object srcvendedor: TDataSource
    DataSet = sqlvendedor
    Left = 248
    Top = 56
  end
  object srccaixa: TDataSource
    DataSet = sqlcaixa
    Left = 256
    Top = 184
  end
  object srcformapgto: TDataSource
    DataSet = sqlformapgto
    Left = 152
    Top = 304
  end
  object srcdadosentrada: TDataSource
    DataSet = sqldadosentrada
    Left = 336
    Top = 120
  end
  object srcitensentrada: TDataSource
    DataSet = sqlitensentrada
    Left = 488
    Top = 200
  end
  object srcpgtodecliente: TDataSource
    DataSet = sqlpgtodecliente
    Left = 464
    Top = 64
  end
  object srcdadosvendas: TDataSource
    DataSet = sqldadosvendas
    Left = 24
    Top = 432
  end
  object srcitens: TDataSource
    DataSet = sqlitens
    Left = 728
    Top = 376
  end
  object srcpedidos: TDataSource
    DataSet = sqlpedidos
    Left = 16
    Top = 328
  end
  object srcempresa: TDataSource
    DataSet = sqlempresa
    Left = 728
    Top = 304
  end
  object srcempresatbl: TDataSource
    DataSet = tblempresa
    Left = 712
    Top = 80
  end
  object srccontasapagar: TDataSource
    DataSet = sqlcontasapagar
    Left = 208
    Top = 528
  end
  object srcfornecedores: TDataSource
    DataSet = sqlfornecedores
    Left = 320
    Top = 512
  end
  object conexao: TZConnection
    Protocol = 'mysql'
    Port = 3306
    Left = 40
    Top = 8
  end
  object sqlprodutos: TZQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT  * FROM Produtos')
    Params = <>
    Left = 16
    Top = 56
    object sqlprodutoscodprod: TIntegerField
      FieldName = 'codprod'
      Required = True
    end
    object sqlprodutosbarra: TStringField
      FieldName = 'barra'
      Size = 16
    end
    object sqlprodutosgrupo: TStringField
      FieldName = 'grupo'
      Size = 35
    end
    object sqlprodutosdescricao: TStringField
      FieldName = 'descricao'
      Size = 80
    end
    object sqlprodutosunivenda: TStringField
      FieldName = 'univenda'
      Size = 12
    end
    object sqlprodutosmarca: TStringField
      DisplayWidth = 15
      FieldName = 'marca'
      Size = 35
    end
    object sqlprodutosestoque: TFloatField
      FieldName = 'estoque'
    end
    object sqlprodutosprecocusto: TFloatField
      FieldName = 'precocusto'
      DisplayFormat = '0.00'
    end
    object sqlprodutosaddperc: TFloatField
      FieldName = 'addperc'
    end
    object sqlprodutosprecovenda: TFloatField
      FieldName = 'precovenda'
      DisplayFormat = '0.00'
    end
    object sqlprodutosestoqueminimo: TFloatField
      FieldName = 'estoqueminimo'
    end
    object sqlprodutoscodforn: TIntegerField
      FieldName = 'codforn'
    end
    object sqlprodutosdesconto: TFloatField
      FieldName = 'desconto'
      DisplayFormat = '0.00'
    end
    object sqlprodutosprecolocacao: TFloatField
      FieldName = 'precolocacao'
      DisplayFormat = '0.00'
    end
    object sqlprodutospreco2: TFloatField
      FieldName = 'preco2'
      ReadOnly = True
    end
    object sqlprodutospreco3: TFloatField
      FieldName = 'preco3'
      ReadOnly = True
    end
  end
  object sqlprodutos2: TZQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT  * FROM Produtos')
    Params = <>
    Left = 16
    Top = 112
    object IntegerField1: TIntegerField
      FieldName = 'codprod'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'barra'
      Size = 16
    end
    object StringField2: TStringField
      FieldName = 'grupo'
      Size = 35
    end
    object StringField3: TStringField
      FieldName = 'descricao'
      Size = 80
    end
    object StringField4: TStringField
      FieldName = 'univenda'
      Size = 12
    end
    object StringField5: TStringField
      FieldName = 'marca'
      Size = 35
    end
    object FloatField1: TFloatField
      FieldName = 'estoque'
    end
    object FloatField2: TFloatField
      FieldName = 'precocusto'
    end
    object FloatField3: TFloatField
      FieldName = 'addperc'
    end
    object FloatField4: TFloatField
      FieldName = 'precovenda'
    end
    object FloatField5: TFloatField
      FieldName = 'estoqueminimo'
    end
    object IntegerField2: TIntegerField
      FieldName = 'codforn'
    end
    object FloatField6: TFloatField
      FieldName = 'desconto'
    end
  end
  object sqlultimousu: TZQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT MAX( codprod + 1 ) ultimamatricula FROM produtos')
    Params = <>
    Left = 16
    Top = 168
    object sqlultimousuultimamatricula: TLargeintField
      FieldName = 'ultimamatricula'
      ReadOnly = True
    end
  end
  object tbbanco: TTable
    Left = 144
    Top = 8
    object tbbancoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tbbancoHost: TStringField
      FieldName = 'Host'
    end
    object tbbancoBanco: TStringField
      FieldName = 'Banco'
    end
    object tbbancoLogin: TStringField
      FieldName = 'Login'
    end
    object tbbancoSenha: TStringField
      FieldName = 'Senha'
    end
  end
  object srcbanco: TDataSource
    Left = 208
    Top = 8
  end
  object sqlclientes: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from clientes')
    Params = <>
    Left = 152
    Top = 136
    object sqlclientescodcli: TIntegerField
      FieldName = 'codcli'
      Required = True
    end
    object sqlclientescliente: TStringField
      FieldName = 'cliente'
      ReadOnly = True
      Size = 55
    end
    object sqlclientesendereco: TStringField
      FieldName = 'endereco'
      Size = 65
    end
    object sqlclientestelefone: TStringField
      FieldName = 'telefone'
    end
    object sqlclientessaldo: TFloatField
      FieldName = 'saldo'
      DisplayFormat = '0.00'
    end
    object sqlclientesrg: TStringField
      FieldName = 'rg'
      Size = 22
    end
    object sqlclientesemail: TStringField
      FieldName = 'email'
      Size = 35
    end
    object sqlclientesdatanasc: TStringField
      FieldName = 'datanasc'
      Size = 10
    end
    object sqlclientesfantasia: TStringField
      FieldName = 'fantasia'
      Size = 40
    end
    object sqlclientescargo: TStringField
      FieldName = 'cargo'
      Size = 35
    end
    object sqlclienteslimite: TFloatField
      FieldName = 'limite'
      DisplayFormat = '0.00'
    end
    object sqlclientesbloqueio: TStringField
      FieldName = 'bloqueio'
      Size = 1
    end
    object sqlclientesdebitolocacao: TFloatField
      FieldName = 'debitolocacao'
      DisplayFormat = '0.00'
    end
    object sqlclientescpf: TStringField
      FieldName = 'cpf'
      Size = 15
    end
    object sqlclientestipocliente: TStringField
      FieldName = 'tipocliente'
      Size = 1
    end
  end
  object sqlultimocli: TZQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT MAX( codcli + 1 ) ultimocli'
      'FROM clientes')
    Params = <>
    Left = 16
    Top = 224
    object sqlultimocliultimocli: TLargeintField
      FieldName = 'ultimocli'
      ReadOnly = True
    end
  end
  object sqlvendedor: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from vendedor')
    Params = <>
    Left = 248
    Top = 16
    object sqlvendedorregistro: TIntegerField
      FieldName = 'registro'
      Required = True
    end
    object sqlvendedorvendedor: TStringField
      FieldName = 'vendedor'
      Size = 30
    end
    object sqlvendedorsenha: TStringField
      FieldName = 'senha'
      Size = 12
    end
    object sqlvendedoradm: TStringField
      FieldName = 'adm'
      Size = 1
    end
  end
  object sqlpedidos: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from produtos')
    Params = <>
    Left = 16
    Top = 280
    object sqlpedidoscodprod: TIntegerField
      FieldName = 'codprod'
      Required = True
    end
    object sqlpedidosbarra: TStringField
      FieldName = 'barra'
      Size = 16
    end
    object sqlpedidosgrupo: TStringField
      FieldName = 'grupo'
      Size = 35
    end
    object sqlpedidosdescricao: TStringField
      FieldName = 'descricao'
      Size = 80
    end
    object sqlpedidosunivenda: TStringField
      FieldName = 'univenda'
      Size = 12
    end
    object sqlpedidosmarca: TStringField
      FieldName = 'marca'
      Size = 35
    end
    object sqlpedidosestoque: TFloatField
      FieldName = 'estoque'
    end
    object sqlpedidosprecocusto: TFloatField
      FieldName = 'precocusto'
    end
    object sqlpedidosaddperc: TFloatField
      FieldName = 'addperc'
    end
    object sqlpedidosprecovenda: TFloatField
      FieldName = 'precovenda'
    end
    object sqlpedidosestoqueminimo: TFloatField
      FieldName = 'estoqueminimo'
    end
    object sqlpedidoscodforn: TIntegerField
      FieldName = 'codforn'
    end
    object sqlpedidosdesconto: TFloatField
      FieldName = 'desconto'
    end
  end
  object sqldadosvendas: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from dadosvendas')
    Params = <>
    Left = 24
    Top = 376
    object sqldadosvendascodvenda: TIntegerField
      FieldName = 'codvenda'
      Required = True
    end
    object sqldadosvendasdata: TDateField
      DisplayLabel = 'Data'
      FieldName = 'data'
    end
    object sqldadosvendashoras: TTimeField
      DisplayLabel = 'Horas'
      FieldName = 'horas'
    end
    object sqldadosvendascodcli: TIntegerField
      FieldName = 'codcli'
    end
    object sqldadosvendascliente: TStringField
      FieldName = 'cliente'
      Size = 65
    end
    object sqldadosvendastotal: TFloatField
      FieldName = 'total'
      DisplayFormat = '0.00'
    end
    object sqldadosvendastotalitens: TIntegerField
      FieldName = 'totalitens'
    end
    object sqldadosvendasformapgto: TStringField
      FieldName = 'formapgto'
      Size = 30
    end
    object sqldadosvendaslocalentrega: TStringField
      FieldName = 'localentrega'
      Size = 90
    end
    object sqldadosvendasvendedor: TStringField
      FieldName = 'vendedor'
      Size = 40
    end
    object sqldadosvendassituacao: TStringField
      DisplayLabel = 'Situacao'
      FieldName = 'situacao'
    end
  end
  object sqlcontasapagar: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from contasapagar')
    Params = <>
    Left = 200
    Top = 488
    object sqlcontasapagarcodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object sqlcontasapagarvencimento: TDateField
      FieldName = 'vencimento'
    end
    object sqlcontasapagardescricao: TStringField
      FieldName = 'descricao'
      Size = 65
    end
    object sqlcontasapagarvalor: TFloatField
      FieldName = 'valor'
      currency = True
    end
    object sqlcontasapagarboleto: TStringField
      FieldName = 'boleto'
      Size = 45
    end
    object sqlcontasapagarsituacao: TStringField
      FieldName = 'situacao'
      Size = 2
    end
  end
  object sqlultimopgto: TZQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT MAX( codpgto + 1 ) ultimopgto'
      'FROM pgtodecliente')
    Params = <>
    Left = 184
    Top = 360
    object sqlultimopgtoultimopgto: TLargeintField
      FieldName = 'ultimopgto'
      ReadOnly = True
    end
  end
  object sqlformapgto: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from formapgto')
    Params = <>
    Left = 152
    Top = 256
    object sqlformapgtoregistro: TIntegerField
      FieldName = 'registro'
      Required = True
    end
    object sqlformapgtoformapgto: TStringField
      FieldName = 'formapgto'
      Size = 30
    end
    object sqlformapgtoprazo: TStringField
      FieldName = 'prazo'
      Size = 3
    end
  end
  object sqlcaixa: TZQuery
    Connection = conexao
    OnCalcFields = sqlcaixaCalcFields
    SQL.Strings = (
      'select * from dadosvendas')
    Params = <>
    Left = 256
    Top = 136
    object sqlcaixacodvenda: TIntegerField
      FieldName = 'codvenda'
      Required = True
    end
    object sqlcaixadata: TDateField
      FieldName = 'data'
    end
    object sqlcaixahoras: TTimeField
      FieldName = 'horas'
    end
    object sqlcaixacodcli: TIntegerField
      FieldName = 'codcli'
    end
    object sqlcaixacliente: TStringField
      FieldName = 'cliente'
      Size = 65
    end
    object sqlcaixatotal: TFloatField
      FieldName = 'total'
      DisplayFormat = '0.00'
    end
    object sqlcaixatotalitens: TIntegerField
      FieldName = 'totalitens'
    end
    object sqlcaixaformapgto: TStringField
      FieldName = 'formapgto'
      Size = 30
    end
    object sqlcaixalocalentrega: TStringField
      FieldName = 'localentrega'
      Size = 90
    end
    object sqlcaixavendedor: TStringField
      FieldName = 'vendedor'
      Size = 40
    end
    object sqlcaixasituacao: TStringField
      FieldName = 'situacao'
    end
    object sqlcaixavencimento: TDateField
      FieldKind = fkCalculated
      FieldName = 'vencimento'
      Calculated = True
    end
  end
  object sqlitenssomaentrada: TZQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT sum( codvenda + 1 ) somatotal'
      'FROM itensentrada')
    Params = <>
    Left = 336
    Top = 8
    object sqlitenssomaentradasomatotal: TFloatField
      FieldName = 'somatotal'
      ReadOnly = True
    end
  end
  object sqldadosentrada: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from dadosentradas')
    Params = <>
    Left = 336
    Top = 72
    object sqldadosentradacodvenda: TIntegerField
      FieldName = 'codvenda'
      Required = True
    end
    object sqldadosentradadata: TDateField
      DisplayLabel = 'Data'
      FieldName = 'data'
    end
    object sqldadosentradahoras: TStringField
      DisplayLabel = 'Horas'
      FieldName = 'horas'
      Size = 15
    end
    object sqldadosentradatotal: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'total'
    end
    object sqldadosentradatotalitens: TIntegerField
      DisplayLabel = 'Totalitens'
      FieldName = 'totalitens'
    end
    object sqldadosentradasituacao: TStringField
      DisplayLabel = 'Situacao'
      FieldName = 'situacao'
    end
    object sqldadosentradavendedor: TStringField
      DisplayLabel = 'Vendedor'
      FieldName = 'vendedor'
    end
    object sqldadosentradadescricao: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'descricao'
      Size = 40
    end
  end
  object sqlpgtodecliente: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from pgtodecliente')
    Params = <>
    Left = 464
    Top = 8
    object sqlpgtodeclientecodpgto: TIntegerField
      FieldName = 'codpgto'
      Required = True
    end
    object sqlpgtodeclientedata: TDateField
      FieldName = 'data'
    end
    object sqlpgtodeclientecodcli: TIntegerField
      FieldName = 'codcli'
    end
    object sqlpgtodeclientecliente: TStringField
      FieldName = 'cliente'
      Size = 102
    end
    object sqlpgtodeclientetotal: TFloatField
      FieldName = 'total'
      DisplayFormat = '0.00'
    end
    object sqlpgtodeclientestatus: TStringField
      FieldName = 'status'
      Size = 1
    end
    object sqlpgtodeclienteformapgto: TStringField
      FieldName = 'formapgto'
      Size = 25
    end
    object sqlpgtodeclientecodcli2: TIntegerField
      FieldName = 'codcli2'
    end
    object sqlpgtodeclientevendedor: TStringField
      FieldName = 'vendedor'
      Size = 25
    end
  end
  object sqlultimavenda: TZQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT MAX( codvenda + 1 ) ultimavenda'
      'FROM dadosvendas')
    Params = <>
    Left = 288
    Top = 248
    object sqlultimavendaultimavenda: TLargeintField
      FieldName = 'ultimavenda'
      ReadOnly = True
    end
  end
  object sqltotalcaixa: TZQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT sum(total) totalcaixa  FROM dadosvendas')
    Params = <>
    Left = 296
    Top = 304
    object sqltotalcaixatotalcaixa: TFloatField
      FieldName = 'totalcaixa'
      ReadOnly = True
    end
  end
  object sqlcaixaaprazo: TZQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT sum(total) totalaprazo FROM dadosvendas')
    Params = <>
    Left = 304
    Top = 352
    object sqlcaixaaprazototalaprazo: TFloatField
      FieldName = 'totalaprazo'
      ReadOnly = True
    end
  end
  object sqltotalretirada: TZQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT sum(total) totalretirada FROM dadosvendas')
    Params = <>
    Left = 304
    Top = 400
    object sqltotalretiradatotalretirada: TFloatField
      FieldName = 'totalretirada'
      ReadOnly = True
    end
  end
  object sqlfornecedores: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from fornecedores')
    Params = <>
    Left = 304
    Top = 464
    object sqlfornecedorescodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object sqlfornecedoresfornecedor: TStringField
      FieldName = 'fornecedor'
      Size = 100
    end
    object sqlfornecedoresendereco: TStringField
      FieldName = 'endereco'
      Size = 65
    end
    object sqlfornecedorestelefone: TStringField
      FieldName = 'telefone'
      Size = 45
    end
    object sqlfornecedorescnpj: TStringField
      FieldName = 'cnpj'
      Size = 45
    end
    object sqlfornecedoresoutros: TStringField
      FieldName = 'outros'
      Size = 65
    end
  end
  object sqlitensentrada: TZQuery
    Connection = conexao
    OnCalcFields = sqlitensentradaCalcFields
    SQL.Strings = (
      'select * from itensentrada')
    Params = <>
    Left = 376
    Top = 200
    object sqlitensentradaregistro: TIntegerField
      FieldName = 'registro'
      Required = True
    end
    object sqlitensentradacodvenda: TIntegerField
      FieldName = 'codvenda'
    end
    object sqlitensentradacodprod: TIntegerField
      FieldName = 'codprod'
    end
    object sqlitensentradadescricao: TStringField
      FieldName = 'descricao'
      Size = 120
    end
    object sqlitensentradaunivenda: TStringField
      FieldName = 'univenda'
      Size = 12
    end
    object sqlitensentradaqtd: TFloatField
      FieldName = 'qtd'
    end
    object sqlitensentradapreco: TFloatField
      FieldName = 'preco'
      DisplayFormat = '0.00'
    end
    object sqlitensentradaTotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object sqlitensentradapreco2: TFloatField
      FieldName = 'preco2'
      DisplayFormat = '0.00'
    end
    object sqlitensentradapreco3: TFloatField
      FieldName = 'preco3'
      DisplayFormat = '0.00'
    end
  end
  object sqlitenscountentrada: TZQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT count( registro ) somaitens'
      'FROM itensentrada')
    Params = <>
    Left = 472
    Top = 336
    object sqlitenscountentradasomaitens: TLargeintField
      FieldName = 'somaitens'
      ReadOnly = True
    end
  end
  object sqlultimaentrada: TZQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT MAX( codvenda + 1 ) ultimavenda'
      'FROM dadosentradas')
    Params = <>
    Left = 472
    Top = 400
    object sqlultimaentradaultimavenda: TLargeintField
      FieldName = 'ultimavenda'
      ReadOnly = True
      DisplayFormat = '0'
    end
  end
  object sqlempresa: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from empresa')
    Params = <>
    Left = 672
    Top = 296
    object sqlempresaregistro: TIntegerField
      FieldName = 'registro'
      Required = True
    end
    object sqlempresaempresa: TStringField
      FieldName = 'empresa'
      Size = 60
    end
    object sqlempresaendereco: TStringField
      FieldName = 'endereco'
      Size = 65
    end
    object sqlempresatelefone: TStringField
      FieldName = 'telefone'
      Size = 40
    end
    object sqlempresacnpjinscr: TStringField
      FieldName = 'cnpjinscr'
      Size = 120
    end
    object sqlempresaimagem: TBlobField
      FieldName = 'imagem'
    end
  end
  object sqlitens: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from itensvendas')
    Params = <>
    Left = 680
    Top = 368
    object sqlitensregistro: TIntegerField
      FieldName = 'registro'
      Required = True
    end
    object sqlitenscodvenda: TIntegerField
      FieldName = 'codvenda'
    end
    object sqlitenscodprod: TIntegerField
      FieldName = 'codprod'
    end
    object sqlitensdescricao: TStringField
      FieldName = 'descricao'
      Size = 120
    end
    object sqlitensunivenda: TStringField
      FieldName = 'univenda'
      Size = 12
    end
    object sqlitensqtd: TFloatField
      FieldName = 'qtd'
    end
    object sqlitenspreco: TFloatField
      FieldName = 'preco'
      DisplayFormat = '0.00'
    end
    object sqlitensdesconto: TFloatField
      FieldName = 'desconto'
      DisplayFormat = '0.00'
    end
  end
  object tblempresa: TZTable
    Connection = conexao
    TableName = 'empresa'
    Left = 640
    Top = 80
    object tblempresaregistro: TIntegerField
      FieldName = 'registro'
      Required = True
    end
    object tblempresaempresa: TStringField
      FieldName = 'empresa'
      Size = 60
    end
    object tblempresaendereco: TStringField
      FieldName = 'endereco'
      Size = 65
    end
    object tblempresatelefone: TStringField
      FieldName = 'telefone'
      Size = 40
    end
    object tblempresacnpjinscr: TStringField
      FieldName = 'cnpjinscr'
      Size = 120
    end
    object tblempresaimagem: TBlobField
      FieldName = 'imagem'
    end
  end
end
