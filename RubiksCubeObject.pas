unit RubiksCubeObject;

interface

uses
  Graphics,
  Types,
  PiezaCubo;

type
  TRubiksCubeObject = class
    private
      cube: array[0..2, 0..2, 0..2] of TPiezaCubo;
      hasRotated : TPoint3d;
      center : TPoint;
      canva  : TCanvas;
      procedure  returnToOriginal();
      procedure returnToRotated();

    public
      constructor Create; overload;
      constructor Create(x,y:Integer; ACanvas:TCanvas); overload;
      procedure paint();
      procedure YAxisRotate();
      procedure XAxisRotate();
      procedure zAxisRotate();
      procedure U();
      procedure UPrim();
      procedure D();
      procedure DPrim();
      procedure F();
      procedure FPrim();
      procedure B();
      procedure BPrim();
      procedure R();
      procedure RPrim();
      procedure L();
      procedure LPrim();

  end;
implementation

constructor TRubiksCubeObject.Create;
begin

end;

constructor TRubiksCubeObject.Create(x: Integer; y: Integer; ACanvas:TCanvas);
var
  i,j,k : integer;
begin
  //Front face
  cube[0,0,0] := TPiezaCubo.Create(-2,-2,2,20);
  cube[0,1,0] := TPiezaCubo.Create(0,-2,2,20);
  cube[0,2,0] := TPiezaCubo.Create(2,-2,2,20);
  cube[1,0,0] := TPiezaCubo.Create(-2,0,2,20);
  cube[1,1,0] := TPiezaCubo.Create(0,0,2,20);
  cube[1,2,0] := TPiezaCubo.Create(2,0,2,20);
  cube[2,0,0] := TPiezaCubo.Create(-2,2,2,20);
  cube[2,1,0] := TPiezaCubo.Create(0,2,2,20);
  cube[2,2,0] := TPiezaCubo.Create(2,2,2,20);

  //Middle face
  cube[0,0,1] := TPiezaCubo.Create(-2,-2,0,20);
  cube[0,1,1] := TPiezaCubo.Create(0,-2,0,20);
  cube[0,2,1] := TPiezaCubo.Create(2,-2,0,20);
  cube[1,0,1] := TPiezaCubo.Create(-2,0,0,20);
  cube[1,1,1] := TPiezaCubo.Create(0,0,0,20);
  cube[1,2,1] := TPiezaCubo.Create(2,0,0,20);
  cube[2,0,1] := TPiezaCubo.Create(-2,2,0,20);
  cube[2,1,1] := TPiezaCubo.Create(0,2,0,20);
  cube[2,2,1] := TPiezaCubo.Create(2,2,0,20);

  //Back face
  cube[0,0,2] := TPiezaCubo.Create(-2,-2,-2,20);
  cube[0,1,2] := TPiezaCubo.Create(0,-2,-2,20);
  cube[0,2,2] := TPiezaCubo.Create(2,-2,-2,20);
  cube[1,0,2] := TPiezaCubo.Create(-2,0,-2,20);
  cube[1,1,2] := TPiezaCubo.Create(0,0,-2,20);
  cube[1,2,2] := TPiezaCubo.Create(2,0,-2,20);
  cube[2,0,2] := TPiezaCubo.Create(-2,2,-2,20);
  cube[2,1,2] := TPiezaCubo.Create(0,2,-2,20);
  cube[2,2,2] := TPiezaCubo.Create(2,2,-2,20);

  for i := 0 to 2 do
    begin
      for j := 0 to 2 do
        begin
          for k:=0 to 2 do
            begin
              cube[i,j,k].traslate(x,y,0);
            end;

       end;
    end;

  hasRotated.x := 0;
  hasRotated.y := 0;
  hasRotated.z := 0;
  center.x := x;
  center.y := y;
  canva := ACanvas;


end;

procedure TRubiksCubeObject.paint();
var
i,j,k:integer;
distance : array[0..26] of Real;
cubesInOrder : array[0..26] of TPiezaCubo;
auxDistance : Real;
auxOrder : TPiezaCubo;
n : integer;
begin
  n := 0;
  //Here we decide the order to paint the cube
  canva.Rectangle(-10,-10,1000,1000);
  for i := 0 to 2 do
    begin
      for j := 0 to 2 do
        begin
          for k:=0 to 2 do
            begin
              distance[n] := cube[i,j,k].getDistance;
              cubesInOrder[n] := cube[i,j,k];
              n := n+1;
            end;
        end;
    end;

    for i := 0 to 26 do
      for j := 0 to 25 do
        begin
          if(distance[j]<distance[j+1])then
            begin
              auxDistance := distance[j];
              auxOrder := cubesInOrder[j];
              distance[j] := distance[j+1];
              cubesInOrder[j] := CubesInOrder[j+1];
              distance[j+1] := auxDistance;
              CubesInOrder[j+1] := auxOrder;
            end;
        end;

    for i := 0 to 26 do CubesInOrder[i].paint(canva);



