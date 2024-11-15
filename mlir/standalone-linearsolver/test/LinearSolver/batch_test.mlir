// RUN: linearsolver-opt %s | FileCheck %s

module {
    // CHECK-LABEL: func @test_triangular_solve()
    func.func @test_triangular_solve() {
        %matrix = arith.constant 1 : i32
        %vector = arith.constant 2 : i32
        // CHECK: %{{.*}} = linearsolver.triangular_solve %{{.*}}, %{{.*}} : (i32, i32) -> i32
        %res = linearsolver.triangular_solve %matrix, %vector : (i32, i32) -> i32
        return
    }

    // CHECK-LABEL: func @test_lu_factorize()
    func.func @test_lu_factorize() {
        %matrix = arith.constant 3 : i32
        // CHECK: %{{.*}} = linearsolver.lu_factorize %{{.*}} : i32
        %res = linearsolver.lu_factorize %matrix : i32
        return
    }

    // CHECK-LABEL: func @test_ilu_factorize()
    func.func @test_ilu_factorize() {
        %matrix = arith.constant 4 : i32
        // CHECK: %{{.*}} = linearsolver.ilu_factorize %{{.*}} : i32
        %res = linearsolver.ilu_factorize %matrix : i32
        return
    }

    // CHECK-LABEL: func @test_cholesky_decompose()
    func.func @test_cholesky_decompose() {
        %matrix = arith.constant 5 : i32
        // CHECK: %{{.*}} = linearsolver.cholesky_decompose %{{.*}} : i32
        %res = linearsolver.cholesky_decompose %matrix : i32
        return
    }

    // CHECK-LABEL: func @linearsolver_custom_types(%arg0: !linearsolver.custom<"10">)
    func.func @linearsolver_custom_types(%arg0: !linearsolver.custom<"10">) {
        return
    }
}
