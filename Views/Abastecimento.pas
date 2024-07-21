unit Abastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Datasnap.DBClient, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask;

type
  TAcao = (acIncluir, acAlterar, acExcluir, acConsultar);

  TForm2 = class(TForm)
    pnlBarraInferior: TPanel;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnConsultar: TButton;
    btnSair: TButton;
    PageControl: TPageControl;
    tbLista: TTabSheet;
    tbCadastro: TTabSheet;
    dbgAbastecimento: TDBGrid;
    dsAbastecimento: TDataSource;
    leId: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    cbxBomba: TComboBoxEx;
    Label1: TLabel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    Button1: TButton;
    //
    procedure btnSairClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    fAcao: TAcao;
    procedure IncluirRegistro;
    procedure AlterarRegistro;
    procedure ExcluirRegistro;
    procedure ConsultarRegistro;
    procedure ImprimirAbastecimentos;
    procedure ConfirmarRegistro;
    procedure CancelarRegistro;
    procedure ConfiguracoesIniciais;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses DMPrincipal;

procedure TForm2.btnIncluirClick(Sender: TObject);
begin
  IncluirRegistro;
end;

procedure TForm2.btnAlterarClick(Sender: TObject);
begin
  AlterarRegistro;
end;

procedure TForm2.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TForm2.btnConfirmarClick(Sender: TObject);
begin
  ConfirmarRegistro;
end;

procedure TForm2.btnCancelarClick(Sender: TObject);
begin
  CancelarRegistro;
end;

procedure TForm2.ImprimirAbastecimentos;
begin
  //
end;

procedure TForm2.IncluirRegistro;
begin
  PageControl.ActivePageIndex := 1;
  leId.SetFocus;
  fAcao := acIncluir;

  //CarregaDados(fdqAbastecimento);
end;

procedure TForm2.ConsultarRegistro;
begin
  fAcao := acConsultar;
  //
end;

procedure TForm2.AlterarRegistro;
begin
  PageControl.ActivePageIndex := 1;
  elId.SetFocus;
  fAcao := acAlterar;
end;

procedure TForm2.ExcluirRegistro;
begin
  fAcao := acExcluir;
end;

procedure TForm2.ConfiguracoesIniciais;
begin
  tbLista.TabVisible := False;
  tbCadastro.TabVisible := False;
end;

procedure TForm2.ConfirmarRegistro;
begin
  PageControl.ActivePageIndex := 0;
  dbgAbastecimento.SetFocus;
end;

procedure TForm2.CancelarRegistro;
begin
  PageControl.ActivePageIndex := 0;
  dbgAbastecimento.SetFocus;
end;

end.
