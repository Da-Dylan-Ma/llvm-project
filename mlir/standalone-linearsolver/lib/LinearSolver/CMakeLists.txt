add_mlir_dialect_library(MLIRLinearSolver
        LinearSolverTypes.cpp
        LinearSolverDialect.cpp
        LinearSolverOps.cpp
        LinearSolverPasses.cpp

        ADDITIONAL_HEADER_DIRS
        ${PROJECT_SOURCE_DIR}/include/LinearSolver

        DEPENDS
        MLIRLinearSolverOpsIncGen
        MLIRLinearSolverPassesIncGen

        LINK_LIBS PUBLIC
        MLIRIR
        MLIRInferTypeOpInterface
        MLIRFuncDialect
        )
