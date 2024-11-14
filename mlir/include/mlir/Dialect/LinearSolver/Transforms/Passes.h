//===- Passes.h - Pass Entrypoints ------------------------------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef MLIR_DIALECT_LINEARSOLVER_TRANSFORMS_PASSES_H_
#define MLIR_DIALECT_LINEARSOLVER_TRANSFORMS_PASSES_H_

#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/Pass/Pass.h"

namespace mlir {
namespace linear_solver {

#define GEN_PASS_DECL
#include "mlir/Dialect/LinearSolver/Transforms/Passes.h.inc"

//===----------------------------------------------------------------------===//
// Registration
//===----------------------------------------------------------------------===//

std::unique_ptr<OperationPass<ModuleOp>> createLinearSolverPipelineGlobalsPass();

/// Generate the code for registering passes.
#define GEN_PASS_REGISTRATION
#include "mlir/Dialect/LinearSolver/Transforms/Passes.h.inc"

} // namespace linear_solver
} // namespace mlir

#endif // MLIR_DIALECT_LINEARSOLVER_TRANSFORMS_PASSES_H_
