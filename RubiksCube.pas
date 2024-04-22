unit RubiksCube;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, PiezaCubo;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  cubito,cubito2,cubito3 : TPiezaCubo;
begin
  cubito := TPiezaCubo.Create(3,3,3,20);
  cubito2 := TPiezaCubo.Create(1,1,1,20);
  cubito3 := TPiezaCubo.Create(3,1,1,20);


  cubito.rotateOny(10);
  cubito.rotateOnZ(-10);
  cubito.rotateOnX(-10);
  cubito.paint(Image1.Canvas);

end;

end.
