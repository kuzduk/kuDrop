unit Unit1;


interface

uses
  Forms, Controls, Classes, StdCtrls, ExtCtrls, ShellAPI, Windows,

//  kuModul,
  kuDrop;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Memo1: TMemo;
    btn_Sait: TButton;
    btn_Mail: TButton;

    procedure FormCreate(Sender: TObject);
    procedure btn_SaitClick(Sender: TObject);
    procedure btn_MailClick(Sender: TObject);

  private
    kuDrop1: TkuDrop;
    procedure OnDrop_From1(Sender: TObject);

  end;

var
  Form1: TForm1;

implementation


{$R *.dfm}




//------------------------------------------------------------------------------ Create
procedure TForm1.FormCreate(Sender: TObject);
begin
kuDrop1 := TkuDrop.Create(Panel1); //”казываем элемент приЄмник
kuDrop1.OnDropFiles := Self.OnDrop_From1; //”казываем обработку броска
end;


//------------------------------------------------------------------------------ ќбработка броска
procedure TForm1.OnDrop_From1(Sender: TObject);
begin
Memo1.Clear;
Memo1.Lines.AddStrings(kuDrop1.Files);
end;



//------------------------------------------------------------------------------ email
procedure TForm1.btn_MailClick(Sender: TObject);
begin
ShellExecute(Form1.Handle, nil, 'mailto:kuzduk@mail.ru?subject=kuDrop', nil, nil, SW_RESTORE);
end;

//------------------------------------------------------------------------------ sait
procedure TForm1.btn_SaitClick(Sender: TObject);
begin
ShellExecute(Form1.Handle, nil, 'https://kuzduk.ru/delphi/kulibrary', nil, nil, SW_RESTORE);
end;




end.
