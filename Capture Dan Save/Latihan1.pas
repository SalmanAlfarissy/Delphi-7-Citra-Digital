unit Latihan1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DSPack, ExtCtrls, dsutil, directshow9, ExtDlgs, JPEG, DBCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    ComboBox1: TComboBox;
    VideoWindow1: TVideoWindow;
    FilterGraph1: TFilterGraph;
    SampleGrabber1: TSampleGrabber;
    Filter1: TFilter;
    Image1: TImage;
    SavePictureDialog1: TSavePictureDialog;
    OpenPictureDialog1: TOpenPictureDialog;

    Button6: TButton;
    Button7: TButton;
    Image2: TImage;
    Image3: TImage;


    
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  capenum : tsysdevenum;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var i : integer;
begin
Capenum := Tsysdevenum.create(CLSID_VideoInputDeviceCategory);
For i := 0 to capenum.CountFilters-1 do
begin
combobox1.Items.add(capenum.filters[i].friendlyName);
end;
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
samplegrabber1.GetBitmap(image1.Picture.bitmap);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
SavePictureDialog1.Filter := 'Windows Bitmap (.bmp; *.dib)|.bmp;.dib|' + 'JPEG Bitmap (.jpg; .jpeg)|.jpg;.jpeg|' + 'TIF Bitmap (.tif; .tiff)|.tif;.tiff|' + 'Compuserve Bitmap (.gif)|.gif|' + 'Portable Network Graphics (.png)|*.png|';
if SavePictureDialog1.Execute then
Image1.Picture.Graphic.SaveToFile(SavePictureDialog1.FileName);

end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if (OpenPictureDialog1.Execute) then
    begin
      Image2.Picture.LoadFromFile(
        OpenPictureDialog1.FileName);
      Image3.Picture := Image2.Picture;
    end
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





procedure TForm1.Button6Click(Sender: TObject);
var
  PC, PH: PByteArray;
  x, y: integer;
  R, G, B, K: byte;
begin
  for y:=0 to Image2.Picture.Height-1 do
    begin
      PC := Image2.Picture.Bitmap.ScanLine[y];
      PH := Image3.Picture.Bitmap.ScanLine[y];
      for x:=0 to Image2.Picture.Width-1 do
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
  Image3.Refresh;
end;


procedure TForm1.Button7Click(Sender: TObject);
var
  PC, PH: PByteArray;
  x, y: integer;
  R, G, B, K: byte;
begin
  for y:=0 to Image2.Picture.Height-1 do
    begin
      PC := Image2.Picture.Bitmap.ScanLine[y];
      PH := Image3.Picture.Bitmap.ScanLine[y];
      for x:=0 to Image2.Picture.Width-1 do
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
  Image3.Refresh;
end;
end.
