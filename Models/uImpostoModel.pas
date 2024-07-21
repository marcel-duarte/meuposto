unit uImpostoModel;

interface

uses
  Vcl.Dialogs;

type
  TImposto = class
    private
      fIdImposto: integer;
      fDescricao: string;
      fPercentual: Double;
    procedure SetPercentual(const Value: Double);
    public
      property IdImposto: integer read fIdImposto write fIdImposto;
      property Descricao: string read fDescricao write fDescricao;
      property Percentual: Double read fPercentual write SetPercentual;
  end;

implementation

{ TImposto }

procedure TImposto.SetPercentual(const Value: Double);
begin
  if Value < 0 then
  begin
    showmessage('Percentual inválido!');
    Exit;
  end;
  fPercentual := Value;
end;

end.
