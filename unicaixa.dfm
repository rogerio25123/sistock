object frmcaixa: Tfrmcaixa
  Left = 179
  Top = 93
  Width = 1070
  Height = 644
  Caption = 'Caixa'
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poDefault
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 91
    Top = 16
    Width = 209
    Height = 113
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 192
    Width = 977
    Height = 508
    Align = alCustom
    DataSource = dm.srccaixa
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Options = [dgTitles, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgMultiSelect]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -13
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    Visible = False
    OnDblClick = DBGrid11DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'codvenda'
        Title.Caption = 'Codvenda'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total'
        Title.Alignment = taCenter
        Title.Caption = 'Total'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'desconto'
        Title.Caption = 'Desconto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'subtotal'
        Title.Caption = 'SubTotal'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'totalitens'
        Title.Caption = 'Itens'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data'
        Title.Caption = 'Data'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codcli'
        Title.Caption = 'Codcli'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cliente'
        Title.Caption = 'Cliente'
        Width = 227
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vendedor'
        Title.Caption = 'Vendedor'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'formapgto'
        Title.Caption = 'FormaPgto'
        Width = 122
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 50
    Top = 113
    Width = 80
    Height = 29
    Caption = 'Finalizar &Venda'
    Enabled = False
    TabOrder = 1
    Visible = False
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 134
    Top = 152
    Width = 80
    Height = 29
    Caption = 'Notas &Abertas'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 218
    Top = 152
    Width = 80
    Height = 29
    Caption = '&Caixa'
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object GroupBox1: TGroupBox
    Left = 309
    Top = 8
    Width = 681
    Height = 177
    Caption = ' Caixa '
    TabOrder = 4
    object Label1: TLabel
      Left = 4
      Top = 19
      Width = 114
      Height = 14
      Caption = 'Data Inicial..................:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 487
      Top = 11
      Width = 59
      Height = 14
      Caption = 'Valor.........:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 487
      Top = 59
      Width = 76
      Height = 14
      Caption = 'Descr/Nome..:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 232
      Top = 18
      Width = 114
      Height = 14
      Caption = 'Data Final....................:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object editsaida: TEdit
      Left = 487
      Top = 29
      Width = 82
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyPress = editsaidaKeyPress
    end
    object BitBtn4: TBitBtn
      Left = 539
      Top = 125
      Width = 86
      Height = 28
      Caption = 'Lan'#231'ar &Saida '
      TabOrder = 2
      OnClick = BitBtn4Click
    end
    object editdescricao: TEdit
      Left = 488
      Top = 76
      Width = 185
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object editdata2: TDateTimePicker
      Left = 350
      Top = 7
      Width = 108
      Height = 24
      Date = 39747.005604919000000000
      Time = 39747.005604919000000000
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object editdata1: TDateTimePicker
      Left = 122
      Top = 7
      Width = 108
      Height = 24
      Date = 39747.005604919000000000
      Time = 39747.005604919000000000
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object DBGrid2: TDBGrid
      Left = 5
      Top = 34
      Width = 476
      Height = 138
      DataSource = srctotalgrupo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'formapgto'
          Title.Caption = 'Forma Pgto'
          Width = 182
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'totalgrupo'
          Title.Caption = 'Total'
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Retirada'
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Saldo'
          Width = 80
          Visible = True
        end>
    end
  end
  object editdata: TEdit
    Left = 448
    Top = 264
    Width = 105
    Height = 21
    TabOrder = 5
    Visible = False
  end
  object BitBtn5: TBitBtn
    Left = 50
    Top = 152
    Width = 80
    Height = 29
    Caption = '&Imprimir'
    Enabled = False
    TabOrder = 7
    OnClick = BitBtn5Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 598
    Width = 1062
    Height = 19
    Panels = <
      item
        Text = 'F12 - Imprimir Caixa'
        Width = 50
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 200
    Top = 416
    object ImprimirCaixa1: TMenuItem
      Caption = 'Imprimir Caixa'
      ShortCut = 123
      OnClick = ImprimirCaixa1Click
    end
  end
  object DataSource1: TDataSource
    DataSet = dm.tblempresa
    Left = 328
    Top = 224
  end
  object srctotalgrupo: TDataSource
    DataSet = sqltotalgrupo
    Left = 704
    Top = 256
  end
  object sqltotalgrupo: TZQuery
    Connection = dm.conexao
    OnCalcFields = sqltotalgrupoCalcFields
    SQL.Strings = (
      
        'SELECT  sum(subtotal)  as totalgrupo, formapgto from dadosvendas' +
        '  group by  formapgto')
    Params = <>
    Left = 664
    Top = 251
    object sqltotalgrupototalgrupo: TFloatField
      FieldName = 'totalgrupo'
      ReadOnly = True
      currency = True
    end
    object sqltotalgrupoformapgto: TStringField
      FieldName = 'formapgto'
      Size = 30
    end
    object sqltotalgrupoRetirada: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Retirada'
      currency = True
      Calculated = True
    end
    object sqltotalgrupoSaldo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Saldo'
      currency = True
      Calculated = True
    end
  end
  object sqltotalretirada: TZQuery
    Connection = dm.conexao
    OnCalcFields = sqltotalgrupoCalcFields
    SQL.Strings = (
      
        'SELECT  sum(subtotal)  as totalretirada from dadosvendas  where ' +
        'formapgto = "RETIRADA"')
    Params = <>
    Left = 648
    Top = 315
    object sqltotalretiradatotalretirada: TFloatField
      FieldName = 'totalretirada'
      ReadOnly = True
    end
  end
  object DataSource2: TDataSource
    DataSet = sqltotalretirada
    Left = 488
    Top = 312
  end
end
