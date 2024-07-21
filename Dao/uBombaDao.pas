unit uBombaDao;

interface

uses
  System.Generics.Collections,
  SysUtils,
  uPrincipalDao,
  uBombaModel,
  uTanqueDao;

type
  TBombaDao = class
  private
    FDConnection: TDataModule1;
    fTanqueDao: TTanqueDao;
  public
    constructor Create;
    destructor Destroy; override;
    property TanqueDao: TTanqueDao read fTanqueDao write fTanqueDao;
    //
    function CarregarBomba(pId: Integer): TBomba;
    function CarregarBombas: TList<TBomba>;
  end;

implementation

{ TBombaDao }

function TBombaDao.CarregarBomba(pId: Integer): TBomba;
var
  vSql: string;
begin
  Result := nil;
  vSql := ' SELECT B.IDBOMBA, B.DESCRICAO, B.IDTANQUE FROM BOMBA B '+
          ' WHERE B.IDBOMBA = ' + IntToStr(pId);
  FDConnection.PrepareStatement(vSql);
  FDConnection.Activate;

  if FDConnection.IsEmpty then
    Exit;

  Result := TBomba.Create;
  Result.IdBomba := FDConnection.GetValue(0);
  Result.Descricao := FDConnection.GetValue(1);
  Result.Tanque := fTanqueDao.CarregarTanque(FDConnection.GetValue(2));
end;

function TBombaDao.CarregarBombas: TList<TBomba>;
var
  vListaBomba: TList<TBomba>;
  vBomba: TBomba;
  vSql: string;
begin
  vListaBomba := TList<TBomba>.Create;
  //
  vSql := ' SELECT B.IDBOMBA, B.DESCRICAO, B.IDTANQUE FROM BOMBA B ';
  FDConnection.PrepareStatement(vSql);
  FDConnection.Activate;

  with FDConnection do
  begin
    while not ListaRegistros.Eof do
    begin
      vBomba := TBomba.Create;
      vBomba.IdBomba := ListaRegistros.Fields[0].Value;
      vBomba.Descricao := ListaRegistros.Fields[1].Value;
      vBomba.Tanque := fTanqueDao.CarregarTanque(ListaRegistros.Fields[2].Value);
      vListaBomba.Add(vBomba);
      ListaRegistros.Next;
    end;
  end;

  Result := vListaBomba;
end;

constructor TBombaDao.Create;
begin
  FDConnection := TDataModule1.Create(nil);
  fTanqueDao := TTanqueDao.Create;
end;

destructor TBombaDao.Destroy;
begin
  FDConnection.DisposeOf;
  fTanqueDao.DisposeOf;
  inherited;
end;

end.
