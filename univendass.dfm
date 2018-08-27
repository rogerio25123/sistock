object frmprivendas: Tfrmprivendas
  Left = 311
  Top = 39
  BorderStyle = bsSingle
  Caption = 'Vendas'
  ClientHeight = 682
  ClientWidth = 997
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 450
    Top = 378
    Width = 23
    Height = 13
    Caption = 'Data'
    FocusControl = DBEdit3
    Visible = False
  end
  object Label9: TLabel
    Left = 750
    Top = 28
    Width = 27
    Height = 15
    Caption = 'Total'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 997
    Height = 662
    Align = alClient
    Color = clGreen
    TabOrder = 0
    object Label13: TLabel
      Left = 45
      Top = 60
      Width = 251
      Height = 14
      Caption = 'C'#243'digo de barra ou digite o nome do produto:'
      Color = clActiveCaption
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object Label1: TLabel
      Left = 40
      Top = 3
      Width = 99
      Height = 33
      Alignment = taRightJustify
      Caption = 'Nota...:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object labelnota: TLabel
      Left = 140
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
      Visible = False
    end
    object Label11: TLabel
      Left = 793
      Top = 8
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
    object Label4: TLabel
      Left = 662
      Top = 55
      Width = 112
      Height = 15
      Caption = 'Total com Desconto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 846
      Top = 55
      Width = 28
      Height = 15
      Caption = 'Itens'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 478
      Top = 55
      Width = 112
      Height = 15
      Caption = 'Total em Descontos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 49
      Top = 60
      Width = 80
      Height = 14
      Caption = 'Digite a Senha:'
      Color = clActiveCaption
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Image1: TImage
      Left = 5
      Top = 5
      Width = 205
      Height = 20
    end
    object base: TSpeedButton
      Left = 136
      Top = 120
      Width = 23
      Height = 22
      Visible = False
    end
    object editbarra: TEdit
      Left = 44
      Top = 74
      Width = 253
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
    object DBGrid11: TDBGrid
      Left = 1
      Top = 113
      Width = 995
      Height = 548
      Align = alBottom
      BorderStyle = bsNone
      DataSource = dm.srcitens
      FixedColor = clGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clYellow
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Visible = False
      Columns = <
        item
          Expanded = False
          FieldName = 'codprod'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Caption = 'Descricao'
          Width = 511
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'univenda'
          Title.Caption = 'Univenda'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'qtd'
          Title.Caption = 'Qtd'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco'
          Title.Caption = 'Preco'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'total'
          Title.Caption = 'Total'
          Width = 64
          Visible = True
        end>
    end
    object edittotal: TEdit
      Left = 720
      Top = 8
      Width = 33
      Height = 21
      TabOrder = 4
      Text = '0'
      Visible = False
    end
    object editqtditens: TEdit
      Left = 152
      Top = 408
      Width = 65
      Height = 21
      TabOrder = 5
      Text = '0'
      Visible = False
    end
    object editsenha: TEdit
      Left = 48
      Top = 75
      Width = 121
      Height = 25
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 2
      OnKeyPress = editsenhaKeyPress
    end
    object editvendedor: TEdit
      Left = 792
      Top = 24
      Width = 99
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object editdata: TEdit
      Left = 136
      Top = 368
      Width = 121
      Height = 21
      TabOrder = 7
      Text = 'editdata'
      Visible = False
    end
    object editquantidade: TEdit
      Left = 348
      Top = 394
      Width = 76
      Height = 30
      BorderStyle = bsNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      Text = '1'
      Visible = False
      OnKeyPress = editquantidadeKeyPress
    end
    object Panel2: TPanel
      Left = 845
      Top = 69
      Width = 47
      Height = 41
      BevelInner = bvLowered
      TabOrder = 9
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
    object Panel4: TPanel
      Left = 480
      Top = 69
      Width = 177
      Height = 41
      BevelInner = bvLowered
      TabOrder = 11
      object labeldesconto: TLabel
        Left = 5
        Top = 6
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
    object Panel1: TPanel
      Left = 664
      Top = 69
      Width = 177
      Height = 41
      BevelInner = bvLowered
      TabOrder = 8
      object Label3: TLabel
        Left = 64
        Top = 8
        Width = 108
        Height = 29
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 3
        Top = 2
        Width = 17
        Height = 13
        Caption = 'De'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 37
        Top = 18
        Width = 20
        Height = 13
        Caption = 'Por'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object labeltotal: TLabel
        Left = 27
        Top = 2
        Width = 26
        Height = 13
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object CheckBox1: TCheckBox
      Left = 324
      Top = 81
      Width = 109
      Height = 17
      Caption = 'Somente '#224' Vista'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      Visible = False
      OnClick = CheckBox1Click
    end
    object checkperguntarqtd: TCheckBox
      Left = 47
      Top = 105
      Width = 250
      Height = 17
      Caption = 'Perguntar qtd p/ leitor de codigo barra'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 12
    end
    object btnpreco1: TBitBtn
      Left = 480
      Top = 114
      Width = 75
      Height = 25
      Caption = 'Pre'#231'o 1'
      TabOrder = 13
      Visible = False
      OnClick = btnpreco1Click
    end
    object btnpreco2: TBitBtn
      Left = 560
      Top = 114
      Width = 75
      Height = 25
      Caption = 'Pre'#231'o 2'
      TabOrder = 14
      Visible = False
      OnClick = btnpreco2Click
    end
    object btnpreco3: TBitBtn
      Left = 640
      Top = 114
      Width = 75
      Height = 25
      Caption = 'Pre'#231'o 3'
      TabOrder = 15
      Visible = False
      OnClick = btnpreco3Click
    end
  end
  object DBEdit3: TDBEdit
    Left = 448
    Top = 394
    Width = 41
    Height = 21
    DataField = 'Data'
    Enabled = False
    TabOrder = 1
    Visible = False
  end
  object editcodvenda: TEdit
    Left = 160
    Top = 456
    Width = 105
    Height = 21
    TabOrder = 2
    Visible = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 662
    Width = 997
    Height = 20
    Panels = <
      item
        Text = 'F5 - Confirmar venda'
        Width = 130
      end
      item
        Text = 'F10 - Cancela Nota'
        Width = 120
      end
      item
        Text = 'Del - Excluir Item'
        Width = 120
      end
      item
        Text = 'F7 - Imprimir Or'#231'amento'
        Width = 150
      end
      item
        Text = 'F9 - Pesquisar Produtos'
        Width = 150
      end
      item
        Text = 'F12 - Receber Conta'
        Width = 120
      end
      item
        Text = 'F2 - Trocar Produto'
        Width = 50
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 304
    Top = 384
    object Inserir1: TMenuItem
      Caption = 'Trocar produto'
      ShortCut = 113
      OnClick = Inserir1Click
    end
    object Confirmar1: TMenuItem
      Caption = 'Confirmar'
      ShortCut = 116
      OnClick = Confirmar1Click
    end
    object ExcluirTodososItens1: TMenuItem
      Caption = 'Cancelar a Nota'
      ShortCut = 121
      OnClick = ExcluirTodososItens1Click
    end
    object ExcluirItem1: TMenuItem
      Caption = 'Excluir Item'
      ShortCut = 46
      OnClick = ExcluirItem1Click
    end
    object ImprimirOramento1: TMenuItem
      Caption = 'Imprimir Or'#231'amento'
      ShortCut = 118
      OnClick = ImprimirOramento1Click
    end
    object MudarQtd1: TMenuItem
      Caption = 'Mudar Qtd'
      ShortCut = 16465
      OnClick = MudarQtd1Click
    end
    object ConfigurarBanco1: TMenuItem
      Caption = 'Receber Conta'
      ShortCut = 123
      OnClick = ConfigurarBanco1Click
    end
    object PesquisarProduto1: TMenuItem
      Caption = 'Pesquisar Produto'
      ShortCut = 120
      OnClick = PesquisarProduto1Click
    end
  end
end
