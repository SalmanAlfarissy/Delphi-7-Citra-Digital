object Form1: TForm1
  Left = 685
  Top = 11
  Width = 551
  Height = 465
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
    Left = 224
    Top = 16
    Width = 193
    Height = 201
    Stretch = True
  end
  object Label1: TLabel
    Left = 8
    Top = 288
    Width = 30
    Height = 13
    Caption = '_____'
  end
  object Label2: TLabel
    Left = 8
    Top = 328
    Width = 30
    Height = 13
    Caption = '_____'
  end
  object Label3: TLabel
    Left = 8
    Top = 368
    Width = 30
    Height = 13
    Caption = '_____'
  end
  object Label4: TLabel
    Left = 232
    Top = 288
    Width = 30
    Height = 13
    Caption = '_____'
  end
  object Label5: TLabel
    Left = 232
    Top = 328
    Width = 30
    Height = 13
    Caption = '_____'
  end
  object Label6: TLabel
    Left = 232
    Top = 368
    Width = 30
    Height = 13
    Caption = '_____'
  end
  object Label7: TLabel
    Left = 128
    Top = 272
    Width = 24
    Height = 13
    Caption = 'Hmin'
  end
  object Label8: TLabel
    Left = 352
    Top = 272
    Width = 27
    Height = 13
    Caption = 'Hmax'
  end
  object Label9: TLabel
    Left = 128
    Top = 312
    Width = 23
    Height = 13
    Caption = 'Smin'
  end
  object Label10: TLabel
    Left = 352
    Top = 312
    Width = 26
    Height = 13
    Caption = 'Smax'
  end
  object Label11: TLabel
    Left = 128
    Top = 352
    Width = 23
    Height = 13
    Caption = 'Vmin'
  end
  object Label12: TLabel
    Left = 352
    Top = 352
    Width = 26
    Height = 13
    Caption = 'Vmax'
  end
  object VideoWindow1: TVideoWindow
    Left = 8
    Top = 16
    Width = 201
    Height = 201
    FilterGraph = FilterGraph1
    VMROptions.Mode = vmrWindowed
    Color = clBlack
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 232
    Width = 201
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    OnChange = ComboBox1Change
  end
  object Button1: TButton
    Left = 432
    Top = 168
    Width = 81
    Height = 25
    Caption = 'Biner'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 432
    Top = 200
    Width = 81
    Height = 25
    Caption = 'Stop'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 432
    Top = 232
    Width = 81
    Height = 25
    Caption = 'Exit'
    TabOrder = 4
    OnClick = Button3Click
  end
  object ScrollBar1: TScrollBar
    Left = 48
    Top = 288
    Width = 177
    Height = 17
    Max = 255
    PageSize = 0
    TabOrder = 5
    OnChange = ScrollBar1Change
  end
  object ScrollBar2: TScrollBar
    Left = 48
    Top = 328
    Width = 177
    Height = 17
    PageSize = 0
    TabOrder = 6
    OnChange = ScrollBar2Change
  end
  object ScrollBar3: TScrollBar
    Left = 48
    Top = 368
    Width = 177
    Height = 17
    PageSize = 0
    TabOrder = 7
    OnChange = ScrollBar3Change
  end
  object ScrollBar4: TScrollBar
    Left = 272
    Top = 288
    Width = 177
    Height = 17
    Max = 255
    PageSize = 0
    Position = 255
    TabOrder = 8
    OnChange = ScrollBar4Change
  end
  object ScrollBar5: TScrollBar
    Left = 272
    Top = 328
    Width = 177
    Height = 17
    PageSize = 0
    Position = 100
    TabOrder = 9
    OnChange = ScrollBar5Change
  end
  object ScrollBar6: TScrollBar
    Left = 272
    Top = 368
    Width = 177
    Height = 17
    PageSize = 0
    Position = 100
    TabOrder = 10
    OnChange = ScrollBar6Change
  end
  object Button4: TButton
    Left = 224
    Top = 232
    Width = 89
    Height = 25
    Caption = 'Start Kamera'
    TabOrder = 11
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 432
    Top = 136
    Width = 81
    Height = 25
    Caption = 'Greyscale'
    TabOrder = 12
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 328
    Top = 232
    Width = 89
    Height = 25
    Caption = 'Save'
    TabOrder = 13
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 432
    Top = 8
    Width = 81
    Height = 25
    Caption = 'start default'
    TabOrder = 14
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 432
    Top = 104
    Width = 81
    Height = 25
    Caption = 'Biru'
    TabOrder = 15
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 432
    Top = 72
    Width = 81
    Height = 25
    Caption = 'Orange'
    TabOrder = 16
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 432
    Top = 40
    Width = 81
    Height = 25
    Caption = 'Thres'
    TabOrder = 17
    OnClick = Button10Click
  end
  object FilterGraph1: TFilterGraph
    Mode = gmCapture
    GraphEdit = False
    LinearVolume = True
    Left = 176
    Top = 24
  end
  object SampleGrabber1: TSampleGrabber
    FilterGraph = FilterGraph1
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 176
    Top = 56
  end
  object Filter1: TFilter
    BaseFilter.data = {00000000}
    FilterGraph = FilterGraph1
    Left = 176
    Top = 88
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 176
    Top = 120
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 176
    Top = 152
  end
end
