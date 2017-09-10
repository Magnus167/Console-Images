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
    Left = 268
    Top = 160
    Width = 100
    Height = 100
    AutoSize = True
    Center = True
  end
  object Image2: TImage
    Left = 528
    Top = 400
    Width = 105
    Height = 105
    Visible = False
  end
  object Button1: TButton
    Left = 208
    Top = 400
    Width = 209
    Height = 145
    Caption = 'Out>'
    TabOrder = 0
    OnClick = Button1Click
  end
end
