//===- LinearSolverDialect.h - LinearSolver dialect -----------------*- C++ -*-===//
//
//===----------------------------------------------------------------------===//

#ifndef MLIR_DIALECT_LINEARSOLVER_LINEARSOLVERDIALECT_H
#define MLIR_DIALECT_LINEARSOLVER_LINEARSOLVERDIALECT_H

#include "mlir/IR/Dialect.h"
#include "mlir/IR/OpDefinition.h"

namespace mlir {
namespace linear_solver {

class LinearSolverDialect : public Dialect {
public:
  explicit LinearSolverDialect(MLIRContext *context);
  static StringRef getDialectNamespace() { return "linear_solver"; }
};

} // end namespace linear_solver
} // end namespace mlir

#endif // MLIR_DIALECT_LINEARSOLVER_LINEARSOLVERDIALECT_H
