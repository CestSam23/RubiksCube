unit RubiksCube;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, PiezaCubo,RubiksCubeObject;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Panel2: TPanel;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Cube : TRubiksCubeObject;

implementation

{$R *.dfm}

procedure TForm1.Button13Click(Sender: TObject);
begin
  cube.XAxisRotate; 
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
cube.YAxisRotate;
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  cube.zAxisRotate;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  cube.U;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  cube := TRubiksCubeObject.Create(200,150,image1.Canvas);
  Cube.paint();
end;

end.
