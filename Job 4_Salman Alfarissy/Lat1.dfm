object Form1: TForm1
  Left = 214
  Top = 160
  Width = 1009
  Height = 451
  Caption = 'Capture'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 456
    Top = 48
    Width = 249
    Height = 201
    Stretch = True
  end
  object Image2: TImage
    Left = 720
    Top = 48
    Width = 249
    Height = 201
    Stretch = True
  end
  object Button1: TButton
    Left = 288
    Top = 48
    Width = 161
    Height = 25
    Caption = 'Mulai Citra'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 288
    Top = 120
    Width = 161
    Height = 25
    Caption = 'Capture'
    TabOrder = 1
    OnClick = Button2Click
  end
  object ButtonExit: TButton
    Left = 904
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 2
    OnClick = ButtonExitClick
  end
  object Button3: TButton
    Left = 288
    Top = 160
    Width = 161
    Height = 25
    Caption = 'Save'
    TabOrder = 3
    OnClick = Button3Click
  end
  object ButtonMuatCitra: TButton
    Left = 464
    Top = 8
    Width = 89
    Height = 25
    Caption = 'Muat Citra'
    TabOrder = 4
    OnClick = ButtonMuatCitraClick
  end
  object ComboBox1: TComboBox
    Left = 288
    Top = 88
    Width = 161
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    OnChange = ComboBox1Change
  end
  object VideoWindow1: TVideoWindow
    Left = 16
    Top = 48
    Width = 249
    Height = 201
    FilterGraph = FilterGraph1
    VMROptions.Mode = vmrWindowed
    Color = clBlack
  end
  object ButtonRerata: TButton
    Left = 576
    Top = 8
    Width = 97
    Height = 25
    Caption = 'Keabuan rerata'
    TabOrder = 7
    OnClick = ButtonRerataClick
  end
  object ButtonNTSC: TButton
    Left = 696
    Top = 8
    Width = 89
    Height = 25
    Caption = 'Binary'
    TabOrder = 8
    OnClick = ButtonNTSCClick
  end
  object StringGrid1: TStringGrid
    Left = 640
    Top = 264
    Width = 329
    Height = 129
    TabOrder = 9
  end
  object Button4: TButton
    Left = 808
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Save Filter'
    TabOrder = 10
    OnClick = Button4Click
  end
  object FilterGraph1: TFilterGraph
    Mode = gmCapture
    GraphEdit = True
    LinearVolume = True
    Left = 288
    Top = 192
  end
  object SampleGrabber1: TSampleGrabber
    FilterGraph = FilterGraph1
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 328
    Top = 192
  end
  object Filter1: TFilter
    BaseFilter.data = {00000000}
    FilterGraph = FilterGraph1
    Left = 368
    Top = 192
  end
  object SavePictureDialog1: TSavePictureDialog
    DefaultExt = '*.bmp'
    Left = 408
    Top = 192
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 288
    Top = 232
  end
  object Timer1: TTimer
    Left = 328
    Top = 232
  end
end
