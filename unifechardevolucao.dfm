object frmfechardevolucao: Tfrmfechardevolucao
  Left = 463
  Top = 75
  Width = 370
  Height = 473
  Caption = 'Fechar Devolu'#231#227'o'
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
  object BitBtn1: TBitBtn
    Left = 48
    Top = 376
    Width = 265
    Height = 41
    Caption = '&Finalizar Devolu'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = BitBtn1Click
    Glyph.Data = {
      02030000424D0203000000000000360100002800000013000000170000000100
      080000000000CC010000C30E0000C30E000040000000000000001C3404002434
      1C00242424001C3C0400243C0C00244404002C5C04003C5C240044543C005C5C
      54005C5C5C00646464006C6C6C0054743C007474740044840400747C74007C7C
      7C0084848400449404006C8C540054AC0400000000008C8C8C008C948C009494
      94009C9C9C00A4A4A400ACACAC00B4B4B4006CD404006CDC040074F404007CFC
      040084FC0C0084FC14007CDC24008CFC1C008CFC240094FC240094EC3C0094FC
      2C009CFC3C0094D45C009CF44C009CFC4400A4FC4C00A4FC5400ACFC6400B4FC
      6C00B4F47400BCF48400BCFC7C00B4C4A400ACCC9400BCCCAC00BCC4B400BCCC
      B400B4E48C00BCE49400BCDCA400C4F49400C4FC8C00C0C0C0003F3F3F3F3F3F
      191717193F3F3F3F3F3F3F3F3F003F3F3F3F3F1712111112193F3F3F3F3F3F3F
      3F003F3F3F3F19120E0C0C0E123F3F3F3F3F3F3F3F003F3F3F3F120E0C0B0B0C
      11173F3F3F3F3F3F3F003F3F3F17110C0B0A0A0B0E123F3F3F3F3F3F3F003F3F
      3F12140702010B0B0C11173F3F3F3F3F3F003F3F3F181E1E0F03100C0C0E1219
      3F3F3F3F3F003F3F3F2422231F06080C0C0C11173F3F3F3F3F003F3F2B212223
      221305170C0C0E11173F3F3F3F003F3521222323231E06090E0C0C0E12193F3F
      3F003F2B2223272726221304180E0C0C0E123F3F3F003F2926252A2F2F261F06
      08110E0C0E11173F3F0038302D232C39332E23150311110E0C0E11173F003F39
      2E28383F37312A220F0117110E0E0E1219003F3F373F3F3F3F3A30261E060917
      110E0E1117003F3F3F3F3F3F3F3F322E2315030C1712111217003F3F3F3F3F3F
      3F3F37342D2313001819171719003F3F3F3F3F3F3F3F3F3B342E231300193F3F
      3F003F3F3F3F3F3F3F3F3F3F3C3330230F011D3F3F003F3F3F3F3F3F3F3F3F3F
      3F393E31250F0D3F3F003F3F3F3F3F3F3F3F3F3F3F3F383D312320353F003F3F
      3F3F3F3F3F3F3F3F3F3F3F3F3C2A23363F003F3F3F3F3F3F3F3F3F3F3F3F3F3F
      3F3F373F3F00}
  end
  object editcodvenda: TEdit
    Left = 296
    Top = 472
    Width = 49
    Height = 21
    TabOrder = 1
    Text = 'editcodvenda'
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 8
    Width = 315
    Height = 73
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
  end
  object GroupBox2: TGroupBox
    Left = 24
    Top = 88
    Width = 315
    Height = 145
    Caption = 'D'#201'BITOS '
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
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
  object GroupBox3: TGroupBox
    Left = 24
    Top = 240
    Width = 313
    Height = 105
    Caption = ' PAGAMENTO '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object Label7: TLabel
      Left = 107
      Top = 28
      Width = 104
      Height = 24
      Caption = 'Valor Pago'
    end
    object editvalorpago: TEdit
      Left = 105
      Top = 57
      Width = 112
      Height = 32
      TabOrder = 0
      OnExit = editvalorpagoExit
      OnKeyPress = editvalorpagoKeyPress
    end
  end
end
