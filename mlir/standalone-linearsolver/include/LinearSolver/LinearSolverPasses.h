//===- LinearSolverPasses.h - LinearSolver passes  ------------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
#ifndef LINEARSOLVER_LINEARSOLVERPASSES_H
#define LINEARSOLVER_LINEARSOLVERPASSES_H

#include "LinearSolver/LinearSolverDialect.h"
#include "LinearSolver/LinearSolverOps.h"
#include "mlir/Pass/Pass.h"
#include <memory>

namespace mlir {
namespace linearsolver {
#define GEN_PASS_DECL
#include "LinearSolver/LinearSolverPasses.h.inc"

#define GEN_PASS_REGISTRATION
#include "LinearSolver/LinearSolverPasses.h.inc"
} // namespace linearsolver
} // namespace mlir

#endif
