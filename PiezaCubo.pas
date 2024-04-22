unit PiezaCubo;

interface

uses
  Graphics;

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
      position : TPoint3d;
      procedure copyOnTemporal();
      procedure copyOnToPaint();
    public
      constructor Create;overload;
      constructor Create(x,y,z : integer; factor : Real); overload;
      procedure scaleBy(factor :Real);
      procedure traslate(x, y, z : Integer);
      procedure rotateOnCenter(alpha :Real);
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
    position.x := 0; position.y:= 0; position.z := 0;
end;

constructor TPiezaCubo.Create(x: Integer; y: Integer; z: Integer; factor: Real);
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
    position.x := x*factor; position.y := y*factor; position.z := z*factor;
end;


procedure TPiezaCubo.scaleBy(factor: Real);
begin

end;

procedure TPiezaCubo.traslate(x: Integer; y: Integer; z: Integer);
begin

end;

procedure TPiezaCubo.rotateOnCenter(alpha: Real);
begin

end;

procedure TPiezaCubo.rotateOnX(alpha: Real);
begin

end;

procedure TPiezaCubo.rotateOnY(alpha: Real);
begin

end;

procedure TPiezaCubo.rotateOnZ(alpha: Real);
begin

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
begin

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


end.