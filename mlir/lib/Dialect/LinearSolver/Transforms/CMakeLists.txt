add_mlir_dialect_library(MLIRLinearSolverTransforms
  BufferizableOpInterfaceImpl.cpp
  PipelineGlobalOps.cpp

  ADDITIONAL_HEADER_DIRS
  ${MLIR_MAIN_INCLUDE_DIR}/mlir/Dialect/LinearSolver/Transforms

  DEPENDS
  MLIRLinearSolverPassIncGen

  LINK_LIBS PUBLIC
  MLIRBufferizationDialect
  MLIRIR
  MLIRLinearSolverDialect
  MLIRPass
)
