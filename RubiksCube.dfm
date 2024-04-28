object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 600
  ClientWidth = 700
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 32
    Top = 40
    Width = 400
    Height = 300
  end
  object Panel1: TPanel
    Left = 480
    Top = 40
    Width = 185
    Height = 313
    Caption = 'Panel1'
    TabOrder = 0
    object Button1: TButton
      Left = 24
      Top = 24
      Width = 41
      Height = 25
      Caption = 'ButtonU'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 104
      Top = 24
      Width = 41
      Height = 25
      Caption = 'ButtonUPrim'
      TabOrder = 1
    end
    object Button3: TButton
      Left = 24
      Top = 64
      Width = 41
      Height = 25
      Caption = 'ButtonD'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 104
      Top = 64
      Width = 41
      Height = 25
      Caption = 'BUttonDPrim'
      TabOrder = 3
    end
    object Button5: TButton
      Left = 24
      Top = 104
      Width = 41
      Height = 25
      Caption = 'ButtonR'
      TabOrder = 4
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 104
      Top = 104
      Width = 41
      Height = 25
      Caption = 'ButtonRPrim'
      TabOrder = 5
    end
    object Button7: TButton
      Left = 24
      Top = 152
      Width = 41
      Height = 25
      Caption = 'ButtonL'
      TabOrder = 6
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 104
      Top = 152
      Width = 41
      Height = 25
      Caption = 'ButtonLPrim'
      TabOrder = 7
    end
    object Button9: TButton
      Left = 24
      Top = 200
      Width = 41
      Height = 25
      Caption = 'ButtonF'
      TabOrder = 8
      OnClick = Button9Click
    end
    object Button10: TButton
      Left = 104
      Top = 200
      Width = 41
      Height = 25
      Caption = 'ButtonFPrim'
      TabOrder = 9
    end
    object Button11: TButton
      Left = 24
      Top = 248
      Width = 41
      Height = 25
      Caption = 'ButtonB'
      TabOrder = 10
      OnClick = Button11Click
    end
    object Button12: TButton
      Left = 104
      Top = 248
      Width = 41
      Height = 25
      Caption = 'ButtonBPrim'
      TabOrder = 11
    end
  end
  object Panel2: TPanel
    Left = 472
    Top = 432
    Width = 185
    Height = 41
    Caption = 'Panel2'
    TabOrder = 1
    object Button13: TButton
      Left = 8
      Top = 8
      Width = 33
      Height = 25
      Caption = 'Button13'
      TabOrder = 0
      OnClick = Button13Click
    end
    object Button14: TButton
      Left = 64
      Top = 8
      Width = 33
      Height = 25
      Caption = 'Button13'
      TabOrder = 1
      OnClick = Button14Click
    end
    object Button15: TButton
      Left = 120
      Top = 8
      Width = 33
      Height = 25
      Caption = 'Button13'
      TabOrder = 2
      OnClick = Button15Click
    end
  end
end
