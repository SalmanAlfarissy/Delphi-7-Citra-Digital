unit salman8acc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DirectShow9, DSUtil, DSPack, Math, StdCtrls, ExtCtrls, ExtDlgs,
  ComCtrls, Grids, jpeg;

type
  TForm1 = class(TForm)
    Button3: TButton;
    FilterGraph1: TFilterGraph;
    SampleGrabber1: TSampleGrabber;
    Filter1: TFilter;
    Timer1: TTimer;
    SavePictureDialog1: TSavePictureDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Image1: TImage;
    VideoWindow1: TVideoWindow;
    ComboBox1: TComboBox;
    Button2: TButton;
    Button4: TButton;
    Image2: TImage;
    Button12: TButton;
    StringGrid1: TStringGrid;
    Button13: TButton;
    Button6: TButton;
    Button5: TButton;
    Button1: TButton;
    procedure Button4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button5Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Capenum:TSysDevEnum;
  maxH,maxS,maxV,minH,minS,minV:byte;
  ck, cv, x, y:Integer;
  PC, PH: PByteArray;
  R, G, B, K,K1,K2, a: byte;

implementation

uses Types;

{$R *.dfm}

procedure TForm1.Button4Click(Sender: TObject);
var i : integer;
begin
  Capenum := Tsysdevenum.create(CLSID_VideoInputDeviceCategory);
  For i := 0 to capenum.CountFilters-1 do
    begin
    ComboBox1.Items.add(capenum.filters[i].friendlyName);
    end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  FilterGraph1.ClearGraph;
  FilterGraph1.Active := False;
  Filter1.BaseFilter.Moniker := Capenum.GetMoniker(Combobox1.ItemIndex);
  FilterGraph1.Active := True;
  with FilterGraph1 as ICaptureGraphBuilder2 do
  RenderStream (@PIN_CATEGORY_PREVIEW,
  nil, Filter1 as IBaseFilter, SampleGrabber1 as
  IBaseFilter, VideoWindow1 as
  IBaseFilter); FilterGraph1.Play;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
if (OpenPictureDialog1.Execute) then
    begin
      Image1.Picture.LoadFromFile(
        OpenPictureDialog1.FileName);
      Image2.Picture := Image1.Picture;
    end
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
samplegrabber1.GetBitmap(image1.Picture.bitmap);
samplegrabber1.GetBitmap(image2.Picture.bitmap);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
SavePictureDialog1.Filter := 'Windows Bitmap (.bmp; *.dib)|.bmp;.dib|' + 'JPEG Bitmap (.jpg; .jpeg)|.jpg;.jpeg|' + 'TIF Bitmap (.tif; .tiff)|.tif;.tiff|' + 'Compuserve Bitmap (.gif)|.gif|' + 'Portable Network Graphics (.png)|*.png|';
if SavePictureDialog1.Execute then
Image1.Picture.Graphic.SaveToFile(SavePictureDialog1.FileName);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  cv:=1;
  Timer1.Enabled:=true;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  cv:=2;
  Timer1.Enabled:=true;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  cv:=3;
  Timer1.Enabled:=true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
Timer1.Enabled:=false;
SampleGrabber1.GetBitmap(Image2.Picture.Bitmap);
if (cv=1) then
begin
  Timer1.Enabled:=false;
  Image2.Picture := Image1.Picture;
end
else if (cv=2) then
begin
   Timer1.Enabled:=false;
   Image2.Picture := Image1.Picture;
end
else if (cv=3) then
begin
   Timer1.Enabled:=false;
   SampleGrabber1.GetBitmap(Image2.Picture.Bitmap);
end

end;

procedure TForm1.Button12Click(Sender: TObject);
begin
SavePictureDialog1.Filter := 'Windows Bitmap (.bmp; *.dib)|.bmp;.dib|' + 'JPEG Bitmap (.jpg; .jpeg)|.jpg;.jpeg|' + 'TIF Bitmap (.tif; .tiff)|.tif;.tiff|' + 'Compuserve Bitmap (.gif)|.gif|' + 'Portable Network Graphics (.png)|*.png|';
if SavePictureDialog1.Execute then
Image2.Picture.Graphic.SaveToFile(SavePictureDialog1.FileName);
end;


procedure TForm1.Button13Click(Sender: TObject);
begin
  Image1.Picture:=nil;
  Image2.Picture:=nil;
end;


procedure TForm1.Timer1Timer(Sender: TObject);
begin
samplegrabber1.GetBitmap(image1.Picture.Bitmap);
if (cv=1) then
begin
  samplegrabber1.GetBitmap(image1.Picture.Bitmap);

  for y:=0 to Image1.Picture.Height-1 do
    begin
      PC := Image1.Picture.Bitmap.ScanLine[y];
      PH := Image1.Picture.Bitmap.ScanLine[y];
      for x:=0 to Image1.Picture.Width-1 do
        begin
          R := PC[3*x+2];
          G := PC[3*x+1];
          B := PC[3*x];
          K := Round((R+G+B)/3);
          PH[3*x+2] := K;
          PH[3*x+1] := K;
          PH[3*x] := K;
          StringGrid1.Cells[(y+1),(3*x+2) ]:= IntToStr(K);
          StringGrid1.Cells[(y+1),(3*x+1)] := IntToStr(K);
          StringGrid1.Cells[(y+1),(3*x)] := IntToStr(K);
        end;
    end;

end
else if (cv=2) then
begin
   samplegrabber1.GetBitmap(image1.Picture.Bitmap);

   for y:=0 to Image1.Picture.Height-1 do
    begin
      PC := Image1.Picture.Bitmap.ScanLine[y];
      PH := Image1.Picture.Bitmap.ScanLine[y];
      for x:=0 to Image1.Picture.Width-1 do
        begin
          R := PC[3*x+2];
          G := PC[3*x+1];
          B := PC[3*x];
          K := Round(0.299*R+0.114*G+0.587*B);
          if K < 128 then K := 0
          else
          K := 255;
          PH[3*x+2] := K;
          PH[3*x+1] := K;
          PH[3*x] := K;
          StringGrid1.Cells[(y+1),(3*x+2) ]:= IntToStr(K);
          StringGrid1.Cells[(y+1),(3*x+1)] := IntToStr(K);
          StringGrid1.Cells[(y+1),(3*x)] := IntToStr(K);
        end;
    end;
end
else if (cv=3) then
begin
   samplegrabber1.GetBitmap(image1.Picture.Bitmap);
   for y:=0 to Image1.Picture.Height-1 do
    begin
      PC := Image1.Picture.Bitmap.ScanLine[y];
      PH := Image2.Picture.Bitmap.ScanLine[y];
      for x:=0 to Image1.Picture.Width-1 do
        begin
          R := PC[3*x+2];
          G := PC[3*x+1];
          B := PC[3*x];
          K := R;
          K1 := G;
          K2 := B;
          PH[3*x+2] := K;
          PH[3*x+1] := K1;
          PH[3*x] := K2;
          StringGrid1.Cells[(y+1),(3*x+2) ]:= IntToStr(K);
          StringGrid1.Cells[(y+1),(3*x+1)] := IntToStr(K1);
          StringGrid1.Cells[(y+1),(3*x)] := IntToStr(K2);
        end;
    end;
end
end;


procedure TForm1.Button5Click(Sender: TObject);
begin
  Timer1.Enabled:=true;
end;

end.


