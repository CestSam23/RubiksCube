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

  cube[0,1,0].rotateOnY(-90);
  cube[0,2,1].rotateOnY(-90);
  cube[0,1,2].rotateOnY(-90);
  cube[0,0,1].rotateOnY(-90);
  cube[0,0,0].rotateOnY(-90);
  cube[0,2,0].rotateOnY(-90);
  cube[0,2,2].rotateOnY(-90);
  cube[0,0,2].rotateOnY(-90);


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




end.
