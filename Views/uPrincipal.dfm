object Principal: TPrincipal
  Left = 0
  Top = 0
  Caption = 'Meu Posto'
  ClientHeight = 114
  ClientWidth = 335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Button1: TButton
    Left = 32
    Top = 24
    Width = 169
    Height = 65
    Caption = 'Abastecimento'
    TabOrder = 0
  end
  object Button2: TButton
    Left = 216
    Top = 24
    Width = 89
    Height = 65
    Caption = 'Sair'
    TabOrder = 1
    OnClick = Button2Click
  end
end
