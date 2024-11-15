module {
  func.func @forward_substitution(%A: tensor<4x4xf32>, %b: tensor<4xf32>) -> tensor<4xf32> {
    %zero = arith.constant 0 : index
    %n = arith.constant 4 : index
    %result = tensor.empty() : tensor<4xf32>

    scf.for %i = %zero to %n step %one {
      %sum = arith.constant 0.0 : f32
      scf.for %j = %zero to %i step %one {
        %a_ij = tensor.extract %A[%i, %j] : tensor<4x4xf32>
        %x_j = tensor.extract %result[%j] : tensor<4xf32>
        %product = arith.mulf %a_ij, %x_j : f32
        %sum = arith.addf %sum, %product : f32
      }
      %b_i = tensor.extract %b[%i] : tensor<4xf32>
      %a_ii = tensor.extract %A[%i, %i] : tensor<4x4xf32>
      %x_i = arith.divf %b_i, %a_ii : f32
      %result = tensor.insert %x_i, %result[%i] : tensor<4xf32>
    }
    return %result : tensor<4xf32>
  }
}
