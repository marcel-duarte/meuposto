unit uBombaModel;

interface

uses
  System.Generics.Collections,
  uTanqueModel;

type
  TBomba = class
    private
      fIdBomba: integer;
      fDescricao: string;
      fTanque: TTanque;
    public
      property IdBomba: integer read fIdBomba write fIdBomba;
      property Descricao: string read fDescricao write fDescricao;
      property Tanque: TTanque read fTanque write fTanque;
  end;

implementation

{ TBomba }

end.

