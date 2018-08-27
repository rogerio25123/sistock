object frmescproduto: Tfrmescproduto
  Left = 174
  Top = 107
  Width = 979
  Height = 568
  Caption = 'frmescproduto'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 7
    Top = 3
    Width = 98
    Height = 15
    Caption = 'Nome do Produto'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 62
    Top = 55
    Width = 192
    Height = 22
    Caption = 'Iten(s) encontrado(s)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 13
    Top = 55
    Width = 44
    Height = 22
    Alignment = taRightJustify
    Caption = '0000'
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 7
    Top = 20
    Width = 322
    Height = 30
    Hint = 'Pesquisar Produto'
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = 16113368
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 861
    Top = 9
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    TabOrder = 1
    OnClick = BitBtn2Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 96
    Width = 971
    Height = 445
    Align = alBottom
    BorderStyle = bsNone
    DataSource = srcsqlprod
    FixedColor = clGreen
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Options = [dgTitles, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -13
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'codprod'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'barra'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Width = 283
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'univenda'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'marca'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estoque'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'precovenda'
        Title.Caption = 'preco1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco3'
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 862
    Top = 47
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object editpreco: TEdit
    Left = 352
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'editpreco'
    Visible = False
  end
  object srcsqlprod: TDataSource
    DataSet = sqlprodutos
    Left = 384
    Top = 16
  end
  object sqlprodutos: TZQuery
    Connection = dm2.conexao
    SQL.Strings = (
      'SELECT * FROM  Produtos')
    Params = <>
    Left = 352
    Top = 16
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
      Size = 1
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
end
