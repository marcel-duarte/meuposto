unit uAbastecimentoController;

interface

uses
  System.Generics.Collections,
  uAbastecimentoModel,
  uAbastecimentoDao;

type

  TAbastecimentoController = class
    fAbastecimentoDao: TAbastecimentoDao;
  public
    constructor Create;
    destructor Destroy; override;
    function GeraAbastecimento(pAbastecimento: TAbastecimento; var pErro: string): Boolean;
    function ExcluiAbastecimento(pId: Integer; var pErro: string): Boolean;
    function CarregaAbastecimentos: TList<TAbastecimento>;
    function CalculaImposto(pValor, pPercentImposto: Double): Double;
    function CalculaValorAbastecido(pQtdLitros, pValorLitro: Double): Double;
  end;

implementation

{ TAbastecimentoController }

constructor TAbastecimentoController.Create;
begin
  fAbastecimentoDao := TAbastecimentoDao.Create;
end;

destructor TAbastecimentoController.Destroy;
begin
  fAbastecimentoDao.DisposeOf;
  inherited;
end;

function TAbastecimentoController.ExcluiAbastecimento(pId: Integer;
  var pErro: string): Boolean;
begin
  Result := fAbastecimentoDao.ExcluiAbastecimento(pId, pErro);
end;

function TAbastecimentoController.GeraAbastecimento(
  pAbastecimento: TAbastecimento; var pErro: string): Boolean;
begin
  Result := fAbastecimentoDao.GeraAbastecimento(pAbastecimento, pErro);
end;

function TAbastecimentoController.CalculaImposto(pValor,
  pPercentImposto: Double): Double;
begin
  Result := pValor * (pPercentImposto / 100);
end;

function TAbastecimentoController.CalculaValorAbastecido(pQtdLitros,
  pValorLitro: Double): Double;
begin
  Result := pQtdLitros * pValorLitro;
end;

function TAbastecimentoController.CarregaAbastecimentos: TList<TAbastecimento>;
begin
  Result := fAbastecimentoDao.CarregaAbastecimentos;
end;



end.
