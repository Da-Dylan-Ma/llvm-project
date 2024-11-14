//===- LinearSolverDialect.cpp - LinearSolver dialect ----------------------===//
//
//===----------------------------------------------------------------------===//

#include "mlir/Dialect/LinearSolver/LinearSolverDialect.h"
#include "mlir/Dialect/LinearSolver/LinearSolverOps.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/DialectImplementation.h"

using namespace mlir;
using namespace mlir::linear_solver;

#include "mlir/Dialect/LinearSolver/LinearSolverOpsDialect.cpp.inc"

// Constructor to register the dialect and operations
LinearSolverDialect::LinearSolverDialect(MLIRContext *context)
    : Dialect(getDialectNamespace(), context, TypeID::get<LinearSolverDialect>()) {
  addOperations<
      TriangularSolveOp,
      LUFactorizeOp,
      ILUFactorizeOp,
      CholeskyDecomposeOp,
      ForwardSubstitutionOp,
      BackwardSubstitutionOp
  >();
}