end;


procedure TRubiksCubeObject.YAxisRotate();
var
i,j,k:Integer;
begin
  for i := 0 to 2 do
    begin
      for j := 0 to 2 do
        begin
          for k:=0 to 2 do
            begin
              cube[i,j,k].rotateOny(5);
            end;

        end;
    end;
    hasRotated.y := hasRotated.y + 5;
    paint();
end;

procedure TRubiksCubeObject.XAxisRotate;
var
i,j,k:Integer;
begin
  for i := 0 to 2 do
    begin
      for j := 0 to 2 do
        begin
          for k:=0 to 2 do
            begin
              cube[i,j,k].rotateOnx(5);
            end;

        end;
    end;
    hasRotated.x := hasRotated.x + 5;
    paint;
end;

procedure TRubiksCubeObject.zAxisRotate;
var
i,j,k:Integer;
begin
  for i := 0 to 2 do
    begin
      for j := 0 to 2 do
        begin
          for k:=0 to 2 do
            begin
              cube[i,j,k].rotateOnz(5);
            end;

        end;
    end;
    hasRotated.z := hasRotated.z +5;
    paint();

end;

procedure TRubiksCubeObject.U();
var
  temporal : TPiezaCubo;
begin

  temporal := cube[0,0,1];
  cube[0,0,1] := cube[0,1,0];
  cube[0,1,0] := cube [0,2,1];
  cube[0,2,1] := cube [0,1,2];
  cube[0,1,2] := temporal;

  temporal := cube[0,0,2];
  cube[0,0,2] := cube[0,0,0];
  cube[0,0,0] := cube[0,2,0];
  cube[0,2,0] := cube[0,2,2];
  cube[0,2,2] := temporal;

  returnToOriginal;
//  cube[0,1,0].rotateOnY(-90);
//  cube[0,2,1].rotateOnY(-90);
//  cube[0,1,2].rotateOnY(-90);
//  cube[0,0,1].rotateOnY(-90);
//  cube[0,0,0].rotateOnY(-90);
//  cube[0,2,0].rotateOnY(-90);
//  cube[0,2,2].rotateOnY(-90);
//  cube[0,0,2].rotateOnY(-90);


//  returnToRotated;
  paint();

end;

procedure TRubiksCubeObject.UPrim();
begin
  // Implementación de la rotación inversa de la capa superior (Up)
end;

procedure TRubiksCubeObject.D();
begin
  // Implementación de la rotación de la capa inferior (Down)
end;

procedure TRubiksCubeObject.DPrim();
begin
  // Implementación de la rotación inversa de la capa inferior (Down)
end;

procedure TRubiksCubeObject.F();
begin
  // Implementación de la rotación de la capa frontal (Front)
end;

procedure TRubiksCubeObject.FPrim();
begin
  // Implementación de la rotación inversa de la capa frontal (Front)
end;

procedure TRubiksCubeObject.B();
begin
  // Implementación de la rotación de la capa posterior (Back)
end;

procedure TRubiksCubeObject.BPrim();
begin
  // Implementación de la rotación inversa de la capa posterior (Back)
end;

procedure TRubiksCubeObject.R();
begin
  // Implementación de la rotación de la capa derecha (Right)
end;

procedure TRubiksCubeObject.RPrim();
begin
  // Implementación de la rotación inversa de la capa derecha (Right)
end;

procedure TRubiksCubeObject.L();
begin
  // Implementación de la rotación de la capa izquierda (Left)
end;

procedure TRubiksCubeObject.LPrim();
begin
  // Implementación de la rotación inversa de la capa izquierda (Left)
end;

procedure TRubiksCubeObject.returnToOriginal;
var
i,j,k:Integer;
begin
  for i := 0 to 2 do
    begin
      for j := 0 to 2 do
        begin
          for k:=0 to 2 do
            begin
              //cube[i,j,k].rotateOnX(-hasRotated.x);
             // cube[i,j,k].rotateOnY(-hasRotated.y);
              //cube[i,j,k].rotateOnz(-hasRotated.z);
            end;

        end;
    end;
end;

procedure TRubiksCubeObject.returnToRotated;
var
i,j,k:Integer;
begin
  for i := 0 to 2 do
    begin
      for j := 0 to 2 do
        begin
          for k:=0 to 2 do
            begin
              cube[i,j,k].rotateOnX(+hasRotated.x);
              cube[i,j,k].rotateOnY(+hasRotated.y);
              cube[i,j,k].rotateOnz(+hasRotated.z);
            end;

        end;
    end;
end;



end.
