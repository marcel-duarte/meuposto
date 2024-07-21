unit uPrincipalView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uAbastecimentoView,
  uRelatorioAbastecimentos;

type
  TfrmPrincipalView = class(TForm)
    btAbastecer: TButton;
    btnSair: TButton;
    btnImprimir: TButton;
    procedure btnSairClick(Sender: TObject);
    procedure btAbastecerClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipalView: TfrmPrincipalView;

implementation

{$R *.dfm}

procedure TfrmPrincipalView.btAbastecerClick(Sender: TObject);
var
  frmAbastecimento: TfrmAbastecimento;
begin
  frmAbastecimento := TfrmAbastecimento.Create(self);
  frmAbastecimento.ShowModal;
  frmAbastecimento.Free;
end;

procedure TfrmPrincipalView.btnImprimirClick(Sender: TObject);
var
  frmRelatoriosAbastecimentos: TfrmRelatorioAbastecimentos;
begin
  frmRelatoriosAbastecimentos := TfrmRelatorioAbastecimentos.Create(self);
  frmRelatoriosAbastecimentos.ShowModal;
  frmRelatoriosAbastecimentos.Free;
end;

procedure TfrmPrincipalView.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
