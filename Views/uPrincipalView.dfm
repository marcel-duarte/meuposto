object frmPrincipalView: TfrmPrincipalView
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 216
  ClientWidth = 557
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object btAbastecer: TButton
    Left = 48
    Top = 56
    Width = 137
    Height = 89
    Caption = 'Abastecer'
    TabOrder = 0
    OnClick = btAbastecerClick
  end
  object btnSair: TButton
    Left = 360
    Top = 56
    Width = 137
    Height = 89
    Caption = 'Sair'
    TabOrder = 1
    OnClick = btnSairClick
  end
  object btnImprimir: TButton
    Left = 200
    Top = 56
    Width = 137
    Height = 89
    Caption = 'Imprimir'
    TabOrder = 2
    OnClick = btnImprimirClick
  end
end
