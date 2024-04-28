unit RubiksCubeObject;

interface

uses
  Graphics,
  Types,
  PiezaCubo,
  Classes,
  RotationRegistry;

type
  TRubiksCubeObject = class
    private
      rotationRegistry : TList;
      cube: array[0..2, 0..2, 0..2] of TPiezaCubo;

      hasRotated : TPoint3d;
      center : TPoint;
      canva  : TCanvas;

      procedure resetOriginal();
      procedure returnRotated();

    public
      constructor Create; overload;
      constructor Create(x,y:Integer; ACanvas:TCanvas); overload;
       destructor Destroy; override; // Destructor
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

destructor TRubiksCubeObject.Destroy;
var
  i: Integer;
begin
  // Liberar la memoria de cada objeto en la lista
  for i := 0 to rotationRegistry.Count - 1 do
  begin
    TObject(rotationRegistry.Items[i]).Free;
  end;
  // Liberar la memoria de la lista
  rotationRegistry.Free;
  inherited;
end;


constructor TRubiksCubeObject.Create(x: Integer; y: Integer; ACanvas:TCanvas);
var
  i,j,k : integer;
begin

  rotationRegistry := TList.Create;
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
Rotation : TRotationRegistry;
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
    Rotation := TROtationRegistry.Create(0,5,0);
    rotationRegistry.Add(rotation);
    paint();
end;

procedure TRubiksCubeObject.XAxisRotate;
var
i,j,k:Integer;
rotation : TRotationRegistry;
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
    Rotation := TROtationRegistry.Create(5,0,0);
    rotationRegistry.Add(rotation);
    paint;
end;

procedure TRubiksCubeObject.zAxisRotate;
var
i,j,k:Integer;
rotation : TRotationRegistry;
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
    Rotation := TROtationRegistry.Create(0,0,5);
    rotationRegistry.Add(rotation);
    paint;

end;


procedure TRubiksCubeObject.U();
var
  temporal : TPiezaCubo;
  i,j,k: integer;
begin

  resetOriginal;


  temporal := cube[0,1,0];
  cube[0,1,0] := cube[0,2,1];
  cube[0,2,1] := cube[0,1,2];
  cube[0,1,2] := cube[0,0,1];
  cube[0,0,1] := temporal;


  temporal := cube[0,0,0];
  cube[0,0,0] := cube[0,2,0];
  cube[0,2,0] := cube[0,2,2];
  cube[0,2,2] := cube[0,0,2];
  cube[0,0,2] := temporal;

  //SEEMS LIKE
  //Mis movimientos respecto al eje y estan invertidos
  cube[0,1,0].rotateLayerY(-90);
  cube[0,2,1].rotateLayerY(-90);
  cube[0,1,2].rotateLayerY(-90);
  cube[0,0,1].rotateLayerY(-90);
  cube[0,0,0].rotateLayerY(-90);
  cube[0,2,0].rotateLayerY(-90);
  cube[0,2,2].rotateLayerY(-90);
  cube[0,0,2].rotateLayerY(-90);
  cube[0,1,1].rotateLayerY(-90);


  returnRotated;
  paint();
end;

procedure TRubiksCubeObject.UPrim();
begin

end;

procedure TRubiksCubeObject.D();
var
  temporal : TPiezaCubo;
begin
  resetOriginal;

   temporal := cube[2,2,0];
  cube[2,2,0] := cube[2,0,0];
  cube[2,0,0] := cube[2,0,2];
  cube[2,0,2] := cube[2,2,2];
  cube[2,2,2] := temporal;
  
  temporal := cube[2,1,0];
  cube[2,1,0] := cube[2,0,1];
  cube[2,0,1] := cube[2,1,2];
  cube[2,1,2] := cube[2,2,1];
  cube[2,2,1] := temporal;

  cube[2,0,0].rotateLayerY(90);
  cube[2,1,0].rotateLayerY(90);
  cube[2,2,0].rotateLayerY(90);
  cube[2,0,1].rotateLayerY(90);
  cube[2,1,1].rotateLayerY(90);
  cube[2,2,1].rotateLayerY(90);
  cube[2,0,2].rotateLayerY(90);
  cube[2,1,2].rotateLayerY(90);
  cube[2,2,2].rotateLayerY(90);

  returnRotated;
  paint;

