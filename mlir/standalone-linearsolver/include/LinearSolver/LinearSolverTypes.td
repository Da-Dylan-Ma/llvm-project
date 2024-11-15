//===- LinearSolverTypes.td - LinearSolver dialect types -------*- tablegen -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef LINEARSOLVER_TYPES
#define LINEARSOLVER_TYPES

include "mlir/IR/AttrTypeBase.td"
include "LinearSolver/LinearSolverDialect.td"

//===----------------------------------------------------------------------===//
// LinearSolver type definitions
//===----------------------------------------------------------------------===//

class LinearSolver_Type<string name, string typeMnemonic, list<Trait> traits = []>
    : TypeDef<LinearSolver_Dialect, name, traits> {
  let mnemonic = typeMnemonic;
}

def LinearSolver_CustomType : LinearSolver_Type<"Custom", "custom"> {
    let summary = "LinearSolver custom type";
    let description = "Custom type in linearsolver dialect";
    let parameters = (ins StringRefParameter<"the custom value">:$value);
    let assemblyFormat = "`<` $value `>`";
}

#endif // LINEARSOLVER_TYPES
