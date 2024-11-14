//===- LinearSolverTypes.td - Type definitions ----------------*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef LINEARSOLVER_TYPES
#define LINEARSOLVER_TYPES

include "mlir/IR/AttrTypeBase.td"
include "mlir/Dialect/LinearSolver/IR/LinearSolverBase.td"

class LinearSolver_Type<string name, list<Trait> traits = [],
                     string baseCppClass = "::mlir::Type">
    : TypeDef<LinearSolver_Dialect, name, traits, baseCppClass> {}

def LinearSolver_TokenType : LinearSolver_Type<"Token"> {
  let summary = "Token for establishing execution ordering in a graph";
  let mnemonic = "token";
}

#endif // LINEARSOLVER_TYPES
