unit uImpostoController;

interface

uses
  System.Generics.Collections,
  uImpostoModel,
  uImpostoDao;

type

  TImpostoController = class
  private
    fImpostoDao: TImpostoDao;
    //fListaImpostos: TList<TImposto>;
  public
    constructor Create;
    destructor Destroy; override;
    //property ListaImpostos: TList<TImposto> read fListaImpostos write fListaImpostos;

    function CarregarImposto(pId: Integer): TImposto;
    function CarregarImpostos: TList<TImposto>;
  end;

implementation

{ TImpostoController }

function TImpostoController.CarregarImpostos: TList<TImposto>;
begin
  Result := fImpostoDao.CarregarImpostos;
end;

constructor TImpostoController.Create;
begin
  fImpostoDao := TImpostoDao.Create;
  //fListaImpostos := TList<TImposto>.Create;
end;

destructor TImpostoController.Destroy;
begin
  fImpostoDao.DisposeOf;
  //fListaImpostos.DisposeOf;
  inherited;
end;

function TImpostoController.CarregarImposto(pId: Integer): TImposto;
begin
  Result := fImpostoDao.CarregarImposto(pId);
end;

end.
