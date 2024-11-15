add_mlir_dialect(LinearSolverOps linearsolver)
add_mlir_doc(LinearSolverDialect LinearSolverDialect LinearSolver/ -gen-dialect-doc)
add_mlir_doc(LinearSolverOps LinearSolverOps LinearSolver/ -gen-op-doc)

set(LLVM_TARGET_DEFINITIONS LinearSolverPasses.td)
mlir_tablegen(LinearSolverPasses.h.inc --gen-pass-decls)
add_public_tablegen_target(MLIRLinearSolverPassesIncGen)
