unit job7_salman;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DirectShow9, DSUtil, DSPack, Math, StdCtrls, ExtCtrls, ExtDlgs,
  ComCtrls, Grids;

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
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Image2: TImage;
    Button12: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    ScrollBar3: TScrollBar;
    ScrollBar4: TScrollBar;
    ScrollBar5: TScrollBar;
    ScrollBar6: TScrollBar;
    Label13: TLabel;
    Label14: TLabel;
    StringGrid1: TStringGrid;
    TrackBar1: TTrackBar;
    Button13: TButton;
    Button6: TButton;
    Button5: TButton;
    Button11: TButton;
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
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure ScrollBar3Change(Sender: TObject);
    procedure ScrollBar4Change(Sender: TObject);
    procedure ScrollBar5Change(Sender: TObject);
    procedure ScrollBar6Change(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);

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
  R, G, B, K, a: byte;

implementation

uses Types;

{$R *.dfm}

procedure img_biner(var Image2,Image1 :Timage);
begin
cv:=2;
  for y:=0 to Image1.Picture.Height-1 do
    begin
      PC := Image1.Picture.Bitmap.ScanLine[y];
      PH := Image2.Picture.Bitmap.ScanLine[y];
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

        end;
    end;
  Image2.Refresh;
end;

procedure img_grayscale(var Image2,Image1 :Timage);
begin
cv:=1;
  for y:=0 to Image1.Picture.Height-1 do
    begin
      PC := Image1.Picture.Bitmap.ScanLine[y];
      PH := Image2.Picture.Bitmap.ScanLine[y];
      for x:=0 to Image1.Picture.Width-1 do
        begin
          R := PC[3*x+2];
          G := PC[3*x+1];
          B := PC[3*x];
          K := Round((R+G+B)/3);
          PH[3*x+2] := K;
          PH[3*x+1] := K;
          PH[3*x] := K;

        end;
    end;
  Image2.Refresh;
end;



procedure RGB_HSV(R,G,B : Byte;out Hue,Sat,Val:Double);
var
  Min_,Max_,Delta : Double;
  H,S,V:Double;
begin
  H:=0.0;
  Min_ := Min(Min(R,G),B);
  Max_ := Max(Max(R,G),B);
  Delta:= (Max_-Min_);
  V:= Max_;
  if (Max_<> 0.0 ) then
    S:=255.0* Delta/Max_
  else
    S:=0.0;
  if (S<>0.0) then
    begin
      if R=Max_ then
        H:= (G-B)/Delta
      else
        if G= Max_ then
          H:= 2.0 + (B-R)/Delta
        else
          if B=Max_ then
            H:= 4.0+(R-G)/Delta
    end
  else
    H:= -1.0;
  H:=H*60;
  if H<0.0 then H:=H+360.0;

      Hue := H;
      Sat := S*100/255;
      Val := V*100/255;

  end;

procedure RGB_BINER(var image1:Timage);
var
  PC, PH: PByteArray;
  R,G,B,K:byte;
  x,y:integer;
  Hue,Sat,Val:Double;
begin
  for y:=0 to image1.picture.Bitmap.height-1 do
  begin
    PC := Image1.Picture.Bitmap.ScanLine[y];
    PH := Image1.Picture.Bitmap.ScanLine[y];
    for x:=0 to image1.picture.bitmap.width-1 do
    begin
      R := PC[3*x+2];
      G := PC[3*x+1];
      B := PC[3*x];
      RGB_HSV(R,G,B,Hue,Sat,Val);
      if (Hue>minH) and (Hue<maxH) or (Sat>minS) and (Sat<maxS) or (Val>minV) and (Val<maxV)then
      begin
        K:=255;
      end
      else
      begin
        K:=0;
      end;
      PH[3*x+2]:= K;
      PH[3*x+1]:= K;
      PH[3*x]:= K;

      end;
    end;
