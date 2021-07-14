object Form1: TForm1
  Left = 223
  Top = 80
  Width = 988
  Height = 633
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
  object Image1: TImage
    Left = 320
    Top = 48
    Width = 305
    Height = 249
    Stretch = True
  end
  object Image2: TImage
    Left = 648
    Top = 48
    Width = 305
    Height = 249
    Stretch = True
  end
  object Button3: TButton
    Left = 880
    Top = 16
    Width = 65
    Height = 25
    Caption = 'Exit'
    TabOrder = 0
    OnClick = Button3Click
  end
  object Button7: TButton
    Left = 536
    Top = 16
    Width = 89
    Height = 25
    Caption = 'Save'
    TabOrder = 1
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 648
    Top = 16
    Width = 97
    Height = 25
    Caption = 'Citra Grayscale'
    TabOrder = 2
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 328
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Muat Citra'
    TabOrder = 3
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 768
    Top = 16
    Width = 89
    Height = 25
    Caption = 'Citra Biner'
    TabOrder = 4
    OnClick = Button10Click
  end
  object VideoWindow1: TVideoWindow
    Left = 16
    Top = 40
    Width = 281
    Height = 249
    FilterGraph = FilterGraph1
    VMROptions.Mode = vmrWindowed
    Color = clBlack
  end
  object ComboBox1: TComboBox
    Left = 16
    Top = 304
    Width = 193
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    OnChange = ComboBox1Change
  end
  object Button2: TButton
    Left = 424
    Top = 304
    Width = 89
    Height = 25
    Caption = 'Stop'
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 216
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Start kamera'
    TabOrder = 8
    OnClick = Button4Click
  end
  object Button12: TButton
    Left = 816
    Top = 304
    Width = 137
    Height = 25
    Caption = 'Save Img Konversi'
    TabOrder = 9
    OnClick = Button12Click
  end
  object StringGrid1: TStringGrid
    Left = 16
    Top = 356
    Width = 945
    Height = 221
    ColCount = 20
    RowCount = 20
    TabOrder = 10
  end
  object Button13: TButton
    Left = 656
    Top = 304
    Width = 145
    Height = 25
    Caption = 'Reset'
    TabOrder = 11
    OnClick = Button13Click
  end
  object Button6: TButton
    Left = 432
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Capture'
    TabOrder = 12
    OnClick = Button6Click
  end
  object Button5: TButton
    Left = 320
    Top = 305
    Width = 81
    Height = 25
    Caption = 'Mulai Conversi'
    TabOrder = 13
    OnClick = Button5Click
  end
  object Button1: TButton
    Left = 544
    Top = 304
    Width = 81
    Height = 25
    Caption = 'RGB'
    TabOrder = 14
    OnClick = Button1Click
  end
  object FilterGraph1: TFilterGraph
    Mode = gmCapture
    GraphEdit = False
    LinearVolume = True
    Left = 24
    Top = 8
  end
  object SampleGrabber1: TSampleGrabber
    FilterGraph = FilterGraph1
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 56
    Top = 8
  end
  object Filter1: TFilter
    BaseFilter.data = {00000000}
    FilterGraph = FilterGraph1
    Left = 88
    Top = 8
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 120
    Top = 8
  end
  object SavePictureDialog1: TSavePictureDialog
    DefaultExt = '*.bmp'
    Left = 152
    Top = 8
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 184
    Top = 8
  end
end
