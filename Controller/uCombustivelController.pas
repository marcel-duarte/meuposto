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
    //fListaCombustiveis: TList<TCombustivel>;
  public
    constructor Create;
    destructor Destroy; override;
    //property ListaCombustiveis: TList<TCombustivel> read fListaCombustiveis write fListaCombustiveis;

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
  //fListaCombustiveis := TList<TCombustivel>.Create;
end;

destructor TCombustivelController.Destroy;
begin
  fCombustivelDao.DisposeOf;
  //fListaCombustiveis.DisposeOf;
  inherited;
end;

function TCombustivelController.CarregarCombustivel(pId: Integer): TCombustivel;
begin
  Result := fCombustivelDao.CarregarCombustivel(pId);
end;

end.
