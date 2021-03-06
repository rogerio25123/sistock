object frmlistarentradas: Tfrmlistarentradas
  Left = 491
  Top = 184
  Width = 530
  Height = 500
  Caption = 'Lista de Entradas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 56
    Width = 505
    Height = 409
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'codprod'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'univenda'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtd'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco'
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 440
    Top = 16
    Width = 75
    Height = 25
    Caption = '&Fechar'
    TabOrder = 1
    Kind = bkClose
  end
  object sqlitensentada: TZReadOnlyQuery
    Connection = dm2.conexao
    SQL.Strings = (
      'select * from itensentrada')
    Params = <>
    Left = 72
    Top = 24
    object sqlitensentadaregistro: TIntegerField
      DisplayWidth = 8
      FieldName = 'registro'
      Required = True
    end
    object sqlitensentadacodvenda: TIntegerField
      DisplayWidth = 12
      FieldName = 'codvenda'
    end
    object sqlitensentadacodprod: TIntegerField
      DisplayWidth = 12
      FieldName = 'codprod'
    end
    object sqlitensentadadescricao: TStringField
      DisplayWidth = 144
      FieldName = 'descricao'
      Size = 120
    end
    object sqlitensentadaunivenda: TStringField
      DisplayWidth = 15
      FieldName = 'univenda'
      Size = 12
    end
    object sqlitensentadaqtd: TFloatField
      DisplayWidth = 12
      FieldName = 'qtd'
    end
    object sqlitensentadapreco: TFloatField
      DisplayWidth = 12
      FieldName = 'preco'
    end
  end
  object DataSource1: TDataSource
    DataSet = sqlitensentada
    Left = 120
    Top = 24
  end
end
