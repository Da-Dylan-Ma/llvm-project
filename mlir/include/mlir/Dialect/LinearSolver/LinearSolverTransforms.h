//===- LinearSolverTransforms.h - LinearSolver transformation passes -------*- C++ -*-===//
//
//===----------------------------------------------------------------------===//
//
// This file defines transformation passes for the LinearSolver dialect.
//
//===----------------------------------------------------------------------===//

#ifndef MLIR_DIALECT_LINEARSOLVER_LINEARSOLVERTRANSFORMS_H
#define MLIR_DIALECT_LINEARSOLVER_LINEARSOLVERTRANSFORMS_H

#include "mlir/Pass/Pass.h"

namespace mlir {
namespace linear_solver {

// Function to create an instance of a pass that applies transformations to LinearSolver dialect operations.
std::unique_ptr<Pass> createOptimizeLinearSolverPass();

} // end namespace linear_solver
} // end namespace mlir

#endif // MLIR_DIALECT_LINEARSOLVER_LINEARSOLVERTRANSFORMS_H
