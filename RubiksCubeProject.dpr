program RubiksCubeProject;

uses
  Forms,
  RubiksCube in 'RubiksCube.pas' {Form1},
  RubiksCubeObject in 'RubiksCubeObject.pas',
  PiezaCubo in 'PiezaCubo.pas',
  RotationRegistry in 'RotationRegistry.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
