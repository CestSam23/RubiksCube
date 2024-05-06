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
    Panel3: TPanel;
    ButtonXPosI: TButton;
    ButtonYPosI: TButton;
    BUttonZPosI: TButton;
    ComboBox: TComboBox;
    ButtonYNEgI: TButton;
    ButtonXNegI: TButton;
    ButtonZNegI: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure ButtonXNegIClick(Sender: TObject);
    procedure ButtonYNEgIClick(Sender: TObject);
    procedure ButtonZNegIClick(Sender: TObject);
    procedure BUttonZPosIClick(Sender: TObject);
    procedure ButtonYPosIClick(Sender: TObject);
    procedure ButtonXPosIClick(Sender: TObject);
    procedure ComboBoxChange(Sender: TObject);
    procedure ButtonLPrimClick(Sender: TObject);
    procedure ButtonRPrimClick(Sender: TObject);
    procedure ButtonBPrimClick(Sender: TObject);
    procedure ButtonFPrimClick(Sender: TObject);
    procedure ButtonDPrimClick(Sender: TObject);
    procedure ButtonUPrimClick(Sender: TObject);
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
  posA,posB,posC : integer;

implementation

{$R *.dfm}

procedure TForm1.ButtonXPosIClick(Sender: TObject);
begin
  cube.getCube(posA,posB,posC).rotateOnCenter(5,0,0);
  cube.paint;
end;

procedure TForm1.ButtonYPosIClick(Sender: TObject);
begin
  cube.getCube(posA,posB,posC).rotateOnCenter(0,5,0);
  cube.paint;
end;

procedure TForm1.BUttonZPosIClick(Sender: TObject);
begin
  cube.getCube(posA,posB,posC).rotateOnCenter(0,0,5);
  cube.paint;
end;

procedure TForm1.ButtonBClick(Sender: TObject);
begin
  cube.F;
  cube.F;
  cube.F;

end;

procedure TForm1.ButtonXNegIClick(Sender: TObject);
begin
  cube.getCube(posA,posB,posC).rotateOnCenter(-5,0,0);
  cube.paint;
end;

procedure TForm1.ButtonXPosClick(Sender: TObject);
begin
  cube.XAxisRotate;
end;

procedure TForm1.ButtonYNEgIClick(Sender: TObject);
begin
  cube.getCube(posA,posB,posC).rotateOnCenter(0,-5,0);
  cube.paint;
end;

procedure TForm1.ButtonYPosClick(Sender: TObject);
begin
cube.YAxisRotate;
end;

procedure TForm1.ButtonZNegIClick(Sender: TObject);
begin
  cube.getCube(posA,posB,posC).rotateOnCenter(0,0,-5);
  cube.paint;
end;

procedure TForm1.ButtonZPosClick(Sender: TObject);
begin
  cube.zAxisRotate;
end;

procedure TForm1.ComboBoxChange(Sender: TObject);
var
  inputStr : string;
begin
  inputStr := combobox.Text;
  posA := StrToInt(Copy(inputStr, 1, Pos(' ', inputStr) - 1));
  Delete(inputStr, 1, Pos(' ', inputStr));
  posB := StrToInt(Copy(inputStr, 1, Pos(' ', inputStr) - 1));
  Delete(inputStr, 1, Pos(' ', inputStr));
  posC := StrToInt(inputStr);
end;

procedure TForm1.ButtonUClick(Sender: TObject);
begin
  cube.U;
  cube.U;
  cube.U;
end;

procedure TForm1.ButtonUPrimClick(Sender: TObject);
begin
  cube.U;
end;

procedure TForm1.ButtonBPrimClick(Sender: TObject);
begin
  cube.F;
end;

procedure TForm1.ButtonDClick(Sender: TObject);
begin
  cube.D;
  cube.D;
  cube.D;
end;

procedure TForm1.ButtonDPrimClick(Sender: TObject);
begin
  cube.D;
end;

procedure TForm1.ButtonRClick(Sender: TObject);
begin
  cube.R;
  cube.R;
  cube.R;
end;

procedure TForm1.ButtonRPrimClick(Sender: TObject);
begin
  cube.R;
end;

procedure TForm1.ButtonLClick(Sender: TObject);
begin
  Cube.L;
  Cube.L;
  Cube.L;
end;

procedure TForm1.ButtonLPrimClick(Sender: TObject);
begin
  cube.L;
end;

procedure TForm1.ButtonFClick(Sender: TObject);
begin
  Cube.B;
end;

procedure TForm1.ButtonFPrimClick(Sender: TObject);
begin
  cube.B;
  cube.B;
  cube.B;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i,j,k : Integer;
begin
  cube := TRubiksCubeObject.Create(200,150,image1.Canvas);
  //image1.Picture.LoadFromFile('Fondo.bmp');
  Cube.paint();
  form1.Color :=clWebWheat;
  panel1.Color := clWebPapayaWhip;
  panel2.Color := clWebPapayaWhip;
  panel3.Color := clWebPapayaWhip;

  for i := 0 to 2 do
    for j := 0 to 2 do
      for k := 0 to 2 do
        combobox.AddItem((intToStr(k) + ' ' + intToStr(j) + ' ' + intToStr(i)),sender);

       

end;

end.
