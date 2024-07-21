object DataModule1: TDataModule1
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Marcel\Projetos\Delphi\MeuPosto\Banco\DBMEUPOSTO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
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
  object fdqAbastecimentos: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM ABASTECIMENTO')
    Left = 49
    Top = 146
  end
  object fdqAbastecimento: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM ABASTECIMENTO')
    Left = 49
    Top = 234
  end
  object fdqImposto: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM ABASTECIMENTO')
    Left = 193
    Top = 234
  end
  object FDTransaction: TFDTransaction
    Connection = FDConnection
    Left = 400
    Top = 216
  end
end
