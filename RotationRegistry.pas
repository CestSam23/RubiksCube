unit RotationRegistry;

interface

type
  TRotationRegistry = class
  private
    FXRotation: Integer;
    FYRotation: Integer;
    FZRotation: Integer;
  public
    constructor Create(XRotation, YRotation, ZRotation: Integer);
    function GetXRotation: Integer;
    procedure SetXRotation(Value: Integer);
    function GetYRotation: Integer;
    procedure SetYRotation(Value: Integer);
    function GetZRotation: Integer;
    procedure SetZRotation(Value: Integer);
    property XRotation: Integer read GetXRotation write SetXRotation;
    property YRotation: Integer read GetYRotation write SetYRotation;
    property ZRotation: Integer read GetZRotation write SetZRotation;
  end;

implementation

constructor TRotationRegistry.Create(XRotation, YRotation, ZRotation: Integer);
begin
  FXRotation := XRotation;
  FYRotation := YRotation;
  FZRotation := ZRotation;
end;

function TRotationRegistry.GetXRotation: Integer;
begin
  Result := FXRotation;
end;

procedure TRotationRegistry.SetXRotation(Value: Integer);
begin
  FXRotation := Value;
end;

function TRotationRegistry.GetYRotation: Integer;
begin
  Result := FYRotation;
end;

procedure TRotationRegistry.SetYRotation(Value: Integer);
begin
  FYRotation := Value;
end;

function TRotationRegistry.GetZRotation: Integer;
begin
  Result := FZRotation;
end;

procedure TRotationRegistry.SetZRotation(Value: Integer);
begin
  FZRotation := Value;
end;

end.

