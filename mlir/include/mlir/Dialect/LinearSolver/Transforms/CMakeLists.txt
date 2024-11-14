set(LLVM_TARGET_DEFINITIONS Passes.td)
mlir_tablegen(Passes.h.inc -gen-pass-decls -name LinearSolver)
add_public_tablegen_target(MLIRLinearSolverPassIncGen)
add_dependencies(mlir-headers MLIRLinearSolverPassIncGen)

add_mlir_doc(Passes LinearSolverPasses ./ -gen-pass-doc)
