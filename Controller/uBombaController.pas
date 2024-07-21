unit uBombaController;

interface

uses
  System.Generics.Collections,
  uBombaModel,
  uBombaDao;

type

  TBombaController = class
  private
    fBombaDao: TBombaDao;
  public
    constructor Create;
    destructor Destroy; override;

    function CarregarBomba(pId: Integer): TBomba;
    function CarregarBombas: TList<TBomba>;
  end;

implementation

{ TBombaController }

function TBombaController.CarregarBombas: TList<TBomba>;
begin
  Result := fBombaDao.CarregarBombas;
end;

constructor TBombaController.Create;
begin
  fBombaDao := TBombaDao.Create;
end;

destructor TBombaController.Destroy;
begin
  fBombaDao.DisposeOf;
  inherited;
end;

function TBombaController.CarregarBomba(pId: Integer): TBomba;
begin
  Result := fBombaDao.CarregarBomba(pId);
end;

end.
