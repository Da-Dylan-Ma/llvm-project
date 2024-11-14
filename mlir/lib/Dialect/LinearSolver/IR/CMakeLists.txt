add_mlir_dialect_library(MLIRLinearSolverDialect
  LinearSolverOps.cpp
  LinearSolverDialect.cpp

  ADDITIONAL_HEADER_DIRS
  ${MLIR_MAIN_INCLUDE_DIR}/mlir/Dialect/LinearSolver

  DEPENDS
  MLIRLinearSolverOpsIncGen
  MLIRLinearSolverAttributesIncGen
  MLIRLinearSolverTypesIncGen

  LINK_LIBS PUBLIC
  MLIRDialect
  MLIRControlFlowInterfaces
  MLIRFunctionInterfaces
  MLIRInferTypeOpInterface
  MLIRTransforms
  MLIRIR
  )
