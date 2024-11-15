module {
  func.func @lu_factorization(%A: tensor<4x4xf32>) -> (tensor<4x4xf32>, tensor<4x4xf32>) {
    %L = tensor.empty() : tensor<4x4xf32>
    %U = tensor.empty() : tensor<4x4xf32>
    %zero = arith.constant 0 : index
    %n = arith.constant 4 : index

    scf.for %i = %zero to %n step %one {
      scf.for %j = %zero to %i step %one {
        %sum_u = arith.constant 0.0 : f32
        scf.for %k = %zero to %j step %one {
          %l_ik = tensor.extract %L[%i, %k] : tensor<4x4xf32>
          %u_kj = tensor.extract %U[%k, %j] : tensor<4x4xf32>
          %product = arith.mulf %l_ik, %u_kj : f32
          %sum_u = arith.addf %sum_u, %product : f32
        }
        %a_ij = tensor.extract %A[%i, %j] : tensor<4x4xf32>
        %u_ij = arith.subf %a_ij, %sum_u : f32
        %U = tensor.insert %u_ij, %U[%i, %j] : tensor<4x4xf32>
      }
      scf.for %j = %i to %n step %one {
        %sum_l = arith.constant 0.0 : f32
        scf.for %k = %zero to %i step %one {
          %l_ik = tensor.extract %L[%i, %k] : tensor<4x4xf32>
          %u_kj = tensor.extract %U[%k, %j] : tensor<4x4xf32>
          %product = arith.mulf %l_ik, %u_kj : f32
          %sum_l = arith.addf %sum_l, %product : f32
        }
        %a_ij = tensor.extract %A[%i, %j] : tensor<4x4xf32>
        %u_ii = tensor.extract %U[%i, %i] : tensor<4x4xf32>
        %l_ij = arith.divf (arith.subf %a_ij, %sum_l), %u_ii : f32
        %L = tensor.insert %l_ij, %L[%i, %j] : tensor<4x4xf32>
      }
    }
    return %L, %U : tensor<4x4xf32>, tensor<4x4xf32>
  }
}