end;

procedure TRubiksCubeObject.DPrim();
begin
  // Implementación de la rotación inversa de la capa inferior (Down)
end;

procedure TRubiksCubeObject.F();
var
  temporal : TPiezaCubo;
begin
  // Guardar el estado original del cubo
  resetOriginal;

  temporal := cube[0,0,0];
  cube[0,0,0] := cube[2,0,0];
  cube[2,0,0] := cube[2,2,0];
  cube[2,2,0] := cube[0,2,0];
  cube[0,2,0] := temporal;
  
  temporal := cube[0,1,0];
  cube[0,1,0] := cube[1,0,0];
  cube[1,0,0] := cube[2,1,0];
  cube[2,1,0] := cube[1,2,0];
  cube[1,2,0] := temporal;

  // Rotar las capas correspondientes en sentido antihorario alrededor del eje z
  cube[0,0,0].rotateLayerZ(90);
  cube[0,2,0].rotateLayerZ(90);
  cube[2,2,0].rotateLayerZ(90);
  cube[2,0,0].rotateLayerZ(90);
  cube[0,1,0].rotateLayerZ(90);
  cube[1,2,0].rotateLayerZ(90);
  cube[2,1,0].rotateLayerZ(90);
  cube[1,0,0].rotateLayerZ(90);

  // Actualizar la visualización del cubo
  returnRotated;
  paint();
end;



procedure TRubiksCubeObject.FPrim();
begin
  // Implementación de la rotación inversa de la capa frontal (Front)
end;

procedure TRubiksCubeObject.B();
var
  temporal: TPiezaCubo;
begin
  // Guardar el estado original del cubo
  resetOriginal;

  // Intercambio de aristas
  temporal := cube[0,1,2];
  cube[0,1,2] := cube[1,0,2];
  cube[1,0,2] := cube[2,1,2];
  cube[2,1,2] := cube[1,2,2];
  cube[1,2,2] := temporal;

  temporal := cube[0,0,2];
  cube[0,0,2] := cube[2,0,2];
  cube[2,0,2] := cube[2,2,2];
  cube[2,2,2] := cube[0,2,2];
  cube[0,2,2] := temporal;

  // Rotar las capas correspondientes
  cube[0,0,2].rotateLayerZ(90);
  cube[0,2,2].rotateLayerZ(90);
  cube[2,2,2].rotateLayerZ(90);
  cube[2,0,2].rotateLayerZ(90);
  cube[1,0,2].rotateLayerZ(90);
  cube[2,1,2].rotateLayerZ(90);
  cube[1,2,2].rotateLayerZ(90);
  cube[0,1,2].rotateLayerZ(90);

  // Actualizar la visualización del cubo
  returnRotated;
  paint();
end;



procedure TRubiksCubeObject.BPrim();
begin
  // Implementación de la rotación inversa de la capa posterior (Back)
end;

procedure TRubiksCubeObject.R();
var
  temporal : TPiezaCubo;
  i,j,k: integer;
begin
  // Guardar el estado original del cubo
  resetOriginal;

  temporal := cube[0,2,0];
  cube[0,2,0] := cube[2,2,0];
  cube[2,2,0] := cube[2,2,2];
  cube[2,2,2] := cube[0,2,2];
  cube[0,2,2] := temporal;


  temporal := cube[1,2,0];
  cube[1,2,0] := cube[2,2,1];
  cube[2,2,1] := cube[1,2,2];
  cube[1,2,2] := cube[0,2,1];
  cube[0,2,1] := temporal;

  // Rotar las capas correspondientes
  cube[0,2,0].rotateLayerX(90);
  cube[0,2,2].rotateLayerX(90);
  cube[2,2,2].rotateLayerX(90);
  cube[2,2,0].rotateLayerX(90);
  cube[0,2,1].rotateLayerX(90);
  cube[1,2,0].rotateLayerX(90);
  cube[1,2,2].rotateLayerX(90);
  cube[2,2,1].rotateLayerX(90);

  // Actualizar la visualización del cubo
  returnRotated;
  paint();
