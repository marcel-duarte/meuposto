object frmRelatorioAbastecimentos: TfrmRelatorioAbastecimentos
  Left = 0
  Top = 0
  Caption = 'Relatorio de Abastecimentos'
  ClientHeight = 231
  ClientWidth = 281
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 48
    Top = 24
    Width = 58
    Height = 15
    Caption = 'Data Inicial'
  end
  object Label2: TLabel
    Left = 48
    Top = 88
    Width = 52
    Height = 15
    Caption = 'Data Final'
  end
  object dtpDataInicial: TDateTimePicker
    Left = 48
    Top = 45
    Width = 186
    Height = 23
    Date = 45494.000000000000000000
    Time = 0.614557442131626900
    TabOrder = 0
  end
  object dtpDataFinal: TDateTimePicker
    Left = 48
    Top = 109
    Width = 186
    Height = 23
    Date = 45494.000000000000000000
    Time = 0.614557442131626900
    TabOrder = 1
  end
  object btnImprimir: TButton
    Left = 48
    Top = 152
    Width = 114
    Height = 41
    Caption = 'Imprimir'
    TabOrder = 2
    OnClick = btnImprimirClick
  end
  object btnSair: TButton
    Left = 168
    Top = 152
    Width = 66
    Height = 41
    Caption = 'Sair'
    TabOrder = 3
    OnClick = btnSairClick
  end
end
