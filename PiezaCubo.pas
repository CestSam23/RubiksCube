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
      OjoAObjeto, OjoAPantalla : Real;
      procedure orderPlanes();

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
  i, j: integer;
begin


  //Down
  Face[0,0] := Point3d(-1,1,-1);
  Face[0,1] := Point3d(1,1,-1);
  Face[0,2] := Point3d(1,-1,-1);
  Face[0,3] := Point3d(-1,-1,-1);

  //Up
  Face[1,0] := Point3d(-1,1,1);
  Face[1,1] := Point3d(-1,-1,1);
  Face[1,2] := Point3d(1,-1,1);
  Face[1,3] := Point3d(1,1,1);

  //Left
  Face[2,0] := Point3d(-1,-1,1);
  Face[2,1] := Point3d(-1,-1,-1);
  Face[2,2] := Point3d(1,-1,-1);
  Face[2,3] := Point3d(1,-1,1);

  //Front
  Face[3,0] := Point3d(1,-1,1);
  Face[3,1] := Point3d(1,-1,-1);
  Face[3,2] := Point3d(1,1,-1);
  Face[3,3] := Point3d(1,1,1);

  //Right
  Face[4,0] := Point3d(1,1,1);
  Face[4,1] := Point3d(1,1,-1);
  Face[4,2] := Point3d(-1,1,-1);
  Face[4,3] := Point3d(-1,1,1);

  //Back
  Face[5,0] := Point3d(-1,1,1);
  Face[5,1] := Point3d(-1,1,-1);
  Face[5,2] := Point3d(-1,-1,-1);
  Face[5,3] := Point3d(-1,-1,1);

  //Escalated the cube by a factor of x, and traslates it to the wished position(Origin)
  for i := 0 to 5 do
    for j := 0 to 3 do
      begin
        Face[i,j].x := (Face[i,j].x*factor) + (x*factor);
        Face[i,j].y := (Face[i,j].y*factor) + (y*factor);
        Face[i,j].z := (Face[i,j].z*factor) + (z*factor);
      end;

      OriginPosition.x := x*factor; OriginPosition.y := y*factor; OriginPosition.z := z*factor;
      


  //We cant delete this lines, yet. But will be deleted when the code update is finished
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
begin

end;

procedure TPiezaCubo.rotateOnX(alpha: Real);
var
  i,j : integer;
  yAux, zAux: Real;

begin
  alpha:=(alpha*Pi)/180;
  //New method to rotate
  for i := 0 to 5 do
    for j := 0 to 3 do
      begin
        yAux := (face[i,j].y * COS(-alpha) + face[i,j].z*SIN(-alpha));
        zAux:= (face[i,j].y*sin(-alpha) + face[i,j].z*COS(-alpha));
        face[i,j].y := yAux;
        face[i,j].z := zAux;
      end;
  //Old method
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
  i,j : integer;
  xAux, zAux : Real;
begin
  alpha:=(alpha*Pi)/180;

  for i := 0 to 5 do
    for j := 0 to 3 do
      begin
        xAux:= -(face[i,j].z*SIN(-alpha)) + (face[i,j].x*COS(-alpha));
        zAux:= (face[i,j].z*COS(-alpha)) + (face[i,j].x*SIN(-alpha));
        face[i,j].x:=xAux;
        face[i,j].z:=zAux;
      end;

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
  i,j: integer;
  xAux,yAux: Real;
begin
    alpha:=(alpha*PI)/180;

  for i := 0 to 5 do
    for j := 0 to 3 do
      begin
        xAux:= (face[i,j].x*COS(-alpha)) + (face[i,j].y*SIN(-alpha));
        yAux:= -(face[i,j].x*SIN(-alpha)) + (face[i,j].y*COS(-alpha));
        face[i,j].x:=xAux;
        face[i,j].y:=yAux;
      end;

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

procedure TPiezaCubo.orderPlanes;
var
  i,j,auxOrder : Integer;
  xAux,yAux,zAux,auxDistancia : Real;
begin
  //Calcula punto medio y distancia al observador
  for i := 0 to 5 do
    begin
      order[i] := i;
      xAux := (face[i,0].x + face[i,2].x) / 2;
      yAux := (face[i,0].y + face[i,2].y) / 2;
      zAux := (face[i,0].z + face[i,2].z) / 2 + OjoAObjeto;
      Distance[i] := sqrt((xAux*xAux)+(yAux*yAux)+(zAux*zAux));
    end;

    //Ordena planos en base a distancia, de mayor a menor
    for i := 0 to 5 do
      for j := 0 to 4 do
        begin
          if(distance[j]<distance[j+1])then
          begin
            auxDistancia := distance[j];
            auxOrder := order[j];
            distance[j] := distance[j+1];
            order[j] := order[j+1];
            distance[j+1] := auxDistancia;
            order[j+1] := auxOrder;
          end;
        end;
      

end;



end.
