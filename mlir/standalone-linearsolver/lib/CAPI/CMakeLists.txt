add_mlir_public_c_api_library(LinearSolverCAPI
  Dialects.cpp
  LINK_LIBS PUBLIC
  MLIRLinearSolver
)
