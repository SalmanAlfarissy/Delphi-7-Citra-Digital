object Form1: TForm1
  Left = 328
  Top = 58
  Width = 945
  Height = 582
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 193
    Height = 201
    Stretch = True
    OnMouseMove = Image1MouseMove
  end
  object Image2: TImage
    Left = 216
    Top = 8
    Width = 185
    Height = 201
    AutoSize = True
    Stretch = True
  end
  object Image3: TImage
    Left = 216
    Top = 280
    Width = 185
    Height = 201
    Stretch = True
  end
  object Label7: TLabel
    Left = 472
    Top = 560
    Width = 3
    Height = 13
    Caption = ' '
  end
  object Label8: TLabel
    Left = 24
    Top = 216
    Width = 8
    Height = 13
    Caption = 'H'
  end
  object Label9: TLabel
    Left = 40
    Top = 216
    Width = 12
    Height = 13
    Caption = '__'
  end
  object Label10: TLabel
    Left = 72
    Top = 216
    Width = 7
    Height = 13
    Caption = 'S'
  end
  object Label11: TLabel
    Left = 88
    Top = 216
    Width = 12
    Height = 13
    Caption = '__'
  end
  object Label12: TLabel
    Left = 120
    Top = 216
    Width = 7
    Height = 13
    Caption = 'V'
  end
  object Label13: TLabel
    Left = 136
    Top = 216
    Width = 12
    Height = 13
    Caption = '__'
  end
  object Label1: TLabel
    Left = 24
    Top = 232
    Width = 8
    Height = 13
    Caption = 'R'
  end
  object Label2: TLabel
    Left = 40
    Top = 232
    Width = 12
    Height = 13
    Caption = '__'
  end
  object Label3: TLabel
    Left = 72
    Top = 232
    Width = 8
    Height = 13
    Caption = 'G'
  end
  object Label4: TLabel
    Left = 88
    Top = 232
    Width = 12
    Height = 13
    Caption = '__'
  end
  object Label5: TLabel
    Left = 120
    Top = 232
    Width = 7
    Height = 13
    Caption = 'B'
  end
  object Label6: TLabel
    Left = 136
    Top = 232
    Width = 12
    Height = 13
    Caption = '__'
  end
  object Button1: TButton
    Left = 8
    Top = 248
    Width = 57
    Height = 25
    Caption = 'Open'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 72
    Top = 248
    Width = 57
    Height = 25
    Caption = 'Detect'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 136
    Top = 248
    Width = 57
    Height = 25
    Caption = 'Exit'
    TabOrder = 2
    OnClick = Button3Click
  end
  object VideoWindow1: TVideoWindow
    Left = 8
    Top = 280
    Width = 193
    Height = 201
    FilterGraph = FilterGraph1
    VMROptions.Mode = vmrWindowed
    Color = clBlack
  end
  object Button4: TButton
    Left = 16
    Top = 520
    Width = 57
    Height = 25
    Caption = 'Mulai'
    TabOrder = 4
  end
  object Button5: TButton
    Left = 80
    Top = 520
    Width = 57
    Height = 25
    Caption = 'Detect'
    TabOrder = 5
    OnClick = Button5Click
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 488
    Width = 193
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    OnChange = ComboBox1Change
  end
  object Button7: TButton
    Left = 144
    Top = 520
    Width = 57
    Height = 25
    Caption = 'Stop'
    TabOrder = 7
    OnClick = Button7Click
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 160
    Top = 16
  end
  object FilterGraph1: TFilterGraph
    Mode = gmCapture
    GraphEdit = False
    LinearVolume = True
    Left = 168
    Top = 296
  end
  object SampleGrabber1: TSampleGrabber
    FilterGraph = FilterGraph1
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 168
    Top = 328
  end
  object Filter1: TFilter
    BaseFilter.data = {00000000}
    FilterGraph = FilterGraph1
    Left = 168
    Top = 360
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 168
    Top = 392
  end
end
