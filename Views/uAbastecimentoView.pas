unit uAbastecimentoView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.StrUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Datasnap.DBClient,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, uPrincipalDao,
  uAbastecimentoController, uAbastecimentoModel, Vcl.DBCtrls, uBombaController,
  UBombaModel, System.Generics.Collections, uImpostoModel, uImpostoController,
  uCombustivelModel, uCombustivelController, System.UITypes, DateUtils;

type
  TAcao = (acIncluir, acAlterar, acExcluir, acConsultar);

  TfrmAbastecimento = class(TForm)
    pnlBarraInferior: TPanel;
    btnAbastecer: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnConsultar: TButton;
    btnSair: TButton;
    pgcPrincipal: TPageControl;
    tbLista: TTabSheet;
    tbCadastro: TTabSheet;
    dbgAbastecimento: TDBGrid;
    dsAbastecimento: TDataSource;
    leId: TLabeledEdit;
    leQtdLitros: TLabeledEdit;
    leDataAbastecimento: TLabeledEdit;
    leValorAbastecimento: TLabeledEdit;
    leValorImposto: TLabeledEdit;
    leValorFinalAbastecimento: TLabeledEdit;
    cbxBomba: TComboBoxEx;
    Label1: TLabel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    cbxCombustivel: TComboBoxEx;
    Label2: TLabel;
    cbxImposto: TComboBoxEx;
    Label3: TLabel;
    sgListaAbastecimento: TStringGrid;
    lePercentualImposto: TLabeledEdit;
    leValorLitro: TLabeledEdit;
    //
    procedure btnSairClick(Sender: TObject);
    procedure btnAbastecerClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure leQtdLitrosKeyPress(Sender: TObject; var Key: Char);
    procedure cbxImpostoSelect(Sender: TObject);
    procedure leValorAbastecimentoExit(Sender: TObject);
    procedure cbxCombustivelSelect(Sender: TObject);
    procedure leQtdLitrosExit(Sender: TObject);
  private
    { Private declarations }
    fAcao: TAcao;
    //fListaImpostos: TListaImpostos;
    fAbastecimentoController: TAbastecimentoController;
    fBombaController: TBombaController;
    fImpostoController: TImpostoController;
    fCombustivelController: TCombustivelController;
    fListaAbastecimentos: TList<TAbastecimento>;
    //
    procedure IncluirRegistro;
    procedure AlterarRegistro;
    procedure ExcluirRegistro;
    procedure ConsultarRegistro;
    procedure ConfirmarRegistro;
    procedure CancelarRegistro;
    procedure ConfiguracoesIniciais;
    procedure LimparCampos;
    procedure CarregarComboBombas;
    procedure CarregarComboCombustivel;
    procedure CarregarComboImposto;
    procedure ConectaBancoDados;
    procedure PreencheGrade;
    procedure PreparaGrade;
    procedure LimpaGrade;
    procedure CalculaTudo;
  public
    { Public declarations }
  end;

var
  frmAbastecimento: TfrmAbastecimento;

implementation

{$R *.dfm}

procedure TfrmAbastecimento.LimparCampos;
begin
  leId.Text := EmptyStr;
  leDataAbastecimento.Text := DateToStr(Now);
  leQtdLitros.Text := FormatFloat('#,##0.00',0.00);
  leValorAbastecimento.Text := FormatFloat('#,##0.00',0.00);
  leValorImposto.Text := FormatFloat('#,##0.00',0.00);
  leValorFinalAbastecimento.Text := FormatFloat('#,##0.00',0.00);
  lePercentualImposto.Text := FormatFloat('#,##0.00',0.00);
  leValorLitro.Text := FormatFloat('#,##0.00',0.00);
  //
  cbxBomba.ItemIndex := -1;
  cbxCombustivel.ItemIndex := -1;
  cbxImposto.ItemIndex := -1;
end;

procedure TfrmAbastecimento.btnAbastecerClick(Sender: TObject);
begin
  IncluirRegistro;
end;

