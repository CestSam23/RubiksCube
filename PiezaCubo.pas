unit PiezaCubo;

interface

uses
  Graphics,
  Types;
type
  TPoint3d = packed record
    x: Real;
    y: Real;
    z: Real;
  end;

  TPiezaCubo = class
    private
      OriginCube : array[1..10] of TPoint3d;
      temporalCube : array[1..10] of TPoint3d;
      toPaintCube : array[1..10] of TPoint3d;
      originPosition : TPoint3d;
      position : TPoint3d;

      //New form of implementing the cubes
      Face : Array[0..5,0..3] of TPoint3d;
      ColorOfFace : Array[0..5] of TColor;
      Distance : array[0..5] of Real;
      Order : array[0..5] of Integer;
      ScreenFace : array[0..3] of TPoint;


      procedure copyOnTemporal();
      procedure copyOnToPaint();
    public
      constructor Create;overload;
      constructor Create(x,y,z : integer; factor : Real); overload;
      procedure scaleBy(factor :Real);
      procedure traslate(x, y, z : Integer);
      procedure rotateOnCenter(alphaX, alphaY, alphaZ:Real);
      procedure rotateOnX(alpha: Real);
      procedure rotateOnY(alpha: Real);
      procedure rotateOnZ(alpha: Real);
      procedure paintFront();
      procedure paintBack();
      procedure paintLeft();
      procedure paintRight();
      procedure paintDown();
      procedure paintUp();
      procedure paint(ACanvas: TCanvas);
      function getposition():TPoint3D;
  end;

implementation

constructor TPiezaCubo.Create;
var
  TamFig : real;
  i: integer;
begin
  //Initialize the points and creates the neccesary to create a cube of 1by1
  TamFig := 1;
  originCube[1].x:= +TamFig;   originCube[1].y:= +TamFig;   originCube[1].z:= -TamFig;
  originCube[2].x:= +TamFig;   originCube[2].y:= -TamFig;   originCube[2].z:= -TamFig;
  originCube[3].x:= -TamFig;   originCube[3].y:= -TamFig;   originCube[3].z:= -TamFig;
  originCube[4].x:= -TamFig;   originCube[4].y:= +TamFig;   originCube[4].z:= -TamFig;
  originCube[5].x:= +TamFig;   originCube[5].y:= +TamFig;   originCube[5].z:= -TamFig;

  originCube[6].x:= +TamFig;   originCube[6].y:= +TamFig;   originCube[6].z:= +TamFig;
  originCube[7].x:= +TamFig;   originCube[7].y:= -TamFig;   originCube[7].z:= +TamFig;
  originCube[8].x:= -TamFig;   originCube[8].y:= -TamFig;   originCube[8].z:=+ TamFig;
  originCube[9].x:= -TamFig;   originCube[9].y:= +TamFig;   originCube[9].z:= +TamFig;
  originCube[10].x:= +TamFig;  originCube[10].y:= +TamFig;  originCube[10].z:= +TamFig;

    //Save the points.
    copyOnTemporal();
    copyOnToPaint();
    Originposition.x := 0; Originposition.y:= 0; Originposition.z := 0;
end;

constructor TPiezaCubo.Create(x: Integer; y: Integer; z: Integer; factor: Real);

function Point3d(X,Y,Z: Integer) : TPoint3d;
begin
  Result.x := x;
  Result.y := y;
  Result.z := z;
end;

var
  TamFig : real;
  i: integer;
begin


  


  //Initialize the points and creates the neccesary to create a cube of 1by1
  TamFig := 1;
  originCube[1].x:= +TamFig;   originCube[1].y:= +TamFig;   originCube[1].z:= -TamFig;
  originCube[2].x:= +TamFig;   originCube[2].y:= -TamFig;   originCube[2].z:= -TamFig;
  originCube[3].x:= -TamFig;   originCube[3].y:= -TamFig;   originCube[3].z:= -TamFig;
  originCube[4].x:= -TamFig;   originCube[4].y:= +TamFig;   originCube[4].z:= -TamFig;
  originCube[5].x:= +TamFig;   originCube[5].y:= +TamFig;   originCube[5].z:= -TamFig;

  originCube[6].x:= +TamFig;   originCube[6].y:= +TamFig;   originCube[6].z:= +TamFig;
  originCube[7].x:= +TamFig;   originCube[7].y:= -TamFig;   originCube[7].z:= +TamFig;
  originCube[8].x:= -TamFig;   originCube[8].y:= -TamFig;   originCube[8].z:=+ TamFig;
  originCube[9].x:= -TamFig;   originCube[9].y:= +TamFig;   originCube[9].z:= +TamFig;
  originCube[10].x:= +TamFig;  originCube[10].y:= +TamFig;  originCube[10].z:= +TamFig;
  //Escalates the cube by a factor of x, and traslates it to the wished position (Origin)
  for i:= 1 to 10 do
    begin
      originCube[i].x:=(originCube[i].x*factor)+(x*factor);
      originCube[i].y:=(originCube[i].y*factor)+(y*factor);
      originCube[i].z:=(originCube[i].z*factor)+(z*factor);
    end;

    //Save the points. Now the center of the cube is in (x,y,z)*factor
    copyOnTemporal();
    copyOnToPaint();
    Originposition.x := x*factor; Originposition.y := y*factor; Originposition.z := z*factor;
end;


procedure TPiezaCubo.scaleBy(factor: Real);
begin

end;

