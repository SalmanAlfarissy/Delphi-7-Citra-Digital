unit job10_Salman;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DirectShow9, DSUtil, DSPack, Math, StdCtrls, ExtCtrls, ExtDlgs;

type
  TForm1 = class(TForm)
    VideoWindow1: TVideoWindow;
    FilterGraph1: TFilterGraph;
    SampleGrabber1: TSampleGrabber;
    Filter1: TFilter;
    Image1: TImage;
    ComboBox1: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Timer1: TTimer;
    ScrollBar1: TScrollBar;
    Label1: TLabel;
    ScrollBar2: TScrollBar;
    Label2: TLabel;
    ScrollBar3: TScrollBar;
    Label3: TLabel;
    ScrollBar4: TScrollBar;
    Label4: TLabel;
    ScrollBar5: TScrollBar;
    Label5: TLabel;
    ScrollBar6: TScrollBar;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    SavePictureDialog1: TSavePictureDialog;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    procedure ComboBox1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar4Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure ScrollBar5Change(Sender: TObject);
    procedure ScrollBar3Change(Sender: TObject);
    procedure ScrollBar6Change(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  CapEnum:TSysDevEnum;
  maxH,maxS,maxV,minH,minS,minV:byte;
  cv :integer;


implementation

{$R *.dfm}

procedure default(var image1: TImage);
var
  PC, PH: PByteArray;
  R,G,B,K,K1,K2:byte;
  x,y :integer;

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
      K := R;
      K1 := G;
      K2 := B;
      PH[3*x+2] := K;
      PH[3*x+1] := K1;
      PH[3*x] := K2;
    end;
  end;
end;

procedure RGB2HSV(R,G,B : Byte;out Hue,Sat,Val:Double);
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
  //with Result Do
    //begin
      Hue := H;
      Sat := S*100/255;
      Val := V*100/255;
    //end;
  end;

procedure BGR2BINER(var image1:Timage);
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
      RGB2HSV(R,G,B,Hue,Sat,Val);
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

procedure BGRTHRES(var image1:Timage);
var
 PC,PH: PByteArray;
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
    RGB2HSV(R,G,B,Hue,Sat,Val);
    if (Hue>minH) and (Hue<maxH) and (Sat>minS) and (Sat<maxS) and (Val>minV) and
    (Val<maxV)then
    begin
    PH[3*x+2]:= R;
    PH[3*x+1]:= G;
    PH[3*x]:= B;
    end else
      begin
        PH[3*x+2]:= 0;
        PH[3*x+1]:= 0;
        PH[3*x]:= 0;
      end;
  end;
 end;
end;

procedure BGR2GRAY(var image1:Timage);
var
  PC, PH: PByteArray;
  R,G,B,K:byte;
  x,y:integer;
  Hue,Sat,Val:Double;
begin
    for y:=0 to Image1.Picture.Height-1 do
    begin
      PC := Image1.Picture.Bitmap.ScanLine[y];
      PH := Image1.Picture.Bitmap.ScanLine[y];
      for x:=0 to Image1.Picture.Width-1 do
        begin
          R := PC[3*x+2];
          G := PC[3*x+1];
          B := PC[3*x];
          RGB2HSV(R,G,B,Hue,Sat,Val);
      if (Hue>minH) and (Hue<maxH) or (Sat>minS) and (Sat<maxS) or (Val>minV) and (Val<maxV)then
      begin
        K := Round((R+G+B)/3);
      end
      else
      begin
        K:=0;
      end;
          PH[3*x+2] := K;
          PH[3*x+1] := K;
          PH[3*x] := K;
        end;
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


procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if (cv=1) then
  begin
     samplegrabber1.GetBitmap(image1.Picture.Bitmap);
     default(image1);
  end
  else if (cv=2) then
  begin
     samplegrabber1.GetBitmap(image1.Picture.Bitmap);
     BGR2GRAY(image1);
  end
  else if (cv=3) then
  begin
  samplegrabber1.GetBitmap(image1.Picture.Bitmap);
  BGR2BINER(image1);
  end
  else if (cv=4) then
  begin
  samplegrabber1.GetBitmap(image1.Picture.Bitmap);
  BGRTHRES(image1);
  end
  else if (cv=5) then
  begin
  samplegrabber1.GetBitmap(image1.Picture.Bitmap);
  minH:=146; maxH:=176; minS:=25; maxS:=92; minV:=23; maxV:=75;
  BGRTHRES(image1);
  end
    else if (cv=6) then
  begin
  samplegrabber1.GetBitmap(image1.Picture.Bitmap);
  minH:=0; maxH:=10; minS:=50; maxS:=100; minV:=50; maxV:=100;
  BGRTHRES(image1);
  end
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  cv:=3;
  timer1.Enabled:=true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  timer1.Enabled:=false;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
  minH:=scrollbar1.Position;
  label1.Caption:=inttostr(minH);
end;

procedure TForm1.ScrollBar6Change(Sender: TObject);
begin
  maxV:=scrollbar6.Position;
  label6.Caption:=inttostr(maxV);
end;


procedure TForm1.ScrollBar4Change(Sender: TObject);
begin
  maxH:=scrollbar4.Position;
  label4.Caption:=inttostr(maxH);
end;

procedure TForm1.ScrollBar2Change(Sender: TObject);
begin
  minS:=scrollbar2.Position;
  label2.Caption:=inttostr(minS);
end;

procedure TForm1.ScrollBar5Change(Sender: TObject);
begin
  maxS:=scrollbar5.Position;
  label5.Caption:=inttostr(maxS);
end;

procedure TForm1.ScrollBar3Change(Sender: TObject);
begin
  minV:=scrollbar3.Position;
  label3.Caption:=inttostr(minV);
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

procedure TForm1.Button6Click(Sender: TObject);
begin
SavePictureDialog1.Filter := 'Windows Bitmap (.bmp; *.dib)|.bmp;.dib|' + 'JPEG Bitmap (.jpg; .jpeg)|.jpg;.jpeg|' + 'TIF Bitmap (.tif; .tiff)|.tif;.tiff|' + 'Compuserve Bitmap (.gif)|.gif|' + 'Portable Network Graphics (.png)|*.png|';
if SavePictureDialog1.Execute then
Image1.Picture.Graphic.SaveToFile(SavePictureDialog1.FileName);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  cv:=1;
  timer1.Enabled:=true;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  cv:=2;
  timer1.Enabled:=true;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  cv:=4;
  timer1.Enabled:=true;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  cv:=5;
  timer1.Enabled:=true;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  cv:=6;
  timer1.Enabled:=true;
end;

end.
