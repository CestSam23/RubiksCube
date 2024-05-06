object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Cubo Rubik'
  ClientHeight = 746
  ClientWidth = 697
  Color = clInfoBk
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
    TabOrder = 0
    object ButtonU: TButton
      Left = 24
      Top = 24
      Width = 41
      Height = 25
      Caption = 'U'
      TabOrder = 0
      OnClick = ButtonUClick
    end
    object ButtonUPrim: TButton
      Left = 104
      Top = 24
      Width = 41
      Height = 25
      Caption = 'U'#39
      TabOrder = 1
      OnClick = ButtonUPrimClick
    end
    object ButtonD: TButton
      Left = 24
      Top = 64
      Width = 41
      Height = 25
      Caption = 'D'
      TabOrder = 2
      OnClick = ButtonDClick
    end
    object ButtonDPrim: TButton
      Left = 104
      Top = 64
      Width = 41
      Height = 25
      Caption = 'D'#39
      TabOrder = 3
      OnClick = ButtonDPrimClick
    end
    object ButtonR: TButton
      Left = 24
      Top = 104
      Width = 41
      Height = 25
      Caption = 'R'
      TabOrder = 4
      OnClick = ButtonRClick
    end
    object ButtonRPrim: TButton
      Left = 104
      Top = 104
      Width = 41
      Height = 25
      Caption = 'R'#39
      TabOrder = 5
      OnClick = ButtonRPrimClick
    end
    object ButtonL: TButton
      Left = 24
      Top = 152
      Width = 41
      Height = 25
      Caption = 'L'
      TabOrder = 6
      OnClick = ButtonLClick
    end
    object ButtonLPrim: TButton
      Left = 104
      Top = 152
      Width = 41
      Height = 25
      Caption = 'L'#39
      TabOrder = 7
      OnClick = ButtonLPrimClick
    end
    object ButtonF: TButton
      Left = 24
      Top = 200
      Width = 41
      Height = 25
      Caption = 'F'
      TabOrder = 8
      OnClick = ButtonFClick
    end
    object ButtonFPrim: TButton
      Left = 104
      Top = 200
      Width = 41
      Height = 25
      Caption = 'F'#39
      TabOrder = 9
      OnClick = ButtonFPrimClick
    end
    object ButtonB: TButton
      Left = 24
      Top = 248
      Width = 41
      Height = 25
      Caption = 'B'
      TabOrder = 10
      OnClick = ButtonBClick
    end
    object ButtonBPrim: TButton
      Left = 104
      Top = 248
      Width = 41
      Height = 25
      Caption = 'B'#39
      TabOrder = 11
      OnClick = ButtonBPrimClick
    end
  end
  object Panel2: TPanel
    Left = 480
    Top = 376
    Width = 185
    Height = 41
    TabOrder = 1
    object ButtonXPos: TButton
      Left = 8
      Top = 8
      Width = 33
      Height = 25
      Caption = 'X+'
      TabOrder = 0
      OnClick = ButtonXPosClick
    end
    object ButtonYPos: TButton
      Left = 64
      Top = 8
      Width = 33
      Height = 25
      Caption = 'Y+'
      TabOrder = 1
      OnClick = ButtonYPosClick
    end
    object ButtonZPos: TButton
      Left = 120
      Top = 8
      Width = 33
      Height = 25
      Caption = 'Z+'
      TabOrder = 2
      OnClick = ButtonZPosClick
    end
  end
  object Panel3: TPanel
    Left = 32
    Top = 400
    Width = 400
    Height = 321
    TabOrder = 2
    object Button1: TButton
      Left = 304
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 312
      Top = 112
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 304
      Top = 176
      Width = 75
      Height = 25
      Caption = 'Button3'
      TabOrder = 2
      OnClick = Button3Click
    end
    object ComboBox: TComboBox
      Left = 24
      Top = 80
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      OnChange = ComboBoxChange
    end
  end
end