//Simply get the coords of the origin, and adds it to the position point
procedure TPiezaCubo.traslate(x: Integer; y: Integer; z: Integer);
begin
  position.x := x;
  position.y := y;
  position.z := z;
end;

procedure TPiezaCubo.rotateOnCenter(alphaX: Real; alphaY: Real; Alphaz: Real);
var
  i : integer;
  xAux, yAux, zAux: Real;
begin
  alphaX:=(alphaX*Pi)/180;
  alphaY:=(alphaY*Pi)/180;
  alphaZ:=(alphaZ*Pi)/180;



end;

procedure TPiezaCubo.rotateOnX(alpha: Real);
var
  i : integer;
  yAux, zAux: Real;

begin
  alpha:=(alpha*Pi)/180;

  for i := 1 to 10 do
    begin
      yAux := (toPaintCube[i].y * COS( -alpha )) + (toPaintCube[i].z * SIN( -alpha ));
      zAux := -(toPaintCube[i].y * SIN( -alpha )) + (toPaintCube[i].z * COS( -alpha ));
      toPaintCube[i].y := yAux;
      toPaintCube[i].z := zAux;
    end;

end;

procedure TPiezaCubo.rotateOnY(alpha: Real);
var
  i : integer;
  xAux, zAux : Real;
begin
  alpha:=(alpha*Pi)/180;
  for i:= 1 to 10 do
    begin
      xAux:= -(toPaintCube[i].z*SIN(-alpha)) + (toPaintCube[i].x*COS(-alpha));
      zAux:= (toPaintCube[i].z*COS(-alpha)) + (toPaintCube[i].x*SIN(-alpha));
      toPaintCube[i].x:=xAux;
      toPaintCube[i].z:=zAux;
    end;

end;

procedure TPiezaCubo.rotateOnZ(alpha: Real);
var
  i: integer;
  xAux,yAux: Real;
begin
    alpha:=(alpha*PI)/180;
  for i:= 1 to 10 do
    begin
      xAux:= (toPaintCube[i].x*COS(-alpha)) + (toPaintCube[i].y*SIN(-alpha));
      yAux:= -(toPaintCube[i].x*SIN(-alpha)) + (toPaintCube[i].y*COS(-alpha));
      toPaintCube[i].x:=xAux;
      toPaintCube[i].y:=yAux;
    end;

end;

procedure TPiezaCubo.paintFront;
begin

end;

procedure TPiezaCubo.paintBack;
begin

end;

procedure TPiezaCubo.paintLeft;
begin

end;

procedure TPiezaCubo.paintRight;
begin

end;

procedure TPiezaCubo.paintDown;
begin

end;

procedure TPiezaCubo.paintUp;
begin

end;

procedure TPiezaCubo.paint(ACanvas: TCanvas);
var
  P, Q: TPoint;
  i: Integer;
begin
  // Aplica traslación 2D al cubo
  for i := 1 to 4 do
  begin
    P.x := Round(toPaintCube[i].x + position.x);
    P.y := Round(toPaintCube[i].y + position.y);
    Q.x := Round(toPaintCube[i + 1].x + position.x);
    Q.y := Round(toPaintCube[i + 1].y + position.y);
    ACanvas.Pen.Color := clBlue; // Cara azul
    ACanvas.Pen.Width := 3;
    ACanvas.MoveTo(P.x, P.y);
    ACanvas.LineTo(Q.x, Q.y);
    ACanvas.Pen.Color := clBlack;
  end;

  for i := 6 to 9 do
  begin
    P.x := Round(toPaintCube[i].x + position.x);
    P.y := Round(toPaintCube[i].y + position.y);
    Q.x := Round(toPaintCube[i + 1].x + position.x);
    Q.y := Round(toPaintCube[i + 1].y + position.y);
    ACanvas.Pen.Color := clRed; // Cara roja
    ACanvas.Pen.Width := 3;
    ACanvas.MoveTo(P.x, P.y);
    ACanvas.LineTo(Q.x, Q.y);
    ACanvas.Pen.Color := clBlack;
  end;

  for i := 1 to 4 do
  begin
    P.x := Round(toPaintCube[i].x + position.x);
    P.y := Round(toPaintCube[i].y + position.y);
    Q.x := Round(toPaintCube[i + 5].x + position.x);
    Q.y := Round(toPaintCube[i + 5].y + position.y);
    ACanvas.Pen.Color := clGreen; // Cara verde
    ACanvas.Pen.Width := 3;
    ACanvas.MoveTo(P.x, P.y);
    ACanvas.LineTo(Q.x, Q.y);
    ACanvas.Pen.Color := clBlack;
  end;
end;


procedure TPiezaCubo.copyOnTemporal;
var
  i : integer;
begin
  for i := 1 to 10 do
    begin
      temporalCube[i].x := originCube[i].x;
      temporalCube[i].y := originCube[i].y;
      temporalCube[i].z := originCube[i].z;
    end;
end;

procedure TPiezaCubo.copyOnToPaint;
var
  i: integer;
begin
  for i := 1 to 10 do
    begin
      toPaintCube[i].x := temporalCube[i].x;
      toPaintCube[i].y := temporalCube[i].y;
      toPaintCube[i].z := temporalCube[i].z;
    end;
end;

function TPiezaCubo.getposition;
begin
  result.x := self.originPosition.x;
  result.y := self.originPosition.y;
  result.z := self.originPosition.z;
end;



end.
