//===- MLProgram.cpp - C Interface for MLProgram dialect ------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "mlir/Dialect/LinearSolver/IR/LinearSolver.h"
#include "mlir-c/Dialect/LinearSolver.h"
#include "mlir/CAPI/Registration.h"

MLIR_DEFINE_CAPI_DIALECT_REGISTRATION(LinearSolver, linear_solver,
                                      mlir::linear_solver::LinearSolverDialect)
