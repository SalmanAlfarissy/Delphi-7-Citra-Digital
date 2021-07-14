program job10_Alfarissy;

uses
  Forms,
  job10_Salman in 'job10_Salman.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
