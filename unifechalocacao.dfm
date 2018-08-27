object frmfecharlocacao: Tfrmfecharlocacao
  Left = 465
  Top = 124
  Width = 339
  Height = 508
  Caption = 'Fechar Loca'#231#227'o'
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
  object GroupBox3: TGroupBox
    Left = 9
    Top = 283
    Width = 313
    Height = 105
    Caption = ' PAGAMENTO '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label7: TLabel
      Left = 27
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
      Left = 25
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
  object BitBtn1: TBitBtn
    Left = 62
    Top = 411
    Width = 201
    Height = 41
    Caption = '&Finalizar Loca'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object GroupBox2: TGroupBox
    Left = 9
    Top = 131
    Width = 315
    Height = 145
    Caption = 'DESCONTOS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
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
  object GroupBox1: TGroupBox
    Left = 9
    Top = 3
    Width = 315
    Height = 126
    Caption = 'FORMA DE PAGAMENTO '
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    object Label2: TLabel
      Left = 8
      Top = 80
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
      Top = 80
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
    object rbadiantado: TRadioButton
      Left = 24
      Top = 32
      Width = 233
      Height = 17
      Hint = 'DINHEIRO'
      Caption = 'Pagar Adiantado Dinheiro'
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
    object rbdevolucao: TRadioButton
      Left = 24
      Top = 56
      Width = 177
      Height = 17
      Hint = 'DEVOLUCAO'
      Caption = 'Pagar na Devolu'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object editcodcli: TEdit
      Left = 8
      Top = 96
      Width = 41
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = '0'
    end
    object editcliente: TEdit
      Left = 56
      Top = 96
      Width = 249
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
  end
  object editcodvenda: TEdit
    Left = 6
    Top = 401
    Width = 49
    Height = 21
    TabOrder = 4
    Text = 'editcodvenda'
    Visible = False
  end
end
