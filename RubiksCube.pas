unit RubiksCube;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, PiezaCubo,RubiksCubeObject;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    ButtonU: TButton;
    ButtonUPrim: TButton;
    ButtonD: TButton;
    ButtonDPrim: TButton;
    ButtonR: TButton;
    ButtonRPrim: TButton;
    ButtonL: TButton;
    ButtonLPrim: TButton;
    ButtonF: TButton;
    ButtonFPrim: TButton;
    ButtonB: TButton;
    ButtonBPrim: TButton;
    Panel2: TPanel;
    ButtonXPos: TButton;
    ButtonYPos: TButton;
    ButtonZPos: TButton;
    procedure ButtonDClick(Sender: TObject);
    procedure ButtonBClick(Sender: TObject);
    procedure ButtonFClick(Sender: TObject);
    procedure ButtonLClick(Sender: TObject);
    procedure ButtonRClick(Sender: TObject);
    procedure ButtonUClick(Sender: TObject);
    procedure ButtonZPosClick(Sender: TObject);
    procedure ButtonYPosClick(Sender: TObject);
    procedure ButtonXPosClick(Sender: TObject);
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

procedure TForm1.ButtonBClick(Sender: TObject);
begin
  cube.B;
end;

procedure TForm1.ButtonXPosClick(Sender: TObject);
begin
  cube.XAxisRotate; 
end;

procedure TForm1.ButtonYPosClick(Sender: TObject);
begin
cube.YAxisRotate;
end;

procedure TForm1.ButtonZPosClick(Sender: TObject);
begin
  cube.zAxisRotate;
end;

procedure TForm1.ButtonUClick(Sender: TObject);
begin
  cube.U;
end;

procedure TForm1.ButtonDClick(Sender: TObject);
begin
  cube.D;
end;

procedure TForm1.ButtonRClick(Sender: TObject);
begin
  cube.R;
end;

procedure TForm1.ButtonLClick(Sender: TObject);
begin
  Cube.L;
end;

procedure TForm1.ButtonFClick(Sender: TObject);
begin
  Cube.F;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  cube := TRubiksCubeObject.Create(200,150,image1.Canvas);
  //image1.Picture.LoadFromFile('Fondo.bmp');
  Cube.paint();
  form1.Color :=clWebWheat;
  panel1.Color := clWebPapayaWhip;
  panel2.Color := clWebPapayaWhip;

  
end;

end.
