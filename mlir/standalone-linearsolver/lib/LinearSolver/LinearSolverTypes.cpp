//===- LinearSolverTypes.cpp - LinearSolver dialect types -----------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "LinearSolver/LinearSolverTypes.h"

#include "LinearSolver/LinearSolverDialect.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/DialectImplementation.h"
#include "llvm/ADT/TypeSwitch.h"

using namespace mlir::linearsolver;

#define GET_TYPEDEF_CLASSES
#include "LinearSolver/LinearSolverOpsTypes.cpp.inc"

void LinearSolverDialect::registerTypes() {
  addTypes<
#define GET_TYPEDEF_LIST
#include "LinearSolver/LinearSolverOpsTypes.cpp.inc"
      >();
}
