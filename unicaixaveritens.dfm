object frmvercaixa: Tfrmvercaixa
  Left = 192
  Top = 126
  Width = 696
  Height = 480
  Caption = 'frmvercaixa'
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
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 114
    Height = 13
    Caption = 'Alterar Local de Entrega'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 56
    Width = 688
    Height = 397
    Align = alBottom
    DataSource = dm.srcitens
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
        FieldName = 'Registro'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CodVenda'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codprod'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Width = 216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Univenda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtd'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Desconto'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Preco'
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 584
    Top = 16
    Width = 75
    Height = 25
    Caption = '&Fechar'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object editlocalentrega: TEdit
    Left = 16
    Top = 24
    Width = 385
    Height = 26
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 408
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
end
