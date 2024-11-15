module {
  func.func @backward_substitution(%U: tensor<4x4xf32>, %b: tensor<4xf32>) -> tensor<4xf32> {
    %n = arith.constant 4 : index
    %one = arith.constant 1 : index
    %result = tensor.empty() : tensor<4xf32>

    scf.for %i = arith.subi %n, %one to %i step arith.negf %one {
      %sum = arith.constant 0.0 : f32
      scf.for %j = arith.addi %i, %one to %n step %one {
        %u_ij = tensor.extract %U[%i, %j] : tensor<4x4xf32>
        %x_j = tensor.extract %result[%j] : tensor<4xf32>
        %product = arith.mulf %u_ij, %x_j : f32
        %sum = arith.addf %sum, %product : f32
      }
      %b_i = tensor.extract %b[%i] : tensor<4xf32>
      %u_ii = tensor.extract %U[%i, %i] : tensor<4x4xf32>
      %x_i = arith.divf (arith.subf %b_i, %sum), %u_ii : f32
      %result = tensor.insert %x_i, %result[%i] : tensor<4xf32>
    }
    return %result : tensor<4xf32>
  }
}
