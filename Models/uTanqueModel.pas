unit uTanqueModel;

interface

type
  TTanque = class
    private
      fIdTanque: integer;
      fDescricao: string;
    public
      property IdTanque: integer read fIdTanque write fIdTanque;
      property Descricao: string read fDescricao write fDescricao;
  end;

implementation

end.

