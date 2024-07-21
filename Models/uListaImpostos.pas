unit uListaImpostos;

interface

uses
  System.Generics.Collections,
  uImpostoModel;

type
  TListaImpostos = class
  private
    fImpostos: TList<TImposto>;
  public
    property Impostos: TList<TImposto> read fImpostos write fImpostos;
  end;

implementation

end.
