unit uPrincipalDao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.IBBase, UAbastecimentoModel, uImpostoModel;

type
  TDataModule1 = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    FDQuery: TFDQuery;
    FDQuery1: TFDQuery;
    FDQuery1DATAABASTECIMENTO: TDateField;
    FDQuery1IDBOMBA: TIntegerField;
    FDQuery1DESC_BOMBA: TStringField;
    FDQuery1IDTANQUE: TIntegerField;
    FDQuery1DESC_TANQUE: TStringField;
    FDQuery1TOTAL_ABAST_BRT_DIA: TFMTBCDField;
    FDQuery1TOTAL_ABAST_LIQ_DIA: TFMTBCDField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PrepareStatement(pSql: string);
    procedure SetValue(pIndex: integer; pValue: Variant);
    function GetValue(pIndex: integer): Variant;
    procedure ExecSQL;
    procedure StartTransaction;
    procedure Commit;
    procedure Rollback;
    procedure Activate;
    procedure Close;
    function IsEmpty: Boolean;
    function ListaRegistros: TFDQuery;
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TDataModule1.Commit;
begin
  FDConnection.Commit;
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  FDConnection.Connected := True;
end;

procedure TDataModule1.ExecSQL;
begin
  FDQuery.ExecSQL;
end;

procedure TDataModule1.Activate;
begin
  FDQuery.Active := True;
end;

procedure TDataModule1.PrepareStatement(pSql: string);
begin
  FDQuery.SQL.Clear;
  FDQuery.SQL.Add(pSql);
end;

procedure TDataModule1.Rollback;
begin
  FDConnection.Rollback;
end;

procedure TDataModule1.SetValue(pIndex: integer; pValue: Variant);
begin
  FDQuery.Params.Add;
  FDQuery.Params[pIndex].Value := pValue;
end;

function TDataModule1.GetValue(pIndex: integer): Variant;
begin
  result := FDQuery.Fields[pIndex].Value;
end;

function TDataModule1.IsEmpty: Boolean;
begin
  Result := FDQuery.IsEmpty;
end;

function TDataModule1.ListaRegistros: TFDQuery;
begin
  result := FDQuery;
end;

procedure TDataModule1.StartTransaction;
begin
  FDConnection.StartTransaction;
end;

procedure TDataModule1.Close;
begin
  FDQuery.Close;
end;

end.
