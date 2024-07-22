unit uTanqueDao;

interface

uses
  SysUtils,
  uPrincipalDao,
  uTanqueModel,
  uCombustivelDao;

type
  TTanqueDao = class
    private
      FDConnection: TDataModule1;
      fCombustivelDao: TCombustivelDao;
    public
      constructor Create;
      destructor Destroy; override;
      function CarregarTanque(pId: Integer): TTanque;
  end;

implementation

{ TTanqueDao }

function TTanqueDao.CarregarTanque(pId: Integer): TTanque;
var
  vSql: string;
begin
  Result := nil;
  vSql := ' SELECT T.IDTANQUE, T.DESCRICAO, T.IDCOMBUSTIVEL '+
          '  FROM TANQUE T WHERE T.IDTANQUE = ' + IntToStr(pId);
  FDConnection.PrepareStatement(vSql);
  FDConnection.Activate;

  if FDConnection.IsEmpty then
    Exit;

  Result := TTanque.Create;
  Result.IdTanque := FDConnection.GetValue(0);
  Result.Descricao := FDConnection.GetValue(1);
  Result.Combustivel := fCombustivelDao.CarregarCombustivel(FDConnection.GetValue(2));
end;

constructor TTanqueDao.Create;
begin
  FDConnection := TDataModule1.Create(nil);
  fCombustivelDao := TCombustivelDao.Create;
end;

destructor TTanqueDao.Destroy;
begin
  FDConnection.DisposeOf;
  fCombustivelDao.DisposeOf;
  inherited;
end;

end.
