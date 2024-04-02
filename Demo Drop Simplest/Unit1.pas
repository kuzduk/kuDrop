unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellApi, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);

    private
      procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



//------------------------------------------------------------------------------ Create
procedure TForm1.FormCreate(Sender: TObject);
begin
DragAcceptFiles(Form1.Handle, true);
end;




//------------------------------------------------------------------------------ Drop
procedure TForm1.WMDropFiles(var Msg: TWMDropFiles);
//uses ShellApi;
const
  maxlen = 254;

var
  i, icount : integer;
  h: THandle;
  s: string;
  pchr: array[0..maxlen] of char;



begin

h := Msg.Drop;

icount := DragQueryFile(h, Dword(-1), nil, 0);
for i := 0 to icount - 1
do
begin
  DragQueryFile(h, i, pchr, maxlen);
  s := s + string(pchr) + #13#10;
end;   


ShowMessage(s);


DragFinish(h); //???


end;




end.
