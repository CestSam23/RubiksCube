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
      canva  : TCanvas;

    public
      constructor Create; overload;
      constructor Create(x,y:Integer; ACanvas:TCanvas); overload;
      procedure paint();
      procedure YAxisRotate();
      procedure XAxisRotate();
      procedure zAxisRotate();
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
  canva := ACanvas;
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

procedure TRubiksCubeObject.paint();
var
i,j,k:integer;
begin
  canva.Rectangle(-10,-10,1000,1000);
  for i := 0 to 2 do
    begin
      for j := 0 to 2 do
        begin
          for k:=0 to 2 do
            begin
              cube[i,j,k].paint(canva);
            end;

        end;
    end;
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
              paint();
            end;

        end;
    end;
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
              paint();
            end;

        end;
    end;
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
              paint();
            end;

        end;
    end;
end;



end.
