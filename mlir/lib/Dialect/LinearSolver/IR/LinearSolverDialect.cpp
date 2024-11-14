//===- LinearSolverDialect.cpp - LinearSolver dialect implementation ------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "mlir/Dialect/LinearSolver/IR/LinearSolver.h"
#include "mlir/IR/DialectImplementation.h"
#include "mlir/Transforms/InliningUtils.h"
#include "llvm/ADT/TypeSwitch.h"

using namespace mlir;
using namespace mlir::linear_solver;

//===----------------------------------------------------------------------===//
/// Tablegen Definitions
//===----------------------------------------------------------------------===//

#include "mlir/Dialect/LinearSolver/IR/LinearSolverOpsDialect.cpp.inc"
#define GET_ATTRDEF_CLASSES
#include "mlir/Dialect/LinearSolver/IR/LinearSolverAttributes.cpp.inc"
#define GET_TYPEDEF_CLASSES
#include "mlir/Dialect/LinearSolver/IR/LinearSolverTypes.cpp.inc"

namespace {

struct LinearSolverInlinerInterface : public DialectInlinerInterface {
  using DialectInlinerInterface::DialectInlinerInterface;

  bool isLegalToInline(Operation *, Region *, bool,
                       IRMapping &) const override {
    // We have no specific opinion on whether ops defined in this dialect should
    // be inlined.
    return true;
  }
};

struct LinearSolverOpAsmDialectInterface : public OpAsmDialectInterface {
  using OpAsmDialectInterface::OpAsmDialectInterface;

  AliasResult getAlias(Attribute attr, raw_ostream &os) const override {
    if (llvm::isa<ExternAttr>(attr)) {
      os << "extern";
      return AliasResult::OverridableAlias;
    }
    return AliasResult::NoAlias;
  }
};
} // namespace

void linear_solver::LinearSolverDialect::initialize() {
#define GET_ATTRDEF_LIST
  addAttributes<
#include "mlir/Dialect/LinearSolver/IR/LinearSolverAttributes.cpp.inc"
      >();

#define GET_TYPEDEF_LIST
  addTypes<
#include "mlir/Dialect/LinearSolver/IR/LinearSolverTypes.cpp.inc"
      >();

  addOperations<
#define GET_OP_LIST
#include "mlir/Dialect/LinearSolver/IR/LinearSolverOps.cpp.inc"
      >();

  addInterfaces<LinearSolverInlinerInterface, LinearSolverOpAsmDialectInterface>();
}
