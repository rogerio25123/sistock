object frmesctroca: Tfrmesctroca
  Left = 236
  Top = 183
  Width = 896
  Height = 388
  Caption = 'Escolher item da Nota'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 5
    Top = 48
    Width = 876
    Height = 308
    DataSource = srcitenstroca
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
        FieldName = 'codvenda'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codprod'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Width = 345
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'univenda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtd'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total'
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 760
    Top = 8
    Width = 115
    Height = 33
    Caption = 'Escolher'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object srcitenstroca: TDataSource
    DataSet = dm.sqlitenstroca
    Left = 344
    Top = 184
  end
end
