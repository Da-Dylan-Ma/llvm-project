//===- LinearSolverOps.td - LinearSolver operations definition -*- tablegen -*-===//
//
//===----------------------------------------------------------------------===//
//
// This file defines the LinearSolver dialect operations, including triangular
// solve, LU factorization, ILU factorization, and Cholesky decomposition.
//
//===----------------------------------------------------------------------===//

include "mlir/IR/OpBase.td"
include "mlir/Interfaces/SideEffectInterfaces.td"
include "mlir/Dialect/LinearSolver/LinearSolverDialect.td"

//===----------------------------------------------------------------------===//
// Triangular Solve Operation
//===----------------------------------------------------------------------===//

def TriangularSolveOp : Op<"triangular_solve", [Pure]> {
  let summary = "Performs a triangular solve";
  let description = [{
    Solves a triangular system of linear equations.
    The input is a triangular matrix and a right-hand side vector,
    and the result is the solution vector.
  }];

  let arguments = (ins
    F32Tensor:$matrix,      // Triangular matrix
    F32Tensor:$rhs          // Right-hand side vector
  );

  let results = (outs
    F32Tensor:$solution     // Solution vector
  );
}

//===----------------------------------------------------------------------===//
// LU Factorization Operation
//===----------------------------------------------------------------------===//

def LUFactorizeOp : LinearSolver_Op<"lu_factorize", [Pure]> {
  let summary = "Performs LU factorization of a matrix";
  let description = [{
    Computes the LU factorization of the input matrix. The result is
    an output matrix containing the LU factors.
  }];

  let arguments = (ins
    F32Tensor:$matrix       // Input matrix
  );

  let results = (outs
    F32Tensor:$lu           // LU factorized matrix
  );
}

//===----------------------------------------------------------------------===//
// ILU Factorization Operation
//===----------------------------------------------------------------------===//

def ILUFactorizeOp : LinearSolver_Op<"ilu_factorize", [Pure]> {
  let summary = "Performs incomplete LU factorization of a matrix";
  let description = [{
    Computes the incomplete LU (ILU) factorization of the input matrix. The
    result is an output matrix containing the ILU factors.
  }];

  let arguments = (ins
    F32Tensor:$matrix       // Input matrix
  );

  let results = (outs
    F32Tensor:$ilu          // ILU factorized matrix
  );
}

//===----------------------------------------------------------------------===//
// Cholesky Decomposition Operation
//===----------------------------------------------------------------------===//

def CholeskyDecomposeOp : LinearSolver_Op<"cholesky_decompose", [Pure]> {
  let summary = "Performs Cholesky decomposition of a symmetric matrix";
  let description = [{
    Computes the Cholesky decomposition of the input symmetric matrix.
    The result is a lower triangular matrix L such that A = L * L^T.
  }];

  let arguments = (ins
    F32Tensor:$matrix       // Symmetric positive-definite matrix
  );

  let results = (outs
    F32Tensor:$cholesky     // Lower triangular matrix from decomposition
  );
}
