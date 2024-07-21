object DataModule1: TDataModule1
  OnCreate = DataModuleCreate
  Height = 227
  Width = 494
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Marcel\Projetos\Delphi\MeuPosto\Banco\DBMEUPOSTO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 32
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 192
    Top = 32
  end
  object FDQuery: TFDQuery
    Connection = FDConnection
    Left = 353
    Top = 34
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      
        'SELECT A.DATAABASTECIMENTO, B.IDBOMBA, B.DESCRICAO DESC_BOMBA, T' +
        '.IDTANQUE, T.DESCRICAO DESC_TANQUE,'
      
        '    SUM(A.VALORABASTECIMENTO) TOTAL_ABAST_BRT_DIA, SUM(A.VALORFI' +
        'NALABASTECIMENTO) TOTAL_ABAST_LIQ_DIA'
      'FROM ABASTECIMENTO A'
      'LEFT JOIN BOMBA B ON B.IDBOMBA = A.IDBOMBA'
      'LEFT JOIN TANQUE T ON T.IDTANQUE = B.IDTANQUE'
      'GROUP BY 1,2,3,4,5'
      'ORDER BY A.DATAABASTECIMENTO')
    Left = 177
    Top = 138
    object FDQuery1DATAABASTECIMENTO: TDateField
      FieldName = 'DATAABASTECIMENTO'
      Origin = 'DATAABASTECIMENTO'
    end
    object FDQuery1IDBOMBA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'IDBOMBA'
      Origin = 'IDBOMBA'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQuery1DESC_BOMBA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESC_BOMBA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object FDQuery1IDTANQUE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'IDTANQUE'
      Origin = 'IDTANQUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQuery1DESC_TANQUE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESC_TANQUE'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object FDQuery1TOTAL_ABAST_BRT_DIA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL_ABAST_BRT_DIA'
      Origin = 'TOTAL_ABAST_BRT_DIA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object FDQuery1TOTAL_ABAST_LIQ_DIA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL_ABAST_LIQ_DIA'
      Origin = 'TOTAL_ABAST_LIQ_DIA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
end
