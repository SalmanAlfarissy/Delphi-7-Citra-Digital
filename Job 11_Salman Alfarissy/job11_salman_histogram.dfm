object Form1: TForm1
  Left = 527
  Top = 119
  Width = 679
  Height = 605
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
    Left = 16
    Top = 16
    Width = 129
    Height = 289
    Stretch = True
  end
  object Label1: TLabel
    Left = 24
    Top = 448
    Width = 38
    Height = 13
    Caption = 'R Value'
  end
  object Label2: TLabel
    Left = 24
    Top = 488
    Width = 38
    Height = 13
    Caption = 'G Value'
  end
  object Label3: TLabel
    Left = 24
    Top = 528
    Width = 37
    Height = 13
    Caption = 'B Value'
  end
  object Chart1: TChart
    Left = 200
    Top = 16
    Width = 441
    Height = 289
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Grafik Histogram')
    TabOrder = 0
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'Red'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
      Title = 'Green'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series3: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clBlue
      Title = 'Blue'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object Edit1: TEdit
    Left = 104
    Top = 400
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '0'
  end
  object Edit2: TEdit
    Left = 104
    Top = 440
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '0'
  end
  object Edit3: TEdit
    Left = 104
    Top = 480
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '0'
  end
  object Edit4: TEdit
    Left = 104
    Top = 520
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '0'
  end
  object Button1: TButton
    Left = 16
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Open File'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 104
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 192
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 7
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 16
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Scan'
    TabOrder = 8
    OnClick = Button4Click
  end
  object ScrollBar1: TScrollBar
    Left = 160
    Top = 16
    Width = 17
    Height = 289
    Kind = sbVertical
    PageSize = 0
    TabOrder = 9
    OnChange = ScrollBar1Change
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 288
    Top = 352
  end
  object OpenDialog1: TOpenDialog
    Left = 320
    Top = 352
  end
end