procedure TfrmAbastecimento.btnAlterarClick(Sender: TObject);
begin
  AlterarRegistro;
end;

procedure TfrmAbastecimento.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAbastecimento.btnConfirmarClick(Sender: TObject);
begin
  ConfirmarRegistro;
end;

procedure TfrmAbastecimento.btnConsultarClick(Sender: TObject);
begin
  ConsultarRegistro;
end;

procedure TfrmAbastecimento.btnExcluirClick(Sender: TObject);
begin
  ExcluirRegistro;
end;

procedure TfrmAbastecimento.btnCancelarClick(Sender: TObject);
begin
  CancelarRegistro;
end;

procedure TfrmAbastecimento.IncluirRegistro;
begin
  pgcPrincipal.ActivePage := tbCadastro;
  LimparCampos;
  fAcao := acIncluir;
  cbxBomba.SetFocus;
end;

procedure TfrmAbastecimento.CalculaTudo;
var
  vValor: Double;
begin
  vValor := fAbastecimentoController.CalculaValorAbastecido(StrToFloat(leQtdLitros.Text), StrToFloat(leValorLitro.Text));
  leValorAbastecimento.Text := FormatFloat('#,##0.00',vValor);
  vValor := fAbastecimentoController.CalculaImposto(StrToFloat(leValorAbastecimento.Text), StrToFloat(lePercentualImposto.Text));
  leValorImposto.Text := FormatFloat('#,##0.00',vValor);
  vValor := StrToFloat(leValorAbastecimento.Text) - StrToFloat(leValorImposto.Text);
  leValorFinalAbastecimento.Text := FormatFloat('#,##0.00',vValor);

  /// criar uma proc q calcula tudo passando params e devolvendo para os campos
end;

procedure TfrmAbastecimento.leQtdLitrosExit(Sender: TObject);
begin
  CalculaTudo;
end;

