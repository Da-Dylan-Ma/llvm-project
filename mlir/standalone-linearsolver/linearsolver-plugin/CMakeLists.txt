add_llvm_library(LinearSolverPlugin
        # BUILDTREE_ONLY is only for testing purposes
        MODULE BUILDTREE_ONLY
        linearsolver-plugin.cpp

        DEPENDS
        MLIRLinearSolver
        PLUGIN_TOOL
        mlir-opt

        LINK_LIBS
        MLIRLinearSolver
        )
target_include_directories(
        LinearSolverPlugin
        PRIVATE
        "${LINEARSOLVER_BINARY_DIR}/include"
)
