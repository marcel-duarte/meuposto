unit uImpostoDao;

interface

uses
  System.Generics.Collections,
  SysUtils,
  uImpostoModel,
  uPrincipalDao;

type
  TImpostoDao = class
  private
    FDConnection: TDataModule1;
  public
    constructor Create;
    destructor Destroy; override;
    function CarregarImposto(pId: Integer): TImposto;
    function CarregarImpostos: TList<TImposto>;
  end;

implementation

{ TImpostoDao }

constructor TImpostoDao.Create;
begin
  FDConnection := TDataModule1.Create(nil);
end;

destructor TImpostoDao.Destroy;
begin
  FDConnection.DisposeOf;
  inherited;
end;

function TImpostoDao.CarregarImposto(pId: Integer): TImposto;
var
  vSql: string;
begin
  Result := nil;
  vSql := ' SELECT I.IDIMPOSTO, I.DESCRICAO, I.PERCENTUAL '+
          ' FROM IMPOSTO I WHERE I.IDIMPOSTO = ' + pId.ToString;
  FDConnection.PrepareStatement(vSql);
  FDConnection.Activate;

  if FDConnection.IsEmpty then
    Exit;

  Result := TImposto.Create;
  Result.IdImposto := FDConnection.GetValue(0);
  Result.Descricao := FDConnection.GetValue(1);
  Result.Percentual := FDConnection.GetValue(2);
end;

function TImpostoDao.CarregarImpostos: TList<TImposto>;
var
  vListaImposto: TList<TImposto>;
  vImposto: TImposto;
  vSql: string;
begin
  vListaImposto := TList<TImposto>.Create;
  //
  vSql := ' SELECT I.IDIMPOSTO, I.DESCRICAO, I.PERCENTUAL FROM IMPOSTO I ';
  FDConnection.PrepareStatement(vSql);
  FDConnection.Activate;

  with FDConnection do
  begin
    while not ListaRegistros.Eof do
    begin
      vImposto := TImposto.Create;
      vImposto.IdImposto := ListaRegistros.Fields[0].Value;
      vImposto.Descricao := ListaRegistros.Fields[1].Value;
      vListaImposto.Add(vImposto);
      ListaRegistros.Next;
    end;
  end;

  Result := vListaImposto;
end;

end.
