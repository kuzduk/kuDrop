object Form1: TForm1
  Left = 236
  Top = 280
  Caption = 'kuDrop DEMO'
  ClientHeight = 564
  ClientWidth = 595
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    595
    564)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 24
    Top = 16
    Width = 281
    Height = 19
    Caption = #1055#1077#1088#1077#1090#1072#1089#1082#1080#1074#1072#1085#1080#1077' '#1092#1072#1081#1083#1086#1074' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1091':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 24
    Top = 48
    Width = 547
    Height = 75
    Anchors = [akLeft, akTop, akRight]
    Caption = #1055#1077#1088#1077#1090#1072#1097#1080#1090#1077' '#1092#1072#1081#1083#1099' '#1080#1083#1080' '#1087#1072#1087#1082#1080' '#1085#1072' '#1101#1090#1091' '#1087#1072#1085#1077#1083#1100
    Color = 8845736
    Ctl3D = True
    DragMode = dmAutomatic
    ParentCtl3D = False
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 24
    Top = 137
    Width = 547
    Height = 334
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object btn_Sait: TButton
    Left = 8
    Top = 529
    Width = 171
    Height = 27
    Cursor = crHandPoint
    Anchors = [akLeft, akBottom]
    Caption = #1089#1072#1081#1090' '#1072#1074#1090#1086#1088#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 121
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btn_SaitClick
  end
  object btn_Mail: TButton
    Left = 8
    Top = 496
    Width = 171
    Height = 27
    Cursor = crHandPoint
    Anchors = [akLeft, akBottom]
    Caption = 'kuzduk@mail.ru'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 121
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btn_MailClick
  end
end
