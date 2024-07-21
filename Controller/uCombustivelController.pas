unit uCombustivelController;

interface

uses
  System.Generics.Collections,
  uCombustivelModel,
  uCombustivelDao;

type

  TCombustivelController = class
  private
    fCombustivelDao: TCombustivelDao;
  public
    constructor Create;
    destructor Destroy; override;

    function CarregarCombustivel(pId: Integer): TCombustivel;
    function CarregarCombustiveis: TList<TCombustivel>;
  end;

implementation

{ TCombustivelController }

function TCombustivelController.CarregarCombustiveis: TList<TCombustivel>;
begin
  Result := fCombustivelDao.CarregarCombustiveis;
end;

constructor TCombustivelController.Create;
begin
  fCombustivelDao := TCombustivelDao.Create;
end;

destructor TCombustivelController.Destroy;
begin
  fCombustivelDao.DisposeOf;
  inherited;
end;

function TCombustivelController.CarregarCombustivel(pId: Integer): TCombustivel;
begin
  Result := fCombustivelDao.CarregarCombustivel(pId);
end;

end.
