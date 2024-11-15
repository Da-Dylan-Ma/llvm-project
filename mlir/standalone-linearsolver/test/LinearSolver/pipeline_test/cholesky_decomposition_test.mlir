module {
  func.func @cholesky_decomposition(%A: tensor<4x4xf32>) -> tensor<4x4xf32> {
    %L = tensor.empty() : tensor<4x4xf32>
    %n = arith.constant 4 : index

    scf.for %i = arith.constant 0 to %n step arith.constant 1 {
      // Compute diagonal elements
      %a_ii = tensor.extract %A[%i, %i] : tensor<4x4xf32>
      %sum_diag = arith.constant 0.0 : f32
      scf.for %k = arith.constant 0 to %i step arith.constant 1 {
        %l_ik = tensor.extract %L[%i, %k] : tensor<4x4xf32>
        %product = arith.mulf %l_ik, %l_ik : f32
        %sum_diag = arith.addf %sum_diag, %product : f32
      }
      %l_ii = arith.sqrt (arith.subf %a_ii, %sum_diag) : f32
      %L = tensor.insert %l_ii, %L[%i, %i] : tensor<4x4xf32>

      // Compute off-diagonal elements
      scf.for %j = arith.addi %i, arith.constant 1 to %n step arith.constant 1 {
        %sum_offdiag = arith.constant 0.0 : f32
        scf.for %k = arith.constant 0 to %i step arith.constant 1 {
          %l_ik = tensor.extract %L[%i, %k] : tensor<4x4xf32>
          %l_jk = tensor.extract %L[%j, %k] : tensor<4x4xf32>
          %product = arith.mulf %l_ik, %l_jk : f32
          %sum_offdiag = arith.addf %sum_offdiag, %product : f32
        }
        %a_ij = tensor.extract %A[%i, %j] : tensor<4x4xf32>
        %l_ij = arith.divf (arith.subf %a_ij, %sum_offdiag), %l_ii : f32
        %L = tensor.insert %l_ij, %L[%j, %i] : tensor<4x4xf32>
      }
    }
    return %L : tensor<4x4xf32>
  }
}
