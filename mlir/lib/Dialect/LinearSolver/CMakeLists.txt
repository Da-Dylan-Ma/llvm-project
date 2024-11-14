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

# Ensure absolute paths are used for tblgen
set(MLIR_TABLEGEN_EXTRA_ARGS
    "-I${CMAKE_SOURCE_DIR}/mlir/include"
    "-I${CMAKE_SOURCE_DIR}/llvm/include"
    "-I${CMAKE_BINARY_DIR}/include"
    "-I${CMAKE_BINARY_DIR}/tools/mlir/include"
    "-I${CMAKE_SOURCE_DIR}/mlir/include/mlir/IR"
)
