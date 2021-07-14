unit salman_tugasbesar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, TeEngine, Series, TeeProcs, Chart, DSPack, jpeg;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    OpenDialog1: TOpenDialog;
    Chart1: TChart;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ScrollBar1: TScrollBar;
    Chart2: TChart;
    Chart3: TChart;
    Label4: TLabel;
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Shape1: TShape;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  gambar2:TBitmap;
  Aa,cek,stop : integer;
  mrh,merah,merah1,hju,hijau,hijau1,br,biru,biru1,yellow1 : integer;



implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
gambar2:=TBitmap.Create;
Scrollbar1.max:=Image1.Picture.Height;end;


procedure TForm1.Timer1Timer(Sender: TObject);
begin
Aa:=Aa+1;
Scrollbar1.Position := Aa;
if stop = ScrollBar1.Position then timer1.Enabled:=false;
if (cek = 1) then
begin
 edit1.Text := inttostr(Aa);
end


end;


procedure TForm1.Button2Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
Timer1.Enabled:= False;
end;


procedure TForm1.Button4Click(Sender: TObject);
begin
Timer1.Enabled:= True;
shape1.Brush.Color:=clwhite;
cek := 1;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
open : string;
begin
timer1.Enabled:=false; //program penormalan nilai

Aa:=0;
edit1.Text:=inttostr(Aa);
merah1 := 0;
edit2.Text:=inttostr(Merah);
hijau1 := 0;
edit3.Text:=inttostr(hijau);
biru1 := 0;
edit4.Text:=inttostr(biru1);

OpenDialog1.Execute; //program membuka gambar
open:=OpenDialog1.FileName;
Image1.Picture.LoadFromFile(Open);
Scrollbar1.Enabled := True;
gambar2.Assign(Image1.Picture);
Scrollbar1.Max:=Image1.Picture.Height;stop:=Image1.Picture.Height;end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
var
 red,green,blue:byte;
 i,j,lebar:integer;
 warna:TColor;
 garis:TBitmap;begin
 Series1.Clear;
 Series2.Clear;
 Series3.Clear;
 j:=Scrollbar1.Position;
 lebar:=image1.Picture.Bitmap.Width;
 garis:=TBitmap.Create;
 garis.Assign(gambar2);
 garis.Canvas.MoveTo(0,j);
 garis.Canvas.LineTo(lebar,j);

 for i:=0 to lebar -1 do
  begin
  warna:=Image1.Picture.Bitmap.Canvas.Pixels[i,j];
  red:=GetRValue(warna);
  green:=GetGValue(warna);
  blue:=GetBValue(warna);
  Series1.AddXY(i,red);
  Series2.AddXY(i,green);
  Series3.AddXY(i,blue);
  if (red = 255) or (red = 254) or (red = 253) or (red = 252) or (red = 251) or (red = 250) then
    begin
    mrh:=0;
    merah1 := merah1+mrh;
    edit2.Text:=inttostr(merah1);
    end
  else
    begin
    mrh:=red;
    merah1 := merah1+mrh;
    edit2.Text:=inttostr(merah1);
  end;
  if (green = 255) or (green = 254) or (green = 253) or (green = 252) or (green = 251) or (green = 250) then
    begin
    hju:=0;
    hijau1 := hijau1+hju;
    edit3.Text:=inttostr(hijau1);
    end
  else
    begin
    hju:=green;
    hijau1 := hijau1+hju;
    edit3.Text:=inttostr(hijau1);
    end;
  if (blue = 255) or (blue = 254) or (blue = 253) or (blue = 252) or (blue = 251) or (blue = 250) then
    begin
    br:=0;
    biru1 := biru1+br;
    edit4.Text:=inttostr(biru1);
    end
  else
    begin
    br:=blue;
    biru1 := biru1+br;
    edit4.Text:=inttostr(biru1);
    end;
 end;

  if (hijau1 > 500000) and (merah1 < 400000) then
  begin
  label4.Font.size:=13;
  shape1.Brush.Color:=clred;
  label4.Caption:= 'Muda';
  end

  else if (merah1 > 1300000) and (hijau1 < merah1) then
  begin
  label4.Font.size:=13;
  shape1.Brush.Color:=clgreen;
  label4.Caption:= 'Matang';
  end

  else if (merah1 > 400000) and (hijau1 < 1000000) then
  begin
  Label4.Font.size:=13;
  shape1.Brush.Color:=clyellow;
  label4.Caption:= 'Sedang';
  end

  else
  begin
  label4.Caption:= '';
  end;
 image1.Picture.Assign(garis);
 garis.Free;end;

end.
