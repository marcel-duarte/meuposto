program MeuPostoTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  TestuAbastecimentoView in 'TestuAbastecimentoView.pas',
  uAbastecimentoView in '..\Views\uAbastecimentoView.pas',
  uImpostoController in '..\Controller\uImpostoController.pas',
  uAbastecimentoModel in '..\Models\uAbastecimentoModel.pas',
  UBombaModel in '..\Models\UBombaModel.pas',
  uCombustivelModel in '..\Models\uCombustivelModel.pas',
  uImpostoModel in '..\Models\uImpostoModel.pas',
  uTanqueModel in '..\Models\uTanqueModel.pas',
  uPrincipalDao in '..\Dao\uPrincipalDao.pas' {DataModule1: TDataModule},
  uAbastecimentoDao in '..\Dao\uAbastecimentoDao.pas',
  uImpostoDao in '..\Dao\uImpostoDao.pas',
  uBombaDao in '..\Dao\uBombaDao.pas',
  uTanqueDao in '..\Dao\uTanqueDao.pas',
  uCombustivelDao in '..\Dao\uCombustivelDao.pas',
  uListaImpostos in '..\Models\uListaImpostos.pas',
  uPrincipalView in '..\Views\uPrincipalView.pas' {frmPrincipalView},
  uAbastecimentoController in '..\Controller\uAbastecimentoController.pas',
  uCombustivelController in '..\Controller\uCombustivelController.pas',
  uBombaController in '..\Controller\uBombaController.pas',
  uRelatorioAbastecimentosPrint in '..\Reports\uRelatorioAbastecimentosPrint.pas' {relRelatorioAbastecimentosPrint},
  uRelatorioAbastecimentos in '..\Views\uRelatorioAbastecimentos.pas' {frmRelatorioAbastecimentos};


{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

