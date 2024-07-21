object DataModule1: TDataModule1
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
  object FDQueryComandos: TFDQuery
    Connection = FDConnection
    Left = 353
    Top = 34
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection
    Left = 457
    Top = 194
  end
  object fdqAbastecimento: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM ABASTECIMENTO')
    Left = 49
    Top = 146
  end
end