end;



procedure TRubiksCubeObject.RPrim();
begin
  // Implementación de la rotación inversa de la capa derecha (Right)
end;

procedure TRubiksCubeObject.L();
var
  temporal : TPiezaCubo;
begin
  // Guardar el estado original del cubo
  resetOriginal;

  temporal := cube[0,0,0];
  cube[0,0,0] := cube[0,0,2];
  cube[0,0,2] := cube[2,0,2];
  cube[2,0,2] := cube[2,0,0];
  cube[2,0,0] := temporal;

  temporal := cube[1,0,0];
  cube[1,0,0] := cube[0,0,1];
  cube[0,0,1] := cube[1,0,2];
  cube[1,0,2] := cube[2,0,1];
  cube[2,0,1] := temporal;

  // Rotar las capas correspondientes
  cube[0,0,0].rotateLayerX(-90);
  cube[0,0,2].rotateLayerX(-90);
  cube[2,0,2].rotateLayerX(-90);
  cube[2,0,0].rotateLayerX(-90);
  cube[0,0,1].rotateLayerX(-90);
  cube[1,0,0].rotateLayerX(-90);
  cube[1,0,2].rotateLayerX(-90);
  cube[2,0,1].rotateLayerX(-90);

  // Actualizar la visualización del cubo
  returnRotated;
  paint();
end;



procedure TRubiksCubeObject.LPrim();
var
  temporal : TPiezaCubo;
begin
  // Guardar el estado original del cubo
  resetOriginal;

  // Intercambios de aristas
  temporal := cube[1,0,0];
  cube[1,0,0] := cube[0,0,1];
  cube[0,0,1] := cube[1,0,2];
  cube[1,0,2] := cube[2,0,1];
  cube[2,0,1] := temporal;

  // Intercambios de esquinas
  temporal := cube[0,0,0];
  cube[0,0,0] := cube[0,0,2];
  cube[0,0,2] := cube[2,0,2];
  cube[2,0,2] := cube[2,0,0];
  cube[2,0,0] := temporal;

  // Rotar las capas correspondientes
  cube[0,0,0].rotateLayerX(-90);
  cube[0,0,2].rotateLayerX(-90);
  cube[2,0,2].rotateLayerX(-90);
  cube[2,0,0].rotateLayerX(-90);
  cube[0,0,1].rotateLayerX(-90);
  cube[1,0,0].rotateLayerX(-90);
  cube[1,0,2].rotateLayerX(-90);
  cube[2,0,1].rotateLayerX(-90);

  // Actualizar la visualización del cubo
  returnRotated;
  paint();
end;


procedure TRubiksCubeObject.resetOriginal;
var
  i,j,k : integer;
begin
  for i := 0 to 2 do
    for j := 0 to 2 do
      for k := 0 to 2 do
        begin
          cube[i,j,k].resetOriginal;
        end;

end;

procedure TRubiksCubeObject.returnRotated();
var
  i, j, k: Integer;
  m: Integer;
  auxiliar: TRotationRegistry;
begin
  for m := 0 to rotationRegistry.Count - 1 do
  begin
    auxiliar := TRotationRegistry(rotationRegistry.Items[m]);
  
    if auxiliar.GetXRotation() <> 0 then
    begin
      for i := 0 to 2 do
        for j := 0 to 2 do
          for k := 0 to 2 do
          begin
            cube[i, j, k].rotateOnX(5);
          end;      
    end;
    
    if auxiliar.GetYRotation() <> 0 then
    begin
      for i := 0 to 2 do
        for j := 0 to 2 do
          for k := 0 to 2 do
          begin
            cube[i, j, k].rotateOnY(5);
          end;       
    end;
    
    if auxiliar.GetZRotation() <> 0 then
    begin
      for i := 0 to 2 do
        for j := 0 to 2 do
          for k := 0 to 2 do
          begin
            cube[i, j, k].rotateOnZ(5);
          end;     
    end;
  end;
end;


end.
