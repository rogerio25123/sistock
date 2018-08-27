object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 229
  Top = 217
  Height = 480
  Width = 815
  object srcprodutos: TDataSource
    DataSet = sqlprodutos
    Left = 96
    Top = 64
  end
  object srcitens: TDataSource
    DataSet = sqlitens
    Left = 96
    Top = 120
  end
  object srcdadosvendas: TDataSource
    DataSet = sqldadosvendas
    Left = 144
    Top = 232
  end
  object srcempresa: TDataSource
    DataSet = sqlempresa
    Left = 184
    Top = 392
  end
  object srcempresatbl: TDataSource
    DataSet = tblempresa
    Left = 528
    Top = 64
  end
  object srcsqldesconto: TDataSource
    DataSet = sqltotaldesconto
    Left = 536
    Top = 304
  end
  object conexao: TZConnection
    Protocol = 'mysql'
    Port = 3306
    Left = 48
    Top = 16
  end
  object sqlprodutos: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from produtos')
    Params = <>
    Left = 32
    Top = 80
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
      FieldName = 'marca'
      Size = 35
    end
    object sqlprodutosestoque: TFloatField
      FieldName = 'estoque'
    end
    object sqlprodutosprecocusto: TFloatField
      FieldName = 'precocusto'
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
    end
    object sqlprodutosprecolocacao: TFloatField
      FieldName = 'precolocacao'
    end
    object sqlprodutoslocado: TStringField
      FieldName = 'locado'
      Size = 3
    end
    object sqlprodutospreco2: TFloatField
      FieldName = 'preco2'
      DisplayFormat = '0.00'
    end
    object sqlprodutospreco3: TFloatField
      FieldName = 'preco3'
      DisplayFormat = '0.00'
    end
  end
  object sqlitens: TZQuery
    Connection = conexao
    OnCalcFields = sqlitensCalcFields
    SQL.Strings = (
      'select * from itensvendas')
    Params = <>
    Left = 48
    Top = 128
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
    object sqlitenstotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'total'
      Calculated = True
    end
  end
  object sqldadosvendas: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from dadosvendas')
    Params = <>
    Left = 48
    Top = 176
    object sqldadosvendascodvenda: TIntegerField
      FieldName = 'codvenda'
      Required = True
    end
    object sqldadosvendasdata: TDateField
      FieldName = 'data'
    end
    object sqldadosvendashoras: TTimeField
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
      FieldName = 'situacao'
    end
  end
  object sqlitenssoma: TZQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT sum( codvenda + 1 ) somatotal'
      'FROM itensvendas')
    Params = <>
    Left = 296
    Top = 120
    object sqlitenssomasomatotal: TFloatField
      FieldName = 'somatotal'
      ReadOnly = True
    end
  end
  object sqlitensitens: TZQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT count( registro ) somaitens'
      'FROM itensvendas')
    Params = <>
    Left = 448
    Top = 152
    object sqlitensitenssomaitens: TLargeintField
      FieldName = 'somaitens'
      ReadOnly = True
    end
  end
  object sqlultimavenda: TZQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT MAX( codvenda + 1 ) ultimavenda'
      'FROM dadosvendas')
    Params = <>
    Left = 296
    Top = 16
    object sqlultimavendaultimavenda: TLargeintField
      FieldName = 'ultimavenda'
      ReadOnly = True
    end
  end
  object sqltotaldesconto: TZQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT sum( desconto ) totaldesconto'
      'FROM itensvendas')
    Params = <>
    Left = 536
    Top = 232
    object sqltotaldescontototaldesconto: TFloatField
      FieldName = 'totaldesconto'
      ReadOnly = True
    end
  end
  object tblempresa: TZTable
    Connection = conexao
    TableName = 'empresa'
    Left = 448
    Top = 24
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
    object tblempresacidade: TStringField
      FieldName = 'cidade'
      Size = 120
    end
    object tblempresaimpressora: TStringField
      FieldName = 'impressora'
      Size = 1
    end
  end
  object sqlempresa: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from empresa')
    Params = <>
    Left = 112
    Top = 392
  end
  object sqlvendedor: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from vendedor')
    Params = <>
    Left = 320
    Top = 232
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
  object srcbanco: TDataSource
    DataSet = tbbanco
    Left = 328
    Top = 360
  end
  object tbbanco: TTable
    Left = 328
    Top = 320
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
  object sqlitensprint: TZQuery
    Connection = conexao
    OnCalcFields = sqlitensprintCalcFields
    SQL.Strings = (
      'select * from itensvendas')
    Params = <>
    Left = 32
    Top = 312
    object sqlitensprintregistro: TIntegerField
      FieldName = 'registro'
      Required = True
    end
    object sqlitensprintcodvenda: TIntegerField
      FieldName = 'codvenda'
    end
    object sqlitensprintcodprod: TIntegerField
      FieldName = 'codprod'
    end
    object sqlitensprintdescricao: TStringField
      FieldName = 'descricao'
      Size = 120
    end
    object sqlitensprintunivenda: TStringField
      FieldName = 'univenda'
      Size = 12
    end
    object sqlitensprintqtd: TFloatField
      FieldName = 'qtd'
    end
    object sqlitensprintpreco: TFloatField
      FieldName = 'preco'
    end
    object sqlitensprintdesconto: TFloatField
      FieldName = 'desconto'
    end
    object sqlitensprinttotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'total'
      DisplayFormat = '0.00'
      Calculated = True
    end
  end
  object sqldadosvendasprint: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from dadosvendas')
    Params = <>
    Left = 40
    Top = 264
    object sqldadosvendasprintcodvenda: TIntegerField
      FieldName = 'codvenda'
      Required = True
    end
    object sqldadosvendasprintdata: TDateField
      FieldName = 'data'
    end
    object sqldadosvendasprinthoras: TTimeField
      FieldName = 'horas'
    end
    object sqldadosvendasprintcodcli: TIntegerField
      FieldName = 'codcli'
    end
    object sqldadosvendasprintcliente: TStringField
      FieldName = 'cliente'
      Size = 65
    end
    object sqldadosvendasprinttotal: TFloatField
      FieldName = 'total'
      DisplayFormat = '0.00'
    end
    object sqldadosvendasprinttotalitens: TIntegerField
      FieldName = 'totalitens'
    end
    object sqldadosvendasprintformapgto: TStringField
      FieldName = 'formapgto'
      Size = 30
    end
    object sqldadosvendasprintlocalentrega: TStringField
      FieldName = 'localentrega'
      Size = 90
    end
    object sqldadosvendasprintvendedor: TStringField
      FieldName = 'vendedor'
      Size = 40
    end
    object sqldadosvendasprintsituacao: TStringField
      FieldName = 'situacao'
    end
    object sqldadosvendasprintdesconto: TFloatField
      FieldName = 'desconto'
      DisplayFormat = '0.00'
    end
    object sqldadosvendasprintsubtotal: TFloatField
      FieldName = 'subtotal'
      DisplayFormat = '0.00'
    end
  end
  object DataSource1: TDataSource
    DataSet = sqlitensprint
    Left = 96
    Top = 320
  end
  object sqlclientes: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from clientes')
    Params = <>
    Left = 240
    Top = 192
    object sqlclientescodcli: TIntegerField
      FieldName = 'codcli'
      Required = True
    end
    object sqlclientescliente: TStringField
      FieldName = 'cliente'
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
  object srcclientes: TDataSource
    DataSet = sqlclientes
    Left = 312
    Top = 184
  end
  object sqldadoslocacao: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from dadoslocacao')
    Params = <>
    Left = 448
    Top = 360
    object IntegerField1: TIntegerField
      FieldName = 'codvenda'
      Required = True
    end
    object DateField1: TDateField
      FieldName = 'data'
    end
    object TimeField1: TTimeField
      FieldName = 'horas'
    end
    object IntegerField2: TIntegerField
      FieldName = 'codcli'
    end
    object StringField1: TStringField
      FieldName = 'cliente'
      Size = 65
    end
    object FloatField1: TFloatField
      FieldName = 'total'
    end
    object IntegerField3: TIntegerField
      FieldName = 'totalitens'
    end
    object StringField2: TStringField
      FieldName = 'formapgto'
      Size = 30
    end
    object StringField3: TStringField
      FieldName = 'localentrega'
      Size = 90
    end
    object StringField4: TStringField
      FieldName = 'vendedor'
      Size = 40
    end
    object StringField5: TStringField
      FieldName = 'situacao'
    end
  end
  object sqlultimalocacao: TZQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT MAX( codvenda + 1 ) ultimalocacao'
      'FROM dadoslocacao')
    Params = <>
    Left = 440
    Top = 304
    object sqlultimalocacaoultimalocacao: TLargeintField
      FieldName = 'ultimalocacao'
      ReadOnly = True
    end
  end
  object sqlitenslocacao: TZQuery
    Connection = conexao
    OnCalcFields = sqlitenslocacaoCalcFields
    SQL.Strings = (
      'select * from itenslocacao')
    Params = <>
    Left = 544
    Top = 360
    object sqlitenslocacaototal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'total'
      Calculated = True
    end
    object sqlitenslocacaoregistro: TIntegerField
      FieldName = 'registro'
      Required = True
    end
    object sqlitenslocacaocodvenda: TIntegerField
      FieldName = 'codvenda'
    end
    object sqlitenslocacaocodprod: TIntegerField
      FieldName = 'codprod'
    end
    object sqlitenslocacaodescricao: TStringField
      FieldName = 'descricao'
      Size = 120
    end
    object sqlitenslocacaounivenda: TStringField
      FieldName = 'univenda'
      Size = 12
    end
    object sqlitenslocacaoqtd: TFloatField
      FieldName = 'qtd'
    end
    object sqlitenslocacaopreco: TFloatField
      FieldName = 'preco'
      DisplayFormat = '0.00'
    end
    object sqlitenslocacaodesconto: TFloatField
      FieldName = 'desconto'
    end
    object sqlitenslocacaodtdevolucao: TDateField
      FieldName = 'dtdevolucao'
    end
    object sqlitenslocacaodevolvido: TStringField
      FieldName = 'devolvido'
      ReadOnly = True
      Size = 1
    end
    object sqlitenslocacaodtdevolvido: TDateField
      FieldName = 'dtdevolvido'
    end
    object sqlitenslocacaoqtddias: TIntegerField
      FieldName = 'qtddias'
    end
    object sqlitenslocacaojuros: TFloatField
      FieldName = 'juros'
      DisplayFormat = '0.00'
    end
  end
  object srcitenslocacao: TDataSource
    DataSet = sqlitenslocacao
    Left = 624
    Top = 360
  end
  object sqlitenssomalocacao: TZQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT sum( codvenda + 1 ) somatotallocacao'
      'FROM itenslocacao')
    Params = <>
    Left = 424
    Top = 256
    object sqlitenssomalocacaosomatotallocacao: TFloatField
      FieldName = 'somatotallocacao'
      ReadOnly = True
    end
  end
  object sqlitensitenslocacao: TZQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT count( registro ) somaitenslocacao'
      'FROM itenslocacao')
    Params = <>
    Left = 424
    Top = 208
    object sqlitensitenslocacaosomaitenslocacao: TLargeintField
      FieldName = 'somaitenslocacao'
      ReadOnly = True
    end
  end
  object sqlitenslocacaoprint: TZQuery
    Connection = conexao
    OnCalcFields = sqlitenslocacaoprintCalcFields
    SQL.Strings = (
      'select * from itenslocacao'
      '')
    Params = <>
    Left = 600
    Top = 168
    object sqlitenslocacaoprinttotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'total'
      Calculated = True
    end
    object sqlitenslocacaoprintregistro: TIntegerField
      FieldName = 'registro'
      Required = True
    end
    object sqlitenslocacaoprintcodvenda: TIntegerField
      FieldName = 'codvenda'
    end
    object sqlitenslocacaoprintcodprod: TIntegerField
      FieldName = 'codprod'
    end
    object sqlitenslocacaoprintdescricao: TStringField
      FieldName = 'descricao'
      Size = 120
    end
    object sqlitenslocacaoprintunivenda: TStringField
      FieldName = 'univenda'
      Size = 12
    end
    object sqlitenslocacaoprintqtd: TFloatField
      FieldName = 'qtd'
    end
    object sqlitenslocacaoprintpreco: TFloatField
      FieldName = 'preco'
    end
    object sqlitenslocacaoprintdesconto: TFloatField
      FieldName = 'desconto'
    end
    object sqlitenslocacaoprintdtdevolucao: TDateField
      FieldName = 'dtdevolucao'
    end
    object sqlitenslocacaoprintdevolvido: TStringField
      FieldName = 'devolvido'
      ReadOnly = True
      Size = 1
    end
    object sqlitenslocacaoprintdtdevolvido: TDateField
      FieldName = 'dtdevolvido'
    end
    object sqlitenslocacaoprintqtddias: TIntegerField
      FieldName = 'qtddias'
    end
    object sqlitenslocacaoprintjuros: TFloatField
      FieldName = 'juros'
    end
  end
  object sqldadoslocacaoprint: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from dadoslocacao')
    Params = <>
    Left = 528
    Top = 120
    object sqldadoslocacaoprintcodvenda: TIntegerField
      FieldName = 'codvenda'
      Required = True
    end
    object sqldadoslocacaoprintdata: TDateField
      FieldName = 'data'
    end
    object sqldadoslocacaoprinthoras: TTimeField
      FieldName = 'horas'
    end
    object sqldadoslocacaoprintcodcli: TIntegerField
      FieldName = 'codcli'
    end
    object sqldadoslocacaoprintcliente: TStringField
      FieldName = 'cliente'
      Size = 65
    end
    object sqldadoslocacaoprinttotal: TFloatField
      FieldName = 'total'
      DisplayFormat = '0.00'
    end
    object sqldadoslocacaoprinttotalitens: TIntegerField
      FieldName = 'totalitens'
    end
    object sqldadoslocacaoprintformapgto: TStringField
      FieldName = 'formapgto'
      Size = 30
    end
    object sqldadoslocacaoprintlocalentrega: TStringField
      FieldName = 'localentrega'
      Size = 90
    end
    object sqldadoslocacaoprintvendedor: TStringField
      FieldName = 'vendedor'
      Size = 40
    end
    object sqldadoslocacaoprintsituacao: TStringField
      FieldName = 'situacao'
    end
    object sqldadoslocacaoprintdesconto: TFloatField
      FieldName = 'desconto'
      DisplayFormat = '0.00'
    end
    object sqldadoslocacaoprintsubtotal: TFloatField
      FieldName = 'subtotal'
      DisplayFormat = '0.00'
    end
  end
  object srcpgtodecliente: TDataSource
    DataSet = sqlpgtodecliente
    Left = 376
    Top = 80
  end
  object sqlpgtodecliente: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from pgtodecliente')
    Params = <>
    Left = 376
    Top = 24
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
  end
  object srcformapgto: TDataSource
    DataSet = sqlformapgto
    Left = 224
    Top = 328
  end
  object sqlformapgto: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from formapgto')
    Params = <>
    Left = 224
    Top = 280
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
  object sqlultimopgto: TZQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT MAX( codpgto + 1 ) ultimopgto'
      'FROM pgtodecliente')
    Params = <>
    Left = 176
    Top = 288
    object sqlultimopgtoultimopgto: TLargeintField
      FieldName = 'ultimopgto'
      ReadOnly = True
    end
  end
  object srcdadosentrada: TDataSource
    DataSet = sqldadosentrada
    Left = 184
    Top = 120
  end
  object sqldadosentrada: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from dadosentradas')
    Params = <>
    Left = 184
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
  object sqlitensdevolucao: TZQuery
    Connection = conexao
    SQL.Strings = (
      
        'select itenslocacao.*, dadoslocacao.* from itenslocacao inner jo' +
        'in dadoslocacao '
      'on (itenslocacao.codvenda = dadoslocacao.codvenda)')
    Params = <>
    Left = 616
    Top = 248
    object sqlitensdevolucaoregistro: TIntegerField
      FieldName = 'registro'
      Required = True
    end
    object sqlitensdevolucaocodvenda: TIntegerField
      FieldName = 'codvenda'
    end
    object sqlitensdevolucaocodprod: TIntegerField
      FieldName = 'codprod'
    end
    object sqlitensdevolucaodescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object sqlitensdevolucaounivenda: TStringField
      FieldName = 'univenda'
      Size = 12
    end
    object sqlitensdevolucaoqtd: TFloatField
      FieldName = 'qtd'
    end
    object sqlitensdevolucaopreco: TFloatField
      FieldName = 'preco'
    end
    object sqlitensdevolucaodesconto: TFloatField
      FieldName = 'desconto'
    end
    object sqlitensdevolucaodtdevolucao: TDateField
      FieldName = 'dtdevolucao'
    end
    object sqlitensdevolucaodtdevolvido: TDateField
      FieldName = 'dtdevolvido'
    end
    object sqlitensdevolucaoqtddias: TIntegerField
      FieldName = 'qtddias'
    end
    object sqlitensdevolucaojuros: TFloatField
      FieldName = 'juros'
    end
    object sqlitensdevolucaocheck: TStringField
      FieldName = 'check'
      Size = 1
    end
    object sqlitensdevolucaocodvenda_1: TIntegerField
      FieldName = 'codvenda_1'
      Required = True
    end
    object sqlitensdevolucaodata: TDateField
      FieldName = 'data'
    end
    object sqlitensdevolucaohoras: TTimeField
      FieldName = 'horas'
    end
    object sqlitensdevolucaocodcli: TIntegerField
      FieldName = 'codcli'
    end
    object sqlitensdevolucaocliente: TStringField
      FieldName = 'cliente'
      Size = 65
    end
    object sqlitensdevolucaototal: TFloatField
      FieldName = 'total'
    end
    object sqlitensdevolucaototalitens: TIntegerField
      FieldName = 'totalitens'
    end
    object sqlitensdevolucaoformapgto: TStringField
      FieldName = 'formapgto'
      Size = 30
    end
    object sqlitensdevolucaolocalentrega: TStringField
      FieldName = 'localentrega'
      Size = 90
    end
    object sqlitensdevolucaovendedor: TStringField
      FieldName = 'vendedor'
      Size = 40
    end
    object sqlitensdevolucaosituacao: TStringField
      FieldName = 'situacao'
    end
    object sqlitensdevolucaodesconto_1: TFloatField
      FieldName = 'desconto_1'
    end
    object sqlitensdevolucaosubtotal: TFloatField
      FieldName = 'subtotal'
    end
    object sqlitensdevolucaodevolvido: TStringField
      FieldName = 'devolvido'
      ReadOnly = True
      Size = 1
    end
  end
  object srcitensdevolucao: TDataSource
    DataSet = sqlitensdevolucao
    Left = 616
    Top = 296
  end
  object sqltotaljurosdevolucao: TZQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT sum( juros ) totaljuros  FROM itenslocacao ')
    Params = <>
    Left = 528
    Top = 184
    object sqltotaljurosdevolucaototaljuros: TFloatField
      FieldName = 'totaljuros'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
  end
  object sqldadostroca: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from  dadostroca')
    Params = <>
    Left = 680
    Top = 16
    object sqldadostrocacodtroca: TIntegerField
      FieldName = 'codtroca'
      ReadOnly = True
    end
    object sqldadostrocadata: TDateField
      FieldName = 'data'
    end
    object sqldadostrocaqtde: TFloatField
      FieldName = 'qtde'
    end
    object sqldadostrocaqtds: TFloatField
      FieldName = 'qtds'
    end
    object sqldadostrocatotale: TFloatField
      FieldName = 'totale'
    end
    object sqldadostrocatotals: TFloatField
      FieldName = 'totals'
    end
    object sqldadostrocadiferenca: TFloatField
      FieldName = 'diferenca'
    end
  end
  object sqlitenstrocaentrada: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from itenstrocaentrada')
    Params = <>
    Left = 672
    Top = 72
    object sqlitenstrocaentradaId: TIntegerField
      FieldName = 'Id'
      Required = True
    end
    object sqlitenstrocaentradacodtroca: TIntegerField
      FieldName = 'codtroca'
    end
    object sqlitenstrocaentradacodproduto: TIntegerField
      FieldName = 'codproduto'
    end
    object sqlitenstrocaentradaqtd: TFloatField
      FieldName = 'qtd'
    end
    object sqlitenstrocaentradaund: TStringField
      FieldName = 'und'
      Size = 5
    end
    object sqlitenstrocaentradaproduto: TStringField
      FieldName = 'produto'
      ReadOnly = True
      Size = 100
    end
    object sqlitenstrocaentradapreco: TFloatField
      FieldName = 'preco'
      DisplayFormat = '0.00'
    end
  end
  object sqlitenstrocasaida: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from itenstrocasaida')
    Params = <>
    Left = 672
    Top = 128
    object sqlitenstrocasaidaId: TIntegerField
      FieldName = 'Id'
      Required = True
    end
    object sqlitenstrocasaidacodtroca: TIntegerField
      FieldName = 'codtroca'
    end
    object sqlitenstrocasaidacodproduto: TIntegerField
      FieldName = 'codproduto'
    end
    object sqlitenstrocasaidaqtd: TFloatField
      FieldName = 'qtd'
    end
    object sqlitenstrocasaidaund: TStringField
      FieldName = 'und'
      Size = 5
    end
    object sqlitenstrocasaidaproduto: TStringField
      FieldName = 'produto'
      ReadOnly = True
      Size = 100
    end
    object sqlitenstrocasaidapreco: TFloatField
      FieldName = 'preco'
      DisplayFormat = '0.00'
    end
  end
  object sqlultimatroca: TZQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT MAX( codtroca + 1 ) ultimatroca'
      'FROM dadostroca')
    Params = <>
    Left = 600
    Top = 16
    object sqlultimatrocaultimatroca: TLargeintField
      FieldName = 'ultimatroca'
      ReadOnly = True
    end
  end
  object srctrocaentrada: TDataSource
    DataSet = sqlitenstrocaentrada
    Left = 744
    Top = 72
  end
  object srctrocasaida: TDataSource
    DataSet = sqlitenstrocasaida
    Left = 744
    Top = 136
  end
  object sqlescnota: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from dadosvendas')
    Params = <>
    Left = 720
    Top = 264
    object sqlescnotacodvenda: TIntegerField
      FieldName = 'codvenda'
      Required = True
    end
    object sqlescnotadata: TDateField
      FieldName = 'data'
    end
    object sqlescnotahoras: TTimeField
      FieldName = 'horas'
    end
    object sqlescnotacodcli: TIntegerField
      FieldName = 'codcli'
    end
    object sqlescnotacliente: TStringField
      FieldName = 'cliente'
      Size = 65
    end
    object sqlescnotatotal: TFloatField
      FieldName = 'total'
    end
    object sqlescnotatotalitens: TIntegerField
      FieldName = 'totalitens'
    end
    object sqlescnotaformapgto: TStringField
      FieldName = 'formapgto'
      Size = 30
    end
    object sqlescnotalocalentrega: TStringField
      FieldName = 'localentrega'
      Size = 90
    end
    object sqlescnotavendedor: TStringField
      FieldName = 'vendedor'
      Size = 40
    end
    object sqlescnotasituacao: TStringField
      FieldName = 'situacao'
    end
    object sqlescnotadesconto: TFloatField
      FieldName = 'desconto'
    end
    object sqlescnotasubtotal: TFloatField
      FieldName = 'subtotal'
      currency = True
    end
    object sqlescnotacodcli2: TIntegerField
      FieldName = 'codcli2'
    end
  end
  object sqlitenstroca: TZQuery
    Connection = conexao
    OnCalcFields = sqlitenstrocaCalcFields
    SQL.Strings = (
      'select * from itensvendas')
    Params = <>
    Left = 712
    Top = 320
    object sqlitenstrocaregistro: TIntegerField
      FieldName = 'registro'
      Required = True
    end
    object sqlitenstrocacodvenda: TIntegerField
      FieldName = 'codvenda'
    end
    object sqlitenstrocacodprod: TIntegerField
      FieldName = 'codprod'
    end
    object sqlitenstrocadescricao: TStringField
      FieldName = 'descricao'
      Size = 120
    end
    object sqlitenstrocaunivenda: TStringField
      FieldName = 'univenda'
      Size = 12
    end
    object sqlitenstrocaqtd: TFloatField
      FieldName = 'qtd'
    end
    object sqlitenstrocapreco: TFloatField
      FieldName = 'preco'
      DisplayFormat = '0.00'
    end
    object sqlitenstrocadesconto: TFloatField
      FieldName = 'desconto'
    end
    object sqlitenstrocaTotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total'
      DisplayFormat = '0.00'
      Calculated = True
    end
  end
end
