object frmfecharvendas: Tfrmfecharvendas
  Left = 464
  Top = 106
  Width = 421
  Height = 589
  Caption = 'Fechar Vendas'
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
  object Label6: TLabel
    Left = 49
    Top = 164
    Width = 138
    Height = 20
    Caption = 'Local de Entrega'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 104
    Top = 496
    Width = 201
    Height = 41
    Caption = '&Finalizar Venda'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object editcodvenda: TEdit
    Left = 320
    Top = 488
    Width = 49
    Height = 21
    TabOrder = 1
    Text = 'editcodvenda'
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 48
    Top = 24
    Width = 315
    Height = 138
    Caption = 'FORMA DE PAGAMENTO '
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 2
    object Label2: TLabel
      Left = 8
      Top = 88
      Width = 40
      Height = 16
      Caption = 'Codcli'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 64
      Top = 88
      Width = 37
      Height = 16
      Caption = 'Nome'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RadioButton1: TRadioButton
      Left = 16
      Top = 32
      Width = 113
      Height = 17
      Hint = 'DINHEIRO'
      Caption = 'Dinheiro'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 176
      Top = 32
      Width = 113
      Height = 17
      Hint = 'CARTAO'
      Caption = 'Cart'#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object RadioButton3: TRadioButton
      Left = 16
      Top = 64
      Width = 113
      Height = 17
      Hint = 'CHEQUE'
      Caption = 'Cheque'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object RadioButton4: TRadioButton
      Left = 176
      Top = 64
      Width = 113
      Height = 17
      Hint = 'A PRAZO'
      Caption = 'Cliente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = RadioButton4Click
    end
    object editcodcli: TEdit
      Left = 8
      Top = 104
      Width = 41
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Text = '0'
    end
    object editcliente: TEdit
      Left = 56
      Top = 104
      Width = 249
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
  end
  object GroupBox2: TGroupBox
    Left = 48
    Top = 224
    Width = 315
    Height = 145
    Caption = 'DESCONTOS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object Label1: TLabel
      Left = 11
      Top = 20
      Width = 42
      Height = 22
      Caption = 'Total'
    end
    object Label4: TLabel
      Left = 147
      Top = 20
      Width = 112
      Height = 22
      Caption = 'Desconto R$'
    end
    object Label5: TLabel
      Left = 91
      Top = 84
      Width = 102
      Height = 22
      Caption = 'SUBTOTAL'
    end
    object edittotal: TEdit
      Left = 9
      Top = 41
      Width = 129
      Height = 30
      ReadOnly = True
      TabOrder = 0
      Text = 'edittotal'
    end
    object editdesconto: TEdit
      Left = 145
      Top = 41
      Width = 129
      Height = 30
      TabOrder = 1
      Text = '0'
      OnExit = editdescontoExit
      OnKeyPress = editdescontoKeyPress
    end
    object editsubtotal: TEdit
      Left = 81
      Top = 105
      Width = 129
      Height = 30
      ReadOnly = True
      TabOrder = 2
    end
  end
  object editlocalentrega: TEdit
    Left = 48
    Top = 184
    Width = 313
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object GroupBox3: TGroupBox
    Left = 48
    Top = 376
    Width = 313
    Height = 105
    Caption = ' PAGAMENTO '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object Label7: TLabel
      Left = 11
      Top = 28
      Width = 104
      Height = 24
      Caption = 'Valor Pago'
    end
    object Label8: TLabel
      Left = 179
      Top = 28
      Width = 56
      Height = 24
      Caption = 'Troco'
    end
    object editvalorpago: TEdit
      Left = 9
      Top = 57
      Width = 112
      Height = 32
      TabOrder = 0
      OnExit = editvalorpagoExit
      OnKeyPress = editvalorpagoKeyPress
    end
    object edittroco: TEdit
      Left = 177
      Top = 57
      Width = 112
      Height = 32
      ReadOnly = True
      TabOrder = 1
    end
  end
end
