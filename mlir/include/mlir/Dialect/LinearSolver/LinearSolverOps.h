//===- LinearSolverOps.h - LinearSolver operations ---------------*- C++ -*-===//
//
//===----------------------------------------------------------------------===//

#ifndef MLIR_DIALECT_LINEARSOLVER_LINEARSOLVEROPS_H
#define MLIR_DIALECT_LINEARSOLVER_LINEARSOLVEROPS_H

#include "mlir/IR/OpDefinition.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/Operation.h"
#include "mlir/Interfaces/SideEffectInterfaces.h"

#define GET_OP_CLASSES
#include "mlir/Dialect/LinearSolver/LinearSolverOps.h.inc"

#endif // MLIR_DIALECT_LINEARSOLVER_LINEARSOLVEROPS_H
