unit uTanqueModel;

interface

uses uCombustivelModel;

type
  TTanque = class
    private
      fIdTanque: integer;
      fDescricao: string;
      fCombustivel: TCombustivel;
    public
      property IdTanque: integer read fIdTanque write fIdTanque;
      property Descricao: string read fDescricao write fDescricao;
      property Combustivel: TCombustivel read fCombustivel write fCombustivel;
  end;

implementation

end.

