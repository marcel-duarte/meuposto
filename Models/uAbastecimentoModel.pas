unit uAbastecimentoModel;

interface

uses uBombaModel,
  uImpostoModel,
  uCombustivelModel;

type
  TAbastecimento = class
    private
      fIdAbastecimento: integer;
      fBomba: TBomba;
      fCombustivel: TCombustivel;
      fQtdLitros: Double;
      fValorAbastecimento: Double;
      fDataAbastecimento: TDate;
      fImposto: TImposto;
      fValorImposto: Double;
      fValorFinalAbastecimento: Double;
    public
      property IdAbastecimento: integer read fIdAbastecimento write fIdAbastecimento;
      property Bomba: TBomba read fBomba write fBomba;
      property Combustivel: TCombustivel read fCombustivel write fCombustivel;
      property QtdLitros: Double read fQtdLitros write fQtdLitros;
      property ValorAbastecimento: Double read fValorAbastecimento write fValorAbastecimento;
      property DataAbastecimento: TDate read fDataAbastecimento write fDataAbastecimento;
      property Imposto: TImposto read fImposto write fImposto;
      property ValorImposto: Double read fValorImposto write fValorImposto;
      property ValorFinalAbastecimento: Double read fValorFinalAbastecimento write fValorFinalAbastecimento;
  end;

implementation



end.

