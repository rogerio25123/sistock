object frmentrada: Tfrmentrada
  Left = 250
  Top = 108
  Width = 861
  Height = 625
  Caption = 'Entradas em Estoque'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 530
    Top = 322
    Width = 23
    Height = 13
    Caption = 'Data'
    FocusControl = DBEdit3
    Visible = False
  end
  object DBText1: TDBText
    Left = 479
    Top = 385
    Width = 64
    Height = 18
    Alignment = taRightJustify
    AutoSize = True
    DataField = 'CodV'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 853
    Height = 579
    Align = alClient
    Color = clBackground
    TabOrder = 0
    object Label12: TLabel
      Left = 220
      Top = 40
      Width = 54
      Height = 14
      Caption = 'Descri'#231#227'o'
      Color = clMenuText
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object Label13: TLabel
      Left = 4
      Top = 35
      Width = 91
      Height = 14
      Caption = 'C'#243'digo de Barra:'
      Color = clMenuText
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object labelnota: TLabel
      Left = 188
      Top = 4
      Width = 51
      Height = 33
      Caption = '000'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 398
      Top = 12
      Width = 88
      Height = 16
      Caption = 'Vendedor......:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 11
      Top = 3
      Width = 176
      Height = 33
      Alignment = taRightJustify
      Caption = 'N'#186' Entrada..:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object editbarra: TEdit
      Left = 4
      Top = 47
      Width = 209
      Height = 30
      BorderStyle = bsNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Visible = False
      OnKeyPress = editbarraKeyPress
    end
    object editquantidade: TEdit
      Left = 348
      Top = 42
      Width = 76
      Height = 30
      BorderStyle = bsNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      Text = '1'
      Visible = False
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 88
      Width = 851
      Height = 490
      Align = alBottom
      BorderStyle = bsNone
      DataSource = dm2.srcitensentrada
      FixedColor = clGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clYellow
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Visible = False
      Columns = <
        item
          Expanded = False
          FieldName = 'registro'
          Width = 35
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
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Width = 247
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'univenda'
          Width = 39
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
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Total'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco2'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco3'
          Width = 64
          Visible = True
        end>
    end
    object edittotal: TEdit
      Left = 432
      Top = 304
      Width = 57
      Height = 21
      TabOrder = 5
      Text = '0'
      Visible = False
    end
    object editqtditens: TEdit
      Left = 304
      Top = 328
      Width = 65
      Height = 21
      TabOrder = 6
      Text = '0'
      Visible = False
    end
    object editsenha: TEdit
      Left = 8
      Top = 35
      Width = 121
      Height = 25
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 3
      OnKeyPress = editsenhaKeyPress
    end
    object editvendedor: TEdit
      Left = 491
      Top = 2
      Width = 121
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object editdata: TEdit
      Left = 152
      Top = 288
      Width = 121
      Height = 21
      TabOrder = 8
      Text = 'editdata'
      Visible = False
    end
    object Panel1: TPanel
      Left = 384
      Top = 31
      Width = 177
      Height = 41
      BevelInner = bvLowered
      TabOrder = 9
      object Label3: TLabel
        Left = 5
        Top = 9
        Width = 167
        Height = 29
        Alignment = taRightJustify
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Panel2: TPanel
      Left = 564
      Top = 31
      Width = 47
      Height = 41
      BevelInner = bvLowered
      TabOrder = 10
      object Label6: TLabel
        Left = 4
        Top = 6
        Width = 37
        Height = 29
        Alignment = taCenter
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object editpreco: TEdit
      Left = 160
      Top = 384
      Width = 121
      Height = 21
      TabOrder = 11
      Text = 'editpreco'
      Visible = False
    end
    object editdescricao: TEdit
      Left = 220
      Top = 56
      Width = 157
      Height = 21
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnKeyPress = editbarraKeyPress
    end
  end
  object DBEdit3: TDBEdit
    Left = 528
    Top = 338
    Width = 41
    Height = 21
    DataField = 'Data'
    Enabled = False
    TabOrder = 1
    Visible = False
  end
  object editcodvenda: TEdit
    Left = 160
    Top = 336
    Width = 105
    Height = 21
    TabOrder = 2
    Visible = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 579
    Width = 853
    Height = 19
    Panels = <
      item
        Text = 'F5 - Finalizar Entrada'
        Width = 150
      end
      item
        Text = 'Del - Excluir Item'
        Width = 50
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 528
    Top = 264
    object Inserir1: TMenuItem
      Caption = 'Inserir'
      ShortCut = 113
    end
    object Confirmar1: TMenuItem
      Caption = 'Confirmar'
      ShortCut = 116
      OnClick = Confirmar1Click
    end
    object ExcluirTodososItens1: TMenuItem
      Caption = 'Cancelar a Nota'
      ShortCut = 121
    end
    object ExcluirItem1: TMenuItem
      Caption = 'Excluir Item'
      ShortCut = 46
      OnClick = ExcluirItem1Click
    end
    object ImprimirOramento1: TMenuItem
      Caption = 'Imprimir Or'#231'amento'
      ShortCut = 115
    end
    object MudarQtd1: TMenuItem
      Caption = 'Mudar Qtd'
      ShortCut = 16465
    end
  end
end
