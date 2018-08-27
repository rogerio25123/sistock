object frmempresa: Tfrmempresa
  Left = 306
  Top = 162
  Width = 395
  Height = 441
  Caption = 'Dados da Empresa'
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
    Left = 8
    Top = 16
    Width = 41
    Height = 13
    Caption = 'Empresa'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 46
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object Label3: TLabel
    Left = 8
    Top = 96
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label4: TLabel
    Left = 8
    Top = 136
    Width = 27
    Height = 13
    Caption = 'CNPJ'
  end
  object Label5: TLabel
    Left = 8
    Top = 176
    Width = 37
    Height = 13
    Caption = 'Imagem'
  end
  object BitBtn1: TBitBtn
    Left = 304
    Top = 8
    Width = 75
    Height = 57
    Caption = '&Gravar'
    TabOrder = 0
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
    Layout = blGlyphTop
  end
  object editempresa: TEdit
    Left = 8
    Top = 32
    Width = 217
    Height = 21
    TabOrder = 1
    Text = 'editempresa'
  end
  object editendereco: TEdit
    Left = 8
    Top = 72
    Width = 297
    Height = 21
    TabOrder = 2
    Text = 'editendereco'
  end
  object edittelefone: TEdit
    Left = 8
    Top = 112
    Width = 193
    Height = 21
    TabOrder = 3
    Text = 'edittelefone'
  end
  object editCnpjInscr: TEdit
    Left = 8
    Top = 152
    Width = 241
    Height = 21
    TabOrder = 4
    Text = 'editCnpjInscr'
  end
  object DBImage1: TDBImage
    Left = 8
    Top = 192
    Width = 369
    Height = 209
    DataField = 'Imagem'
    DataSource = dm2.srcempresatbl
    TabOrder = 5
    OnDblClick = DBImage1DblClick
  end
  object openlogo: TOpenPictureDialog
    Filter = 
      'All (*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf)|*.jpg;*.jpeg;*.bmp;*.' +
      'ico;*.emf;*.wmf|JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*' +
      '.jpeg)|*.jpeg|Bitmaps (*.bmp)|*.bmp|Icons (*.ico)|*.ico|Enhanced' +
      ' Metafiles (*.emf)|*.emf|Metafiles (*.wmf)|*.wmf|JPEG Image File' +
      ' (*.jpg)|*.jpg'
    Left = 216
    Top = 104
  end
end
