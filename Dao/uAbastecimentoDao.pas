unit uAbastecimentoDao;

interface

uses
  System.Generics.Collections,
  SysUtils,
  Vcl.Dialogs,
  UAbastecimentoModel,
  uPrincipalDao,
  uImpostoDao,
  uBombaDao,
  uCombustivelDao;

type
  TAbastecimentoDao = Class
  private
    FDConnection: TDataModule1;
    fImpostoDao: TImpostoDao;
    fBombaDao: TBombaDao;
    fCombustivelDao: TCombustivelDao;
  public
    constructor Create;
    destructor Destroy; override;
    function GeraAbastecimento(pAbastecimento: TAbastecimento; var pErro: string): Boolean;
    function CarregaAbastecimento(pAbastecimento: TAbastecimento; var pErro: string): Boolean;
    function CarregaAbastecimentos: TList<TAbastecimento>;
    //
    property ImpostoDao: TImpostoDao read fImpostoDao write fImpostoDao;
  End;

implementation

{ TAbastecimentoDao }

constructor TAbastecimentoDao.Create;
begin
  FDConnection := TDataModule1.Create(nil);
  fImpostoDao := TImpostoDao.Create;
  fBombaDao := TBombaDao.Create;
  fCombustivelDao := TCombustivelDao.Create;
end;

destructor TAbastecimentoDao.Destroy;
begin
  FDConnection.DisposeOf;
  fImpostoDao.DisposeOf;
  fBombaDao.DisposeOf;
  fCombustivelDao.DisposeOf;
  inherited;
end;

function TAbastecimentoDao.GeraAbastecimento(pAbastecimento: TAbastecimento; var pErro: string): Boolean;
var
  vSql: string;
begin
  Result := False;
  FDConnection.StartTransaction;
  try
    vSql := 'INSERT INTO ABASTECIMENTO (IDBOMBA, IDCOMBUSTIVEL, IDIMPOSTO, QTDLITROS, '+
          ' DATAABASTECIMENTO, VALORABASTECIMENTO, VALORIMPOSTO, VALORFINALABASTECIMENTO) VALUES (?, ?, ?, ?, ?, ?, ?, ?)';
    FDConnection.PrepareStatement(vSql);
    FDConnection.SetValue(0, pAbastecimento.Bomba.IdBomba);
    FDConnection.SetValue(1, pAbastecimento.Combustivel.IdCombustivel);
    FDConnection.SetValue(2, pAbastecimento.Imposto.IdImposto);
    FDConnection.SetValue(3, pAbastecimento.QtdLitros);
    FDConnection.SetValue(4, FormatDateTime('dd.mm.yyyy', pAbastecimento.DataAbastecimento));
    FDConnection.SetValue(5, pAbastecimento.ValorAbastecimento);
    FDConnection.SetValue(6, pAbastecimento.ValorImposto);
    FDConnection.SetValue(7, pAbastecimento.ValorFinalAbastecimento);
    FDConnection.ExecSQL;
    FDConnection.Commit;
  except
    on e: exception do
      begin
        FDConnection.Rollback;
        pErro := 'Erro ao gerar abastecimento: ' + E.Message;
        Result := False;
      end;
  end;
end;

function TAbastecimentoDao.CarregaAbastecimento(pAbastecimento: TAbastecimento; var pErro: string): Boolean;
var
  vSql: string;
  vId: integer;
  vErro: string;
begin
  Result := False;
  try
    vSql := 'SELECT IDABASTECIMENTO, IDBOMBA, IDCOMBUSTIVEL, IDIMPOSTO, QTDLITROS, DATAABASTECIMENTO, '+
            '   VALORABASTECIMENTO, VALORIMPOSTO, VALORFINALABASTECIMENTO FROM ABASTECIMENTO '+
            'WHERE IDABASTECIMENTO = :IDABASTECIMENTO';
    FDConnection.PrepareStatement(vSql);

    if FDConnection.ListaRegistros.IsEmpty then
    begin
      FDConnection.Rollback;
      pErro := 'Abastecimento não encontrado.';
      Exit;
    end;

    pAbastecimento.IdAbastecimento := FDConnection.GetValue(0);

    vId := FDConnection.GetValue(1);
    pAbastecimento.Bomba := fBombaDao.CarregarBomba(vId);

    vId := FDConnection.GetValue(2);
    pAbastecimento.Combustivel := fCombustivelDao.CarregarCombustivel(vId);

    vId := FDConnection.GetValue(3);
    pAbastecimento.Imposto := ImpostoDao.CarregarImposto(vId);

//    if pAbastecimento.Imposto = nil then
//    begin
//      MessageDlg('Imposto não encontrado.', mtError ,[mbOk], 0);
//      Exit;
//    end;

    pAbastecimento.QtdLitros := FDConnection.GetValue(4);
    pAbastecimento.DataAbastecimento := FDConnection.GetValue(5);
    pAbastecimento.ValorAbastecimento := FDConnection.GetValue(6);
    pAbastecimento.ValorImposto := FDConnection.GetValue(7);
    pAbastecimento.ValorFinalAbastecimento := FDConnection.GetValue(8);
  except
    on e: exception do
      begin
        FDConnection.Rollback;
        pErro := 'Erro ao carregar o abastecimento: ' + E.Message;
        Result := False;
      end;
  end;
end;

function TAbastecimentoDao.CarregaAbastecimentos: TList<TAbastecimento>;
var
  vSql: string;
  vId: integer;
  vErro: string;
  vListaAbastecimentos: TList<TAbastecimento>;
  vAbastecimento: TAbastecimento;
begin
  vListaAbastecimentos := TList<TAbastecimento>.Create;
  try
    vSql := 'SELECT IDABASTECIMENTO, IDBOMBA, IDCOMBUSTIVEL, IDIMPOSTO, QTDLITROS, DATAABASTECIMENTO, '+
            '   VALORABASTECIMENTO, VALORIMPOSTO, VALORFINALABASTECIMENTO FROM ABASTECIMENTO ';

    FDConnection.PrepareStatement(vSql);
    FDConnection.Activate;

    with FDConnection do
    begin
      while not ListaRegistros.Eof do
      begin
        vAbastecimento := TAbastecimento.Create;
        vAbastecimento.IdAbastecimento := GetValue(0);

        vId := GetValue(1);
        vAbastecimento.Bomba := fBombaDao.CarregarBomba(vId);

        vId := GetValue(2);
        vAbastecimento.Combustivel := fCombustivelDao.CarregarCombustivel(vId);

        vId := GetValue(3);
        vAbastecimento.Imposto := ImpostoDao.CarregarImposto(vId);

        vAbastecimento.QtdLitros := GetValue(4);
        vAbastecimento.DataAbastecimento := GetValue(5);
        vAbastecimento.ValorAbastecimento := GetValue(6);
        vAbastecimento.ValorImposto := GetValue(7);
        vAbastecimento.ValorFinalAbastecimento := GetValue(8);

        vListaAbastecimentos.Add(vAbastecimento);
        ListaRegistros.Next;
      end;
    end;
  finally
    Result := vListaAbastecimentos;
  end;
end;

end.
