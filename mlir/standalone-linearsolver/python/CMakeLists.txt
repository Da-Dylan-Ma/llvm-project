include(AddMLIRPython)

# Specifies that all MLIR packages are co-located under the `mlir_linearsolver`
# top level package (the API has been embedded in a relocatable way).
# TODO: Add an upstream cmake param for this vs having a global here.
add_compile_definitions("MLIR_PYTHON_PACKAGE_PREFIX=mlir_linearsolver.")


################################################################################
# Sources
################################################################################

declare_mlir_python_sources(LinearSolverPythonSources)

declare_mlir_dialect_python_bindings(
  ADD_TO_PARENT LinearSolverPythonSources
  ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/mlir_linearsolver"
  TD_FILE dialects/LinearSolverOps.td
  SOURCES
    dialects/linearsolver.py
  DIALECT_NAME linearsolver)

declare_mlir_python_extension(LinearSolverPythonSources.Extension
  MODULE_NAME _linearsolverDialects
  ADD_TO_PARENT LinearSolverPythonSources
  SOURCES
    LinearSolverExtension.cpp
  EMBED_CAPI_LINK_LIBS
    LinearSolverCAPI
)

################################################################################
# Common CAPI
################################################################################

add_mlir_python_common_capi_library(LinearSolverPythonCAPI
  INSTALL_COMPONENT LinearSolverPythonModules
  INSTALL_DESTINATION python_packages/linearsolver/mlir_linearsolver/_mlir_libs
  OUTPUT_DIRECTORY "${MLIR_BINARY_DIR}/python_packages/linearsolver/mlir_linearsolver/_mlir_libs"
  RELATIVE_INSTALL_ROOT "../../../.."
  DECLARED_SOURCES
    LinearSolverPythonSources
    # TODO: Remove this in favor of showing fine grained registration once
    # available.
    MLIRPythonExtension.RegisterEverything
    MLIRPythonSources.Core
)

################################################################################
# Instantiation of all Python modules
################################################################################

add_mlir_python_modules(LinearSolverPythonModules
  ROOT_PREFIX "${MLIR_BINARY_DIR}/python_packages/linearsolver/mlir_linearsolver"
  INSTALL_PREFIX "python_packages/linearsolver/mlir_linearsolver"
  DECLARED_SOURCES
    LinearSolverPythonSources
    # TODO: Remove this in favor of showing fine grained registration once
    # available.
    MLIRPythonExtension.RegisterEverything
    MLIRPythonSources
  COMMON_CAPI_LINK_LIBS
    LinearSolverPythonCAPI
  )
