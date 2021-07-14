object Form1: TForm1
  Left = 634
  Top = 132
  Width = 575
  Height = 512
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
    Left = 288
    Top = 24
    Width = 249
    Height = 201
    Stretch = True
  end
  object Image2: TImage
    Left = 32
    Top = 232
    Width = 249
    Height = 201
    Stretch = True
  end
  object Image3: TImage
    Left = 288
    Top = 232
    Width = 249
    Height = 201
    Stretch = True
  end
  object Button1: TButton
    Left = 40
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 40
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Capture'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 40
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 40
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 40
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 4
    OnClick = Button5Click
  end
  object ComboBox1: TComboBox
    Left = 120
    Top = 192
    Width = 161
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    OnChange = ComboBox1Change
  end
  object VideoWindow1: TVideoWindow
    Left = 120
    Top = 24
    Width = 160
    Height = 153
    FilterGraph = FilterGraph1
    VMROptions.Mode = vmrWindowed
    Color = clBlack
  end
  object Button6: TButton
    Left = 320
    Top = 440
    Width = 75
    Height = 25
    Caption = 'Image Gray'
    TabOrder = 7
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 440
    Top = 440
    Width = 75
    Height = 25
    Caption = 'Biner'
    TabOrder = 8
    OnClick = Button7Click
  end
  object FilterGraph1: TFilterGraph
    Mode = gmCapture
    GraphEdit = True
    LinearVolume = True
    Left = 8
    Top = 24
  end
  object SampleGrabber1: TSampleGrabber
    FilterGraph = FilterGraph1
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 8
    Top = 56
  end
  object Filter1: TFilter
    BaseFilter.data = {00000000}
    FilterGraph = FilterGraph1
    Left = 8
    Top = 88
  end
  object SavePictureDialog1: TSavePictureDialog
    DefaultExt = '*.bmp'
    Left = 8
    Top = 120
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 8
    Top = 152
  end
end
