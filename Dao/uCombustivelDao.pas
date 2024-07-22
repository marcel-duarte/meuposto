unit uCombustivelDao;

interface

uses
  System.Generics.Collections,
  SysUtils,
  uCombustivelModel,
  uPrincipalDao;

type
  TCombustivelDao = class
  private
    FDConnection: TDataModule1;
  public
    constructor Create;
    destructor Destroy; override;
    //
    function CarregarCombustivel(pId: Integer): TCombustivel;
    function CarregarCombustiveis: TList<TCombustivel>;
  end;

implementation

{ TCombustivelDao }

function TCombustivelDao.CarregarCombustivel(pId: Integer): TCombustivel;
var
  vSql: string;
begin
  Result := nil;
  vSql := ' SELECT C.IDCOMBUSTIVEL, C.DESCRICAO, C.VALORLITRO FROM COMBUSTIVEL C '+
          ' WHERE C.IDCOMBUSTIVEL = ' + IntToStr(pId);
  FDConnection.PrepareStatement(vSql);
  FDConnection.Activate;

  if FDConnection.IsEmpty then
    Exit;

  Result := TCombustivel.Create;
  Result.IdCombustivel := FDConnection.GetValue(0);
  Result.Descricao := FDConnection.GetValue(1);
  Result.ValorLitro := FDConnection.GetValue(2);
end;

constructor TCombustivelDao.Create;
begin
  FDConnection := TDataModule1.Create(nil);
end;

destructor TCombustivelDao.Destroy;
begin
  FDConnection.DisposeOf;
  inherited;
end;

function TCombustivelDao.CarregarCombustiveis: TList<TCombustivel>;
var
  vListaCombustivel: TList<TCombustivel>;
  vCombustivel: TCombustivel;
  vSql: string;
begin
  vListaCombustivel := TList<TCombustivel>.Create;
  //
  vSql := ' SELECT C.IDCOMBUSTIVEL, C.DESCRICAO, C.VALORLITRO FROM COMBUSTIVEL C ';
  FDConnection.PrepareStatement(vSql);
  FDConnection.Activate;

  with FDConnection do
  begin
    while not ListaRegistros.Eof do
    begin
      vCombustivel := TCombustivel.Create;
      vCombustivel.IdCombustivel := ListaRegistros.Fields[0].Value;
      vCombustivel.Descricao := ListaRegistros.Fields[1].Value;
      vListaCombustivel.Add(vCombustivel);
      ListaRegistros.Next;
    end;
  end;

  Result := vListaCombustivel;
end;


end.
