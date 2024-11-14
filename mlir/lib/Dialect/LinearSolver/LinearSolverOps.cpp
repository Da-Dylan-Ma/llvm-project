//===- LinearSolverOps.cpp - Implementation of LinearSolver operations ----===//
//
//===----------------------------------------------------------------------===//

#include "mlir/Dialect/LinearSolver/LinearSolverOps.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/OpImplementation.h"

using namespace mlir;
using namespace mlir::linear_solver;

#define GET_OP_CLASSES
#include "mlir/Dialect/LinearSolver/LinearSolverOps.cpp.inc"

// TODO: Placeholder verifications to be implemented

LogicalResult TriangularSolveOp::verify() {
  // Ensure that the matrix is square
  // Ensure the RHS and solution have compatible shapes
  if (/* Check matrix dimensions here */)
    return emitOpError("expected a square matrix for triangular solve");

  return success();
}

LogicalResult LUFactorizeOp::verify() { return success(); }
LogicalResult ILUFactorizeOp::verify() { return success(); }
LogicalResult CholeskyDecomposeOp::verify() { return success(); }
LogicalResult ForwardSubstitutionOp::verify() { return success(); }
LogicalResult BackwardSubstitutionOp::verify() { return success(); }
