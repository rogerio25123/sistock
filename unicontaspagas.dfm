object frmcontaspagas: Tfrmcontaspagas
  Left = 272
  Top = 118
  Width = 747
  Height = 602
  Caption = 'Contas Pagas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 0
    Top = 328
    Width = 739
    Height = 16
    Align = alBottom
    Caption = 'Lista das Compras do Cliente'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 0
    Top = 91
    Width = 739
    Height = 16
    Align = alBottom
    Caption = 'Lista de Pagamentos dos Clientes'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 280
    Top = 16
    Width = 170
    Height = 27
    Caption = 'CONTAS PAGAS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbcliente: TLabel
    Left = 8
    Top = 56
    Width = 170
    Height = 27
    Caption = 'CONTAS PAGAS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 107
    Width = 739
    Height = 221
    Align = alBottom
    DataSource = dm2.srcpgtodecliente
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'codpgto'
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cliente'
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'status'
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 344
    Width = 739
    Height = 231
    Align = alBottom
    DataSource = dm2.srcdadosvendas
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'codvenda'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'horas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cliente'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'totalitens'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'formapgto'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vendedor'
        Width = 70
        Visible = True
      end>
  end
  object BitBtn2: TBitBtn
    Left = 624
    Top = 8
    Width = 89
    Height = 57
    Caption = '&Fechar'
    TabOrder = 2
    OnClick = BitBtn2Click
    Glyph.Data = {
      D6060000424DD606000000000000360400002800000019000000180000000100
      080000000000A0020000C30E0000C30E00000001000000000000000000007B00
      0000FF000000007B00007B7B000000FF0000FFFF0000007B7B007B7B7B00BDBD
      BD0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00090909090909
      0000000809090909090809090909090909090900000009090909090909090909
      0909090908080809090909090909090000000909090909090909090909090909
      0804040809090909090909000000090909090909090909090909090908060604
      0809090909090900000009090909090909090909090909090806060404080909
      0909090000000909090909090909090909090909080606040404080909090900
      0000000000000000000000000909090908060604040400000000080000000909
      0909090909090900080808080006060404040008090909000000090909090909
      090808000A0A0A0A070606040404000809090900000009090909090908000400
      0A0A0A0A0706060404040008090909000000090909090909080004000A0A0A0A
      070606040404000809090900000009090908080808040404070A0A0A07060404
      000400080909090000000909080808080804060404070A0A0706040800040008
      090909000000090400000000000406060404070A070606040404000809090900
      0000080406060606060606060604040707060604040400080909090000000804
      060B0B0B0B0B0B0B060604070706060404040008090909000000090404040404
      040406060604070A070606040404000809090900000009090808080808040606
      04070A0A070606040404000809090900000009090909090908040604070A0A0A
      0706060404040008090909000000090909090909080404000A0A0A0A07040604
      04040008090909000000090909090909080000000A0A0A0A0A07040604040008
      0909090000000909090909090909080A0A0A0A0A0A0A0A040604000809090900
      0000090909090909090908070707070707070700040400080909090000000909
      0909090909090908080808080808080808080809090909000000}
    Layout = blGlyphTop
  end
end
