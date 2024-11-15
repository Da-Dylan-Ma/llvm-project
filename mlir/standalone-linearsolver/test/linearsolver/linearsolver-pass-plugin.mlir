// RUN: mlir-opt %s --load-pass-plugin=%linearsolver_libs/LinearSolverPlugin%shlibext --pass-pipeline="builtin.module(linearsolver-switch-bar-foo)" | FileCheck %s

module {
  // CHECK-LABEL: func @foo()
  func.func @bar() {
    return
  }

  // CHECK-LABEL: func @abar()
  func.func @abar() {
    return
  }
}
