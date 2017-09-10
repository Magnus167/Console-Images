unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, pngimage, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Button1: TButton;

    procedure FormCreate(Sender: TObject);
    function ppf(imx: TImage; height, width: Uint64): Boolean;
    procedure Button1Click(Sender: TObject);
    function btw(cx: TColor): Boolean;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  h, w: Uint64;

implementation

{$R *.dfm}

function TForm1.btw(cx: TColor): Boolean;
var
  colorx: $0 .. $FFFFFFFF;
  r, g, b: Byte;
begin
  { colorx := ColorToRGB(cx);
    r := ($000000FF and colorx);
    g := ($0000FF00 and colorx) Shr 8;
    b := ($00FF0000 and colorx) Shr 16; }
  r := GetRValue(cx);
  g := GetGValue(cx);
  b := GetBValue(cx);
  if (r <= 123) and (g <= 123) and (b <= 123) then

    result := True
  else
    result := False;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin


    Screen.Cursor := crHourGlass;
    ppf(Image1, h, w);
    Screen.Cursor := crDefault;
    showmessage('Job Done!');
    Application.Terminate;



end;

procedure TForm1.FormCreate(Sender: TObject);
var
  ix, jx: Integer;

begin

  // rename the image file to yda and place it into the same directory as the EXE
   Image1.Picture.LoadFromFile(GetCurrentDir + '\yda.bmp'); //must be a BMP file or it will throw an error

    Image1.width := Image1.Picture.width;
    Image1.height := Image1.Picture.height;
    h := Image1.height;
    w := Image1.width;

  Image2.height := h;
  Image2.width := w;
  ShowMessage('Place the Image you want to use in the same folder as the EXE. It should be a BMP file. Works best with B&W Images.');

end;

function TForm1.ppf(imx: TImage; height, width: Uint64): Boolean;
var
  i: Integer;
  j: Integer;
  str: String;
  strs: TStringList;
  pix: Array of Array of String;
  sx : String;
  rx : Integer;
begin

  strs := TStringList.Create;
  setlength(pix, height, width);

  sx := 'Plato o Plomo';

  for i := 0 to width - 1 do
  begin
  //rx := Random(100);
   for j := 0 to height - 1 do

      if {NOT}(btw(imx.Canvas.Pixels[i, j])) then
        pix[i, j] := {sx[ (sx.Length+i) mod sx.Length ]} ( Char(Random(40)+48))  //characters you want to place at a black pixel
      else
        pix[i, j] := ' ';   //character you want to place in a white pixel
  end;


  for i := 0 to width - 1 do
  begin
    str := '';

    for j := 0 to width - 1 do
    begin
      str := str + (pix[j, i]);
    end;

    strs.Add(str);
  end;
  strs.SaveToFile(GetCurrentDir + '\yda.txt');    //the output will be in the same directory as the EXE

end;

end.
