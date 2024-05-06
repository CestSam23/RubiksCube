object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Cubo Rubik'
  ClientHeight = 570
  ClientWidth = 686
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
    Width = 169
    Height = 313
    TabOrder = 0
    object Label1: TLabel
      Left = 48
      Top = 16
      Width = 78
      Height = 19
      Caption = 'Movements'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Corbel'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object ButtonU: TButton
      Left = 24
      Top = 48
      Width = 41
      Height = 25
      Caption = 'U'
      TabOrder = 0
      OnClick = ButtonUClick
    end
    object ButtonUPrim: TButton
      Left = 104
      Top = 48
      Width = 41
      Height = 25
      Caption = 'U'#39
      TabOrder = 1
      OnClick = ButtonUPrimClick
    end
    object ButtonD: TButton
      Left = 24
      Top = 88
      Width = 41
      Height = 25
      Caption = 'D'
      TabOrder = 2
      OnClick = ButtonDClick
    end
    object ButtonDPrim: TButton
      Left = 104
      Top = 88
      Width = 41
      Height = 25
      Caption = 'D'#39
      TabOrder = 3
      OnClick = ButtonDPrimClick
    end
    object ButtonR: TButton
      Left = 24
      Top = 128
      Width = 41
      Height = 25
      Caption = 'R'
      TabOrder = 4
      OnClick = ButtonRClick
    end
    object ButtonRPrim: TButton
      Left = 104
      Top = 128
      Width = 41
      Height = 25
      Caption = 'R'#39
      TabOrder = 5
      OnClick = ButtonRPrimClick
    end
    object ButtonL: TButton
      Left = 24
      Top = 176
      Width = 41
      Height = 25
      Caption = 'L'
      TabOrder = 6
      OnClick = ButtonLClick
    end
    object ButtonLPrim: TButton
      Left = 104
      Top = 176
      Width = 41
      Height = 25
      Caption = 'L'#39
      TabOrder = 7
      OnClick = ButtonLPrimClick
    end
    object ButtonF: TButton
      Left = 24
      Top = 224
      Width = 41
      Height = 25
      Caption = 'F'
      TabOrder = 8
      OnClick = ButtonFClick
    end
    object ButtonFPrim: TButton
      Left = 104
      Top = 224
      Width = 41
      Height = 25
      Caption = 'F'#39
      TabOrder = 9
      OnClick = ButtonFPrimClick
    end
    object ButtonB: TButton
      Left = 24
      Top = 272
      Width = 41
      Height = 25
      Caption = 'B'
      TabOrder = 10
      OnClick = ButtonBClick
    end
    object ButtonBPrim: TButton
      Left = 104
      Top = 272
      Width = 41
      Height = 25
      Caption = 'B'#39
      TabOrder = 11
      OnClick = ButtonBPrimClick
    end
  end
  object Panel2: TPanel
    Left = 480
    Top = 384
    Width = 169
    Height = 65
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 7
      Width = 138
      Height = 19
      Caption = 'Rotation of the Cube'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Corbel'
      Font.Style = []
      ParentFont = False
    end
    object ButtonXPos: TButton
      Left = 16
      Top = 32
      Width = 33
      Height = 25
      Caption = 'X+'
      TabOrder = 0
      OnClick = ButtonXPosClick
    end
    object ButtonYPos: TButton
      Left = 72
      Top = 32
      Width = 33
      Height = 25
      Caption = 'Y+'
      TabOrder = 1
      OnClick = ButtonYPosClick
    end
    object ButtonZPos: TButton
      Left = 120
      Top = 32
      Width = 33
      Height = 25
      Caption = 'Z+'
      TabOrder = 2
      OnClick = ButtonZPosClick
    end
  end
  object Panel3: TPanel
    Left = 72
    Top = 376
    Width = 297
    Height = 161
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Corbel'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label3: TLabel
      Left = 32
      Top = 40
      Width = 121
      Height = 19
      Caption = 'Rotation of Pieces'
    end
    object ButtonXPosI: TButton
      Left = 192
      Top = 24
      Width = 33
      Height = 25
      Caption = 'X+'
      TabOrder = 0
      OnClick = ButtonXPosIClick
    end
    object ButtonYPosI: TButton
      Left = 192
      Top = 72
      Width = 33
      Height = 25
      Caption = 'Y+'
      TabOrder = 1
      OnClick = ButtonYPosIClick
    end
    object BUttonZPosI: TButton
      Left = 192
      Top = 120
      Width = 33
      Height = 25
      Caption = 'Z+'
      TabOrder = 2
      OnClick = BUttonZPosIClick
    end
    object ComboBox: TComboBox
      Left = 24
      Top = 80
      Width = 145
      Height = 27
      ItemHeight = 19
      TabOrder = 3
      OnChange = ComboBoxChange
    end
    object ButtonYNEgI: TButton
      Left = 240
      Top = 72
      Width = 33
      Height = 25
      Caption = 'Y-'
      TabOrder = 4
      OnClick = ButtonYNEgIClick
    end
    object ButtonXNegI: TButton
      Left = 240
      Top = 24
      Width = 33
      Height = 25
      Caption = 'X-'
      TabOrder = 5
      OnClick = ButtonXNegIClick
    end
    object ButtonZNegI: TButton
      Left = 240
      Top = 120
      Width = 33
      Height = 25
      Caption = 'Z-'
      TabOrder = 6
      OnClick = ButtonZNegIClick
    end
  end
end
