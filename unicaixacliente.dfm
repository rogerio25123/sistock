object frmpesqcliente: Tfrmpesqcliente
  Left = 192
  Top = 107
  Width = 670
  Height = 480
  Caption = 'frmpesqcliente'
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
    Left = 0
    Top = 48
    Width = 662
    Height = 405
    Align = alBottom
    DataSource = dm.srccliente
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'codcli'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cliente'
        Width = 209
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'endereco'
        Width = 199
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'saldo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'limite'
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 584
    Top = 16
    Width = 75
    Height = 25
    Caption = '&Finalizar'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 504
    Top = 16
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
end
