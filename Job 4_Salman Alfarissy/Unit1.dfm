object Form1: TForm1
  Left = 413
  Top = 269
  Width = 749
  Height = 355
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 408
    Top = 16
    Width = 63
    Height = 16
    Caption = 'Treshold'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 432
    Top = 32
    Width = 8
    Height = 13
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Image1: TImage
    Left = 24
    Top = 64
    Width = 297
    Height = 225
    Stretch = True
  end
  object Image2: TImage
    Left = 408
    Top = 64
    Width = 297
    Height = 225
    Stretch = True
  end
  object ButtonMuatCitra: TButton
    Left = 16
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Muat Citra'
    TabOrder = 0
    OnClick = ButtonMuatCitraClick
  end
  object ButtonRerata: TButton
    Left = 112
    Top = 16
    Width = 89
    Height = 25
    Caption = 'Keabuan rerata'
    TabOrder = 1
    OnClick = ButtonRerataClick
  end
  object ButtonNTSC: TButton
    Left = 224
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Binary'
    TabOrder = 2
    OnClick = ButtonNTSCClick
  end
  object TrackBar1: TTrackBar
    Left = 496
    Top = 16
    Width = 217
    Height = 45
    TabOrder = 3
    OnChange = TrackBar1Change
  end
  object Button1: TButton
    Left = 320
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 4
    OnClick = Button1Click
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 352
    Top = 80
  end
  object Timer1: TTimer
    Left = 352
    Top = 120
  end
end
