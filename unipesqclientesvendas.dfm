object frmpgtoclientes: Tfrmpgtoclientes
  Left = 387
  Top = 149
  Width = 671
  Height = 487
  Caption = 'frmpgtoclientes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 8
    Width = 94
    Height = 13
    Caption = 'Nome do Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 55
    Width = 663
    Height = 405
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyPress = DBGrid1KeyPress
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
    Left = 504
    Top = 16
    Width = 75
    Height = 25
    Caption = '&Finalizar'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 584
    Top = 16
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object editcliente: TEdit
    Left = 0
    Top = 22
    Width = 273
    Height = 32
    Hint = 'Digite o nome e pressione ENTER!'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnKeyPress = editclienteKeyPress
  end
end
