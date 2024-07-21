unit uRelatorioAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  uRelatorioAbastecimentosPrint;

type
  TfrmRelatorioAbastecimentos = class(TForm)
    dtpDataInicial: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    dtpDataFinal: TDateTimePicker;
    btnImprimir: TButton;
    btnSair: TButton;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioAbastecimentos: TfrmRelatorioAbastecimentos;

implementation

{$R *.dfm}

procedure TfrmRelatorioAbastecimentos.btnImprimirClick(Sender: TObject);
var
  relRelatoriosAbastecimentosPrint: TrelRelatorioAbastecimentosPrint;
begin
  if dtpDataFinal.Date < dtpDataInicial.Date then
  begin
    MessageDlg('Perído inválido.', mtError ,[mbOk], 0);
    dtpDataInicial.SetFocus;
    Exit;
  end;

  relRelatoriosAbastecimentosPrint := TrelRelatorioAbastecimentosPrint.Create(self);
  relRelatoriosAbastecimentosPrint.vDataInicial := dtpDataInicial.Date;
  relRelatoriosAbastecimentosPrint.vDataFinal := dtpDataFinal.Date;
  relRelatoriosAbastecimentosPrint.RLReport1.Preview();
  relRelatoriosAbastecimentosPrint.Free;
end;

procedure TfrmRelatorioAbastecimentos.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelatorioAbastecimentos.FormShow(Sender: TObject);
begin
  dtpDataInicial.DateTime := Date();
  dtpDataFinal.DateTime := Date();
end;

end.
