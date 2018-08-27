object Form1: TForm1
  Left = 238
  Top = 135
  Width = 619
  Height = 149
  Caption = 'Configurar Banco de Dados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 609
    Height = 120
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
        FieldName = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Host'
        Width = 153
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Banco'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Login'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Senha'
        Width = 77
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 64
    Top = 80
  end
  object Table1: TTable
    Left = 112
    Top = 80
    object Table1Codigo: TIntegerField
      DisplayWidth = 12
      FieldName = 'Codigo'
    end
    object Table1Host: TStringField
      DisplayWidth = 24
      FieldName = 'Host'
    end
    object Table1Banco: TStringField
      DisplayWidth = 24
      FieldName = 'Banco'
    end
    object Table1Login: TStringField
      DisplayWidth = 24
      FieldName = 'Login'
    end
    object Table1Senha: TStringField
      DisplayWidth = 16
      FieldName = 'Senha'
    end
  end
end
