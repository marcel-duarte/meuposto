object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Abastecimento'
  ClientHeight = 425
  ClientWidth = 1001
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlBarraInferior: TPanel
    Left = 0
    Top = 363
    Width = 1001
    Height = 62
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 362
    ExplicitWidth = 997
    object btnIncluir: TButton
      Left = 264
      Top = 16
      Width = 116
      Height = 30
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = btnIncluirClick
    end
    object btnAlterar: TButton
      Left = 386
      Top = 16
      Width = 116
      Height = 30
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TButton
      Left = 508
      Top = 16
      Width = 116
      Height = 30
      Caption = 'Excluir'
      TabOrder = 2
    end
    object btnConsultar: TButton
      Left = 630
      Top = 16
      Width = 116
      Height = 30
      Caption = 'Consultar'
      TabOrder = 3
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
    object Button1: TButton
      Left = 752
      Top = 16
      Width = 116
      Height = 30
      Caption = 'Consultar'
      TabOrder = 5
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 1001
    Height = 363
    ActivePage = tbLista
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 997
    ExplicitHeight = 362
    object tbLista: TTabSheet
      Caption = 'tbLista'
      object dbgAbastecimento: TDBGrid
        Left = 0
        Top = 0
        Width = 993
        Height = 333
        Align = alClient
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
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDCOMBUSTIVEL'
            Title.Caption = 'Combustivel'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDIMPOSTO'
            Title.Caption = 'Imposto'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTDLITROS'
            Title.Caption = 'Qdt.Litros'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAABASTECIMENTO'
            Title.Caption = 'Data'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORABASTECIMENTO'
            Title.Caption = 'Valor Abastec. (R$)'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORIMPOSTO'
            Title.Caption = 'Valor Imposto (R$)'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORFINALABASTECIMENTO'
            Title.Caption = 'Valor Final Abastec (R$)'
            Width = 142
            Visible = True
          end>
      end
    end
    object tbCadastro: TTabSheet
      Caption = 'tbCadastro'
      ImageIndex = 1
      object Label1: TLabel
        Left = 32
        Top = 75
        Width = 38
        Height = 15
        Caption = 'Bomba'
      end
      object leId: TLabeledEdit
        Left = 32
        Top = 40
        Width = 57
        Height = 23
        EditLabel.Width = 10
        EditLabel.Height = 15
        EditLabel.Caption = 'Id'
        TabOrder = 0
        Text = ''
      end
      object LabeledEdit2: TLabeledEdit
        Left = 777
        Top = 40
        Width = 112
        Height = 23
        EditLabel.Width = 52
        EditLabel.Height = 15
        EditLabel.Caption = 'Qtd Litros'
        TabOrder = 1
        Text = ''
      end
      object LabeledEdit3: TLabeledEdit
        Left = 777
        Top = 96
        Width = 112
        Height = 23
        EditLabel.Width = 107
        EditLabel.Height = 15
        EditLabel.Caption = 'Data Abastecimento'
        Enabled = False
        TabOrder = 2
        Text = ''
      end
      object LabeledEdit4: TLabeledEdit
        Left = 777
        Top = 144
        Width = 171
        Height = 23
        EditLabel.Width = 133
        EditLabel.Height = 15
        EditLabel.Caption = 'Valor Abastecimento (R$)'
        TabOrder = 3
        Text = ''
      end
      object LabeledEdit5: TLabeledEdit
        Left = 777
        Top = 192
        Width = 171
        Height = 23
        EditLabel.Width = 97
        EditLabel.Height = 15
        EditLabel.Caption = 'Valor Imposto (R$)'
        TabOrder = 4
        Text = ''
      end
      object LabeledEdit6: TLabeledEdit
        Left = 777
        Top = 248
        Width = 171
        Height = 23
        EditLabel.Width = 161
        EditLabel.Height = 15
        EditLabel.Caption = 'Valor Final Abastecimento (R$)'
        TabOrder = 5
        Text = ''
      end
      object cbxBomba: TComboBoxEx
        Left = 32
        Top = 96
        Width = 233
        Height = 24
        ItemsEx = <>
        TabOrder = 6
        Text = 'cbxBomba'
      end
      object btnConfirmar: TButton
        Left = 740
        Top = 288
        Width = 116
        Height = 30
        Caption = 'Confirmar'
        TabOrder = 7
        OnClick = btnConfirmarClick
      end
      object btnCancelar: TButton
        Left = 868
        Top = 288
        Width = 116
        Height = 30
        Caption = 'Cancelar'
        TabOrder = 8
        OnClick = btnCancelarClick
      end
    end
  end
  object dsAbastecimento: TDataSource
    DataSet = DataModule1.fdqAbastecimento
    Left = 828
    Top = 226
  end
end
