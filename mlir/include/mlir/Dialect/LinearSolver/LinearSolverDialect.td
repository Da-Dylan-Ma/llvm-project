//===- LinearSolverDialect.td - LinearSolver dialect definition -*- tablegen -*-===//
//
//===----------------------------------------------------------------------===//
//
// This file defines the LinearSolver dialect that contains operations for
// various linear solver techniques like triangular solve, LU factorization,
// ILU factorization, and Cholesky decomposition.
//
//===----------------------------------------------------------------------===//

include "mlir/IR/OpBase.td"

def LinearSolverDialect : Dialect {
  let name = "linear_solver";
  let cppNamespace = "::mlir::linear_solver";
}
