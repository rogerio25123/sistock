object frmtroca: Tfrmtroca
  Left = 237
  Top = 47
  Width = 960
  Height = 677
  Caption = 'Troca de Produto'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 937
    Height = 177
    Caption = ' Dados da Troca '
    Color = clGreen
    ParentColor = False
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 13
      Width = 102
      Height = 33
      Alignment = taRightJustify
      Caption = 'Troca..:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object labelnota: TLabel
      Left = 110
      Top = 14
      Width = 51
      Height = 33
      Caption = '000'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object editdata: TEdit
      Left = 192
      Top = 12
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'editdata'
    end
    object GroupBox4: TGroupBox
      Left = 16
      Top = 56
      Width = 401
      Height = 105
      Caption = ' Dados da Nota de Venda '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label11: TLabel
        Left = 8
        Top = 16
        Width = 57
        Height = 13
        Caption = 'codvenda'
        FocusControl = DBEdit1
      end
      object Label12: TLabel
        Left = 72
        Top = 16
        Width = 26
        Height = 13
        Caption = 'data'
        FocusControl = DBEdit2
      end
      object Label13: TLabel
        Left = 152
        Top = 16
        Width = 35
        Height = 13
        Caption = 'codcli'
        FocusControl = DBEdit3
      end
      object Label14: TLabel
        Left = 208
        Top = 16
        Width = 39
        Height = 13
        Caption = 'cliente'
        FocusControl = DBEdit4
      end
      object Label15: TLabel
        Left = 8
        Top = 64
        Width = 57
        Height = 13
        Caption = 'formapgto'
        FocusControl = DBEdit5
      end
      object Label16: TLabel
        Left = 128
        Top = 64
        Width = 54
        Height = 13
        Caption = 'vendedor'
        FocusControl = DBEdit6
      end
      object Label17: TLabel
        Left = 240
        Top = 64
        Width = 26
        Height = 13
        Caption = 'total'
        FocusControl = DBEdit7
      end
      object Label18: TLabel
        Left = 336
        Top = 64
        Width = 53
        Height = 13
        Caption = 'totalitens'
        FocusControl = DBEdit8
      end
      object DBEdit1: TDBEdit
        Left = 8
        Top = 32
        Width = 57
        Height = 21
        DataField = 'codvenda'
        DataSource = DataSource1
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 72
        Top = 32
        Width = 73
        Height = 21
        DataField = 'data'
        DataSource = DataSource1
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 152
        Top = 32
        Width = 49
        Height = 21
        DataField = 'codcli'
        DataSource = DataSource1
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 208
        Top = 32
        Width = 185
        Height = 21
        DataField = 'cliente'
        DataSource = DataSource1
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 8
        Top = 80
        Width = 113
        Height = 21
        DataField = 'formapgto'
        DataSource = DataSource1
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 128
        Top = 80
        Width = 105
        Height = 21
        DataField = 'vendedor'
        DataSource = DataSource1
        TabOrder = 5
      end
      object DBEdit7: TDBEdit
        Left = 240
        Top = 80
        Width = 89
        Height = 21
        DataField = 'subtotal'
        DataSource = DataSource1
        TabOrder = 6
      end
      object DBEdit8: TDBEdit
        Left = 336
        Top = 80
        Width = 57
        Height = 21
        DataField = 'totalitens'
        DataSource = DataSource1
        TabOrder = 7
      end
    end
    object editcodtroca: TEdit
      Left = 323
      Top = 11
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'editcodtroca'
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 176
    Width = 937
    Height = 233
    Caption = ' Entradas '
    Color = clTeal
    ParentColor = False
    TabOrder = 1
    object Label7: TLabel
      Left = 6
      Top = 15
      Width = 31
      Height = 15
      Caption = 'Total '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 77
      Width = 28
      Height = 15
      Caption = 'Itens'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 232
      Top = 16
      Width = 697
      Height = 209
      DataSource = dm.srctrocaentrada
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Id'
          Width = 37
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'codtroca'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'codproduto'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'qtd'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'und'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'produto'
          Width = 237
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco'
          Visible = True
        end>
    end
    object Panel4: TPanel
      Left = 8
      Top = 29
      Width = 177
      Height = 41
      BevelInner = bvLowered
      TabOrder = 1
      object labeldesconto: TLabel
        Left = 5
        Top = 6
        Width = 167
        Height = 29
        Alignment = taRightJustify
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Panel2: TPanel
      Left = 7
      Top = 91
      Width = 47
      Height = 41
      BevelInner = bvLowered
      TabOrder = 2
      object Label6: TLabel
        Left = 4
        Top = 6
        Width = 37
        Height = 29
        Alignment = taCenter
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object BitBtn1: TBitBtn
      Left = 65
      Top = 90
      Width = 121
      Height = 45
      Caption = 'Escolher Item da  Nota'
      TabOrder = 3
      OnClick = BitBtn1Click
      Glyph.Data = {
        8A050000424D8A05000000000000360400002800000011000000110000000100
        08000000000054010000C30E0000C30E00000001000000000000000000007B00
        0000BD000000FF0000007B7B000000FF0000FFFF000000315A0008427300084A
        730000007B007B007B00084A7B0008527B0021527B00007B7B007B7B7B00004A
        840008528400105284002963840008528C00085A8C00185A8C0018638C002963
        8C0008529400185A9400296B9400316B94002973940031739400085A9C001863
        9C0018739C0029739C0031739C0031849C00005AA5002173A5003973A500297B
        A500186BAD00106BB500317BB5002984B5004A8CB500086BBD000073BD001073
        BD001873BD00217BBD004284BD00318CBD004A8CBD005294BD005A9CBD00BDBD
        BD001073C600007BC600217BC600428CC6004A8CC6005A9CC6000084CE000884
        CE00398CCE005A9CCE00639CCE001884D6002184D600088CD600108CD6004294
        D600399CD6004A9CD600529CD6005A9CD6005AA5D60063ADD6001884DE002184
        DE00188CDE001094DE001894DE003194DE00299CDE004AA5DE005AA5DE004AB5
        DE00189CE700219CE700429CE7005AA5E7005AADE70063ADE7006BB5E70021A5
        EF0029A5EF0031A5EF0063B5EF006BBDEF0029ADF70031ADF7006BBDF7000000
        FF00FF00FF0031B5FF0039B5FF0042B5FF0039BDFF0042BDFF0042C6FF004AC6
        FF006BC6FF004ACEFF0052CEFF0052D6FF005ADEFF0063E7FF0000FFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00393939393939
        3939393939393939393939000000390000000000000000000039393939393900
        0000390079797979797979790039393939393900000039007979797979797979
        0039393939393900000039007900000000000079003939393939390000003900
        7900797879780000003939393939390000003900790078797879007900000039
        3939390000003900790000000000007900393900003939000000390079790079
        7902020202020202020202000000390079790079790279787978797879780200
        0000390079797900790278797879787978790200000039007979790079027978
        7978797879780200000039000000000000027879787978797879020000003939
        3939393900020202020202020202020000003939393939393902790202020202
        0202020000003939393939393902020202020202020202000000393939393939
        3939393939393939393939000000}
      Layout = blGlyphTop
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 408
    Width = 937
    Height = 241
    Caption = ' Sa'#237'das '
    Color = clSkyBlue
    ParentColor = False
    TabOrder = 2
    object Label9: TLabel
      Left = 5
      Top = 20
      Width = 91
      Height = 14
      Caption = 'C'#243'digo de Barra:'
      Color = clActiveCaption
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object DBGrid2: TDBGrid
      Left = 232
      Top = 16
      Width = 697
      Height = 217
      DataSource = dm.srctrocasaida
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Id'
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'codtroca'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'codproduto'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'qtd'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'und'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'produto'
          Width = 243
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco'
          Visible = True
        end>
    end
    object editbarra: TEdit
      Left = 4
      Top = 34
      Width = 209
      Height = 30
      BorderStyle = bsNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnKeyPress = editbarraKeyPress
    end
  end
  object DataSource1: TDataSource
    DataSet = dm.sqlescnota
    Left = 480
    Top = 88
  end
end
