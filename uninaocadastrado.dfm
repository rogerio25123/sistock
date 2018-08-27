object frmnaocadastrado: Tfrmnaocadastrado
  Left = 348
  Top = 242
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'frmnaocadastrado'
  ClientHeight = 46
  ClientWidth = 443
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 422
    Height = 34
    Caption = 'PRODUTO N'#195'O CADASTRADO'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Timer1: TTimer
    Interval = 3000
    OnTimer = Timer1Timer
    Left = 176
    Top = 8
  end
end
