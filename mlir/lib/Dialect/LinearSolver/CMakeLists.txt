// Pseudo for init

set(LLVM_OPTIONAL_SOURCES
    LinearSolverDialect.cpp
    LinearSolverOps.cpp
    LinearSolverTransforms.cpp
)

add_mlir_dialect(LinearSolverOps LinearSolverOps.td)
add_mlir_doc(LinearSolverDialect LinearSolverDialect Dialects/)

add_mlir_library(MLIRLinearSolver
    LinearSolverDialect.cpp
    LinearSolverOps.cpp
    LinearSolverTransforms.cpp
    LINK_LIBS PUBLIC
    MLIRIR
    MLIRTransformUtils
    MLIRSupport
)
