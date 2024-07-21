object frmAbastecimento: TfrmAbastecimento
  Left = 0
  Top = 0
  Caption = 'Abastecimento'
  ClientHeight = 421
  ClientWidth = 999
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object pnlBarraInferior: TPanel
    Left = 0
    Top = 359
    Width = 999
    Height = 62
    Align = alBottom
    TabOrder = 0
    object btnAbastecer: TButton
      Left = 386
      Top = 16
      Width = 116
      Height = 30
      Caption = 'Abastercer'
      TabOrder = 0
      OnClick = btnAbastecerClick
    end
    object btnAlterar: TButton
      Left = 508
      Top = 16
      Width = 116
      Height = 30
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TButton
      Left = 630
      Top = 16
      Width = 116
      Height = 30
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnConsultar: TButton
      Left = 752
      Top = 16
      Width = 116
      Height = 30
      Caption = 'Consultar'
      TabOrder = 3
      OnClick = btnConsultarClick
    end
    object btnSair: TButton
      Left = 874
      Top = 16
      Width = 116
      Height = 30
      Caption = 'Sair'
      TabOrder = 4
      OnClick = btnSairClick
    end
  end
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 999
    Height = 359
    ActivePage = tbCadastro
    Align = alClient
    TabOrder = 1
    object tbLista: TTabSheet
      Caption = 'Lista'
      object dbgAbastecimento: TDBGrid
        Left = 0
        Top = 168
        Width = 993
        Height = 165
        Align = alBottom
        DataSource = dsAbastecimento
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'IDABASTECIMENTO'
            Title.Caption = 'Id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDBOMBA'
            Title.Caption = 'Bomba'
            Width = 116
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDCOMBUSTIVEL'
            Title.Caption = 'Combustivel'
            Width = 128
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDIMPOSTO'
            Title.Caption = 'Imposto'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTDLITROS'
            Title.Caption = 'Qdt.Litros'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAABASTECIMENTO'
            Title.Caption = 'Data'
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORABASTECIMENTO'
            Title.Caption = 'Valor Abastec. (R$)'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORIMPOSTO'
            Title.Caption = 'Valor Imposto (R$)'
            Width = 115
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORFINALABASTECIMENTO'
            Title.Caption = 'Valor Final Abastec (R$)'
            Width = 167
            Visible = True
          end>
      end
      object sgListaAbastecimento: TStringGrid
        Left = 0
        Top = 0
        Width = 993
        Height = 168
        Align = alClient
        FixedCols = 0
        TabOrder = 1
        ExplicitLeft = 16
        ExplicitTop = 3
        ExplicitWidth = 793
        ExplicitHeight = 105
      end
    end
    object tbCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object Label1: TLabel
        Left = 72
        Top = 99
        Width = 38
        Height = 15
        Caption = 'Bomba'
      end
      object Label2: TLabel
        Left = 296
        Top = 99
        Width = 67
        Height = 15
        Caption = 'Combustivel'
      end
      object Label3: TLabel
        Left = 615
        Top = 99
        Width = 44
        Height = 15
        Caption = 'Imposto'
      end
      object leId: TLabeledEdit
        Left = 72
        Top = 56
        Width = 57
        Height = 23
        EditLabel.Width = 10
        EditLabel.Height = 15
        EditLabel.Caption = 'Id'
        ReadOnly = True
        TabOrder = 0
        Text = ''
      end
      object leQtdLitros: TLabeledEdit
        Left = 72
        Top = 184
        Width = 112
        Height = 23
        Alignment = taRightJustify
        EditLabel.Width = 52
        EditLabel.Height = 15
        EditLabel.Caption = 'Qtd Litros'
        TabOrder = 5
        Text = ''
        OnExit = leQtdLitrosExit
        OnKeyPress = leQtdLitrosKeyPress
      end
      object leDataAbastecimento: TLabeledEdit
        Left = 153
        Top = 56
        Width = 112
        Height = 23
        EditLabel.Width = 107
        EditLabel.Height = 15
        EditLabel.Caption = 'Data Abastecimento'
        Enabled = False
        TabOrder = 1
        Text = ''
      end
      object leValorAbastecimento: TLabeledEdit
        Left = 248
        Top = 184
        Width = 171
        Height = 23
        Alignment = taRightJustify
        EditLabel.Width = 133
        EditLabel.Height = 15
        EditLabel.Caption = 'Valor Abastecimento (R$)'
        ReadOnly = True
        TabOrder = 6
        Text = ''
        OnExit = leValorAbastecimentoExit
        OnKeyPress = leQtdLitrosKeyPress
      end
      object leValorImposto: TLabeledEdit
        Left = 487
        Top = 184
        Width = 171
        Height = 23
        Alignment = taRightJustify
        EditLabel.Width = 97
        EditLabel.Height = 15
        EditLabel.Caption = 'Valor Imposto (R$)'
        TabOrder = 7
        Text = ''
        OnKeyPress = leQtdLitrosKeyPress
      end
      object leValorFinalAbastecimento: TLabeledEdit
        Left = 725
        Top = 182
        Width = 171
        Height = 25
        Alignment = taRightJustify
        EditLabel.Width = 161
        EditLabel.Height = 15
        EditLabel.Caption = 'Valor Final Abastecimento (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        Text = ''
        OnKeyPress = leQtdLitrosKeyPress
      end
      object cbxBomba: TComboBoxEx
        Left = 72
        Top = 120
        Width = 193
        Height = 24
        ItemsEx = <>
        TabOrder = 2
      end
      object btnConfirmar: TButton
        Left = 746
        Top = 288
        Width = 116
        Height = 30
        Caption = 'Confirmar'
        TabOrder = 9
        OnClick = btnConfirmarClick
      end
      object btnCancelar: TButton
        Left = 868
        Top = 288
        Width = 116
        Height = 30
        Caption = 'Cancelar'
        TabOrder = 10
        OnClick = btnCancelarClick
      end
      object cbxCombustivel: TComboBoxEx
        Left = 296
        Top = 120
        Width = 185
        Height = 24
        ItemsEx = <>
        Style = csExDropDownList
        TabOrder = 3
        OnSelect = cbxCombustivelSelect
      end
      object cbxImposto: TComboBoxEx
        Left = 615
        Top = 120
        Width = 186
        Height = 24
        ItemsEx = <>
        Style = csExDropDownList
        TabOrder = 4
        OnSelect = cbxImpostoSelect
      end
      object lePercentualImposto: TLabeledEdit
        Left = 806
        Top = 120
        Width = 93
        Height = 23
        Alignment = taRightJustify
        EditLabel.Width = 94
        EditLabel.Height = 15
        EditLabel.Caption = 'Perc. Imposto (%)'
        Enabled = False
        TabOrder = 11
        Text = ''
        OnKeyPress = leQtdLitrosKeyPress
      end
      object leValorLitro: TLabeledEdit
        Left = 487
        Top = 120
        Width = 93
        Height = 23
        Alignment = taRightJustify
        EditLabel.Width = 77
        EditLabel.Height = 15
        EditLabel.Caption = 'Valor Litro (R$)'
        Enabled = False
        TabOrder = 12
        Text = ''
        OnKeyPress = leQtdLitrosKeyPress
      end
    end
  end
  object dsAbastecimento: TDataSource
    DataSet = DataModule1.fdqAbastecimentos
    Left = 932
    Top = 34
  end
end
