//===- linearsolver-opt.cpp ---------------------------------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "mlir/IR/MLIRContext.h"
#include "mlir/InitAllDialects.h"
#include "mlir/InitAllPasses.h"
#include "mlir/Support/FileUtilities.h"
#include "mlir/Tools/mlir-opt/MlirOptMain.h"

#include "LinearSolver/LinearSolverDialect.h"
#include "LinearSolver/LinearSolverPasses.h"

int main(int argc, char **argv) {
  mlir::registerAllPasses();
  mlir::linearsolver::registerPasses();
  // TODO: Register linearsolver passes here.

  mlir::DialectRegistry registry;
  registry.insert<mlir::linearsolver::LinearSolverDialect,
                  mlir::arith::ArithDialect, mlir::func::FuncDialect>();
  // Add the following to include *all* MLIR Core dialects, or selectively
  // include what you need like above. You only need to register dialects that
  // will be *parsed* by the tool, not the one generated
  // registerAllDialects(registry);

  mlir::MLIRContext context(registry);
  mlir::PassManager pm(&context);

  llvm::cl::opt<std::string> pipelineOption(
      "pipeline",
      llvm::cl::desc("Select pipeline to run (options: forward, backward, lu, ilu, cholesky)"),
      llvm::cl::init(""));

  if (pipelineOption == "forward")
      mlir::linearsolver::registerForwardSubstitutionPipeline(pm);
  else if (pipelineOption == "backward")
      mlir::linearsolver::registerBackwardSubstitutionPipeline(pm);
  else if (pipelineOption == "lu")
      mlir::linearsolver::registerLUFactorizationPipeline(pm);
  else if (pipelineOption == "ilu")
      mlir::linearsolver::registerILUFactorizationPipeline(pm);
  else if (pipelineOption == "cholesky")
      mlir::linearsolver::registerCholeskyDecompositionPipeline(pm);
  else {
      llvm::errs() << "Invalid pipeline option\n";
      return 1;
  }

  if (failed(pm.run(module))) {
      llvm::errs() << "Pipeline failed.\n";
      return 1;
  }

  return mlir::asMainReturnCode(
      mlir::MlirOptMain(argc, argv, "LinearSolver optimizer driver\n", registry));
}