procedure TfrmAbastecimento.leQtdLitrosKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not(key in ['0'..'9','.',',',#8,#13]) then
    key := #0;
  if key in [',','.'] then
    key := FormatSettings.DecimalSeparator;
  if key = FormatSettings.DecimalSeparator then
  if pos(key,TEdit(Sender).Text) <> 0 then
    key := #0;
end;

procedure TfrmAbastecimento.leValorAbastecimentoExit(Sender: TObject);
begin
  CalculaTudo;
end;

procedure TfrmAbastecimento.ConsultarRegistro;
begin
  fAcao := acConsultar;
  //
end;

procedure TfrmAbastecimento.AlterarRegistro;
begin
  pgcPrincipal.ActivePageIndex := 1;
  leId.SetFocus;
  fAcao := acAlterar;
end;

procedure TfrmAbastecimento.ExcluirRegistro;
begin
  fAcao := acExcluir;
  if MessageDlg('Confirma exclusão do registro ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     //
  end;
end;

procedure TfrmAbastecimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fAbastecimentoController.DisposeOf;
  fBombaController.DisposeOf;
  fCombustivelController.DisposeOf;
  fImpostoController.DisposeOf;
  fListaAbastecimentos.DisposeOf;
end;

procedure TfrmAbastecimento.FormCreate(Sender: TObject);
begin
  ConfiguracoesIniciais;
end;

procedure TfrmAbastecimento.ConectaBancoDados;
begin
  //
end;

procedure TfrmAbastecimento.CarregarComboBombas;
var
  vListaBombas: TList<TBomba>;
  vBomba: TBomba;
begin
  vListaBombas := fBombaController.CarregarBombas;
  cbxBomba.ItemsEx.Clear;
  for vBomba in vListaBombas do
    cbxBomba.ItemsEx.AddItem(vBomba.Descricao, vBomba.IdBomba, 0, 0, vBomba.IdBomba, nil);
end;

procedure TfrmAbastecimento.CarregarComboImposto;
var
  vListaImpostos: TList<TImposto>;
  vImposto: TImposto;
begin
  vListaImpostos := fImpostoController.CarregarImpostos;
  cbxImposto.ItemsEx.Clear;
  for vImposto in vListaImpostos do
    cbxImposto.ItemsEx.AddItem(vImposto.Descricao, vImposto.IdImposto, 0, 0, vImposto.IdImposto, nil);
end;

procedure TfrmAbastecimento.cbxCombustivelSelect(Sender: TObject);
var
  vCombustivel: TCombustivel;
begin
  vCombustivel := fCombustivelController.CarregarCombustivel(cbxCombustivel.ItemsEx[cbxCombustivel.ItemIndex].ImageIndex);
  leValorLitro.Text := FormatFloat('#,##0.00',vCombustivel.ValorLitro);
  CalculaTudo;
end;

procedure TfrmAbastecimento.cbxImpostoSelect(Sender: TObject);
var
  vImposto: TImposto;
begin
  vImposto := fImpostoController.CarregarImposto(cbxImposto.ItemsEx[cbxImposto.ItemIndex].ImageIndex);
  lePercentualImposto.Text := FormatFloat('#,##0.00',vImposto.Percentual);
  CalculaTudo;
end;

procedure TfrmAbastecimento.CarregarComboCombustivel;
var
  vListaCombustiveis: TList<TCombustivel>;
  vCombustivel: TCombustivel;
begin
  vListaCombustiveis := fCombustivelController.CarregarCombustiveis;
  cbxCombustivel.ItemsEx.Clear;
  for vCombustivel in vListaCombustiveis do
    cbxCombustivel.ItemsEx.AddItem(vCombustivel.Descricao, vCombustivel.IdCombustivel, 0, 0, vCombustivel.IdCombustivel, nil);
end;

procedure TfrmAbastecimento.ConfiguracoesIniciais;
begin
  fAbastecimentoController := TAbastecimentoController.Create;
  fBombaController := TBombaController.Create;
  fCombustivelController := TCombustivelController.Create;
  fImpostoController := TImpostoController.Create;
  fListaAbastecimentos := TList<TAbastecimento>.Create;
  //
  //ConectaBancoDados;
  //
  tbLista.TabVisible := False;
  tbCadastro.TabVisible := False;
  pgcPrincipal.ActivePage := tbLista;
  //
  fListaAbastecimentos.Clear;
  fListaAbastecimentos := fAbastecimentoController.CarregaAbastecimentos;
  CarregarComboBombas;
  CarregarComboImposto;
  CarregarComboCombustivel;
  LimpaGrade;
  PreencheGrade;
end;

procedure TfrmAbastecimento.PreparaGrade;
var
  vCount: integer;
begin
//  if fListaAbastecimentos.Count > 0 then
//    vCount :=  + 1
//  else
//    vCount := 1;
  sgListaAbastecimento.RowCount := fListaAbastecimentos.Count+1;
  sgListaAbastecimento.FixedRows := 1;

  sgListaAbastecimento.ColCount := 9;
  sgListaAbastecimento.Cells[0,0] := 'Id';
  sgListaAbastecimento.Cells[1,0] := 'Bomba';
  sgListaAbastecimento.Cells[2,0] := 'Combustivel';
  sgListaAbastecimento.Cells[3,0] := 'Imposto (%)';
  sgListaAbastecimento.Cells[4,0] := 'Qtd.Litros';
  sgListaAbastecimento.Cells[5,0] := 'Data Abastec.';
  sgListaAbastecimento.Cells[6,0] := 'Valor Abastec. (R$)';
  sgListaAbastecimento.Cells[7,0] := 'Valor Imposto (R$)';
  sgListaAbastecimento.Cells[8,0] := 'Valor Final Abastec. (R$)';

  sgListaAbastecimento.ColWidths[0] := 64;
  sgListaAbastecimento.ColWidths[1] := 116;
  sgListaAbastecimento.ColWidths[2] := 128;
  sgListaAbastecimento.ColWidths[3] := 80;
  sgListaAbastecimento.ColWidths[4] := 68;
  sgListaAbastecimento.ColWidths[5] := 91;
  sgListaAbastecimento.ColWidths[6] := 110;
  sgListaAbastecimento.ColWidths[7] := 115;
  sgListaAbastecimento.ColWidths[8] := 167;

end;

procedure TfrmAbastecimento.PreencheGrade;
var
  vAbastecimento: TAbastecimento;
  vCount: integer;
begin
   for vCount := 0 to Pred(fListaAbastecimentos.Count) do
   begin
      vAbastecimento := fListaAbastecimentos.Items[vCount];
      sgListaAbastecimento.Cells[0, vCount+1] := vAbastecimento.IdAbastecimento.ToString;
      sgListaAbastecimento.Cells[1, vCount+1] := vAbastecimento.Bomba.Descricao;
      sgListaAbastecimento.Cells[2, vCount+1] := vAbastecimento.Combustivel.Descricao;
      sgListaAbastecimento.Cells[3, vCount+1] := FormatFloat('#,##0.00',vAbastecimento.Imposto.Percentual);
      sgListaAbastecimento.Cells[4, vCount+1] := FormatFloat('#,##0.00',vAbastecimento.QtdLitros);
      sgListaAbastecimento.Cells[5, vCount+1] := FormatDateTime('dd/mm/yyyy',vAbastecimento.DataAbastecimento);
      sgListaAbastecimento.Cells[6, vCount+1] := FormatFloat('#,##0.00',vAbastecimento.ValorAbastecimento);
      sgListaAbastecimento.Cells[7, vCount+1] := FormatFloat('#,##0.00',vAbastecimento.ValorImposto);
      sgListaAbastecimento.Cells[8, vCount+1] := FormatFloat('#,##0.00',vAbastecimento.ValorFinalAbastecimento);
   end;
end;

procedure TfrmAbastecimento.LimpaGrade;
begin
  sgListaAbastecimento.RowCount := 0;
  PreparaGrade;
end;

procedure TfrmAbastecimento.ConfirmarRegistro;
var
  vAbastecimento: TAbastecimento;
  vErro: string;
begin
  vAbastecimento := TAbastecimento.Create;
  vAbastecimento.DataAbastecimento := StrToDate(leDataAbastecimento.Text);
  vAbastecimento.Bomba := fBombaController.CarregarBomba(cbxBomba.ItemsEx[cbxBomba.ItemIndex].ImageIndex);
  vAbastecimento.Combustivel := fCombustivelController.CarregarCombustivel(cbxCombustivel.ItemsEx[cbxCombustivel.ItemIndex].ImageIndex);
  vAbastecimento.Imposto := fImpostoController.CarregarImposto(cbxImposto.ItemsEx[cbxImposto.ItemIndex].ImageIndex);
  vAbastecimento.QtdLitros := StrToFloat(leQtdLitros.Text);
  vAbastecimento.ValorAbastecimento := StrToFloat(leValorAbastecimento.Text);
  vAbastecimento.ValorImposto := StrToFloat(leValorImposto.Text);
  vAbastecimento.ValorFinalAbastecimento := StrToFloat(leValorFinalAbastecimento.Text);

  if fAcao = acIncluir then
  begin
    vErro := '';
    fAbastecimentoController.GeraAbastecimento(vAbastecimento, vErro);
    if vErro <> EmptyStr then
    begin
      MessageDlg(vErro, mtError ,[mbOk], 0);
      Exit;
    end;
  end;
  if fAcao = acAlterar then
  begin
{   // nao de precisar disso
    fAbastecimentoController.AlteraAbastecimento(vAbastecimento, vErro);
    if vErro <> EmptyStr then
    begin
      MessageDlg(vErro, mtError ,[mbOk], 0);
      Exit;
    end;
}
  end;
  //
  fListaAbastecimentos := fAbastecimentoController.CarregaAbastecimentos;
  LimpaGrade;
  PreencheGrade;
  pgcPrincipal.ActivePage := tbLista;
  dbgAbastecimento.SetFocus;
end;

procedure TfrmAbastecimento.CancelarRegistro;
begin
  pgcPrincipal.ActivePage := tbLista;
  dbgAbastecimento.SetFocus;
end;

end.
