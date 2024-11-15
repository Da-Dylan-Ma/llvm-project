//===- LinearSolverDialect.td - LinearSolver dialect -----------*- tablegen -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef LINEARSOLVER_DIALECT
#define LINEARSOLVER_DIALECT

include "mlir/IR/OpBase.td"

//===----------------------------------------------------------------------===//
// LinearSolver dialect definition.
//===----------------------------------------------------------------------===//

def LinearSolver_Dialect : Dialect {
    let name = "linearsolver";
    let summary = "A linearsolver out-of-tree MLIR dialect.";
    let description = [{
        This dialect is an example of an out-of-tree MLIR dialect designed to
        illustrate the basic setup required to develop MLIR-based tools without
        working inside of the LLVM source tree.
    }];
    let cppNamespace = "::mlir::linearsolver";

    let useDefaultTypePrinterParser = 1;
    let extraClassDeclaration = [{
        void registerTypes();
    }];
}

//===----------------------------------------------------------------------===//
// Base linearsolver operation definition.
//===----------------------------------------------------------------------===//

class LinearSolver_Op<string mnemonic, list<Trait> traits = []> :
        Op<LinearSolver_Dialect, mnemonic, traits>;

#endif // LINEARSOLVER_DIALECT
