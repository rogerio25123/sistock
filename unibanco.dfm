object frmbanco: Tfrmbanco
  Left = 294
  Top = 174
  Width = 638
  Height = 366
  Caption = 'Banco de Dados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 56
    Width = 630
    Height = 283
    Align = alBottom
    DataSource = dm.srcbanco
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Host'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Banco'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Login'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Senha'
        Width = 64
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 536
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
end
