object frmveritensentrada: Tfrmveritensentrada
  Left = 205
  Top = 187
  Width = 700
  Height = 475
  Caption = 'frmveritensentrada'
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
    Top = 0
    Width = 692
    Height = 448
    Align = alClient
    DataSource = dm2.srcitensentrada
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
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
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codprod'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Width = 262
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Univenda'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtd'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Preco'
        Visible = True
      end>
  end
end
