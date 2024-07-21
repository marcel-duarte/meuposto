unit uRelatorioAbastecimentosPrint;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB, uPrincipalDao;

type
  TrelRelatorioAbastecimentosPrint = class(TForm)
    RLReport1: TRLReport;
    rlbCabecalho: TRLBand;
    rlbTitulo: TRLBand;
    rlbCabecalhoColunas: TRLBand;
    rlbDados: TRLBand;
    rlbRodape: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel2: TRLLabel;
    rllPeriodo: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    rldbData: TRLDBText;
    rldbTanque: TRLDBText;
    rldbBomba: TRLDBText;
    rldbValorAbastecimentoLiquido: TRLDBText;
    dsRelatorioAbastecimentos: TDataSource;
    RLLabel8: TRLLabel;
    rldbValorAbastecimentoBruto: TRLDBText;
    rllValorAbastBruto: TRLLabel;
    rllValorAbastLiquido: TRLLabel;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rlbCabecalhoColunasBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure rlbDadosBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlbRodapeBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    FDConnection: TDataModule1;
    fValorTotalBruto: Double;
    fValorTotalLiquido: Double;
    procedure MontaFiltro;
  public
    { Public declarations }
    vDataInicial, vDatafinal: TDateTime;
  end;

var
  relRelatorioAbastecimentosPrint: TrelRelatorioAbastecimentosPrint;

implementation

{$R *.dfm}

procedure TrelRelatorioAbastecimentosPrint.FormCreate(Sender: TObject);
begin
  FDConnection := TDataModule1.Create(nil);
end;

procedure TrelRelatorioAbastecimentosPrint.MontaFiltro;
var
  vSql: string;
begin
  vSql := ' SELECT A.DATAABASTECIMENTO, B.IDBOMBA, B.DESCRICAO DESC_BOMBA, T.IDTANQUE, '+
          '   T.DESCRICAO DESC_TANQUE, SUM(A.VALORABASTECIMENTO) TOTAL_ABAST_BRT_DIA, SUM(A.VALORFINALABASTECIMENTO) TOTAL_ABAST_LIQ_DIA '+
          ' FROM ABASTECIMENTO A '+
          ' LEFT JOIN BOMBA B ON B.IDBOMBA = A.IDBOMBA '+
          ' LEFT JOIN TANQUE T ON T.IDTANQUE = B.IDTANQUE '+
          ' WHERE A.DATAABASTECIMENTO BETWEEN '+QuotedStr(FormatDateTime('dd.mm.yyyy',vDataFinal))+
          '    AND '+QuotedStr(FormatDateTime('dd.mm.yyyy',vDataFinal))+
          ' GROUP BY 1,2,3,4,5 '+
          ' ORDER BY A.DATAABASTECIMENTO ';
  FDConnection.PrepareStatement(vSql);
  FDConnection.Activate;

  dsRelatorioAbastecimentos.DataSet := FDConnection.ListaRegistros;
end;


procedure TrelRelatorioAbastecimentosPrint.rlbCabecalhoColunasBeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  fValorTotalBruto := 0;
  fValorTotalLiquido := 0;
end;

procedure TrelRelatorioAbastecimentosPrint.rlbDadosBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  fValorTotalBruto := fValorTotalBruto + dsRelatorioAbastecimentos.DataSet.Fields[5].Value;
  fValorTotalLiquido := fValorTotalLiquido +  + dsRelatorioAbastecimentos.DataSet.Fields[6].Value;
end;

procedure TrelRelatorioAbastecimentosPrint.rlbRodapeBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  rllValorAbastBruto.Caption := FormatFloat('#,##0.00',fValorTotalBruto);
  rllValorAbastLiquido.Caption := FormatFloat('#,##0.00',fValorTotalLiquido);
end;

procedure TrelRelatorioAbastecimentosPrint.FormDestroy(Sender: TObject);
begin
  FDConnection.DisposeOf;
end;

procedure TrelRelatorioAbastecimentosPrint.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  rllPeriodo.Caption := 'Período: '+DateToStr(vDataInicial)+' a '+DateToStr(vDataFinal);
  MontaFiltro;
end;

end.
