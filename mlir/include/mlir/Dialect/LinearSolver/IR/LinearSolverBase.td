//===- LinearSolverBase.td - Base defs for linear_solver dialect --*- tablegen -*-==//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef LINEARSOLVER_BASE
#define LINEARSOLVER_BASE

include "mlir/IR/OpBase.td"

def LinearSolver_Dialect : Dialect {
  let name = "linear_solver";
  let cppNamespace = "::mlir::linear_solver";
  let description = [{
    This dialect is under active development, and while stability is an
    eventual goal, it is not guaranteed at this juncture. Given the early state,
    it is recommended to inquire further prior to using this dialect.
  }];

  let useDefaultAttributePrinterParser = 1;
  let useDefaultTypePrinterParser = 1;
}

#endif // LINEARSOLVER_BASE
