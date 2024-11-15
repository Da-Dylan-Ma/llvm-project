llvm_canonicalize_cmake_booleans(
        MLIR_ENABLE_BINDINGS_PYTHON
)

configure_lit_site_cfg(
        ${CMAKE_CURRENT_SOURCE_DIR}/lit.site.cfg.py.in
        ${CMAKE_CURRENT_BINARY_DIR}/lit.site.cfg.py
        MAIN_CONFIG
        ${CMAKE_CURRENT_SOURCE_DIR}/lit.cfg.py
)

set(LINEARSOLVER_TEST_DEPENDS
        FileCheck count not
        linearsolver-capi-test
        linearsolver-opt
        linearsolver-translate
        LinearSolverPlugin
        )
if(MLIR_ENABLE_BINDINGS_PYTHON)
  list(APPEND LINEARSOLVER_TEST_DEPENDS LinearSolverPythonModules)
endif()

add_lit_testsuite(check-linearsolver "Running the linearsolver regression tests"
        ${CMAKE_CURRENT_BINARY_DIR}
        DEPENDS ${LINEARSOLVER_TEST_DEPENDS}
        )
set_target_properties(check-linearsolver PROPERTIES FOLDER "Tests")

# add_lit_testsuites(STANDALONE ${CMAKE_CURRENT_SOURCE_DIR} DEPENDS ${LINEARSOLVER_TEST_DEPENDS})

add_subdirectory(CAPI)
