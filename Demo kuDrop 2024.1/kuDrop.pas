unit kuDrop;
{
версия 2024.1 free
Модуль с помощью которого можно перетаскивать в свою программу из других.
Autor: Grigoriy Gorkun
kuzduk@mail.ru
http://kuzduk.ru/delphi/kulibrary
}

interface

uses
  Windows, Messages, Classes, SysUtils, AppEvnts, Controls, ShellAPI, FileCtrl,
  ActiveX, ComObj, ShlObj;

type
  TkuDrop = class(TApplicationEvents)

    protected
      procedure ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean); virtual;

    public
      Files: TStringList;
      OnDropFiles : TNotifyEvent;

      constructor Create(AOwner: TWinControl);
      destructor Destroy; override; 
  end;


implementation



//------------------------------------------------------------------------------ Create
constructor TkuDrop.Create(AOwner: TWinControl);
begin 
TApplicationEvents(Self).Create(AOwner);
Self.OnMessage := Self.ApplicationEventsMessage;
DragAcceptFiles(AOwner.Handle, true); //какой компонент будет приёмником
Files := TStringList.Create;
end;



//------------------------------------------------------------------------------ Destroy
destructor TkuDrop.Destroy;
begin

Files.Free;

//if TComponent(Owner) = nil then yy('yyyyyyyyyyyy');
//if FindComponent() then

//if TComponent(Owner) <> nil
//then
//if Assigned(Owner)
//and
//then DragAcceptFiles(TWinControl(Owner).Handle, false);

inherited;

end;


      
//------------------------------------------------------------------------------ Application Events Message
procedure TkuDrop.ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
var
  fCount, i: UINT;
  iFilePath: string;
  dwChars: DWORD;

const
  QUERY_FILES_COUNT = UINT($FFFFFFFF);

begin


if Msg.message <> WM_DROPFILES then exit;

if Msg.hwnd <> TWinControl(Self.Owner).Handle then exit;



if @self.OnDropFiles = nil
then//защита от выполнения
begin
  Handled := true;
  exit;
end;

// Событие поймано.
// отключаем пост обработку
Handled := true;
// обрабатываем событие
fCount := DragQueryFile(Msg.wParam, QUERY_FILES_COUNT, nil, 0);

if fCount = 0 then exit;

// чистим лист
Files.Clear;

try
  for i := 0 to fCount - 1
  do
  begin
      // GrцЯe des Buffers bestimmen
      dwChars := DragQueryFile(Msg.wParam, i, nil, 0);
      Inc(dwChars);  // Platz fьr Arnold
      SetLength(iFilePath, dwChars);
      // Dateinamen abrufen
      dwChars := DragQueryFile(Msg.wParam, i, PChar(iFilePath), dwChars);
      if dwChars > 0
      then
      begin
        SetLength(iFilePath, dwChars);  // Arnold entsorgen
        Files.Add(iFilePath);
      end;
  end;

// an der Abwurfstelle im Fenster eine anklickbare Markierung setzen
finally
  if @self.OnDropFiles <> nil then OnDropFiles(self);
end;



end;

      


end.
