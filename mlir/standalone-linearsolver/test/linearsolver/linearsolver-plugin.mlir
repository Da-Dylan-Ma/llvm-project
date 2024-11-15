// RUN: mlir-opt %s --load-dialect-plugin=%linearsolver_libs/LinearSolverPlugin%shlibext --pass-pipeline="builtin.module(linearsolver-switch-bar-foo)" | FileCheck %s

module {
  // CHECK-LABEL: func @foo()
  func.func @bar() {
    return
  }

  // CHECK-LABEL: func @linearsolver_types(%arg0: !linearsolver.custom<"10">)
  func.func @linearsolver_types(%arg0: !linearsolver.custom<"10">) {
    return
  }
}
