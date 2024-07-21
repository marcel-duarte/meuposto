program MeuPosto;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  uImpostoController in 'Controller\uImpostoController.pas',
  uAbastecimentoModel in 'Models\uAbastecimentoModel.pas',
  UBombaModel in 'Models\UBombaModel.pas',
  uCombustivelModel in 'Models\uCombustivelModel.pas',
  uImpostoModel in 'Models\uImpostoModel.pas',
  uTanqueModel in 'Models\uTanqueModel.pas',
  uAbastecimentoView in 'Views\uAbastecimentoView.pas' {frmAbastecimento},
  uPrincipalDao in 'Dao\uPrincipalDao.pas' {DataModule1: TDataModule},
  uAbastecimentoDao in 'Dao\uAbastecimentoDao.pas',
  uImpostoDao in 'Dao\uImpostoDao.pas',
  uBombaDao in 'Dao\uBombaDao.pas',
  uTanqueDao in 'Dao\uTanqueDao.pas',
  uCombustivelDao in 'Dao\uCombustivelDao.pas',
  uListaImpostos in 'Models\uListaImpostos.pas',
  uPrincipalView in 'Views\uPrincipalView.pas' {frmPrincipalView},
  uAbastecimentoController in 'Controller\uAbastecimentoController.pas',
  uCombustivelController in 'Controller\uCombustivelController.pas',
  uBombaController in 'Controller\uBombaController.pas',
  uRelatorioAbastecimentosPrint in 'Reports\uRelatorioAbastecimentosPrint.pas' {relRelatorioAbastecimentosPrint},
  uRelatorioAbastecimentos in 'Views\uRelatorioAbastecimentos.pas' {frmRelatorioAbastecimentos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Light Slate');
  Application.CreateForm(TfrmPrincipalView, frmPrincipalView);
  Application.Run;
end.
