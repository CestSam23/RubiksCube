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
      originPosition : TPoint3d;
      position : TPoint3d;

      //New form of implementing the cubes
      Face : Array[0..5,0..3] of TPoint3d;
      ColorOfFace : Array[0..5] of TColor;
      Distance : array[0..5] of Real;
      Order : array[0..5] of Integer;
      caraPant : array[0..3] of TPoint;
      ScreenFace : array[0..3] of TPoint;
      p,Q : TPoint;
      OjoAObjeto, OjoAPantalla : Real;
      procedure orderPlanes();

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
      function getDistance():Integer;
  end;

implementation

constructor TPiezaCubo.Create;
begin
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
  i, j: integer;
begin

  colorOfFace[0] := clRed;
  colorOfFace[1] := clGreen;
  colorOfFace[2] := clBlue;
  colorOfFace[3] := clYellow;
  colorOfFace[4] := clAqua;
  colorOfFace[5] := clFuchsia;


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
      ojoAObjeto := 50*4;
      ojoAPantalla := 50*3;
      OriginPosition.x := x*factor; OriginPosition.y := y*factor; OriginPosition.z := z*factor;

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
        zAux:= (-face[i,j].y*sin(-alpha) + face[i,j].z*COS(-alpha));
        face[i,j].y := yAux;
        face[i,j].z := zAux;
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

  procedure Perspectiva(x,y,z: Real; var xP, yP : integer);
  var
    xAux,yAux,zAux : Real;
  begin
    zAux := ojoAObjeto + z;
    xAux := (OjoAPantalla*x)/zAux;
    xP := Round(xAux+position.x);    //Traslate to the wished position
    yAux := (OjoAPAntalla*y) / zAux;
    yP := round(yAUx+position.y);
  end;

var
i,j,k : integer;
begin
  ACanvas.Pen.Color:=cLBlack;
  acanvas.Pen.Width := 2;
  self.orderPlanes;

  for k := 0 to 5 do
    begin
      i := order[k];
      for j := 0 to 3 do perspectiva(face[i,j].x,face[i,j].y,face[i,j].z,caraPant[j].X,caraPant[j].y);
      Acanvas.Brush.Color:= ColorofFace[i];
      ACanvas.Polygon(CaraPant);
    end;

    acanvas.Brush.Color := ClWhite;
    

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

function TPiezaCubo.getDistance;
begin

end;



end.
