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
      center : TPoint;
    public
      constructor Create; overload;
      constructor Create(x,y:Integer); overload;
      procedure paint(ACanvas:TCanvas);
      procedure YAxisRotate(Acanvas:TCanvas);
  end;
implementation

constructor TRubiksCubeObject.Create;
begin

end;

constructor TRubiksCubeObject.Create(x: Integer; y: Integer);
var
  i,j,k : integer;
begin
  //Front face
  cube[0,0,0] := TPiezaCubo.Create(-1,-1,2,20);
  cube[0,1,0] := TPiezaCubo.Create(0,-1,2,20);
  cube[0,2,0] := TPiezaCubo.Create(1,-1,2,20);
  cube[1,0,0] := TPiezaCubo.Create(-1,0,2,20);
  cube[1,1,0] := TPiezaCubo.Create(0,0,2,20);
  cube[1,2,0] := TPiezaCubo.Create(1,0,2,20);
  cube[2,0,0] := TPiezaCubo.Create(-1,1,2,20);
  cube[2,1,0] := TPiezaCubo.Create(0,1,2,20);
  cube[2,2,0] := TPiezaCubo.Create(1,1,2,20);

  //Middle face
  cube[0,0,1] := TPiezaCubo.Create(-1,-1,0,20);
  cube[0,1,1] := TPiezaCubo.Create(0,-1,0,20);
  cube[0,2,1] := TPiezaCubo.Create(1,-1,0,20);
  cube[1,0,1] := TPiezaCubo.Create(-1,0,0,20);
  cube[1,1,1] := TPiezaCubo.Create(0,0,0,20);
  cube[1,2,1] := TPiezaCubo.Create(1,0,0,20);
  cube[2,0,1] := TPiezaCubo.Create(-1,1,0,20);
  cube[2,1,1] := TPiezaCubo.Create(0,1,0,20);
  cube[2,2,1] := TPiezaCubo.Create(1,1,0,20);

  //Back face
  cube[0,0,2] := TPiezaCubo.Create(-1,-1,-2,20);
  cube[0,1,2] := TPiezaCubo.Create(0,-1,-2,20);
  cube[0,2,2] := TPiezaCubo.Create(1,-1,-2,20);
  cube[1,0,2] := TPiezaCubo.Create(-1,0,-2,20);
  cube[1,1,2] := TPiezaCubo.Create(0,0,-2,20);
  cube[1,2,2] := TPiezaCubo.Create(1,0,-2,20);
  cube[2,0,2] := TPiezaCubo.Create(-1,1,-2,20);
  cube[2,1,2] := TPiezaCubo.Create(0,1,-2,20);
  cube[2,2,2] := TPiezaCubo.Create(1,1,-2,20);

  center.x := x;
  center.y := y;
  for i := 0 to 2 do
    begin
      for j := 0 to 2 do
        begin
          for k:=0 to 2 do
            begin
              cube[i,j,k].traslate(center.x,center.y,0);
            end;

        end;
    end;

end;

procedure TRubiksCubeObject.paint(ACanvas: TCanvas);
var
i,j,k:integer;
begin
  Acanvas.Rectangle(-10,-10,1000,1000);
  for i := 0 to 2 do
    begin
      for j := 0 to 2 do
        begin
          for k:=0 to 2 do
            begin
              cube[i,j,k].paint(Acanvas);
            end;

        end;
    end;
end;


procedure TRubiksCubeObject.YAxisRotate(ACanvas :TCanvas);
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
              paint(ACanvas);
            end;

        end;
    end;
end;



end.
