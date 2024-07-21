unit uCombustivelModel;

interface

type
  TCombustivel = class
  private
    fIdCombustivel: integer;
    fDescricao: string;
    fValorLitro: double;
  public
    property IdCombustivel: integer read fIdCombustivel write fIdCombustivel;
    property Descricao: string read fDescricao write fDescricao;
    property ValorLitro: double read fValorLitro write fValorLitro;
  end;

implementation

{ TCombustivel }

end.

