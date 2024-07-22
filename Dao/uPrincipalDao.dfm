object DataModule1: TDataModule1
  OnCreate = DataModuleCreate
  Height = 227
  Width = 494
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Marcel\Projetos\Delphi\MeuPosto\Banco\DBMeuPosto.fdb'
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
end
