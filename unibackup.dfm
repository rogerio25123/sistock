object frmbackup: Tfrmbackup
  Left = 407
  Top = 220
  Width = 381
  Height = 221
  Caption = 'Backup'
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
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 341
    Height = 24
    Caption = 'Escolha o Destino do arquivo de Backup'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DriveComboBox1: TDriveComboBox
    Left = 24
    Top = 64
    Width = 321
    Height = 30
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 34
    Top = 139
    Width = 129
    Height = 41
    Caption = 'Gravar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
    Glyph.Data = {
      5A010000424D5A01000000000000760000002800000012000000130000000100
      040000000000E4000000CE0E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777778877777
      7777770000007777844877777777770000007778444487777777770000007784
      4444487777777700000078444C4444877777770000007444C4C4448777777700
      00007C4C444C444877777700000078C44444C4448777770000008444C4444C44
      487777000000444C7C4448C4448777000000C4C777C4448C4448770000007C77
      777C4448C4448700000077777777C4448C4487000000777777777C4448C44700
      00007777777777C4448C7700000077777777777C444877000000777777777777
      C448770000007777777777777C447700000077777777777777C777000000}
  end
  object editorigem: TEdit
    Left = 16
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'editorigem'
    Visible = False
  end
  object Button1: TButton
    Left = 147
    Top = 101
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    Visible = False
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 232
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Edit1'
    Visible = False
  end
  object BitBtn2: TBitBtn
    Left = 202
    Top = 139
    Width = 129
    Height = 41
    Caption = 'Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = BitBtn2Click
    Glyph.Data = {
      D6060000424DD606000000000000360400002800000019000000180000000100
      080000000000A0020000C30E0000C30E00000001000000000000000000007B00
      0000FF000000007B00007B7B000000FF0000FFFF0000007B7B007B7B7B00BDBD
      BD0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00090909090909
      0000000809090909090809090909090909090900000009090909090909090909
      0909090908080809090909090909090000000909090909090909090909090909
      0804040809090909090909000000090909090909090909090909090908060604
      0809090909090900000009090909090909090909090909090806060404080909
      0909090000000909090909090909090909090909080606040404080909090900
      0000000000000000000000000909090908060604040400000000080000000909
      0909090909090900080808080006060404040008090909000000090909090909
      090808000A0A0A0A070606040404000809090900000009090909090908000400
      0A0A0A0A0706060404040008090909000000090909090909080004000A0A0A0A
      070606040404000809090900000009090908080808040404070A0A0A07060404
      000400080909090000000909080808080804060404070A0A0706040800040008
      090909000000090400000000000406060404070A070606040404000809090900
      0000080406060606060606060604040707060604040400080909090000000804
      060B0B0B0B0B0B0B060604070706060404040008090909000000090404040404
      040406060604070A070606040404000809090900000009090808080808040606
      04070A0A070606040404000809090900000009090909090908040604070A0A0A
      0706060404040008090909000000090909090909080404000A0A0A0A07040604
      04040008090909000000090909090909080000000A0A0A0A0A07040604040008
      0909090000000909090909090909080A0A0A0A0A0A0A0A040604000809090900
      0000090909090909090908070707070707070700040400080909090000000909
      0909090909090908080808080808080808080809090909000000}
  end
  object editlocal: TEdit
    Left = 144
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'editlocal'
    Visible = False
  end
end
