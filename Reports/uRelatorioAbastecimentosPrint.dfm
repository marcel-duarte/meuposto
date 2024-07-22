object relRelatorioAbastecimentosPrint: TrelRelatorioAbastecimentosPrint
  Left = 0
  Top = 0
  Caption = 'Relatorio de Abastecimentos'
  ClientHeight = 629
  ClientWidth = 801
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object RLReport1: TRLReport
    Left = -1
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dsRelatorioAbastecimentos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    BeforePrint = RLReport1BeforePrint
    object rlbCabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 33
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLSystemInfo1: TRLSystemInfo
        Left = 0
        Top = 9
        Width = 39
        Height = 16
        Align = faLeftOnly
        Alignment = taRightJustify
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 678
        Top = 9
        Width = 40
        Height = 16
        Align = faRightOnly
        Alignment = taCenter
        Info = itHour
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 296
        Top = 8
        Width = 125
        Height = 16
        Align = faCenter
        Caption = 'Sistema Meu Posto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlbTitulo: TRLBand
      Left = 38
      Top = 71
      Width = 718
      Height = 60
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel1: TRLLabel
        Left = 0
        Top = 0
        Width = 718
        Height = 34
        Align = faTop
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Abastecimentos por Per'#237'odo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rllPeriodo: TRLLabel
        Left = 0
        Top = 34
        Width = 718
        Height = 16
        Align = faTop
        Alignment = taCenter
        Caption = 'Per'#237'odo: 00/00/0000 a 00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlbCabecalhoColunas: TRLBand
      Left = 38
      Top = 131
      Width = 718
      Height = 35
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      BeforePrint = rlbCabecalhoColunasBeforePrint
      object RLLabel3: TRLLabel
        Left = 8
        Top = 13
        Width = 25
        Height = 16
        Caption = 'Dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 112
        Top = 13
        Width = 52
        Height = 16
        Caption = 'Tanque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 248
        Top = 13
        Width = 49
        Height = 16
        Caption = 'Bomba'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 539
        Top = 13
        Width = 176
        Height = 16
        Caption = 'Valor Abastec. Liquido (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 366
        Top = 13
        Width = 162
        Height = 16
        Caption = 'Valor Abastec. Bruto (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlbDados: TRLBand
      Left = 38
      Top = 166
      Width = 718
      Height = 26
      BeforePrint = rlbDadosBeforePrint
      object rldbData: TRLDBText
        Left = 8
        Top = 4
        Width = 89
        Height = 16
        AutoSize = False
        DataField = 'DATAABASTECIMENTO'
        DataSource = dsRelatorioAbastecimentos
        Text = ''
      end
      object rldbTanque: TRLDBText
        Left = 112
        Top = 4
        Width = 124
        Height = 16
        AutoSize = False
        DataField = 'DESC_TANQUE'
        DataSource = dsRelatorioAbastecimentos
        Text = ''
      end
      object rldbBomba: TRLDBText
        Left = 248
        Top = 4
        Width = 110
        Height = 16
        AutoSize = False
        DataField = 'DESC_BOMBA'
        DataSource = dsRelatorioAbastecimentos
        Text = ''
      end
      object rldbValorAbastecimentoLiquido: TRLDBText
        Left = 539
        Top = 4
        Width = 176
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'TOTAL_ABAST_LIQ_DIA'
        DataSource = dsRelatorioAbastecimentos
        Text = ''
      end
      object rldbValorAbastecimentoBruto: TRLDBText
        Left = 366
        Top = 3
        Width = 162
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'TOTAL_ABAST_BRT_DIA'
        DataSource = dsRelatorioAbastecimentos
        Text = ''
      end
    end
    object rlbRodape: TRLBand
      Left = 38
      Top = 192
      Width = 718
      Height = 44
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      BeforePrint = rlbRodapeBeforePrint
      object RLLabel7: TRLLabel
        Left = 184
        Top = 14
        Width = 168
        Height = 16
        Caption = 'Total Abastecimentos (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rllValorAbastBruto: TRLLabel
        Left = 366
        Top = 14
        Width = 162
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rllValorAbastLiquido: TRLLabel
        Left = 539
        Top = 14
        Width = 176
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand1: TRLBand
      Left = 38
      Top = 236
      Width = 718
      Height = 26
      BandType = btFooter
      object RLSystemInfo3: TRLSystemInfo
        Left = 672
        Top = 5
        Width = 46
        Height = 16
        Align = faRightOnly
        AutoSize = False
        Info = itPageNumber
        Text = ''
      end
      object RLLabel9: TRLLabel
        Left = 632
        Top = 6
        Width = 31
        Height = 16
        Caption = 'P'#225'g:'
      end
    end
  end
  object dsRelatorioAbastecimentos: TDataSource
    Left = 687
    Top = 312
  end
end
