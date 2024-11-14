//===-- Passes.td - pass definition file -------------------*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef MLIR_DIALECT_LINEARSOLVER_TRANSFORMS_PASSES
#define MLIR_DIALECT_LINEARSOLVER_TRANSFORMS_PASSES

include "mlir/Pass/PassBase.td"

def LinearSolverPipelineGlobals : Pass<"linearsolver-pipeline-globals", "ModuleOp"> {
  let summary = "Optimize `linear_solver` global operations for read and store";
  let description = [{
    `linear_solver`'s load and store operations can be optimized for
    write-write or write-read sets of operations. This allows known
    tensors to not be re-read when the value is already known in IR.

    The pass is designed to handle both nested regions and function calls
    safely.
  }];
  let constructor = "mlir::linear_solver::createLinearSolverPipelineGlobalsPass()";
}

#endif // MLIR_DIALECT_LINEARSOLVER_TRANSFORMS_PASSES
