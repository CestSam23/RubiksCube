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
      actualCube : array[1..10] of TPoint3d;
      procedure copyOnTemporal();
      procedure copuOnActual();
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
begin

end;

constructor TPiezaCubo.Create(x: Integer; y: Integer; z: Integer; factor: Real);
begin

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
begin

end;

procedure TPiezaCubo.copuOnActual;
begin

end;


end.
