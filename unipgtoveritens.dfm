object frmpgtoveritens: Tfrmpgtoveritens
  Left = 223
  Top = 87
  Width = 696
  Height = 606
  Caption = 'Ver Itens da Compra'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 48
    Width = 688
    Height = 531
    Align = alBottom
    DataSource = dm2.srcitens
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'registro'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codvenda'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codprod'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Width = 216
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
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco'
        Width = 64
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 600
    Top = 16
    Width = 75
    Height = 25
    Caption = '&Fechar'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
end
