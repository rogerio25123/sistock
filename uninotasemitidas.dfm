object frmnotasemitidas: Tfrmnotasemitidas
  Left = 318
  Top = 147
  Width = 745
  Height = 522
  Caption = 'Notas Emitidas'
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
    Width = 737
    Height = 476
    Hint = 'As  notas Canceladas ser'#225' dado baixa no estoque'
    Align = alClient
    DataSource = dm2.srcdadosentrada
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Options = [dgTitles, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgMultiSelect]
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'codvenda'
        Title.Caption = 'CodEntrada'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Width = 196
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'totalitens'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vendedor'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'situacao'
        Width = 100
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 476
    Width = 737
    Height = 19
    Hint = 'As  notas Canceladas ser'#225' dado baixa no estoque'
    Panels = <
      item
        Text = 'F10 - Cancelar Entra'
        Width = 50
      end>
    ParentShowHint = False
    ShowHint = True
  end
  object editdata: TEdit
    Left = 599
    Top = 40
    Width = 60
    Height = 21
    TabOrder = 2
    Text = 'editdata'
    Visible = False
  end
  object PopupMenu1: TPopupMenu
    Left = 144
    Top = 144
    object CancelarEntrada1: TMenuItem
      Caption = 'Cancelar Entrada'
      ShortCut = 121
      OnClick = CancelarEntrada1Click
    end
  end
end
