// RUN: linearsolver-opt %s | linearsolver-opt | FileCheck %s

module {
    // CHECK-LABEL: func @bar()
    func.func @bar() {
        %0 = arith.constant 1 : i32
        // CHECK: %{{.*}} = linearsolver.foo %{{.*}} : i32
        %res = linearsolver.foo %0 : i32
        return
    }

    // CHECK-LABEL: func @linearsolver_types(%arg0: !linearsolver.custom<"10">)
    func.func @linearsolver_types(%arg0: !linearsolver.custom<"10">) {
        return
    }
}
