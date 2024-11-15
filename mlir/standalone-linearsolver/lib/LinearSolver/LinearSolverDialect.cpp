//===- LinearSolverDialect.cpp - LinearSolver dialect ---------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "LinearSolver/LinearSolverDialect.h"
#include "LinearSolver/LinearSolverOps.h"
#include "LinearSolver/LinearSolverTypes.h"

using namespace mlir;
using namespace mlir::linearsolver;

#include "LinearSolver/LinearSolverOpsDialect.cpp.inc"

//===----------------------------------------------------------------------===//
// LinearSolver dialect.
//===----------------------------------------------------------------------===//

void LinearSolverDialect::initialize() {
  addOperations<
#define GET_OP_LIST
#include "LinearSolver/LinearSolverOps.cpp.inc"
      >();
  registerTypes();
}