end;

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
  img_grayscale(Image2,Image1);
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  cv:=2;
  img_biner(Image2,Image1);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ck:=1;
  Timer1.Enabled:=true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if (ck=1) then
begin
  Timer1.Enabled:=false;
  SampleGrabber1.GetBitmap(Image2.Picture.Bitmap);
  RGB_BINER(image2);
end
else if (ck=2) then
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

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
  minH:=scrollbar1.Position;
  label1.Caption:=inttostr(minH);
end;

procedure TForm1.ScrollBar2Change(Sender: TObject);
begin
  minS:=scrollbar2.Position;
  label2.Caption:=inttostr(minS);
end;

procedure TForm1.ScrollBar3Change(Sender: TObject);
begin
  minV:=scrollbar3.Position;
  label3.Caption:=inttostr(minV);
end;

procedure TForm1.ScrollBar4Change(Sender: TObject);
begin
  maxH:=scrollbar4.Position;
  label4.Caption:=inttostr(maxH);
end;

procedure TForm1.ScrollBar5Change(Sender: TObject);
begin
  minS:=scrollbar5.Position;
  label5.Caption:=inttostr(minS);
end;

procedure TForm1.ScrollBar6Change(Sender: TObject);
begin
  minS:=scrollbar6.Position;
  label6.Caption:=inttostr(minS);
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  Image1.Picture:=nil;
  Image2.Picture:=nil;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
cv:=3;
  for y:=0 to Image1.Picture.Height-1 do
  begin
    PC := Image1.Picture.Bitmap.ScanLine[y];
    PH := Image2.Picture.Bitmap.ScanLine[y];
    for x:=0 to Image1.Picture.Width-1 do
      begin
        R := PC[3*x+2];
        G := PC[3*x+1];
        B := PC[3*x];
        K := Round((R+G+B)/3);

        if K>=TrackBar1.Position  then
          begin
            a:=0;
          end
        else
          a:=255;

          PH[3*x+2] := a;
          PH[3*x+1] := a;
          PH[3*x] := a;

      end;
end;
Label13.Caption:=IntToStr(K);
Label13.Refresh;
Image2.Refresh;
end;


procedure TForm1.Timer1Timer(Sender: TObject);
begin
if (ck=1) then
begin
  samplegrabber1.GetBitmap(image1.Picture.Bitmap);
  RGB_BINER(image1);
end
else if (ck=2) then
begin
   samplegrabber1.GetBitmap(image1.Picture.Bitmap);
end
end;


procedure TForm1.Button5Click(Sender: TObject);
begin
  ck:=2;
  Timer1.Enabled:=true;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
if (cv=1) then
begin
    for y:=0 to Image1.Picture.Height-1 do
    begin
      PC := Image1.Picture.Bitmap.ScanLine[y];
      PH := Image2.Picture.Bitmap.ScanLine[y];
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
    for y:=0 to Image1.Picture.Height-1 do
    begin
      PC := Image1.Picture.Bitmap.ScanLine[y];
      PH := Image2.Picture.Bitmap.ScanLine[y];
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
  for y:=0 to Image1.Picture.Height-1 do
  begin
    PC := Image1.Picture.Bitmap.ScanLine[y];
    PH := Image2.Picture.Bitmap.ScanLine[y];
    for x:=0 to Image1.Picture.Width-1 do
      begin
        R := PC[3*x+2];
        G := PC[3*x+1];
        B := PC[3*x];
        K := Round((R+G+B)/3);

        if K>=TrackBar1.Position  then
          begin
            a:=0;
          end
        else
          a:=255;

          PH[3*x+2] := a;
          PH[3*x+1] := a;
          PH[3*x] := a;

        StringGrid1.Cells[(y+1),(3*x+2) ]:= IntToStr(a);
        StringGrid1.Cells[(y+1),(3*x+1)] := IntToStr(a);
        StringGrid1.Cells[(y+1),(3*x)] := IntToStr(a);
      end;
  end;
end


end;

end.


